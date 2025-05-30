Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B53C7C5B555
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 09:41:54 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.2790.1748598108368615960
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 May 2025 02:41:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=CyCY+wuh;
 spf=pass (domain: konsulko.com, ip: 209.85.128.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4508287895dso16293475e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 May 2025 02:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1748598106; x=1749202906; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qx2FtypU4l2RFDNckOSjPdOb3RA6FX5tTf69CV9Ve5M=;
        b=CyCY+wuhWfuGwehd2LZMr22rAW2FRaw+8juMZtD5/LTCqWfkyJlrFHMlSZcXlgD3yD
         nvtTGHzfP5DWoZyOB4RUOciov1nEGx5Z5K9dNq8oxHV24WABEAjEznVkQiFVE8cj9B82
         7bZPj0FK+2FasSx7aJk2Ci1H71XCbZtJe/FYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748598106; x=1749202906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qx2FtypU4l2RFDNckOSjPdOb3RA6FX5tTf69CV9Ve5M=;
        b=SfM0tbCjyx5wJS3vRTY4EVjyUWMWj37ZDXuvl4JmJS8AFa5+Rl8CjOKmOLnaXyarMy
         OQK7QjOyMCfa11M0y6gTyLj2QYUqFdfv0TDSMCSTl6ljh/wo4YzA/wrGloLEQ2c3/QHf
         bq9SwbmXjmOcwMzAogrBj3jYHnUjM1lzv9WpCamOPC3eAVPY24hLX/tBuE4zbOZvDn8O
         zN9rf44LelJw2HnVjiYWAcEIRGpjxDlZeZh+3L17XmXbk06RUhXuEp90kJ5kFBZWwz0+
         iWvXv+GjqEL7QozmRO1D0lYp0aSntCia4xWBKM1TZzDC6y0oibAVcVWK9sWDJRQcW2l9
         nx8Q==
X-Gm-Message-State: AOJu0Ywnk0x6hUWZe6751Hrays+h2NaGY0PUyYbzEZlsDLCW2zTaGiOX
	hry0cuHWmA2dU3QScXanFPiEbI7c8ISVHTAknB8bL9mY+mk2jXSy3yneqj9G+CYG0Nh2xAbOfnj
	iege8
X-Gm-Gg: ASbGncsWsDCJfTznJS55CO9L7y7lT5d2cE89zJOPLb2YuXXTYx8k1VXCNeiriF4J3px
	AF5jTywE6fKfbBcjYi6NZvNxcn7dYcBNTXoD/PShT31d0L46DU7BrTCpjmlRHNEaHK7YK+ySLbc
	N2JHWZf+0FPG727kxhGyXrAKqfBoxQNP1i/b2aW++R3JazNXCorNHsJjhKOIOBeXaP1B0XbAcAZ
	u3E6ezKouSRmSLTWw4met/LAuiorQomGG/PIKUa4zRmHcU1tbo3MGHIsycangn5Auidig2kjGiE
	XcbP0FnivsUcJ01ptITKKAmm3nDEDvE7yIYwbAcHKD6HFJPAsHuFE2J4seB4/OYKDQ==
X-Google-Smtp-Source: AGHT+IG7ZKx59zNdJj4JKPWXqhmBtfhl2A79sFHqziiF6L2ZfJ6+qcr2w8TEfvffRbeJT6FqZjj/rA==
X-Received: by 2002:a05:6000:25c7:b0:3a4:e603:3d2 with SMTP id ffacd0b85a97d-3a4eed218a9mr5789888f8f.0.1748598106587;
        Fri, 30 May 2025 02:41:46 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fb051bsm13149075e9.18.2025.05.30.02.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 02:41:46 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-charset-normalizer: Upgrade 3.4.1 -> 3.4.2
Date: Fri, 30 May 2025 12:41:42 +0300
Message-Id: <20250530094142.2158572-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250530094142.2158572-1-leon.anavi@konsulko.com>
References: <20250530094142.2158572-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 May 2025 09:41:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117674

Upgrade to release 3.4.2:

- Addressed the DeprecationWarning in our CLI regarding
 argparse.FileType by backporting the target class into the package.
- Improved the overall reliability of the detector with CJK Ideographs.
- Optional mypyc compilation upgraded to version 1.15 for Python >= 3.8

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...yproject.toml-Relax-version-for-mypy.patch | 25 -------------------
 ...bb => python3-charset-normalizer_3.4.2.bb} |  3 +--
 2 files changed, 1 insertion(+), 27 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-charset-normalizer/0001-pyproject.toml-Relax-version-for-mypy.patch
 rename meta-python/recipes-devtools/python/{python3-charset-normalizer_3.4.1.bb => python3-charset-normalizer_3.4.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-charset-normalizer/0001-pyproject.toml-Relax-version-for-mypy.patch b/meta-python/recipes-devtools/python/python3-charset-normalizer/0001-pyproject.toml-Relax-version-for-mypy.patch
deleted file mode 100644
index d544caaa17..0000000000
--- a/meta-python/recipes-devtools/python/python3-charset-normalizer/0001-pyproject.toml-Relax-version-for-mypy.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 57b626d6d8c247c9203dde51a988b9401abe065c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 9 Apr 2025 23:44:44 -0700
-Subject: [PATCH] pyproject.toml: Relax version for mypy
-
-It asks for mypy <= 1.14.0 but we have 1.15.x
-already in meta-python
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- pyproject.toml | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pyproject.toml b/pyproject.toml
-index bbb8227..ad42715 100644
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -1,5 +1,5 @@
- [build-system]
--requires = ["setuptools", "setuptools-scm", "mypy>=1.4.1,<=1.14.0"]
-+requires = ["setuptools", "setuptools-scm", "mypy>=1.4.1,<=1.16.0"]
- build-backend = "setuptools.build_meta"
- 
- [project]
diff --git a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.1.bb b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.1.bb
rename to meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.2.bb
index 4f9b09ef93..e62306fff3 100644
--- a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.2.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/ousret/charset_normalizer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=48178f3fc1374ad7e830412f812bde05"
 
-SRC_URI += "file://0001-pyproject.toml-Relax-version-for-mypy.patch"
-SRC_URI[sha256sum] = "44251f18cd68a75b56585dd00dae26183e102cd5e0f9f1466e6df5da2ed64ea3"
+SRC_URI[sha256sum] = "5baececa9ecba31eff645232d59845c07aa030f0c81ee70184a90d35099a0e63"
 
 DEPENDS += "python3-setuptools-scm-native python3-mypy-native"
 
-- 
2.39.5


