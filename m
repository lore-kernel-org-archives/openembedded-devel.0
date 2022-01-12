Return-Path: <nishaparrakat@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E19BBC433FE
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 09:15:49 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web08.20882.1641978949128625950
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jan 2022 01:15:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UR9xRrcC;
 spf=pass (domain: gmail.com, ip: 209.85.128.52,
 mailfrom: nishaparrakat@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id
 25-20020a05600c231900b003497473a9c4so2997630wmo.5
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jan 2022 01:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tvh84gM3BRIXDEU4o7G5Iq9w0ZHcJ99h6igVqTjgy3A=;
        b=UR9xRrcChqy4uv7FjRShgCqX1NFLM9gyiyPE36MQrl8p617eNEQx9fSHEbvigk6Y9o
         STl+ChG0RpVgUKzVwHb3gDNJO0KR1O/Fqfc/ngkSp9dAdN7Rt5QbxNFbg9tjF/xCwL6E
         KTM7UZfupl5DitLc/7uvzQO7YCz6FQWd8p6UOB0rP0HFh9yNBOLrwrlQgqA4P3z0wRk8
         IZYKIxD4/cYftwo4c9sWHbY5Avq3uAW1fvGvlbCEQxxZ/VqxW2s9klyrv1p9Os31fPor
         xgNQ1qGvYfkgEMXHieCUAjVBzYeELLklOAPqxgcV0estwxqaSHMpzqjxrDfwGgXyln8R
         0C6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tvh84gM3BRIXDEU4o7G5Iq9w0ZHcJ99h6igVqTjgy3A=;
        b=qKWdtZL9Cm/Ux+FGNL8hVQhO8LVgr1gysvDndSYulpaZYohR8Ia3LsXeHL4GVPcO79
         iQkwVh8ip3utjqKmrIeGcvDJW/g56eBV3s58cVzOE+b5hpi/y0jMkdfMzAX3uEGw2SIW
         ZS0QQUa9dQepr2ohcyN5VGR6ApZ15N8bCpK8g9M7u0gEFmZH6b/Ev3t+3YNABljK1YXF
         capjvTPmlbIMC1f3KsCV0AmSmajc/Ah/4sJPfrRxAU6pkH2EufhiM8yUkbj0RuMM4+0y
         5tbe8Ne63Pn8mK7vAiOXPc+lKkbdcZnY87jGsAtoR6rzpH5e0n7diEPKgr8h0UgOYCyA
         s3Wg==
X-Gm-Message-State: AOAM5335DMdCFyCVJ1ss2Q2F+Hq4iIwJjqogLEC/kQgSo0a848zs7uIP
	0LxkXHHWrv5PkDDFeXk41dOQCD5qjY0F1g==
X-Google-Smtp-Source: 
 ABdhPJxFJn5qur75w22hv0jY5Ce5Nf46W1AizdSFK1buGZCyzDdUPteg2H7AlzCLP7pM7TEqMhnQ8w==
X-Received: by 2002:a1c:7316:: with SMTP id d22mr5894594wmb.5.1641978947724;
        Wed, 12 Jan 2022 01:15:47 -0800 (PST)
Received: from nishap-at-office.bmw-carit.intra ([212.118.206.70])
        by smtp.googlemail.com with ESMTPSA id
 w7sm5883472wrv.96.2022.01.12.01.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 01:15:47 -0800 (PST)
From: Nisha Parrakat <nishaparrakat@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com
Subject: [meta-oe][master][PATCH 2/2] nodejs: upgrade to 12.22.2
Date: Wed, 12 Jan 2022 10:15:29 +0100
Message-Id: <20220112091529.4853-2-nishaparrakat@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220112091529.4853-1-nishaparrakat@gmail.com>
References: <20220112091529.4853-1-nishaparrakat@gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jan 2022 09:15:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94782

upgrading to next maintainence LTS version

Signed-off-by: Nisha Parrakat <nishaparrakat@gmail.com>
---
 .../nodejs/{nodejs_12.21.0.bb => nodejs_12.22.2.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_12.21.0.bb => nodejs_12.22.2.bb} (98%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.21.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_12.22.2.bb
similarity index 98%
rename from meta-oe/recipes-devtools/nodejs/nodejs_12.21.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_12.22.2.bb
index 22191a157..8d533199b 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_12.21.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.22.2.bb
@@ -26,7 +26,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
 SRC_URI_append_class-target = " \
            file://0002-Using-native-binaries.patch \
            "
-SRC_URI[sha256sum] = "052f37ace6f569b513b5a1154b2a45d3c4d8b07d7d7c807b79f1566db61e979d"
+SRC_URI[sha256sum] = "7fd805571df106f086f4c45e131efed98bfd62628d9dec96bd62f8c11b0c48dc"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.17.1


