Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 94FEC703C1
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Jul 2014 08:43:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s688hweS015414
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 8 Jul 2014 01:43:58 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.137) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 8 Jul 2014 01:43:57 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 8 Jul 2014 16:44:02 +0800
Message-ID: <1404809042-10815-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH][meta-oe] memstat: add memstat recipe
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
X-List-Received-Date: Tue, 08 Jul 2014 08:44:08 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-oe/recipes-devtools/memstat/memstat_1.0.bb |   24 +++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/memstat/memstat_1.0.bb

diff --git a/meta-oe/recipes-devtools/memstat/memstat_1.0.bb b/meta-oe/recipes-devtools/memstat/memstat_1.0.bb
new file mode 100644
index 0000000..8c8882e
--- /dev/null
+++ b/meta-oe/recipes-devtools/memstat/memstat_1.0.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Display virtual memory allocation"
+DESCRIPTION = "Lists all the processes, executables, and shared libraries \
+that are using up virtual memory. It's helpful to see how the shared memory \
+is used and which 'old' libs are loaded. "
+HOMEPAGE = "http://memstattool.sourceforge.net/"
+SECTION = "devtool"
+
+LICENSE = "GPLv2"
+
+S = "${WORKDIR}/memstattool"
+
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=87be186443b1ac2cfa466f475e1ee0cb"
+
+SRC_URI = "http://sourceforge.net/projects/memstattool/files/${BPN}_${PV}.tar.gz \
+          "
+SRC_URI[md5sum] = "2c3acc0c62b2a18f6601b84e54aa7462"
+SRC_URI[sha256sum] = "245d5fc7fb87bcfd14486cd34917cae2856e799559ac568434af12c4852bce94"
+
+do_install_append(){
+    install -d ${D}${bindir}
+    install -m 0755 memstat ${D}${bindir}
+    install -d ${D}/etc
+    install -m 0755 memstat.conf ${D}/etc
+}
-- 
1.7.10.4


