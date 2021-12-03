Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A4D0C433F5
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 06:42:21 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.8602.1638513740242534876
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Dec 2021 22:42:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=am7Xz3dj;
 spf=pass (domain: gmail.com, ip: 209.85.214.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id b11so1407525pld.12
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Dec 2021 22:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nm+p2Sr8vqBhBwU1bhT4FLspmipG3Aih0LyiB6UkrGA=;
        b=am7Xz3djSYK+YS37T7sKEpsFmSP2Or5ncCm1vSRYzIxqYL+eN5iMo7PXVPnciCOfdE
         KgjQat1nhRDFTD+4ohWaou6K1IC+AwYBEzfBrFx3KYVJvC+Vk55ws2eQ873cUh19S4/t
         G79YKoWpkopyztpQP3fOxQ/WjtpLGHsvUthIg9P4ifFpnz+Rv6c4XiY4fgIs4UDqby0r
         NpbEQbC9mFnzoG5JMr5avmvyX894aaRWkymbQ4snrDY/Q4siRC/7DnuwOjlRlr3UQWs4
         hQacdievmASpdEE5DJHDXO7gq65Y1bhqjIIF61lZILRlHOFPrNSf2x8W3DW+gMNhauKf
         CRZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nm+p2Sr8vqBhBwU1bhT4FLspmipG3Aih0LyiB6UkrGA=;
        b=N7GxsbspcGjngmuPIOYNgHQUYV2jNPSJgWF7zOjFIohnm99PYvotWvXPDDtI4J6Ams
         0J+1akZT6+m4qw7Ar+9omXF9zXK8E4v3goLauKqfEzCxQJsZY6bPnbT6nK90UYnd02dW
         Aj8D6posFLCytEjFwWzVVjSZB5wZAy2cSJCYy3ZuDOCHf2Miduu8zw+0y6PNlBzbsNzb
         sqM1m9RagQNCXC+NXUSIMnSkYE9+3IAGZ8fDfElVbd9+b8qB15LsLp9NMDiMp4OlEycV
         CGqoNoTQvy7n+MbEI/VJ4KUnDu57OmD/faXdVTcQEXrY88F0tHiMnOHiSWCBODqSJMmM
         mdNw==
X-Gm-Message-State: AOAM532FaQlZgRn821F1IaJw2JvrZo2UVMelPX1iFvzsUQtD8uUyrvTT
	qp8nwYvgvIvqSBV10BULn8dvmEDoJYSxWQ==
X-Google-Smtp-Source: 
 ABdhPJxTEiETPb55UHC4H0/fEaIJx+5Azm4ZPwPQx3bRZa6FkRVG7egY7blm53ftd4KlORkSS8UB3A==
X-Received: by 2002:a17:90b:2245:: with SMTP id
 hk5mr11951296pjb.6.1638513739491;
        Thu, 02 Dec 2021 22:42:19 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ce68])
        by smtp.gmail.com with ESMTPSA id
 n11sm1300956pgp.15.2021.12.02.22.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 22:42:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [layers][PATCH 1/3] meta-networking,meta-python: Fix README for yocto
 check layer
Date: Thu,  2 Dec 2021 22:42:14 -0800
Message-Id: <20211203064216.2609394-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Dec 2021 06:42:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94192

This ensures that Maintainer entries are as expected

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/README | 3 +++
 meta-python/README     | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-networking/README b/meta-networking/README
index 1aea8a6613..34e11a96dd 100644
--- a/meta-networking/README
+++ b/meta-networking/README
@@ -32,6 +32,9 @@ branch: master
 
 Maintenance
 -----------
+Layer maintainers: Khem Raj <raj.khem@gmail.com>
+                   Armin Kuster <akuster808@gmail.com> (recipes-netkit)
+
 
 Please see the MAINTAINERS file for information on contacting the
 maintainers of this layer, as well as instructions for submitting patches. 
diff --git a/meta-python/README b/meta-python/README
index 194bac39c7..8b62ad32b3 100644
--- a/meta-python/README
+++ b/meta-python/README
@@ -41,7 +41,7 @@ git send-email -M -1 --to=openembedded-devel@lists.openembedded.org --subject-pr
 Maintenance
 -------------------------
 
-Layer Maintainers:
+Layer maintainers:
         Tim "moto-timo" Orling <TicoTimo@gmail.com>
         Derek Straka <derek@asterius.io>
         Trevor Gamblin <trevor.gamblin@windriver.com>
-- 
2.34.1


