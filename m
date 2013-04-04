Received: from mail-qa0-f52.google.com ([209.85.216.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip.balister@gmail.com>) id 1UNof7-0004B2-Ka
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Apr 2013 20:13:31 +0200
Received: by mail-qa0-f52.google.com with SMTP id bs12so1545025qab.18
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Apr 2013 10:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=0ZhVGaEH7z/u16rjvgCvJ1ZdNS94imuUpyWzVnZVFjs=;
	b=GXGSeW0D+WrxVLV70NGWs6ixtQTDGMnCzfLeolddbcRzDN45JfLF+djHok0AToO6eD
	SB02thFFv39uAfTNh26xMm7qyyYQNoUhfxLQUPXXhJuHdl/jL4b1w1IT4ATiIScx2GmC
	ztqIT/Ul2fE2c6StDIbhgkkVYO63/EX9qdz0UQJQDVjBupGNtZkYS622/4lu1F+6ig/i
	2BXTaBykaU47ZDMAiRRff/m4IdU3rWPKlp4oGLrf/mnhhcfffkcqXvxnn7jH7ZaKNVLB
	CI6R9goumQzoN9b0K3dmQZY56nVd3wSLMFak53ZQ/2u6J1VT+ddc2G46hzSvnsCAAJJh
	DFMg==
X-Received: by 10.229.76.159 with SMTP id c31mr2193558qck.134.1365098172321;
	Thu, 04 Apr 2013 10:56:12 -0700 (PDT)
Received: from localhost.localdomain
	(pool-96-240-175-73.ronkva.east.verizon.net. [96.240.175.73])
	by mx.google.com with ESMTPS id hv6sm1042459qeb.1.2013.04.04.10.56.11
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 04 Apr 2013 10:56:11 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Apr 2013 13:56:07 -0400
Message-Id: <1365098168-28749-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.7.11.7
Subject: [meta-oe][PATCH 1/2] uhd : Update to version 3.5.2.
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
X-List-Received-Date: Thu, 04 Apr 2013 18:13:32 -0000

Tested on Cortex-A9 based hardware.

Signed-off-by: Philip Balister <philip@balister.org>
---
 .../uhd/uhd-firmware_003.005.000.bb                | 27 ----------------------
 .../uhd/uhd-firmware_003.005.002.bb                | 27 ++++++++++++++++++++++
 meta-oe/recipes-connectivity/uhd/uhd_git.bb        |  4 ++--
 3 files changed, 29 insertions(+), 29 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/uhd/uhd-firmware_003.005.000.bb
 create mode 100644 meta-oe/recipes-connectivity/uhd/uhd-firmware_003.005.002.bb

diff --git a/meta-oe/recipes-connectivity/uhd/uhd-firmware_003.005.000.bb b/meta-oe/recipes-connectivity/uhd/uhd-firmware_003.005.000.bb
deleted file mode 100644
index ee771fb..0000000
--- a/meta-oe/recipes-connectivity/uhd/uhd-firmware_003.005.000.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-DESCRIPTION = "Universal Hardware Driver Firmware"
-HOMEPAGE = "http://www.ettus.com"
-
-PE = "1"
-
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://share/uhd/images/usrp_e100_fpga_v2.bin;md5=8df143216c46b7c49804f95056c7057a"
-
-inherit allarch
-
-SRC_URI = "http://files.ettus.com/binaries/uhd_stable/releases/uhd_${PV}-release/uhd-images_${PV}-release.tar.gz"
-SRC_URI[md5sum] = "dd2373263740d2d48fb39e57846bcd2a"
-SRC_URI[sha256sum] = "352fbf69fbfff03a02b5d9b3c398771db40e4c5b77f99f0fdbff67c547cc0d18"
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
diff --git a/meta-oe/recipes-connectivity/uhd/uhd-firmware_003.005.002.bb b/meta-oe/recipes-connectivity/uhd/uhd-firmware_003.005.002.bb
new file mode 100644
index 0000000..e3180d2
--- /dev/null
+++ b/meta-oe/recipes-connectivity/uhd/uhd-firmware_003.005.002.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "Universal Hardware Driver Firmware"
+HOMEPAGE = "http://www.ettus.com"
+
+PE = "1"
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://share/uhd/images/usrp_e100_fpga_v2.bin;md5=29260868c9484a37a7e6b61b29c57a4a"
+
+inherit allarch
+
+SRC_URI = "http://files.ettus.com/binaries/uhd_stable/releases/uhd_${PV}-release/uhd-images_${PV}-release.tar.gz"
+SRC_URI[md5sum] = "2dbb7e2fb0c774e5ea2372bac25102e5"
+SRC_URI[sha256sum] = "217efa814fb031ad136bd3dcf89ca219dd6d7ee01aa7e65c56c56b77379117bd"
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
diff --git a/meta-oe/recipes-connectivity/uhd/uhd_git.bb b/meta-oe/recipes-connectivity/uhd/uhd_git.bb
index 721182c..b360e00 100644
--- a/meta-oe/recipes-connectivity/uhd/uhd_git.bb
+++ b/meta-oe/recipes-connectivity/uhd/uhd_git.bb
@@ -1,10 +1,10 @@
 require uhd.inc
 
-PV = "3.5.0"
+PV = "3.5.2"
 PR = "${INC_PR}.0"
 
 SRC_URI = "git://ettus.sourcerepo.com/ettus/uhd.git;branch=maint;protocol=git \
           "
 S = "${WORKDIR}/git/host"
 
-SRCREV = "5cb9779da40491b06157596b06422f704a58c7d0"
+SRCREV = "0cce80c1ef2bcdb5094d579a6853261cebd2ec03"
-- 
1.7.11.7



