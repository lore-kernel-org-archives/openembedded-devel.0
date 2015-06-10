Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CE106732B1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jun 2015 08:51:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5A8pMVl024819
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jun 2015 01:51:22 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Wed, 10 Jun 2015 01:51:22 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 10 Jun 2015 16:44:44 +0800
Message-ID: <1433925884-25750-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-oe] php: fix native php when it is from sstate
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
X-List-Received-Date: Wed, 10 Jun 2015 08:51:22 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

the native php is used to install the target pear, and native php
has hard-code path, so make wrapper to override the hard-code path

the configuration format of pear.conf for native php is like:
"type:path length:path", path will be replaced when populate sysroot
setscene, but the path length is not changed, and make php unable to
work, add a task to SSTATEPOSTINSTFUNCS to fix the path length

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-oe/recipes-devtools/php/php_5.5.24.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta-oe/recipes-devtools/php/php_5.5.24.bb b/meta-oe/recipes-devtools/php/php_5.5.24.bb
index 3e656af..ced3904 100644
--- a/meta-oe/recipes-devtools/php/php_5.5.24.bb
+++ b/meta-oe/recipes-devtools/php/php_5.5.24.bb
@@ -245,3 +245,21 @@ MODPHP_OLDPACKAGE = "${@bb.utils.contains('PACKAGECONFIG', 'apache2', 'modphp',
 RPROVIDES_${PN}-modphp = "${MODPHP_OLDPACKAGE}"
 RREPLACES_${PN}-modphp = "${MODPHP_OLDPACKAGE}"
 RCONFLICTS_${PN}-modphp = "${MODPHP_OLDPACKAGE}"
+
+do_install_append_virtclass-native() {
+    create_wrapper ${D}${bindir}/php \
+        PHP_PEAR_SYSCONF_DIR=${sysconfdir}/
+}
+
+SSTATEPOSTINSTFUNCS_append_virtclass-native += " php_sstate_postinst"
+
+php_sstate_postinst() {
+    if [ "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
+    then
+        head -n1 ${sysconfdir}/pear.conf > ${sysconfdir}/pear.tmp.conf
+        for p in `tail -n1  ${sysconfdir}/pear.conf | sed -s 's/;/ /g'`; do
+            echo $p | awk -F: 'BEGIN {OFS = ":"; ORS = ";"}{if(NF==3){print $1, length($3)-2*match($3, /^"/), $3} else {print $0}}';
+        done >> ${sysconfdir}/pear.tmp.conf
+        mv -f ${sysconfdir}/pear.tmp.conf ${sysconfdir}/pear.conf
+    fi
+}
-- 
1.9.1


