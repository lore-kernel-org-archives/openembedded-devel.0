Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD0FC433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 19:48:38 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web12.2840.1643917717076881206
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Feb 2022 11:48:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JInnjhuR;
 spf=pass (domain: gmail.com, ip: 209.85.210.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id e28so3101380pfj.5
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Feb 2022 11:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J9unuVSxgVgezmEm6hwVetWmqC/RVp25t/mFTGDqUy4=;
        b=JInnjhuRezf22xnFMDKOmVIPbDmZUFLDzDDmSloEJkAuqYyv9W22pEkW3TOBFimt0L
         0hEIG8z9SJwesIfMxOGbBiSTAhYdv1LfYuVGIVKMrnepj0holMdY9r0w+ONzXgnvpFBF
         2bkUPBwtHURhWtS9d4j+1OVlsh+sSNO+WINqHvyYTe1JpHR2yC6g7CElaEYoC6lw5RfW
         V4TUCmX+zWiMtDoP9ak28vth2Ox+S9VWuYsDyuXaNjc9O4EL3mdvrzirZxLh7AAFzsMK
         o+paOexisVYyLWBOxdXkd4hEf/8qPsriWi6gbFwqJUb0ZI9HUoW6sEduE9Jk4u/RpPrj
         KBBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J9unuVSxgVgezmEm6hwVetWmqC/RVp25t/mFTGDqUy4=;
        b=AMe8pgfgWXethoEqgooueoA7133O3O1a0b57ENfMEzJzv21jkWakjTBKrdU4oIh328
         65mJ2yHXSRA9cB8JjG931krovsDA3CMd6LW1MkRmXhIebcpKGnw5fIRCDx70PqW5XDe/
         sK9c6e+0g2PtUSq4pMl40wMvw1dDI4dW6HH+6AsBJgmedncbST9YwZsNNtHyxQcCuJ4Q
         u8bw11jsO+lU330xtL7HGmD2mU6oW1eqLTVVcnWX170TmgouR6rm4lrmLhGBvHIlVGNb
         jsmr7cWLFc+rW7gFimI4WqOnB/OLYcEfNkHGGxzQP1FZM7jPnJc/amIfSsn2iLugrTrk
         xrQA==
X-Gm-Message-State: AOAM533wGRe3nEdr10/2FJxrLZweH23jj93SoT8oD6tyhMvJPuEzFV45
	HgssiaClJ6/qCFYha8ZvGieADlIQcb3hGA==
X-Google-Smtp-Source: 
 ABdhPJxsCTCmodkHBthEf5waonyKOVCgjds4tFWwpnUc0hv9AM+6iC0SXqMD9+UieUMJEJzRQpCUVQ==
X-Received: by 2002:a63:ec02:: with SMTP id j2mr14079595pgh.349.1643917716213;
        Thu, 03 Feb 2022 11:48:36 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 c11sm30780867pfv.76.2022.02.03.11.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 11:48:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] pcp: Disable parallel compile
Date: Thu,  3 Feb 2022 11:48:33 -0800
Message-Id: <20220203194833.3698685-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Feb 2022 19:48:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95215

This fails often with
| chkacc1.c:8:10: fatal error: localconfig.h: No such file or directory
|     8 | #include "localconfig.h"
|       |          ^~~~~~~~~~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/pcp/pcp-native_5.3.5.bb | 4 ++++
 meta-oe/recipes-support/pcp/pcp_5.3.5.bb        | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/meta-oe/recipes-support/pcp/pcp-native_5.3.5.bb b/meta-oe/recipes-support/pcp/pcp-native_5.3.5.bb
index 029a47531b..5f3c9b6f00 100644
--- a/meta-oe/recipes-support/pcp/pcp-native_5.3.5.bb
+++ b/meta-oe/recipes-support/pcp/pcp-native_5.3.5.bb
@@ -46,4 +46,8 @@ do_install () {
     PCP_MAN_DIR=${D}/${mandir} \
     PCP_DOC_DIR=${D}/${docdir} 
 }
+#| chkacc1.c:8:10: fatal error: localconfig.h: No such file or directory
+#|     8 | #include "localconfig.h"
+#|       |          ^~~~~~~~~~~~~~~
+PARALLEL_MAKE = ""
 
diff --git a/meta-oe/recipes-support/pcp/pcp_5.3.5.bb b/meta-oe/recipes-support/pcp/pcp_5.3.5.bb
index 290dbaaf4b..bd09985af3 100644
--- a/meta-oe/recipes-support/pcp/pcp_5.3.5.bb
+++ b/meta-oe/recipes-support/pcp/pcp_5.3.5.bb
@@ -219,3 +219,7 @@ FILES:${PN}-dev += " \
         ${datadir}/man/man3/pms* \
         ${datadir}/man/man3/pmt* \
 "
+#| chkacc1.c:8:10: fatal error: localconfig.h: No such file or directory
+#|     8 | #include "localconfig.h"
+#|       |          ^~~~~~~~~~~~~~~
+PARALLEL_MAKE = ""
-- 
2.35.1


