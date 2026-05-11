Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0393ECD37B5
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 11:18:50 +0000 (UTC)
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48005.1778498326440657675
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 May 2026 04:18:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hzcdgAiF;
 spf=pass (domain: gmail.com, ip: 74.125.224.51, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-65dd9b25829so28766d50.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 11 May 2026 04:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778498325; x=1779103125; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BDYlfjNkPGibJ7lvMkvkit+bKLhz8nnCfVFhhu02ad8=;
        b=hzcdgAiF1ZIRCT9huPzVRmginHnn4Tj6moJtS8WYgsG6qCR3bXuLxespyq2OPA0lGU
         F+tr++ylCbyFhFjwid/NpcmTtx/g65IoIzuui4drc7R6iTF+uL+HcUB1vgpic9ToyaJe
         UJegAWyrtt52mkuL4XU4AWQNR0sUMXmdxZ+3ErIgbdjXm9h/dtnwbCUZ2rn9CgTodEXF
         uO3e3jbITF/OkEjFLbBfYM0Of8w1L0bGgWbR9W1fXEWcjlMWN/A8j3yr2Z720mZLql5+
         5bCpXAMvmzUdlR6MNs1v69iXkm7FVjQUNEThnYRdFuW1OleIP8bBl6SuYC2y0UWFZXqn
         sDDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778498325; x=1779103125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BDYlfjNkPGibJ7lvMkvkit+bKLhz8nnCfVFhhu02ad8=;
        b=QuSXlty9PLjfpHm9e9fKMnS7VfC1d5xY0M7y/j+UjfSK3GNZ8FaRb99SAWGDO9Mryc
         xVu55BACfAfhf+ee2AnUQFgr6gRLEWd1hlKnt3W4S77VZKYPPnIHaG4c2bD8YgUXU49o
         YMqv959cn0D6WPDpvH8fzV6FHl6wQlq3BeY1Iek4QFzmbqZCvBgRvuXuKOXulCOzPH8s
         Muj0QTkdXGlSHTHxpn7rn/LrN/3C/Z2zDyEhPlRwQoMsRxMe+Lk5JqqVxrk83tfgovt6
         6wj1N8Tuq1zGiZjFZuJh5rBVu45k3L9Su+A6lHSMBQzVeO0/J+/VNYVG1qZ7ofQbprfw
         AIjw==
X-Gm-Message-State: AOJu0YxhR4QcF7DND8CEisV/ltN6Bouob1mCLlDYrmtRiiy7ydG6oLIC
	zZlG9khupv4Y5xCDcFER/xrhy5HRBeRgni9wSLFoVLkc42L8puYuDfo9cCZQ1klV
X-Gm-Gg: Acq92OHOecGoRSV4cbmdANdB2hPOTGPVroK6HAgeA5R1+Inu+uyDnNtX+TZ5zpXouA+
	bmblJtf52QA/yPYpdrE0gfb9PfJRfrWyZXHPuxBUN5e99JQqwzeKhBrcM0mLWSHn3SiB3KlzUuM
	UbnUdvZHUqfC9YtGhJfssieej4UoY1EpilBVJ+C3qDtAgVaeb1eVHfNo2areqjK2itont1YHBl1
	K5RF9AJSPisdII8dSkBK04YQm11knzx4sEgZB6H3YUpbn47AdsKW7630DAVnyk2OnuNQJsdjIPz
	Oy3LiGOcUpzxFePHGT4kKPDBPZdv7nejlI19XsuocNxps1eefCxbpbgCs7ErWS5PSzY9nfC6C0P
	+0woJuVGSCToHVO7gclnyGQ7I/xBuqEaF/fgOtCeK4Xob86uS9sldbvPlvr95etnAmivPHHYK8w
	8pajpKM3ZbjfwZ727fOfJlNQxM2oL5PJQ2CXyg1csNwCAim+F53VchKsceIAOo056ecgdrzjZ2T
	Lmeds1U+uaSAD11ZdX8ayVao1RKc3MIH3P7/LbMCNfOgjbH0Lw=
X-Received: by 2002:a05:690e:418e:b0:650:39d6:6983 with SMTP id 956f58d0204a3-65d94afc120mr11522450d50.5.1778498325244;
        Mon, 11 May 2026 04:18:45 -0700 (PDT)
Received: from localhost.localdomain ([71.54.207.93])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65d969fb85csm5096940d50.2.2026.05.11.04.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 04:18:44 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH v2] xarchiver: upgrade 0.5.4.21 -> 0.5.4.26
Date: Mon, 11 May 2026 07:18:41 -0400
Message-ID: <20260511111841.15488-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 May 2026 11:18:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126846

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../{xarchiver_0.5.4.21.bb => xarchiver_0.5.4.26.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/xarchiver/{xarchiver_0.5.4.21.bb => xarchiver_0.5.4.26.bb} (91%)

diff --git a/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.21.bb b/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.26.bb
similarity index 91%
rename from meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.21.bb
rename to meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.26.bb
index 61a94f7bf4..77c6b4c2ca 100644
--- a/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.21.bb
+++ b/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.26.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "gtk+3 glib-2.0 xfce4-dev-tools-native intltool-native"
 
-SRC_URI = "git://github.com/ib/xarchiver.git;branch=master;protocol=https"
-SRCREV = "55f923ebc623bcc8f53368543847350a23688189"
+SRC_URI = "git://github.com/ib/xarchiver.git;branch=master;protocol=https;tag=${PV}"
+SRCREV = "e14d54e1c85f4dbc78b89042017ebdc0fe5e2f4c"
 
 
 inherit gettext pkgconfig autotools gtk-icon-cache features_check mime-xdg
-- 
2.43.0


