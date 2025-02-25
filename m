Return-Path: <alexis.cellier@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED8E1C021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 11:18:20 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.5793.1740482292146734315
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 03:18:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=CbabSFef;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: alexis.cellier@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4399deda4bfso37335995e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 03:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1740482290; x=1741087090; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LE/hWqY2LAGLj6CASSoZQN+IRqIPojXuXkSMKOqus5c=;
        b=CbabSFefTXgqn5Nb9UWJXnC6zOILZNMdTjM68gW70TdF9Rp5w0UV4L3YgdjTl2NrGm
         wsNqdjT0TBqohkD+nuChYcFRwAtSIRZLTH720TDZc/2z8JhWHTfhxt+iyyNysfnO/UqE
         9UBJQUCFIHLyE1Fmuea+0AVpa8EoMQIxuU11Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740482290; x=1741087090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LE/hWqY2LAGLj6CASSoZQN+IRqIPojXuXkSMKOqus5c=;
        b=si6d/ZL0WaGGcl8IlfQ2/twb+GskVqu+ITprKt/4XeYXdM/uZ+akb6EPkM0ZRviSiz
         nSgCEAmV7+mb7p6PaVtd9I1A50cDnZmZI5xqvzuDFpEMrnGxVXsGX+P3fjUlzjvVEWf7
         61DMsCIeLaDUWJLcBJQSZgViq4Q5eADa0znbM5EhS+BxG+nProt7KRsdQa+xJRtQTsq3
         IdvdwgbW1vHQCHKn/bY+pMC0DKoSnG3zFj677Ditf/3wLz76hZM8ypeO+bJaNsQQ3y/n
         H1F1Wr57YGudXHCL2IBwBfGCKoZaQXWx6uP7xGUmqLLYmv38utdnjA9zZgN7D2fICycL
         HF0g==
X-Gm-Message-State: AOJu0YwLX/lJ2YWPMJnmSaff+Cf45Xd7cXu/FMPMOIYd16t6DuYZlLM3
	6S5zUKQGn3g9uT/P2+sP69qHn0hSpWu1o3w7fT9XGvauL7HuoUXB9RgZ7PeuLYAnLrS7HMTgZjQ
	9
X-Gm-Gg: ASbGncudI7TsgQ294vEEKvH7kx69GW26yeHCwbYAydosVgM1kv22Y3094wP1Nxdq1Ff
	VjCCFjUujSZHqIlV73Mmwrq169B41vFfMoKme7CJqc1fXath7TOf3nDNiAaLynI806YnxPjc6tK
	aKOQBLd4vK/G3ziLsWc5zNlgLYfU5wY52zuEZJVBOGWS5zaDAMhkrJb7SwDtOLzbujR7clw2tVI
	SW9oMpe5R/0gev7u7qd7JM9ckV79RLhFLTLrxqIMaqYAgq8eYdI1lQDs8JQVNmz1sdHZtN3Uq8y
	jaEvYtj7GS3v0FD73CsxmWCZI4UxLG0PG2X/smv4QkOU8hRiV/r9
X-Google-Smtp-Source: AGHT+IE+xZYtGg+0fafpYNT+DS4u1wHcdn/AR9NenxATIcTupqb28XNK3ZPKXMbz55zXRzf1JPceqw==
X-Received: by 2002:a05:600c:458e:b0:439:91dd:cfa3 with SMTP id 5b1f17b1804b1-439ae221d72mr132622975e9.29.1740482290428;
        Tue, 25 Feb 2025 03:18:10 -0800 (PST)
Received: from falke.. (176-147-181-65.abo.bbox.fr. [176.147.181.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ab156a10fsm21789265e9.37.2025.02.25.03.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 03:18:10 -0800 (PST)
From: Alexis Cellier <alexis.cellier@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Alexis Cellier <alexis.cellier@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH] nano: Remove dependency on file
Date: Tue, 25 Feb 2025 12:18:05 +0100
Message-ID: <20250225111805.691643-1-alexis.cellier@smile.fr>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 11:18:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115568

Dependency on file was added on version 2.7.4, but even then, there was
no reference to this dependency in nano documentation.
Today, still no reference to file as a dependency.

Cc: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Alexis Cellier <alexis.cellier@smile.fr>
---
 meta-oe/recipes-support/nano/nano_8.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/nano/nano_8.3.bb b/meta-oe/recipes-support/nano/nano_8.3.bb
index c6ca55f44..d1af89ef8 100644
--- a/meta-oe/recipes-support/nano/nano_8.3.bb
+++ b/meta-oe/recipes-support/nano/nano_8.3.bb
@@ -7,7 +7,7 @@ SECTION = "console/utils"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
 
-DEPENDS = "ncurses file"
+DEPENDS = "ncurses"
 RDEPENDS:${PN} = "ncurses-terminfo-base"
 
 PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
-- 
2.48.1


