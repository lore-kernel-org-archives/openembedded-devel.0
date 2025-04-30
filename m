Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DC3CC369DC
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 22:04:46 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.7100.1746050678569512969
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Apr 2025 15:04:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=HBKaPvZs;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso1392095e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Apr 2025 15:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1746050677; x=1746655477; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z3wuRnXFBDstuSlAYMXBsBQCm/a61ENwrlIKQFDa6Bw=;
        b=HBKaPvZscf5GLJoNw+0K5tJrUqPumN1BXul9ZVu2LkYvGOd6+dXifodPKTTURRn+Tl
         BYnsImSnIKYs8KIdYXRt1GnDsrbsr6MgzupyD51RkACXONo0hwc/d72ao6VCs/NbcFFP
         6VTc58BKwxL0dLx/EUsO47v52nuYVcTbDIIP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746050677; x=1746655477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z3wuRnXFBDstuSlAYMXBsBQCm/a61ENwrlIKQFDa6Bw=;
        b=LML6yIIkN+hJ8nt42QQqddFOHlC2VS1auIppz4Yys+aKJifjP3/qgkYcfkiysn71hc
         QEN/bZa1oVj6owZKHqdXONpEOXzrmav8YkRSId4Dp5kYWuNmUypk6faSIa4JZ7O3NG9q
         KITeFE/GZEUDpIngc2rQZG7SEkDNTncsP8kI9EbE9PRj8hsKLAEpHZDX4JGuDCxvyRDD
         rrzHj2X1PQzS0xkg/o7h9jpJ9XyJS25JoDJKk4X8E3PhyP35Xax/AzLX8vCVF3nfWItL
         +becqAmPrjk173UrrVhCOLiljEir+Ku8xwcCAqhOLB3nzOk9yGmVKd5gpELoiJ05W6VU
         ekEQ==
X-Gm-Message-State: AOJu0YxpvymuicOHXxWLG5UobHWLsuW0HApgQWA8enBGqxo3vB2yTw2e
	NReMWFji5eYyCrkLq+7YmJN8CnuXeOeZpiFW73W/JJzwiOdWyiY0YbGFPzWtVMsI4E/NNWL9mTM
	P
X-Gm-Gg: ASbGnct0mWc1Et+D0dFJd+AL6p7c2jraU6PoAZNBN9Oa8mjRvPbPNu5kFXoc6XD74Kf
	mkWcLtih6IPU+jqh60eGiYyN/A0l8A4trn5YITO5ne9H5xxMebMij4NEkj8hpgSNMrk+yeevgbt
	w4q7KS47nfiwEswCO5/CskJK47X5fw7nq56q04NG8vrgG9EQMhquMmVHIUAHc9sXEvFrP/RFNEi
	n7A55RkP3YPYedBY/I91a63vWEUQs1mhoB/PwR3OHXn/qPHzu8rq4KR38RDkMSGa8D2bVigEt2n
	aBTm3MHlC8Uowu52njE102ecmaeoWPSSikJqSvjULCzy6iQPVNiKEiEQBrE30esJP2kFaUTmcQX
	TJrMdHaWNWFlxaFIQnp58XzZ839gS3GWIyt8zdJf2yhjFi08M
X-Google-Smtp-Source: AGHT+IGB26WVT4q08XTopOJ6+NBM6W4vwZ3GG9/lRTINHveLe80CPqWLdSwrwxoywpz2NOYovntGjw==
X-Received: by 2002:a05:600c:a4c:b0:43d:8ea:8d80 with SMTP id 5b1f17b1804b1-441b64edb23mr7123515e9.5.1746050676676;
        Wed, 30 Apr 2025 15:04:36 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa0017b58d8bf04048c3.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:17b5:8d8b:f040:48c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b61c4db2sm6172175e9.36.2025.04.30.15.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 15:04:35 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH 3/4] reproducibility: mark apitrace as known non-reproducible
Date: Thu,  1 May 2025 00:04:00 +0200
Message-Id: <20250430220401.4149372-3-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250430220401.4149372-1-yoann.congal@smile.fr>
References: <20250430220401.4149372-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Apr 2025 22:04:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117264

From: Yoann Congal <yoann.congal@smile.fr>

apitrace packages are not reproducilble.

Relevant logs:
- https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/42/steps/32/logs/stdio
- https://valkyrie.yocto.io/pub/repro-fail-openembedded/meta-oe/oe-reproducible-20250426-pazz3nt5/packages/diff-html/#reproducibleA-tmp---reproducibleA-tmp-deploy---reproducibleA-tmp-deploy-deb---reproducibleA-tmp-deploy-deb-core-------reproducibleA-tmp-deploy-deb-core-----apitrace_--.----.--git------fc--bb-r-_amd--.deb

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-oe/conf/include/non-repro-meta-oe.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/conf/include/non-repro-meta-oe.inc b/meta-oe/conf/include/non-repro-meta-oe.inc
index 5c8fc30052..ff93db3a21 100755
--- a/meta-oe/conf/include/non-repro-meta-oe.inc
+++ b/meta-oe/conf/include/non-repro-meta-oe.inc
@@ -1,6 +1,8 @@
 # List of known non-reproducible package of the meta-oe layer
 # Please keep this list sorted
 KNOWN_NON_REPRO_META_OE = " \
+    apitrace \
+    apitrace-dbg \
     asio-dbg \
     asio-ptest \
     asio-src \

