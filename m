Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B42DDC48BC4
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 07:29:42 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web10.8492.1708414181758320288
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 23:29:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CeXn60rt;
 spf=pass (domain: gmail.com, ip: 209.85.166.176, mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-36517375cc6so6731235ab.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 23:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708414181; x=1709018981; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UuCUsTcC9UXlFmEAEfpHIbjxMwMIFodGfqDO+kpvHz0=;
        b=CeXn60rtetUccdmIz3GRUX8y10AgqgBdMcsCoulSNLe6J7CaGXetpTbMyFD/GkMwmU
         70GwsR7M8zFpKIuU4uCbqZXdbgjIN2J22+B71zSfbO+HGKUQdsNqP4s3z5ANeUAkpXQd
         meqRMEt+JeNJ7mGmLhE/yA5dmlyu+Ocpa2LP+3InVVk/MWFyP5M/k14Cfnp6nT4EwLsu
         0Nbj41o2APdts9S7XbH+iMSk7xiSOZZW9ZL+gsoEjATjMJzJXPQCi2jz27gHYqSB2USQ
         oX9umJGifYEBbd7RULpDuBVTe19PsolWWmUCRVTTdWqPJmRuvkk6Ts20WS6++MfbXCYT
         0pHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708414181; x=1709018981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UuCUsTcC9UXlFmEAEfpHIbjxMwMIFodGfqDO+kpvHz0=;
        b=lYOdhygYW7dax3UV6s0OzwojjxJCxFnoBvMOSXwtAgvG8Tx1bZccqGkZy7PBX4lPoW
         7TpeG6n5Bf802H7nvnofT6Hxb+VLlucqVY7WrQhL0OJRZlqJ7Wul1afX1Gvlm7UlVuDK
         cmk+RtPAM8+9FGxfmWlrkC0gCJh2mutcphoTYkX7YUolVC/gaKdtt0rt5xlBfTfgaOV9
         JcqfigdxVyedzMswWM4Jtb1CQq6GAzJ29tmA9M/FsP9ObtYRxTYhtUX++QP/EiFztLZK
         0ipHpmGkWSKU+ml4f/jD0tiRM640UECUydZ+FiPpS1Oi9uRQ+nY4CTtEupqtxR6M/Wlc
         fX8w==
X-Gm-Message-State: AOJu0YwWByXUDW0Cn0VvoTixO2rmLFe46bG1UY1X0r6+WpeR6g/vSQVH
	2gwhB8R+snsg41tc0eB4G9ovTZPAUsEKIFGk1xhLBlFamWZUf9s0AwOyHlwBO0E=
X-Google-Smtp-Source: AGHT+IGXjsaw+UIPxcLqRE2d830AL9DfXMBjPkWSgAacGbmK14FVM/H6kbHBkRl9GVu/BPz++Y38Fg==
X-Received: by 2002:a05:6e02:1886:b0:365:1a88:f654 with SMTP id o6-20020a056e02188600b003651a88f654mr12609885ilu.28.1708414180666;
        Mon, 19 Feb 2024 23:29:40 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::6a44])
        by smtp.gmail.com with ESMTPSA id k15-20020a6568cf000000b005dc5129ba9dsm4988309pgt.72.2024.02.19.23.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 23:29:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-pocketsphinx: Upgrade to 5.0.3
Date: Mon, 19 Feb 2024 23:29:37 -0800
Message-ID: <20240220072937.2337129-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 07:29:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108918

License-Update: New licenses added for WebRTC json parser, and json escaping

[1] https://github.com/cmusphinx/pocketsphinx/commit/4cb5845898c7d9e53688aba370ea3c00c0ef7db2
[2] https://github.com/cmusphinx/pocketsphinx/commit/6b9a923832a1fd77c5304eba18e63d8b0e2ef0b8

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-cython-Use-cythyon3-in-cmake-check.patch | 29 +++++++++++++++++++
 .../python/python3-pocketsphinx_0.1.15.bb     | 14 ---------
 .../python/python3-pocketsphinx_5.0.3.bb      | 20 +++++++++++++
 3 files changed, 49 insertions(+), 14 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pocketsphinx/0001-cython-Use-cythyon3-in-cmake-check.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.15.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-pocketsphinx/0001-cython-Use-cythyon3-in-cmake-check.patch b/meta-python/recipes-devtools/python/python3-pocketsphinx/0001-cython-Use-cythyon3-in-cmake-check.patch
