Return-Path: <wak@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 228CEC4829B
	for <webhook@archiver.kernel.org>; Sat, 10 Feb 2024 00:59:38 +0000 (UTC)
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
 by mx.groups.io with SMTP id smtpd.web10.4695.1707526777029266773
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Feb 2024 16:59:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20230601 header.b=QnobUTYV;
 spf=pass (domain: flex--wak.bounces.google.com, ip: 209.85.128.202, mailfrom: 3emrgzqmkaf0r5fbjjbg9.7jh@flex--wak.bounces.google.com)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-604832bcbd0so35387817b3.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Feb 2024 16:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707526776; x=1708131576; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hVJhJsj0HuPcZ7OPndU5pIdNVOfTtXheLp8Ab7UZhO8=;
        b=QnobUTYVdI/AzYaB9H9+dD0v0HF7IbfD41oODtS+WMx4a8ASWTu8bv6SMIet+PL6N3
         iWfbJPZjufXVKw7dNAU0+groPvestSWa9SOzPKtyv3lu1xeKNLbvhoa43mwgg6Vh7L9v
         R5jV8UT35AVNkwLtT30j2k9YbgaDlf/wDZCnsfhfuioAJsgcbhEipIF3Y2wiK8349kTg
         X2+18qaOlXUESQLMU0m516la1Eb9nZ+bq/E05Bd8iKlcaOnR2bCRBagLjrt+HETDj/hj
         8p0tNDkg5oKkfvIbctyZ65yIeFXHgYylrG/ZXxbQMMruQuDmm7NtV7SguCUFj6N25P/L
         siLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707526776; x=1708131576;
        h=content-transfer-encoding:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hVJhJsj0HuPcZ7OPndU5pIdNVOfTtXheLp8Ab7UZhO8=;
        b=wcvpFznkEoJc+p9uDPMrTvMsWiDvBz21+hovNH4AUy4PWgDZDTJ4it86SpfOSfTlRc
         ZU3Y+mLbBwrDLy2mT44+elH6REwlph8HcdGeK0M91t/IwWV07dUnMvOCpV73uFXGqyTd
         dPS+wWvJvg+EffuAil2QkhyQrYy/i7hPAaYYQ/+HiG3J+Up6UbHXqe0xBaV+i4+NspeW
         rNgZwX7s2iFfx3c2M8LTlhQ0wd59mdPENMpDLG/cvN9TEmHVbWKE694S/a2j2Il+pizn
         yPn6G/XnNwp4JbbwcLHCOqQ6hF8Rh8a7XI6vbC23LIslMdG1HYsFHldPfNny1d/y5yZ9
         I/gQ==
X-Gm-Message-State: AOJu0YxPz5Hya96uOupGFMHHs7dcrhCmV7F4I7rXl2xHgQDxNbAynesN
	FIMXhEZr+K58H/s8uvWNIOWcWZJkjjeFOcntkVXHMa69NEdcvUWOEQGZfRrv4NU/9/eBT2hymrq
	2ciVtoVajq8KQyX53usPzD990vFyFo6z2wjGAwaXJC2XJglcgLMVijDjQ4W+sEURUdYriviIiqm
	yHKpF9BOFUnLBMKXsNRGe3nLvkBtUHYir2/aBs+gx9dw==
X-Google-Smtp-Source: AGHT+IFCDQxlIa41Cw5Loxxo7Ii5OqIMrqq1PwOwXgeZMQH7WD6zCQ7QZBaBoR8QmNlFHI5I+MDL0QI=
X-Received: from wak-linux.svl.corp.google.com ([2620:15c:2a3:200:cf74:ea8a:4909:577e])
 (user=wak job=sendgmr) by 2002:a0d:ddd4:0:b0:5fb:455a:df08 with SMTP id
 g203-20020a0dddd4000000b005fb455adf08mr245507ywe.7.1707526776201; Fri, 09 Feb
 2024 16:59:36 -0800 (PST)
Date: Fri,  9 Feb 2024 16:59:18 -0800
In-Reply-To: <20240210005921.1909326-1-wak@google.com>
Message-Id: <20240210005921.1909326-2-wak@google.com>
Mime-Version: 1.0
References: <20240210005921.1909326-1-wak@google.com>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Subject: [meta-oe][PATCH 1/3] nanopb: Update 0.4.7 -> 0.4.8
From: "William A. Kennington III" <wak@google.com>
To: openembedded-devel@lists.openembedded.org
Cc: "William A. Kennington III" <wak@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Feb 2024 00:59:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108697

