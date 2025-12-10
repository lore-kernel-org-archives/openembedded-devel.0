Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAA0FD3C529
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 08:16:20 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10811.1765354574724341858
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 00:16:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G0DaaTPu;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7b89c1ce9easo7529413b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 00:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765354574; x=1765959374; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jiKiArVKEC7R4vwkfHXBKcRv3x95T9284sojGs/dhuY=;
        b=G0DaaTPuGbrbhvbNgTTeSz7jn8K0imyxykTdKDz+JJgE8aL6bG3vcJ98DklDmyRYSC
         tB4lo135Pwvnr2l+6VM7yz+o396kDgtMeExnHNTdclCn58js3yuYksQ4j1cVZuVUGr7P
         iHaWA88Cw/uAKfhPR1sbR7lJDrN/OZND3KOyBlsq7mAhAvvBAvmokptgMkw+kkcKEA37
         yafjbIZYTKILe0c71jEGlmg1TPf4mpDW2RAz35+C9Jv6Vximl4FYLIlg8d3zt+g3dO1g
         +qL0/etDN3KKtBH8B1sEohx2R5HRAGD7wKRKFuYV8BXiqZzo9C3EvR/sOGPPe9rU5CfV
         JMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765354574; x=1765959374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jiKiArVKEC7R4vwkfHXBKcRv3x95T9284sojGs/dhuY=;
        b=gRGbtsvPtefUjXs5s1AIEmxhHw3nx6WKPiRpwccibXIYcAb3fDxctolI9g9Zj1rneB
         jYFr6HK+r9v/I2FshUS4l+HcZBb5OzfErwS17GsLlEkHNxbJY6AAjjCkgZahs4T+kPr3
         lDzkwAy/0gBcPtucw1rvHGE6aBk5dA2XAeQVba9ClNrn41D6WWNZxzrjGEXJZIvPjKkx
         3MlsGk6dfcvHCkHCDyRPCkoBCpcZmnY6Rh/Lo4RgIg7++6BWiasb7hXTX3yO2IpdhpRi
         /+eRlL25+8csTN7/TA/qSOqVtUdsCVsFDx61QQ/h43q16aaEFP1xdex52l8PgFm3+vfD
         wwaw==
X-Gm-Message-State: AOJu0YzOj7/+q/tS4niz+yBMECuBd/2me7+VBhIRDIaFRqamNfNLg3Ms
	Axp3HXDhmN9OT/8oYWtk8talmLC25TIrUu4RpQF6ZibLEsf1C4CwITGwyPp45AON
X-Gm-Gg: ASbGncs9qhOInYWMUaeh6so2aqmWt7bGV5eVnqx4QVSfLgaOyAnnQsVTXtDm+LF0NgH
	VAb6qn7lVZXr/xuiuJqTL9bFqmL8dxxMb4odmw1TZyuR5qIlkbgSyjsZSNMT4/HSCn7DuA8Gy8q
	PPC4ZO4IR10qyNFaMkTrO7VXPg3uk+hqJmI9iu8AmWB5T+CG8TAK4n089nk0GdaQoniaY1cH+Vt
	wGOrZ8D4us+I4GG3zpTZtKLiSOiQ1AnIsUOeidnR32XZjSG2Bv6h1o5CWHNdcFXJV2frIdXbjay
	JPIRyFl1d6SxQtyfxm5bZwS/0gENvSxWNryb2cBi8Zhe0yyPt33D2KuHQC86sU69Kn/XgdTpPKT
	pjxKp4ms9v/Kvsv73a4o0LIw3wHPzUfEVD8IxFqFddIPOumDgvOhTADd1Z9Xlok/gLIXjUc538z
	yFXHKfSjbSVKH9EaKBsso45bVVvtRy/xtad8MqktCD4JbItJw6NhntDkvuSG4dWsaq3C/kZVVNt
	7bOV5it03oApjbAhmjYNq+pUv2/XnJz+aRePw4YNxs=
X-Google-Smtp-Source: AGHT+IEfxDwTU6oDW1e4TAToMV0Mp3AXVT25UPgm6bf6PP8118WfD4O35pjNeUT2qwSeC95l0hMhHA==
X-Received: by 2002:a05:7022:60d:b0:11b:65e:f40 with SMTP id a92af1059eb24-11f2966bd19mr1465697c88.5.1765354573502;
        Wed, 10 Dec 2025 00:16:13 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::69b8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df7703bd7sm80613086c88.10.2025.12.10.00.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 00:16:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 5/7] python3-multidict: Add missing dependency on psutils modules for ptests
Date: Wed, 10 Dec 2025 00:16:05 -0800
Message-ID: <20251210081607.3196421-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251210081607.3196421-1-raj.khem@gmail.com>
References: <20251210081607.3196421-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 08:16:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122492

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-multidict_6.7.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-multidict_6.7.0.bb b/meta-python/recipes-devtools/python/python3-multidict_6.7.0.bb
index 857cc6173b..821a880291 100644
--- a/meta-python/recipes-devtools/python/python3-multidict_6.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-multidict_6.7.0.bb
@@ -10,6 +10,7 @@ SRC_URI[sha256sum] = "c6e99d9a65ca282e578dfea819cfa9c0a62b2499d8677392e09feaf305

 RDEPENDS:${PN}-ptest += " \
     python3-objgraph \
+    python3-psutil \
     python3-pytest-cov \
     python3-pytest-codspeed \
 "

