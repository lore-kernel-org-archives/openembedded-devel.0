Received: from 75-148-42-21-colorado.hfc.comcastbusiness.net ([75.148.42.21]
	helo=judge.camp.se-eng.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raymondd@beast.se-eng.com>) id 1QloAV-0005nL-O2
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jul 2011 22:23:55 +0200
Received: from localhost (localhost [127.0.0.1])
	by judge.camp.se-eng.com (Postfix) with ESMTP id 5AE3D20C9F4C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2011 14:19:41 -0600 (MDT)
X-Virus-Scanned: amavisd-new at camp.se-eng.com
Received: from judge.camp.se-eng.com ([127.0.0.1])
	by localhost (judge.camp.se-eng.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id WSPQnD12Fksm; Tue, 26 Jul 2011 14:19:41 -0600 (MDT)
Received: from beast (beast.camp.se-eng.com [172.20.202.150])
	by judge.camp.se-eng.com (Postfix) with ESMTP id 0D21820C90B2;
	Tue, 26 Jul 2011 14:19:41 -0600 (MDT)
Received: by beast (Postfix, from userid 1000)
	id C08453136E; Tue, 26 Jul 2011 14:20:14 -0600 (MDT)
From: Raymond Danks <ray.danks@se-eng.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Jul 2011 14:20:13 -0600
Message-Id: <1311711613-11249-1-git-send-email-ray.danks@se-eng.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1311017115-28352-2-git-send-email-ray.danks@se-eng.com>
References: <1311017115-28352-2-git-send-email-ray.danks@se-eng.com>
Subject: [PATCH 2/3 v2] rt-tests: Upgrade to latest version 0.73
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
X-List-Received-Date: Tue, 26 Jul 2011 20:23:56 -0000


Signed-off-by: Raymond Danks <ray.danks@se-eng.com>
---
v2:
 * Start with PR=0
 * Remove old version 0.28.

 .../{rt-tests_0.28.bb => rt-tests_0.73.bb}         |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)
 rename recipes/rt-tests/{rt-tests_0.28.bb => rt-tests_0.73.bb} (74%)

diff --git a/recipes/rt-tests/rt-tests_0.28.bb b/recipes/rt-tests/rt-tests_0.73.bb
similarity index 74%
rename from recipes/rt-tests/rt-tests_0.28.bb
rename to recipes/rt-tests/rt-tests_0.73.bb
index af3bb30..26ea2cf 100644
--- a/recipes/rt-tests/rt-tests_0.28.bb
+++ b/recipes/rt-tests/rt-tests_0.73.bb
@@ -1,12 +1,13 @@
 DESCRIPTION = "Real-time tests, such as cyclictest, for real-time linux PREEMPT RT kernels"
 HOMEPAGE = "http://rt.wiki.kernel.org/index.php/Cyclictest"
 LICENSE = "GPL"
-PR = "r1"
+PR = "r0"
 
 SRC_URI = "http://www.kernel.org/pub/linux/kernel/people/tglx/rt-tests/rt-tests-${PV}.tar.bz2"
 
 S = "${WORKDIR}/rt-tests"
 
+CFLAGS += "-D_GNU_SOURCE -Wall -Wno-nonnull -Isrc/include"
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 # Limit to cyclictest only for non-real-time kernels.
@@ -21,5 +22,6 @@ do_install() {
   done
 }
 
-SRC_URI[md5sum] = "761c3e9fab16290c10ab9421182d16e7"
-SRC_URI[sha256sum] = "48e5a43c03f42524dd91873d649a0b8a287debd727da993ab256dc4e839b0cee"
+SRC_URI[md5sum] = "98da46135f0a91c96cb7e5b27c7e3bb6"
+SRC_URI[sha256sum] = "f8d396ecd6aa5526c49919acbac0ea4936f27f2410ca806570d8c92c1067c29d"
+
-- 
1.7.0.4



