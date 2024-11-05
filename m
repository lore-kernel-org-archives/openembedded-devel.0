Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19EEAD33A5A
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:17 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web10.27892.1730831946077493170
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:39:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l4TETXEj;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6ea85f7f445so30730887b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831945; x=1731436745; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bDNv/q5pgO92V+UgIPnrmyOAbWSOqpc5R2H74km8UFI=;
        b=l4TETXEj/VbnxPoEvH3Qi7tUMIl40Zl4s6+x/evgN14j+oIvaq1f6gOyzc/BSzPg0/
         P3RX1hgqCUA/7KZ2C/yNN0ErScJwC4ucmu8LXVVatt6KFls2jMY3yiaI6VGSdFM8SL7Q
         7rKlt+sesy26Tpwwevxcps0EV84N1UXeikGZnIYXNE7R7HltnNfgr2Nl1sfa1aZeVO23
         Up9+Qyc4+JUUoRj0TmaqE5Bb2Nx4lt2DyZ6vIve4SYa/QbBa1Js4283YOm3BgLmtq4b1
         alasLljPrQXpYNWN98mcP/pVaNNdC9/YxWZXKdWNTsWmSPnWktNgzpiaHLCYNk43pydo
         5ILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831945; x=1731436745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bDNv/q5pgO92V+UgIPnrmyOAbWSOqpc5R2H74km8UFI=;
        b=GPJU8J03704P3fxupTM3RKr9woSMRB0RBKh3OND8qDgGQToSs/JuiPISS9HGuJEPbg
         WberEV2tluy7ly83oNlBB9YP8PsNx0Rh2ttVhEk+6hRsNNm3+UX7nyXKQ//BMzjZQLyZ
         Y9fU2qLkIDl6W9wPHwaUPqYsyT7Aikw7tt9hJvL2Ol44cfWRouyp3ICHBwDKtfqcmzvU
         0eEUJJVy29fCLw9T1/BDH7nBiU9OLJ4odkKPuQ3lvCDoVg+DDo0CtK43v+/Fmu4rbtv4
         tb4ocxQDSGoIH5cg5/QoTyCyYgbrrlC/joiXa6EEFfYU3l1UNuK0Uj/Wpi6OIokRogpy
         dsJQ==
X-Gm-Message-State: AOJu0YxskUBwxCK9zxpn0F0wb2goHz6jJBR8w6wVmDIYTVP/gg3J6I2d
	vvs7Ywquid3gvTiw6hna6q7nBy8CWIHzoGxe46MS7iw2Nk0HhEGr8lafWxFI
X-Google-Smtp-Source: AGHT+IHZkRTTGA/3Aq3n+jlGklkU+YjZdnFBgAOOwuQxp0bGhgjZVU920DnKTxovT2M6Z+bub9LZow==
X-Received: by 2002:a05:690c:6f02:b0:6ea:1f5b:1f64 with SMTP id 00721157ae682-6ea521cb7edmr232197307b3.0.1730831944648;
        Tue, 05 Nov 2024 10:39:04 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:39:04 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 081/161] ttf-gentium: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:57 -0500
Message-ID: <20241105183658.34982-83-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113596

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb
index 2439766ad..84cd30d3c 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb
@@ -32,5 +32,4 @@ FILES:${PN} = "${datadir}/fonts/truetype/GenI*.ttf \
                ${datadir}/fonts/truetype/GenR*.ttf \
                ${datadir}/doc/ttf-gentium/*"
 
-SRC_URI[md5sum] = "4c3e6ae586be277537ebb68f2a45b883"
 SRC_URI[sha256sum] = "4746c04c9a4ad9e0788a38e0a2f81919a630d8070ceabc89f156b6d41d8ceb37"
-- 
2.43.0


