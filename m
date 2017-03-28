Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DADDC77A0F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Mar 2017 08:13:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v2S8DcmU005783
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Mar 2017 01:13:40 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 28 Mar 2017 01:13:37 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 28 Mar 2017 04:13:36 -0400
Message-ID: <1490688816-180730-1-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH][meta-oe] php: fix install failure
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
X-List-Received-Date: Tue, 28 Mar 2017 08:13:41 -0000
Content-Type: text/plain

After switch to RSS(recipe specific sysroot), the php package failed when
installing.

This is because the build system can't find the file: pear.conf, that file
stay in "${D}/${STAGING_DIR_NATIVE}" directory before the switch, now stay
in "${RECIPE_SYSROOT_NATIVE}" directory, so we need to place it in correct
place.

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta-oe/recipes-devtools/php/php.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index c4fb1d9..b4ce2e3 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -136,9 +136,9 @@ do_install_prepend_class-target() {
 
 # fixme
 do_install_append_class-target() {
-    install -d ${D}/${sysconfdir}/
-    if [ -d ${D}/${STAGING_DIR_NATIVE}/${sysconfdir} ];then
-         mv ${D}/${STAGING_DIR_NATIVE}/${sysconfdir}/* ${D}/${sysconfdir}/
+    install -d ${D}${sysconfdir}/
+    if [ -d ${RECIPE_SYSROOT_NATIVE}${sysconfdir} ];then
+         install -m 0644 ${RECIPE_SYSROOT_NATIVE}${sysconfdir}/pear.conf ${D}${sysconfdir}/
     fi
     rm -rf ${D}/${TMPDIR}
     rm -rf ${D}/.registry
@@ -146,7 +146,7 @@ do_install_append_class-target() {
     rm -rf ${D}/.[a-z]*
     rm -rf ${D}/var
     rm -f  ${D}/${sysconfdir}/php-fpm.conf.default
-    sed -i 's:${STAGING_DIR_NATIVE}::g' ${D}/${sysconfdir}/pear.conf
+    sed -i 's:${STAGING_DIR_NATIVE}::g' ${D}${sysconfdir}/pear.conf
     install -m 0644 ${WORKDIR}/php-fpm.conf ${D}/${sysconfdir}/php-fpm.conf
     install -d ${D}/${sysconfdir}/apache2/conf.d
     install -m 0644 ${WORKDIR}/php-fpm-apache.conf ${D}/${sysconfdir}/apache2/conf.d/php-fpm.conf
-- 
2.8.1


