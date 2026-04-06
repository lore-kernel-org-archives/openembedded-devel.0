Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E6EDEF4EC6
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 08:33:52 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.51012.1775464425062722114
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2026 01:33:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QJVnMVP6;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-79827d28fc4so28552157b3.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 01:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775464424; x=1776069224; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QnM1ZyEmCJ3ro1sxANd2gPJRdzSDXhwx24znRL+JUJY=;
        b=QJVnMVP6MbF+QnL3We1uDKEBWlfePtBPWXSlWjyHLq+/frqo1hSGxvPnMXfri9xDwZ
         99qgejtas8bP/KxqJslFvixDJswDKCG6UNTGYsoR6WKPoLxpJj3IRLxflCcmfuwt68L3
         sW4VSy9OftwxyOK2+uUgRFF5lbPJyOq/chyK/Nghs1jFUT/uukDCuKZkQSapvkkUMsc/
         JSLzfJqG7bXYX5KjJtwZDB/E4oMEZfXAKQQ8p7aZJm1gQCplaxkqpNo+/S5A5oh8az3+
         U6OaaAqepnx1XmJYPvW0rWHfWv6+/ecKbptgSO+sMz0DFouMU+6Umnu0kvo4G3esa0tE
         LdNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775464424; x=1776069224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QnM1ZyEmCJ3ro1sxANd2gPJRdzSDXhwx24znRL+JUJY=;
        b=T2K5hJeFyPXHh/HzZTAfVwVJXguS8ALc6rV97zgLxGQrtSddAXzUrE0hvdpQNYIEfQ
         qTuP0ffQapELpCT3SqtYXMl47PyB0aRNEtP09DGwEaYQNEIIjuhi5xOl4L9xNlZktVM2
         xOIIs0RBdeNMqwFxscas2ySC0D+Aguu8pHX7QBrQs1cb6NHYR1Df7BTNMPCMc7yDaVMT
         q0tLHknyaYVdVBU4HOMALC8/gtUFvVE8ybLKafc+cI2o+PYcDf2kaIVpMZscNva3nL2R
         ydnLAraQWRXCrauw61MZqXGenYtpru7/SDld5JKTt7e/5MlA9g5S7dFkYM2XtVd1HSrm
         MO5Q==
X-Gm-Message-State: AOJu0YyaCJLKNoiq9Z+E3iJEw0MaMDf+lt7JEm8luKgUyG7pLwNallUt
	mcBDuRnV9xyxufJ6/0pOoxdi3+KBzZqvBZ/n5VabnS60JyLkYe8Ty4sI4QpDItdR
X-Gm-Gg: AeBDiev18e6vtIL7RLVY+fpBAJRnjVAuo93Uylpvvch07k6mbCxMtgLq6c19JADM3Dx
	dDhR7ypqpGD5ocse10SzgIJaH3AntWrJLaJgYkfkt98XdYrqqqoOiQmHl93xqc+IDc2plwmt+WT
	uxUORlOxUNNbh7+baXQhhkbF7hS/W0P9CDxSlfElngyTygH/TlhQrYSmY54YTDV9ZoEV6o76KtJ
	8P7sNM0FMW4dm+fMpVBvxF9/xBWH+qsli5o4rY+aCRiztWFDlFZ98moKb0QC6uedahWGUuS3oSD
	LeE4qmrtiwlE/272L920HDPqN9i6UpsJtGw+B3V+KljQmjykqFAOcKihnsnvyfgaPREAqwdjzhF
	RtqxFQvWXk56Fz1hiFOrmoUkNDKhdOKGiAW5m9KrepBo6L3rFKgk/aGUfcjzEbkRt2WCjbkM6OK
	q33V/Utn68CE7rcU6ZgaoruKbau+LHkmvuBCTeE2AY9fCguZJM8Rt6nVDuqJzPe6wl6pDzJBpOb
	0riYoHyDlA8cYwrnm6/MS8ya4qvlHKQrmzvstaIvzqYuI1UeeaGwQMwvAsMLWU=
X-Received: by 2002:a05:690c:e654:b0:79f:7972:f88c with SMTP id 00721157ae682-7a4d64480eemr70387427b3.11.1775464423685;
        Mon, 06 Apr 2026 01:33:43 -0700 (PDT)
Received: from localhost.localdomain ([67.233.60.136])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7a36ea2872esm50700667b3.19.2026.04.06.01.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 01:33:43 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-webserver][PATCH] webmin: upgrade 2.621 -> 2.630
Date: Mon,  6 Apr 2026 04:33:18 -0400
Message-ID: <20260406083319.288106-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 08:33:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126034

Changelog: https://github.com/webmin/webmin/releases/tag/2.630

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../webmin/{webmin_2.621.bb => webmin_2.630.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-webadmin/webmin/{webmin_2.621.bb => webmin_2.630.bb} (98%)

diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_2.621.bb b/meta-webserver/recipes-webadmin/webmin/webmin_2.630.bb
similarity index 98%
rename from meta-webserver/recipes-webadmin/webmin/webmin_2.621.bb
rename to meta-webserver/recipes-webadmin/webmin/webmin_2.630.bb
index bb5ac1c755..6a627e1f0e 100644
--- a/meta-webserver/recipes-webadmin/webmin/webmin_2.621.bb
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_2.630.bb
@@ -19,7 +19,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/webadmin/webmin-${PV}.tar.gz \
            file://mysql-config-fix.patch \
            file://webmin.service \
             "
-SRC_URI[sha256sum] = "88381e8bcdd4733b215c114ca2158dc044892ea68dc0da4d235d88d2b1db4bb8"
+SRC_URI[sha256sum] = "47e25daeefeb98598f4b3f3d99e5093fe618b96eb1b952e938ba6356806be20c"
 UPSTREAM_CHECK_URI = "http://www.webmin.com/download.html"
 UPSTREAM_CHECK_REGEX = "webmin-(?P<pver>\d+(\.\d+)+).tar.gz"
 
-- 
2.43.0


