Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1684078837
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jan 2018 20:21:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w0AKL7U6004298
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jan 2018 12:21:08 -0800 (PST)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 10 Jan 2018 12:21:07 -0800
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 10 Jan 2018 12:21:07 -0800
Message-ID: <20180110202107.248032-1-jslater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/1] php-native: eliminate SSTATEPOSTINSTFUNCS use
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
X-List-Received-Date: Wed, 10 Jan 2018 20:21:07 -0000
Content-Type: text/plain

The use of SSTATEPOSTINSTFUNCS has been deprecated and is not
needed for php-native.  The current function always fails, forcing
a re-build of php-native.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta-oe/recipes-devtools/php/php.inc | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index 283d630..e466cda 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -253,18 +253,6 @@ do_install_append_class-native() {
         PHP_PEAR_SYSCONF_DIR=${sysconfdir}/
 }
 
-SSTATEPOSTINSTFUNCS_append_class-native = " php_sstate_postinst "
-
-php_sstate_postinst() {
-    if [ "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
-    then
-        head -n1 ${sysconfdir}/pear.conf > ${sysconfdir}/pear.tmp.conf
-        for p in `tail -n1  ${sysconfdir}/pear.conf | sed -s 's/;/ /g'`; do
-            echo $p | awk -F: 'BEGIN {OFS = ":"; ORS = ";"}{if(NF==3){print $1, length($3)-2*match($3, /^"/), $3} else {print $0}}';
-        done >> ${sysconfdir}/pear.tmp.conf
-        mv -f ${sysconfdir}/pear.tmp.conf ${sysconfdir}/pear.conf
-    fi
-}
 
 # Fails to build with thumb-1 (qemuarm)
 # | {standard input}: Assembler messages:
-- 
2.7.4


