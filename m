Return-Path: <jonas.gorski@bisdn.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0218C433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Jun 2022 13:23:53 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.17584.1655385827336145504
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jun 2022 06:23:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bisdn-de.20210112.gappssmtp.com header.s=20210112
 header.b=mHPnEhVC;
 spf=none, err=SPF record not found (domain: bisdn.de, ip: 209.85.218.50,
 mailfrom: jonas.gorski@bisdn.de)
Received: by mail-ej1-f50.google.com with SMTP id h23so2733266ejj.12
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jun 2022 06:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bisdn-de.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G5ER8IcfJnH3nJePm9/Xcd5CBdXJtw0jEwidegkWFsc=;
        b=mHPnEhVCIAOHt7QS7UHrlRndNoqOpt8QMHdVUUMHiBcQBqtUMmBD7iWdud1PIxPAps
         2y3bYqAX/oN3uM+F3mFElbhRnF/dMkXEvmtL0yaq/JyUHGLOpqYJAQvnsng0HbHvPPhJ
         E+qwzORJolijPexJJvBl7hndQ5J3ozdeGhI408jK2kbNznnYAuptq/I4kL0q74FZ1kiU
         DCrmXWUKCP4N6ezaXUeQI0wWzHZidO8sXrKbPOZxts6XlfFsF7oRxp5qxZhUH+duv7wA
         EkYEymgDGQrziSQhB2llCy9D+MccsmwwuT01MNEAexQ9Sm+vRyyq/6TBKdautBU09kFQ
         RxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G5ER8IcfJnH3nJePm9/Xcd5CBdXJtw0jEwidegkWFsc=;
        b=ELGWgzFN30eFplZZlEqaBc1bFjaBPz6XFHsv8KigMx2z7k961r/oI5m/7pqkZqcVUu
         J1koPsn727ZHj4P3nvXgHHw9sFcm/1H4hX9D58Jx91MN/+qxX6wlznnWOOAO7oZJuWbD
         Ir378wHmRqSntIhikjQrAstkRxJxkQmicjNo0RA65feHaEgVThsFVB48d70RfQZd0nLi
         3k2ihwRCnciXU4Jo5TmG6YP4gn9KR+SVNyaqMeYcG7FlhB30bSW0M0LZRAQVtzwNrtF+
         43kv4rrULOz6wh5kDp8TyzngOKDnlJOABjYKsYpUto0kLtjJuQxTNOamkfqNq0yOsUnu
         +Q4A==
X-Gm-Message-State: AJIora/z7YieKJLBhhWmxbYxAcZ1636HSCKMpz8eFc6RAAzIQzurF8+j
	ngbU+mPgV/ZXlzofs3JiDQ6NU6a/HZQ7sAfh+Yogmwrf2IBQDBe9s7LxmzWIWM7+OPfc/FjUxVK
	z1bMk0PlAF937l8uH7pa2F3N47MsBfuEvklByethcrV8=
X-Google-Smtp-Source: 
 AGRyM1uy/nffHy8ye17bKnhGuBUbYZQk/+MyzOG1Phq7+OtQsrWHZFg5zOrwWv+RBCAMBLvA3YHzrA==
X-Received: by 2002:a17:907:7256:b0:711:d5ac:b9e6 with SMTP id
 ds22-20020a170907725600b00711d5acb9e6mr4483446ejc.680.1655385825257;
        Thu, 16 Jun 2022 06:23:45 -0700 (PDT)
Received: from dummy-pc.bisdn.de
 (dslb-088-076-253-247.088.076.pools.vodafone-ip.de. [88.76.253.247])
        by smtp.gmail.com with ESMTPSA id
 eq20-20020a056402299400b0042deea0e961sm1679921edb.67.2022.06.16.06.23.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 06:23:44 -0700 (PDT)
From: Jonas Gorski <jonas.gorski@bisdn.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] abseil-cpp: do not enforce -mfpu=neon on arm
Date: Thu, 16 Jun 2022 15:23:15 +0200
Message-Id: <20220616132315.156771-1-jonas.gorski@bisdn.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Jun 2022 13:23:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97523

Abseil-cpp assumes that if you are building for ARM, you can use neon
instructions. This is of course bogus, since not every ARM platform
supports these.

This then leaks via pkgconfig into any package using abseil-cpp, e.g.
gprc.

Fixes application crashes on ARM platforms without neon that use grpc
due to use of illegal instructions.

Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
---
Patch is based on master.

