Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E20D1D637A1
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 19:40:09 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2578.1765914008387127983
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Dec 2025 11:40:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YC1FqynM;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477a1c28778so55222265e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 11:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765914007; x=1766518807; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KJF7Ja17rfNjwQ9bTb8IkxzSgo5NV20xvqzviA2bW8g=;
        b=YC1FqynMhbtZKCRrZek8k2qwjEM7xsZDa47HKFXlVlc/lNBypDYRfZgJLzR0WKU50E
         Yk+wxXLvepeCa4SXYqpUi3xCFcudf+EpohPh7T67GMI4CPV7MU+N/u7097wOr/IpI1/Z
         JnjhYoGmlvlPrXVs8EY9Rtq2DjnOMY3cbJ4TxbIT0pxN5lDKMosq2Hni6WOf91TJkwyR
         F9FHMAYYBtJN42zUj1GMGURztMTotRfUd7qmr3FxfoHWe4i+Ui2hfqQhnDsbMpmYf20Q
         MPH2toqxanvwnKoyN1EArW1/CbZKvqO2byDBn/NA+4k4tn4/Y4UMtBpwBfAofRVx3NdA
         jn/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765914007; x=1766518807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KJF7Ja17rfNjwQ9bTb8IkxzSgo5NV20xvqzviA2bW8g=;
        b=VEjkbGYnQY5yOCjRGXuh+p6leIMD6uqoyQgZfJKWll6f0OjbKRhhsyScp4JsQL4OkN
         sBb+rNaLFdKmiihUQuTWWg6ybiDKTm4EokXQFoukLyfUA8ZLJsHipN1eKHu2cbq7dtjI
         pTMySZKp8vDX2hBNxtLuNZxHV9p6ofG/kr1A1KVgTVva9IokaaEYTIZdwLUM/4PS00RR
         12d/cPA2hn2o1L5+Vbdxtf4ctHDd5wL8i36ka5lneRt+FGjGiX6QQhNYz9oERXYOVNCV
         j1vWuhx2tz/XmotXKTeZ8V9LK1UtNUDO/asqlN376jJt6YrseKXrPZ0BFvXWhB8mC5mu
         +n7A==
X-Gm-Message-State: AOJu0YxY075qYo5dSVS+sexF4YIVvecTnUa/qcRgH5v3OgrSSP/2+ad+
	buyXCVXttgOAhcbUTB8Y18hNn998wmwBA7bL+81+7b6zQEVrncF4roW2D/LB/g==
X-Gm-Gg: AY/fxX43aif+P5SG3NzgtujQQ+p/sDpgPjv/2mj74RWBoPST27gnHDqcMAvTxlqMN1j
	0iIwR2sc2KGJSxCCbNnegyKeLgPJJ9URVuEXNcXbaqCf1kGMlf68sLfgPngSQ4IlHqA7DMRUq8E
	v58wgaBB9rhlbF21lD/dkSUuobiGrij7GTf0PvKXTWyrA70yoY5dKCylI0m9vXAgqD3OvHRU+bS
	Mznd+GW4/l80LqAHiT8X0vuIekLPkAjZtQBZVYBUNgIE/fRaxhTtxQZYgSnPDuqDy/4KYMblKYJ
	IKxf4ZeTBJjH1lgqofP6YmQYh/Vdts4X0tJUDajmTRlCrMcO8ehseVV1OEymeXT3ONWd4EcFawQ
	ryf0bKMfjiWl2pXQwDIFDbRabtboDmvrdNIgIacjjIwFdxdEA/dFc2rfqqF/HofIulDx0WxQO7b
	ejpFka/98hKyMO+dtgODo=
X-Google-Smtp-Source: AGHT+IFpU/ig64Y8WgTy7dcTnMKh+SERM/mLlI9K0XcQ2yugO3WcvYXA0CH0EpJUssoviPu8lCrpvQ==
X-Received: by 2002:a05:600c:608c:b0:477:9fcf:3fe3 with SMTP id 5b1f17b1804b1-47a8f70b09bmr175260415e9.0.1765914006494;
        Tue, 16 Dec 2025 11:40:06 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47bdc1defb4sm4741395e9.9.2025.12.16.11.40.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 11:40:05 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 1/4] accountservice: ignore CVE-2023-3297
Date: Tue, 16 Dec 2025 20:40:02 +0100
Message-ID: <20251216194005.3006575-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 19:40:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122707

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-3297

The vulnerability is triggered by a patch added by Ubuntu, and the vulnerable patch is
not present in the recipe.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 071a45c9d76c9a222c8fbaa50089a8af44f44e74)

Adapted to Kirkstone
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-support/accountsservice/accountsservice_22.08.8.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-gnome/recipes-support/accountsservice/accountsservice_22.08.8.bb b/meta-gnome/recipes-support/accountsservice/accountsservice_22.08.8.bb
index 439958c7d2..702b11d9f0 100644
--- a/meta-gnome/recipes-support/accountsservice/accountsservice_22.08.8.bb
+++ b/meta-gnome/recipes-support/accountsservice/accountsservice_22.08.8.bb
@@ -30,3 +30,6 @@ FILES:${PN} += " \
     ${datadir}/dbus-1 \
     ${datadir}/polkit-1 \
 "
+
+# not-applicable-platform: The vulnerability is Ubuntu specific
+CVE_CHECK_IGNORE += "CVE-2023-3297"

