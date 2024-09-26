Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EED9CCFA07
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 22:45:40 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.56873.1727390731365596407
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Sep 2024 15:45:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MdAg3bor;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6cb2cba60e1so8913116d6.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Sep 2024 15:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727390730; x=1727995530; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kv0a3oPfVa/DCOf9qZwWemYE/UfAXtrOIbNDqn2obl8=;
        b=MdAg3borz8vs6U8zK7NMlZAT/qvUd3j0NssbRZ37qgeffD/wbFi9Lm7IzB2+0MEyof
         Si6LqW2UYTA4MmiLAESaVdkipjsp//MH4ejJA2QH1rgDWZQwSE4K2fhhORFWJMsX9EiI
         v/mJU92/QWO3SNo2kvYvflphT0uIzF7xhoBmapBEDPpvFDIpf3N3ypIpv/z3tPCFR8D4
         t7wyp5BYawvwzxRoWngzE6awh2aqnzXuqAT4uCGfznIHL8KhZyKiWLo0KCSKGK9BySHE
         7By/4AdK+ZlGImMoZap3OxjWytB4bh11BwfGcUVulX1mWBEA8N/hQ9aiLxmSB992KDwU
         dHIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727390730; x=1727995530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kv0a3oPfVa/DCOf9qZwWemYE/UfAXtrOIbNDqn2obl8=;
        b=Qz4jBBNJvGHiA6auGe3w6nGGJQTg9leCFARQNiz0oNe+b5RAnJWc/ihxvgq/5ao8TF
         wV2L9VTCLMsDo2ahP/fScB9Pp0HgYB80cLtrF5q9JddFRfo5GmbM3H+hGGQ1vovf7trZ
         4nclVWFTUWdMo0aVxRHxN8CQoZ+lwqtJP1cekz0049ycRUsAho1mm5BvWd4e9fxTkm9t
         8S5lxs99QXiDOSFyul5bgA+K2JwEzUpJWvSwS7sRIw550+j1WVd6raSWzSzV7m/mVZvd
         cL6AWa++Was69FGy0e8znuJUcu+n666nU1uX6hOYGs1h47cbkZbiu0CskhHKiEYW3YvO
         cuww==
X-Gm-Message-State: AOJu0YwJNbJ4AtmL4JmV0WtRxq9YCU7dzGN3cUg34OY2lHzZBvbATCIt
	30YlwbiNNSactelKfMDJcVXGF6JTJC8nwsXr9BFFZDA2WA8x4vXXjbTO/g==
X-Google-Smtp-Source: AGHT+IGn+ib5SE1QzVK16b1jf4AYC1JYFGr6a+GBoSsFNh+g5EkV/42HUxAT6j15fwOMVOfIaqb1IQ==
X-Received: by 2002:a05:6214:3b85:b0:6c1:6ec9:606c with SMTP id 6a1803df08f44-6cb3b5caf8cmr13358836d6.18.1727390729513;
        Thu, 26 Sep 2024 15:45:29 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b6819b8sm3380076d6.125.2024.09.26.15.45.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 15:45:28 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [scarthgap][meta-webserver][PATCH] apache2: use update-alternatives for httpd
Date: Thu, 26 Sep 2024 18:45:23 -0400
Message-ID: <20240926224523.12707-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.44.0.501.g19981daefd7c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Sep 2024 22:45:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112525

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
 meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb
index dc6a1530baed..66a017a864ee 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb
@@ -175,6 +175,9 @@ INITSCRIPT_PARAMS = "defaults 91 20"
 SYSTEMD_SERVICE:${PN} = "apache2.service"
 SYSTEMD_AUTO_ENABLE:${PN} = "enable"
 
+ALTERNATIVE:${PN} = "httpd"
+ALTERNATIVE_LINK_NAME[httpd] = "${sbindir}/httpd"
+ALTERNATIVE_PRIORITY[httpd] = "60"
 ALTERNATIVE:${PN}-doc = "htpasswd.1"
 ALTERNATIVE_LINK_NAME[htpasswd.1] = "${mandir}/man1/htpasswd.1"
 
-- 
2.44.0.501.g19981daefd7c


