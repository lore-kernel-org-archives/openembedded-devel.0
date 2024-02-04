Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C1F3C48286
	for <webhook@archiver.kernel.org>; Sun,  4 Feb 2024 10:53:58 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.36243.1707044032865103888
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Feb 2024 02:53:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qo1gc196;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d0a4e8444dso3524501fa.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 Feb 2024 02:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707044030; x=1707648830; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AVtAP7q7lWDDafyHBQahJEQuKxAs1by/BSQUE2NR9c0=;
        b=Qo1gc196v7KehWXKhdeATRr1LNTX9EgtY3eg6gpGXdU/fa6zEymeCrf/yL0J5hrBfx
         jLCfVwyKogVRyKmaotKNOpa7NcS88pUO0cOxhRTDFrO3G2tNcmM7IEPZhnxqs0Xf4Tmd
         8kCnjm0g7E+nBFaoAazKA00VUbQBhSJ6vZlcOIRRk0CpjdG8nHp2X8d2IEUKVvWj5pkr
         cvURq3gEGFI4/YK9l35ngv7Le85lLBjRZkGepXfKB8l/8d7XP8wQ3FEOjY7yidx/DhbZ
         IjwT1wxtTph85xGCWjb8VFu5mfNlzO/lqgLClsqFQjxymXIO0gWhzdClVUmgSNSRrru9
         Gdow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707044030; x=1707648830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AVtAP7q7lWDDafyHBQahJEQuKxAs1by/BSQUE2NR9c0=;
        b=NH8dSdZiYDyKntajajxk3fAY9E9KkLqZKvsRYHy5K+lvBV96LMcvzYHSuhBn04QUMU
         dWxXzBD90Jnq3443bQMWF4kE1ec84lyC/TaAqAfOBIZHI6o9knVv/OOa96TTmEBjg0kX
         t0cV/dvVf634pGIbqVKo2iD1DL8Y5IsdOU+Zf42zq/g44YZRQ07ahT8J5BZSP/m9mT59
         9qZITKKEzf7NkoKSS2anrWRH734yNdW+jCbFqRwoaofYnki4E7JCVA0rMgWRxerdOqLy
         8G5Nt23euu8TjYg30NggDpPXUZ006fZeREPT7rdDlT3AFSk1GllDDcR6HkjbIdU+smZq
         iZKQ==
X-Gm-Message-State: AOJu0YwDlN+xZRcKNLP9CKH8UXaAoZt+W1ku8v1RXxQTPkeNqdUdsySE
	JKTnG0790EMWq79Vq8tZv/QrNMq9TGcH4XTJNRiL9pST1Rc9hCoybrudvs4Thd0=
X-Google-Smtp-Source: AGHT+IGv4rxP8nvUNTKKyFNoGbbzS4gwxYrdXAqcI6drQPKK7zcOzI2hFH3SMNVG+JwXom7grau9rA==
X-Received: by 2002:ac2:5238:0:b0:511:4943:6066 with SMTP id i24-20020ac25238000000b0051149436066mr1445317lfl.25.1707044030028;
        Sun, 04 Feb 2024 02:53:50 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.159])
        by smtp.gmail.com with ESMTPSA id n9-20020a05600c4f8900b0040ec8330c8asm5329405wmq.39.2024.02.04.02.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Feb 2024 02:53:49 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCHv2] python3-scikit-build: upgrade 0.16.7 -> 0.17.6
Date: Sun,  4 Feb 2024 13:53:44 +0300
Message-Id: <20240204105344.28531-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Feb 2024 10:53:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108560

Moved to hatchling as a build backend and requires hatch-fancy-pypi-readme, hatch-vcs.

As stated in the upstream, the license updated to MIT only.

Changelog: https://github.com/scikit-build/scikit-build/releases

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 Unlike v1, tomli has been removed from RDEPENDS because since Python 3.11+ has built in tomllib.

 .../python/python3-scikit-build_0.16.7.bb     | 21 ------------------
 .../python/python3-scikit-build_0.17.6.bb     | 22 +++++++++++++++++++
 2 files changed, 22 insertions(+), 21 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-scikit-build_0.16.7.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-scikit-build_0.17.6.bb

diff --git a/meta-python/recipes-devtools/python/python3-scikit-build_0.16.7.bb b/meta-python/recipes-devtools/python/python3-scikit-build_0.16.7.bb
deleted file mode 100644
index c033c56ba..000000000
--- a/meta-python/recipes-devtools/python/python3-scikit-build_0.16.7.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "Improved build system generator for Python C/C++/Fortran/Cython extensions"
-LICENSE = "MIT & BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=7c96d2b08b3cec6d3c67fb864d1fd8cc"
-
-DEPENDS = "python3-setuptools-scm-native"
-
-PYPI_PACKAGE = "scikit-build"
-
-inherit pypi python_setuptools_build_meta
-SRC_URI[sha256sum] = "a9b9cc7479b71e6c8d434596dfade025253aae23adb22a9a2d85850fd51cecfd"
-
-RDEPENDS:${PN} = " \
-	python3-distro \
-	python3-packaging \
-	python3-setuptools \
-	python3-typing-extensions \
-	python3-wheel \
-	cmake \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-scikit-build_0.17.6.bb b/meta-python/recipes-devtools/python/python3-scikit-build_0.17.6.bb
new file mode 100644
index 000000000..7f99dd16b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-scikit-build_0.17.6.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Improved build system generator for Python C/C++/Fortran/Cython extensions"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7c96d2b08b3cec6d3c67fb864d1fd8cc"
+
+DEPENDS = "${PYTHON_PN}-hatch-vcs-native ${PYTHON_PN}-hatch-fancy-pypi-readme-native"
+
+PYPI_PACKAGE = "scikit_build"
+
+inherit pypi python_hatchling
+
+SRC_URI[sha256sum] = "b51a51a36b37c42650994b5047912f59b22e3210b23e321f287611f9ef6e5c9d"
+
+RDEPENDS:${PN} = " \
+	${PYTHON_PN}-distro \
+	${PYTHON_PN}-packaging \
+	${PYTHON_PN}-setuptools \
+	${PYTHON_PN}-typing-extensions \
+	${PYTHON_PN}-wheel \
+	cmake \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


