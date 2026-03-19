Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7431D1091912
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 19:40:34 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4600.1773949227267137288
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Mar 2026 12:40:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VMLg3fwb;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so13438975e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 12:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773949226; x=1774554026; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8C7V0BEYQj/HeReDr/1/X65htXsu37kBzfR+nkFC8yQ=;
        b=VMLg3fwbI4LQdpbk4StmKD0vfFEgxFIkqnjha1NoEhzyBekoLOnqCQzEqvVT9HDmPf
         z9wB094hiNLGcJNtNozLHRiHA6F8m3oVdX261JG4pLANvnIgW5jgViLiDUoBf9Gi7xVu
         xhQBOLSrKFzD/B8lPHE1ysACH0CBCOfEwRAVlndO6WQO2EAWDDt7q/2jFxm4dNK7ynQR
         xBDtU4zxb2dTTK9+jK59cnjfXW7MskWYKvDeOW8FsSf4Jp+U3Zk4ETfFdstWN8pxUwfv
         oJeOyHqBt4d4wV/XJJ1CMWJNz0Ll9hp8Ccpl4PoESlO0arzVBT4jEFJK8FraArghE1YG
         IhDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773949226; x=1774554026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8C7V0BEYQj/HeReDr/1/X65htXsu37kBzfR+nkFC8yQ=;
        b=FvcUlptSYzy46zwVSJGyZPHldzYfMrd04hlhFXWj6icq+F3jw69IaU4LWR4sbqUyUz
         vGNsvglBuHmsg5c2psN3cCIUDeSOnwMYwGgDJTjWXquKwB0FqL05xvbJZfZkej668+4F
         AptiNgKlah1rUK5WKeFRQ2O+I8isMJ7nwpzs0TKfYFcP0uDhwAxYm7V5y8+jabZuCZH7
         1uNkE8Snf1cLI0XmIpWzJ8SKb+b6yVwIUySpTcwFIufVGAjzuc2PBBRFl6ZKYEh5Sm2i
         hTMO79wSAFAd+HW9QtR8i23RYquxLsgonE+xY4HWzHOqlfzjFpic4YHWP1EI1Bfj2ip0
         DJVA==
X-Gm-Message-State: AOJu0YwASgE9G95nJwNYR9BKVd1pIi3qqUx5cJTAiy+S4pYFBqEn/iNV
	9qj243TR1LaTFAwJ2qCnLFln6/C3VW8zaUmZc+vx14PnBIHOGkXUMsQVgbBXYQ==
X-Gm-Gg: ATEYQzyzVUtqhhPCqH7OaFDfOBjgDYs+E+9AT4Q5ifzAfEHRtT8P6RsIeXvjnj0tLPJ
	I/rTb4DSHQuRbrnde5hb0ZStuql7QD5nxEVFLmmC1oE6UUe/lagsxjDbe6RUCkq/NLcaOzCcpGN
	iwHBxM7IxGoWEPd18el+rafUa2YZz/xAnT0QMpm/h5wo0y+E23eYesuJfb6TGai++lEZ8fRmiCi
	uEIGlWDJasiOe5nzuSQ4USnnLEhTOUayjXosrXsR4VnC7FNcLUhC1H/RqY+A4z5YhZ8hpEp0XyZ
	HNFNbb1vUB9guntxCSGYZcIkZKDJZ/L1aeswIBBBaz+KhBctxK6xDyTQv6OfQC1tfSSGe2Co1Y5
	4eDMTIo49cS3W+opr0GiRvS6Ln+T5mfE/ICDVIn/LIrzkcdKBiG02KhIJrvgnvCnkFZnJ93T2M6
	5kL3GK6m57Suy0BoCHdwrTDD0XXfThCPA=
X-Received: by 2002:a05:600c:1f86:b0:485:ae14:8191 with SMTP id 5b1f17b1804b1-486fedab44amr5271745e9.5.1773949225352;
        Thu, 19 Mar 2026 12:40:25 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b94a83sm84350735e9.10.2026.03.19.12.40.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 12:40:24 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-pychromecast: upgrade 14.0.9 -> 14.0.10
