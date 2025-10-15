Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB008CCD193
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 19:43:05 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.27457.1760557383642581696
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Oct 2025 12:43:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LMg4H6ou;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-29094f23f56so3988395ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 12:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760557383; x=1761162183; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lD+CRtbCazfNd/m7O2ZR0g2cAUrUAiPbjIhIhFgFEew=;
        b=LMg4H6ouXj8KaELXW5ZRc3B46jgaN0bzCf3Vd4iJR9sxoRjf0UD9SfeBz5jR9Vwj7t
         IB2mtXPDyT0dB7yn6GHaeRRlYJKfP2fNwetpHHBUopuo/EHcS01e24xm481vIGxl2Lh2
         AhWZxgY1RJpgJDd/mtxLqfHT8irSK8Su0xgEGdYrV4sHyQJTtLBfK6+RdkzaHL8tS6Mc
         +/ekjQJv6uxE/2JRgGiNjIryX4EDwnQ5+6w/mdxXpsAKE4YhltCIieKdd2lu1uX9VlUf
         2IFV8kY7R/UqU63Lg2Vh0AoJ+jzDoAyc13/cLXj3TqdlYmJY3W08Uh9qrH9uvRi+1wFt
         hYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760557383; x=1761162183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lD+CRtbCazfNd/m7O2ZR0g2cAUrUAiPbjIhIhFgFEew=;
        b=Bp/xzbtY7aHkA1Wveo7LyGg/XAr3lYSCUesU0jh0kqR6uCVm9DQ7hf8RdKUk1Hw6Qi
         JNbAKjwyKQmHSO1QYKYlVv335CfrymOWZHeWiW7MhiDce2cTjxAEHs4BC59pSp7eOeT9
         WTKC1MrPmq/lNKLcPo0tcHNeJqQhgoSuPIJBjDVNxAuwHbE1pR2zxiq7w8Yb6y42WhCj
         PFoD27uY16DAE5N0wjQxZr0wBRUurY9tTrulEt9U/debr2DDcMIslU/KWEZNha2km2yk
         U5bQwn5YoBoy+CNone1DCpMy/LaOYM9hAIMB49BxsdhNqqzgoCr72C87dDKzw7U/41kD
         TlVA==
X-Gm-Message-State: AOJu0Yx/+fueS19FrTJn7bwBFJIYAeN82bftRK3HrXxxCMzL8abtFw9I
	yjhe8WMD+HB+cAsODWA5HmSyJZkz7LrmLf/+Z/iOLa9U6gC8bpCa2wI/RnoRsPuo
X-Gm-Gg: ASbGncun1qktk4Sv+HF4gxld90iCusxxYq7HVgrOIWrFULaMQOcoP8TpST8iOXXe0I7
	GTHtoTiMHUvcS+lNS43aOv0l3ZsaAEcvcU2Tlmm4AH7KPhPOzIClJPRZIuzA64idin6S8eZC3bL
	auO9bMUiZGqa+dif3YmCSIv33FmYdv2BDNLEAbYDNW788qHNpDXunzfylh6PtQ8uuHRDtQiu1gM
	HtyAC/P4wxOGOWaSUUAS/CiTafe4d1IyhRku2aKCIdksEOpZ2Cb6WwpsdrpfZ+cPhnwdekkgdzM
	vdhWj0thPc2dYNG2NhI49jhErjERC54UyurikFDxmXBDP9ybM0X9CG21BlJb3mmgwjxv0YIVKWI
	M2hWfHdWv3w/NVOl5ZUiaMFF3Wsaov9UGOua2wKAtGzmiZJxr8LmNjnmoRCmm0lU+J+gVV9kXHX
	D54olzNul3BdaBPr+GBP9+j/EfrAy2tR7cPWB4nZRDRiBlPYLI66t9cPSuMTMkLoPXf73qRLPN
X-Google-Smtp-Source: AGHT+IFDHLrhjGxZu/zFFFBgzip38+R6hn3UpI2FlAq/LGG+BPOCzm62f9oXuZc99RMSXfZ4fxw3Rg==
X-Received: by 2002:a17:903:faf:b0:26a:ac66:ef3f with SMTP id d9443c01a7336-290272161e2mr324884025ad.8.1760557382699;
        Wed, 15 Oct 2025 12:43:02 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::a529])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099a7cebbsm4384885ad.64.2025.10.15.12.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 12:43:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Yoann Congal <yoann.congal@smile.fr>,
	Hongxu Jia <hongxu.jia@windriver.com>
Subject: [meta-python][PATCH] python3-pynacl: Fix reproduciblity
Date: Wed, 15 Oct 2025 12:42:57 -0700
Message-ID: <20251015194257.195594-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 19:43:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120713

glob output isn't guaranteed to be in any particular order, so _sodium.*.so wasn't always reproducible.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Yoann Congal <yoann.congal@smile.fr>
Cc: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-Build-bindings-reproducibly.patch    | 39 +++++++++++++++++++
 .../python/python3-pynacl_1.5.0.bb            |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pynacl/0001-Build-bindings-reproducibly.patch

diff --git a/meta-python/recipes-devtools/python/python3-pynacl/0001-Build-bindings-reproducibly.patch b/meta-python/recipes-devtools/python/python3-pynacl/0001-Build-bindings-reproducibly.patch
new file mode 100644
index 0000000000..3e7480b485
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pynacl/0001-Build-bindings-reproducibly.patch
@@ -0,0 +1,39 @@
+From eccc9ea5eef13ee353de610af36fb7759b70e2e4 Mon Sep 17 00:00:00 2001
+From: Colin Watson <cjwatson@debian.org>
+Date: Mon, 26 Aug 2024 18:14:33 +0100
+Subject: [PATCH] Build bindings reproducibly
+
+`glob` output isn't guaranteed to be in any particular order, so
+`_sodium.*.so` wasn't always reproducible.
+
+Upstream-Status: Backport [https://github.com/pyca/pynacl/pull/836]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/bindings/build.py | 12 ++++++++----
+ 1 file changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/src/bindings/build.py b/src/bindings/build.py
+index 9634237..777237b 100644
+--- a/src/bindings/build.py
++++ b/src/bindings/build.py
+@@ -22,12 +22,16 @@ from cffi import FFI
+ __all__ = ["ffi"]
+
+
+-HEADERS = glob.glob(
+-    os.path.join(os.path.abspath(os.path.dirname(__file__)), "*.h")
++HEADERS = sorted(
++    glob.glob(os.path.join(os.path.abspath(os.path.dirname(__file__)), "*.h"))
+ )
+
+-MINIMAL_HEADERS = glob.glob(
+-    os.path.join(os.path.abspath(os.path.dirname(__file__)), "minimal", "*.h")
++MINIMAL_HEADERS = sorted(
++    glob.glob(
++        os.path.join(
++            os.path.abspath(os.path.dirname(__file__)), "minimal", "*.h"
++        )
++    )
+ )
+
+
diff --git a/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb b/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb
index 77ca2e1ff4..393066de9d 100644
--- a/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb
@@ -4,6 +4,7 @@ HOMEPAGE = "https://github.com/pyca/pynacl"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8cc789b082b3d97e1ccc5261f8594d3f"

+SRC_URI += "file://0001-Build-bindings-reproducibly.patch"
 SRC_URI[sha256sum] = "8ac7448f09ab85811607bdd21ec2464495ac8b7c66d146bf545b0f08fb9220ba"

 PYPI_PACKAGE = "PyNaCl"

