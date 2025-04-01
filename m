Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42556C36018
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 09:33:01 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.web11.14876.1743499979400613105
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Apr 2025 02:32:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
	by 156.147.23.51 with ESMTP; 1 Apr 2025 18:32:57 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.121.109)
	by 156.147.1.125 with ESMTP; 1 Apr 2025 18:32:57 +0900
X-Original-SENDERIP: 10.177.121.109
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [meta-oe][PATCH] libmcrypt: fix build with gcc-15.0.1
Date: Tue,  1 Apr 2025 18:32:48 +0900
Message-Id: <20250401093248.1363822-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Apr 2025 09:33:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116468

From: "mark.yang" <mark.yang@lge.com>

* see more details: http://errors.yoctoproject.org/Errors/Details/850150/
    des.c:199:9: error: too many arguments to function 'spinit'; expected 0, have 1
    199 |         spinit(key);
        |         ^~~~~~ ~~~
    des.c:38:56: note: declared here
    38 | static void permute_ip(), permute_fp(), perminit_ip(), spinit(),
        |                                                        ^~~~~~

* Move function forward declarations to .h file to fix the following errors:
    tripledes.c: In function '_mcrypt_desinit':
    tripledes.c:198:18: error: passing argument 1 of 'perminit' from incompatible pointer type [-Wincompatible-pointer-types]
    198 |         perminit(&key->iperm, ip);
        |                  ^~~~~~~~~~~
        |                  |
        |                  char (*)[16][16][8]
    In file included from tripledes.c:23:
    tripledes.h:11:27: note: expected 'char (*)[16][8]' but argument is of type 'char (*)[16][16][8]'
    11 | static void perminit(char perm[][16][8], char p[64]);
        |                      ~~~~~^~~~~~~~~~~~~
    tripledes.c:199:18: error: passing argument 1 of 'perminit' from incompatible pointer type [-Wincompatible-pointer-types]
    199 |         perminit(&key->fperm, fp);
        |                  ^~~~~~~~~~~
        |                  |
        |                  char (*)[16][16][8]
    tripledes.h:11:27: note: expected 'char (*)[16][8]' but argument is of type 'char (*)[16][16][8]'
    11 | static void perminit(char perm[][16][8], char p[64]);
        |                      ~~~~~^~~~~~~~~~~~~

	Changed parameter from &key to key
	perminit(key->iperm, ip);
	perminit(key->fperm, fp);

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 ...lated-unexpected-error-in-gcc-15.0.1.patch | 119 ++++++++++++++++++
 .../libmcrypt/libmcrypt_2.5.8.bb              |   5 +-
 2 files changed, 123 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-crypto/libmcrypt/libmcrypt/0001-fix-parameter-related-unexpected-error-in-gcc-15.0.1.patch

