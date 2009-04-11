Received: from [80.81.242.146] (helo=amethyst.openembedded.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@amethyst.openembedded.net>) id 1LsdxX-0002YZ-9d
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Apr 2009 16:13:30 +0200
Received: by amethyst.openembedded.net (Postfix, from userid 1002)
	id 53919E80C0; Sat, 11 Apr 2009 16:13:13 +0200 (CEST)
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Apr 2009 16:13:13 +0200
Message-Id: <1239459193-21963-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.5.6.5
X-SA-Exim-Connect-IP: 80.81.242.146
X-SA-Exim-Mail-From: koen@amethyst.openembedded.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][PATCH] midori: use LDFLAGS (fixes QA error)
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
X-List-Received-Date: Sat, 11 Apr 2009 14:13:30 -0000

From: Koen Kooi <koen@openembedded.org>


Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/gtk-webcore/midori.inc      |    1 +
 recipes/gtk-webcore/midori_0.1.5.bb |    2 ++
 2 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/recipes/gtk-webcore/midori.inc b/recipes/gtk-webcore/midori.inc
index a241157..a7ed936 100644
--- a/recipes/gtk-webcore/midori.inc
+++ b/recipes/gtk-webcore/midori.inc
@@ -9,3 +9,4 @@ SRC_URI = "http://software.twotoasts.de/media/midori/midori-${PV}.tar.gz"
 
 EXTRA_OECONF = "  --disable-hildon "
 
+TARGET_CC_ARCH += "${LDFLAGS}"
diff --git a/recipes/gtk-webcore/midori_0.1.5.bb b/recipes/gtk-webcore/midori_0.1.5.bb
index c1d1f66..61ecb08 100644
--- a/recipes/gtk-webcore/midori_0.1.5.bb
+++ b/recipes/gtk-webcore/midori_0.1.5.bb
@@ -1,5 +1,7 @@
 require midori.inc
 
+PR = "r1"
+
 DEPENDS += "python-native python-docutils-native"
 
 SRC_URI = "http://goodies.xfce.org/releases/midori/midori-${PV}.tar.bz2 \
-- 
1.5.6.5



