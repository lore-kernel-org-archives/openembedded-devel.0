Return-Path: <jlu@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 851F5C61DA4
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 13:14:04 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.6375.1676380441474956485
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Feb 2023 05:14:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: jlu@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1pRv8B-0000vV-QX; Tue, 14 Feb 2023 14:13:59 +0100
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <jlu@pengutronix.de>)
	id 1pRv89-004tPz-Vt; Tue, 14 Feb 2023 14:13:59 +0100
Received: from jlu by dude03.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <jlu@pengutronix.de>)
	id 1pRv8A-0074Py-CC; Tue, 14 Feb 2023 14:13:58 +0100
From: Jan Luebbe <jlu@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Jan Luebbe <jlu@pengutronix.de>
Subject: [meta-oe][PATCH 2/2] linux-serial-test: add recipe
Date: Tue, 14 Feb 2023 14:13:49 +0100
Message-Id: <20230214131349.1685229-2-jlu@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230214131349.1685229-1-jlu@pengutronix.de>
References: <20230214131349.1685229-1-jlu@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Feb 2023 13:14:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101072

This is a collection of tests for serial ports and their drivers.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
---
 .../linux-serial-test/linux-serial-test_git.bb      | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb

diff --git a/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb b/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
new file mode 100644
index 000000000000..7f08a82d6180
--- /dev/null
+++ b/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "Linux Serial Test Application"
+HOMEPAGE = "https://github.com/cbrake/linux-serial-test"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSES/MIT;md5=544799d0b492f119fa04641d1b8868ed"
+
+SRC_URI = "git://github.com/cbrake/linux-serial-test.git;protocol=https;branch=master"
+
+PV = "0+git${SRCPV}"
+SRCREV = "cacd2790eae7bf4767d4243f5b31134698d3b20d"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
-- 
2.30.2


