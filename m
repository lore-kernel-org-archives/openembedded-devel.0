Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF450C3ABA3
	for <webhook@archiver.kernel.org>; Fri,  2 May 2025 07:00:26 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.13830.1746169216862075101
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 May 2025 00:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FQEmDzvW;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b0b2d0b2843so1387770a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 May 2025 00:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746169216; x=1746774016; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O3eqxy5e4JuIPkol9eMJd4VK4apSbAe1+eXqUrk//qA=;
        b=FQEmDzvWBNlp2eVEWk8bjbchezHXQ8Qb0Pse4eKqaE5h/5yjbkkpXVdBxKGCLIFQen
         VNDKtiQkROW/BhhtTr0v7+hbvQ53BqWrQz36K9iGHPIhaWC25v+dxKQScTzgVXG1usK/
         ljcXQbvfs0XEWuIhrViPYWOHINwB3/0XBdkTxeC12gwT1Gooqfcbcy2RHTFn2gZax9CC
         fiBrfK5bgOWcocZGO57muCV914XaYdA+ij7rVyEdmDFX6Hl6O6ZRURA3bKPRaELSCP+7
         RjFgH8XJvJteSh0vDkN9Bsi9NRvVnsEYB1bEI/2RatG9vGCk3F3fdrNViVw/GiBvFuBQ
         m/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746169216; x=1746774016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O3eqxy5e4JuIPkol9eMJd4VK4apSbAe1+eXqUrk//qA=;
        b=Tmc8q6XKzHWnaxW4vJ9kNGs1PWo/vslfysfgUC8RJazuvybnBPGwxlWhOmlcqqf6P5
         ATJHNsBUk13QC5R5A3+ldK8w8toB6nhGhupiDCCFBrL1Tz6yxTP0eQcWkLojdLYICEB+
         rlpkXRL7rL8ziYwIyN3xbS5FOpN0nEYpjO+u4HCUq8+3skzBUoVxkJAggt76HbqiOFon
         FL9mmM/XeLvIIgtDQg05/TXoHEXbUh/8uU/Kxky4huamaRw98jZ04Rq7WjtZ1riaHSKa
         Qwdv6wkhFxVeoot0NQnbdaUO+AlcTopGnd1rZzn3aZgY/mPjgIsGxpbKOTJhCqZ3S3mj
         /0EA==
X-Gm-Message-State: AOJu0YyVBQj2No+T8DCOmNmxiY1wP5bpOInAkG/qd1LMwo36b4iHC6ZC
	CT/VMENxhI3sn6s1QMbdn9fC6BAvlFWsyXOksynGRZrfR+X+ud5G9G40jZJP
X-Gm-Gg: ASbGnctU2HKoLb2EUolozE78V32HA3WMT3wPMp2zf46F+id3HTQ1zeRR1goMfR/6Vbr
	2DNdPtYAhBegN3JG8H0X0t2FShq90f90bsGUOLw1x3SQz0mhUZneDsasVQxa6dplWsbIpnlQW0s
	/QsGq/OytbALFbFjWtq9aXUoS55sfPufSdmohb1dY4F762oKRqzAhUA2XnUKcirx5EUQvpdiMRp
	sD1mrazxTrEqGWiyYSeoTtP7+6ZssmbTIp+bi21CRceojLuLz26CnkbZeYcSyRYFYpysIMU7JOB
	XGrpOYdOFq0tl5F5h+dU6XUQ+2bSDjhR
X-Google-Smtp-Source: AGHT+IFZ5uJSDoAJRvjHG9jq+gwFAaiQI3qkM5B9yILeuhyoXCX7XH//vRAgcVg+zUzKPVMl4y7rLA==
X-Received: by 2002:a17:90b:57cc:b0:2ff:58c7:a71f with SMTP id 98e67ed59e1d1-30a4e692471mr2624256a91.32.1746169215679;
        Fri, 02 May 2025 00:00:15 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::fb82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a4745f920sm2152994a91.8.2025.05.02.00.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 00:00:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] libsdl: Stick to C17 dialect
Date: Fri,  2 May 2025 00:00:12 -0700
Message-ID: <20250502070013.3637845-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 May 2025 07:00:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117277

GCC-15 defaults to C23 and this component is almost dead.
it still is needed by few other recipes so keep it going
but ideally removing it might be a better thing to do in
near future

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb
index 2ccedae3ec..35870c4814 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb
@@ -40,7 +40,9 @@ BINCONFIG = "${bindir}/sdl-config"
 inherit autotools lib_package binconfig-disabled pkgconfig
 
 CVE_PRODUCT = "simple_directmedia_layer sdl"
-
+# GCC15/C23 results in following errors
+# ../SDL-1.2.15/src/video/Xext/XME/xme.c:218:5: error: initialization of 'int (*)(Display *, XExtCodes *)' from incompatible pointer type 'int (*)(void)' [-Wincompatible-pointer-types]
+CFLAGS += "-std=c17"
 EXTRA_OECONF = "--disable-static --enable-cdrom --enable-threads --enable-timers \
                 --enable-file --disable-oss --disable-esd --disable-arts \
                 --disable-diskaudio --disable-nas \

