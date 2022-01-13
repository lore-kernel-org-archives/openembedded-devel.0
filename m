Return-Path: <nishaparrakat@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5895C433EF
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 08:13:11 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.6280.1642061591071291954
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 00:13:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=l8cYX7q+;
 spf=pass (domain: gmail.com, ip: 209.85.208.46,
 mailfrom: nishaparrakat@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id c71so20091371edf.6
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 00:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tvh84gM3BRIXDEU4o7G5Iq9w0ZHcJ99h6igVqTjgy3A=;
        b=l8cYX7q+c1FxGL2fyzybA6pUcfOegZ8cBo4ZUQiRX6dRvzRZ6/6D7K0yGy1gQAl/Nn
         HDIb+KZ+BC9hk7sfHuizxmA2aBgrJ7Jnmsws9VN+arb8YT8Zyyc2REGIXCfaP59/rWsh
         D2N1m7s0et7n6Wpdu8M5FUY/O2KmK008NpdFQVWOnPDLVt3fHqVizVPdKA56O0THCU//
         uj8jaERlI0zHsgoVp1TRGX+Afqk1kxIM2qlLwWR/leYPxCPeWxtH0SL6H1zMs0++XNIJ
         t9UuyPmDAxr4/BFWSobX9PrIcH9t7DqJqpVaxLwgY/oI/A6cZX/I7X2Xg06QkO2d5QYS
         74uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tvh84gM3BRIXDEU4o7G5Iq9w0ZHcJ99h6igVqTjgy3A=;
        b=COUvYPoqkbmDVP4QfxMpLVl9zFufwaXBNs4E0DJVIPaimm6DQ+MlMomKcEgty4u7d/
         H7nNJ+ffj+4qAaHRr+76g9H5UYwmIvJK7/g+/Gi0cNJluSTx5TieYu+/t/PDc8aEXrYn
         fMWZmHUe7/ULGcg2IWhH/7yUMWCTsFJRxGxUtK+93lwdb1pvpH6HeWdlvbxBAd34MI4g
         A3ASdij17R6IDv0HqOsqs/t9TNz6AReB6FTpWpcJUoC7KrvbA36jgLpi7uViYEsFYFZZ
         WkBf+AYTsjf+wUPO5vIT4QTLpNcde6/Euj82x8Jb6r6s3LM1cT17S+n0vhtHsci+i3J+
         BQuA==
X-Gm-Message-State: AOAM531o93iAmGcpRTwPcy5CaRlGSLu5AqNMiQyTWAcq8Goj8hxgqhUW
	3wTwAVZPfSRgh9J3SdHhJ6C76eCtE8DwLQ==
X-Google-Smtp-Source: 
 ABdhPJyOewPlSFeysxoxiN8y5l+iLLe92/jC7TWgtvTz32BESBzDWu0zgk8nE8VTFOwc6zL7Dr4k8Q==
X-Received: by 2002:a50:d4d0:: with SMTP id e16mr3170275edj.293.1642061589616;
        Thu, 13 Jan 2022 00:13:09 -0800 (PST)
Received: from nishap-at-office.bmw-carit.intra ([212.118.206.70])
        by smtp.googlemail.com with ESMTPSA id
 16sm611965ejx.149.2022.01.13.00.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 00:13:09 -0800 (PST)
From: Nisha Parrakat <nishaparrakat@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nishaparrakat@gmail.com
Subject: [meta-oe][dunfell][PATCH 2/2] nodejs: upgrade to 12.22.2
Date: Thu, 13 Jan 2022 09:13:01 +0100
Message-Id: <20220113081301.26006-2-nishaparrakat@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220113081301.26006-1-nishaparrakat@gmail.com>
References: <20220113081301.26006-1-nishaparrakat@gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Jan 2022 08:13:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94802

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