This at least also affects kirkstone, but doesn't dunfell. Have not
checked any of the releases in between.

 .../0001-absl-always-use-asm-sgidefs.h.patch  |  8 ++--
 ...e-maes-option-from-cross-compilation.patch | 14 +++---
 ...e-neon-option-from-cross-compilation.patch | 47 +++++++++++++++++++
 .../abseil-cpp/abseil-cpp_git.bb              |  3 +-
 4 files changed, 60 insertions(+), 12 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0003-Rem=
ove-neon-option-from-cross-compilation.patch

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-absl-alway=
s-use-asm-sgidefs.h.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/=
0001-absl-always-use-asm-sgidefs.h.patch
index 2bafcc6b1305..a5bebf5f009f 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-absl-always-use-a=
sm-sgidefs.h.patch
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-absl-always-use-a=
sm-sgidefs.h.patch
@@ -1,7 +1,7 @@
-From 8f21fdfb83b0fa844a9f1f03a86a9ca46642d85e Mon Sep 17 00:00:00 2001
+From 738549dea7a4e6c462a79962c414eaa450c2cffd Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 9 Apr 2020 13:06:27 -0700
-Subject: [PATCH 1/2] absl: always use <asm/sgidefs.h>
+Subject: [PATCH 1/3] absl: always use <asm/sgidefs.h>
=20
 Fixes mips/musl build, since sgidefs.h is not present on all C libraries
 but on linux asm/sgidefs.h is there and contains same definitions, using
@@ -15,7 +15,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 5 deletions(-)
=20
 diff --git a/absl/base/internal/direct_mmap.h b/absl/base/internal/direct_=
mmap.h
-index 16accf096604..ba7936cc934e 100644
+index a01d61220376..c8a4fbabbb3a 100644
 --- a/absl/base/internal/direct_mmap.h
 +++ b/absl/base/internal/direct_mmap.h
 @@ -41,13 +41,9 @@
@@ -34,5 +34,5 @@ index 16accf096604..ba7936cc934e 100644
 =20
  // SYS_mmap and SYS_munmap are not defined in Android.
 --=20
-2.25.1
+2.36.1
=20
diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0002-Remove-mae=
s-option-from-cross-compilation.patch b/meta-oe/recipes-devtools/abseil-cpp=
/abseil-cpp/0002-Remove-maes-option-from-cross-compilation.patch
index da9dbd936761..7b7244b491e6 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0002-Remove-maes-optio=
n-from-cross-compilation.patch
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0002-Remove-maes-optio=
n-from-cross-compilation.patch
@@ -1,7 +1,7 @@
-From a9e15a4855c82eb948dedeecd83d5e17c3c8f767 Mon Sep 17 00:00:00 2001
+From d25cf3b9aa873595a19e197cc29ab46c0093bff1 Mon Sep 17 00:00:00 2001
 From: Sinan Kaya <sinan.kaya@microsoft.com>
 Date: Mon, 3 Feb 2020 03:25:57 +0000
-Subject: [PATCH 2/2] Remove maes option from cross-compilation
+Subject: [PATCH 2/3] Remove maes option from cross-compilation
=20
 ---
  absl/copts/GENERATED_AbseilCopts.cmake | 4 ----
@@ -9,10 +9,10 @@ Subject: [PATCH 2/2] Remove maes option from cross-compil=
ation
  2 files changed, 8 deletions(-)
=20
 diff --git a/absl/copts/GENERATED_AbseilCopts.cmake b/absl/copts/GENERATED=
_AbseilCopts.cmake
-index 97bd283eb739..ce29ac031b9c 100644
+index a4ab1aa2041e..23b9253c1f00 100644
 --- a/absl/copts/GENERATED_AbseilCopts.cmake
 +++ b/absl/copts/GENERATED_AbseilCopts.cmake
