Return-Path: <ulf@emagii.com>
Received: from smtprelay-b22.telenor.se (smtprelay-b22.telenor.se
	[195.54.99.213])
	by mail.openembedded.org (Postfix) with ESMTP id 3C0566D899
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2014 16:08:27 +0000 (UTC)
Received: from ipb2.telenor.se (ipb2.telenor.se [195.54.127.165])
	by smtprelay-b22.telenor.se (Postfix) with ESMTP id 16B2FEAED4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2014 17:08:26 +0100 (CET)
X-SENDER-IP: [83.227.57.102]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AkuSAKoC2FJT4zlmPGdsb2JhbABZgwoBATeDFYR5rCaHLYELFwMBAQEBODWCdwEKI09LCi2ICAGtAwGXUheOfx2EIgSYIZVFOw
X-IronPort-AV: E=Sophos;i="4.95,668,1384297200"; d="scan'208";a="781117644"
Received: from c-6639e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	Hydra.bredbandsbolaget.se) ([83.227.57.102])
	by ipb2.telenor.se with ESMTP; 16 Jan 2014 17:04:16 +0100
From: Ulf Samuelsson <ulf@emagii.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Jan 2014 17:04:04 +0100
Message-Id: <1389888244-1899-1-git-send-email-ulf@emagii.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Ulf Samuelsson <ulf@emagii.com>
Subject: [PATCH] python-nose: avoid duplicate install of setup.py*
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Jan 2014 16:08:27 -0000

Signed-off-by: Ulf Samuelsson <ulf@emagii.com>
---
 .../recipes-devtools/python/python-nose_1.2.1.bb   |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-devtools/python/python-nose_1.2.1.bb b/meta-oe/recipes-devtools/python/python-nose_1.2.1.bb
index 083d052..1cf3869 100644
--- a/meta-oe/recipes-devtools/python/python-nose_1.2.1.bb
+++ b/meta-oe/recipes-devtools/python/python-nose_1.2.1.bb
@@ -11,4 +11,8 @@ SRC_URI[sha256sum] = "2171e9202d118d302d5db1decb52dd862b79e2a626ca19653a6914574a
 
 S = "${WORKDIR}/nose-${PV}"
 
+do_install_append() {
+	rm -f ${D}${libdir}/python*/site-packages/site.py*
+}
+
 inherit distutils
-- 
1.7.9.5


