Received: from 68.mail-out.ovh.net ([91.121.185.69])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OtMRd-0002N1-6i
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 17:20:26 +0200
Received: (qmail 12620 invoked by uid 503); 8 Sep 2010 15:30:49 -0000
Received: from 30.mail-out.ovh.net (213.186.62.213)
	by 68.mail-out.ovh.net with SMTP; 8 Sep 2010 15:30:49 -0000
Received: (qmail 15606 invoked by uid 503); 8 Sep 2010 15:03:36 -0000
Received: from b9.ovh.net (HELO mail431.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 8 Sep 2010 15:03:36 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 8 Sep 2010 17:19:30 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 8 Sep 2010 17:19:30 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Sep 2010 17:18:12 +0200
Message-Id: <1283959092-6481-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1283959092-6481-1-git-send-email-eric@eukrea.com>
References: <AANLkTinfxZO07kTjsaFWWZfXzwAdPgKNZAaWEKV-ZTVg@mail.gmail.com>
	<1283959092-6481-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 12214325139591834954
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
Subject: [PATCH v2 2/2] rlpr: upgrade to version 2.06
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
X-List-Received-Date: Wed, 08 Sep 2010 15:20:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/rlpr/{rlpr_2.05.bb => rlpr_2.06.bb} |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)
 rename recipes/rlpr/{rlpr_2.05.bb => rlpr_2.06.bb} (60%)

diff --git a/recipes/rlpr/rlpr_2.05.bb b/recipes/rlpr/rlpr_2.06.bb
similarity index 60%
rename from recipes/rlpr/rlpr_2.05.bb
rename to recipes/rlpr/rlpr_2.06.bb
index 2751b9f..64220ce 100644
--- a/recipes/rlpr/rlpr_2.05.bb
+++ b/recipes/rlpr/rlpr_2.06.bb
@@ -2,11 +2,11 @@ DESCRIPTION = "rlpr makes it possible to print files on remote sites to your net
 HOMEPAGE = "http://freshmeat.net/projects/rlpr/"
 SECTION = "console/network"
 LICENSE = "GPL"
-PR = "r1"
+PR = "r0"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/r/rlpr/rlpr_2.05.orig.tar.gz"
-SRC_URI[md5sum] = "64ee8ccd94aabc90b9f40d0b2ad79e79"
-SRC_URI[sha256sum] = "6b1261c8a23a58c8e174d8ee1ad53c138ed0b9211f7ea3f3efe22d16af14ba9a"
+SRC_URI = "http://linuxfocus.org/~guido/rlpr-2.06.tar.gz"
+SRC_URI[md5sum] = "c3192d0e84ccae432e754640f6003478"
+SRC_URI[sha256sum] = "32ae5893f4b9250b7a02c98a41b5929cfdd5731b6efbd7edfc77c2c5314388f7"
 
 inherit autotools
 
-- 
1.6.3.3



