Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6330.1792499552108330780
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Oct 2026 05:32:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=qjXVqj0W;
 spf=pass (domain: konsulko.com, ip: 209.85.221.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48df4f540ebso1785888f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 05:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792499550; x=1793104350; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6e1u15kMlpsCrPEttfSmv02pR191dOrGpKa/0nvgAas=;
        b=qjXVqj0WosjKAwfexL0PmgUOk06R8ktki8K5EQPIzy4H4dNl+Qu6CEmxWAT4+WqU2E
         t4MPLPkp2dSY2A2cvStPVLlRI83vIDhuUQeSCTxGN/59eUTdcU0NxfCei8E10mh9o14J
         lk54bzRlSRAh9RHl2PvAvlJ/xEdqeoLSpMUPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499550; x=1793104350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6e1u15kMlpsCrPEttfSmv02pR191dOrGpKa/0nvgAas=;
        b=yc0Hs82ZMhdXBgyKq2jDC0aGl7Wxwxe5XUTv8cxqOhuNGSt7Ua0alry+J9FHaivAbc
         DEDanS2FqJ8wGxXdYHGKoQJoxnI+BolwgzDaGO2PG8VVEWNzNWh9xlkfkz/PNCDjvpbF
         gujptOe+y2DZ+dCou20oHE2adgtQrvUOba+m8xAfdOamTHicYUCcKtOkLd8tF4xLZhQX
         gvlErnfkekQ+4hm8XiXQ3hZ0hWiHOtY5ivvMAFXH0nMBvLxfrRVJGi98Qizc/tNUHVV4
         KdNGFmT/rXwAB778dEm56lVVCbltjH9+zBjM0WR/zOXzKaG0qZC/PaKFOx/Pj/X8F5sk
         7beg==
X-Gm-Message-State: AFq9FYLwDpgOsyslzhp6KvVHUtx7s9RWCusUpQWkwEYlCcJKryBaWG6c
	DiA/ZC0/g/srlsoChtbXN/4zJTpqr4/DNzttNMXCJptzyzJ/K8SFO3RgKF0gxm0eabk9KREItcG
	gtq6d
X-Gm-Gg: AYBFou2AeS0+Qal3d0S/Ir2vXYrWxA2o1Pw/Ld/6gBHpWwmzi7rPKj0ne/bl7Uu2UcW
	U25szADsmObZoVV0UDeH0ZF01bxCNGCeS213BL2UJNPM6L8tQh03wmfo+kvHDMB/5f/7SNevd3a
	YAi5cKLaJRRRB6QxqU/U/xOcDe/GTxBnMg2fOil1zGthrpNp6PAWMoIRfB4BYwlUEb+kp+KFIuY
	V2XIIlba15QtqftdDMfQRINSVHPudFNFGgG85I122UenAjfSaVRAHE1vFg0EY6gf2nAFTotBbev
	fILWw9IQAzEV0bklE7o10raC0p9r3+FppZNeCE7dC4tEzi4x/i369ORv1a+Ed4xvnqrLH8Bmn0j
	g3jgHyA4Ooub6hQf1GZ+Hqs6ZdpytemcHIH/9h7p6u8Fafh5ooiCQVWyGhQoHG3tFC+Vt3mXBTh
	eSb0MX+QOxFs7nKBgfnDwVnQLeAzOHYe5N04+WmdtpYQ4klkWdgEARHr+bgdSuvKxrOj4Fpl1N2
	T3JEXao2WokMUnOqTrtsy8DgDdx3O3WIpFb11CjF+CsiGIYoc78nT+Dzbq4v0hedvEU+zYjDB0N
	uw6Yq7mWI/XBuepsT/zVk88=
X-Received: by 2002:a05:600c:3f0c:b0:4a1:e383:6811 with SMTP id 5b1f17b1804b1-4a1e3836c4amr151013305e9.29.1792499550342;
        Tue, 20 Oct 2026 05:32:30 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cdc342sm75422675e9.13.2026.10.20.05.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:32:29 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 02/14] python3-cssselect2: Upgrade 0.9.0 -> 0.10.1
Date: Tue, 20 Oct 2026 15:32:14 +0300
Message-ID: <20261020123226.4033600-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020123226.4033600-1-leon.anavi@konsulko.com>
References: <20261020123226.4033600-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 12:32:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131160
Content-Type: text/plain; charset="utf-8"

Upgrade to release 0.10.1:

- Fix packaging

From release 0.10.0:

- Support CSS Notes

Extend RDEPENDS with the missing runtime dependency
python3-webencodings.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...n3-cssselect2_0.9.0.bb => python3-cssselect2_0.10.1.bb} | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cssselect2_0.9.0.bb => python3-cssselect2_0.10.1.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-cssselect2_0.9.0.bb b/meta-python/recipes-devtools/python/python3-cssselect2_0.10.1.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-cssselect2_0.9.0.bb
rename to meta-python/recipes-devtools/python/python3-cssselect2_0.10.1.bb
index 4459e05da5..56ec192e89 100644
--- a/meta-python/recipes-devtools/python/python3-cssselect2_0.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cssselect2_0.10.1.bb
@@ -6,10 +6,13 @@ DESCRIPTION = "cssselect2 is a straightforward implementation of CSS4 Selectors
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=aa7228954285c7398bb6711fee73b4ac"
 
-SRC_URI[sha256sum] = "759aa22c216326356f65e62e791d66160a0f9c91d1424e8d8adc5e74dddfc6fb"
+SRC_URI[sha256sum] = "83b0d820ef589dabaf693289b647c2f5b410f76d285f56deba911ffa75a7b9d1"
 
 inherit pypi python_flit_core
 
 BBCLASSEXTEND = "native nativesdk"
 
-RDEPENDS:${PN} = "python3-tinycss2"
+RDEPENDS:${PN} = " \
+    python3-tinycss2 \
+    python3-webencodings \
+"
-- 
2.47.3

