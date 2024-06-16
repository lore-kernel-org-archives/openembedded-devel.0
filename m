Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2AA2C27C53
	for <webhook@archiver.kernel.org>; Sun, 16 Jun 2024 20:38:29 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.42013.1718570305113900971
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Jun 2024 13:38:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=f6zFOOSu;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202406162038225a6ea9850fa82607b5-stam2j@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202406162038225a6ea9850fa82607b5
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 16 Jun 2024 22:38:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=flhECRyrhdSc/eKNS0AZQKc0JQdaNUO2Yx6d5WfTIdw=;
 b=f6zFOOSuAT0ndtsYex9wpHHwH9bmsZFHQUacr1tGcL6iXMxciekBwQIEBTfUJ8bEUDlpwg
 eNhZbRaOUDidSaTjuIddawJ9Wcslme9zWQMYcMDQqz7SVPVotbsEzle2wTuxzkU3u7gguEqF
 WiegaopoI2z+RB3XUk/jq0xzB5rTI=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gerard Salvatella <gerard.salvatella@siemens.com>,
	Khem Raj <raj.khem@gmail.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][scarthgap][PATCH v2 3/6] libwebsockets: fix buildpath warnings
Date: Sun, 16 Jun 2024 22:36:48 +0200
Message-Id: <20240616203651.856968-4-peter.marko@siemens.com>
In-Reply-To: <20240616203651.856968-1-peter.marko@siemens.com>
References: <20240616203651.856968-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Jun 2024 20:38:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110934

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


