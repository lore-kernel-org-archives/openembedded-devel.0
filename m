Received: from 68.mail-out.ovh.net ([91.121.185.69])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1Oy3LW-0000Xw-Lg
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 15:58:18 +0200
Received: (qmail 22456 invoked by uid 503); 21 Sep 2010 14:10:43 -0000
Received: from 30.mail-out.ovh.net (213.186.62.213)
	by 68.mail-out.ovh.net with SMTP; 21 Sep 2010 14:10:43 -0000
Received: (qmail 29064 invoked by uid 503); 21 Sep 2010 13:40:09 -0000
Received: from b9.ovh.net (HELO mail431.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 21 Sep 2010 13:40:09 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 21 Sep 2010 15:57:20 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 21 Sep 2010 15:57:19 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Sep 2010 15:56:38 +0200
Message-Id: <1285077403-21171-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1285077403-21171-1-git-send-email-eric@eukrea.com>
References: <1285077403-21171-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 13384416619179584842
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.69
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/7] gmp: add sdk build
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
X-List-Received-Date: Tue, 21 Sep 2010 13:58:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/gmp/gmp.inc      |    1 +
 recipes/gmp/gmp_5.0.1.bb |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/gmp/gmp.inc b/recipes/gmp/gmp.inc
index 55209f3..2ce4438 100644
--- a/recipes/gmp/gmp.inc
+++ b/recipes/gmp/gmp.inc
@@ -13,3 +13,4 @@ ARM_INSTRUCTION_SET = "arm"
 
 acpaths = ""
 
+TARGET_SYS_virtclass-sdk = "${HOST_SYS}"
\ No newline at end of file
diff --git a/recipes/gmp/gmp_5.0.1.bb b/recipes/gmp/gmp_5.0.1.bb
index 0b117b1..e85a72f 100644
--- a/recipes/gmp/gmp_5.0.1.bb
+++ b/recipes/gmp/gmp_5.0.1.bb
@@ -5,4 +5,4 @@ SRC_URI[gmp.sha256sum] = "a2a610f01fd3298dc08c87bf30498c2402590e1bcb227fc40b15ee
 require gmp.inc
 LICENSE = "GPLv3 LGPLv3"
 NATIVE_INSTALL_WORKS = "1"
-BBCLASSEXTEND = "native nativesdk"
+BBCLASSEXTEND = "native nativesdk sdk"
-- 
1.6.3.3



