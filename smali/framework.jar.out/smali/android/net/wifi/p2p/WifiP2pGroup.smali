.class public Landroid/net/wifi/p2p/WifiP2pGroup;
.super Ljava/lang/Object;
.source "WifiP2pGroup.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Landroid/net/wifi/p2p/WifiP2pGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final PERSISTENT_NET_ID:I = -0x2

.field private static final TAG:Ljava/lang/String; = "WifiP2pGroup"

.field public static final TEMPORARY_NET_ID:I = -0x1

.field private static final groupStartedPattern:Ljava/util/regex/Pattern;

.field private static final groupStartedPattern2:Ljava/util/regex/Pattern;


# instance fields
.field private mClients:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/net/wifi/p2p/WifiP2pDevice;",
            ">;"
        }
    .end annotation
.end field

.field private mInterface:Ljava/lang/String;

.field private mIsGroupOwner:Z

.field private mNetId:I

.field private mNetworkName:Ljava/lang/String;

.field private mOwner:Landroid/net/wifi/p2p/WifiP2pDevice;

.field private mPassphrase:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const-string v0, "ssid=\"(.+)\" freq=(\\d+) (?:psk=)?([0-9a-fA-F]{64})?(?:passphrase=)?(?:\"(.{0,63})\")? go_dev_addr=((?:[0-9a-f]{2}:){5}[0-9a-f]{2}) ?(\\[PERSISTENT\\])?"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Landroid/net/wifi/p2p/WifiP2pGroup;->groupStartedPattern:Ljava/util/regex/Pattern;

    const-string v0, "go_dev_addr=((?:[0-9a-f]{2}:){5}[0-9a-f]{2}) ?(\\[PERSISTENT\\])?"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Landroid/net/wifi/p2p/WifiP2pGroup;->groupStartedPattern2:Ljava/util/regex/Pattern;

    new-instance v0, Landroid/net/wifi/p2p/WifiP2pGroup$1;

    invoke-direct {v0}, Landroid/net/wifi/p2p/WifiP2pGroup$1;-><init>()V

    sput-object v0, Landroid/net/wifi/p2p/WifiP2pGroup;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mClients:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Landroid/net/wifi/p2p/WifiP2pGroup;)V
    .locals 4
    .parameter "source"

    .prologue
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mClients:Ljava/util/List;

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Landroid/net/wifi/p2p/WifiP2pGroup;->getNetworkName()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mNetworkName:Ljava/lang/String;

    new-instance v2, Landroid/net/wifi/p2p/WifiP2pDevice;

    invoke-virtual {p1}, Landroid/net/wifi/p2p/WifiP2pGroup;->getOwner()Landroid/net/wifi/p2p/WifiP2pDevice;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/net/wifi/p2p/WifiP2pDevice;-><init>(Landroid/net/wifi/p2p/WifiP2pDevice;)V

    iput-object v2, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mOwner:Landroid/net/wifi/p2p/WifiP2pDevice;

    iget-boolean v2, p1, Landroid/net/wifi/p2p/WifiP2pGroup;->mIsGroupOwner:Z

    iput-boolean v2, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mIsGroupOwner:Z

    invoke-virtual {p1}, Landroid/net/wifi/p2p/WifiP2pGroup;->getClientList()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/p2p/WifiP2pDevice;

    .local v0, d:Landroid/net/wifi/p2p/WifiP2pDevice;
    iget-object v2, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mClients:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .end local v0           #d:Landroid/net/wifi/p2p/WifiP2pDevice;
    :cond_0
    invoke-virtual {p1}, Landroid/net/wifi/p2p/WifiP2pGroup;->getPassphrase()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mPassphrase:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/net/wifi/p2p/WifiP2pGroup;->getInterface()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mInterface:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/net/wifi/p2p/WifiP2pGroup;->getNetworkId()I

    move-result v2

    iput v2, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mNetId:I

    .end local v1           #i$:Ljava/util/Iterator;
    :cond_1
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 12
    .parameter "supplicantEvent"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    iput-object v10, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mClients:Ljava/util/List;

    const-string v10, " "

    invoke-virtual {p1, v10}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v9

    .local v9, tokens:[Ljava/lang/String;
    array-length v10, v9

    const/4 v11, 0x3

    if-ge v10, v11, :cond_0

    new-instance v10, Ljava/lang/IllegalArgumentException;

    const-string v11, "Malformed supplicant event"

    invoke-direct {v10, v11}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v10

    :cond_0
    const/4 v10, 0x0

    aget-object v10, v9, v10

    const-string v11, "P2P-GROUP"

    invoke-virtual {v10, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_6

    const/4 v10, 0x1

    aget-object v10, v9, v10

    iput-object v10, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mInterface:Ljava/lang/String;

    const/4 v10, 0x2

    aget-object v10, v9, v10

    const-string v11, "GO"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    iput-boolean v10, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mIsGroupOwner:Z

    sget-object v10, Landroid/net/wifi/p2p/WifiP2pGroup;->groupStartedPattern:Ljava/util/regex/Pattern;

    invoke-virtual {v10, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v4

    .local v4, match:Ljava/util/regex/Matcher;
    sget-object v10, Landroid/net/wifi/p2p/WifiP2pGroup;->groupStartedPattern2:Ljava/util/regex/Pattern;

    invoke-virtual {v10, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v5

    .local v5, match2:Ljava/util/regex/Matcher;
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->find()Z

    move-result v10

    if-eqz v10, :cond_3

    const/4 v10, 0x1

    invoke-virtual {v4, v10}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v10

    iput-object v10, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mNetworkName:Ljava/lang/String;

    const/4 v10, 0x4

    invoke-virtual {v4, v10}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v10

    iput-object v10, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mPassphrase:Ljava/lang/String;

    new-instance v10, Landroid/net/wifi/p2p/WifiP2pDevice;

    const/4 v11, 0x5

    invoke-virtual {v4, v11}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Landroid/net/wifi/p2p/WifiP2pDevice;-><init>(Ljava/lang/String;)V

    iput-object v10, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mOwner:Landroid/net/wifi/p2p/WifiP2pDevice;

    const/4 v10, 0x6

    invoke-virtual {v4, v10}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v10

    if-eqz v10, :cond_2

    const/4 v10, -0x2

    iput v10, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mNetId:I

    :goto_0
    const-string v10, "WifiP2pGroup"

    const-string v11, "Normal match!"

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .end local v4           #match:Ljava/util/regex/Matcher;
    .end local v5           #match2:Ljava/util/regex/Matcher;
    :cond_1
    :goto_1
    return-void

    .restart local v4       #match:Ljava/util/regex/Matcher;
    .restart local v5       #match2:Ljava/util/regex/Matcher;
    :cond_2
    const/4 v10, -0x1

    iput v10, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mNetId:I

    goto :goto_0

    :cond_3
    invoke-virtual {v5}, Ljava/util/regex/Matcher;->find()Z

    move-result v10

    if-eqz v10, :cond_5

    const-string v10, ""

    iput-object v10, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mNetworkName:Ljava/lang/String;

    const-string v10, ""

    iput-object v10, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mPassphrase:Ljava/lang/String;

    new-instance v10, Landroid/net/wifi/p2p/WifiP2pDevice;

    const/4 v11, 0x1

    invoke-virtual {v5, v11}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Landroid/net/wifi/p2p/WifiP2pDevice;-><init>(Ljava/lang/String;)V

    iput-object v10, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mOwner:Landroid/net/wifi/p2p/WifiP2pDevice;

    const/4 v10, 0x2

    invoke-virtual {v5, v10}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v10

    if-eqz v10, :cond_4

    const/4 v10, -0x2

    iput v10, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mNetId:I

    :goto_2
    const-string v10, "WifiP2pGroup"

    const-string v11, "Not matched SSID, but matched device address!"

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :cond_4
    const/4 v10, -0x1

    iput v10, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mNetId:I

    goto :goto_2

    :cond_5
    const-string v10, ""

    iput-object v10, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mNetworkName:Ljava/lang/String;

    const-string v10, ""

    iput-object v10, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mPassphrase:Ljava/lang/String;

    new-instance v10, Landroid/net/wifi/p2p/WifiP2pDevice;

    invoke-direct {v10}, Landroid/net/wifi/p2p/WifiP2pDevice;-><init>()V

    iput-object v10, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mOwner:Landroid/net/wifi/p2p/WifiP2pDevice;

    const/4 v10, -0x1

    iput v10, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mNetId:I

    const-string v10, "WifiP2pGroup"

    const-string v11, "Match nothing!"

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .end local v4           #match:Ljava/util/regex/Matcher;
    .end local v5           #match2:Ljava/util/regex/Matcher;
    :cond_6
    const/4 v10, 0x0

    aget-object v10, v9, v10

    const-string v11, "P2P-INVITATION-RECEIVED"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_b

    const/4 v7, 0x0

    .local v7, sa:Ljava/lang/String;
    const/4 v10, -0x2

    iput v10, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mNetId:I

    move-object v0, v9

    .local v0, arr$:[Ljava/lang/String;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_3
    if-ge v2, v3, :cond_1

    aget-object v8, v0, v2

    .local v8, token:Ljava/lang/String;
    const-string v10, "="

    invoke-virtual {v8, v10}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    .local v6, nameValue:[Ljava/lang/String;
    array-length v10, v6

    const/4 v11, 0x2

    if-eq v10, v11, :cond_8

    :cond_7
    :goto_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    :cond_8
    const/4 v10, 0x0

    aget-object v10, v6, v10

    const-string v11, "sa"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_9

    const/4 v10, 0x1

    aget-object v7, v6, v10

    new-instance v1, Landroid/net/wifi/p2p/WifiP2pDevice;

    invoke-direct {v1}, Landroid/net/wifi/p2p/WifiP2pDevice;-><init>()V

    .local v1, dev:Landroid/net/wifi/p2p/WifiP2pDevice;
    const/4 v10, 0x1

    aget-object v10, v6, v10

    iput-object v10, v1, Landroid/net/wifi/p2p/WifiP2pDevice;->deviceAddress:Ljava/lang/String;

    iget-object v10, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mClients:Ljava/util/List;

    invoke-interface {v10, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .end local v1           #dev:Landroid/net/wifi/p2p/WifiP2pDevice;
    :cond_9
    const/4 v10, 0x0

    aget-object v10, v6, v10

    const-string v11, "go_dev_addr"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_a

    new-instance v10, Landroid/net/wifi/p2p/WifiP2pDevice;

    const/4 v11, 0x1

    aget-object v11, v6, v11

    invoke-direct {v10, v11}, Landroid/net/wifi/p2p/WifiP2pDevice;-><init>(Ljava/lang/String;)V

    iput-object v10, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mOwner:Landroid/net/wifi/p2p/WifiP2pDevice;

    goto :goto_4

    :cond_a
    const/4 v10, 0x0

    aget-object v10, v6, v10

    const-string v11, "persistent"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_7

    new-instance v10, Landroid/net/wifi/p2p/WifiP2pDevice;

    invoke-direct {v10, v7}, Landroid/net/wifi/p2p/WifiP2pDevice;-><init>(Ljava/lang/String;)V

    iput-object v10, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mOwner:Landroid/net/wifi/p2p/WifiP2pDevice;

    const/4 v10, 0x1

    aget-object v10, v6, v10

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    iput v10, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mNetId:I

    goto :goto_4

    .end local v0           #arr$:[Ljava/lang/String;
    .end local v2           #i$:I
    .end local v3           #len$:I
    .end local v6           #nameValue:[Ljava/lang/String;
    .end local v7           #sa:Ljava/lang/String;
    .end local v8           #token:Ljava/lang/String;
    :cond_b
    new-instance v10, Ljava/lang/IllegalArgumentException;

    const-string v11, "Malformed supplicant event"

    invoke-direct {v10, v11}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v10
.end method


# virtual methods
.method public addClient(Landroid/net/wifi/p2p/WifiP2pDevice;)V
    .locals 3
    .parameter "device"

    .prologue
    iget-object v2, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mClients:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/p2p/WifiP2pDevice;

    .local v0, client:Landroid/net/wifi/p2p/WifiP2pDevice;
    invoke-virtual {v0, p1}, Landroid/net/wifi/p2p/WifiP2pDevice;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .end local v0           #client:Landroid/net/wifi/p2p/WifiP2pDevice;
    :goto_0
    return-void

    :cond_1
    iget-object v2, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mClients:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public addClient(Ljava/lang/String;)V
    .locals 1
    .parameter "address"

    .prologue
    new-instance v0, Landroid/net/wifi/p2p/WifiP2pDevice;

    invoke-direct {v0, p1}, Landroid/net/wifi/p2p/WifiP2pDevice;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Landroid/net/wifi/p2p/WifiP2pGroup;->addClient(Landroid/net/wifi/p2p/WifiP2pDevice;)V

    return-void
.end method

.method public contains(Landroid/net/wifi/p2p/WifiP2pDevice;)Z
    .locals 1
    .parameter "device"

    .prologue
    iget-object v0, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mOwner:Landroid/net/wifi/p2p/WifiP2pDevice;

    invoke-virtual {v0, p1}, Landroid/net/wifi/p2p/WifiP2pDevice;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mClients:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public describeContents()I
    .locals 1

    .prologue
    const/4 v0, 0x0

    return v0
.end method

.method public getClientList()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Landroid/net/wifi/p2p/WifiP2pDevice;",
            ">;"
        }
    .end annotation

    .prologue
    iget-object v0, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mClients:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public getInterface()Ljava/lang/String;
    .locals 1

    .prologue
    iget-object v0, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mInterface:Ljava/lang/String;

    return-object v0
.end method

.method public getNetworkId()I
    .locals 1

    .prologue
    iget v0, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mNetId:I

    return v0
.end method

.method public getNetworkName()Ljava/lang/String;
    .locals 1

    .prologue
    iget-object v0, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mNetworkName:Ljava/lang/String;

    return-object v0
.end method

.method public getOwner()Landroid/net/wifi/p2p/WifiP2pDevice;
    .locals 1

    .prologue
    iget-object v0, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mOwner:Landroid/net/wifi/p2p/WifiP2pDevice;

    return-object v0
.end method

.method public getPassphrase()Ljava/lang/String;
    .locals 1

    .prologue
    iget-object v0, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mPassphrase:Ljava/lang/String;

    return-object v0
.end method

.method public isClientListEmpty()Z
    .locals 1

    .prologue
    iget-object v0, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mClients:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isGroupOwner()Z
    .locals 1

    .prologue
    iget-boolean v0, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mIsGroupOwner:Z

    return v0
.end method

.method public removeClient(Landroid/net/wifi/p2p/WifiP2pDevice;)Z
    .locals 1
    .parameter "device"

    .prologue
    iget-object v0, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mClients:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public removeClient(Ljava/lang/String;)Z
    .locals 2
    .parameter "address"

    .prologue
    iget-object v0, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mClients:Ljava/util/List;

    new-instance v1, Landroid/net/wifi/p2p/WifiP2pDevice;

    invoke-direct {v1, p1}, Landroid/net/wifi/p2p/WifiP2pDevice;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public setInterface(Ljava/lang/String;)V
    .locals 0
    .parameter "intf"

    .prologue
    iput-object p1, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mInterface:Ljava/lang/String;

    return-void
.end method

.method public setIsGroupOwner(Z)V
    .locals 0
    .parameter "isGo"

    .prologue
    iput-boolean p1, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mIsGroupOwner:Z

    return-void
.end method

.method public setNetworkId(I)V
    .locals 0
    .parameter "netId"

    .prologue
    iput p1, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mNetId:I

    return-void
.end method

.method public setNetworkName(Ljava/lang/String;)V
    .locals 0
    .parameter "networkName"

    .prologue
    iput-object p1, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mNetworkName:Ljava/lang/String;

    return-void
.end method

.method public setOwner(Landroid/net/wifi/p2p/WifiP2pDevice;)V
    .locals 0
    .parameter "device"

    .prologue
    iput-object p1, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mOwner:Landroid/net/wifi/p2p/WifiP2pDevice;

    return-void
.end method

.method public setPassphrase(Ljava/lang/String;)V
    .locals 0
    .parameter "passphrase"

    .prologue
    iput-object p1, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mPassphrase:Ljava/lang/String;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .prologue
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .local v2, sbuf:Ljava/lang/StringBuffer;
    const-string v3, "network: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mNetworkName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v3, "\n isGO: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-boolean v4, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mIsGroupOwner:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    const-string v3, "\n GO: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mOwner:Landroid/net/wifi/p2p/WifiP2pDevice;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    iget-object v3, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mClients:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/p2p/WifiP2pDevice;

    .local v0, client:Landroid/net/wifi/p2p/WifiP2pDevice;
    const-string v3, "\n Client: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    goto :goto_0

    .end local v0           #client:Landroid/net/wifi/p2p/WifiP2pDevice;
    :cond_0
    const-string v3, "\n interface: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mInterface:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v3, "\n networkId: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget v4, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mNetId:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 3
    .parameter "dest"
    .parameter "flags"

    .prologue
    iget-object v2, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mNetworkName:Ljava/lang/String;

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object v2, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mOwner:Landroid/net/wifi/p2p/WifiP2pDevice;

    invoke-virtual {p1, v2, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    iget-boolean v2, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mIsGroupOwner:Z

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    :goto_0
    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeByte(B)V

    iget-object v2, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mClients:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeInt(I)V

    iget-object v2, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mClients:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/p2p/WifiP2pDevice;

    .local v0, client:Landroid/net/wifi/p2p/WifiP2pDevice;
    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    goto :goto_1

    .end local v0           #client:Landroid/net/wifi/p2p/WifiP2pDevice;
    .end local v1           #i$:Ljava/util/Iterator;
    :cond_0
    const/4 v2, 0x0

    goto :goto_0

    .restart local v1       #i$:Ljava/util/Iterator;
    :cond_1
    iget-object v2, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mPassphrase:Ljava/lang/String;

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object v2, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mInterface:Ljava/lang/String;

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget v2, p0, Landroid/net/wifi/p2p/WifiP2pGroup;->mNetId:I

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
