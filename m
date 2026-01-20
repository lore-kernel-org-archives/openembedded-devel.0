Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D33CFD2ED12
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 12:03:44 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4935.1768910617482892547
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jan 2026 04:03:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=W0PbQkPv;
 spf=pass (domain: konsulko.com, ip: 209.85.208.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-64d1ef53cf3so7254860a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 04:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1768910615; x=1769515415; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Eoky4EVa5iX6v2oi6Ry4ChG550t+hq7F86f6ZhrNP8w=;
        b=W0PbQkPvEdqhQl8CfZXqBnLhHIH7wKAMTySoXMLSSKFJq/9ppml4bzcVRp3CUX3uFF
         bh5eKN0soJ5x8/eTHBKzmbQTc/Y4CWrD7WsOOcBbtyd5I5kLQrq9aG0AQBYDQHnAd16j
         CU58ctzBPSpQY7B0w//1tgCymqrKjdwbBVguA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768910615; x=1769515415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eoky4EVa5iX6v2oi6Ry4ChG550t+hq7F86f6ZhrNP8w=;
        b=tSJfyfbP5vwFKWaa1yYYGv4NfRdq3/FC4UYIqjendxf1BC2QgkLessMxFajaFJweyB
         5V7c2Ba8lFcbBKIysQSZ8Y9QRinG27teZLD8gQlQl6Q3jRC0Ti4Jleek9lF09C2rmts3
         dHhc5xnbLsN1RtN6pAkW64aYT5300O/98po/CSipnd9K36QNjA8wdvmVV6Dtz4Wzvmq0
         MkLsJaEUTZd2AQpvlHh6lUbz+PKeVinC6PAnM83uIoDIRgwS4ST5Mrv1Zrh019GH2sWv
         PN+DlCMRTnhsgJlwzdTfqhGswcbp56ycAVuuK4U6Tw7owIA7D0HY2MLB/kxUHLUyJd9W
         oduA==
X-Gm-Message-State: AOJu0YwCbuEyHRJq0gU5Q9rw9WzS4ILRlKzaHNSYh/MkS+vKeYbyM3Fd
	2VtJX7rMX61R6BL/Hsq77Cnc3d6zxDtNyclRdejPlEVXaypMLpecW4X1mDBdTT8dvU2GWbTOJb1
	lm+ql
X-Gm-Gg: AZuq6aI+bphU7MBS4vNI8Ch0ezS4bcszV2VR9vM3JPfoDPRRDGq7SWsUe5z3bKhg9el
	zrj7k8Ug/HJeiRymDrXW0OiJKAPWjGGkX4izf4z+y4k3a9cgzhGMDnDXPTEA+ITO3+Wh+0Vcz64
	zXakzpJLK4wzU5d1YSwwpUwuOLoGgosYsSpNJFA8OVuifCWG7zgHa4oVGOqRiKDItEVIE/TkEGD
	DBJK7Rpo5TrxvKK3XjJ0V6zTrQqe9ONP845dxZmw1gWG3XDFKbEVJRzGmJipgjzcfQMSJcvOJnv
	YtfuKoqcEOAskW3qb0YvSomy5XGm10wpmI/AQshG08FagxwMCZ8bDJeJL9klINvo2WhGiOZOdCN
	4oeNyzTYSXDVtatouvYFEhecZCQGflGH4gHrUuMAYCgAVVcmxuCjk7O/KTr8VEapeCQ4fzuaxli
	8jnOc6WMZhmlHItBDmE/AlU0D8
X-Received: by 2002:a17:907:da6:b0:b83:975:f8a6 with SMTP id a640c23a62f3a-b8793033340mr1327638766b.43.1768910615089;
        Tue, 20 Jan 2026 04:03:35 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b879513e6d3sm1378721966b.4.2026.01.20.04.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 04:03:34 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-pynacl: Upgrade 1.5.0 -> 1.6.2
Date: Tue, 20 Jan 2026 14:03:29 +0200
Message-ID: <20260120120331.2092596-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 12:03:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123665

Upgrade to release 1.6.2:

- Updated libsodium to 1.0.20-stable (2025-12-31 build) to resolve
  CVE-2025-69277.

From 1.6.1:

- The MAKE environment variable can now be used to specify the make
  binary that should be used in the build process.

From 1.6.0:

- BACKWARDS INCOMPATIBLE: Removed support for Python 3.6 and 3.7.
- Added support for the low level AEAD AES bindings.
- Added support for crypto_core_ed25519_from_uniform.
- Update libsodium to 1.0.20-stable (2025-08-27 build).
- Added support for free-threaded Python 3.14.
- Added support for Windows on ARM wheels.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../0001-Build-bindings-reproducibly.patch    | 39 -------------------
 ...ynacl_1.5.0.bb => python3-pynacl_1.6.2.bb} |  5 +--
 2 files changed, 2 insertions(+), 42 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pynacl/0001-Build-bindings-reproducibly.patch
 rename meta-python/recipes-devtools/python/{python3-pynacl_1.5.0.bb => python3-pynacl_1.6.2.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-pynacl/0001-Build-bindings-reproducibly.patch b/meta-python/recipes-devtools/python/python3-pynacl/0001-Build-bindings-reproducibly.patch
deleted file mode 100644
index 3e7480b485..0000000000
--- a/meta-python/recipes-devtools/python/python3-pynacl/0001-Build-bindings-reproducibly.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From eccc9ea5eef13ee353de610af36fb7759b70e2e4 Mon Sep 17 00:00:00 2001
-From: Colin Watson <cjwatson@debian.org>
-Date: Mon, 26 Aug 2024 18:14:33 +0100
-Subject: [PATCH] Build bindings reproducibly
-
-`glob` output isn't guaranteed to be in any particular order, so
-`_sodium.*.so` wasn't always reproducible.
-
-Upstream-Status: Backport [https://github.com/pyca/pynacl/pull/836]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/bindings/build.py | 12 ++++++++----
- 1 file changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/src/bindings/build.py b/src/bindings/build.py
-index 9634237..777237b 100644
---- a/src/bindings/build.py
-+++ b/src/bindings/build.py
-@@ -22,12 +22,16 @@ from cffi import FFI
- __all__ = ["ffi"]
- 
- 
--HEADERS = glob.glob(
--    os.path.join(os.path.abspath(os.path.dirname(__file__)), "*.h")
-+HEADERS = sorted(
-+    glob.glob(os.path.join(os.path.abspath(os.path.dirname(__file__)), "*.h"))
- )
- 
--MINIMAL_HEADERS = glob.glob(
--    os.path.join(os.path.abspath(os.path.dirname(__file__)), "minimal", "*.h")
-+MINIMAL_HEADERS = sorted(
-+    glob.glob(
-+        os.path.join(
-+            os.path.abspath(os.path.dirname(__file__)), "minimal", "*.h"
-+        )
-+    )
- )
- 
- 
diff --git a/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb b/meta-python/recipes-devtools/python/python3-pynacl_1.6.2.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb
rename to meta-python/recipes-devtools/python/python3-pynacl_1.6.2.bb
index 393066de9d..d72d2be2f1 100644
--- a/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pynacl_1.6.2.bb
@@ -4,10 +4,9 @@ HOMEPAGE = "https://github.com/pyca/pynacl"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8cc789b082b3d97e1ccc5261f8594d3f"
 
-SRC_URI += "file://0001-Build-bindings-reproducibly.patch"
-SRC_URI[sha256sum] = "8ac7448f09ab85811607bdd21ec2464495ac8b7c66d146bf545b0f08fb9220ba"
+SRC_URI[sha256sum] = "018494d6d696ae03c7e656e5e74cdfd8ea1326962cc401bcf018f1ed8436811c"
 
-PYPI_PACKAGE = "PyNaCl"
+PYPI_PACKAGE = "pynacl"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
-- 
2.47.3


