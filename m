Return-Path: <flowergom@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 144ECC3527B
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 19:49:24 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web12.1821.1649187951324799334
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Apr 2022 12:45:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cznbXett;
 spf=pass (domain: gmail.com, ip: 209.85.214.179,
 mailfrom: flowergom@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id p17so21994plo.9
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Apr 2022 12:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=KFRNk+v1fj9GzvieqdbpBpCGn8rV0PIzkwN0y/xzuuQ=;
        b=cznbXettB21TDJS24tOunj+sRwGCeVcJJ3T5zwcKYEn5idrP8XwPTq1lKt2yCNxSfU
         AV4hmCRkluV50pAXpxL2T4UR4Hpfd77BhCAbET9s31krrzTDM/k5kIAv2yT4lDbQyxjJ
         PDZa1B3im7WKcUg2x0Pq/o7tEzMZKyF098PZzRciouS+8uLeLf2HyPDvvBnmtUxWam9Q
         mIftGe6ORfJBCppOu+ekyZjn/mjErOp73ZKRN8MqG0gtaPMGdsB4Abu4me4KGT55P2m9
         v835U60jolhOGmzDOCjpBaqpqk/ihPbB9hPr6vFwzHo5w/1VVBrjZQDInK5lNLPj1EGV
         WeTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=KFRNk+v1fj9GzvieqdbpBpCGn8rV0PIzkwN0y/xzuuQ=;
        b=WiFw0YfXo2TdShXiAsu6ftQemWRYPejTbrPgA8RqqOYefRnltnH6ocs5Wtibhckulf
         KMz7t8+S6fphBqtF9wuZHuM3nUZW0JReZwqiiDMqiO4ZD0VbaWrG9kiBG5yDSNhnqQ7F
         GBFuuYKuImWBQ8aDSTKN4ZhiKHLpQotCxYa51wpDiXH4tDs13Z7KNsNXlv/5ziD4yTDi
         xdAX6l17EnXg4q0w5bGqv+38zNCgY00E9ynbOz5UCdbxnZ41v6fARBMKEiJ7qTa2GEyF
         cwcoGSg0wLaEqzv41N7vycJ2+PFQ9v8edEeu88E5eeGWPZ7FhzpdZRCwT4/dt78lhpLs
         u9ZA==
X-Gm-Message-State: AOAM532xuKGMrddCyx/yJiLqW+gxtas+pUauu+mLoj3He1IZ1rcjSxrs
	ptRKBP7BFx+jS4AFb+y/VcRMebg3KXTc7Q==
X-Google-Smtp-Source: 
 ABdhPJzmfzgYN39bGT/r5riGr8RGexvWNj/bxevLZUZtdKPzfh5yC0ZVCwQ1ExU+CVFnZVF8FBoygg==
X-Received: by 2002:a17:90b:1c88:b0:1b8:a77e:c9cb with SMTP id
 oo8-20020a17090b1c8800b001b8a77ec9cbmr5889695pjb.205.1649187950281;
        Tue, 05 Apr 2022 12:45:50 -0700 (PDT)
Received: from localhost.localdomain ([121.168.114.144])
        by smtp.gmail.com with ESMTPSA id
 br2-20020a17090b0f0200b001caa0db90d3sm3238878pjb.13.2022.04.05.12.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 12:45:49 -0700 (PDT)
From: Minjae Kim <flowergom@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [meta-oe][dunfell][PATCH] multipath-tools: update SRC_URI
Date: Tue,  5 Apr 2022 19:45:25 +0000
Message-Id: <20220405194525.251-1-flowergom@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Apr 2022 19:49:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96431

The git repo for multipath-tools was changed, so update the
SRC_URI accordingly with the new link.

Signed-off-by:Minjae Kim <flowergom@gmail.com>
---
 .../recipes-support/multipath-tools/multipath-tools_0.8.4.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
index 3cff3b90e..90cfd7d20 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
@@ -29,7 +29,7 @@ DEPENDS = "libdevmapper \
 
 LICENSE = "GPLv2"
 
-SRC_URI = "git://git.opensvc.com/multipath-tools/.git;protocol=http;branch=master \
+SRC_URI = "git://github.com/opensvc/multipath-tools.git;protocol=http;branch=master \
            file://multipathd.oe \
            file://multipath.conf.example \
            file://0021-RH-fixup-udev-rules-for-redhat.patch \
-- 
2.17.1


