Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49DF4C04AAD
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 16:30:44 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web11.44853.1695227439774087056
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Sep 2023 09:30:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-7928ba24936so2356139f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 09:30:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695227438; x=1695832238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JKcrnfhhxsqfJl1y775VEaDUJl1Iki9DcjvMjMau8ko=;
        b=ug572j/XfjvhvcCGlIi8tGe4AuxC7bVUDwNW+yN5WhCXAawo5h23+tpIWT/d6clbqp
         fLlwHUc4S8gLrukWTIgnAkm7fqPpj7bDzNLbO/kY5NZdG9Xf6AXLiLASOysEASOhJUIz
         ZyVi1pNt5jWuVEBrusJB/BBAWfIvIPa7Z7sjUa+kp/x2Ao0tNfpMdbbBKcx6rRYy92xN
         LaKq/XcQhWtThPPeDo10y+MM+iBBcUc/voBiWPj3B3DDoCg0/XrjhCtjCuT8PwB9zakB
         9z3EcLcscNfLZllk9xFvUN07YRTD304dYiWJSGMd4DebHa6aW2BJZIkJzi8av5TfkvRT
         qMeA==
X-Gm-Message-State: AOJu0YwUX/Fmrkh4FNRkgKH/Jx+0ZdforFAhK4LtomRx4LWbjRmvJQZG
	Z2W6f0vS7JC54WfuQ+SBbjWgUqsgzU/sQA==
X-Google-Smtp-Source: AGHT+IGCtkT6vB+r27r0nJcKL9LNvaKurXS9+yG29g5LFo0sPufZostj6Da5aa/KKjYO4cziIOqrLg==
X-Received: by 2002:a5e:c301:0:b0:784:314f:8d68 with SMTP id a1-20020a5ec301000000b00784314f8d68mr3373924iok.1.1695227438275;
        Wed, 20 Sep 2023 09:30:38 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id y7-20020a6bd807000000b0077e35ffac2fsm4028215iob.32.2023.09.20.09.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 09:30:37 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-bleak: Update receipe 0.20.2 -> 0.21.1
Date: Wed, 20 Sep 2023 16:30:20 +0000
Message-Id: <20230920163020.1237099-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 16:30:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105016

Removed a patch the no longer appears to be needed and dropped support for python 3.7

Changelog
=========
0.21.1 (2023-09-08)
Changed
Changed dbus-fast dependency to include v2.x. Fixes #1412.

0.21.0 (2023-09-02)
Added
Added bleak.uuids.normalize_uuid_16() function.
Added bleak.uuids.normalize_uuid_32() function.
Added advertisement_data() async iterator method to BleakScanner. Merged #1361.
Added type hints for kwargs on BleakScanner class methods.
Added support for Python 3.12.
Changed
Improved error messages when failing to get services in WinRT backend.
Improved error messages with enum values in WinRT backend. Fixes #1284.
Scanner backends modified to allow multiple advertisement callbacks. Merged #1367.
Changed default handling of the response argument in BleakClient.write_gatt_char. Fixes #909.
Bleak recipe now automatically installs bleak from GitHub release in Kivy example.
Changed BlueZManager methods to raise BleakError when device is not in BlueZ.
Optimized BlueZ backend device watchers and condition callbacks to avoid linear searches.
Changed type hint for buffer protocol to collections.abc.Buffer.
Fixed
Fixed handling all access denied errors when enumerating characteristics on Windows. Fixes #1291.
Added support for 32bit UUIDs. Fixes #1314.
Fixed typing for BaseBleakScanner detection callback.
Fixed possible crash in _stopped_handler() in WinRT backend. Fixes #1330.
Reduced expensive logging in the BlueZ backend. Merged #1376.
Fixed race condition with "InterfaceRemoved" when getting services in BlueZ backend.
Fixed missing permissions and requirements in android Kivy example. Fixes #1184.
Fixed WinRT backend sometimes hanging forever when a device goes out of range during connection. Fixes #1359.
Removed
Dropped support for Python 3.7.

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...001-fix-poetry-version-compatibility.patch | 23 -------------------
 ...leak_0.20.2.bb => python3-bleak_0.21.1.bb} |  6 +----
 2 files changed, 1 insertion(+), 28 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-bleak/0001-fix-poetry-version-compatibility.patch
 rename meta-python/recipes-devtools/python/{python3-bleak_0.20.2.bb => python3-bleak_0.21.1.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-bleak/0001-fix-poetry-version-compatibility.patch b/meta-python/recipes-devtools/python/python3-bleak/0001-fix-poetry-version-compatibility.patch
deleted file mode 100644
index 051ebbe67..000000000
--- a/meta-python/recipes-devtools/python/python3-bleak/0001-fix-poetry-version-compatibility.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Upstream-Status: Pending
-
---- a/pyproject.toml	2023-04-19 19:04:47.159474100 -0300
-+++ b/pyproject.toml	2023-05-04 08:08:12.289941765 -0300
-@@ -31,15 +31,15 @@
- bleak-winrt = { version = "^1.2.0", markers = "platform_system=='Windows'" }
- dbus-fast = { version = "^1.83.0", markers = "platform_system == 'Linux'" }
- 
--[tool.poetry.group.docs.dependencies]
-+#[tool.poetry.group.docs.dependencies]
- Sphinx = { version = "^5.1.1", python = ">=3.8" }
- sphinx-rtd-theme = "^1.0.0"
- 
--[tool.poetry.group.lint.dependencies]
-+#[tool.poetry.group.lint.dependencies]
- black = "^22.1.0"
- flake8 = { version = "^5.0.0", python = ">=3.8" }
- 
--[tool.poetry.group.test.dependencies]
-+#[tool.poetry.group.test.dependencies]
- asynctest = { version = "^0.13.0",  python = "<3.8" }
- pytest = "^7.0.0"
- pytest-asyncio = "^0.19.0"
diff --git a/meta-python/recipes-devtools/python/python3-bleak_0.20.2.bb b/meta-python/recipes-devtools/python/python3-bleak_0.21.1.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-bleak_0.20.2.bb
rename to meta-python/recipes-devtools/python/python3-bleak_0.21.1.bb
index 9b81efe40..da7bce415 100644
--- a/meta-python/recipes-devtools/python/python3-bleak_0.20.2.bb
+++ b/meta-python/recipes-devtools/python/python3-bleak_0.21.1.bb
@@ -3,11 +3,7 @@ HOMEPAGE = "https://github.com/hbldh/bleak"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bcbc2069a86cba1b5e47253679f66ed7"
 
-SRC_URI:append = " \
-    file://0001-fix-poetry-version-compatibility.patch \
-"
-
-SRC_URI[sha256sum] = "6c92a47abe34e6dea8ffc5cea9457cbff6e1be966854839dbc25cddb36b79ee4"
+SRC_URI[sha256sum] = "ec4a1a2772fb315b992cbaa1153070c7e26968a52b0e2727035f443a1af5c18f"
 
 PYPI_PACKAGE = "bleak"
 
-- 
2.34.1


