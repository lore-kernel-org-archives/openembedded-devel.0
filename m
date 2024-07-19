Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56AE5C3DA64
	for <webhook@archiver.kernel.org>; Fri, 19 Jul 2024 03:07:32 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.10840.1721358451757237170
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jul 2024 20:07:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QzAA0pdO;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-44f666d9607so5791741cf.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jul 2024 20:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721358450; x=1721963250; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8zkmlGR71uAi+nJby9I/Wg+tL6c2bcpQB8xgFZdedDk=;
        b=QzAA0pdOSXB5L7blcHFlfG7CsJ+JBLq3ivOjuzrLUDCIMvk6Qv65+PPWiuQ31ALHpJ
         hB0OG2EmQeNg/+hg+GOGeEuxTFoZRq9owkDHz2YnEgMK3/tdSXl+z7NLC80EizaBoaid
         F1kK8Hqc9LpQAfb8tVrQwsxUrXE3zdtaCWjGqjxrPNONFWxbAI36+KyWrXyhpczXh1+T
         jHavrdmQZZcKwTpTPazVGgHyPB0WcW2UuiJDVvsiZ8Jm5HQiwKFaGHUyG4Ml44sNljlI
         PLU82hzkE+3Ra8s9V1e5DjxF4LkQ7ZXLx7uq4s+3Wnz3s78KuQeL4AlkocskMosjOskV
         3SWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721358450; x=1721963250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8zkmlGR71uAi+nJby9I/Wg+tL6c2bcpQB8xgFZdedDk=;
        b=pvysfOxohN0oFASzuGvsQj3tbc6lHtr17oRhwCRukXnu1ajnnyQLK7GskZrxwIfOv5
         7rNlPa6lFvYCbiDXv+cMdTaroXZJlgOHwwtBiJXVzgAuR9TbxnRZ1/dJY0LUZs3RcaXz
         sy4Dq286kDm8B9UMzhyw0SDaQYkPZPyjCL02Qu7lZE45FgeMetbHzQRxgE7d2vddQNLn
         q57DPgtq+Ni3h9LrLYPbgPRjin94H7tN8CpSrzjYQ/A+I+AME6iy/ViAJMzOID96nTMA
         8sMQGKXI3FZ+PZf1g6WJxYRxM3EeydL71ahSK1MOn02Tu0htqxuLTJOLalVxLDIC232r
         frXg==
X-Gm-Message-State: AOJu0Ywg04cKSa0x0jdRKfOyoUIWli4QDqg9Rmq+NlgHaFXdC7lC8lKm
	Kf1JJB9XH3/Eoaywtk6ebnROmMJ0PKB1jFQZuZFTrlaTxHoQOpmpsuHjGw==
X-Google-Smtp-Source: AGHT+IHZ5/OAKTqx0RXHWCzkCl852hoZcK92UR/vvY9xFgzIZLdYfLCCP285Q6IuK0xFeezdiuHNUw==
X-Received: by 2002:ac8:5fd1:0:b0:446:5a73:31bd with SMTP id d75a77b69052e-44f9696be43mr36363931cf.7.1721358449898;
        Thu, 18 Jul 2024 20:07:29 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44f9cd36dc7sm2201931cf.49.2024.07.18.20.07.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 20:07:28 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][PATCH] apache2: use update-alternatives for httpd
Date: Thu, 18 Jul 2024 23:07:26 -0400
Message-ID: <20240719030727.35453-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.44.0.501.g19981daefd7c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Jul 2024 03:07:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111410

Busybox can optionally provide an httpd server, but by default The Yocto
Project defconfig for busybox does not enable it. If it is enabled,
busybox puts the resulting /usr/sbin/httpd object under the control of
update-alternatives.

apache2, on the other hand, does not put /usr/sbin/httpd under the control
of update-alternatives. Therefore, in the off chance a user enables the
busybox httpd server, it does not play well with apache2.

Add update-alternatives information to apache2 so that it plays nicely with
busybox which can optionally provide an httpd server at /usr/sbin/httpd.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.60.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.60.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.60.bb
index ab19ff1dc337..0c26a421c786 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.60.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.60.bb
@@ -190,6 +190,9 @@ INITSCRIPT_PARAMS = "defaults 91 20"
 SYSTEMD_SERVICE:${PN} = "apache2.service"
 SYSTEMD_AUTO_ENABLE:${PN} = "enable"
 
+ALTERNATIVE:${PN} = "httpd"
+ALTERNATIVE_LINK_NAME[httpd] = "${sbindir}/httpd"
+ALTERNATIVE_PRIORITY[httpd] = "60"
 ALTERNATIVE:${PN}-doc = "htpasswd.1"
 ALTERNATIVE_LINK_NAME[htpasswd.1] = "${mandir}/man1/htpasswd.1"
 
-- 
2.44.0.501.g19981daefd7c


