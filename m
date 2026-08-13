Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A24EC5DF69
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:08:57 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28078.1786651731631298311
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:08:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZROS3bM0;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso244446a91.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651731; x=1787256531; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XWz8sLJEqEXn9CvOb4tlR/Aj5l6tcWM/YpBe7vbbjzA=;
        b=ZROS3bM0uw+wEIVQhAuUXPtVfWhIm2Vg4mu245Ks5gNtM6/Rchf/eu1Y2YoOxzG4Vp
         QNVB3fJ46foLheUHnA9WoIKgmuIlN1PSHMP5CkS8P/PY0T0IkCNJqO84DSss4hVQZGH+
         cOjeiNNlKMW4AeoM0s8phlIRxpK0PjzwEGSYVqy31TkbzqqYks7SDWEztipBT2QiVFA9
         cxxy9NU029mik7V815o2te5k8wtDkWF8qX3y4JJfVUfCfDnazX5joS6omAkGn3mJBx9K
         r/OLJ/RPBEe+3B/Uxoz+JO0HRL2CYi3n4016LhVqNOaWE/zvsZFiHeNat4dLLzvH1xmH
         FriA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651731; x=1787256531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XWz8sLJEqEXn9CvOb4tlR/Aj5l6tcWM/YpBe7vbbjzA=;
        b=N8+pNLCJe66Bm7RPbROoI5YpJE9PmbX7/sBj9k68fZHq9Mp2UDLvsqi5ZdYX1YLKw6
         dZzE9dDH4uSNan1NekQlDK5/6MtLfg46jLQxf4Nkr82/9g+GyPuHzDzH1F696oFdKVEA
         9yplhqbn8HkcxPS1pVlyHlydOBISsqCx7Mk9FW0gkssO/DvLP6P59pOz5F44glsVVLd3
         shR0wXynMuBMag7OQcU5soRzOoIo/2IpsSzykezqQw3AoeVuj0TZ3Gqo6OIOuy0hkQed
         G/5yoXTVX7l9EdZl1OMg5cy2rJINtd/L6sOpr6SKThi2fQshTzHEBoz/h9b3a63TBeit
         X9ZA==
X-Gm-Message-State: AOJu0YxJ81+ey1Hn1eCFZy3Onc+N485uU6/92Sv5N5cj+Uc/k8VFuLAU
	QppFHxCgzXGGRruYNVLLYV87NHgvBYq0CdVQIcatoAIzdvbr/dhoDfLbNsWRlfkV
X-Gm-Gg: AR+sD13uJCk6YDezjpBxgVqZjxVLJR0B9xuZ1/Lpxi2NWbtkaUdO03cqYT2bkVsA1hR
	97J5Tm+cFYcQVcHtfvow461TT3PHw+Dxpgmia1LJ21ZlbqUCqpAW7uiasLH5AxInXFyB3DnxhtN
	ts93PPzSM30/n6Qqzq9fuQT9fE2TOQxwUxROwxwp7Iq45NK8WUDRDYmkANTx7IhyoMW9SlYhFV4
	C5lpnrpsc7kRcSHtwNWUppBv96yMj7jFsWCPdUcEVpvVPRqvo8U2QMGzIk1ZGkcfH1ZMbhBffBu
	UoeiTA62xDVoqfeaO7Wc077np+v8MA3qoQytSSllEoXKkxT/rvI4lXcQYB8I/C6M15YbFkzxi90
	9Gaq1ArSsm1gtFeLHa+KVn7z4OZnX8EHnB97JQS1HGrlcck0OjBGxFzzgKf3AOwAjNRHsyjzrhe
	vQ6mpJXqbWg/B+rj1QwD7zyz4+RWz1UslCpPnY8Dm2pZaBJRIYAwl9YUO6olFs6zcl1pIsycnhV
	t2ANz85IntydsDD3hxKFUXH4bC6Ph9yicEGJvuaIKFLS37EePROMPbzqwXXLkXgcGpDqWXwP5SY
	Ktxt7onea7yzt4trSaUYLafPevSnrKhQbOFQUY1f8mMxoTCJTCa79cnDohvI4BDYB/Z2ljaYPsA
	EDCDK/SlJ+e2Crt/t75ipr3UhRKaMj4cfRQVCVKNPZB2POQ==
X-Received: by 2002:a17:90b:2d92:b0:36b:77b9:5c8c with SMTP id 98e67ed59e1d1-3933babae61mr547940a91.17.1786651730779;
        Thu, 13 Aug 2026 13:08:50 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:08:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 07/80] python3-asttokens: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:07:21 -0700
Message-ID: <20260813200834.1302829-7-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:08:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128951

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
 meta-python/recipes-devtools/python/python3-asttokens_3.0.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-asttokens_3.0.2.bb b/meta-python/recipes-devtools/python/python3-asttokens_3.0.2.bb
index 8f460cee8d..3dad63b500 100644
--- a/meta-python/recipes-devtools/python/python3-asttokens_3.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-asttokens_3.0.2.bb
@@ -7,6 +7,8 @@ PYPI_PACKAGE = "asttokens"
 
 inherit pypi python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 SRC_URI[sha256sum] = "3ecdbd8f2cc195f53ccada3a613538bb5f9ef6f6869129f13e03c30a677b8fe2"
 
 DEPENDS += "python3-setuptools-scm-native"

