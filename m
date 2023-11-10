Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EDCCC4332F
	for <webhook@archiver.kernel.org>; Fri, 10 Nov 2023 10:39:34 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.24657.1699612770000519894
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Nov 2023 02:39:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ajFpuxQ6;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: zboszor@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-9e1fb7faa9dso318230366b.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Nov 2023 02:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699612768; x=1700217568; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I7hHuul8my0PqS8DUZVtLBnXBmec0tdPNhH6Wb7fdJ0=;
        b=ajFpuxQ6q9Jz1fQAadU1P9VkeBhLNEDcbTmRmfEfIknMU2ZdKdcPDlacYuqpB+uygb
         hRnIQ++OFWJGcdGkTo/jyKHmxjmBw6Z2pfvnL1z7+ShBlgBrQwoy274pERn+qKWcH165
         O51KD0kFTphTt5PIWmH1PjmDHn8F99aSoYzNKcsCVQiZ+SJPnWayrDR90prJHdWduSE/
         hndRUwApxv5IIXHoUJcGjZ3dTbfF8SpQwGCyE7Q0ShqcXAgq545vRS3MKrOgIahBcB7U
         zaEeEJTi/qRYLzvXnoF2Kjj4Ss0zdwjrlLAHsTj9FK9lFVJO6PCbBYMx+bZrgm5GhyrO
         8A2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699612768; x=1700217568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I7hHuul8my0PqS8DUZVtLBnXBmec0tdPNhH6Wb7fdJ0=;
        b=HLh8Aws1UeETHk0MI7rUkx32nmsPvnxikh4HtthPLTd3wK2iXxS4RRjyAvRoGeRRGr
         1Aoz71ZM7H1M+0yZDwhBbZ4fkNWlBGtipPDJK3bxnLOCxZuENSRNWTR3CdnMPXsJ03Mv
         0YV6u2Jp/zd7Zs06/ya0trCkwmQmg2DaQy2HNHaIPw6mDZ3dC03dRWigTe7nsHWH4L/w
         DJ7AK1T1CVo8niTIvx9pXl5gKzBtbuiCxWg1OnS6UPivYLTqX7hf8N+wxVDgjRitnZw2
         Py8zac4IuHApxB+0lWlQjTCCwm+foV4Mp/MOgpdKmBGpdpVjBNT2U4L/B1jCXzVhpScl
         o82w==
X-Gm-Message-State: AOJu0YwGUplQIIW/2gFD3Ko+k0+FGIXZ9yhhH5JJVpUL0ETG+LQy4qgz
	CgITUlamCgzXVdcyHQTz/r1B+R/vJwE=
X-Google-Smtp-Source: AGHT+IEZVD08XpZr4wUKOya78ZLhLL5Umvuu0/x0xhg4A6Qi04+Yx1yiKQuWIzD7pTUpnSDFUZ+/uw==
X-Received: by 2002:a17:907:a4c1:b0:9e3:fbab:e091 with SMTP id vq1-20020a170907a4c100b009e3fbabe091mr6393881ejc.15.1699612767529;
        Fri, 10 Nov 2023 02:39:27 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id f4-20020a170906c08400b0098ce63e36e9sm3814018ejz.16.2023.11.10.02.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 02:39:27 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][nanbield][PATCH] geos: Fix packaging
Date: Fri, 10 Nov 2023 11:39:24 +0100
Message-ID: <20231110103924.9814-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Nov 2023 10:39:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106535

Due to the library file name change, the subpackage "geoslib"
does not get generated, and the main geos package has unsatisfied
dependencies.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-oe/recipes-navigation/geos/geos_3.12.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/geos/geos_3.12.0.bb b/meta-oe/recipes-navigation/geos/geos_3.12.0.bb
index 95cb29775..0382e6bdf 100644
--- a/meta-oe/recipes-navigation/geos/geos_3.12.0.bb
+++ b/meta-oe/recipes-navigation/geos/geos_3.12.0.bb
@@ -13,7 +13,7 @@ inherit cmake pkgconfig binconfig
 PACKAGES =+ "geoslib ${PN}-c1"
 
 DESCRIPTION:${PN}lib = "Geometry engine for Geographic Information Systems - C++ Library"
-FILES:${PN}lib += "${libdir}/libgeos-${PV}.so"
+FILES:${PN}lib += "${libdir}/libgeos.so.*"
 
 DESCRIPTION:${PN}-c1 = "Geometry engine for Geographic Information Systems - C Library"
 FILES:${PN}-c1 += "${libdir}/libgeos_c.so.*"
-- 
2.41.0


