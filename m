Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14B90C4332F
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 21:37:34 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.2738.1670535443503441048
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Dec 2022 13:37:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ewUriTcn;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id h10so3277296wrx.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Dec 2022 13:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SW/WiR8C0ICqK2wcUTzOzm1uOz1f7PUczk8DXPvWwGc=;
        b=ewUriTcn7bAhi8Rx7Tb/n4bxpsGpPi1tSn7nzYjh3YUCk1huFEzdgKaN/hm8GT8eyR
         MMbanHAadPIHo6F/L0oURP1hwPh9It57CyqxKBunIwSxaE0NLIQqUX0+fKWMP19YykN7
         9Pcpyjf0KixxDV2Yoeq95NgxqeIr2C9kUZcv/YjJe8LFOpnKfnTiHLlwjfHI7JZrOhy3
         1ekncMkVYlmh1qWxCPYFFQF7izuloMTqrLrk+JNj3m+aeTuD/yTvGugJeNLVtxaVGU49
         t+U2auAdhRodohigS/aglUemS+gA64Nl0mJ2ugcyjXd9kGkJeO0eRWMfCzsCKh65T9SQ
         gDxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SW/WiR8C0ICqK2wcUTzOzm1uOz1f7PUczk8DXPvWwGc=;
        b=QhscpTWYAJgXuhmprmo1vmpOCOulXr8x0BHU4UFViFfOOzP5p1Hh05KyAuaPrLg7uA
         FWQTFIEm2U8KGGgz4Zx3oOU+c6KKEnpiBLfLfkrZ/aFaj7DTY02RsoIb+AekvKscqjCu
         XI0yCP+Mbw/RvZK/GpbsRxTOzLGan6N/paDQjUfO2jb41T0MD4BEjvQ8IFV87MDn52LV
         Rf1aMTfeKNRkxZTJSUOAe34oG+Yj/qUdAr75DAiMAIrZv4RKRDfwVvxHlWPdRK34rcOU
         23sbXZxF9uNi09JwHb2eJkmdKWZeJAVuyAvwctElgtVFgSsNaK9fY0LFm1sOMJdft7pB
         XFHQ==
X-Gm-Message-State: ANoB5pmwujE6Wv2WsUFF0nxFg0wI6f5nOpe9VKQFk0ywRQ06b1BHAwwC
	cGQrGVIP5PsshoskQ7y47JHv6Jh7IVs=
X-Google-Smtp-Source: AA0mqf7rG+PLKy7KWzaUOmzUwn3jpXbDDHg1L7xzEweFOlszIZiph6bM1w674zpRwFEXMI9I+aaVoQ==
X-Received: by 2002:adf:f24c:0:b0:242:133f:e68e with SMTP id b12-20020adff24c000000b00242133fe68emr2316233wrp.40.1670535440360;
        Thu, 08 Dec 2022 13:37:20 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id u18-20020adfed52000000b00241d2df4960sm22924578wro.17.2022.12.08.13.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 13:37:19 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-networking][PATCH] mdns: Upgrade 1310.140.1 -> 1790.40.31
Date: Thu,  8 Dec 2022 21:33:41 +0000
Message-Id: <20221208213341.14940-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Dec 2022 21:37:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99999

Reinstate and rework patches from @garmin.com dropped in 21afab4609d0
("mdns: update to version 1096.40.7") as these were the functional
pieces of this series; we should either maintain it as a whole or drop
it in its entirety. With this update and without this series,
steady-state operation is a constant churn of all names being removed
and re-added every few seconds. These were refactored to handle the move
to getifaddrs() from get_ifi_info().

Check and cleanup all the other patches, much of which was redundant.

Move source releases to github which is where the Apple site now
redirects to (though these are still effectively just tarball dumps into
git).

Cleanup the recipe so it doesn't override all the packaging defaults.

Fixup musl installs so they don't fail attempting to patch a
non-existent /etc/nsswitch.conf.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../0001-dns-sd-Include-missing-headers.patch |  41 ---
 .../0001-mdns-include-stddef.h-for-NULL.patch |  40 ---
 ...-cross-compilation-fixes-for-bitbake.patch | 145 ----------
 .../files/0006-Remove-unneeded-function.patch |  51 ----
 .../0009-Fix-possible-NULL-dereference.patch  |  45 ----
 ...ic-allocation-to-file-scope-variable.patch |  53 ----
 ...utine-for-cleaning-recent-interfaces.patch |  26 +-
 .../0001-dns-sd-Include-missing-headers.patch |  30 +++
 ...outine-for-tearing-down-an-interface.patch |  15 +-
 ...ke-Set-libdns_sd.so-soname-correctly.patch |  27 ++
 .../0003-Track-interface-socket-family.patch  |  15 +-
 ...rop-MacOS-specific-__block-qualifier.patch |  30 +++
 ...cate-loopback-interface-to-mDNS-core.patch |  58 ++++
 ...-Separate-TLS-targets-from-libraries.patch |  64 +++++
 ...005-Use-list-for-changed-interfaces.patch} |  48 ++--
 ...-mDNSCore-Fix-broken-debug-parameter.patch |  26 ++
 .../0006-Handle-noisy-netlink-sockets.patch   | 252 ++++++++++++++++++
 .../0006-make-Add-top-level-Makefile.patch    |  25 ++
 ...deleted-interfaces-as-being-changed.patch} |  11 +-
 ...008-Handle-errors-from-socket-calls.patch} |  17 +-
 .../mdns/{files => mdns}/mdns.service         |   0
 .../recipes-protocols/mdns/mdns_1310.140.1.bb | 115 --------
 .../recipes-protocols/mdns/mdns_1790.40.31.bb | 130 +++++++++
 23 files changed, 707 insertions(+), 557 deletions(-)
 delete mode 100644 meta-networking/recipes-protocols/mdns/files/0001-dns-sd-Include-missing-headers.patch
 delete mode 100644 meta-networking/recipes-protocols/mdns/files/0001-mdns-include-stddef.h-for-NULL.patch
 delete mode 100644 meta-networking/recipes-protocols/mdns/files/0002-mdns-cross-compilation-fixes-for-bitbake.patch
 delete mode 100644 meta-networking/recipes-protocols/mdns/files/0006-Remove-unneeded-function.patch
 delete mode 100644 meta-networking/recipes-protocols/mdns/files/0009-Fix-possible-NULL-dereference.patch
 delete mode 100644 meta-networking/recipes-protocols/mdns/files/0011-Change-a-dynamic-allocation-to-file-scope-variable.patch
 rename meta-networking/recipes-protocols/mdns/{files => mdns}/0001-Create-subroutine-for-cleaning-recent-interfaces.patch (76%)
 create mode 100644 meta-networking/recipes-protocols/mdns/mdns/0001-dns-sd-Include-missing-headers.patch
 rename meta-networking/recipes-protocols/mdns/{files => mdns}/0002-Create-subroutine-for-tearing-down-an-interface.patch (78%)
 create mode 100644 meta-networking/recipes-protocols/mdns/mdns/0002-make-Set-libdns_sd.so-soname-correctly.patch
 rename meta-networking/recipes-protocols/mdns/{files => mdns}/0003-Track-interface-socket-family.patch (76%)
 create mode 100644 meta-networking/recipes-protocols/mdns/mdns/0003-mDNSShared-Drop-MacOS-specific-__block-qualifier.patch
 create mode 100644 meta-networking/recipes-protocols/mdns/mdns/0004-Indicate-loopback-interface-to-mDNS-core.patch
 create mode 100644 meta-networking/recipes-protocols/mdns/mdns/0004-make-Separate-TLS-targets-from-libraries.patch
 rename meta-networking/recipes-protocols/mdns/{files/0004-Use-list-for-changed-interfaces.patch => mdns/0005-Use-list-for-changed-interfaces.patch} (82%)
 create mode 100644 meta-networking/recipes-protocols/mdns/mdns/0005-mDNSCore-Fix-broken-debug-parameter.patch
 create mode 100644 meta-networking/recipes-protocols/mdns/mdns/0006-Handle-noisy-netlink-sockets.patch
 create mode 100644 meta-networking/recipes-protocols/mdns/mdns/0006-make-Add-top-level-Makefile.patch
 rename meta-networking/recipes-protocols/mdns/{files/0008-Mark-deleted-interfaces-as-being-changed.patch => mdns/0007-Mark-deleted-interfaces-as-being-changed.patch} (83%)
 rename meta-networking/recipes-protocols/mdns/{files/0010-Handle-errors-from-socket-calls.patch => mdns/0008-Handle-errors-from-socket-calls.patch} (81%)
 rename meta-networking/recipes-protocols/mdns/{files => mdns}/mdns.service (100%)
 delete mode 100644 meta-networking/recipes-protocols/mdns/mdns_1310.140.1.bb
 create mode 100644 meta-networking/recipes-protocols/mdns/mdns_1790.40.31.bb

