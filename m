Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id BE51972332
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jan 2015 22:20:03 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	t0GMK3I1027210 for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jan 2015 16:20:03 -0600
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2015011616200337-2096624 ;
	Fri, 16 Jan 2015 16:20:03 -0600 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Jan 2015 16:19:54 -0600
Message-Id: <1421446794-11403-1-git-send-email-ben.shelton@ni.com>
X-Mailer: git-send-email 2.2.2
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 01/16/2015 04:20:03 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 01/16/2015 04:20:03 PM,
	Serialize complete at 01/16/2015 04:20:03 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.13.68, 1.0.33,
	0.0.0000
	definitions=2015-01-16_08:2015-01-16, 2015-01-16,
	1970-01-01 signatures=0
Subject: [meta-oe][PATCH] msr-tools: add recipe
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
X-List-Received-Date: Fri, 16 Jan 2015 22:20:05 -0000

msr-tools provides the rdmsr and wrmsr tools to read and write Intel
model-specific registers on the x86 and x64 architectures.

Signed-off-by: Ben Shelton <ben.shelton@ni.com>
---
 meta-oe/recipes-devtools/msr-tools/msr-tools_1.3.bb | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/msr-tools/msr-tools_1.3.bb

diff --git a/meta-oe/recipes-devtools/msr-tools/msr-tools_1.3.bb b/meta-oe/recipes-devtools/msr-tools/msr-tools_1.3.bb
new file mode 100644
index 0000000..5544920
--- /dev/null
+++ b/meta-oe/recipes-devtools/msr-tools/msr-tools_1.3.bb
@@ -0,0 +1,21 @@
+SUMMARY = "utilies to read and write Intel model-specific registers"
+HOMEPAGE = "https://01.org/msr-tools"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://Makefile;beginline=1;endline=11;md5=678a3928c856042424c734f4a7586e65"
+SECTION = "devel"
+
+SRC_URI = "https://01.org/sites/default/files/downloads/msr-tools/msr-tools-${PV}.zip"
+SRC_URI[md5sum] = "67d18527f64fd707c9b7a79f13d19fd5"
+SRC_URI[sha256sum] = "f9457b5340f5f274da4239a461f0db6b514142b40461559d9c6150f05aab1d1e"
+
+S = "${WORKDIR}/msr-tools-master"
+
+COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
+
+do_install() {
+    install -d ${D}/${bindir}
+    install rdmsr ${D}/${bindir}/
+    install wrmsr ${D}/${bindir}/
+}
+
+FILES_${PN} += "${bindir}/*"
-- 
2.2.2


