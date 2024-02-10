Return-Path: <wak@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B007C4829D
	for <webhook@archiver.kernel.org>; Sat, 10 Feb 2024 00:59:48 +0000 (UTC)
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
 by mx.groups.io with SMTP id smtpd.web11.4582.1707526780152631025
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Feb 2024 16:59:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20230601 header.b=eKWxbFQ3;
 spf=pass (domain: flex--wak.bounces.google.com, ip: 209.85.128.202, mailfrom: 3e8rgzqmkagau8iemmejc.amk@flex--wak.bounces.google.com)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-5f0fd486b9aso26475577b3.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Feb 2024 16:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707526779; x=1708131579; darn=lists.openembedded.org;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sDY1IkO+j38fVie+tYCW6T9o4ngTO238n0a13p6B9TQ=;
        b=eKWxbFQ3VdRzEvEjt5gU08VjW8jqLebufqg4gbIfbSZeXBaEpZsT1OiNIH61+b6kf0
         /sf92oZ9F14TAkSgit56QU6+qM585UPCDlmD39RX/+pZnvFanuWVyEtbXrjYCcc8KMH4
         khQbUFAVTFVbKxjwCCkjz+epSArV8F4wFJj9zJFVI+MzWD5OXTfcIErLWA5lCSVMRFsm
         e96S9OmhUOyTLyBQSaEsH5FYeAakkCa7fyHRsOB/ByI8yujXyk8LnMfcVMjUHMQ2Hj6G
         y7yobP7lVBCUZph7jRbqrX4ypss1h4jCivUAXdRUj3QxyfMB0fbINNq87hxtYKz7wzVF
         vi/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707526779; x=1708131579;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sDY1IkO+j38fVie+tYCW6T9o4ngTO238n0a13p6B9TQ=;
        b=moylaPL3Ng0RF0Mj9fMdU5P/W4kuFSRX99nlECX6biMixmPF2Ee1AOLt8oWVmoJWg3
         alNTIBHfiXi0o5MDzs8QDUMi8KvKHwhLY/6p0JATuLpa7gWKG8eh9xFil2zOyEP5Efz1
         KFBT72+dxLqBxem9o9jUXpyBlVmRl9KpChKi4tvOUnXeZoMZhqQ+iHskSDKCX4BEPer4
         +C41lvmGCbzhlnb7yzDNOCXGCUT5sPEFn9aRqyo1j3qY2tiljNKqheaX3+viU8ptsFm0
         l84gRLQe5kphXZ17Wov5I87pMBn7S+wFhzU328USXuaJ+WM90nzAmHOn4HDfBv8iP7/F
         IVWg==
X-Gm-Message-State: AOJu0YzBEdyIdTNjz/8Qk4XRDxz72vxDxzsL7sEkL6SilABrQc+Gj3Q4
	I0w5VxQ23p4d20sfwm4zacavrfFDTUjGJdblJcSaB6ichIAee7avJ6hhaNQUbm6p8MTGJdfAaEc
	+jxUz3SBtSlIuB+g3onpbZ6q2y+dloelIxS7NMs54ThDLhuKLrZ+jrAh4NjKW4+HlNem1FUJeax
	XLQYl6uuOxhgWwI5Thy42QUU5OUlWcXmAJ6rVldx1KiQ==
X-Google-Smtp-Source: AGHT+IH0IR81KkkOnMjLUXgHDdjWAoojiIh2fBEM/DCzcD0GY0Yl+JAq7eNW8JmufEYhAG9l8a2q268=
X-Received: from wak-linux.svl.corp.google.com ([2620:15c:2a3:200:cf74:ea8a:4909:577e])
 (user=wak job=sendgmr) by 2002:a05:690c:360d:b0:5fb:5605:494a with SMTP id
 ft13-20020a05690c360d00b005fb5605494amr139191ywb.7.1707526779288; Fri, 09 Feb
 2024 16:59:39 -0800 (PST)
Date: Fri,  9 Feb 2024 16:59:19 -0800
In-Reply-To: <20240210005921.1909326-1-wak@google.com>
Message-Id: <20240210005921.1909326-3-wak@google.com>
Mime-Version: 1.0
References: <20240210005921.1909326-1-wak@google.com>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Subject: [meta-oe][PATCH 2/3] nanopb: Split into 2 packages
From: "William A. Kennington III" <wak@google.com>
To: openembedded-devel@lists.openembedded.org
Cc: "William A. Kennington III" <wak@google.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Feb 2024 00:59:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108698

This makes it possible to avoid building components which are not used
in the native or runtime tooling. Most users of nanopb just want to
build `nanopb-generator-native` and `nanopb-runtime` and not the other
two combinations as they are building software for their target
leveraging nanopb.

