Received: from 68.mail-out.ovh.net ([91.121.185.69])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OxpJu-0004QI-6P
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 00:58:46 +0200
Received: (qmail 30235 invoked by uid 503); 20 Sep 2010 23:11:59 -0000
Received: from 30.mail-out.ovh.net (213.186.62.213)
	by 68.mail-out.ovh.net with SMTP; 20 Sep 2010 23:11:59 -0000
Received: (qmail 16600 invoked by uid 503); 20 Sep 2010 22:41:35 -0000
Received: from b9.ovh.net (HELO mail431.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 20 Sep 2010 22:41:35 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 21 Sep 2010 00:58:42 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 21 Sep 2010 00:58:41 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Sep 2010 00:58:08 +0200
Message-Id: <1285023488-32159-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
MIME-Version: 1.0
X-Ovh-Tracer-Id: 16654592898463870281
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
Subject: [PATCH] utils.bbclass: fix is_machine_specific
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
X-List-Received-Date: Mon, 20 Sep 2010 22:58:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

* base.bbclass can set a package's PACKAGE_ARCH to MACHINE_ARCH if
it finds file:// in the SRC_URI and the corresponding file is machine
specific (recipes/foo/foo-1.0/<some machine>/)
* but is_machine_specific actually fails to detect these files as
urldata.path is used instead of urldata.localpath thus preventing the
comparison of the file's path with machinepaths
* tested with bitbake HEAD & 1.8.18, with OE's tree alone and OE's tree
plus an overlay.

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 classes/utils.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/utils.bbclass b/classes/utils.bbclass
index 0a7a045..1c636be 100644
--- a/classes/utils.bbclass
+++ b/classes/utils.bbclass
@@ -54,7 +54,7 @@ def is_machine_specific(d):
     urldatadict = bb.fetch.init(d.getVar("SRC_URI", True).split(), d, True)
     for urldata in (urldata for urldata in urldatadict.itervalues()
                     if urldata.type == "file"):
-        if any(urldata.path.startswith(mp + "/") for mp in machinepaths):
+        if any(urldata.localpath.startswith(mp + "/") for mp in machinepaths):
             return True
 
 def subprocess_setup():
-- 
1.6.3.3



