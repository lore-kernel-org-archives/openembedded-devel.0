Return-Path: <m.olbrich@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EE03C25B75
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 09:59:49 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.10055.1716976783377007215
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 May 2024 02:59:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: mol@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mol@pengutronix.de>)
	id 1sCG5t-0000RE-RL; Wed, 29 May 2024 11:59:41 +0200
Received: from [2a0a:edc0:0:1101:1d::54] (helo=dude05.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mol@pengutronix.de>)
	id 1sCG5t-003RhM-1f; Wed, 29 May 2024 11:59:41 +0200
Received: from mol by dude05.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mol@pengutronix.de>)
	id 1sCG5s-00HMlL-3D;
	Wed, 29 May 2024 11:59:41 +0200
From: Michael Olbrich <m.olbrich@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Michael Olbrich <m.olbrich@pengutronix.de>
Subject: [meta-networking][PATCH] nftables: avoid python dependencies when building without python
Date: Wed, 29 May 2024 11:58:51 +0200
Message-Id: <20240529095851.4138475-1-m.olbrich@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 May 2024 09:59:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110611

Use inherit_defer instead of inhert. This way, setuptools3 is not
inherited when python is removed from PACKAGECONFIG in a .bbappend file.
This avoids dependencies added by setuptools3.

Don't add nftables-python to PACKAGES if python is disabled. It adds
extra runtime dependencies on python3-core and python3-json.

Signed-off-by: Michael Olbrich <m.olbrich@pengutronix.de>
---
 meta-networking/recipes-filter/nftables/nftables_1.0.9.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-filter/nftables/nftables_1.0.9.bb b/meta-networking/recipes-filter/nftables/nftables_1.0.9.bb
index 771892274251..17f00ffd4269 100644
--- a/meta-networking/recipes-filter/nftables/nftables_1.0.9.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_1.0.9.bb
@@ -35,9 +35,9 @@ EXTRA_OECONF = " \
 
 SETUPTOOLS_SETUP_PATH = "${S}/py"
 
-inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'setuptools3', '', d)}
+inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'python', 'setuptools3', '', d)}
 
-PACKAGES =+ "${PN}-python"
+PACKAGES =+ "${@bb.utils.contains('PACKAGECONFIG', 'python', '${PN}-python', '', d)}"
 FILES:${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
 RDEPENDS:${PN}-python = "python3-core python3-json ${PN}"
 
-- 
2.39.2


