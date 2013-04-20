Received: from 13.mo1.mail-out.ovh.net ([178.33.253.128]
	helo=mo1.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul@paulbarker.me.uk>) id 1UTaNz-0003rV-Ko
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Apr 2013 18:11:36 +0200
Received: from mail99.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo1.mail-out.ovh.net (Postfix) with SMTP id 4E80CFF8D84
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Apr 2013 15:24:32 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 20 Apr 2013 15:24:32 +0200
Received: from 94-192-12-83.zone6.bethere.co.uk (HELO
	b5-server.betafive.co.uk) (paul@betafive.co.uk@94.192.12.83)
	by ns0.ovh.net with SMTP; 20 Apr 2013 15:24:31 +0200
Received: from b5-vm-mint0.betafive.co.uk (unknown [192.168.0.235])
	by b5-server.betafive.co.uk (Postfix) with ESMTP id C111816009F;
	Sat, 20 Apr 2013 14:23:20 +0100 (BST)
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
X-Ovh-Mailout: 178.32.228.1 (mo1.mail-out.ovh.net)
Date: Sat, 20 Apr 2013 14:23:32 +0100
Message-Id: <1366464212-59718-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.7.10.4
X-Ovh-Tracer-Id: 10884918824765131081
X-Ovh-Remote: 94.192.12.83 (94-192-12-83.zone6.bethere.co.uk)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: 0
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeifedrfedvucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecu
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeifedrfedvucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecu
Subject: [meta-oe][PATCH] ttf-arphic-uming: remove whitespace from license
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
X-List-Received-Date: Sat, 20 Apr 2013 16:11:41 -0000

The whitespace in LICENSE causes bitbake to parse this as three separate
licenses: 'Arphic', 'Public' and 'License'. These spaces are replaced with
dashes to prevent confusion.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
index 8aeee0c..44550f7 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Unicode Mingti (printed) TrueType Font"
 HOMEPAGE = "http://www.freedesktop.org/wiki/Software/CJKUnifonts"
-LICENSE = "Arphic Public License"
+LICENSE = "Arphic-Public-License"
 LIC_FILES_CHKSUM = "file://README;md5=62be011094b7865ddc4d1a648444d31a"
 SRC_DISTRIBUTE_LICENSES += "${PN}"
 RPROVIDES_${PN} = "virtual-chinese-font"
-- 
1.7.10.4



