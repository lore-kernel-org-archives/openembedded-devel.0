Received: from smtp3.epfl.ch ([128.178.224.226])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <valentin.longchamp@epfl.ch>) id 1NrDnE-0004ON-Ld
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 18:09:33 +0100
Received: (qmail 4724 invoked by uid 107); 15 Mar 2010 17:06:26 -0000
X-Virus-Scanned: ClamAV
Received: from lsro1pc40.epfl.ch (128.178.145.86) (authenticated)
	by smtp3.epfl.ch (AngelmatoPhylax SMTP proxy);
	Mon, 15 Mar 2010 18:06:26 +0100
From: Valentin Longchamp <valentin.longchamp@epfl.ch>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Mar 2010 18:04:04 +0100
Message-Id: <1268672644-29043-1-git-send-email-valentin.longchamp@epfl.ch>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <hndr0p$old$1@dough.gmane.org>
References: <hndr0p$old$1@dough.gmane.org>
X-SA-Exim-Connect-IP: 128.178.224.226
X-SA-Exim-Mail-From: valentin.longchamp@epfl.ch
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Valentin Longchamp <valentin.longchamp@epfl.ch>
Subject: [PATCH] Do not generate NEON code for qt-4.6.2 embedded on armv6
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
X-List-Received-Date: Mon, 15 Mar 2010 17:09:33 -0000

http://bugreports.qt.nokia.com/browse/QTBUG-8749
Neon code is generated for armv6 processor, where it should be armv7 only.
This results in illegal instructions with some of the qt4 libraries.

The current solution is not optimal, I just needed a quick fix for my arch
and I don't have the needed knowledge in OE to fix it cleanly, but I wanted
to point this issue out. But at least other arch (armv5 and armv4) should have
the same problem and receive the same fix.
---
 recipes/qt4/qt4-embedded_4.6.2.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/qt4/qt4-embedded_4.6.2.bb b/recipes/qt4/qt4-embedded_4.6.2.bb
index 94ecd01..8583752 100644
--- a/recipes/qt4/qt4-embedded_4.6.2.bb
+++ b/recipes/qt4/qt4-embedded_4.6.2.bb
@@ -1,6 +1,8 @@
 require qt4-embedded.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
+
+QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
 
 require qt-${PV}.inc
 
-- 
1.6.3.3