diff --git a/meta-networking/recipes-protocols/mdns/files/0001-dns-sd-Include-missing-headers.patch b/meta-networking/recipes-protocols/mdns/files/0001-dns-sd-Include-missing-headers.patch
deleted file mode 100644
index c743b3eddb7e..000000000000
--- a/meta-networking/recipes-protocols/mdns/files/0001-dns-sd-Include-missing-headers.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From ea442b57f7a9bcd41d5b5bd1cafde4dbe5685d41 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 4 Nov 2021 07:31:32 -0700
-Subject: [PATCH] dns-sd: Include missing headers
-
-Fixes build on Musl
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Clients/dns-sd.c | 2 ++
- 1 file changed, 2 insertions(+)
-
---- a/Clients/dns-sd.c
-+++ b/Clients/dns-sd.c
-@@ -58,11 +58,13 @@
- //#define TEST_NEW_CLIENTSTUB 1
- 
- #include <ctype.h>
-+#include <stdarg.h>          // For va_args
- #include <stdio.h>          // For stdout, stderr
- #include <stdlib.h>         // For exit()
- #include <string.h>         // For strlen(), strcpy()
- #include <errno.h>          // For errno, EINTR
- #include <time.h>
-+#include <sys/param.h>      // For MIN
- #include <sys/types.h>      // For u_char
- #ifdef APPLE_OSX_mDNSResponder
- #include <inttypes.h>       // For PRId64
---- a/mDNSPosix/nss_mdns.c
-+++ b/mDNSPosix/nss_mdns.c
-@@ -89,6 +89,9 @@
- 
- #include <dns_sd.h>
- 
-+#if !defined(NETDB_INTERNAL)
-+#  define NETDB_INTERNAL (-1)
-+#endif
- 
- //----------
- // Public functions
diff --git a/meta-networking/recipes-protocols/mdns/files/0001-mdns-include-stddef.h-for-NULL.patch b/meta-networking/recipes-protocols/mdns/files/0001-mdns-include-stddef.h-for-NULL.patch
deleted file mode 100644
index c57ce8fa538f..000000000000
--- a/meta-networking/recipes-protocols/mdns/files/0001-mdns-include-stddef.h-for-NULL.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From d744609c56f9872e5aa71707f1f71feec9867f51 Mon Sep 17 00:00:00 2001
-From: Mikko Rapeli <mikko.rapeli@bmw.de>
-Date: Tue, 14 Jul 2020 16:36:29 +0000
-Subject: [PATCH 1/2] mdns: include <stddef.h> for NULL
-
-Fixes build error with version 1096.40.7:
-
-../mDNSCore/mDNS.c:11385:26: error: 'NULL' undeclared (first use in this function)
-11385 |     const char *reason = NULL;
-      |                          ^~~~
-../mDNSCore/mDNS.c:56:1: note: 'NULL' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
-   55 | #include "dns_sd_internal.h"
-  +++ |+#include <stddef.h>
-   56 |
-../mDNSCore/mDNS.c:11385:26: note: each undeclared identifier is reported only once for each function it appears in
-11385 |     const char *reason = NULL;
-      |                          ^~~~
-
-Upstream-Status: Pending
-
-Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
----
- mDNSCore/mDNS.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/mDNSCore/mDNS.c b/mDNSCore/mDNS.c
-index 2fbea04..d4b9af5 100755
---- a/mDNSCore/mDNS.c
-+++ b/mDNSCore/mDNS.c
-@@ -23,6 +23,7 @@
-  * routines, or types (which may or may not be present on any given platform).
-  */
- 
-+#include <stddef.h> /* for NULL */
- #include "DNSCommon.h"                  // Defines general DNS utility routines
- #include "uDNS.h"                       // Defines entry points into unicast-specific routines
-
--- 
-2.20.1
-
diff --git a/meta-networking/recipes-protocols/mdns/files/0002-mdns-cross-compilation-fixes-for-bitbake.patch b/meta-networking/recipes-protocols/mdns/files/0002-mdns-cross-compilation-fixes-for-bitbake.patch
deleted file mode 100644
index 33590ffc57b7..000000000000
--- a/meta-networking/recipes-protocols/mdns/files/0002-mdns-cross-compilation-fixes-for-bitbake.patch
+++ /dev/null
@@ -1,145 +0,0 @@
-From 72405143f9d16514e70b88bc4843c9634b88036a Mon Sep 17 00:00:00 2001
-From: Brendan Le Foll <brendan.le.foll@intel.com>
-Date: Tue, 3 Mar 2015 11:42:57 +0000
-Subject: [PATCH 2/2] mdns: cross compilation fixes for bitbake
-
-Fixes several build errors when incorrect compiler or
-compiler flags are used.
-
-Upstream-Status: Inappropriate [OE-specific]
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
----
- mDNSPosix/Makefile | 44 ++++++++++++++++++++------------------------
- 1 file changed, 20 insertions(+), 24 deletions(-)
-
-diff --git a/mDNSPosix/Makefile b/mDNSPosix/Makefile
-index 78222e0..18a3af5 100755
---- a/mDNSPosix/Makefile
-+++ b/mDNSPosix/Makefile
-@@ -50,6 +50,7 @@
- 
- LIBVERS = 1
- 
-+POSIXDIR = ../mDNSPosix
- COREDIR = ../mDNSCore
- SHAREDDIR ?= ../mDNSShared
- DSODIR ?= ../DSO
-@@ -62,16 +63,16 @@ else ifeq ($(SYSTEM), Linux)
-   os=linux
- endif
- 
--CC = cc
--BISON = bison
--FLEX = flex
--ST = strip
--LD = ld
-+CC ?= cc
-+BISON ?= bison
-+FLEX ?= flex
-+ST ?= strip
-+LD ?= ld
- SOOPTS = -shared
- CP = cp
- RM = rm
- LN = ln -s -f
--CFLAGS_COMMON = -I$(COREDIR) -I$(SHAREDDIR) -I$(DSODIR) -I$(PROXYDIR) -I$(OBJDIR) -fwrapv -W -Wall -DPID_FILE=\"/var/run/mdnsd.pid\" -DMDNS_UDS_SERVERPATH=\"/var/run/mdnsd\"
-+CFLAGS_COMMON = -I$(POSIXDIR) -I$(COREDIR) -I$(SHAREDDIR) -I$(DSODIR) -I$(PROXYDIR) -I$(OBJDIR) -fwrapv -W -Wall -DPID_FILE=\"/var/run/mdnsd.pid\" -DMDNS_UDS_SERVERPATH=\"/var/run/mdnsd\"
- CFLAGS_PTHREAD =
- LINKOPTS =
- LINKOPTS_PTHREAD = -lpthread
-@@ -85,6 +86,7 @@ CFLAGS_OPEN_SOURCE=
- endif
- 
- # Set up diverging paths for debug vs. prod builds
-+DEBUG ?= 1
- ifeq "$(DEBUG)" "1"
- CFLAGS_DEBUGGING = -g -DMDNS_DEBUGMSGS=2
- OBJDIR = objects/debug
-@@ -101,8 +103,8 @@ else
- # 1. We want to make small binaries, suitable for putting into hardware devices
- # 2. Some of the code analysis warnings only work when some form of optimization is enabled
- CFLAGS_DEBUGGING = -g -DMDNS_DEBUGMSGS=0
--OBJDIR ?= objects/prod
--BUILDDIR ?= build/prod
-+OBJDIR = objects/prod
-+BUILDDIR = build/prod
- STRIP = $(ST) -S
- endif
- endif
-@@ -125,7 +127,7 @@ else
- # any target that contains the string "linux"
- ifeq ($(findstring linux,$(os)),linux)
- CFLAGS_OS = -D_GNU_SOURCE -DHAVE_IPV6 -DNOT_HAVE_SA_LEN -DUSES_NETLINK -DHAVE_LINUX -DTARGET_OS_LINUX -ftabstop=4
--LD = $(CC)
-+LD ?= $(CC)
- SOOPTS = -shared
- FLEXFLAGS_OS = -l
- JAVACFLAGS_OS += -I$(JDK)/include/linux
-@@ -276,8 +278,7 @@ Daemon: setup $(BUILDDIR)/mdnsd
- 	@echo "Responder daemon done"
- 
- $(BUILDDIR)/mdnsd: $(DAEMONOBJS)
--	$(CC) -o $@ $+ $(LINKOPTS)
--	$(STRIP) $@
-+	$(LD) -o $@ $+
- 
- # libdns_sd target builds the client library
- libdns_sd: setup $(BUILDDIR)/libdns_sd.$(LDSUFFIX)
-@@ -286,13 +287,9 @@ libdns_sd: setup $(BUILDDIR)/libdns_sd.$(LDSUFFIX)
- CLIENTLIBOBJS = $(OBJDIR)/dnssd_clientlib.c.so.o $(OBJDIR)/dnssd_clientstub.c.so.o $(OBJDIR)/dnssd_ipc.c.so.o
- 
- $(BUILDDIR)/libdns_sd.$(LDSUFFIX): $(CLIENTLIBOBJS)
--	$(LD) $(SOOPTS) $(LINKOPTS) -o $@ $+
--	$(STRIP) $@
--
--Clients: setup libdns_sd ../Clients/build/dns-sd
--	@echo "Clients done"
-+	$(LD) -shared $(LINKOPTS) -Wl,-soname,libdns_sd.$(LDSUFFIX).1 -o $@ $+
- 
--../Clients/build/dns-sd: ../Clients/dns-sd.c
-+Clients: setup libdns_sd
- 	$(MAKE) -C ../Clients DEBUG=$(DEBUG) SUPMAKE_CFLAGS="$(MDNSCFLAGS)"
- 
- # nss_mdns target builds the Name Service Switch module
-@@ -300,8 +297,7 @@ nss_mdns: setup $(BUILDDIR)/$(NSSLIBFILE)
- 	@echo "Name Service Switch module done"
- 
- $(BUILDDIR)/$(NSSLIBFILE): $(CLIENTLIBOBJS) $(OBJDIR)/nss_mdns.c.so.o
--	$(LD) $(SOOPTS) $(LINKOPTS) -o $@ $+
--	$(STRIP) $@
-+	$(LD) -shared $(LINKOPTS) -o $@ $+
- 
- #############################################################################
- 
-@@ -494,21 +490,21 @@ dnsextd: setup $(BUILDDIR)/dnsextd
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
--- 
-2.20.1
-
diff --git a/meta-networking/recipes-protocols/mdns/files/0006-Remove-unneeded-function.patch b/meta-networking/recipes-protocols/mdns/files/0006-Remove-unneeded-function.patch
deleted file mode 100644
index b461a60df7bc..000000000000
--- a/meta-networking/recipes-protocols/mdns/files/0006-Remove-unneeded-function.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 157d67f152777754c059ced7511352102f23ffae Mon Sep 17 00:00:00 2001
-From: Nate Karstens <nate.karstens@garmin.com>
-Date: Mon, 24 Jul 2017 09:39:18 -0500
-Subject: [PATCH 06/11] Remove unneeded function
-
-Removes a function we no longer need by integrating it into the only
-function that calls it. This was originally separated so that we could
-only process network interfaces that netlink indicated had been changed,
-this has since been extended to test for all network intefaces.
-
-Upstream-Status: Submitted [dts@apple.com]
-
-Signed-off-by: Nate Karstens <nate.karstens@garmin.com>
----
- mDNSPosix/mDNSPosix.c | 13 ++-----------
- 1 file changed, 2 insertions(+), 11 deletions(-)
-
-diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
-index 59a8b8c..3fc5451 100644
---- a/mDNSPosix/mDNSPosix.c
-+++ b/mDNSPosix/mDNSPosix.c
-@@ -1079,24 +1079,15 @@ mDNSlocal mStatus OpenIfNotifySocket(int *pFD)
-     return err;
- }
- 
--mDNSlocal mDNSBool ListContainsInterfaceIndex(GenLinkedList *list, int if_index)
-+mDNSlocal void AddInterfaceIndexToList(GenLinkedList *list, int if_index)
- {
-     NetworkInterfaceIndex *item;
- 
-     for (item = (NetworkInterfaceIndex*)list->Head; item != NULL; item = item->Next)
-     {
--        if (if_index == item->if_index) return mDNStrue;
-+        if (if_index == item->if_index) return;
-     }
- 
--    return mDNSfalse;
--}
--
--mDNSlocal void AddInterfaceIndexToList(GenLinkedList *list, int if_index)
--{
--    NetworkInterfaceIndex *item;
--
--    if (ListContainsInterfaceIndex(list, if_index)) return;
--
-     item = malloc(sizeof *item);
-     if (item == NULL) return;
- 
--- 
-2.17.1
-
diff --git a/meta-networking/recipes-protocols/mdns/files/0009-Fix-possible-NULL-dereference.patch b/meta-networking/recipes-protocols/mdns/files/0009-Fix-possible-NULL-dereference.patch
deleted file mode 100644
index 362d69768ec7..000000000000
--- a/meta-networking/recipes-protocols/mdns/files/0009-Fix-possible-NULL-dereference.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 38cff19781f81586926b02f0fd1cb36c040395e0 Mon Sep 17 00:00:00 2001
-From: Nate Karstens <nate.karstens@garmin.com>
-Date: Thu, 10 Aug 2017 08:21:53 -0500
-Subject: [PATCH 09/11] Fix possible NULL dereference
-
-Fixes a possible NULL dereference if memory for
-the PosixNetworkInterface could not be allocated.
-Other logic seems to prevent dereferencing this
-variable if NULL, but this instance seems to have
-been overlooked.
-
-Upstream-Status: Submitted [dts@apple.com]
-
-Signed-off-by: Nate Karstens <nate.karstens@garmin.com>
----
- mDNSPosix/mDNSPosix.c | 11 +++++++----
- 1 file changed, 7 insertions(+), 4 deletions(-)
-
-diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
-index a8a57df..3243ed4 100644
---- a/mDNSPosix/mDNSPosix.c
-+++ b/mDNSPosix/mDNSPosix.c
-@@ -951,12 +951,15 @@ mDNSlocal int SetupOneInterface(mDNS *const m, struct ifi_info *const ifi)
- 
-     // If interface is a direct link, address record will be marked as kDNSRecordTypeKnownUnique
-     // and skip the probe phase of the probe/announce packet sequence.
--    intf->coreIntf.DirectLink = mDNSfalse;
-+    if (err == 0)
-+    {
-+        intf->coreIntf.DirectLink = mDNSfalse;
- #ifdef DIRECTLINK_INTERFACE_NAME
--    if (strcmp(intfName, STRINGIFY(DIRECTLINK_INTERFACE_NAME)) == 0)
--        intf->coreIntf.DirectLink = mDNStrue;
-+        if (strcmp(intfName, STRINGIFY(DIRECTLINK_INTERFACE_NAME)) == 0)
-+            intf->coreIntf.DirectLink = mDNStrue;
- #endif
--    intf->coreIntf.SupportsUnicastMDNSResponse = mDNStrue;
-+        intf->coreIntf.SupportsUnicastMDNSResponse = mDNStrue;
-+    }
- 
-     // The interface is all ready to go, let's register it with the mDNS core.
-     if (err == 0)
--- 
-2.17.1
-
diff --git a/meta-networking/recipes-protocols/mdns/files/0011-Change-a-dynamic-allocation-to-file-scope-variable.patch b/meta-networking/recipes-protocols/mdns/files/0011-Change-a-dynamic-allocation-to-file-scope-variable.patch
deleted file mode 100644
index d9adde04c223..000000000000
--- a/meta-networking/recipes-protocols/mdns/files/0011-Change-a-dynamic-allocation-to-file-scope-variable.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 9ff06108cd44e84ba6c68bfa6737e793f117e303 Mon Sep 17 00:00:00 2001
-From: Nate Karstens <nate.karstens@garmin.com>
-Date: Thu, 10 Aug 2017 08:46:03 -0500
-Subject: [PATCH] Change a dynamic allocation to file-scope variable
-
-Changes a variable from being dynamically-allocated to being
-statically-allocated at the file scope. Addresses a Coverity
-issue where it appeared that the memory was being leaked.
-
-Upstream-Status: Submitted [dts@apple.com]
-
-Signed-off-by: Nate Karstens <nate.karstens@garmin.com>
----
- mDNSPosix/mDNSPosix.c | 14 ++++----------
- 1 file changed, 4 insertions(+), 10 deletions(-)
-
-diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
-index 7aeee7b..2d25016 100755
---- a/mDNSPosix/mDNSPosix.c
-+++ b/mDNSPosix/mDNSPosix.c
-@@ -81,6 +81,7 @@ static sigset_t gEventSignalSet;                // Signals which event loop list
- static sigset_t gEventSignals;                  // Signals which were received while inside loop
- 
- static PosixNetworkInterface *gRecentInterfaces;
-+static IfChangeRec gChgRec;
- 
- // ***************************************************************************
- // Globals (for debugging)
-@@ -1641,18 +1642,11 @@ mDNSlocal void InterfaceChangeCallback(int fd, void *context)
- mDNSlocal mStatus WatchForInterfaceChange(mDNS *const m)
- {
-     mStatus err;
--    IfChangeRec *pChgRec;
- 
--    pChgRec = (IfChangeRec*) mDNSPlatformMemAllocateClear(sizeof *pChgRec);
--    if (pChgRec == NULL)
--        return mStatus_NoMemoryErr;
--
--    pChgRec->mDNS = m;
--    err = OpenIfNotifySocket(&pChgRec->NotifySD);
-+    gChgRec.mDNS = m;
-+    err = OpenIfNotifySocket(&gChgRec.NotifySD);
-     if (err == 0)
--        err = mDNSPosixAddFDToEventLoop(pChgRec->NotifySD, InterfaceChangeCallback, pChgRec);
--    if (err)
--        mDNSPlatformMemFree(pChgRec);
-+        err = mDNSPosixAddFDToEventLoop(gChgRec.NotifySD, InterfaceChangeCallback, &gChgRec);
- 
-     return err;
- }
--- 
-2.20.1
-
diff --git a/meta-networking/recipes-protocols/mdns/files/0001-Create-subroutine-for-cleaning-recent-interfaces.patch b/meta-networking/recipes-protocols/mdns/mdns/0001-Create-subroutine-for-cleaning-recent-interfaces.patch
similarity index 76%
rename from meta-networking/recipes-protocols/mdns/files/0001-Create-subroutine-for-cleaning-recent-interfaces.patch
rename to meta-networking/recipes-protocols/mdns/mdns/0001-Create-subroutine-for-cleaning-recent-interfaces.patch
index f8efc10448ac..91198dea733c 100644
--- a/meta-networking/recipes-protocols/mdns/files/0001-Create-subroutine-for-cleaning-recent-interfaces.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0001-Create-subroutine-for-cleaning-recent-interfaces.patch
@@ -1,7 +1,7 @@
-From 6d90f9fdaf008f5c3b8fd8d91594fa1461437888 Mon Sep 17 00:00:00 2001
+From c1f3e19d3cb0aa948248616eb1684a1e80aa39b4 Mon Sep 17 00:00:00 2001
 From: Nate Karstens <nate.karstens@garmin.com>
 Date: Wed, 28 Jun 2017 17:30:00 -0500
-Subject: [PATCH] Create subroutine for cleaning recent interfaces
+Subject: [PATCH 1/8] Create subroutine for cleaning recent interfaces
 
 Moves functionality for cleaning the list of recent
 interfaces into its own subroutine.
@@ -9,15 +9,16 @@ interfaces into its own subroutine.
 Upstream-Status: Submitted [dts@apple.com]
 
 Signed-off-by: Nate Karstens <nate.karstens@garmin.com>
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
 ---
- mDNSPosix/mDNSPosix.c | 23 ++++++++++++++---------
- 1 file changed, 14 insertions(+), 9 deletions(-)
+ mDNSPosix/mDNSPosix.c | 24 ++++++++++++++----------
+ 1 file changed, 14 insertions(+), 10 deletions(-)
 
 diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
-index a63cd19..7aeee7b 100755
+index 0a7c3dfa2475..fe7242d83599 100644
 --- a/mDNSPosix/mDNSPosix.c
 +++ b/mDNSPosix/mDNSPosix.c
-@@ -1199,6 +1199,19 @@ mDNSlocal int SetupSocket(struct sockaddr *intfAddr, mDNSIPPort port, int interf
+@@ -1322,6 +1322,19 @@ mDNSlocal int SetupSocket(struct sockaddr *intfAddr, mDNSIPPort port, int interf
      return err;
  }
  
@@ -30,17 +31,18 @@ index a63cd19..7aeee7b 100755
 +    {
 +        PosixNetworkInterface *pi = *ri;
 +        if (utc - pi->LastSeen < 60) ri = (PosixNetworkInterface **)&pi->coreIntf.next;
-+        else { *ri = (PosixNetworkInterface *)pi->coreIntf.next; free(pi); }
++        else { *ri = (PosixNetworkInterface *)pi->coreIntf.next; mdns_free(pi); }
 +    }
 +}
 +
  // Creates a PosixNetworkInterface for the interface whose IP address is
  // intfAddr and whose name is intfName and registers it with mDNS core.
- mDNSlocal int SetupOneInterface(mDNS *const m, struct sockaddr *intfAddr, struct sockaddr *intfMask, const char *intfName, int intfIndex)
-@@ -1388,15 +1401,7 @@ mDNSlocal int SetupInterfaceList(mDNS *const m)
+ mDNSlocal int SetupOneInterface(mDNS *const m, struct sockaddr *intfAddr, struct sockaddr *intfMask,
+@@ -1559,16 +1572,7 @@ mDNSlocal int SetupInterfaceList(mDNS *const m)
+ 
      // Clean up.
      if (intfList != NULL) freeifaddrs(intfList);
- 
+-
 -    // Clean up any interfaces that have been hanging around on the RecentInterfaces list for more than a minute
 -    PosixNetworkInterface **ri = &gRecentInterfaces;
 -    const mDNSs32 utc = mDNSPlatformUTC();
@@ -48,12 +50,12 @@ index a63cd19..7aeee7b 100755
 -    {
 -        PosixNetworkInterface *pi = *ri;
 -        if (utc - pi->LastSeen < 60) ri = (PosixNetworkInterface **)&pi->coreIntf.next;
--        else { *ri = (PosixNetworkInterface *)pi->coreIntf.next; free(pi); }
+-        else { *ri = (PosixNetworkInterface *)pi->coreIntf.next; mdns_free(pi); }
 -    }
 +    CleanRecentInterfaces();
  
      return err;
  }
 -- 
-2.20.1
+2.35.1
 
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0001-dns-sd-Include-missing-headers.patch b/meta-networking/recipes-protocols/mdns/mdns/0001-dns-sd-Include-missing-headers.patch
new file mode 100644
index 000000000000..4a60a9572896
--- /dev/null
+++ b/meta-networking/recipes-protocols/mdns/mdns/0001-dns-sd-Include-missing-headers.patch
@@ -0,0 +1,30 @@
+From cea342c10731cb1c8c8b52f03d55f9d15fc3b091 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 4 Nov 2021 07:31:32 -0700
+Subject: [PATCH 1/6] dns-sd: Include missing headers
+
+Fixes build on Musl
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ mDNSPosix/nss_mdns.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/mDNSPosix/nss_mdns.c b/mDNSPosix/nss_mdns.c
+index afadb3c6c33b..84c312759463 100644
+--- a/mDNSPosix/nss_mdns.c
++++ b/mDNSPosix/nss_mdns.c
+@@ -89,6 +89,9 @@
+ 
+ #include <dns_sd.h>
+ 
++#if !defined(NETDB_INTERNAL)
++#  define NETDB_INTERNAL (-1)
++#endif
+ 
+ //----------
+ // Public functions
+-- 
+2.35.1
+
diff --git a/meta-networking/recipes-protocols/mdns/files/0002-Create-subroutine-for-tearing-down-an-interface.patch b/meta-networking/recipes-protocols/mdns/mdns/0002-Create-subroutine-for-tearing-down-an-interface.patch
similarity index 78%
rename from meta-networking/recipes-protocols/mdns/files/0002-Create-subroutine-for-tearing-down-an-interface.patch
rename to meta-networking/recipes-protocols/mdns/mdns/0002-Create-subroutine-for-tearing-down-an-interface.patch
index 21ba3184991c..aa3dda8d55b7 100644
--- a/meta-networking/recipes-protocols/mdns/files/0002-Create-subroutine-for-tearing-down-an-interface.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0002-Create-subroutine-for-tearing-down-an-interface.patch
@@ -1,22 +1,23 @@
-From a2148df99ddcd122247f95c4cbcce5c4118581a1 Mon Sep 17 00:00:00 2001
+From 40ef0241afbb49f84e76afd65eb3ee17466bb582 Mon Sep 17 00:00:00 2001
 From: Nate Karstens <nate.karstens@garmin.com>
 Date: Wed, 28 Jun 2017 17:30:00 -0500
-Subject: [PATCH 02/11] Create subroutine for tearing down an interface
+Subject: [PATCH 2/8] Create subroutine for tearing down an interface
 
 Creates a subroutine for tearing down an interface.
 
 Upstream-Status: Submitted [dts@apple.com]
 
 Signed-off-by: Nate Karstens <nate.karstens@garmin.com>
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
 ---
  mDNSPosix/mDNSPosix.c | 22 ++++++++++++++++------
  1 file changed, 16 insertions(+), 6 deletions(-)
 
 diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
-index ffc9696..5e5b2cd 100644
+index fe7242d83599..a32a880c0ce5 100644
 --- a/mDNSPosix/mDNSPosix.c
 +++ b/mDNSPosix/mDNSPosix.c
-@@ -591,6 +591,19 @@ mDNSlocal void FreePosixNetworkInterface(PosixNetworkInterface *intf)
+@@ -1043,6 +1043,19 @@ mDNSlocal void FreePosixNetworkInterface(PosixNetworkInterface *intf)
      gRecentInterfaces = intf;
  }
  
