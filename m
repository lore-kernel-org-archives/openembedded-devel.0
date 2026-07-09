Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED50BC44503
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 06:33:01 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3186.1783578777305319378
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2026 23:32:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eaRyisD6;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c6b67d5fa1so6187715ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 23:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783578777; x=1784183577; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=odSLvOH4egZZz67oXDCWVHk7hwA5PdDvlye5eQ+iznw=;
        b=eaRyisD6/rbzPrpmN1SZxoBB3Gm8AxT6lMcDJc8eY8WLjCs4sj/kSjIDNY7QIQlfZO
         +pDza7zBAySZ4jI8SrXQa08+QfE/3awYR+IR0oUKmMhyoC7eRNKqW0Kb5I92+v2f2/Ox
         Dnne2z8QkXeEpZBrhIijkf+l+OnZyBvyadlhpsYovohHPeENE0NM+2XxBEmpf+56WELl
         XKve55sdqY3NPMladhvoa32kJpVHwqW24NsOUCxdMRlwgWvwYIvqUP+I0i+LHJBLHIUq
         GxIFqSa0LGzVuQjxD5MPvsAOx24cthKmyVqU2ef7DSFSevAgwtoDJ9JLIW5vGcYDxdkx
         Yixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783578777; x=1784183577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=odSLvOH4egZZz67oXDCWVHk7hwA5PdDvlye5eQ+iznw=;
        b=DFZUoTFpqXSF0ND+Ipcg9LC/vyQOptQ/DJxctivXDw7qdZAw5B9KUgcXiBXTq5L7hk
         nNlwqvnIMc/xohdltz6waOFZNggiCsX75CwMu05rdWa2LXkQ5w5YjWOI68YjDBbNwAg7
         bHw/FjKt1X7wtnrPJj6QX1o33fFqSz3LKWm4NgS8uv+7lHgf6B/3Ek6y5JAnIFXYoFNU
         zxK7tc7cw7IZf83rGJm5e2z4Gpipi0RSjcW/h/hJFbQcP1DyuKbDdmEoByzuaddtkGXK
         LSL178deDgZ/74a7zg+tmqmEF5KQJnolpEzqLlyqtf0+eCeKvQE0zMTkKpH6dtdkM1FA
         4FnQ==
X-Gm-Message-State: AOJu0Yz2G/vKCu0w2rFwK7E/630DFXaVSuLSFpREVKGDxMGXwgdKvh64
	z30VRn7vYSLxXqOwif0dWm4v3mSls3OLCCuddPadJ3GEzY3TMQxuGUAjoSkvRMPQ9IA=
X-Gm-Gg: AfdE7ck6EtML48Fn3cbBH+eWucPZ2eHJ4qmLusArwVruehfQz/tuNKcuXFfrl0OQiQc
	moFwBXh8z5XsiH4i7jy7FN98XIgR7MwbKeQWIs/VaaNKGvNcrvPTn6isD2s28jOmv+TBJ/gGrvj
	fgswoFEwVyZw6TmP4ZhS26JzRIk9RskEzM8PhAl3QzppJ67xg3+NL8/ig/c8Pxn0j7IjB6JZKWu
	hGZRgEk2OvDilThITXOvJnh2dlBnnr0yKqYOsXpeo8zPaKlgMrfuYn8GCr0tVk5gDbpZBpJchPp
	3+2WdoIKC7O4c1zYBYhsUvlF72UTR5yz6BmQqZ0owB97N67A9bYVZh+DDOR1Ii5SOoLQ39xRucU
	Ts5M57sYK63S23BgvrFDZE2BHAbk38hGHpZnco3YDfGxM1B+QrV0jd1TCTATT9soCkQmIWLXGNC
	9h71dH7Op7VRFnJy+8XzQdCG6iP+XCnU7lnzk82XT4IsYnizLmPHjXEYH5WJPKBTRWc5WKG0qyn
	wwjVzB01DNt5fTrNo9TyoQ4/H/3IXjt5yU5Kp7yz5Gvsstfy2doF7q2chIV1lBvlaPbqW8rBbUe
	mDQO0GPDU4d5dzz/BlmndonyttBfWQ==
