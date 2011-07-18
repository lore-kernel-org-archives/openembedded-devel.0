Received: from 75-148-42-21-colorado.hfc.comcastbusiness.net ([75.148.42.21]
	helo=judge.camp.se-eng.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raymondd@beast.se-eng.com>) id 1Qitda-00041r-Ql
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jul 2011 21:37:55 +0200
Received: from localhost (localhost [127.0.0.1])
	by judge.camp.se-eng.com (Postfix) with ESMTP id B586620C9F54
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2011 13:24:45 -0600 (MDT)
X-Virus-Scanned: amavisd-new at camp.se-eng.com
Received: from judge.camp.se-eng.com ([127.0.0.1])
	by localhost (judge.camp.se-eng.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id SIwYsH-cBA+i; Mon, 18 Jul 2011 13:24:45 -0600 (MDT)
Received: from beast (beast.camp.se-eng.com [172.20.202.150])
	by judge.camp.se-eng.com (Postfix) with ESMTP id 7822A20C9F4C;
	Mon, 18 Jul 2011 13:24:45 -0600 (MDT)
Received: by beast (Postfix, from userid 1000)
	id 9FD893136E; Mon, 18 Jul 2011 13:25:17 -0600 (MDT)
From: Raymond Danks <ray.danks@se-eng.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Jul 2011 13:25:14 -0600
Message-Id: <1311017115-28352-2-git-send-email-ray.danks@se-eng.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1311017115-28352-1-git-send-email-ray.danks@se-eng.com>
References: <1311017115-28352-1-git-send-email-ray.danks@se-eng.com>
Subject: [PATCH 2/3] rt-tests: Upgrade to latest version 0.73.
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
X-List-Received-Date: Mon, 18 Jul 2011 19:37:55 -0000


Signed-off-by: Raymond Danks <ray.danks@se-eng.com>
---
 recipes/rt-tests/rt-tests_0.73.bb |   27 +++++++++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 recipes/rt-tests/rt-tests_0.73.bb

diff --git a/recipes/rt-tests/rt-tests_0.73.bb b/recipes/rt-tests/rt-tests_0.73.bb
new file mode 100644
index 0000000..bebf89e
--- /dev/null
+++ b/recipes/rt-tests/rt-tests_0.73.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "Real-time tests, such as cyclictest, for real-time linux PREEMPT RT kernels"
+HOMEPAGE = "http://rt.wiki.kernel.org/index.php/Cyclictest"
+LICENSE = "GPL"
+PR = "r1"
+
+SRC_URI = "http://www.kernel.org/pub/linux/kernel/people/tglx/rt-tests/rt-tests-${PV}.tar.bz2"
+
+S = "${WORKDIR}/rt-tests"
+
+CFLAGS += "-D_GNU_SOURCE -Wall -Wno-nonnull -Isrc/include"
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+# Limit to cyclictest only for non-real-time kernels.
+# EXTRA_OEMAKE = "cyclictest"
+
+do_install() {
+  install -d ${D}${bindir}
+  # any file that is executable by user and/or group
+  for binary in `find . -perm /u+x,g+x -type f`
+  do
+    install -m 0755 $binary ${D}${bindir}
+  done
+}
+
+SRC_URI[md5sum] = "98da46135f0a91c96cb7e5b27c7e3bb6"
+SRC_URI[sha256sum] = "f8d396ecd6aa5526c49919acbac0ea4936f27f2410ca806570d8c92c1067c29d"
+
-- 
1.7.0.4



