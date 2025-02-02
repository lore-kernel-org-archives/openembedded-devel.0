Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE265C02193
	for <webhook@archiver.kernel.org>; Sun,  2 Feb 2025 21:40:44 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.73901.1738532436529705373
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Feb 2025 13:40:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=FnoQRRHs;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20250202214034e4e9f0756324d8a304-2w9teu@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20250202214034e4e9f0756324d8a304
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 02 Feb 2025 22:40:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=R3zEbzkIdOrl+a3k/7hB2g3929G8hLKSbrBE0+VfoBs=;
 b=FnoQRRHsY5uu4OG5yxME3+Y2ZxIPF4cbYVx6xnwF9sGd72Y2ToglCzppYSepXRrMsUXRUq
 BJ+KEk59+aC/6dfOLUMOAE7Pz7vw/Ny7y9Ar57zfz0W9jMhcBUN5GLnqjeZBnZ9c+T8JrLr3
 Gv31vcC+Z1w32y1x3qJe8I0Ktksq22c0gF2Wb/+SbX0wdYbtcmNSX4IFIT8fI2EHhdPfMpms
 UUDqahOKrw8q+/bvzkV7lm/lPn75RZ+wBvGLST0Y4jOTfRb0CLecj8julgmX5zVpOoh1CoET
 WbQdkDCSHT9g2MD2kKgpgp7SNgDVoYQUegyrcyYLWhUD5QaGMUsu8rZw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 7/8] protobuf: set CVE_PRODUCT
Date: Sun,  2 Feb 2025 22:39:09 +0100
Message-Id: <20250202213910.284312-7-peter.marko@siemens.com>
In-Reply-To: <20250202213910.284312-1-peter.marko@siemens.com>
References: <20250202213910.284312-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Feb 2025 21:40:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115226

From: Peter Marko <peter.marko@siemens.com>

Add all relevant products from following query.
Also remove generic "protobuf" to avoid mathcing golang:protobuf.

.../downloads/CVE_CHECK2$ sqlite3 nvdcve_2-2.db
sqlite> select vendor, product, count(8) from products where product like '%protobuf%' group by vendor, product;
golang|protobuf|1
google|google-protobuf|5
google|protobuf|2
google|protobuf-cpp|4
google|protobuf-java|15
google|protobuf-javalite|12
google|protobuf-kotlin|6
google|protobuf-kotlin-lite|4
google|protobuf-python|4
protobuf|protobuf|1
protobuf-c_project|protobuf-c|2
protobufjs_project|protobufjs|3
rust-protobuf_project|rust-protobuf|2

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
index 7a26967dc8..a470a7c643 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
@@ -27,6 +27,8 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.(25\.(\d+)))"
 
 S = "${WORKDIR}/git"
 
+CVE_PRODUCT = "google:protobuf protobuf:protobuf google-protobuf protobuf-cpp"
+
 inherit cmake pkgconfig ptest
 
 PACKAGECONFIG ??= ""

