Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99558C7EE25
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 10:37:58 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.5777.1686220671310977158
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jun 2023 03:37:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=oVxiCpdw;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: beniaminsandu@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-30ad99fa586so451763f8f.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Jun 2023 03:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686220670; x=1688812670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xFZh7H4CvKv0V8+s6qVYC3E1PvD1Oi3yq42mMOOazr4=;
        b=oVxiCpdwLSWNlELS0HexH+57goPmIVMUtysyN++sL7lRWbz5y5RCk98jbjCOL117Yy
         ZW+Slan2wwX46EGpohQyqIrJPtkHH+DOFGbT5S8Loo/i8/9Ro0IZb5mrfFf1UNypM7Uo
         6CuC2TVPS1L4oBbb6k0kCOvk/giIr/fKkOaQZYMpKYct/IEbPZG7RQCzcXodOSgWTJdB
         Ab7dEeWHlSr0kN0njJXmleT8Shq9cy+3//dad8uA1vKzHDRQwTKadu4WU5AwSsu2saR0
         M0XncPaTOpHjiVBlDTJqz7aOZtE/l6Ifriz/4Gm2K3dh7frMOiCi8s5/05YrDPnPURYF
         axqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686220670; x=1688812670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xFZh7H4CvKv0V8+s6qVYC3E1PvD1Oi3yq42mMOOazr4=;
        b=KdE9EiKMY1+zT1+pgwlUqYS31UvLHE4hZTAx5rr3wu/EwDUAp4/qtrZUyA/B40kRON
         al+GkroV+XstzNT1usuKBOfPbV9yq18tUflNPi+op18WwVS/2JF/ZMkffBBe++O3E6+q
         PiR2V4xUtBLPcAoyXB3UkMmyIaIn7KuYD+wZOdjyR4F1lELCTJUfQ+Kne28Ap9znSQ/L
         OJOHhreu4UJ6SMGUuRWZ2espfpEnx3UpzwlGArM7ku6Bi3kVJouX0SBnBWcU2OIHdS+D
         2iwosDIiWgCKjpujAr3nWhIQYrpKqh64RI/+s3ZvK3m2rwEi//k/4Rr1rd/VzvcbcCQP
         vy3A==
X-Gm-Message-State: AC+VfDy1mmNqS1/dqQc7GE8sEN7oJYCfVUGi1YkizYdBZwmjgYFIA4mm
	dc5mJRd0qauz5bQeAeuKARG+lFf9iUtORaGK
X-Google-Smtp-Source: ACHHUZ6E8Wezh6162dyylB5erkL0mJFQUV0BSfnJm988FWq+ZkkpDxQR4RrsMW6FEUBBFb8L3D+jtQ==
X-Received: by 2002:a5d:4b8c:0:b0:309:3449:2886 with SMTP id b12-20020a5d4b8c000000b0030934492886mr6165593wrt.39.1686220669602;
        Thu, 08 Jun 2023 03:37:49 -0700 (PDT)
Received: from localhost.localdomain ([5.13.151.121])
        by smtp.gmail.com with ESMTPSA id u8-20020adfeb48000000b003062b2c5255sm1212020wrn.40.2023.06.08.03.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 03:37:49 -0700 (PDT)
From: Beniamin Sandu <beniaminsandu@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Beniamin Sandu <beniaminsandu@gmail.com>
Subject: [meta-oe][PATCH] lmsensors: do not pull in unneeded perl modules for run-time dependencies
Date: Thu,  8 Jun 2023 13:37:31 +0300
Message-Id: <20230608103731.103220-1-beniaminsandu@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Jun 2023 10:37:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103185

Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
---
 meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
index f821cdaf4..aba5ab587 100644
--- a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
+++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
@@ -151,12 +151,13 @@ RRECOMMENDS:${PN}-fancontrol = "lmsensors-config-fancontrol"
 # sensors-detect script files
 FILES:${PN}-sensorsdetect = "${sbindir}/sensors-detect"
 FILES:${PN}-sensorsdetect-doc = "${mandir}/man8/sensors-detect.8"
-RDEPENDS:${PN}-sensorsdetect = "${PN}-sensors perl perl-modules"
+RDEPENDS:${PN}-sensorsdetect = "${PN}-sensors perl perl-module-fcntl perl-module-file-basename \
+	perl-module-strict perl-module-constant"
 
 # sensors-conf-convert script files
 FILES:${PN}-sensorsconfconvert = "${bindir}/sensors-conf-convert"
 FILES:${PN}-sensorsconfconvert-doc = "${mandir}/man8/sensors-conf-convert.8"
-RDEPENDS:${PN}-sensorsconfconvert = "${PN}-sensors perl perl-modules"
+RDEPENDS:${PN}-sensorsconfconvert = "${PN}-sensors perl perl-module-strict perl-module-vars"
 
 # pwmconfig script files
 FILES:${PN}-pwmconfig = "${sbindir}/pwmconfig"
-- 
2.25.1


