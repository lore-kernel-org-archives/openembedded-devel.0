Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBFF8C52D7C
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 17:10:50 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.128679.1723741849024574786
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Aug 2024 10:10:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=H7Oaz0ly;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20240815171045e72e5cc66d881aa648-p0dt5c@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20240815171045e72e5cc66d881aa648
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 15 Aug 2024 19:10:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=uHUEWlFSkjG/iE874MsHa+nT7aQbKzZQWeEF1s+BUzE=;
 b=H7Oaz0lySAa5UcxLVpqfUul02ZsfAckowb/t5FK89RxhwFj/JHvRgguUeBPRZcJeWo6oKJ
 seOcPEP1LNHPXF83GPh2mh+UVtXpIXmSOWO/OcI0aKwvqT8nsrgHBzU0aSqR9nD0EqQaTCiw
 hZKbeehhQINTNiujAwmGqIyxnI34YgbO2Lw+OY8AoTiNRAr4qX32ov41ZjewYxsGMZnAdiv4
 quHZu3XEenko/OtlNTkFZE3NXGiURkgVvKGSIDDNvPc6V1+8irYxhgcjElhyG4xf/nP0k3n8
 lhUAp8ORZkT6FFTX4BNlZdzKX3tqq9Ii/1ylwcH9gumpaPnn2RCQcY+A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][scarthgap][PATCH] cjson: upgrade 1.7.17 -> 1.7.18
Date: Thu, 15 Aug 2024 19:09:54 +0200
Message-Id: <20240815170954.8458-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Aug 2024 17:10:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111824

From: Wang Mingyu <wangmy@fujitsu.com>

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
---
 .../recipes-devtools/cjson/{cjson_1.7.17.bb => cjson_1.7.18.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/cjson/{cjson_1.7.17.bb => cjson_1.7.18.bb} (97%)

diff --git a/meta-oe/recipes-devtools/cjson/cjson_1.7.17.bb b/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
similarity index 97%
rename from meta-oe/recipes-devtools/cjson/cjson_1.7.17.bb
rename to meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
index ea74f1d680..bdeab3055c 100644
--- a/meta-oe/recipes-devtools/cjson/cjson_1.7.17.bb
+++ b/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=218947f77e8cb8e2fa02918dc41c50d0"
 SRC_URI = "git://github.com/DaveGamble/cJSON.git;branch=master;protocol=https \
            file://run-ptest \
          "
-SRCREV = "87d8f0961a01bf09bef98ff89bae9fdec42181ee"
+SRCREV = "acc76239bee01d8e9c858ae2cab296704e52d916"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2


