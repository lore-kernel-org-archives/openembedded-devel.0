Return-Path: <scottellis.developer@gmail.com>
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
	[209.85.219.174])
	by mail.openembedded.org (Postfix) with ESMTP id F222F7E545
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 15:04:36 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id z7so2534875ybg.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 08:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=bJL55ZHvIBA1q7ATSGuBaE+1oifzOdNC5RyKFiaMc5s=;
	b=jkQNkULzDUt+7OBG5555qh+WFsNdrlradiCmzMl6Qs9RnqOWqCJVGBMBcYQ6AY8PuT
	9EVS/1dnHq2KKbb5V0uAN/Q+AzAVlMpVZTTpArKxZPim5TFrSl4XZ/5ttKPG/JiiRH8r
	dKt0p3WTmuJyP/vh49bSYdfBlnk/fgrMbSJg+1+9MoVcL7UqW3RAFxueBDMDohf0Tnf3
	dpvgvr/QMjE8Xmdp2fa2kdev9jpkUU8KpO5R2yo4RSgkM0YRYwcb00ZlBzqKhsKkLO8i
	temhZn15Z9s8/tVuEJw9fbDkdDrAKiK52nhLwoet6h8SYF31AxFiZOpYbhb8hkmaH0nx
	L55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bJL55ZHvIBA1q7ATSGuBaE+1oifzOdNC5RyKFiaMc5s=;
	b=l24rKrR0GlFruQR0yvFA0gaGIgEyFVigW8KVdKCWaEifey9pMK9NoyayvRp47IwMe+
	cmVR8urfos67z7adts8HluBWFggT8FE/b2vH0Uh5gAMP0JRo2hO6SebPH1reNhoIodCb
	7Nfc8xL9y0sbtSWGwOnv41OzJ549A5Plup5XhY0bXiKwgJFv/z2zhzoUlhheEyTyvruG
	HsuZFkEXN87R9kuL0xZU951QED2qy+15EXoPq0oTQRpgDtVhAMyYM0dUau9sR2Of2CjK
	Kaxi90Y23tiH+ep7Z5acUI4SXGcXp0HLT4/GtZrTzJ8jZo2Obzgm3n8gRYzddimBKaTS
	gy0Q==
X-Gm-Message-State: APjAAAXPQ4CsErLmUDUUW0ESw8MjcQpAhkuPvPj/TsM5lDNpQvZAEfIY
	XrLVkN9KRzvmk7CuDC3MNkPXeo9v
X-Google-Smtp-Source: APXvYqx/6St0pzRagGNkx7kRnNGUYo5LatRWf0w9VsF/WaHVc+UBNDUTyXOuyBOmsH8VqUCIyQQFJg==
X-Received: by 2002:a25:908e:: with SMTP id t14mr6438317ybl.416.1568559877252; 
	Sun, 15 Sep 2019 08:04:37 -0700 (PDT)
Received: from fractal.jumpnow (c-73-234-253-132.hsd1.me.comcast.net.
	[73.234.253.132]) by smtp.gmail.com with ESMTPSA id
	u67sm7168687ywf.44.2019.09.15.08.04.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 15 Sep 2019 08:04:36 -0700 (PDT)
From: Scott Ellis <scottellis.developer@gmail.com>
X-Google-Original-From: Scott Ellis <scott@jumpnowtek.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Sep 2019 11:04:33 -0400
Message-Id: <1568559873-19974-1-git-send-email-scott@jumpnowtek.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] nmap: Upgrade to 7.80
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
X-List-Received-Date: Sun, 15 Sep 2019 15:04:37 -0000

Signed-off-by: Scott Ellis <scott@jumpnowtek.com>
---
 ... => 0001-Redefine-the-python-library-dir.patch} | 19 +++---
 ...lude-time.h-for-time-structure-definition.patch | 78 ----------------------
 .../nmap/files/0002-Fix-building-with-libc.patch   | 76 ---------------------
 ...Include-time.h-for-time-struct-definition.patch | 37 ++++++++++
 .../nmap/files/0003-Fix-building-with-libc.patch   | 46 +++++++++++++
 ...shtool-mkdir-with-coreutils-mkdir-command.patch | 48 -------------
 .../nmap/{nmap_7.70.bb => nmap_7.80.bb}            | 17 ++---
 7 files changed, 98 insertions(+), 223 deletions(-)
 rename meta-oe/recipes-security/nmap/files/{nmap-redefine-the-python-library-dir.patch => 0001-Redefine-the-python-library-dir.patch} (72%)
 delete mode 100644 meta-oe/recipes-security/nmap/files/0001-include-time.h-for-time-structure-definition.patch
 delete mode 100644 meta-oe/recipes-security/nmap/files/0002-Fix-building-with-libc.patch
 create mode 100644 meta-oe/recipes-security/nmap/files/0002-Include-time.h-for-time-struct-definition.patch
 create mode 100644 meta-oe/recipes-security/nmap/files/0003-Fix-building-with-libc.patch
 delete mode 100644 meta-oe/recipes-security/nmap/files/nmap-replace-shtool-mkdir-with-coreutils-mkdir-command.patch
 rename meta-oe/recipes-security/nmap/{nmap_7.70.bb => nmap_7.80.bb} (73%)

