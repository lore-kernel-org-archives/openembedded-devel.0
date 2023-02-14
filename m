Return-Path: <jlu@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 867F6C6379F
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 13:14:04 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.6373.1676380439490264382
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Feb 2023 05:14:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: jlu@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1pRv88-0000to-RD; Tue, 14 Feb 2023 14:13:56 +0100
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <jlu@pengutronix.de>)
	id 1pRv85-004tPS-NC; Tue, 14 Feb 2023 14:13:54 +0100
Received: from jlu by dude03.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <jlu@pengutronix.de>)
	id 1pRv86-0074Pu-1d; Tue, 14 Feb 2023 14:13:54 +0100
From: Jan Luebbe <jlu@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Jan Luebbe <jlu@pengutronix.de>
Subject: [meta-oe][PATCH 1/2] smemstat: add recipe
Date: Tue, 14 Feb 2023 14:13:48 +0100
Message-Id: <20230214131349.1685229-1-jlu@pengutronix.de>
X-Mailer: git-send-email 2.30.2
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101071

This is useful to see which processes use physical memory.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
---
 .../smemstat/smemstat_0.02.11.bb              | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/smemstat/smemstat_0.02.11.bb

diff --git a/meta-oe/recipes-devtools/smemstat/smemstat_0.02.11.bb b/meta-oe/recipes-devtools/smemstat/smemstat_0.02.11.bb
new file mode 100644
index 000000000000..37015ce6bdc1
--- /dev/null
+++ b/meta-oe/recipes-devtools/smemstat/smemstat_0.02.11.bb
@@ -0,0 +1,27 @@
+SUMMARY = "smemstat reports the physical memory usage taking into consideration shared memory"
+HOMEPAGE = "https://github.com/ColinIanKing/smemstat"
+LICENSE = "GPL-2.0-or-later"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+DEPENDS = "ncurses"
+
+SRC_URI = "git://github.com/ColinIanKing/smemstat.git;protocol=https;branch=master"
+SRCREV = "9eea7504ab33783d804c4ed9237e299effb68874"
+
+S = "${WORKDIR}/git"
+
+do_configure () {
+	:
+}
+
+do_compile () {
+	oe_runmake
+}
+
+do_install () {
+	install -d -m 755 ${D}${sbindir}
+	install -m 755 ${B}/smemstat ${D}${sbindir}/
+	install -d -m 755 ${D}${mandir}/man8
+	install -m 644 ${S}/smemstat.8 ${D}${mandir}/man8/
+}
-- 
2.30.2


