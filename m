Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36042.1793161464255632781
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:24:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=oVdTItXv;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cd623dfe420so441259a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161464; x=1793766264; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VTjVlb+otFRnQCorDsRBLqqwQiAElB9jBQmGoR879kA=;
        b=oVdTItXvUIYyCa/y1TBATW81oP+6+znpgAmYlO8m9ExlLBVeKSa77wIHuBjPKUo7Ei
         kP0bAUCt3RCmXvbiqCaTkoKgumbYogqB01fShb9j1dg+phC7Zb8BAe8QvULQAu9SpNLf
         HVcqF3xCmpLPURb0R3l0+tQqyfiE4Qaw/RxmuMdkRdX+oroLJnVd7ZbAnMSkPIlgPBDS
         5ndOqPN8AujfFyVLZt1WMTnEyp+6BvRT6qwUTfEL84MnTFUICFvCGjh/Kf7vK8fnkUYF
         wj1C3vsuBczFpTLFl8ETzs3QeTPCfl2/9kdDcngNYLTmviULsmluEHGjLSrec2z4d9R/
         P74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161464; x=1793766264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VTjVlb+otFRnQCorDsRBLqqwQiAElB9jBQmGoR879kA=;
        b=0T6urxi4Ro6i8eqrDmlUYvj3xSL1MNq2r73AtNB/t1SNgm+IM48Z2oSg2BOkVRITLX
         b3ZIkzmEAYnjf61GaZvPopjZg71hoDevC65S0HAHlBmTy1oHHWZOayA5Bl2Or/r2i1I+
         KrZHBijElDU04SzoCoWQr4ptcq9XPCcfoMrYlb/stN9cZNO4jdjmiwUDXfziLE1sgR/6
         HmLlrZt/jIUnqDdmQGHakgQ0xnbLyxm4JXpvNyyX28FAzDu/MVD3OXgOO9O9ffBIlLr9
         IMvZiikoPKhGMA1tzkqyZGm6lmpYo7aFYSS6oGKjW6rcaUV+jM816tQRO72lpCXMKK/v
         vlFQ==
X-Gm-Message-State: AFq9FYIJX/FNxLZW5Yu5Ab6WflH7UMR4oXULyvr9H/q9+OR5wViev54n
	r4wZdmySzz2PXZ5Ozeyb4+aDNmb6Me1XFKDfwZKY+OUY/yizOXpGFosdAJXKvg==
X-Gm-Gg: AYBFou0z4J7y7BA8BMZ4EQO3Y9aBf/nxAnWS/4n6J4K1A43mn5pl1GPrwRir5ivfQZ2
	/jr4d9HF1oONbHlSKISrGlYzBM4J7BAdyYiZGfkuTH+41NQ8S2NAHLR8ICvOV7UXqbctVPb7mHz
	6NiB265gJJ9yNzWcKTRepN1PIuZLd5IkEdCeU7pPwz2bFrsS+1RtDXYPBJQUY+4ZdtYMHmt0dpW
	DsPrLGvqGGVzlvJ2QVKYol+lmyycf9/JQGJF+M8J6t5eDJNxTocDVhGhK6b00xbhRpjzHF0pd0A
	gYHX4GV649K6OPHekenbRA2Xe+htxRLP01aP8gW6e7Yzk/4GN8wFAJSpUSYnI6czELwl0GlxHop
	Z5WsQqUSKTQIEbAlrpwZtyIdPIc1zxLh83QB1f1GJvNGS/qIE0O1Lr02Cl5p6Slou0EAMpMHlsP
	PiHjH1LZO2bYKB0Kvy0LW0io7XTLezgJjpduiFarOHPEKNRszV/QwQBLZk0cdL/kmx/74qtzRsK
	Rpl8Kq4Nm/6YTaYUQ4oxQJSPFsgD5iYoL1MQ2X76SxIcIQ+Sy0JjFG48j9bHD+jOudhSyW08KWO
	pj0st8EssWJ/XfK1cHBRsGtVvVWcMZc2s711tdQCNdf4loCmw3h9hL0yn9LjDQ==
X-Received: by 2002:a17:90a:d00f:b0:3a8:5d1f:59ad with SMTP id 98e67ed59e1d1-3ae580dd6c5mr935740a91.43.1793161463586;
        Tue, 27 Oct 2026 21:24:23 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:24:23 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 07/60] swagger-ui: upgrade 5.33.1 -> 5.33.2
Date: Wed, 28 Oct 2026 17:23:05 +1300
Message-ID: <492ba8a3afd93c6f5f24fbf0672bb1b1ab8a80e4.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:24:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131559
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/swagger-api/swagger-ui/releases/tag/v5.33.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../swagger-ui/{swagger-ui_5.33.1.bb => swagger-ui_5.33.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.33.1.bb => swagger-ui_5.33.2.bb} (94%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.1.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.2.bb
similarity index 94%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.1.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.2.bb
index db2bb498a8..aeee9e4da6 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.1.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.2.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=main;protocol=https;tag=v${PV}"
 
-SRCREV = "cac3d136b5e37bfbe3288c8591f6f4fcf9870599"
+SRCREV = "e89a91f13cdee432d97ca9d3d1ac1969ff797036"
 
 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
 
