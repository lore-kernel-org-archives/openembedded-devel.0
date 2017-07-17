Return-Path: <stanley.cheong.kwan.phoong@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2A4C277DB6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jul 2017 02:48:25 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jul 2017 19:48:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,372,1496127600"; d="scan'208";a="879545984"
Received: from phoongst-mobl2.png.intel.com ([10.221.22.197])
	by FMSMGA003.fm.intel.com with ESMTP; 16 Jul 2017 19:48:25 -0700
From: Stanley Phoong <stanley.cheong.kwan.phoong@intel.com>
To: OpenEmbedded Devel Mailing List <openembedded-devel@lists.openembedded.org>
Date: Mon, 17 Jul 2017 10:48:08 +0800
Message-Id: <1500259691-9782-7-git-send-email-stanley.cheong.kwan.phoong@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1500259691-9782-1-git-send-email-stanley.cheong.kwan.phoong@intel.com>
References: <1500259691-9782-1-git-send-email-stanley.cheong.kwan.phoong@intel.com>
Subject: [meta-openwrt][PATCH 6/9] Juci: replace yui-compressor with minify
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
X-List-Received-Date: Mon, 17 Jul 2017 02:48:25 -0000

From: "Stanley Cheong Kwan, Phoong" <stanley.cheong.kwan.phoong@intel.com>

yui-compressor was missing and it relies on Java, so converted the
dependency of Juci on yui-compressor to minify-js

Signed-off-by: Stanley Cheong Kwan, Phoong <stanley.cheong.kwan.phoong@intel.com>
---
 recipes-core/juci/juci/0002-fix-bootstrap.patch    | 15 +++++++++++++++
 recipes-core/juci/juci/0003-fix-juci-compile.patch | 16 ++++++++++++++++
 recipes-core/juci/juci_git.bb                      |  5 ++++-
 3 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 recipes-core/juci/juci/0002-fix-bootstrap.patch
 create mode 100644 recipes-core/juci/juci/0003-fix-juci-compile.patch

diff --git a/recipes-core/juci/juci/0002-fix-bootstrap.patch b/recipes-core/juci/juci/0002-fix-bootstrap.patch
new file mode 100644
index 0000000..af58bd2
--- /dev/null
+++ b/recipes-core/juci/juci/0002-fix-bootstrap.patch
@@ -0,0 +1,15 @@
+Index: git/scripts/bootstrap.sh
+===================================================================
+--- git.orig/scripts/bootstrap.sh
++++ git/scripts/bootstrap.sh
+@@ -9,8 +9,8 @@ if [ "$(which npm)" == "" ]; then
+ 	ERR=1
+ fi 
+ 
+-if [ "$(which yui-compressor)" == "" ] && [ "$(which yuicompressor)" == "" ]; then
+-	perr "!!! yui-compressor is missing. Please install package yui-compressor or yuicompressor."; 
++if [ "$(which minify)" == "" ]; then
++	perr "!!! minify is missing. Please install package minify."; 
+ 	ERR=1
+ fi 
+ 
diff --git a/recipes-core/juci/juci/0003-fix-juci-compile.patch b/recipes-core/juci/juci/0003-fix-juci-compile.patch
new file mode 100644
index 0000000..005ae58
--- /dev/null
+++ b/recipes-core/juci/juci/0003-fix-juci-compile.patch
@@ -0,0 +1,16 @@
+Index: git/scripts/juci-compile
+===================================================================
+--- git.orig/scripts/juci-compile
++++ git/scripts/juci-compile
+@@ -14,10 +14,6 @@ done
+ 
+ for file in `find $BIN/www/css/ -name "*.css"`; do 
+ 	echo "Compiling CSS ${file}.."
+-	if [ "$(which yui-compressor)" != "" ]; then
+-		yui-compressor ${file} > ${file}.out
+-	else
+-		yuicompressor ${file} > ${file}.out
+-	fi
++	minify ${file} > ${file}.out
+ 	mv ${file}.out ${file}
+ done
diff --git a/recipes-core/juci/juci_git.bb b/recipes-core/juci/juci_git.bb
index dde8f73..e6977ca 100644
--- a/recipes-core/juci/juci_git.bb
+++ b/recipes-core/juci/juci_git.bb
@@ -10,12 +10,14 @@ SECTION = "apps"
 SRCREV = "b173dba22fbd9891bc5e3a55f8b40ba562f38e31"
 SRC_URI = "git://github.com/mkschreder/juci"
 SRC_URI += "file://0001-juci-pin-grunt-to-0.4.1-for-grunt-angular-gettext.patch"
+SRC_URI += "file://0002-fix-bootstrap.patch"
+SRC_URI += "file://0003-fix-juci-compile.patch"
 
 S = "${WORKDIR}/git"
 
 inherit npm-install
 
-NPM_INSTALL_append = " --save uglify-js less"
+NPM_INSTALL_append = " --save uglify-js less minify"
 DEPENDS += "jucid lua5.1 grunt-cli-native"
 
 do_compile() {
@@ -25,6 +27,7 @@ do_compile() {
 do_compile_append(){
         ln -sf ${WORKDIR}/git/node_modules/uglify-js/bin/uglifyjs ${WORKDIR}/recipe-sysroot-native/usr/bin/uglifyjs
         ln -sf ${WORKDIR}/git/node_modules/less/bin/lessc ${WORKDIR}/recipe-sysroot-native/usr/bin/lessc
+        ln -sf ${WORKDIR}/git/node_modules/.bin/minify ${WORKDIR}/recipe-sysroot-native/usr/bin/minify
 }
 
 do_install_append() {
-- 
2.7.4


