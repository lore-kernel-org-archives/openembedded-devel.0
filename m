Return-Path: <erp@movis.dk>
Received: from clobix.com (mail.clobix.com [54.229.118.53])
	by mail.openembedded.org (Postfix) with ESMTP id 668EE6B130
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2013 09:49:48 +0000 (UTC)
Received: (qmail 5891 invoked by uid 89); 5 Sep 2013 09:49:38 -0000
Received: from unknown (HELO sabrina.webspeed.dk)
	(erp@movis.dk@::ffff:83.93.56.101)
	by 0 with ESMTPA; 5 Sep 2013 09:49:38 -0000
From: Emil Petersen <erp@movis.dk>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Sep 2013 11:49:15 +0200
Message-Id: <1378374555-10129-1-git-send-email-erp@movis.dk>
X-Mailer: git-send-email 1.8.4.rc3
Subject: [meta-perl][PATCH] libdevice-gsm-pelr_1.60: added
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
X-List-Received-Date: Thu, 05 Sep 2013 09:49:48 -0000

Signed-off-by: Emil Petersen <erp@movis.dk>
---
 .../libdevice-gsm-perl/libdevice-gsm-perl_1.60.bb  | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libdevice-gsm-perl/libdevice-gsm-perl_1.60.bb

diff --git a/meta-perl/recipes-perl/libdevice-gsm-perl/libdevice-gsm-perl_1.60.bb b/meta-perl/recipes-perl/libdevice-gsm-perl/libdevice-gsm-perl_1.60.bb
new file mode 100644
index 0000000..1be3d5e
--- /dev/null
+++ b/meta-perl/recipes-perl/libdevice-gsm-perl/libdevice-gsm-perl_1.60.bb
@@ -0,0 +1,42 @@
+SUMMARY = "Device::Gsm - Perl extension to interface GSM phones / modems"
+AUTHOR = "Cosimo Streppone <cosimo@cpan.org>"
+HOMEPAGE = "https://metacpan.org/module/Device::Gsm"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://README;md5=3f0b149e4ed2b3520632c786f3d1ba9a"
+
+RDEPENDS_${PN} += "libdevice-modem-perl \
+                   libtime-hires-perl \
+                   libdevice-serialport-perl \
+                   "
+
+RPROVIDES_${PN} += "libdevice-gsm-perl \
+                    libdevice-gsm-pdu \
+                    libdevice-gsm-sms \
+                    libdevice-gsm-charset \
+                    libdevice-gsm-networks \
+                    libsms-token-perl \
+                    libsms-token-da \
+                    libsms-token-dcs \
+                    libsms-token-dt \
+                    libsms-token-mr \
+                    libsms-token-oa \
+                    libsms-token-pdutype \
+                    libsms-token-pid \
+                    libsms-token-sca \
+                    libsms-token-scts \
+                    libsms-token-st \
+                    libsms-token-ud \
+                    libsms-token-udh \
+                    libsms-token-vp \
+                    "
+                    
+SRC_URI = "http://cpan.metacpan.org/authors/id/C/CO/COSIMO/Device-Gsm-1.60.tar.gz"
+SRC_URI[md5sum] = "1a1fa45a9b5415f1149610a06b7ce9c9"
+SRC_URI[sha256sum] = "9739904d0022d6cf65f27b0ef91dbe4ce7c1cd7ef06dbb2c3e3b09639d8fc0ed"
+
+S = "${WORKDIR}/Device-Gsm-${PV}"
+
+inherit cpan
+
+BBCLASSEXTEND = "native"
-- 
1.8.4.rc3


