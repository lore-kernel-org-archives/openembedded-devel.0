Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54B98C44506
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:49 +0000 (UTC)
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69153.1782634360516325971
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=i597ep/c;
 spf=pass (domain: gmail.com, ip: 74.125.82.46, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-13986d61b4eso5801458c88.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634360; x=1783239160; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQlxCYs6CL0IMIbmDVQOHhq87wftqzYOrYVNwBcy2tk=;
        b=i597ep/cW3TVEsiKNb53uQglBNGwdlBTCn9asuvlMwGHGTQ1CNyGEaWp0Fy+II6UqQ
         K2jvxgpiVXUIGshMj1Vl/lq83M2PPK4O2333aQop8lqZnDyQ0H8++xVaCStAXZ9P2xSX
         yeWeoex8bFsJDollYP6j8NEMVrFI2A8BQLnnVdCtBTlo3AfIaxYodSkU118WnhyoFKLY
         kVXJdTjz9/nTCwQGCA7dgEVFAB3+MX9sGv3f08k390UV0g4mSSQztAKFDjZJiyYVwmaL
         TgLY/+iFRmsWAoAJCLCfhlD9l7zVC7wSgTPWKmgRZMfVGfHcUfhF7kmCQM5bVBuQ/d+L
         X8Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634360; x=1783239160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vQlxCYs6CL0IMIbmDVQOHhq87wftqzYOrYVNwBcy2tk=;
        b=OUM7rlP+P7upVtZmowLDLXPTdxj+jcivLVPSYXDUIByNedleWtxbNa96PD3aFMfg2H
         6sfA3PInZhxHz2FkyLo1yZq3h2seH0mwoDSLDD9WZh4FRkX8XKwCKiJdG0TWXFSCT5LV
         fB/Y9q8vYjjKJ+oq3HG/yHQeM76835wByhYcr9L4YHwU7rYeZJ+e6sy/+hPcGO8AFdg6
         8CXW9hEeqtrV0Mon7WBQ5IrPubEjK6qsH/Hs2IrTUNq1LpMs0QF5NfSTJIYnWz4YYFKJ
         fwV+aTqoUvOXL7uHYRvBbtI9leHaB3pZu2NRiGbK0YT0QzC/XhE5WxOLmFHHYXbeuzPg
         CkMQ==
X-Gm-Message-State: AOJu0Yw9f3Y2yRFTQwV140i9bnd/c5LyCFvKVdqYu58QSr2cszmFkNLF
	d3NlOoJz0uLZFfnU9r1ZZRpO9qMCDhFdLtIizfMZmNZeh3usx9oQrCm94UFBUsfXaKrN4Q==
X-Gm-Gg: AfdE7cmlwT3cMgv92/mdJz6duGgfqjYI4ZaSHlLbgz+riHuO/YQuB5JgrkxDndvvI7O
	lz74i824Uld0QHOnXG4osYzdQuVyKNSuJXrFvrz982wKZj/ROpsCEmAiP1XL4JqKnJpPiqjZeCJ
	T0YhGk2bMOSijFzIGB/yWXs5dJkyZknrdpEsDEnc9uGmSwqD/zVx2sHhqSns6ASXY5a2j9R/R3m
	cZosQTHj2Frf8NP62Yy4QF6uC1nLu5l0UdWB3ap2l2L4/MIpu75bMSlKuXH1izhAXqLyIsBmFMs
	hih9BZ4HNH499n96lCn/vFN4+j1zP6jFYemtq3Y38TYlfYk0K0jb8HUKEGuEszEk1kfa9aGJ+dB
	boR0UaqS8HUNt1aXOTL03HBxwSkhiKsEBT9DubM3tLrA0xGqbdeyBU7DRT8EvWnes7m3ClGy95h
	fMe23hFUVilELTroHMNQTGOmtWNiUPVUFIMKvdQUutjn2Zd2JqetE4Shmj/Vcs32T5waivhgjyo
	ip6BHyjpFwroXMbRdW24biUpvsR/OhAYulrYMBOtp211YAKRqDkMSXOlH4/TnJ3CQ8ePNWXykie
	5I1xr97CYvo2E0RemFWZfS7HZVeECA==
X-Received: by 2002:a05:7022:eac4:b0:139:ed5d:1b5a with SMTP id a92af1059eb24-139ed5d20efmr4768622c88.40.1782634359527;
        Sun, 28 Jun 2026 01:12:39 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 081/128] nmap: upgrade 7.92 -> 7.99
Date: Sun, 28 Jun 2026 01:10:32 -0700
Message-ID: <20260628081122.178348-81-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127891

