Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78EAEC54F52
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 20:19:17 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.143.1785269948419615064
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2026 13:19:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aDfxDgoC;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4954afac04bso2770255e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 13:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785269946; x=1785874746; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OQn0FVWNioXLqja+F9Gh7g6ne9cw8V3y6Vq1U2Cd2IM=;
        b=aDfxDgoCMxhgX/D1T9dgNpFtAc0WIiFWsyKkDbGV/kzh7L6FJujF/Jarz3j4lkHNeV
         7e52QH3u3f+va94Ja2kAEpkDx/GIow6/5r+Fsrswlp6FIwm6/nUtuXA5xpgJ/dQqFx58
         p9W8/8ni1/xXl+qocEHTYMvvwruQntHaBjEefy+JlzlDC4BocLOSh24QPkUFM9EjHm9O
         SNH0BWpODYHOoIFu1jLojg2PScABydPkQ9C6YniKbY6gsnSJRIwwY4+OHJUsgEFRv0tQ
         EKnLVQU4iO2oQ2i32KgD0cXdEDiffyFesT0nzmdVwLE016SaI3qP9884CJ4el4M3Q8D7
         /zLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785269946; x=1785874746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OQn0FVWNioXLqja+F9Gh7g6ne9cw8V3y6Vq1U2Cd2IM=;
        b=Ybq0wQ3NAScj8+WCtGJepZY/7Bnw0HFJA45UMTA5vbwiD+/hbno/u2tmLdjqH9m7fk
         33TySd+sIUfl+N6u7kkOuTOHZ/7fEYsYHYEKLOtOd2QX3t4I7XNGkBnul0CAYMuN9PYY
         v8C3R7BtRjKkLCv2a+6lz/a7qmhn0/KZFV0XGRRbHkQj3SCqj20xZCbr3Niujy/qL5G3
         rYHNIqPd1mmkZQnp4QQvdyMKjUyS2tT8VYMoT1P4AmfrVV0Q7LIuJai2xXQ2nFsGfxxE
         yV2f0ooj74lZiwAoc6D+uB7yXFLc5hCjiAvsMV4xJ9+lHT9l+Qf2xyiK92Gzgzhr6YU5
         Y8pA==
X-Gm-Message-State: AOJu0Yw2K7K8mnykdSyE4bMG6gImo9Cq3nWib2KpJm1U672HFBHzGGdn
	XtlcNqN58HNRMCS5uksbmxfxgEHU7mAepMG91DqCxa8Gw4WJyN4cZM9DLzknOjYg
X-Gm-Gg: AR+sD10Y7WiVNECyVfoAQzFCxC3/w7mhoPDMW6ZFJM7y2ApHyL6S2EInSqEHprc/Efi
	2s3a+GmJ0N10ua4mc18rB/laP/rnmuKUE31193FqWQvvHoFXYuM0yDKxTviHpx3kFDm1qvYDc1c
	78hFmwRttcyyoLWi38/I/+JuIzAYXkDOXzYFmKceJ8xVs8WAIVKwhGvbvhuHZlLt60yRIuBzw4Y
	kmv+JlUplSDYYbvJa8JWffVMr3f7f7mdTdkJCloywDNv5mcCYTqDmNOcvZB/4S1WAPZyFSqkqo8
	WGCJjvtSqO9mlcFzzVHgk5qHdKY7iR+CjIcFniAfyJMtbcLNFM54LHoMdjmpoeFB1Me54h7sWmc
	6GSm6WwkpRGWIKuDCuJabfQOBhZTKxm9M5opvkmKTsJchtWvUVhvyw3Tzm+8AmIBGcYhhiLJliQ
	m/FiXgGzaLi6DgKbn4kc6zpQQ=
X-Received: by 2002:a05:6000:1843:b0:47f:90f6:879a with SMTP id ffacd0b85a97d-47fb1eab0fdmr4719210f8f.43.1785269946333;
        Tue, 28 Jul 2026 13:19:06 -0700 (PDT)
Received: from dld58y9k4-lin.dl.net ([2001:b07:646e:1164:a5ef:30c1:2db5:b86a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb647a8d4sm1861559f8f.0.2026.07.28.13.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 13:19:05 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <locutusofborg@debian.org>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] vboxguestdrivers: Upgrade to 7.2.14
Date: Tue, 28 Jul 2026 22:19:00 +0200
Message-ID: <20260728201900.1604649-1-locutusofborg@debian.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 20:19:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128513

Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
---
 .../{vboxguestdrivers_7.2.8.bb => vboxguestdrivers_7.2.14.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_7.2.8.bb => vboxguestdrivers_7.2.14.bb} (98%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.8.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.14.bb
similarity index 98%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.8.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.14.bb
index de47bb0e5a..18fda0393d 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.8.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.14.bb
@@ -23,7 +23,7 @@ VBOX_NAME = "VirtualBox-${PV}"
 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
     file://Makefile.utils \
 "
-SRC_URI[sha256sum] = "0642ed4a12b7204cd30c0abbc2c10c1cc7ad55ce1756a01e86a16d4b6b066592"
+SRC_URI[sha256sum] = "384f293184c52fd51bc941c17d753b4019446f53a6b07c828adfb3e61fe0a500"
 
 S ?= "${UNPACKDIR}/vbox_module"
 S:task-unpack = "${UNPACKDIR}/${VBOX_NAME}"
-- 
2.43.0


