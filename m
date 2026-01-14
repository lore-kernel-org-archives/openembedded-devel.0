Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF59CD39014
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 19:50:07 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19296.1768420197456839800
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jan 2026 11:49:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jdheDtDN;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-78e7ba9fc29so1240767b3.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 11:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768420196; x=1769024996; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zKvr0m/7C/IMijq4X/lRmByro4IFS5H976ucXVqRFqw=;
        b=jdheDtDN5phPyO2nH7NbuDAcBgZynjEM80vrteJmxXcFny8mkfEirEJjub1222wvY+
         VU9BCK4W6RASxVMhbXdWvZFDmM8lEF5U7utxdmmIOoGd/LOthK2DRdkveJz74Sh0HB84
         wkJzTzHuT1f9xh617P6r5g8DpQdM+VSg70OdPw0RGa7IERH3P6lBkmyZZnSUJt52EMo9
         Ddw9ivLE590jTr6zhkfbq67KmUz7ttjpkvnYNUG9VUeDUwtNO5WjXcSCrjFj2ucuS9UR
         STc7HluGz6O6b9xW9mli5VHxPVbGiv4xHc7X8fRNpObLGEBM0Y/DsSjWx34zgv93FoPR
         WUKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768420196; x=1769024996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKvr0m/7C/IMijq4X/lRmByro4IFS5H976ucXVqRFqw=;
        b=aOQPyfm0Io8b8TL6jXVufQeGyY3F/e6QuDpvc5XngStcrV2gUu2+15JkM7K3bi9bY5
         QMwo6chFIHswU9OoV7h7pNyZw2WGluxfTT9QvHvebiiC+2Ax/QxKZi2ujwm5mcvguBlb
         wwHHlrwXwvPjONkWTPK9Dq8yl0pEH0agkolk39Jtb4uFa2a6AbRge6hyuP4Fn8ZotN96
         ev79zOqqj55PytTJL4AXPS3CzPjWWpgMXaxN219i6/h7evhXE6De/ZXuNi26hlK78vYa
         0jCx9nUSGR/NIMXL4iO+1D+6zjYHG0MuaIjYwYEwJtH2WjB53UOgRwPWuRkqM2XEfakG
         3OpA==
X-Gm-Message-State: AOJu0Yzr6/OWA4HxjNc0HbKow4l8L3ocbmqq0UYI8k0sNKhFPs3jTrOL
	KBtYLCqAm3vnCEXgsAHrdEyolVWnhYPmo9jVYQfuCv1NRCvJEjutKwtUw2D+a+Qt
X-Gm-Gg: AY/fxX6iyGmae4LOAMeUpy4rlmuqQA5e9FhQBTyjouvM2nawhWH8L463WR4I5fyroWb
	XS/OpJh6nua2qzUQYV70bPrrjcRtYz0kSU1ebo8mFt0CNR5khPyc0pyZuTyMqHmHSX/AV7IMaIF
	F3fsHQCv3HfFrrIYxhT1k6q5lSp9w3wYldxbpq/cm8+uSYjZHyyCEfDzaF8i3Du9HD8tfJJM5R0
	+kJXOj8jMNTBMHvsIwuSKzrmGvctQg1b3Q0/aC7PlRw3j2zDPn66ddt11lb6ao8j5IurpW3+wtc
	AP6fWc6BZWH/+WlkZD9tEsv6aa/a0biEftfAKDRyNpGsAvQ0mRuifOPZAS9umEpTCL8eIYLar8t
	zFV4LRrir0ZvBg0UzPF+tHhyrm5c7xSpc/G7IHYBJmXDLEM9dH+8t3oMGonBFLtRRq4oDxn8OcI
	snjUR1uLSqhACmUAdZy5iloufWedRJvetSzOS0oQ6BOECuixyochk/Kf0wvWkJd1adVCVRhibfR
	zdoP0VWZD0F9asWWbwel1F9gNRQGW8Fp12mCOCqiphE/p99aFw4A6IyErv5Vzln6w==
X-Received: by 2002:a05:690c:4b13:b0:786:5c6f:d242 with SMTP id 00721157ae682-793a1ed63efmr31570207b3.69.1768420196119;
        Wed, 14 Jan 2026 11:49:56 -0800 (PST)
Received: from localhost.localdomain (71-208-41-41.ftmy.qwest.net. [71.208.41.41])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-790aa6a3afbsm93427257b3.39.2026.01.14.11.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 11:49:55 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH] libxfce4windowing: upgrade 4.20.4 -> 4.20.5
Date: Wed, 14 Jan 2026 14:49:34 -0500
Message-ID: <20260114194934.195359-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 19:50:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123484

Changelog: https://gitlab.xfce.org/xfce/libxfce4windowing/-/tags/libxfce4windowing-4.20.5

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...{libxfce4windowing_4.20.4.bb => libxfce4windowing_4.20.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/libxfce4windowing/{libxfce4windowing_4.20.4.bb => libxfce4windowing_4.20.5.bb} (90%)

diff --git a/meta-xfce/recipes-xfce/libxfce4windowing/libxfce4windowing_4.20.4.bb b/meta-xfce/recipes-xfce/libxfce4windowing/libxfce4windowing_4.20.5.bb
similarity index 90%
rename from meta-xfce/recipes-xfce/libxfce4windowing/libxfce4windowing_4.20.4.bb
rename to meta-xfce/recipes-xfce/libxfce4windowing/libxfce4windowing_4.20.5.bb
index 5791d48895..764254eb10 100644
--- a/meta-xfce/recipes-xfce/libxfce4windowing/libxfce4windowing_4.20.4.bb
+++ b/meta-xfce/recipes-xfce/libxfce4windowing/libxfce4windowing_4.20.5.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=435ed639f84d4585d93824e7da3d85da"
 
 DEPENDS = "xfce4-dev-tools-native libdisplay-info libwnck3"
 
-SRC_URI[sha256sum] = "db467f9ac4bac8f1c4e82667902841fc0957af835c29603d6659a57440b6f8cb"
+SRC_URI[sha256sum] = "6b4e19a66db650c9c8a88f00bbf266e9ced0070b7dbc0aaeea05be0fc6a2eb4d"
 
 inherit features_check gobject-introspection gtk-doc xfce
 
-- 
2.43.0