@@ -36,7 +37,7 @@ index ffc9696..5e5b2cd 100644
  // Grab the first interface, deregister it, free it, and repeat until done.
  mDNSlocal void ClearInterfaceList(mDNS *const m)
  {
-@@ -599,13 +612,10 @@ mDNSlocal void ClearInterfaceList(mDNS *const m)
+@@ -1051,13 +1064,10 @@ mDNSlocal void ClearInterfaceList(mDNS *const m)
      while (m->HostInterfaces)
      {
          PosixNetworkInterface *intf = (PosixNetworkInterface*)(m->HostInterfaces);
@@ -52,7 +53,7 @@ index ffc9696..5e5b2cd 100644
 +    assert(num_registered_interfaces == 0);
  }
  
- // Sets up a send/receive socket.
+ mDNSlocal int SetupIPv6Socket(int fd)
 -- 
-2.17.1
+2.35.1
 
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0002-make-Set-libdns_sd.so-soname-correctly.patch b/meta-networking/recipes-protocols/mdns/mdns/0002-make-Set-libdns_sd.so-soname-correctly.patch
new file mode 100644
index 000000000000..7f660396b4e3
--- /dev/null
+++ b/meta-networking/recipes-protocols/mdns/mdns/0002-make-Set-libdns_sd.so-soname-correctly.patch
@@ -0,0 +1,27 @@
+From a198bcd457abd04f2e22812ff3a37246aa564614 Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alex.kiernan@gmail.com>
+Date: Mon, 5 Dec 2022 15:14:12 +0000
+Subject: [PATCH 2/6] make: Set libdns_sd.so soname correctly
+
+Upstream-Status: Pending
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ mDNSPosix/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mDNSPosix/Makefile b/mDNSPosix/Makefile
+index 802a13dd70b6..5e74193c0e89 100755
+--- a/mDNSPosix/Makefile
++++ b/mDNSPosix/Makefile
+@@ -276,7 +276,7 @@ libdns_sd: setup $(BUILDDIR)/libdns_sd.$(LDSUFFIX)
+ CLIENTLIBOBJS = $(OBJDIR)/dnssd_clientlib.c.so.o $(OBJDIR)/dnssd_clientstub.c.so.o $(OBJDIR)/dnssd_ipc.c.so.o $(OBJDIR)/dnssd_errstring.c.so.o
+ 
+ $(BUILDDIR)/libdns_sd.$(LDSUFFIX): $(CLIENTLIBOBJS)
+-	$(LD) $(SOOPTS) $(LINKOPTS) -o $@ $+
++	$(LD) $(SOOPTS) $(LINKOPTS) -Wl,-soname,libdns_sd.$(LDSUFFIX).1 -o $@ $+
+ 	$(STRIP) $@
+ 
+ Clients: setup libdns_sd ../Clients/build/dns-sd
+-- 
+2.35.1
+
diff --git a/meta-networking/recipes-protocols/mdns/files/0003-Track-interface-socket-family.patch b/meta-networking/recipes-protocols/mdns/mdns/0003-Track-interface-socket-family.patch
similarity index 76%
rename from meta-networking/recipes-protocols/mdns/files/0003-Track-interface-socket-family.patch
rename to meta-networking/recipes-protocols/mdns/mdns/0003-Track-interface-socket-family.patch
index 8c0e6bf3976a..d2a9995ffa43 100644
--- a/meta-networking/recipes-protocols/mdns/files/0003-Track-interface-socket-family.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0003-Track-interface-socket-family.patch
@@ -1,23 +1,24 @@
-From 71a7c728ae0d8143b66aa40decca74ebaa9aa2ce Mon Sep 17 00:00:00 2001
+From deb3a2c51f32e0d2741be11a492e727129f770e2 Mon Sep 17 00:00:00 2001
 From: Nate Karstens <nate.karstens@garmin.com>
 Date: Wed, 28 Jun 2017 17:30:00 -0500
-Subject: [PATCH 03/11] Track interface socket family
+Subject: [PATCH 3/8] Track interface socket family
 
 Tracks the socket family associated with the interface.
 
 Upstream-Status: Submitted [dts@apple.com]
 
 Signed-off-by: Nate Karstens <nate.karstens@garmin.com>
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
 ---
  mDNSPosix/mDNSPosix.c | 1 +
  mDNSPosix/mDNSPosix.h | 2 ++
  2 files changed, 3 insertions(+)
 
 diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
-index 5e5b2cd..8fe22be 100644
+index a32a880c0ce5..9a5b4d7ea4cb 100644
 --- a/mDNSPosix/mDNSPosix.c
 +++ b/mDNSPosix/mDNSPosix.c
-@@ -918,6 +918,7 @@ mDNSlocal int SetupOneInterface(mDNS *const m, struct sockaddr *intfAddr, struct
+@@ -1415,6 +1415,7 @@ mDNSlocal int SetupOneInterface(mDNS *const m, struct sockaddr *intfAddr, struct
          // Set up the extra fields in PosixNetworkInterface.
          assert(intf->intfName != NULL);         // intf->intfName already set up above
          intf->index                = intfIndex;
@@ -26,7 +27,7 @@ index 5e5b2cd..8fe22be 100644
  #if HAVE_IPV6
          intf->multicastSocket6     = -1;
 diff --git a/mDNSPosix/mDNSPosix.h b/mDNSPosix/mDNSPosix.h
-index ca60d80..f77c185 100644
+index 9675591b0434..dd7864cd0d5e 100644
 --- a/mDNSPosix/mDNSPosix.h
 +++ b/mDNSPosix/mDNSPosix.h
 @@ -19,6 +19,7 @@
@@ -38,7 +39,7 @@ index ca60d80..f77c185 100644
  
  #ifdef  __cplusplus
 @@ -40,6 +41,7 @@ struct PosixNetworkInterface
-     const char *            intfName;
+     char *                  intfName;
      PosixNetworkInterface * aliasIntf;
      int index;
 +    sa_family_t sa_family;
@@ -46,5 +47,5 @@ index ca60d80..f77c185 100644
  #if HAVE_IPV6
      int multicastSocket6;
 -- 
-2.17.1
+2.35.1
 
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0003-mDNSShared-Drop-MacOS-specific-__block-qualifier.patch b/meta-networking/recipes-protocols/mdns/mdns/0003-mDNSShared-Drop-MacOS-specific-__block-qualifier.patch
new file mode 100644
index 000000000000..0ac0bb6a4587
--- /dev/null
+++ b/meta-networking/recipes-protocols/mdns/mdns/0003-mDNSShared-Drop-MacOS-specific-__block-qualifier.patch
@@ -0,0 +1,30 @@
+From 4c0954f77ba05d77192ee1519929a39fbc978321 Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alex.kiernan@gmail.com>
+Date: Mon, 5 Dec 2022 15:14:22 +0000
+Subject: [PATCH 3/6] mDNSShared: Drop MacOS specific __block qualifier
+
+Support for this extension only exists in MacOS/Clang, also it's not
+actually used here, so we can just drop it.
+
+Upstream-Status: Pending
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ mDNSShared/uds_daemon.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mDNSShared/uds_daemon.c b/mDNSShared/uds_daemon.c
+index 9ae5f78542d6..8c006b71a4ea 100644
+--- a/mDNSShared/uds_daemon.c
++++ b/mDNSShared/uds_daemon.c
+@@ -2912,7 +2912,7 @@ exit:
+ mDNSlocal mStatus add_domain_to_browser(request_state *info, const domainname *d)
+ {
+     browser_t *b, *p;
+-    __block mStatus err;
++    mStatus err;
+ 
+     for (p = info->u.browser.browsers; p; p = p->next)
+     {
+-- 
+2.35.1
+
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0004-Indicate-loopback-interface-to-mDNS-core.patch b/meta-networking/recipes-protocols/mdns/mdns/0004-Indicate-loopback-interface-to-mDNS-core.patch
new file mode 100644
index 000000000000..a5f7f0136bba
--- /dev/null
+++ b/meta-networking/recipes-protocols/mdns/mdns/0004-Indicate-loopback-interface-to-mDNS-core.patch
@@ -0,0 +1,58 @@
+From beab76b5708862f44d9acbe7a92db45e2f99259f Mon Sep 17 00:00:00 2001
+From: Nate Karstens <nate.karstens@garmin.com>
+Date: Tue, 1 Aug 2017 17:06:01 -0500
+Subject: [PATCH 4/8] Indicate loopback interface to mDNS core
+
+Tells the mDNS core if an interface is a loopback interface,
+similar to AddInterfaceToList() in the MacOS implementation.
+
+Upstream-Status: Submitted [dts@apple.com]
+
+Signed-off-by: Nate Karstens <nate.karstens@garmin.com>
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ mDNSPosix/mDNSPosix.c | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
+index 9a5b4d7ea4cb..02a19b438e03 100644
+--- a/mDNSPosix/mDNSPosix.c
++++ b/mDNSPosix/mDNSPosix.c
+@@ -1348,7 +1348,7 @@ mDNSlocal void CleanRecentInterfaces(void)
+ // Creates a PosixNetworkInterface for the interface whose IP address is
+ // intfAddr and whose name is intfName and registers it with mDNS core.
+ mDNSlocal int SetupOneInterface(mDNS *const m, struct sockaddr *intfAddr, struct sockaddr *intfMask,
+-    const mDNSu8 *intfHaddr, mDNSu16 intfHlen, const char *intfName, int intfIndex)
++    const mDNSu8 *intfHaddr, mDNSu16 intfHlen, const char *intfName, int intfIndex, int intfFlags)
+ {
+     int err = 0;
+     PosixNetworkInterface *intf;
+@@ -1411,6 +1411,7 @@ mDNSlocal int SetupOneInterface(mDNS *const m, struct sockaddr *intfAddr, struct
+ 
+         intf->coreIntf.Advertise = m->AdvertiseLocalAddresses;
+         intf->coreIntf.McastTxRx = mDNStrue;
++        intf->coreIntf.Loopback = ((intfFlags & IFF_LOOPBACK) != 0) ? mDNStrue : mDNSfalse;
+ 
+         // Set up the extra fields in PosixNetworkInterface.
+         assert(intf->intfName != NULL);         // intf->intfName already set up above
+@@ -1561,7 +1562,7 @@ mDNSlocal int SetupInterfaceList(mDNS *const m)
+                     }
+ #endif
+                     if (SetupOneInterface(m, i->ifa_addr, i->ifa_netmask,
+-                                          hwaddr, hwaddr_len, i->ifa_name, ifIndex) == 0)
++                                          hwaddr, hwaddr_len, i->ifa_name, ifIndex, i->ifa_flags) == 0)
+                     {
+                         if (i->ifa_addr->sa_family == AF_INET)
+                             foundav4 = mDNStrue;
+@@ -1578,7 +1579,7 @@ mDNSlocal int SetupInterfaceList(mDNS *const m)
+         // if ((m->HostInterfaces == NULL) && (firstLoopback != NULL))
+         if (!foundav4 && firstLoopback)
+             (void) SetupOneInterface(m, firstLoopback->ifa_addr, firstLoopback->ifa_netmask,
+-                NULL, 0, firstLoopback->ifa_name, firstLoopbackIndex);
++                NULL, 0, firstLoopback->ifa_name, firstLoopbackIndex, firstLoopback->ifa_flags);
+     }
+ 
+     // Clean up.
+-- 
+2.35.1
+
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0004-make-Separate-TLS-targets-from-libraries.patch b/meta-networking/recipes-protocols/mdns/mdns/0004-make-Separate-TLS-targets-from-libraries.patch
new file mode 100644
index 000000000000..a8e8dae60a20
--- /dev/null
+++ b/meta-networking/recipes-protocols/mdns/mdns/0004-make-Separate-TLS-targets-from-libraries.patch
@@ -0,0 +1,64 @@
+From 22316f200803225f2d375ae5c36ffead59e2f6b8 Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alex.kiernan@gmail.com>
+Date: Mon, 5 Dec 2022 15:14:26 +0000
+Subject: [PATCH 4/6] make: Separate TLS targets from libraries
+
+There are dependencies on TLSOBJS, which fails when `-lmbedtls` is
+listed as a dependency, so separate it out.
+
+Upstream-Status: Pending
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ mDNSPosix/Makefile | 14 ++++++++------
+ 1 file changed, 8 insertions(+), 6 deletions(-)
+
+diff --git a/mDNSPosix/Makefile b/mDNSPosix/Makefile
+index 5e74193c0e89..b4313c36b035 100755
+--- a/mDNSPosix/Makefile
++++ b/mDNSPosix/Makefile
+@@ -112,9 +112,11 @@ ifeq ($(findstring linux,$(os)),linux)
+ ifeq ($(tls), no)
+ CFLAGS_OS = -D_GNU_SOURCE -DHAVE_IPV6 -DNOT_HAVE_SA_LEN -DUSES_NETLINK -DHAVE_LINUX -DTARGET_OS_LINUX -ftabstop=4 -Wno-expansion-to-defined
+ TLSOBJS =
++TLSLIBS =
+ else
+ CFLAGS_OS = -D_GNU_SOURCE -DHAVE_IPV6 -DNOT_HAVE_SA_LEN -DUSES_NETLINK -DHAVE_LINUX -DTARGET_OS_LINUX -DPOSIX_HAS_TLS -ftabstop=4 -Wno-expansion-to-defined
+-TLSOBJS = $(OBJDIR)/mbedtls.c.o -lmbedtls -lmbedcrypto
++TLSOBJS = $(OBJDIR)/mbedtls.c.o
++TLSLIBS = -lmbedtls -lmbedcrypto
+ endif
+ LD = $(CC)
+ SOOPTS = -shared
+@@ -266,7 +268,7 @@ Daemon: setup $(BUILDDIR)/mdnsd
+ 	@echo "Responder daemon done"
+ 
+ $(BUILDDIR)/mdnsd: $(DAEMONOBJS)
+-	$(CC) -o $@ $+ $(LINKOPTS)
++	$(CC) -o $@ $+ $(LINKOPTS) $(TLSLIBS)
+ 	$(STRIP) $@
+ 
+ # libdns_sd target builds the client library
+@@ -485,16 +487,16 @@ dnsextd: setup $(BUILDDIR)/dnsextd
+ 	@echo "dnsextd done"
+ 
+ $(BUILDDIR)/mDNSClientPosix:         $(APPOBJ) $(TLSOBJS)     $(OBJDIR)/Client.c.o
+-	$(CC) $+ -o $@ $(LINKOPTS)
++	$(CC) $+ -o $@ $(LINKOPTS) $(TLSLIBS)
+ 
+ $(BUILDDIR)/mDNSResponderPosix:      $(COMMONOBJ) $(TLSOBJS)  $(OBJDIR)/Responder.c.o
+-	$(CC) $+ -o $@ $(LINKOPTS)
++	$(CC) $+ -o $@ $(LINKOPTS) $(TLSLIBS)
+ 
+ $(BUILDDIR)/mDNSProxyResponderPosix: $(COMMONOBJ) $(TLSOBJS)  $(OBJDIR)/ProxyResponder.c.o
+-	$(CC) $+ -o $@ $(LINKOPTS)
++	$(CC) $+ -o $@ $(LINKOPTS) $(TLSLIBS)
+ 
+ $(BUILDDIR)/mDNSNetMonitor:          $(SPECIALOBJ) $(TLSOBJS) $(OBJDIR)/NetMonitor.c.o
+-	$(CC) $+ -o $@ $(LINKOPTS)
++	$(CC) $+ -o $@ $(LINKOPTS) $(TLSLIBS)
+ 
+ $(OBJDIR)/NetMonitor.c.o:            $(COREDIR)/mDNS.c # Note: NetMonitor.c textually imports mDNS.c
+ 
+-- 
+2.35.1
+
diff --git a/meta-networking/recipes-protocols/mdns/files/0004-Use-list-for-changed-interfaces.patch b/meta-networking/recipes-protocols/mdns/mdns/0005-Use-list-for-changed-interfaces.patch
similarity index 82%
rename from meta-networking/recipes-protocols/mdns/files/0004-Use-list-for-changed-interfaces.patch
rename to meta-networking/recipes-protocols/mdns/mdns/0005-Use-list-for-changed-interfaces.patch
index db3a63ea483f..1aec34f24300 100644
--- a/meta-networking/recipes-protocols/mdns/files/0004-Use-list-for-changed-interfaces.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0005-Use-list-for-changed-interfaces.patch
@@ -1,7 +1,7 @@
-From 798bfb5e984845a27874d1a244686db6e384d7b8 Mon Sep 17 00:00:00 2001
+From e79f81f5cd626ad77ec64de4325f6645cf253c5e Mon Sep 17 00:00:00 2001
 From: Nate Karstens <nate.karstens@garmin.com>
 Date: Thu, 13 Jul 2017 09:00:00 -0500
-Subject: [PATCH 04/11] Use list for changed interfaces
+Subject: [PATCH 5/8] Use list for changed interfaces
 
 Uses a linked list to store the index of changed network interfaces
 instead of a bitfield. This allows for network interfaces with an
@@ -10,15 +10,16 @@ index greater than 31 (an index of 36 was seen on Android).
 Upstream-Status: Submitted [dts@apple.com]
 
 Signed-off-by: Nate Karstens <nate.karstens@garmin.com>
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
 ---
- mDNSPosix/mDNSPosix.c | 67 +++++++++++++++++++++++++++++++++----------
- 1 file changed, 52 insertions(+), 15 deletions(-)
+ mDNSPosix/mDNSPosix.c | 58 ++++++++++++++++++++++++++++++++-----------
+ 1 file changed, 43 insertions(+), 15 deletions(-)
 
 diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
-index 195d04b..bb883c1 100755
+index 02a19b438e03..e20adda92229 100644
 --- a/mDNSPosix/mDNSPosix.c
 +++ b/mDNSPosix/mDNSPosix.c
-@@ -67,6 +67,14 @@ struct IfChangeRec
+@@ -74,6 +74,14 @@ struct IfChangeRec
  };
  typedef struct IfChangeRec IfChangeRec;
  
@@ -33,29 +34,20 @@ index 195d04b..bb883c1 100755
  // Note that static data is initialized to zero in (modern) C.
  static PosixEventSource *gEventSources;             // linked list of PosixEventSource's
  static sigset_t gEventSignalSet;                // Signals which event loop listens for
-@@ -1458,6 +1466,32 @@ mDNSlocal mStatus OpenIfNotifySocket(int *pFD)
+@@ -1621,6 +1629,23 @@ mDNSlocal mStatus OpenIfNotifySocket(int *pFD)
      return err;
  }
  
