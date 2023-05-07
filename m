Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25F89C77B75
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 22:44:15 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.94676.1683499448084921584
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 15:44:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=PjQcKLGx;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-50bd37ca954so43816976a12.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 15:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683499451; x=1686091451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Itq8s7nvXxSR6duwcOL7DYmTk9Kqfg8pPMUyaqWaOdk=;
        b=PjQcKLGxaXGMF+5Bx4f0VnmWbyY0IUU05ee4cbHM5wWR1hlMcNPnSMebsuPZV4JeDY
         Q5waEmsUJ1VFqLGu4RI1iOZ5R0XRCrOhLV1IKdBWEC9AtcK4u/DWYwVMF72uckhjuw1p
         te0BhCsy3Ed3ZE61mchXVu5o6gyGjp9vhXcyQN3HqE7trkIO5/Yp9gorT8+t1N+qOL15
         FIhKlEMcwkUW9LG3t7hk/Bk3kKjp5cqz0pYw9capXwaFZ13ibtOb3NjptiP8UtdVFq31
         LGk9NGeq4yCAkT1Tg6L+SXdn8xun4Ma27YTEhVp0NADNhQQ05UpVQsqd8ZPC3XEvaLm0
         sU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683499451; x=1686091451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Itq8s7nvXxSR6duwcOL7DYmTk9Kqfg8pPMUyaqWaOdk=;
        b=gmO+ufj8pjExhZWE5V7qkiZAPp013D5ZDrY0JF9KgrU/VSXZ4ocvghRAAugsWuFbHu
         nz5HXlqQRpBjLwXmlcWjhGPFJf7VhN8d0IrWXtpNR6Dw/UVf12tWqzCER0z2LAtTVtwV
         PmFF9kx47HqOyChQsgb8XWDH+G2sENLTs3DmIAPUt7PkKkMuNqYkgItqBT3LOoU90LM/
         Z9DDDBIIP6dOL4v/yJ/r736dnAuuRKwwWeXFxpM6wRphWppKwp5AmVKBAfHQO/rE/p0u
         mYCkc3kBu67bm/olXRYVHh8ZrJepa7hP+87K3HI6Y+mlFhHMzSfpSnMffqFHkuTfElVP
         9FIg==
X-Gm-Message-State: AC+VfDw43A0WaEglqZThsH/RSdguprzvGxdIfIbEVRIB2wtbmVvtMxik
	21fDhFqQ4PVkantwiYVSIZzyIwdUAPA=
X-Google-Smtp-Source: ACHHUZ7jpCReC7EqW1jQTkqIO8stUtMn0q0AO8l4uZM47cfAI2yiVz0zMRhjpiaGcL9xiAzqDrhEIw==
X-Received: by 2002:a17:907:6e13:b0:953:7f08:a9ee with SMTP id sd19-20020a1709076e1300b009537f08a9eemr8288767ejc.1.1683499451347;
        Sun, 07 May 2023 15:44:11 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id hv6-20020a17090760c600b00965eb608a28sm3737844ejc.40.2023.05.07.15.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 15:44:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 08/16] rdfind: fix build with -Werror=return-type
Date: Mon,  8 May 2023 00:43:46 +0200
Message-Id: <20230507224354.1149327-8-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230507224354.1149327-1-Martin.Jansa@gmail.com>
References: <20230507224354.1149327-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 22:44:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102369

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


