Return-Path: <jlu@pengutronix.de>
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
	[85.220.165.71])
	by mail.openembedded.org (Postfix) with ESMTP id AAA3A7BE3C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2019 12:28:45 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps
	(TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1iXlGx-0005Ve-A3; Thu, 21 Nov 2019 13:09:19 +0100
Received: from jlu by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1iXlGw-0007HW-Vt; Thu, 21 Nov 2019 13:09:18 +0100
From: Jan Luebbe <jlu@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Nov 2019 13:09:11 +0100
Message-Id: <20191121120913.23013-4-jlu@pengutronix.de>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191121120913.23013-1-jlu@pengutronix.de>
References: <20191121120913.23013-1-jlu@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 4/6] opensc: add support for native builds
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Nov 2019 12:28:45 -0000
Content-Transfer-Encoding: 8bit

This is needed as a dependency when using SoftHSM from the PKCS#11
OpenSSL engine for code singing.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
---
 meta-oe/recipes-support/opensc/opensc_0.19.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/opensc/opensc_0.19.0.bb b/meta-oe/recipes-support/opensc/opensc_0.19.0.bb
index 440859a37a93..6354ca3f48ff 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.19.0.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.19.0.bb
@@ -45,3 +45,5 @@ FILES_${PN}-dev += "\
     ${libdir}/pkcs11/onepin-opensc-pkcs11.so \
     ${libdir}/pkcs11/pkcs11-spy.so \
 "
+
+BBCLASSEXTEND="native"
-- 
2.24.0


