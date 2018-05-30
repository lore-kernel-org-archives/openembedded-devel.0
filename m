Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8CD8474BEA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 17:18:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4UHI8lY019148
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 10:18:39 -0700
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 30 May 2018 10:18:10 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 30 May 2018 10:18:10 -0700
Message-ID: <20180530171810.205120-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/1] syslog-ng: fix build without json
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
X-List-Received-Date: Wed, 30 May 2018 17:18:49 -0000
Content-Type: text/plain

Remove configurations requiring json from target.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
index 771cdb1..a5e4e72 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
@@ -83,6 +83,11 @@ do_install_append() {
     install -d ${D}/${localstatedir}/lib/${BPN}
     # Remove /var/run as it is created on startup
     rm -rf ${D}${localstatedir}/run
+
+    # If json is not supported, remove certain conf files.
+    if ${@oe.utils.conditional('PACKAGECONFIG','json','false','true',d)} ; then
+        rm -rf ${D}${datadir}/${BPN}/include/scl/{loggly,logmatic,cim,elasticsearch}
+    fi
 }
 
 FILES_${PN} += "${datadir}/include/scl/ ${datadir}/xsd ${datadir}/tools"
-- 
2.7.4


