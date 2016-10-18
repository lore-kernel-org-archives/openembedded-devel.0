Return-Path: <herve.jourdain@neuf.fr>
Received: from smtp26.services.sfr.fr (smtp26.services.sfr.fr [93.17.128.1])
	by mail.openembedded.org (Postfix) with ESMTP id ADB8D71AEF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2016 08:54:31 +0000 (UTC)
Received: from localhost.localdomain (111-250-195-39.dynamic.hinet.net
	[111.250.195.39])
	by msfrf2610.sfr.fr (SMTP Server) with ESMTP id 0F2B21C0008BB;
	Tue, 18 Oct 2016 10:54:33 +0200 (CEST)
Received: from localhost.localdomain (111-250-195-39.dynamic.hinet.net
	[111.250.195.39])	(using TLSv1.2
	with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))	(No client
	certificate requested)	(Authenticated sender: herve.jourdain@neuf.fr)
	by msfrf2610.sfr.fr (SMTP Server) with ESMTPSA;
	Tue, 18 Oct 2016 10:54:31 +0200 (CEST)
Authentication-Results: sfr.fr; auth=pass (LOGIN)
	smtp.auth=herve.jourdain@neuf.fr
From: Herve Jourdain <herve.jourdain@neuf.fr>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Oct 2016 16:54:07 +0800
Message-Id: <1476780847-106246-2-git-send-email-herve.jourdain@neuf.fr>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1476780847-106246-1-git-send-email-herve.jourdain@neuf.fr>
References: <1476780847-106246-1-git-send-email-herve.jourdain@neuf.fr>
X-sfr-mailing: LEGIT
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH 1/1] dvb-apps: fix recipe, and update to the latest version
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
X-List-Received-Date: Tue, 18 Oct 2016 08:54:31 -0000

Fixed error "GNU_HASH not present"
Fixed dvb-scan-data package
Fixed the VERSION_FILE (used to check the dvb api version) to the one used for the target
(by default, it uses the one on the host)
Updated to the "latest" version (2014/03/22)
The latest version suppressed the original scan tables (not maintained anymore), so fetch and install the latest ones (using dvb api v3 format)(introduces a dependency on v4l-utils-native)

Signed-off-by: Herve Jourdain <herve.jourdain@neuf.fr>
---
 .../recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb         | 26 ++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb b/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb
index d9ee439..0b4b72d 100644
--- a/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb
+++ b/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb
@@ -4,20 +4,38 @@ SUMMARY = "Linux DVB API applications and utilities"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "hg://linuxtv.org/hg;module=dvb-apps;protocol=http"
-SRCREV = "3fc7dfa68484"
+DEPENDS = "v4l-utils-native"
+
+SRC_URI = " \
+            hg://linuxtv.org/hg;module=dvb-apps;protocol=http;name=apps \
+            git://linuxtv.org/git/dtv-scan-tables.git;protocol=http;destsuffix=dvb-apps/initial-scan-tables;name=scantables \
+          "
+SRCREV_apps = "3d43b280298c"
+SRCREV_scantables = "ceb11833b35f05813b1f0397a60e0f3b99430aab"
+SRCREV_FORMAT = "apps_scantables"
 
 S = "${WORKDIR}/${BPN}"
 
+TARGET_CC_ARCH += "${LDFLAGS}"
+EXTRA_OEMAKE = "VERSION_FILE='${STAGING_INCDIR}/linux/dvb/version.h'"
+
 do_configure() {
     sed -i -e s:/usr/include:${STAGING_INCDIR}:g util/av7110_loadkeys/generate-keynames.sh
 }
 
+do_compile_append() {
+# dvb-apps only support DVBAPI v3, so generate them from the DVBAPI v5 downloaded files
+    make -C initial-scan-tables clean
+    make -C initial-scan-tables dvbv3
+}
+
 do_install() {
     make DESTDIR=${D} install
+# dvb-apps only support DVBAPI v3, so only install the generated DVBAPI v3 files
+    make -C initial-scan-tables DATADIR=${D}/${datadir} DVBV3DIR=dvb install_v3
+
     install -d ${D}/${bindir}
     install -d ${D}/${docdir}/dvb-apps
-    install -d ${D}/${docdir}/dvb-apps/scan
     install -d ${D}/${docdir}/dvb-apps/szap
     chmod a+rx ${D}/${libdir}/*.so*
 
@@ -89,7 +107,7 @@ FILES_dvbnet-dbg = "${bindir}/.debug/dvbnet"
 
 FILES_dvb-scan = "${bindir}/*scan "
 FILES_dvb-scan-dbg = "${bindir}/.debug/*scan"
-FILES_dvb-scan-data = "${docdir}/dvb-apps/scan"
+FILES_dvb-scan-data = "${datadir}/dvb"
 
 FILES_dvb-azap = "${bindir}/azap"
 FILES_dvb-azap-dbg = "${bindir}/.debug/azap"
-- 
2.7.4


