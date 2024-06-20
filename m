Return-Path: <jlu@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E335C2BA1A
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 16:07:32 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.51626.1718899642201449373
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Jun 2024 09:07:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: jlu@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1sKKJk-0007tp-Qc; Thu, 20 Jun 2024 18:07:20 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <jlu@pengutronix.de>)
	id 1sKKJk-003jkP-Dx; Thu, 20 Jun 2024 18:07:20 +0200
Received: from jlu by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <jlu@pengutronix.de>)
	id 1sKKJk-00Gh4L-18;
	Thu, 20 Jun 2024 18:07:20 +0200
From: Jan Luebbe <jlu@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Luebbe <jlu@pengutronix.de>
Subject: [meta-python][PATCH 2/2] python3-grpcio-channelz: new recipe
Date: Thu, 20 Jun 2024 18:07:05 +0200
Message-Id: <20240620160705.3978190-2-jlu@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240620160705.3978190-1-jlu@pengutronix.de>
References: <20240620160705.3978190-1-jlu@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Jun 2024 16:07:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110980

gRPC channelz is used to expose runtime statistics for administration
and debugging purposes.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
---
 .../python/python3-grpcio-channelz_1.62.2.bb     | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-grpcio-channelz_1.62.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.62.2.bb b/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.62.2.bb
new file mode 100644
index 000000000000..ed5ede4252a1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.62.2.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Google gRPC channelz"
+HOMEPAGE = "http://www.grpc.io/"
+SECTION = "devel/python"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=7145f7cdd263359b62d342a02f005515"
+
+inherit pypi setuptools3
+
+DEPENDS += "python3-grpcio"
+
+SRC_URI[sha256sum] = "6e4ac2c43d76b245c5f66d98f523db08786b186128a655ee6f20a30a7e68e4f9"
+
+RDEPENDS:${PN} = "python3-grpcio"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


