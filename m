Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41198.1795611510047611359
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 04:58:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=QeRExdEJ;
 spf=pass (domain: konsulko.com, ip: 209.85.221.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4a5024b3c28so3929289f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 04:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795611508; x=1796216308; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p5Pa/ktG35o0Z9gtMDUEZ1yPx8RQxqzAcjabQCmOXOo=;
        b=QeRExdEJP+S9eEG+UjragfKAEFoAevexe7sJDoSWPUbDx2q7PNzWhtCfWZk+j5TDKG
         Dd5nUJWS74hl9ZpQeNLok4kVLZieO8Ue//p5VhpAhE571X94K5zzTDLiOxTex0OYjedO
         P+ZcCx83EJezB5CUa/6PTBAazdbOdPOqU9/bc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795611508; x=1796216308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p5Pa/ktG35o0Z9gtMDUEZ1yPx8RQxqzAcjabQCmOXOo=;
        b=aI5rCSbwacqcl2NfVSX2jSMMjCHzljxxP8WWFNfpndScjaYSvCSimEJRVBoEqnqriI
         J+qm15xBWG3U4A8QSdeDNJwVRgts2VaFC45Jnf6wLhm9J8RM0ukEt1/k57FXBrhPvAsV
         DJk4mTOoqvs6kBecoxQ3x/FyhyKCI/nLSF0xKw5nkH3p6I/MATabouYPiX6TD4rqnAna
         s71S4ZLEWu2dTlO6UK0mYG/MrkRQtcgRAIGV9Hr6i1owK+ikereZ8co+giKMbV1b6Adp
         ksLZHU0st/fdl2eOQKeTGU/c1CszPPE1cBIfOKB+WJYbSEgVPRL5Ac6BsM/LkmNeXI9i
         m4RA==
X-Gm-Message-State: APuU4Z+X2AJeC0+O92xI8Pj54BFNTF7u7sTd/n7GdnVTd81p97cbicYQ
	wePWRPjIc+mIz39aoR4WTkeRKnRoOxesFxSQ2h1tPA3TIBuVFhPkuKhdqaBSFrLRpbmTo5hCTHg
	8L3FW
X-Gm-Gg: AZFdTZeJntEja8tmKTYB7xeqTCUhRGSkQgcBBdHBliASgyausElbCzJTtoKVXeVq1ad
	YPfTclJXjVbdy/vrTXDiB2OF0Pl8vJn3sPFQsZ3ue0UDcTIl2vy9R1Ipe48i4qFWXjZqpkJCLHc
	1yrW4JN2sY/rrStarCjThzE9nuvoHgfljNqJG5G5ixZnUBPylYP/H118Hl6+B3q0fq5905gnEGC
	rWFpZLtkG9MlVZp/g7FvHzIadkjjjBxuPg9P2Q0r9cavobs1W8I8LHbdLQlvnJ9ACKRFHqw8dQL
	fY9ZflbGTl8k4zk7ROrgCHPzvw7YNi2BX8GAMM2MzYerhJ3j2IprSI1WFBTZarIFsqofcBrM510
	I+rfl+CHXsS7qjjcs10z0tOrlkOgWKvLRXBDKLuhjYzX6trhtXwZ5ShKluNUu2t13Sm6ieA4FoW
	tKQHBWfyXuNss3KnodIPVwrgE+pSydG2ypepuP389lbgQuFtQjPVqJgmX2/xG6+ZL3VkWF4z1C5
	6mG75pQOTxHJnOgM3bR7/Yogogsihsm+QwOG4k23Vg1RpBKf+2MI1SPe2yF8hB8/ppH3ul+c0PU
	agtl6xSo1FNWw/v5FoD+tUm1rKd/l55AkMYgCoRygMYmXUdSLdn8C6C4qD3Hgbd4+QbtkGh57g5
	EB0WhpzKbJ2w//p70YImu/4y8MjMtLjmEqsnG49T/HK+a69yLWvQKsA==
X-Received: by 2002:adf:f192:0:b0:491:e477:6820 with SMTP id ffacd0b85a97d-4abb3a4d388mr26404374f8f.20.1795611508410;
        Wed, 25 Nov 2026 04:58:28 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110d56sm32919300f8f.40.2026.11.25.04.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:58:28 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/8] python3-grpcio-channelz: Upgrade 1.85.3 -> 1.85.4
Date: Wed, 25 Nov 2026 14:58:18 +0200
Message-ID: <20261125125824.1799066-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125125824.1799066-1-leon.anavi@konsulko.com>
References: <20261125125824.1799066-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 12:58:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133075
Content-Type: text/plain; charset="utf-8"

Upgrade for the released gRPC Core 1.85.4 (googol).

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...cio-channelz_1.85.3.bb => python3-grpcio-channelz_1.85.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-channelz_1.85.3.bb => python3-grpcio-channelz_1.85.4.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.85.3.bb b/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.85.4.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-grpcio-channelz_1.85.3.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-channelz_1.85.4.bb
index 82739760f8..47178c4015 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.85.3.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.85.4.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fe8c552b7748e45c00ac55ac0257f6c9"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "6455f89056b250884500fe07f5e8d177b9e1e54841bae16278b60c03845b707d"
+SRC_URI[sha256sum] = "c3214e0ca13e56b05157b7954dd1811937dfab9d0bd4b0ca2dc6452397d89e5f"
 
 DEPENDS += "python3-grpcio python3-wheel-native"
 
-- 
2.47.3

