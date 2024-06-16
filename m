Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE29EC27C6E
	for <webhook@archiver.kernel.org>; Sun, 16 Jun 2024 20:37:59 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.41997.1718570276878281613
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Jun 2024 13:37:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=ML7aWgeD;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20240616203754a302c3aec4f4b674a5-skemme@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20240616203754a302c3aec4f4b674a5
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 16 Jun 2024 22:37:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=sEWC7r9MUM2WFqRHITGqUwPZ2g7h0+h7tT+xKYUmBVY=;
 b=ML7aWgeDqtWF217UsuNEOHo3CetOmZciO0+zUFWoOaAJ7fOvAjGcSGXee2mbVxR4bT022q
 gU5ZMQvcb3KQGbXklcwvfPnnGkZ8gIaEwH7Ng6IbEsqU4Iy2owsNw6PVKL4sO6gz7ZiYZw1i
 rrd/jtot3U7x/WqgOgEmT/lcc9Uwg=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Khem Raj <raj.khem@gmail.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][scarthgap][PATCH v2 1/6] libgpiod: update to v2.1.2
Date: Sun, 16 Jun 2024 22:36:46 +0200
Message-Id: <20240616203651.856968-2-peter.marko@siemens.com>
In-Reply-To: <20240616203651.856968-1-peter.marko@siemens.com>
References: <20240616203651.856968-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Jun 2024 20:37:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110932

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


