Received: from 68.mail-out.ovh.net ([91.121.185.69])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OsjZz-0006iv-En
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 23:50:34 +0200
Received: (qmail 2030 invoked by uid 503); 6 Sep 2010 21:54:02 -0000
Received: from 30.mail-out.ovh.net (213.186.62.213)
	by 68.mail-out.ovh.net with SMTP; 6 Sep 2010 21:54:02 -0000
Received: (qmail 29215 invoked by uid 503); 6 Sep 2010 21:27:16 -0000
Received: from b9.ovh.net (HELO mail431.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 6 Sep 2010 21:27:15 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 6 Sep 2010 23:43:00 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 6 Sep 2010 23:42:58 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Sep 2010 23:41:50 +0200
Message-Id: <1283809310-29893-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1283809310-29893-1-git-send-email-eric@eukrea.com>
References: <1283809310-29893-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 6945113576459840842
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
Subject: [PATCH 2/2] base.bbclass: depend on mercurial-native if SRC_URI contains hg://
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
X-List-Received-Date: Mon, 06 Sep 2010 21:50:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 classes/base.bbclass |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index 299e875..2e6fb84 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -367,6 +367,11 @@ python () {
         depends = depends + " git-native:do_populate_sysroot"
         bb.data.setVarFlag('do_fetch', 'depends', depends, d)
 
+    if "hg://" in srcuri:
+        depends = bb.data.getVarFlag('do_fetch', 'depends', d) or ""
+        depends = depends + " mercurial-native:do_populate_sysroot"
+        bb.data.setVarFlag('do_fetch', 'depends', depends, d)
+
     # unzip-native should already be staged before unpacking ZIP recipes
     need_unzip = bb.data.getVar('NEED_UNZIP_FOR_UNPACK', d, 1)
     src_uri = bb.data.getVar('SRC_URI', d, 1)
-- 
1.6.3.3



