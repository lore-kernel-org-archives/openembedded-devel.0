Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BFEA376724
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Aug 2015 06:10:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t776AljD017321
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 6 Aug 2015 23:10:50 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Thu, 6 Aug 2015 23:10:46 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 7 Aug 2015 14:07:49 +0800
Message-ID: <1438927669-7774-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-webserver] apache: upgrade to 2.4.16
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Aug 2015 06:10:51 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

2.4.16 includes fixes for CVE-2015-3185, CVE-2015-0253 and CVE-2015-3183
remove a backport patch 0001-SECURITY-CVE-2015-0228-cve.mitre.org.patch

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...2-native_2.4.12.bb => apache2-native_2.4.16.bb} |  4 +-
 ...0001-SECURITY-CVE-2015-0228-cve.mitre.org.patch | 58 ----------------------
 .../{apache2_2.4.12.bb => apache2_2.4.16.bb}       |  5 +-
 3 files changed, 4 insertions(+), 63 deletions(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2-native_2.4.12.bb => apache2-native_2.4.16.bb} (91%)
 delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2/0001-SECURITY-CVE-2015-0228-cve.mitre.org.patch
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.12.bb => apache2_2.4.16.bb} (96%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.12.bb b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.16.bb
similarity index 91%
rename from meta-webserver/recipes-httpd/apache2/apache2-native_2.4.12.bb
rename to meta-webserver/recipes-httpd/apache2/apache2-native_2.4.16.bb
index 1704bd9..59109dd 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.12.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.16.bb
@@ -15,8 +15,8 @@ SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
 S = "${WORKDIR}/httpd-${PV}"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dbff5a2b542fa58854455bf1a0b94b83"
-SRC_URI[md5sum] = "b8dc8367a57a8d548a9b4ce16d264a13"
-SRC_URI[sha256sum] = "ad6d39edfe4621d8cc9a2791f6f8d6876943a9da41ac8533d77407a2e630eae4"
+SRC_URI[md5sum] = "2b19cd338fd526dd5a63c57b1e9bfee2"
+SRC_URI[sha256sum] = "ac660b47aaa7887779a6430404dcb40c0b04f90ea69e7bd49a40552e9ff13743"
 
 EXTRA_OECONF = "--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \
                 --with-apr-util=${STAGING_BINDIR_CROSS}/apu-1-config \
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0001-SECURITY-CVE-2015-0228-cve.mitre.org.patch b/meta-webserver/recipes-httpd/apache2/apache2/0001-SECURITY-CVE-2015-0228-cve.mitre.org.patch
deleted file mode 100644
index 264fde7..0000000
--- a/meta-webserver/recipes-httpd/apache2/apache2/0001-SECURITY-CVE-2015-0228-cve.mitre.org.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 643f0fcf3b8ab09a68f0ecd2aa37aafeda3e63ef Mon Sep 17 00:00:00 2001
-From: Eric Covener <covener@apache.org>
-Date: Wed, 4 Feb 2015 14:44:23 +0000
-Subject: [PATCH]   *) SECURITY: CVE-2015-0228 (cve.mitre.org)      mod_lua: A
- maliciously crafted websockets PING after a script      calls r:wsupgrade()
- can cause a child process crash.      [Edward Lu <Chaosed0 gmail.com>]
-
-Upstream-Status: BackPort
-
-Discovered by Guido Vranken <guidovranken gmail.com>
-
-Submitted by: Edward Lu
-Committed by: covener
-
-git-svn-id: https://svn.apache.org/repos/asf/httpd/httpd/trunk@1657261 13f79535-47bb-0310-9956-ffa450edef68
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
----
- modules/lua/lua_request.c | 6 +++++-
- 2 files changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/modules/lua/lua_request.c b/modules/lua/lua_request.c
-index dded599..1200c55 100644
---- a/modules/lua/lua_request.c
-+++ b/modules/lua/lua_request.c
-@@ -2227,6 +2227,7 @@ static int lua_websocket_read(lua_State *L)
- {
-     apr_socket_t *sock;
-     apr_status_t rv;
-+    int do_read = 1;
-     int n = 0;
-     apr_size_t len = 1;
-     apr_size_t plen = 0;
-@@ -2244,6 +2245,8 @@ static int lua_websocket_read(lua_State *L)
-     mask_bytes = apr_pcalloc(r->pool, 4);
-     sock = ap_get_conn_socket(r->connection);
- 
-+    while (do_read) { 
-+    do_read = 0;
-     /* Get opcode and FIN bit */
-     if (plaintext) {
-         rv = apr_socket_recv(sock, &byte, &len);
-@@ -2377,10 +2380,11 @@ static int lua_websocket_read(lua_State *L)
-                 frame[0] = 0x8A;
-                 frame[1] = 0;
-                 apr_socket_send(sock, frame, &plen); /* Pong! */
--                lua_websocket_read(L); /* read the next frame instead */
-+                do_read = 1;
-             }
-         }
-     }
-+    }
-     return 0;
- }
- 
--- 
-1.9.1
-
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.12.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.16.bb
similarity index 96%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.12.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.16.bb
index 7306e88..a44babd 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.12.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.16.bb
@@ -21,12 +21,11 @@ SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
            file://init \
            file://apache2-volatile.conf \
            file://apache2.service \
-           file://0001-SECURITY-CVE-2015-0228-cve.mitre.org.patch \
           "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dbff5a2b542fa58854455bf1a0b94b83"
-SRC_URI[md5sum] = "b8dc8367a57a8d548a9b4ce16d264a13"
-SRC_URI[sha256sum] = "ad6d39edfe4621d8cc9a2791f6f8d6876943a9da41ac8533d77407a2e630eae4"
+SRC_URI[md5sum] = "2b19cd338fd526dd5a63c57b1e9bfee2"
+SRC_URI[sha256sum] = "ac660b47aaa7887779a6430404dcb40c0b04f90ea69e7bd49a40552e9ff13743"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
1.9.1


