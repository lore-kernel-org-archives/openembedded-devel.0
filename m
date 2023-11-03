Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98835C41535
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 20:10:59 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web10.64287.1699042251557199728
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 13:10:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZXBQc0WI;
 spf=pass (domain: gmail.com, ip: 209.85.219.182, mailfrom: festevam@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-d9fdc712b8fso597977276.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 13:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699042250; x=1699647050; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rM9g164omL8jbJt6sW92CccCg5kuPq6Ldz5U77eMtIY=;
        b=ZXBQc0WIPlu0dX3AdZhQK4/XrVb9X5fHuh428Kuhu2+uPvVzJ9/0YvTr9nvDgwokHs
         irAI5v6qyXfCuiiVjHylb2eQk4Mb7Xn2GFDfYSsAfVVWhasUYjsg8fiOWnJFfaLCOLfN
         W3eUZesXUcsd9JX6qkTdFpiUdRyX/3oqiW/FlMk4whWbixpEKAzdgSQP7Ekawz1Se3Dp
         vNGWRN/F5G5DTso7Tg/kloc7vlw5KTwTFzEWIBQfPq8T7xMdIwOux501WRxkM/Ks3qrS
         GpSISAiUP3czsdFhxaNR1AcqEjM+6u6xuaOkvqyNg1ddrxKORxAp1YmfyLlmCywOkygA
         lAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699042250; x=1699647050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rM9g164omL8jbJt6sW92CccCg5kuPq6Ldz5U77eMtIY=;
        b=AKVNLP8LkQTlZlC0RalZYtSQoz8OyGCneFsqdzi6HIaewC2cvGyaIsSMduYftlT6cq
         ZHWrs6+qZW96/68VfX+u1ovmq+fxnqBDi5zt9YdjyfB2xEo4uk2KrAs8R0bvz6Qlr3vL
         aJqLqwACGPBvKBGD4zQmWf3M7dcx+t6baXcz8aiMVIKoCJaNihoLo+mLu83FgyH8Tvoh
         ieDB5soMlJo60XQETs3MXyWbWZu1/rVxnYJsgsJjXFDUbqZRzYxrtTyRGHYDEcKn/so9
         83ampbjYdQ1XFJh4PiW58KkpOqu3JhLLU5AZwEWMQlfTie7s4pnAQAUZR4FFlddfdhg4
         2aIA==
X-Gm-Message-State: AOJu0YzUTKE6xn13M1O+RZSlhbSLJq+LLzUNlOk5m6MdscofxteYv2aL
	37TwGbLPsd/bU5kH4d7M9MTqZzEmkZY=
X-Google-Smtp-Source: AGHT+IFsuPi7QeZ6BVTLg/CEiGpIOF6kGIh+7x1pN5y6QPE6P4xYuDkd3Tow4Ft6YqmTgTNak9/y0A==
X-Received: by 2002:a25:df91:0:b0:da0:c9a4:53a9 with SMTP id w139-20020a25df91000000b00da0c9a453a9mr18347276ybg.0.1699042250147;
        Fri, 03 Nov 2023 13:10:50 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:fe70:4f05:3ab8:f73c])
        by smtp.gmail.com with ESMTPSA id a18-20020a25ae12000000b00d9cd730e4d0sm1213389ybj.26.2023.11.03.13.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 13:10:49 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [PATCH 2/3] multipath-tools: Use https for github
Date: Fri,  3 Nov 2023 17:10:34 -0300
Message-Id: <20231103201035.14120-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231103201035.14120-1-festevam@gmail.com>
References: <20231103201035.14120-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 20:10:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106088

From: Fabio Estevam <festevam@denx.de>

Per convert-srcuri.py script, github repos should be accessed
via https.

Change it accordingly.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 .../recipes-support/multipath-tools/multipath-tools_0.9.3.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.9.3.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.9.3.bb
index ae4b3b9bf..a7a9019e3 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.9.3.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.9.3.bb
@@ -29,7 +29,7 @@ DEPENDS = "libdevmapper \
 
 LICENSE = "GPL-2.0-only"
 
-SRC_URI = "git://github.com/opensvc/multipath-tools.git;protocol=http;branch=master \
+SRC_URI = "git://github.com/opensvc/multipath-tools.git;protocol=https;branch=master \
            file://multipathd.oe \
            file://multipath.conf.example \
            file://0021-RH-fixup-udev-rules-for-redhat.patch \
-- 
2.34.1


