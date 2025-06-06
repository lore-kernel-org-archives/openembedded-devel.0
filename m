Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAA6CC5AD49
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 04:06:36 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web10.26224.1749182785675868602
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Jun 2025 21:06:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LgVhxHHT;
 spf=pass (domain: gmail.com, ip: 209.85.219.177, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e7da099de49so1474983276.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Jun 2025 21:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749182785; x=1749787585; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bv062h4CPQdXiLRun8g2ZgGSNsZFu9qhYfmq8nwgmKg=;
        b=LgVhxHHT48X0qWS20dY/JL1uR4DWPjLjBQTltKdIACCbRfWgTTL0CHOplcf7ORQP0R
         IT8xQD6I9AL5XYTSP4aI+7h7CMtxemVgukqjpCShfd0q2cZEaKh0fpJ3NhJZ1Kqc/iUd
         9krRT7THYbPjlpTtnDKqaD6YPDxee/QqAqWJID6IG3m+sPGkqCO8j7vntFHcC+qPddjp
         kW8HXY/hWcF7WFnmyKkRIhc3mkCGAXGP9Hq6FuvF3v3O8cR4sY4YBvLO74l/jw0fVGEy
         FXe7C+cKpQc6m3QsjFNOdtS11+Q6ISxOZOR3vYtuQ8PaivqGplVTHBWHlHXeCTjhW+KI
         X2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749182785; x=1749787585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bv062h4CPQdXiLRun8g2ZgGSNsZFu9qhYfmq8nwgmKg=;
        b=f5A0Xpx3FkeNqcR9MOg9eOhMflEnkoXIWvJzxmTRRqDdyelqUopx8cEcIkEmVU0yaB
         3WyCZIQUStI9KMdZ2ZE1g+Ww9j+bBtxosiDCH48+R4pHzdSn9LHo8TD2xxPpCn4GrfPT
         LEwG2mvNSg4ROLOsMi3m+bxjRU5gm4h39UM8tZysAVjJptmknQR3/J3XxxDWWUhnMHsy
         ZV2OhVwfY1+QkPeBghgIfGrv91HybwiItfZCCI01aIAhWo0P0wzmUN0divQFKlyAjO7u
         IIRt8ttjMZ1y7+VmOiChQPSHR5VIPwdpPIRd7BdclV9aNqhIHxDiEGw/G2SG2OnZSiMY
         u+FQ==
X-Gm-Message-State: AOJu0YzsyE4cpQjdmLUNWmUdOApha2TlFVTPhZZ7JbTs5UmuItebDzUU
	ktN5GMHTqlKyr9o8Q+hM/Diij/1vBeEsfagfEN2qC/sb/dvPG0lpdP9wg95/o36H
X-Gm-Gg: ASbGncsA4qHj0EBTPmvsfzAGSWdOMEfZWRDmDmrDej6cpFK3HKor5G+ESjEObjV3e0W
	IjBTA6JCSBj7KgscSoaGWznirucjr7JRgXM/+qhyJxzOu5CZLBf89RQ3FDVS+K+S9A8o+jf0iXr
	gD9U8elVM5mAEp8Cz7kHqNNu11tx/BuvqfRL11PN3fjcQT04qgrQnE6HZ5v4sMPFnBAMHm+6ONc
	NuMCHJlqnv516HC9xQmq+xdV4fTAEm6ymVAjr+5LCPBNnowT9pbdKzH2VD/CUu8eqPev49owPRE
	vtK5tXu9FdPtHp/Z4z3fP6XjFWbGRu84FYbzeuWPVwyShVCSwAXoPN8dqfnocj7VtaEUCZfOPA5
	sMIHh4uW7tl3pa+gzWCeQ
X-Google-Smtp-Source: AGHT+IEEgWRHahqOCF3Om6Iyuf8x4QlPMm9zTCAtLDm1cGlehaVqFMhPM/RgMPpic5Sqfy+F39vexw==
X-Received: by 2002:a05:6902:2210:b0:e81:8946:185d with SMTP id 3f1490d57ef6-e81a233f7d6mr3250599276.43.1749182784334;
        Thu, 05 Jun 2025 21:06:24 -0700 (PDT)
Received: from localhost.localdomain (71-208-4-221.ftmy.qwest.net. [71.208.4.221])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e81a4157c3csm241440276.33.2025.06.05.21.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 21:06:24 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 1/6] xfce4-battery-plugin: upgrade 1.1.5 -> 1.1.6
Date: Fri,  6 Jun 2025 00:05:58 -0400
Message-ID: <20250606040603.2410505-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Jun 2025 04:06:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117754

Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-battery-plugin/-/tags/xfce4-battery-plugin-1.1.6

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...e4-battery-plugin_1.1.5.bb => xfce4-battery-plugin_1.1.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/battery/{xfce4-battery-plugin_1.1.5.bb => xfce4-battery-plugin_1.1.6.bb} (76%)

diff --git a/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.5.bb b/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.6.bb
similarity index 76%
rename from meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.5.bb
rename to meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.6.bb
index 16ebebf235..80a948a9d5 100644
--- a/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.5.bb
+++ b/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.6.bb
@@ -5,4 +5,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin
 
-SRC_URI[sha256sum] = "752233bfb320ee1e26104a656cbb868299f562733063e2b9a18f0966585ce213"
+SRC_URI[sha256sum] = "327d7304dded8411cd1a48da4f46bac248b44d8b27ffbc2036e0268cb37c3676"
-- 
2.43.0


