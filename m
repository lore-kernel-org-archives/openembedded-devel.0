Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7088C3DA6E
	for <webhook@archiver.kernel.org>; Wed,  3 Jan 2024 09:40:53 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.14334.1704274847204533136
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jan 2024 01:40:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=AH19QISM;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20240103094043c5987061f0d0ccbc93-ev4mrt@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20240103094043c5987061f0d0ccbc93
        for <openembedded-devel@lists.openembedded.org>;
        Wed, 03 Jan 2024 10:40:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=XOxy5i5M54IIWCG35Dhr1iZ1BxGkeOJSIQX9H1pl/W4=;
 b=AH19QISMIZdZsf8UAe5NE68CVo38S8Cmht8ykt+TiXErZA5Bhoaw6XIhzHmIsiDFcn38JO
 WEbwKrfHK+j7cZ0pxhGem2blTpTPzZBZDG9N+lBsoDeNeLdv5w9oLg3r37Jud1Xt2xANPMLo
 S/JUVyMtj/6+LzxZk9woOSycpNHKw=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH] protobuf-c: upgrade 1.4.1 -> 1.5.0
Date: Wed,  3 Jan 2024 10:39:43 +0100
Message-Id: <20240103093943.959731-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jan 2024 09:40:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108029

From: Peter Marko <peter.marko@siemens.com>

Current hash pointed to version with code already indentical
to v1.5.0, it was just missing three formal release commits:
    a15d80a Bump copyright years to 2023
    6600fd5 Bump version to 1.5.0
    8c201f6 CHANGELOG.md: 1.5.0

License-Update: copyright years refreshed

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../protobuf/{protobuf-c_1.4.1.bb => protobuf-c_1.5.0.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/protobuf/{protobuf-c_1.4.1.bb => protobuf-c_1.5.0.bb} (91%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.5.0.bb
similarity index 91%
rename from meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.1.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf-c_1.5.0.bb
index 1d9ca9daae..545618a4ec 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.1.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.5.0.bb
@@ -8,14 +8,14 @@ has been split out into the protobuf-c-rpc project."
 HOMEPAGE = "https://github.com/protobuf-c/protobuf-c"
 SECTION = "console/tools"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=9f725889e0d77383e26cb42b0b62cea2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d11077c6a2b5d2e64b9f32b61a9b78ba"
 
 DEPENDS = "protobuf-native protobuf"
 
 SRC_URI = "git://github.com/protobuf-c/protobuf-c.git;branch=next;protocol=https"
 SRC_URI:append:class-native = " file://0001-Makefile.am-do-not-compile-the-code-which-was-genera.patch"
 
-SRCREV = "ba4c55f0e686e0252c451f7163ab529e4b36831a"
+SRCREV = "8c201f6e47a53feaab773922a743091eb6c8972a"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2


