Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F7FCFA76F
	for <webhook@archiver.kernel.org>; Fri,  4 Oct 2024 10:59:53 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web10.13801.1728009625558020450
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Oct 2024 19:40:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nedM/6XV;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6dbb24ee2ebso16361377b3.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Oct 2024 19:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728009624; x=1728614424; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EahcdNjNLnz8uuJoAgYKRrbhVHER+Y6tH9BWvo5aKWk=;
        b=nedM/6XV6Gdohv6Uj20m0G1OoXwxG6y8hAw79wcm3NCniIaDX+Kod3AWHSd1+tkyWw
         Rzx+vT6tkDfUgJkIuPjIc3vOCRWjftT6b97XXlVXgnJyFFTus0NrjcSf5dMY4s9W/W99
         S19+G+qKjZXXe3fFJsp27RAH8HT+9X1LbJt2QZhnJr172y+8yRov6W1ce0UxgHHmFKUO
         K+2fA0CNYxvjVXszbMyEX4hMz/7c0CLxRZ1cGPjwyMoAuAwBrT1+7JDKM4KawTTUBI7f
         TNtuY6PpmpD6vJUmT3Hs5iDQcAt1YwrV1fRZYft96wx5mkGanPB8CPfcZn4uGo5h5z76
         BlWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728009624; x=1728614424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EahcdNjNLnz8uuJoAgYKRrbhVHER+Y6tH9BWvo5aKWk=;
        b=jaOafHCTl/aNYeThqy9+/EqUpyvcjx7pFfNt5ev+snomYp+xsaGNbJsJlGOju9ZD/P
         D/2YRQn6LM3YU2V2lk+qD2g0tDfS6rKaLgp/Z/1vujTeJOLJNyhsqMrNcCSalBGywVEW
         dQ3GmEULyMZRIxAh3YzLgrJDe5xB5cB8j50OacQk4hEAFbeMwLc1pIpjljMI154s96/0
         Nu+qpEVK930kBO/sXJeVHTmmFVEgr1dY//zCipZDWCStfbUpe6UiTaDlFj3DleCAELOn
         /JxQE6n+lllGbgY+Sa72QI5oJU0VasdJtaS645g8MauSt9N0/wqsUkFPcirgAhTTcCy7
         pr/Q==
X-Gm-Message-State: AOJu0YxoWo3zuoyk4uujXNNXM6WTTjhDHcn7J2Bim3GN6RaIOGgam4QY
	ykRYGC8XbakDp7LRYlNIIQUdFNdWn65JkJtPO2JAmrh3Na+uta53kQlzQA==
X-Google-Smtp-Source: AGHT+IGCB7vbhm0ZHqo2+cCcokjF8UloiCPjvHgXq2fEzqkuPyC7LhWTddtmexZv7nf32U3L8e151Q==
X-Received: by 2002:a05:690c:3186:b0:6e2:ab93:8c68 with SMTP id 00721157ae682-6e2c7238ef0mr9843827b3.25.1728009624252;
        Thu, 03 Oct 2024 19:40:24 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2bc2d1bf3sm4908547b3.74.2024.10.03.19.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 19:40:24 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 4/5] xfwm4-themes: Drop unnecessary SRC_URI[md5sum]
Date: Thu,  3 Oct 2024 22:33:07 -0400
Message-ID: <20241004023842.14172-6-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004023842.14172-2-schonm@gmail.com>
References: <20241004023842.14172-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Oct 2024 10:59:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112662

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-xfce/recipes-art/xfwm4-themes/xfwm4-themes_4.10.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-xfce/recipes-art/xfwm4-themes/xfwm4-themes_4.10.0.bb b/meta-xfce/recipes-art/xfwm4-themes/xfwm4-themes_4.10.0.bb
index 272f83c01..d69abfedf 100644
--- a/meta-xfce/recipes-art/xfwm4-themes/xfwm4-themes_4.10.0.bb
+++ b/meta-xfce/recipes-art/xfwm4-themes/xfwm4-themes_4.10.0.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 inherit xfce
 
 SRC_URI = "http://archive.xfce.org/src/art/${BPN}/${@'${PV}'[0:4]}/${BP}.tar.bz2"
-SRC_URI[md5sum] = "eaa58362053a3549c8be0b32efd3c54f"
 SRC_URI[sha256sum] = "3214d5f00e9703b5e8c9e7c3287d606dedec7285ceb4d5db332e93ada66fd575"
 
 # using xfwm4-theme as in xfwm4 might cause warnings of packages supplied by
-- 
2.43.0


