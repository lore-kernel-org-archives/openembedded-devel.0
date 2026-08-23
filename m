Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C04E2C5DF81
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 11:52:58 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12929.1787485976133692677
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Aug 2026 04:52:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rMNi/qZE;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso3660459a91.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 Aug 2026 04:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787485975; x=1788090775; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bHScx5IZxqxLi3BM5Snq/9usHWNy37nxwJkrKHa8ajc=;
        b=rMNi/qZE69TJ1QrIy4cpWmHxc6Znosov93hVlUAeNempdaO1ObU9JHPYEc2WfNcyq2
         h+O0JH4jonNTIm6Vg98hBDKEnT53f9NQCTk3C6Bfz//NRB7GZSwzNjM5k4Hm7b+TWApQ
         CCumEfi/aBjxprX1eTPb0fVb/2njVBE+dGRYKKXJu3G+3qkUbVvHS8CQYK1CoIA8LTx2
         KSqTZiChKxcev+rrhB7X7TRDiLjE2bVselnbarX678Mo28za69GVQoT6GEntIz+B0n33
         F5A8CdoeulRePL1GhDdk2UmR1KXcagM9QCG6yQwE5LfyJFk5Xw0CHzYVHiZsDQlxDGDP
         KlLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787485975; x=1788090775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bHScx5IZxqxLi3BM5Snq/9usHWNy37nxwJkrKHa8ajc=;
        b=JR1zWbkiVL6fkJV5MEPiJNFG2iSsTiU9g95yMDNvvDzsfXczAKnE9ggczNvcckucAr
         XX/ltpeTSJ/JswRsQK1S66yFc+1aQM5/pyDWRiILU43XpPBd07fRaBh4QmMSwCrPG6Ma
         sqZZIuk13y4HrLOwdp6k/yXl34ptA5Y4qaI3fnkvMXk0EjzH7MA9AVoBxFK1P82maWLz
         dikAMYIwRqaRV9qgR/saYOl71+kwgRZ4wOMMnaXbRZTu0oMBqxfh+OI8yfuPPpeW4PIp
         mM6GJQec4cyIlOAHGtZ0wQcFwRMjJJk+39JCHcpTSUDAxueFH8eoQASzlRhIuDqTlSfs
         Lz6Q==
X-Gm-Message-State: AFuF++luVRE6jzbt478YgVBX7+KAjCeeIu+EE8DzY/ywSsRI5pq46mpz
	/rPmnzatx5OtZbhxEbY6AH9Gt6AHMrKT61fsuJx7Ub07lJ6ZgmNuzg7omY+soA==
X-Gm-Gg: AR+sD10aNMarvm7usdt33C4TCWqEn2RSUYkBFye3kP7obZxcaCnFgWQSD4jPanIsYDm
	zi54LtxPQIm+qVVJghSq4pcwYZM2EseVZph8H6brUmOtPOqeYXuL5SpW3Ihvm0+2Hs1u0t/cQRs
	+/pI6iBcPqoHAzyn9mggTB4MdALLRrRQlf6cFuBxMphnAUR21hFqgVlgVwTTOssvK+C2sV6z0/8
	bZsx4ZMQcB2nISl5PHRef8wTR6C+ctOxYHae+/R2o6sgAfynL5LkrboPJdGCmDRhGqa4gPACXAd
	c96czOI68XgyW4d4swFWxznqRDRtlNIT7RwBNc30twpJZe/xgjN6zWtMdILEbd6/eeTDTKkQ5Wx
	T7QGVx90EpVl6onC4BOvUl60jqFu+wcqT/q6UVeooeS8rxN5aGQzK0zyv2pN6bIBXoqMX9rT7xr
	344pXuzw5mqJOuPs5KdYu/FyWDURvD42In3y0gznCoUk6oWgaqaiM6Y37VsXYVoGaYQM3n9NOzw
	yBc+wHU8t1d
X-Received: by 2002:a17:90b:2687:b0:38f:26c7:165e with SMTP id 98e67ed59e1d1-395c383cae0mr36856498a91.9.1787485975577;
        Sun, 23 Aug 2026 04:52:55 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e494fa7esm5793398a91.1.2026.08.23.04.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 04:52:55 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][wrynose][PATCH 18/20] swagger-ui: upgrade 5.32.12 -> 5.32.13
Date: Sun, 23 Aug 2026 23:51:56 +1200
Message-ID: <20260823115158.1582363-18-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260823115158.1582363-1-ankur.tyagi85@gmail.com>
References: <20260823115158.1582363-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Aug 2026 11:52:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129452

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- a11y: add aria-labels to copy-to-clipboard buttons
- a11y: add skip-to-operations link, banner and main landmarks
- a11y: close Authorization popup with Escape key and backdrop click
- a11y: name and state for dark-mode toggle button
- a11y: restore icon visibility in Windows High Contrast Mode
- a11y: topbar logo and dark-mode toggle visible in HCM
- a11y: use for model titles to convey emphasis semantically
- ci: bump cycjimmy/semantic-release-action to v6.0.0
- ci: fix Trivy security scan and add dependency vulnerability scan
- style: reduce padding on inline code blocks in markdown

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit e0346def92a658ef0af074cdc054debcc40472fa)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../swagger-ui/{swagger-ui_5.32.12.bb => swagger-ui_5.32.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.32.12.bb => swagger-ui_5.32.13.bb} (94%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.12.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.13.bb
similarity index 94%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.12.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.13.bb
index bfeb75f6ca..8916b7788e 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.12.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.13.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=main;protocol=https;tag=v${PV}"
 
-SRCREV = "9b5acf38723108ac816dcb7303897e87f933ac4e"
+SRCREV = "2a33d7805eb5fff693952cebb9203ee113ab4663"
 
 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
 

