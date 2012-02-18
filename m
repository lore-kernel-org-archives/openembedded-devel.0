Received: from familie-heinold.de ([85.214.48.103]
	helo=mail.familie-heinold.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1Ryrq3-0006GM-An
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Feb 2012 22:29:03 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id C0CD822325AF;
	Sat, 18 Feb 2012 22:20:49 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id C00B822325AA;
	Sat, 18 Feb 2012 22:20:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
Received: from rhein.familie-heinold.de (g229046026.adsl.alicedsl.de
	[92.229.46.26]) by mail.familie-heinold.de (Postfix) with ESMTPA;
	Sat, 18 Feb 2012 22:20:46 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 9FD0E3C4BC; Sat, 18 Feb 2012 22:20:44 +0100 (CET)
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Feb 2012 22:20:13 +0100
Message-Id: <1329600022-8027-4-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.9
In-Reply-To: <1329600022-8027-1-git-send-email-heinold@inf.fu-berlin.de>
References: <1329600022-8027-1-git-send-email-heinold@inf.fu-berlin.de>
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [PATCH 03/12][oe-classic] cacao-native: update hg version
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
X-List-Received-Date: Sat, 18 Feb 2012 21:29:03 -0000

* fixes segfaults and remove shutdownguard-patch, which is applied upstream
* remove the pre-generated libtool files

Signed-off-by: Henning Heinold <heinold@inf.fu-berlin.de>
---
 recipes/cacao/cacao-native.inc   |   13 +++++++++++++
 recipes/cacao/cacao-native_hg.bb |    8 +++-----
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/recipes/cacao/cacao-native.inc b/recipes/cacao/cacao-native.inc
index fc86e68..8501634 100644
--- a/recipes/cacao/cacao-native.inc
+++ b/recipes/cacao/cacao-native.inc
@@ -34,3 +34,16 @@ export JAVAC="${STAGING_BINDIR_NATIVE}/ecj-initial"
 
 # force usage of fastjar
 export JAR="fastjar"
+
+do_configure_prepend () {
+        # Remove old libtool macros.
+        MACROS="libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.m4"
+        for i in ${MACROS}; do
+               rm -f src/mm/boehm-gc/m4/$i
+               rm -f m4/$i
+        done
+	rm  ltmain.sh
+	rm  libtool
+	rm  src/mm/boehm-gc/ltmain.sh
+	rm  src/mm/boehm-gc/libtool
+}
diff --git a/recipes/cacao/cacao-native_hg.bb b/recipes/cacao/cacao-native_hg.bb
index 020dee3..9413633 100644
--- a/recipes/cacao/cacao-native_hg.bb
+++ b/recipes/cacao/cacao-native_hg.bb
@@ -1,11 +1,9 @@
 require cacao-native.inc
 
 PV = "1.1.0+hgr${SRCPV}"
-PR = "r5"
+PR = "r6"
 
-SRCREV = "c7bf150bfa46"
-SRC_URI = "hg://mips.complang.tuwien.ac.at/hg/;module=cacao;rev=${SRCREV} \
-           file://cacao-shutdownguard.patch \
-          "
+SRCREV = "cff92704c4e0"
+SRC_URI = "hg://mips.complang.tuwien.ac.at/hg/;module=cacao;rev=${SRCREV}" 
 
 S = "${WORKDIR}/cacao"
-- 
1.7.9


