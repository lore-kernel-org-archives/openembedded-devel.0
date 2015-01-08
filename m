Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7777D72AF7
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Jan 2015 09:26:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="55743677"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Jan 2015 17:23:00 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t089Pqpr002412
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 8 Jan 2015 17:25:52 +0800
Received: from Fedora.g08.fujitsu.local (10.167.226.40) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 8 Jan 2015 17:26:35 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 8 Jan 2015 17:25:47 +0800
Message-ID: <1420709147-9784-1-git-send-email-qianl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <20150107115322.GL29986@jama>
References: <20150107115322.GL29986@jama>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.40]
Subject: [meta-oe][PATCH] libutempter: Fix compile error on arm
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
X-List-Received-Date: Thu, 08 Jan 2015 09:26:28 -0000
Content-Type: text/plain

| iface.c: In function 'utempter_add_record':
| <command-line>:0:12: error: expected expression before '/' token
| iface.c:46:35: note: in expansion of macro 'LIBEXECDIR'
|  #define UTEMPTER_DEFAULT_PATHNAME LIBEXECDIR "/utempter/utempter"

Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
---
 .../libutempter/0001-Modify-macro.patch            | 28 ++++++++++++++++++++++
 .../libutempter/libutempter-pierelro.patch         | 23 ++++++++++++++++++
 .../libutempter/libutempter_1.1.6.bb               | 11 ++++-----
 3 files changed, 56 insertions(+), 6 deletions(-)
 create mode 100644 meta-oe/recipes-support/libutempter/libutempter/0001-Modify-macro.patch
 create mode 100644 meta-oe/recipes-support/libutempter/libutempter/libutempter-pierelro.patch

diff --git a/meta-oe/recipes-support/libutempter/libutempter/0001-Modify-macro.patch b/meta-oe/recipes-support/libutempter/libutempter/0001-Modify-macro.patch
new file mode 100644
index 0000000..b5c518f
--- /dev/null
+++ b/meta-oe/recipes-support/libutempter/libutempter/0001-Modify-macro.patch
@@ -0,0 +1,28 @@
+From fe0721e3f533b54ed2f916365c0458aa2069c924 Mon Sep 17 00:00:00 2001
+From: Qian Lei <qianl.fnst@cn.fujitsu.com>
+Date: Thu, 8 Jan 2015 16:34:09 +0900
+Subject: [PATCH] Remove macro and use hardcode.
+
+Upstream-Status: Pending
+Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
+
+---
+ iface.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/iface.c b/iface.c
+index 5951d81..928ebfd 100644
+--- a/iface.c
++++ b/iface.c
+@@ -43,7 +43,7 @@
+        __result; }))
+ #endif
+ 
+-#define	UTEMPTER_DEFAULT_PATHNAME	LIBEXECDIR "/utempter/utempter"
++#define	UTEMPTER_DEFAULT_PATHNAME	"/usr/lib/libutempter/utempter/utempter"
+ 
+ static const char *utempter_pathname;
+ static int saved_fd = -1;
+-- 
+1.8.4.2
+
diff --git a/meta-oe/recipes-support/libutempter/libutempter/libutempter-pierelro.patch b/meta-oe/recipes-support/libutempter/libutempter/libutempter-pierelro.patch
new file mode 100644
index 0000000..c30a92d
--- /dev/null
+++ b/meta-oe/recipes-support/libutempter/libutempter/libutempter-pierelro.patch
@@ -0,0 +1,23 @@
+Port from fedora20
+
+Upstream-Status: Pending
+Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
+
+diff -up libutempter-1.1.6/Makefile.pierelro libutempter-1.1.6/Makefile
+--- libutempter-1.1.6/Makefile.pierelro	2010-11-04 18:14:53.000000000 +0100
++++ libutempter-1.1.6/Makefile	2013-01-24 15:58:06.241865564 +0100
+@@ -52,11 +52,12 @@ all: $(TARGETS)
+ 	$(COMPILE.c) -fPIC $< $(OUTPUT_OPTION)
+ 
+ $(PROJECT): utempter.c
+-	$(LINK.c) -Wl,-z,now,-stats $(LDLIBS) $< $(OUTPUT_OPTION)
++	$(LINK.c) -pie -fPIE -Wl,-z,relro,-z,now,-stats $(LDLIBS) \
++		$< $(OUTPUT_OPTION)
+ 
+ $(SHAREDLIB): iface.os $(MAP)
+ 	$(LINK.o) -shared \
+-		-Wl,-soname,$(SONAME),--version-script=$(MAP),-z,defs,-stats \
++		-Wl,-soname,$(SONAME),--version-script=$(MAP),-z,relro,-z,defs,-stats \
+ 		-lc $< $(OUTPUT_OPTION)
+ 
+ $(STATICLIB): iface.o
diff --git a/meta-oe/recipes-support/libutempter/libutempter_1.1.6.bb b/meta-oe/recipes-support/libutempter/libutempter_1.1.6.bb
index e1dccd6..6df0f19 100644
--- a/meta-oe/recipes-support/libutempter/libutempter_1.1.6.bb
+++ b/meta-oe/recipes-support/libutempter/libutempter_1.1.6.bb
@@ -4,15 +4,15 @@ This library provides interface for terminal emulators such as \
 screen and xterm to record user sessions to utmp and wtmp files."
 HOMEPAGE = "ftp://ftp.altlinux.org/pub/people/ldv/utempter"
 SECTION = "System Environment/Libraries"
-LICENSE = "GPLv2 GPLv2+ LGPLv2 MIT"
+LICENSE = "GPLv2 & GPLv2+ & LGPLv2 & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
-SRC_URI = "ftp://ftp.altlinux.org/pub/people/ldv/utempter/${BP}.tar.bz2"
+SRC_URI = "ftp://ftp.altlinux.org/pub/people/ldv/utempter/${BP}.tar.bz2 \
+           file://0001-Modify-macro.patch \
+           file://libutempter-pierelro.patch"
 SRC_URI[md5sum] = "b43827806923903aba2bc7cd3a2d45b7"
 SRC_URI[sha256sum] = "b898565f31ced7e5c1fa0a2eaa0f6ff0ed862b5fe375d26375b64bfbdfeac397"
 
-CFLAGS += "-DLIBEXECDIR=$(libexecdir)"
-
 do_compile() {
     oe_runmake                      \
         libdir=${libdir}            \
@@ -27,10 +27,9 @@ do_install() {
         includedir=${includedir}    \
         mandir=${mandir}
 
-        rm -f ${D}${libdir}/*.a
+    rm -f ${D}${libdir}/*.a
 }
 
 FILES_${PN} = "${libdir}/*.so.*"
 FILES_${PN} += "${libexecdir}/utempter/utempter"
-
 FILES_${PN}-dbg += "${libexecdir}/utempter/.debug/utempter"
-- 
1.8.3.1


