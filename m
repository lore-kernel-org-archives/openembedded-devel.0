Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD14BC7EE2E
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 07:07:10 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.25851.1683616026694747784
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 00:07:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=m028uOKs;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-30786c6082dso1962271f8f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 00:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683616025; x=1686208025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Itq8s7nvXxSR6duwcOL7DYmTk9Kqfg8pPMUyaqWaOdk=;
        b=m028uOKsu+kdsdJda6Q6LlsdkIkQ8A3+0qf+54Wyjok2uheMQ+zMorI9TEi2P+NyCa
         sMnxQaddg9KPTYJhaQcSdxoWyvUhKuh3QHBtOb5zdiEfjSx961QOeWdBMhkkv8MxNFd7
         hzcZAbbLwIVLHo2qf2KFt0zkmPZLr4zQ9hZ/S5bgmFxox2X7cKdE3DP+RMpd+/yFdh59
         jKWIow/8ADSwv4XB/GHz2t4HUob3JZaE3x7QZAaWUCy6MGK6ekEeE+wo6fT/W2OAtXzG
         uvmr1xyroGdZx4lxbbGivU+sFMG8hum1AFRpl4LNZPjy1Q9VdvzwO3UbwQSW1Xpg/9Eg
         eK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683616025; x=1686208025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Itq8s7nvXxSR6duwcOL7DYmTk9Kqfg8pPMUyaqWaOdk=;
        b=Pm+Y4+HlLl3eMuLXuWPNSC2yL2dTqEnqkqijZSQh0i0WqYz+sA1H53wLW+Dv20PXt3
         vZK16rcKh5+NV81sbbFnZOOTAYGVVBTkUEO9Rk8ha6r9JdlOBxN9fBXS4pkpyg4V9ZW0
         hSwUhrsv1RBhHR7TGLHjpYJYCnIEtXGZYXx+4BnYyvYs0mE4+X+AXtNLIzYXZjzEXbJT
         LAtirq+38ACZgWWX7lEFxdSofBxcVlNP/zbNPjcjA/Qy5jK+3VXzKQGzJNAFrLP8VXnd
         icNKUdIOcDuwbF6jlt2coTZn/CHNREE/OOIhIO4SpfZdVWeh/UKsq5cyUteGZWXBQeo/
         oKmw==
X-Gm-Message-State: AC+VfDxaho0mIrn3bGCB+GUUsbM0l3Ve/enbioowS+3dOT9eteX7SC7l
	4OJoiE3HdQrFZyMdsgxOvcJUy1kb6Vw=
X-Google-Smtp-Source: ACHHUZ6Ptwb5bkbkIYRMGk84cGzooIg7f9JKvEw397aOO7uggUi1NVRaBUdPZFywxZZGgBuuZdlv4Q==
X-Received: by 2002:adf:d092:0:b0:306:31fb:1c3d with SMTP id y18-20020adfd092000000b0030631fb1c3dmr8413720wrh.32.1683616025072;
        Tue, 09 May 2023 00:07:05 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a4-20020adffac4000000b00304ae802f02sm13436053wrs.66.2023.05.09.00.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 00:07:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][mickledore][PATCH 08/16] rdfind: fix build with -Werror=return-type
Date: Tue,  9 May 2023 09:06:47 +0200
Message-Id: <20230509070655.70784-8-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230509070655.70784-1-Martin.Jansa@gmail.com>
References: <20230509070655.70784-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 07:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102476

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...-configure.ac-fix-C-11-support-check.patch | 37 +++++++++++++++++++
 .../recipes-support/rdfind/rdfind_1.5.0.bb    |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-support/rdfind/rdfind/0001-configure.ac=
-fix-C-11-support-check.patch

