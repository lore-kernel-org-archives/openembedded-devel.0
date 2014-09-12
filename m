Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9FD9860809
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Sep 2014 23:04:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8CN4JcY021080
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Sep 2014 16:04:19 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Fri, 12 Sep 2014 16:04:18 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 12 Sep 2014 16:04:18 -0700
Message-ID: <1410563058-3288-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/1] ptpd: update to version 2.3.1-rc2
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
X-List-Received-Date: Fri, 12 Sep 2014 23:04:22 -0000
Content-Type: text/plain

Add a little processing to find correct directory
for source upstream.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../ptpd/{ptpd_2.3.0.bb => ptpd_2.3.1-rc2.bb}      |   23 ++++++++++++++++---
 1 files changed, 19 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-daemons/ptpd/{ptpd_2.3.0.bb => ptpd_2.3.1-rc2.bb} (58%)

diff --git a/meta-networking/recipes-daemons/ptpd/ptpd_2.3.0.bb b/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb
similarity index 58%
rename from meta-networking/recipes-daemons/ptpd/ptpd_2.3.0.bb
rename to meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb
index 54679dc..2a23995 100644
--- a/meta-networking/recipes-daemons/ptpd/ptpd_2.3.0.bb
+++ b/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb
@@ -5,18 +5,33 @@ and PTP Version 2 implements IEEE-1588-2008. PTP was developed to provide very p
 time coordination of LAN connected computers."
 HOMEPAGE = "http://sourceforge.net/projects/ptpd"
 SECTION = "network"
+
+# COPYRIGHT is gone, but maybe it will come back
+#
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4019cad2b3cd55f22ea819ffad6ccd41"
+#LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4019cad2b3cd55f22ea819ffad6ccd41"
+LIC_FILES_CHKSUM = "file://README;md5=2452033fe374283f29579898663b1aa8"
 
 DEPENDS = "libpcap"
 
 inherit autotools
 
-SRC_URI = "http://downloads.sourceforge.net/project/ptpd/ptpd/${PV}/ptpd-${PV}.tar.gz"
+# return something like '1.2.3' or '1.2.3/rc1'
+#
+def get_sub(d):
+    parts = d.getVar('PV',True).split('-')
+    try:
+        return parts[0] + '/' + parts[1]
+    except:
+        return parts[0]
+
+SRC_URI = "http://downloads.sourceforge.net/project/ptpd/ptpd/${@get_sub(d)}/ptpd-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "1ef2f1f2825080a865bbce0eb61246d4"
+SRC_URI[sha256sum] = "2802aab758649bb222859dfcb62a5d282709ccb4d3f1df3f26f739cc091d0c8d"
 
 S = "${WORKDIR}/ptpd-${PV}"
-SRC_URI[md5sum] = "f5e931b4a229705ff0dbdfe22490566b"
-SRC_URI[sha256sum] = "1a4e90496f004bfd91657ccc49209101dc25b787e540648c07c0973469f1d8f7"
+
 
 EXTRA_OEMAKE = ""
 
-- 
1.7.3.4


