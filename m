Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 281D279659
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2018 15:58:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8HFw1pg006624
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Sep 2018 08:58:11 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Mon, 17 Sep 2018 08:57:50 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 18 Sep 2018 00:05:23 +0800
Message-ID: <9bc20afbf0efe3356ee8a9adcd167d108381a7fa.1537199591.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1537199591.git.hongxu.jia@windriver.com>
References: <cover.1537199591.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 14/19] lmsensors: split one dpg package
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
X-List-Received-Date: Mon, 17 Sep 2018 15:58:36 -0000
Content-Type: text/plain

Multiple -dbg packages per recipe is not encouraged, and only one is
recommended and the code only works properly in some cases for one.

Add RPROVIDES_${PN}-dbg to be compatiable with previous dbg packages
requiring.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-bsp/lm_sensors/lmsensors_3.4.0.bb | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.4.0.bb b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.4.0.bb
index f235469..ffab5d6 100644
--- a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.4.0.bb
+++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.4.0.bb
@@ -76,14 +76,16 @@ do_install() {
     fi
 }
 
+RPROVIDES_${PN}-dbg += "${PN}-libsensors-dbg ${PN}-sensors-dbg ${PN}-sensord-dbg ${PN}-isatools-dbg"
+
 # libsensors packages
-PACKAGES =+ "${PN}-libsensors ${PN}-libsensors-dbg ${PN}-libsensors-dev ${PN}-libsensors-staticdev ${PN}-libsensors-doc"
+PACKAGES =+ "${PN}-libsensors ${PN}-libsensors-dev ${PN}-libsensors-staticdev ${PN}-libsensors-doc"
 
 # sensors command packages
-PACKAGES =+ "${PN}-sensors ${PN}-sensors-dbg ${PN}-sensors-doc"
+PACKAGES =+ "${PN}-sensors ${PN}-sensors-doc"
 
 # sensord logging daemon
-PACKAGES =+ "${PN}-sensord ${PN}-sensord-dbg ${PN}-sensord-doc"
+PACKAGES =+ "${PN}-sensord ${PN}-sensord-doc"
 
 # fancontrol script
 PACKAGES =+ "${PN}-fancontrol ${PN}-fancontrol-doc"
@@ -98,11 +100,11 @@ PACKAGES =+ "${PN}-sensorsconfconvert ${PN}-sensorsconfconvert-doc"
 PACKAGES =+ "${PN}-pwmconfig ${PN}-pwmconfig-doc"
 
 # isadump and isaset helper program
-PACKAGES =+ "${PN}-isatools ${PN}-isatools-dbg ${PN}-isatools-doc"
+PACKAGES =+ "${PN}-isatools ${PN}-isatools-doc"
+
 
 # libsensors files
 FILES_${PN}-libsensors = "${libdir}/libsensors.so.* ${sysconfdir}/sensors3.conf ${sysconfdir}/sensors.d"
-FILES_${PN}-libsensors-dbg = "${libdir}/.debug ${prefix}/src/debug"
 FILES_${PN}-libsensors-dev = "${libdir}/libsensors.so ${includedir}"
 FILES_${PN}-libsensors-staticdev = "${libdir}/libsensors.a"
 FILES_${PN}-libsensors-doc = "${mandir}/man3"
@@ -110,13 +112,11 @@ RRECOMMENDS_${PN}-libsensors = "lmsensors-config-libsensors"
 
 # sensors command files
 FILES_${PN}-sensors = "${bindir}/sensors"
-FILES_${PN}-sensors-dbg = "${bindir}/.debug/sensors"
 FILES_${PN}-sensors-doc = "${mandir}/man1 ${mandir}/man5"
 RDEPENDS_${PN}-sensors = "${PN}-libsensors"
 
 # sensord logging daemon
 FILES_${PN}-sensord = "${sbindir}/sensord ${sysconfdir}/init.d/sensord ${systemd_unitdir}/system/sensord.service"
-FILES_${PN}-sensord-dbg = "${bindir}/.debug/sensord"
 FILES_${PN}-sensord-doc = "${mandir}/man8/sensord.8"
 RDEPENDS_${PN}-sensord = "${PN}-sensors rrdtool"
 RRECOMMENDS_${PN}-sensord = "lmsensors-config-sensord"
@@ -144,5 +144,4 @@ RDEPENDS_${PN}-pwmconfig = "${PN}-fancontrol"
 
 # isadump and isaset helper program files
 FILES_${PN}-isatools = "${sbindir}/isa*"
-FILES_${PN}-isatools-dbg = "${sbindir}/.debug/isa*"
 FILES_${PN}-isatools-doc = "${mandir}/man8/isa*"
-- 
2.7.4


