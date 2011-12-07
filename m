Received: from smtprelay-b21.telenor.se ([195.54.99.212])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf@emagii.com>) id 1RYIk0-0004uq-Rj
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Dec 2011 15:45:00 +0100
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-b21.telenor.se (Postfix) with ESMTP id 91B72EB76C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Dec 2011 15:19:26 +0100 (CET)
X-SENDER-IP: [83.227.56.19]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AgpMAAR1305T4zgTPGdsb2JhbABDp1iCehkBAQEBNzKBcgFRAQojMB9LCi2ICQapAwGNHogcgxgElGuSJA
X-IronPort-AV: E=Sophos;i="4.71,313,1320620400"; d="scan'208";a="230259232"
Received: from c-1338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	hexagon.atmel.com) ([83.227.56.19])
	by ipb1.telenor.se with ESMTP; 07 Dec 2011 15:19:26 +0100
From: ulf@emagii.com
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Dec 2011 15:19:14 +0100
Message-Id: <1323267554-2806-1-git-send-email-ulf@emagii.com>
X-Mailer: git-send-email 1.7.4.1
Cc: Ulf Samuelsson <ulf@emagii.com>
Subject: [meta-oe] xf86-input-tslib: Use correct name for checksum calculation
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Dec 2011 14:45:00 -0000

From: Ulf Samuelsson <ulf@emagii.com>

Signed-off-by: Ulf Samuelsson <ulf@emagii.com>
---
 .../xorg-driver/xf86-input-tslib_0.0.6.bb          |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb
index de0eb6f..768453a 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb
@@ -17,12 +17,14 @@ SRC_URI = "http://www.pengutronix.de/software/xf86-input-tslib/download/xf86-inp
            file://99-xf86-input-tslib.rules \
            file://xf86-input-tslib-port-ABI-12-r48.patch \
 "
-SRC_URI[md5sum] = "b7a4d2f11637ee3fcf432e044b1d017f"
-SRC_URI[sha256sum] = "5f46fdef095a6e44a69e0f0b57c7d665224b26d990d006611236d8332e85b105"
+
+SRC_URI[archive.md5sum] = "b7a4d2f11637ee3fcf432e044b1d017f"
+SRC_URI[archive.sha256sum] = "5f46fdef095a6e44a69e0f0b57c7d665224b26d990d006611236d8332e85b105"
 
 do_configure_prepend() {
         rm -rf ${S}/m4/ || true
 }
+
 do_install_append() {
         install -d ${D}/${datadir}/hal/fdi/policy/20thirdparty
         install -m 0644 ${WORKDIR}/10-x11-input-tslib.fdi ${D}/${datadir}/hal/fdi/policy/20thirdparty
-- 
1.7.4.1



