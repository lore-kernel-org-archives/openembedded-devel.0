Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39D7FC433F5
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:44:25 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web08.1196.1639601180161121361
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Dec 2021 12:46:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bf5293oL;
 spf=pass (domain: gmail.com, ip: 209.85.214.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id m24so17527734pls.10
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Dec 2021 12:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/+fXG731Jwl8lZux+y8jUyptTKm0frbZcRe1YxOri7k=;
        b=bf5293oLpENZdLhehmGgovjkkpVdESzoYH5aC+UY74Jofy6sr04UkXf4KhznGzvy6c
         lRbZPPKZdXUfIlUfrAbRJpvLXohw4h9lJBBAsjiUU2qFPxP914CNDQQmVW18Un+2tXmP
         Fe/NkNHZirAeA+iFvqWfeCZXW998BDym8XhGFhxcnuwk7fYSaa7Z1OqN+9afEmdLCtXF
         LqiX8w6TgJuUa1QTto8LCb3YvAuMpBIK6s3GkGEn/q5dxhOem1aisiwkDHzFsuDm4605
         ouv0btXg8DUEvpvbbNJaJRoh+JPKtUMNlSLPXpNR79Dxt2b96fs7qkbfrUaKObfmb5f8
         9tLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/+fXG731Jwl8lZux+y8jUyptTKm0frbZcRe1YxOri7k=;
        b=VmPgcUlJWHJwHOFN2R4NGB4Y4TkzF6hC2954JMaJny8uOvJu8f9cxYyM3IiJjIos+r
         XaecletqLB1d/E0/axVkLK/yOtwyeGG02OT5OeOAxQcYVP/cdQ5Y/aumn5XqP9KLejJ6
         f8wv9kXScXOOHOI0cmBQp2LllmegE2cud3Gk3A529uA+VRpFsezZPb9yr9ZAW/NrWVK6
         xNfJKIxOxv3LDXd+Jr6978W5Sd5q7eS2RLWG5hAGP8PR+8CKbkgWKihu6KEnzBCSmI1W
         f9oJEhmmpYZ3aA8hsffSlk1IlpvGtJKRDTMcwyhq/z4cABgQuIAgd6XND+C9ued85/Bf
         j4Ew==
X-Gm-Message-State: AOAM5315sd00IpROkB6Pbba9dI+hXCdarQaNG5zyqSmQ/ss67/QpJP54
	dx2XL0CtBeY12YitF5K9NYPcgOeiLQAIlA==
X-Google-Smtp-Source: 
 ABdhPJxEi4m6e9sknNFB1RLZ2MFqswJnVxFR8YHQNuI8zkBhMO7yOXVnwNciWwID8tfklNnFP/E5Ow==
X-Received: by 2002:a17:902:e84f:b0:148:a799:beef with SMTP id
 t15-20020a170902e84f00b00148a799beefmr4750028plg.160.1639601179389;
        Wed, 15 Dec 2021 12:46:19 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2b9d])
        by smtp.gmail.com with ESMTPSA id
 h186sm3464698pfg.64.2021.12.15.12.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 12:46:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] inotify-tools: Disable -Werror
Date: Wed, 15 Dec 2021 12:46:16 -0800
Message-Id: <20211215204616.1903526-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Dec 2021 01:44:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94374

This is to squash a new warning popping with glibc 2.35

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/inotify-tools/inotify-tools_3.21.9.6.bb   | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools_3.21.9.6.bb b/meta-oe/recipes-support/inotify-tools/inotify-tools_3.21.9.6.bb
index 489ca56b91..e3a4e6350e 100644
--- a/meta-oe/recipes-support/inotify-tools/inotify-tools_3.21.9.6.bb
+++ b/meta-oe/recipes-support/inotify-tools/inotify-tools_3.21.9.6.bb
@@ -15,6 +15,10 @@ inherit autotools
 
 EXTRA_OECONF = "--disable-doxygen"
 
+# workaround until glibc 2.35 is fixed for this [1]
+# [1] https://sourceware.org/pipermail/libc-alpha/2021-December/134215.html
+CFLAGS += "-Wno-error"
+
 PACKAGES =+ "libinotifytools"
 
 FILES:libinotifytools = "${libdir}/lib*.so.*"
-- 
2.34.1


