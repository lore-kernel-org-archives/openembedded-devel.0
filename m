Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 9253F75A52
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Oct 2015 22:30:44 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so3276029wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Oct 2015 15:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IWD/EV1ar4gzXrfGTH8a8i8CocsUttF3GKdntoBBrIA=;
	b=TPGUHAwpfhLeW2XyQmmRAtpyKlnGdrT/xOzfmogXzEobYQ7IMYhFFU1OgqYrriKW3q
	UTyVEBXBxffC+gvl5aZBwpOCuThO7UIrk3v9hDYCRoeVnzRN9fuX0TNWcEyWodzCT8gq
	ijP769afEoBUa8l2U+qcCtpIn06opsyCj+5NBNFPHdEXMxrW33lv9Ub2U0VKu8EsjCQP
	5GkSuK+X73UHsbYUGDkfQedlvVYHBbfXK6YosZcGx9zG4/rP3spZTC4gXEJp+Y3GTKZg
	N7DrRU4freu826UkR6unBw3iATinCL/uPb4C4SsZ2F90EIZM3fBivsncVtflG2sALQxv
	hujg==
X-Received: by 10.180.24.102 with SMTP id t6mr20663999wif.83.1444170644007;
	Tue, 06 Oct 2015 15:30:44 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	go2sm21553102wib.20.2015.10.06.15.30.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Oct 2015 15:30:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Oct 2015 00:30:40 +0200
Message-Id: <1444170642-23088-6-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1444170642-23088-1-git-send-email-Martin.Jansa@gmail.com>
References: <1444170642-23088-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 6/8] Revert "rage, emprint, news: Move to nonworking"
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
X-List-Received-Date: Tue, 06 Oct 2015 22:30:45 -0000

* use PNBLACKLIST instead

This reverts commit 1ead1a9196e0003652bc99d0d5739ab59c221209.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/emprint_svn.bb            | 14 ++++++++++++++
 meta-efl/recipes-efl/e17/news_svn.bb               | 14 ++++++++++++++
 meta-efl/recipes-efl/e17/nonworking/emprint_svn.bb | 12 ------------
 meta-efl/recipes-efl/e17/nonworking/news_svn.bb    | 12 ------------
 meta-efl/recipes-efl/e17/nonworking/rage_svn.bb    | 13 -------------
 meta-efl/recipes-efl/e17/rage_svn.bb               | 15 +++++++++++++++
 6 files changed, 43 insertions(+), 37 deletions(-)
 create mode 100644 meta-efl/recipes-efl/e17/emprint_svn.bb
 create mode 100644 meta-efl/recipes-efl/e17/news_svn.bb
 delete mode 100644 meta-efl/recipes-efl/e17/nonworking/emprint_svn.bb
 delete mode 100644 meta-efl/recipes-efl/e17/nonworking/news_svn.bb
 delete mode 100644 meta-efl/recipes-efl/e17/nonworking/rage_svn.bb
 create mode 100644 meta-efl/recipes-efl/e17/rage_svn.bb

