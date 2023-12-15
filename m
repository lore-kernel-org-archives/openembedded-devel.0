Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27B2CC46CC6
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 07:52:57 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.58181.1702626769046325048
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 23:52:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=brgwqs2H;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40c580ba223so4692705e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 23:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702626767; x=1703231567; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KO4qd174NqNYT/erDldb6vCur2aTiVqkamy5dUA1ERU=;
        b=brgwqs2HxZGOSqdYeBoVBvMu0k3305uLlSmAs0INFD5F2HpWdOrXKt4hsuGZ0ga9PY
         bDNixVDwu/DNW756eqf/f4PSBZ5idMn/b40FEk6KiopwL16P6FWLmJtqpo6+atifw/KO
         xWpYCVn3gujJFC/vnyLLY/w0+lEcZAREqn65sG9ByJUwoKz0CEDMcD0QOkvE4yOjCRvR
         Xky1NNJkYE+IENey4MR5zzotzHlghSRW4gssY8FsIOMKC9NTYqkyLJUDKgTmPwxAht0/
         zOvL2Q0Wttf4XATewkuBRzWKzFC3LQ5UQdLjDGo+ZYDaYxwI1u4TSUh4ceyBswxc7VkE
         zfkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702626767; x=1703231567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KO4qd174NqNYT/erDldb6vCur2aTiVqkamy5dUA1ERU=;
        b=B3Mn1+cML885VWSK9nudGNqsPHYUiN8EHVo11gDNZtAUxEvqBKaS7Q3dSgjJojV3xl
         6XmIbl66e9C2eCvdGiyMFyz9s8kmh8xQNRjWTCnzlLthLFFAIUow5DNdLktkJVYEJa/s
         +T0SwGZ5vuBwu5aj7X9k8WYQQkhgjJG7BrtAPfVQrw6NYqBBddJQPp5wLkl5+0GWiu04
         GL+vXBbHLRieRP/ScWUcvAKwq/y6186i7g45cd4dzeEoUoH78bi6lBNDVE4dLjQYmHHc
         W39AJMqV55Hb0EokBgKQ7Jyh2FMwiMqqFs2y/nWFXpJ7jHhsRBHzPD0Ebo6fnjW+Biwg
         tbTA==
X-Gm-Message-State: AOJu0YyOX7ZRBoaUcqjYmFOUpX1BWWdY+jZO3PoAvIucJvKmGiSILWqi
	pxuy1tVgjsVbXeyWYhhDMd2h7fkWhII=
X-Google-Smtp-Source: AGHT+IEoYscG7TgGQXW/xXMJi1qg6s8HhMwbRhLwIoDjYg6k+m40lEUJdydZuOp8DfiuloKyD7UabA==
X-Received: by 2002:a05:600c:81b:b0:40c:2757:d316 with SMTP id k27-20020a05600c081b00b0040c2757d316mr6075868wmp.150.1702626767548;
        Thu, 14 Dec 2023 23:52:47 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id le9-20020a170907170900b00a1e2aa3d090sm10348666ejc.206.2023.12.14.23.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 23:52:47 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/20] python3-m2crypto: do not rely on smtpd module
Date: Fri, 15 Dec 2023 08:52:23 +0100
Message-Id: <20231215075239.3049865-4-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231215075239.3049865-1-alex@linutronix.de>
References: <20231215075239.3049865-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 07:52:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107497

It's not mentioned anywhere in source code, and python 3.12
has removed it.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-python/recipes-devtools/python/python3-m2crypto_0.40.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.40.1.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.40.1.bb
index a55ded34d..c946edb2b 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.40.1.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.40.1.bb
@@ -24,7 +24,6 @@ RDEPENDS:${PN} += "\
   ${PYTHON_PN}-netclient \
   ${PYTHON_PN}-netserver \
   ${PYTHON_PN}-numbers \
-  ${PYTHON_PN}-smtpd \
   ${PYTHON_PN}-xmlrpc \
 "
 
-- 
2.39.2


