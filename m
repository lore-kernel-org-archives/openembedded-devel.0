Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48036.1795411860589764081
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:31:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=cVluY/gM;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-38587f3de36so3516224eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411860; x=1796016660; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sh52/NvDxV6DLOLMBwL5nBRtDIEBd2vDP6NT70h/4gQ=;
        b=cVluY/gMpoHADDTblLFYWCGwSTed86UWwSh//gfaf+fuYhNwTugoE/k+ol2tasCv5H
         BzpXxgn9Zq/XGwGM9fFpm0OUlNAIGWG7jSgU9FRC4o2Apo49NbsQ5PPJ+adQQtN7UkS6
         W86nQ9+WrDtJCrNIOFFLsaPcHn332rs/HDhNla88RoS+b1YQWNAw1+JpgXzTFqzZ5a/F
         wh6N9AQmJuehNS15YFufQ7/WsyOnbdoNI85tpU9jNLQCQ78ZbBkE7nPgnZ94sLqVsieN
         upd88/YQxntR9VV/TmC5HzMQbi2f7oerSR3/OYvv9xFAmlUuPmaf7dCrVOUNvLBFKefV
         QLew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411860; x=1796016660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sh52/NvDxV6DLOLMBwL5nBRtDIEBd2vDP6NT70h/4gQ=;
        b=LldnfOYUP219pbXdeTPhHlb8zn15zPI3FgkjJcexuM7DlZk61eMXaHQBIfQHXODzXH
         +mLTTVyweH2CmeVt+1T16MYYrbgG8sAJWc9ovGNd5yUDyE/wm1MnCP4PMEcV/eUdQP6p
         lLwr+apqSQRFrNAuE04IYYwPnUvqauntpH+iWm4xwBhX1Eiq67b0ZfxuyJ9P0McPmfrU
         D0VmI1tFrHiexbR96eLzOi5Ayu1CaSXiUC5Cxn6lTd70lMJvNPgV8euvePi5cVqycDEL
         DD8FnSRrHn3gpnGLUXgRy8VMcyLXWjUEtAkafxR1+YaxFA6kEdJignL9znULfNq6FDfF
         P8lg==
X-Gm-Message-State: APuU4Z/j3y+eHaKzxPcg6ZyRa4QphknW2+hflAV7V6liXkVkTfMbk3Ny
	/0xM2eCTSlM3JkvINH7z++uDkLlInMBrtFFF1AHxIgjfSGp65mx46bab85smynhU4aw=
X-Gm-Gg: AZFdTZdylO2fvftyRMMjtM59AXyKHwm2h4sYIlS2cY+YV3fvuErinNQ0LxbKnOpZiDS
	wNV24ABJAxJnHiZ13InUl3YKc16f063nFdIJ1T6O/hVTqWgDiNHbdM82KILek1gzNvN+OtZzco6
	MNGqnEDm4nRWdfpLgKRvGDmgLaLSeZQqrjdiWqSaTNke7oUU1qQIHWR05FyKIgeK6E6AgTHWuWP
	kSFTvxH1/zIcxBM7NjgfGs+LHrxfUkj2VjKIKQLIXM5DU0rHfMDorEOoZ1f3tmCuMTwJZwJXh9T
	FyfzzSaDEbSk00zmgWg1ZwXNFhNQleAGyDcBWHa7WFYahDygpwGPsC86aenHo8u1JddqCk8xPEX
	kLPqL8xthOlK45WzPQv4MoBrbuujHENahUy7KwS2SQfnXeVWCRmEnVtGt6sgkXadg44MDbDSGOM
	GamoSvo5fsGqecoV77n6mqDU1fZk0uiEutYUiHomD7djBdssUXNKBc9rp7VtF4FOQpwb35l8xSb
	tJwWUPkTWTdv5eDilzY45Zf8uGOpJeVyWo35biF1OlguYGYtD/1LYSuw9KpPgOfdWbURS3w52S4
	K8ds6RWADMoWduP2CAd6/Pow0K5O1bz/DE4At9XeJzjHECsVBKK/hENxiZapPr3wpgCxdpbkJje
	YcPNuaOIHMLcGbcxX7K6xq8iw/asPpInEMzQQp4QWbbHGg8szwgMUk1LXoPhOXAamH3Xfj2HO3d
	w336rRg3NAUiQoWgf/KYAy/iVBAGaquUSj5GaVWUKsSNRAPI8C4xSG71b+F/SLKTEpACjFvjoNa
	1lve2+KguPp24ewWderwz/g2mHgCsUnwkORhlodRWCnEIdrHdmFYhumPoy+qU2pmzTxhWNzUxki
	KZp/