Signed-off-by: William A. Kennington III <wak@google.com>
---
 .../nanopb/nanopb-generator_0.4.8.bb          | 14 +++++++++
 .../nanopb/nanopb-runtime_0.4.8.bb            | 16 ++++++++++
 .../recipes-devtools/nanopb/nanopb.bb         | 17 +++++++++++
 .../recipes-devtools/nanopb/nanopb.inc        | 13 +++++++++
 .../recipes-devtools/nanopb/nanopb_0.4.8.bb   | 29 -------------------
 5 files changed, 60 insertions(+), 29 deletions(-)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb-generator_0.4.8.bb
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb-runtime_0.4.8.bb
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb.bb
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb.inc
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb_0.4.8.bb

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb-generator_0.4.8.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb-generator_0.4.8.bb
new file mode 100644
index 000000000..c86750f8b
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb-generator_0.4.8.bb
@@ -0,0 +1,14 @@
+require nanopb.inc
+
+inherit python3-dir
+
+DEPENDS = "protobuf-native"
+RDEPENDS:${PN} += "python3-protobuf"
+
+EXTRA_OECMAKE += " \
+  -Dnanopb_PYTHON_INSTDIR_OVERRIDE=${PYTHON_SITEPACKAGES_DIR} \
+  -Dnanopb_BUILD_RUNTIME=OFF \
+  -Dnanopb_BUILD_GENERATOR=ON \
+  "
+
+FILES:${PN} += "${PYTHON_SITEPACKAGES_DIR}"
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb-runtime_0.4.8.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb-runtime_0.4.8.bb
new file mode 100644
index 000000000..e36abf808
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb-runtime_0.4.8.bb
@@ -0,0 +1,16 @@
+require nanopb.inc
+
+EXTRA_OECMAKE += " \
+  -Dnanopb_PROTOC_PATH=/bin/false \
+  -Dnanopb_BUILD_RUNTIME=ON \
+  -Dnanopb_BUILD_GENERATOR=OFF \
+  "
+
+# Maintain compatability with old header locations for packages
+# which haven't yet migrated to `nanopb/pb*.h`
+do_install:append() {
+  for hdr in ${D}${includedir}/nanopb/*; do
+	ln -sv nanopb/$(basename "$hdr") ${D}${includedir}/
+  done
+}
+
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb.bb
new file mode 100644
index 000000000..7ad6a3278
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Combined nanopb package"
+PV = "1.0"
+PR = "r1"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+inherit packagegroup
+
+DEPENDS = " \
+    nanopb-generator \
+    nanopb-runtime \
+"
+
+RDEPENDS:${PN} = " \
+    nanopb-generator \
+    nanopb-runtime \
+"
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb.inc b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb.inc
new file mode 100644
index 000000000..87dbc73e6
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb.inc
@@ -0,0 +1,13 @@
+DESCRIPTION="Protocol Buffers with small code size"
+LICENSE="Zlib"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9db4b73a55a3994384112efcdb37c01f"
+
+SRC_URI = "git://github.com/nanopb/nanopb.git;branch=master;protocol=https"
+SRCREV = "6cfe48d6f1593f8fa5c0f90437f5e6522587745e"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+BBCLASSEXTEND = "native nativesdk"
+
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb_0.4.8.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb_0.4.8.bb
deleted file mode 100644
index d282bf1b2..000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb_0.4.8.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-DESCRIPTION="Protocol Buffers with small code size"
-LICENSE="Zlib"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9db4b73a55a3994384112efcdb37c01f"
-
-DEPENDS = "protobuf-native"
-
-SRC_URI = "git://github.com/nanopb/nanopb.git;branch=master;protocol=https"
-SRCREV = "6cfe48d6f1593f8fa5c0f90437f5e6522587745e"
-
-S = "${WORKDIR}/git"
-
-inherit cmake python3-dir
-
-EXTRA_OECMAKE += "-Dnanopb_PYTHON_INSTDIR_OVERRIDE=${PYTHON_SITEPACKAGES_DIR}"
-
-RDEPENDS:${PN} += "${PYTHON_PN}-protobuf"
-
-# Maintain compatability with old header locations for packages
-# which haven't yet migrated to `nanopb/pb*.h`
-do_install:append() {
-  for hdr in ${D}${includedir}/nanopb/*; do
-	ln -sv nanopb/$(basename "$hdr") ${D}${includedir}/
-  done
-}
-
-FILES:${PN} += "${PYTHON_SITEPACKAGES_DIR}"
-
-BBCLASSEXTEND = "native nativesdk"
-
-- 
2.43.0.687.g38aa6559b0-goog


