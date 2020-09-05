Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web12.3845.1599327013529892343
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Sep 2020 10:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1kEc0u-0003J7-1v; Sat, 05 Sep 2020 20:30:08 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.92)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1kEc0t-0008jq-Ui; Sat, 05 Sep 2020 20:30:07 +0300
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: openembedded-devel@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@bmw.de>,
	Nate Karstens <nate.karstens@garmin.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [meta-networking][PATCH 1/3] mdns: update to version 1096.40.7
Date: Sat,  5 Sep 2020 20:29:49 +0300
Message-Id: <20200905172951.31808-1-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Rspam-Score: 2.3 (++)
X-Rspam-Report: Action: no action
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: RCPT_COUNT_THREE(0.00)
 Symbol: R_MISSING_CHARSET(2.50)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: MIME_GOOD(-0.10)
 Symbol: BROKEN_CONTENT_TYPE(1.50)
 Symbol: TO_DN_SOME(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: NEURAL_HAM(-0.00)
 Symbol: R_SPF_NA(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20200905172951.31808-1-mikko.rapeli@bmw.de
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Content-Transfer-Encoding: 8bit

Refresh Makefile patch (build.patch) to properly cross compile
mdns. Then try refresh patches which still apply. Following patches
don't apply anymore due to refactoring done on mdns side so thus
dropping patches:

 * 0005-Handle-noisy-netlink-sockets.patch
 * 0007-Indicate-loopback-interface-to-mDNS-core.patch

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 ...utine-for-cleaning-recent-interfaces.patch |  21 +-
 .../0001-mdns-include-stddef.h-for-NULL.patch |  40 ++++
 ...-cross-compilation-fixes-for-bitbake.patch | 145 ++++++++++++
 ...0004-Use-list-for-changed-interfaces.patch |  28 +--
 .../0005-Handle-noisy-netlink-sockets.patch   | 212 ------------------
 ...cate-loopback-interface-to-mDNS-core.patch | 129 -----------
 ...ic-allocation-to-file-scope-variable.patch |  20 +-
 .../recipes-protocols/mdns/files/build.patch  | 167 --------------
 .../{mdns_878.270.2.bb => mdns_1096.40.7.bb}  |   9 +-
 9 files changed, 224 insertions(+), 547 deletions(-)
 create mode 100644 meta-networking/recipes-protocols/mdns/files/0001-mdns-include-stddef.h-for-NULL.patch
 create mode 100644 meta-networking/recipes-protocols/mdns/files/0002-mdns-cross-compilation-fixes-for-bitbake.patch
 delete mode 100644 meta-networking/recipes-protocols/mdns/files/0005-Handle-noisy-netlink-sockets.patch
 delete mode 100644 meta-networking/recipes-protocols/mdns/files/0007-Indicate-loopback-interface-to-mDNS-core.patch
 delete mode 100644 meta-networking/recipes-protocols/mdns/files/build.patch
 rename meta-networking/recipes-protocols/mdns/{mdns_878.270.2.bb => mdns_1096.40.7.bb} (91%)

diff --git a/meta-networking/recipes-protocols/mdns/files/0001-Create-subroutine-for-cleaning-recent-interfaces.patch b/meta-networking/recipes-protocols/mdns/files/0001-Create-subroutine-for-cleaning-recent-interfaces.patch
index 692c344db..f8efc1044 100644
--- a/meta-networking/recipes-protocols/mdns/files/0001-Create-subroutine-for-cleaning-recent-interfaces.patch
+++ b/meta-networking/recipes-protocols/mdns/files/0001-Create-subroutine-for-cleaning-recent-interfaces.patch
@@ -1,7 +1,7 @@
-From 89ea6ac4a8840e8c2be0140a9805c6522c6c5280 Mon Sep 17 00:00:00 2001
+From 6d90f9fdaf008f5c3b8fd8d91594fa1461437888 Mon Sep 17 00:00:00 2001
 From: Nate Karstens <nate.karstens@garmin.com>
 Date: Wed, 28 Jun 2017 17:30:00 -0500
-Subject: [PATCH 01/11] Create subroutine for cleaning recent interfaces
+Subject: [PATCH] Create subroutine for cleaning recent interfaces
 
 Moves functionality for cleaning the list of recent
 interfaces into its own subroutine.
@@ -10,14 +10,14 @@ Upstream-Status: Submitted [dts@apple.com]
 
 Signed-off-by: Nate Karstens <nate.karstens@garmin.com>
 ---
- mDNSPosix/mDNSPosix.c | 24 ++++++++++++++----------
- 1 file changed, 14 insertions(+), 10 deletions(-)
+ mDNSPosix/mDNSPosix.c | 23 ++++++++++++++---------
+ 1 file changed, 14 insertions(+), 9 deletions(-)
 
 diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
-index 0e10bd5..ffc9696 100644
+index a63cd19..7aeee7b 100755
 --- a/mDNSPosix/mDNSPosix.c
 +++ b/mDNSPosix/mDNSPosix.c
-@@ -856,6 +856,19 @@ mDNSlocal int SetupSocket(struct sockaddr *intfAddr, mDNSIPPort port, int interf
+@@ -1199,6 +1199,19 @@ mDNSlocal int SetupSocket(struct sockaddr *intfAddr, mDNSIPPort port, int interf
      return err;
  }
  
@@ -37,11 +37,10 @@ index 0e10bd5..ffc9696 100644
  // Creates a PosixNetworkInterface for the interface whose IP address is
  // intfAddr and whose name is intfName and registers it with mDNS core.
  mDNSlocal int SetupOneInterface(mDNS *const m, struct sockaddr *intfAddr, struct sockaddr *intfMask, const char *intfName, int intfIndex)
-@@ -1010,16 +1023,7 @@ mDNSlocal int SetupInterfaceList(mDNS *const m)
- 
+@@ -1388,15 +1401,7 @@ mDNSlocal int SetupInterfaceList(mDNS *const m)
      // Clean up.
-     if (intfList != NULL) free_ifi_info(intfList);
--
+     if (intfList != NULL) freeifaddrs(intfList);
+ 
 -    // Clean up any interfaces that have been hanging around on the RecentInterfaces list for more than a minute
 -    PosixNetworkInterface **ri = &gRecentInterfaces;
 -    const mDNSs32 utc = mDNSPlatformUTC();
@@ -56,5 +55,5 @@ index 0e10bd5..ffc9696 100644
      return err;
  }
 -- 
-2.17.1
+2.20.1
 
diff --git a/meta-networking/recipes-protocols/mdns/files/0001-mdns-include-stddef.h-for-NULL.patch b/meta-networking/recipes-protocols/mdns/files/0001-mdns-include-stddef.h-for-NULL.patch
new file mode 100644
index 000000000..3e9be7d6a
--- /dev/null
+++ b/meta-networking/recipes-protocols/mdns/files/0001-mdns-include-stddef.h-for-NULL.patch
@@ -0,0 +1,40 @@
+From d744609c56f9872e5aa71707f1f71feec9867f51 Mon Sep 17 00:00:00 2001
+From: Mikko Rapeli <mikko.rapeli@bmw.de>
+Date: Tue, 14 Jul 2020 16:36:29 +0000
+Subject: [PATCH 1/2] mdns: include <stddef.h> for NULL
+
+Fixes build error with version 1096.40.7:
+
+../mDNSCore/mDNS.c:11385:26: error: 'NULL' undeclared (first use in this function)
+11385 |     const char *reason = NULL;
+      |                          ^~~~
+../mDNSCore/mDNS.c:56:1: note: 'NULL' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
+   55 | #include "dns_sd_internal.h"
+  +++ |+#include <stddef.h>
+   56 |
+../mDNSCore/mDNS.c:11385:26: note: each undeclared identifier is reported only once for each function it appears in
+11385 |     const char *reason = NULL;
+      |                          ^~~~
+
+Upstream-Status: Pending
+
+Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
+---
+ mDNSCore/mDNS.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/mDNSCore/mDNS.c b/mDNSCore/mDNS.c
+index 2fbea04..d4b9af5 100755
+--- a/mDNSCore/mDNS.c
++++ b/mDNSCore/mDNS.c
+@@ -23,6 +23,7 @@
+  * routines, or types (which may or may not be present on any given platform).
+  */
+ 
++#include <stddef.h> /* for NULL */
+ #include "DNSCommon.h"                  // Defines general DNS utility routines
+ #include "uDNS.h"                       // Defines entry points into unicast-specific routines
+ #include "nsec.h"
+-- 
+2.20.1
+
diff --git a/meta-networking/recipes-protocols/mdns/files/0002-mdns-cross-compilation-fixes-for-bitbake.patch b/meta-networking/recipes-protocols/mdns/files/0002-mdns-cross-compilation-fixes-for-bitbake.patch
new file mode 100644
index 000000000..33590ffc5
--- /dev/null
+++ b/meta-networking/recipes-protocols/mdns/files/0002-mdns-cross-compilation-fixes-for-bitbake.patch
@@ -0,0 +1,145 @@
+From 72405143f9d16514e70b88bc4843c9634b88036a Mon Sep 17 00:00:00 2001
+From: Brendan Le Foll <brendan.le.foll@intel.com>
+Date: Tue, 3 Mar 2015 11:42:57 +0000
+Subject: [PATCH 2/2] mdns: cross compilation fixes for bitbake
+
+Fixes several build errors when incorrect compiler or
+compiler flags are used.
+
+Upstream-Status: Inappropriate [OE-specific]
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
+---
+ mDNSPosix/Makefile | 44 ++++++++++++++++++++------------------------
+ 1 file changed, 20 insertions(+), 24 deletions(-)
+
+diff --git a/mDNSPosix/Makefile b/mDNSPosix/Makefile
+index 78222e0..18a3af5 100755
+--- a/mDNSPosix/Makefile
++++ b/mDNSPosix/Makefile
+@@ -50,6 +50,7 @@
+ 
+ LIBVERS = 1
+ 
++POSIXDIR = ../mDNSPosix
+ COREDIR = ../mDNSCore
+ SHAREDDIR ?= ../mDNSShared
+ DSODIR ?= ../DSO
+@@ -62,16 +63,16 @@ else ifeq ($(SYSTEM), Linux)
+   os=linux
+ endif
+ 
+-CC = cc
+-BISON = bison
+-FLEX = flex
+-ST = strip
+-LD = ld
++CC ?= cc
++BISON ?= bison
++FLEX ?= flex
++ST ?= strip
++LD ?= ld
+ SOOPTS = -shared
+ CP = cp
+ RM = rm
+ LN = ln -s -f
+-CFLAGS_COMMON = -I$(COREDIR) -I$(SHAREDDIR) -I$(DSODIR) -I$(PROXYDIR) -I$(OBJDIR) -fwrapv -W -Wall -DPID_FILE=\"/var/run/mdnsd.pid\" -DMDNS_UDS_SERVERPATH=\"/var/run/mdnsd\"
++CFLAGS_COMMON = -I$(POSIXDIR) -I$(COREDIR) -I$(SHAREDDIR) -I$(DSODIR) -I$(PROXYDIR) -I$(OBJDIR) -fwrapv -W -Wall -DPID_FILE=\"/var/run/mdnsd.pid\" -DMDNS_UDS_SERVERPATH=\"/var/run/mdnsd\"
+ CFLAGS_PTHREAD =
+ LINKOPTS =
+ LINKOPTS_PTHREAD = -lpthread
+@@ -85,6 +86,7 @@ CFLAGS_OPEN_SOURCE=
+ endif
+ 
+ # Set up diverging paths for debug vs. prod builds
++DEBUG ?= 1
+ ifeq "$(DEBUG)" "1"
+ CFLAGS_DEBUGGING = -g -DMDNS_DEBUGMSGS=2
+ OBJDIR = objects/debug
+@@ -101,8 +103,8 @@ else
+ # 1. We want to make small binaries, suitable for putting into hardware devices
+ # 2. Some of the code analysis warnings only work when some form of optimization is enabled
+ CFLAGS_DEBUGGING = -g -DMDNS_DEBUGMSGS=0
+-OBJDIR ?= objects/prod
+-BUILDDIR ?= build/prod
++OBJDIR = objects/prod
++BUILDDIR = build/prod
+ STRIP = $(ST) -S
+ endif
+ endif
+@@ -125,7 +127,7 @@ else
+ # any target that contains the string "linux"
+ ifeq ($(findstring linux,$(os)),linux)
+ CFLAGS_OS = -D_GNU_SOURCE -DHAVE_IPV6 -DNOT_HAVE_SA_LEN -DUSES_NETLINK -DHAVE_LINUX -DTARGET_OS_LINUX -ftabstop=4
+-LD = $(CC)
++LD ?= $(CC)
+ SOOPTS = -shared
+ FLEXFLAGS_OS = -l
+ JAVACFLAGS_OS += -I$(JDK)/include/linux
+@@ -276,8 +278,7 @@ Daemon: setup $(BUILDDIR)/mdnsd
+ 	@echo "Responder daemon done"
+ 
+ $(BUILDDIR)/mdnsd: $(DAEMONOBJS)
+-	$(CC) -o $@ $+ $(LINKOPTS)
+-	$(STRIP) $@
++	$(LD) -o $@ $+
+ 
+ # libdns_sd target builds the client library
+ libdns_sd: setup $(BUILDDIR)/libdns_sd.$(LDSUFFIX)
+@@ -286,13 +287,9 @@ libdns_sd: setup $(BUILDDIR)/libdns_sd.$(LDSUFFIX)
+ CLIENTLIBOBJS = $(OBJDIR)/dnssd_clientlib.c.so.o $(OBJDIR)/dnssd_clientstub.c.so.o $(OBJDIR)/dnssd_ipc.c.so.o
+ 
+ $(BUILDDIR)/libdns_sd.$(LDSUFFIX): $(CLIENTLIBOBJS)
+-	$(LD) $(SOOPTS) $(LINKOPTS) -o $@ $+
+-	$(STRIP) $@
+-
+-Clients: setup libdns_sd ../Clients/build/dns-sd
+-	@echo "Clients done"
++	$(LD) -shared $(LINKOPTS) -Wl,-soname,libdns_sd.$(LDSUFFIX).1 -o $@ $+
+ 
+-../Clients/build/dns-sd: ../Clients/dns-sd.c
++Clients: setup libdns_sd
+ 	$(MAKE) -C ../Clients DEBUG=$(DEBUG) SUPMAKE_CFLAGS="$(MDNSCFLAGS)"
+ 
+ # nss_mdns target builds the Name Service Switch module
+@@ -300,8 +297,7 @@ nss_mdns: setup $(BUILDDIR)/$(NSSLIBFILE)
+ 	@echo "Name Service Switch module done"
+ 
+ $(BUILDDIR)/$(NSSLIBFILE): $(CLIENTLIBOBJS) $(OBJDIR)/nss_mdns.c.so.o
+-	$(LD) $(SOOPTS) $(LINKOPTS) -o $@ $+
+-	$(STRIP) $@
++	$(LD) -shared $(LINKOPTS) -o $@ $+
+ 
+ #############################################################################
+ 
+@@ -494,21 +490,21 @@ dnsextd: setup $(BUILDDIR)/dnsextd
+ 	@echo "dnsextd done"
+ 
+ $(BUILDDIR)/mDNSClientPosix:         $(APPOBJ)     $(OBJDIR)/Client.c.o
+-	$(CC) $+ -o $@ $(LINKOPTS)
++	$(CC) $+ -o $@
+ 
+ $(BUILDDIR)/mDNSResponderPosix:      $(COMMONOBJ)  $(OBJDIR)/Responder.c.o
+-	$(CC) $+ -o $@ $(LINKOPTS)
++	$(CC) $+ -o $@
+ 
+ $(BUILDDIR)/mDNSProxyResponderPosix: $(COMMONOBJ)  $(OBJDIR)/ProxyResponder.c.o
+-	$(CC) $+ -o $@ $(LINKOPTS)
++	$(CC) $+ -o $@
+ 
+ $(BUILDDIR)/mDNSNetMonitor:          $(SPECIALOBJ) $(OBJDIR)/NetMonitor.c.o
+-	$(CC) $+ -o $@ $(LINKOPTS)
++	$(CC) $+ -o $@
+ 
+ $(OBJDIR)/NetMonitor.c.o:            $(COREDIR)/mDNS.c # Note: NetMonitor.c textually imports mDNS.c
+ 
+ $(BUILDDIR)/dnsextd:                 $(DNSEXTDOBJ) $(OBJDIR)/dnsextd.c.threadsafe.o
+-	$(CC) $+ -o $@ $(LINKOPTS) $(LINKOPTS_PTHREAD)
++	$(CC) $+ -o $@ $(LINKOPTS_PTHREAD)
+ 
+ #############################################################################
+ 
+-- 
+2.20.1
+
diff --git a/meta-networking/recipes-protocols/mdns/files/0004-Use-list-for-changed-interfaces.patch b/meta-networking/recipes-protocols/mdns/files/0004-Use-list-for-changed-interfaces.patch
index 05ad49b9f..db3a63ea4 100644
--- a/meta-networking/recipes-protocols/mdns/files/0004-Use-list-for-changed-interfaces.patch
+++ b/meta-networking/recipes-protocols/mdns/files/0004-Use-list-for-changed-interfaces.patch
@@ -1,4 +1,4 @@
-From e1f483510a1011e37540fdee8f3bc36111fa45a0 Mon Sep 17 00:00:00 2001
+From 798bfb5e984845a27874d1a244686db6e384d7b8 Mon Sep 17 00:00:00 2001
 From: Nate Karstens <nate.karstens@garmin.com>
 Date: Thu, 13 Jul 2017 09:00:00 -0500
 Subject: [PATCH 04/11] Use list for changed interfaces
@@ -15,10 +15,10 @@ Signed-off-by: Nate Karstens <nate.karstens@garmin.com>
  1 file changed, 52 insertions(+), 15 deletions(-)
 
 diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
-index 8fe22be..699855a 100644
+index 195d04b..bb883c1 100755
 --- a/mDNSPosix/mDNSPosix.c
 +++ b/mDNSPosix/mDNSPosix.c
-@@ -75,6 +75,14 @@ struct IfChangeRec
+@@ -67,6 +67,14 @@ struct IfChangeRec
  };
  typedef struct IfChangeRec IfChangeRec;
  
@@ -31,9 +31,9 @@ index 8fe22be..699855a 100644
 +typedef struct NetworkInterfaceIndex NetworkInterfaceIndex;
 +
  // Note that static data is initialized to zero in (modern) C.
- static fd_set gEventFDs;
- static int gMaxFD;                              // largest fd in gEventFDs
-@@ -1071,6 +1079,32 @@ mDNSlocal mStatus OpenIfNotifySocket(int *pFD)
+ static PosixEventSource *gEventSources;             // linked list of PosixEventSource's
+ static sigset_t gEventSignalSet;                // Signals which event loop listens for
+@@ -1458,6 +1466,32 @@ mDNSlocal mStatus OpenIfNotifySocket(int *pFD)
      return err;
  }
  