X-Received: by 2002:a05:7301:dd83:b0:386:5adb:ac29 with SMTP id 5a478bee46e88-3865adbb03fmr8493283eec.7.1795411859548;
        Sun, 22 Nov 2026 21:30:59 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:30:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 24/42] nmap: upgrade 7.991 -> 7.993
Date: Sun, 22 Nov 2026 21:29:08 -0800
Message-ID: <20261123052953.3658549-52-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132839
Content-Type: text/plain; charset="utf-8"

- 7.992 security fixes in NSE scripts/libraries (hardcoded DH
  exponent in afp.lua, now DHX2; unbounded memory use; infinite loops),
  two use-after-free bugs in massdns, and seeding of Lua's PRNG
- NSE: per-script execution time and memory limits
- 8 new DICOM NSE scripts and a much extended dicom.lua library
- Bundled libpcap 1.10.7, pcre2 10.49, lua 5.4.9, libdnet 1.18.2
- 7.993 fixes a regression that stopped most version-category scripts
  from running

Drop the time.h and libc++ patches, which are fixed upstream, and
refresh the ncat/lua race fix for the @NBASE_BUILD@/@NSOCK_BUILD@
dependency style.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...e.h-header-to-pass-clang-compilation.patch | 68 ------------------
 ...ing-between-build-ncat-and-build-lua.patch | 11 +--
 .../files/0002-Fix-building-with-libc.patch   | 71 -------------------
 .../nmap/{nmap_7.991.bb => nmap_7.993.bb}     |  4 +-
 4 files changed, 4 insertions(+), 150 deletions(-)
 delete mode 100644 meta-oe/recipes-security/nmap/files/0001-Include-time.h-header-to-pass-clang-compilation.patch
 delete mode 100644 meta-oe/recipes-security/nmap/files/0002-Fix-building-with-libc.patch
 rename meta-oe/recipes-security/nmap/{nmap_7.991.bb => nmap_7.993.bb} (92%)

