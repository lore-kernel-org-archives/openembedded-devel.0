Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13.1794851764251627899
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:56:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=dFDxTHT6;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso4583323eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851764; x=1795456564; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pbiczl3FpaqOD5yIG2OhtsAZuqI79FALZ+EwYAjIdX0=;
        b=dFDxTHT604fbiRQGQZEIGalCJhqEyfLzYGe238yoWiq9Ztv3z3MIE0hism3b+YK1Og
         CGSu6QmuYbesx+ZZTGTjtjcUSrErBTsNG+gcV6fLHYgWb2OzHEHcdrqSxi1OUgTOhTSV
         rYPKWEUTMKmZUOtRWV2b5Rpa4IxkRBjd4LWwqh5IHxPSM/98oZGto4ugpL5jxTGgS91R
         KEHIVdiqQepJe+fJX72dWaVW63qRTmRv2aW8oi0wq1qTXId8zlRAl44R+dK7I+mXk/0C
         72FVFWF6b/8K51QAaqOCVsVpsT7QDgyscvUhmPvQ+VPV7D+/yFkR9RSN51fcmNxhY6ax
         GT/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851764; x=1795456564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pbiczl3FpaqOD5yIG2OhtsAZuqI79FALZ+EwYAjIdX0=;
        b=SeXNMoh0n+ExTb3wBUIKDcv8rc1sRE6CyLBM9MiRF3+c5tHLAUWWgniqLjKtXW8hSW
         QG8BvpqiXbXprS8sVcOHplLAh0iCmhOpLa/eKdi+XNuk88BrEwdAk1RqpxNGWWtEau04
         W8714tFSYPTArwmfUzDAiyuKgZikr/gvmO21qqWo7boFuKu2xllmBfPYydb/td0bVfWx
         WhBhEzHJHuS7a5DbwRvj1hujyoiubtYrhpTmg1IzZ30yaKhFBeG7HrrG0W4dxwGfGq6L
         wDf2wamD1vZsFpkjOdBxO5dhKWKZ+S+IJRbIPDbCzeH1PF2RvyrtLdS63uz88rAX9xjC
         WiJQ==
X-Gm-Message-State: APuU4Z/fCpJInzig2N34Rib0sPVx6xIOSkoNC+UMAtF5sovGvHGxw1c7
	hy+VpTl3IiI7b52re3njzWr2n6IA1nGx2SPTFFdtmnKM5HU1xlG7PQjwZxS+7PJl
X-Gm-Gg: AYBFou0zCabFjH21MK2M56LRio89NnMMiQmjtfDwGaGtCR5uBFgBIacbTwrlvGu61+U
	enb1Cnpkk/DUzjJQJ4bsaplUoILMHfvzhtJJa5nHErVoS57Bcgd9qzWu7bvIwSKxfoOppOovv++
	kC4dA6Oo56lmETiJSxmVuJq72nlUeh3kBVEza9tUeMvdjvycy0/KPLP3v4Br+qt0ZQqTFgqH6rS
	IfIRo+7+G63/lKqIgEl2OUy3XX0jSk9mFOBtrFDJI9i7/RSXnG/w02nLZk7xU5i4iuPTyaJi3IV
	qxi99uvmPWlkMaDzD6WqZYL8nVDyW7t2+SH7lVT/x/IeSENQfCbh+BAFoUty1gNVMFBjJtwWYVo
	OdpXJSK8dhG0wx50NfzHYmtKO6v/DzU7wvEmHOw33yYugZhtcwKPlUfz84hrZFl6CSsXEYxArrA
	G1RsFCcv7fUF7qvdPEua8xIOhDi8ZcnlI2DgyHrAwKPvNeSILhHkNiA1ky6iQc/AK72SxCXGBAX
	0iv3RM/XIX9zRbopKkJVekBwpbKSK5Z14yfX6hXXY9bJPiSDvNQlFO6WejGcN0H9q9qdvdp1i0J
	dNOBJ8iWxgCgRv7c9R5lEVX2Mavtl/Qo9S5q6ZbX2t5dB16qbx3r2tTS7brIEchFaDDs61DKZgO
	RtXpfAN5dZsRazS+2KR3YV4wN1+bICbVfYgBxvy4eZ75ZXLH8wUwtjgMqfAlRo2/5/yycTkJKuF
	+85w7tViSQNNplhBC+hNpeZNm5vOuf/YL44+vxE9rka/etPf/nb73MYthYFSZY/Z5wIDGi6XdlF
	8lboT/cSmOSIx3XncC3ajDIPgENF4hMLKHAkiUlLscVap1yScdZuPLwLFmdMxuQGbzE0ZdC+VlV
	wKo92fs1uTtB3Lj6GP73ww1rrw==
X-Received: by 2002:a05:7300:546:b0:380:f8fd:d19c with SMTP id 5a478bee46e88-380f8fdd828mr611487eec.35.1794851763366;
        Mon, 16 Nov 2026 09:56:03 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:56:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 090/105] python3-strenum: upgrade 0.4.15 -> 0.5.0
