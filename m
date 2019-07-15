Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 77B6A6079F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jul 2019 20:51:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45nbLH3xslz4C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jul 2019 22:51:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1563223911;
	bh=DMYZtdrk07NEzLgvyfBX1rYXB6ogLDVae77I9cueL34=;
	h=From:To:Subject:Date:From;
	b=Ivl66KX4aUz67cStp6zNr8unhWRDHeX6mJzRm6GirB0zULZWHVJQoOogh/coXPRYR
	+O1BfEdK/1rwwWvVSK1iPgInNGRM7Y23GhHNn7LL4cQ4tm7z3GqRD93tQ4fj6VB8WA
	QIVkPlLKVJVLiCHVwSvX6VgNEIaW09K/aa+t/lpxSyH9+q0ahHk2AduiymD9gb+xQD
	wnd/yPKaKYZ4tHjMKI4VdepuymCeLz8cpAk7W8hKBenVL7CpIS8hyHXLZbrHsNh+MT
	7C9ZlU0jSOPDuIk7EVHx18nLldBhO1HAAHPQgS/a8Sb8ksbdDwmSXVZ2V4ne6FW/DB
	9B0YPUIXsvUx3Y9Lp2/xmX8HDHVmOO/0XEypgvS/z56/nt69nC9r385IRWFNIvyh9w
	3Awslb9EdAILX8S4155VZ3bNmQ8ujlNJFLT5gv73bzUPMiu8UpXKS3l0q1FOCzaHyN
	vE7CekIZOMo3zvG0CftH0luUmKzWHAWUvN9JQ0sV3KJpIkYWeVisbkx2dWtchww/AS
	tzIH/gEaBR9g9x0iOepa0rybzCpcWgsy93HOmuElLBNUPFFj9pd7iinUX0/qipbTlP
	xVLsh3rN5MjVHnowglsab3DYwhSmkZnaX81IJLB+QnXULAjB3ueA2qE0ze70sCzJrk
	kDpmiEj6ka7BqOyeYPMz1v0s=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Jul 2019 23:51:50 +0300
Message-Id: <20190715205150.20880-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] gpsd: Disable manpage building by config option instead of patching
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
X-List-Received-Date: Mon, 15 Jul 2019 20:51:52 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...le-html-and-man-docs-building-becaus.patch | 51 -------------------
 .../recipes-navigation/gpsd/gpsd_3.18.1.bb    |  2 +-
 2 files changed, 1 insertion(+), 52 deletions(-)
 delete mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-3.18.1/0003-SConstruct-disable-html-and-man-docs-building-becaus.patch

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.18.1/0003-SConstruct-disable-html-and-man-docs-building-becaus.patch b/meta-oe/recipes-navigation/gpsd/gpsd-3.18.1/0003-SConstruct-disable-html-and-man-docs-building-becaus.patch
deleted file mode 100644
index ba3d205d1..000000000
--- a/meta-oe/recipes-navigation/gpsd/gpsd-3.18.1/0003-SConstruct-disable-html-and-man-docs-building-becaus.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 697e2e9ff97487266d817cdd41bacc83f681e3d7 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sun, 29 Apr 2012 00:05:59 +0200
-Subject: [PATCH 4/4] SConstruct: disable html and man docs building because
- xmlto-native from OE is broken
-
-It will try to load dtd and fail:
-| xmlto man gpsctl.xml; mv `basename gpsctl.1` gpsctl.1
-| xmlto: /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/gpsd-3.4-r2/gpsd-3.4/gpsctl.xml does not validate (status 3)
-| xmlto: Fix document syntax or use --skip-validation option
-| I/O error : Attempt to load network entity http://www.oasis-open.org/docbook/xml/4.1.2/docbookx.dtd
-| /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/gpsd-3.4-r2/gpsd-3.4/gpsctl.xml:8: warning: failed to load external entity "http://www.oasis-open.org/docbook/xml/4.1.2/docbookx.dtd"
-|    "http://www.oasis-open.org/docbook/xml/4.1.2/docbookx.dtd">
-|                                                               ^
-| I/O error : Attempt to load network entity http://www.oasis-open.org/docbook/xml/4.1.2/docbookx.dtd
-| warning: failed to load external entity "http://www.oasis-open.org/docbook/xml/4.1.2/docbookx.dtd"
-| validity error : Could not load the external subset "http://www.oasis-open.org/docbook/xml/4.1.2/docbookx.dtd"
-| Document /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/gpsd-3.4-r2/gpsd-3.4/gpsctl.xml does not validate
-| mv: cannot stat `gpsctl.1': No such file or directory
-| scons: *** [gpsctl.1] Error 1
-| scons: building terminated because of errors.
-
-Upstream-Status: Inappropriate [disable feature]
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-Signed-off-by: Peter A. Bigot <pab@pabigot.com>
----
- SConstruct | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/SConstruct b/SConstruct
-index 3318bb48..a5bb756d 100644
---- a/SConstruct
-+++ b/SConstruct
-@@ -889,11 +889,11 @@ else:
- 
-     manbuilder = htmlbuilder = None
-     if env['manbuild']:
--        if config.CheckXsltproc():
-+        if False and config.CheckXsltproc():
-             build = "xsltproc --nonet %s $SOURCE >$TARGET"
-             htmlbuilder = build % docbook_html_uri
-             manbuilder = build % docbook_man_uri
--        elif WhereIs("xmlto"):
-+        elif False and WhereIs("xmlto"):
-             xmlto = "xmlto %s $SOURCE || mv `basename $TARGET` " \
-                     "`dirname $TARGET`"
-             htmlbuilder = xmlto % "html-nochunks"
--- 
-1.8.5.5
-
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb
index ce4b2b860..ebbc7f3b3 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb
@@ -13,7 +13,6 @@ EXTRANATIVEPATH += "chrpath-native"
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
     file://0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch \
-    file://0003-SConstruct-disable-html-and-man-docs-building-becaus.patch \
 "
 SRC_URI[md5sum] = "3b11f26b295010666b1767b308f90bc5"
 SRC_URI[sha256sum] = "5cb1e6d880ec9a52c62492dd0e3d77451b7c7ad625895bd652f6354215aec23e"
@@ -40,6 +39,7 @@ EXTRA_OESCONS = " \
     chrpath='yes' \
     systemd='${SYSTEMD_OESCONS}' \
     libdir='${libdir}' \
+    manbuild='false' \
     ${PACKAGECONFIG_CONFARGS} \
 "
 # this cannot be used, because then chrpath is not found and only static lib is built
-- 
2.17.1


