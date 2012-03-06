Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jluebbe@lasnet.de>) id 1S4sBW-0000lf-SD
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Mar 2012 12:04:02 +0100
Received: from [89.204.154.91] (helo=polaris.fritz.box)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1S4rkx-0006KD-1f by authid <polaris@lasnet.de> with
	srv_auth_cram_md5 for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2012 11:36:40 +0100
From: Jan Luebbe <jluebbe@debian.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Mar 2012 11:36:11 +0100
Message-Id: <1331030173-21724-1-git-send-email-jluebbe@debian.org>
X-Mailer: git-send-email 1.7.9.1
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.2.5
Subject: [PATCH 1/3] proj: add recipe
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
X-List-Received-Date: Tue, 06 Mar 2012 11:04:03 -0000

Signed-off-by: Jan Luebbe <jluebbe@debian.org>
---
 meta-oe/recipes-navigation/proj/proj.inc      |   13 +++++++++++++
 meta-oe/recipes-navigation/proj/proj_4.7.0.bb |    7 +++++++
 2 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-navigation/proj/proj.inc
 create mode 100644 meta-oe/recipes-navigation/proj/proj_4.7.0.bb

diff --git a/meta-oe/recipes-navigation/proj/proj.inc b/meta-oe/recipes-navigation/proj/proj.inc
new file mode 100644
index 0000000..f6275d1
--- /dev/null
+++ b/meta-oe/recipes-navigation/proj/proj.inc
@@ -0,0 +1,13 @@
+DESCRIPTION = "PROJ.4 - Cartographic Projections Library"
+HOMEPAGE = "http://trac.osgeo.org/proj/"
+SECTION = "libs"
+
+INC_PR = "r0"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=74d9aaec5fa0cd734341e8c4dc91b608"
+
+SRC_URI = "http://download.osgeo.org/proj/proj-${PV}.tar.gz"
+
+inherit autotools pkgconfig
+
diff --git a/meta-oe/recipes-navigation/proj/proj_4.7.0.bb b/meta-oe/recipes-navigation/proj/proj_4.7.0.bb
new file mode 100644
index 0000000..8e4f901
--- /dev/null
+++ b/meta-oe/recipes-navigation/proj/proj_4.7.0.bb
@@ -0,0 +1,7 @@
+require proj.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "927d34623b52e0209ba2bfcca18fe8cd"
+SRC_URI[sha256sum] = "fc5440002a496532bfaf423c28bdfaf9e26cc96c84ccefcdefde911efbd98986"
+
-- 
1.7.9.1



