Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C680CEFD1E
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 09:53:03 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2661.1767779577957188501
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 01:52:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=GGtX5U10;
 spf=pass (domain: konsulko.com, ip: 209.85.218.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b7633027cb2so347061866b.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 01:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1767779576; x=1768384376; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+n7h/YVB6Tlh42sPi9y+l4UjZeDPB0FmxwFbRliK4d8=;
        b=GGtX5U10yCFzWZnT2xsAaudbVuu+Y73W6QqKILRc+gPotgrYq3RrtxV92xKws9ur/s
         wI5NwKcDBtInOaOTLLHoY6NQN/nu6FZRM3yzwjWDKaXDMCwWJU2mHK4zfxJ6q6qdDgpy
         mHKK1HwUJ40pQJd2HU0MJ1i3kuLwbbjiubutQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767779576; x=1768384376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+n7h/YVB6Tlh42sPi9y+l4UjZeDPB0FmxwFbRliK4d8=;
        b=YbKULDHrhLjiurBrllWnr/wPbR2VdDFPGCPPjWfpU7ET1vf4REe+7T8usJrjUl9Okg
         nTVBrhkuqeuuC5QOpBfQ3VHDGfXpV/IKuR810p57AxMSOzRtqzTriAlP0ldEZ9b9RBGt
         NgYcxANpHXmhw8Gh9AcRU75KD68I3oKlOTdXHxUOJtNLB6UnH6P0P6EjIbDspEI1erZm
         Pl4vtZg/eMOc9opeZ5fHV8RVAh6YraXKJ4Y7gLNIRLF0toWfUUETG0u0j4CP/aIY59/u
         kZ7hz/UPxGPM93cXau4yCIgwJBhaPd40sLWt/FuEvYQZ2AXpZlh0ou1E4vTAINx0Psf/
         2Enw==
X-Gm-Message-State: AOJu0Yz3y70931GbhnkmTjcPn6ZYOtnndNJA2X0LF33qPgwD1JS5a5JM
	foUHiQYFZ10BKsSDfITAXqTAoezFcSrNacX2dV7GUTFGsnWeJo4Aj3Y4U+pGKVvDKSF+fyTfEy5
	tXEna
X-Gm-Gg: AY/fxX5ymBSUyK8nMQWmFZeMGDivZQw1u0f9Ecgfuehr0mDDpvtVgndMgrvjsWhHqYm
	80dNKPVF5OrxoTcihNOkV2cNIiwci2FfF9u2rKgO6dRKWFkrD3OHUk1Ufgq980/lnyDkphDMUQq
	xNsgLgsv1jtRJDjOOCVDt68g0Umg2g/qtUiXt/Zh3fl6edEafx6Wq4XXHRLpHMU8eN/5ilTYWkB
	chCVC5gWuPM7SGidvY2Sv//4nWCyWUdRwaHTzMUSMyozrcAxneyHH3ORWP60/nRyww9h+ltmQUF
	P1cWAIfBY28tyjJNVXoMe72s8p3G36EEp56yT79nCuvmQeozYQ/q8s0KHp6XXTOqHPcIM8FTpQp
	jjVJ+Bv6tA7C6Oqg82RQ7LAC5hH2phtkL5Pz8OTGvSOaLe7O/KIuTg6ie77ttubmJUl7gMa4Jb8
	m9nEqOTV4Lp1gRTRziZs90lOUb
X-Google-Smtp-Source: AGHT+IHlh1i9VfTicklcggBJQpGRaZ+yqMGPLBvLbcO1n3otuzcv52zdM6s0Eu4w81IOAiJPgI9cHQ==
X-Received: by 2002:a17:906:6a17:b0:b71:df18:9fb6 with SMTP id a640c23a62f3a-b8444d02d27mr200840166b.26.1767779576008;
        Wed, 07 Jan 2026 01:52:56 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b844e46ee63sm72327666b.15.2026.01.07.01.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 01:52:55 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/6] python3-astroid: Upgrade 4.0.2 -> 4.0.3
Date: Wed,  7 Jan 2026 11:52:48 +0200
Message-ID: <20260107095252.1351613-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260107095252.1351613-1-leon.anavi@konsulko.com>
References: <20260107095252.1351613-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 09:53:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123191

Upgrade to release 4.0.3:

- Fix inference of IfExp (ternary expression) nodes to avoid
  prematurely narrowing results in the face of inference ambiguity.
- Fix base class inference for dataclasses using the PEP 695
  typing syntax.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-astroid_4.0.2.bb => python3-astroid_4.0.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_4.0.2.bb => python3-astroid_4.0.3.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_4.0.2.bb b/meta-python/recipes-devtools/python/python3-astroid_4.0.3.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-astroid_4.0.2.bb
rename to meta-python/recipes-devtools/python/python3-astroid_4.0.3.bb
index 034d9c405e..efa59fc198 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_4.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_4.0.3.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "ac8fb7ca1c08eb9afec91ccc23edbd8ac73bb22cbdd7da1d488d9fb8d6579070"
+SRC_URI[sha256sum] = "08d1de40d251cc3dc4a7a12726721d475ac189e4e583d596ece7422bc176bda3"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3


