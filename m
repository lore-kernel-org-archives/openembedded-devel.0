Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1396D10F33
	for <webhook@archiver.kernel.org>; Sun, 17 Nov 2024 21:38:42 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.26603.1731879516569890778
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Nov 2024 13:38:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hO2kCUKD;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a9ed0ec0e92so212668566b.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Nov 2024 13:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731879514; x=1732484314; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pI/A0bm1Yp7hj1Gxexe5wBaAPkh6rgkOlhMU6HjL//s=;
        b=hO2kCUKDDw8C5ri5hHLumpkDiTY69DISOKHkB2fgJEIApaECOMCxnL5tE6nFssH2wY
         hZaGh0qGEeA7NZmBIZqGmajXIxkawteO+y946Hl2YfioBVH1WWCtefGPMxVsKmlCJcl7
         QlCY8aqjnZVJ8N7KkPRstlLX/RJhYhRS22QoriHDsoIJu6udKdC/3a6zViK/qCnaZghp
         7bToLxaNB8Xrj5m7pHPpS1ftEHgc7gZuOXhwPSUybM2lPA1TWECBs9SvxuDxlnQ2Owtd
         aSu9oM2wQfHuTBjXFUJkP2uswW59MKjA9rlq9RIdWZqrTB805/n3lSKuWrbE5ePjkEnS
         +3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731879514; x=1732484314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pI/A0bm1Yp7hj1Gxexe5wBaAPkh6rgkOlhMU6HjL//s=;
        b=b+uPuLqoFA31DoFbEZjZHb/UcIcq4s+WDX3fmECSHNMvBAjp1fG6CESG3Z92sYvnSE
         wVHSJndfA/3bwHU0PXYtEuPx/1sBSqOze6FZOp1/BlnC9gOPPNi0U+7IzGSoLtKVEICB
         3OqVPVJiKgHoS4A2d4wSqrstPFnhgy9XwStChP35AG7XU2UsZXeK0J1CL/T+s9DGaYRZ
         78Zo6do3KOn+e117Za98zjufKfUvQwJyHFyY5vpECr6haon69zwxKHD8nnJryk6/IeYf
         deJlWYR50GdcgnEkGlXxfon3SP6+vjzsIE1dBrt+snRyUUE31bGTRBumNmRvLszoAUCr
         AfjQ==
X-Gm-Message-State: AOJu0YxpF+OuHU45yTcAjYzjmqlg/MLGNWxOf+4GnrclaWh0Y3ZVWKzc
	3DWs4uNG8RP0LcYXXgTv//RhkM8wwY9sSFZBlsSpQ7A32YwglQtCno2CGQ==
X-Google-Smtp-Source: AGHT+IG673srNv1XVeXT0z5HDbQExnL2V36ofE9WEdaAptZ9/2UhgkkWrDYVufAg9AW/rvXZwLYaxQ==
X-Received: by 2002:a17:907:3e92:b0:a9a:3c90:60c5 with SMTP id a640c23a62f3a-aa48347a733mr964853266b.28.1731879514350;
        Sun, 17 Nov 2024 13:38:34 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20df56b13sm459840066b.76.2024.11.17.13.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2024 13:38:32 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 4/4] python3-aiohttp: 3.10.10 -> 3.10.11
Date: Sun, 17 Nov 2024 21:38:08 +0000
Message-ID: <20241117213807.741679-5-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Nov 2024 21:38:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113853

Changelog: https://github.com/aio-libs/aiohttp/releases/tag/v3.10.11
Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 .../{python3-aiohttp_3.10.10.bb => python3-aiohttp_3.10.11.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.10.10.bb => python3-aiohttp_3.10.11.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.10.10.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.10.11.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.10.10.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.10.11.bb
index 02c53ff91..23ee568f0 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.10.10.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.10.11.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
 
-SRC_URI[sha256sum] = "0631dd7c9f0822cc61c88586ca76d5b5ada26538097d0f1df510b082bad3411a"
+SRC_URI[sha256sum] = "9dc2b8f3dcab2e39e0fa309c8da50c3b55e6f34ab25f1a71d3288f24924d33a7"
 
 PYPI_PACKAGE = "aiohttp"
 inherit python_setuptools_build_meta pypi
-- 
2.43.0


