Received: from 68.mail-out.ovh.net ([91.121.185.69])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OyPDx-0000zp-A1
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Sep 2010 15:19:02 +0200
Received: (qmail 30319 invoked by uid 503); 22 Sep 2010 13:32:30 -0000
Received: from 30.mail-out.ovh.net (213.186.62.213)
	by 68.mail-out.ovh.net with SMTP; 22 Sep 2010 13:32:30 -0000
Received: (qmail 11725 invoked by uid 503); 22 Sep 2010 13:01:41 -0000
Received: from b9.ovh.net (HELO mail431.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 22 Sep 2010 13:01:41 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 22 Sep 2010 15:18:58 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 22 Sep 2010 15:18:57 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Sep 2010 15:18:16 +0200
Message-Id: <1285161497-13594-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
MIME-Version: 1.0
X-Ovh-Tracer-Id: 162411062342430025
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.69
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] classes/update-rc.d.bbclass: move update-rc after postinst
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
X-List-Received-Date: Wed, 22 Sep 2010 13:19:03 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

without this, launching a daemon can fail if postinst is supposed, for
example, to fix permissions of directories used by the daemon.

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 classes/update-rc.d.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/update-rc.d.bbclass b/classes/update-rc.d.bbclass
index 4594d0f..b0314ab 100644
--- a/classes/update-rc.d.bbclass
+++ b/classes/update-rc.d.bbclass
@@ -60,11 +60,11 @@ python populate_packages_prepend () {
 		bb.data.update_data(localdata)
 
 		postinst = '#!/bin/sh\n'
-		postinst += bb.data.getVar('updatercd_postinst', localdata, 1)
 		try:
 			postinst += bb.data.getVar('pkg_postinst', localdata, 1)
 		except:
 			pass
+		postinst += bb.data.getVar('updatercd_postinst', localdata, 1)
 		bb.data.setVar('pkg_postinst_%s' % pkg, postinst, d)
 		prerm = bb.data.getVar('pkg_prerm', localdata, 1)
 		if not prerm:
-- 
1.6.3.3



