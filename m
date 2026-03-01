Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF157FD005B
	for <webhook@archiver.kernel.org>; Sun,  1 Mar 2026 10:42:45 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.134535.1772350637828415968
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Feb 2026 23:37:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=arK67/RO;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: gitbeam@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439b611274bso8043f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 23:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772350636; x=1772955436; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I+Tb4ydzCBPd00VFr8DO0m/TyJkT86UbieU0NfczvtY=;
        b=arK67/ROdLSlrkvvSlBnFCI6YXZ61M2DDdgNQufMmrHkSWoGvDAqfOTeFe6DIwI6Q8
         qa+0eaeOxpFZcM+9O2eUtt68KbvhrUvUMK5mIkuCZIhKbc6lCp2yUsH3TTp/Ru+ZT7BW
         1LwsGvdCqJWLug2l7JMlfSkkiOvbs9l4CV8GFBiI3MkohwhEPxofVScL6gslngBxlkAM
         GIcNIXezoZ49cHMlm322SinbcJfln8ttltCOZ86f03SSMY9QTa9aDzX9xazpAogYftHU
         QjI3ujuRdPqXwhoqSd5Tqg2t3ZNQHFxECsQK8pqoylC8OTPS632TWFG+Amd5IIGimdcR
         GZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772350636; x=1772955436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+Tb4ydzCBPd00VFr8DO0m/TyJkT86UbieU0NfczvtY=;
        b=TOfgHkEWz/TWsZPdqPew0D61cYke/roFNfbhrjNvkljcDrmS7eBg11bhIPNkHjRSBb
         +dHVjSyyrm78d6H4d+LpTiqAabgx6+sP2lLhPuXmElH5PRuk6foviKjmld/I4g3D3OPg
         YVqrbXhER2UG0k6NsAzimmG3E0IxUNqQy04FwW8DeaNa+jhj/O/HRjZSN1aZvfSDpGZv
         DsC//tG00ErXREvXm5k+wMCmLWWM0aHW8djJLiH4+VpPULGwrVHx16RaNwBNUT+bRoHO
         qZonKbfP15hGhyxHq7uadX/iA2514W1X7nTd2vgV+tDe65iitJwLus5ObkycW+GRyzL4
         v67w==
X-Gm-Message-State: AOJu0YwJZIXTYxMYb8CG5eU3VU3S6ZgeCPQZkjn3oRTdFUsYNLdieNQm
	C4gCdkPbMazIHQR6oWACtH3SGQSlyXY3z2cHfeWu7deA7w9wi3tMQAkbFbAAzC8Ltw7qZg==
X-Gm-Gg: ATEYQzy8KVk1i4jTn/EWnMaJDDKjHUGBZgUOOBwhoashff/uCHFmvVfymgKBhKGgx1+
	4GJRqtRxXYPFlt8ZF03VwVkjuOsd7bxnivEF/VaNuoMTPCNtT4UgIDHWMCfpgPiXwc1Ej/l0+eB
	v0YA9NOY9kD3y4j0Pje5fX7CCcIOqO6Gymp/wCQ9f0axPwpjRo25tHnTJDX3/DZNZoGhTdSb9qz
	cY4OzeXGNZjBxYpt7JC72gKkEQxDmFxcmGZC3Z2OuLxNtjbzEUxa2DWRBMz27wIZiXV0sjOd6SM
	8dmeON3YeCpJ3oTdwSdpR8waW+1Wo6Qtja8UgFVe3kvO8rUUtIHkXOedgjEULu8Nr13qLXuWQsB
	lz94k+nD3oe18QJKcHqOZZNBqvc2uEYU8yBn0Bu2zawF3CaRjOE5YcgQ4kyb4rFHp9LjWezjXrq
	aJ0++W4+iYAB2v8VVSnTOCfrxZ4P6nsvBRJxNpnb53Pk8aNwmmwwu30M8FI1Em6CnuezZaNygoh
	eU=
X-Received: by 2002:a05:6000:400d:b0:435:9f1b:8d19 with SMTP id ffacd0b85a97d-4399de2839emr14309329f8f.38.1772350635940;
        Sat, 28 Feb 2026 23:37:15 -0800 (PST)
Received: from DESKTOP-SJHFTAC.localdomain (dynamic-077-000-050-070.77.0.pool.telefonica.de. [77.0.50.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ae3f31dbsm5298127f8f.1.2026.02.28.23.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 23:37:15 -0800 (PST)
From: G B <gitbeam@gmail.com>
X-Google-Original-From: G B <gitbeam@proton.me>
To: openembedded-devel@lists.openembedded.org
Cc: G B <gitbeam@proton.me>
Subject: [PATCH] ntpsec: upgrade 1.2.2a -> 1.2.4
Date: Sun,  1 Mar 2026 08:37:11 +0100
Message-ID: <20260301073711.148281-1-gitbeam@proton.me>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 Mar 2026 10:42:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124792

Upgrade to latest upstream release 1.2.4.

Release notes: https://blog.ntpsec.org/2025/04/18/version-1.2.4.html

Signed-off-by: G B <gitbeam@proton.me>
---
 .../ntpsec/{ntpsec_1.2.2a.bb => ntpsec_1.2.4.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/ntpsec/{ntpsec_1.2.2a.bb => ntpsec_1.2.4.bb} (98%)

diff --git a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
similarity index 98%
rename from meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb
rename to meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
index 9ad97e7689..4f71cd2298 100644
--- a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb
+++ b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://ftp.ntpsec.org/pub/releases/ntpsec-${PV}.tar.gz \
            file://0001-wscript-Add-BISONFLAGS-support.patch \
            "
 
-SRC_URI[sha256sum] = "e0ce93af222a0a9860e6f5a51aadba9bb5ca601d80b2aea118a62f0a3226950e"
+SRC_URI[sha256sum] = "443e54a6149d1b0bf08677d17b18fced9028b101fc2ffd2c81e0834f87eebc7d"
 
 UPSTREAM_CHECK_URI = "ftp://ftp.ntpsec.org/pub/releases/"
 
-- 
2.47.3