diff --git a/meta-efl/recipes-efl/e17/emprint_svn.bb b/meta-efl/recipes-efl/e17/emprint_svn.bb
new file mode 100644
index 0000000..e4c9816
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/emprint_svn.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Emprint is a utility for taking screenshots of the entire screen, a specific window, or a specific region."
+LICENSE = "MIT & BSD"
+DEPENDS = "imlib2 virtual/libx11 ecore evas edje eina"
+PV = "0.0.1+svnr${SRCPV}"
+LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
+SRCREV = "${EFL_SRCREV}"
+
+inherit e
+SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep"
+S = "${WORKDIR}/${SRCNAME}"
+
+FILES_${PN}-dbg += "${libdir}/${PN}/modules/.debug"
+
+PNBLACKLIST[emprint] ?= "if you want to use these modules with E18, then you need to update it to git recipe fetching newer sources from http://git.enlightenment.org/apps/emprint.git/"
diff --git a/meta-efl/recipes-efl/e17/news_svn.bb b/meta-efl/recipes-efl/e17/news_svn.bb
new file mode 100644
index 0000000..f08cab6
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/news_svn.bb
@@ -0,0 +1,14 @@
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+PV = "0.1.0+svnr${SRCPV}"
+PR = "${INC_PR}.0"
+
+require e-module.inc
+
+do_configure_prepend() {
+    sed -i -e /po/d configure.ac 
+    sed -i -e s:\ po::g Makefile.am
+}
+
+PNBLACKLIST[news] ?= "if you want to use these modules with E18, then you need to update it to git recipe fetching newer sources from http://git.enlightenment.org/enlightenment/modules/news.git/"
diff --git a/meta-efl/recipes-efl/e17/nonworking/emprint_svn.bb b/meta-efl/recipes-efl/e17/nonworking/emprint_svn.bb
deleted file mode 100644
index 6c2abdc..0000000
--- a/meta-efl/recipes-efl/e17/nonworking/emprint_svn.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-DESCRIPTION = "Emprint is a utility for taking screenshots of the entire screen, a specific window, or a specific region."
-LICENSE = "MIT & BSD"
-DEPENDS = "imlib2 virtual/libx11 ecore evas edje eina"
-PV = "0.0.1+svnr${SRCPV}"
-LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
-SRCREV = "${EFL_SRCREV}"
-
-inherit e
-SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep"
-S = "${WORKDIR}/${SRCNAME}"
-
-FILES_${PN}-dbg += "${libdir}/${PN}/modules/.debug"
diff --git a/meta-efl/recipes-efl/e17/nonworking/news_svn.bb b/meta-efl/recipes-efl/e17/nonworking/news_svn.bb
deleted file mode 100644
index 9b89d80..0000000
--- a/meta-efl/recipes-efl/e17/nonworking/news_svn.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-LICENSE = "GPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-PV = "0.1.0+svnr${SRCPV}"
-PR = "${INC_PR}.0"
-
-require e-module.inc
-
-do_configure_prepend() {
-    sed -i -e /po/d configure.ac 
-    sed -i -e s:\ po::g Makefile.am
-}
diff --git a/meta-efl/recipes-efl/e17/nonworking/rage_svn.bb b/meta-efl/recipes-efl/e17/nonworking/rage_svn.bb
deleted file mode 100644
index da51ae6..0000000
--- a/meta-efl/recipes-efl/e17/nonworking/rage_svn.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = "Rage is a media center application based on EFL"
-AUTHOR = "Carsten 'The Rasterman' Haitzler"
-HOMEPAGE = "http://www.rasterman.com"
-LICENSE = "MIT & BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
-DEPENDS = "emotion evas ecore edje"
-SECTION = "x11/multimedia"
-PV = "0.3.0.042+svnr${SRCPV}"
-SRCREV = "${EFL_SRCREV}"
-
-inherit e
-SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep"
-S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/e17/rage_svn.bb b/meta-efl/recipes-efl/e17/rage_svn.bb
new file mode 100644
index 0000000..a65aa9e
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/rage_svn.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Rage is a media center application based on EFL"
+AUTHOR = "Carsten 'The Rasterman' Haitzler"
+HOMEPAGE = "http://www.rasterman.com"
+LICENSE = "MIT & BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
+DEPENDS = "emotion evas ecore edje"
+SECTION = "x11/multimedia"
+PV = "0.3.0.042+svnr${SRCPV}"
+SRCREV = "${EFL_SRCREV}"
+
+inherit e
+SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep"
+S = "${WORKDIR}/${SRCNAME}"
+
+PNBLACKLIST[rage] ?= "if you want to use these modules with E18, then you need to update it to git recipe fetching newer sources from  http://git.enlightenment.org/apps/rage.git/"
-- 
2.6.0


