Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE6A4D5B874
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 22:52:10 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8053.1765839127376178747
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Dec 2025 14:52:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QH5YbqQE;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-64162c04f90so7578319a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Dec 2025 14:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765839125; x=1766443925; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CEo4pTMSUsjFxhm8qOfKxjPLRHcK+6jbyOz3WWgFRSM=;
        b=QH5YbqQE+IHJho+Sw6jJkTMnWsH8MBSjCi+RCdzP0hRxCrKRFKtszxVSmP1RbtiY4v
         4KnrH2ejXexvaBpRe/WBqDaxu1ubg0bMOE4MZr5rQsJnDLuwh/3NHuMfOqxLSn7heRSF
         6TUqVH8WjYLzAaEhbtXhGRsPo7+rqseOanF/z6Hkzi8wj1KGfFPkJloO39h9kxqpmLlI
         Mz5d444q3+j6KNwDrmPBPJTG71BWvCNHGbMiMplrYotypoZuUCpYU/bJWuTlZc9juUjK
         4qSrWHYNMOfNEqKi0givGv3osHWCyumNrzmVuxBkflsRycAvJgdV/0a7GB6LTM+Mahj7
         fHLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765839125; x=1766443925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CEo4pTMSUsjFxhm8qOfKxjPLRHcK+6jbyOz3WWgFRSM=;
        b=ZOXYK/cJNz2uNuZBpc+QUlVq6pfsg3NsMlqitKnwGrOEpdn9ejppVxvf3UMOVdyK1m
         YIGCsuj7GB2SEeVIvmqEL5XV4igb3FILtiXg8qzwRWEARcO/P/tfMTYe3AdJGsz9D2Ke
         Onruiyzcmz2q+v0cc+FbV6JqjJMl1ikbLDkVHLYCALjL8Ye1OolhHQhWGMfloH1Xi5pQ
         dHk+M5f3Pj0B12i6MIY2xRK9Afkjl8fD5w2JfBTtEW891FlycOa2UhoaXaj8M6J7V7HR
         0U3dTd8xJ5Tbt3/LHZ2/1AqKKmEmx2TMjHw3M7MmyuenXyAwIRm+KyN1NDL4D9h98ruC
         QQiA==
X-Gm-Message-State: AOJu0Yw5bA8V/TQgbAu4ZkcLFFwTHAb768gFgK59b+wmQyuPbpSjxwtv
	ofkqRp6sBhxZGQoc1VPQw7Tyi12uIoXteKnTNOXvVRYwULBmTPpD5sOb9/M0sA==
X-Gm-Gg: AY/fxX5EesYOSEFWz3Tvs/A4ARwEiasqhCE3BA3gLJgwuOKfwE0lgVyGFCI16ZdYXLM
	OapDLy5Frk/9D3it9EBggkilZ8D3whj2+F32worw84nEVCJdltOe1tome5pGo0zGEgTug7/F7Yg
	x1twTVOo1MvPXg/Qj9T8z9QXDMZGhwkUvQufTtlj2ZkKeqaVL83kc31wzJ/1/OWo5eu0qCtcMrN
	U8/gaArz4vPB1vIffj6S/7vTov7msDMSVoFt8B5/ACW0PYdgGdsK1tAuFmjuKeesRUyfETJgzoL
	ExBCi/9H+wz7HbQ8AtklkID5DyPTW6W37obNr1s/ycpEzdORWIjGhYeJvcYYf797ZqJS/9I/Hb1
	l1W0bWElqP7nJma8maexHV7fXnKM8nO+eQ2C3CF5fMqGPAAXHreLLx1AW395LJxbT8TnIuL3RIq
	DNUaIpu2kPVB4Gvze1jAuTCnpvCzNoGs1rikkBdKJkiiz4u3s4UAmENtOG2j2tAfFB47x79zhs/
	ZI=
X-Google-Smtp-Source: AGHT+IGdl0a/+oqAY4nR5upzc2dRA4VGhWrPNauhP6icb07Tr9f90X2pZJss+H4mRPnvkFkAbR903A==
X-Received: by 2002:a05:6402:5194:b0:649:2336:deed with SMTP id 4fb4d7f45d1cf-6499b1cc740mr11932721a12.16.1765839125232;
        Mon, 15 Dec 2025 14:52:05 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6498204fbb3sm14464617a12.8.2025.12.15.14.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 14:52:04 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 4/5] python3-chromecast: upgrade 14.0.7 -> 14.0.9
Date: Mon, 15 Dec 2025 23:51:21 +0100
Message-ID: <20251215225122.2243816-5-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251215225122.2243816-2-t.f.g.geelen@gmail.com>
References: <20251215225122.2243816-2-t.f.g.geelen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Dec 2025 22:52:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122673