new file mode 100644
index 0000000000..40b2544d55
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pocketsphinx/0001-cython-Use-cythyon3-in-cmake-check.patch
@@ -0,0 +1,29 @@
+From 5e6eb640f54a0d716d62ab4db8d96d3b6f3aa7bc Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 19 Feb 2024 22:11:41 -0800
+Subject: [PATCH] cython: Use cythyon3 in cmake check
+
+OE does not install cython anymore, it only has cython3
+therefore point the build system to find cython3
+
+Upstream-Status: Inappropriate [ OE-Specific ]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ cython/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cython/CMakeLists.txt b/cython/CMakeLists.txt
+index daa4f76..93dd030 100644
+--- a/cython/CMakeLists.txt
++++ b/cython/CMakeLists.txt
+@@ -1,5 +1,5 @@
+ find_package(Python COMPONENTS Interpreter Development.Module REQUIRED)
+-find_program(CYTHON "cython")
++find_program(CYTHON "cython3")
+ 
+ if(NOT USE_INSTALLED_POCKETSPHINX)
+   set_property(TARGET pocketsphinx PROPERTY POSITION_INDEPENDENT_CODE on)
+-- 
+2.43.2
+
diff --git a/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.15.bb b/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.15.bb
deleted file mode 100644
index f7ffd9d268..0000000000
--- a/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.15.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "This package provides a python interface to CMU Sphinxbase and Pocketsphinx libraries created with SWIG and Setuptools."
-DESCRIPTION = "Python interface to CMU Sphinxbase and Pocketsphinx libraries"
-HOMEPAGE = "https://github.com/bambocher/pocketsphinx-python"
-SECTION = "devel/python"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=826ebda787eb48e78aec2624f9faba72"
-
-SRC_URI[md5sum] = "94d008eebea16acb60a9ffe614575dee"
-SRC_URI[sha256sum] = "34d290745c7dbe6fa2cac9815b5c19d10f393e528ecd70e779c21ebc448f9b63"
-
-inherit pypi setuptools3 features_check
-
-DEPENDS += "swig-native pulseaudio"
-REQUIRED_DISTRO_FEATURES += "pulseaudio"
diff --git a/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.3.bb b/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.3.bb
new file mode 100644
index 0000000000..fad8f5ba42
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.3.bb
@@ -0,0 +1,20 @@
+SUMMARY = "This package provides a python interface to CMU Sphinxbase and Pocketsphinx libraries created with SWIG and Setuptools."
+DESCRIPTION = "Python interface to CMU Sphinxbase and Pocketsphinx libraries"
+HOMEPAGE = "https://github.com/bambocher/pocketsphinx-python"
+SECTION = "devel/python"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c4d720cdc9c6953091f65e8b01524bb4"
+
+SRC_URI += "file://0001-cython-Use-cythyon3-in-cmake-check.patch"
+SRC_URI[sha256sum] = "27f4de0ca2d2bce391ce87eaab84fe6f0bc059b306fd1702d5fe6549b66e1586"
+
+inherit cmake pkgconfig pypi python3native
+
+DEPENDS += "swig-native python3-cython-native python3-scikit-build-native gstreamer1.0 gstreamer1.0-plugins-base"
+
+EXTRA_OECMAKE += "-DBUILD_GSTREAMER=ON"
+
+PACKAGES += "${PN}-models ${MLPREFIX}gstreamer1.0-pocketsphinx"
+
+FILES:${MLPREFIX}gstreamer1.0-pocketsphinx = "${libdir}/gstreamer-1.0/"
+FILES:${PN}-models = "${datadir}/pocketsphinx/model"
-- 
2.43.2


