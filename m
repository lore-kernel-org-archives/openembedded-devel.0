Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web12.7951.1631714129783750166
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Sep 2021 06:55:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ocd+xMoS;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id t1so2813476pgv.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Sep 2021 06:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=h88V9t1ddY3TjprLjJcb4HzUqsieWSNspWvMM6BeYhM=;
        b=Ocd+xMoS6wp0pECAvFtyZGLk+DR9VZLjXWz6C3KBFoBB7ec0TF+OGBJXGyc771MSS+
         3s/aZWnTmRuNWh6JCDhUfUxYwURlKKY8iTJtXGqo7BUx7nNI/yC4dT41E6KaR/qF2kyd
         a1Q2hifUyQjydiRZN+lBOmpetfyCPLc3MzEkFTd75ot9kyZWZsWw5S3h/W7HF2kpP8Em
         EdhBLrKTK2FhxH+/uajLt580YFoOztXztG428LnmFQTceq45m4Efe35xdQGnQ2C4TXYN
         JKY0B79aa0dIFU6JX2IJ3lI79u2ONBy76k6FNVelqO8MMRga2Ujo2DisZzJH+XsPBjNT
         QqHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h88V9t1ddY3TjprLjJcb4HzUqsieWSNspWvMM6BeYhM=;
        b=zeFNh/WH766Pvy1nSTvdOq4TGOh4kD56UFQ2cRXvTBkf8OYmrnOCG5yL+rFIxHRGOl
         x8V0fE9voCQfsKs2alyEKU0hagjAWt7pZu8/ZnI9EvL1mIjdSm6MSLxualgZuNNOHn2+
         yiYylcvYmuKc05MC6a/RsosmLbPqUqCdtF89Eq+spIWDbz8ghcqUtar3d4wWBdvv9z8S
         EpzKu/uahk0tC+bhmVgN5wwRKZzFuFSJBnES4nEgn4u/jl3gj9f37njfuDEtuE+I78M7
         XdWzHrTMkQm5H7NvkfNW8BiGJ/RHN7GPeLFSSKkmtiBfwPewl5dAickFcJAGp+3XAb8w
         yY3g==
X-Gm-Message-State: AOAM530BZUJkqvgulACt5DVBZ3CXBBLbkK3shwgRaF/7tUiVmUCIB3Yb
	ytvaa/yWzlBDBSH+3F+hfRYnCg1sCnU=
X-Google-Smtp-Source: ABdhPJzJICy5y2iwyL/hiigSZB6+Y99vnfHAr313vh5TqK9ucaSGpd6bIKIEzefx88f2KIuvbF0GOw==
X-Received: by 2002:a65:434c:: with SMTP id k12mr20669981pgq.17.1631714129120;
        Wed, 15 Sep 2021 06:55:29 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:35e:ec78:cef4:300f])
        by smtp.gmail.com with ESMTPSA id v7sm4824941pjk.37.2021.09.15.06.55.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 06:55:28 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 5/9] cryptsetup: Only recommend kernel modules when building for target
Date: Wed, 15 Sep 2021 06:55:16 -0700
Message-Id: <7aca7fa6dbf294ca6424c3dd4244c20dbd08a20e.1631713963.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1631713963.git.akuster808@gmail.com>
References: <cover.1631713963.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Otherwise cryptsetup-native depends on the target kernel and thus the
target compiler, as can be seen by:

  $ bitbake -g cryptsetup-native
  $ grep 'cryptsetup.*linux-yocto' task-depends.dot
  "cryptsetup-native.do_build" -> "linux-yocto.do_deploy"
  "cryptsetup-native.do_build" -> "linux-yocto.do_package_write_rpm"
  "cryptsetup-native.do_populate_sysroot" -> "linux-yocto.do_populate_sysroot"
  $ grep 'linux-yocto.*gcc-cross' task-depends.dot
  "linux-yocto.do_kernel_configme" -> "gcc-cross-x86_64.do_populate_sysroot"
  "linux-yocto.do_prepare_recipe_sysroot" -> "gcc-cross-x86_64.do_populate_sysroot"

This also moves the runtime dependencies to near the end of the recipe,
which is more customary.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 497602b4840720e8351ecf961ac6f85103093750)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../cryptsetup/cryptsetup_2.3.6.bb            | 25 ++++++++++---------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.6.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.6.bb
index 562ac83fb1..9e83b90eab 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.6.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.6.bb
@@ -16,10 +16,6 @@ DEPENDS = " \
     util-linux-libuuid \
 "
 
-RDEPENDS_${PN} = " \
-    libdevmapper \
-"
-
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
 SRC_URI[md5sum] = "504d1ab22cbc4d1a59a8d8c7ee5ed3bf"
 SRC_URI[sha256sum] = "b296b7a21ea576c2b180611ccb19d06aec8dddaedf7c704b0c6a81210c25635f"
@@ -71,14 +67,6 @@ PACKAGECONFIG[kernel] = "--with-crypto_backend=kernel"
 PACKAGECONFIG[nettle] = "--with-crypto_backend=nettle,,nettle"
 PACKAGECONFIG[luks2] = "--with-default-luks-format=LUKS2,--with-default-luks-format=LUKS1"
 
-RRECOMMENDS_${PN} = "kernel-module-aes-generic \
-                     kernel-module-dm-crypt \
-                     kernel-module-md5 \
-                     kernel-module-cbc \
-                     kernel-module-sha256-generic \
-                     kernel-module-xts \
-"
-
 EXTRA_OECONF = "--enable-static"
 # Building without largefile is not supported by upstream
 EXTRA_OECONF += "--enable-largefile"
@@ -89,4 +77,17 @@ EXTRA_OECONF += "--disable-libargon2"
 
 FILES_${PN} += "${@bb.utils.contains('DISTRO_FEATURES','systemd','${exec_prefix}/lib/tmpfiles.d/cryptsetup.conf', '', d)}"
 
+RDEPENDS_${PN} = " \
+    libdevmapper \
+"
+
+RRECOMMENDS_${PN}_class-target = " \
+    kernel-module-aes-generic \
+    kernel-module-dm-crypt \
+    kernel-module-md5 \
+    kernel-module-cbc \
+    kernel-module-sha256-generic \
+    kernel-module-xts \
+"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1

