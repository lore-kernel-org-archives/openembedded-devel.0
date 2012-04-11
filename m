Received: from sanddollar.geekisp.com ([216.168.135.167])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1SI6ws-0004eM-Nb
	for openembedded-devel@openembedded.org; Thu, 12 Apr 2012 01:27:38 +0200
Received: (qmail 14629 invoked by uid 1003); 11 Apr 2012 23:11:38 -0000
Received: from unknown (HELO localhost.localdomain)
	(philip@balister.org@157.22.28.13)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	11 Apr 2012 23:11:38 -0000
From: philip@balister.org
To: openembedded-devel@openembedded.org
Date: Wed, 11 Apr 2012 16:11:27 -0700
Message-Id: <1334185891-25460-2-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1334185891-25460-1-git-send-email-philip@balister.org>
References: <1334185891-25460-1-git-send-email-philip@balister.org>
Cc: Philip Balister <philip@opensdr.com>
Subject: [meta-oe 1/5] uhd-firmware : Update to version 003.004.000.
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
X-List-Received-Date: Wed, 11 Apr 2012 23:27:39 -0000

From: Philip Balister <philip@opensdr.com>

Yes, Josh changed the paths again. They are much saner now, and if he touches
them again, I will beat him with a ping pong paddle.

Signed-off-by: Philip Balister <philip@opensdr.com>
---
 .../uhd/uhd-firmware_003.003.001.bb                |   27 --------------------
 .../uhd/uhd-firmware_003.004.000.bb                |   27 ++++++++++++++++++++
 2 files changed, 27 insertions(+), 27 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/uhd/uhd-firmware_003.003.001.bb
 create mode 100644 meta-oe/recipes-connectivity/uhd/uhd-firmware_003.004.000.bb

diff --git a/meta-oe/recipes-connectivity/uhd/uhd-firmware_003.003.001.bb b/meta-oe/recipes-connectivity/uhd/uhd-firmware_003.003.001.bb
deleted file mode 100644
index 1d7817d..0000000
--- a/meta-oe/recipes-connectivity/uhd/uhd-firmware_003.003.001.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-DESCRIPTION = "Universal Hardware Driver Firmware"
-HOMEPAGE = "http://www.ettus.com"
-
-PE = "1"
-
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://share/uhd/images/usrp_e100_fpga_v2.bin;md5=52f5a4b60aca734da1b0e78078aeea71"
-
-inherit allarch
-
-SRC_URI = "http://www.ettus.com/downloads/uhd_releases/${@'${PV}'.replace('.', '_')}/images-only/UHD-images-${PV}.tar.gz"
-SRC_URI[md5sum] = "84ec78ec03699a96d64210b93019f782"
-SRC_URI[sha256sum] = "53712db43b324adad1b83617f99f7b73682bcd0078bbc9915d0a376f4ca41289"
-
-S = "${WORKDIR}/UHD-images-${PV}-59f407f"
-
-do_install() {
-	install -d ${D}${datadir}/uhd/images
-	install -d ${D}${datadir}/uhd/images/bit
-	install -m 0644 ${S}/share/uhd/images/bit/* ${D}${datadir}/uhd/images/bit
-	rm -rf ${S}/share/uhd/images/bit
-	install -m 0644 ${S}/share/uhd/images/* ${D}${datadir}/uhd/images
-}
-
-PACKAGES = "${PN}"
-FILES_${PN} = "${datadir}/uhd/images"
-
diff --git a/meta-oe/recipes-connectivity/uhd/uhd-firmware_003.004.000.bb b/meta-oe/recipes-connectivity/uhd/uhd-firmware_003.004.000.bb
new file mode 100644
index 0000000..b445307
--- /dev/null
+++ b/meta-oe/recipes-connectivity/uhd/uhd-firmware_003.004.000.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "Universal Hardware Driver Firmware"
+HOMEPAGE = "http://www.ettus.com"
+
+PE = "1"
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://share/uhd/images/usrp_e100_fpga_v2.bin;md5=d8a4f8958d3b56a11bbb1bb134826b28"
+
+inherit allarch
+
+SRC_URI = "http://files.ettus.com/binaries/uhd_stable/releases/uhd_${PV}-release/uhd-images_${PV}-release.tar.gz"
+SRC_URI[md5sum] = "4269fac82df1fe593ba76206773ce551"
+SRC_URI[sha256sum] = "4b80ebf90079a823212d3b77e5311ef1b467497a4a3585c2cfb4fe65bff71acf"
+
+S = "${WORKDIR}/uhd-images_${PV}-release"
+
+do_install() {
+	install -d ${D}${datadir}/uhd/images
+	install -d ${D}${datadir}/uhd/images/bit
+	install -m 0644 ${S}/share/uhd/images/bit/* ${D}${datadir}/uhd/images/bit
+	rm -rf ${S}/share/uhd/images/bit
+	install -m 0644 ${S}/share/uhd/images/* ${D}${datadir}/uhd/images
+}
+
+PACKAGES = "${PN}"
+FILES_${PN} = "${datadir}/uhd/images"
+
-- 
1.7.7.6



