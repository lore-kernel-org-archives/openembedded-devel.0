Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 897BA6FEFA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jul 2017 07:42:10 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id c24so6240189pfe.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jul 2017 00:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fVEvvAQEFTpdR0Dj0wQsFZvg5YkO8R9Of9cNUJUJsJs=;
	b=vcYKR3CWHxPq1y5ttumjA74HT9L1Rd2dG8zVe7vFJ6kLTOeCEgfCxYhGseOLhArpQ8
	RR+5M+F3TWwYD1Z6cpJBsLg64KVr6ShlY6wFJxA0fiKvHCZy+1rdXO25XVBzY3/x5osk
	QeJaRzo4CF3BOow7wAGjCK5eZhUi8BP98dXlkcpFyVTa8dfrTTHZY0T+lNqxEXx5FsIV
	i6Y46IYhM+GnKU1a2u3wOGT+lEqOI8aMUGK89x2ptr4bDZGUSmqUDjY/sP7m6rIIm+oj
	vQfiJwlx610M78Yl2E/xPg21J/GI7X5q7jDzfPjMd5pX2aatfCbQGqlS+jBWP55tdG0F
	py1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fVEvvAQEFTpdR0Dj0wQsFZvg5YkO8R9Of9cNUJUJsJs=;
	b=It13YBGeV4ft79bbdNXm8+x+dscdpaZpptd9DixVtUr6Ao4iUuymtDHQxMXPXj9CKy
	wHH007I1KewnbkuZEMK2zOaTG5OASNn21c/kUqn9lBL1TJp98wm+7B+OktOr9GOokoCa
	xSvaCxYIA61Ucbk8U9Zh33o761z09cuSeK7tnvcyo8gwv7rnhUIW0559olaYso8lY/dG
	cVPIIrhRCjEfkUGZ7/KOuz+bYTgXFE/gdvo7pPAKA13MrfwcSM6dUHckYaHRZWpjhOxf
	RcjnWmf0FcPAgYzGXduFICRLl3PuLuyyYRTk/tb6hedc9HE5Mka4IpEM6iGo2MDr1L7c
	9n5w==
X-Gm-Message-State: AIVw113XVNd2Rlv+b7FtjNm6m7kaLTxqD0hD9UJ8lzcVBWVtMacb0BwL
	MYbVa4tpa+vaJ97j
X-Received: by 10.99.54.205 with SMTP id d196mr7848103pga.79.1499931731308;
	Thu, 13 Jul 2017 00:42:11 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	z6sm11473952pff.46.2017.07.13.00.42.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Jul 2017 00:42:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Jul 2017 00:41:54 -0700
Message-Id: <20170713074154.10606-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170713074154.10606-1-raj.khem@gmail.com>
References: <20170713074154.10606-1-raj.khem@gmail.com>
Subject: [meta-qt5][PATCH 3/3] qt5-creator: Link with libexecinfo on musl
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
X-List-Received-Date: Thu, 13 Jul 2017 07:42:10 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-qt/qt5/qt5-creator/musl-backtrace.patch | 18 ++++++++++++++++++
 recipes-qt/qt5/qt5-creator_3.5.1.bb             |  6 ++++++
 2 files changed, 24 insertions(+)
 create mode 100644 recipes-qt/qt5/qt5-creator/musl-backtrace.patch

diff --git a/recipes-qt/qt5/qt5-creator/musl-backtrace.patch b/recipes-qt/qt5/qt5-creator/musl-backtrace.patch
new file mode 100644
index 0000000..fc7f86c
--- /dev/null
+++ b/recipes-qt/qt5/qt5-creator/musl-backtrace.patch
@@ -0,0 +1,18 @@
+Index: qt-creator-opensource-src-3.5.1/src/plugins/debugger/debugger.pro
+===================================================================
+--- qt-creator-opensource-src-3.5.1.orig/src/plugins/debugger/debugger.pro
++++ qt-creator-opensource-src-3.5.1/src/plugins/debugger/debugger.pro
+@@ -148,3 +148,4 @@ include(qml/qml.pri)
+ include(namedemangler/namedemangler.pri)
+ 
+ include(shared/shared.pri)
++LIBS  *= -lexecinfo
+Index: qt-creator-opensource-src-3.5.1/src/plugins/qmldesigner/config.pri
+===================================================================
+--- qt-creator-opensource-src-3.5.1.orig/src/plugins/qmldesigner/config.pri
++++ qt-creator-opensource-src-3.5.1/src/plugins/qmldesigner/config.pri
+@@ -9,3 +9,4 @@ equals(TMP_BAUHAUS_NO_OUTPUT, true):DEFI
+ DEFINES += ENABLE_TEXT_VIEW
+ 
+ isEmpty($$(BAUHAUS_OUTPUT_IN_TEST)):DEFINES += QDEBUG_IN_TESTS WARNINGS_IN_TESTS
++LIBS  *= -lexecinfo
diff --git a/recipes-qt/qt5/qt5-creator_3.5.1.bb b/recipes-qt/qt5/qt5-creator_3.5.1.bb
index c85f38c..786b202 100644
--- a/recipes-qt/qt5/qt5-creator_3.5.1.bb
+++ b/recipes-qt/qt5/qt5-creator_3.5.1.bb
@@ -17,6 +17,7 @@ LIC_FILES_CHKSUM = " \
 inherit qmake5
 
 DEPENDS = "qtbase qtscript qtwebkit qtxmlpatterns qtx11extras qtdeclarative qttools qttools-native qtsvg qtquick1"
+DEPENDS_append_libc-musl = " libexecinfo"
 
 SRC_URI = " \
     http://download.qt.io/official_releases/qtcreator/3.5/${PV}/qt-creator-opensource-src-${PV}.tar.gz \
@@ -25,6 +26,10 @@ SRC_URI = " \
     file://0001-Qmlpuppet-add-missing-includes.patch \
     file://qtcreator.desktop.in \
 "
+
+SRC_URI_append_libc-musl = " file://musl-backtrace.patch "
+
+
 SRC_URI[md5sum] = "77aef7df837eba07c7ce6037ee504c05"
 SRC_URI[sha256sum] = "5925ac818a08be919094e0f28fb4c5d8896765e0975d54d353e4c50f13d63e65"
 
@@ -32,6 +37,7 @@ S = "${WORKDIR}/qt-creator-opensource-src-${PV}"
 
 EXTRA_QMAKEVARS_PRE += "IDE_LIBRARY_BASENAME=${baselib}${QT_DIR_NAME}"
 
+LDFLAGS_append_libc-musl = " -lexecinfo "
 do_configure_append() {
     # Find native tools
     sed -i 's:${STAGING_BINDIR}.*/lrelease:${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/lrelease:g' ${B}/share/qtcreator/translations/Makefile
-- 
2.13.2


