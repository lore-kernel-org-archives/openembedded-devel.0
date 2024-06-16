Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7028EC2BA18
	for <webhook@archiver.kernel.org>; Sun, 16 Jun 2024 19:24:19 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.40609.1718565853470598470
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Jun 2024 12:24:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=tLKmnueP;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-2024061619241042c950166eebb9d98a-9x5crf@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2024061619241042c950166eebb9d98a
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 16 Jun 2024 21:24:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=/gMEb72Yx0kkxDRXrgyF4ikB/WMAjZkKvnt9of/xZE8=;
 b=tLKmnueP486fNyooIgEbmXLo/wzIW+xNA73VYoDnWMcv7i5LI8DOKARQ8g6jct7bC5Ey7I
 b6DlURobx0WzE8TH19ig0aywnaMXu2nFNS/gV21Bjk2JJzvQVpxo/25ES2lDZaPagRJ+EvSd
 N6bPwZGgur+eaxKaGTHq5rMKZ1bUE=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gerard Salvatella <gerard.salvatella@siemens.com>,
	Khem Raj <raj.khem@gmail.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][scarthgap][PATCH 3/6] libwebsockets: fix buildpath warnings
Date: Sun, 16 Jun 2024 21:23:07 +0200
Message-Id: <20240616192310.856262-4-peter.marko@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110925

From: Gerard Salvatella <gerard.salvatella@siemens.com>

From: Gerard Salvatella <gerard.salvatella@siemens.com>

In order to remove absolute paths from the cmake artifacts, paths from
the `$lib` folder should also be stripped off, otherwise internally
linked libraries (e.g. libz) may appear.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../recipes-connectivity/libwebsockets/libwebsockets_4.3.3.bb   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.3.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.3.bb
index 4518e2faaa..8f8b70421c 100644
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
2.30.2


