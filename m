Return-Path: <gerard.salvatella@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57BB1C25B77
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 16:30:19 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.18823.1715877008901197210
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 May 2024 09:30:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=gerard.salvatella@siemens.com header.s=fm1 header.b=Dv8Cmw+A;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1321161-202405161630052fd4f02cf3011b99b4-_bmry4@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202405161630052fd4f02cf3011b99b4
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 16 May 2024 18:30:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=gerard.salvatella@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=TPrIu8+YAGqt6w1N4WxqDlC3nGD4xf2HTHYHuhTCxvE=;
 b=Dv8Cmw+AgOKg5tB/SXu8R5wktwGKtH38SjPM7bVOnOVc6v2OP9Z1+DTklOJu7rnitgqqYs
 /Q0Wc0Nyh8uKwerjrqv++UqeEA0aTLAapuliwbvRypuUqOImT/GsPy/HDw1vS41iaBd9AbUg
 R9JYBawMC6xvSzmSHQQHdDUj2tYtc=;
From: "G. Salvatella" <gerard.salvatella@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gerard Salvatella <gerard.salvatella@siemens.com>
Subject: [meta-oe][PATCH] libwebsockets: fix buildpath warnings
Date: Thu, 16 May 2024 18:30:58 +0200
Message-ID: <20240516163058.465553-1-gerard.salvatella@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1321161:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 May 2024 16:30:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110416

From: Gerard Salvatella <gerard.salvatella@siemens.com>

In order to remove absolute paths from the cmake artifacts, paths from
the `$lib` folder should also be stripped off, otherwise internally
linked libraries (e.g. libz) may appear.
---
 .../recipes-connectivity/libwebsockets/libwebsockets_4.3.3.bb   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.3.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.3.bb
index 4518e2faa..8f8b70421 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.3.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.3.bb
@@ -42,6 +42,8 @@ do_install:append() {
     sed -i -e 's|${STAGING_LIBDIR}/libuv.so|uv|g' ${D}${libdir}/cmake/libwebsockets/LibwebsocketsTargets.cmake
     sed -i -e 's|${STAGING_INCDIR}||g' ${D}${libdir}/cmake/libwebsockets/LibwebsocketsTargets.cmake \
                                        ${D}${libdir}/cmake/libwebsockets/libwebsockets-config.cmake
+    sed -i -e 's|${STAGING_LIBDIR}||g' ${D}${libdir}/cmake/libwebsockets/LibwebsocketsTargets.cmake \
+                                       ${D}${libdir}/cmake/libwebsockets/libwebsockets-config.cmake
 }
 
 PACKAGES =+ "${PN}-testapps ${PN}-evlib-event ${PN}-evlib-uv ${PN}-evlib-ev ${PN}-evlib-sd"
-- 
2.44.0


