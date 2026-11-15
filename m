Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3819.1794729019715242203
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:50:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=cbkWe12u;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36dbde64409so3566100eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729019; x=1795333819; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R36nQsW/vfeUrNpuoINmDMGEbLEJHE8gjR1HJYVkYV4=;
        b=cbkWe12u88MrY9slNQnPZmvnqjnS6TtOG1RENCWTbrdPeaFR1roMlTUJoHARLKFjg4
         pwwNwwKjBjiZb4pLbFL2aIbX7cJxHfSvHiAUhdqQn2imDRQGUr7E5q83ZAaqZwK0+GyQ
         XyVrIek944FyUgSfvVneBkAIlILN089Vxptv24yRUc587Q4xyQxCY7UXsFjVuum06wfs
         Ank6e6SErmNqnmERFVUnlG+PJuMOY8/aTb8WdXDdv/ABTor/eT2YsS6WtmHae3f+20xt
         3nJ2tJpPL4RcOVndSlQ3sjIYJpq3Kj3cyKWV1bqj86lakasuPLnMwiTSWgrYCpd1zHiM
         WpZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729019; x=1795333819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R36nQsW/vfeUrNpuoINmDMGEbLEJHE8gjR1HJYVkYV4=;
        b=TTazepCVRuAfutB7tQFTOrA53JzvppHHDn4jIWRWcDcoGyv7MCX9OYFcsWGziCEoFB
         94+exiuHIk+P9S7v/u4nr1E4gBR+8ZIF9N4xNcuavfCP0muEhpgAUp8PBzWHPetLtc4c
         gVZJNMuYNPjPKLPb4VY/TVTAmcY3PoN5IUuilhYbizBzBsA9G5Cfra0We1P6Za5wUPyx
         qWwEtBrm/CqCU80OBCl+PJltOkDc1k02ae+/n77tUtyQoJEWXpgN/T1veILp7Qc56GwT
         QX4AMtbQn3zn5bgd6xX2KBfPPyjzT32XXEPxIfCSpbJEUV3cO9vENnWXlefGjAZDimDb
         SxtA==
X-Gm-Message-State: APuU4Z/fZ4tiiBofFFkWuSSuv7ZchPlmU6oXHvkrJ5Wr3Bm455n1YbQK
	doB7ijMRJtqoWnKctWXgRVdB0uJXEwf4LoykwUl2APdX+NKpVY5pI7ejCdjQthqI
X-Gm-Gg: AYBFou2A2ck7bOyY1GMgPQzc9TdNB3izY/3ySWfiCfBPq6HiPdSWP36CbgGSoA3qOug
	qXyalzp1GICyqEvNN3TShfufJg9HMypnv0VQkluQS5XrZUarP50fVPKVusm6+TEJryHbWmHNbib
	v679PyVaMlXNFjMHM1LcUmv5w1t/VaG0pEckYE/SKs1pHIM227zW5QGDsl1obWEzRV5n0gNQXjq
	bbtK/P8iQbj/t695tw5tX+WD9cw0yM4nNja5a2o+I2WXUY/pxJzynTFEeMt3LsdyCe7ENxcO+qH
	ZBo501NZewUhYDzyo4f8rTfnUlU9ZAiE2HquQVdaOBucTwgWGraiMdqs/NjC2W+Ca9K7lc8Rc6d
	KmC7rV6vyBnqUFHpF/DQiYOlA158uFZdQnM6GsDm4vzdQ1moMSAZeG8By9KuCrFm+3+5L6hiW7G
	QHzf37NXNDD1Etfr5JvkBaBZHNW0JugdissDixPUTndZ3+ejzhqeRn1bCPaJBybHqxpXfSj4fsh
	XzzR1n96rYH3jQnBTeG0AdFOXz92h+xz7uIzo3baZ0s9hwoX2c97w4x2vAhUHvxC7SEgOSpkg2G
	IQOcBsnzcPp9vpSphl+AEhvcYbtjT9yQb2hrRaqgUL5Cb4ucoxY+6sh0I6a/CjQWynpDg0rqiDW
	QnZ5JB874sdLv1a1DH90fJxNsTULn+YQoUFAHTf5OoCfT/Paunvk2Jb4V/4+MJeVlq47R5ez3KQ
	PAUYKrF/5EGoZ+XP/DNZQciZCaQMDNuJm8s3k3QxpsfyHkHLvJUokXyagzjp9HSMO9ttEUG2MwR
	URTAUSY4PW6r6430LSG3KDDuTK7BTGcYwcTyRIAHRCBoHI9JXUkSbIFxcvQ6PwvRoGlzM8drrd1
	7ZLSZw==
X-Received: by 2002:a05:7300:6027:b0:360:e2e6:f849 with SMTP id 5a478bee46e88-37966e3b6c9mr7827365eec.28.1794729019002;
        Sat, 14 Nov 2026 23:50:19 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:50:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 36/96] mozjs-140: upgrade 140.15.0 -> 140.17.0
Date: Sat, 14 Nov 2026 23:48:14 -0800
Message-ID: <20261115074918.2932593-36-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:50:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132306
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../mozjs/{mozjs-140_140.15.0.bb => mozjs-140_140.17.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/mozjs/{mozjs-140_140.15.0.bb => mozjs-140_140.17.0.bb} (97%)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs-140_140.15.0.bb b/meta-oe/recipes-extended/mozjs/mozjs-140_140.17.0.bb
similarity index 97%
rename from meta-oe/recipes-extended/mozjs/mozjs-140_140.15.0.bb
rename to meta-oe/recipes-extended/mozjs/mozjs-140_140.17.0.bb
index 436314c2b6..b1b40c968f 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-140_140.15.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs-140_140.17.0.bb
@@ -20,7 +20,7 @@ SRC_URI = " \
     file://0013-libc-Enable-getrandom-on-all-musl-platforms.patch \
 "
 
-SRC_URI[sha256sum] = "358bb03c550f95172f1e31694e4287da3411560df91e931cb25210efdf90e524"
+SRC_URI[sha256sum] = "4d6ed3b18b2069c55bab12d8ba95da6013ac0b036d8a031df8b9f39a25d05c33"
 
 UPSTREAM_CHECK_URI = "https://tracker.debian.org/pkg/mozjs140"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
