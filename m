Received: from static-92-33-14-100.sme.bredbandsbolaget.se ([92.33.14.100]
	helo=mailhost.lundinova.se) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <johan.hovold@lundinova.se>) id 1NKtOb-00068G-VA
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Dec 2009 13:54:29 +0100
Received: from pi (unknown [10.240.22.2])
	by mailhost.lundinova.se (Postfix) with ESMTP id 4E4C6B94006;
	Wed, 16 Dec 2009 13:27:54 +0100 (CET)
Received: from johan by pi with local (Exim 4.69) (envelope-from <johan@pi>)
	id 1NKsyw-00064S-0q; Wed, 16 Dec 2009 13:27:54 +0100
From: Johan Hovold <johan.hovold@lundinova.se>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Dec 2009 13:27:54 +0100
Message-Id: <1260966474-23290-1-git-send-email-johan.hovold@lundinova.se>
X-Mailer: git-send-email 1.6.5.6
Sender: <johan.hovold@lundinova.se>
X-SA-Exim-Connect-IP: 92.33.14.100
X-SA-Exim-Mail-From: johan.hovold@lundinova.se
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] openvpn: remove dependency on kernel module
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
X-List-Received-Date: Wed, 16 Dec 2009 12:54:29 -0000

Fix image creation when tun module is compiled into kernel by using
RRECOMMENDS instead of RDEPENDS for kernel-module-tun.

Signed-off-by: Johan Hovold <johan.hovold@lundinova.se>
---
 recipes/openvpn/openvpn.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/openvpn/openvpn.inc b/recipes/openvpn/openvpn.inc
index 70cdf4c..0bccbc5 100644
--- a/recipes/openvpn/openvpn.inc
+++ b/recipes/openvpn/openvpn.inc
@@ -4,7 +4,7 @@ SECTION = "console/network"
 LICENSE = "GPLv2"
 PRIORITY = "optional"
 DEPENDS = "lzo openssl"
-RDEPENDS = "kernel-module-tun"
+RRECOMMENDS = "kernel-module-tun"
 
 SRC_URI = "http://openvpn.net/release/openvpn-${PV}.tar.gz \
 	file://openvpn"
-- 
1.6.5.6



