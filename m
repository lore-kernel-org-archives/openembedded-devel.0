Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5A46A72730
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Jan 2015 03:01:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="55791126"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Jan 2015 10:58:26 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t0931HpG010204
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 9 Jan 2015 11:01:17 +0800
Received: from Fedora.g08.fujitsu.local (10.167.226.40) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 9 Jan 2015 11:01:50 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 9 Jan 2015 11:01:08 +0800
Message-ID: <1420772468-29246-1-git-send-email-qianl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <20150108111735.GD3972@jama>
References: <20150108111735.GD3972@jama>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.40]
Subject: [meta-oe][PATCH v2] libutempter: Fix compile error
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
X-List-Received-Date: Fri, 09 Jan 2015 03:01:55 -0000
Content-Type: text/plain

| iface.c: In function 'utempter_add_record':
| <command-line>:0:12: error: expected expression before '/' token
| iface.c:46:35: note: in expansion of macro 'LIBEXECDIR'
|  #define UTEMPTER_DEFAULT_PATHNAME LIBEXECDIR "/utempter/utempter"

Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
---
 .../libutempter/0001-Fix-macro-error.patch         | 36 ++++++++++++++++++++++
 .../libutempter/libutempter_1.1.6.bb               | 10 +++---
 2 files changed, 41 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-support/libutempter/libutempter/0001-Fix-macro-error.patch

diff --git a/meta-oe/recipes-support/libutempter/libutempter/0001-Fix-macro-error.patch b/meta-oe/recipes-support/libutempter/libutempter/0001-Fix-macro-error.patch
new file mode 100644
index 0000000..8140ea3
--- /dev/null
+++ b/meta-oe/recipes-support/libutempter/libutempter/0001-Fix-macro-error.patch
@@ -0,0 +1,36 @@
+From fc2bd592ad17d1c2a2a989750e69dfaedc28c633 Mon Sep 17 00:00:00 2001
+From: Qian Lei <qianl.fnst@cn.fujitsu.com>
+Date: Fri, 9 Jan 2015 10:40:29 +0800
+Subject: [PATCH] Fix macro error
+
+compile error when build on almost all architectures.
+
+Upstream-Status: Pending
+Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
+---
+ iface.c | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/iface.c b/iface.c
+index 5951d81..27793f0 100644
+--- a/iface.c
++++ b/iface.c
+@@ -43,7 +43,14 @@
+        __result; }))
+ #endif
+ 
+-#define	UTEMPTER_DEFAULT_PATHNAME	LIBEXECDIR "/utempter/utempter"
++#ifdef  LIBEXECDIR
++#  define CAT_PATH(DIR1,DIR2)           DIR1##DIR2
++#  define RAW_UTEMPTER_PATH             CAT_PATH(LIBEXECDIR,/utempter/utempter)
++#else
++#  define RAW_UTEMPTER_PATH             /usr/lib/libtempter/utempter/utempter
++#endif
++#define STR_PATH(RAW_STR)               #RAW_STR
++#define UTEMPTER_DEFAULT_PATHNAME       STR_PATH(RAW_UTEMPTER_PATH)
+ 
+ static const char *utempter_pathname;
+ static int saved_fd = -1;
+-- 
+1.8.3.1
+
diff --git a/meta-oe/recipes-support/libutempter/libutempter_1.1.6.bb b/meta-oe/recipes-support/libutempter/libutempter_1.1.6.bb
index 30a6896..f84e649 100644
--- a/meta-oe/recipes-support/libutempter/libutempter_1.1.6.bb
+++ b/meta-oe/recipes-support/libutempter/libutempter_1.1.6.bb
@@ -7,16 +7,17 @@ SECTION = "System Environment/Libraries"
 LICENSE = "GPLv2 & GPLv2+ & LGPLv2 & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
-SRC_URI = "ftp://ftp.altlinux.org/pub/people/ldv/utempter/${BP}.tar.bz2"
+SRC_URI = "ftp://ftp.altlinux.org/pub/people/ldv/utempter/${BP}.tar.bz2 \
+           file://0001-Fix-macro-error.patch"
 SRC_URI[md5sum] = "b43827806923903aba2bc7cd3a2d45b7"
 SRC_URI[sha256sum] = "b898565f31ced7e5c1fa0a2eaa0f6ff0ed862b5fe375d26375b64bfbdfeac397"
 
-CFLAGS += "-DLIBEXECDIR=$(libexecdir)"
+CFLAGS += "-DLIBEXECDIR=${libexecdir}"
 
 do_compile() {
     oe_runmake                      \
         libdir=${libdir}            \
-        libexecdir=${libexecdir}    \
+        libexecdir=${libexecdir}
 }
 
 do_install() {
@@ -27,10 +28,9 @@ do_install() {
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


