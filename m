Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FDAFC3DA41
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 21:28:50 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.6584.1720646923934577095
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jul 2024 14:28:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=j/SvY+gh;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42726d6eca5so2111635e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jul 2024 14:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1720646922; x=1721251722; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AfcAzHWiA/TCtT4U0/GaMEfniOmtqY9H+ID5FMVKiJM=;
        b=j/SvY+gh43KmrbJb99WZUaBGS8M5Aynes1s3k3Sx1ZeOBut7Zniwab935Jlg38MX91
         l7db9QG5NKg35+IwQMmp8Q7oABCPATPp8kPR1p3qJbVJXExcpnFORrERwRW/FdkOv016
         XLac/JnZ5i2nRi0ETSLzRaUpCbhsFzQIp+vIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720646922; x=1721251722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AfcAzHWiA/TCtT4U0/GaMEfniOmtqY9H+ID5FMVKiJM=;
        b=LaHlJrOegSXKpPZfN7W20V8xfLLnD39dw+Ba419HzaxgHXKS1a8gm6geXhryFB1LRT
         9xVp0t7bElsm23dvVp+Ja85+4ykzSCTyjhqUQnCBIhRk9p25YbSGKsG2L9EgDZKz0Hhs
         rHBTLQsPxdZsmfeBq35uWhw5ZWgmiOKmYlz4IhrJTSTL6i4paJ0w6rBduBUKrzzuBacG
         Q7yp/wR8qq2DnRIgiobePy4kniE38VCW7GnlPSizIVYeCul3b4ednWN3hD14YnLsW4zz
         LO8jPVj7GAYimiwe7CzzFsUK5fuLz4uxFKWxS51Wy+w5VJK1NDOFkmNLwkV+TxuZ25Av
         49UA==
X-Gm-Message-State: AOJu0Ywmbr8b4fIq7dq7kF7liVQjDZvHmkTZIFd5Ccs33hS9U1TwtfMp
	bfHTMA7mtKh0yrCZrpiBmaY7g0tqEvoLw7ploXbHts+JsBvrsSNW3BUmuLEJR1o2VXbesWxl8tq
	g
X-Google-Smtp-Source: AGHT+IFMz6S7nZka/oFl0FBaIZgQjoanGI5C/TvTEUKZl1bPd1dUoTDUH3MWZbFYUu7A+ocvqOG+4Q==
X-Received: by 2002:a05:600c:4341:b0:424:ad14:6b79 with SMTP id 5b1f17b1804b1-426706c9159mr48744505e9.8.1720646921785;
        Wed, 10 Jul 2024 14:28:41 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f741624sm91636015e9.41.2024.07.10.14.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 14:28:41 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][master-next][PATCH 2/2] pidgin: Remove gcc-14 compatibility workaround
Date: Wed, 10 Jul 2024 23:28:23 +0200
Message-Id: <20240710212823.2289094-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240710212823.2289094-1-yoann.congal@smile.fr>
References: <20240710212823.2289094-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Jul 2024 21:28:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111308

From: Yoann Congal <yoann.congal@smile.fr>

Since commit "pidgin: Upgrade to 2.14.13" (which contains a gcc-14
compatibility patch), the workaround is not needed to build on gcc-14.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Suggested-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-support/pidgin/pidgin_2.14.13.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-oe/recipes-support/pidgin/pidgin_2.14.13.bb b/meta-oe/recipes-support/pidgin/pidgin_2.14.13.bb
index 3a761bf07d..ac62863f5c 100644
--- a/meta-oe/recipes-support/pidgin/pidgin_2.14.13.bb
+++ b/meta-oe/recipes-support/pidgin/pidgin_2.14.13.bb
@@ -118,7 +118,3 @@ python populate_packages:prepend () {
         description='Finch plugin %s',
         prepend=True, extra_depends='')
 }
-
-# http://errors.yoctoproject.org/Errors/Details/766946/
-# pidgin-2.14.2/libpurple/protocols/bonjour/parser.c:200:9: error: initialization of 'void (*)(void *, const xmlError *)' {aka 'void (*)(void *, const struct _xmlError *)'} from incompatible pointer type 'void (*)(void *, xmlError *)' {aka 'void (*)(void *, struct _xmlError *)'} [-Wincompatible-pointer-types]
-CFLAGS += "-Wno-error=incompatible-pointer-types"

