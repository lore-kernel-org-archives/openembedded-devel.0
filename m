Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32580.1793879737468086775
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 03:55:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=l+NeObNs;
 spf=pass (domain: konsulko.com, ip: 209.85.128.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so15640865e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 03:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793879736; x=1794484536; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mxpPcR2XdaYPzF0ZUp85taJWRBVhWLjNUDG3K1KgNSI=;
        b=l+NeObNsSkzL8+FNkMCULIHE+5SKDlP1zq/67KnPIAZsoj/g7SlUg/KaPqLAdm1XBJ
         qeTnKNvUMWiAc5qfyBaWDRxTp/kKCDju9O4v6RCBEYjlwW8k3FP1ySwV6KSqnUKF90I+
         baUQOXXDwuDw8/QyFUQwqrRD66IYIQdGAp8RU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879736; x=1794484536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mxpPcR2XdaYPzF0ZUp85taJWRBVhWLjNUDG3K1KgNSI=;
        b=yunkHPZQEkrwSUWUtTM9IhJ9sK3H42BXnBOJoQREP4lSQ0vYcnqnemRVx0ioDRJ7Nj
         Syn0QlywiO+adGa3uq9CfnFkvBLIB8NJ1Gw0u8dXLHBDhtD2Z2j5J8FZT2r1VkSu9mS9
         tHih7C3AeW5/iLJH4UKtsg5zbGcmcIR7iBK3XSxW2iZSjq8aYdU+k4eFMtc2SGP5EHB9
         CICwd0M9swR6KkR0pq99mCL2aXnzcIuHHpTtL4sKYi7KKVQEvLPIvhg8OVncqoh/N1zO
         1HrKWcX/SCjGFyoz3J2YkvOn/RyikE87GDKgQU+NvOY9OZhw7ys1abRF6ap7fVPqYiAT
         Ajww==
X-Gm-Message-State: APuU4Z+1NgShkyweBI8QzphylNyWCZJUQE9dqAzzLQVIGk1ZHYr4pZ5J
	5dIPrkzFxjbk6aX8ZnlehE2M15K5JuzSTFrVyS6YLFRgnOT+eeuDUCIlpqkNvaHwnf6CRBf6AH0
	RP6YF
X-Gm-Gg: AYBFou3oipAgjjFEN2/ijEb8a79gW8hxSkiBYxG3a0n+qgUQ436o7tcT9E37EI1qeTv
	dL/Vvk9GeavKV4blqqCo65OdXm4u3OmXBm7bNqVR/b1WdS/t9bXIrGhSlZPozWw2/+JCy569kpM
	fWPC1GCSMaFDlQ63VRiSOpJZA5kaonzbcg2VtlgUo7bN3ZDxzLZgEdbPzAQKhCf6N1mFkoFPOvf
	rHglcHg18ToxPAGZcRJOwQlqSfQ9lFasPpurCPrsJr1H53i5Ck++KPHUyNpZcP5gLDPBjyyWR5B
	WotMPJ39agzCkMuLvUNQoVKmP60tn12TEMp1ryluSoWp3wpqPdSwIy6Kypamd76vBIh07zmEb3w
	wpn6s2NZ6LOgbMe7JhI8dBbIe/eEkqcnfz0ZvJtF5X/uGtIy7AusctzR4uKa4JE9IwoYrOSzPNR
	OuxNad3bstqzGTvJCPVyLLv4lVamqbJtkGwh0Id0f0PbMumFLIfFue64uUl2XT1b4DbNxmsCyNQ
	CCgV6fEWisAqNVCvGXAhqqKy/knjB6BiVCs0tKBwdzYiMc9qO75Fi0eT5q6sqXdKbUdF1DLwY+X
	pD8Lpkj2U0EUu45OwkhDhU658VY+NxQKOAwZH8X8BCqUI+QooHhjF+hVCWC4TUmHqd2W5a7xSM6
	kN1D8TRtkXK1MpWBwBrGexYSVCI0ssNrbdPTfWMbMVmtg4I8bnC7Ybg==
X-Received: by 2002:a05:600c:1f87:b0:4a1:f68a:9736 with SMTP id 5b1f17b1804b1-4ac17b2be08mr415610195e9.26.1793879735822;
        Thu, 05 Nov 2026 03:55:35 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4527fed5bsm173720995e9.3.2026.11.05.03.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:55:35 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 08/19] python3-mypy-extensions: Upgrade 1.1.0 -> 1.2.0
Date: Thu,  5 Nov 2026 13:55:15 +0200
Message-ID: <20261105115526.634289-8-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105115526.634289-1-leon.anavi@konsulko.com>
References: <20261105115526.634289-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 11:55:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131908
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.2.0:

- Add i8, u64, u32 and u16 native integer types
- Drop support for Python 3.8 and 3.9, officially support 3.14 and
  3.15
- Permit building with flit core 4

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ypy-extensions_1.1.0.bb => python3-mypy-extensions_1.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-mypy-extensions_1.1.0.bb => python3-mypy-extensions_1.2.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-mypy-extensions_1.1.0.bb b/meta-python/recipes-devtools/python/python3-mypy-extensions_1.2.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-mypy-extensions_1.1.0.bb
rename to meta-python/recipes-devtools/python/python3-mypy-extensions_1.2.0.bb
index 19060eb09f..59e46c64db 100644
--- a/meta-python/recipes-devtools/python/python3-mypy-extensions_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-mypy-extensions_1.2.0.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0fe3219e2470a78c0d1837019b8b426e"
 
 inherit pypi python_flit_core
 
-SRC_URI[sha256sum] = "52e68efc3284861e772bbcd66823fde5ae21fd2fdb51c62a211403730b916558"
+SRC_URI[sha256sum] = "c6e275a07f1c2fc096b62940452d0eaa3f3af7de45d704787866240a7c6d5a51"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3

