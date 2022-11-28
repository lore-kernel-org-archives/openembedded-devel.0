Return-Path: <aj.bagwell@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7CD1C433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 15:31:40 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.121012.1669649499033841739
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Nov 2022 07:31:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=M5sxWqV/;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: aj.bagwell@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id c65-20020a1c3544000000b003cfffd00fc0so11957607wma.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 07:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nwXIwrsuhLoQEZ08y7WJcuBOI1anxauTp0XM+0dm86E=;
        b=M5sxWqV/fP19UG9Tt3/UALT3YyYHqUkykeNUrBCiVZyKXc83Ecswb3gsICLhL5ktyo
         agyMAlFc5zJVw2KlT9P28u8kRW9f1Uh20PwPjyCYLOEJfBpLPfvxYkvO+FM+do9pWoIN
         gKP4SIatHAGtI1h8bw1X+R5BHprCO2xAaGPLK6mRo180jaslHOn6e9NxOq/sE6ery3JM
         Fl7u2iH3KPszPnnTm1eQ2toATkWoA9QGhL4Elz88ZJdHVGdXCHNdc62RN7FlpRzp32VW
         xn3ec3GHt3vFRvlw9jEYG1vMV6qCpZ1yE7L6OHiuqzvLNjwLDIiDMtrvQDx8ronpP9RO
         DzeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nwXIwrsuhLoQEZ08y7WJcuBOI1anxauTp0XM+0dm86E=;
        b=BzXGAvnRtCXzwghO62hx58oMN3+VWNKyGgjOJmB1bSZ4Pf7I2Lilj04cRh41eA8X66
         0y+BU8SOtoJTwDmsZm0aIZiP+t+okAEB2ArxFiZNBh2MVvmGC+15fCzWqxk3BTGUn0P8
         Hf7ayyI+eaqZ/iy1i9BTjcJgFBOtNqJ94YLx1o2w5aFVGepQXxKJy/Lfgozv4WgUh0mF
         td9xyKFisDbO1+JKUAWVhevao0KOpHLBGpqmuQjl0PsWPl4SXF802yyHocc7eIR4Ra99
         QC3HX4R7sXxllsDYw8mjWz1d2w8UgXOk8zok0qLxCO9XnoTB1GIpRQpkBTHazlOrxP+i
         6YFg==
X-Gm-Message-State: ANoB5pkna+X1qIQikuo3S6xLJifYLH77yOhV0TPJciue3BaJV7hQjP/v
	fhxg/wW4ISbpgyX5u2B9EUz6IVeXRIo=
X-Google-Smtp-Source: AA0mqf7SZjApHdqxMHz0bySnY1ENjyQc0OwEoGRB79nid/aI59C133vyCX+i8G5UX34LEtdmTTlslg==
X-Received: by 2002:a05:600c:688:b0:3cf:a18d:39a4 with SMTP id a8-20020a05600c068800b003cfa18d39a4mr37038634wmn.125.1669649497097;
        Mon, 28 Nov 2022 07:31:37 -0800 (PST)
Received: from CMM-C02QQ1FQG8WL.cable.virginm.net (cpc92720-cmbg20-2-0-cust203.5-4.cable.virginm.net. [82.21.82.204])
        by smtp.gmail.com with ESMTPSA id fc12-20020a05600c524c00b003b4fdbb6319sm20098010wmb.21.2022.11.28.07.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 07:31:36 -0800 (PST)
From: AJ Bagwell <aj.bagwell@gmail.com>
X-Google-Original-From: AJ Bagwell <anthony.bagwell@hivehome.com>
To: openembedded-devel@lists.openembedded.org
Cc: henning@itconsulting-heinold.de,
	otavio@ossystems.com.br,
	richard.leitner@skidata.com,
	AJ Bagwell <anthony.bagwell@hivehome.com>
Subject: [meta-java][PATCH] jsch: Variable CVE_CHECK_WHITELIST has been renamed to CVE_CHECK_IGNORE
Date: Mon, 28 Nov 2022 15:31:21 +0000
Message-Id: <20221128153121.94166-1-anthony.bagwell@hivehome.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 15:31:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99830

Signed-off-by: AJ Bagwell <anthony.bagwell@hivehome.com>
---
 recipes-core/jcraft/jsch_0.1.40.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/jcraft/jsch_0.1.40.bb b/recipes-core/jcraft/jsch_0.1.40.bb
index 07d5b9e..071d76a 100644
--- a/recipes-core/jcraft/jsch_0.1.40.bb
+++ b/recipes-core/jcraft/jsch_0.1.40.bb
@@ -26,7 +26,7 @@ SRC_URI[md5sum] = "b59cec19a487e95aed68378976b4b566"
 SRC_URI[sha256sum] = "ca9d2ae08fd7a8983fb00d04f0f0c216a985218a5eb364ff9bee73870f28e097"
 
 # Whitelist the CVE because it only affects Windows platforms
-CVE_CHECK_WHITELIST += "CVE-2016-5725"
+CVE_CHECK_IGNORE += "CVE-2016-5725"
 
 BBCLASSEXTEND = "native"
 
-- 
2.37.1 (Apple Git-137.1)


