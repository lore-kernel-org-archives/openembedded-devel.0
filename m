Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27A3DC27C53
	for <webhook@archiver.kernel.org>; Sun, 16 Jun 2024 15:15:28 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.35712.1718550926499736751
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Jun 2024 08:15:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=sa7h0qaV;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-421757d217aso38168795e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 Jun 2024 08:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1718550924; x=1719155724; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:mime-version:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=45Br4ocajxOyiAz1At1Emj389Z3Utf4jn3Ci12SssaQ=;
        b=sa7h0qaVqxzfUmKm5A28WORhcmSPwQLKF+8Jltt8JGwp6jepyhVeXvkHoEuNMcVzbn
         fmjTgTjSeV5MxlOtOvOkiPSriTPY0QcWsjrbIEaI24/jSWtze+4FcfTPB4hTX3Mk/GiM
         VwoPclD4LGr7cBD/ZODjtnbK+UOdGHSJZQXp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718550924; x=1719155724;
        h=cc:to:subject:message-id:date:mime-version:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=45Br4ocajxOyiAz1At1Emj389Z3Utf4jn3Ci12SssaQ=;
        b=pYocRszkysPkYZF+Q443rY291oXE6Shv8q1Ktaq9XDPJMqu/4zbGTMKfW7z1yyYGwB
         caFH+DOF5N6RDpJKkJIDVXE+aMQtfZBw2OPrYUzg2hXAcDY6WP0UOHIOaC8bMk6zAggy
         4ZyiwBprYFsJ+7CBBREI+8swcDqr06YAXPBOtP7WRdmkki4W8rVjdwBYZ9l7vBP7IOzN
         HFawSV63Nk//S0ogAvPpjkc/7dAS8BFHJXxF0NKZ78XM4FQJD0Lvv54BwRhwiuiMy4JS
         DG0GfoUgLX58cq7aluOWkaMyol7CT8cf+aAVfEU6EPnryIMzZs81+KL3nRlmIRfCb78d
         h4vw==
X-Gm-Message-State: AOJu0YyD4xtJ7wzXakkghXtqpBdZrN7BkduS0Zf2JppYlwt5kvXDNrt1
	SX4pQBE2jNh+nm1IGXUr2M0yrTG/GEC/K9JQgBuM6l8+9DEOgjjc/MyLsyKUgtzNiYg2g9IwTGi
	DWcb5rCzDoBiyRRQE5tT4ZT+Y1FrbfE3V+htMufE/bqp7pZrv
X-Google-Smtp-Source: AGHT+IFi8YPhwUf10wThEA+80JtWZkefI2c2blIcEqkL8wbzZMMH8EBjY46vTaNfihZWTpmfI6F6v40C2tvIXtXjI9o=
X-Received: by 2002:a5d:4b0b:0:b0:35f:1bc3:ae71 with SMTP id
 ffacd0b85a97d-3607a78833dmr7119524f8f.63.1718550924373; Sun, 16 Jun 2024
 08:15:24 -0700 (PDT)
Received: from 234945705956 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 16 Jun 2024 15:15:23 +0000
From: Yoann Congal <yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Date: Sun, 16 Jun 2024 15:15:23 +0000
Message-ID: <CAMSfU+5FtW61-3MzQ00y_3V55eE3g9uQn+SGw=0JSahLJS34qQ@mail.gmail.com>
Subject: [meta-oe][PATCH] packagegroup-meta-oe: replace libdbd-mysql-perl with dbd-mariadb
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Jun 2024 15:15:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110919

Update packagegroup-meta-oe-devtools following
commit 0ec2b7aab2c5 ("replace libdbd-mysql-perl with dbd-mariadb")

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 19242ba545..e31e45b851 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -243,6 +243,7 @@ RDEPENDS:packagegroup-meta-oe-devtools ="\
     cloc \
     icon-slicer \
     cscope \
+    dbd-mariadb \
     dmalloc \
     ${@bb.utils.contains("PACKAGE_CLASSES", "package_rpm",
"dnf-plugin-tui", "", d)} \
     doxygen \
@@ -287,7 +288,6 @@ RDEPENDS:packagegroup-meta-oe-devtools ="\
     openocd \
     pax-utils \
     ipc-run \
-    libdbd-mysql-perl \
     libdbi-perl \
     libdev-checklib-perl \
     libio-pty-perl \

