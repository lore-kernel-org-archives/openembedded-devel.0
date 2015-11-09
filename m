Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DE9F376FC4
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Nov 2015 01:48:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tA91m8d4016653
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 8 Nov 2015 17:48:08 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Sun, 8 Nov 2015 17:48:08 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 9 Nov 2015 09:34:20 +0800
Message-ID: <1447032860-11864-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] rrdtool: install python site packages into libdir
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
X-List-Received-Date: Mon, 09 Nov 2015 01:48:11 -0000
Content-Type: text/plain

Fix the do_configure function to suite the latest version to install
python libraries into ${libdir}.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
index 666ace9..4d6318c 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
@@ -77,8 +77,8 @@ do_configure() {
     #remove the dependency of perl-shared:Makefile
     #or perl-shared/Makefile will be regenerated
     #if any code touch bindings/Makefile after below perl bindings code
-    sed -i -e "s:\$(PYTHON) setup.py install:\$(PYTHON) setup.py install \
-        --install-lib=${D}${PYTHON_SITEPACKAGES_DIR}:" \
+    sed -i -e "s:python/setup.py install:python/setup.py install \
+        --install-lib=${PYTHON_SITEPACKAGES_DIR}:" \
         -e "s:perl-shared/Makefile.PL Makefile:perl-shared/Makefile.PL:" \
         ${B}/bindings/Makefile
 
@@ -111,8 +111,8 @@ RDEPENDS_${PN}-perl = "perl perl-module-lib perl-module-getopt-long perl-module-
 
 DESCRIPTION_${PN}-python = \
 "The ${PN}-python package includes RRDtool bindings for python."
-FILES_${PN}-python = "${nonarch_libdir}/python${PYTHON_BASEVERSION}/site-packages/*"
+FILES_${PN}-python = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/*"
 RDEPENDS_${PN}-python = "python"
 
 FILES_${PN}-dbg += "${libdir}/perl/vendor_perl/*/auto/RRDs/.debug \
-    ${nonarch_libdir}/python${PYTHON_BASEVERSION}/site-packages/.debug"
+    ${libdir}/python${PYTHON_BASEVERSION}/site-packages/.debug"
-- 
1.9.1


