Return-Path: <dvhart@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id AADBE72D36
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jan 2015 17:46:47 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 23 Jan 2015 09:46:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,454,1418112000"; d="scan'208";a="516707369"
Received: from wrath.jf.intel.com (HELO localhost) ([10.7.198.81])
	by orsmga003.jf.intel.com with ESMTP; 23 Jan 2015 09:39:57 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Jan 2015 09:46:43 -0800
Message-Id: <704258780ab6ad866bee53fef25a5913fd5e67eb.1422035203.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] fb-tests: Prepend fb- to the binaries
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Jan 2015 17:46:48 -0000

The binaries conflict with perf and mesa-demos. Update do_install to
prefix the binaries, avoiding the namespace conflict.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-support/fbtest/fb-test_git.bb | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-support/fbtest/fb-test_git.bb b/meta-oe/recipes-support/fbtest/fb-test_git.bb
index 65f98c1..13f9e37 100644
--- a/meta-oe/recipes-support/fbtest/fb-test_git.bb
+++ b/meta-oe/recipes-support/fbtest/fb-test_git.bb
@@ -11,9 +11,10 @@ SRC_URI = "git://github.com/prpplague/fb-test-app.git"
 S = "${WORKDIR}/git"
 
 do_install() {
-    install -d ${D}${bindir}
-    for prog in perf rect fb-test offset ; do
-        install -m 0755 $prog ${D}${bindir}
-    done
+	install -d ${D}${bindir}
+	install -m 0755 fb-test ${D}${bindir}
+	# avoid collisions with perf (perf) and mesa-demos (offset)
+	for prog in perf rect offset ; do
+		install -m 0755 $prog ${D}${bindir}/fb-$prog
+	done
 }
-
-- 
2.1.4


