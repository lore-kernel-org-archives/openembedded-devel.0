Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BCD2C7618B
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 08:04:39 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.2628.1678867476344062778
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Mar 2023 01:04:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BVv5cEuW;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id w9so1264684edc.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 01:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678867474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rfdSTR/cJONzajWWmd7UxXy3250d4quGi+9PkGlrPvw=;
        b=BVv5cEuWsQpVtIzpOR6wlIoXWeKxxm9ti9ZRF3JliHi8/JztEGyg+xE8fPy9dKRbeZ
         l2mkCSOVanRaXwCsR6QMMw+ZKUwP4fe+mswNZTBbMLNZASTdp3QXke4j3QPhxOZUFCpU
         v/fP5t2+v20PBapstqNOfOnrw58pXBA49j2UocJko4KxrrIaqvvGKiV3WCTSt54nOqyS
         oU+D9R3r6ToOeOIpS1DHR2QEGI7rlBwrZBXq2ie53i2aE15XHOER2oYJVX4YMzBO+O2S
         Pp8Ey7kEidHCXWpkxrbkb9iRV3+X8rkMehg6Ol224k8l42XyPhRy0yszijrmeQOwfFVB
         kynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678867474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rfdSTR/cJONzajWWmd7UxXy3250d4quGi+9PkGlrPvw=;
        b=WCxNGs9qNU6IQ5+ynqER1rQK7L/HqFGb+NmgFuJAJNMuq3nbRw3f52PrmzMKapNaes
         UTz6LDG+ZEhTxzuqEv+/cJCDipOwUNRgtOgXAR6nzH3Z+w9bsp+WifVQS8lGf1hDavfp
         dbNTJc7rbXF0jn5AM3z6ESTodIFe64Ju8sM54jr98gmK4DE1czJkFgrnwvUOrX0Q8+F2
         PE7o8B1B4iK2TETA/cb/1cc5D3WzqoZLZTTuHmo7DwWaOPcouNh7iyTftzHww7XDBzyl
         ux3qqMicfRvGOddA295uLYzVbWkNxhTy+6dq+PUsg7l4sbt0cVzg4y5KjifQT/GStIVg
         T5Jg==
X-Gm-Message-State: AO0yUKV5r42z/tD6Sz+4SYugFrqu6DGwo004FhC7VgMCqK6b8KcZGnL+
	+RT7USnR37uWqqGA7wMxoWcfBA36VcQ=
X-Google-Smtp-Source: AK7set9U76uMRmLQ5ts88hIw1HLHVkLSYBmzwu2reRdtuhDqRdP1wmivYwDAKvr0gOc/yLWVUGP9pA==
X-Received: by 2002:a17:906:830c:b0:7ad:aed7:a5da with SMTP id j12-20020a170906830c00b007adaed7a5damr5411738ejx.28.1678867474599;
        Wed, 15 Mar 2023 01:04:34 -0700 (PDT)
Received: from localhost.lan (BC2440CC.dsl.pool.telekom.hu. [188.36.64.204])
        by smtp.gmail.com with ESMTPSA id g11-20020a170906348b00b0092b4602f506sm2136382ejb.73.2023.03.15.01.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 01:04:34 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-python][PATCH 2/4] python3-patchelf: New recipe
Date: Wed, 15 Mar 2023 09:04:27 +0100
Message-Id: <20230315080429.2722555-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315080429.2722555-1-zboszor@gmail.com>
References: <20230315080429.2722555-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 08:04:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101530

Dummy module to indicate the presence of patchelf.
Used by python3-meson-python.

The CMakeLists.txt file is a crippled copy from this patchelf
python module's sources, removing almost everything, and
adding a dummy install target, so do_install() doesn't fail.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../python/python3-patchelf/CMakeLists.txt    |  7 +++++
 .../python/python3-patchelf/patchelf.patch    | 11 +++++++
 .../python/python3-patchelf_0.17.2.1.bb       | 31 +++++++++++++++++++
 3 files changed, 49 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-patchelf/CMakeLists.txt
 create mode 100644 meta-python/recipes-devtools/python/python3-patchelf/patchelf.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-patchelf_0.17.2.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-patchelf/CMakeLists.txt b/meta-python/recipes-devtools/python/python3-patchelf/CMakeLists.txt
new file mode 100644
index 000000000..335bb503f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-patchelf/CMakeLists.txt
@@ -0,0 +1,7 @@
+cmake_minimum_required(VERSION 3.6)
+
+project(PatchelfPythonDistributions)
+
+install(CODE "
+ message(STATUS \"Install patchelf project\")
+")
diff --git a/meta-python/recipes-devtools/python/python3-patchelf/patchelf.patch b/meta-python/recipes-devtools/python/python3-patchelf/patchelf.patch
new file mode 100644
index 000000000..96dbf2180
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-patchelf/patchelf.patch
@@ -0,0 +1,11 @@
+--- patchelf-0.17.2.1/setup.py.old	2023-03-13 10:12:55.951514413 +0100
++++ patchelf-0.17.2.1/setup.py	2023-03-13 10:13:18.877751074 +0100
+@@ -95,8 +95,6 @@
+     version=get_version(),
+     cmdclass=cmdclass,
+ 
+-    scripts=["bin/patchelf"],
+-
+     url="https://github.com/NixOS/patchelf",
+     project_urls={
+         "Source Code": "https://github.com/mayeut/patchelf-pypi",
diff --git a/meta-python/recipes-devtools/python/python3-patchelf_0.17.2.1.bb b/meta-python/recipes-devtools/python/python3-patchelf_0.17.2.1.bb
new file mode 100644
index 000000000..630bd808a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-patchelf_0.17.2.1.bb
@@ -0,0 +1,31 @@
+# This is a dummy package needed by python3-meson-python
+SUMMARY = "A small utility to modify the dynamic linker and RPATH of ELF executables."
+LICENSE = "GPL-3.0-or-later & Apache-2.0"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327 \
+    file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+"
+
+DEPENDS = "python3-scikit-build-native"
+
+PYPI_PACKAGE = "patchelf"
+PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
+
+inherit pypi python_setuptools_build_meta
+SRC_URI[sha256sum] = "a6eb0dd452ce4127d0d5e1eb26515e39186fa609364274bc1b0b77539cfa7031"
+
+SRC_URI += " \
+    file://CMakeLists.txt \
+    file://patchelf.patch \
+"
+
+addtask do_patchbuild after do_patch before do_configure
+
+do_patchbuild () {
+    rm -f ${S}/CMakeLists.txt
+    cp ${WORKDIR}/CMakeLists.txt ${S}/
+}
+
+RDEPENDS:${PN} = "patchelf"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


