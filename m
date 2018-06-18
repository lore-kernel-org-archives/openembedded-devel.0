Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8869A74D58
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 23:37:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5INawIO028414
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 16:37:14 -0700
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Mon, 18 Jun 2018 16:36:48 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 18 Jun 2018 16:36:48 -0700
Message-ID: <20180618233648.42214-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH V4 1/1] syslog-ng: repackage json related conf files
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
X-List-Received-Date: Mon, 18 Jun 2018 23:37:23 -0000
Content-Type: text/plain

Only include conf files that need json if it is enabled
when building syslog-ng.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
index a0ae7bd..cf6a3de 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
@@ -93,10 +93,19 @@ do_install_append() {
 }
 
 FILES_${PN} += "${datadir}/include/scl/ ${datadir}/xsd ${datadir}/tools"
-RDEPENDS_${PN} += "gawk"
+RDEPENDS_${PN} += "gawk ${@bb.utils.contains('PACKAGECONFIG','json','${PN}-jconf','',d)}"
+
+FILES_${PN}-jconf += " \
+${datadir}/${BPN}/include/scl/cim \
+${datadir}/${BPN}/include/scl/elasticsearch \
+${datadir}/${BPN}/include/scl/ewmm \
+${datadir}/${BPN}/include/scl/graylog2 \
+${datadir}/${BPN}/include/scl/loggly \
+${datadir}/${BPN}/include/scl/logmatic \
+"
 
 # This overcomes the syslog-ng rdepends on syslog-ng-dev QA Error
-PACKAGES =+ "${PN}-libs ${PN}-libs-dev ${PN}-libs-dbg"
+PACKAGES =+ "${PN}-jconf ${PN}-libs ${PN}-libs-dev ${PN}-libs-dbg"
 FILES_${PN}-libs = "${libdir}/${BPN}/*.so ${libdir}/libsyslog-ng-*.so*"
 FILES_${PN}-libs-dev = "${libdir}/${BPN}/lib*.la"
 FILES_${PN}-libs-dbg = "${libdir}/${BPN}/.debug"
-- 
2.7.4


