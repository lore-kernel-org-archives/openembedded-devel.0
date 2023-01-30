Return-Path: <jlu@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF05AC636D0
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 12:34:27 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.39690.1675082061166183208
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Jan 2023 04:34:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: jlu@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1pMTMZ-0006GW-Bx; Mon, 30 Jan 2023 13:34:19 +0100
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <jlu@pengutronix.de>)
	id 1pMTMZ-001TC3-L8; Mon, 30 Jan 2023 13:34:18 +0100
Received: from jlu by dude03.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <jlu@pengutronix.de>)
	id 1pMTMX-009Ksd-RG; Mon, 30 Jan 2023 13:34:17 +0100
From: Jan Luebbe <jlu@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Jan Luebbe <jlu@pengutronix.de>
Subject: [meta-oe][PATCH 2/2] softhsm: enable objectstore backend
Date: Mon, 30 Jan 2023 13:34:03 +0100
Message-Id: <20230130123402.2218385-2-jlu@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230130123402.2218385-1-jlu@pengutronix.de>
References: <20230130123402.2218385-1-jlu@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Jan 2023 12:34:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100859

We already depend on sqlite, but the objectstore backend using it is not
enabled by default. Add the necessary configure option.

The db backend is more robust when accessing the objectstore from many
parallel processes (such as during kernel module signing).

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
---
 meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb b/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb
index 44e51fda9181..2c68ba984fe3 100644
--- a/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb
+++ b/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb
@@ -13,6 +13,7 @@ SRC_URI[sha256sum] = "61249473054bcd1811519ef9a989a880a7bdcc36d317c9c25457fc614d
 inherit autotools pkgconfig siteinfo
 
 EXTRA_OECONF += " --with-sqlite3=${STAGING_DIR_HOST}/usr"
+EXTRA_OECONF += " --with-objectstore-backend-db"
 EXTRA_OECONF += "${@oe.utils.conditional('SITEINFO_BITS', '64', ' --enable-64bit', '', d)}"
 
 PACKAGECONFIG ?= "ecc eddsa pk11 openssl"
-- 
2.30.2


