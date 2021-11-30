Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2704DC433EF
	for <webhook@archiver.kernel.org>; Tue, 30 Nov 2021 19:36:59 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web08.81656.1638301018133529406
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Nov 2021 11:36:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=NxqB5f+T;
 spf=pass (domain: mvista.com, ip: 209.85.215.182,
 mailfrom: jpuhlman@mvista.com)
Received: by mail-pg1-f182.google.com with SMTP id r5so20890634pgi.6
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Nov 2021 11:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=HHVAp0a/q54Dlt4qDzAJ8ZkKRhlGWZf0AGo4gxrKOPc=;
        b=NxqB5f+Tn/DSnBq3fU4AfnaszV2/jXJq9GfDhrekGZIEKVThz1parz8t45iRAYT9de
         +z+F1zoFmiNkXg2kS3/tstfcOIrUWvUSq2via0uYuSz5XmOaVLRqOZjcDbRciqCCRXNr
         i1392/Pga+qYlVaB6EKTK0X/yggXPTyJ0et0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=HHVAp0a/q54Dlt4qDzAJ8ZkKRhlGWZf0AGo4gxrKOPc=;
        b=qPO0gM83hY6ka3RaXqIFvbfmvfNtVrVaElvT1KE6DlSNQVOxxDPCG8tBy9FNhlcfq3
         lzFiIEfBQHIKBcIvOzuGRKBSvRm2nbCcde36odAcw3WV8xo3bDfIBXWlh9Lw3kdLcDTc
         /XC/wCDC843/23REm9qABKIDSSgzXbA5UryWs7iOFgOToMGic7He7urulbSkr9amUY6F
         RsGBsfRuLv+WCGUdh9lEu40A8AbUKFwCe2iyTICoWEEGFjrJTJBf9bAMdTWiyiQYOeqf
         O9ZxQEPDYA2WXBJiFBMBr343FO3M8PwgAjw6dIhPWTuMhOlLDvq/d2ejHpHFG4Oz8sJh
         NDYQ==
X-Gm-Message-State: AOAM533TiA+JjoULEFvt0fA22hMEmsa2AyRT16EJyZVzryHw6WVvIYw9
	oY8bPNOcP/3hGrJQA260aCzVNTqE/6Sy0w==
X-Google-Smtp-Source: 
 ABdhPJzDcFUsPWRJag3aqsVGS9C7HaJxEsjiN7khvEGAuMHjWi438YVcJoJwQNcoRIiqyBrBZvYoPQ==
X-Received: by 2002:a63:8aca:: with SMTP id y193mr995020pgd.170.1638301017233;
        Tue, 30 Nov 2021 11:36:57 -0800 (PST)
Received: from blue (99-14-97-149.lightspeed.frokca.sbcglobal.net.
 [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id
 f5sm3094729pju.15.2021.11.30.11.36.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Nov 2021 11:36:56 -0800 (PST)
Received: by blue (sSMTP sendmail emulation); Tue, 30 Nov 2021 14:36:54 -0500
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Subject: [meta-networking][honister][PATCH] ifenslave: switch from master to
 main
Date: Tue, 30 Nov 2021 14:36:53 -0500
Message-Id: <20211130193653.32079-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.13.3
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Nov 2021 19:36:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94149

master branch has been removed from upstream

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta-networking/recipes-support/ifenslave/ifenslave_2.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ifenslave/ifenslave_2.12.bb b/meta-networking/recipes-support/ifenslave/ifenslave_2.12.bb
index 34607f94c..c8cf135b0 100644
--- a/meta-networking/recipes-support/ifenslave/ifenslave_2.12.bb
+++ b/meta-networking/recipes-support/ifenslave/ifenslave_2.12.bb
@@ -9,7 +9,7 @@ inherit manpages
 MAN_PKG = "${PN}"
 
 SRCREV = "88410a7003c31993e79471e151b24662fc2a0d64"
-SRC_URI = "git://salsa.debian.org/debian/ifenslave.git;protocol=https;branch=master"
+SRC_URI = "git://salsa.debian.org/debian/ifenslave.git;protocol=https;branch=main"
 
 S = "${WORKDIR}/git"
 
-- 
2.13.3