Uses the new nanopb_PYTHON_INSTDIR_OVERRIDE to drop the previous patch.

Maintains compatability with 0.4.7 and older by adding symlinks to the
old header paths.

Signed-off-by: William A. Kennington III <wak@google.com>
---
 ...llow-to-set-PYTHON_INSTDIR-from-outs.patch | 67 -------------------
 .../recipes-devtools/nanopb/nanopb_0.4.7.bb   | 33 ---------
 .../recipes-devtools/nanopb/nanopb_0.4.8.bb   | 29 ++++++++
 3 files changed, 29 insertions(+), 100 deletions(-)
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/nan=
opb/nanopb/0001-CMakeLists.txt-allow-to-set-PYTHON_INSTDIR-from-outs.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/nan=
opb/nanopb_0.4.7.bb
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/nan=
opb/nanopb_0.4.8.bb

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nan=
opb/0001-CMakeLists.txt-allow-to-set-PYTHON_INSTDIR-from-outs.patch b/meta-=
oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb/0001-CMakeList=
s.txt-allow-to-set-PYTHON_INSTDIR-from-outs.patch
deleted file mode 100644
index 474f0f158..000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb/000=
1-CMakeLists.txt-allow-to-set-PYTHON_INSTDIR-from-outs.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From 30c79d1b49839a15c05a0d0ca7e54787cd7988c6 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Thu, 4 May 2023 07:17:57 +0000
-Subject: [PATCH] CMakeLists.txt: allow to set PYTHON_INSTDIR from outside
-
-CMakeLists.txt used:
-
-find_package(Python REQUIRED COMPONENTS Interpreter)
-execute_process(
-    COMMAND ${Python_EXECUTABLE} -c
-        "import os.path, sys, sysconfig; print(os.path.relpath(sysconfig.g=
et_path('purelib'), start=3Dsys.prefix))"
-    OUTPUT_VARIABLE PYTHON_INSTDIR
-    OUTPUT_STRIP_TRAILING_WHITESPACE
-)
-
-but with python3native this returns:
-
-nanopb/0.4.7-r0/git $ ../recipe-sysroot-native/usr/bin/python3-native/pyth=
on3 -c "import os.path, sys, sysconfig; print(os.path.relpath(sysconfig.get=
_path('purelib'), start=3Dsys.prefix))"
-lib/python3.11/site-packages
-
-which doesn't respect target libdir which might be lib64 with multilib and=
 with python3targetconfig
-it also doesn't work right because of the long relative path:
-
-nanopb/0.4.7-r0/build $ ../recipe-sysroot-native/usr/bin/python3-native/py=
thon3 -c "import os.path, sys, sysconfig; print(os.path.relpath(sysconfig.g=
et_path('purelib'), start=3Dsys.prefix))"
-../../../../../../../../../../../../usr/lib64/python3.11/site-packages
-
-CMake Error at cmake_install.cmake:46 (file):
-  file cannot create directory:
-  /OE/lge/build/starfish/nanbield/BUILD/work/o22-starfish-linux/nanopb/0.4=
.7-r0/image/usr/../../../../../../../../../../../../usr/lib64/python3.11/si=
te-packages/proto.
-  Maybe need administrative privileges.
-
-Let CMake variable to be passed from the recipe to avoid this as we're alr=
eady using
-${D}${PYTHON_SITEPACKAGES_DIR} in do_install:append anyway.
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-Upstream-Status: Pending
----
- CMakeLists.txt | 16 +++++++++-------
- 1 file changed, 9 insertions(+), 7 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 8d241c5..7d3f993 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -39,13 +39,15 @@ if(NOT DEFINED CMAKE_INSTALL_CMAKEDIR)
-     set(CMAKE_INSTALL_CMAKEDIR "${CMAKE_INSTALL_LIBDIR}/cmake/nanopb")
- endif()
-=20
--find_package(Python REQUIRED COMPONENTS Interpreter)
--execute_process(
--    COMMAND ${Python_EXECUTABLE} -c
--        "import os.path, sys, sysconfig; print(os.path.relpath(sysconfig.=
get_path('purelib'), start=3Dsys.prefix))"
--    OUTPUT_VARIABLE PYTHON_INSTDIR
--    OUTPUT_STRIP_TRAILING_WHITESPACE
--)
-+if(NOT DEFINED PYTHON_INSTDIR)
-+    find_package(Python REQUIRED COMPONENTS Interpreter)
-+    execute_process(
-+        COMMAND ${Python_EXECUTABLE} -c
-+            "import os.path, sys, sysconfig; print(os.path.relpath(syscon=
fig.get_path('purelib'), start=3Dsys.prefix))"
-+        OUTPUT_VARIABLE PYTHON_INSTDIR
-+        OUTPUT_STRIP_TRAILING_WHITESPACE
-+    )
-+endif()
-=20
- if(nanopb_BUILD_GENERATOR)
-     set(generator_protos nanopb)
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nan=
opb_0.4.7.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/n=
anopb_0.4.7.bb
deleted file mode 100644
index 9ad558146..000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb_0.4=
.7.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-DESCRIPTION=3D"Protocol Buffers with small code size"
-LICENSE=3D"Zlib"
-LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D9db4b73a55a3994384112efcdb3=
7c01f"
-
-DEPENDS =3D "protobuf-native"
-
-SRC_URI =3D "git://github.com/nanopb/nanopb.git;branch=3Dmaster;protocol=
=3Dhttps \
-    file://0001-CMakeLists.txt-allow-to-set-PYTHON_INSTDIR-from-outs.patch=
 \
