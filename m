Return-Path: <matt.hoosier@gmail.com>
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 40A15605E3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Feb 2020 22:04:52 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id f70so3267885ill.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Feb 2020 14:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7DiqKd4aibg+7Qh9zsgCPD2cr1H+FvUOV22Li7SvLXg=;
	b=bHseU+mAH3GYY0CSCqeVqfv+3TwBX1sWttaiJ+rTYlvi3ZvfIvGOsG+6LBtLMQx6xI
	4gPCT1NFm4Azgh11kiRpQAIaobySom3cqpxqV5wVu9a5fLhsBuhGCvoboUPzXL9q83cU
	FvDFMze937QRrQIFRnE6tdVP2Z2P9NxSVSS8PacNtFB1ls8/7eXyZnlFkXrecJAGlkXN
	/biNigVAoAYkHYPxMSyIxRjvyPBZiywEqPy2Ts+v80PhtDIaOymXuGAUsfjvCY2YPROo
	nuFspEvHiLP+VGS1sUr2IwhtOU04W6tTaTRui1N+NDMT0u/F/Fz4LZPt6ZN7F65FPKoL
	ibaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=7DiqKd4aibg+7Qh9zsgCPD2cr1H+FvUOV22Li7SvLXg=;
	b=bwNe7M29vaB3elSLFoUf5hseD8q2ZK0PREdPrJAFleESTsKLZYxVI86PB923kA1rrY
	HI8YKK0+VYAvBPfzM6yY1zs3aHPVyH4/cPt/U0gIZYosub6mN16cg6Npb8V+AmGwVgR3
	2D8tY0ins9N0L499M38eg+tQIj4gEwFJP5tn8b/IDsf9eXCW65FTOsr+p12VUAI3H14x
	/nIMma2kgvQaxNzZEy3FGvtajqE315FLqNAkXZBPxiv1upSTGO74QRNwGvSgIVmtf8ld
	jwmp12G7LkqJzIIAC+q9I+MUadsejHG79mYHB3UZxInE1na5U2ZCPGgYNTbTjw9zI3lU
	/1LA==
X-Gm-Message-State: APjAAAWbDlaVV6dpaqN9+sowM1lryXVkMyJlLnQNUhs2L+fOStHf/NgD
	D7VtHDNyIgDEeZMc1XgsFsg72KPJ
X-Google-Smtp-Source: APXvYqxzvU44+z41hLt8vSzInT59J+onZUW6XqiAptQ+Atpy15nRADmtfleaG6f7c+2k/3ZpsC5RYw==
X-Received: by 2002:a92:8307:: with SMTP id f7mr306118ild.183.1580940292303;
	Wed, 05 Feb 2020 14:04:52 -0800 (PST)
Received: from localhost.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id l2sm328223ilo.6.2020.02.05.14.04.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 05 Feb 2020 14:04:51 -0800 (PST)
Sender: Matt Hoosier <matt.hoosier@gmail.com>
From: Matt Hoosier <matt.hoosier@garmin.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Feb 2020 16:04:49 -0600
Message-Id: <20200205220449.4719-1-matt.hoosier@garmin.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: Matt Hoosier <matt.hoosier@garmin.com>
Subject: [meta-networking][PATCH] mdns: improve numerous aspects of Posix backend
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Feb 2020 22:04:53 -0000
Content-Transfer-Encoding: 8bit

Apple's default implementation of the Posix backend for mDNSResponder
has a number of weaknesses. Address several of them, most notably:

* Improve interface tracking, preventing confusion to mdns's state
  machine. Prevents spurious removal/republication cycles whenever
  network interfaces are added or removed.

* Support network interfaces whose indeces are great than 31. Indices
  grow past that range surprisingly quickly, especially with multi-
  homed, mobile, wifi, Bluetooth, VPN, VLANs, or other interfaces
  present.

* Correctly handle edge cases during removal of a network interface.

The fixes are kept as a patch series for clarity.

Signed-off-by: Matt Hoosier <matt.hoosier@garmin.com>
---
 ...utine-for-cleaning-recent-interfaces.patch |  60 +++++
 ...outine-for-tearing-down-an-interface.patch |  58 +++++
 .../0003-Track-interface-socket-family.patch  |  50 +++++
 ...0004-Use-list-for-changed-interfaces.patch | 177 +++++++++++++++
 .../0005-Handle-noisy-netlink-sockets.patch   | 212 ++++++++++++++++++
 .../files/0006-Remove-unneeded-function.patch |  51 +++++
 ...cate-loopback-interface-to-mDNS-core.patch | 129 +++++++++++
 ...-deleted-interfaces-as-being-changed.patch |  39 ++++
 .../0009-Fix-possible-NULL-dereference.patch  |  45 ++++
 ...0010-Handle-errors-from-socket-calls.patch |  62 +++++
 ...ic-allocation-to-file-scope-variable.patch |  51 +++++
 .../recipes-protocols/mdns/mdns_878.260.1.bb  |  11 +
 12 files changed, 945 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/mdns/files/0001-Create-subroutine-for-cleaning-recent-interfaces.patch
 create mode 100644 meta-networking/recipes-protocols/mdns/files/0002-Create-subroutine-for-tearing-down-an-interface.patch
 create mode 100644 meta-networking/recipes-protocols/mdns/files/0003-Track-interface-socket-family.patch
 create mode 100644 meta-networking/recipes-protocols/mdns/files/0004-Use-list-for-changed-interfaces.patch
 create mode 100644 meta-networking/recipes-protocols/mdns/files/0005-Handle-noisy-netlink-sockets.patch
 create mode 100644 meta-networking/recipes-protocols/mdns/files/0006-Remove-unneeded-function.patch
 create mode 100644 meta-networking/recipes-protocols/mdns/files/0007-Indicate-loopback-interface-to-mDNS-core.patch
 create mode 100644 meta-networking/recipes-protocols/mdns/files/0008-Mark-deleted-interfaces-as-being-changed.patch
 create mode 100644 meta-networking/recipes-protocols/mdns/files/0009-Fix-possible-NULL-dereference.patch
 create mode 100644 meta-networking/recipes-protocols/mdns/files/0010-Handle-errors-from-socket-calls.patch
 create mode 100644 meta-networking/recipes-protocols/mdns/files/0011-Change-a-dynamic-allocation-to-file-scope-variable.patch

