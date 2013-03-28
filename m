Received: from 10.mo1.mail-out.ovh.net ([178.32.96.102]
	helo=mo1.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul@paulbarker.me.uk>) id 1ULBMu-0001hx-G1
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Mar 2013 12:51:46 +0100
Received: from mail630.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo1.mail-out.ovh.net (Postfix) with SMTP id C7520FF95B8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Mar 2013 12:33:43 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 28 Mar 2013 13:16:17 +0200
Received: from 94-192-12-83.zone6.bethere.co.uk (HELO
	b5-server.betafive.co.uk) (mail@betafive.co.uk@94.192.12.83)
	by ns0.ovh.net with SMTP; 28 Mar 2013 13:16:15 +0200
Received: from b5-vm-mint0.betafive.co.uk (unknown [192.168.0.229])
	by b5-server.betafive.co.uk (Postfix) with ESMTP id BEB1816080D;
	Thu, 28 Mar 2013 11:16:07 +0000 (GMT)
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
X-Ovh-Mailout: 178.32.228.1 (mo1.mail-out.ovh.net)
Date: Thu, 28 Mar 2013 11:16:10 +0000
Message-Id: <1364469370-12082-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.7.10.4
X-Ovh-Tracer-Id: 2773935896268802377
X-Ovh-Remote: 94.192.12.83 (94-192-12-83.zone6.bethere.co.uk)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: 0
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeiuddrjeeiucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecu
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeiuddrjeeiucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecu
Subject: [meta-oe][TEMP PATCH] gd: Temporary patch while libgd.org is down, do not commit to main repository!
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
X-List-Received-Date: Thu, 28 Mar 2013 11:51:49 -0000

This is just a temporary patch to change the SRC_URI for gd as the upstream
source libgd.org has been down for a week or so now. The MD5 and SHA256 sums
match so this should be the exact same archive. It is not intended to go in the
main repository but may be useful to some of you until libgd.org is back up.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb b/meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb
index 9615371..9d21c05 100644
--- a/meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb
+++ b/meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "gd is a library used to create PNG, JPEG, or WBMP images."
 DEPENDS = "freetype libpng jpeg zlib"
 PR = "r5"
 
-SRC_URI = "http://www.libgd.org/releases/gd-2.0.36RC1.tar.gz"
+SRC_URI = "http://fossies.org/unix/www/gd-2.0.36RC1.tar.gz"
 SRC_URI[md5sum] = "39ac48e6d5e0012a3bd2248a0102f209"
 SRC_URI[sha256sum] = "dd7c1795271221b9237769b96b8cec7fbdc5db7b8954d864ead51fc1296a6ac8"
 
-- 
1.7.10.4



