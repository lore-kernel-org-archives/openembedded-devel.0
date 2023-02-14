Return-Path: <jlu@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BC77C05027
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 15:19:55 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.9612.1676387986526303325
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Feb 2023 07:19:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: jlu@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1pRx5s-0006X9-Qz; Tue, 14 Feb 2023 16:19:44 +0100
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <jlu@pengutronix.de>)
	id 1pRx5q-004uZc-W2; Tue, 14 Feb 2023 16:19:44 +0100
Received: from jlu by dude03.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <jlu@pengutronix.de>)
	id 1pRx5r-00EOQM-HI; Tue, 14 Feb 2023 16:19:43 +0100
From: Jan Luebbe <jlu@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Jan Luebbe <jlu@pengutronix.de>
Subject: [meta-oe][PATCH v2] smemstat: add recipe
Date: Tue, 14 Feb 2023 16:17:56 +0100
Message-Id: <20230214151754.3430230-1-jlu@pengutronix.de>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Feb 2023 15:19:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101076

This is useful to see which processes use physical memory.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
---

Changed since v2:
 - use make install for installation (suggested by Martin Jansa)
 - inherit bash-completion as make install also installs the
   bash-completion script
 - drop empty do_configure function

---
 .../smemstat/smemstat_0.02.11.bb              | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/smemstat/smemstat_0.02.11.bb

diff --git a/meta-oe/recipes-devtools/smemstat/smemstat_0.02.11.bb b/meta-oe/recipes-devtools/smemstat/smemstat_0.02.11.bb
new file mode 100644
index 000000000000..21f315b1c257
--- /dev/null
+++ b/meta-oe/recipes-devtools/smemstat/smemstat_0.02.11.bb
@@ -0,0 +1,22 @@
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
+inherit bash-completion
+
+do_compile () {
+    oe_runmake smemstat
+}
+
+do_install () {
+    oe_runmake DESTDIR=${D} install
+}
-- 
2.30.2


