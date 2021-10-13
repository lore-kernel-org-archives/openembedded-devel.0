Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CBDCC433F5
	for <webhook@archiver.kernel.org>; Wed, 13 Oct 2021 15:27:26 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.9855.1634138845911633200
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Oct 2021 08:27:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PxMB2RzV;
 spf=pass (domain: gmail.com, ip: 209.85.210.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id y7so2776139pfg.8
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Oct 2021 08:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SUzxthjrNUTOuWia2wHm4j7IatQjHBRbgnoKq14e874=;
        b=PxMB2RzVo1+6maYlrZIJdvBbCwdFDPtOVMerHfoxhp4903jRsYR82XBlca8u3AyDz+
         gLjJIp03NXEuaWSIAZrOnTjOLK014dkprcPMPxtrow6RD3YO9iA8XSlVg94zStqv8nHU
         DJrI/klvejoP053p5nA4LlJb9Z3pODThcbmTNycEPxcq49Y9WxoAZyGbJF3MqGD9HSTH
         wdTmTZ2jV8hmnNDbxUlcOeDxXkOfiq7j43y9q1dkXZpLtTjqtxczwqN5OXKjN14pPDh4
         MyYgNW3D5CU1fE0JpHzy8POSnbmAXu8ATc/G0/kvbVq5oFPy5cFmSo7r3eQRHZ91BKkT
         tQ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SUzxthjrNUTOuWia2wHm4j7IatQjHBRbgnoKq14e874=;
        b=eU93tky+GgPxNXA0NnLfZd4UuWmig6qvELKihAxXKHDfHwA6/9dLu4L6nfg6n2JVTB
         HGAZoVlUgS/MVZFrxfasoUtPlUplGI1d4PRt0PPvT5jNm49bh6hhbwefCfpXD9jx2EPq
         gKDg7hxuV83kYCqlyqVfhsOD9XpL0OolKlSTBq60pL5ZX0kzcTf+h7eFBdK4WU/xt4c3
         jjeLH+LaUXNf/ElC9zHdyzCp31vXaje4XV47IKYPcWKNxkMjKx53SYkbRd2dcx+b+rkn
         ViVOgGgpwCX3aqnZ03pSnNWrADQYsUhZqBCtNGvriPw7JKFbxknYJgIr/ZZSe0cd36rs
         daww==
X-Gm-Message-State: AOAM531blD7FBb5C06ySbS10O+TEqBBlG45JhatGRBa/qRucPI6VD9Ls
	2sPR1tdXFKlrvk3Jk4Cct1VYUbWnhLI3Ug==
X-Google-Smtp-Source: 
 ABdhPJxjmAsas0I95aTb9l7kD1lBgBkYUzAWzMlkguM/Dt1PKifwSiePdAUgymInkmaodTj0enNnSw==
X-Received: by 2002:a63:2a07:: with SMTP id q7mr28071989pgq.221.1634138844915;
        Wed, 13 Oct 2021 08:27:24 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ba74])
        by smtp.gmail.com with ESMTPSA id
 h4sm14830856pgn.6.2021.10.13.08.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 08:27:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/2] python3-anyjson: Do not enable 2to3
Date: Wed, 13 Oct 2021 08:27:20 -0700
Message-Id: <20211013152721.978756-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Oct 2021 15:27:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93280

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-setup.py-Do-not-use-2to3.patch       | 29 +++++++++++++++++++
 .../python/python3-anyjson_0.3.3.bb           |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-anyjson/0001-setup.py-Do-not-use-2to3.patch

diff --git a/meta-python/recipes-devtools/python/python3-anyjson/0001-setup.py-Do-not-use-2to3.patch b/meta-python/recipes-devtools/python/python3-anyjson/0001-setup.py-Do-not-use-2to3.patch
new file mode 100644
index 0000000000..2b9e6e52e8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-anyjson/0001-setup.py-Do-not-use-2to3.patch
@@ -0,0 +1,29 @@
+From 4fb61d7c621599b0db9c2c45f4243f07936c5953 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 13 Oct 2021 08:20:00 -0700
+Subject: [PATCH] setup.py: Do not use 2to3
+
+This helps compiling with setuptools 0.58+
+and it seems to compile fine with python3
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ setup.py | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 9fe4902..f2098e1 100644
+--- a/setup.py
++++ b/setup.py
+@@ -2,8 +2,6 @@ import os
+ import sys
+ 
+ extra = {}
+-if sys.version_info >= (3, 0):
+-    extra.update(use_2to3=True)
+ 
+ try:
+     from setuptools import setup, find_packages
+-- 
+2.33.0
+
diff --git a/meta-python/recipes-devtools/python/python3-anyjson_0.3.3.bb b/meta-python/recipes-devtools/python/python3-anyjson_0.3.3.bb
index 07cc99860d..2b8abb8b80 100644
--- a/meta-python/recipes-devtools/python/python3-anyjson_0.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-anyjson_0.3.3.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=989aa97e73c912a83a3c873fa11deb08"
 inherit pypi setuptools3 ptest
 
 SRC_URI += " \
+	file://0001-setup.py-Do-not-use-2to3.patch \
 	file://run-ptest \
 "
 
-- 
2.33.0


