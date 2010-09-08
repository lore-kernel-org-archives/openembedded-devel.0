Received: from 68.mail-out.ovh.net ([91.121.185.69])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OtLFX-0003F6-7f
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 16:03:50 +0200
Received: (qmail 20556 invoked by uid 503); 8 Sep 2010 14:14:21 -0000
Received: from 30.mail-out.ovh.net (213.186.62.213)
	by 68.mail-out.ovh.net with SMTP; 8 Sep 2010 14:14:21 -0000
Received: (qmail 6342 invoked by uid 503); 8 Sep 2010 13:47:09 -0000
Received: from b9.ovh.net (HELO mail431.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 8 Sep 2010 13:47:09 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 8 Sep 2010 16:03:02 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 8 Sep 2010 16:03:01 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Sep 2010 16:01:42 +0200
Message-Id: <1283954503-25418-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1283954503-25418-1-git-send-email-eric@eukrea.com>
References: <1283954503-25418-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 10922636472649297226
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
Subject: [PATCH 2/3] rlpr: add version 2.06
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
X-List-Received-Date: Wed, 08 Sep 2010 14:03:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/rlpr/rlpr_2.06.bb |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 recipes/rlpr/rlpr_2.06.bb

diff --git a/recipes/rlpr/rlpr_2.06.bb b/recipes/rlpr/rlpr_2.06.bb
new file mode 100644
index 0000000..64220ce
--- /dev/null
+++ b/recipes/rlpr/rlpr_2.06.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "rlpr makes it possible to print files on remote sites to your networked printers"
+HOMEPAGE = "http://freshmeat.net/projects/rlpr/"
+SECTION = "console/network"
+LICENSE = "GPL"
+PR = "r0"
+
+SRC_URI = "http://linuxfocus.org/~guido/rlpr-2.06.tar.gz"
+SRC_URI[md5sum] = "c3192d0e84ccae432e754640f6003478"
+SRC_URI[sha256sum] = "32ae5893f4b9250b7a02c98a41b5929cfdd5731b6efbd7edfc77c2c5314388f7"
+
+inherit autotools
+
+do_configure() {
+        oe_runconf
+}
+do_install() {
+        make install DESTDIR=${D}
+}
+
+TARGET_CC_ARCH += " ${LDFLAGS}"
-- 
1.6.3.3