-+mDNSlocal mDNSBool ListContainsInterfaceIndex(GenLinkedList *list, int if_index)
++mDNSlocal void AddInterfaceIndexToList(GenLinkedList *list, int if_index)
 +{
 +    NetworkInterfaceIndex *item;
 +
 +    for (item = (NetworkInterfaceIndex*)list->Head; item != NULL; item = item->Next)
 +    {
-+        if (if_index == item->if_index) return mDNStrue;
++        if (if_index == item->if_index) return;
 +    }
 +
-+    return mDNSfalse;
-+}
-+
-+mDNSlocal void AddInterfaceIndexToList(GenLinkedList *list, int if_index)
-+{
-+    NetworkInterfaceIndex *item;
-+
-+    if (ListContainsInterfaceIndex(list, if_index)) return;
-+
-+    item = malloc(sizeof *item);
++    item = mdns_malloc(sizeof *item);
 +    if (item == NULL) return;
 +
 +    item->if_index = if_index;
@@ -66,7 +58,7 @@ index 195d04b..bb883c1 100755
  #if MDNS_DEBUGMSGS
  mDNSlocal void      PrintNetLinkMsg(const struct nlmsghdr *pNLMsg)
  {
-@@ -1485,14 +1519,13 @@ mDNSlocal void      PrintNetLinkMsg(const struct nlmsghdr *pNLMsg)
+@@ -1648,14 +1673,13 @@ mDNSlocal void      PrintNetLinkMsg(const struct nlmsghdr *pNLMsg)
  }
  #endif
  
@@ -82,7 +74,7 @@ index 195d04b..bb883c1 100755
  
      // The structure here is more complex than it really ought to be because,
      // unfortunately, there's no good way to size a buffer in advance large
-@@ -1528,9 +1561,9 @@ mDNSlocal mDNSu32       ProcessRoutingNotification(int sd)
+@@ -1691,9 +1715,9 @@ mDNSlocal mDNSu32       ProcessRoutingNotification(int sd)
  
          // Process the NetLink message
          if (pNLMsg->nlmsg_type == RTM_GETLINK || pNLMsg->nlmsg_type == RTM_NEWLINK)
@@ -94,7 +86,7 @@ index 195d04b..bb883c1 100755
  
          // Advance pNLMsg to the next message in the buffer
          if ((pNLMsg->nlmsg_flags & NLM_F_MULTI) != 0 && pNLMsg->nlmsg_type != NLMSG_DONE)
-@@ -1541,8 +1574,6 @@ mDNSlocal mDNSu32       ProcessRoutingNotification(int sd)
+@@ -1704,8 +1728,6 @@ mDNSlocal mDNSu32       ProcessRoutingNotification(int sd)
          else
              break;  // all done!
      }
