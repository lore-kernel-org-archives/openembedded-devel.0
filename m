Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9204378968
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jan 2018 05:54:12 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id g130so14371240wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Jan 2018 21:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iNmh5uqnJVUPdMbyhWWzzJ23q1NfpMZM73YGGfFTb3M=;
	b=nZnEH1AlyGCi609/3Q6E787xEDzJSfZysIRn6XaKGvwES4KvxowSIuyRIsYIfoVFs0
	niaWTVQFBit9V8/d/FueXJH3PBrBv6nUmEnKoGODyozKzFDIxD4bnT+GwZ3I3bw4PONh
	A8kCRPfZWMDVZWpfaQU/IGOOcQwbgjxuvkN/vv3GYEOkjlr/tPIj0AAqbfDa78+xitev
	+9Z0h2nqqM6uOHO09CgACyfVpjFPbifgoWAhzzLshvfsHHVhrsm4siC1HQCWWGJq0GnZ
	L/gynYlO7hMxOD5C0k+1J1mAk8rHiKC11wa1H1KOPalEXei6GvkIWPYvdiFJzrVsrLS2
	1QbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=iNmh5uqnJVUPdMbyhWWzzJ23q1NfpMZM73YGGfFTb3M=;
	b=NOC5iHhXaRKN6ASgc4T9r8DmRcDGLorqzXyO6dHd3vjFWZGtSpZNEX0DgxYBQPumDH
	OYlSCfXQL8wvX8Y+61qlH9d96/ev6nu2omjwdEPLM3a1wfEWJo8Da8Kg2tpVBCBQ2HTN
	pwwoS1izetmJXpvuyDrFbLdlX1VwOWXasda861Jr8ASMdQd6HggfYy/F9nhNxf7vQcs1
	WUSJWzdxxnFR1QSDqwbdEu0ivIyuj8drdgUTPrL6C6jwH+IXuyHZVeOoqnb1ac8ZpIde
	YlFiQku69GNTT4R9FWndgXtHXeumKQaURuivLyI991OX49ZsxF9nwSdPRCqf6C4su9o5
	1Ayw==
X-Gm-Message-State: AKGB3mLBNChwsUYOgEHeln1Cqg81NOoGqdhZppkongos7dPqRMRu1KfW
	Cm6FxsFuAFyIR30j9kHIqqVoxlFWd4I=
X-Google-Smtp-Source: ACJfBot6+ThmtDVEbkXrB9tSQ13h3OaGp2SP2k89e8jVu8+OTcfskDUlJ/OBRepF14PE4MMLW+whyw==
X-Received: by 10.80.213.7 with SMTP id u7mr14647771edi.224.1515390853306;
	Sun, 07 Jan 2018 21:54:13 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([111.207.81.199]) by smtp.gmail.com with ESMTPSA id
	e46sm7344354edb.93.2018.01.07.21.54.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 07 Jan 2018 21:54:12 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Jan 2018 06:52:06 +0100
Message-Id: <1515390727-15579-2-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1515390727-15579-1-git-send-email-liu.ming50@gmail.com>
References: <1515390727-15579-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-qt5][PATCH 1/2] meta: introduce QT_EDITION
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
X-List-Received-Date: Mon, 08 Jan 2018 05:54:12 -0000

From: Ming Liu <liu.ming50@gmail.com>

QT_EDITION defaults to 'opensource', but the end users could override
it with 'commercial' if they want.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 conf/layer.conf                        | 1 +
 recipes-qt/qt5/nativesdk-qtbase_git.bb | 2 +-
 recipes-qt/qt5/qtbase-native_git.bb    | 2 +-
 recipes-qt/qt5/qtbase_git.bb           | 2 +-
 4 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index 7eb3b2d..7751ce2 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -36,3 +36,4 @@ IMAGE_FEATURES[validitems] += "qtcreator-debug"
 QT_GIT ?= "git://github.com/qt"
 QT_LABS_GIT ?= "git://github.com/qt-labs"
 QT_GIT_PROTOCOL ?= "git"
+QT_EDITION ?= "opensource"
diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index 33be99e..3aeb2ab 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -103,7 +103,7 @@ deltask generate_qt_config_file
 
 do_configure() {
     ${S}/configure -v \
-        -opensource -confirm-license \
+        -${QT_EDITION} -confirm-license \
         -sysroot ${STAGING_DIR_TARGET} \
         -no-gcc-sysroot \
         -system-zlib \
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index 4c6b701..597b45e 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -103,7 +103,7 @@ do_configure_prepend() {
     # Avoid qmake error "Cannot read [...]/usr/lib/qt5/mkspecs/oe-device-extra.pri: No such file or directory"
     touch ${S}/mkspecs/oe-device-extra.pri
 
-    MAKEFLAGS="${PARALLEL_MAKE}" ${S}/configure -opensource -confirm-license ${PACKAGECONFIG_CONFARGS} || die "Configuring qt failed. PACKAGECONFIG_CONFARGS was ${PACKAGECONFIG_CONFARGS}"
+    MAKEFLAGS="${PARALLEL_MAKE}" ${S}/configure -${QT_EDITION} -confirm-license ${PACKAGECONFIG_CONFARGS} || die "Configuring qt failed. PACKAGECONFIG_CONFARGS was ${PACKAGECONFIG_CONFARGS}"
 }
 
 do_install() {
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 4e8dc4c..e2784d8 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -171,7 +171,7 @@ do_configure() {
     touch ${S}/mkspecs/oe-device-extra.pri
 
     ${S}/configure -v \
-        -opensource -confirm-license \
+        -${QT_EDITION} -confirm-license \
         -sysroot ${STAGING_DIR_TARGET} \
         -prefix ${OE_QMAKE_PATH_PREFIX} \
         -bindir ${OE_QMAKE_PATH_BINS} \
-- 
2.7.4


