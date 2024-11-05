Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5827FD3610C
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:17 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web11.27763.1730831933719492900
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K5R1co28;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6ea7c9227bfso12408347b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831933; x=1731436733; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z0Oq5iuVsIx0juPMRM/0+slaClUGCNcnNlHOOht4ilg=;
        b=K5R1co28tAo1siyaftUH/7vIubEC+NOMLku+durcr8Ut1fJGMjNCByWdluvuQ9UwPZ
         ZfPAw7TB998/udks/FkDmZseGWy7Boo/SiCj+BelZJ6Huw+7iylb2vk7lMI99mZK4N7A
         LruIYQ0X/ScPasw2GiMqozCjqH55WXnmsVAn0Ls5FiVvmIKT+gopumVltKQ7UedthfIp
         ekK7yxt/VOuCLbfpq1YRh3DlU9/v/FJt2+M1LJVI64QYEufLVKd/L6r21orS3OZ2BXLK
         KJJknLzHIjAucsEI0Zw2MtNhCZfK0kAodJAi90Bx5Pfi+sCgjQ9fjK5mb1WuCjesbmuz
         cjtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831933; x=1731436733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z0Oq5iuVsIx0juPMRM/0+slaClUGCNcnNlHOOht4ilg=;
        b=ABothMmdjOCgFBF6HloauX9oCYAI+B7TNXXzWljwM/e7EjhBot//Wc9sdGwRbbMV5e
         /DiUGDWcUXpSKxQeooQpSz5FnA2z21nxY5gFxbdfQdzNQ54xNbbz74cIha96nS9Md8qn
         SEiJ+lXKFeudD7OSQJx0xBZbBwSAzCylSEt4LcjTDUKQg+M0ZWXebNNRWarvSpgSfxoR
         +82tXMUFtqLbkwBuBoCg16MuABQ7cvpe1b07e1w9nNXyPkKhVixEsvZdOIx/+8jakAeZ
         VyQRep6Cr6YOZrxw5814KDiohGmnsZxYCTTlr75VBEDeFTZhiz7SS0Fj0PSYpwrlz0tN
         i+8w==
X-Gm-Message-State: AOJu0Yy/Q6YZcY2QKofK+6REzDXImiXiRJuHhyMhYk8hiVEBtiWY1Qau
	8oUBl7I7LMhRRiqlFkqn27lZfgjKh6G72J0OhFi40g6vVdpj2obPoHNS55j4
X-Google-Smtp-Source: AGHT+IGw4fl7zbMlvGMz5q8PM7tUmX3lb/ydDOpTGez7BccoI9gxnHnNl7MINx3NLqTke39c8QcyAQ==
X-Received: by 2002:a05:690c:102:b0:6e7:e5d6:64cc with SMTP id 00721157ae682-6e9d8a22ae1mr316400977b3.20.1730831932385;
        Tue, 05 Nov 2024 10:38:52 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:52 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 066/161] directfb-examples: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:42 -0500
Message-ID: <20241105183658.34982-68-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113581

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-graphics/directfb/directfb-examples_1.7.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/directfb/directfb-examples_1.7.0.bb b/meta-oe/recipes-graphics/directfb/directfb-examples_1.7.0.bb
index 398e33948..de91d027e 100644
--- a/meta-oe/recipes-graphics/directfb/directfb-examples_1.7.0.bb
+++ b/meta-oe/recipes-graphics/directfb/directfb-examples_1.7.0.bb
@@ -18,5 +18,4 @@ S = "${WORKDIR}/DirectFB-examples-${PV}"
 
 inherit autotools pkgconfig
 
-SRC_URI[md5sum] = "8b60c867af295481c32a8c7fc5802307"
 SRC_URI[sha256sum] = "9a2104cc4da8123c8371813551b66b943198979f745cbebc034bb5e10844122a"
-- 
2.43.0