-@@ -210,7 +210,3 @@ list(APPEND ABSL_RANDOM_HWAES_ARM64_FLAGS
+@@ -158,7 +158,3 @@ list(APPEND ABSL_RANDOM_HWAES_ARM64_FLAGS
  list(APPEND ABSL_RANDOM_HWAES_MSVC_X64_FLAGS
  )
 =20
@@ -21,10 +21,10 @@ index 97bd283eb739..ce29ac031b9c 100644
 -    "-msse4.1"
 -)
 diff --git a/absl/copts/GENERATED_copts.bzl b/absl/copts/GENERATED_copts.b=
zl
-index bcdd61ef8211..3e8eddd4bb08 100644
+index a6efc98e11d4..1e847f769501 100644
 --- a/absl/copts/GENERATED_copts.bzl
 +++ b/absl/copts/GENERATED_copts.bzl
-@@ -211,7 +211,3 @@ ABSL_RANDOM_HWAES_ARM64_FLAGS =3D [
+@@ -159,7 +159,3 @@ ABSL_RANDOM_HWAES_ARM64_FLAGS =3D [
  ABSL_RANDOM_HWAES_MSVC_X64_FLAGS =3D [
  ]
 =20
@@ -33,5 +33,5 @@ index bcdd61ef8211..3e8eddd4bb08 100644
 -    "-msse4.1",
 -]
 --=20
-2.25.1
+2.36.1
=20
diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0003-Remove-neo=
n-option-from-cross-compilation.patch b/meta-oe/recipes-devtools/abseil-cpp=
/abseil-cpp/0003-Remove-neon-option-from-cross-compilation.patch
new file mode 100644
index 000000000000..c0039c210799
--- /dev/null
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0003-Remove-neon-optio=
n-from-cross-compilation.patch
@@ -0,0 +1,47 @@
+From fb24c3e3539b5743d398a429a302a3886186f261 Mon Sep 17 00:00:00 2001
+From: Jonas Gorski <jonas.gorski@bisdn.de>
+Date: Thu, 16 Jun 2022 11:46:31 +0000
+Subject: [PATCH 3/3] Remove neon option from cross compilation
+
+Not every arm platform supports neon instructions, so do not enforce
+them.
+
+Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
+---
+ absl/copts/GENERATED_AbseilCopts.cmake | 4 ----
+ absl/copts/GENERATED_copts.bzl         | 4 ----
+ 2 files changed, 8 deletions(-)
+
+diff --git a/absl/copts/GENERATED_AbseilCopts.cmake b/absl/copts/GENERATED=
_AbseilCopts.cmake
+index 23b9253c1f00..5d112a97f3e4 100644
+--- a/absl/copts/GENERATED_AbseilCopts.cmake
++++ b/absl/copts/GENERATED_AbseilCopts.cmake
+@@ -147,10 +147,6 @@ list(APPEND ABSL_MSVC_TEST_FLAGS
+     "/DNOMINMAX"
+ )
+=20
+-list(APPEND ABSL_RANDOM_HWAES_ARM32_FLAGS
+-    "-mfpu=3Dneon"
+-)
+-
+ list(APPEND ABSL_RANDOM_HWAES_ARM64_FLAGS
+     "-march=3Darmv8-a+crypto"
+ )
+diff --git a/absl/copts/GENERATED_copts.bzl b/absl/copts/GENERATED_copts.b=
zl
+index 1e847f769501..3e10db204faf 100644
+--- a/absl/copts/GENERATED_copts.bzl
++++ b/absl/copts/GENERATED_copts.bzl
+@@ -148,10 +148,6 @@ ABSL_MSVC_TEST_FLAGS =3D [
+     "/DNOMINMAX",
+ ]
+=20
+-ABSL_RANDOM_HWAES_ARM32_FLAGS =3D [
+-    "-mfpu=3Dneon",
+-]
+-
+ ABSL_RANDOM_HWAES_ARM64_FLAGS =3D [
+     "-march=3Darmv8-a+crypto",
+ ]
+--=20
+2.36.1
+
diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb b/meta-o=
e/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
index 1bb27d436926..b271134fd2d3 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
@@ -7,13 +7,14 @@ SECTION =3D "libs"
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddf52c6edb7adc22e533b2bacc3bd391=
5"
=20
-PV =3D "20211102.0+git${SRCPV}"
+PV =3D "20211102.1+git${SRCPV}"
 SRCREV =3D "7c6608d0dbe43cf9bdf7f77787bc6bc89cc42f8b"
 BRANCH =3D "master"
 SRC_URI =3D "git://github.com/abseil/abseil-cpp;branch=3D${BRANCH};protoco=
l=3Dhttps \
            file://0001-absl-always-use-asm-sgidefs.h.patch             \
            file://0002-Remove-maes-option-from-cross-compilation.patch \
            file://abseil-ppc-fixes.patch \
+           file://0003-Remove-neon-option-from-cross-compilation.patch \
           "
=20
 S =3D "${WORKDIR}/git"
--=20
2.36.1


--=20
BISDN GmbH
K=F6rnerstra=DFe 7-10
10785 Berlin
Germany


Phone:=20
+49-30-6108-1-6100


Managing Directors:=A0
Dr.-Ing. Hagen Woesner, Andreas=20
K=F6psel


Commercial register:=A0
Amtsgericht Berlin-Charlottenburg HRB 141569=20
B
VAT ID No:=A0DE283257294


