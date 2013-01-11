Received: from mail-qa0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip.balister@gmail.com>) id 1TtleI-0000tV-D5
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Jan 2013 21:56:23 +0100
Received: by mail-qa0-f47.google.com with SMTP id a19so150343qad.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jan 2013 12:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=tLcocc69rU7d3L7290SlO3PfalkjOpoDI+l+vZUGn3c=;
	b=CqpzSukjOnw7CbdrxyPJi1UbbNV6fMSuXoFVwtwQUuYt50KSpUE+kQofQFtdJPMAD7
	/Acf6OYFQ1rnidSzQsY9ubW5Jp7IC4rnra52cPvNrCld2mMOMEyC8gHEuugf5QzopoBG
	arvak4n8yWlSXGYH7CWtO7hehOZHPQNqeZSBB5h1ctG9gAZkFOmDaW52bnoL2xZM2Plm
	QthFGGzPhvm0AW9ixzA7jgkiG81EGnKJwbZON8jAnEVEI9Wo6K4H40Fm+B76ILrq5xzo
	DOH3gQAC5j39hhFu8sUG6O8sAH/lx3DDvn9kvDbuV2/+qGqnCmIk4QXWlctbOA3NY9j3
	35VA==
X-Received: by 10.224.188.13 with SMTP id cy13mr60262712qab.53.1357936866876; 
	Fri, 11 Jan 2013 12:41:06 -0800 (PST)
Received: from localhost.localdomain ([96.240.164.36])
	by mx.google.com with ESMTPS id hr3sm4424378qab.4.2013.01.11.12.41.05
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 11 Jan 2013 12:41:06 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Jan 2013 15:40:59 -0500
Message-Id: <1357936861-8245-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.7.11.7
Subject: [meta-oe][PATCH 1/3] uhd-firmware : Update to version 3.5.0.
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
X-List-Received-Date: Fri, 11 Jan 2013 20:56:26 -0000
X-List-Received-Date: Fri, 11 Jan 2013 20:56:26 -0000

Signed-off-by: Philip Balister <philip@balister.org>
---
 .../uhd/uhd-firmware_003.004.000.bb                | 27 ----------------------
 .../uhd/uhd-firmware_003.005.000.bb                | 27 ++++++++++++++++++++++
 2 files changed, 27 insertions(+), 27 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/uhd/uhd-firmware_003.004.000.bb
 create mode 100644 meta-oe/recipes-connectivity/uhd/uhd-firmware_003.005.000.bb

diff --git a/meta-oe/recipes-connectivity/uhd/uhd-firmware_003.004.000.bb b/meta-oe/recipes-connectivity/uhd/uhd-firmware_003.004.000.bb
deleted file mode 100644
index b445307..0000000
--- a/meta-oe/recipes-connectivity/uhd/uhd-firmware_003.004.000.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-DESCRIPTION = "Universal Hardware Driver Firmware"
-HOMEPAGE = "http://www.ettus.com"
-
-PE = "1"
-
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://share/uhd/images/usrp_e100_fpga_v2.bin;md5=d8a4f8958d3b56a11bbb1bb134826b28"
-
-inherit allarch
-
-SRC_URI = "http://files.ettus.com/binaries/uhd_stable/releases/uhd_${PV}-release/uhd-images_${PV}-release.tar.gz"
-SRC_URI[md5sum] = "4269fac82df1fe593ba76206773ce551"
-SRC_URI[sha256sum] = "4b80ebf90079a823212d3b77e5311ef1b467497a4a3585c2cfb4fe65bff71acf"
-
-S = "${WORKDIR}/uhd-images_${PV}-release"
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
diff --git a/meta-oe/recipes-connectivity/uhd/uhd-firmware_003.005.000.bb b/meta-oe/recipes-connectivity/uhd/uhd-firmware_003.005.000.bb
new file mode 100644
index 0000000..ee771fb
--- /dev/null
+++ b/meta-oe/recipes-connectivity/uhd/uhd-firmware_003.005.000.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "Universal Hardware Driver Firmware"
+HOMEPAGE = "http://www.ettus.com"
+
+PE = "1"
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://share/uhd/images/usrp_e100_fpga_v2.bin;md5=8df143216c46b7c49804f95056c7057a"
+
+inherit allarch
+
+SRC_URI = "http://files.ettus.com/binaries/uhd_stable/releases/uhd_${PV}-release/uhd-images_${PV}-release.tar.gz"
+SRC_URI[md5sum] = "dd2373263740d2d48fb39e57846bcd2a"
+SRC_URI[sha256sum] = "352fbf69fbfff03a02b5d9b3c398771db40e4c5b77f99f0fdbff67c547cc0d18"
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
1.7.11.7



