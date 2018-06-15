Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B96416E5CB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jun 2018 18:21:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w5FIL5Li025736
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jun 2018 11:21:06 -0700 (PDT)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Fri, 15 Jun 2018 11:21:05 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 15 Jun 2018 11:21:05 -0700
Message-ID: <20180615182105.727-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH V2 1/1] syslog-ng: fix build without json
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
X-List-Received-Date: Fri, 15 Jun 2018 18:21:05 -0000
Content-Type: text/plain

Remove configurations requiring json from target.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
index cb7ca31..6c5adbd 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
@@ -85,6 +85,13 @@ do_install_append() {
     install -d ${D}/${localstatedir}/lib/${BPN}
     # Remove /var/run as it is created on startup
     rm -rf ${D}${localstatedir}/run
+
+    # If json is not supported, remove certain conf files.
+    if ${@bb.utils.contains('PACKAGECONFIG','json','false','true',d)} ; then
+        for f in loggly logmatic cim elasticsearch ; do
+            rm -rf ${D}${datadir}/${BPN}/include/scl/$f
+        done
+    fi
 }
 
 FILES_${PN} += "${datadir}/include/scl/ ${datadir}/xsd ${datadir}/tools"
-- 
2.7.4