License-Update: relicensed to NPSL (Nmap Public Source License)

fix bundled libdnet configure and static link

Add a patch fixing the libdnet PF_PACKET conftest, which used a
nested function definition clang rejects, making configure
wrongly conclude there is no Ethernet support.

Clear DISABLE_STATIC so the bundled libdnet libtool build also
produces libdnet.a (nmap links it statically), and serialize
the make since the top-level Makefile does not order the
link after the recursive libdnet build.

Also regenerate an existing patch to apply without fuzz.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...e.h-header-to-pass-clang-compilation.patch | 17 ++--
 ...x-PF_PACKET-conftest-nested-function.patch | 38 +++++++++
 ...efine-the-python-library-install-dir.patch | 31 --------
 ...l-mkdir-with-coreutils-mkdir-command.patch | 38 ---------
 ...e.h-header-to-pass-clang-compilation.patch | 76 ------------------
 .../0004-Fix-building-with-libc.patch         | 79 -------------------
 ...ing-between-build-ncat-and-build-lua.patch | 55 -------------
 .../0006-Fix-build-with-libpcap-1.10.5.patch  | 47 -----------
 meta-oe/recipes-security/nmap/nmap_7.92.bb    | 62 ---------------
 .../nmap/{nmap_7.95.bb => nmap_7.99.bb}       | 16 +++-
 10 files changed, 56 insertions(+), 403 deletions(-)
 create mode 100644 meta-oe/recipes-security/nmap/files/0004-libdnet-fix-PF_PACKET-conftest-nested-function.patch
 delete mode 100644 meta-oe/recipes-security/nmap/nmap-7.92/0001-redefine-the-python-library-install-dir.patch
 delete mode 100644 meta-oe/recipes-security/nmap/nmap-7.92/0002-replace-.-shtool-mkdir-with-coreutils-mkdir-command.patch
 delete mode 100644 meta-oe/recipes-security/nmap/nmap-7.92/0003-Include-time.h-header-to-pass-clang-compilation.patch
 delete mode 100644 meta-oe/recipes-security/nmap/nmap-7.92/0004-Fix-building-with-libc.patch
 delete mode 100644 meta-oe/recipes-security/nmap/nmap-7.92/0005-fix-racing-between-build-ncat-and-build-lua.patch
 delete mode 100644 meta-oe/recipes-security/nmap/nmap-7.92/0006-Fix-build-with-libpcap-1.10.5.patch
 delete mode 100644 meta-oe/recipes-security/nmap/nmap_7.92.bb
 rename meta-oe/recipes-security/nmap/{nmap_7.95.bb => nmap_7.99.bb} (76%)

diff --git a/meta-oe/recipes-security/nmap/files/0001-Include-time.h-header-to-pass-clang-compilation.patch b/meta-oe/recipes-security/nmap/files/0001-Include-time.h-header-to-pass-clang-compilation.patch
index 5ee28031b8..2ff047c265 100644
--- a/meta-oe/recipes-security/nmap/files/0001-Include-time.h-header-to-pass-clang-compilation.patch
+++ b/meta-oe/recipes-security/nmap/files/0001-Include-time.h-header-to-pass-clang-compilation.patch
@@ -13,10 +13,9 @@ Upstream-Status: Pending
  4 files changed, 4 insertions(+), 10 deletions(-)
 
 diff --git a/nmap_error.cc b/nmap_error.cc
-index 588b13c33..254107ff5 100644
 --- a/nmap_error.cc
 +++ b/nmap_error.cc
-@@ -135,16 +135,7 @@
+@@ -66,16 +66,7 @@
  #include "xml.h"
  
  #include <errno.h>
@@ -35,10 +34,9 @@ index 588b13c33..254107ff5 100644
  extern NmapOps o;
  
 diff --git a/nping/EchoServer.cc b/nping/EchoServer.cc
-index ccdcf9c2d..c403aeda5 100644
 --- a/nping/EchoServer.cc
 +++ b/nping/EchoServer.cc
-@@ -137,6 +137,7 @@
+@@ -68,6 +68,7 @@
  #include "NpingOps.h"
  #include "ProbeMode.h"
  #include <signal.h>
@@ -47,22 +45,20 @@ index ccdcf9c2d..c403aeda5 100644
  extern NpingOps o;
  extern EchoServer es;
 diff --git a/osscan2.cc b/osscan2.cc
-index aa31feb12..89673e108 100644
 --- a/osscan2.cc
 +++ b/osscan2.cc