@@ -103,7 +95,7 @@ index 195d04b..bb883c1 100755
  }
  
  #else // USES_NETLINK
-@@ -1574,14 +1605,13 @@ mDNSlocal void      PrintRoutingSocketMsg(const struct ifa_msghdr *pRSMsg)
+@@ -1737,14 +1759,13 @@ mDNSlocal void      PrintRoutingSocketMsg(const struct ifa_msghdr *pRSMsg)
  }
  #endif
  
@@ -119,7 +111,7 @@ index 195d04b..bb883c1 100755
  
      readCount = read(sd, buff, sizeof buff);
      if (readCount < (ssize_t) sizeof(struct ifa_msghdr))
-@@ -1596,12 +1626,10 @@ mDNSlocal mDNSu32       ProcessRoutingNotification(int sd)
+@@ -1759,12 +1780,10 @@ mDNSlocal mDNSu32       ProcessRoutingNotification(int sd)
          pRSMsg->ifam_type == RTM_IFINFO)
      {
          if (pRSMsg->ifam_type == RTM_IFINFO)
@@ -134,7 +126,7 @@ index 195d04b..bb883c1 100755
  }
  
  #endif // USES_NETLINK
-@@ -1611,7 +1639,8 @@ mDNSlocal void InterfaceChangeCallback(int fd, void *context)
+@@ -1774,7 +1793,8 @@ mDNSlocal void InterfaceChangeCallback(int fd, void *context)
  {
      IfChangeRec     *pChgRec = (IfChangeRec*) context;
      fd_set readFDs;
@@ -144,7 +136,7 @@ index 195d04b..bb883c1 100755
      struct timeval zeroTimeout = { 0, 0 };
  
      (void)fd; // Unused
-@@ -1619,17 +1648,25 @@ mDNSlocal void InterfaceChangeCallback(int fd, void *context)
+@@ -1782,17 +1802,25 @@ mDNSlocal void InterfaceChangeCallback(int fd, void *context)
      FD_ZERO(&readFDs);
      FD_SET(pChgRec->NotifySD, &readFDs);
  
@@ -167,11 +159,11 @@ index 195d04b..bb883c1 100755
 +    while ((changedInterface = (NetworkInterfaceIndex*)changedInterfaces.Head) != NULL)
 +    {
 +        RemoveFromList(&changedInterfaces, changedInterface);
-+        free(changedInterface);
++        mdns_free(changedInterface);
 +    }
  }
  
  // Register with either a Routing Socket or RtNetLink to listen for interface changes.
 -- 
