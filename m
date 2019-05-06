Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9651E6D9B6
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 May 2019 02:14:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x462EHPt007205
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 5 May 2019 19:14:17 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Sun, 5 May 2019 19:14:17 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 6 May 2019 10:14:15 +0800
Message-ID: <1557108855-391721-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] php: correct httpd path
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
X-List-Received-Date: Mon, 06 May 2019 02:14:16 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Configuration:
IMAGE_INSTALL_append = " modphp apache2 phpmyadmin xdebug"
PACKAGECONFIG_append_pn-php = " apache2"

Apache2 service start up with error:
[php7:crit] [pid 3943:tid 140477147074880] Apache is running a threaded MPM,
but your PHP Module is not compiled to be threadsafe.

Fix:
after apache2 is upgraded from 2.4.34 to 2.4.39, apache2-native
installs httpd into STAGING_SBINDIR_NATIVE, correct it so that
ZTS feature is open, and php is compiled to be threadsafe.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-devtools/php/php.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index 6f893ad..785c2f5 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -102,7 +102,7 @@ acpaths = ""
 
 do_configure_prepend () {
     rm -f ${S}/build/libtool.m4 ${S}/ltmain.sh ${S}/aclocal.m4
-    find ${S} -name config.m4 | xargs -n1 sed -i 's!APXS_HTTPD=.*!APXS_HTTPD=${STAGING_BINDIR_NATIVE}/httpd!'
+    find ${S} -name config.m4 | xargs -n1 sed -i 's!APXS_HTTPD=.*!APXS_HTTPD=${STAGING_SBINDIR_NATIVE}/httpd!'
 }
 
 do_configure_append() {
-- 
2.7.4


