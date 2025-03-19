Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5B7CC36000
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 08:21:19 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.3008.1742372477292939526
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Mar 2025 01:21:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=RIKIa8w4;
 spf=pass (domain: konsulko.com, ip: 209.85.208.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5dc89df7eccso10836764a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 01:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1742372475; x=1742977275; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=chqOiRXeP3USPFyhzCXm32KhYoiXfeRQC+KIYHlQdHI=;
        b=RIKIa8w4tPQe4RdCqU+JW1F3C+Z4SFjULOZQ2+HIcnoO3qbDp2t6w66aBOpC1OHFKa
         vMzijI6c/sT9rOKAZ9v1p+323efZWGcvRk5pOAlqoWJz1zoIkhupgzpXmz0YntCnEKS8
         Rhi+odgVl3S5k/XZ7h1EFIdNlpwjkL+BTuipc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742372475; x=1742977275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=chqOiRXeP3USPFyhzCXm32KhYoiXfeRQC+KIYHlQdHI=;
        b=GZgMupFC/laC+uQPcUUgKw/kwrx8AjbeLex1mL1QL97X708px7l7WhhcPFi42474Qk
         XNzsSPSaRalmZeS4dfoFt03DDwEsH9rR4/g/s/ezQ517b/zw+iRW6qMVOfRY1tl0nshJ
         /fhAgZi6bVbhYzyx35L1l9vxk/nZrJppkkCcx+AzJzEQHnnAgLvy8OqgeCMkh+OEPrIb
         gS2/1SUdIHbF8WYOxUY3uQI0ATyfYVJouq2G6Px1rvZI9RJNCz0K8+SPSkOrSqXEmtpG
         HF0Ymy+yCk3679TQHfghlJSmNpC4O2cbd0YJP9A7CT6pRqInIve62MzNkb5LW/6I77qC
         DiGg==
X-Gm-Message-State: AOJu0Yy3aDXUxeUMPCmmQd5uSY2UyJanx8NvN7uKuCY1I1lysEtPnAnZ
	H5ogoqS4RefT4/K/kqsqb1r1qPGfqafwU/jE423JN7bAQMq3dN/eUVv5cYgN9/k+6+53L3Q5ROY
	Y
X-Gm-Gg: ASbGncsAmH2lZst8GSTo4G53T6zzgwFv7OtUxA2o2W6F+fmURipPROOwcjDjr4LDt3O
	V0jG+wQRv/ZwucnBmHaMngOlyKVm9HZn1WjboN8LCZdEKa8M/aZc620Q/UxiYLzvE4gxM++8yRA
	it016WF66uU7eXE4sPg/HhjjFw++krrTa6ndzaQTTSvXTLDxMNCCmEbndRpB6fWUB04MoBXoMyF
	WrlquFvIhFbXWh2WUfC2sDfI940dI8fJ5K7ViRB1uaWLLJ/xVEC9kyxzANHJ9s2FFRVLv1odFr9
	HeMONBMbY4lWirYqiIAc/hxRyZBuGvxCJB6QQAKGen+p2J5Lfl0Rks+WKqwAvRsySCMFrw==
X-Google-Smtp-Source: AGHT+IEs1MxJjhO26HuYeTneJbLAZEptGulHRVqbQC5x7niZPo/VW0a+aq06hKEnCWWse9vBXmDf4w==
X-Received: by 2002:a05:6402:1ece:b0:5e5:b388:2a0e with SMTP id 4fb4d7f45d1cf-5eb80cdca41mr1787683a12.7.1742372475216;
        Wed, 19 Mar 2025 01:21:15 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e8169b04dasm9035761a12.37.2025.03.19.01.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 01:21:14 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-qrcode: Upgrade 7.4.2 -> 8.0
Date: Wed, 19 Mar 2025 10:21:10 +0200
Message-Id: <20250319082110.2907028-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250319082110.2907028-1-leon.anavi@konsulko.com>
References: <20250319082110.2907028-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 08:21:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116067

Upgrade to release 8.0:

- Added support for Python 3.11 and 3.12
- Drop support for Python <=3.8
- Change local development setup to use Poetry
- Testsuite and code quality checks are done through Github Actions
- Code quality and formatting utilises ruff
- Removed typing_extensions as a dependency, as it's no longer
  required with having Python 3.9+ as a requirement
- Only allow high error correction rate (qrcode.ERROR_CORRECT_H)
  when generating QR codes with embedded images to ensure content
  is readable

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-qrcode_7.4.2.bb => python3-qrcode_8.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-qrcode_7.4.2.bb => python3-qrcode_8.0.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-qrcode_7.4.2.bb b/meta-python/recipes-devtools/python/python3-qrcode_8.0.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-qrcode_7.4.2.bb
rename to meta-python/recipes-devtools/python/python3-qrcode_8.0.bb
index 49cf62860e..dcd92cfe9d 100644
--- a/meta-python/recipes-devtools/python/python3-qrcode_7.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-qrcode_8.0.bb
@@ -3,9 +3,9 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4b802d2a65df4626623c79757f486af9"
 
-SRC_URI[sha256sum] = "9dd969454827e127dbd93696b20747239e6d540e082937c90f14ac95b30f5845"
+SRC_URI[sha256sum] = "025ce2b150f7fe4296d116ee9bad455a6643ab4f6e7dce541613a4758cbce347"
 
-inherit pypi python_setuptools_build_meta
+inherit pypi python_poetry_core
 
 RDEPENDS:${PN} = " \
     python3-six \
-- 
2.39.5


