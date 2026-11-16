Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34346.1794851732986402343
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:55:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Hm0n145C;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36a315ed211so105014eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851732; x=1795456532; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BT/lDFVM2eez3wKJaegk9mfWgD9gOeLWinGqpwNTrCo=;
        b=Hm0n145CUXy0MKT9ACvnGbdT3cYw/reYrSsc9m9qwgSx2ImGG7We1UXRGwjmYz5eeB
         8d/f4D/utUxEnj0ONxjRvF8h4y6vB9/tzm3z0IBCqpg9MXkB4qj88L31tWKcqSxQp5F6
         Uh5Gsc2vtaQcSqFFXQ1Tyb9F9w/ffOFDBxFJlH8P12bLoB0KHGQ1O5K4TDMQFS8Ogw3d
         URoCmSZnZtvt0VrqjOcliBU3+Z1KL4H5vAdvL1nTmigso7Uy3XEJ5FmLdvRi+GSiE67f
         lEKnryUmIJVguqMap0MPH4djQfE03FBEXTO56aVrPFNCyVkB9hyaD7xKkxlJLAhJruTB
         N2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851732; x=1795456532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BT/lDFVM2eez3wKJaegk9mfWgD9gOeLWinGqpwNTrCo=;
        b=yNon7mOKFOtjVsmVwFT8H0l+Jdu4IS2wzNONYW3WLBqkePbgGS7r9uqdgTHib3el9h
         VJ6VKL/++/vxe8T29OWklHZKaS55MzGeZ3x8Z4YDeFx8xLj5tDqL6F4AbsH/cxAV+ZtP
         OflYIOD9EVpRDDBRc6tR5AkRaSf18ATqiLgTSfM1tu8X5nTplBeNVOLCIqJ/ZQCC+qN3
         CJRABYLZC+xDLaVIr6eudxKsgryUIWghUEYS6pVYxsS+RWFAGpP0zHG1LVRvQrE0THDH
         gECamsh85am7SPVlxvsCYn4Cu1s3r2wDdoqVX7eWe3PEUhC4XuQrjhSK1LmYm2hLIC94
         XuFQ==
X-Gm-Message-State: APuU4Z8mLnJTTPt++yF5KEmjyb3J2dbGVLc4ffXhgs/2zwsbyFhpx2+O
	GnfeH2Im1VGmMwCqOahY2UPXe4RQFjUstbXlwvKzVFVgpRxZYXDU3+4/D9690pI3
X-Gm-Gg: AYBFou3/AEl0S60HPbpVJ93ENV6QkHuv+17wpDbQFdkDSQEuhIg0V66j0UdWwb4+ejH
	Vx9Fqqhc6sv8qiI4sXY0QGAqC2lzIZc81ovzOuWnmdY/5lHOPimRzDmShshXWrrsUYlXi3260QC
	d/CXNu7A0c9L/Uaf3OsWZdjCp55oIz60Iid7FJuh++KwuDO45jKZAH0vSi4rBw3Vw21F3+2RA7o
	rLeo4g8MByGR82Ehvxv1LLKK4BqFSfX0Bolda6P/cEhNV8iVBd5wBdHtgEMol0OQjtCs9CitXp4
	9E1BuwOSI986SG87GKgV3hbiK7U6fCdRfMNpDqvG7u6csJFPKt/Pvb1fzWDaOchIS7Ox1yeCWrU
	dlVJKVpFuzQeDo2nhoGiun1J4686idedRULk65qeobELuzEkMJxjgQGIYXECXNaDyAdDx2RTB2p
	kFNbCVABaQyD6cGu7q3qUPg3JSF56M3P6YTA5t9zar7QrmyW1EMuLBFKJn9bY8is4e96TFjIxWx
	fyiTrkBVatrqNGz+0boA2fnkvIXWhhWuVE76DIKrXv0fmQw0gcViZGnEvzsC5l5h3NXczDrdAkB
	+jDNNLtKXOMUmVCP8BN6TfIPbX5UD0RmA/NniKnQoVhMG3FbSufq55/OP3soeW3hSf4jT2dVwhN
	NiTY/LtH93/33yuSRO+AM8SN62B/sHQuU/31z7DQJomwdoc7WgIvudFNXYfy14wRy0MgFZtBEM+
	lhoHX07COCEbGyZK+BLL5QoMNm1jRvQCvB9IFTKnT9MLP2yWbagMAWZOyCcwg0gIzBx7OIHBuX/
	+AygkSRChDA3i0shKoVttI2gzeZUrZWOl2f3CwUFl3+cRbINtxX6siBnPFGaKrWv3Ui5hfUmgdt
	PUkS
