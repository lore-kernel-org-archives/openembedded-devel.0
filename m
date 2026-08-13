Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D275C5CFDB
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:08:57 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28079.1786651733494260667
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:08:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=p0HwGiSU;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cc61541f8cso18820065ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651733; x=1787256533; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o5aj+cc2lkHmYoSLojr1oqAMMuWuctHmX2pqiB7ojj8=;
        b=p0HwGiSUxbUqnvE52/shexj9r0muELVacipn1IhS2Mb0ckKvDHzrw6teB1dt+Jr4SA
         kNtRWwR4bww9HnyFDUWTTFfNy5KIcAgZ9yaZwEOsomCH4FfkuhgjHZxMprfnCGmnarxa
         rsOqk8y+mkw/V+y1KkJAlmXuVlrdUY6iQOr0oNMjI7lRlYa6NieHRnzPRek0Tgieprs1
         IRqmHgRATU/s8wm8KCuMT0Ddvs3Ek3+vrj08Vb2xm7xyxBTt62r+VBX3qRMsidcT/0fX
         YH0uzfVrp/QcnfFmfXYevVOyMEyE8D9D48qs068XBj43PuzgVUFg5wp4a8FtOBx50yR4
         BqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651733; x=1787256533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o5aj+cc2lkHmYoSLojr1oqAMMuWuctHmX2pqiB7ojj8=;
        b=b4qoJWn3MxUbVJVCBhRSEIFowhXUotz9mHyAnbK4W4qxPIqICfxtMSFs7F/xuJeZNv
         p/GIeSJ1jGHVkAJrQ4apra+y3YqnufNO294X9ZOEUpUGkdUWkecrZZR3H7k0BkXOBb4x
         QagFf/rT1GJvh3rrSf/mIbCpGSECfLLXjC3DBO+3iixz456gih3n+Ufxhg/SQ6dBrOKn
         OkgtxAVd+JWCqEZUh/vXMwh1BXOJlkgPMarL7Vp8/r3zuuhBX902BcwgbxIFJqRgbftI
         AsMZgf+om0/vbU7WHqAfstbSG+ZinBUcLMNHyHm8lmTgdLnl6j0BtB7HhuAoRYdSgDEx
         Qc6g==
X-Gm-Message-State: AOJu0Yyyygefcpx+5052dGGim+GwJMBqzkckZVuYWFgUTbxGIkryPL8J
	F/kG0SB6Y2sOwTYx1lJAPP1DC0TUlOafELuOLGNT8h4PR8YOPFsio0PY/thuEIxs
X-Gm-Gg: AR+sD12YDyJzK5ppi3xjqdew4mvL8FwVNpC4Y579Ny1SRVGDWzSHRn3ZNbIaa/MuRoC
	4bukHKZsN/VhilCBxj+yKfrwizj8uqVS2kFXCrTSIp8Vn5ND3kRa8+IW2KloiDRi1I83oLHrE1+
	MO7jEGVp/3EE4PybvUsXA+Jhm86AU+/Ikn5pH1c8Ll662rpp30urMMgR/CzXQ5LmRzE32etej0w
	HU9qYaFM/2qJPyCnWYPkCMYlaakQ9P26N9338C8PC2r5AXNojUCiMdShXLH5JG9UVWrVDyCzaIR
	XimAw1s0NdssR1tG8rxuytQHx1XqQhoGlmoa7pE4gM3Y4i0bh1eZqQiGPyhDQrF2qi2XAq5AAFQ
	JQg6ngDEoNrPqRJSJujSqMiuEoWm7lQx3fCm1vrCzoyPVr+M7Aoz1wRyHYPfjwIjXuHWnnMUWCk
	CQeglyzo1GrLPYQ2NfABmI+rhWOyPDAwKDa9nl+LTaqbQvQ5na8NRryeWgA3j/U9AFXJaYg2Nr3
	0PoMIHq+WUOmqKySvNiidrtLAVFs5wieZhaichG7CLYOSXOPDceC05swOQ6tDcF8VAJFYrcxHlT
	eaqdqUrL0LosjOVuWIRvPkD/KwDZ5mG1TUXq9+3LYSnBUzn+5+v7+hgo98e0Kk8bCjBN4IR2oPS
	U/cc8xdfzVfLgB8Te6WxKnRL7XbSj1UnRBFSKVLsbDvn21g==
X-Received: by 2002:a17:902:ccce:b0:2cf:6e5d:23e9 with SMTP id d9443c01a7336-2d37f7c2f0emr98639395ad.14.1786651732662;
        Thu, 13 Aug 2026 13:08:52 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:08:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 08/80] python3-async-timeout: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:07:22 -0700
Message-ID: <20260813200834.1302829-8-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:08:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128952

setuptools3.bbclass and python_setuptools_build_meta.bbclass no longer
add python3-wheel-native to DEPENDS by default, following oe-core
commit e546c697b7 ("classes/setuptools3: remove wheel dependency"),
since setuptools >= 70.1.0 no longer needs the external wheel package
to build a wheel.

This recipe's pyproject.toml/setup.py still declares wheel as a build
requirement, so pyproject-build's --no-isolation dependency check now
fails:

  ERROR Unmet dependencies (checked against .../recipe-sysroot-native/usr/bin/nativepython3):
  	wheel
  		wanted: any
  		found: not installed

Add python3-wheel-native to DEPENDS directly to satisfy it.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-devtools/python/python3-async-timeout_4.0.3.bb      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-async-timeout_4.0.3.bb b/meta-python/recipes-devtools/python/python3-async-timeout_4.0.3.bb
index 480d4cb02e..4606234be7 100644
--- a/meta-python/recipes-devtools/python/python3-async-timeout_4.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-async-timeout_4.0.3.bb
@@ -13,6 +13,8 @@ SRC_URI[sha256sum] = "4640d96be84d82d02ed59ea2b7105a0f7b33abe8703703cd0ab0bf87c4
 PYPI_PACKAGE = "async-timeout"
 inherit pypi python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 RDEPENDS:${PN} = "\
     python3-asyncio \
 "

