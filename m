Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1OlSga-0007x5-AO
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 22:23:49 +0200
Received: by qwi2 with SMTP id 2so1400087qwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Aug 2010 13:22:40 -0700 (PDT)
Received: by 10.224.121.65 with SMTP id g1mr4624986qar.370.1282076551987;
	Tue, 17 Aug 2010 13:22:31 -0700 (PDT)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com [75.101.156.174])
	by mx.google.com with ESMTPS id f15sm9191523qcr.13.2010.08.17.13.22.30
	(version=SSLv3 cipher=RC4-MD5); Tue, 17 Aug 2010 13:22:30 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Aug 2010 15:22:29 -0500
Message-Id: <1282076549-13640-1-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.5.6.4
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] esc-gst: added revision 6
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
X-List-Received-Date: Tue, 17 Aug 2010 20:23:50 -0000


Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
---
 recipes/esc/esc-gst_6.bb |   23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 recipes/esc/esc-gst_6.bb

diff --git a/recipes/esc/esc-gst_6.bb b/recipes/esc/esc-gst_6.bb
new file mode 100644
index 0000000..88840db
--- /dev/null
+++ b/recipes/esc/esc-gst_6.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "Gstreamer scripts for Embedded Systems Conference workshop"
+LICENSE = "Various"
+
+SRC_URI = "http://hivelocity.dl.sourceforge.net/project/showoff/esc_gst_scripts.tar.gz \
+"
+SRC_URI[md5sum] = "944f4ea58e81c3a32b947322ac8f9e1d"
+SRC_URI[sha256sum] = "589c3b611406f255204e1993e470d0d69ac8f12ff479febf4d5dc92915f982da"
+
+S = "${WORKDIR}/esc-gst"
+
+do_install() {
+    ESC_FILES="a1 a2 a3 a4 a5 a6 d1 d2 d3 d4 d5 d6 g1 g2 g3 g4 g5 g6 g7 g8 g9"
+    ESC_FILES="${ESC_FILES} n1 n2 n3 n4 p1 s v1 v2 v3 v4"
+    install -d ${D}${datadir}/esc-gst
+    for F in ${ESC_FILES} ; do
+        install -m 0755 ${S}/${F} ${D}${datadir}/esc-gst
+    done
+    install -m 0644 ${S}/README ${D}${datadir}/esc-gst
+    install -d ${D}${datadir}/applications
+    install -m 0644 ${S}/GStreamer_Class.desktop ${D}${datadir}/applications/
+}
+
+FILES_${PN} += "${datadir}/esc-gst"
-- 
1.5.6.4



