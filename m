Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44275CCA470
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 09:36:34 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.11778.1759916176232936808
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 02:36:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=F66Hs4Fh;
 spf=pass (domain: konsulko.com, ip: 209.85.218.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b463f986f80so1167108066b.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 02:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1759916174; x=1760520974; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QxOzKWosUIGqrykEUPkdQEkd5KChyBRCHBQSldeIEaE=;
        b=F66Hs4FhsdOQVPBT2KQZ4q5oCyaVHr6WokJ20uEzZxJkyZyXiMM3sMIM3abc63YKod
         lA4Y0UCd003FbqdV31/hBYjubHr7911FmnaY4+/ImOxcrNH6vy8pS46SxUI14x5YwJLe
         7vabsNbFY3KEDLMdWFWKPMKO1smH67CqfmZHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759916174; x=1760520974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QxOzKWosUIGqrykEUPkdQEkd5KChyBRCHBQSldeIEaE=;
        b=BZvGSMKoPk5YnxljSFxXbxMwbdLEWcUnAr5BZpxbOJBn28Pq7jsTYaJcHLXMi77iVi
         ObGnumFqaZAWAguOnxwR3aPWzxD/PSmN37nk9kISMqiY2Tl1Vk4wRs2q5AsndOxiAEFC
         m0xTBQTYhCIbaEzhaPnV2924eLWZ1p6b4d8jtGn44tD8zO5WjsdCNN5TqhxnYKCj0BYN
         XMZr8zcztW9xl4Bp0rRHG1j9kKZ8VpYhPPXwIDOqRDPt4oUjFoTHA62NwiVeLF8KuamP
         EjmW8cQli49iLXjM0p/gZwiZagyA/Z95+4lct07dDMoW5+2q+4tel9T6dWmXlbnmEw+t
         Mylg==
X-Gm-Message-State: AOJu0Yy2DWW5m+wg0eYM0sD74oZZwWQlfKcFBgJVj2+1R4DrISUPwoF/
	RqkcUnam56C0vu4oha1Xi7rDzLXZmGO1rN9f60GcueE9nnUtf9e+AHLdXRB7MVhCxWVJZ6N7T01
	+XxBO
X-Gm-Gg: ASbGncutoKCAI2uo6cdIno+6+tYQOktzfUyJBTiWeV835UE83KAOlEb5WPVnF1sGlEw
	FJe+c+o6uqX1O1fzaD7R2kk0XUw5hN6QtRPecyjDUEtGB570X9VMjBoYbY9fCefkcQx71PHvkSi
	3qBX1dNU3Xrgg7STutHydZ8KdRMQsH55xOY9rn+Ke1/QchPVG8fmSj2uEBQfz6L4mu/6Jc/iw9+
	jKV99l0a4lZh2nND+bzYw3kJO1cH78D3jhVIslrifud8gucqhzstbGVG7t3OeFYHgIV/g/bGy17
	nIU2bbx5/GJ8AwDZC2hfJ7wYi63IuAL/g72Ar0mcjLMOIhpTl1hr+z1qW2wqLy2XoNkEPh9AyIf
	ItcdUyg9/XoQ9hLnBGOq1Jxbbc9G7Jfq4KjbrYN7XZ0++tOrpdARutBa8SVWw
X-Google-Smtp-Source: AGHT+IGixAf2nwMXkH7EOQ0mtch+5yq+LAm+BhAAGn2P112UsVu/cMeA+cXb8FVmMs2VbsJKyryRhw==
X-Received: by 2002:a17:907:d86:b0:b49:5103:c0b4 with SMTP id a640c23a62f3a-b50ac5d07f2mr327626766b.56.1759916173303;
        Wed, 08 Oct 2025 02:36:13 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865f74002sm1640078866b.42.2025.10.08.02.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 02:36:12 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-dbus-fast: Upgrade 2.44.1 -> 2.44.5
Date: Wed,  8 Oct 2025 12:36:07 +0300
Message-ID: <20251008093609.2094597-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 09:36:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120358

Upgrade to release 2.44.5:

- fix: cibuildwheel sha
- Improve unmarshall performance for SignatureType
- Simplify code to unmarshall arrays

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ject.toml-Remove-upper-version-constraint-for-C.patch | 9 +++++----
 ...3-dbus-fast_2.44.1.bb => python3-dbus-fast_2.44.5.bb} | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-dbus-fast_2.44.1.bb => python3-dbus-fast_2.44.5.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-dbus-fast/0001-pyproject.toml-Remove-upper-version-constraint-for-C.patch b/meta-python/recipes-devtools/python/python3-dbus-fast/0001-pyproject.toml-Remove-upper-version-constraint-for-C.patch
index fb8f4df4a6..5366627abf 100644
--- a/meta-python/recipes-devtools/python/python3-dbus-fast/0001-pyproject.toml-Remove-upper-version-constraint-for-C.patch
+++ b/meta-python/recipes-devtools/python/python3-dbus-fast/0001-pyproject.toml-Remove-upper-version-constraint-for-C.patch
@@ -5,6 +5,7 @@ Subject: [PATCH] pyproject.toml: Remove upper version constraint for Cython
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 ---
  pyproject.toml | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
@@ -14,14 +15,14 @@ index e22ea42..f670d3d 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
 @@ -50,7 +50,7 @@ pytest-cov = ">=3,<7"
- pytest-asyncio = ">=0.19,<0.27"
+ pytest-asyncio = ">=0.19,<1.3"
  pycairo = "^1.21.0"
  PyGObject = {version = ">=3.50,<3.51", python = "<4"}
--Cython = ">=3,<3.1.0"
+-Cython = ">=3,<3.2.0"
 +Cython = ">=3"
- setuptools = ">=65.4.1,<79.0.0"
+ setuptools = ">=65.4.1,<81.0.0"
  pytest-timeout = "^2.1.0"
- pytest-codspeed = "^3.1.1"
+ pytest-codspeed = ">=3.1.1,<5.0.0"
 @@ -104,7 +104,7 @@ module = "docs.*"
  ignore_errors = true
  
diff --git a/meta-python/recipes-devtools/python/python3-dbus-fast_2.44.1.bb b/meta-python/recipes-devtools/python/python3-dbus-fast_2.44.5.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-dbus-fast_2.44.1.bb
rename to meta-python/recipes-devtools/python/python3-dbus-fast_2.44.5.bb
index f827d21bb2..4f21ec379e 100644
--- a/meta-python/recipes-devtools/python/python3-dbus-fast_2.44.1.bb
+++ b/meta-python/recipes-devtools/python/python3-dbus-fast_2.44.5.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=729e372b5ea0168438e4fd4a00a04947"
 
 SRC_URI += "file://0001-pyproject.toml-Remove-upper-version-constraint-for-C.patch"
-SRC_URI[sha256sum] = "b027e96c39ed5622bb54d811dcdbbe9d9d6edec3454808a85a1ceb1867d9e25c"
+SRC_URI[sha256sum] = "e9d738e3898e2d505d7f2d5d21949bd705d7cd3d7240dda5481bb1c5fd5e3da8"
 
 PYPI_PACKAGE = "dbus_fast"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.47.3


