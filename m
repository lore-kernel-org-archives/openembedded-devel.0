Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MJ1zH-0006EC-E2
	for openembedded-devel@openembedded.org; Tue, 23 Jun 2009 11:08:19 +0200
Received: (qmail 1972 invoked by uid 813007); 23 Jun 2009 08:57:17 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 23 Jun 2009 08:57:16 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Jun 2009 10:56:34 +0200
Message-Id: <1245747394-31806-8-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <200906230941.30107.marcin@juszkiewicz.com.pl>
References: <200906230941.30107.marcin@juszkiewicz.com.pl>
Cc: Lynn Lin <lynn.lin@avocent.com>
Subject: [STABLE][PATCH 059/125] package_rpm: fix move wrong generated rpm name - closes #5078
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
X-List-Received-Date: Tue, 23 Jun 2009 09:08:19 -0000

From: Lynn Lin <lynn.lin@avocent.com>


Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 classes/package_rpm.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/package_rpm.bbclass b/classes/package_rpm.bbclass
index 71fa760..0cebdea 100644
--- a/classes/package_rpm.bbclass
+++ b/classes/package_rpm.bbclass
@@ -136,7 +136,7 @@ python write_specfile() {
 	bb.build.exec_func('BUILDSPEC', d)
 
 	# move the rpm into the pkgoutdir
-	rpm = bb.data.expand('${RPMBUILDPATH}/RPMS/${TARGET_ARCH}/${PKG}-${RPMPV}-${PR}.${TARGET_ARCH}.rpm', d)
+	rpm = bb.data.expand('${RPMBUILDPATH}/RPMS/${TARGET_ARCH}/${PKG}-${RPMPV}-${PR}${DISTRO_PR}.${TARGET_ARCH}.rpm', d)
 	outrpm = bb.data.expand('${DEPLOY_DIR_RPM}/${PACKAGE_ARCH}/${PKG}-${RPMPV}-${PR}.${TARGET_ARCH}.rpm', d)
 	bb.movefile(rpm, outrpm)
 }
-- 
1.6.3.1