@@ -66,7 +66,7 @@ index 8fe22be..699855a 100644
  #if MDNS_DEBUGMSGS
  mDNSlocal void      PrintNetLinkMsg(const struct nlmsghdr *pNLMsg)
  {
-@@ -1098,14 +1132,13 @@ mDNSlocal void      PrintNetLinkMsg(const struct nlmsghdr *pNLMsg)
+@@ -1485,14 +1519,13 @@ mDNSlocal void      PrintNetLinkMsg(const struct nlmsghdr *pNLMsg)
  }
  #endif
  
@@ -82,7 +82,7 @@ index 8fe22be..699855a 100644
  
      // The structure here is more complex than it really ought to be because,
      // unfortunately, there's no good way to size a buffer in advance large
-@@ -1141,9 +1174,9 @@ mDNSlocal mDNSu32       ProcessRoutingNotification(int sd)
+@@ -1528,9 +1561,9 @@ mDNSlocal mDNSu32       ProcessRoutingNotification(int sd)
  
          // Process the NetLink message
          if (pNLMsg->nlmsg_type == RTM_GETLINK || pNLMsg->nlmsg_type == RTM_NEWLINK)
@@ -94,7 +94,7 @@ index 8fe22be..699855a 100644
  
          // Advance pNLMsg to the next message in the buffer
          if ((pNLMsg->nlmsg_flags & NLM_F_MULTI) != 0 && pNLMsg->nlmsg_type != NLMSG_DONE)
