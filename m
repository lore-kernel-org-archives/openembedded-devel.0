Return-Path: <max+openembedded@blarg.de>
Received: from swift.blarg.de (swift.blarg.de [78.47.110.205])
	by mail.openembedded.org (Postfix) with ESMTP id 6EFDC74599
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2018 08:35:57 +0000 (UTC)
Received: from heron.blarg.de (p3EE2FF12.dip0.t-ipconnect.de [62.226.255.18])
	(Authenticated sender: max)
	by swift.blarg.de (Postfix) with ESMTPSA id 00556220510;
	Tue, 18 Sep 2018 10:26:13 +0200 (CEST)
From: Max Kellermann <max+openembedded@blarg.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2018 10:26:00 +0200
Message-Id: <20180918082608.1088-1-max+openembedded@blarg.de>
X-Mailer: git-send-email 2.18.0
Cc: Max Kellermann <max.kellermann@gmail.com>
Subject: [PATCH 1/8] [meta-oe] devtools/php: remove the failing ${D}/${TMPDIR} code
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
X-List-Received-Date: Tue, 18 Sep 2018 08:35:58 -0000

From: Max Kellermann <max.kellermann@gmail.com>

Appending ${TMPDIR} to ${D} doesn't make any sense, because both are
absolute paths.  And additionally, the code fails:

 rmdir: failed to remove '/usr/src/oe/tmp-musl/work/core2-64-oe-linux-musl/php/7.1.9-r0/image//usr': Directory not empty

Signed-off-by: Max Kellermann <max.kellermann@gmail.com>
---
 meta-oe/recipes-devtools/php/php.inc | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index 65dfd2d89..120f678d7 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -139,7 +139,6 @@ do_install_append_class-target() {
     if [ -d ${RECIPE_SYSROOT_NATIVE}${sysconfdir} ];then
          install -m 0644 ${RECIPE_SYSROOT_NATIVE}${sysconfdir}/pear.conf ${D}${sysconfdir}/
     fi
-    rm -rf ${D}/${TMPDIR}
     rm -rf ${D}/.registry
     rm -rf ${D}/.channels
     rm -rf ${D}/.[a-z]*
@@ -164,14 +163,6 @@ do_install_append_class-target() {
             ${D}${systemd_unitdir}/system/php-fpm.service
     fi
 
-    TMP=`dirname ${D}/${TMPDIR}`
-    while test ${TMP} != ${D}; do
-        if [ -d ${TMP} ]; then
-            rmdir ${TMP}
-        fi
-        TMP=`dirname ${TMP}`;
-    done
-
     if ${@bb.utils.contains('PACKAGECONFIG', 'apache2', 'true', 'false', d)}; then
         install -d ${D}${libdir}/apache2/modules
         install -d ${D}${sysconfdir}/apache2/modules.d
-- 
2.18.0


