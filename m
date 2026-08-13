Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78D38C5DF6A
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:08:57 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28077.1786651730446302022
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:08:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eoufkail;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so247566a91.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651730; x=1787256530; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b9wk4p6aZtIjXEcUSh/B6/7Q93KQpwswXSfn3eml5Fc=;
        b=eoufkail/lBtonsU3h5T8Wk65sxbJqDh8n0QZU3ihZJE2uqDtHs9ywIHI154ZGxqLb
         m+LIE5kFVhCnfLdhCYA7XWiyMLtlq4uI2PV1yku5Saso998DRdKeFlDVHcPxjeZqnnye
         /lOmcPCnuaCzfe9yeaVwzCN3DJWE75NX6R0Lfqy2sEnG/JEYsEF8UYsE4hud7HSMcoNG
         LAoG70nk5u5+z2ykM4cR0uNWcmRBsSeCApXRHaUAkCzbikgXLdMvDrjesX/DDnVj/01R
         Uw93RuA6MedxN0FX29ew1U0EnJX4KJjegvs6q/6f+bTNRQlFF+DCq5UgMbj6YAxVMCUj
         c5PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651730; x=1787256530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b9wk4p6aZtIjXEcUSh/B6/7Q93KQpwswXSfn3eml5Fc=;
        b=OoG8aZnPzWgo5ViHpnyS5yt04GtE3Mme32BEzsiwicR4gpsgfst0slQTTJ5qQmyX/C
         2qYUyeqzmkSQqLlq3014EbDavIWuyIppjBl0tACyejYcKF7d8gKONdW6TCXWJYvIDa/y
         Hbg1nXpG3PacrHcHodbRYX2VZa0vkxB0HLOUbXM5vYOxcHAF/LRCYMpZ0bXJQ2WrWyPj
         n7UK1imPi1V1NsjYWXRFQ8Mw2mfujeRO1fFpygtUDk4eNXCW2WUUAs8gW/Xyz5m3Yq2/
         I1cWKslMCFU3DTRjkKW+D7YvErTfZvvjdq6gRXmXdYkPaCX+W9+u7ttlkU6P6H+zAcW1
         1u2Q==
X-Gm-Message-State: AOJu0Yw6yZI/LCLf+j0IMJh6pmF6WtCiwJQOcAPFXbFRgC+DQo9M8xpz
	1tHfgnXGTHlv4C3eEBYYcdTSCWIIV2zstAx7Ii6ZA0+TJPf+9/8SerUB7303rIzL
X-Gm-Gg: AR+sD10AEGJ5ZgV6w0KULnercgs88hp/1rRryhxP5LgEV9GiSMheiatIMaE8WfiRGtz
	MotWwfnx/fnNJFoU2fSje+PS40kLhuRyb7gBBzqqdPZm0f6x/RODx6K1N5QUzyERCHWBfEIKdO9
	VhrJkOM56sTb2TdrgkzcD5Klb0TF5/3QW7b5v/Nc1h+Cy3SxcPFOGMJE/geSuEn+YHMCKGUWdBs
	Mv5UfCNesmOIhlPMek4ZZLIWRxZ8AmO2jT7hgNd+cEfTB1vIJgQqyohG/4N2gZSkydD7ZrxZuod
	3F1ounDg5rQo9k1gfEnqvyfyLaW+tTfU++DGHGrROpln/tc8L4846OhFy80XXHCH6wmc0QGGLj4
	mofzae4FRfhHc6D50oPuz0TUXPN62jpUqMtaT7gu2Yy5/ZOAbPOz7q5WUYr8Vh5fcVkEnJiytCQ
	jUadgw4F9WOlHY1iI2SBanroDktyavtWZCco5LOnIqxyBdbQvDlgFuQNr1bUZTQl+NyMzjcdbXr
	XjInvLXxnWrfXZPO80dU/+d8SV4IdtWCH6Of1oZgtjE5ipTJyf4pOof0lrq13LuliYm28xCT5bm
	LLqJmOWriRnnj6dlqAvAuCO6ThfvgfMQ+2lnSCCVC5B+Nqw43zDN7L+9xkDkfD4yTrd0cYrWPrJ
	0ElMWIiEr2oJCYzDql/ZizySTcYCR2+mpxB62pD/hFeaTpQ==
X-Received: by 2002:a17:90b:5884:b0:38f:efed:5445 with SMTP id 98e67ed59e1d1-3933b7c3b7cmr668639a91.4.1786651729684;
        Thu, 13 Aug 2026 13:08:49 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:08:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 06/80] python3-thrift: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:07:20 -0700
Message-ID: <20260813200834.1302829-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:08:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128950

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
 .../recipes-connectivity/python-thrift/python3-thrift_0.24.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.24.0.bb b/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.24.0.bb
index 5f2bdc6e53..911ab1ddc6 100644
--- a/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.24.0.bb
+++ b/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.24.0.bb
@@ -6,6 +6,8 @@ SRC_URI[sha256sum] = "9ef601c49e988475ff0e741d8e1b45feec23b48514e524341efc274191
 
 inherit pypi python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 # Use different filename to prevent conflicts with thrift itself
 PYPI_SRC_URI:append = ";downloadfilename=${BP}.${PYPI_PACKAGE_EXT}"
 

