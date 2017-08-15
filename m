Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D0015784CD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Aug 2017 22:58:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7FMwuFK028731
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Aug 2017 15:58:56 -0700
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 15 Aug 2017 15:58:55 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 15 Aug 2017 15:58:55 -0700
Message-ID: <20170815225855.81205-1-jslater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/1] php: disable this version by default
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
X-List-Received-Date: Tue, 15 Aug 2017 22:58:56 -0000
Content-Type: text/plain

There are many unaddressed CVEs which are fixed in 7.1.7
and later versions.  Allow the user to define php_5.6.26
to enable building the recipe.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta-oe/recipes-devtools/php/php_5.6.26.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-oe/recipes-devtools/php/php_5.6.26.bb b/meta-oe/recipes-devtools/php/php_5.6.26.bb
index dfce949..7e566b1 100644
--- a/meta-oe/recipes-devtools/php/php_5.6.26.bb
+++ b/meta-oe/recipes-devtools/php/php_5.6.26.bb
@@ -8,3 +8,12 @@ SRC_URI += "file://change-AC_TRY_RUN-to-AC_TRY_LINK.patch \
            "
 SRC_URI[md5sum] = "cb424b705cfb715fc04f499f8a8cf52e"
 SRC_URI[sha256sum] = "d47aab8083a4284b905777e1b45dd7735adc53be827b29f896684750ac8b6236"
+
+python () {
+    ver = d.getVar('PV')
+    if not d.getVar('php_'+ver+'_OK'):
+        msg = "%s disables itself because of many outstanding CVEs!" % (ver)
+        msg = msg + " Define php_%s_OK = '1' to build it." % (ver)
+        raise bb.parse.SkipPackage(msg)
+}
+
-- 
2.7.4


