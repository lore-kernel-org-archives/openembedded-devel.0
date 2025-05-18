Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3C95C3ABD8
	for <webhook@archiver.kernel.org>; Sun, 18 May 2025 17:33:16 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.34297.1747589594446071729
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 May 2025 10:33:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RYzbnGIG;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-742c96af71dso650093b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 May 2025 10:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747589593; x=1748194393; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AZgzLQTiOtM36rGyAuBmrBd19mICcZA5uX+u/yNbbjg=;
        b=RYzbnGIG4/wEzEV/HqUkX7xUXQ0VfbR6v2a32h5N+NXglqgOjsFWL+lGF6qDuP0vTm
         4s38Sbyu2+BLSTqiC++S0L15BkTk082iY7X3Z7E5bmEPHmAzH3HAzRJyCbNx8mEDUWV8
         t4yeH+Uumkk8ZZ4PxUjdZ3DELeWQmDP8+7hkDbPupsQSuhj6urZXgsY1XyL2XM4D9W1d
         lE2VYjiXlg8qLjhgMLl4I/9SEEaB0Bu+emyJHFwwiEFF6IynzLBy6AlUt8LHWZoReqKq
         ImA+ak7cdxemAMByc9h5EMIeich/I85GUN9d8/u6IPaPhpE8xiYuvBi+fei5mgSpmf48
         8+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747589593; x=1748194393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AZgzLQTiOtM36rGyAuBmrBd19mICcZA5uX+u/yNbbjg=;
        b=UyLnr3FOUOEa0t0r4lN95mGGib3c7HPXLuwxnoo3Vngjd8B0YI5/WC02C7pUTws24x
         P52X5X30dbZMcqh+V4xZKDmQNLsUxrRf81T5ehn/c2r6SgXgCrIAnJo/oRIQLc3sCCYw
         Wee3KdINwk76PPwCvM8kq4U8ZCZJ+r+idleuWCan2bXxU2RmLxDEqfkyVqNVMiuaQh0C
         xi3/e0dx1FzxlPljEJG+g4rjO0Nm0Deb8FCkJhXNT192O1EDoeW7TPCTzhwZI/PRyFTX
         eG0aIRZPGznWofMazTqrn/IwX8yQd2fPQitc5qovpnuQtEiqHuUx7HT9Dg37PZtz8+h9
         B/hg==
X-Gm-Message-State: AOJu0Yxh304gYwkDJLYRVSUplsH5m/PFK1+mnpdI4MOtGd4dt0CYvqU9
	zP5gphZPyxGwsFBGprawsOk+TgcJdxqYCuyUtARCVdnwUHMLXHvYFumK/XwxrnNY
X-Gm-Gg: ASbGncvkzjviU9wJ4SB34INY0ixDxIqcKq3pwd4wwAv8/mK/QuIU8lIxLExwhvoT+Ps
	RkB71XBKN3sGQJ3C2ByGpSoelORbFplDOkemMgiyGw+qzqR9Y5BuQotlDRGn7x09VznvcpvKHIc
	9Kw7k4s1exAM0U9jax1po55Xh+50PemM1y9fVCLUDhxHuoVgXluiI16YMSXF1xbjB9P6WmTc5Wr
	jSf8FbZhAQtIsu1sWkOUVbdreUgpkW8sZdBtcPPkUQTcy4Vbm0OiXlsRqUE/TLlhyjMmGs/kB+V
	q3ZusjxcGNwWprjwzqezq4cksxWuxGo5A6OiYUCequE=
X-Google-Smtp-Source: AGHT+IEMySufQwoW0uwYnSbWe5EVkWuzLiJsCteU4UGsessDeOoxUbnTE2+jYLYGCyOxLBZ1Rqn5nQ==
X-Received: by 2002:aa7:9307:0:b0:73e:30dc:bb9b with SMTP id d2e1a72fcca58-742a978948dmr14767825b3a.2.1747589593529;
        Sun, 18 May 2025 10:33:13 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970bb2fsm4890177b3a.53.2025.05.18.10.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 10:33:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 3/4] python3-dbus-fast: Fix build with cython 3.1
Date: Sun, 18 May 2025 10:33:08 -0700
Message-ID: <20250518173309.3600728-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250518173309.3600728-1-raj.khem@gmail.com>
References: <20250518173309.3600728-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 May 2025 17:33:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117458

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...emove-upper-version-constraint-for-C.patch | 33 +++++++++++++++++++
 .../python/python3-dbus-fast_2.44.1.bb        |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-dbus-fast/0001-pyproject.toml-Remove-upper-version-constraint-for-C.patch

diff --git a/meta-python/recipes-devtools/python/python3-dbus-fast/0001-pyproject.toml-Remove-upper-version-constraint-for-C.patch b/meta-python/recipes-devtools/python/python3-dbus-fast/0001-pyproject.toml-Remove-upper-version-constraint-for-C.patch
new file mode 100644
index 0000000000..fb8f4df4a6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-dbus-fast/0001-pyproject.toml-Remove-upper-version-constraint-for-C.patch
@@ -0,0 +1,33 @@
+From 85189fb66d3abb2645605f8a3c14d8152ef755fe Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 18 May 2025 10:24:19 -0700
+Subject: [PATCH] pyproject.toml: Remove upper version constraint for Cython
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ pyproject.toml | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index e22ea42..f670d3d 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -50,7 +50,7 @@ pytest-cov = ">=3,<7"
+ pytest-asyncio = ">=0.19,<0.27"
+ pycairo = "^1.21.0"
+ PyGObject = {version = ">=3.50,<3.51", python = "<4"}
+-Cython = ">=3,<3.1.0"
++Cython = ">=3"
+ setuptools = ">=65.4.1,<79.0.0"
+ pytest-timeout = "^2.1.0"
+ pytest-codspeed = "^3.1.1"
+@@ -104,7 +104,7 @@ module = "docs.*"
+ ignore_errors = true
+ 
+ [build-system]
+-requires = ['setuptools>=65.4.1', 'wheel', 'Cython>=3,<3.1.0', "poetry-core>=1.0.0"]
++requires = ['setuptools>=65.4.1', 'wheel', 'Cython>=3', "poetry-core>=1.0.0"]
+ build-backend = "poetry.core.masonry.api"
+ 
+ [tool.ruff]
diff --git a/meta-python/recipes-devtools/python/python3-dbus-fast_2.44.1.bb b/meta-python/recipes-devtools/python/python3-dbus-fast_2.44.1.bb
index 95f1eafebd..f827d21bb2 100644
--- a/meta-python/recipes-devtools/python/python3-dbus-fast_2.44.1.bb
+++ b/meta-python/recipes-devtools/python/python3-dbus-fast_2.44.1.bb
@@ -3,6 +3,7 @@ HOMEPAGE = "https://github.com/bluetooth-devices/dbus-fast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=729e372b5ea0168438e4fd4a00a04947"
 
+SRC_URI += "file://0001-pyproject.toml-Remove-upper-version-constraint-for-C.patch"
 SRC_URI[sha256sum] = "b027e96c39ed5622bb54d811dcdbbe9d9d6edec3454808a85a1ceb1867d9e25c"
 
 PYPI_PACKAGE = "dbus_fast"

