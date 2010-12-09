Received: from 29.mail-out.ovh.net ([87.98.216.213])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PQj7I-0004pF-IO
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Dec 2010 17:13:13 +0100
Received: (qmail 25486 invoked by uid 503); 9 Dec 2010 16:26:50 -0000
Received: from b6.ovh.net (HELO mail645.ha.ovh.net) (213.186.33.56)
	by 29.mail-out.ovh.net with SMTP; 9 Dec 2010 16:26:50 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 9 Dec 2010 18:15:47 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 9 Dec 2010 18:15:45 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Dec 2010 17:11:00 +0100
Message-Id: <1291911060-8451-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
MIME-Version: 1.0
X-Ovh-Tracer-Id: 49821071880924489
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 87.98.216.213
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] meta-toolchain: fix directories rights
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
X-List-Received-Date: Thu, 09 Dec 2010 16:13:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Actual sdk change rights of /usr and /usr/local to 775 when
untaring the archives with sudo ... giving group write access
to these directories.
This patch fix the rights before creating the archive.

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/meta/meta-toolchain.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes/meta/meta-toolchain.bb b/recipes/meta/meta-toolchain.bb
index 82918ad..e949432 100644
--- a/recipes/meta/meta-toolchain.bb
+++ b/recipes/meta/meta-toolchain.bb
@@ -171,8 +171,10 @@ do_populate_sdk() {
 	# Package it up
 	mkdir -p ${SDK_DEPLOY}
 	cd ${SDK_OUTPUT}
+	chmod -R go-w ${SDK_OUTPUT}
 	fakeroot tar cfj ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.bz2 .
 	cd ${SDK_OUTPUT2}
+	chmod -R go-w ${SDK_OUTPUT2}
 	fakeroot tar cfj ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}-extras.tar.bz2 .
 }
 
-- 
1.6.3.3



