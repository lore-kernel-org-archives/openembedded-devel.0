Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8D74665D4F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Nov 2014 08:59:13 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43716370"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Nov 2014 16:56:00 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAK8wwRT026278
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Nov 2014 16:58:58 +0800
Received: from Fedora.g08.fujitsu.local (10.167.226.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 20 Nov 2014 16:59:18 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 20 Nov 2014 16:59:01 +0800
Message-ID: <1416473941-23508-1-git-send-email-qianl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1416368645-23882-1-git-send-email-qianl.fnst@cn.fujitsu.com>
References: <1416368645-23882-1-git-send-email-qianl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.40]
Subject: [PATCH v2] tiptop: Add new recipe
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
X-List-Received-Date: Thu, 20 Nov 2014 08:59:19 -0000
Content-Type: text/plain

Tiptop is a performance monitoring tool for Linux. It provides a
dynamic real-time view of the tasks running in the system. Tiptop
is very similar to the top utility, but most of the information
displayed comes from hardware counters.

Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
---
 .../files/tiptop-remove-path-of-libxml2.patch      | 28 ++++++++++++++++++++++
 meta-oe/recipes-extended/tiptop/tiptop_2.2.bb      | 15 ++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 meta-oe/recipes-extended/tiptop/files/tiptop-remove-path-of-libxml2.patch
 create mode 100644 meta-oe/recipes-extended/tiptop/tiptop_2.2.bb

diff --git a/meta-oe/recipes-extended/tiptop/files/tiptop-remove-path-of-libxml2.patch b/meta-oe/recipes-extended/tiptop/files/tiptop-remove-path-of-libxml2.patch
new file mode 100644
index 0000000..7499828
--- /dev/null
+++ b/meta-oe/recipes-extended/tiptop/files/tiptop-remove-path-of-libxml2.patch
@@ -0,0 +1,28 @@
+From 2f9cb586d6675371f9db8d4b62a4b339625d73a6 Mon Sep 17 00:00:00 2001
+From: Qian Lei <qianl.fnst@cn.fujitsu.com>
+Date: Thu, 20 Nov 2014 16:34:47 +0800
+Subject: [PATCH] tiptop: Remove the include path
+
+Remove the path and specify it in .bb file
+
+Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 6a71782..7408f82 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -31,7 +31,7 @@ AC_CHECK_LIB([xml2], [xmlParseFile],
+                   [have_xml2=yes;
+                   AC_DEFINE([HAVE_LIBXML2], [1], [Define to 1 if you have the `libxml2' library (-lxml2).])
+                   LIBS="-lxml2 $LIBS"
+-                  CFLAGS="$CFLAGS -I/usr/include/libxml2"],
++                  CFLAGS="$CFLAGS"],
+              [have_xml2=no])
+ fi
+ 
+-- 
+1.8.3.1
+
diff --git a/meta-oe/recipes-extended/tiptop/tiptop_2.2.bb b/meta-oe/recipes-extended/tiptop/tiptop_2.2.bb
new file mode 100644
index 0000000..d8a0de4
--- /dev/null
+++ b/meta-oe/recipes-extended/tiptop/tiptop_2.2.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Hardware performance monitoring counters"
+HOMEPAGE = "http://tiptop.gforge.inria.fr/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+DEPENDS = "ncurses libxml2"
+
+SRC_URI = "http://tiptop.gforge.inria.fr/releases/${BP}.tar.gz;name=tarball \
+           file://tiptop-remove-path-of-libxml2.patch \
+"
+SRC_URI[tarball.md5sum] = "74255a29acf44569db021b080ad3e3f7"
+SRC_URI[tarball.sha256sum] = "965cb99b16cb59df78363d83b62877ce8501b0aac1116a86bed8a16aa96b171d"
+
+EXTRA_OECONF = "CFLAGS="$CFLAGS -I${STAGING_INCDIR}/libxml2""
+
+inherit autotools-brokensep
-- 
1.8.3.1


