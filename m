Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id A4B6F786D6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Feb 2018 04:29:48 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id m1so1569098pgp.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 20:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=qT0dfBzo25Es30ukKUcMPgvt98PzN1rRmGOWM56bbUo=;
	b=RFGMJh7tdzSgH1DEpXCvWP3VadOc7sUH/ToKatcAyd0wDGtZ5DcpTSTzgEdSyLX/lF
	OjiJDxTtLKEXWN8TyLgfVqMKdKhNFEtAP8LrWtkg3SQ5xezkUjOJdeY1ZrTWTeGUGyhD
	rQA9T/AKXz7dS6HLsEuQeT78JlS1IGn5p0c4ah4be23lGrFUDcjxuZHoX+Mce4tmyDst
	yyhMapeV+Lk5DZdGi2g43dWc+3GZ+9YaWjRJbnufyIHbXNdvCWm1KG/tBdunYuwZ5xVJ
	GE1gGiLQfV2EF7kYD7dJtzYCwrwRo4ucUaTHVTONzHxM5DhPA/NJ/ebuRcKmMohyDiPp
	E5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qT0dfBzo25Es30ukKUcMPgvt98PzN1rRmGOWM56bbUo=;
	b=lXCPW6RGsaPSUMJ7QqmwEeU68wMy8fYYeWSNfe5BeCUiqV0euqsksPEgc4r264cxuw
	C+fxmMQbVCDXWjQxbHAko14/r7QzjZgQsfOkk4LTVemboXxYbylUC87KKZG0SnDTvGph
	zHjDNEnGDa8nHr5VeQEBStEy54OYx/14HR14QCnG4XmNtrtInzX58h/21Mwr4V005JPQ
	NmNcjEoXlzBnlPXoapjtjaR+o/c8fb+0dzCTinE2d0wmp3Fe7WlQPKPgAp5o/I8s7/Ic
	DiEn/M0iLSZLL1SGxrWvMxa4H6A4mOHKeVX2m0grEIgViCBe9psAxrSpDLHTyKPlB1Lo
	iW6w==
X-Gm-Message-State: APf1xPCNq7WgRpB4hMvFP4juxlzlaCDUCG/2z6dPuVWh+AG4bdtXmj4y
	K7CgdBCGiu2ffo4WZNS2IXIl8g==
X-Google-Smtp-Source: AH8x224u1XQFoXvK02WuecfQ7clyby5cnqpHToRDSWMop/w5tUAjwhcT+QVdPpv9vfc+Qd666Prrkw==
X-Received: by 10.99.169.26 with SMTP id u26mr4533302pge.304.1519273789651;
	Wed, 21 Feb 2018 20:29:49 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::436d])
	by smtp.gmail.com with ESMTPSA id
	q14sm57548265pgt.53.2018.02.21.20.29.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Feb 2018 20:29:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Feb 2018 20:29:39 -0800
Message-Id: <20180222042940.3770-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
Subject: [meta-qt5][PATCH 1/2] qtbase: Replace -isystem with -I
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
X-List-Received-Date: Thu, 22 Feb 2018 04:29:48 -0000

Fixes no-x11 builds (eglfs)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-qt/qt5/qtbase-native_git.bb                |  1 +
 ...mon-gcc-base.conf-Use-I-instead-of-isyste.patch | 36 ++++++++++++++++++++++
 recipes-qt/qt5/qtbase_git.bb                       |  1 +
 3 files changed, 38 insertions(+)
 create mode 100644 recipes-qt/qt5/qtbase/0014-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch

diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index 20e24eb..5fa24d3 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -34,6 +34,7 @@ SRC_URI += "\
     file://0009-Add-OE-specific-specs-for-clang-compiler.patch \
     file://0010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch \
     file://0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch \
+    file://0014-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch \
 "
 
 # common for qtbase-native and nativesdk-qtbase
diff --git a/recipes-qt/qt5/qtbase/0014-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch b/recipes-qt/qt5/qtbase/0014-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch
new file mode 100644
index 0000000..44e9009
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0014-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch
@@ -0,0 +1,36 @@
+From 61c858474804fd772d612e6c5b4bb6df261d521a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 14 Feb 2018 17:08:43 -0800
+Subject: [PATCH] mkspecs/common/gcc-base.conf: Use -I instead of -isystem
+
+-isystem fails to build when code uses include_next on certain files e.g.
+
+qtbase/5.10.0+gitAUTOINC+50117d738a-r0/recipe-sysroot/usr/include/c++/7.3.0/cstdlib:75:15: fatal error: stdlib.h: No such file or directory
+ #include_next <stdlib.h>
+               ^~~~~~~~~~
+compilation terminated.
+make[2]: *** [Makefile:11592: .obj/qgenericpluginfactory.o] Error 1
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ mkspecs/common/gcc-base.conf | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mkspecs/common/gcc-base.conf b/mkspecs/common/gcc-base.conf
+index 234f71d495..ee3da023e6 100644
+--- a/mkspecs/common/gcc-base.conf
++++ b/mkspecs/common/gcc-base.conf
+@@ -46,7 +46,7 @@ QMAKE_CFLAGS_DEBUG         += -g
+ QMAKE_CFLAGS_SHLIB         += $$QMAKE_CFLAGS_PIC
+ QMAKE_CFLAGS_STATIC_LIB    += $$QMAKE_CFLAGS_PIC
+ QMAKE_CFLAGS_APP           += $$QMAKE_CFLAGS_PIC
+-QMAKE_CFLAGS_ISYSTEM        = -isystem
++QMAKE_CFLAGS_ISYSTEM        = -I
+ QMAKE_CFLAGS_YACC          += -Wno-unused -Wno-parentheses
+ QMAKE_CFLAGS_HIDESYMS      += -fvisibility=hidden
+ QMAKE_CFLAGS_EXCEPTIONS_OFF += -fno-exceptions
+-- 
+2.16.1
+
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 522e261..e495b8c 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -30,6 +30,7 @@ SRC_URI += "\
     file://0009-Add-OE-specific-specs-for-clang-compiler.patch \
     file://0010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch \
     file://0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch \
+    file://0014-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch \
 "
 
 # LGPL-3.0 is used only in src/plugins/platforms/android/extract.cpp
-- 
2.16.2


