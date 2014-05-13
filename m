Return-Path: <misn@enea.com>
Received: from mx-3.enea.com (unknown [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 4620161FE4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 16:14:20 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 13 May 2014 18:14:21 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4351)	id 646062800C6;
	Tue, 13 May 2014 18:14:21 +0200 (CEST)
From: Mihaela Sendrea <mihaela.sendrea@enea.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 13 May 2014 18:14:19 +0200
Message-ID: <1399997660-12190-1-git-send-email-mihaela.sendrea@enea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: mihaela.sendrea@enea.com does not
	designate permitted sender hosts)
Subject: [meta-networking][PATCH v5 1/2] lksctp-tools: add recipe (version 1.0.16)
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
X-List-Received-Date: Tue, 13 May 2014 16:14:28 -0000
Content-Type: text/plain

This recipe comes from arago-oe-dev:
https://github.com/mrchapp/arago-oe-dev/tree/master/recipes/lksctp-tools

Signed-off-by: Mihaela Sendrea <mihaela.sendrea@enea.com>
---
 .../lksctp-tools/lksctp-tools_1.0.16.bb            | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb

diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb
new file mode 100644
index 0000000..102c2bb
--- /dev/null
+++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb
@@ -0,0 +1,43 @@
+SUMMARY = "The Linux Kernel Stream Control Transmission Protocol (lksctp) project"
+SECTION = "libs"
+LICENSE = "LGPLv2"
+
+LIC_FILES_CHKSUM = " \
+    file://COPYING.lib;md5=0a1b79af951c42a9c8573533fbba9a92 \
+    file://COPYING;md5=0c56db0143f4f80c369ee3af7425af6e \
+"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/lksctp/${BP}.tar.gz"
+
+SRC_URI[md5sum] = "708bb0b5a6806ad6e8d13c55b067518e"
+SRC_URI[sha256sum] = "0903dd526b7f30a89d5031aa2c82757612becc38ed7bc6e4f972f8deae351f26"
+
+S = "${WORKDIR}/${BP}"
+
+BBCLASSEXTEND = "native"
+
+inherit autotools pkgconfig binconfig
+
+SOLIBVERSION="${PV}"
+SOLIBMAJORVERSION="1"
+
+PACKAGES =+ "${PN}-withsctp ${PN}-utils"
+
+FILES_${PN} = " \
+    ${libdir}/libsctp.so.${SOLIBVERSION} \
+"
+
+FILES_${PN}-withsctp = " \
+    ${libdir}/lksctp-tools/libwithsctp.so.${SOLIBVERSION} \
+"
+
+FILES_${PN}-dev += " \
+    ${libdir}/libsctp.so.${SOLIBMAJORVERSION} \
+    ${libdir}/libsctp.so \
+    ${libdir}/lksctp-tools/libwithsctp.so.${SOLIBMAJORVERSION} \
+    ${libdir}/lksctp-tools/libwithsctp.so \
+    ${datadir}/lksctp-tools/*.c \
+    ${datadir}/lksctp-tools/*.h \
+"
+
+FILES_${PN}-utils = "${bindir}/*"
-- 
1.8.5.3


