Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FA63C2BA16
	for <webhook@archiver.kernel.org>; Sun, 16 Jun 2024 19:24:19 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.40408.1718565853413695649
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Jun 2024 12:24:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=W4UvEa7R;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202406161924102e25f273cffeba1953-tb1bkd@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202406161924102e25f273cffeba1953
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 16 Jun 2024 21:24:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Ltb90+u47v0/e7E8N+7Np/4N49viovmj+qQkN1lRFVE=;
 b=W4UvEa7RaZkR6COCu2ZnLROyvJbALYUjZIstHOV+kd7HiOjec3oMWNKvZj1agu+i1D80Uz
 sCfZPOO1EL4AOgfV9AB+YdQDa6q8mUbam7FB8oBr1NQ3urIcunglFox4pmK8412RKaJ2fFFD
 M2OKCualuIfEv2xLXv5kSDbu1HuaQ=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Khem Raj <raj.khem@gmail.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][scarthgap][PATCH 1/6] libgpiod: update to v2.1.2
Date: Sun, 16 Jun 2024 21:23:05 +0200
Message-Id: <20240616192310.856262-2-peter.marko@siemens.com>
In-Reply-To: <20240616192310.856262-1-peter.marko@siemens.com>
References: <20240616192310.856262-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Jun 2024 19:24:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110926

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This is a small bugfix release that fixes a build issue with slibtool
(not relevant to meta-oe ATM), makes the licensing of C++ bindings less
restrictive and preemptively fixes an issue that will be triggered with
linux v6.9 when running gpio-tools ptest suite.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libgpiod/{libgpiod_2.1.1.bb => libgpiod_2.1.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libgpiod/{libgpiod_2.1.1.bb => libgpiod_2.1.2.bb} (93%)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.1.1.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.1.2.bb
similarity index 93%
rename from meta-oe/recipes-support/libgpiod/libgpiod_2.1.1.bb
rename to meta-oe/recipes-support/libgpiod/libgpiod_2.1.2.bb
index 4c13d67eba..6e4fbd2a3b 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.1.1.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.1.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = " \
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-2.x:"
 
-SRC_URI[sha256sum] = "b21913f469d3135680d5516f00fdf9f81d5e564e19ffb690927ea7f1d7e312cb"
+SRC_URI[sha256sum] = "7a148a5a7d1c97a1abb40474b9a392b6edd7a42fe077dfd7ff42cfba24308548"
 
 # Enable all project features for ptest
 PACKAGECONFIG[tests] = "--enable-tests --enable-tools --enable-bindings-cxx --enable-gpioset-interactive,--disable-tests,kmod util-linux glib-2.0 catch2 libedit"
-- 
2.30.2


