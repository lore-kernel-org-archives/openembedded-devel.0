Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAACBC352A1
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 11:25:20 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web10.12781.1670412314790615748
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Dec 2022 03:25:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CF2Mzq64;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: festevam@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id t62so20328349oib.12
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Dec 2022 03:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3BoI4z7N8P9rDQYKz1Rj0g9qEL5+T75IwRgtKMFBSdU=;
        b=CF2Mzq64n32x3ni79So9NnbViSMZ440JYI2QXtx/dAwQx9WaWQhTDZEPc2MqzEC54P
         g6QPOOJF2cNeke9M47WVbZ8A0qhCQrJ4IoIhVjIxaii4DSqAE+cQfXklgaQc4xTwZN/Z
         y6FSqU0EaiacnBOq/zjM1R2+mf301CuddGmGO2HyNUatw9oC/bFeoGRA0Cy2MgD+oDEK
         hddy4FTagj4P9EsrQxW0UWU/pIHPB0Q2HyhpRdWqbdqri9d1aQCTcewUoVVGCssj2ygl
         Zl93+Z9vLPHzp7zC1Tx+sxB3V98kQ9Kv/ebWr87emzuuNwrzoCsvlryLX/29HSPtrGAi
         c7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3BoI4z7N8P9rDQYKz1Rj0g9qEL5+T75IwRgtKMFBSdU=;
        b=s/po0qntNLas27RntvEnmqLYcSwuxQKHg8dGR3MPsu/Ket+K5/fMNYm3GNmsMnuafO
         xQIZBxnpijtIRD/uC8ED+yrJMLlQW5vk4c5N11HPZs4P1mgeHWn86gK5EBpGpMWcBEGi
         ydMiszUft90w8sMA7JzB2bAiYHZhl/g3ZCUSf5aD1SKEl8mYwJrhkk7CzyQ3AeGH94Sf
         XhvUa62TDlsJ0C4Pn3u00JY8VSfPSdqItOq0kpEOWldB30pYC9DtzEWfQghmHH/trJVz
         hwaMZR3RcJDOqDTn2po8x7L1NI82eWpLSXSxdm/1LE9id4UwsNPQkIpL7t8DD10Oc76+
         ICkA==
X-Gm-Message-State: ANoB5pmaTFwP5TBZwd6ZPJwebUlyEZldrVP9CDixl0nXU37nSwjjnN3y
	tEZAZZ5Ig0/rHtjqiKy2UkaKIxt3F88=
X-Google-Smtp-Source: AA0mqf534Pt9S4UI8gPj/cY48VgGsihbomfWqCYjmdmrv3JPkXCaAYJpM0DKTiPHnunpuZ5Yl2h3UQ==
X-Received: by 2002:a54:4183:0:b0:35b:66e5:31f with SMTP id 3-20020a544183000000b0035b66e5031fmr36129751oiy.107.1670412313686;
        Wed, 07 Dec 2022 03:25:13 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:4b69:7020:e11b:29f:7550])
        by smtp.gmail.com with ESMTPSA id 128-20020aca0586000000b0035bd1909a66sm9230271oif.57.2022.12.07.03.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 03:25:12 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [PATCH] crucible: Upgrade to 2022.12.06
Date: Wed,  7 Dec 2022 08:24:57 -0300
Message-Id: <20221207112457.646480-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Dec 2022 11:25:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99970

From: Fabio Estevam <festevam@denx.de>

Upgrade to the crucible 2022.12.06 version.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 .../crucible/{crucible_2022.05.25.bb => crucible_2022.12.06.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/crucible/{crucible_2022.05.25.bb => crucible_2022.12.06.bb} (92%)

diff --git a/meta-oe/recipes-support/crucible/crucible_2022.05.25.bb b/meta-oe/recipes-support/crucible/crucible_2022.12.06.bb
similarity index 92%
rename from meta-oe/recipes-support/crucible/crucible_2022.05.25.bb
rename to meta-oe/recipes-support/crucible/crucible_2022.12.06.bb
index 73856d570..111b4955c 100644
--- a/meta-oe/recipes-support/crucible/crucible_2022.05.25.bb
+++ b/meta-oe/recipes-support/crucible/crucible_2022.12.06.bb
@@ -9,7 +9,7 @@ GO_INSTALL = "\
     ${GO_IMPORT}/cmd/crucible \
     ${GO_IMPORT}/cmd/habtool \
 "
-SRCREV = "837bdb65a20de240f92ea57727385352e06b977e"
+SRCREV = "6fc8c38cd1ae61b3855a3bd43b042dc5cdad7252"
 
 # Workaround for network access issue during compile step.
 # This needs to be fixed in the recipes buildsystem so that
-- 
2.25.1