-@@ -1154,8 +1187,6 @@ mDNSlocal mDNSu32       ProcessRoutingNotification(int sd)
+@@ -1541,8 +1574,6 @@ mDNSlocal mDNSu32       ProcessRoutingNotification(int sd)
          else
              break;  // all done!
      }
@@ -103,7 +103,7 @@ index 8fe22be..699855a 100644
  }
  
  #else // USES_NETLINK
-@@ -1187,14 +1218,13 @@ mDNSlocal void      PrintRoutingSocketMsg(const struct ifa_msghdr *pRSMsg)
+@@ -1574,14 +1605,13 @@ mDNSlocal void      PrintRoutingSocketMsg(const struct ifa_msghdr *pRSMsg)
  }
  #endif
  
@@ -119,7 +119,7 @@ index 8fe22be..699855a 100644
  
      readCount = read(sd, buff, sizeof buff);
      if (readCount < (ssize_t) sizeof(struct ifa_msghdr))
-@@ -1209,12 +1239,10 @@ mDNSlocal mDNSu32       ProcessRoutingNotification(int sd)
+@@ -1596,12 +1626,10 @@ mDNSlocal mDNSu32       ProcessRoutingNotification(int sd)
          pRSMsg->ifam_type == RTM_IFINFO)
      {
          if (pRSMsg->ifam_type == RTM_IFINFO)
@@ -134,7 +134,7 @@ index 8fe22be..699855a 100644
  }
  
  #endif // USES_NETLINK
