Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8B0DC27C53
	for <webhook@archiver.kernel.org>; Sun, 16 Jun 2024 20:38:39 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.41855.1718570311889241753
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Jun 2024 13:38:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=EyS3zVkl;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20240616203830f734945e96b2d626f6-nyv530@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20240616203830f734945e96b2d626f6
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 16 Jun 2024 22:38:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=vf2snWTI6i1JelgXf3cfBYyiBpgaMB2QdINuk/u1Pdk=;
 b=EyS3zVkldyGRDnSaPZggL1bzcz73pEy+3Qpj+ZRCfAkOoqi6u4bcNTieJ+IYkIYa21fsoj
 Qezwu9BqgtMomAx4RWLlXDjkvjNDuu5XwkZsStaE4jmQGZ5xWC5q8g9T2S63vags9DQv1kl6
 NP2OtuoLDEIKuGUtW60oB+ocU3/d8=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][scarthgap][PATCH v2 4/6] libwebsockets: remove STAGING_LIBDIR with /
Date: Sun, 16 Jun 2024 22:36:49 +0200
Message-Id: <20240616203651.856968-5-peter.marko@siemens.com>
In-Reply-To: <20240616203651.856968-1-peter.marko@siemens.com>
References: <20240616203651.856968-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Jun 2024 20:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110935

From: Martin Jansa <martin.jansa@gmail.com>

* after buildpath warnings fix from:
  https://git.openembedded.org/meta-openembedded/commit/?id=eeef1fddd9052bed4b1a91565260518eb042fed2
  the LibwebsocketsTargets.cmake ends with:
  INTERFACE_LINK_LIBRARIES "ssl;crypto;ssl;crypto;/libcap.so;-lpthread"
  instead of:
  INTERFACE_LINK_LIBRARIES "ssl;crypto;ssl;crypto;/OE/build/.../libwebsockets/4.3.3/lib32-recipe-sysroot/usr/lib/libcap.so;-lpthread"
  which causes e.g. mosquitto to fail in do_compile with:
  ninja: error: '/libcap.so', needed by 'src/mosquitto', missing and no known rule to make it

* this happens only when libwebsocket is built with libcap enabled
  (by libcap in DEPENDS)

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../recipes-connectivity/libwebsockets/libwebsockets_4.3.3.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.3.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.3.bb
index 8f8b70421c..3170d37f5b 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.3.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.3.bb
@@ -42,8 +42,8 @@ do_install:append() {
     sed -i -e 's|${STAGING_LIBDIR}/libuv.so|uv|g' ${D}${libdir}/cmake/libwebsockets/LibwebsocketsTargets.cmake
     sed -i -e 's|${STAGING_INCDIR}||g' ${D}${libdir}/cmake/libwebsockets/LibwebsocketsTargets.cmake \
                                        ${D}${libdir}/cmake/libwebsockets/libwebsockets-config.cmake
-    sed -i -e 's|${STAGING_LIBDIR}||g' ${D}${libdir}/cmake/libwebsockets/LibwebsocketsTargets.cmake \
-                                       ${D}${libdir}/cmake/libwebsockets/libwebsockets-config.cmake
+    sed -i -e 's|${STAGING_LIBDIR}/||g' ${D}${libdir}/cmake/libwebsockets/LibwebsocketsTargets.cmake \
+                                        ${D}${libdir}/cmake/libwebsockets/libwebsockets-config.cmake
 }
 
 PACKAGES =+ "${PN}-testapps ${PN}-evlib-event ${PN}-evlib-uv ${PN}-evlib-ev ${PN}-evlib-sd"
-- 
2.30.2


