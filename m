Received: from 20.mo1.mail-out.ovh.net ([188.165.45.168]
	helo=mo1.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul@paulbarker.me.uk>) id 1USmLU-0006Yo-NR
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Apr 2013 12:45:43 +0200
Received: from mail99.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo1.mail-out.ovh.net (Postfix) with SMTP id 1384DFFA16F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Apr 2013 11:12:15 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 18 Apr 2013 11:12:13 +0200
Received: from 94-192-12-83.zone6.bethere.co.uk (HELO
	b5-server.betafive.co.uk) (paul@betafive.co.uk@94.192.12.83)
	by ns0.ovh.net with SMTP; 18 Apr 2013 11:12:12 +0200
Received: from b5-vm-mint0.betafive.co.uk (unknown [192.168.0.235])
	by b5-server.betafive.co.uk (Postfix) with ESMTP id EE6001601A0;
	Thu, 18 Apr 2013 10:11:07 +0100 (BST)
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
X-Ovh-Mailout: 178.32.228.1 (mo1.mail-out.ovh.net)
Date: Thu, 18 Apr 2013 10:11:10 +0100
Message-Id: <1366276270-4422-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.7.10.4
X-Ovh-Tracer-Id: 13325025398276327753
X-Ovh-Remote: 94.192.12.83 (94-192-12-83.zone6.bethere.co.uk)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: 0
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeifedrvdehucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecu
X-Spam-Check: DONE|U 0.500464/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeifedrvdehucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecu
Subject: [meta-oe][PATCH] live555: change MIRROR for older versions
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
X-List-Received-Date: Thu, 18 Apr 2013 10:45:48 -0000

http://download.videolan.org/pub/videolan/testing/contrib/live555/ has dropped
everything before live.2011.12.23.tar.gz, change to using
http://ftp.freebsd.org/pub/FreeBSD/ports/distfiles/ as it still has
live.2011.03.14.tar.gz.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta-oe/recipes-multimedia/live555/live555.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/live555/live555.inc b/meta-oe/recipes-multimedia/live555/live555.inc
index 966224d..a36177d 100644
--- a/meta-oe/recipes-multimedia/live555/live555.inc
+++ b/meta-oe/recipes-multimedia/live555/live555.inc
@@ -13,7 +13,7 @@ URLV = "${@d.getVar('PV',1)[0:4]}.${@d.getVar('PV',1)[4:6]}.${@d.getVar('PV',1)[
 SRC_URI = "http://www.live555.com/liveMedia/public/live.${URLV}.tar.gz \
            file://config.linux-cross"
 # only latest live version stays on http://www.live555.com/liveMedia/public/, add mirror for older
-MIRRORS += "http://www.live555.com/liveMedia/public/ http://download.videolan.org/pub/videolan/testing/contrib/live555/ \n"
+MIRRORS += "http://www.live555.com/liveMedia/public/ http://ftp.freebsd.org/pub/FreeBSD/ports/distfiles/ \n"
 
 S = "${WORKDIR}/live"
 TARGET_CC_ARCH += "${LDFLAGS}"
-- 
1.7.10.4



