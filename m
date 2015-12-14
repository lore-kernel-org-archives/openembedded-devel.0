Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6169F6FF76
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 05:06:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tBE56Yk4007566
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Dec 2015 21:06:34 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Sun, 13 Dec 2015 21:06:33 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 14 Dec 2015 12:54:17 +0800
Message-ID: <1450068857-32490-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [PATCH][meta-oe] phoronix-test-suite: uprev it to 6.0.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Dec 2015 05:06:35 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

1. inherit systemd and move the systemd unit files to correct dir
2. inherit allarch
3. add bash/python to RDEDEPENDS

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...test-suite_5.2.1.bb => phoronix-test-suite_6.0.1.bb} | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-benchmark/phoronix-test-suite/{phoronix-test-suite_5.2.1.bb => phoronix-test-suite_6.0.1.bb} (60%)

diff --git a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_5.2.1.bb b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_6.0.1.bb
similarity index 60%
rename from meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_5.2.1.bb
rename to meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_6.0.1.bb
index ef9f735..5acfbf1 100644
--- a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_5.2.1.bb
+++ b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_6.0.1.bb
@@ -6,19 +6,30 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SECTION = "console/tests"
 
 SRC_URI = "http://www.phoronix-test-suite.com/releases/${BP}.tar.gz"
-SRC_URI[md5sum] = "51e52d883710dc516c5494bd1c377219"
-SRC_URI[sha256sum] = "1186f460691e2fe7a07df5edb8d8ed1ac0c65327512e646da2b2e3a60dda6cd9"
+SRC_URI[md5sum] = "c3b26fcc57a3a253e558f759fdc1089f"
+SRC_URI[sha256sum] = "27add54f4ecb464549de580cece84b4a4945b99df3ef7ff7034eb7f23ffb3b39"
 S = "${WORKDIR}/phoronix-test-suite"
 
+inherit systemd allarch
+
 do_install() {
 	DESTDIR=${D} ./install-sh ${exec_prefix}
+
+	if [ "${systemd_unitdir}" != "/usr/lib/systemd" ]; then
+		install -d ${D}/${systemd_unitdir}/system/
+		mv ${D}/usr/lib/systemd/system/* ${D}/${systemd_unitdir}/system/
+		rm -rf ${D}/usr/lib/
+	fi
 }
 
-RDEPENDS_${PN} = "php-cli"
+SYSTEMD_SERVICE_${PN} = "phoromatic-client.service phoromatic-server.service"
+RDEPENDS_${PN} += "bash python php-cli"
+
 FILES_${PN} += " \
 	${datadir}/phoronix-test-suite \
 	${datadir}/appdata/phoronix-test-suite.appdata.xml \
 	${datadir}/icons/hicolor/48x48/apps/phoronix-test-suite.png \
 	${datadir}/icons/hicolor/64x64/mimetypes/application-x-openbenchmarking.png \
 	${datadir}/mime/packages/openbenchmarking-mime.xml \
+	${systemd_unitdir}/* \
 "
-- 
2.5.0


