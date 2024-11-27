Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5C84D66BA0
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 11:26:39 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.69764.1732706782114306711
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Nov 2024 03:26:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=pNMnRGTz;
 spf=pass (domain: konsulko.com, ip: 209.85.128.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-434a099ba95so26000815e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Nov 2024 03:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1732706780; x=1733311580; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QSKMZTS8YP1CYNytzjoitMGvLT0CsNVJdOf5yi8ZF44=;
        b=pNMnRGTzhTf0UKw8wXKcST9d03+8V8dx5ywd8K0MuXpzmTocWBMg/w5NtNlgSuo7Pp
         pL5BIBIWV/NzaMX5rvRaV24ZFZrWV9I9toipCmdjIPNxAV8e69fwHubwTGeSDWyFmyIy
         EUpY6CNHiuBWVtrAPt2ress7fj80txi8+b9W4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732706780; x=1733311580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QSKMZTS8YP1CYNytzjoitMGvLT0CsNVJdOf5yi8ZF44=;
        b=u3rdcSMVEVm20dKH7fbjqkW8IItb+9CJTnrqf2A3CZby7naKpyhkGuh1ydEY9gJ8iz
         s+uIxI2b7g0e1tWcRgAc4cZwARYu5V2nfcve1VOpwVHHZlBAUWL/rPh4Nt5bAMrRR8F1
         u33hzPvq6vU3S9B0nO2WYZCkJpyK6hnJka+1NPvnAQpI4s/YNg/+nwJOBhYp6vdQ89WW
         Q4DnYw9ymi+N4Kp7DU6AZvVCf6Z2tdje4al9SJAnHTHsMIFoiHRpwRyk1z2rW8SSodiO
         82YLDSIQMPw40hvo41mpDjN9axrUqfjCmgoEfYiLVgwybSW2rml1QoQPEGK5V5FJBjFz
         IZSw==
X-Gm-Message-State: AOJu0YzvgPl/RfC5DDLt0/5r/jmBMluRE2o3Jj1T6X/KHq/2TxSVmhrt
	QINsVyoDE2q1PRf1s93haiF29S/GbwDRt3HhgLD7giNjXSrlmAWASKZyng51jqNm3iEf0jZgcyy
	p
X-Gm-Gg: ASbGncvVCtvWFJh/RUyJYyUCadsy+5RycdkFrxqK0pjJ5p5+yh9YXhsAA3BfYHBcDKX
	Pa6/VkomhYwsoYiLy8BZ8Z0VCj53uOGCXLN9QE1wZHm7MNLpR/oSIBqyKnBSHX7tbQ6+wq2fRJT
	tEKLp4hlFarhjaIN5yjx/wmsDGb6g/yu4n52ihELZq17LLMKDowoacdU1CUv9WX8ozNl2yTWZ1b
	ULQKRBsgGYwEy8ZfxiKqQKEyUgwoeKBQnpvQ4fo9AHSGvp+3+uBEpDxlHIGUik6
X-Google-Smtp-Source: AGHT+IGUu/foqGrtn6yPetG2nxSxPJ+bvfW1nev3oSEw0B+tjocYAq7nw1cZuv526w/N4FcTRgc/PQ==
X-Received: by 2002:a05:600c:1d1e:b0:434:a504:7a51 with SMTP id 5b1f17b1804b1-434a9de54f8mr20160185e9.21.1732706780247;
        Wed, 27 Nov 2024 03:26:20 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa7e5b9csm17951645e9.43.2024.11.27.03.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 03:26:19 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-pydantic: Upgrade 2.9.2 -> 2.10.2
Date: Wed, 27 Nov 2024 13:26:13 +0200
Message-Id: <20241127112617.789120-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Nov 2024 11:26:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114087

Upgrade to version 2.10.2:

- Only evaluate FieldInfo annotations if required during schema
  building
- Do not evaluate annotations for private fields
- Support serialization as any for Secret types and Url types
- Fix type hint of Field.default to be compatible with Python 3.8
  and 3.9
- Add hashing support for URL types
- Hide BaseModel.__replace__ definition from type checkers

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pydantic_2.9.2.bb => python3-pydantic_2.10.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic_2.9.2.bb => python3-pydantic_2.10.2.bb} (96%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.9.2.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.10.2.bb
similarity index 96%
rename from meta-python/recipes-devtools/python/python3-pydantic_2.9.2.bb
rename to meta-python/recipes-devtools/python/python3-pydantic_2.10.2.bb
index 9f1c964e49..bfc658e38a 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.10.2.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=09280955509d1c4ca14bae02f21d49a6"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "d155cef71265d1e9807ed1c32b4c8deec042a44a50a4188b25ac67ecd81a9c0f" 
+SRC_URI[sha256sum] = "2bc2d7f17232e0841cbba4641e65ba1eb6fafb3a08de3a091ff3ce14a197c4fa" 
 
 DEPENDS += "python3-hatch-fancy-pypi-readme-native"
 
-- 
2.39.5


