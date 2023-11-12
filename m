Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11B69C4167D
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 20:18:04 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.22583.1699820276225340942
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 12:17:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kOcyD3EW;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6c4eaa5202aso2155409b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 12:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699820276; x=1700425076; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=00waiFs8CYnTrrd96a5zWVngPjPGSaUjmWoQLY+H32k=;
        b=kOcyD3EWp3xcpOSg6VzLfugRf6JjWjvgVcvT8bhtVkQxWUo6QQF9q5oxnW+XlmCUVK
         Idezv3X0qr3FlVn5lqbYv9aVtEu4eXbELaDzbbKS2r3goea5RU6/VZRXo1EHv2HHEahP
         u0r806G6If71s+6FPQK6K9+sVustmQ1cFLBaDn13nTpDSElCKxzE8Z+ldGP6cPpXR4m5
         nIJyleYdylJH230ZJ/nh5kJkuPTukGJqCum1Z8j4iEF7QJNV/N3rQ92rI4Ob80PisVwa
         dhXZ31IPGQCtAB0DBsBs44qiLWOqhusV+8KaWutDr9QIk9V+agPVQoN+DMrCE2Pwcawi
         /VIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699820276; x=1700425076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=00waiFs8CYnTrrd96a5zWVngPjPGSaUjmWoQLY+H32k=;
        b=uz5wi3W/CHF9hFMTLaFV8rlLNq1w4l1K4Zv6Lz+CXrvirNP9zWO1TqOSsDPQ2lhBtN
         dIdB+FRF8g5+dq04a9Vr8IgOHqVmpUBuIBW9uFKwJ9KLdS96fdCs/E+H67TTCWeIV2wp
         4wMT3bmRfT9ZrMNP0gewhI1d0/u4JgxCnHN6prYh8oTBtawPgw+I9l8SAHHfgCeRoNL7
         UNHZR02GgVF10gkQ2TWvSqQ0v6pgYhREdRvukf7ZRsxAxB3ctCdtbxvqxoMr9pSgD3Hi
         MqCt7eEMtzz42LJhfIEqB6wqiM7nxdqSZRdb/mm6aSxeqnV9eY83Z9JzTkQ1hGp5PCkk
         r5cg==
X-Gm-Message-State: AOJu0YzKZRSFFV2qqeyYLHwlqqfq65p8fTfDHuN+V8yDF456sURBjQT2
	igeVuZE69uzUUbkotcWtTMc=
X-Google-Smtp-Source: AGHT+IEOKrIB0kE8VF9Xj+Cuh9j2i1YM1BNTvtqMekWDWtihBAFuxbZUHKfqD0K+0T+u1y5Yuc2KMg==
X-Received: by 2002:a05:6a20:1602:b0:136:e26b:6401 with SMTP id l2-20020a056a20160200b00136e26b6401mr6875314pzj.16.1699820275551;
        Sun, 12 Nov 2023 12:17:55 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id u8-20020a63df08000000b005ac384b71cbsm2954892pgg.60.2023.11.12.12.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 12:17:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 Nov 2023 12:17:52 -0800
Subject: [PATCH v2 5/5] toscoterm: Delete recipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231112-kraj-pu-v2-5-f38d4f960d44@gmail.com>
References: <20231112-kraj-pu-v2-0-f38d4f960d44@gmail.com>
In-Reply-To: <20231112-kraj-pu-v2-0-f38d4f960d44@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, 
 Otavio Salvador <otavio@ossystems.com.br>
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 20:18:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106609

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/toscoterm/toscoterm_git.bb | 31 ----------------------
 1 file changed, 31 deletions(-)

diff --git a/meta-oe/recipes-support/toscoterm/toscoterm_git.bb b/meta-oe/recipes-support/toscoterm/toscoterm_git.bb
deleted file mode 100644
index 654e886cab..0000000000
--- a/meta-oe/recipes-support/toscoterm/toscoterm_git.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-SUMMARY = "A very small and simple terminal emulator"
-SECTION = "x11/applications"
-DEPENDS = "vte9"
-
-LICENSE = "GPL-3.0-only"
-LIC_FILES_CHKSUM = "file://main.c;start_line=5;end_line=16;md5=9ae4bf20caf291afa94530026bd15229"
-
-# 0.2 version
-SRCREV = "8586d617aed19fc75f5ae1e07270752c1b2f9a30"
-SRC_URI = "git://github.com/OSSystems/toscoterm.git;branch=master;protocol=https"
-
-S = "${WORKDIR}/git"
-
-inherit features_check gitpkgv pkgconfig
-
-REQUIRED_DISTRO_FEATURES = "x11"
-
-do_compile() {
-    oe_runmake \
-        CC="${CC}" \
-        CFLAGS="`pkg-config --cflags vte`${CFLAGS}" \
-        LDFLAGS="`pkg-config --libs vte` ${LDFLAGS}"
-}
-
-do_install() {
-    oe_runmake PREFIX="${prefix}" DESTDIR="${D}" install
-}
-
-RDEPENDS:${PN}:append:libc-glibc = " glibc-gconv-ibm437"
-
-SKIP_RECIPE[toscoterm] ?= "Needs porting to work with latest vte9 >= 0.74.1"

-- 
2.42.1


