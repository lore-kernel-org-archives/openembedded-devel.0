Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD46FC87FCB
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 23:13:48 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.100700.1754090020219259091
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Aug 2025 16:13:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RUE4qArw;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-76bd2b11f80so2150747b3a.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 01 Aug 2025 16:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754090019; x=1754694819; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UgVgLUGtpW3LYhf88ArhVv1TVPMVNqLHQLJQGDYHgKM=;
        b=RUE4qArwIk8cI1eE/7viGfAEOtvVrqJEET1I7w3OEGI7LSaBSPB+Ufl/mHWiqueic7
         5FVps7hr3xw7JWjT/IO8HVFXT8WxN3F8Y6UtPaJF0TXIJO6BY4PKpsgNhbNlQ0Fp1MSP
         //AfjLmV4rz6+XZeGptrICVivYBFNnUL48u1sX8Rra6Ik/HC5fBeSyyZa2oeYrq+AKfb
         2pKLFM59VrdF/N6kqN5Vgc9/Fc7A8swytjCnPgwIrWGqFQZW99NgDGjjsSuPK89lNDEz
         frOlemEgexyjRGHsuMY0DRL6dQkidDO0/QbYR0d/UhyHtzXcRRZIzT2tj7CscF/esczx
         kHzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754090019; x=1754694819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UgVgLUGtpW3LYhf88ArhVv1TVPMVNqLHQLJQGDYHgKM=;
        b=u6R5ZuHlKlOmSM0J+MEZgtQZhpBKOUG0N7RL851yj6JJHwmuWHmYNRY3tG52RpTs4R
         GS1S5tN1RWKVlQonmU58S0ZBFGnvX2qd+VrioSFjwhVsqhEr+It6BXYZjbxD9gXsjBXQ
         ylhuvO4I0Qya9NYf8rBoYETR/IPgzzvHnl/IuszEwboMm0dWkdT1jgTvlJ4jOs9+2oY/
         e3knNB3MW+NTR4I+ZSfvpBc4j/kOT8es08MAIa74yeYKPEVT4UVs1ZGRy+ypD4TbOmJv
         OdRutiwIXHn4K59VhVRQUxhJosiLPIE3PgRwOGm5tKBaBgv55PObK31a105TgT5rI9em
         wd/w==
X-Gm-Message-State: AOJu0YwpSf+dmKz8HH+kqXIKn8T1dZhiTRTLSN8Fip6t9bakVQmFzJEp
	lqDH1tOXU2D6t2GPGWnOmlZNfEdIWmLojpQor6bKlZoAftIdTDYEKI5nLCY1sk3PhR8=
X-Gm-Gg: ASbGncusrda0+16DdoH1MRmqb13UqcUYokyfoxs+IO+pAibZYSCn2kpRUMlg1Qhp5G5
	nW9BxyrJSES46INRFU32N1ESVxx1Jl5qjWgRlm5C4m62Lkrtr/Jds2ecDCkfziTFlqh8vmCZgfG
	EnwWxEQReMxATMF7ouMbQG8/DC1FrcUhnz0BCFzUel0O9B4UNftX9c/zhhn9RhRNC32EWPVFGkZ
	MFb8SJgWSF0IXiRY7iqWz54LW7iCsES6bmW6Ss0gmfWiktXI3b+OzxirEaD+mP96pykMP9C17Hu
	LsGWPjLL4cx6Mp05sCHRiLUghd4F8eZ6mglSRxhZsGBLIy//wCG/9OEDVwSWkZA53PorI4lw5ck
	5Ak/d5sfsP5svwg==
X-Google-Smtp-Source: AGHT+IEPlt9w1MbWTdw2/dvuTzG7RtZDZwgEK8MP+x5jgJtDdhGldNJUQQtSChdjMIfAHmfoxz+gig==
X-Received: by 2002:a05:6a20:3948:b0:22d:fd6:95a4 with SMTP id adf61e73a8af0-23df8fbfba7mr1729672637.12.1754090019283;
        Fri, 01 Aug 2025 16:13:39 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a237])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b423d2f4fcesm2141884a12.33.2025.08.01.16.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 16:13:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 4/4] python3-pydantic: Upgrade to v2.12.0a1 prerelease
Date: Fri,  1 Aug 2025 16:13:32 -0700
Message-ID: <20250801231332.4167568-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250801231332.4167568-1-raj.khem@gmail.com>
References: <20250801231332.4167568-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Aug 2025 23:13:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118827

Needed for python3-pydantic-core v2.37+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...rojects-Bump-pydantic-core-to-2.35.2.patch | 36 -------------------
 .../python/python3-pydantic_2.11.7.bb         |  3 +-
 2 files changed, 1 insertion(+), 38 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pydantic/0001-pyprojects-Bump-pydantic-core-to-2.35.2.patch

diff --git a/meta-python/recipes-devtools/python/python3-pydantic/0001-pyprojects-Bump-pydantic-core-to-2.35.2.patch b/meta-python/recipes-devtools/python/python3-pydantic/0001-pyprojects-Bump-pydantic-core-to-2.35.2.patch
deleted file mode 100644
index 794ebdbbc7..0000000000
--- a/meta-python/recipes-devtools/python/python3-pydantic/0001-pyprojects-Bump-pydantic-core-to-2.35.2.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 6558daf87f8ae156f913c0e76403cbffee40e3cc Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 22 Jul 2025 11:46:35 -0700
-Subject: [PATCH] pyprojects: Bump pydantic-core to 2.35.2
-
-This matches with recipe in meta-python
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- pyproject.toml | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -48,7 +48,7 @@ dependencies = [
-     'typing-extensions>=4.13.0',
-     'annotated-types>=0.6.0',
-     # Keep this in sync with the version in the `check_pydantic_core_version()` function:
--    'pydantic-core==2.35.1',
-+    'pydantic-core==2.35.2',
-     'typing-inspection>=0.4.0',
- ]
- dynamic = ['version', 'readme']
---- a/pydantic/version.py
-+++ b/pydantic/version.py
-@@ -66,7 +66,7 @@ def version_info() -> str:
- def check_pydantic_core_version() -> bool:
-     """Check that the installed `pydantic-core` dependency is compatible."""
-     # Keep this in sync with the version constraint in the `pyproject.toml` dependencies:
--    return __pydantic_core_version__ == '2.35.1'
-+    return __pydantic_core_version__ == '2.35.2'
- 
- 
- def parse_mypy_version(version: str) -> tuple[int, int, int]:
diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.11.7.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.11.7.bb
index 250a433726..e603e7dccd 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.11.7.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.11.7.bb
@@ -11,10 +11,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=09280955509d1c4ca14bae02f21d49a6"
 
 inherit python_hatchling ptest-python-pytest
 
-SRCREV = "702aaa6354cc30ae815676c57a8bbb4557ccb295"
+SRCREV = "9b52422377d974ffc3de4e8b0bf7faab1acf2ec4"
 PV .= "+git"
 SRC_URI = "git://github.com/pydantic/pydantic;protocol=https;branch=main"
-SRC_URI += "file://0001-pyprojects-Bump-pydantic-core-to-2.35.2.patch"
 DEPENDS += "python3-hatch-fancy-pypi-readme-native"
 
 RECIPE_NO_UPDATE_REASON = "Must be updated in sync with python3-pydantic-core."