X-Received: by 2002:a17:903:1b2c:b0:2ca:c01e:8837 with SMTP id d9443c01a7336-2ccea444eb7mr60582625ad.24.1783578776651;
        Wed, 08 Jul 2026 23:32:56 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bd5bsm38413735ad.72.2026.07.08.23.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 23:32:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 3/4] python3-pychromecast: Relax build requirements
Date: Wed,  8 Jul 2026 23:32:50 -0700
Message-ID: <20260709063251.3218170-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709063251.3218170-1-khem.raj@oss.qualcomm.com>
References: <20260709063251.3218170-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jul 2026 06:33:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128115

The upstream pyproject.toml caps setuptools at <83.0, but OE builds with
--no-isolation against the native setuptools (now 83.0.0), so the build
fails with "Missing dependencies: setuptools<83.0,>=65.6". Drop the
spurious upper bound.

Fold this into the existing wheel-version relaxation so pyproject.toml is
adjusted by a single patch.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...1-pyproject.toml-relax-build-requirements.patch} | 13 +++++++++----
 .../python/python3-pychromecast_14.0.10.bb          |  2 +-
 2 files changed, 10 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/python3-pychromecast/{0001-Allow-building-with-wheel-0.47.patch => 0001-pyproject.toml-relax-build-requirements.patch} (55%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast/0001-Allow-building-with-wheel-0.47.patch b/meta-python/recipes-devtools/python/python3-pychromecast/0001-pyproject.toml-relax-build-requirements.patch
similarity index 55%
rename from meta-python/recipes-devtools/python/python3-pychromecast/0001-Allow-building-with-wheel-0.47.patch
rename to meta-python/recipes-devtools/python/python3-pychromecast/0001-pyproject.toml-relax-build-requirements.patch
index cfb201dfe0..74e8f4d438 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast/0001-Allow-building-with-wheel-0.47.patch
+++ b/meta-python/recipes-devtools/python/python3-pychromecast/0001-pyproject.toml-relax-build-requirements.patch
@@ -1,9 +1,14 @@
 From a82451e8f2db33e22fef6714ddbd35a3e03debff Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Thu, 14 May 2026 11:49:05 -0700
-Subject: [PATCH] Allow building with wheel 0.47+
+Subject: [PATCH] pyproject.toml: Relax build requirements

-Upstream-Status: Pending
+Allow building with wheel 0.47+ and drop the upstream setuptools upper
+cap. OE provides setuptools via DEPENDS and builds with --no-isolation,
+so the cap is spurious and breaks the build whenever oe-core ships a
+newer setuptools (currently 83.0.0).
+
+Upstream-Status: Inappropriate [oe-core specific dependency versions]

 Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
 ---
@@ -17,7 +22,7 @@ index 20524ca..fc62798 100644
 @@ -1,5 +1,5 @@
  [build-system]
 -requires = ["setuptools>=65.6,<83.0", "wheel>=0.37.1,<0.47.0"]
-+requires = ["setuptools>=65.6,<83.0", "wheel>=0.37.1,<0.48.0"]
++requires = ["setuptools>=65.6", "wheel>=0.37.1,<0.48.0"]
  build-backend = "setuptools.build_meta"
-
+
  [project]
diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_14.0.10.bb b/meta-python/recipes-devtools/python/python3-pychromecast_14.0.10.bb
index 5b1d780b86..1c607b9bb9 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_14.0.10.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_14.0.10.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"

-SRC_URI += "file://0001-Allow-building-with-wheel-0.47.patch"
+SRC_URI += "file://0001-pyproject.toml-relax-build-requirements.patch"
 SRC_URI[sha256sum] = "f05a1c8d727d4f104c8c731688053033e05157f2ab81bc8eef50ec0c62f9373c"

 inherit pypi python_setuptools_build_meta