-@@ -147,6 +147,7 @@
+@@ -78,6 +78,7 @@
  
  #include <list>
  #include <math.h>
 +#include <time.h>
  
  extern NmapOps o;
- #ifdef WIN32
+ 
 diff --git a/service_scan.cc b/service_scan.cc
-index 57a92ed28..ef277bb1f 100644
 --- a/service_scan.cc
 +++ b/service_scan.cc
-@@ -145,6 +145,7 @@
+@@ -78,6 +78,7 @@
  #include "nmap_tty.h"
  
  #include <errno.h>
@@ -70,6 +66,3 @@ index 57a92ed28..ef277bb1f 100644
  
  #if HAVE_OPENSSL
  /* OpenSSL 1.0.0 needs _WINSOCKAPI_ to be defined, otherwise it loads
--- 
-2.21.0
-
diff --git a/meta-oe/recipes-security/nmap/files/0004-libdnet-fix-PF_PACKET-conftest-nested-function.patch b/meta-oe/recipes-security/nmap/files/0004-libdnet-fix-PF_PACKET-conftest-nested-function.patch
new file mode 100644
index 0000000000..89571978ea
--- /dev/null
+++ b/meta-oe/recipes-security/nmap/files/0004-libdnet-fix-PF_PACKET-conftest-nested-function.patch
@@ -0,0 +1,38 @@
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 24 Jun 2026 00:00:00 +0000
+Subject: [PATCH] libdnet: fix PF_PACKET conftest nested function
+
+The bundled libdnet-stripped AC_DNET_LINUX_PF_PACKET check used
+"int foo() { return ETH_P_ALL; }" as the AC_TRY_COMPILE body, which the
+generated configure places inside main(). clang rejects nested function
+definitions ("function definition is not allowed here"), so the check
+fails and configure aborts with "Ethernet support not found". Use a plain
+expression statement that still references ETH_P_ALL. Patch both the macro
+source and the shipped configure.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+--- a/libdnet-stripped/m4/acinclude.m4
++++ b/libdnet-stripped/m4/acinclude.m4
+@@ -149,7 +149,7 @@
+     [AC_MSG_CHECKING(for Linux PF_PACKET sockets)
+     AC_TRY_COMPILE([#include <netpacket/packet.h>
+                     #include <linux/if_ether.h>],
+-                   [int foo() { return ETH_P_ALL; }],
++                   [(void) ETH_P_ALL;],
+     ac_cv_dnet_linux_pf_packet=yes,
+     ac_cv_dnet_linux_pf_packet=no)
+     AC_MSG_RESULT($ac_cv_dnet_linux_pf_packet)
+--- a/libdnet-stripped/configure
++++ b/libdnet-stripped/configure
+@@ -15219,7 +15219,7 @@
+ int
+ main (void)
+ {
+-int foo() { return ETH_P_ALL; }
++(void) ETH_P_ALL;
+   ;
+   return 0;
+ }
diff --git a/meta-oe/recipes-security/nmap/nmap-7.92/0001-redefine-the-python-library-install-dir.patch b/meta-oe/recipes-security/nmap/nmap-7.92/0001-redefine-the-python-library-install-dir.patch
deleted file mode 100644
index 6298f7ea26..0000000000
--- a/meta-oe/recipes-security/nmap/nmap-7.92/0001-redefine-the-python-library-install-dir.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 67b4614ea529460dca9326bfe5d355bad6f9bdee Mon Sep 17 00:00:00 2001
-From: Roy Li <rongqing.li@windriver.com>
-Date: Sun, 27 Apr 2025 16:33:08 +0800
-Subject: [PATCH] redefine the python library install dir
-
-If install-lib is not defined, it is always /usr/lib/, but it
-maybe /usr/lib64 for multilib
-
-Upstream-Status: Pending
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
----
- Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index ccfceda..6b25d27 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -387,7 +387,7 @@ build-nping: $(NPINGDIR)/Makefile build-nbase build-nsock build-netutil $(NPINGD
- 	@cd $(NPINGDIR) && $(MAKE)
- 
- install-ndiff:
--	cd $(NDIFFDIR) && $(PYTHON) setup.py install --prefix "$(prefix)" $(if $(DESTDIR),--root "$(DESTDIR)")
-+	cd $(NDIFFDIR) && $(PYTHON) setup.py install --prefix "$(prefix)" --install-lib="${PYTHON_SITEPACKAGES_DIR}" $(if $(DESTDIR),--root "$(DESTDIR)")
- 
- NSE_FILES = scripts/script.db scripts/*.nse
- NSE_LIB_LUA_FILES = nselib/*.lua nselib/*.luadoc
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-security/nmap/nmap-7.92/0002-replace-.-shtool-mkdir-with-coreutils-mkdir-command.patch b/meta-oe/recipes-security/nmap/nmap-7.92/0002-replace-.-shtool-mkdir-with-coreutils-mkdir-command.patch
deleted file mode 100644
index f81e230b28..0000000000
--- a/meta-oe/recipes-security/nmap/nmap-7.92/0002-replace-.-shtool-mkdir-with-coreutils-mkdir-command.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 783333de42b06020f5c0852c415cd34972a773fb Mon Sep 17 00:00:00 2001
-From: Roy Li <rongqing.li@windriver.com>
-Date: Sun, 27 Apr 2025 16:35:11 +0800
-Subject: [PATCH] replace "./shtool mkdir" with coreutils mkdir command
-
-"./shtool mkdir" is used when mkdir has not -p parameter, but mkdir in
-today most release has supportted the -p parameter, not need to use
-shtool, and it can not fix the race if two process are running mkdir to
-create same dir
-
-Upstream-Status: Pending
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
----
- ncat/Makefile.in | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/ncat/Makefile.in b/ncat/Makefile.in
-index 4632a78..11a5e7c 100644
---- a/ncat/Makefile.in
-+++ b/ncat/Makefile.in
-@@ -166,11 +166,11 @@ $(NSOCKDIR)/libnsock.a: $(NSOCKDIR)/Makefile
- 
- install: $(TARGET)
- 	@echo Installing Ncat;
--	$(SHTOOL) mkdir -f -p -m 755 $(DESTDIR)$(bindir) $(DESTDIR)$(mandir)/man1
-+	mkdir -p -m 755 $(DESTDIR)$(bindir) $(DESTDIR)$(mandir)/man1
- 	$(INSTALL) -c -m 755 ncat $(DESTDIR)$(bindir)/ncat
- 	$(STRIP) -x $(DESTDIR)$(bindir)/ncat
- 	if [ -n "$(DATAFILES)" ]; then \
--		$(SHTOOL) mkdir -f -p -m 755 $(DESTDIR)$(pkgdatadir); \
-+		mkdir -p -m 755 $(DESTDIR)$(pkgdatadir); \
- 		$(INSTALL) -c -m 644 $(DATAFILES) $(DESTDIR)$(pkgdatadir)/; \
- 	fi
- 	$(INSTALL) -c -m 644 docs/$(TARGET).1 $(DESTDIR)$(mandir)/man1/$(TARGET).1
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-security/nmap/nmap-7.92/0003-Include-time.h-header-to-pass-clang-compilation.patch b/meta-oe/recipes-security/nmap/nmap-7.92/0003-Include-time.h-header-to-pass-clang-compilation.patch
deleted file mode 100644
index b940124f98..0000000000
--- a/meta-oe/recipes-security/nmap/nmap-7.92/0003-Include-time.h-header-to-pass-clang-compilation.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From e9d876bedc8a7bc96856ecf38bbeeafee2d5b206 Mon Sep 17 00:00:00 2001
-From: Peiran Hong <peiran.hong@windriver.com>
-Date: Fri, 20 Sep 2019 15:02:45 -0400
-Subject: [PATCH] Include time.h header to pass clang compilation
-
-Upstream-Status: Pending
-
-Signed-off-by: Peiran Hong <peiran.hong@windriver.com>
----
- nmap_error.cc       | 11 +----------
- nping/EchoServer.cc |  1 +
- osscan2.cc          |  1 +
- service_scan.cc     |  1 +
- 4 files changed, 4 insertions(+), 10 deletions(-)
-
-diff --git a/nmap_error.cc b/nmap_error.cc
-index 5ec938f..83ba6cc 100644
---- a/nmap_error.cc
-+++ b/nmap_error.cc
-@@ -67,16 +67,7 @@
- #include "xml.h"
- 
- #include <errno.h>
--#if TIME_WITH_SYS_TIME
--# include <sys/time.h>
--# include <time.h>
--#else
--# if HAVE_SYS_TIME_H
--#  include <sys/time.h>
--# else
--#  include <time.h>
--# endif
--#endif
-+#include <time.h>
- 
- extern NmapOps o;
- 
-diff --git a/nping/EchoServer.cc b/nping/EchoServer.cc
-index dea2851..c80efb4 100644
---- a/nping/EchoServer.cc
-+++ b/nping/EchoServer.cc
-@@ -69,6 +69,7 @@
- #include "NpingOps.h"
- #include "ProbeMode.h"
- #include <signal.h>
-+#include <time.h>
- 
- extern NpingOps o;
- extern EchoServer es;
-diff --git a/osscan2.cc b/osscan2.cc
-index efe6da0..392c65f 100644
---- a/osscan2.cc
-+++ b/osscan2.cc
-@@ -80,6 +80,7 @@
- 
- #include <list>
- #include <math.h>
-+#include <time.h>
- 
- extern NmapOps o;
- #ifdef WIN32
-diff --git a/service_scan.cc b/service_scan.cc
-index 66e0d92..161f2a1 100644
---- a/service_scan.cc
-+++ b/service_scan.cc
-@@ -77,6 +77,7 @@
- #include "nmap_tty.h"
- 
- #include <errno.h>
-+#include <time.h>
- 
- #if HAVE_OPENSSL
- /* OpenSSL 1.0.0 needs _WINSOCKAPI_ to be defined, otherwise it loads
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-security/nmap/nmap-7.92/0004-Fix-building-with-libc.patch b/meta-oe/recipes-security/nmap/nmap-7.92/0004-Fix-building-with-libc.patch
deleted file mode 100644
index 295abe6d50..0000000000
--- a/meta-oe/recipes-security/nmap/nmap-7.92/0004-Fix-building-with-libc.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From 4c54b00e6f3749924532c2636eae01daff9e4bcd Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 20 Jan 2019 23:11:56 -0800
-Subject: [PATCH] Fix building with libc++
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- nping/EchoServer.cc | 16 ++++++++--------
- 1 file changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/nping/EchoServer.cc b/nping/EchoServer.cc
-index c80efb4..914bd54 100644
---- a/nping/EchoServer.cc
-+++ b/nping/EchoServer.cc
-@@ -214,14 +214,14 @@ int EchoServer::nep_listen_socket(){
-         server_addr6.sin6_len = sizeof(struct sockaddr_in6);
-     #endif
-     /* Bind to local address and the specified port */
--    if( bind(master_sd, (struct sockaddr *)&server_addr6, sizeof(server_addr6)) != 0 ){
-+    if( ::bind(master_sd, (struct sockaddr *)&server_addr6, sizeof(server_addr6)) != 0 ){
-         nping_warning(QT_3, "Failed to bind to source address %s. Trying to bind to port %d...", IPtoa(server_addr6.sin6_addr), port);
-         /* If the bind failed for the supplied address, just try again with in6addr_any */
-         if( o.spoofSource() ){
-             server_addr6.sin6_addr = in6addr_any;
--            if( bind(master_sd, (struct sockaddr *)&server_addr6, sizeof(server_addr6)) != 0 ){
-+            if( ::bind(master_sd, (struct sockaddr *)&server_addr6, sizeof(server_addr6)) != 0 ){
-                 nping_fatal(QT_3, "Could not bind to port %d (%s).", port, strerror(errno));
--            }else{ 
-+            }else{
-                 nping_print(VB_1, "Server bound to port %d", port);
-             }
-         }
-@@ -252,12 +252,12 @@ int EchoServer::nep_listen_socket(){
- #endif
- 
-     /* Bind to local address and the specified port */
--    if( bind(master_sd, (struct sockaddr *)&server_addr4, sizeof(server_addr4)) != 0 ){
-+    if( ::bind(master_sd, (struct sockaddr *)&server_addr4, sizeof(server_addr4)) != 0 ){
-         nping_warning(QT_3, "Failed to bind to source address %s. Trying to bind to port %d...", IPtoa(server_addr4.sin_addr), port);
-         /* If the bind failed for the supplied address, just try again with in6addr_any */
-         if( o.spoofSource() ){
-             server_addr4.sin_addr.s_addr=INADDR_ANY;
--            if( bind(master_sd, (struct sockaddr *)&server_addr4, sizeof(server_addr4)) != 0 ){
-+            if( ::bind(master_sd, (struct sockaddr *)&server_addr4, sizeof(server_addr4)) != 0 ){
-                 nping_fatal(QT_3, "Could not bind to port %d (%s).", port, strerror(errno));
-             }else{
-                 nping_print(VB_1, "Server bound to port %d", port);
-@@ -493,7 +493,7 @@ clientid_t EchoServer::nep_match_headers(IPv4Header *ip4, IPv6Header *ip6, TCPHe
-                             nping_print(DBG_3, ";");
-                             /* The payload magic may affect the score only between
-                              * zero and 4 bytes. This is done to prevent long
--                             * common strings like "GET / HTTP/1.1\r\n" 
-+                             * common strings like "GET / HTTP/1.1\r\n"
-                              * increasing the score a lot and cause problems for
-                              * the matching logic. */
-                             current_score+= MIN(4, fspec->len)*FACTOR_PAYLOAD_MAGIC;
-@@ -503,7 +503,7 @@ clientid_t EchoServer::nep_match_headers(IPv4Header *ip4, IPv6Header *ip6, TCPHe
-                     default:
-                         nping_warning(QT_2, "Bogus field specifier found in client #%d context. Please report a bug", ctx->getIdentifier());
-                     break;
--                }           
-+                }
-             } /* End of field specifiers loop */
- 
-             nping_print(DBG_3, "%s() current_score=%.02f candidate_score=%.02f", __func__, current_score, candidate_score);
-@@ -582,7 +582,7 @@ clientid_t EchoServer::nep_match_packet(const u8 *pkt, size_t pktlen){
-                 }else{
-                     if( (tcplen=tcp.validate())==OP_FAILURE){
-                         return CLIENT_NOT_FOUND;
--                    }else{                        
-+                    }else{
-                         if( (int)pktlen > (iplen+tcplen) ){
-                            if( payload.storeRecvData(pkt+iplen+tcplen, pktlen-iplen-tcplen)!=OP_FAILURE)
-                                payload_included=true;
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-security/nmap/nmap-7.92/0005-fix-racing-between-build-ncat-and-build-lua.patch b/meta-oe/recipes-security/nmap/nmap-7.92/0005-fix-racing-between-build-ncat-and-build-lua.patch
deleted file mode 100644
index f660719640..0000000000
--- a/meta-oe/recipes-security/nmap/nmap-7.92/0005-fix-racing-between-build-ncat-and-build-lua.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From c1b436da46a7e3089b657f3f92308defc0ebb735 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Sun, 9 Feb 2025 00:45:36 +0000
-Subject: [PATCH] fix racing between build-ncat and build-lua
-
-There are two build-lua rules, one in Makefile.in, another in
-ncat/Makefile.in which is required by build-ncat
-
-Build them may cause potential racing
-
-$ bitbake lib32-nmap
-$ grep -e "Compiling liblua" -e 'nmap-7.95/liblua' -e ": error" -n patch-to/temp/log.do_compile
-Compiling liblua
-make[1]: Entering directory 'path-to/build/tmp/work/corei7-32-wrsmllib32-linux/lib32-nmap/7.95/nmap-7.95/liblua'
-Compiling liblua
-make[2]: Entering directory 'path-to/build/tmp/work/corei7-32-wrsmllib32-linux/lib32-nmap/7.95/nmap-7.95/liblua'
-make[2]: Leaving directory 'path-to/tmp/work/corei7-32-wrsmllib32-linux/lib32-nmap/7.95/nmap-7.95/liblua'
-path-to/tmp/work/corei7-32-wrsmllib32-linux/lib32-nmap/7.95/recipe-sysroot-native/usr/bin/i686-wrsmllib32-linux/../../libexec/i686-wrsmllib32-linux/gcc/i686-wrsmllib32-linux/14.2.0/ld: ./../liblua/liblua.a: error adding symbols: no more archived files
-collect2: error: ld returned 1 exit status
-make[1]: Leaving directory 'path-to/tmp/work/corei7-32-wrsmllib32-linux/lib32-nmap/7.95/nmap-7.95/liblua'
-
-Explicitly make build-ncat depends on build-lua to avoid racing,
-after applying the patch
-...
-Compiling liblua
-make[1]: Entering directory 'path-to/tmp/work/corei7-32-wrsmllib32-linux/lib32-nmap/7.95/nmap-7.95/liblua'
-make[1]: Leaving directory 'path-to/tmp/work/corei7-32-wrsmllib32-linux/lib32-nmap/7.95/nmap-7.95/liblua'
-Compiling liblua
-make[2]: Entering directory 'path-to/tmp/work/corei7-32-wrsmllib32-linux/lib32-nmap/7.95/nmap-7.95/liblua'
-make[2]: Leaving directory 'path-to/tmp/work/corei7-32-wrsmllib32-linux/lib32-nmap/7.95/nmap-7.95/liblua'
-...
-
-Upstream-Status: Submitted [https://github.com/nmap/nmap/pull/3025]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index 6b25d27..b0a2719 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -159,7 +159,7 @@ build-netutil: libnetutil/Makefile
- 	@echo Compiling libnetutil;
- 	cd libnetutil && $(MAKE)
- 
--build-ncat: $(NCATDIR)/Makefile build-nbase build-nsock $(NCATDIR)/ncat.h @PCAP_BUILD@
-+build-ncat: $(NCATDIR)/Makefile build-nbase build-nsock build-lua $(NCATDIR)/ncat.h @PCAP_BUILD@
- 	cd $(NCATDIR) && $(MAKE)
- 
- build-lua: $(LIBLUADIR)/Makefile
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-security/nmap/nmap-7.92/0006-Fix-build-with-libpcap-1.10.5.patch b/meta-oe/recipes-security/nmap/nmap-7.92/0006-Fix-build-with-libpcap-1.10.5.patch
deleted file mode 100644
index 4ee4a7295e..0000000000
--- a/meta-oe/recipes-security/nmap/nmap-7.92/0006-Fix-build-with-libpcap-1.10.5.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From ba7b4a8cc570f0ce154f186fbe840f0ac23b2b96 Mon Sep 17 00:00:00 2001
-From: Yi Zhao <yi.zhao@windriver.com>
-Date: Mon, 28 Apr 2025 10:04:46 +0800
-Subject: [PATCH] Fix build with libpcap 1.10.5
-
-Fixes:
-In file included from /build/tmp/work/core2-64-poky-linux/nmap/7.92/recipe-sysroot/usr/include/pcap/pcap.h:130,
-                 from /build/tmp/work/core2-64-poky-linux/nmap/7.92/recipe-sysroot/usr/include/pcap.h:43,
-                 from tcpip.h:72,
-                 from nse_nsock.cc:4:
-nse_nsock.cc:36:3: error: expected identifier before 'int'
-   36 |   PCAP_SOCKET = lua_upvalueindex(3), /* pcap socket metatable */
-      |   ^~~~~~~~~~~
-nse_nsock.cc:36:3: error: expected '}' before 'int'
-nse_nsock.cc:33:6: note: to match this '{'
-   33 | enum {
-      |      ^
-nse_nsock.cc:36:15: error: expected unqualified-id before '=' token
-   36 |   PCAP_SOCKET = lua_upvalueindex(3), /* pcap socket metatable */
-      |               ^
-nse_nsock.cc:40:1: error: expected declaration before '}' token
-   40 | };
-      | ^
-
-Upstream-Status: Pending
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- nse_nsock.cc | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/nse_nsock.cc b/nse_nsock.cc
-index 75ddeb6..a3c5186 100644
---- a/nse_nsock.cc
-+++ b/nse_nsock.cc
-@@ -29,6 +29,8 @@
- 
- #define DEFAULT_TIMEOUT 30000
- 
-+#undef PCAP_SOCKET
-+
- /* Upvalues for library variables */
- enum {
-   NSOCK_POOL = lua_upvalueindex(1),
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-security/nmap/nmap_7.92.bb b/meta-oe/recipes-security/nmap/nmap_7.92.bb
deleted file mode 100644
index 33767dfb96..0000000000
--- a/meta-oe/recipes-security/nmap/nmap_7.92.bb
+++ /dev/null
@@ -1,62 +0,0 @@
-SUMMARY = "network auditing tool"
-DESCRIPTION = "Nmap (Network Mapper) is a free and open source (license) utility for network discovery and security auditing.\nGui support via appending to IMAGE_FEATURES x11-base in local.conf"
-SECTION = "security"
-LICENSE = "GPL-2.0-only"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b8823a06822788010eae05b4f5e921b3"
-
-SRC_URI = "http://nmap.org/dist/${BP}.tar.bz2 \
-           file://0001-redefine-the-python-library-install-dir.patch \
-           file://0002-replace-.-shtool-mkdir-with-coreutils-mkdir-command.patch \
-           file://0003-Include-time.h-header-to-pass-clang-compilation.patch \
-           file://0004-Fix-building-with-libc.patch \
-           file://0005-fix-racing-between-build-ncat-and-build-lua.patch \
-           file://0006-Fix-build-with-libpcap-1.10.5.patch \
-           "
-SRC_URI[sha256sum] = "a5479f2f8a6b0b2516767d2f7189c386c1dc858d997167d7ec5cfc798c7571a1" 
-
-UPSTREAM_CHECK_REGEX = "nmap-(?P<pver>\d+(\.\d+)+)\.tar"
-
-inherit autotools-brokensep pkgconfig python3native
-
-PACKAGECONFIG ?= "pcre ncat nping pcap"
-
-PACKAGECONFIG[pcap] = "--with-pcap=linux, --without-pcap, libpcap, libpcap"
-PACKAGECONFIG[pcre] = "--with-libpcre=${STAGING_LIBDIR}/.., --with-libpcre=included, libpcre"
-PACKAGECONFIG[ssl] = "--with-openssl=${STAGING_LIBDIR}/.., --without-openssl, openssl, openssl"
-PACKAGECONFIG[ssh2] = "--with-openssh2=${STAGING_LIBDIR}/.., --without-openssh2, libssh2, libssh2"
-PACKAGECONFIG[libz] = "--with-libz=${STAGING_LIBDIR}/.., --without-libz, zlib, zlib"
-
-# disable/enable packages
-PACKAGECONFIG[nping] = ",--without-nping,"
-PACKAGECONFIG[ncat] = ",--without-ncat,"
-PACKAGECONFIG[ndiff] = "--with-ndiff=yes,--without-ndiff,python3 python3-setuptools-native"
-PACKAGECONFIG[update] = ",--without-nmap-update,"
-
-EXTRA_OECONF = "--with-libdnet=included --with-liblinear=included --without-subversion --with-liblua=included"
-
-# zenmap needs python-pygtk which has been removed
-# it also only works with python2
-# disable for now until py3 is supported
-EXTRA_OECONF += "--without-zenmap"
-
-export PYTHON_SITEPACKAGES_DIR
-
-do_configure() {
-    autoconf
-    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}
-    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
-    oe_runconf
-}
-
-do_install:append() {
-    for f in ndiff uninstall_ndiff; do
-        if [ -f ${D}${bindir}/$f ]; then
-            sed -i 's@^#!.*$@#!/usr/bin/env python3@g' ${D}${bindir}/$f
-        fi
-    done
-}
-
-FILES:${PN} += "${PYTHON_SITEPACKAGES_DIR} ${datadir}/ncat"
-
-RDEPENDS:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'ndiff', 'python3-difflib python3-asyncio python3-xml', '', d)}"
diff --git a/meta-oe/recipes-security/nmap/nmap_7.95.bb b/meta-oe/recipes-security/nmap/nmap_7.99.bb
similarity index 76%
rename from meta-oe/recipes-security/nmap/nmap_7.95.bb
rename to meta-oe/recipes-security/nmap/nmap_7.99.bb
index 8841a8cd78..9958581187 100644
--- a/meta-oe/recipes-security/nmap/nmap_7.95.bb
+++ b/meta-oe/recipes-security/nmap/nmap_7.99.bb
@@ -6,14 +6,13 @@ LICENSE = "NPSL"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=895af8527fe4bcb72f271fd1841fd2f6"
 
 SRC_URI = "http://nmap.org/dist/${BP}.tar.bz2 \
-           file://nmap-redefine-the-python-library-dir.patch \
            file://nmap-replace-shtool-mkdir-with-coreutils-mkdir-command.patch \
            file://0001-Include-time.h-header-to-pass-clang-compilation.patch \
            file://0002-Fix-building-with-libc.patch \
-           file://0003-Fix-off-by-one-overflow-in-the-IP-protocol-table.patch \
            file://0001-fix-racing-between-build-ncat-and-build-lua.patch \
+           file://0004-libdnet-fix-PF_PACKET-conftest-nested-function.patch \
            "
-SRC_URI[sha256sum] = "e14ab530e47b5afd88f1c8a2bac7f89cd8fe6b478e22d255c5b9bddb7a1c5778" 
+SRC_URI[sha256sum] = "df512492ffd108e53a27a06f26d8635bbe89e0e569455dc8ffef058c035d51b2"
 
 UPSTREAM_CHECK_REGEX = "nmap-(?P<pver>\d+(\.\d+)+)\.tar"
 
@@ -40,6 +39,17 @@ EXTRA_OECONF = "--with-libdnet=included --with-liblinear=included --without-subv
 # disable for now until py3 is supported
 EXTRA_OECONF += "--without-zenmap"
 
+# nmap links the bundled libdnet statically (libdnet-stripped/src/.libs/libdnet.a),
+# but OE's default --disable-static propagates into that libtool sub-package
+# (last on the command line, so it wins) and only the shared library is built.
+# Drop --disable-static so libtool also produces libdnet.a.
+DISABLE_STATIC = ""
+
+# nmap's top-level Makefile does not order the link of nmap/nping after the
+# recursive build of the bundled libdnet, so a parallel build can try to link
+# against libdnet-stripped/src/.libs/libdnet.a before it exists. Serialize.
+PARALLEL_MAKE = ""
+
 export PYTHON_SITEPACKAGES_DIR
 
 do_configure() {

