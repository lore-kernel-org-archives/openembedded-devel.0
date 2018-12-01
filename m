Return-Path: <niko.mauno@iki.fi>
Received: from sypressi2.dnainternet.net (sypressi3.dnainternet.net
	[83.102.40.158])
	by mail.openembedded.org (Postfix) with ESMTP id 3EAE46D457
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Dec 2018 18:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by sypressi2.dnainternet.net (Postfix) with ESMTP id 6517616CE2;
	Sat,  1 Dec 2018 19:58:03 +0200 (EET)
X-Virus-Scanned: DNA Internet at dnainternet.net
X-Spam-Flag: NO
X-Spam-Score: 0.652
X-Spam-Level: 
X-Spam-Status: No, score=0.652 tagged_above=-9999 required=6
	tests=[SPF_NEUTRAL=0.652] autolearn=disabled
Received: from sypressi2.dnainternet.net ([83.102.40.158])
	by localhost (sypressi2.dnainternet.net [127.0.0.1]) (DNA Internet,
	port 10041)
	with ESMTP id 2BWkHhciBj7w; Sat,  1 Dec 2018 19:58:01 +0200 (EET)
Received: from omenapuu2.dnainternet.net (omenapuu2.dnainternet.net
	[83.102.40.54])
	by sypressi2.dnainternet.net (Postfix) with ESMTP id 6E2D216CD8;
	Sat,  1 Dec 2018 19:58:01 +0200 (EET)
Received: from localhost.localdomain (82-181-15-94.bb.dnainternet.fi
	[82.181.15.94])
	by omenapuu2.dnainternet.net (Postfix) with ESMTP id 06E5D270;
	Sat,  1 Dec 2018 19:57:57 +0200 (EET)
From: Niko Mauno <niko.mauno@iki.fi>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Dec 2018 19:57:10 +0200
Message-Id: <20181201175714.119435-3-niko.mauno@iki.fi>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181201175714.119435-1-niko.mauno@iki.fi>
References: <20181201175714.119435-1-niko.mauno@iki.fi>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/7] python-pygobject: Drop redundant dependencies
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
X-List-Received-Date: Sat, 01 Dec 2018 18:03:48 -0000
Content-Transfer-Encoding: 8bit

Simplify recipe by reflecting following changes introduced to Pythonv3
variant of this recipe in commits
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta?id=b663374cf41465c6dc94001d6fa73a5523542fb6
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta?id=521ea98b2c622f5ae7e6d18849a0379fa7ed4e90
in which the gnome-common dependency was left out due to pygobject
moving to autoconf-archive, and remaining configure.ac patch file
was also deemed unnecessary.

Signed-off-by: Niko Mauno <niko.mauno@iki.fi>
---
 ...-sysroot-path-to-GI_DATADIR-don-t-se.patch | 28 -------------------
 .../python/python-pygobject_3.28.3.bb         |  3 +-
 2 files changed, 1 insertion(+), 30 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/python/python-pygobject/0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch

diff --git a/meta-oe/recipes-devtools/python/python-pygobject/0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch b/meta-oe/recipes-devtools/python/python-pygobject/0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch
deleted file mode 100644
index 9a11442f1..000000000
--- a/meta-oe/recipes-devtools/python/python-pygobject/0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 5e5350d730f85957a42c6d846d347d080e7dd996 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 23 Oct 2015 12:40:34 +0300
-Subject: [PATCH] configure.ac: add sysroot path to GI_DATADIR; don't set
- introspection scanner and compiler paths
-
-Upstream-Status: Pending [review on oe-core maillist]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- configure.ac | 8 +-------
- 1 file changed, 1 insertion(+), 7 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 2c0cfbd..cfcb3bf 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -155,7 +155,7 @@ PKG_CHECK_MODULES(GI,
- 
- GOBJECT_INTROSPECTION_CHECK(introspection_required_version)
- 
--GI_DATADIR=$($PKG_CONFIG --variable=gidatadir gobject-introspection-1.0)
-+GI_DATADIR=$PKG_CONFIG_SYSROOT_DIR$($PKG_CONFIG --variable=gidatadir gobject-introspection-1.0)
- AC_SUBST(GI_DATADIR)
- 
- if test "$enable_cairo" != no; then
--- 
-2.1.4
-
diff --git a/meta-oe/recipes-devtools/python/python-pygobject_3.28.3.bb b/meta-oe/recipes-devtools/python/python-pygobject_3.28.3.bb
index 4edf00808..fb4a0b181 100644
--- a/meta-oe/recipes-devtools/python/python-pygobject_3.28.3.bb
+++ b/meta-oe/recipes-devtools/python/python-pygobject_3.28.3.bb
@@ -6,12 +6,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 
 inherit autotools pkgconfig gnomebase gobject-introspection distutils-base
 
-DEPENDS += "gnome-common-native python glib-2.0"
+DEPENDS += "python glib-2.0"
 
 SRCNAME="pygobject"
 SRC_URI = " \
     http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.xz \
-    file://0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch \
 "
 
 SRC_URI[md5sum] = "3bac63c86bb963aa401f97859464aa90"
-- 
2.19.2