Changelog: https://github.com/home-assistant-libs/pychromecast/releases/tag/14.0.9

Drop obsolete patches.

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 ...s-requirement-from-78.0-65.6-to-65.6.patch | 28 -------------
 ...s-requirement-from-79.0-65.6-to-65.6.patch | 42 -------------------
 ...s-requirement-from-80.0-65.6-to-65.6.patch | 42 -------------------
 ...-version-to-0.46.1-for-python3-wheel.patch |  2 +-
 ....0.7.bb => python3-pychromecast_14.0.9.bb} |  5 +--
 5 files changed, 2 insertions(+), 117 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pychromecast/0001-Update-setuptools-requirement-from-78.0-65.6-to-65.6.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-pychromecast/0001-Update-setuptools-requirement-from-79.0-65.6-to-65.6.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-pychromecast/0001-Update-setuptools-requirement-from-80.0-65.6-to-65.6.patch
 rename meta-python/recipes-devtools/python/{python3-pychromecast_14.0.7.bb => python3-pychromecast_14.0.9.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast/0001-Update-setuptools-requirement-from-78.0-65.6-to-65.6.patch b/meta-python/recipes-devtools/python/python3-pychromecast/0001-Update-setuptools-requirement-from-78.0-65.6-to-65.6.patch
deleted file mode 100644
index d659af8116..0000000000
--- a/meta-python/recipes-devtools/python/python3-pychromecast/0001-Update-setuptools-requirement-from-78.0-65.6-to-65.6.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 74c841c0fc3ffc13842f3544502f66f16e751a0f Mon Sep 17 00:00:00 2001
-From: "dependabot[bot]" <49699333+dependabot[bot]@users.noreply.github.com>
-Date: Mon, 31 Mar 2025 14:26:50 +0200
-Subject: [PATCH] Update setuptools requirement from <78.0,>=65.6 to
- >=65.6,<79.0 (#1047)
-
-Updates the requirements on [setuptools](https://github.com/pypa/setuptools) to permit the latest version.
-- [Release notes](https://github.com/pypa/setuptools/releases)
-- [Changelog](https://github.com/pypa/setuptools/blob/main/NEWS.rst)
-- [Commits](https://github.com/pypa/setuptools/compare/v65.6.0...v78.1.0)
-
-Upstream-Status: Backport [https://github.com/home-assistant-libs/pychromecast/pull/1047]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- pyproject.toml | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pyproject.toml b/pyproject.toml
-index 5aa8df7..34f5dc0 100644
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -1,5 +1,5 @@
- [build-system]
--requires = ["setuptools>=65.6,<78.0", "wheel>=0.37.1,<0.46.0"]
-+requires = ["setuptools>=65.6,<79.0", "wheel>=0.37.1,<0.46.0"]
- build-backend = "setuptools.build_meta"
- 
- [project]
diff --git a/meta-python/recipes-devtools/python/python3-pychromecast/0001-Update-setuptools-requirement-from-79.0-65.6-to-65.6.patch b/meta-python/recipes-devtools/python/python3-pychromecast/0001-Update-setuptools-requirement-from-79.0-65.6-to-65.6.patch
deleted file mode 100644
index b0d4a88c8e..0000000000
--- a/meta-python/recipes-devtools/python/python3-pychromecast/0001-Update-setuptools-requirement-from-79.0-65.6-to-65.6.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From ef27075e087e139921b99729a4ec7683e42c5c4a Mon Sep 17 00:00:00 2001
-From: "dependabot[bot]" <49699333+dependabot[bot]@users.noreply.github.com>
-Date: Mon, 21 Apr 2025 16:34:55 +0200
-Subject: [PATCH] Update setuptools requirement from <79.0,>=65.6 to
- >=65.6,<80.0 (#1056)
-
-Upstream-Status: Backport [https://github.com/home-assistant-libs/pychromecast/commit/ef27075e087e139921b99729a4ec7683e42c5c4a]
-
-Updates the requirements on [setuptools](https://github.com/pypa/setuptools) to permit the latest version.
-- [Release notes](https://github.com/pypa/setuptools/releases)
-- [Changelog](https://github.com/pypa/setuptools/blob/main/NEWS.rst)
-- [Commits](https://github.com/pypa/setuptools/compare/v65.6.0...v79.0.0)
-
----
-updated-dependencies:
-- dependency-name: setuptools
-  dependency-version: 79.0.0
-  dependency-type: direct:production
-...
-
-Signed-off-by: dependabot[bot] <support@github.com>
-Co-authored-by: dependabot[bot] <49699333+dependabot[bot]@users.noreply.github.com>
-
-Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
----
- pyproject.toml | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pyproject.toml b/pyproject.toml
-index 34f5dc0..88d67fe 100644
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -1,5 +1,5 @@
- [build-system]
--requires = ["setuptools>=65.6,<79.0", "wheel>=0.37.1,<0.46.0"]
-+requires = ["setuptools>=65.6,<80.0", "wheel>=0.37.1,<0.46.0"]
- build-backend = "setuptools.build_meta"
- 
- [project]
--- 
-2.39.5
-
diff --git a/meta-python/recipes-devtools/python/python3-pychromecast/0001-Update-setuptools-requirement-from-80.0-65.6-to-65.6.patch b/meta-python/recipes-devtools/python/python3-pychromecast/0001-Update-setuptools-requirement-from-80.0-65.6-to-65.6.patch
deleted file mode 100644
index 8630c1632d..0000000000
--- a/meta-python/recipes-devtools/python/python3-pychromecast/0001-Update-setuptools-requirement-from-80.0-65.6-to-65.6.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 7017a1db10a21ed97b79800e31a2f7c70abbffc3 Mon Sep 17 00:00:00 2001
-From: "dependabot[bot]" <49699333+dependabot[bot]@users.noreply.github.com>
-Date: Mon, 28 Apr 2025 16:43:13 +0200
-Subject: [PATCH] Update setuptools requirement from <80.0,>=65.6 to
- >=65.6,<81.0 (#1060)
-
-Upstream-Status: Backport [https://github.com/home-assistant-libs/pychromecast/commit/7017a1db10a21ed97b79800e31a2f7c70abbffc3]
-
-Updates the requirements on [setuptools](https://github.com/pypa/setuptools) to permit the latest version.
-- [Release notes](https://github.com/pypa/setuptools/releases)
-- [Changelog](https://github.com/pypa/setuptools/blob/main/NEWS.rst)
-- [Commits](https://github.com/pypa/setuptools/compare/v65.6.0...v80.0.0)
-
----
-updated-dependencies:
-- dependency-name: setuptools
-  dependency-version: 80.0.0
-  dependency-type: direct:production
-...
-
-Signed-off-by: dependabot[bot] <support@github.com>
-Co-authored-by: dependabot[bot] <49699333+dependabot[bot]@users.noreply.github.com>
-
-Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
----
- pyproject.toml | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pyproject.toml b/pyproject.toml
-index 88d67fe..d5a518c 100644
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -1,5 +1,5 @@
- [build-system]
--requires = ["setuptools>=65.6,<80.0", "wheel>=0.37.1,<0.46.0"]
-+requires = ["setuptools>=65.6,<81.0", "wheel>=0.37.1,<0.46.0"]
- build-backend = "setuptools.build_meta"
- 
- [project]
--- 
-2.39.5
-
diff --git a/meta-python/recipes-devtools/python/python3-pychromecast/0001-bump-required-version-to-0.46.1-for-python3-wheel.patch b/meta-python/recipes-devtools/python/python3-pychromecast/0001-bump-required-version-to-0.46.1-for-python3-wheel.patch
index 57c14f2aeb..655b9c08c7 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast/0001-bump-required-version-to-0.46.1-for-python3-wheel.patch
+++ b/meta-python/recipes-devtools/python/python3-pychromecast/0001-bump-required-version-to-0.46.1-for-python3-wheel.patch
@@ -1,4 +1,4 @@
-From 5485eccd26529740e0f875e33afcbdfefd630597 Mon Sep 17 00:00:00 2001
+From 672b0501526fc7c91725236fc37db82794096832 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 1 Jul 2025 23:14:08 -0700
 Subject: [PATCH] bump required version to 0.46.1 for python3-wheel
diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_14.0.7.bb b/meta-python/recipes-devtools/python/python3-pychromecast_14.0.9.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-pychromecast_14.0.7.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_14.0.9.bb
index 1b5ff94f8a..35106f870a 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_14.0.7.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_14.0.9.bb
@@ -4,13 +4,10 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
 SRC_URI += "\
-            file://0001-Update-setuptools-requirement-from-78.0-65.6-to-65.6.patch \
-            file://0001-Update-setuptools-requirement-from-79.0-65.6-to-65.6.patch \
-            file://0001-Update-setuptools-requirement-from-80.0-65.6-to-65.6.patch \
 			file://0001-bump-required-version-to-0.46.1-for-python3-wheel.patch \
 "
 
-SRC_URI[sha256sum] = "7abbae80a2c9e05b93b1a7b8b4d771bbc764d88fd5e56a566f46ac1bd3f93848"
+SRC_URI[sha256sum] = "fe78841b0b04aa107d08aed216e91ab9cfb54b11d089d382be4e987e3631d4a6"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


