Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58AABC53200
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 05:29:12 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4930.1785302949994369759
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2026 22:29:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=G4dS4wpY;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38e3efab7e0so465362a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 22:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785302949; x=1785907749; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B9dvt+8xYxPS4NxtYpv5WL8dE78kqJWYfgIPio1QDxo=;
        b=G4dS4wpYGGZuMyQ4lnOg2rKj4Zo+IRKvSa28O3xof3ZMgD7phlMf3/iai5DFphvXre
         /qbERT7IwzBk8wUepKt+6lgVKurNYKOjDms8iFkwLpvdOmcqiWg7uJyl/VLUdj63HdMS
         c5Iu+eUCnJ92AfCw36aC2hA4qo7JgKt8kEXo9Qo4GRTVJxP/cSHPHoQaSVyrU42oZWcR
         Ald+u1T419GKm5Nx3q36UMkTCOPvGicUfYcsC/pwdDpVdlKc0qw7R7KEHRiJsBb1wA4x
         Brc75PxcC5QDJDrdRwWarWRoFWe7OK3990vUS2Ii8MxpgruVebIci0QwXVKu4f9LGd8E
         Lx2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785302949; x=1785907749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B9dvt+8xYxPS4NxtYpv5WL8dE78kqJWYfgIPio1QDxo=;
        b=TABJRz+UFw6ap6YO7dJhlRmCdqe+6AfzwYZZokk4PhIUtzJL5+hpQIcmdoWDN3th1V
         4oF92WHA8vdb9wTqg2SBP8395sTBRbyiZq4GtnA/gOvL/T0T5AzXCWAWRIN+TPfFh9ym
         csZOEGzzCOxVQmZTiNEfevr1flmrBkKWhHLPsMT0n39e350ilOsSfou8Q92SE6nQJNO/
         qS0hRrfdsxE6T/k2AjyRBqJg/kjfw9J3Bm1L7WOnWW+AwA2SgI4rbgvDYBItm3ewDdgM
         vSbGe4c2VFvAp3+s1Aj/5wNTEwmtZpVbGtvc47RlnHRuwDOWnIzuCBOaBhOcIIfsTLzd
         MlFw==
X-Gm-Message-State: AOJu0YzpIP31EKOX1DM8cKay5+yUEawggkDDpY5tQU19t0QNabePvzBm
	SYbLuvRgDj93HgyC9BGSpEsVYVyPyVnSjaAOvUrU2vOXmChyOqMNw3LySd2/hnNY
X-Gm-Gg: AR+sD13eG5rHU9pvaMeMjc5wAjXoLnXo0M6xLYamPbYxXS3YzoDjDvmsLJrn/csUs4m
	KtUnEIoSIwTf62wEzbFw4YEC4yx3EujG3vRM4cpmJ7XP8lIftcF0z9EYkDb4NspqbQEUE+ikaAy
	bYKLU4+dNi8Cx3YMqSlEY5dnquuS3gkru4Mpg/mVs5kjqcud2vS5W6vGZGFBiKWlWFXS4dtvsiw
	J6wxkg+MxBBGlWqhT3HanqoqataW9jVq6G6LagBkxTRNiJwA7sIp1Vt/lWh1mtdrSkl+iU9b3IP
	HF80UVNuqhWwEjcbmmftPPbWU5fpFvueveSB2Rk+LbFp44s12WJQyDMexre2NMscv6iFP3Jgjbw
	MksP6tKxj+qvrNE/ZV1CyF0+wUNaSgSK+bj4d4zZWT1TzzBSz1BIvoUxAw/HuFk70vI6Ws41Pkh
	d/LBqnOlaEke4uhr0ZFo9hRz60iYeeVA2h+AKhkVTjNkLUEi6/27iKMApCgc1rCPnEYRKOb8/fC
	0kJK8pGX4bRf0Mso+LwdmyUoeEjuOv1Qs+hBynnD8OrVOA+hKC/VHP2iWa/nTUJC/xYf+R22ICG
	0nj/qvIkLdT/EeLAEvL2XMZIKuz3JbctewPpyt5c0e51S22puz/QkJm9He4lurBOfkx8xpjJTiz
	8JrJnfmFY6Chw
X-Received: by 2002:a17:90b:4403:b0:381:10a3:8b10 with SMTP id 98e67ed59e1d1-38f8369c1femr900424a91.14.1785302949220;
        Tue, 28 Jul 2026 22:29:09 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7271f010sm6097316c88.9.2026.07.28.22.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 22:29:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 5/5] bcc: Stop baking the build directory into the ptest binaries