diff --git a/meta-oe/recipes-support/rdfind/rdfind/0001-configure.ac-fix-C-=
11-support-check.patch b/meta-oe/recipes-support/rdfind/rdfind/0001-configu=
re.ac-fix-C-11-support-check.patch
new file mode 100644
index 0000000000..815939b82d
--- /dev/null
+++ b/meta-oe/recipes-support/rdfind/rdfind/0001-configure.ac-fix-C-11-supp=
ort-check.patch
@@ -0,0 +1,37 @@
+From 9070bc210b2ecff641b73e4ade30040c1461969c Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Wed, 3 May 2023 18:31:57 +0200
+Subject: [PATCH] configure.ac: fix C++11 support check
+
+* with -Werror=3Dreturn-type in CFLAGS this test fails with:
+
+  configure:4290: checking for C++11 support or better
+  configure:4303: x86_64-webos-linux-g++  -m64 -march=3Dcore2 -mtune=3Dcor=
e2 -msse3 -mfpmath=3Dsse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D=
2 -Wformat -Wformat-security -Werror=3Dformat-security -Werror=3Dreturn-typ=
e --sysroot=3D/OE/lge/build/webos/mickledore/BUILD/work/qemux86_64-webos-li=
nux/rdfind/1.5.0-r0/recipe-sysroot -c  -O2 -pipe -g -feliminate-unused-debu=
g-types -fmacro-prefix-map=3D/OE/lge/build/webos/mickledore/BUILD/work/qemu=
x86_64-webos-linux/rdfind/1.5.0-r0/rdfind-1.5.0=3D/usr/src/debug/rdfind/1.5=
.0-r0  -fdebug-prefix-map=3D/OE/lge/build/webos/mickledore/BUILD/work/qemux=
86_64-webos-linux/rdfind/1.5.0-r0/rdfind-1.5.0=3D/usr/src/debug/rdfind/1.5.=
0-r0  -fmacro-prefix-map=3D/OE/lge/build/webos/mickledore/BUILD/work/qemux8=
6_64-webos-linux/rdfind/1.5.0-r0/build=3D/usr/src/debug/rdfind/1.5.0-r0  -f=
debug-prefix-map=3D/OE/lge/build/webos/mickledore/BUILD/work/qemux86_64-web=
os-linux/rdfind/1.5.0-r0/build=3D/usr/src/debug/rdfind/1.5.0-r0  -fdebug-pr=
efix-map=3D/OE/lge/build/webos/mickledore/BUILD/work/qemux86_64-webos-linux=
/rdfind/1.5.0-r0/recipe-sysroot=3D  -fmacro-prefix-map=3D/OE/lge/build/webo=
s/mickledore/BUILD/work/qemux86_64-webos-linux/rdfind/1.5.0-r0/recipe-sysro=
ot=3D  -fdebug-prefix-map=3D/OE/lge/build/webos/mickledore/BUILD/work/qemux=
86_64-webos-linux/rdfind/1.5.0-r0/recipe-sysroot-native=3D  -fvisibility-in=
lines-hidden   conftest.cpp >&5
+  conftest.cpp: In function 'int f()':
+  conftest.cpp:22:20: error: no return statement in function returning non=
-void [-Werror=3Dreturn-type]
+     22 | int f() { auto a=3D1;}                                          =
                                                                           =
                                                                           =
                        |                    ^
+  cc1plus: some warnings being treated as errors
+  ...
+  configure:4308: error: no c++11 support, please set CXXFLAGS properly
+
+* fix the test to pass
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+Upstream-Status: Submitted [https://github.com/pauldreik/rdfind/pull/132]
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index be1b2fd..9c3513c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -64,7 +64,7 @@ AC_SYS_LARGEFILE
+=20
+ dnl make sure we have c++11 or better,
+ AC_MSG_CHECKING([for C++11 support or better])
+-AC_COMPILE_IFELSE([AC_LANG_PROGRAM([int f() { auto a=3D1;}])],
++AC_COMPILE_IFELSE([AC_LANG_PROGRAM([int f() { auto a=3D1;return a;}])],
+                   [AC_MSG_RESULT([yes])],
+ 		  [AC_MSG_ERROR([no c++11 support, please set CXXFLAGS properly])])
+=20
diff --git a/meta-oe/recipes-support/rdfind/rdfind_1.5.0.bb b/meta-oe/recip=
es-support/rdfind/rdfind_1.5.0.bb
index 8f2c5e8852..dab66c3827 100644
--- a/meta-oe/recipes-support/rdfind/rdfind_1.5.0.bb
+++ b/meta-oe/recipes-support/rdfind/rdfind_1.5.0.bb
@@ -8,6 +8,7 @@ DEPENDS =3D "nettle autoconf-archive"
 SRC_URI =3D "https://rdfind.pauldreik.se/${BP}.tar.gz \
            file://0001-configure-Fix-check-for-AC_CHECK_LIB.patch \
            file://0001-include-standard-headers-limits-and-cstdint.patch \
+           file://0001-configure.ac-fix-C-11-support-check.patch \
 "
=20
 SRC_URI[sha256sum] =3D "4150ed1256f7b12b928c65113c485761552b9496c433778aac=
3f9afc3e767080"
--=20
2.40.1


