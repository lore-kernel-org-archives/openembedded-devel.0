Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7076D5A6E6
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 06:49:10 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web10.40028.1732603746406160558
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Nov 2024 22:49:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WpjAY7UQ;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e388d8850d3so5158589276.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Nov 2024 22:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732603745; x=1733208545; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dt5NZ3Bbzr6DosnPcVA84bfDchKF6BmPe7nkCymkDGQ=;
        b=WpjAY7UQYD16e/pcedltrYL6SF8CQj6SDCllTlt1CbVhUYQuTN6ULhh+VhpWT2yqRg
         Ae/MnPN0sc5UQtTACDZRj91xBnRtiTUTrBPafAwMetlecYL2AjGLc3fl+PeFmdyy9Lwc
         uZFfMvxj8Pamdq25d9txFNtZw+Xs0A94up2nSAdUwJV7ZgsLpqsw1pfCelhAvEXrklry
         BpdpPZZobcbVRKvpo4MYqOUgPTeA/oOPnanYL1CZpf/3BOl2pxayqEmgTZzFyT+BGSIZ
         q0toBWai23C7II+XEufBkOkJqMqQgmyKiU9tZ2nY9ZcSK8qQVkZtnvPSs3RhV1qW0qTQ
         558w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732603745; x=1733208545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dt5NZ3Bbzr6DosnPcVA84bfDchKF6BmPe7nkCymkDGQ=;
        b=IfJEZIF3RZVNISspnMjwpT26eAEA5rVcRRGMQx5bwX4rmMsJyMh0F6UgKfVlUh/g5U
         EHXuUJw4yHPxtcwsPN3Zn5yzeR5WGkuea8qmPTLc58WjoFru6vNgLLu9Q6RWw5sHNc5/
         vSImeZJQcH1J8FElp9IgmDDRhhWQQXPOe1zKnZB9ybulu1cy8OwIMmK8GTkxgm3n6dFq
         CZI1TE1wCtSJf/bMCj8Wgz++T6o0wvZwLRiCeybvqWsI8gtjZBS1BjPDtd2ZfQruFgzs
         ofO7khWmoXTEtxYDQTzIeLKDwS/6y4dMluBE+TJS3m6mJW1gTYLptW+hu14X5qxTtYKe
         CqHg==
X-Gm-Message-State: AOJu0YxSFcKzc7tUQn1gGE10j4ZeYjBvGP+x2x+8f0Isckp9xwMEjo9y
	S7CTRz1vG7zTnEvcufkZ1OKIVNqgGy3qQgcYYXC9oA8whKKjkFfYZVCgweNo
X-Gm-Gg: ASbGncvRghacvLl7CYm8IBjd0iKmr4vuG2xE6ksuLhzeyV0eqG7ELEs/BTea3m6AZtW
	3WvN+EZqMJK+/4n8bPLkOzPqFy3kspcMgjxibqVsaqarNyQumtl8hPz2CrtkQs2eNWtKX+bpa0b
	xbQ26v2BYTsKW1DLa/IVQQK3XbNh0cGK4ZkRUAWrvzRWwhhFnqkp8Jmi+O7IqnWSw90BKQW3fkE
	ROEz9VKT7gxRJDt71iEpuT21H4oVv2+gE+pVsU8xPazV66DD06GifTq
X-Google-Smtp-Source: AGHT+IEWhtOMoLro/w+v5qARVddc3wZIGVJIxqEPNtUs+5dy0rLqfc5PdErQ/jZP1lxZK09sxL/ylg==
X-Received: by 2002:a05:6902:e0c:b0:e38:7de:de3a with SMTP id 3f1490d57ef6-e38f8bd31e3mr13246448276.32.1732603744881;
        Mon, 25 Nov 2024 22:49:04 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e38f6084765sm2920711276.25.2024.11.25.22.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 22:49:04 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 1/2] libxfce4ui: Upgrade 4.19.3 -> 4.19.6
Date: Tue, 26 Nov 2024 01:48:52 -0500
Message-ID: <20241126064854.1685359-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 06:49:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114058

Changelog: https://gitlab.xfce.org/xfce/libxfce4ui/-/tags/libxfce4ui-4.19.6

Changelog: https://gitlab.xfce.org/xfce/libxfce4ui/-/tags/libxfce4ui-4.19.5

The 4.19.5 version fixed a linking problem with clang which appeared in the
4.19.4 version of libxfce4ui.

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../libxfce4ui/{libxfce4ui_4.19.3.bb => libxfce4ui_4.19.6.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/libxfce4ui/{libxfce4ui_4.19.3.bb => libxfce4ui_4.19.6.bb} (92%)

diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.3.bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.6.bb
similarity index 92%
rename from meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.3.bb
rename to meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.6.bb
index e53d01d00..e9215f8b9 100644
--- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.3.bb
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.6.bb
@@ -12,7 +12,7 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 # TODO: Check if 0001-... can go
 SRC_URI += "file://0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch"
-SRC_URI[sha256sum] = "16815eef494ba9bac9c854e95c205c0bc5568c8022c31604348f9edadb02f227"
+SRC_URI[sha256sum] = "effe2c29408161beff4ae879f4591e7209c2bf5517c46545a1701337950afc7c"
 
 EXTRA_OECONF += "--with-vendor-info=${DISTRO}"
 EXTRA_OECONF += "--disable-vala"
-- 
2.43.0


