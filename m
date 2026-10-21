Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8713.1792580477015294506
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 04:01:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=FSWMTmxl;
 spf=pass (domain: konsulko.com, ip: 209.85.221.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso392809f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 04:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792580475; x=1793185275; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jPf+vm/u5R8Lu1M+1+pgZDRqEuKqQROfmV/+qrnv7p0=;
        b=FSWMTmxl9aZuFb83Xav2HXAOQJDic6c2jnnn222ZxuDPgXujtsrhk8aM7mInGaVhxh
         4bxLXBPie47HgTmtVdEfiERU0oliD/xWPUK7W/Q9b42Tyk2bKq5ij6iLLCnkvcsElhnq
         k91wH+ID//k1PoVHESBPJ5RtVyQdk5S0iCYt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580475; x=1793185275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jPf+vm/u5R8Lu1M+1+pgZDRqEuKqQROfmV/+qrnv7p0=;
        b=g/2B9iB+TokN1cWiTHuEQXsxRXj8EY47MmfnL92Sdy3aZqvg8TjZQIAwysCTxPPn3D
         GEuFN6wHTMu9R1ZC5Aso2GVXgh1Mm8Okh1uYf909w7bC4pcnnvTMUbiIb+IVWl6WYvId
         YSUlEvnuSV+Ke3pjraQSLaAVxeLp81hrxtIqjIalkpAEb+vlxHPNP2g85bCgjKZs0OeU
         R1gTkpKYKU6GXagrRiEFvtFX+vo2oglGefJF0dPCP0mkg1UWJPgjhyo+b3svH2gJ6S4n
         gLTQEP5jF8KDkDdfYjT+WMMkDPCXdXG4REz6d79vPuedlx+Qh4n87mXkRq9KWb8tTOfq
         3INg==
X-Gm-Message-State: AFq9FYJHptdcruZt/9f+gigg6NWpNhTzuVwbwEGtIHEOzUk8WZ2u55+t
	p9eStkhvH49Wh66aUQLsOlz6+6TL1aXD9O4SYYVX6pEOaSTpuyRALmNy39iLP4TzBeAAuI4cy1t
	L/Gu9
X-Gm-Gg: AYBFou1EAsvIzaBsJtZ6+7aZ26NlN3g3jQZL8+dzfzc1mz5Rr3ncwPo9Ug4t/+eEHCC
	ZB7ApdXVQA4EeLRPKJ7sR1sV3HW9yO9aO8i/NjuDCHWCw6cW8XCBAKzBe4rhJuh8yVRDMTHo8kM
	vHLee5PAACojkiP3+tTcvr2BKaxKp0n388fAUipPq1XdbBKfIj8HlDjPnOiSpHr/gCtTit9Ov2/
	i8Hltd6dVpGfU0W/q4ZW4DuLA0g9e8b88ktp8LvEuwk6TMuot6Jqy9zW14K+gPOVVLhjE8sT9yr
	TVQf95mNTK3P9qhnaGxvXoJhcSCEDFjFkgsq374lBS89KS2YnT7v6JWGeLpDjyk+TX1tEyzv4zJ
	V22bwlZs7kuGadztmWVkpprp3NZCfuUD3tV8o2VLpiGUYIiRKBD47RW1dE0tiDBvTHrIm5pWJ4U
	A7oaGwwVomEkKvQN3VgbNkkWqQTz8Fgfhhwz+F+YdFGxPhd/DjzBXqSc0GECC6kYO5fTB1b0bll
	usV4X4fvZzJO52Ng3FnI6G1yQWZPLUVP0fz3Mq/GAcglFdKDjLaAJJzS2whiM4c7S/Uu+/e6XSZ
	/iPvfoAqixlS5LTXiSPDQ7dmWaX5pMUdNuoK22OlzIM0D6XA3qd1Pp43kTO2apZbb5lHGCnVPa/
	8jC6O
X-Received: by 2002:adf:ed8e:0:b0:487:baa:aa6b with SMTP id ffacd0b85a97d-48e264daea8mr2521138f8f.43.1792580469086;
        Wed, 21 Oct 2026 04:01:09 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583e25asm4972423f8f.46.2026.10.21.04.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:01:08 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 02/36] python3-cantools: Upgrade 45.0.0 -> 45.1.0
Date: Wed, 21 Oct 2026 14:00:26 +0300
Message-ID: <20261021110103.1943456-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021110103.1943456-1-leon.anavi@konsulko.com>
References: <20261021110103.1943456-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 11:01:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131262
Content-Type: text/plain; charset="utf-8"

Upgrade to release 45.1.0:

- When parsing DBC, make sure there are no unused VAL_ and
  SIG_VALTYPE_ entries
- sym: write a leading 0 for multiplexer ids that start with A-F
- message: index signals by multiplexer when creating codecs
- message: copy message bits with list() in the overlap check
- plot: read candump -l lines annotated by cantools decode
- DBC: don't fail the load when VFrameFormat has no default
- try to fix the pypy test
- database: do not refresh messages twice when loading a database
- plot: accept decoded choice names from cantools decode

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-cantools_45.0.0.bb => python3-cantools_45.1.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cantools_45.0.0.bb => python3-cantools_45.1.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-cantools_45.0.0.bb b/meta-python/recipes-devtools/python/python3-cantools_45.1.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-cantools_45.0.0.bb
rename to meta-python/recipes-devtools/python/python3-cantools_45.1.0.bb
index 231a6ae35a..f5c9e1a76d 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_45.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_45.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/cantools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "e04a91cb000282af2a39aaba23fc1ca1bbf1940b6ab0d604cea358d0500a62af"
+SRC_URI[sha256sum] = "ea1619f3d6108a1c3ecd0f81c952ff2dffd023b244704f6f7a17c4f4dca75f73"
 
 
 inherit pypi python_setuptools_build_meta
-- 
2.47.3

