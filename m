Received: from 68.mail-out.ovh.net ([91.121.185.69])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1Oy3Lb-0000hg-7M
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 15:57:48 +0200
Received: (qmail 22557 invoked by uid 503); 21 Sep 2010 14:10:45 -0000
Received: from 30.mail-out.ovh.net (213.186.62.213)
	by 68.mail-out.ovh.net with SMTP; 21 Sep 2010 14:10:45 -0000
Received: (qmail 29160 invoked by uid 503); 21 Sep 2010 13:40:11 -0000
Received: from b9.ovh.net (HELO mail431.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 21 Sep 2010 13:40:11 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 21 Sep 2010 15:57:22 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 21 Sep 2010 15:57:20 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Sep 2010 15:56:42 +0200
Message-Id: <1285077403-21171-6-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1285077403-21171-5-git-send-email-eric@eukrea.com>
References: <1285077403-21171-1-git-send-email-eric@eukrea.com>
	<1285077403-21171-2-git-send-email-eric@eukrea.com>
	<1285077403-21171-3-git-send-email-eric@eukrea.com>
	<1285077403-21171-4-git-send-email-eric@eukrea.com>
	<1285077403-21171-5-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 13384698094156295502
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
Subject: [PATCH 6/7] meta-toolchain: add LD_LIBRARY_PATH to environment-setup
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
X-List-Received-Date: Tue, 21 Sep 2010 13:58:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/meta/meta-toolchain.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/meta/meta-toolchain.bb b/recipes/meta/meta-toolchain.bb
index 82918ad..aaf1818 100644
--- a/recipes/meta/meta-toolchain.bb
+++ b/recipes/meta/meta-toolchain.bb
@@ -157,6 +157,7 @@ do_populate_sdk() {
 	echo 'export CONFIG_SITE=$SDK_PATH/site-config' >> $script
 	echo 'alias opkg="LD_LIBRARY_PATH=$SDK_PATH/lib $SDK_PATH/bin/opkg-cl -f $SDK_PATH/${sysconfdir}/opkg-sdk.conf -o $SDK_PATH"' >> $script
 	echo 'alias opkg-target="LD_LIBRARY_PATH=$SDK_PATH/lib $SDK_PATH/bin/opkg-cl -f $SDK_PATH/$TARGET_SYS${sysconfdir}/opkg.conf -o $SDK_PATH/$TARGET_SYS"' >> $script
+	echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$SDK_PATH/lib' >> $script
 
 	# Add version information
 	versionfile=${SDK_OUTPUT}/${SDKPATH}/version
-- 
1.6.3.3



