Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC101CCD183
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 12:59:36 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.7548.1759409974767729390
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Oct 2025 05:59:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m90P+HUC;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-62fc0b7bf62so1598443a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 05:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759409973; x=1760014773; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MQztPCfL76Pr8AMScoCBn3pCtb2KsS5VnDwYYrRQ2qo=;
        b=m90P+HUCjcmmKpIfgC45D7bN2Kh+bgOHOJPK6KhG159SUHTies1HT3YLFC1hg++F0O
         QKYL0RDiUzPRnw+NVkmKOKmXSC/VipK0USfMbrFVYG3CEr43xD8xSjsjq8iptq37Fch+
         /eoSw+vpkh1MK9di0denDubH97tzf9HY9aZVnsG5RDU6vQ0+EdyeqGYEX5Lx38g/Bed0
         SLoEmBIbv47TqaHI+JSYa92jINbU3JX5v1TCPix40a3MSaQKTQ3gO5sXzwUGRwBcrKS+
         FSKYrS+l3Tx6suA8RzM/P5O17IriQs2zwmCfPGSIywi9VkheKEwpoOJBHEtiXVZWFQFl
         4oxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759409973; x=1760014773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MQztPCfL76Pr8AMScoCBn3pCtb2KsS5VnDwYYrRQ2qo=;
        b=kHMmNP+z7pe+pRt02v8rhaASRqoWPAGYv8Ig8AEwJq0CleBanp7DeqDjkSmm9KG5sl
         ulpO/jWuLvYK5tFohnjmCS6yFH6qMWGtzlbCw1f6Ub2YLKmwm51ngEPWqP4/DZgVxjSl
         TAID2RX6ks3KZvwpcsETnoJ349EoqJjc7bUSqWwkxRhoTHNbbJqpwAWj+Fvu+BNR3NAU
         QXPhLpuGwi8iLKpu6pS+GOtI0vSPMKJ+3Axlqdao8kjmTw1T5JgtczJlXMQ89xFhjqqq
         rE4gwFO4HuF0QDYMxpv9ArG/QjlLU5heBgKIPxcSCcx30R7GIi/MA2WlOAzff2Pmjjj/
         Gp3g==
X-Gm-Message-State: AOJu0YyQyakqd6bjLwvexEb5dUYfPc5kifrEZBMY449IPFUSMgEA7GpG
	UqYTCxoh5isuAwyOWpLMskFgSDKBPuw+qGjcG0iMMKHiy4MIbHnkX2ayhBSEMg==
X-Gm-Gg: ASbGncvd+XMIcdw1JyueTcWfGHoHmOhLQISRNNBWJDRuFJ21A+jNprlOmmy2W6hKvjU
	Oy/BzHcK0NxTynWz9Qxtgs33lad5fZN3OuZSAzZV3s6k4GqAamdVyi9AABGxhnUh6JQTV7vIKBj
	rsUKVHnfPmG67cv6wbAFUvrYPUccRdxhwC8can1ikYPV/Ucz22YSjQPTciINhsojXICmPaZ+ZqB
	qtuezwzh+YVbbonbf4/t4ZLliajHETN8jtTYc9MJslDFUmaEcOaAC/gjeXJC6xvFsjFpM9V+4YF
	8Dr5355jB5SQ/XtjKMTMOAcTWSmPmLzM3nPD03qrfH1IKyAKa2+S1oSPRWD9dB2mOOFVWsQa778
	PtuTuJfqBtMdguSL+/D3zuUFu+22aJBRM8ka+NeKcLd+IPPxjQDgL+z4=
X-Google-Smtp-Source: AGHT+IEbYuAucXQMEi4chjbJv7cm6BywoB4VPtrdMjSfu5mFbdX9hlc8Gde6UIqs7xBdiz+hmXd71g==
X-Received: by 2002:a17:907:9485:b0:b3d:98fa:b3fa with SMTP id a640c23a62f3a-b46e8f7ddbcmr819460766b.50.1759409972964;
        Thu, 02 Oct 2025 05:59:32 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173b03sm194127166b.84.2025.10.02.05.59.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 05:59:32 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 07/26] multipath-tools: Use https for github
Date: Thu,  2 Oct 2025 14:59:07 +0200
Message-ID: <20251002125926.2624522-8-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002125926.2624522-1-skandigraun@gmail.com>
References: <20251002125926.2624522-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 12:59:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120176

From: Fabio Estevam <festevam@denx.de>

Per convert-srcuri.py script, github repos should be accessed
via https.

Change it accordingly.

Signed-off-by: Fabio Estevam <festevam@denx.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 4cef1e68ea59510d85b778e11179a2dac47c658b)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-support/multipath-tools/multipath-tools_0.8.4.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
index 0d51263f66..ee26cb742d 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
@@ -29,7 +29,7 @@ DEPENDS = "libdevmapper \
 
 LICENSE = "GPL-2.0-only"
 
-SRC_URI = "git://github.com/opensvc/multipath-tools.git;protocol=http;branch=master \
+SRC_URI = "git://github.com/opensvc/multipath-tools.git;protocol=https;branch=master \
            file://multipathd.oe \
            file://multipath.conf.example \
            file://0021-RH-fixup-udev-rules-for-redhat.patch \

