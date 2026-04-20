Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BFB3F36C4B
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 07:46:20 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14891.1776671172195526622
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2026 00:46:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=akHV5kcv;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so17944735e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 00:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776671170; x=1777275970; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ccWGhAgV+ios4M+TMUyP4P6Tnsyjy3jseOp1m9x2DyU=;
        b=akHV5kcvS7p3uRTm6jzT2yUw0k3ZOJsQMEq68QpQAjCaQLqEg8AHTDHtTFJcBUKvVn
         R442ClMhT+qekfbHnYorTPtsqXDshbxEXoKDyuA3cgwj6h8Tdy6DVki4Fdyru/A7J0NY
         rs3s+RcykquMTcoH3EfMAxzQ7673s4uh2vIzwZW14sJ9y8R1iYXoWCVe5e6jdEp675tc
         uzWcv80r7lCCb8zLq3IKQ0pwdB/fkqSlyYQQK8wvIfkrSXQ0z9qQsCVdZnVwxd4x9uLz
         Q+ErZuKi3fLckFg6Dd9mtznD/daBHmTbR/CXLMueaRScK+684M0kTJmVL8ty6q1uzs8q
         vqNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776671170; x=1777275970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ccWGhAgV+ios4M+TMUyP4P6Tnsyjy3jseOp1m9x2DyU=;
        b=dvRfBjoeSttBIiiuA+0RPn+IcX9AlKEb0gm8saMqkjTp4pr5HgdNzDfW7zakgrZR7s
         oiWXcqrLgql1fRZu+2imBrdHBS+kHWVyuMg5cssjQPA2C670mXcIQBRIfrRVLsqT5tce
         bZ0XInCDke/YsqmF1SXJVoJoOSUd58PFT8fgkRYMHBGF0AejlppYoyr7i2Qx4YXo8Y/M
         RFxjy8/h62xuxOPphrnTVOorRR0L1yU/oFjjD4naFdnuHZx0RyJEql6O+atyTvP1C8Ik
         gT3Oq8zSv8SSiXeZLf+d5+I6IjBzWmHOx+EwZ5PCG9xx8h38pYrjtWqeLojlG6Qylynh
         CAOw==
X-Gm-Message-State: AOJu0Yz/WN7xrL3dkyi2OJFGa9LUnsNOFfOr3BqhzsWqS1IMNUrtW/td
	QyXDuu9TOn74dIpEMjHkynqecUDG0p28Ru4q+Reoy625WjvxTUvoo9vhqG6HCQ==
X-Gm-Gg: AeBDievy+FATy/MkkD6ERADa+ngNfUmrbM5N0UPtlGH7pdSDUxZsdTPJkCQByk1AZwf
	w2NESOACfgpgNkRWr/DuecELVHsuB56ox8fMFLIggn01gGgd0RaunWOADuYt2s3wXcr7ntsAXhU
	v/DGfLtuCfLPlK/k2RhJwVJ1AU1EEUTP7pf23Blk3SUz6WN3PgrrGgrWnhXQV6wzEpDr2BZVxUy
	4cMqkZ42vplMVU6ntarH0CEjb86mqvm8QdT83hup5m/GhzdtUNpm6NxyvuRIfL2P0E2HmwUFoZQ
	vDknSAIaSIimWpywHNfjy1CiVszAHUvZHBea/2WGHZTGjFTxr9c8RGOIZR3rN20X5PjNHbcklVQ
	Snjka5FyJIuTZ0fq2KUeqyuwYtZ8j7eOro/P9OcRKWA4I6hv/8HpM8fyyjeStDbCLTPtiGUZKkg
	WOGjL2cugjXWAjZ8hiVxYm2/wooMhFmnk=
X-Received: by 2002:a05:600c:1da1:b0:488:d376:42cd with SMTP id 5b1f17b1804b1-488fb785901mr196024045e9.22.1776671170399;
        Mon, 20 Apr 2026 00:46:10 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4eec9sm25904289f8f.34.2026.04.20.00.46.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 00:46:09 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][PATCH 1/2] monkey: upgrade 1.8.4 -> 1.8.7
Date: Mon, 20 Apr 2026 09:46:08 +0200
Message-ID: <20260420074609.3901591-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 07:46:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126484

Shortlog:
https://github.com/monkey/monkey/compare/v1.8.4...v1.8.7

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../monkey/{monkey_1.8.4.bb => monkey_1.8.7.bb}           | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-httpd/monkey/{monkey_1.8.4.bb => monkey_1.8.7.bb} (92%)

diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.8.4.bb b/meta-webserver/recipes-httpd/monkey/monkey_1.8.7.bb
similarity index 92%
rename from meta-webserver/recipes-httpd/monkey/monkey_1.8.4.bb
rename to meta-webserver/recipes-httpd/monkey/monkey_1.8.7.bb
index 126a2a6fa5..01565de6ef 100644
--- a/meta-webserver/recipes-httpd/monkey/monkey_1.8.4.bb
+++ b/meta-webserver/recipes-httpd/monkey/monkey_1.8.7.bb
@@ -7,13 +7,13 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
 
 SECTION = "net"
 
-SRC_URI = "git://github.com/monkey/monkey;branch=master;protocol=https \
+SRC_URI = "git://github.com/monkey/monkey;branch=master;protocol=https;tag=v${PV} \
            file://0001-fastcgi-Use-value-instead-of-address-of-sin6_port.patch \
            file://0001-include-Fix-location-of-mk_core.h-etal.patch \
            file://monkey.service \
            file://monkey.init"
 
-SRCREV = "94af273244369e1a8426d0d1f6376475aff90db9"
+SRCREV = "0fd3bbd657c6d6339315709ef068493c572b973c"
 
 UPSTREAM_CHECK_COMMITS = "1"
 
@@ -51,6 +51,10 @@ do_install:append() {
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -Dm 644 ${UNPACKDIR}/monkey.service ${D}/${systemd_unitdir}/system/monkey.service
     fi
+
+    # QA Issue: monkey installs files in /var/volatile, but it is expected to be empty [empty-dirs]
+    # these folders are supposed to be recreated at runtime
+    find ${D}/var -type d -empty -delete
 }
 
 INITSCRIPT_NAME = "monkey"

