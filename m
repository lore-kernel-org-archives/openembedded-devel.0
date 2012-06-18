Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SghfL-0005MZ-JL
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jun 2012 21:31:11 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 Jun 2012 12:19:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="157801340"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.105])
	by azsmga001.ch.intel.com with ESMTP; 18 Jun 2012 12:19:23 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Jun 2012 12:19:23 -0700
Message-Id: <1340047163-24689-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] rfkill: use update-alternatives
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
X-List-Received-Date: Mon, 18 Jun 2012 19:31:11 -0000

Since oe-core added rfkill to busybox, this recipe needs to use u-a
also.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb b/meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb
index 561fdc7..548990c 100644
--- a/meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb
+++ b/meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb
@@ -3,6 +3,7 @@ HOMEPAGE = "http://linuxwireless.org/en/users/Documentation/rfkill"
 SECTION = "base"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c6036d0eb7edbfced28c4160e5d3fa94"
+PR = "r1"
 
 SRC_URI = "http://wireless.kernel.org/download/${PN}/${P}.tar.bz2 \
            file://0001-rfkill-makefile-don-t-use-t-the-OE-install-wrapper-d.patch"
@@ -16,3 +17,9 @@ do_compile() {
 do_install() {
         oe_runmake DESTDIR=${D} install
 }
+
+inherit update-alternatives
+
+ALTERNATIVE_${PN} = "rfkill"
+ALTERNATIVE_PRIORITY = "50"
+
-- 
1.7.7.6



