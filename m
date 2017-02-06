Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 90F2F71987
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Feb 2017 03:46:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v163kLcm006033
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 5 Feb 2017 19:46:21 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Sun, 5 Feb 2017 19:46:20 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 6 Feb 2017 11:41:00 +0800
Message-ID: <20170206034100.31898-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libatasmart: unify the complier and CFLAGS for host build
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
X-List-Received-Date: Mon, 06 Feb 2017 03:46:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Mingli Yu <Mingli.Yu@windriver.com>

* When build libatasmart, we need first build strpool in host
  env. To build strpool, the compiler is host compiler, but
  the CFLAGS and LDFLAGS are for cross-compiler, so unify them
  to fix below error.
  | make -C strpool strpool
  | make[1]: Entering directory '../libatasmart/0.19-r0/build/strpool'
  | gcc  -DHAVE_CONFIG_H -I. -I../../git/strpool -I..    -isystem../build/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -O2 -pipe -g -fstack-protector-strong -pie -fpie -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -c -o strpool.o `test -f '../strpool.c' || echo '../../git/strpool/'`../strpool.c
  | gcc: error: unrecognized command line option ‘-fstack-protector-strong’
  | make[1]: *** [Makefile:404: strpool.o] Error 1

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 ...efile.am-add-CFLAGS-and-LDFLAGS-definiton.patch | 41 ++++++++++++++++++++++
 .../libatasmart/libatasmart_0.19.bb                |  4 ++-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/libatasmart/files/0001-Makefile.am-add-CFLAGS-and-LDFLAGS-definiton.patch

diff --git a/meta-oe/recipes-support/libatasmart/files/0001-Makefile.am-add-CFLAGS-and-LDFLAGS-definiton.patch b/meta-oe/recipes-support/libatasmart/files/0001-Makefile.am-add-CFLAGS-and-LDFLAGS-definiton.patch
new file mode 100644
index 0000000000..8c867accaa
--- /dev/null
+++ b/meta-oe/recipes-support/libatasmart/files/0001-Makefile.am-add-CFLAGS-and-LDFLAGS-definiton.patch
@@ -0,0 +1,41 @@
+From 75c1d3b8667328d874590a5321eb244256b7d932 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <Mingli.Yu@windriver.com>
+Date: Wed, 18 Jan 2017 07:35:58 +0000
+Subject: [PATCH] Makefile.am: add CFLAGS and LDFLAGS definiton
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+* When build libatasmart, we need first build strpool in host
+  env. To build strpool, the compiler is host compiler, but
+  the CFLAGS and LDFLAGS are for cross-compiler, so unify them
+  to fix below error.
+  | make -C strpool strpool
+  | make[1]: Entering directory '../libatasmart/0.19-r0/build/strpool'
+  | gcc  -DHAVE_CONFIG_H -I. -I../../git/strpool -I..    -isystem../build/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -O2 -pipe -g -fstack-protector-strong -pie -fpie -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -c -o strpool.o `test -f '../strpool.c' || echo '../../git/strpool/'`../strpool.c
+  | gcc: error: unrecognized command line option ‘-fstack-protector-strong’
+  | make[1]: *** [Makefile:404: strpool.o] Error 1
+
+Upstream-Status: Pending
+
+Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
+---
+ strpool/Makefile.am | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/strpool/Makefile.am b/strpool/Makefile.am
+index b041cea..013fcd3 100644
+--- a/strpool/Makefile.am
++++ b/strpool/Makefile.am
+@@ -17,6 +17,8 @@
+ # <http://www.gnu.org/licenses/>.
+ 
+ CC = @CC_FOR_BUILD@
++CFLAGS = @BUILD_CFLAGS@
++LDFLAGS = @BUILD_LDFLAGS@
+ AM_CFLAGS = @BUILD_CFLAGS@
+ AM_LDFLAGS = @BUILD_LDFLAGS@
+ 
+-- 
+2.11.0
+
diff --git a/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb b/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
index 16657b4b13..4cfb732932 100644
--- a/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
+++ b/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
@@ -5,7 +5,9 @@ LIC_FILES_CHKSUM = "file://LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1"
 DEPENDS = "udev"
 
 SRCREV = "de6258940960443038b4c1651dfda3620075e870"
-SRC_URI = "git://git.0pointer.de/libatasmart.git"
+SRC_URI = "git://git.0pointer.de/libatasmart.git \
+           file://0001-Makefile.am-add-CFLAGS-and-LDFLAGS-definiton.patch \
+"
 
 S = "${WORKDIR}/git"
 
-- 
2.11.0


