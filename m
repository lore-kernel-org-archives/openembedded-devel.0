Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63E35C0218D
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 21:58:16 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web10.6246.1738274288946839248
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jan 2025 13:58:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.180, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3a8160382d4so3432995ab.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 13:58:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738274288; x=1738879088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gY0oQGGjmmhtaRIsdkovRhsjMJ7RrCQ/hk8nxxMVeXU=;
        b=tajHlS3Da7KJwN/lua/1g2imUQ31oXqon9LCfGgBTtMKEIUislnECiZGFvTg5pjTiS
         7HnCeSkIKLUxi5QHKpgZKdgfpph1az82xjJX0OVhtx1lv3MdULKhMhHNPncjDwIVpHBg
         AtB4E+cLRmpRtrxZ8VWkQ/Kzfu3p4pJdZO2p2Oino8NNVBLBKRY1m5bQ8GDpv0lShBhL
         Z2hpxtwGw8o2pATgFVOjEONhXdjFDq23qLgx52tMN2E97LpORNRh30ii17j3ga/m4kGU
         6EAO7c+2LqK0bJUTdtT+LykYhXWmC9CfzqEiqaT7zUP+VS36funodpNKN8BV6WXF9ome
         6wmw==
X-Gm-Message-State: AOJu0Yzgf4xKUGLnM285qRPexOb/ozwg3jDWkfnMTvlQjOU1AsYBa2Dq
	76aPXxVGhI839nHwUSbeTn943nYTJuO2ipIonospKhHuYERnSXNDg7lMNkor8Xc=
X-Gm-Gg: ASbGncsFtmDhoaVO+3tvtL2Lq27lxBVnyJNT8FJIgHtC+VLfWiKg3Cf/9XTH5zd7wWY
	nf7P3vho/Q3yZDAeFPrIhe1DG3kCIEKwvow6lOVDPS/Hf+PFXTgQ3rkvrNFA9HgQL2g4anMlS8A
	KvgDIDJyqcBl8FReFXfjV8ZJiWxLpLFx17g4VLy3a2VbWKAQUXgW4DF4cT78FhkptB7Ba+bJwgp
	iBu3Vqpg/QNBkYTXRgpIrE6ot0W7gyALNx6Gs0NRPyzAWRlAMAwBk9uRL+Fk1IwE8+aaogRAXnz
	Nr4No60om7OPTmiVDSH8LZK4Bj9SGCO3hY1BUXEJJqOLcCWi40LQuE2kRP8R
X-Google-Smtp-Source: AGHT+IHfvGaV/F/634wpK7398gJEj5W2hub8gwXM7fwpSJuiU+ALE6GsOK8r2uRLnsVB4c2VkX+SHQ==
X-Received: by 2002:a05:6e02:2149:b0:3cf:cbac:3ba6 with SMTP id e9e14a558f8ab-3cffe37cef5mr83183275ab.5.1738274287794;
        Thu, 30 Jan 2025 13:58:07 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec746e3e63sm519071173.144.2025.01.30.13.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 13:58:06 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 04/23] python3-outcome: update recipe to use the ptest-python-pytest class
Date: Thu, 30 Jan 2025 21:57:19 +0000
Message-Id: <20250130215738.3280576-4-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130215738.3280576-1-derek@asterius.io>
References: <20250130215738.3280576-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 21:58:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115158

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-outcome/run-ptest                |  3 ---
 .../python/python3-outcome_1.3.0.post0.bb           | 13 +------------
 2 files changed, 1 insertion(+), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-outcome/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-outcome/run-ptest b/meta-python/recipes-devtools/python/python3-outcome/run-ptest
deleted file mode 100644
index 8d2017d39c..0000000000
--- a/meta-python/recipes-devtools/python/python3-outcome/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-outcome_1.3.0.post0.bb b/meta-python/recipes-devtools/python/python3-outcome_1.3.0.post0.bb
index 9714301879..308eb78a79 100644
--- a/meta-python/recipes-devtools/python/python3-outcome_1.3.0.post0.bb
+++ b/meta-python/recipes-devtools/python/python3-outcome_1.3.0.post0.bb
@@ -7,16 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fa7b86389e58dd4087a8d2b833e5fe96 \
 
 SRC_URI[sha256sum] = "9dcf02e65f2971b80047b377468e72a268e15c0af3cf1238e6ff14f7f91143b8"
 
-inherit pypi setuptools3 ptest
-
-SRC_URI += " \
-	file://run-ptest \
-"
+inherit pypi setuptools3 ptest-python-pytest
 
 RDEPENDS:${PN}-ptest += " \
-	python3-pytest \
 	python3-pytest-asyncio \
-	python3-unittest-automake-output \
 	python3-outcome \
 "
 
@@ -27,8 +21,3 @@ RDEPENDS:${PN} += " \
 	python3-pytest \
 	python3-typing-extensions \
 "
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-- 
2.34.1


