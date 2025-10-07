Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43EFACCD183
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 11:10:23 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.15650.1759834861514493443
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Oct 2025 04:01:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OiItd5e/;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: joao.raul.434@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-57edfeaa05aso7287636e87.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 04:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759834859; x=1760439659; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bh1T3vVRIuRM/lz1dJMMkFN4X66WgJf9GQ4gOwkj5co=;
        b=OiItd5e/+bFFPEt6F0yODp8wI8icxCbu3XJbs8hQ8JHazJ68be2/LHFl7gBTxBVuvP
         EEl6GZ6+y1yKjBtirrpIC1L38xV8r+ZkFskoiBji3ac5FMhZ1Zxbf3rKP8PA29BV7pAi
         p6AKOJwtwWZO+I02iw3OOx53RUonEsXmKuTohQBrpLBi+4jzvqXBZq0F6TI8ReVgrjxj
         NTJU5x9r/SbvyEVg9ZvCN2Oh3yoMIud7Go6/TzDi0p6qXVpUnrWOo1DztVDeq1p7/0Mo
         UpX5p7H40IN/TpxmCM6XUbTIzporSYDPCE+93LQZbvw37n16F4/Mxs/Cb1doxvfv66ZF
         JImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759834859; x=1760439659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bh1T3vVRIuRM/lz1dJMMkFN4X66WgJf9GQ4gOwkj5co=;
        b=MMuJzj/qIkO8gHH8582Jxm+V8ieXXTMNI8hY8uUMl7tutmndtT0GQ1+Auq3etFvR/7
         3bfq3x67qLb2cQwR4IMN3OJmMT9Ki/bTPxdyw7Yo27//AhXa/GxhaRW4QcCENAqLtW5M
         qYVO8IU17vkX5adOZYITopo70h2VFGQs1RUT3FgT1mPB85wGhLAdsuxeqUH+8suyBx3/
         Gf+tInjTHP+x14gyLQcKne8Bb8kTSYj1tAfNZlnw/85/bGoyN3gj098BxPxhRVTQBbuI
         VO+sxlpw/vpOM1MPs8EVQxvCiKfgqOZpNDthI4IQeKjADYt+/29tD+SMM0mhPLq7Xj3o
         H+HQ==
X-Gm-Message-State: AOJu0Yx8BHNXdL9v6rHebPeGlYDjMlhiybpwU0DqWwWn1wOCA3J2RiaG
	UC1wYsL8/N4uAoAgNqHLuolqZJoxQ2TQorJW/LwAJfl1LIQ3vav2tbAF8OYbJuZknzY=
X-Gm-Gg: ASbGncvpSrm12pkhKFegFoF/OLvpD7hBN8MQqcy7/6o8wvtCLpXgOx9I/V7x4fDvw7e
	zXJlMbAL+ce34jjGmx2Tb5uU1tYllqNPlx5JBTwnzSwcn2pNO+eTUowBt8moXZOEIfykCfvLm+Y
	qFTX27lAvLu9hmWFZ3juKwSN9qy1524ISBSD7uO5c/rkXOEZ7LKOYx4K86VXF6e38kVz+dDK0WB
	WlTE2YVrwWAzY4yx7Cl7AtLdhq7sOg3hRbY+FJxaNh0QiEZbHXGkkthmJnqUvgzzIZwHqVtSd8L
	KhgIqreyw0yePRuTc4oP3StAoyRDEYMqPbXR700xVwKf+KCJWiLRASfnTN6nbutO5CyExU6/ZgP
	TxFukPKgMd9ixAZQV9WkBomosR14pW1sTCNk84gGs4mXA6xBsRJSDtwEZIwPfhE0WcJK/2o1U1y
	SrOiLwmtzUAX7CY3VgluUQ1Co3/R+XqPT3zSrRE21H1b1SPg==
X-Google-Smtp-Source: AGHT+IGyK6WKdIH9lCgf5GI9q996aepxcs2Cd71nnL2EMag1ZaR6vxomZtzIB0Ql0y5vWSRMzZmP1g==
X-Received: by 2002:a5d:5f54:0:b0:3ee:155e:f61f with SMTP id ffacd0b85a97d-42567129e10mr8235118f8f.8.1759834457136;
        Tue, 07 Oct 2025 03:54:17 -0700 (PDT)
Received: from RD-8dhlsmLpT3bz.corp.hbkworld.com (89-181-200-223.net.novis.pt. [89.181.200.223])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e723593d8sm225159795e9.11.2025.10.07.03.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 03:54:16 -0700 (PDT)
From: "=?UTF-8?q?Lima=2C=20Jo=C3=A3o?=" <joao.raul.434@gmail.com>
X-Google-Original-From: =?UTF-8?q?Lima=2C=20Jo=C3=A3o?= <joao.lima@hbkworld.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: joao.lima@hbkworld.com,
	ivitro@gmail.com,
	joao.raul.434@gmail.com
Subject: [meta-oe][PATCH v2 3/3] openocd: add fallback repository mirror
Date: Tue,  7 Oct 2025 11:53:49 +0100
Message-ID: <20251007105350.1237-4-joao.lima@hbkworld.com>
X-Mailer: git-send-email 2.51.0.windows.1
In-Reply-To: <20251007105350.1237-1-joao.lima@hbkworld.com>
References: <20251007105350.1237-1-joao.lima@hbkworld.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 11:10:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120333

From: Joao Lima <joao.lima@hbkworld.com>

Add a fallback mirror for the openocd repository fetch
process, so that if the primary source repo.or.cz is unavailable,
the build system will attempt to download the source code from the gitHub
mirror.

Signed-off-by: Joao Lima <joao.lima@hbkworld.com>
---
 meta-oe/recipes-devtools/openocd/openocd_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/recipes-devtools/openocd/openocd_git.bb
index ce1389b060..30629583cc 100644
--- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
+++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
@@ -4,6 +4,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=599d2d1ee7fc84c0467b3d19801db870"
 DEPENDS = "libusb-compat libftdi"
 RDEPENDS:${PN} = "libusb1"
 
+MIRRORS += " \
+    git://repo.or.cz/openocd.git git://github.com/openocd-org/openocd.git \
+"
+
 SRC_URI = " \
     git://repo.or.cz/openocd.git;protocol=http;name=openocd;branch=master \
     git://repo.or.cz/r/git2cl.git;protocol=http;destsuffix=tools/git2cl;name=git2cl;branch=master \

