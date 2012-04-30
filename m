Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SOkM0-0005DC-Do
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Apr 2012 08:45:00 +0200
Received: by mail-we0-f175.google.com with SMTP id a1so1806484wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2012 23:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=cBMbO1WG1Hm+vhVYOH4jK9RdruhRcH1ACMslm21REBg=;
	b=0EShRfEkiPGqis5EAipTG5C6vfsPCbNDdnLhluGlqwvfD49zV4DbQc81VaoMt457ZR
	S9HlhPH8dGKunF7aKhGW4nJrAayWNBxTFYms+Q+8yQmT+Pf8gE4QtumHGclW7e70zpZF
	2Lh2VG9OeBwaJgxbifz3ys5Ggw8iroJFBHlSsO82cbW2wyJvQg6ZfyDDwjYA2xsZqFm1
	ZDP45A7uxHuAGrLuDGoutAXdGFYmePu1jgVx77nje2axWvUWXmNPkNex8XaFslnFwuZV
	MVmI31Edx2ESSKhYImrTfGxqXB58QCh1KWe9zTPuAeW/U8iOhVNLphErzYZUtjrozDgf
	jC5w==
Received: by 10.216.132.229 with SMTP id o79mr3953392wei.64.1335767720411;
	Sun, 29 Apr 2012 23:35:20 -0700 (PDT)
Received: from localhost ([94.230.152.246]) by mx.google.com with ESMTPS id
	ev10sm26415559wid.10.2012.04.29.23.35.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Apr 2012 23:35:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Apr 2012 08:33:13 +0200
Message-Id: <c688085b4c96c169ca853bf91b6fee54f4cd983d.1335767139.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1335767139.git.Martin.Jansa@gmail.com>
References: <cover.1335767139.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1335767139.git.Martin.Jansa@gmail.com>
References: <cover.1335767139.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 16/16] gpsd: disable docs generation
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Apr 2012 06:45:00 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...disable-html-and-man-docs-building-becaus.patch |   49 ++++++++++++++++++++
 meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb        |    1 +
 meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb        |    1 +
 meta-oe/recipes-navigation/gpsd/gpsd_git.bb        |    1 +
 4 files changed, 52 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/0001-SConstruct-disable-html-and-man-docs-building-becaus.patch

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd/0001-SConstruct-disable-html-and-man-docs-building-becaus.patch b/meta-oe/recipes-navigation/gpsd/gpsd/0001-SConstruct-disable-html-and-man-docs-building-becaus.patch
new file mode 100644
index 0000000..9db2432
--- /dev/null
+++ b/meta-oe/recipes-navigation/gpsd/gpsd/0001-SConstruct-disable-html-and-man-docs-building-becaus.patch
@@ -0,0 +1,49 @@
+From ca1a781afbd68697ef2f573557f1f93ec7ab8d3c Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sun, 29 Apr 2012 00:05:59 +0200
+Subject: [PATCH] SConstruct: disable html and man docs building because
+ xmlto-native from OE is broken
+
+It will try to load dtd and fail:
+| xmlto man gpsctl.xml; mv `basename gpsctl.1` gpsctl.1
+| xmlto: /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/gpsd-3.4-r2/gpsd-3.4/gpsctl.xml does not validate (status 3)
+| xmlto: Fix document syntax or use --skip-validation option
+| I/O error : Attempt to load network entity http://www.oasis-open.org/docbook/xml/4.1.2/docbookx.dtd
+| /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/gpsd-3.4-r2/gpsd-3.4/gpsctl.xml:8: warning: failed to load external entity "http://www.oasis-open.org/docbook/xml/4.1.2/docbookx.dtd"
+|    "http://www.oasis-open.org/docbook/xml/4.1.2/docbookx.dtd">
+|                                                               ^
+| I/O error : Attempt to load network entity http://www.oasis-open.org/docbook/xml/4.1.2/docbookx.dtd
+| warning: failed to load external entity "http://www.oasis-open.org/docbook/xml/4.1.2/docbookx.dtd"
+| validity error : Could not load the external subset "http://www.oasis-open.org/docbook/xml/4.1.2/docbookx.dtd"
+| Document /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/gpsd-3.4-r2/gpsd-3.4/gpsctl.xml does not validate
+| mv: cannot stat `gpsctl.1': No such file or directory
+| scons: *** [gpsctl.1] Error 1
+| scons: building terminated because of errors.
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ SConstruct |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/SConstruct b/SConstruct
+index 9c0f751..8236abb 100644
+--- a/SConstruct
++++ b/SConstruct
+@@ -560,12 +560,12 @@ size_t strlcpy(/*@out@*/char *dst, /*@in@*/const char *src, size_t size);
+ 
+ 
+ manbuilder = mangenerator = htmlbuilder = None
+-if config.CheckXsltproc():
++if False and config.CheckXsltproc():
+     mangenerator = 'xsltproc'
+     build = "xsltproc --nonet %s $SOURCE >$TARGET"
+     htmlbuilder = build % docbook_html_uri
+     manbuilder = build % docbook_man_uri
+-elif WhereIs("xmlto"):
++elif False and WhereIs("xmlto"):
+     mangenerator = 'xmlto'
+     htmlbuilder = "xmlto html-nochunks $SOURCE; mv `basename $TARGET` $TARGET"
+     manbuilder = "xmlto man $SOURCE; mv `basename $TARGET` $TARGET"
+-- 
+1.7.8.6
+
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
index 8cd806f..7f6d0ba 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
@@ -11,6 +11,7 @@ SRC_URI = "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz \
   file://0002-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch \
   file://0004-SConstruct-remove-rpath.patch \
   file://0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch \
+  file://0001-SConstruct-disable-html-and-man-docs-building-becaus.patch \
   file://gpsd-default \
   file://gpsd \
   file://60-gpsd.rules \
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb
index a1c8f9f..92060b2 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz \
   file://0003-Revert-The-strptime-prototype-is-not-provided-unless.patch \
   file://0004-SConstruct-remove-rpath.patch \
   file://0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch \
+  file://0001-SConstruct-disable-html-and-man-docs-building-becaus.patch \
   file://gpsd-default \
   file://gpsd \
   file://60-gpsd.rules \
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_git.bb b/meta-oe/recipes-navigation/gpsd/gpsd_git.bb
index 68f0b9d..2d01a77 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_git.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_git.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://git.sv.gnu.org/gpsd.git;protocol=git;branch=master \
   file://0003-Revert-The-strptime-prototype-is-not-provided-unless.patch \
   file://0004-SConstruct-remove-rpath.patch \
   file://0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch \
+  file://0001-SConstruct-disable-html-and-man-docs-building-becaus.patch \
   file://gpsd-default \
   file://gpsd \
   file://60-gpsd.rules \
-- 
1.7.8.6



