Return-Path: <uol@pengutronix.de>
X-Greylist: delayed 1003 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 26 Nov 2019 08:43:46 UTC
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
	[85.220.165.71])
	by mail.openembedded.org (Postfix) with ESMTP id AD65E7EE86
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2019 08:43:46 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps
	(TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1iZWBb-0003z6-ST; Tue, 26 Nov 2019 09:27:03 +0100
Received: from uol by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1iZWBb-0001ei-Gw; Tue, 26 Nov 2019 09:27:03 +0100
From: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Nov 2019 09:26:56 +0100
Message-Id: <20191126082656.6303-1-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
Subject: [PATCH] python3-yarl: add missing dependencies
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
X-List-Received-Date: Tue, 26 Nov 2019 08:43:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 meta-python/recipes-devtools/python/python-yarl.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-yarl.inc b/meta-python/recipes-devtools/python/python-yarl.inc
index 49b5a607b557..ea555418a2e7 100644
--- a/meta-python/recipes-devtools/python/python-yarl.inc
+++ b/meta-python/recipes-devtools/python/python-yarl.inc
@@ -8,3 +8,7 @@ SRC_URI[sha256sum] = "024ecdc12bc02b321bc66b41327f930d1c2c543fa9a561b39861da9388
 
 PYPI_PACKAGE = "yarl"
 inherit pypi
+RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-multidict \
+    ${PYTHON_PN}-idna \
+"
-- 
2.24.0


