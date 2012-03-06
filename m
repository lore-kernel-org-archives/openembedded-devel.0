Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jluebbe@lasnet.de>) id 1S4sBW-0000lZ-N7
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Mar 2012 12:04:02 +0100
Received: from [89.204.154.91] (helo=polaris.fritz.box)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1S4rl5-0006KD-JU by authid <polaris@lasnet.de> with
	srv_auth_cram_md5 for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2012 11:36:49 +0100
From: Jan Luebbe <jluebbe@debian.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Mar 2012 11:36:12 +0100
Message-Id: <1331030173-21724-2-git-send-email-jluebbe@debian.org>
X-Mailer: git-send-email 1.7.9.1
In-Reply-To: <1331030173-21724-1-git-send-email-jluebbe@debian.org>
References: <1331030173-21724-1-git-send-email-jluebbe@debian.org>
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.2.5
Subject: [PATCH 2/3] geos: add recipe
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
X-List-Received-Date: Tue, 06 Mar 2012 11:04:02 -0000

Signed-off-by: Jan Luebbe <jluebbe@debian.org>
---
 meta-oe/recipes-navigation/geos/geos.inc      |   15 +++++++++++++++
 meta-oe/recipes-navigation/geos/geos_3.3.2.bb |    7 +++++++
 2 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-navigation/geos/geos.inc
 create mode 100644 meta-oe/recipes-navigation/geos/geos_3.3.2.bb

diff --git a/meta-oe/recipes-navigation/geos/geos.inc b/meta-oe/recipes-navigation/geos/geos.inc
new file mode 100644
index 0000000..30ad554
--- /dev/null
+++ b/meta-oe/recipes-navigation/geos/geos.inc
@@ -0,0 +1,15 @@
+DESCRIPTION = "GEOS - Geometry Engine, Open Source"
+HOMEPAGE = "http://trac.osgeo.org/geos/"
+SECTION = "libs"
+
+INC_PR = "r0"
+
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
+
+SRC_URI = "http://download.osgeo.org/geos/geos-${PV}.tar.bz2"
+
+inherit autotools pkgconfig
+
+FILES_${PN} += " ${libdir}/libgeos-${PV}.so"
+
diff --git a/meta-oe/recipes-navigation/geos/geos_3.3.2.bb b/meta-oe/recipes-navigation/geos/geos_3.3.2.bb
new file mode 100644
index 0000000..e57ca6b
--- /dev/null
+++ b/meta-oe/recipes-navigation/geos/geos_3.3.2.bb
@@ -0,0 +1,7 @@
+require geos.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "5b7270c73fd1c516f368af8fd1962323"
+SRC_URI[sha256sum] = "ec64d3a92540a1618aa3b91dc1235caae1c370ec23afd59a2734062bf182ed5b"
+
-- 
1.7.9.1



