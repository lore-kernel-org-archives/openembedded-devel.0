Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80CFBC433F5
	for <webhook@archiver.kernel.org>; Sat,  5 Feb 2022 22:35:42 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.2530.1644100541626959770
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Feb 2022 14:35:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: redrectangle.org,
 ip: 217.70.183.193, mailfrom: robert.joslyn@redrectangle.org)
Received: (Authenticated sender: robert.joslyn@redrectangle.org)
	by mail.gandi.net (Postfix) with ESMTPSA id 5AD3D240002;
	Sat,  5 Feb 2022 22:35:37 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-devel@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [meta-oe][PATCH] hwdata: Update to 0.356
Date: Sat,  5 Feb 2022 14:34:58 -0800
Message-Id: <20220205223458.3696402-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Feb 2022 22:35:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95232

This data is dual licensed under GPL-2.0-or-later and XFree86-1.0,
update LICENSE to reflect this.

The data provided by this recipe are plain text files, so allarch can be
used. The do_compile step doesn't do anything and can be skipped.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 .../hwdata/{hwdata_0.347.bb => hwdata_0.356.bb}           | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/hwdata/{hwdata_0.347.bb => hwdata_0.356.bb} (79%)

diff --git a/meta-oe/recipes-support/hwdata/hwdata_0.347.bb b/meta-oe/recipes-support/hwdata/hwdata_0.356.bb
similarity index 79%
rename from meta-oe/recipes-support/hwdata/hwdata_0.347.bb
rename to meta-oe/recipes-support/hwdata/hwdata_0.356.bb
index 3713004e8..6c2ae5e5a 100644
--- a/meta-oe/recipes-support/hwdata/hwdata_0.347.bb
+++ b/meta-oe/recipes-support/hwdata/hwdata_0.356.bb
@@ -2,17 +2,21 @@ DESCRIPTION = "Hardware identification and configuration data"
 HOMEPAGE = "https://github.com/vcrhonek/hwdata"
 SECTION = "System/Base"
 
-LICENSE = "GPL-2.0+"
+LICENSE = "GPL-2.0+ | XFree86-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
-SRCREV = "ae89c73d89bb9f416b25ad9e850e9606e66a573e"
+SRCREV = "66a9f63255a06e2d9ec49501188ca47cb537675b"
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https"
 S = "${WORKDIR}/git"
 
+inherit allarch
+
 do_configure() {
     ${S}/configure --datadir=${datadir} --libdir=${libdir}
 }
 
+do_compile[noexec] = "1"
+
 do_install() {
     oe_runmake install DESTDIR=${D}
 }
-- 
2.34.1


