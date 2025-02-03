Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BC4EC02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 12:10:39 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.86164.1738584634837392646
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Feb 2025 04:10:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YOP1IELW;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43618283d48so31808915e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Feb 2025 04:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738584633; x=1739189433; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4lmOpsnTotnGa8QCqzp9DYwTrEcSdO/yE5++rNboKU=;
        b=YOP1IELWgahZUlo4bAtwtrUQwvC9DyvzPksOi6XHRL3+2/lr1myjr1kYGhKQ80NolG
         AJFmQgH7bwrTfOCoNDg74f1SBuCmZ6Qo+5wqabYl9HH6YjV/Rqliv3uhjOjil7xTDJK9
         b0RMtRWdrAym9lCSp+58/Qm0QB61wvhdsIQq01x/XNibTNyiAv3rIL1zQTFWXQv4/OX5
         hDhJwD36Nvnrg/gK0AL1bqgtaoakLXlPzO1GTSV17p1sPBcQVn1rh6lO9yXIecIPivXS
         oBfdGBxwwP0mcsPu42fElfikDqoMt1g6F2zXcAU1l+g/EJbA+dEtdKPw7711NOYwcRED
         4qrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738584633; x=1739189433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y4lmOpsnTotnGa8QCqzp9DYwTrEcSdO/yE5++rNboKU=;
        b=mT+qeE0brWhJ5MjAD0PeggSAnSGfMK8LN6vOjQpCoJBh/m4I8UxfvgfCSoKm6+/6Gq
         Rz4g7WpdWdmxCNxjVUbekESqZR6aOJnKNFwgHyVnYsYGJ5uicY0SfrK9a/2efo8OrvYM
         +4f0NDazamE66SJiqfMP/5c14bA+SCDwrhOTSCTqNp/BZHrg9sNI7LcwJpzV6yq8Hr90
         n3hRHtpEQG2L4L8h12c99IJ682I3ddZ52+1cJJ3qOyt/D9ETRpyG9Z6HX6w4kdvFnFdO
         AYK/ript9xMdN+xzv950u6jST9N1Ouwl+ayKpYbhZmM9iidV8fr+GGr2DkG2PBZdLNYg
         AP2A==
X-Gm-Message-State: AOJu0YzS/y6McJIisKfeoPGMdw8XsukB9WABZi6PwS3MUiNh867pXUbk
	6t2G8mfAWlMOiymtO1p5DK10VLeCK8hiZN5cmUs5uKtV+klt+zU1ZJcmps+a
X-Gm-Gg: ASbGncu9z0frF/9InaiglIEOKsSZ4zk+1kYLPIu8OtGbSmVaUYbCDToela3pUoYAcGi
	GhUMpxHYaopEHdkg1gtjkGDSkz9PZOntXGbsvQ0/oEo50cTc/QRFLhU6u1+grMXI5VBcQ0o7XUx
	uWV5ySyVkl8ZyxZpOY/hoPChNfrajtx2wexYc3sdAt4PLaE7ggCElUpx9nW69VbskHDGvoYVvAZ
	5G6qg7DQfC6dWTEDI3wHOFgVuYIsovRCnLskfDE/YPE0txeqgpqNPQff0eE54IVbBmg72VYTz9i
	EBO1eCQ2wErIEg5rb+HtGQzdJ2X+eFc=
X-Google-Smtp-Source: AGHT+IF8kCmSNkL5FUsiCBKkaMyNGpLt2+R5SEbEjf6cDbUWV2bzHjbratedb+/gPPTlwFa4d/NzKg==
X-Received: by 2002:a05:600c:3488:b0:434:a711:ace4 with SMTP id 5b1f17b1804b1-438dc3cb049mr192548725e9.17.1738584632614;
        Mon, 03 Feb 2025 04:10:32 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc2f73asm189591285e9.24.2025.02.03.04.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:10:32 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [meta-oe][PATCH v2] capnproto: remove binaries from target-build, add bbclass
Date: Mon,  3 Feb 2025 13:10:23 +0100
Message-ID: <20250203121023.49178-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Feb 2025 12:10:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115238

When linking to capnproto from another project, cmake fails to
find this package with the following error:

| CMake Error at ${RECIPE_SYSROOT}/usr/lib/cmake/CapnProto/CapnProtoTargets.cmake:176 (message):
|   The imported target "CapnProto::capnp_tool" references the file
|
|      "${RECIPE_SYSROOT}/usr/bin/capnp"
|
|   but this file does not exist.  Possible reasons include:

To solve this, this change includes the following:

1. Add a patch that removes the files installed (and exported) in
${bindir} from the target build. The CMake file originally verified
that these files exist when another recipe tried to use it, however
the ${RECIPE_SYSROOT} does not contain the binaries in ${bindir},
so it failed quick in the do_configure step. (This alone is enough
to link against the cross-compiled libraries of capnproto successfully,
but code-generation from capnproto definition fails)

