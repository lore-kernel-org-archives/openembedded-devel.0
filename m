Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A440FD74EEC
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 15:37:49 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.865.1769182668704164767
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jan 2026 07:37:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=eqPMO9q/;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.68, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-b8845a47e39so32084266b.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 07:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1769182667; x=1769787467; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tX9T1toYseu1HNSl9G9wuR1euraox7RN35+tdIfc9Ks=;
        b=eqPMO9q/zyuVWn1eLRpwkW3hauBnOP30Qn6iPfcp0FPf5UEg38PF85Hczqg76i6IHu
         ZQNNaNB16Ws30Mu4Z9Yux3xJIWpo9OuV9bFSEaJxDFIOozAx+9b2OpzvKlbm7AZrzuu+
         ve828KcFNQ3NdVgIwTUPMk/+iikI+etNso79k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769182667; x=1769787467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tX9T1toYseu1HNSl9G9wuR1euraox7RN35+tdIfc9Ks=;
        b=tcsqY56kD8akhYTtVjBEIBkne8faWkad7dWg/9TMIRceCzn7YC8d4AvRLtnYohnk9Z
         PgxnDrH1i0R9L2zE5NRi6IcoGCt3WdWRifCNXGCV+9jV1b0bA1GpMrOPuAzFMpddPBk4
         TSuFgmN2tdOc12dmlXy/GOEZHDSo2DSjjsR4E1kUa8vC/RvorQmjEjTYlDKAiNDSuG0U
         22OrAg1gVEQ6ZXgzcxJl5TilvBqkclmUgg+13QRRZ8K7chrBAqx1uQi3DpdB7gRbQkui
         75enSmPKhlS/oSSuNPtI05rEjYkq+qAGXuv8uffnttOSIcG/oI7Qa3qVs0RPsE5fFhZd
         e+Sg==
X-Gm-Message-State: AOJu0Yxb8xRN05D/RloIZB1JpnQb5i9WVdqAlpx8IYeEJ6XXw1OTXHb5
	UZe7BgLcek8jMbQos4i1lFClpEzpaBzx6rN1nf0b1561U9GmiiceuS2uQfnYP8/Qnt/UqIQJ5w6
	Rm3jKYtc=
X-Gm-Gg: AZuq6aL/ZvPvAc73nxoEHZQ1dhF4hU9AVPlAzDc4p6/j3Gi93AG5KDY4k5meXUqrEDF
	SBrH2JIhZdmYCqSub+C4rITsQuUSMAVnZIfQWlCcz1N952RyyFXpql2iF8e+xyDuSdEmQweRH1V
	lzLpoaEztM2Am4mfOZoad+2tmFSCiG080MLDIUOfAo8KpAgFCEZ/x6vcS1EhrvWVjZmvm5FnGrH
	D0LbAERn8Uy1sLmtY6+HC1y6twtYI1nnpbIETYDRIX0Z3HRkE/Qb8BHFTSWSoNDeFfmyu9feFcw
	OrviHbs8CzU84Sx0MKPcZjTHsuYFenmUQlPjDuMX80Rqk73bmgrtLjitvsHLK3SoZqn/e3qEFGl
	wsdEdqSKzdrRu/Hwjkb+iaq+qn+YPfqRmed5mmNopAvZ6eiQSq9MubIH0C6e2Nx7EfIEK34zzio
	lb1zEPJLmuD9KbFJ3t6s62xTeNYYPB/+LBgtL75o0yy14c65L1SPZzhynI0T3T97UM4g0a7oqpA
	o/4RGQ3nu5OfleAojg+cqaFSuF6DebXEyGVIIvWGY8I9qrMcx/Q
X-Received: by 2002:a17:907:940d:b0:b88:4ff8:12fb with SMTP id a640c23a62f3a-b885a82e0bamr154606466b.0.1769182666911;
        Fri, 23 Jan 2026 07:37:46 -0800 (PST)
Received: from adam.arnhem.chello.nl (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b75dbe6sm120291066b.50.2026.01.23.07.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 07:37:46 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH 1/1] libtsm: drop BBCLASSEXTEND = "native nativesdk"
Date: Fri, 23 Jan 2026 16:37:44 +0100
Message-ID: <20260123153744.1223968-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 15:37:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123782

BBCLASSEXTEND = "native nativesdk" isn't needed and is producing
the following warning:

```
WARNING: Nothing PROVIDES 'nativesdk-xkeyboard-config'
(but libtsm_4.4.0.bb DEPENDS on or otherwise requires it). Close matches:
  nativesdk-gnu-config
  nativesdk-pkgconfig
  xkeyboard-config
```

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 meta-oe/recipes-graphics/libtsm/libtsm_4.4.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/libtsm/libtsm_4.4.0.bb b/meta-oe/recipes-graphics/libtsm/libtsm_4.4.0.bb
index 1764ba628a..074302bed7 100644
--- a/meta-oe/recipes-graphics/libtsm/libtsm_4.4.0.bb
+++ b/meta-oe/recipes-graphics/libtsm/libtsm_4.4.0.bb
@@ -31,5 +31,3 @@ EXTRA_OEMESON:append = " \
     -Dtests=false \
     -Dgtktsm=false \
 "
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.52.0


