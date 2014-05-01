Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 5DAD761012
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 May 2014 10:38:28 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 01 May 2014 03:38:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,964,1389772800"; d="scan'208";a="426307835"
Received: from abamaras-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.26])
	by azsmga001.ch.intel.com with ESMTP; 01 May 2014 03:38:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 May 2014 11:38:17 +0100
Message-Id: <dd48db4297a957faae2cf18c8831e7c86dd9e347.1398940635.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1398940635.git.paul.eggleton@linux.intel.com>
References: <cover.1398940635.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1398940635.git.paul.eggleton@linux.intel.com>
References: <cover.1398940635.git.paul.eggleton@linux.intel.com>
Subject: [meta-webserver][PATCH 1/2] modphp: fix for S != B
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
X-List-Received-Date: Thu, 01 May 2014 10:38:30 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-webserver/recipes-php/modphp/modphp5.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-webserver/recipes-php/modphp/modphp5.inc b/meta-webserver/recipes-php/modphp/modphp5.inc
index d646fd1..a1d550d 100644
--- a/meta-webserver/recipes-php/modphp/modphp5.inc
+++ b/meta-webserver/recipes-php/modphp/modphp5.inc
@@ -51,8 +51,8 @@ PACKAGECONFIG[pgsql] = "--with-pgsql=${STAGING_DIR_TARGET}${exec_prefix},--witho
 acpaths = ""
 
 do_configure_prepend () {
-    rm -f build/libtool.m4 ltmain.sh aclocal.m4
-    find . -name config.m4 | xargs -n1 sed -i 's!APXS_HTTPD=.*!APXS_HTTPD=${STAGING_BINDIR_NATIVE}/httpd!'
+    rm -f ${S}/build/libtool.m4 ${S}/ltmain.sh ${S}/aclocal.m4
+    find ${S} -name config.m4 | xargs -n1 sed -i 's!APXS_HTTPD=.*!APXS_HTTPD=${STAGING_BINDIR_NATIVE}/httpd!'
 }
 
 do_configure_append() {
@@ -76,7 +76,7 @@ do_install  () {
     install -m 755 scripts/phpize ${D}${bindir}
     install -m 755 scripts/php-config ${D}${bindir}
     cat aclocal-copy/libtool.m4 aclocal-copy/lt~obsolete.m4 aclocal-copy/ltoptions.m4 \
-        aclocal-copy/ltsugar.m4 aclocal-copy/ltversion.m4 > build/libtool.m4
+        aclocal-copy/ltsugar.m4 aclocal-copy/ltversion.m4 > ${S}/build/libtool.m4
 
     oe_runmake install-build install-headers INSTALL_ROOT=${D}
 }
-- 
1.9.0