diff --git a/meta-networking/recipes-protocols/mdns/files/0001-Create-subroutine-for-cleaning-recent-interfaces.patch b/meta-networking/recipes-protocols/mdns/files/0001-Create-subroutine-for-cleaning-recent-interfaces.patch
new file mode 100644
index 000000000..692c344db
--- /dev/null
+++ b/meta-networking/recipes-protocols/mdns/files/0001-Create-subroutine-for-cleaning-recent-interfaces.patch
@@ -0,0 +1,60 @@
+From 89ea6ac4a8840e8c2be0140a9805c6522c6c5280 Mon Sep 17 00:00:00 2001
+From: Nate Karstens <nate.karstens@garmin.com>
+Date: Wed, 28 Jun 2017 17:30:00 -0500
+Subject: [PATCH 01/11] Create subroutine for cleaning recent interfaces
+
+Moves functionality for cleaning the list of recent
+interfaces into its own subroutine.
+
+Upstream-Status: Submitted [dts@apple.com]
+
+Signed-off-by: Nate Karstens <nate.karstens@garmin.com>
+---
+ mDNSPosix/mDNSPosix.c | 24 ++++++++++++++----------
+ 1 file changed, 14 insertions(+), 10 deletions(-)
+
+diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
+index 0e10bd5..ffc9696 100644
+--- a/mDNSPosix/mDNSPosix.c
++++ b/mDNSPosix/mDNSPosix.c
+@@ -856,6 +856,19 @@ mDNSlocal int SetupSocket(struct sockaddr *intfAddr, mDNSIPPort port, int interf
+     return err;
+ }
+ 
++// Clean up any interfaces that have been hanging around on the RecentInterfaces list for more than a minute
++mDNSlocal void CleanRecentInterfaces(void)
++{
++    PosixNetworkInterface **ri = &gRecentInterfaces;
++    const mDNSs32 utc = mDNSPlatformUTC();
++    while (*ri)
++    {
++        PosixNetworkInterface *pi = *ri;
++        if (utc - pi->LastSeen < 60) ri = (PosixNetworkInterface **)&pi->coreIntf.next;
++        else { *ri = (PosixNetworkInterface *)pi->coreIntf.next; free(pi); }
++    }
++}
++
+ // Creates a PosixNetworkInterface for the interface whose IP address is
+ // intfAddr and whose name is intfName and registers it with mDNS core.
+ mDNSlocal int SetupOneInterface(mDNS *const m, struct sockaddr *intfAddr, struct sockaddr *intfMask, const char *intfName, int intfIndex)
+@@ -1010,16 +1023,7 @@ mDNSlocal int SetupInterfaceList(mDNS *const m)
+ 
+     // Clean up.
+     if (intfList != NULL) free_ifi_info(intfList);
+-
+-    // Clean up any interfaces that have been hanging around on the RecentInterfaces list for more than a minute
+-    PosixNetworkInterface **ri = &gRecentInterfaces;
+-    const mDNSs32 utc = mDNSPlatformUTC();
+-    while (*ri)
+-    {
+-        PosixNetworkInterface *pi = *ri;
+-        if (utc - pi->LastSeen < 60) ri = (PosixNetworkInterface **)&pi->coreIntf.next;
+-        else { *ri = (PosixNetworkInterface *)pi->coreIntf.next; free(pi); }
+-    }
++    CleanRecentInterfaces();
+ 
+     return err;
+ }
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-protocols/mdns/files/0002-Create-subroutine-for-tearing-down-an-interface.patch b/meta-networking/recipes-protocols/mdns/files/0002-Create-subroutine-for-tearing-down-an-interface.patch
new file mode 100644
index 000000000..21ba31849
--- /dev/null
+++ b/meta-networking/recipes-protocols/mdns/files/0002-Create-subroutine-for-tearing-down-an-interface.patch
@@ -0,0 +1,58 @@
+From a2148df99ddcd122247f95c4cbcce5c4118581a1 Mon Sep 17 00:00:00 2001
+From: Nate Karstens <nate.karstens@garmin.com>
+Date: Wed, 28 Jun 2017 17:30:00 -0500
+Subject: [PATCH 02/11] Create subroutine for tearing down an interface
+
+Creates a subroutine for tearing down an interface.
+
+Upstream-Status: Submitted [dts@apple.com]
+
+Signed-off-by: Nate Karstens <nate.karstens@garmin.com>
+---
+ mDNSPosix/mDNSPosix.c | 22 ++++++++++++++++------
+ 1 file changed, 16 insertions(+), 6 deletions(-)
+
+diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
+index ffc9696..5e5b2cd 100644
+--- a/mDNSPosix/mDNSPosix.c
++++ b/mDNSPosix/mDNSPosix.c
+@@ -591,6 +591,19 @@ mDNSlocal void FreePosixNetworkInterface(PosixNetworkInterface *intf)
+     gRecentInterfaces = intf;
+ }
+ 
++mDNSlocal void TearDownInterface(mDNS *const m, PosixNetworkInterface *intf)
++{
++    mDNS_DeregisterInterface(m, &intf->coreIntf, NormalActivation);
++    if (gMDNSPlatformPosixVerboseLevel > 0) fprintf(stderr, "Deregistered interface %s\n", intf->intfName);
++    FreePosixNetworkInterface(intf);
++
++    num_registered_interfaces--;
++    if (num_registered_interfaces == 0) {
++        num_pkts_accepted = 0;
++        num_pkts_rejected = 0;
++    }
++}
++
+ // Grab the first interface, deregister it, free it, and repeat until done.
+ mDNSlocal void ClearInterfaceList(mDNS *const m)
+ {
+@@ -599,13 +612,10 @@ mDNSlocal void ClearInterfaceList(mDNS *const m)
+     while (m->HostInterfaces)
+     {
+         PosixNetworkInterface *intf = (PosixNetworkInterface*)(m->HostInterfaces);
+-        mDNS_DeregisterInterface(m, &intf->coreIntf, NormalActivation);
+-        if (gMDNSPlatformPosixVerboseLevel > 0) fprintf(stderr, "Deregistered interface %s\n", intf->intfName);
+-        FreePosixNetworkInterface(intf);
++        TearDownInterface(m, intf);
+     }
+-    num_registered_interfaces = 0;
+-    num_pkts_accepted = 0;
+-    num_pkts_rejected = 0;
++
++    assert(num_registered_interfaces == 0);
+ }
+ 
+ // Sets up a send/receive socket.
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-protocols/mdns/files/0003-Track-interface-socket-family.patch b/meta-networking/recipes-protocols/mdns/files/0003-Track-interface-socket-family.patch
new file mode 100644
index 000000000..8c0e6bf39
--- /dev/null
+++ b/meta-networking/recipes-protocols/mdns/files/0003-Track-interface-socket-family.patch
@@ -0,0 +1,50 @@
+From 71a7c728ae0d8143b66aa40decca74ebaa9aa2ce Mon Sep 17 00:00:00 2001
+From: Nate Karstens <nate.karstens@garmin.com>
+Date: Wed, 28 Jun 2017 17:30:00 -0500
+Subject: [PATCH 03/11] Track interface socket family
+
+Tracks the socket family associated with the interface.
+
+Upstream-Status: Submitted [dts@apple.com]
+
+Signed-off-by: Nate Karstens <nate.karstens@garmin.com>
+---
+ mDNSPosix/mDNSPosix.c | 1 +
+ mDNSPosix/mDNSPosix.h | 2 ++
+ 2 files changed, 3 insertions(+)
+
+diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
+index 5e5b2cd..8fe22be 100644
+--- a/mDNSPosix/mDNSPosix.c
++++ b/mDNSPosix/mDNSPosix.c
+@@ -918,6 +918,7 @@ mDNSlocal int SetupOneInterface(mDNS *const m, struct sockaddr *intfAddr, struct
+         // Set up the extra fields in PosixNetworkInterface.
+         assert(intf->intfName != NULL);         // intf->intfName already set up above
+         intf->index                = intfIndex;
++        intf->sa_family            = intfAddr->sa_family;
+         intf->multicastSocket4     = -1;
+ #if HAVE_IPV6
+         intf->multicastSocket6     = -1;
+diff --git a/mDNSPosix/mDNSPosix.h b/mDNSPosix/mDNSPosix.h
+index ca60d80..f77c185 100644
+--- a/mDNSPosix/mDNSPosix.h
++++ b/mDNSPosix/mDNSPosix.h
+@@ -19,6 +19,7 @@
+ #define __mDNSPlatformPosix_h
+ 
+ #include <signal.h>
++#include <sys/socket.h>
+ #include <sys/time.h>
+ 
+ #ifdef  __cplusplus
+@@ -40,6 +41,7 @@ struct PosixNetworkInterface
+     const char *            intfName;
+     PosixNetworkInterface * aliasIntf;
+     int index;
++    sa_family_t sa_family;
+     int multicastSocket4;
+ #if HAVE_IPV6
+     int multicastSocket6;
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-protocols/mdns/files/0004-Use-list-for-changed-interfaces.patch b/meta-networking/recipes-protocols/mdns/files/0004-Use-list-for-changed-interfaces.patch
new file mode 100644
index 000000000..05ad49b9f
--- /dev/null
+++ b/meta-networking/recipes-protocols/mdns/files/0004-Use-list-for-changed-interfaces.patch
@@ -0,0 +1,177 @@
+From e1f483510a1011e37540fdee8f3bc36111fa45a0 Mon Sep 17 00:00:00 2001
+From: Nate Karstens <nate.karstens@garmin.com>
+Date: Thu, 13 Jul 2017 09:00:00 -0500
+Subject: [PATCH 04/11] Use list for changed interfaces
+
+Uses a linked list to store the index of changed network interfaces
+instead of a bitfield. This allows for network interfaces with an
+index greater than 31 (an index of 36 was seen on Android).
+
+Upstream-Status: Submitted [dts@apple.com]
+
+Signed-off-by: Nate Karstens <nate.karstens@garmin.com>
+---
+ mDNSPosix/mDNSPosix.c | 67 +++++++++++++++++++++++++++++++++----------
+ 1 file changed, 52 insertions(+), 15 deletions(-)
+
+diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
+index 8fe22be..699855a 100644
+--- a/mDNSPosix/mDNSPosix.c
++++ b/mDNSPosix/mDNSPosix.c
+@@ -75,6 +75,14 @@ struct IfChangeRec
+ };
+ typedef struct IfChangeRec IfChangeRec;
+ 
++// Used to build a list of network interface indices
++struct NetworkInterfaceIndex
++{
++    int if_index;
++    struct NetworkInterfaceIndex *Next;
++};
++typedef struct NetworkInterfaceIndex NetworkInterfaceIndex;
++
+ // Note that static data is initialized to zero in (modern) C.
+ static fd_set gEventFDs;
+ static int gMaxFD;                              // largest fd in gEventFDs
+@@ -1071,6 +1079,32 @@ mDNSlocal mStatus OpenIfNotifySocket(int *pFD)
+     return err;
+ }
+ 
++mDNSlocal mDNSBool ListContainsInterfaceIndex(GenLinkedList *list, int if_index)
++{
++    NetworkInterfaceIndex *item;
++
++    for (item = (NetworkInterfaceIndex*)list->Head; item != NULL; item = item->Next)
++    {
++        if (if_index == item->if_index) return mDNStrue;
++    }
++
++    return mDNSfalse;
++}
++
++mDNSlocal void AddInterfaceIndexToList(GenLinkedList *list, int if_index)
++{
++    NetworkInterfaceIndex *item;
++
++    if (ListContainsInterfaceIndex(list, if_index)) return;
++
++    item = malloc(sizeof *item);
++    if (item == NULL) return;
++
++    item->if_index = if_index;
++    item->Next = NULL;
++    AddToTail(list, item);
++}
++
+ #if MDNS_DEBUGMSGS
+ mDNSlocal void      PrintNetLinkMsg(const struct nlmsghdr *pNLMsg)
+ {
+@@ -1098,14 +1132,13 @@ mDNSlocal void      PrintNetLinkMsg(const struct nlmsghdr *pNLMsg)
+ }
+ #endif
+ 
+-mDNSlocal mDNSu32       ProcessRoutingNotification(int sd)
++mDNSlocal void          ProcessRoutingNotification(int sd, GenLinkedList *changedInterfaces)
+ // Read through the messages on sd and if any indicate that any interface records should
+ // be torn down and rebuilt, return affected indices as a bitmask. Otherwise return 0.
+ {
+     ssize_t readCount;
+     char buff[4096];
+     struct nlmsghdr         *pNLMsg = (struct nlmsghdr*) buff;
+-    mDNSu32 result = 0;
+ 
+     // The structure here is more complex than it really ought to be because,
+     // unfortunately, there's no good way to size a buffer in advance large
+@@ -1141,9 +1174,9 @@ mDNSlocal mDNSu32       ProcessRoutingNotification(int sd)
+ 
+         // Process the NetLink message
+         if (pNLMsg->nlmsg_type == RTM_GETLINK || pNLMsg->nlmsg_type == RTM_NEWLINK)
+-            result |= 1 << ((struct ifinfomsg*) NLMSG_DATA(pNLMsg))->ifi_index;
++            AddInterfaceIndexToList(changedInterfaces, ((struct ifinfomsg*) NLMSG_DATA(pNLMsg))->ifi_index);
+         else if (pNLMsg->nlmsg_type == RTM_DELADDR || pNLMsg->nlmsg_type == RTM_NEWADDR)
+-            result |= 1 << ((struct ifaddrmsg*) NLMSG_DATA(pNLMsg))->ifa_index;
++            AddInterfaceIndexToList(changedInterfaces, ((struct ifaddrmsg*) NLMSG_DATA(pNLMsg))->ifa_index);
+ 
+         // Advance pNLMsg to the next message in the buffer
+         if ((pNLMsg->nlmsg_flags & NLM_F_MULTI) != 0 && pNLMsg->nlmsg_type != NLMSG_DONE)
+@@ -1154,8 +1187,6 @@ mDNSlocal mDNSu32       ProcessRoutingNotification(int sd)
+         else
+             break;  // all done!
+     }
+-
+-    return result;
+ }
+ 
+ #else // USES_NETLINK
+@@ -1187,14 +1218,13 @@ mDNSlocal void      PrintRoutingSocketMsg(const struct ifa_msghdr *pRSMsg)
+ }
+ #endif
+ 
+-mDNSlocal mDNSu32       ProcessRoutingNotification(int sd)
++mDNSlocal void          ProcessRoutingNotification(int sd, GenLinkedList *changedInterfaces)
+ // Read through the messages on sd and if any indicate that any interface records should
+ // be torn down and rebuilt, return affected indices as a bitmask. Otherwise return 0.
+ {
+     ssize_t readCount;
+     char buff[4096];
+     struct ifa_msghdr       *pRSMsg = (struct ifa_msghdr*) buff;
+-    mDNSu32 result = 0;
+ 
+     readCount = read(sd, buff, sizeof buff);
+     if (readCount < (ssize_t) sizeof(struct ifa_msghdr))
+@@ -1209,12 +1239,10 @@ mDNSlocal mDNSu32       ProcessRoutingNotification(int sd)
+         pRSMsg->ifam_type == RTM_IFINFO)
+     {
+         if (pRSMsg->ifam_type == RTM_IFINFO)
+-            result |= 1 << ((struct if_msghdr*) pRSMsg)->ifm_index;
++            AddInterfaceIndexToList(changedInterfaces, ((struct if_msghdr*) pRSMsg)->ifm_index);
+         else
+-            result |= 1 << pRSMsg->ifam_index;
++            AddInterfaceIndexToList(changedInterfaces, pRSMsg->ifam_index);
+     }
+-
+-    return result;
+ }
+ 
+ #endif // USES_NETLINK
+@@ -1224,7 +1252,8 @@ mDNSlocal void InterfaceChangeCallback(int fd, short filter, void *context)
+ {
+     IfChangeRec     *pChgRec = (IfChangeRec*) context;
+     fd_set readFDs;
+-    mDNSu32 changedInterfaces = 0;
++    GenLinkedList changedInterfaces;
++    NetworkInterfaceIndex *changedInterface;
+     struct timeval zeroTimeout = { 0, 0 };
+ 
+     (void)fd; // Unused
+@@ -1233,17 +1262,25 @@ mDNSlocal void InterfaceChangeCallback(int fd, short filter, void *context)
+     FD_ZERO(&readFDs);
+     FD_SET(pChgRec->NotifySD, &readFDs);
+ 
++    InitLinkedList(&changedInterfaces, offsetof(NetworkInterfaceIndex, Next));
++
+     do
+     {
+-        changedInterfaces |= ProcessRoutingNotification(pChgRec->NotifySD);
++        ProcessRoutingNotification(pChgRec->NotifySD, &changedInterfaces);
+     }
+     while (0 < select(pChgRec->NotifySD + 1, &readFDs, (fd_set*) NULL, (fd_set*) NULL, &zeroTimeout));
+ 
+     // Currently we rebuild the entire interface list whenever any interface change is
+     // detected. If this ever proves to be a performance issue in a multi-homed
+     // configuration, more care should be paid to changedInterfaces.
+-    if (changedInterfaces)
++    if (changedInterfaces.Head != NULL)
+         mDNSPlatformPosixRefreshInterfaceList(pChgRec->mDNS);
++
++    while ((changedInterface = (NetworkInterfaceIndex*)changedInterfaces.Head) != NULL)
++    {
++        RemoveFromList(&changedInterfaces, changedInterface);
++        free(changedInterface);
++    }
+ }
+ 
+ // Register with either a Routing Socket or RtNetLink to listen for interface changes.
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-protocols/mdns/files/0005-Handle-noisy-netlink-sockets.patch b/meta-networking/recipes-protocols/mdns/files/0005-Handle-noisy-netlink-sockets.patch
new file mode 100644
index 000000000..f2b171e55
--- /dev/null
+++ b/meta-networking/recipes-protocols/mdns/files/0005-Handle-noisy-netlink-sockets.patch
@@ -0,0 +1,212 @@
+From 92025cab86619f548bf3eb816a1804ef40507ca7 Mon Sep 17 00:00:00 2001
+From: Nate Karstens <nate.karstens@garmin.com>
+Date: Mon, 24 Jul 2017 09:38:55 -0500
+Subject: [PATCH 05/11] Handle noisy netlink sockets
+
+The POSIX implementation currently clears all network interfaces
+when netlink indicates that there has been a change. This causes
+the following problems:
+
+  1) Applications are informed that all of the services they are
+     tracking have been removed.
+  2) Increases network load because the client must re-query for
+     all records it is interested in.
+
+This changes netlink notification handling by:
+
+  1) Always comparing with the latest interface list returned
+     by the OS.
+  2) Confirming that the interface has been changed in a way
+     that we care about.
+
+Upstream-Status: Submitted [dts@apple.com]
+
+Signed-off-by: Nate Karstens <nate.karstens@garmin.com>
+---
+ mDNSPosix/mDNSPosix.c | 143 +++++++++++++++++++++++++++++++++++++++---
+ 1 file changed, 133 insertions(+), 10 deletions(-)
+
+diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
+index 699855a..59a8b8c 100644
+--- a/mDNSPosix/mDNSPosix.c
++++ b/mDNSPosix/mDNSPosix.c
+@@ -1247,14 +1247,38 @@ mDNSlocal void          ProcessRoutingNotification(int sd, GenLinkedList *change
+ 
+ #endif // USES_NETLINK
+ 
++// Test whether the given PosixNetworkInterface matches the given struct ifi_info
++mDNSlocal mDNSBool InterfacesMatch(PosixNetworkInterface *intf, struct ifi_info *ifi)
++{
++    mDNSBool match = mDNSfalse;
++    mDNSAddr ip, mask;
++
++    if((intf->index == ifi->ifi_index) &&
++       (intf->sa_family == ifi->ifi_addr->sa_family) &&
++       (strcmp(intf->coreIntf.ifname, ifi->ifi_name) == 0))
++        {
++        SockAddrTomDNSAddr(ifi->ifi_addr,    &ip,   NULL);
++        SockAddrTomDNSAddr(ifi->ifi_netmask, &mask, NULL);
++
++        match = mDNSSameAddress(&intf->coreIntf.ip, &ip) &&
++                mDNSSameAddress(&intf->coreIntf.mask, &mask);
++        }
++
++    return match;
++}
++
+ // Called when data appears on interface change notification socket
+ mDNSlocal void InterfaceChangeCallback(int fd, short filter, void *context)
+ {
+     IfChangeRec     *pChgRec = (IfChangeRec*) context;
++    mDNS            *m = pChgRec->mDNS;
+     fd_set readFDs;
+     GenLinkedList changedInterfaces;
+     NetworkInterfaceIndex *changedInterface;
+     struct timeval zeroTimeout = { 0, 0 };
++    struct ifi_info *ifi_list, **ifi, *ifi_free, *ifi_loop4 = NULL;
++    PosixNetworkInterface *intf, *intfNext;
++    mDNSBool found, foundav4;
+ 
+     (void)fd; // Unused
+     (void)filter; // Unused
+@@ -1270,12 +1294,115 @@ mDNSlocal void InterfaceChangeCallback(int fd, short filter, void *context)
+     }
+     while (0 < select(pChgRec->NotifySD + 1, &readFDs, (fd_set*) NULL, (fd_set*) NULL, &zeroTimeout));
+ 
+-    // Currently we rebuild the entire interface list whenever any interface change is
+-    // detected. If this ever proves to be a performance issue in a multi-homed
+-    // configuration, more care should be paid to changedInterfaces.
+-    if (changedInterfaces.Head != NULL)
+-        mDNSPlatformPosixRefreshInterfaceList(pChgRec->mDNS);
++    CleanRecentInterfaces();
++
++    if (changedInterfaces.Head == NULL) goto cleanup;
++
++    ifi_list = get_ifi_info(AF_INET, mDNStrue);
++    if (ifi_list == NULL) goto cleanup;
++
++#if HAVE_IPV6
++    /* Link the IPv6 list to the end of the IPv4 list */
++    ifi = &ifi_list;
++    while (*ifi != NULL) ifi = &(*ifi)->ifi_next;
++    *ifi = get_ifi_info(AF_INET6, mDNStrue);
++#endif
++
++    for (intf = (PosixNetworkInterface*)(m->HostInterfaces); intf != NULL; intf = intfNext)
++    {
++        intfNext = (PosixNetworkInterface*)(intf->coreIntf.next);
++
++        // Loopback interface(s) are handled later
++        if (intf->coreIntf.Loopback) continue;
++
++        found = mDNSfalse;
++        for (ifi = &ifi_list; *ifi != NULL; ifi = &(*ifi)->ifi_next)
++        {
++            if (InterfacesMatch(intf, *ifi))
++            {
++                found = mDNStrue;
++
++                // Removes unchanged from ifi_list
++                ifi_free = *ifi;
++                *ifi = (*ifi)->ifi_next;
++                ifi_free->ifi_next = NULL;
++                free_ifi_info(ifi_free);
++
++                break;
++            }
++        }
++
++        // Removes changed and old interfaces from m->HostInterfaces
++        if (!found) TearDownInterface(m, intf);
++    }
++
++    // Add new and changed interfaces in ifi_list
++    // Save off loopback interface in case it is needed later
++    for (ifi = &ifi_list; *ifi != NULL; ifi = &(*ifi)->ifi_next)
++    {
++        if ((ifi_loop4 == NULL) &&
++            ((*ifi)->ifi_addr->sa_family == AF_INET) &&
++            ((*ifi)->ifi_flags & IFF_UP) &&
++            ((*ifi)->ifi_flags & IFF_LOOPBACK))
++        {
++            ifi_loop4 = *ifi;
++            continue;
++        }
++
++        if (     (((*ifi)->ifi_addr->sa_family == AF_INET)
++#if HAVE_IPV6
++                  || ((*ifi)->ifi_addr->sa_family == AF_INET6)
++#endif
++                  ) && ((*ifi)->ifi_flags & IFF_UP)
++                    && !((*ifi)->ifi_flags & IFF_POINTOPOINT)
++                    && !((*ifi)->ifi_flags & IFF_LOOPBACK))
++        {
++            SetupOneInterface(m, *ifi);
++        }
++    }
++
++    // Determine if there is at least one non-loopback IPv4 interface. This is to work around issues
++    // with multicast loopback on IPv6 interfaces -- see corresponding logic in SetupInterfaceList().
++    foundav4 = mDNSfalse;
++    for (intf = (PosixNetworkInterface*)(m->HostInterfaces); intf != NULL; intf = (PosixNetworkInterface*)(intf->coreIntf.next))
++    {
++        if (intf->sa_family == AF_INET && !intf->coreIntf.Loopback)
++        {
++            foundav4 = mDNStrue;
++            break;
++        }
++    }
++
++    if (foundav4)
++    {
++        for (intf = (PosixNetworkInterface*)(m->HostInterfaces); intf != NULL; intf = intfNext)
++        {
++            intfNext = (PosixNetworkInterface*)(intf->coreIntf.next);
++            if (intf->coreIntf.Loopback) TearDownInterface(m, intf);
++        }
++    }
++    else
++    {
++        found = mDNSfalse;
++
++        for (intf = (PosixNetworkInterface*)(m->HostInterfaces); intf != NULL; intf = (PosixNetworkInterface*)(intf->coreIntf.next))
++        {
++            if (intf->coreIntf.Loopback)
++            {
++                found = mDNStrue;
++                break;
++            }
++        }
++
++        if (!found && (ifi_loop4 != NULL))
++        {
++            SetupOneInterface(m, ifi_loop4);
++        }
++    }
++
++    if (ifi_list != NULL) free_ifi_info(ifi_list);
+ 
++cleanup:
+     while ((changedInterface = (NetworkInterfaceIndex*)changedInterfaces.Head) != NULL)
+     {
+         RemoveFromList(&changedInterfaces, changedInterface);
+@@ -1400,15 +1527,11 @@ mDNSexport void mDNSPlatformClose(mDNS *const m)
+ #endif
+ }
+ 
+-// This is used internally by InterfaceChangeCallback.
+-// It's also exported so that the Standalone Responder (mDNSResponderPosix)
++// This is exported so that the Standalone Responder (mDNSResponderPosix)
+ // can call it in response to a SIGHUP (mainly for debugging purposes).
+ mDNSexport mStatus mDNSPlatformPosixRefreshInterfaceList(mDNS *const m)
+ {
+     int err;
+-    // This is a pretty heavyweight way to process interface changes --
+-    // destroying the entire interface list and then making fresh one from scratch.
+-    // We should make it like the OS X version, which leaves unchanged interfaces alone.
+     ClearInterfaceList(m);
+     err = SetupInterfaceList(m);
+     return PosixErrorToStatus(err);
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-protocols/mdns/files/0006-Remove-unneeded-function.patch b/meta-networking/recipes-protocols/mdns/files/0006-Remove-unneeded-function.patch
new file mode 100644
index 000000000..b461a60df
--- /dev/null
+++ b/meta-networking/recipes-protocols/mdns/files/0006-Remove-unneeded-function.patch
@@ -0,0 +1,51 @@
+From 157d67f152777754c059ced7511352102f23ffae Mon Sep 17 00:00:00 2001
+From: Nate Karstens <nate.karstens@garmin.com>
+Date: Mon, 24 Jul 2017 09:39:18 -0500
+Subject: [PATCH 06/11] Remove unneeded function
+
+Removes a function we no longer need by integrating it into the only
+function that calls it. This was originally separated so that we could
+only process network interfaces that netlink indicated had been changed,
+this has since been extended to test for all network intefaces.
+
+Upstream-Status: Submitted [dts@apple.com]
+
+Signed-off-by: Nate Karstens <nate.karstens@garmin.com>
+---
+ mDNSPosix/mDNSPosix.c | 13 ++-----------
+ 1 file changed, 2 insertions(+), 11 deletions(-)
+
+diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
+index 59a8b8c..3fc5451 100644
+--- a/mDNSPosix/mDNSPosix.c
++++ b/mDNSPosix/mDNSPosix.c
+@@ -1079,24 +1079,15 @@ mDNSlocal mStatus OpenIfNotifySocket(int *pFD)
+     return err;
+ }
+ 
+-mDNSlocal mDNSBool ListContainsInterfaceIndex(GenLinkedList *list, int if_index)
++mDNSlocal void AddInterfaceIndexToList(GenLinkedList *list, int if_index)
+ {
+     NetworkInterfaceIndex *item;
+ 
+     for (item = (NetworkInterfaceIndex*)list->Head; item != NULL; item = item->Next)
+     {
+-        if (if_index == item->if_index) return mDNStrue;
++        if (if_index == item->if_index) return;
+     }
+ 
+-    return mDNSfalse;
+-}
+-
+-mDNSlocal void AddInterfaceIndexToList(GenLinkedList *list, int if_index)
+-{
+-    NetworkInterfaceIndex *item;
+-
+-    if (ListContainsInterfaceIndex(list, if_index)) return;
+-
+     item = malloc(sizeof *item);
+     if (item == NULL) return;
+ 
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-protocols/mdns/files/0007-Indicate-loopback-interface-to-mDNS-core.patch b/meta-networking/recipes-protocols/mdns/files/0007-Indicate-loopback-interface-to-mDNS-core.patch
new file mode 100644
index 000000000..86201c650
--- /dev/null
+++ b/meta-networking/recipes-protocols/mdns/files/0007-Indicate-loopback-interface-to-mDNS-core.patch
@@ -0,0 +1,129 @@
+From 07a9401d84804d7f0181aa4fb0f13a54b2a1c9a8 Mon Sep 17 00:00:00 2001
+From: Nate Karstens <nate.karstens@garmin.com>
+Date: Tue, 1 Aug 2017 17:06:01 -0500
+Subject: [PATCH 07/11] Indicate loopback interface to mDNS core
+
+Tells the mDNS core if an interface is a loopback interface,
+similar to AddInterfaceToList() in the MacOS implementation.
+Also reorganizes SetupOneInterface() to use a const struct
+rather than growing its parameter list again.
+
+Upstream-Status: Submitted [dts@apple.com]
+
+Signed-off-by: Nate Karstens <nate.karstens@garmin.com>
+---
+ mDNSPosix/mDNSPosix.c | 37 ++++++++++++++++++-------------------
+ 1 file changed, 18 insertions(+), 19 deletions(-)
+
+diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
+index 3fc5451..798ab10 100644
+--- a/mDNSPosix/mDNSPosix.c
++++ b/mDNSPosix/mDNSPosix.c
+@@ -889,16 +889,14 @@ mDNSlocal void CleanRecentInterfaces(void)
+ 
+ // Creates a PosixNetworkInterface for the interface whose IP address is
+ // intfAddr and whose name is intfName and registers it with mDNS core.
+-mDNSlocal int SetupOneInterface(mDNS *const m, struct sockaddr *intfAddr, struct sockaddr *intfMask, const char *intfName, int intfIndex)
++mDNSlocal int SetupOneInterface(mDNS *const m, struct ifi_info *const ifi)
+ {
+     int err = 0;
+     PosixNetworkInterface *intf;
+     PosixNetworkInterface *alias = NULL;
+ 
+     assert(m != NULL);
+-    assert(intfAddr != NULL);
+-    assert(intfName != NULL);
+-    assert(intfMask != NULL);
++    assert(ifi != NULL);
+ 
+     // Allocate the interface structure itself.
+     intf = (PosixNetworkInterface*)calloc(1, sizeof(*intf));
+@@ -907,26 +905,27 @@ mDNSlocal int SetupOneInterface(mDNS *const m, struct sockaddr *intfAddr, struct
+     // And make a copy of the intfName.
+     if (err == 0)
+     {
+-        intf->intfName = strdup(intfName);
++        intf->intfName = strdup(ifi->ifi_name);
+         if (intf->intfName == NULL) { assert(0); err = ENOMEM; }
+     }
+ 
+     if (err == 0)
+     {
+         // Set up the fields required by the mDNS core.
+-        SockAddrTomDNSAddr(intfAddr, &intf->coreIntf.ip, NULL);
+-        SockAddrTomDNSAddr(intfMask, &intf->coreIntf.mask, NULL);
++        SockAddrTomDNSAddr(ifi->ifi_addr, &intf->coreIntf.ip, NULL);
++        SockAddrTomDNSAddr(ifi->ifi_netmask, &intf->coreIntf.mask, NULL);
+ 
+         //LogMsg("SetupOneInterface: %#a %#a",  &intf->coreIntf.ip,  &intf->coreIntf.mask);
+-        strncpy(intf->coreIntf.ifname, intfName, sizeof(intf->coreIntf.ifname));
++        strncpy(intf->coreIntf.ifname, ifi->ifi_name, sizeof(intf->coreIntf.ifname));
+         intf->coreIntf.ifname[sizeof(intf->coreIntf.ifname)-1] = 0;
+         intf->coreIntf.Advertise = m->AdvertiseLocalAddresses;
+         intf->coreIntf.McastTxRx = mDNStrue;
++        intf->coreIntf.Loopback = ((ifi->ifi_flags & IFF_LOOPBACK) != 0) ? mDNStrue : mDNSfalse;
+ 
+         // Set up the extra fields in PosixNetworkInterface.
+         assert(intf->intfName != NULL);         // intf->intfName already set up above
+-        intf->index                = intfIndex;
+-        intf->sa_family            = intfAddr->sa_family;
++        intf->index                = ifi->ifi_index;
++        intf->sa_family            = ifi->ifi_addr->sa_family;
+         intf->multicastSocket4     = -1;
+ #if HAVE_IPV6
+         intf->multicastSocket6     = -1;
+@@ -936,17 +935,17 @@ mDNSlocal int SetupOneInterface(mDNS *const m, struct sockaddr *intfAddr, struct
+         intf->coreIntf.InterfaceID = (mDNSInterfaceID)alias;
+ 
+         if (alias != intf)
+-            debugf("SetupOneInterface: %s %#a is an alias of %#a", intfName, &intf->coreIntf.ip, &alias->coreIntf.ip);
++            debugf("SetupOneInterface: %s %#a is an alias of %#a", ifi->ifi_name, &intf->coreIntf.ip, &alias->coreIntf.ip);
+     }
+ 
+     // Set up the multicast socket
+     if (err == 0)
+     {
+-        if (alias->multicastSocket4 == -1 && intfAddr->sa_family == AF_INET)
+-            err = SetupSocket(intfAddr, MulticastDNSPort, intf->index, &alias->multicastSocket4);
++        if (alias->multicastSocket4 == -1 && ifi->ifi_addr->sa_family == AF_INET)
++            err = SetupSocket(ifi->ifi_addr, MulticastDNSPort, intf->index, &alias->multicastSocket4);
+ #if HAVE_IPV6
+-        else if (alias->multicastSocket6 == -1 && intfAddr->sa_family == AF_INET6)
+-            err = SetupSocket(intfAddr, MulticastDNSPort, intf->index, &alias->multicastSocket6);
++        else if (alias->multicastSocket6 == -1 && ifi->ifi_addr->sa_family == AF_INET6)
++            err = SetupSocket(ifi->ifi_addr, MulticastDNSPort, intf->index, &alias->multicastSocket6);
+ #endif
+     }
+ 
+@@ -973,8 +972,8 @@ mDNSlocal int SetupOneInterface(mDNS *const m, struct sockaddr *intfAddr, struct
+     }
+     else
+     {
+-        // Use intfName instead of intf->intfName in the next line to avoid dereferencing NULL.
+-        debugf("SetupOneInterface: %s %#a failed to register %d", intfName, &intf->coreIntf.ip, err);
++        // Use ifi->ifi_name instead of intf->intfName in the next line to avoid dereferencing NULL.
++        debugf("SetupOneInterface: %s %#a failed to register %d", ifi->ifi_name, &intf->coreIntf.ip, err);
+         if (intf) { FreePosixNetworkInterface(intf); intf = NULL; }
+     }
+ 
+@@ -1023,7 +1022,7 @@ mDNSlocal int SetupInterfaceList(mDNS *const m)
+                 }
+                 else
+                 {
+-                    if (SetupOneInterface(m, i->ifi_addr, i->ifi_netmask, i->ifi_name, i->ifi_index) == 0)
++                    if (SetupOneInterface(m, i) == 0)
+                         if (i->ifi_addr->sa_family == AF_INET)
+                             foundav4 = mDNStrue;
+                 }
+@@ -1037,7 +1036,7 @@ mDNSlocal int SetupInterfaceList(mDNS *const m)
+         // In the interim, we skip loopback interface only if we found at least one v4 interface to use
+         // if ((m->HostInterfaces == NULL) && (firstLoopback != NULL))
+         if (!foundav4 && firstLoopback)
+-            (void) SetupOneInterface(m, firstLoopback->ifi_addr, firstLoopback->ifi_netmask, firstLoopback->ifi_name, firstLoopback->ifi_index);
++            (void) SetupOneInterface(m, firstLoopback);
+     }
+ 
+     // Clean up.
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-protocols/mdns/files/0008-Mark-deleted-interfaces-as-being-changed.patch b/meta-networking/recipes-protocols/mdns/files/0008-Mark-deleted-interfaces-as-being-changed.patch
new file mode 100644
index 000000000..fdc5105cb
--- /dev/null
+++ b/meta-networking/recipes-protocols/mdns/files/0008-Mark-deleted-interfaces-as-being-changed.patch
@@ -0,0 +1,39 @@
+From 0fcc0f210f3a9310a1963de640b384ce866410fd Mon Sep 17 00:00:00 2001
+From: Nate Karstens <nate.karstens@garmin.com>
+Date: Wed, 9 Aug 2017 09:16:58 -0500
+Subject: [PATCH 08/11] Mark deleted interfaces as being changed
+
+Netlink notification handling ignores messages for deleted links,
+RTM_DELLINK. It does handle RTM_GETLINK. According to libnl docu-
+mentation (http://www.infradead.org/~tgr/libnl/doc/route.html)
+RTM_DELLINK can be sent by the kernel, but RTM_GETLINK cannot.
+There was likely a mixup in the original implementation, so this
+change replaces handling for RTM_GETLINK with RTM_DELLINK.
+
+Testing and Verification Instructions:
+  1. Use ip-link to add and remove a VLAN interface and verify
+     that mDNSResponder handles the deleted link.
+
+Upstream-Status: Submitted [dts@apple.com]
+
+Signed-off-by: Nate Karstens <nate.karstens@garmin.com>
+---
+ mDNSPosix/mDNSPosix.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
+index 798ab10..a8a57df 100644
+--- a/mDNSPosix/mDNSPosix.c
++++ b/mDNSPosix/mDNSPosix.c
+@@ -1163,7 +1163,7 @@ mDNSlocal void          ProcessRoutingNotification(int sd, GenLinkedList *change
+ #endif
+ 
+         // Process the NetLink message
+-        if (pNLMsg->nlmsg_type == RTM_GETLINK || pNLMsg->nlmsg_type == RTM_NEWLINK)
++        if (pNLMsg->nlmsg_type == RTM_DELLINK || pNLMsg->nlmsg_type == RTM_NEWLINK)
+             AddInterfaceIndexToList(changedInterfaces, ((struct ifinfomsg*) NLMSG_DATA(pNLMsg))->ifi_index);
+         else if (pNLMsg->nlmsg_type == RTM_DELADDR || pNLMsg->nlmsg_type == RTM_NEWADDR)
+             AddInterfaceIndexToList(changedInterfaces, ((struct ifaddrmsg*) NLMSG_DATA(pNLMsg))->ifa_index);
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-protocols/mdns/files/0009-Fix-possible-NULL-dereference.patch b/meta-networking/recipes-protocols/mdns/files/0009-Fix-possible-NULL-dereference.patch
new file mode 100644
index 000000000..362d69768
--- /dev/null
+++ b/meta-networking/recipes-protocols/mdns/files/0009-Fix-possible-NULL-dereference.patch
@@ -0,0 +1,45 @@
+From 38cff19781f81586926b02f0fd1cb36c040395e0 Mon Sep 17 00:00:00 2001
+From: Nate Karstens <nate.karstens@garmin.com>
+Date: Thu, 10 Aug 2017 08:21:53 -0500
+Subject: [PATCH 09/11] Fix possible NULL dereference
+
+Fixes a possible NULL dereference if memory for
+the PosixNetworkInterface could not be allocated.
+Other logic seems to prevent dereferencing this
+variable if NULL, but this instance seems to have
+been overlooked.
+
+Upstream-Status: Submitted [dts@apple.com]
+
+Signed-off-by: Nate Karstens <nate.karstens@garmin.com>
+---
+ mDNSPosix/mDNSPosix.c | 11 +++++++----
+ 1 file changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
+index a8a57df..3243ed4 100644
+--- a/mDNSPosix/mDNSPosix.c
++++ b/mDNSPosix/mDNSPosix.c
+@@ -951,12 +951,15 @@ mDNSlocal int SetupOneInterface(mDNS *const m, struct ifi_info *const ifi)
+ 
+     // If interface is a direct link, address record will be marked as kDNSRecordTypeKnownUnique
+     // and skip the probe phase of the probe/announce packet sequence.
+-    intf->coreIntf.DirectLink = mDNSfalse;
++    if (err == 0)
++    {
++        intf->coreIntf.DirectLink = mDNSfalse;
+ #ifdef DIRECTLINK_INTERFACE_NAME
+-    if (strcmp(intfName, STRINGIFY(DIRECTLINK_INTERFACE_NAME)) == 0)
+-        intf->coreIntf.DirectLink = mDNStrue;
++        if (strcmp(intfName, STRINGIFY(DIRECTLINK_INTERFACE_NAME)) == 0)
++            intf->coreIntf.DirectLink = mDNStrue;
+ #endif
+-    intf->coreIntf.SupportsUnicastMDNSResponse = mDNStrue;
++        intf->coreIntf.SupportsUnicastMDNSResponse = mDNStrue;
++    }
+ 
+     // The interface is all ready to go, let's register it with the mDNS core.
+     if (err == 0)
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-protocols/mdns/files/0010-Handle-errors-from-socket-calls.patch b/meta-networking/recipes-protocols/mdns/files/0010-Handle-errors-from-socket-calls.patch
new file mode 100644
index 000000000..b9b015727
--- /dev/null
+++ b/meta-networking/recipes-protocols/mdns/files/0010-Handle-errors-from-socket-calls.patch
@@ -0,0 +1,62 @@
+From 382b3b924e43abd1bdc5792918161d0922666691 Mon Sep 17 00:00:00 2001
+From: Nate Karstens <nate.karstens@garmin.com>
+Date: Thu, 10 Aug 2017 08:27:32 -0500
+Subject: [PATCH 10/11] Handle errors from socket calls
+
+Adds handling for socket() or read() returning a
+negative value (indicating an error has occurred).
+
+Upstream-Status: Submitted [dts@apple.com]
+
+Signed-off-by: Nate Karstens <nate.karstens@garmin.com>
+---
+ mDNSPosix/mDNSPosix.c | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
+index 3243ed4..84af26b 100644
+--- a/mDNSPosix/mDNSPosix.c
++++ b/mDNSPosix/mDNSPosix.c
+@@ -1129,7 +1129,7 @@ mDNSlocal void          ProcessRoutingNotification(int sd, GenLinkedList *change
+ // Read through the messages on sd and if any indicate that any interface records should
+ // be torn down and rebuilt, return affected indices as a bitmask. Otherwise return 0.
+ {
+-    ssize_t readCount;
++    ssize_t readVal, readCount;
+     char buff[4096];
+     struct nlmsghdr         *pNLMsg = (struct nlmsghdr*) buff;
+ 
+@@ -1138,7 +1138,10 @@ mDNSlocal void          ProcessRoutingNotification(int sd, GenLinkedList *change
+     // enough to hold all pending data and so avoid message fragmentation.
+     // (Note that FIONREAD is not supported on AF_NETLINK.)
+ 
+-    readCount = read(sd, buff, sizeof buff);
++    readVal = read(sd, buff, sizeof buff);
++    if (readVal < 0) return;
++    readCount = readVal;
++
+     while (1)
+     {
+         // Make sure we've got an entire nlmsghdr in the buffer, and payload, too.
+@@ -1154,7 +1157,9 @@ mDNSlocal void          ProcessRoutingNotification(int sd, GenLinkedList *change
+                 pNLMsg = (struct nlmsghdr*) buff;
+ 
+                 // read more data
+-                readCount += read(sd, buff + readCount, sizeof buff - readCount);
++                readVal = read(sd, buff + readCount, sizeof buff - readCount);
++                if (readVal < 0) return;
++                readCount += readVal;
+                 continue;                   // spin around and revalidate with new readCount
+             }
+             else
+@@ -1429,6 +1434,7 @@ mDNSlocal mDNSBool mDNSPlatformInit_CanReceiveUnicast(void)
+     int err;
+     int s = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
+     struct sockaddr_in s5353;
++    if (s < 0) return mDNSfalse;
+     s5353.sin_family      = AF_INET;
+     s5353.sin_port        = MulticastDNSPort.NotAnInteger;
+     s5353.sin_addr.s_addr = 0;
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-protocols/mdns/files/0011-Change-a-dynamic-allocation-to-file-scope-variable.patch b/meta-networking/recipes-protocols/mdns/files/0011-Change-a-dynamic-allocation-to-file-scope-variable.patch
new file mode 100644
index 000000000..d64fb35db
--- /dev/null
+++ b/meta-networking/recipes-protocols/mdns/files/0011-Change-a-dynamic-allocation-to-file-scope-variable.patch
@@ -0,0 +1,51 @@
+From 19de26db69408f02241e232b39224589a0f630df Mon Sep 17 00:00:00 2001
+From: Nate Karstens <nate.karstens@garmin.com>
+Date: Thu, 10 Aug 2017 08:46:03 -0500
+Subject: [PATCH 11/11] Change a dynamic allocation to file-scope variable
+
+Changes a variable from being dynamically-allocated to being
+statically-allocated at the file scope. Addresses a Coverity
+issue where it appeared that the memory was being leaked.
+
+Upstream-Status: Submitted [dts@apple.com]
+
+Signed-off-by: Nate Karstens <nate.karstens@garmin.com>
+---
+ mDNSPosix/mDNSPosix.c | 12 ++++--------
+ 1 file changed, 4 insertions(+), 8 deletions(-)
+
+diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
+index 84af26b..b7795ed 100644
+--- a/mDNSPosix/mDNSPosix.c
++++ b/mDNSPosix/mDNSPosix.c
+@@ -91,6 +91,7 @@ static sigset_t gEventSignalSet;                // Signals which event loop list
+ static sigset_t gEventSignals;                  // Signals which were received while inside loop
+ 
+ static PosixNetworkInterface *gRecentInterfaces;
++static IfChangeRec gChgRec;
+ 
+ // ***************************************************************************
+ // Globals (for debugging)
+@@ -1412,16 +1413,11 @@ cleanup:
+ mDNSlocal mStatus WatchForInterfaceChange(mDNS *const m)
+ {
+     mStatus err;
+-    IfChangeRec *pChgRec;
+ 
+-    pChgRec = (IfChangeRec*) mDNSPlatformMemAllocate(sizeof *pChgRec);
+-    if (pChgRec == NULL)
+-        return mStatus_NoMemoryErr;
+-
+-    pChgRec->mDNS = m;
+-    err = OpenIfNotifySocket(&pChgRec->NotifySD);
++    gChgRec.mDNS = m;
++    err = OpenIfNotifySocket(&gChgRec.NotifySD);
+     if (err == 0)
+-        err = mDNSPosixAddFDToEventLoop(pChgRec->NotifySD, InterfaceChangeCallback, pChgRec);
++        err = mDNSPosixAddFDToEventLoop(gChgRec.NotifySD, InterfaceChangeCallback, &gChgRec);
+ 
+     return err;
+ }
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-protocols/mdns/mdns_878.260.1.bb b/meta-networking/recipes-protocols/mdns/mdns_878.260.1.bb
index 017894531..a5991bf73 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_878.260.1.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_878.260.1.bb
@@ -11,6 +11,17 @@ RPROVIDES_${PN} += "libdns_sd.so"
 SRC_URI = "https://opensource.apple.com/tarballs/mDNSResponder/mDNSResponder-${PV}.tar.gz \
            file://build.patch;patchdir=.. \
            file://mdns.service \
+           file://0001-Create-subroutine-for-cleaning-recent-interfaces.patch;patchdir=.. \
+           file://0002-Create-subroutine-for-tearing-down-an-interface.patch;patchdir=.. \
+           file://0003-Track-interface-socket-family.patch;patchdir=.. \
+           file://0004-Use-list-for-changed-interfaces.patch;patchdir=.. \
+           file://0005-Handle-noisy-netlink-sockets.patch;patchdir=.. \
+           file://0006-Remove-unneeded-function.patch;patchdir=.. \
+           file://0007-Indicate-loopback-interface-to-mDNS-core.patch;patchdir=.. \
+           file://0008-Mark-deleted-interfaces-as-being-changed.patch;patchdir=.. \
+           file://0009-Fix-possible-NULL-dereference.patch;patchdir=.. \
+           file://0010-Handle-errors-from-socket-calls.patch;patchdir=.. \
+           file://0011-Change-a-dynamic-allocation-to-file-scope-variable.patch;patchdir=.. \
            "
 SRC_URI[md5sum] = "aeb92d838a4aa2402ef128ed501484eb"
 SRC_URI[sha256sum] = "3cc71582e8eee469c2de8ecae1d769e7f32b3468dfb7f2ca77f1dee1f30a7d1e"
-- 
2.21.0


