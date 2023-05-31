Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2641AC7EE43
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 11:13:23 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web10.11443.1685531594844197382
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 04:13:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ndNb53nj;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-568928af8f5so12454827b3.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 04:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685531593; x=1688123593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jSNmyXDXOFVqI86Ez4I17znjpRBjXvqBniGGZyQc1Ag=;
        b=ndNb53njnLHugh3hGxpxsvi5svccY0IozR1w24GroC7J5Es+hcBccdl5lqxrUjP9Jb
         +xzUO9886wgDdsx1J2RtFkAOa6zSpCSo4xg2xPNVqgpDaKn1GlNG0M/EBrF488qAcuZo
         nLut80I2Nhdd/N/keffwiVp+O+X0+WYBNHisUvaz2U3bamYQpNQ8/yN35HdbYyF5g1Jg
         NP0aB/Y1WpwatemFpct7iumEjbex8rwtrbS0BJaz1CDjQpBCiWOcDEzwVhy2mUIZ/y1Y
         vZfWPQT4T8DypAVugU5cVnqaVLXDiiT44x7YMy2QRC20cJty6l46Cs8+KSitU9zVeqqC
         WIGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685531593; x=1688123593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jSNmyXDXOFVqI86Ez4I17znjpRBjXvqBniGGZyQc1Ag=;
        b=K/XBhM6vnIJHPXSEKUac5hH0UgnKqP7In3mdzQTfdRpkuwi/E9gKXkHBK7GPKnn9K9
         LsjRKg/bckbKnyVC9rh7p9uuzMl2ZHaZkrEYc7VzHmoPZhOG+ShuOrkDaKNNwjCMvSye
         ot9uTA4Ab8ksSH9pPN8SMmtKQMS3HCe6llQCNPBL7EHSzj3TeXG4qdg7p2z0L+R1oyQy
         ocCM280BvsR9bs/4YDPhYO7+uFvz52uxbDAZ//287vqEpWAMlu32X7WIoOuL5mTR6ErC
         LBGJBEfhydttt/NJgphZ080bfFVl/jAQhCiCYQw4pbPGvKDgLq8DiUzr+hkRnrzLuzix
         3pRw==
X-Gm-Message-State: AC+VfDwRbvOwBlN0JS2aieiB7BTG2v8g+MxHzboss9qqdQiNatqpaIIb
	6fe7uEwKe3zbaaPl2esiRRiPNYqEkXA=
X-Google-Smtp-Source: ACHHUZ4nnGi/aXCoB1C6SyMw5bR/kDw4q62720UlRTjFgf9NUIf0O+vjTCThKglVAnYZF73FOzon1A==
X-Received: by 2002:a0d:e2d1:0:b0:569:7d6:e41d with SMTP id l200-20020a0de2d1000000b0056907d6e41dmr464213ywe.11.1685531593535;
        Wed, 31 May 2023 04:13:13 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:a3c5:f403:52db:88cf])
        by smtp.gmail.com with ESMTPSA id t129-20020a814687000000b00545a08184fdsm5246897ywa.141.2023.05.31.04.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 04:13:12 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 04/36] libirecovery: Add missing build dependency on readline
Date: Wed, 31 May 2023 07:12:37 -0400
Message-Id: <20230531111309.2454603-4-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230531111309.2454603-1-akuster808@gmail.com>
References: <20230531111309.2454603-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 11:13:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103033

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 99bfb84be3d31c1bde74ea831c2a9404e92c33a5)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb b/meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb
index e3da1819b2..dcce524246 100644
--- a/meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb
+++ b/meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "\
 
 HOMEPAGE = "http://www.libimobiledevice.org/"
 
-DEPENDS = "libimobiledevice-glue libusb1"
+DEPENDS = "libimobiledevice-glue libusb1 readline"
 
 PV = "1.0.1+git${SRCPV}"
 
-- 
2.25.1


