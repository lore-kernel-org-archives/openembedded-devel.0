Return-Path: <chris.chapuis@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15453C54E60
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 19:25:32 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.1675.1710444326230538988
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Mar 2024 12:25:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y9UQdQsq;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: chris.chapuis@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-413eb712c3fso8505925e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Mar 2024 12:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710444324; x=1711049124; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aygBXATKJlNCDeJ4zsV3zAgrJBzWXuB1efX/lmg9Glo=;
        b=Y9UQdQsqxRab8exxGAzmFizlZJZOqHt5jX4wlbCyQjQVeR6Mhl0WoH0PXlnzRHYDWB
         bUDwM7+/FQjTfJtJkeihz/H+o+ir6gpUtbsVMsrpAL3WiFfdjeDxdTpx4sDDwlVSMl8t
         lHeDL4FXlKM+jpKlewFwmgnCdT0dgziU+/ZlUayGEhDBeSAtvK9xzEb8IEQkh97Wq6Qp
         uNGe+U52taToC/Lj3l85QtgGzcwIaA9Yr1u/L6nlGVAB15DpLyG8HQ9oJuuIH6MZPO68
         DeC+4qcEqu73nDBCGXItx6ooofr/RQ0Cmkc+bE38mNEqbV9EA4DWdlfWcItFZ96reKVR
         BNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710444324; x=1711049124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aygBXATKJlNCDeJ4zsV3zAgrJBzWXuB1efX/lmg9Glo=;
        b=GFj/IoYq6XQEaxFdiPsM8BUXE4/JMEmKvkYup9XQP323xwWsjfxmDIdD7I8v7OYFaB
         MBnPLgYYGYmKfIOitD8dbims5WE/wlEahOao8kCaBdkY2NtCfdtgpdEj5guA7APohl6I
         qKsUCsc3pyiL4IvECQN+IzOnkJfEvFQ9ZUdg/0PnrR/XMPMOvjb+0ELo+m6FDv7ebDFc
         BXk1XVH697Q/jqXMhnXVinz++13P/OdmOndTY6pJ5HPQPYaEXdSVXlitYBCLN7yE8YGr
         2bVBICsop6RW7W7iWMMUdp27htq4Q0bF2FLtl9xSNVYR6jG6yKPb2L+M/MSg6LWuVdL4
         +Glg==
X-Gm-Message-State: AOJu0YwdEhq6Y2Sk/xk/0JeWneVcVu2tL78Zcc2ZeUGWLDWDpsOOTGPx
	HZPhVRqL83CZ5khvCCFjUS0cpiYqY3fQSdk8OmjrYJwo+0j9jjAOqwVxNFyC
X-Google-Smtp-Source: AGHT+IFP63w/vebQDxpFDKcSZoiQ/3odkda8DPj5dKcX03ZhH3jtRf3U+JFocUmV/24yRert58GlhQ==
X-Received: by 2002:a05:6000:245:b0:33e:bdea:629a with SMTP id m5-20020a056000024500b0033ebdea629amr832818wrz.67.1710444323903;
        Thu, 14 Mar 2024 12:25:23 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:5d9:6330:4d5:74f6:de66:f26e])
        by smtp.gmail.com with ESMTPSA id o14-20020adfe80e000000b0033e8c50fc3fsm1363103wrm.90.2024.03.14.12.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 12:25:23 -0700 (PDT)
From: Christophe Chapuis <chris.chapuis@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Christophe Chapuis <chris.chapuis@gmail.com>
Subject: [meta-oe][PATCHv2 2/3] lvgl: remove useless FILES include
Date: Thu, 14 Mar 2024 20:21:52 +0100
Message-ID: <20240314192153.202513-2-chris.chapuis@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240314192153.202513-1-chris.chapuis@gmail.com>
References: <20240314192153.202513-1-chris.chapuis@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Mar 2024 19:25:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109319

As ${includedir}${PN} is already listed in FILES, there is no
need to add one of its subdirectories.

Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>
---
 meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb b/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
index b84fc5a3d..0b7eba538 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
@@ -28,7 +28,6 @@ require lv-conf.inc
 
 FILES:${PN}-dev += "\
     ${includedir}/${PN}/ \
-    ${includedir}/${PN}/lvgl/ \
     "
 SOLIBS = ".so"
 FILES_SOLIBSDEV = ""
-- 
2.44.0


