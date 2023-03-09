Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F433C64EC4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 17:16:33 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.19810.1678382191579970641
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Mar 2023 09:16:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gkuyN1Wq;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: twoerner@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-536bf92b55cso47084617b3.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 09:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678382190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tmj1ihFBE1bQGIQw99DxTUjszAfhmFFkw3KdppK6AUI=;
        b=gkuyN1WqcBFkgNJ8nlklutWItjKol1F5mmTmCNrauLWNktAhV3YiQHY8Aw+m1zM9jN
         lzvYb6YB0AWp89mp9blUvYw2j2fOpuGXOBBr6IpKbJqnEIM2SSfz+9V8kE35MQYJQJWK
         Zta3QzOLABKoh198Hl/22X72kf2YbGQYwXIDYr6ye4OygyumwMo+B/9Rh4GyHiRgPJCa
         eGWwB2MoUVnjKJ5bbndZjlnHck4/rv7RPG7Nsno0ugcUl+Rk+z8JGh3DqdKiwsAd6Doz
         6QA3mMCwlB1vDbZs+3S2g9tmDpOybUDgJd4UjC84vLo4/JvHouyFQAIB3S39jkw39MSV
         6Kxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678382190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tmj1ihFBE1bQGIQw99DxTUjszAfhmFFkw3KdppK6AUI=;
        b=CocjQA5G4DSr7cjnH8OdZ916dS7iaCsezFIpRU4WyWGjC3WuIfsINhourJ78Iw5RLy
         QA4YbRaiipM8qKGQlMlHup2Os+A44tf8QBWd/V8LfxIDMPAyv2k7X8XOItvoHj/ODRFa
         1ar7y4pY+63LPEDLWRc1fN90q1dr310mSDAUxvM6WWFW5Vccqp41pvPyBcHn9lGnjzW2
         IS2/Os0MhpeHM+rAFUpHahLMtcdgQcAA1aaoDbHqwmLhpbZ6gH9rX7beHi1xDAuwwitx
         6NPp4TXAy9HUXq4woyRHuZKPofXsIAOzwD97FXYUpnxJQ7AzBFgkkp0DlvYi2xJdhXy2
         prjg==
X-Gm-Message-State: AO0yUKUXFn1bwcHQQovAgZk0CHXQXUeB6Off2coS9R8t/G87Nnh1/NCv
	h1W5SzWd8OlcvymBr3gy/Frz7WaSvBU=
X-Google-Smtp-Source: AK7set9lKnD7RadRhXbqx2X5eS1PUZd+NEDeDYgvfU1GWvdpIDezXwJwNdhxYFhoo8xdW8lkNo8Jfw==
X-Received: by 2002:a81:4890:0:b0:533:d31c:255f with SMTP id v138-20020a814890000000b00533d31c255fmr23006240ywa.5.1678382190336;
        Thu, 09 Mar 2023 09:16:30 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d15-20020a05620a240f00b00742562938cfsm14356602qkn.107.2023.03.09.09.16.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 09:16:29 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/2] cups-filters: remove duplicate configure option
Date: Thu,  9 Mar 2023 12:16:22 -0500
Message-Id: <20230309171623.28428-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.36.0.rc2.17.g4027e30c53
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 17:16:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101459

The '--enable-ghostscript' configure option is specified twice and doesn't
need to be. It's simply a boolean; it's not the sort of option whose position
is relevant, or an option which modifies its immediate neighbours.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-oe/recipes-printing/cups/cups-filters_1.28.17.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-printing/cups/cups-filters_1.28.17.bb b/meta-oe/recipes-printing/cups/cups-filters_1.28.17.bb
index 22de3d544127..0d3560b9c2ac 100644
--- a/meta-oe/recipes-printing/cups/cups-filters_1.28.17.bb
+++ b/meta-oe/recipes-printing/cups/cups-filters_1.28.17.bb
@@ -15,7 +15,7 @@ SRC_URI[sha256sum] = "270a3752a960368aa99d431fb5d34f4039b2ac943c576d840612d1d818
 
 inherit autotools-brokensep gettext pkgconfig github-releases
 
-EXTRA_OECONF += " --enable-ghostscript --disable-ldap \
+EXTRA_OECONF += " --disable-ldap \
                        --with-pdftops=hybrid --enable-imagefilters \
                        --enable-ghostscript --with-gs-path=${bindir}/gs \
                        --with-pdftops-path=${bindir}/gs \
-- 
2.36.0.rc2.17.g4027e30c53


