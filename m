Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D49ABE7718B
	for <webhook@archiver.kernel.org>; Sat, 21 Dec 2024 22:58:02 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.15854.1734821873333598851
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Dec 2024 14:57:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hHuA/NAF;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aaec111762bso55510566b.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Dec 2024 14:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734821871; x=1735426671; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xXHJbwn4oz53g91ecpSNvC1VJ5qjj8zABCm/u8sX+y4=;
        b=hHuA/NAFIsa3jL61hKt5QJHfQng0Ad4P7oPpsCO7E8QAa1CG96uFPFXngffgc3cqU2
         46mTEZOhmAtBZp707dR+gc78YCySSYXcBESY3UMuFe2/b76vp3t0FyPsHIGZTQnAIjKK
         dzy/oyNsH7b6J86tIn/x8eHbUflsl1vJeM3wC5xiUVSROt9kMBC6Z4oVSy0gjFOY6bpW
         4VM8AfdCVr0ZP95k0MCnhlBE4bXSMxPUr4L3GD2+5TZ7ds3sryHlxKqakKEM54FxEA5V
         gkrzU64F7sk2vcNpcGm4T+t9jMI7Z2PVXyboGLl7VuOKKtsIO82vfsy+cJjWFIqkusU/
         6/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734821871; x=1735426671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xXHJbwn4oz53g91ecpSNvC1VJ5qjj8zABCm/u8sX+y4=;
        b=aMv5h/F7JUWFfs04K+7wv2tUxGhbMDIq/m5jXmwgxnp1PGwOTJPRoDgkq96wvDn5pE
         UfV+a7vHCpgFPM93h4DNq2BtuUCzdCZxxFrZfS7V8JHUCkhvVIPwJaYborzv+6O0Sz6w
         B6UZREVZS6iZD1ArMAehtKHJe4l0bX80jfpn4RmxRT1Y3vtmLDiia1RSElGKrhY3maJV
         R9V6sh8A5aVBG5OKeVIu5vbfiE+niP75gwXLBsqIsEUfrX4kQbn5UJoHqh9V2sel5sWi
         KTa7gFWb1ZSlB6Fej/C9n4mdhnwq7n33a6CaKVnftpxNTj+i9eElLcmosjGspum2jAlx
         9jBA==
X-Gm-Message-State: AOJu0Yx/cxwSY7c7vtGrTcV3TSzvkwsloTnlIdMycOSMR0ewF9GcRe/C
	rQn9E6bUTqtdaS9+07BW5X1E3VcTWcX2S/oP/EotIKD6wdt7vMj4ZkTMOj//
X-Gm-Gg: ASbGncsAXygLvtlvrjih/VxeP/LclAUHVRh5NYUeX8c517jJ6are0eeKw8m7dBYsgWe
	dVpj1NMrorBWRiZBGM9ARNl/Esl+bWryMAEh+iA6GvGJSjLSF7pnZU5Lz7/IhPnPVJ9RY19e3X5
	dInujGNCFUty9DmXealiSHZG5xaWTB4UThd+PCBqsv6XsNlhy5wS3DObRKqWTjd4QaqW2J3muI2
	XguADlzF+YlEt/bzH6baWmpxdeJCCR7qg2AkRjlLjQMwDnNG3mTuwdcIWRIugGkOA9pY9RI7wTZ
	Fs9Wl0tr7OLxsF1aJO6yqSzy40KYbi2r0lU=
X-Google-Smtp-Source: AGHT+IGf2ThFGAvPXndXbPTUtOCOgWjdAbWXPcXg8CYiHz2m06BNJY0zWkYCOX25iLvFl4TV46SvWw==
X-Received: by 2002:a17:906:f5aa:b0:aab:f11f:f360 with SMTP id a640c23a62f3a-aac2874a92cmr699760566b.2.1734821870856;
        Sat, 21 Dec 2024 14:57:50 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f858sm330717666b.21.2024.12.21.14.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Dec 2024 14:57:49 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 3/7] python3-propcache: upgrade 0.2.0 -> 0.2.1
Date: Sat, 21 Dec 2024 22:57:03 +0000
Message-ID: <20241221225704.2712991-6-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241221225704.2712991-2-t.f.g.geelen@gmail.com>
References: <20241221225704.2712991-2-t.f.g.geelen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Dec 2024 22:58:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114453

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 .../{python3-propcache_0.2.0.bb => python3-propcache_0.2.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-propcache_0.2.0.bb => python3-propcache_0.2.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-propcache_0.2.0.bb b/meta-python/recipes-devtools/python/python3-propcache_0.2.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-propcache_0.2.0.bb
rename to meta-python/recipes-devtools/python/python3-propcache_0.2.1.bb
index 0b1ebc853d..9d9e5731df 100644
--- a/meta-python/recipes-devtools/python/python3-propcache_0.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-propcache_0.2.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/aio-libs/propcache"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "df81779732feb9d01e5d513fad0122efb3d53bbc75f61b2a4f29a020bc985e70"
+SRC_URI[sha256sum] = "3f77ce728b19cb537714499928fe800c3dda29e8d9428778fc7c186da4c09a64"
 
 inherit pypi python_setuptools_build_meta ptest cython
 
-- 
2.43.0


