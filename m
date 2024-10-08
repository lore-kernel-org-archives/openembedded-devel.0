Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AEF6CF0427
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 21:38:54 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.971.1728423533484956912
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Oct 2024 14:38:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=QOnWTReq;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202410082138490aab98a2660b04faf0-dzp4uy@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202410082138490aab98a2660b04faf0
        for <openembedded-devel@lists.openembedded.org>;
        Tue, 08 Oct 2024 23:38:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=gm3ZcK9r1xGZTFKGAxk2k85s92MCLN2+Av9Svq3SaQA=;
 b=QOnWTReqnwVJcKDEozqNXdNL9D4k74PDEJhM4Y/nJ0vGUk4GurRxqoZCnIVglwcacCtVOt
 arUcy9LQiVMt5c8w9IZ+7q7x63TMXSyZCAebQ6FwL2Gn7zFDXJekim7UQCLBpiCWn+RpUpbk
 cRGvkn1c0jHhdgPJwTDnIErNswoFjXkP9VXNnoccOQpBE7BXOGUvSTokxBAKulGsV1x5NBQD
 pgNRv7M7GutKa81iCaNxkqSAeNYzQkqLcV1G5eLfUI1rtOqxq8cPrvMk/tbtc5q1yjQzUtZA
 /rj5LWpoY/H7kpaAuD1Zc4bULj8LpgYhTUBJ2/WZbRVbkSusD6tYHMIg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>
Subject: [meta-oe][kirkstone][PATCH] cjson: upgrade 1.7.17 -> 1.7.18
Date: Tue,  8 Oct 2024 23:36:09 +0200
Message-Id: <20241008213609.224824-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Oct 2024 21:38:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112720

From: Peter Marko <peter.marko@siemens.com>

Changelog:
============
* Add NULL check to cJSON_SetValuestring()(CVE-2024-31755)
* Remove non-functional list handling of compiler flags
* Fix heap buffer overflow
* remove misused optimization flag -01
* Set free'd pointers to NULL whenever they are not reassigned immediately after

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(From meta-openembedded rev: 535822eff7647b6363225bb8f04d2d7d59a71204)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/cjson/{cjson_1.7.17.bb => cjson_1.7.18.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/cjson/{cjson_1.7.17.bb => cjson_1.7.18.bb} (91%)

diff --git a/meta-oe/recipes-devtools/cjson/cjson_1.7.17.bb b/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
similarity index 91%
rename from meta-oe/recipes-devtools/cjson/cjson_1.7.17.bb
rename to meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
index c9c38a9fe3..797ab028cd 100644
--- a/meta-oe/recipes-devtools/cjson/cjson_1.7.17.bb
+++ b/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=218947f77e8cb8e2fa02918dc41c50d0"
 
 SRC_URI = "git://github.com/DaveGamble/cJSON.git;branch=master;protocol=https"
-SRCREV = "87d8f0961a01bf09bef98ff89bae9fdec42181ee"
+SRCREV = "acc76239bee01d8e9c858ae2cab296704e52d916"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2


