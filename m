Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE2A7CCA476
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 01:48:34 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.23900.1759715310167669313
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Oct 2025 18:48:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MKEag4rI;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-71d603b60cbso45211257b3.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Oct 2025 18:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759715309; x=1760320109; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BI4yrvSJJeVRmA/PXLM9qgta2yPaTUcTi2XrJCWw84U=;
        b=MKEag4rI1oyrG/lqIRapVKjqDNvvce4QVOwcIBCXpDNjDweXhkDUuAlDiBCIGOIBGM
         1/s5r0p5e5JUbswc3M5L6KGHiPOHqeeNBmoFQswoyKHxl2/kSeBueYme5WB+uaw77SxV
         iqkMA8uvu3dNbjeEWXMwVr8aPmJ1n5hJLOgoFD+xj58sCzIW7q4rnEc5lKTO3a4wAXL0
         xGnr+XVLnNBkZgWlCLjIr1Ca+bQngRmL1q3fJg+vz7WWXQ+ZRj2zNSIwCyI/1SyhL6Lb
         5I+RfIlVbYsMbuiK8kEHPg2z89nl7+GTYrPp8VA711o6OFBdBR6pb4baElT6vlro41U8
         EvDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759715309; x=1760320109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BI4yrvSJJeVRmA/PXLM9qgta2yPaTUcTi2XrJCWw84U=;
        b=TmZKJwVXaKMQdaivK8gcOUoORhjE4T9kWrZ7RxVq5qw5YMR9oByOfSYU/RpLr1clgH
         9/2zfv9dfgTLnEfLRp9dkIBHL+K28evjGdWYJJPw/mhDbDFEE0eTCxA3zRB/L+UHa91+
         ZnAzafaJtXsaDvdGxkhrDDxeuQvOkN+ACX+eWig7cR9r/1LGa8SCwJOM2nB4pDmiLorH
         D+oduLYheW45PgDim6afG+FRxbn3L2gn+AzZcz27LP/JTgJOLD6ooKoTVxxiA5Tbgagc
         xVnr3ue0s0xFeK52Sqd6CGmwRWNOsH+XvA4fTG7wedhJdUmjpV4xfDp+/swaJgIm7T/h
         bjrQ==
X-Gm-Message-State: AOJu0Yyr7fAodEQYuDyHd3/U1+3OAlRlmwChZj1oOdt840Si9SthYQwv
	VW9YxG4RLZzu5IQb20qsljFKvM8oNsofSyvzhwbTupiK+r6OecFMtyRwqhsmoErm
X-Gm-Gg: ASbGncv6e8n/vKUl+ZM8E34lWQcAblgZcaVt6Mdt0dpP5pR5hiR34NHNaTfmA+zG3Fj
	Ms9r3HxM+dSsAaBFGGJ7V+c6XxhmFnkCZr8NS/6+1k7/+FUpNO1tF4+sJvARRkMjKB9yThOYGU7
	Ed7yfjrZWhM894MtkoXSd0aQtwh614bLSckCJjRSsdMCRP35tKpCPnSM9zFtWdvjpzNfcSAtpA8
	MhNbz5YY7XDf11L8N5f5kkGqGet4F016yyP4Z+Ug98umJgCAdWZIP5EwjquHEAlOyX0weKKjPyF
	UFpjRVzOl80G/c/hjTYXOG5fd8qd+QRsBZv+4V5z8Ab/+CoevaiUrz6V16T3DF9+Ztgso+EMLmf
	T8KdDFva32JppBHmNeIC8VVrdJibcY4/qsk261ThE0Fa95VyD8bAKUP25za77Rjo=
X-Google-Smtp-Source: AGHT+IEl30je0CwykNt1D5c8qf3xAsD5XhZ2rl+69MUf2U2JAVrTX506U358vxE1+w6KQrFuBJOhCQ==
X-Received: by 2002:a05:690c:490f:b0:773:d1a:83d2 with SMTP id 00721157ae682-77f9459729fmr136776967b3.23.1759715308875;
        Sun, 05 Oct 2025 18:48:28 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-77f81aad051sm39177337b3.0.2025.10.05.18.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 18:48:28 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 08/10] xfce4-genmon-plugin: upgrade 4.2.1 -> 4.3.0
Date: Sun,  5 Oct 2025 21:47:25 -0400
Message-ID: <20251006014727.58960-8-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251006014727.58960-1-schonm@gmail.com>
References: <20251006014727.58960-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 01:48:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120265

Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-genmon-plugin/-/tags/xfce4-genmon-plugin-4.3.0

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...e4-genmon-plugin_4.2.1.bb => xfce4-genmon-plugin_4.3.0.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/genmon/{xfce4-genmon-plugin_4.2.1.bb => xfce4-genmon-plugin_4.3.0.bb} (77%)

diff --git a/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.2.1.bb b/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.3.0.bb
similarity index 77%
rename from meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.2.1.bb
rename to meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.3.0.bb
index 158dd2fbaa..452d3fe5aa 100644
--- a/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.2.1.bb
+++ b/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.3.0.bb
@@ -3,8 +3,10 @@ HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-genmon-plugin/start"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4b54a1fd55a448865a0b32d41598759d"
 
+XFCE_COMPRESS_TYPE = "xz"
+
 inherit xfce-panel-plugin
 
-SRC_URI[sha256sum] = "de540562e1ea58f35a9c815e20736d26af541a0a9372011148cb75b5f0b65951"
+SRC_URI[sha256sum] = "077197911d84e5ba22e7bb895ce6c038dbbd8e8e0067ed6f4e48502b7167a282"
 
 FILES:${PN} += "${datadir}/xfce4/genmon"
-- 
2.43.0


