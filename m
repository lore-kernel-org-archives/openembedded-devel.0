Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 908646EE66
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Mar 2014 20:38:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2RKcvTp010593
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Mar 2014 13:38:57 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Thu, 27 Mar 2014 13:38:56 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <joe.macdonald@windriver.com>
Date: Thu, 27 Mar 2014 13:38:56 -0700
Message-ID: <1395952736-2793-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [meta-webserver][PATCH] modphp: add phpize to scan for absolute paths
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
X-List-Received-Date: Thu, 27 Mar 2014 20:38:58 -0000
Content-Type: text/plain

sstate processing for items in sysroot scans certain
file name patterns for absolute paths to be adjusted
when items are installed into sysroot from sstate.
phpize is not one of these patterns (surprise!) so we
add it to the list.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 recipes-php/modphp/modphp5.inc |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/recipes-php/modphp/modphp5.inc b/recipes-php/modphp/modphp5.inc
index 8bb27c7..33208bd 100644
--- a/recipes-php/modphp/modphp5.inc
+++ b/recipes-php/modphp/modphp5.inc
@@ -93,6 +93,10 @@ php_sysroot_preprocess () {
     sed -i 's!^include_dir=.*!include_dir=${STAGING_INCDIR}/php!' ${SYSROOT_DESTDIR}${bindir_crossscripts}/php-config
 }
 
+# phpize is not scanned for absolute paths by default (but php-config is).
+#
+SSTATE_SCAN_FILES += "phpize"
+
 RDEPENDS_${PN} = "apache2"
 
 FILES_${PN} = "${libdir}/apache2 ${sysconfdir}"
-- 
1.7.3.4


