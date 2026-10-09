Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 772D7CA6019
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 10:06:25 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4397.1791540376517493129
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Oct 2026 03:06:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PmAAa6rP;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3a4b9732d5aso3494709a91.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 03:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791540376; x=1792145176; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j9BJ9oM7viTQh1lJEHjSgG95tVepqR5Nz32DKdqnDD0=;
        b=PmAAa6rPDNi1j1vG49ht2typuV9z3F3ZoR/y2jl9wI+I9CsEDb8G/evh8VT6foIstq
         T+GahoSdyTe0cxdfx4fkcZysDEaPFIc35ZfIUOLQzQPjjJQuUW1Fz5D1l1nTz86/l1kg
         aiMf5Itc5yJfh3Zca/wAgU7InaYlrDzJKBvRANhHgsgRJDPnhakYYNOOUXqdyYXLtnGx
         MPUj8C7Dayx/XbecM+RmBwLZDcPDoMF8QVdxSm7pglzgNAEXxF/FYfjqM1ZJv93exDOR
         5JTPbPgP/Ty9YDklgUB/ACe4BKnOJDcPCahqsn7NsFFg8NdlAuFc3lbs0WiRJG/jGH35
         eQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791540376; x=1792145176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j9BJ9oM7viTQh1lJEHjSgG95tVepqR5Nz32DKdqnDD0=;
        b=EsYt85fNKkzOQwtg0QEqsaQE/NbniFvrMeDO4GAybanHCXIqR+w9J+JhorMiguY9eC
         9e0pios3IcG0Dx3cn0Pv8HfrlEi4kKzERZC14jspQb6KnDnnf5lRAW2ReYwo5/Q0IoBX
         xT8qwX1CqXSe4VguzbF4h/I4aLzxtlGib4quJSOH0husC4/3dB4a+gQQEXWBR4icvi1o
         BUgfgN3QkBF0AOyLvOafg5ZxopdqAgz8GaFiSMHZ5Vbh454FddoMv0MU2N8NHvmJriez
         gvY6HeuPEdf5X14WAFnZRhQDEUClmKsCs2RrbLNbVkL+3vjFSKSaN0SWANJNa3X8Tz4t
         UwIQ==
X-Gm-Message-State: AFq9FYJviTABCtx6IlbeRbeb/leIlbTaPyoulQCMxCGAZpc5BQF8pfbF
	hAqkWPdwyeJ6zwHHnrYLvzd7L/5xuBFCklltqqCmULbSVfLvuoiOJqpc9CvCsqa4
X-Gm-Gg: AYBFou1lQxvjGt8sImhwCLXOzaOSRUQqiYxp7uCZzP8cX1rLl1f2IbdmhPPAk4fTohg
	zOadwEHZlW59TLyXPIuOxCEhLxMZEx/GSX6H107VCuJddVhB+TychTgBmYfbp6XFJ4dNPu7fJTB
	Ujj9sgFeWScxeAQ+Zgpm4Fe2SOvmexLgAP/HLmZ/tB/IlV65ploahD7cqdbEmSNi6e+UmdjAypU
	S4LLRGjnCJyznAdMeTZGqbnOLCx7p+qoxwSygovVRWiDu736MNG+w5VGzKovsQ3Uprh+atuhnEg
	Y1E5vYRGGIPB47iqpNs9CgBzYRyMIqr/15D78NkWi2zJ/1c4Zf5C8y/wkRaJrcQuOk74Yzwigf5
	c/5m3H7HiVna0dz0mXpnY4WciTqep11jInKvHdi2icBska0mX5msX55oFQ+LiuaFh8S4PZSAqjc
	OFWg3aS3dTWUCffMb5qBwmBIU9SJ5Nacn7f1Ym8O0ZbwqQn7HfcXjYWE8/aq9vIicWUoHucu3pT
	9x0KoztQOkvvqGcLYqQAHVoecLhL71Micpj2DI=
X-Received: by 2002:a17:90b:4b:b0:3ab:1e1c:837f with SMTP id 98e67ed59e1d1-3ab3ac59383mr1214716a91.47.1791540375931;
        Fri, 09 Oct 2026 03:06:15 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38fc9e52sm2723866a91.13.2026.10.09.03.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 03:06:15 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][wrynose][PATCH 5/8] swagger-ui: upgrade 5.32.14 -> 5.32.15
Date: Fri,  9 Oct 2026 23:05:40 +1300
Message-ID: <20261009100544.1428938-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009100544.1428938-1-ankur.tyagi85@gmail.com>
References: <20261009100544.1428938-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 10:06:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130689

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/swagger-api/swagger-ui/releases/tag/v5.32.15

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../swagger-ui/{swagger-ui_5.32.14.bb => swagger-ui_5.32.15.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.32.14.bb => swagger-ui_5.32.15.bb} (94%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.14.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.15.bb
similarity index 94%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.14.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.15.bb
index 5bb5a66021..1c1a625c2a 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.14.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.15.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=main;protocol=https;tag=v${PV}"
 
-SRCREV = "6e8ce248db64190e4113676aba996943c56f2491"
+SRCREV = "eb37d16243388857e5b7c68c93fd04635c7c96fa"
 
 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
 