2. Add a new bbclass for capnproto. To cross-compile an application
that uses capnproto, the application needs to be linked against the
cross-compiled version of the libraries, however the native version
of the binaries need to be used to generate C++ code from the
capnproto definitions. This class sets the correct CMake arguments, to
use the capnproto binaries from the native package, instead of looking
for the non-existent cross-compiled binaries. (These variables can
be found in ${libdir}/cmake/CapnProto/CapnProtoConfig.cmake file)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/classes/capnproto.bbclass             |  8 ++++
 ...n-t-check-usr-bin-content-from-cmake.patch | 43 +++++++++++++++++++
 .../capnproto/capnproto_1.0.2.bb              |  3 +-
 3 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/classes/capnproto.bbclass
 create mode 100644 meta-oe/recipes-devtools/capnproto/capnproto/0001-Don-t-check-usr-bin-content-from-cmake.patch

diff --git a/meta-oe/classes/capnproto.bbclass b/meta-oe/classes/capnproto.bbclass
new file mode 100644
index 000000000..a698f41c9
--- /dev/null
+++ b/meta-oe/classes/capnproto.bbclass
@@ -0,0 +1,8 @@
+# Inherit this class in your recipe to compile against 
+# Cap'N Proto (capnproto) with CMake
+
+DEPENDS:append = " capnproto-native "
+DEPENDS:append:class-target = " capnproto "
+
+EXTRA_OECMAKE:append:class-target = " -DCAPNP_EXECUTABLE=${RECIPE_SYSROOT_NATIVE}${bindir}/capnp \
+                                      -DCAPNPC_CXX_EXECUTABLE=${RECIPE_SYSROOT_NATIVE}${bindir}/capnpc-c++ "
diff --git a/meta-oe/recipes-devtools/capnproto/capnproto/0001-Don-t-check-usr-bin-content-from-cmake.patch b/meta-oe/recipes-devtools/capnproto/capnproto/0001-Don-t-check-usr-bin-content-from-cmake.patch
new file mode 100644
index 000000000..6447fadcf
--- /dev/null
+++ b/meta-oe/recipes-devtools/capnproto/capnproto/0001-Don-t-check-usr-bin-content-from-cmake.patch
@@ -0,0 +1,43 @@
+From 43573472a62ff68ba6b1180d6551ef536471a99f Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Mon, 3 Feb 2025 11:52:01 +0100
+Subject: [PATCH] Don't install files in bindir
+
+This patch prevents the generated binary executables from being
+installed into the /usr/bin folder.
+
+By default, cmake installs these binaries into the /usr/bin folder,
+(e.g. binaries used to generate C++ source from the capnproto definition
+files) however with Yocto, when using the cross-compiled version of this
+application, the /usr/bin folder is not populated in the sysroot.
+The generated cmake file however tries to verify that these binaries
+exist, and since it cannot find them, it fails the build.
+
+But even in case these files would exist, they are not usable on the build
+machine, as these are cross-compiled for the target machine. When another
+recipe it built against the capnproto cmake package, the application can
+link against the cross-compiled libraries as expected, but for code
+generation the capnproto-native package's binaries need to be used.
+
+This patch is only applicable on the cross-compiled version of capnproto.
+
+Upstream-Status: Inappropriate [oe specific: see above message]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ c++/src/capnp/CMakeLists.txt | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/c++/src/capnp/CMakeLists.txt b/c++/src/capnp/CMakeLists.txt
+index 9980fde6..101a7091 100644
+--- a/src/capnp/CMakeLists.txt
++++ b/src/capnp/CMakeLists.txt
+@@ -210,8 +210,6 @@ if(NOT CAPNP_LITE)
+   target_link_libraries(capnpc_capnp capnp kj)
+   set_target_properties(capnpc_capnp PROPERTIES OUTPUT_NAME capnpc-capnp)
+ 
+-  install(TARGETS capnp_tool capnpc_cpp capnpc_capnp ${INSTALL_TARGETS_DEFAULT_ARGS})
+-
+   if(WIN32)
+     # On Windows platforms symlinks are not guaranteed to support. Also different version of CMake handle create_symlink in a different way.
+     # The most portable way in this case just copy the file.
diff --git a/meta-oe/recipes-devtools/capnproto/capnproto_1.0.2.bb b/meta-oe/recipes-devtools/capnproto/capnproto_1.0.2.bb
index daeeb975f..6136ff20f 100644
--- a/meta-oe/recipes-devtools/capnproto/capnproto_1.0.2.bb
+++ b/meta-oe/recipes-devtools/capnproto/capnproto_1.0.2.bb
@@ -5,7 +5,8 @@ SECTION = "console/tools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://../LICENSE;md5=a05663ae6cca874123bf667a60dca8c9"
 
-SRC_URI = "git://github.com/sandstorm-io/capnproto.git;branch=release-${PV};protocol=https"
+SRC_URI = "git://github.com/sandstorm-io/capnproto.git;branch=release-${PV};protocol=https \
+           file://0001-Don-t-check-usr-bin-content-from-cmake.patch"
 SRCREV = "1a0e12c0a3ba1f0dbbad45ddfef555166e0a14fc"
 
 S = "${WORKDIR}/git/c++"

