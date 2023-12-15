Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34357C46CD4
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 07:52:57 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.57809.1702626776267041221
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 23:52:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VNCCxCMe;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a1ceae92ab6so43426866b.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 23:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702626775; x=1703231575; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vvpJjMBEiM/VDL4RV1JdKkHJM8UEx8KAmZsDj+qFKQ8=;
        b=VNCCxCMeFDfrb+RpOFZMZ0W5uX5ThxayMM9fFzRhid5iHQw8Gb5TPiPN1ghyW9kYOp
         5Eun7UBWC3tA/fScbetbA2hPCM+gyB44u5fr07utD/ujLcub4q+8Y3lYm9zcXE1vqINe
         tcmFn5Kxid9+jObB1/OAaEBNd1PSbmjcJt8K25wAnKnwGBmqdPaXDsSI0I/2pb+csDNi
         1BCELiYlAFqZ157OWGZIj/RyLzsOiQYOe6U+MUdPNoyv4Z9Q67fg/DY/Bn03k4cRsl8A
         Vd4xXWNbmPcXXGc35D2obCdG/QoDHLSzFPCGO4H1eLERI+/tszpgPja7dzdosxZVF1Qh
         ZI/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702626775; x=1703231575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vvpJjMBEiM/VDL4RV1JdKkHJM8UEx8KAmZsDj+qFKQ8=;
        b=pVtgNO/Ki/ni39o3T5PO6UuRFhoyNsy+byTt0C8DfXfp+ni6+aA6Xl6s0nXAKH2Lu4
         uGEZG8QQK4v5q2J7yTzW2VUgNW0etAr3mj6QYJsCANEM21ErlM4gfKoXxOdy6gA20erj
         f9+2tmWHnUe/XlXb0FbKn0ck5Cty2JgamJGNaCIRYK+LUMfaq9VArDx7DZhj1Rf+BH86
         RqpLgqA56jJZdEIwrUwzEnsPEdiyVqbPijKxR9b2xyTXyPC2IDGKdwJpJS1EgBTfCDla
         MgisCwcb8HzAuvzRlJgCicN6dglo9JSDNkWthFa3Utc/L5ta3nWTHfhOHbZMUTEdpT2g
         zsIw==
X-Gm-Message-State: AOJu0Yyq4IFLS8ByIGIGdWT3+1jXTdzuAV3QqzuNRRFy9q0/tRk56T2N
	JLhGALszx/Sp8PbwbvgkjRTPzka162Y=
X-Google-Smtp-Source: AGHT+IGkDPlTSzmVUyily99fzb7b7VNgxJLjvZDO6FtRtTlL+BdEP4G5ojUgc1E1HE1yVsephz0VrA==
X-Received: by 2002:a17:906:1de:b0:a22:e4f2:7abb with SMTP id 30-20020a17090601de00b00a22e4f27abbmr3153785ejj.153.1702626774526;
        Thu, 14 Dec 2023 23:52:54 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id le9-20020a170907170900b00a1e2aa3d090sm10348666ejc.206.2023.12.14.23.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 23:52:54 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 15/20] python3-pillow: remove unneeded distutils dependency
Date: Fri, 15 Dec 2023 08:52:34 +0100
Message-Id: <20231215075239.3049865-15-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231215075239.3049865-1-alex@linutronix.de>
References: <20231215075239.3049865-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 07:52:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107508

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-python/recipes-devtools/python/python3-pillow_10.1.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_10.1.0.bb b/meta-python/recipes-devtools/python/python3-pillow_10.1.0.bb
index 322c90eda..f895b1db3 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_10.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_10.1.0.bb
@@ -39,7 +39,6 @@ RDEPENDS:${PN}-ptest += " \
     jpeg-tools \
     libwebp \
     ${PYTHON_PN}-core \
-    ${PYTHON_PN}-distutils \
     ${PYTHON_PN}-image \
     ${PYTHON_PN}-mmap \
     ${PYTHON_PN}-pytest \
-- 
2.39.2