diff --git a/meta-oe/recipes-security/nmap/files/0001-Include-time.h-header-to-pass-clang-compilation.patch b/meta-oe/recipes-security/nmap/files/0001-Include-time.h-header-to-pass-clang-compilation.patch
deleted file mode 100644
index 2ff047c265..0000000000
--- a/meta-oe/recipes-security/nmap/files/0001-Include-time.h-header-to-pass-clang-compilation.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From a068952a20880fc864e8cb8b49f8a6b143a5ac30 Mon Sep 17 00:00:00 2001
-From: Peiran Hong <peiran.hong@windriver.com>
-Date: Fri, 20 Sep 2019 15:02:45 -0400
-Subject: [PATCH] Include time.h header to pass clang compilation
-
----
-Upstream-Status: Pending
-
- nmap_error.cc       | 11 +----------
- nping/EchoServer.cc |  1 +
- osscan2.cc          |  1 +
- service_scan.cc     |  1 +
- 4 files changed, 4 insertions(+), 10 deletions(-)
-
-diff --git a/nmap_error.cc b/nmap_error.cc
---- a/nmap_error.cc
-+++ b/nmap_error.cc
-@@ -66,16 +66,7 @@
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
---- a/nping/EchoServer.cc
-+++ b/nping/EchoServer.cc
-@@ -68,6 +68,7 @@
- #include "NpingOps.h"
- #include "ProbeMode.h"
- #include <signal.h>
-+#include <time.h>
- 
- extern NpingOps o;
- extern EchoServer es;
-diff --git a/osscan2.cc b/osscan2.cc
---- a/osscan2.cc
-+++ b/osscan2.cc
-@@ -78,6 +78,7 @@
- 
- #include <list>
- #include <math.h>
-+#include <time.h>
- 
- extern NmapOps o;
- 
-diff --git a/service_scan.cc b/service_scan.cc
---- a/service_scan.cc
-+++ b/service_scan.cc
-@@ -78,6 +78,7 @@
- #include "nmap_tty.h"
- 
- #include <errno.h>
-+#include <time.h>
- 
- #if HAVE_OPENSSL
- /* OpenSSL 1.0.0 needs _WINSOCKAPI_ to be defined, otherwise it loads
diff --git a/meta-oe/recipes-security/nmap/files/0001-fix-racing-between-build-ncat-and-build-lua.patch b/meta-oe/recipes-security/nmap/files/0001-fix-racing-between-build-ncat-and-build-lua.patch
index aad8b1ee92..9c222fdcf2 100644
--- a/meta-oe/recipes-security/nmap/files/0001-fix-racing-between-build-ncat-and-build-lua.patch
+++ b/meta-oe/recipes-security/nmap/files/0001-fix-racing-between-build-ncat-and-build-lua.patch
@@ -37,19 +37,14 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  Makefile.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/Makefile.in b/Makefile.in
-index e2f79c9..0e634a3 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -159,7 +159,7 @@ build-netutil: libnetutil/Makefile
+@@ -166,7 +166,7 @@
  	@echo Compiling libnetutil;
  	cd libnetutil && $(MAKE)
  
--build-ncat: $(NCATDIR)/Makefile build-nbase build-nsock $(NCATDIR)/ncat.h @PCAP_BUILD@
-+build-ncat: $(NCATDIR)/Makefile build-nbase build-nsock build-lua $(NCATDIR)/ncat.h @PCAP_BUILD@
+-build-ncat: $(NCATDIR)/Makefile @NBASE_BUILD@ @NSOCK_BUILD@ $(NCATDIR)/ncat.h @PCAP_BUILD@
++build-ncat: $(NCATDIR)/Makefile @NBASE_BUILD@ @NSOCK_BUILD@ @LUA_BUILD@ $(NCATDIR)/ncat.h @PCAP_BUILD@
  	cd $(NCATDIR) && $(MAKE)
  
  build-lua: $(LIBLUADIR)/Makefile
--- 
-2.47.1
-
diff --git a/meta-oe/recipes-security/nmap/files/0002-Fix-building-with-libc.patch b/meta-oe/recipes-security/nmap/files/0002-Fix-building-with-libc.patch
deleted file mode 100644
index 6c2fdc6458..0000000000
--- a/meta-oe/recipes-security/nmap/files/0002-Fix-building-with-libc.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From c634826b85bc4b67890a18379025d1bdd530efa0 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 20 Jan 2019 23:11:56 -0800
-Subject: [PATCH] Fix building with libc++
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
----
- nping/EchoServer.cc | 14 +++++++-------
- 1 file changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/nping/EchoServer.cc b/nping/EchoServer.cc
-index 41108fc67..d392039a6 100644
---- a/nping/EchoServer.cc
-+++ b/nping/EchoServer.cc
-@@ -212,14 +212,14 @@ int EchoServer::nep_listen_socket(){
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
-@@ -250,12 +250,12 @@ int EchoServer::nep_listen_socket(){
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
-@@ -491,7 +491,7 @@ clientid_t EchoServer::nep_match_headers(IPv4Header *ip4, IPv6Header *ip6, TCPHe
-                             nping_print(DBG_3, ";");
-                             /* The payload magic may affect the score only between
-                              * zero and 4 bytes. This is done to prevent long
--                             * common strings like "GET / HTTP/1.1\r\n" 
-+                             * common strings like "GET / HTTP/1.1\r\n"
-                              * increasing the score a lot and cause problems for
-                              * the matching logic. */
-                             current_score+= MIN(4, fspec->len)*FACTOR_PAYLOAD_MAGIC;
-@@ -581,7 +581,7 @@ clientid_t EchoServer::nep_match_packet(const u8 *pkt, size_t pktlen){
-                 }else{
-                     if( (tcplen=tcp.validate())==OP_FAILURE){
-                         return CLIENT_NOT_FOUND;
--                    }else{                        
-+                    }else{
-                         if( (int)pktlen > (iplen+tcplen) ){
-                            if( payload.storeRecvData(pkt+iplen+tcplen, pktlen-iplen-tcplen)!=OP_FAILURE)
-                                payload_included=true;
--- 
-2.43.0
-
diff --git a/meta-oe/recipes-security/nmap/nmap_7.991.bb b/meta-oe/recipes-security/nmap/nmap_7.993.bb
similarity index 92%
rename from meta-oe/recipes-security/nmap/nmap_7.991.bb
rename to meta-oe/recipes-security/nmap/nmap_7.993.bb
index 1553b36247..1d4ae175d4 100644
--- a/meta-oe/recipes-security/nmap/nmap_7.991.bb
+++ b/meta-oe/recipes-security/nmap/nmap_7.993.bb
@@ -7,11 +7,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=895af8527fe4bcb72f271fd1841fd2f6"
 
 SRC_URI = "http://nmap.org/dist/${BP}.tar.bz2 \
            file://nmap-replace-shtool-mkdir-with-coreutils-mkdir-command.patch \
-           file://0001-Include-time.h-header-to-pass-clang-compilation.patch \
-           file://0002-Fix-building-with-libc.patch \
            file://0001-fix-racing-between-build-ncat-and-build-lua.patch \
            "
-SRC_URI[sha256sum] = "a5d507f29437bef3bedd4771ff9aaa8fc1c2a109ddba1f5b1cf12027456929be"
+SRC_URI[sha256sum] = "270e55f04915bfcecb5db8feb959d4c5ba86a48c094520a4f1c07571e1c79c59"
 
 UPSTREAM_CHECK_REGEX = "nmap-(?P<pver>\d+(\.\d+)+)\.tar"
 