X-Received: by 2002:a05:7301:4244:b0:36c:a26f:83c4 with SMTP id 5a478bee46e88-3810eb09fafmr159990eec.13.1794851732238;
        Mon, 16 Nov 2026 09:55:32 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:55:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 064/105] python3-pycocotools: upgrade 2.0.8 -> 2.0.11
Date: Mon, 16 Nov 2026 09:53:16 -0800
Message-ID: <20261116175359.342679-64-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:55:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132520
Content-Type: text/plain; charset="utf-8"

Drop the numpy 1.x patch; numpy in OE is 2.x and upstream requires
numpy>=2.0.0.

Changes:
- Support latest numpy (2.3+) and build abi3 wheels; Python 3.14
  support; free-threaded 3.13t support dropped (2.0.11).
- matplotlib is no longer a required dependency by default.
- COCO.loadRes also copies the info dict to results; default value
  added for info.
- Musl wheel builds removed.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...01-downgrade-numpy-version-to-1.26.4.patch | 26 -------------------
 ...2.0.8.bb => python3-pycocotools_2.0.11.bb} |  3 +--
 2 files changed, 1 insertion(+), 28 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pycocotools/0001-downgrade-numpy-version-to-1.26.4.patch
 rename meta-python/recipes-devtools/python/{python3-pycocotools_2.0.8.bb => python3-pycocotools_2.0.11.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pycocotools/0001-downgrade-numpy-version-to-1.26.4.patch b/meta-python/recipes-devtools/python/python3-pycocotools/0001-downgrade-numpy-version-to-1.26.4.patch
deleted file mode 100644
index cd3e462ddf..0000000000
--- a/meta-python/recipes-devtools/python/python3-pycocotools/0001-downgrade-numpy-version-to-1.26.4.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 7222a8b9b6e05b89116ca14644aa8db79eecd3c6 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 24 Aug 2024 00:19:23 -0700
-Subject: [PATCH] downgrade numpy version to 1.26.4+
-
-We can drop it when OE-core upgrades numpy to 2.x
-
-Upstream-Status: Inappropriate [OE workaround]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- pyproject.toml | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pyproject.toml b/pyproject.toml
-index 1bfbd91..cbee520 100644
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -1,7 +1,7 @@
- [build-system]
- requires = [
-     "cython>=0.27.3",
--    "numpy>=2.0.0rc1",
-+    "numpy>=1.26.4",
-     "setuptools>=43.0.0",
-     "wheel",
- ]
diff --git a/meta-python/recipes-devtools/python/python3-pycocotools_2.0.8.bb b/meta-python/recipes-devtools/python/python3-pycocotools_2.0.11.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pycocotools_2.0.8.bb
rename to meta-python/recipes-devtools/python/python3-pycocotools_2.0.11.bb
index c887514efc..814b66acf4 100644
--- a/meta-python/recipes-devtools/python/python3-pycocotools_2.0.8.bb
+++ b/meta-python/recipes-devtools/python/python3-pycocotools_2.0.11.bb
@@ -5,9 +5,8 @@ LIC_FILES_CHKSUM = "file://pycocotools/coco.py;beginline=45;endline=45;md5=12cb5
 
 inherit pypi python_setuptools_build_meta cython
 
-SRC_URI += "file://0001-downgrade-numpy-version-to-1.26.4.patch"
 
-SRC_URI[sha256sum] = "8f2bcedb786ba26c367a3680f9c4eb5b2ad9dccb2b34eaeb205e0a021e1dfb8d"
+SRC_URI[sha256sum] = "34254d76da85576fcaf5c1f3aa9aae16b8cb15418334ba4283b800796bd1993d"
 
 DEPENDS = "python3-numpy-native virtual/crypt python3-wheel-native"
 RDEPENDS:${PN} = "python3-matplotlib python3-pillow python3-profile"
