Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id CE816719A8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Feb 2018 04:39:02 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id f4so9794293plr.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Feb 2018 20:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=9uVHGwEIuLWIDDIxV/JD/fOdqLfqO/7pCEJWAYotxGc=;
	b=CRQKCCu4L40+7Tp0AERvbmmK+sPVhJU7/vkuyK7dikvzpAfz+OU8WFTDvQxeiK6UCI
	2oQezj4jGyDjIyCucHG53lZ48gvdMApI5dRp/6rYSO68gl+5yVv6sGxPU4KzE4bUfMVF
	yFWAPqgdPmMif/yLnjELTB+6zmf0z/MB/sbSPQ4JnKbSjo5ZqRxPphFXAaxkO6Pn4SlZ
	Pe9izm/t8zvXmhSioIY7M92cpLIEk0KmbjiVqp28ttx9dwtlSA84g8h4z3mQD3nN10/n
	RQ5x6f0CaQKDA7t7vr9OxSyL+PWmIoQwKDel0rcCYKm2M9jYnFFyk3sJLvAIekWtCfYR
	Eabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9uVHGwEIuLWIDDIxV/JD/fOdqLfqO/7pCEJWAYotxGc=;
	b=r3lNmBvXB8IXVtmj75UJpJ8CPJEPzILvNVangqOiw9lfiaWDluuQKFk9w9hzJjZM84
	qiFRcn2QDU+1zkd1HKIFXBroh5xK1BpoMDMeyAhXNmaU8lK0tRqkldg8FLGuYT7li0CZ
	xVYw4//msQkLtWYUmGnCb35gdoi3ctPjViFaaCurInGJWPlIxIQSbUf7mZMaouXPDop5
	N9phLOh0WpeSt7stDVRPGV1DJqZSOD+z7c0beq3yJ/hGkg9zfu1eLWVsrr+bKUt6gPmV
	eKWt1FjfveSisey/B4kSmxlhkClOyKNqhxp0B30t1RFI4enfmC2AByejqSx0I0GSnBeM
	WlqA==
X-Gm-Message-State: APf1xPAS0BmU+/A43wdzV/Rxi/NRQcut/YiHB3d25M9i3TaxMFfEl2xY
	YDriNm5sX1KZJb8EObE0tgTK2w==
X-Google-Smtp-Source: AH8x227PAcAr41HMcqzAfNnQtBv6caOcbx6HeKzJvfO3J0WgakZiY2je0khu+QpGZ+J/JutdP4HQWg==
X-Received: by 2002:a17:902:8487:: with SMTP id
	c7-v6mr1295227plo.7.1518669543631; 
	Wed, 14 Feb 2018 20:39:03 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::1da0])
	by smtp.gmail.com with ESMTPSA id
	n66sm36783394pfn.111.2018.02.14.20.39.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Feb 2018 20:39:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Feb 2018 20:38:48 -0800
Message-Id: <20180215043848.14310-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.1
Subject: [meta-qt5][PATCH] qtbase: Replace -isystem with -I
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
X-List-Received-Date: Thu, 15 Feb 2018 04:39:03 -0000

Fixes no-x11 builds (eglfs)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-qt/qt5/qtbase-native_git.bb                |  1 +
 ...mon-gcc-base.conf-Use-I-instead-of-isyste.patch | 36 ++++++++++++++++++++++
 recipes-qt/qt5/qtbase_git.bb                       |  1 +
 3 files changed, 38 insertions(+)
 create mode 100644 recipes-qt/qt5/qtbase/0014-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch

diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index ac3924e..ffde8ee 100644
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
index 4f3ade2..cc9bce3 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -29,6 +29,7 @@ SRC_URI += "\
     file://0009-Add-OE-specific-specs-for-clang-compiler.patch \
     file://0010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch \
     file://0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch \
+    file://0014-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch \
     file://run-ptest \
 "
 
-- 
2.16.1


