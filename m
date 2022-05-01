Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3B45C433EF
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 16:26:59 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web08.159.1651422413216943224
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 May 2022 09:26:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FWr6wP4L;
 spf=pass (domain: gmail.com, ip: 209.85.216.46,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id
 z5-20020a17090a468500b001d2bc2743c4so11105642pjf.0
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 May 2022 09:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=GP3hrrQXq/al1CreBgpsPRntkbdtcqv2hLe79u5Nqrw=;
        b=FWr6wP4LWoZ9AkjCU6qQQGFTO9RR6jAXM7DY+xpEt2sD+z2BpB46r7D4MHCFWiNZxD
         XiJZ0mfQDx5REA/k7cwAcalBuszL9F094OzUrUr3blU65Q+c3Y8SUtOYwq5Ra6yg1LE0
         U/Tbu+iBrAb55LFflbsXTfsyKg9LvOUGaQoFiYwfiplSOeCQO/dcPKvi6FxJQEl0nLSt
         GDIygc6F6jbRptnyM7XUDn3f2Dd45IYa4qpp3vSKTv+lZWSoweiIQbomrmHjswwUEKHD
         jysqXfaDMDPX0jubYY/3FTq68fPaSD3bO7aIL6kzvnAxEoenTZi2rAViIjC2AD3udADt
         cszw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GP3hrrQXq/al1CreBgpsPRntkbdtcqv2hLe79u5Nqrw=;
        b=Ct94Ru9CPjxPdV5c8waGbcl7MvSTVtCtFGIePpAFRDqzcQQQZCdFQ9cPdZNccf00nI
         UPcKCb6dYI5BVZy+ydSFSTd+UrWGPeXH9O+qFXGo6G2WJGp2MZg2jO4CJAcba9Sja3su
         K3WD/SP/IlOuwIme0wmPl23JqrC6YRwhq7wwd+cwevIQBD5cLMSTDX9HeP0D5SB95488
         IzOzyXOEPXMQjpVeY9L7Ee8HC8vH22DTJhnYPn/GBpPj6ER16C2B6QicxcZ3gDdudoNE
         VCsyWjhHvcVz1+YIe+qnlFV/hpyvBtw9GTEDHPwGImPONPGQoMJP2j3QO9Z6Ob7BHe60
         rBgg==
X-Gm-Message-State: AOAM531F4H4TL/3UcEuuiSpLWwZjV+r6qZukORTdBFizCYWsDE+JrVT9
	+tYYoz2Sbc6WCKXm/E1L5yQ3z3X7mNL5yw==
X-Google-Smtp-Source: 
 ABdhPJzTpYFccylDRwlQsl6w9Icorcj2PbQqV9XZup6k76zjCsQv+dmK13qldsPwGNUyBL2xXE3wpw==
X-Received: by 2002:a17:90b:4c85:b0:1dc:5778:5344 with SMTP id
 my5-20020a17090b4c8500b001dc57785344mr1746532pjb.8.1651422412396;
        Sun, 01 May 2022 09:26:52 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:9a0c:5968:29f0:efcf])
        by smtp.gmail.com with ESMTPSA id
 h19-20020a170902f2d300b0015e8d4eb243sm3063569plc.141.2022.05.01.09.26.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 May 2022 09:26:51 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 04/10] nvmetcli: move recipe to meta-oe
Date: Sun,  1 May 2022 09:26:37 -0700
Message-Id: <20220501162643.513646-5-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220501162643.513646-1-akuster808@gmail.com>
References: <20220501162643.513646-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 May 2022 16:26:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96916

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-support/nvmetcli/nvmetcli_0.7.bb                      | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {meta-networking => meta-oe}/recipes-support/nvmetcli/nvmetcli_0.7.bb (100%)

diff --git a/meta-networking/recipes-support/nvmetcli/nvmetcli_0.7.bb b/meta-oe/recipes-support/nvmetcli/nvmetcli_0.7.bb
similarity index 100%
rename from meta-networking/recipes-support/nvmetcli/nvmetcli_0.7.bb
rename to meta-oe/recipes-support/nvmetcli/nvmetcli_0.7.bb
-- 
2.25.1


