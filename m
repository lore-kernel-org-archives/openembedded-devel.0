Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4314AC369D5
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 12:17:09 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.46710.1745842625204142646
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Apr 2025 05:17:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=GQjdhoLJ;
 spf=pass (domain: konsulko.com, ip: 209.85.218.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-abec8b750ebso785207266b.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Apr 2025 05:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1745842623; x=1746447423; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=avPiURClsz1yMMr9jYChswD9V7vw4qZR5y+sVGWIKuk=;
        b=GQjdhoLJPhgrsLj+a/S8oW1xrZJdkvvXsMNvWvvn5CWQqm1Smn/pCEmehCaJZDcZLA
         +aZvSPD06ZTc+QymNYdBLd8WP+Y6P7Ab0B57m6FyWwUt4xIV49j7hFHTrSVk0gG3hgwJ
         LzedAeKiQoRVN8TzcRZIKMORNah4ZvIFIWeaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745842623; x=1746447423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=avPiURClsz1yMMr9jYChswD9V7vw4qZR5y+sVGWIKuk=;
        b=GdcKwOgvOX/vR9/bv5GIm2H2p4x70/l5e3SzQ8HRe4xFAxRMt8scdv9jujRfLgWWDq
         FgpHqQoGWd/POSgkYo7R0LiTviRYkdKdUsLKKTVRwKUAzoRakTwIu8Yw/2D5r3GUdc8f
         w8C/IbYX2yUmHPIshlrBuNTD+4Si0LH3xu90E4cgAQ7wE4tc6eoZgqPkfB0Md8e9zhCm
         v4IPCC+wJSJUHeCyvaX0hKbC2wn2eUTOeiE5bSVE88SZCBkigi+A9JWgjZEo8fHg5KmH
         gP4lAB3YErb6P2cwg5orSZujoqs2/RdphZ/wy2/iOKDXcmsvsoeS77+fL/4GGYzTGUnV
         SNgw==
X-Gm-Message-State: AOJu0YxSVRPZSy+zakEVSQI8EKfx1i84f0QM8uOyUafe24E/KyhnsJUI
	zTTyTWTe8T8OwFIDykPgllWe6oOFEHdi+GdI6eqslMCdk6u1Rf5YkhdkntImUgsxjvR/+CYjOiq
	J
X-Gm-Gg: ASbGncv04Z8E4uwDgNbMAGnHEGnoI4tYo81xyOU+xNaWaIcnmdtU1fTsgDuSfTg3kvY
	NeGW0zNQadBJ3LWbCxfPxLxGxC7tm1psUpwnfxvb4AOWM/02FCIKbAXKi1YVcbAXMw7H0sKzt6R
	bYxJZxTtsv2StENQRRxkeeM1n3pq6udaHkIIqSmhRwohOhfS64lfxHZxK5+jo5byGORYheEOD4b
	hhooRZuTjOZFFdkkiSqZPz2LGer2L4gcghsfL1UXxpsB5zMTsvir2g+mOI4j/jbvuXQFxAurIVA
	rBkAeB2bLNc26uPsDUc/eHIOxHKC9JkGRgN7ubGxxRhn4NgVp8z07WHYX0O9IYKI3A==
X-Google-Smtp-Source: AGHT+IGLbGRKoUewUIx7HraHQ9nKNWQAMHANV9jBa4xxZs2fSNpQpB2zoLPNhKTsJqtMUo1cGTvhoA==
X-Received: by 2002:a17:906:6a13:b0:aca:b720:f158 with SMTP id a640c23a62f3a-ace7108a282mr1025004666b.13.1745842623386;
        Mon, 28 Apr 2025 05:17:03 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed705fbsm620584666b.149.2025.04.28.05.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 05:17:02 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-httpcore: Upgrade 1.0.8 -> 1.0.9
Date: Mon, 28 Apr 2025 15:16:58 +0300
Message-Id: <20250428121658.2368361-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250428121658.2368361-1-leon.anavi@konsulko.com>
References: <20250428121658.2368361-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Apr 2025 12:17:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117193

Upgrade to release 1.0.9:

- Resolve GHSA-vqfr-h8mv-ghfj with h11 dependency update

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-httpcore_1.0.8.bb => python3-httpcore_1.0.9.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-httpcore_1.0.8.bb => python3-httpcore_1.0.9.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-httpcore_1.0.8.bb b/meta-python/recipes-devtools/python/python3-httpcore_1.0.9.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-httpcore_1.0.8.bb
rename to meta-python/recipes-devtools/python/python3-httpcore_1.0.9.bb
index a4c9166639..d8f8400006 100644
--- a/meta-python/recipes-devtools/python/python3-httpcore_1.0.8.bb
+++ b/meta-python/recipes-devtools/python/python3-httpcore_1.0.9.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=1c1f23b073da202e1f4f9e426490210c"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "86e94505ed24ea06514883fd44d2bc02d90e77e7979c8eb71b90f41d364a1bad"
+SRC_URI[sha256sum] = "6e34463af53fd2ab5d807f399a9b45ea31c3dfa2276f15a2c3f00afff6e176e8"
 
 DEPENDS += "\
     python3-hatch-fancy-pypi-readme-native \
-- 
2.39.5