-"
-SRCREV =3D "b97aa657a706d3ba4a9a6ccca7043c9d6fe41cba"
-
-S =3D "${WORKDIR}/git"
-
-inherit cmake python3native
-
-EXTRA_OECMAKE +=3D "-DPYTHON_INSTDIR=3D${PYTHON_SITEPACKAGES_DIR}"
-
-do_install:append() {
-    install -Dm 0755 ${S}/generator/nanopb_generator.py ${D}${bindir}/nano=
pb_generator.py
-    install -Dm 0755 ${S}/generator/protoc-gen-nanopb ${D}${bindir}/protoc=
-gen-nanopb
-    install -Dm 0755 ${S}/generator/proto/__init__.py ${D}${PYTHON_SITEPAC=
KAGES_DIR}/proto/__init__.py
-}
-
-FILES:${PN} +=3D "${PYTHON_SITEPACKAGES_DIR}"
-FILES:${PN}-dev +=3D "${libdir}/cmake/${BPN}"
-
-RDEPENDS:${PN} +=3D "\
-   ${PYTHON_PN}-protobuf \
-   protobuf-compiler \
-"
-
-BBCLASSEXTEND =3D "native nativesdk"
-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nan=
opb_0.4.8.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/n=
anopb_0.4.8.bb
new file mode 100644
index 000000000..d282bf1b2
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb_0.4=
.8.bb
@@ -0,0 +1,29 @@
+DESCRIPTION=3D"Protocol Buffers with small code size"
+LICENSE=3D"Zlib"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D9db4b73a55a3994384112efcdb3=
7c01f"
+
+DEPENDS =3D "protobuf-native"
+
+SRC_URI =3D "git://github.com/nanopb/nanopb.git;branch=3Dmaster;protocol=
=3Dhttps"
+SRCREV =3D "6cfe48d6f1593f8fa5c0f90437f5e6522587745e"
+
+S =3D "${WORKDIR}/git"
+
+inherit cmake python3-dir
+
+EXTRA_OECMAKE +=3D "-Dnanopb_PYTHON_INSTDIR_OVERRIDE=3D${PYTHON_SITEPACKAG=
ES_DIR}"
+
+RDEPENDS:${PN} +=3D "${PYTHON_PN}-protobuf"
+
+# Maintain compatability with old header locations for packages
+# which haven't yet migrated to `nanopb/pb*.h`
+do_install:append() {
+  for hdr in ${D}${includedir}/nanopb/*; do
+	ln -sv nanopb/$(basename "$hdr") ${D}${includedir}/
+  done
+}
+
+FILES:${PN} +=3D "${PYTHON_SITEPACKAGES_DIR}"
+
+BBCLASSEXTEND =3D "native nativesdk"
+
--=20
2.43.0.687.g38aa6559b0-goog


