Return-Path: <chris.chapuis@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FE52C54E6A
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 18:03:28 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.6.1710525802889964301
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Mar 2024 11:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XARpUGYI;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: chris.chapuis@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-33e17342ea7so1278131f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 Mar 2024 11:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710525801; x=1711130601; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aygBXATKJlNCDeJ4zsV3zAgrJBzWXuB1efX/lmg9Glo=;
        b=XARpUGYI4CRv4XUFQpB3ihEtD5b+ypKQHWa3lw8YSkVDjleCVsKDVQ9fuRMCTwhxUN
         6qKenRh0dBSdwSiMd/Kjin6HWtYy4xtg5TSi5TAw5OoFMUAlxAOzeiHkRX/mC6ZdB1CV
         7omKLc0GcvrFX0E4ISQ0+M0LQKpcj5eXh45YgYbcni4urfZURbOZaoQ93ULnaXzSFKg2
         Qj1wxY0OuoCwAXl8EVbFuPdj8EP12tYMqmTo2/wQhvtpSQFkdXgfBm64xYp4mW0PCvs7
         NyQTqmwCyuWuZ6EHHZ249p9AH4BunjSW9755YkEtKtzGFf9+ITq2ow0n9f+1b5MWbcTq
         23Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710525801; x=1711130601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aygBXATKJlNCDeJ4zsV3zAgrJBzWXuB1efX/lmg9Glo=;
        b=RdQxVAMxVJPEIP8i5Zpkn9QGy1/Pd+JTw4yWQD374EL2O9Bn/i1KlCJExaR6YRri57
         ETQY5HN2x7hX0kkx5rvgwaNcPFA+dVz6p39ZfL+zTfdIgtu/1+TvFlVwnuRE4bo1LCIe
         oZAgql3izRQWYFJFn0clKfdUOO8EOXwhKrNK6rPqOLPRSfssH/TJ4ib3s9g6B2D9FslZ
         GRT+8MBKrqnFHKpJNOfQxJSsggrwQ8R7IISGk1T1WzGMdQLku7dW5PlD26b+fySD+SNa
         c8ArCYlt34fuWvkLYt009Ll9Ry8v2BJAwaRTp/PvksBpV/8sBKE3jPe66VKFTCQaLe0g
         bMxA==
X-Gm-Message-State: AOJu0YzauFbnd8C4L1d2YiIONxmhwDVbumQkkCA3EiAftoh2ZQCqhHn+
	mhASHOoW2ZZAu/paauo+5aiOeASvURYQBTuXP3hkH/88UTC+cg7qo62xWIWqwPg=
X-Google-Smtp-Source: AGHT+IG+ateOo4RAut4pdSya8WQ4EhXgvosmgS3yilcisLCigpDN+dxcrvWOTdM/++dISfjbddxMEA==
X-Received: by 2002:adf:fc08:0:b0:33e:749b:fa13 with SMTP id i8-20020adffc08000000b0033e749bfa13mr2597262wrr.69.1710525800952;
        Fri, 15 Mar 2024 11:03:20 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:5d9:6330:4d5:74f6:de66:f26e])
        by smtp.gmail.com with ESMTPSA id bu27-20020a056000079b00b0033ecbfc6941sm3366832wrb.110.2024.03.15.11.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 11:03:20 -0700 (PDT)
From: Christophe Chapuis <chris.chapuis@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Khem Raj <raj.khem@gmail.com>,
	Fabio Estevam <festevam@denx.de>,
	Martin Jansa <martin.jansa@gmail.com>,
	Christophe Chapuis <chris.chapuis@gmail.com>
Subject: [meta-oe][PATCH v3 3/5] lvgl: remove useless FILES include
Date: Fri, 15 Mar 2024 19:03:12 +0100
Message-ID: <20240315180314.9111-3-chris.chapuis@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240315180314.9111-1-chris.chapuis@gmail.com>
References: <20240315180314.9111-1-chris.chapuis@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Mar 2024 18:03:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109342

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


