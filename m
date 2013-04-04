Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UNpkW-0001kl-3k
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Apr 2013 21:23:05 +0200
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id CF657D20D2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Apr 2013 21:05:59 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Apr 2013 21:05:49 +0200
Message-Id: <1365102349-21426-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.1.2
Subject: [meta-oe][PATCH] tbb: update to 4.1 Update 3 version from 20130314
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
X-List-Received-Date: Thu, 04 Apr 2013 19:23:05 -0000

ARMv7a support was added

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta-oe/recipes-support/tbb/tbb_4.1.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/tbb/tbb_4.1.bb b/meta-oe/recipes-support/tbb/tbb_4.1.bb
index 2337bdd..48427ee 100644
--- a/meta-oe/recipes-support/tbb/tbb_4.1.bb
+++ b/meta-oe/recipes-support/tbb/tbb_4.1.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "Parallelism library for C++ - runtime files \
 HOMEPAGE = "http://threadingbuildingblocks.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2c7f2caf277a3933e3acdf7f89d54cc1"
-PRDATE = "20130116"
+PRDATE = "20130314"
 PR = "r${PRDATE}"
 
 SRC_URI = "http://threadingbuildingblocks.org/sites/default/files/software_releases/source/tbb41_${PRDATE}oss_src.tgz \
@@ -15,8 +15,8 @@ SRC_URI = "http://threadingbuildingblocks.org/sites/default/files/software_relea
 
 S = "${WORKDIR}/tbb41_${PRDATE}oss/"
 
-SRC_URI[md5sum] = "3809790e1001a1b32d59c9fee590ee85"
-SRC_URI[sha256sum] = "4ae2c10899e3b6ef2f686013ec5901fc658444ca90178efaca6014b0665c34b6"
+SRC_URI[md5sum] = "ed4af7ccfa122f16cf9920b241633a3a"
+SRC_URI[sha256sum] = "32fd5979971b772caa96d40646cee585ed0070516ba2dbbcb1f9b6033d08a92d"
 
 do_compile() {
     oe_runmake compiler=gcc arch=${HOST_ARCH} runtime=cc4
-- 
1.8.1.2



