Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50AD6CCA486
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 08:23:13 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web08.3231.1657182191558767853
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 01:23:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hKceHPUG;
 spf=pass (domain: gmail.com, ip: 209.85.208.48,
 mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id x10so14820384edd.13
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 01:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6zXxpGpRIHi5kHzBQDxG0txBwcO9CmTByLa8JKKJe+Y=;
        b=hKceHPUGOuGFC5SF6BnuzWTWqCmUvZyjtNwcHTCIiNbmBCr2qVrb0gslh8hK5KyBOT
         NF+RtQzTUXBmwzdVMR23hJlAzYYx4MFFY5k+Uh57JGGZK7lNDnDV94ocpvdia8Bl94jQ
         rgqWAqz2G+wlikKbNCzn0laVTkdYQsxi3b6ICAiaSij5G7c1b8XTHe25yJnj/sGuAtcF
         gJsLn0U3xtGCHIGa9HwveDRWPNCy28QRuxqKMueZosOnSSb395uUrXQcp69KOF3GZ5Ej
         0E+ZUBVRQyVSePDVrhNQQH5eEaMX9bbkP6HXP88xqktkaSOgb0OSLVUTFB7cPoC8a/u6
         rbng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6zXxpGpRIHi5kHzBQDxG0txBwcO9CmTByLa8JKKJe+Y=;
        b=y/sbEqi35Sy/oRM5pLXn0O7kBeWvIpw38huA+f+4m0KcALgh6q37YB0vL5a/cPaZJy
         cMZ+0P9R4XCNGp6DS0dl79ggYCSqQU8ABujOYyMuOfkXoGTp2af4cjulNOMqA++UiQcr
         kX873H/lyzGuFoz+bVzx7vwdQx9jj3Epyq47x9in1plwnC8HoFzb5CS7/92om0elhvx3
         tyNz93bxEzWoOmA9QPgI23+sAUVUIRvF0YbTLA5nXZMLnXmkD3kY0F1i6/VnZ+qZNzTB
         zGTyk+mWSwtvTJpXXaQTqx8eyvacJ7ozDtvX10qL1uaORgAqyiru6ZfpPS3clVylZNr0
         pOKA==
X-Gm-Message-State: AJIora+zuyp0X9hDSKyGbvof5W6UM2h/miRhMI2lfH+PuYcoA1X/kVf/
	M5YfW+TsD7TjuVxwCk6Ft6bDdPCFyHikou7r
X-Google-Smtp-Source: 
 AGRyM1sztqPufUrqCU7MO+CdGOOr4UagMsgGb4rP5jPXeYIXCFBBoscVTEOzx/RPFXx+/Pn7Cg5r2Q==
X-Received: by 2002:a05:6402:5191:b0:437:61ed:92c1 with SMTP id
 q17-20020a056402519100b0043761ed92c1mr59009332edd.177.1657182189915;
        Thu, 07 Jul 2022 01:23:09 -0700 (PDT)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id
 o15-20020a056402038f00b0043a67dbbb4csm8545025edv.83.2022.07.07.01.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 01:23:09 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-oe][PATCH 2/2] modemmanager: upgrade 1.18.8 -> 1.18.10
Date: Thu,  7 Jul 2022 10:22:00 +0200
Message-Id: <20220707082200.2497308-3-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220707082200.2497308-1-adrian.freihofer@siemens.com>
References: <20220707082200.2497308-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Jul 2022 08:23:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97761

* Build:
  ** Require libqmi 1.30.8.
* FCC unlock:
  ** Updated SDX55 unlock script to handle the new method introduced in
     the latest firmware releases.
* Modem interface:
  ** Set signal quality to 0% on shutdown.
  ** Set signal quality as recent on init.
* MBIM:
  ** Fix task completion when peeking device fails.
  ** Fix several GError double-frees.
* mmcli:
  ** Don't print signal quality until modem is enabled.
* Plugins:
  ** foxconn: remove carrier mapping table for T99W175.
* Several other minor improvements and fixes.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../{modemmanager_1.18.8.bb => modemmanager_1.18.10.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.18.8.bb => modemmanager_1.18.10.bb} (97%)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.18.8.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.18.10.bb
similarity index 97%
rename from meta-oe/recipes-connectivity/modemmanager/modemmanager_1.18.8.bb
rename to meta-oe/recipes-connectivity/modemmanager/modemmanager_1.18.10.bb
index 28f81ba6e..9316cbbbc 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.18.8.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.18.10.bb
@@ -12,7 +12,7 @@ inherit gnomebase gettext systemd gobject-introspection bash-completion
 
 DEPENDS = "glib-2.0 libgudev libxslt-native dbus"
 
-SRCREV ?= "0d8b5e93fc62eb0f41e18a2d9d845331d7af36ec"
+SRCREV ?= "1338749739e0c01bdbc6ddf92388a781806ec3ac"
 
 # Patch 0001 will be in ModemManager > 1.19
 SRC_URI = " \
-- 
2.35.3


