Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35814CCFA0D
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 21:27:59 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21061.1762378076663076928
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Nov 2025 13:27:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dgLXN8Sa;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b4f323cf89bso59413966b.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 13:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762378075; x=1762982875; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lEmhm5jNyO6M5tKgCCzXF5kMsBR27yn1X7cNksuB13A=;
        b=dgLXN8SaJCEpdbGlgFJrNN7thVU/l+q9F7ZYA2IDh3jSsGGmfpQ5hnEUIn0aZlxXTb
         6A8mOF4FOyU59LUO0fKS3ZylCg1whc7vvOBAr1CZmSpvQU59NvJgUC5Ohj2f3Uq14Vd3
         gFm2Au33yNY949I3AmBeAUGpmSPHTutd+AtzUi01E0Nn62UudvOekMByv7z++VmKl+t9
         N90vWR2nar37cWw7bqQdQMgu/5+TERFQkOeJa8TU3wmQ+V8HpueRr03SvWJjfW+TsZEE
         9pqz6N5q0M8t1qxWsz2VfODoi1mkFeRf07LxQmyYJd4N0/bZHGB4XOYOoKXdTM/9Uxzd
         7mrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762378075; x=1762982875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lEmhm5jNyO6M5tKgCCzXF5kMsBR27yn1X7cNksuB13A=;
        b=hZScoHzKMQW1tQSwbWQJf5y9IhGIZ60CvSMFo1CG79tpulM36VJn1hKN4LWCY1bdXQ
         vgXxAxmdxcf2EAhlG1UpDjUAP9JORva9rkLoafJjoYqhDbZAnpZxkSxYU/JC84Er70Ep
         AYJ5ZZg/oiK9lNXMPM/6hpY0bzScZfThuYpQMAboeVZ53MWMy2Zzof7zcKHb5e+adzc9
         Vg3mqoMa3xhgn9EXLD01RWQzjMCOGLQrMW4u7ZjXLhuA2Fp9HtCwCTpx3VD3K1pbny21
         LbEy1q1/voBPZSdV552DPNKfGOib53jMAv1lxaIBXa3+zFQb0gp7wlKTXwibPByYdvIs
         WxKQ==
X-Gm-Message-State: AOJu0Yy+cEbJSnFffysUT5eICHtmRli7BFY5mBPFCL9r2Mc+fnNkeDvC
	62m7FzrIFxJoiqKchljfbGSohEHNhTFBtTMr7I5/NWxAigN5bOr+8LEUSCoRv8qg
X-Gm-Gg: ASbGnctgDWyZybIgCdGKL72GmZK13dCRQ2KJbs4swrSiRyxgCqFo7/xwUESc8uaGbDr
	ph6R+yZ5oCz+msPC8DwgK1eUamviQXyqvTLOrzq5usmzUgxbm1LfOKXRr2Np6eq8SU90bfkzzcK
	gCmJUoxpyfdWil7DgPu/6km+YU6lWupaGHGWMTcw8kMJR6kq0+jtnIxcgr+HkJC+OX5NHu93t3X
	kjFRI4V8Fub0e2T+oLgyEmtuunPLNHzC5I52NwUfaxPVd8g4VDhlJvMPCKBT/OYtPjbnw0ftsYv
	/Zo5mmTfZ7rH9+nOLSoTOgjvh567XwYn+gWOaInddQ3xo+PFTP2z4JdtTZHuuYRc3ujcR9B6z8j
	5Fmc4RywK1som8rR/g7jojc3vlp4HZbhyJqORThVr+9Bhj3bzHMDWNhoJa5CBCqDUI2C6dbEzwA
	kF9Um7njZ63Pc2+EhSlOlEluhyvf+mIBaJr338ivw1nEh606F4oLG/Pfutx/RdPId9a5hkIxUhb
	tkdZRqRZ9gZnQ==
X-Google-Smtp-Source: AGHT+IEjHwOSgSaDFpTChQTWGWhf7fxXwsRZxLLj47V0IkeKtmWBzBG2LbCuBA7R1yXYPRJHluXp9g==
X-Received: by 2002:a17:906:478a:b0:b71:d701:cac2 with SMTP id a640c23a62f3a-b726560f2c9mr467952366b.50.1762378074637;
        Wed, 05 Nov 2025 13:27:54 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b728933429fsm58550766b.9.2025.11.05.13.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 13:27:54 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 4/8] python3-orjson: upgrade to 3.11.3
Date: Wed,  5 Nov 2025 22:26:30 +0100
Message-ID: <20251105212631.386242-7-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251105212631.386242-2-t.f.g.geelen@gmail.com>
References: <20251105212631.386242-2-t.f.g.geelen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 21:27:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121333

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 .../{python3-orjson_3.10.17.bb => python3-orjson_3.11.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-orjson_3.10.17.bb => python3-orjson_3.11.3.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-orjson_3.10.17.bb b/meta-python/recipes-devtools/python/python3-orjson_3.11.3.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-orjson_3.10.17.bb
rename to meta-python/recipes-devtools/python/python3-orjson_3.11.3.bb
index 7db76c9415..7fdd0fef9b 100644
--- a/meta-python/recipes-devtools/python/python3-orjson_3.10.17.bb
+++ b/meta-python/recipes-devtools/python/python3-orjson_3.11.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/orjson/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE-MIT;md5=b377b220f43d747efdec40d69fcaa69d"
 
-SRC_URI[sha256sum] = "28eeae6a15243966962b658dfcf7bae9e7bb1f3260dfcf0370dbd41f5ff6058b"
+SRC_URI[sha256sum] = "1c0603b1d2ffcd43a411d64797a19556ef76958aef1c182f22dc30860152a98a"
 
 require ${BPN}-crates.inc
 
-- 
2.43.0