Date: Thu, 19 Mar 2026 20:40:24 +0100
Message-ID: <20260319194024.878293-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 19:40:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125412

Beside the below changelog, it also allows compiling with the latest Setuptools.

Drop patches which became obsolete.

Changes:
- Ensure cec info is none if not supported
- Add some fast pre-commit checks
- Switch to ruff for checks and formatting
- add D24f-J09 to const.py
- Update const.py to include Lenovo Smart Display 10
- Avoid logging graceful disconnect as error
- Fix datetime deprecation

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...-version-to-0.46.1-for-python3-wheel.patch | 23 -------------------
 .../0002-allow-newer-wheel.patch              | 22 ------------------
 ...0.9.bb => python3-pychromecast_14.0.10.bb} |  6 +----
 3 files changed, 1 insertion(+), 50 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pychromecast/0001-bump-required-version-to-0.46.1-for-python3-wheel.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-pychromecast/0002-allow-newer-wheel.patch
 rename meta-python/recipes-devtools/python/{python3-pychromecast_14.0.9.bb => python3-pychromecast_14.0.10.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast/0001-bump-required-version-to-0.46.1-for-python3-wheel.patch b/meta-python/recipes-devtools/python/python3-pychromecast/0001-bump-required-version-to-0.46.1-for-python3-wheel.patch
deleted file mode 100644
index 655b9c08c7..0000000000
--- a/meta-python/recipes-devtools/python/python3-pychromecast/0001-bump-required-version-to-0.46.1-for-python3-wheel.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From 672b0501526fc7c91725236fc37db82794096832 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 1 Jul 2025 23:14:08 -0700
-Subject: [PATCH] bump required version to 0.46.1 for python3-wheel
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- pyproject.toml | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pyproject.toml b/pyproject.toml
-index d5a518c..a6a159d 100644
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -1,5 +1,5 @@
- [build-system]
--requires = ["setuptools>=65.6,<81.0", "wheel>=0.37.1,<0.46.0"]
-+requires = ["setuptools>=65.6,<81.0", "wheel>=0.37.1,<0.46.2"]
- build-backend = "setuptools.build_meta"
- 
- [project]
diff --git a/meta-python/recipes-devtools/python/python3-pychromecast/0002-allow-newer-wheel.patch b/meta-python/recipes-devtools/python/python3-pychromecast/0002-allow-newer-wheel.patch
deleted file mode 100644
index 456feb6010..0000000000
--- a/meta-python/recipes-devtools/python/python3-pychromecast/0002-allow-newer-wheel.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-From e11eb34d1196a9dc35fef213aeffdfd8e6e29f44 Mon Sep 17 00:00:00 2001
-From: Tom Geelen <t.f.g.geelen@gmail.com>
-Date: Sun, 8 Feb 2026 19:14:09 +0100
-Subject: [PATCH] allow newer wheel
-
-Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
-Upstream-Status: Pending
----
- pyproject.toml | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pyproject.toml b/pyproject.toml
-index 4c98630..75a15da 100644
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -1,5 +1,5 @@
- [build-system]
--requires = ["setuptools>=65.6,<81.0", "wheel>=0.37.1,<0.46.2"]
-+requires = ["setuptools>=65.6,<81.0", "wheel>=0.37.1,<0.46.4"]
- build-backend = "setuptools.build_meta"
- 
- [project]
diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_14.0.9.bb b/meta-python/recipes-devtools/python/python3-pychromecast_14.0.10.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-pychromecast_14.0.9.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_14.0.10.bb
index 6f88684f8b..cdd85a550f 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_14.0.9.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_14.0.10.bb
@@ -3,11 +3,7 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
-SRC_URI += "file://0001-bump-required-version-to-0.46.1-for-python3-wheel.patch \
-           file://0002-allow-newer-wheel.patch \
-           "
-
-SRC_URI[sha256sum] = "fe78841b0b04aa107d08aed216e91ab9cfb54b11d089d382be4e987e3631d4a6"
+SRC_URI[sha256sum] = "f05a1c8d727d4f104c8c731688053033e05157f2ab81bc8eef50ec0c62f9373c"
 
 inherit pypi python_setuptools_build_meta
 

