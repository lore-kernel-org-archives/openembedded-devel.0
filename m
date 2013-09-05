Return-Path: <erp@movis.dk>
Received: from clobix.com (mail.clobix.com [54.229.118.53])
	by mail.openembedded.org (Postfix) with ESMTP id 319596B8E9
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2013 09:47:46 +0000 (UTC)
Received: (qmail 5861 invoked by uid 89); 5 Sep 2013 09:47:35 -0000
Received: from unknown (HELO sabrina.webspeed.dk)
	(erp@movis.dk@::ffff:83.93.56.101)
	by 0 with ESMTPA; 5 Sep 2013 09:47:35 -0000
From: Emil Petersen <erp@movis.dk>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Sep 2013 11:47:10 +0200
Message-Id: <1378374430-9980-1-git-send-email-erp@movis.dk>
X-Mailer: git-send-email 1.8.4.rc3
Subject: [meta-perl][PATCH] libdevice-modem-perl_1.56: added
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
X-List-Received-Date: Thu, 05 Sep 2013 09:47:47 -0000

Device::Modem added

Signed-off-by: Emil Petersen <erp@movis.dk>
---
 .../libdevice-modem-perl_1.56.bb                   | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libdevice-modem-perl/libdevice-modem-perl_1.56.bb

diff --git a/meta-perl/recipes-perl/libdevice-modem-perl/libdevice-modem-perl_1.56.bb b/meta-perl/recipes-perl/libdevice-modem-perl/libdevice-modem-perl_1.56.bb
new file mode 100644
index 0000000..e1223fc
--- /dev/null
+++ b/meta-perl/recipes-perl/libdevice-modem-perl/libdevice-modem-perl_1.56.bb
@@ -0,0 +1,28 @@
+SUMMARY = "Device::Modem - Prel extension to talk to modem devices connected via serial port"
+AUTHOR = "Cosimo Streppone <cosimo@cpan.org>"
+HOMEPAGE = "https://metacpan.org/release/Device-Modem"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://META.yml;md5=b67c3a9c3a685020be4ae38a2ae1723c"
+
+RDEPENDS_${PN} += "libdevice-serialport-perl"
+
+RPROVIDES_${PN} += "libdevice-modem-perl \
+                    libdevice-modem-log-file-perl \
+                    libdevice-modem-log-syslog-perl \
+                    libdevice-modem-usrobotics-perl \
+                    libdevice-xmodem-constants-perl \
+                    libdevice-xmodem-block-perl \
+                    libdevice-xmodem-buffer-perl \
+                    libdevice-xmodem-receiver-perl \
+                    "
+                    
+SRC_URI = "http://cpan.metacpan.org/authors/id/C/CO/COSIMO/Device-Modem-1.56.tar.gz"
+SRC_URI[md5sum] = "a0ec45c3e313bea27ccb476d3b725955"
+SRC_URI[sha256sum] = "907fc083b5dc11e0782a3a9482b0810108fd3b0f2bf09efdbdcced2a6cce6071"
+
+S = "${WORKDIR}/Device-Modem-${PV}"
+
+inherit cpan
+
+BBCLASSEXTEND = "native"
-- 
1.8.4.rc3