Date: Tue, 28 Jul 2026 22:29:00 -0700
Message-ID: <20260729052901.2147056-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729052901.2147056-1-khem.raj@oss.qualcomm.com>
References: <20260729052901.2147056-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 05:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128539

From: Khem Raj <raj.khem@gmail.com>

tests/cc passes -DCMAKE_CURRENT_BINARY_DIR="${CMAKE_CURRENT_BINARY_DIR}" to
every test object so the tests can find archive.zip, the debuginfo libraries
and dummy_proc_map.txt at runtime. That put 13 copies of the absolute build
directory into the installed test binary:

  QA Issue: File /usr/lib/bcc/ptest/tests/cc/test_libbcc_no_libbpf in package
  bcc-ptest contains reference to TMPDIR [buildpaths]

and, on autobuilders whose TMPDIR sits below $HOME, additionally:

  QA Issue: ... contains a reference to the build host HOME directory.

The recipe worked around this by installing the assets to ${D}${B}/tests/cc,
i.e. by reproducing the build path inside the image, and by demoting
buildpaths to a warning.

Add a patch introducing a TEST_ASSET_DIR cache variable, defaulting to
CMAKE_CURRENT_BINARY_DIR so the upstream default is unchanged, and point it at
${PTEST_PATH}/tests/cc. The assets are now installed next to the test binaries
and no build path is embedded, so the buildpaths overrides can go away.

Also install dummy_proc_map.txt, which the tests reference but which was never
shipped.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...verriding-the-runtime-location-of-te.patch | 49 +++++++++++++++++++
 .../recipes-devtools/bcc/bcc_0.37.0.bb        | 24 +++++----
 2 files changed, 60 insertions(+), 13 deletions(-)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0001-tests-cc-Allow-overriding-the-runtime-location-of-te.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0001-tests-cc-Allow-overriding-the-runtime-location-of-te.patch b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0001-tests-cc-Allow-overriding-the-runtime-location-of-te.patch
