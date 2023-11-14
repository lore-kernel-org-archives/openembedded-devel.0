Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E6CFC4332F
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 10:07:20 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.9659.1699956438370385557
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Nov 2023 02:07:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=bFZUNAel;
 spf=pass (domain: smile.fr, ip: 209.85.208.178, mailfrom: yoann.congal@smile.fr)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2c504a5e1deso73915421fa.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 02:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1699956435; x=1700561235; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9vL58IEFBGIamS6mZtDM4vNTufljQtPTlnJsapDEGtw=;
        b=bFZUNAelaPjLdrxYmx/t8W7bvRmOAPD4EvsXQPiCR2y1SF+NBiOlmNYFw1srDX0OEX
         7HPhrFVIdLqIGJINrlzvu+YtqxzDkfrQX1vz9vj9vY7iknrPH0/24UL1c/QGQiOq0Gg+
         SdsWtFN8G9sWe14AGZwORQ4q39gTu3iRP94ABgBiyM+a2qx42xzP1KIh4dPIYrSJ2Jv1
         e2Hz6GYFZgtSCHoQcFJliF+dcs00k/nLPb9m0DIWrMkrYRqbld8EATgdJOCSXAth74OQ
         Ncd/sjjxF7Bjeee4PBJXvCvv7Mw30vCEimoGAgniT/LQhEhOnhHa7hHCbJeVmKLHz9+O
         pwSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699956435; x=1700561235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9vL58IEFBGIamS6mZtDM4vNTufljQtPTlnJsapDEGtw=;
        b=Vqi76stI8WnqQKg5rk3or8cWOyV4WruistI7xQwW8yolGjAIGjR9YM9Lw2UXXnTeMH
         lX5oxxmXJ6Nwd55NemWqfMmm2IxE42sxVnagm9e40tJJ/sfL4RhxKa81rxbpFLzE1DoW
         qf+CW0zEv+rgk13048fkHTWWUCzNKlZ2opYVyiPqrgXKTWMBXutrHuLLuDk/cJMjkFdr
         tn8I4m5btDewfIIZxmevufl1fw/uzAKlkqcRUaySeYBDDX+Mgb1ranhnqGPHdeMExMHf
         5PWFrqUSFkX6utJsAcbx1muIIvuqx8xliRD5A98z0+jkN8/GvqImnMSA4hwlMFemPtJa
         G+tA==
X-Gm-Message-State: AOJu0YxzPRc5WdGfRexrWMicdB3noVjmEAJhsOZ3Jsq458J6aCEqtlqv
	2Y368hdblyQkQvhN3J+OxpYqgAL1Kck1vDfiGVE=
X-Google-Smtp-Source: AGHT+IFXBdYwD3Y5hVotOPo/nBu/HLrkVq+zhmi/5k/8j0IOYRT54XyCiR7BEDnwZyClrqfpgIVc/A==
X-Received: by 2002:a2e:9b17:0:b0:2c5:582:fd8d with SMTP id u23-20020a2e9b17000000b002c50582fd8dmr1377930lji.30.1699956435587;
        Tue, 14 Nov 2023 02:07:15 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id m15-20020a05600c4f4f00b004083bc9ac90sm10862562wmq.24.2023.11.14.02.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 02:07:15 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][kirkstone][PATCH 1/2] emlog: Add PV
Date: Tue, 14 Nov 2023 11:06:59 +0100
Message-Id: <20231114100700.3273936-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 10:07:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106703

From: Khem Raj <raj.khem@gmail.com>

This is 0.70 release with few more commits on top.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 08edc0b6ace0d04688a5617cf05546a7b8ba6cca)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-oe/recipes-core/emlog/emlog.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/emlog/emlog.inc b/meta-oe/recipes-core/emlog/emlog.inc
index 824787083..9d48e9cba 100644
--- a/meta-oe/recipes-core/emlog/emlog.inc
+++ b/meta-oe/recipes-core/emlog/emlog.inc
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "git://github.com/nicupavel/emlog.git;protocol=http;branch=master;protocol=https"
 SRCREV = "aee53e8dee862f35291242ba41b0ca88010f6c71"
-
+PV = "0.70+git${SRCPV}"
 S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE += " \
-- 
2.30.2