diff --git a/meta-oe/recipes-security/nmap/files/nmap-redefine-the-python-library-dir.patch b/meta-oe/recipes-security/nmap/files/0001-Redefine-the-python-library-dir.patch
similarity index 72%
rename from meta-oe/recipes-security/nmap/files/nmap-redefine-the-python-library-dir.patch
rename to meta-oe/recipes-security/nmap/files/0001-Redefine-the-python-library-dir.patch
index 356b507..389f0e4 100644
--- a/meta-oe/recipes-security/nmap/files/nmap-redefine-the-python-library-dir.patch
+++ b/meta-oe/recipes-security/nmap/files/0001-Redefine-the-python-library-dir.patch
@@ -1,20 +1,17 @@
-[PATCH] redefine the python library install dir
+From 2c1af5be159b40bf666fad2088034fe0b7b88a3c Mon Sep 17 00:00:00 2001
+From: Scott Ellis <scott@jumpnowtek.com>
+Date: Sat, 14 Sep 2019 15:47:31 -0400
+Subject: [PATCH 1/3] Redefine the python library dir
 
-Upstream-Status: Pending
-
-If install-lib is not defined, it is always /usr/lib/, but it
-maybe /usr/lib64 for multilib
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
 ---
  Makefile.in | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 1bb062c..cced2fb 100644
+index 7ac5ae5..eee8863 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -311,7 +311,7 @@ build-zenmap: $(ZENMAPDIR)/setup.py $(ZENMAPDIR)/zenmapCore/Version.py
+@@ -377,7 +377,7 @@ build-zenmap: $(ZENMAPDIR)/setup.py $(ZENMAPDIR)/zenmapCore/Version.py
  
  install-zenmap: $(ZENMAPDIR)/setup.py
  	$(INSTALL) -d $(DESTDIR)$(bindir) $(DESTDIR)$(mandir)/man1
@@ -23,7 +20,7 @@ index 1bb062c..cced2fb 100644
  	$(INSTALL) -c -m 644 docs/zenmap.1 $(DESTDIR)$(mandir)/man1/
  # Create a symlink from nmapfe to zenmap if nmapfe doesn't exist or is
  # already a link.