new file mode 100644
index 0000000000..71fc2f5b7e
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0001-tests-cc-Allow-overriding-the-runtime-location-of-te.patch
@@ -0,0 +1,49 @@
+From ba4c3827dd93a21e35d324b41b90ffbd1dff5c4f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 28 Jul 2026 21:04:15 -0700
+Subject: [PATCH] tests/cc: Allow overriding the runtime location of test
+ assets
+
+tests/cc bakes CMAKE_CURRENT_BINARY_DIR into every test object so that the
+tests can find archive.zip, the debuginfo test libraries and
+dummy_proc_map.txt at runtime.
+
+That makes the build directory part of the installed test binaries. For
+distributions which build the tests in one place and run them somewhere else
+this is both useless and a reproducibility problem: the absolute build path
+ends up embedded in a shipped binary, and the assets have to be installed at
+that same path for the tests to pass.
+
+Introduce a TEST_ASSET_DIR cache variable which defaults to
+CMAKE_CURRENT_BINARY_DIR, so the default behaviour is unchanged, and use it
+for the macro definition. Packagers can now point it at wherever the assets
+are installed.
+
+The macro keeps its current name to avoid churn in the test sources.
+
+Upstream-Status: Submitted [https://github.com/iovisor/bcc/issues]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/cc/CMakeLists.txt | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/tests/cc/CMakeLists.txt b/tests/cc/CMakeLists.txt
+index b4dd3f9..8f56fc9 100644
+--- a/tests/cc/CMakeLists.txt
++++ b/tests/cc/CMakeLists.txt
+@@ -19,7 +19,13 @@ else()
+ endif()
+
+ add_test(NAME c_test_static COMMAND ${TEST_WRAPPER} c_test_static sudo ${CMAKE_CURRENT_BINARY_DIR}/test_static)
+-add_compile_options(-DCMAKE_CURRENT_BINARY_DIR="${CMAKE_CURRENT_BINARY_DIR}")
++# The tests locate their assets (archive.zip, the debuginfo libraries,
++# dummy_proc_map.txt, ...) through this macro. Let the runtime location be
++# overridden so that distributions can install the assets next to the test
++# binaries instead of baking the build directory into them.
++set(TEST_ASSET_DIR "${CMAKE_CURRENT_BINARY_DIR}" CACHE STRING
++    "Directory containing the test assets at runtime")
++add_compile_options(-DCMAKE_CURRENT_BINARY_DIR="${TEST_ASSET_DIR}")
+
+ set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-unused-result -fPIC")
+ set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-unused-result -fPIC")
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.37.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.37.0.bb
index 9ecc30b58b..9315a6e603 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.37.0.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.37.0.bb
@@ -22,6 +22,7 @@ RDEPENDS:${PN}-ptest = "kernel-devsrc packagegroup-core-buildessential cmake bas
 SRC_URI = "gitsm://github.com/iovisor/bcc;branch=master;protocol=https;lfs=0;tag=v${PV} \
            file://0001-CMakeLists.txt-override-the-PY_CMD_ESCAPED.patch \
            file://0001-Vendor-just-enough-extra-headers-to-allow-libbpf-to-.patch \
+           file://0001-tests-cc-Allow-overriding-the-runtime-location-of-te.patch \
            file://run-ptest \
            file://ptest_wrapper.sh \
            "
@@ -44,6 +45,11 @@ EXTRA_OECMAKE = " \
     -DPYTHON_FLAGS=--install-lib=${PYTHON_SITEPACKAGES_DIR} \
 "

+# The C tests hardcode the location of their assets at build time. Point that at
+# where do_install_ptest puts them so the build directory does not end up baked
+# into the installed test binaries.
+EXTRA_OECMAKE += "-DTEST_ASSET_DIR=${PTEST_PATH}/tests/cc"
+
 # Avoid stripping debuginfo.so to fix some tests.
 INHIBIT_PACKAGE_STRIP = "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
@@ -58,10 +64,11 @@ do_install:append() {

 do_install_ptest() {
     install -d ${D}${PTEST_PATH}/tests/cc
-    # ptest searches for shared libs and archive files in the build folder.
-    # Hence, these files are copied to the image to fix these tests.
-    install -d ${D}${B}/tests/cc
-    install ${B}/tests/cc/archive.zip ${B}/tests/cc/libdebuginfo_test_lib.so ${B}/tests/cc/with_gnu_debuglink.so ${B}/tests/cc/with_gnu_debugdata.so ${B}/tests/cc/debuginfo.so ${D}${B}/tests/cc
+    # The C tests look their assets up under TEST_ASSET_DIR, which is pointed at
+    # ${PTEST_PATH}/tests/cc at configure time, so install them next to the test
+    # binaries rather than at the (build host specific) build directory path.
+    install ${B}/tests/cc/archive.zip ${B}/tests/cc/libdebuginfo_test_lib.so ${B}/tests/cc/with_gnu_debuglink.so ${B}/tests/cc/with_gnu_debugdata.so ${B}/tests/cc/debuginfo.so ${D}${PTEST_PATH}/tests/cc
+    install -m 0644 ${B}/tests/cc/dummy_proc_map.txt ${D}${PTEST_PATH}/tests/cc
     install -d ${D}/opt
     install ${B}/tests/cc/test_libbcc_no_libbpf ${B}/tests/cc/libusdt_test_lib.so ${D}${PTEST_PATH}/tests/cc
     cp -rf ${S}/tests/python ${D}${PTEST_PATH}/tests/python
@@ -75,18 +82,9 @@ do_install_ptest() {
 }

 FILES:${PN} += "${PYTHON_SITEPACKAGES_DIR}"
-FILES:${PN} += "${B}/tests/cc"
 FILES:${PN}-ptest += "${libdir}/libbcc.so"
 FILES:${PN}-ptest += "${libdir}/tools/"
 FILES:${PN}-ptest += "/opt/"
 FILES:${PN}-doc += "${datadir}/${PN}/man"

 COMPATIBLE_HOST = "(x86_64.*|aarch64.*|powerpc64.*|riscv64.*)-linux"
-
-# WARNING: bcc-0.30.0+git-r0 do_package_qa: QA Issue: File /usr/lib/bcc/ptest/tests/cc/test_libbcc_no_libbpf in package bcc-ptest contains reference to TMPDIR [buildpaths]
-# this one is difficult to resolve, because the tests use CMAKE_CURRENT_BINARY_DIR directly in .cc e.g.:
-# https://github.com/iovisor/bcc/commit/7271bfc946a19413761be2e3c60c48bf72c5eea1#diff-233a0bfa490f3d7466c49935b64c86dd93956bbc0461f5af703b344cf6601461
-# we would probably need to use separate variable for "runtime" path for test assets from the standard CMAKE_CURRENT_BINARY_DIR variable or use relative
-# path from the test binary
-WARN_QA:append = "${@bb.utils.contains('PTEST_ENABLED', '1', ' buildpaths', '', d)}"
-ERROR_QA:remove = "${@bb.utils.contains('PTEST_ENABLED', '1', 'buildpaths', '', d)}"

