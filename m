Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FE56CAC5B0
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 12:59:47 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.7552.1759409979619388206
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Oct 2025 05:59:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fXhlKIQ2;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b403bb7843eso223014066b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 05:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759409978; x=1760014778; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kG9gKcEpGCzg1EhPRmWAcZbs+bcXvAHBSf6c//C+b0Y=;
        b=fXhlKIQ2lub9b9MLcCwCsrqCMNSgN88Iel3//XVYX54eMDyNbWFubwcqziYWNTEBKy
         XYbqe9vmwxcCDF1l/1xgb3IM63T0N1VTa8tRYAGLI4yjRCdw1CDu3l5dlSjU7nZPb2zi
         7AgTIODr3NKeeMk4sfRSsRojnWIjR/FTK9KfKigaLVOCs+dif+rZIjyX8QDViPYTYO3T
         f7wXU8byuBNVIY5SlarrGq+6DMAjaOkv4x3VO/V+LSyv+yAJ95LS0o0i3tL5BZzsin/K
         rdyRH58ZoNplsblY3GzpTpTzIlpwslPVhJ39uwjOkhTs/rGLTOU/pYeiDsrTYqOeN/3V
         Hc7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759409978; x=1760014778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kG9gKcEpGCzg1EhPRmWAcZbs+bcXvAHBSf6c//C+b0Y=;
        b=qg8jWRcefVEHcNxvIwfYlPnQYk/qrG7T9aZsF/zIpclubXfpipK8ZN2v3hysetz+cu
         yExz66kHyp88K9+FnpsRidd+zQYllFXGue4EaKIeoGjEAyA1TuQrP8YRn7Tb+ERAuKBp
         XPXZ8BOkmaYErPVvWjL+0EC/FjDS9RPLsdmrYUUOUxTK+csLz5SbrXH+vG6qekJ9x3Si
         yeXVMFX2urqyUCXBdhBKNBG15tWTh9gJKGKt3kO3qw+jzYa+pH2EiqFitWSTw9euXxJ4
         eBdBWfta4o0bd6dZOHif2sUtCFdtv/8WgyozqvDLhwLln9MCBfYSnIjiElXY4q85Gpg0
         /tAg==
X-Gm-Message-State: AOJu0Ywd0Vj6ujxv4BL36C/kyzNw8gQkvlRt2D205fJDcP0lauvabP8o
	H6VLAGoFFcwHgKRM9QQYLigv6KfJ7/wvmEflKE15dViL1SjxR+7PKznUUXVLBQ==
X-Gm-Gg: ASbGncu7Hx4h3EyGUu90IzoHVlkaYjCbK1YioRhPJ2cUv4o6fBoq8MaKF3RO59LbKNC
	3w5V7UVOL83u42kSeRWm/cC1t9UnH7a5nIUlgdctG0kalgd7ksBCw/OzMV0gpbGXzQJGjaUBU+S
	N6OK/yckVDdKKuMyqe+cqwqRbixbhOdy/0CiPk/9901Jd2qmy6fEKcDITqzQm3jP0kZwhvo+O1z
	8IUpSAoftpVwiAWv7b84DDqIdpUtwidka3WMV41ms/TEyJCzr3JlXhQT4mSS1MeUjRtEpbNJ9d9
	epRheIfsLMp51qNXV4LZCGWiV6Pv4nba0DxDeSTnCLzczfjaIn0J4R9cjkLubVTKJrfeDVUk3bg
	8ob7RVrM36sUs9UbXKONQ42gnHYqQkG/kipKhkWdhIT8M
X-Google-Smtp-Source: AGHT+IEfaA6dJAaTKuuiiAV9gb6aamdM6xV4BJMjV1PpTQriSbQtOeFHOOpUjr5mZUg/Bm1uesGARg==
X-Received: by 2002:a17:907:2684:b0:afe:d590:b6af with SMTP id a640c23a62f3a-b46e5358be8mr943768666b.20.1759409977908;
        Thu, 02 Oct 2025 05:59:37 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173b03sm194127166b.84.2025.10.02.05.59.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 05:59:37 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 14/26] lcov: Fix Perl Path
Date: Thu,  2 Oct 2025 14:59:14 +0200
Message-ID: <20251002125926.2624522-15-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002125926.2624522-1-skandigraun@gmail.com>
References: <20251002125926.2624522-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 12:59:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120183

From: Alex Yao <alexyao1@meraki.com>

Fixes an issue where lcov is using the system Perl rather than the yocto
provided Perl. This causes packages to not be found during runtime such
as PerlIO::gzip.

Signed-off-by: Alex Yao <alexyao1@meraki.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e66ae31c9522a6acf42720edb7623a93407a983a)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/lcov/lcov_1.14.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/lcov/lcov_1.14.bb b/meta-oe/recipes-support/lcov/lcov_1.14.bb
index 47062cca52..f18c7b18eb 100755
--- a/meta-oe/recipes-support/lcov/lcov_1.14.bb
+++ b/meta-oe/recipes-support/lcov/lcov_1.14.bb
@@ -59,7 +59,7 @@ SRC_URI[md5sum] = "0220d01753469f83921f8f41ae5054c1"
 SRC_URI[sha256sum] = "14995699187440e0ae4da57fe3a64adc0a3c5cf14feab971f8db38fb7d8f071a"
 
 do_install() {
-    oe_runmake install PREFIX=${D}${prefix} CFG_DIR=${D}${sysconfdir}
+    oe_runmake install PREFIX=${D}${prefix} CFG_DIR=${D}${sysconfdir} LCOV_PERL_PATH="/usr/bin/env perl"
 }
 
 BBCLASSEXTEND = "native nativesdk"