Date: Mon, 16 Nov 2026 09:53:42 -0800
Message-ID: <20261116175359.342679-90-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:56:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132545
Content-Type: text/plain; charset="utf-8"

Drop the versioneer patch; upstream now uses setuptools-scm.

Changes:
- Packaging modernized: vendored versioneer replaced by setuptools-
  scm (build now needs setuptools>=64 and setuptools-scm>=8),
  setup.py replaced by pyproject.toml, package moved to src/ layout.
  Version needs git tags or SETUPTOOLS_SCM_PRETEND_VERSION.
- Requires Python >=3.8; classifiers now cover 3.8 to 3.14.
- Added missing type annotations; fixed installing type stubs.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ioneer-for-python-3.12-compatibility.patch | 37 -------------------
 .../python/python3-strenum_0.4.15.bb          | 14 -------
 .../python/python3-strenum_0.5.0.bb           | 10 +++++
 3 files changed, 10 insertions(+), 51 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-strenum/0001-patch-versioneer-for-python-3.12-compatibility.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-strenum_0.4.15.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-strenum_0.5.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-strenum/0001-patch-versioneer-for-python-3.12-compatibility.patch b/meta-python/recipes-devtools/python/python3-strenum/0001-patch-versioneer-for-python-3.12-compatibility.patch
deleted file mode 100644
index cdf3f1acb7..0000000000
--- a/meta-python/recipes-devtools/python/python3-strenum/0001-patch-versioneer-for-python-3.12-compatibility.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 3a71c9bc3747201e5bebe0e80b98ac6219209875 Mon Sep 17 00:00:00 2001
-From: alperak <alperyasinak1@gmail.com>
-Date: Thu, 8 Feb 2024 14:09:32 +0300
-Subject: [PATCH] Patch versioneer for Python 3.12 compatibility
-
-AttributeError: 'ConfigParser' object has no attribute 'readfp'. Did you mean: 'read'?
-AttributeError: module 'configparser' has no attribute 'SafeConfigParser'. Did you mean: 'RawConfigParser'?
-
-readfp and SafeConfigParser has been deprecated since Python 3.2 and removed in Python 3.12 (due October 2023). Use read_file and ConfigParser instead.
-
-https://docs.python.org/3/whatsnew/3.12.html#configparser
-
-Upstream-Status: Submitted [https://github.com/irgeek/StrEnum/pull/34]
-Signed-off-by: alperak <alperyasinak1@gmail.com>
----
- versioneer.py | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/versioneer.py b/versioneer.py
-index 64fea1c..3aa5da3 100644
---- a/versioneer.py
-+++ b/versioneer.py
-@@ -339,9 +339,9 @@ def get_config_from_root(root):
-     # configparser.NoOptionError (if it lacks "VCS="). See the docstring at
-     # the top of versioneer.py for instructions on writing your setup.cfg .
-     setup_cfg = os.path.join(root, "setup.cfg")
--    parser = configparser.SafeConfigParser()
-+    parser = configparser.ConfigParser()
-     with open(setup_cfg, "r") as f:
--        parser.readfp(f)
-+        parser.read_file(f)
-     VCS = parser.get("versioneer", "VCS")  # mandatory
-
-     def get(parser, name):
---
-2.25.1
-
diff --git a/meta-python/recipes-devtools/python/python3-strenum_0.4.15.bb b/meta-python/recipes-devtools/python/python3-strenum_0.4.15.bb
deleted file mode 100644
index 7dccd048c7..0000000000
--- a/meta-python/recipes-devtools/python/python3-strenum_0.4.15.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "An Enum that inherits from str"
-HOMEPAGE = "https://github.com/irgeek/StrEnum"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ba0eb3de1df70bde0ed48488cfd81269"
-
-SRC_URI += "file://0001-patch-versioneer-for-python-3.12-compatibility.patch"
-
-DEPENDS = "python3-pytest-runner-native"
-
-SRC_URI[sha256sum] = "878fb5ab705442070e4dd1929bb5e2249511c0bcf2b0eeacf3bcd80875c82eff"
-
-PYPI_PACKAGE_SDIST = "StrEnum"
-
-inherit pypi python_setuptools_build_meta
diff --git a/meta-python/recipes-devtools/python/python3-strenum_0.5.0.bb b/meta-python/recipes-devtools/python/python3-strenum_0.5.0.bb
new file mode 100644
index 0000000000..1a574b52cf
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-strenum_0.5.0.bb
@@ -0,0 +1,10 @@
+SUMMARY = "An Enum that inherits from str"
+HOMEPAGE = "https://github.com/irgeek/StrEnum"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ba0eb3de1df70bde0ed48488cfd81269"
+
+DEPENDS = "python3-setuptools-scm-native"
+
+SRC_URI[sha256sum] = "9c50a5ce647c0a625ac25c1b719039e745466b6a04bd001aee6376381d8cdce7"
+
+inherit pypi python_setuptools_build_meta
