Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C37DE6FFE8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2016 01:08:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6I18Vud016755
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jul 2016 18:08:31 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Sun, 17 Jul 2016 18:08:30 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 18 Jul 2016 09:06:05 +0800
Message-ID: <1468803966-9809-2-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <1468803966-9809-1-git-send-email-kai.kang@windriver.com>
References: <1468803966-9809-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] tokyocabinet: add recipe
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
X-List-Received-Date: Mon, 18 Jul 2016 01:08:30 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

tokyocabinet is a modern implementation of DBM. And we will use it as
default database for cfengine.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../remove-hard-coded-include-and-lib-paths.patch  | 43 ++++++++++++++++++++++
 .../tokyocabinet/tokyocabinet_1.4.48.bb            | 27 ++++++++++++++
 2 files changed, 70 insertions(+)
 create mode 100644 meta-oe/recipes-support/tokyocabinet/tokyocabinet/remove-hard-coded-include-and-lib-paths.patch
 create mode 100644 meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb

diff --git a/meta-oe/recipes-support/tokyocabinet/tokyocabinet/remove-hard-coded-include-and-lib-paths.patch b/meta-oe/recipes-support/tokyocabinet/tokyocabinet/remove-hard-coded-include-and-lib-paths.patch
new file mode 100644
index 0000000..a8ab23d
--- /dev/null
+++ b/meta-oe/recipes-support/tokyocabinet/tokyocabinet/remove-hard-coded-include-and-lib-paths.patch
@@ -0,0 +1,43 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+There are hardcode paths in configure.in eg: /usr/include, $HOME/include etc.
+These paths will cause Makefile to search host path when doing cross-compiling.
+and bitbake will prompt this as an error. So remove them.
+
+Signed-off-by: Song.Li <Song.Li@windriver.com>
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ configure.in |   10 ++--------
+ 1 file changed, 2 insertions(+), 8 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index bcfd5bc..5b24947 100644
+--- a/configure.in
++++ b/configure.in
+@@ -32,21 +32,15 @@ MYPCFILES="tokyocabinet.pc"
+ 
+ # Building flags
+ MYCFLAGS="-std=c99 -Wall -fPIC -fsigned-char -O2"
+-MYCPPFLAGS="-I. -I\$(INCLUDEDIR) -I$HOME/include -I/usr/local/include"
++MYCPPFLAGS="-I."
+ MYCPPFLAGS="$MYCPPFLAGS -DNDEBUG -D_GNU_SOURCE=1 -D_REENTRANT -D__EXTENSIONS__"
+-MYLDFLAGS="-L. -L\$(LIBDIR) -L$HOME/lib -L/usr/local/lib"
++MYLDFLAGS="-L."
+ MYCMDLDFLAGS=""
+ MYRUNPATH="\$(LIBDIR)"
+ MYLDLIBPATHENV="LD_LIBRARY_PATH"
+ MYPOSTCMD="true"
+ 
+ # Building paths
+-PATH="$PATH:$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"
+-PATH="$PATH:/opt/SUNWspro/bin:/usr/ccs/bin:/usr/xpg4/bin:/usr/xpg6/bin:/usr/ucb"
+-CPATH="$HOME/include:/usr/local/include:$CPATH"
+-LIBRARY_PATH="$HOME/lib:/usr/local/lib:$LIBRARY_PATH"
+-LD_LIBRARY_PATH="$HOME/lib:/usr/local/lib:$LD_LIBRARY_PATH"
+-PKG_CONFIG_PATH="$HOME/lib/pkgconfig:/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH"
+ export PATH CPATH LIBRARY_PATH LD_LIBRARY_PATH PKG_CONFIG_PATH
+ 
+ 
+-- 
+1.7.9.5
+
diff --git a/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb b/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb
new file mode 100644
index 0000000..9f75cf0
--- /dev/null
+++ b/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb
@@ -0,0 +1,27 @@
+#
+# Copyright (C) 2012 - 2016 Wind River Systems, Inc.
+#
+SUMMARY = "A modern implementation of DBM"
+
+DESCRIPTION = "Tokyo Cabinet is a library of routines for managing a database. \
+The database is a simple data file containing records, each is a pair of a key \
+and a value. Every key and value is serial bytes with variable length. \
+Both binary data and character string can be used as a key and a value. \
+There is neither concept of data tables nor data types. \
+Records are organized in hash table, B+ tree, or fixed-length array."
+
+HOMEPAGE = "http://fallabs.com/tokyocabinet/"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
+
+SRC_URI = "http://fallabs.com/tokyocabinet/${BP}.tar.gz \
+           file://remove-hard-coded-include-and-lib-paths.patch \
+"
+
+SRC_URI[md5sum] = "fd03df6965f8f56dd5b8518ca43b4f5e"
+SRC_URI[sha256sum] = "a003f47c39a91e22d76bc4fe68b9b3de0f38851b160bbb1ca07a4f6441de1f90"
+
+DEPENDS = "bzip2 zlib"
+
+inherit autotools-brokensep
-- 
2.6.1