diff --git a/meta-oe/recipes-crypto/libmcrypt/libmcrypt/0001-fix-parameter-related-unexpected-error-in-gcc-15.0.1.patch b/meta-oe/recipes-crypto/libmcrypt/libmcrypt/0001-fix-parameter-related-unexpected-error-in-gcc-15.0.1.patch
new file mode 100644
index 0000000000..5e2afbab9d
--- /dev/null
+++ b/meta-oe/recipes-crypto/libmcrypt/libmcrypt/0001-fix-parameter-related-unexpected-error-in-gcc-15.0.1.patch
@@ -0,0 +1,119 @@
+From 046d1474a9a367d4b7772233e026855f1b55d58c Mon Sep 17 00:00:00 2001
+From: "mark.yang" <mark.yang@lge.com>
+Date: Tue, 1 Apr 2025 17:58:49 +0900
+Subject: [PATCH] fix parameter-related unexpected error in gcc 15.0.1
+
+* see more details: http://errors.yoctoproject.org/Errors/Details/850150/
+    des.c:199:9: error: too many arguments to function 'spinit'; expected 0, have 1
+    199 |         spinit(key);
+        |         ^~~~~~ ~~~
+    des.c:38:56: note: declared here
+    38 | static void permute_ip(), permute_fp(), perminit_ip(), spinit(),
+        |                                                        ^~~~~~
+
+* Move function forward declarations to .h file to fix the following errors:
+    tripledes.c: In function '_mcrypt_desinit':
+    tripledes.c:198:18: error: passing argument 1 of 'perminit' from incompatible pointer type [-Wincompatible-pointer-types]
+    198 |         perminit(&key->iperm, ip);
+        |                  ^~~~~~~~~~~
+        |                  |
+        |                  char (*)[16][16][8]
+    In file included from tripledes.c:23:
+    tripledes.h:11:27: note: expected 'char (*)[16][8]' but argument is of type 'char (*)[16][16][8]'
+    11 | static void perminit(char perm[][16][8], char p[64]);
+        |                      ~~~~~^~~~~~~~~~~~~
+    tripledes.c:199:18: error: passing argument 1 of 'perminit' from incompatible pointer type [-Wincompatible-pointer-types]
+    199 |         perminit(&key->fperm, fp);
+        |                  ^~~~~~~~~~~
+        |                  |
+        |                  char (*)[16][16][8]
+    tripledes.h:11:27: note: expected 'char (*)[16][8]' but argument is of type 'char (*)[16][16][8]'
+    11 | static void perminit(char perm[][16][8], char p[64]);
+        |                      ~~~~~^~~~~~~~~~~~~
+
+	Changed parameter from &key to key
+	perminit(key->iperm, ip);
+	perminit(key->fperm, fp);
+
+Signed-off-by: mark.yang <mark.yang@lge.com>
+
+Upstream-Status: Pending
+---
+ modules/algorithms/des.c       | 5 -----
+ modules/algorithms/des.h       | 6 ++++++
+ modules/algorithms/tripledes.c | 8 ++------
+ modules/algorithms/tripledes.h | 5 +++++
+ 4 files changed, 13 insertions(+), 11 deletions(-)
+
+diff --git a/modules/algorithms/des.c b/modules/algorithms/des.c
+index 5810811..695e740 100644
+--- a/modules/algorithms/des.c
++++ b/modules/algorithms/des.c
+@@ -35,11 +35,6 @@
+ 
+ /* #define	NULL	0 */
+ 
+-static void permute_ip(), permute_fp(), perminit_ip(), spinit(),
+-perminit_fp();
+-static word32 f();
+-
+-
+ /* Tables defined in the Data Encryption Standard documents */
+ 
+ /* initial permutation IP */
+diff --git a/modules/algorithms/des.h b/modules/algorithms/des.h
+index c333c5b..65dba63 100644
+--- a/modules/algorithms/des.h
++++ b/modules/algorithms/des.h
+@@ -5,3 +5,9 @@ typedef struct des_key {
+ 	char fperm[16][16][8];
+ } DES_KEY;
+ 
++static void permute_ip(char *inblock, DES_KEY * key, char *outblock);
++static void permute_fp(char *inblock, DES_KEY * key, char *outblock);
++static void perminit_ip(DES_KEY * key);
++static void spinit(DES_KEY * key);
++static void perminit_fp(DES_KEY * key);
++static word32 f(DES_KEY * key, register word32 r, register char *subkey);
+diff --git a/modules/algorithms/tripledes.c b/modules/algorithms/tripledes.c
+index 7b3c324..67985db 100644
+--- a/modules/algorithms/tripledes.c
++++ b/modules/algorithms/tripledes.c
+@@ -36,10 +36,6 @@
+ 
+ /* #define	NULL	0 */
+ 
+-static void permute(), perminit(), spinit();
+-static word32 f();
+-
+-
+ /* Tables defined in the Data Encryption Standard documents */
+ 
+ /* initial permutation IP */
+@@ -199,8 +195,8 @@ static int _mcrypt_desinit(TRIPLEDES_KEY * key)
+ 	spinit(key, 0);
+ 	spinit(key, 1);
+ 	spinit(key, 2);
+-	perminit(&key->iperm, ip);
+-	perminit(&key->fperm, fp);
++	perminit(key->iperm, ip);
++	perminit(key->fperm, fp);
+ 
+ 
+ 	return 0;
+diff --git a/modules/algorithms/tripledes.h b/modules/algorithms/tripledes.h
+index dec7682..10c7bc6 100644
+--- a/modules/algorithms/tripledes.h
++++ b/modules/algorithms/tripledes.h
+@@ -7,3 +7,8 @@ typedef struct triple_des_key {
+ 
+ } TRIPLEDES_KEY;
+ 
++static void permute(char *inblock, char perm[16][16][8], char *outblock);
++static void perminit(char perm[16][16][8], char p[64]);
++static void spinit(TRIPLEDES_KEY * key, int pos);
++static word32 f(TRIPLEDES_KEY * key, int pos, register word32 r, register char *subkey);
++
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb b/meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb
index a04fafba55..c55a01d3b9 100644
--- a/meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb
+++ b/meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb
@@ -4,7 +4,10 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff"
 DEPENDS = "libtool"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/mcrypt/Libmcrypt/${PV}/libmcrypt-${PV}.tar.gz"
+SRC_URI = " \
+    ${SOURCEFORGE_MIRROR}/project/mcrypt/Libmcrypt/${PV}/libmcrypt-${PV}.tar.gz \
+    file://0001-fix-parameter-related-unexpected-error-in-gcc-15.0.1.patch \
+"
 
 SRC_URI[sha256sum] = "e4eb6c074bbab168ac47b947c195ff8cef9d51a211cdd18ca9c9ef34d27a373e"
 
-- 
2.34.1