-@@ -1224,7 +1252,8 @@ mDNSlocal void InterfaceChangeCallback(int fd, short filter, void *context)
+@@ -1611,7 +1639,8 @@ mDNSlocal void InterfaceChangeCallback(int fd, void *context)
  {
      IfChangeRec     *pChgRec = (IfChangeRec*) context;
      fd_set readFDs;
@@ -144,7 +144,7 @@ index 8fe22be..699855a 100644
      struct timeval zeroTimeout = { 0, 0 };
  
      (void)fd; // Unused
-@@ -1233,17 +1262,25 @@ mDNSlocal void InterfaceChangeCallback(int fd, short filter, void *context)
+@@ -1619,17 +1648,25 @@ mDNSlocal void InterfaceChangeCallback(int fd, void *context)
      FD_ZERO(&readFDs);
      FD_SET(pChgRec->NotifySD, &readFDs);
  
@@ -173,5 +173,5 @@ index 8fe22be..699855a 100644
  
  // Register with either a Routing Socket or RtNetLink to listen for interface changes.
 -- 
-2.17.1
+2.20.1
 
diff --git a/meta-networking/recipes-protocols/mdns/files/0005-Handle-noisy-netlink-sockets.patch b/meta-networking/recipes-protocols/mdns/files/0005-Handle-noisy-netlink-sockets.patch
deleted file mode 100644
index f2b171e55..000000000
--- a/meta-networking/recipes-protocols/mdns/files/0005-Handle-noisy-netlink-sockets.patch
+++ /dev/null
@@ -1,212 +0,0 @@
-From 92025cab86619f548bf3eb816a1804ef40507ca7 Mon Sep 17 00:00:00 2001
-From: Nate Karstens <nate.karstens@garmin.com>
-Date: Mon, 24 Jul 2017 09:38:55 -0500
-Subject: [PATCH 05/11] Handle noisy netlink sockets
-
-The POSIX implementation currently clears all network interfaces
-when netlink indicates that there has been a change. This causes
-the following problems:
-
-  1) Applications are informed that all of the services they are
-     tracking have been removed.
-  2) Increases network load because the client must re-query for
-     all records it is interested in.
-
-This changes netlink notification handling by:
-
-  1) Always comparing with the latest interface list returned
-     by the OS.
-  2) Confirming that the interface has been changed in a way
-     that we care about.
-
-Upstream-Status: Submitted [dts@apple.com]
-
-Signed-off-by: Nate Karstens <nate.karstens@garmin.com>
----
- mDNSPosix/mDNSPosix.c | 143 +++++++++++++++++++++++++++++++++++++++---
- 1 file changed, 133 insertions(+), 10 deletions(-)
-
-diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
-index 699855a..59a8b8c 100644
---- a/mDNSPosix/mDNSPosix.c
-+++ b/mDNSPosix/mDNSPosix.c
-@@ -1247,14 +1247,38 @@ mDNSlocal void          ProcessRoutingNotification(int sd, GenLinkedList *change
- 
- #endif // USES_NETLINK
- 
-+// Test whether the given PosixNetworkInterface matches the given struct ifi_info
-+mDNSlocal mDNSBool InterfacesMatch(PosixNetworkInterface *intf, struct ifi_info *ifi)
-+{
-+    mDNSBool match = mDNSfalse;
-+    mDNSAddr ip, mask;
-+
-+    if((intf->index == ifi->ifi_index) &&
-+       (intf->sa_family == ifi->ifi_addr->sa_family) &&
-+       (strcmp(intf->coreIntf.ifname, ifi->ifi_name) == 0))
-+        {
-+        SockAddrTomDNSAddr(ifi->ifi_addr,    &ip,   NULL);
-+        SockAddrTomDNSAddr(ifi->ifi_netmask, &mask, NULL);
-+
-+        match = mDNSSameAddress(&intf->coreIntf.ip, &ip) &&
-+                mDNSSameAddress(&intf->coreIntf.mask, &mask);
-+        }
-+
-+    return match;
-+}
-+
- // Called when data appears on interface change notification socket
- mDNSlocal void InterfaceChangeCallback(int fd, short filter, void *context)
- {
-     IfChangeRec     *pChgRec = (IfChangeRec*) context;
-+    mDNS            *m = pChgRec->mDNS;
-     fd_set readFDs;
-     GenLinkedList changedInterfaces;
-     NetworkInterfaceIndex *changedInterface;
-     struct timeval zeroTimeout = { 0, 0 };
-+    struct ifi_info *ifi_list, **ifi, *ifi_free, *ifi_loop4 = NULL;
-+    PosixNetworkInterface *intf, *intfNext;
-+    mDNSBool found, foundav4;
- 
-     (void)fd; // Unused
-     (void)filter; // Unused
-@@ -1270,12 +1294,115 @@ mDNSlocal void InterfaceChangeCallback(int fd, short filter, void *context)
-     }
-     while (0 < select(pChgRec->NotifySD + 1, &readFDs, (fd_set*) NULL, (fd_set*) NULL, &zeroTimeout));
- 
--    // Currently we rebuild the entire interface list whenever any interface change is
--    // detected. If this ever proves to be a performance issue in a multi-homed
--    // configuration, more care should be paid to changedInterfaces.
--    if (changedInterfaces.Head != NULL)
--        mDNSPlatformPosixRefreshInterfaceList(pChgRec->mDNS);
-+    CleanRecentInterfaces();
-+
-+    if (changedInterfaces.Head == NULL) goto cleanup;
-+
-+    ifi_list = get_ifi_info(AF_INET, mDNStrue);
-+    if (ifi_list == NULL) goto cleanup;
-+
-+#if HAVE_IPV6
-+    /* Link the IPv6 list to the end of the IPv4 list */
-+    ifi = &ifi_list;
-+    while (*ifi != NULL) ifi = &(*ifi)->ifi_next;
-+    *ifi = get_ifi_info(AF_INET6, mDNStrue);
-+#endif
-+
-+    for (intf = (PosixNetworkInterface*)(m->HostInterfaces); intf != NULL; intf = intfNext)
-+    {
-+        intfNext = (PosixNetworkInterface*)(intf->coreIntf.next);
-+
-+        // Loopback interface(s) are handled later
-+        if (intf->coreIntf.Loopback) continue;
-+
-+        found = mDNSfalse;
-+        for (ifi = &ifi_list; *ifi != NULL; ifi = &(*ifi)->ifi_next)
-+        {
-+            if (InterfacesMatch(intf, *ifi))
-+            {
-+                found = mDNStrue;
-+
-+                // Removes unchanged from ifi_list
-+                ifi_free = *ifi;
-+                *ifi = (*ifi)->ifi_next;
-+                ifi_free->ifi_next = NULL;
-+                free_ifi_info(ifi_free);
-+
-+                break;
-+            }
-+        }
-+
-+        // Removes changed and old interfaces from m->HostInterfaces
-+        if (!found) TearDownInterface(m, intf);
-+    }
-+
-+    // Add new and changed interfaces in ifi_list
-+    // Save off loopback interface in case it is needed later
-+    for (ifi = &ifi_list; *ifi != NULL; ifi = &(*ifi)->ifi_next)
-+    {
-+        if ((ifi_loop4 == NULL) &&
-+            ((*ifi)->ifi_addr->sa_family == AF_INET) &&
-+            ((*ifi)->ifi_flags & IFF_UP) &&
-+            ((*ifi)->ifi_flags & IFF_LOOPBACK))
-+        {
-+            ifi_loop4 = *ifi;
-+            continue;
-+        }
-+
-+        if (     (((*ifi)->ifi_addr->sa_family == AF_INET)
-+#if HAVE_IPV6
-+                  || ((*ifi)->ifi_addr->sa_family == AF_INET6)
-+#endif
-+                  ) && ((*ifi)->ifi_flags & IFF_UP)
-+                    && !((*ifi)->ifi_flags & IFF_POINTOPOINT)
-+                    && !((*ifi)->ifi_flags & IFF_LOOPBACK))
-+        {
-+            SetupOneInterface(m, *ifi);
-+        }
-+    }
-+
-+    // Determine if there is at least one non-loopback IPv4 interface. This is to work around issues
-+    // with multicast loopback on IPv6 interfaces -- see corresponding logic in SetupInterfaceList().
-+    foundav4 = mDNSfalse;
-+    for (intf = (PosixNetworkInterface*)(m->HostInterfaces); intf != NULL; intf = (PosixNetworkInterface*)(intf->coreIntf.next))
-+    {
-+        if (intf->sa_family == AF_INET && !intf->coreIntf.Loopback)
-+        {
-+            foundav4 = mDNStrue;
-+            break;
-+        }
-+    }
-+
-+    if (foundav4)
-+    {
-+        for (intf = (PosixNetworkInterface*)(m->HostInterfaces); intf != NULL; intf = intfNext)
-+        {
-+            intfNext = (PosixNetworkInterface*)(intf->coreIntf.next);
-+            if (intf->coreIntf.Loopback) TearDownInterface(m, intf);
-+        }
-+    }
-+    else
-+    {
-+        found = mDNSfalse;
-+
-+        for (intf = (PosixNetworkInterface*)(m->HostInterfaces); intf != NULL; intf = (PosixNetworkInterface*)(intf->coreIntf.next))
-+        {
-+            if (intf->coreIntf.Loopback)
-+            {
-+                found = mDNStrue;
-+                break;
-+            }
-+        }
-+
-+        if (!found && (ifi_loop4 != NULL))
-+        {
-+            SetupOneInterface(m, ifi_loop4);
-+        }
-+    }
-+
-+    if (ifi_list != NULL) free_ifi_info(ifi_list);
- 
-+cleanup:
-     while ((changedInterface = (NetworkInterfaceIndex*)changedInterfaces.Head) != NULL)
-     {
-         RemoveFromList(&changedInterfaces, changedInterface);
-@@ -1400,15 +1527,11 @@ mDNSexport void mDNSPlatformClose(mDNS *const m)
- #endif
- }
- 
--// This is used internally by InterfaceChangeCallback.
--// It's also exported so that the Standalone Responder (mDNSResponderPosix)
-+// This is exported so that the Standalone Responder (mDNSResponderPosix)
- // can call it in response to a SIGHUP (mainly for debugging purposes).
- mDNSexport mStatus mDNSPlatformPosixRefreshInterfaceList(mDNS *const m)
- {
-     int err;
--    // This is a pretty heavyweight way to process interface changes --
--    // destroying the entire interface list and then making fresh one from scratch.
--    // We should make it like the OS X version, which leaves unchanged interfaces alone.
-     ClearInterfaceList(m);
-     err = SetupInterfaceList(m);
-     return PosixErrorToStatus(err);
--- 
-2.17.1
-
diff --git a/meta-networking/recipes-protocols/mdns/files/0007-Indicate-loopback-interface-to-mDNS-core.patch b/meta-networking/recipes-protocols/mdns/files/0007-Indicate-loopback-interface-to-mDNS-core.patch
deleted file mode 100644
index 86201c650..000000000
--- a/meta-networking/recipes-protocols/mdns/files/0007-Indicate-loopback-interface-to-mDNS-core.patch
+++ /dev/null
@@ -1,129 +0,0 @@
-From 07a9401d84804d7f0181aa4fb0f13a54b2a1c9a8 Mon Sep 17 00:00:00 2001
-From: Nate Karstens <nate.karstens@garmin.com>
-Date: Tue, 1 Aug 2017 17:06:01 -0500
-Subject: [PATCH 07/11] Indicate loopback interface to mDNS core
-
-Tells the mDNS core if an interface is a loopback interface,
-similar to AddInterfaceToList() in the MacOS implementation.
-Also reorganizes SetupOneInterface() to use a const struct
-rather than growing its parameter list again.
-
-Upstream-Status: Submitted [dts@apple.com]
-
-Signed-off-by: Nate Karstens <nate.karstens@garmin.com>
----
- mDNSPosix/mDNSPosix.c | 37 ++++++++++++++++++-------------------
- 1 file changed, 18 insertions(+), 19 deletions(-)
-
-diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
-index 3fc5451..798ab10 100644
---- a/mDNSPosix/mDNSPosix.c
-+++ b/mDNSPosix/mDNSPosix.c
-@@ -889,16 +889,14 @@ mDNSlocal void CleanRecentInterfaces(void)
- 
- // Creates a PosixNetworkInterface for the interface whose IP address is
- // intfAddr and whose name is intfName and registers it with mDNS core.
--mDNSlocal int SetupOneInterface(mDNS *const m, struct sockaddr *intfAddr, struct sockaddr *intfMask, const char *intfName, int intfIndex)
-+mDNSlocal int SetupOneInterface(mDNS *const m, struct ifi_info *const ifi)
- {
-     int err = 0;
-     PosixNetworkInterface *intf;
-     PosixNetworkInterface *alias = NULL;
- 
-     assert(m != NULL);
--    assert(intfAddr != NULL);
--    assert(intfName != NULL);
--    assert(intfMask != NULL);
-+    assert(ifi != NULL);
- 
-     // Allocate the interface structure itself.
-     intf = (PosixNetworkInterface*)calloc(1, sizeof(*intf));
-@@ -907,26 +905,27 @@ mDNSlocal int SetupOneInterface(mDNS *const m, struct sockaddr *intfAddr, struct
-     // And make a copy of the intfName.
-     if (err == 0)
-     {
--        intf->intfName = strdup(intfName);
-+        intf->intfName = strdup(ifi->ifi_name);
-         if (intf->intfName == NULL) { assert(0); err = ENOMEM; }
-     }
- 
-     if (err == 0)
-     {
-         // Set up the fields required by the mDNS core.
--        SockAddrTomDNSAddr(intfAddr, &intf->coreIntf.ip, NULL);
--        SockAddrTomDNSAddr(intfMask, &intf->coreIntf.mask, NULL);
-+        SockAddrTomDNSAddr(ifi->ifi_addr, &intf->coreIntf.ip, NULL);
-+        SockAddrTomDNSAddr(ifi->ifi_netmask, &intf->coreIntf.mask, NULL);
- 
-         //LogMsg("SetupOneInterface: %#a %#a",  &intf->coreIntf.ip,  &intf->coreIntf.mask);
--        strncpy(intf->coreIntf.ifname, intfName, sizeof(intf->coreIntf.ifname));
-+        strncpy(intf->coreIntf.ifname, ifi->ifi_name, sizeof(intf->coreIntf.ifname));
-         intf->coreIntf.ifname[sizeof(intf->coreIntf.ifname)-1] = 0;
-         intf->coreIntf.Advertise = m->AdvertiseLocalAddresses;
-         intf->coreIntf.McastTxRx = mDNStrue;
-+        intf->coreIntf.Loopback = ((ifi->ifi_flags & IFF_LOOPBACK) != 0) ? mDNStrue : mDNSfalse;
- 
-         // Set up the extra fields in PosixNetworkInterface.
-         assert(intf->intfName != NULL);         // intf->intfName already set up above
--        intf->index                = intfIndex;
--        intf->sa_family            = intfAddr->sa_family;
-+        intf->index                = ifi->ifi_index;
-+        intf->sa_family            = ifi->ifi_addr->sa_family;
-         intf->multicastSocket4     = -1;
- #if HAVE_IPV6
-         intf->multicastSocket6     = -1;
-@@ -936,17 +935,17 @@ mDNSlocal int SetupOneInterface(mDNS *const m, struct sockaddr *intfAddr, struct
-         intf->coreIntf.InterfaceID = (mDNSInterfaceID)alias;
- 
-         if (alias != intf)
--            debugf("SetupOneInterface: %s %#a is an alias of %#a", intfName, &intf->coreIntf.ip, &alias->coreIntf.ip);
-+            debugf("SetupOneInterface: %s %#a is an alias of %#a", ifi->ifi_name, &intf->coreIntf.ip, &alias->coreIntf.ip);
-     }
- 
-     // Set up the multicast socket
-     if (err == 0)
-     {
--        if (alias->multicastSocket4 == -1 && intfAddr->sa_family == AF_INET)
--            err = SetupSocket(intfAddr, MulticastDNSPort, intf->index, &alias->multicastSocket4);
-+        if (alias->multicastSocket4 == -1 && ifi->ifi_addr->sa_family == AF_INET)
-+            err = SetupSocket(ifi->ifi_addr, MulticastDNSPort, intf->index, &alias->multicastSocket4);
- #if HAVE_IPV6
--        else if (alias->multicastSocket6 == -1 && intfAddr->sa_family == AF_INET6)
--            err = SetupSocket(intfAddr, MulticastDNSPort, intf->index, &alias->multicastSocket6);
-+        else if (alias->multicastSocket6 == -1 && ifi->ifi_addr->sa_family == AF_INET6)
-+            err = SetupSocket(ifi->ifi_addr, MulticastDNSPort, intf->index, &alias->multicastSocket6);
- #endif
-     }
- 
-@@ -973,8 +972,8 @@ mDNSlocal int SetupOneInterface(mDNS *const m, struct sockaddr *intfAddr, struct
-     }
-     else
-     {
--        // Use intfName instead of intf->intfName in the next line to avoid dereferencing NULL.
--        debugf("SetupOneInterface: %s %#a failed to register %d", intfName, &intf->coreIntf.ip, err);
-+        // Use ifi->ifi_name instead of intf->intfName in the next line to avoid dereferencing NULL.
-+        debugf("SetupOneInterface: %s %#a failed to register %d", ifi->ifi_name, &intf->coreIntf.ip, err);
-         if (intf) { FreePosixNetworkInterface(intf); intf = NULL; }
-     }
- 
-@@ -1023,7 +1022,7 @@ mDNSlocal int SetupInterfaceList(mDNS *const m)
-                 }
-                 else
-                 {
--                    if (SetupOneInterface(m, i->ifi_addr, i->ifi_netmask, i->ifi_name, i->ifi_index) == 0)
-+                    if (SetupOneInterface(m, i) == 0)
-                         if (i->ifi_addr->sa_family == AF_INET)
-                             foundav4 = mDNStrue;
-                 }
-@@ -1037,7 +1036,7 @@ mDNSlocal int SetupInterfaceList(mDNS *const m)
-         // In the interim, we skip loopback interface only if we found at least one v4 interface to use
-         // if ((m->HostInterfaces == NULL) && (firstLoopback != NULL))
-         if (!foundav4 && firstLoopback)
--            (void) SetupOneInterface(m, firstLoopback->ifi_addr, firstLoopback->ifi_netmask, firstLoopback->ifi_name, firstLoopback->ifi_index);
-+            (void) SetupOneInterface(m, firstLoopback);
-     }
- 
-     // Clean up.
--- 
-2.17.1
-
diff --git a/meta-networking/recipes-protocols/mdns/files/0011-Change-a-dynamic-allocation-to-file-scope-variable.patch b/meta-networking/recipes-protocols/mdns/files/0011-Change-a-dynamic-allocation-to-file-scope-variable.patch
index d64fb35db..d9adde04c 100644
--- a/meta-networking/recipes-protocols/mdns/files/0011-Change-a-dynamic-allocation-to-file-scope-variable.patch
+++ b/meta-networking/recipes-protocols/mdns/files/0011-Change-a-dynamic-allocation-to-file-scope-variable.patch
@@ -1,7 +1,7 @@
-From 19de26db69408f02241e232b39224589a0f630df Mon Sep 17 00:00:00 2001
+From 9ff06108cd44e84ba6c68bfa6737e793f117e303 Mon Sep 17 00:00:00 2001
 From: Nate Karstens <nate.karstens@garmin.com>
 Date: Thu, 10 Aug 2017 08:46:03 -0500
-Subject: [PATCH 11/11] Change a dynamic allocation to file-scope variable
+Subject: [PATCH] Change a dynamic allocation to file-scope variable
 
 Changes a variable from being dynamically-allocated to being
 statically-allocated at the file scope. Addresses a Coverity
@@ -11,14 +11,14 @@ Upstream-Status: Submitted [dts@apple.com]
 
 Signed-off-by: Nate Karstens <nate.karstens@garmin.com>
 ---
- mDNSPosix/mDNSPosix.c | 12 ++++--------
- 1 file changed, 4 insertions(+), 8 deletions(-)
+ mDNSPosix/mDNSPosix.c | 14 ++++----------
+ 1 file changed, 4 insertions(+), 10 deletions(-)
 
 diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
-index 84af26b..b7795ed 100644
+index 7aeee7b..2d25016 100755
 --- a/mDNSPosix/mDNSPosix.c
 +++ b/mDNSPosix/mDNSPosix.c
-@@ -91,6 +91,7 @@ static sigset_t gEventSignalSet;                // Signals which event loop list
+@@ -81,6 +81,7 @@ static sigset_t gEventSignalSet;                // Signals which event loop list
  static sigset_t gEventSignals;                  // Signals which were received while inside loop
  
  static PosixNetworkInterface *gRecentInterfaces;
@@ -26,13 +26,13 @@ index 84af26b..b7795ed 100644
  
  // ***************************************************************************
  // Globals (for debugging)
-@@ -1412,16 +1413,11 @@ cleanup:
+@@ -1641,18 +1642,11 @@ mDNSlocal void InterfaceChangeCallback(int fd, void *context)
  mDNSlocal mStatus WatchForInterfaceChange(mDNS *const m)
  {
      mStatus err;
 -    IfChangeRec *pChgRec;
  
--    pChgRec = (IfChangeRec*) mDNSPlatformMemAllocate(sizeof *pChgRec);
+-    pChgRec = (IfChangeRec*) mDNSPlatformMemAllocateClear(sizeof *pChgRec);
 -    if (pChgRec == NULL)
 -        return mStatus_NoMemoryErr;
 -
@@ -42,10 +42,12 @@ index 84af26b..b7795ed 100644
 +    err = OpenIfNotifySocket(&gChgRec.NotifySD);
      if (err == 0)
 -        err = mDNSPosixAddFDToEventLoop(pChgRec->NotifySD, InterfaceChangeCallback, pChgRec);
+-    if (err)
+-        mDNSPlatformMemFree(pChgRec);
 +        err = mDNSPosixAddFDToEventLoop(gChgRec.NotifySD, InterfaceChangeCallback, &gChgRec);
  
      return err;
  }
 -- 
-2.17.1
+2.20.1
 
diff --git a/meta-networking/recipes-protocols/mdns/files/build.patch b/meta-networking/recipes-protocols/mdns/files/build.patch
deleted file mode 100644
index 4ab9d23bf..000000000
--- a/meta-networking/recipes-protocols/mdns/files/build.patch
+++ /dev/null
@@ -1,167 +0,0 @@
-From 43b6e98c9c37afd0d914949dcff4eab81f5a995f Mon Sep 17 00:00:00 2001
-From: Brendan Le Foll <brendan.le.foll@intel.com>
-Date: Tue, 3 Mar 2015 11:42:57 +0000
-
-Upstream-Status: Inappropriate [OE-specific]
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-
----
- mDNSPosix/Makefile | 54 +++++++++++++++++++++++++-----------------------------
- 1 file changed, 25 insertions(+), 29 deletions(-)
-
-diff --git a/mDNSPosix/Makefile b/mDNSPosix/Makefile
-index 4f98e90..8ac97ad 100755
---- a/mDNSPosix/Makefile
-+++ b/mDNSPosix/Makefile
-@@ -50,6 +50,7 @@
- 
- LIBVERS = 1
- 
-+POSIXDIR = ../mDNSPosix
- COREDIR = ../mDNSCore
- SHAREDDIR ?= ../mDNSShared
- JDK = /usr/jdk
-@@ -58,11 +59,11 @@ CC = @cc
- BISON = @bison
- FLEX = @flex
- ST = @strip
--LD = ld -shared
-+LD =@LD
- CP = cp
- RM = rm
- LN = ln -s -f
--CFLAGS_COMMON = -I$(COREDIR) -I$(SHAREDDIR) -I$(OBJDIR) -fwrapv -W -Wall -DPID_FILE=\"/var/run/mdnsd.pid\" -DMDNS_UDS_SERVERPATH=\"/var/run/mdnsd\"
-+CFLAGS_COMMON = -I$(POSIXDIR) -I$(COREDIR) -I$(SHAREDDIR) -I$(OBJDIR) -fwrapv -W -Wall -DPID_FILE=\"/var/run/mdnsd.pid\" -DMDNS_UDS_SERVERPATH=\"/var/run/mdnsd\"
- CFLAGS_PTHREAD =
- LINKOPTS =
- LINKOPTS_PTHREAD = -lpthread
-@@ -70,7 +71,7 @@ LDSUFFIX = so
- JAVACFLAGS_OS = -fPIC -shared -ldns_sd
- 
- # Set up diverging paths for debug vs. prod builds
--DEBUG=0
-+DEBUG?=1
- ifeq ($(DEBUG),1)
- CFLAGS_DEBUG = -g -DMDNS_DEBUGMSGS=2
- OBJDIR = objects/debug
-@@ -213,7 +214,7 @@ endif
- endif
- endif
- 
--CFLAGS = $(CFLAGS_COMMON) $(CFLAGS_OS) $(CFLAGS_DEBUG)
-+CFLAGS_BUILD = $(CFLAGS) $(CFLAGS_COMMON) $(CFLAGS_OS) $(CFLAGS_DEBUG)
- 
- #############################################################################
- 
-@@ -249,8 +250,7 @@ Daemon: setup $(BUILDDIR)/mdnsd
- 	@echo "Responder daemon done"
- 
- $(BUILDDIR)/mdnsd: $(DAEMONOBJS)
--	$(CC) -o $@ $+ $(LINKOPTS)
--	@$(STRIP) $@
-+	$(CC) -o $@ $+
- 
- # libdns_sd target builds the client library
- libdns_sd: setup $(BUILDDIR)/libdns_sd.$(LDSUFFIX)
-@@ -259,22 +259,18 @@ libdns_sd: setup $(BUILDDIR)/libdns_sd.$(LDSUFFIX)
- CLIENTLIBOBJS = $(OBJDIR)/dnssd_clientlib.c.so.o $(OBJDIR)/dnssd_clientstub.c.so.o $(OBJDIR)/dnssd_ipc.c.so.o
- 
- $(BUILDDIR)/libdns_sd.$(LDSUFFIX): $(CLIENTLIBOBJS)
--	@$(LD) $(LINKOPTS) -o $@ $+
--	@$(STRIP) $@
-+	$(LD) -shared $(LINKOPTS) -Wl,-soname,libdns_sd.$(LDSUFFIX).1 -o $@ $+
- 
--Clients: setup libdns_sd ../Clients/build/dns-sd
-+Clients: setup libdns_sd
-+	@$(MAKE) -C ../Clients DEBUG=${DEBUG}
- 	@echo "Clients done"
- 
--../Clients/build/dns-sd:
--	@$(MAKE) -C ../Clients
--
- # nss_mdns target builds the Name Service Switch module
- nss_mdns: setup $(BUILDDIR)/$(NSSLIBFILE)
- 	@echo "Name Service Switch module done"
- 
- $(BUILDDIR)/$(NSSLIBFILE): $(CLIENTLIBOBJS) $(OBJDIR)/nss_mdns.c.so.o
--	@$(LD) $(LINKOPTS) -o $@ $+
--	@$(STRIP) $@
-+	$(LD) -shared $(LINKOPTS) -o $@ $+
- 
- #############################################################################
- 
-@@ -470,55 +466,55 @@ dnsextd: setup $(BUILDDIR)/dnsextd
- 	@echo "dnsextd done"
- 
- $(BUILDDIR)/mDNSClientPosix:         $(APPOBJ)     $(OBJDIR)/Client.c.o
--	$(CC) $+ -o $@ $(LINKOPTS)
-+	$(CC) $+ -o $@
- 
- $(BUILDDIR)/mDNSResponderPosix:      $(COMMONOBJ)  $(OBJDIR)/Responder.c.o
--	$(CC) $+ -o $@ $(LINKOPTS)
-+	$(CC) $+ -o $@
- 
- $(BUILDDIR)/mDNSProxyResponderPosix: $(COMMONOBJ)  $(OBJDIR)/ProxyResponder.c.o
--	$(CC) $+ -o $@ $(LINKOPTS)
-+	$(CC) $+ -o $@
- 
- $(BUILDDIR)/mDNSIdentify:            $(SPECIALOBJ) $(OBJDIR)/Identify.c.o
--	$(CC) $+ -o $@ $(LINKOPTS)
-+	$(CC) $+ -o $@
- 
- $(OBJDIR)/Identify.c.o:              $(COREDIR)/mDNS.c # Note: Identify.c textually imports mDNS.c
- 
- $(BUILDDIR)/mDNSNetMonitor:          $(SPECIALOBJ) $(OBJDIR)/NetMonitor.c.o
--	$(CC) $+ -o $@ $(LINKOPTS)
-+	$(CC) $+ -o $@
- 
- $(OBJDIR)/NetMonitor.c.o:            $(COREDIR)/mDNS.c # Note: NetMonitor.c textually imports mDNS.c
- 
- $(BUILDDIR)/dnsextd:                 $(DNSEXTDOBJ) $(OBJDIR)/dnsextd.c.threadsafe.o
--	$(CC) $+ -o $@ $(LINKOPTS) $(LINKOPTS_PTHREAD)
-+	$(CC) $+ -o $@ $(LINKOPTS_PTHREAD)
- 
- #############################################################################
- 
- # Implicit rules
- $(OBJDIR)/%.c.o:	%.c
--	$(CC) $(CFLAGS) -c -o $@ $<
-+	$(CC) $(CFLAGS_BUILD) -c -o $@ $<
- 
- $(OBJDIR)/%.c.o:	$(COREDIR)/%.c
--	$(CC) $(CFLAGS) -c -o $@ $<
-+	$(CC) $(CFLAGS_BUILD) -c -o $@ $<
- 
- $(OBJDIR)/%.c.o:	$(SHAREDDIR)/%.c
--	$(CC) $(CFLAGS) -c -o $@ $<
-+	$(CC) $(CFLAGS_BUILD) -c -o $@ $<
- 
- $(OBJDIR)/%.c.threadsafe.o:	%.c
--	$(CC) $(CFLAGS) $(CFLAGS_PTHREAD) -D_REENTRANT -c -o $@ $<
-+	$(CC) $(CFLAGS_BUILD) $(CFLAGS_PTHREAD) -D_REENTRANT -c -o $@ $<
- 
- $(OBJDIR)/%.c.threadsafe.o:	$(SHAREDDIR)/%.c
--	$(CC) $(CFLAGS) $(CFLAGS_PTHREAD) -D_REENTRANT -c -o $@ $<
-+	$(CC) $(CFLAGS_BUILD) $(CFLAGS_PTHREAD) -D_REENTRANT -c -o $@ $<
- 
- $(OBJDIR)/%.c.so.o:	%.c
--	$(CC) $(CFLAGS) -c -fPIC -o $@ $<
-+	$(CC) $(CFLAGS_BUILD) -c -fPIC -o $@ $<
- 
- $(OBJDIR)/%.c.so.o:	$(SHAREDDIR)/%.c
--	$(CC) $(CFLAGS) -c -fPIC -o $@ $<
-+	$(CC) $(CFLAGS_BUILD) -c -fPIC -o $@ $<
- 
- $(OBJDIR)/%.y.o: $(SHAREDDIR)/%.y
- 	$(BISON)              -o $(OBJDIR)/$*.c -d $<
--	$(CC) $(CFLAGS) -c -o $@ $(OBJDIR)/$*.c
-+	$(CC) $(CFLAGS_BUILD) -c -o $@ $(OBJDIR)/$*.c
- 
- $(OBJDIR)/%.l.o: $(SHAREDDIR)/%.l
- 	$(FLEX) $(FLEXFLAGS_OS) -i             -o$(OBJDIR)/$*.l.c $<
--	$(CC) $(CFLAGS) -Wno-error -c -o $@ $(OBJDIR)/$*.l.c
-+	$(CC) $(CFLAGS_BUILD) -Wno-error -c -o $@ $(OBJDIR)/$*.l.c
--- 
-2.9.5
-
diff --git a/meta-networking/recipes-protocols/mdns/mdns_878.270.2.bb b/meta-networking/recipes-protocols/mdns/mdns_1096.40.7.bb
similarity index 91%
rename from meta-networking/recipes-protocols/mdns/mdns_878.270.2.bb
rename to meta-networking/recipes-protocols/mdns/mdns_1096.40.7.bb
index 0f8dc92df..88521c1b2 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_878.270.2.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_1096.40.7.bb
@@ -9,22 +9,21 @@ COMPATIBLE_HOST_libc-musl = 'null'
 RPROVIDES_${PN} += "libdns_sd.so"
 
 SRC_URI = "https://opensource.apple.com/tarballs/mDNSResponder/mDNSResponder-${PV}.tar.gz \
-           file://build.patch;patchdir=.. \
            file://mdns.service \
+           file://0001-mdns-include-stddef.h-for-NULL.patch;patchdir=.. \
+           file://0002-mdns-cross-compilation-fixes-for-bitbake.patch;patchdir=.. \
            file://0001-Create-subroutine-for-cleaning-recent-interfaces.patch;patchdir=.. \
            file://0002-Create-subroutine-for-tearing-down-an-interface.patch;patchdir=.. \
            file://0003-Track-interface-socket-family.patch;patchdir=.. \
            file://0004-Use-list-for-changed-interfaces.patch;patchdir=.. \
-           file://0005-Handle-noisy-netlink-sockets.patch;patchdir=.. \
            file://0006-Remove-unneeded-function.patch;patchdir=.. \
-           file://0007-Indicate-loopback-interface-to-mDNS-core.patch;patchdir=.. \
            file://0008-Mark-deleted-interfaces-as-being-changed.patch;patchdir=.. \
            file://0009-Fix-possible-NULL-dereference.patch;patchdir=.. \
            file://0010-Handle-errors-from-socket-calls.patch;patchdir=.. \
            file://0011-Change-a-dynamic-allocation-to-file-scope-variable.patch;patchdir=.. \
            "
-SRC_URI[md5sum] = "4e139a8e1133349006b0436291c9e29b"
-SRC_URI[sha256sum] = "2cef0ee9900504c5277fb81de0a28e6c0835fe482ebecf1067c6864f5c4eda74"
+SRC_URI[md5sum] = "ac766013bbcb323e9db4c80805b2552a"
+SRC_URI[sha256sum] = "b86f4816b4145915198e7c5bf0bc56dbbfd960e9a4518bb6486baa40cdcca7e6"
 
 PARALLEL_MAKE = ""
 
-- 
2.20.1

