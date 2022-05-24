Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26570C433F5
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 19:46:49 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web08.14112.1653421605691348254
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 May 2022 12:46:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=wKNnsAKj;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.44,
 mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f44.google.com with SMTP id
 i81-20020a1c3b54000000b003974edd7c56so434791wma.2
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 May 2022 12:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=skaFG6jKerONT23BDAe+wT6yQ3/SDHizA4aBbsuNe9M=;
        b=wKNnsAKj6qGP5dSs/dtwMTroPQpd9IUbsxcvNvuYOyfyUjCiGcSGroGTRlM7eNDN/o
         PWHAt6KN/KzNhXtKZqumoQKZhlCr4alKW9AJvgtJq9HWRPpbUsmEL7UAJF825raCXBdI
         mjRQbDfckB9u4VC61+XcPbFnyA3u3m08I4xhLHpJPz1JhiVSkA/HLsfv8IHU0xWXWg3f
         6rOZHurzF2f0gwFcrGj5UTt/nvC0pS1xMrvRywpdNGJYFxyAGdasonCUoU/DrRP4MMmw
         EiX2A1ZqeexHQ8Rzq1nCev+0bUqR4ksAVT4fzj3WgQ5OvIn6wCNct2nIlbb09P1B26rc
         nq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=skaFG6jKerONT23BDAe+wT6yQ3/SDHizA4aBbsuNe9M=;
        b=Vqu592t7oK+39Ln5248XzZUbDdZLuj9KxHC/QVJrDUVMN22ALROied0jDLN0AzmIQT
         c+XghUsRnFUval+uXx4Tf4ZJg9eBmN4tJNknqiz/iTE41eLn+5PDWP7Uu/6TkY6BdPG6
         aCb4OmxxuaCEmXPL9gA6UHqBf2CbBkcQznPPPJ2w3AXqnlOlzLiXhLhWYObBCTUiD4W0
         91amKC/TwRGcfVhIgPah/oCq/056pL3CLYrYhTYBiZcnCmdTgvaYP8YIn22E1i7hhRyI
         A/PKwGH3yO2TnwYGM84Q59mgUU5ewtFU0k/8P5YJKWRuCm5Ync8tAIz3eiuvixgbZdB1
         ns+g==
X-Gm-Message-State: AOAM533i0uWUdbyA+7Ny8DyuosFJQrhBRVcB6kDsjcXLbN9mDuj8c/Hz
	q9Yt6DXtIOOzoMT6thrIkTkaSA==
X-Google-Smtp-Source: 
 ABdhPJzQ6FEh3AQ7OyNk/ThOvvSjP9fn5Zv+ZfnYQ1ZCzNobuj0ops6/r62m0Vj6Za5Ft7mqsAHw/Q==
X-Received: by 2002:a05:600c:2254:b0:397:581d:34fa with SMTP id
 a20-20020a05600c225400b00397581d34famr5171048wmm.181.1653421603874;
        Tue, 24 May 2022 12:46:43 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:87ef:963:27b6:d03b])
        by smtp.gmail.com with ESMTPSA id
 c17-20020a7bc011000000b003973e8a227dsm231998wmb.46.2022.05.24.12.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 May 2022 12:46:43 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-python][PATCH] python3-uinput: new package
Date: Tue, 24 May 2022 21:46:42 +0200
Message-Id: <20220524194642.203911-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 May 2022 19:46:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97262

Add a recipe for python3-uinput: a python module for controlling the
virtual input devices on linux.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../packagegroups/packagegroup-meta-python.bb |  1 +
 ...-use-setuptools-instead-of-distutils.patch | 28 +++++++++++++++++++
 .../python/python3-uinput_0.11.2.bb           | 18 ++++++++++++
 3 files changed, 47 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-uinput/0001-setup-use-setuptools-instead-of-distutils.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-uinput_0.11.2.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 6ca652e12..e3ae050ec 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -436,6 +436,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-typeguard \
     python3-tzlocal \
     python3-u-msgpack-python \
+    python3-uinput \
     python3-ujson \
     python3-unidiff \
     python3-uritemplate \
diff --git a/meta-python/recipes-devtools/python/python3-uinput/0001-setup-use-setuptools-instead-of-distutils.patch b/meta-python/recipes-devtools/python/python3-uinput/0001-setup-use-setuptools-instead-of-distutils.patch
new file mode 100644
index 000000000..54a3c1867
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-uinput/0001-setup-use-setuptools-instead-of-distutils.patch
@@ -0,0 +1,28 @@
+From 7a4dde83a9584adb42c7f810d882b1fbf5767e2c Mon Sep 17 00:00:00 2001
+From: Bartosz Golaszewski <brgl@bgdev.pl>
+Date: Tue, 24 May 2022 21:43:35 +0200
+Subject: [PATCH] setup: use setuptools instead of distutils
+
+The latter is deprecated, use setuptools instead.
+
+Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
+---
+ setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 3fa3343..4900b8b 100644
+--- a/setup.py
++++ b/setup.py
+@@ -3,7 +3,7 @@
+ import errno
+ import subprocess
+ 
+-from distutils.core import setup, Extension
++from setuptools import setup, Extension
+ 
+ libudev_so = "libudev.so.1"
+ 
+-- 
+2.34.1
+
diff --git a/meta-python/recipes-devtools/python/python3-uinput_0.11.2.bb b/meta-python/recipes-devtools/python/python3-uinput_0.11.2.bb
new file mode 100644
index 000000000..737bbfe2c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-uinput_0.11.2.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Python interface to Linux uinput kernel module."
+HOMEPAGE = "https://pypi.org/project/python-uinput/"
+LICENSE = "GPL-3.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
+
+SRC_URI[sha256sum] = "99392b676c77b5795b86b7d75274db33fe754fd1e06fb3d58b167c797dc47f0c"
+SRC_URI += "file://0001-setup-use-setuptools-instead-of-distutils.patch"
+
+PYPI_PACKAGE = "python-uinput"
+
+inherit pypi setuptools3
+
+DEPENDS += "udev"
+RDEPENDS:${PN} += " \
+    python3-ctypes \
+    python3-distutils \
+"
+RRECOMMENDS:${PN} += "kernel-module-uinput"
-- 
2.34.1


