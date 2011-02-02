Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Pklxl-0003YE-AK
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Feb 2011 00:18:13 +0100
Received: (qmail invoked by alias); 02 Feb 2011 23:17:16 -0000
Received: from p5DE485FA.dip.t-dialin.net (EHLO
	localhost.localdomain.localdomain) [93.228.133.250]
	by mail.gmx.net (mp059) with SMTP; 03 Feb 2011 00:17:16 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1809RMXC9M03WxPHtF4icduLmWqO8+/1201zNs/ln
	frb4v/6J1Tp+YZ
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Feb 2011 00:14:02 +0100
Message-Id: <1296688442-22207-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.2.3
X-Y-GMX-Trusted: 0
Subject: [PATCH] clutter-gst add 1.3.4
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
X-List-Received-Date: Wed, 02 Feb 2011 23:18:13 -0000

* clutter 1.4.2 broke clutter-gst and made it necessary to have a recipe from
* development snapshot sources
*
* Build tested with
* BB_VERSION        = "1.10.2"
* METADATA_BRANCH   = "master"
* METADATA_REVISION = "2049a96"
* TARGET_ARCH       = "arm"
* TARGET_OS         = "linux-gnueabi"
* MACHINE           = "overo"
* DISTRO            = "angstrom"
* DISTRO_VERSION    = "2010.7-test-20110202"
* TARGET_FPU        = "hard"

Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 recipes/clutter/clutter-gst_1.3.4.bb |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)
 create mode 100644 recipes/clutter/clutter-gst_1.3.4.bb

diff --git a/recipes/clutter/clutter-gst_1.3.4.bb b/recipes/clutter/clutter-gst_1.3.4.bb
new file mode 100644
index 0000000..426cae2
--- /dev/null
+++ b/recipes/clutter/clutter-gst_1.3.4.bb
@@ -0,0 +1,9 @@
+require clutter-gst.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "http://source.clutter-project.org/sources/clutter-gst/1.3/clutter-gst-${PV}.tar.bz2 \
+          "
+
+SRC_URI[md5sum] = "4f74f78df215cba54444dd6256a29bd4"
+SRC_URI[sha256sum] = "de4ce6d3313be3074c6afc6f20276ef06f1a460b3a6755fc5c6e048685de137a"
-- 
1.7.2.3