-@@ -328,7 +328,7 @@ build-nping: $(NPINGDIR)/Makefile nbase_build nsock_build netutil_build $(NPINGD
+@@ -394,7 +394,7 @@ build-nping: $(NPINGDIR)/Makefile build-nbase build-nsock build-netutil $(NPINGD
  	@cd $(NPINGDIR) && $(MAKE)
  
  install-ndiff:
@@ -33,5 +30,5 @@ index 1bb062c..cced2fb 100644
  NSE_FILES = scripts/script.db scripts/*.nse
  NSE_LIB_LUA_FILES = nselib/*.lua nselib/*.luadoc
 -- 
-1.9.1
+2.7.4
 
diff --git a/meta-oe/recipes-security/nmap/files/0001-include-time.h-for-time-structure-definition.patch b/meta-oe/recipes-security/nmap/files/0001-include-time.h-for-time-structure-definition.patch
deleted file mode 100644
index 561c8c8..0000000
--- a/meta-oe/recipes-security/nmap/files/0001-include-time.h-for-time-structure-definition.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From c774f2b129fd5acd5647d92c57a2079ae638a62b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 20 Jan 2019 23:07:39 -0800
-Subject: [PATCH] include time.h for time structure definition
-
-Exposed by musl/clang
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- nmap_error.cc       | 1 +
- nping/EchoServer.cc | 1 +
- osscan.cc           | 1 +
- osscan2.cc          | 1 +
- service_scan.cc     | 1 +
- 5 files changed, 5 insertions(+)
-
-diff --git a/nmap_error.cc b/nmap_error.cc
-index 19beafb..ea14e08 100644
---- a/nmap_error.cc
-+++ b/nmap_error.cc
-@@ -135,6 +135,7 @@
- #include "xml.h"
- 
- #include <errno.h>
-+#include <time.h>
- 
- extern NmapOps o;
- 
-diff --git a/nping/EchoServer.cc b/nping/EchoServer.cc
-index 70f39b0..40cd4d6 100644
---- a/nping/EchoServer.cc
-+++ b/nping/EchoServer.cc
-@@ -137,6 +137,7 @@
- #include "NpingOps.h"
- #include "ProbeMode.h"
- #include <signal.h>
-+#include <time.h>
- 
- extern NpingOps o;
- extern EchoServer es;
-diff --git a/osscan.cc b/osscan.cc
-index f851f60..6ae0c83 100644
---- a/osscan.cc
-+++ b/osscan.cc
-@@ -149,6 +149,7 @@
- #  include <time.h>
- # endif
- #endif
-+#include <time.h>
- 
- #include <algorithm>
- #include <list>
-diff --git a/osscan2.cc b/osscan2.cc
-index e341947..887fbd2 100644
---- a/osscan2.cc
-+++ b/osscan2.cc
-@@ -147,6 +147,7 @@
- 
- #include <list>
- #include <math.h>
-+#include <time.h>
- 
- extern NmapOps o;
- #ifdef WIN32
-diff --git a/service_scan.cc b/service_scan.cc
-index 9780ae3..e07b940 100644
---- a/service_scan.cc
-+++ b/service_scan.cc
-@@ -145,6 +145,7 @@
- #include "nmap_tty.h"
- 
- #include <errno.h>
-+#include <time.h>
- 
- #if HAVE_OPENSSL
- /* OpenSSL 1.0.0 needs _WINSOCKAPI_ to be defined, otherwise it loads
diff --git a/meta-oe/recipes-security/nmap/files/0002-Fix-building-with-libc.patch b/meta-oe/recipes-security/nmap/files/0002-Fix-building-with-libc.patch
deleted file mode 100644
index 064be8f..0000000
--- a/meta-oe/recipes-security/nmap/files/0002-Fix-building-with-libc.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From 2a361989b5f84ec23ba7ccb6e527a5590ff55deb Mon Sep 17 00:00:00 2001
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
-index 40cd4d6..04433e1 100644
---- a/nping/EchoServer.cc
-+++ b/nping/EchoServer.cc
-@@ -282,14 +282,14 @@ int EchoServer::nep_listen_socket(){
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
-@@ -320,12 +320,12 @@ int EchoServer::nep_listen_socket(){
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
-@@ -561,7 +561,7 @@ clientid_t EchoServer::nep_match_headers(IPv4Header *ip4, IPv6Header *ip6, TCPHe
-                             nping_print(DBG_3, ";");
-                             /* The payload magic may affect the score only between
-                              * zero and 4 bytes. This is done to prevent long
--                             * common strings like "GET / HTTP/1.1\r\n" 
-+                             * common strings like "GET / HTTP/1.1\r\n"
-                              * increasing the score a lot and cause problems for
-                              * the matching logic. */
-                             current_score+= MIN(4, fspec->len)*FACTOR_PAYLOAD_MAGIC;
-@@ -571,7 +571,7 @@ clientid_t EchoServer::nep_match_headers(IPv4Header *ip4, IPv6Header *ip6, TCPHe
-                     default:
-                         nping_warning(QT_2, "Bogus field specifier found in client #%d context. Please report a bug", ctx->getIdentifier());
-                     break;
--                }           
-+                }
-             } /* End of field specifiers loop */
- 
-             nping_print(DBG_3, "%s() current_score=%.02f candidate_score=%.02f", __func__, current_score, candidate_score);
-@@ -650,7 +650,7 @@ clientid_t EchoServer::nep_match_packet(const u8 *pkt, size_t pktlen){
-                 }else{
-                     if( (tcplen=tcp.validate())==OP_FAILURE){
-                         return CLIENT_NOT_FOUND;
--                    }else{                        
-+                    }else{
-                         if( (int)pktlen > (iplen+tcplen) ){
-                            if( payload.storeRecvData(pkt+iplen+tcplen, pktlen-iplen-tcplen)!=OP_FAILURE)
-                                payload_included=true;
diff --git a/meta-oe/recipes-security/nmap/files/0002-Include-time.h-for-time-struct-definition.patch b/meta-oe/recipes-security/nmap/files/0002-Include-time.h-for-time-struct-definition.patch
new file mode 100644
index 0000000..9755288
--- /dev/null
+++ b/meta-oe/recipes-security/nmap/files/0002-Include-time.h-for-time-struct-definition.patch
@@ -0,0 +1,37 @@
+From 6decd89b609a2175156848e75b340a8166fbd647 Mon Sep 17 00:00:00 2001
+From: Scott Ellis <scott@jumpnowtek.com>
+Date: Sat, 14 Sep 2019 15:55:29 -0400
+Subject: [PATCH 2/3] Include time.h for time struct definition
+
+---
+ nping/EchoServer.cc | 1 +
+ osscan2.cc          | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/nping/EchoServer.cc b/nping/EchoServer.cc
+index ccdcf9c..c403aed 100644
+--- a/nping/EchoServer.cc
++++ b/nping/EchoServer.cc
+@@ -137,6 +137,7 @@
+ #include "NpingOps.h"
+ #include "ProbeMode.h"
+ #include <signal.h>
++#include <time.h>
+ 
+ extern NpingOps o;
+ extern EchoServer es;
+diff --git a/osscan2.cc b/osscan2.cc
+index aa31feb..89673e1 100644
+--- a/osscan2.cc
++++ b/osscan2.cc
+@@ -147,6 +147,7 @@
+ 
+ #include <list>
+ #include <math.h>
++#include <time.h>
+ 
+ extern NmapOps o;
+ #ifdef WIN32
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-security/nmap/files/0003-Fix-building-with-libc.patch b/meta-oe/recipes-security/nmap/files/0003-Fix-building-with-libc.patch
new file mode 100644
index 0000000..6c60f6a
--- /dev/null
+++ b/meta-oe/recipes-security/nmap/files/0003-Fix-building-with-libc.patch
@@ -0,0 +1,46 @@
+From dabe64926f7fc33ebe81291d75d7ddcb8128f48a Mon Sep 17 00:00:00 2001
+From: Scott Ellis <scott@jumpnowtek.com>
+Date: Sat, 14 Sep 2019 15:57:48 -0400
+Subject: [PATCH 3/3] Fix building with libc
+
+---
+ nping/EchoServer.cc | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/nping/EchoServer.cc b/nping/EchoServer.cc
+index c403aed..7b23a2a 100644
+--- a/nping/EchoServer.cc
++++ b/nping/EchoServer.cc
+@@ -282,12 +282,12 @@ int EchoServer::nep_listen_socket(){
+         server_addr6.sin6_len = sizeof(struct sockaddr_in6);
+     #endif
+     /* Bind to local address and the specified port */
+-    if( bind(master_sd, (struct sockaddr *)&server_addr6, sizeof(server_addr6)) != 0 ){
++    if( ::bind(master_sd, (struct sockaddr *)&server_addr6, sizeof(server_addr6)) != 0 ){
+         nping_warning(QT_3, "Failed to bind to source address %s. Trying to bind to port %d...", IPtoa(server_addr6.sin6_addr), port);
+         /* If the bind failed for the supplied address, just try again with in6addr_any */
+         if( o.spoofSource() ){
+             server_addr6.sin6_addr = in6addr_any;
+-            if( bind(master_sd, (struct sockaddr *)&server_addr6, sizeof(server_addr6)) != 0 ){
++            if( ::bind(master_sd, (struct sockaddr *)&server_addr6, sizeof(server_addr6)) != 0 ){
+                 nping_fatal(QT_3, "Could not bind to port %d (%s).", port, strerror(errno));
+             }else{ 
+                 nping_print(VB_1, "Server bound to port %d", port);
+@@ -320,12 +320,12 @@ int EchoServer::nep_listen_socket(){
+ #endif
+ 
+     /* Bind to local address and the specified port */
+-    if( bind(master_sd, (struct sockaddr *)&server_addr4, sizeof(server_addr4)) != 0 ){
++    if( ::bind(master_sd, (struct sockaddr *)&server_addr4, sizeof(server_addr4)) != 0 ){
+         nping_warning(QT_3, "Failed to bind to source address %s. Trying to bind to port %d...", IPtoa(server_addr4.sin_addr), port);
+         /* If the bind failed for the supplied address, just try again with in6addr_any */
+         if( o.spoofSource() ){
+             server_addr4.sin_addr.s_addr=INADDR_ANY;
+-            if( bind(master_sd, (struct sockaddr *)&server_addr4, sizeof(server_addr4)) != 0 ){
++            if( ::bind(master_sd, (struct sockaddr *)&server_addr4, sizeof(server_addr4)) != 0 ){
+                 nping_fatal(QT_3, "Could not bind to port %d (%s).", port, strerror(errno));
+             }else{
+                 nping_print(VB_1, "Server bound to port %d", port);
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-security/nmap/files/nmap-replace-shtool-mkdir-with-coreutils-mkdir-command.patch b/meta-oe/recipes-security/nmap/files/nmap-replace-shtool-mkdir-with-coreutils-mkdir-command.patch
deleted file mode 100644
index cfe043a..0000000
--- a/meta-oe/recipes-security/nmap/files/nmap-replace-shtool-mkdir-with-coreutils-mkdir-command.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-[PATCH] replace "./shtool mkdir" with coreutils mkdir command
-
-Upstream-Status: Pending
-
-"./shtool mkdir" is used when mkdir has not -p parameter, but mkdir in today
-most release has supportted the -p parameter, not need to use shtool, and it
-can not fix the race if two process are running mkdir to create same dir
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
----
- ncat/Makefile.in        | 4 ++--
- nmap-update/Makefile.in | 2 +-
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/ncat/Makefile.in b/ncat/Makefile.in
-index cfd306d..2166e08 100644
---- a/ncat/Makefile.in
-+++ b/ncat/Makefile.in
-@@ -163,11 +163,11 @@ $(NSOCKDIR)/libnsock.a: $(NSOCKDIR)/Makefile
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
-diff --git a/nmap-update/Makefile.in b/nmap-update/Makefile.in
-index 89ff928..93f48d8 100644
---- a/nmap-update/Makefile.in
-+++ b/nmap-update/Makefile.in
-@@ -37,7 +37,7 @@ $(NBASELIB):
- 	cd $(NBASEDIR) && $(MAKE)
- 
- install: nmap-update
--	$(SHTOOL) mkdir -f -p -m 755 $(DESTDIR)$(bindir) $(DESTDIR)$(mandir)/man1
-+	mkdir -p -m 755 $(DESTDIR)$(bindir) $(DESTDIR)$(mandir)/man1
- 	$(INSTALL) -c -m 755 nmap-update $(DESTDIR)$(bindir)
- 	$(STRIP) -x $(DESTDIR)$(bindir)/nmap-update
- 	$(INSTALL) -c -m 644 ../docs/nmap-update.1 $(DESTDIR)$(mandir)/man1/
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-security/nmap/nmap_7.70.bb b/meta-oe/recipes-security/nmap/nmap_7.80.bb
similarity index 73%
rename from meta-oe/recipes-security/nmap/nmap_7.70.bb
rename to meta-oe/recipes-security/nmap/nmap_7.80.bb
index b1b150a..2d66ef2 100644
--- a/meta-oe/recipes-security/nmap/nmap_7.70.bb
+++ b/meta-oe/recipes-security/nmap/nmap_7.80.bb
@@ -3,17 +3,16 @@ DESCRIPTION = "Nmap ("Network Mapper") is a free and open source (license) utili
 SECTION = "security"
 LICENSE = "GPL-2.0"
 
-LIC_FILES_CHKSUM = "file://COPYING;beginline=7;endline=12;md5=1489288f46af415fadc4e8b6345ab9f4"
+LIC_FILES_CHKSUM = "file://COPYING;beginline=7;endline=12;md5=66938a7e5b4c118eda78271de14874c2"
 
-SRC_URI = "http://nmap.org/dist/${BP}.tar.bz2 \
-           file://nmap-redefine-the-python-library-dir.patch \
-           file://nmap-replace-shtool-mkdir-with-coreutils-mkdir-command.patch \
-           file://0001-include-time.h-for-time-structure-definition.patch \
-           file://0002-Fix-building-with-libc.patch \
+SRCREV = "7ce92c68df276c4321525c2f754ffe2deb9eb920"
+SRC_URI = "git://github.com/nmap/nmap.git;branch=master \
+           file://0001-Redefine-the-python-library-dir.patch \
+           file://0002-Include-time.h-for-time-struct-definition.patch \
+           file://0003-Fix-building-with-libc.patch \
            "
 
-SRC_URI[md5sum] = "84eb6fbe788e0d4918c2b1e39421bf79"
-SRC_URI[sha256sum] = "847b068955f792f4cc247593aca6dc3dc4aae12976169873247488de147a6e18"
+S = "${WORKDIR}/git"
 
 inherit autotools-brokensep pkgconfig pythonnative
 
@@ -48,5 +47,3 @@ do_configure() {
 }
 
 FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR} ${datadir}/ncat"
-
-RDEPENDS_${PN} = "python"
-- 
2.7.4


