Received: from 30.mail-out.ovh.net ([213.186.62.213])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PDwUI-0000Oz-U7
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 10:52:08 +0100
Received: (qmail 24332 invoked by uid 503); 4 Nov 2010 09:29:46 -0000
Received: from b9.ovh.net (HELO mail632.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 4 Nov 2010 09:29:46 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 4 Nov 2010 11:51:16 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 4 Nov 2010 11:51:14 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Nov 2010 10:52:22 +0100
Message-Id: <1288864342-20973-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
MIME-Version: 1.0
X-Ovh-Tracer-Id: 9372553776622382409
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 213.186.62.213
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [PATCH/RFC] qt4-embedded: tune QT_ARCH for armv6
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
X-List-Received-Date: Thu, 04 Nov 2010 09:52:08 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

this is a RFC, I think it can also be used on qt 4.6.x and on armv7.
Setting QT_ARCH to armv6 enable some asm optimized functions in QT.

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/qt4/qt4-embedded_4.7.0.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/qt4/qt4-embedded_4.7.0.bb b/recipes/qt4/qt4-embedded_4.7.0.bb
index 7e3d4b8..fbfaf85 100644
--- a/recipes/qt4/qt4-embedded_4.7.0.bb
+++ b/recipes/qt4/qt4-embedded_4.7.0.bb
@@ -2,9 +2,10 @@ DEFAULT_PREFERENCE = "-1"
 
 require qt4-embedded.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
+QT_ARCH_armv6 = "armv6"
 
 require qt-${PV}.inc
 
-- 
1.6.3.3



