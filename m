Return-Path: <jlu@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF6BC05027
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 08:44:11 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.18663.1675241048827701644
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Feb 2023 00:44:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: jlu@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1pN8is-0006Gg-Kq; Wed, 01 Feb 2023 09:44:06 +0100
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <jlu@pengutronix.de>)
	id 1pN8is-001sBQ-O2; Wed, 01 Feb 2023 09:44:05 +0100
Received: from jlu by dude03.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <jlu@pengutronix.de>)
	id 1pN8iq-00CIdh-O7; Wed, 01 Feb 2023 09:44:04 +0100
From: Jan Luebbe <jlu@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Jan Luebbe <jlu@pengutronix.de>
Subject: [meta-oe][PATCH v2] extract-cert: add recipe
Date: Wed,  1 Feb 2023 09:17:16 +0100
Message-Id: <20230201081715.2792933-1-jlu@pengutronix.de>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Feb 2023 08:44:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100901

The extract-cert tool is used to fetch the X.509 certificate associated
with a key from a PKCS#11 token (such as a HSM or YubiKey). This version
is derived from certs/extract-cert in the Linux kernel as a stand-alone
tool to make it available when signing other software components besides
the kernel.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
---

v1->v2:
  Renamed from _git.bb to _0.3.bb and removed 'PR = "0.3"' line as
  requested by Khem Raj.

 .../extract-cert/extract-cert_0.3.bb               | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/extract-cert/extract-cert_0.3.bb

diff --git a/meta-oe/recipes-devtools/extract-cert/extract-cert_0.3.bb b/meta-oe/recipes-devtools/extract-cert/extract-cert_0.3.bb
new file mode 100644
index 000000000000..a4cd7ad1577a
--- /dev/null
+++ b/meta-oe/recipes-devtools/extract-cert/extract-cert_0.3.bb
@@ -0,0 +1,14 @@
+SUMMARY = "small helper program to extract X.509 certificates from PKCS#11 tokens"
+LICENSE = "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+DEPENDS = "openssl"
+
+SRC_URI = "git://git.pengutronix.de/git/extract-cert;protocol=https;branch=master;"
+SRCREV = "d652b4e8279aef2a85f58676ab472744bafeafc9"
+
+S = "${WORKDIR}/git"
+
+inherit meson pkgconfig
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