-2.20.1
+2.35.1
 
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0005-mDNSCore-Fix-broken-debug-parameter.patch b/meta-networking/recipes-protocols/mdns/mdns/0005-mDNSCore-Fix-broken-debug-parameter.patch
new file mode 100644
index 000000000000..6553f6b9832e
--- /dev/null
+++ b/meta-networking/recipes-protocols/mdns/mdns/0005-mDNSCore-Fix-broken-debug-parameter.patch
@@ -0,0 +1,26 @@
+From 60533a8947af714cc593bae6b20d47f3a4828589 Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alex.kiernan@gmail.com>
+Date: Mon, 5 Dec 2022 22:49:49 +0000
+Subject: [PATCH 5/6] mDNSCore: Fix broken debug parameter
+
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ mDNSCore/mDNS.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mDNSCore/mDNS.c b/mDNSCore/mDNS.c
+index 66979587ee82..e0a982fa1762 100644
+--- a/mDNSCore/mDNS.c
++++ b/mDNSCore/mDNS.c
+@@ -9831,7 +9831,7 @@ mDNSlocal void mDNSCoreReceiveNoUnicastAnswers(mDNS *const m, const DNSMessage *
+ #else
+                             const DNSServRef dnsserv = qptr->qDNSServer;
+ #endif
+-                            debugf("mDNSCoreReceiveNoUnicastAnswers making negative cache entry TTL %d for %##s (%s)", negttl, name->c, DNSTypeName(q.qtype));
++                            debugf("mDNSCoreReceiveNoUnicastAnswers making negative cache entry TTL %d for %##s (%s)", negttl, currentQName->c, DNSTypeName(q.qtype));
+                             // Create a negative record for the current name in the CNAME chain.
+                             MakeNegativeCacheRecord(m, &m->rec.r, currentQName, currentQNameHash, q.qtype, q.qclass, negttl, mDNSInterface_Any,
+                                 dnsserv, response->h.flags);
+-- 
+2.35.1
+
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0006-Handle-noisy-netlink-sockets.patch b/meta-networking/recipes-protocols/mdns/mdns/0006-Handle-noisy-netlink-sockets.patch
new file mode 100644
index 000000000000..882d08e6c63d
--- /dev/null
+++ b/meta-networking/recipes-protocols/mdns/mdns/0006-Handle-noisy-netlink-sockets.patch
@@ -0,0 +1,252 @@
+From bfa1d68bed863e22c40a6d9a19ffbcc8694bbff6 Mon Sep 17 00:00:00 2001
+From: Nate Karstens <nate.karstens@garmin.com>
+Date: Mon, 24 Jul 2017 09:38:55 -0500
+Subject: [PATCH 6/8] Handle noisy netlink sockets
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
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ mDNSPosix/mDNSPosix.c | 182 +++++++++++++++++++++++++++++++++++++++---
+ 1 file changed, 172 insertions(+), 10 deletions(-)
+
+diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
+index e20adda92229..5d52de31f79b 100644
+--- a/mDNSPosix/mDNSPosix.c
++++ b/mDNSPosix/mDNSPosix.c
+@@ -1788,14 +1788,43 @@ mDNSlocal void          ProcessRoutingNotification(int sd, GenLinkedList *change
+ 
+ #endif // USES_NETLINK
+ 
++// Test whether the given PosixNetworkInterface matches the given struct ifaddrs
++mDNSlocal mDNSBool InterfacesMatch(PosixNetworkInterface *intf, struct ifaddrs *ifi)
++{
++    mDNSBool match = mDNSfalse;
++    mDNSAddr ip, mask;
++    unsigned int if_index;
++
++    if_index = if_nametoindex(ifi->ifa_name);
++    if (if_index == 0)
++        return mDNSfalse;
++
++    if((intf->index == if_index) &&
++       (intf->sa_family == ifi->ifa_addr->sa_family) &&
++       (strcmp(intf->coreIntf.ifname, ifi->ifa_name) == 0))
++        {
++        SockAddrTomDNSAddr(ifi->ifa_addr,    &ip,   NULL);
++        SockAddrTomDNSAddr(ifi->ifa_netmask, &mask, NULL);
++
++        match = mDNSSameAddress(&intf->coreIntf.ip, &ip) &&
++                mDNSSameAddress(&intf->coreIntf.mask, &mask);
++        }
++
++    return match;
++}
++
+ // Called when data appears on interface change notification socket
+ mDNSlocal void InterfaceChangeCallback(int fd, void *context)
+ {
+     IfChangeRec     *pChgRec = (IfChangeRec*) context;
++    mDNS            *m = pChgRec->mDNS;
+     fd_set readFDs;
+     GenLinkedList changedInterfaces;
+     NetworkInterfaceIndex *changedInterface;
+     struct timeval zeroTimeout = { 0, 0 };
++    struct ifaddrs *ifa_list, **ifi, *ifa_loop4 = NULL;
++    PosixNetworkInterface *intf, *intfNext;
++    mDNSBool found, foundav4;
+ 
+     (void)fd; // Unused
+ 
+@@ -1810,12 +1839,149 @@ mDNSlocal void InterfaceChangeCallback(int fd, void *context)
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
++    if (getifaddrs(&ifa_list) < 0) goto cleanup;
++
++    for (intf = (PosixNetworkInterface*)(m->HostInterfaces); intf != NULL; intf = intfNext)
++    {
++        intfNext = (PosixNetworkInterface*)(intf->coreIntf.next);
++
++        // Loopback interface(s) are handled later
++        if (intf->coreIntf.Loopback) continue;
++
++        found = mDNSfalse;
++        for (ifi = &ifa_list; *ifi != NULL; ifi = &(*ifi)->ifa_next)
++        {
++            if (InterfacesMatch(intf, *ifi))
++            {
++                found = mDNStrue;
++                break;
++            }
++        }
++
++        // Removes changed and old interfaces from m->HostInterfaces
++        if (!found) TearDownInterface(m, intf);
++    }
++
++    // Add new and changed interfaces in ifa_list
++    // Save off loopback interface in case it is needed later
++    for (ifi = &ifa_list; *ifi != NULL; ifi = &(*ifi)->ifa_next)
++    {
++        found = mDNSfalse;
++        for (intf = (PosixNetworkInterface*)(m->HostInterfaces); intf != NULL; intf = intfNext)
++        {
++            intfNext = (PosixNetworkInterface*)(intf->coreIntf.next);
++
++            // Loopback interface(s) are handled later
++            if (intf->coreIntf.Loopback) continue;
++
++            if (InterfacesMatch(intf, *ifi))
++            {
++                found = mDNStrue;
++                break;
++            }
++
++            // Removes changed and old interfaces from m->HostInterfaces
++        }
++        if (found)
++	    continue;
++
++        if ((ifa_loop4 == NULL) &&
++            ((*ifi)->ifa_addr->sa_family == AF_INET) &&
++            ((*ifi)->ifa_flags & IFF_UP) &&
++            ((*ifi)->ifa_flags & IFF_LOOPBACK))
++        {
++            ifa_loop4 = *ifi;
++            continue;
++        }
++
++        if (     (((*ifi)->ifa_addr->sa_family == AF_INET)
++#if HAVE_IPV6
++                  || ((*ifi)->ifa_addr->sa_family == AF_INET6)
++#endif
++                  ) && ((*ifi)->ifa_flags & IFF_UP)
++                    && !((*ifi)->ifa_flags & IFF_POINTOPOINT)
++                    && !((*ifi)->ifa_flags & IFF_LOOPBACK))
++        {
++            struct ifaddrs *i = *ifi;
++
++#define ethernet_addr_len 6
++            uint8_t hwaddr[ethernet_addr_len];
++            int hwaddr_len = 0;
++
++#if defined(TARGET_OS_LINUX) && TARGET_OS_LINUX
++            struct ifreq ifr;
++            int sockfd = socket(AF_INET6, SOCK_DGRAM, 0);
++            if (sockfd >= 0)
++            {
++                /* Add hardware address */
++                memcpy(ifr.ifr_name, i->ifa_name, IFNAMSIZ);
++                if (ioctl(sockfd, SIOCGIFHWADDR, &ifr) != -1)
++                {
++                    if (ifr.ifr_hwaddr.sa_family == ARPHRD_ETHER)
++                    {
++                        memcpy(hwaddr, ifr.ifr_hwaddr.sa_data, ethernet_addr_len);
++                        hwaddr_len = ethernet_addr_len;
++                    }
++                }
++                close(sockfd);
++            }
++            else
++            {
++                memset(hwaddr, 0, sizeof(hwaddr));
++            }
++#endif // TARGET_OS_LINUX
++            SetupOneInterface(m, i->ifa_addr, i->ifa_netmask,
++                              hwaddr, hwaddr_len, i->ifa_name, if_nametoindex(i->ifa_name), i->ifa_flags);
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
++        if (!found && (ifa_loop4 != NULL))
++        {
++            SetupOneInterface(m, ifa_loop4->ifa_addr, ifa_loop4->ifa_netmask,
++                              NULL, 0, ifa_loop4->ifa_name, if_nametoindex(ifa_loop4->ifa_name), ifa_loop4->ifa_flags);
++        }
++    }
++
++    if (ifa_list != NULL) freeifaddrs(ifa_list);
+ 
++cleanup:
+     while ((changedInterface = (NetworkInterfaceIndex*)changedInterfaces.Head) != NULL)
+     {
+         RemoveFromList(&changedInterfaces, changedInterface);
+@@ -1947,15 +2113,11 @@ mDNSexport void mDNSPlatformClose(mDNS *const m)
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
+2.35.1
+
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0006-make-Add-top-level-Makefile.patch b/meta-networking/recipes-protocols/mdns/mdns/0006-make-Add-top-level-Makefile.patch
new file mode 100644
index 000000000000..268e574c5090
--- /dev/null
+++ b/meta-networking/recipes-protocols/mdns/mdns/0006-make-Add-top-level-Makefile.patch
@@ -0,0 +1,25 @@
+From fa9ef50ab4c4225cf3ade4bafc38ddf93e6fe127 Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alex.kiernan@gmail.com>
+Date: Tue, 6 Dec 2022 13:28:31 +0000
+Subject: [PATCH 6/6] make: Add top-level Makefile
+
+Simple top level Makefile that just delegates to mDNSPosix.
+
+Upstream-Status: Inappropriate [oe-specific]
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ Makefile | 2 ++
+ 1 file changed, 2 insertions(+)
+ create mode 100644 Makefile
+
+diff --git a/Makefile b/Makefile
+new file mode 100644
+index 000000000000..feb6ac67ef47
+--- /dev/null
++++ b/Makefile
+@@ -0,0 +1,2 @@
++all clean:
++	cd mDNSPosix && $(MAKE) $@
+-- 
+2.35.1
+
diff --git a/meta-networking/recipes-protocols/mdns/files/0008-Mark-deleted-interfaces-as-being-changed.patch b/meta-networking/recipes-protocols/mdns/mdns/0007-Mark-deleted-interfaces-as-being-changed.patch
similarity index 83%
rename from meta-networking/recipes-protocols/mdns/files/0008-Mark-deleted-interfaces-as-being-changed.patch
rename to meta-networking/recipes-protocols/mdns/mdns/0007-Mark-deleted-interfaces-as-being-changed.patch
index fdc5105cb9d4..e53b0fd3ae7a 100644
--- a/meta-networking/recipes-protocols/mdns/files/0008-Mark-deleted-interfaces-as-being-changed.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0007-Mark-deleted-interfaces-as-being-changed.patch
@@ -1,7 +1,7 @@
-From 0fcc0f210f3a9310a1963de640b384ce866410fd Mon Sep 17 00:00:00 2001
+From a8accffb95267490b50401c8b65ec18db57b5ef5 Mon Sep 17 00:00:00 2001
 From: Nate Karstens <nate.karstens@garmin.com>
 Date: Wed, 9 Aug 2017 09:16:58 -0500
-Subject: [PATCH 08/11] Mark deleted interfaces as being changed
+Subject: [PATCH 7/8] Mark deleted interfaces as being changed
 
 Netlink notification handling ignores messages for deleted links,
 RTM_DELLINK. It does handle RTM_GETLINK. According to libnl docu-
@@ -17,15 +17,16 @@ Testing and Verification Instructions:
 Upstream-Status: Submitted [dts@apple.com]
 
 Signed-off-by: Nate Karstens <nate.karstens@garmin.com>
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
 ---
  mDNSPosix/mDNSPosix.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
-index 798ab10..a8a57df 100644
+index 5d52de31f79b..77d982f4c50b 100644
 --- a/mDNSPosix/mDNSPosix.c
 +++ b/mDNSPosix/mDNSPosix.c
-@@ -1163,7 +1163,7 @@ mDNSlocal void          ProcessRoutingNotification(int sd, GenLinkedList *change
+@@ -1714,7 +1714,7 @@ mDNSlocal void          ProcessRoutingNotification(int sd, GenLinkedList *change
  #endif
  
          // Process the NetLink message
@@ -35,5 +36,5 @@ index 798ab10..a8a57df 100644
          else if (pNLMsg->nlmsg_type == RTM_DELADDR || pNLMsg->nlmsg_type == RTM_NEWADDR)
              AddInterfaceIndexToList(changedInterfaces, ((struct ifaddrmsg*) NLMSG_DATA(pNLMsg))->ifa_index);
 -- 
-2.17.1
+2.35.1
 
diff --git a/meta-networking/recipes-protocols/mdns/files/0010-Handle-errors-from-socket-calls.patch b/meta-networking/recipes-protocols/mdns/mdns/0008-Handle-errors-from-socket-calls.patch
similarity index 81%
rename from meta-networking/recipes-protocols/mdns/files/0010-Handle-errors-from-socket-calls.patch
rename to meta-networking/recipes-protocols/mdns/mdns/0008-Handle-errors-from-socket-calls.patch
index b9b01572761f..e689f8c2675c 100644
--- a/meta-networking/recipes-protocols/mdns/files/0010-Handle-errors-from-socket-calls.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0008-Handle-errors-from-socket-calls.patch
@@ -1,7 +1,7 @@
-From 382b3b924e43abd1bdc5792918161d0922666691 Mon Sep 17 00:00:00 2001
+From ed58146d3aeecdb9920fdc017f85c18b5b10f2db Mon Sep 17 00:00:00 2001
 From: Nate Karstens <nate.karstens@garmin.com>
 Date: Thu, 10 Aug 2017 08:27:32 -0500
-Subject: [PATCH 10/11] Handle errors from socket calls
+Subject: [PATCH 8/8] Handle errors from socket calls
 
 Adds handling for socket() or read() returning a
 negative value (indicating an error has occurred).
@@ -9,15 +9,16 @@ negative value (indicating an error has occurred).
 Upstream-Status: Submitted [dts@apple.com]
 
 Signed-off-by: Nate Karstens <nate.karstens@garmin.com>
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
 ---
  mDNSPosix/mDNSPosix.c | 12 +++++++++---
  1 file changed, 9 insertions(+), 3 deletions(-)
 
 diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
-index 3243ed4..84af26b 100644
+index 77d982f4c50b..cab512160afb 100644
 --- a/mDNSPosix/mDNSPosix.c
 +++ b/mDNSPosix/mDNSPosix.c
-@@ -1129,7 +1129,7 @@ mDNSlocal void          ProcessRoutingNotification(int sd, GenLinkedList *change
+@@ -1677,7 +1677,7 @@ mDNSlocal void          ProcessRoutingNotification(int sd, GenLinkedList *change
  // Read through the messages on sd and if any indicate that any interface records should
  // be torn down and rebuilt, return affected indices as a bitmask. Otherwise return 0.
  {
@@ -26,7 +27,7 @@ index 3243ed4..84af26b 100644
      char buff[4096];
      struct nlmsghdr         *pNLMsg = (struct nlmsghdr*) buff;
  
-@@ -1138,7 +1138,10 @@ mDNSlocal void          ProcessRoutingNotification(int sd, GenLinkedList *change
+@@ -1686,7 +1686,10 @@ mDNSlocal void          ProcessRoutingNotification(int sd, GenLinkedList *change
      // enough to hold all pending data and so avoid message fragmentation.
      // (Note that FIONREAD is not supported on AF_NETLINK.)
  
@@ -38,7 +39,7 @@ index 3243ed4..84af26b 100644
      while (1)
      {
          // Make sure we've got an entire nlmsghdr in the buffer, and payload, too.
-@@ -1154,7 +1157,9 @@ mDNSlocal void          ProcessRoutingNotification(int sd, GenLinkedList *change
+@@ -1702,7 +1705,9 @@ mDNSlocal void          ProcessRoutingNotification(int sd, GenLinkedList *change
                  pNLMsg = (struct nlmsghdr*) buff;
  
                  // read more data
@@ -49,7 +50,7 @@ index 3243ed4..84af26b 100644
                  continue;                   // spin around and revalidate with new readCount
              }
              else
-@@ -1429,6 +1434,7 @@ mDNSlocal mDNSBool mDNSPlatformInit_CanReceiveUnicast(void)
+@@ -2017,6 +2022,7 @@ mDNSlocal mDNSBool mDNSPlatformInit_CanReceiveUnicast(void)
      int err;
      int s = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
      struct sockaddr_in s5353;
@@ -58,5 +59,5 @@ index 3243ed4..84af26b 100644
      s5353.sin_port        = MulticastDNSPort.NotAnInteger;
      s5353.sin_addr.s_addr = 0;
 -- 
-2.17.1
+2.35.1
 
diff --git a/meta-networking/recipes-protocols/mdns/files/mdns.service b/meta-networking/recipes-protocols/mdns/mdns/mdns.service
similarity index 100%
rename from meta-networking/recipes-protocols/mdns/files/mdns.service
rename to meta-networking/recipes-protocols/mdns/mdns/mdns.service
diff --git a/meta-networking/recipes-protocols/mdns/mdns_1310.140.1.bb b/meta-networking/recipes-protocols/mdns/mdns_1310.140.1.bb
deleted file mode 100644
index 205dc929bede..000000000000
--- a/meta-networking/recipes-protocols/mdns/mdns_1310.140.1.bb
+++ /dev/null
@@ -1,115 +0,0 @@
-SUMMARY = "Publishes & browses available services on a link according to the Zeroconf / Bonjour protocol"
-DESCRIPTION = "Bonjour, also known as zero-configuration networking, enables automatic discovery of computers, devices, and services on IP networks."
-HOMEPAGE = "http://developer.apple.com/networking/bonjour/"
-LICENSE = "Apache-2.0 & BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://../LICENSE;md5=31c50371921e0fb731003bbc665f29bf"
-
-DEPENDS:append:libc-musl = " musl-nscd"
-
-RPROVIDES:${PN} += "libdns_sd.so"
-
-SRC_URI = "https://opensource.apple.com/tarballs/mDNSResponder/mDNSResponder-${PV}.tar.gz \
-           file://mdns.service \
-           file://0001-mdns-include-stddef.h-for-NULL.patch;patchdir=.. \
-           file://0002-mdns-cross-compilation-fixes-for-bitbake.patch;patchdir=.. \
-           file://0001-Create-subroutine-for-cleaning-recent-interfaces.patch;patchdir=.. \
-           file://0002-Create-subroutine-for-tearing-down-an-interface.patch;patchdir=.. \
-           file://0003-Track-interface-socket-family.patch;patchdir=.. \
-           file://0004-Use-list-for-changed-interfaces.patch;patchdir=.. \
-           file://0006-Remove-unneeded-function.patch;patchdir=.. \
-           file://0008-Mark-deleted-interfaces-as-being-changed.patch;patchdir=.. \
-           file://0009-Fix-possible-NULL-dereference.patch;patchdir=.. \
-           file://0010-Handle-errors-from-socket-calls.patch;patchdir=.. \
-           file://0011-Change-a-dynamic-allocation-to-file-scope-variable.patch;patchdir=.. \
-           file://0001-dns-sd-Include-missing-headers.patch;patchdir=.. \
-           "
-SRC_URI[sha256sum] = "040f6495c18b9f0557bcf9e00cbcfc82b03405f5ba6963dc147730ca0ca90d6f"
-
-CVE_PRODUCT = "apple:mdnsresponder"
-
-# CVE-2007-0613 is not applicable as it only affects Apple products
-# i.e. ichat,mdnsresponder, instant message framework and MacOS.
-# Also, https://www.exploit-db.com/exploits/3230 shows the part of code
-# affected by CVE-2007-0613 which is not preset in upstream source code.
-# Hence, CVE-2007-0613 does not affect other Yocto implementations and
-# is not reported for other distros can be marked whitelisted.
-# Links:
-# https://vulmon.com/vulnerabilitydetails?qid=CVE-2007-0613
-# https://www.incibe-cert.es/en/early-warning/vulnerabilities/cve-2007-0613
-# https://security-tracker.debian.org/tracker/CVE-2007-0613
-# https://vulmon.com/vulnerabilitydetails?qid=CVE-2007-0613
-CVE_CHECK_IGNORE += "CVE-2007-0613"
-
-PARALLEL_MAKE = ""
-
-S = "${WORKDIR}/mDNSResponder-${PV}/mDNSPosix"
-
-EXTRA_OEMAKE += "os=linux DEBUG=0 'CC=${CC}' 'LD=${CCLD} ${LDFLAGS}'"
-
-TARGET_CC_ARCH += "${LDFLAGS}"
-
-do_install () {
-    install -d ${D}${sbindir}
-    install -m 0755 build/prod/mdnsd ${D}${sbindir}
-
-    install -d ${D}${libdir}
-    cp build/prod/libdns_sd.so ${D}${libdir}/libdns_sd.so.1
-    chmod 0644 ${D}${libdir}/libdns_sd.so.1
-    ln -s libdns_sd.so.1 ${D}${libdir}/libdns_sd.so
-
-    install -d ${D}${includedir}
-    install -m 0644 ../mDNSShared/dns_sd.h ${D}${includedir}
-
-    install -d ${D}${mandir}/man8
-    install -m 0644 ../mDNSShared/mDNSResponder.8 ${D}${mandir}/man8/mdnsd.8
-
-    install -d ${D}${bindir}
-    install -m 0755 ../Clients/build/dns-sd ${D}${bindir}
-
-    install -d ${D}${libdir}
-    oe_libinstall -C build/prod -so libnss_mdns-0.2 ${D}${libdir}
-    ln -s libnss_mdns-0.2.so ${D}${libdir}/libnss_mdns.so.2
-
-    install -d ${D}${sysconfdir}
-    install -m 0644 nss_mdns.conf ${D}${sysconfdir}
-
-    install -d ${D}${mandir}/man5
-    install -m 0644 nss_mdns.conf.5 ${D}${mandir}/man5
-
-    install -d ${D}${mandir}/man8
-    install -m 0644 libnss_mdns.8 ${D}${mandir}/man8
-
-    install -d ${D}${systemd_unitdir}/system/
-    install -m 0644 ${WORKDIR}/mdns.service ${D}${systemd_unitdir}/system/
-}
-
-pkg_postinst:${PN} () {
-    sed -e '/^hosts:/s/\s*\<mdns\>//' \
-        -e 's/\(^hosts:.*\)\(\<files\>\)\(.*\)\(\<dns\>\)\(.*\)/\1\2 mdns\3\4\5/' \
-        -i $D/etc/nsswitch.conf
-}
-
-pkg_prerm:${PN} () {
-    sed -e '/^hosts:/s/\s*\<mdns\>//' \
-        -e '/^hosts:/s/\s*mdns//' \
-        -i $D/etc/nsswitch.conf
-}
-
-inherit systemd
-
-SYSTEMD_SERVICE:${PN} = "mdns.service"
-
-FILES:${PN} += "${systemd_unitdir}/system/mdns.service"
-FILES:${PN} += "${libdir}/libdns_sd.so.1 \
-                ${bindir}/dns-sd \
-                ${libdir}/libnss_mdns-0.2.so \
-                ${sysconfdir}/nss_mdns.conf"
-
-FILES:${PN}-dev += "${libdir}/libdns_sd.so \
-                    ${includedir}/dns_sd.h "
-
-FILES:${PN}-man += "${mandir}/man8/mdnsd.8 \
-                    ${mandir}/man5/nss_mdns.conf.5 \
-                    ${mandir}/man8/libnss_mdns.8"
-
-PACKAGES = "${PN} ${PN}-dev ${PN}-man ${PN}-dbg"
diff --git a/meta-networking/recipes-protocols/mdns/mdns_1790.40.31.bb b/meta-networking/recipes-protocols/mdns/mdns_1790.40.31.bb
new file mode 100644
index 000000000000..84018de1bbb8
--- /dev/null
+++ b/meta-networking/recipes-protocols/mdns/mdns_1790.40.31.bb
@@ -0,0 +1,130 @@
+SUMMARY = "Publishes & browses available services on a link according to the Zeroconf / Bonjour protocol"
+DESCRIPTION = "Bonjour, also known as zero-configuration networking, enables automatic discovery of computers, devices, and services on IP networks."
+HOMEPAGE = "http://developer.apple.com/networking/bonjour/"
+LICENSE = "Apache-2.0 & BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=31c50371921e0fb731003bbc665f29bf"
+
+DEPENDS:append:libc-musl = " musl-nscd"
+
+SRC_URI = "git://github.com/apple-oss-distributions/mDNSResponder;protocol=https;branch=main \
+           file://0001-dns-sd-Include-missing-headers.patch \
+           file://0002-make-Set-libdns_sd.so-soname-correctly.patch \
+           file://0003-mDNSShared-Drop-MacOS-specific-__block-qualifier.patch \
+           file://0004-make-Separate-TLS-targets-from-libraries.patch \
+           file://0005-mDNSCore-Fix-broken-debug-parameter.patch \
+           file://0006-make-Add-top-level-Makefile.patch \
+           file://0001-Create-subroutine-for-cleaning-recent-interfaces.patch \
+           file://0002-Create-subroutine-for-tearing-down-an-interface.patch \
+           file://0003-Track-interface-socket-family.patch \
+           file://0004-Indicate-loopback-interface-to-mDNS-core.patch \
+           file://0005-Use-list-for-changed-interfaces.patch \
+           file://0006-Handle-noisy-netlink-sockets.patch \
+           file://0007-Mark-deleted-interfaces-as-being-changed.patch \
+           file://0008-Handle-errors-from-socket-calls.patch \
+           file://mdns.service \
+           "
+SRCREV = "806254210edec4cab01f794f6fd28658aa6ba59d"
+
+# We install a stub Makefile in the top directory so that the various checks
+# in base.bbclass pass their tests for a Makefile, this ensures (that amongst
+# other things) the sstate checks will clean the build directory when the
+# task hashes changes.
+#
+# We can't use the approach of setting ${S} to mDNSPosix as we need
+# DEBUG_PREFIX_MAP to cover files which come from the Clients directory too.
+S = "${WORKDIR}/git"
+
+inherit github-releases manpages systemd update-rc.d
+
+PACKAGECONFIG ?= "tls \
+		  ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
+PACKAGECONFIG[debug] = "DEBUG=1,DEBUG=0"
+PACKAGECONFIG[ipv6] = "HAVE_IPV6=1,HAVE_IPV6=0"
+PACKAGECONFIG[manpages] = ""
+PACKAGECONFIG[tls] = ",tls=no,mbedtls"
+
+CVE_PRODUCT = "apple:mdnsresponder"
+
+# CVE-2007-0613 is not applicable as it only affects Apple products
+# i.e. ichat,mdnsresponder, instant message framework and MacOS.
+# Also, https://www.exploit-db.com/exploits/3230 shows the part of code
+# affected by CVE-2007-0613 which is not preset in upstream source code.
+# Hence, CVE-2007-0613 does not affect other Yocto implementations and
+# is not reported for other distros can be marked whitelisted.
+# Links:
+# https://vulmon.com/vulnerabilitydetails?qid=CVE-2007-0613
+# https://www.incibe-cert.es/en/early-warning/vulnerabilities/cve-2007-0613
+# https://security-tracker.debian.org/tracker/CVE-2007-0613
+# https://vulmon.com/vulnerabilitydetails?qid=CVE-2007-0613
+CVE_CHECK_IGNORE += "CVE-2007-0613"
+
+PARALLEL_MAKE = ""
+
+EXTRA_OEMAKE = "os=linux 'CC=${CCLD}' 'LD=${CCLD}' 'LINKOPTS=${LDFLAGS}' STRIP=: ${PACKAGECONFIG_CONFARGS}"
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+MDNS_BUILDDIR = "build/${@bb.utils.contains('PACKAGECONFIG','debug','debug','prod', d)}"
+
+do_install () {
+	cd mDNSPosix
+
+	install -d ${D}${sbindir}
+	install ${MDNS_BUILDDIR}/mdnsd ${D}${sbindir}
+
+	install -d ${D}${libdir}
+	install -m 0644 ${MDNS_BUILDDIR}/libdns_sd.so ${D}${libdir}/libdns_sd.so.1
+	ln -s libdns_sd.so.1 ${D}${libdir}/libdns_sd.so
+
+	install -d ${D}${includedir}
+	install -m 0644 ../mDNSShared/dns_sd.h ${D}${includedir}
+
+	install -d ${D}${mandir}/man8
+	install -m 0644 ../mDNSShared/mDNSResponder.8 ${D}${mandir}/man8/mdnsd.8
+
+	install -d ${D}${bindir}
+	install -m 0755 ../Clients/build/dns-sd ${D}${bindir}
+
+	install -d ${D}${libdir}
+	oe_libinstall -C ${MDNS_BUILDDIR} -so libnss_mdns-0.2 ${D}${libdir}
+	ln -s libnss_mdns-0.2.so ${D}${libdir}/libnss_mdns.so.2
+
+	install -d ${D}${sysconfdir}
+	install -m 0644 nss_mdns.conf ${D}${sysconfdir}
+
+	install -d ${D}${mandir}/man5
+	install -m 0644 nss_mdns.conf.5 ${D}${mandir}/man5
+
+	install -d ${D}${mandir}/man8
+	install -m 0644 libnss_mdns.8 ${D}${mandir}/man8
+
+	install -d ${D}${systemd_system_unitdir}
+	install -m 0644 ${WORKDIR}/mdns.service ${D}${systemd_system_unitdir}
+
+	install -d ${D}${INIT_D_DIR}
+	install mdnsd.sh ${D}${INIT_D_DIR}/mdns
+}
+
+pkg_postinst:${PN} () {
+	if [ -r $D${sysconfdir}/nsswitch.conf ]; then
+		sed -e '/^hosts:/s/\s*\<mdns\>//' \
+			-e 's/\(^hosts:.*\)\(\<files\>\)\(.*\)\(\<dns\>\)\(.*\)/\1\2 mdns\3\4\5/' \
+			-i $D${sysconfdir}/nsswitch.conf
+	fi
+}
+
+pkg_prerm:${PN} () {
+	if [ -r $D${sysconfdir}/nsswitch.conf ]; then
+		sed -e '/^hosts:/s/\s*\<mdns\>//' \
+			-e '/^hosts:/s/\s*mdns//' \
+				-i $D${sysconfdir}/nsswitch.conf
+	fi
+}
+
+SYSTEMD_SERVICE:${PN} = "mdns.service"
+INITSCRIPT_NAME = "mdns"
+
+FILES_SOLIBSDEV = "${libdir}/libdns_sd.so"
+FILES:${PN} += "${libdir}/libnss_mdns-0.2.so"
+
+RPROVIDES:${PN} += "libdns_sd.so"
-- 
2.35.1


