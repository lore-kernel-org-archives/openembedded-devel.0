Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D5EAE60125
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2015 05:49:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8U5n5XT002068
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Sep 2015 22:49:05 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 29 Sep 2015 22:49:04 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 30 Sep 2015 01:49:03 -0400
Message-ID: <1443592143-14166-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-webserver] apache2: cleanup buildpaths for target stuffs
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
X-List-Received-Date: Wed, 30 Sep 2015 05:49:06 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Those buildpaths were generated from configure substitutions, they are
required for cross-compiling, but obviously they should be cleaned up
from target stuffs.

Cleanup buildpaths from config_vars.mk and config.nice:

* remove ${STAGING_DIR_HOST} from CC, CFLAGS ...
* set APU_INCLUDEDIR, APU_CONFIG as empty
* remove buildpath from configure line

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.16.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.16.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.16.bb
index a44babd..af5c72a 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.16.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.16.bb
@@ -97,6 +97,15 @@ do_install_append() {
     sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' ${D}${systemd_unitdir}/system/apache2.service
 }
 
+do_install_append_class-target() {
+    sed -i -e 's,${STAGING_DIR_HOST},,g' \
+           -e 's,APU_INCLUDEDIR = .*,APU_INCLUDEDIR = ,g' \
+           -e 's,APU_CONFIG = .*,APU_CONFIG = ,g' ${D}${datadir}/apache2/build/config_vars.mk
+
+    sed -i -e 's,${STAGING_DIR_HOST},,g' \
+           -e 's,".*/configure","configure",g' ${D}${datadir}/apache2/build/config.nice
+}
+
 SYSROOT_PREPROCESS_FUNCS += "apache_sysroot_preprocess"
 
 apache_sysroot_preprocess () {
-- 
1.9.1


