Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 805CFD36118
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:17 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.27769.1730831941644785227
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:39:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fyemj7r5;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6ea07d119b7so47382367b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831941; x=1731436741; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mpyMN1DCkaqDksBwb11y1RGAiOMe9nm49wGHldKYZmQ=;
        b=fyemj7r50UT7KnkkujBwKPXDdvQx6PPoGo+GnOz/o2fqG52yadP8M5zup0/7kn8vaI
         GyuHbbsgX4s6HT2JhMW0R6gb6kQg1YPtl1jebukp5tEObOlFRBrk0/LaSzsY4IbsO5hZ
         aKDL7qVNIXk1i2cxbcLLbVumD8QASxdo1YdQYDE0T+6eW1TGY5mFjfpiog3nOssrhFQv
         JPe4yCr3XdbyJ9FKaZY5I43FspLqICkWJubTaZkuiLUlYuUuxG7QpgMI0ljpTiGKQA5W
         cgVcWlFyjNUxy5ja+JjPsVXnQYK+tMbDU6z+PGut6TlAQfkHsn4wVAgKWi1GG07z5JM+
         TH6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831941; x=1731436741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mpyMN1DCkaqDksBwb11y1RGAiOMe9nm49wGHldKYZmQ=;
        b=UjXH7obr/H9PGv35XdBffMk36HlXMgRo0kfyNrrTw9fXACAXUr6TItJlzeLfL8GLEe
         mknMCRk7q4PyxhKUsbv8aJQt5e2YwU4UczMEHuH9CQ5eOigAEcJ8KCbVCOJx6ducnkhH
         UX5hrzOODY1kv9Y8Fty+ptgzMpLyqVourSQYBzZZOHDecRD3On9cW+VVBsrfP130ExFn
         y2DRowAts5nShQSG/0gT5DV3EY32t31BaIQ2cFxjuArP/6aw/5bCFQuTRtXCikJDffie
         9Yl3lpRFB4IS8RGyjzZPzLgeSh+pLrPHDMoHjsQ52jZOHp5KkZJfggVzdsnBX8j9oAxF
         w8xg==
X-Gm-Message-State: AOJu0Yy0xkvTy538/SPseNUTrcj9nkj8D7Bq7aNU5z3LYsoTCwdjBTih
	AXhmi9AYBap2bSvfm9EGdXYLLuvun/ekQq7YXKIcIc7cSqa5GIimWoLZJwjK
X-Google-Smtp-Source: AGHT+IHmJZuPh/gdB7qywHH7HE8suer6GZA5bfdX+Yneaz0lNVykD5oc8yOY2ui2gvoT8x7EhDEZbw==
X-Received: by 2002:a05:690c:6ac3:b0:6e2:12e5:35a2 with SMTP id 00721157ae682-6ea3b87e354mr256668187b3.4.1730831940420;
        Tue, 05 Nov 2024 10:39:00 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:39:00 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 076/161] numlockx: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:52 -0500
Message-ID: <20241105183658.34982-78-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113591

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-graphics/numlockx/numlockx_1.2.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/numlockx/numlockx_1.2.bb b/meta-oe/recipes-graphics/numlockx/numlockx_1.2.bb
index 0d53c78f3..beebbd566 100644
--- a/meta-oe/recipes-graphics/numlockx/numlockx_1.2.bb
+++ b/meta-oe/recipes-graphics/numlockx/numlockx_1.2.bb
@@ -7,7 +7,6 @@ DEPENDS = "virtual/libx11 libxtst"
 
 SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/numlockx/numlockx-${PV}.tar.gz/be9109370447eae23f6f3f8527bb1a67/numlockx-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "be9109370447eae23f6f3f8527bb1a67"
 SRC_URI[sha256sum] = "e468eb9121c94c9089dc6a287eeb347e900ce04a14be37da29d7696cbce772e4"
 
 inherit autotools features_check
-- 
2.43.0


