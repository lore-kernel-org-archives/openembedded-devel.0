Return-Path: <stanley.cheong.kwan.phoong@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 76A0D77DC8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jul 2017 02:48:28 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jul 2017 19:48:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,372,1496127600"; d="scan'208";a="879546000"
Received: from phoongst-mobl2.png.intel.com ([10.221.22.197])
	by FMSMGA003.fm.intel.com with ESMTP; 16 Jul 2017 19:48:29 -0700
From: Stanley Phoong <stanley.cheong.kwan.phoong@intel.com>
To: OpenEmbedded Devel Mailing List <openembedded-devel@lists.openembedded.org>
Date: Mon, 17 Jul 2017 10:48:11 +0800
Message-Id: <1500259691-9782-10-git-send-email-stanley.cheong.kwan.phoong@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1500259691-9782-1-git-send-email-stanley.cheong.kwan.phoong@intel.com>
References: <1500259691-9782-1-git-send-email-stanley.cheong.kwan.phoong@intel.com>
Subject: [meta-openwrt][PATCH 9/9] Juci: fix node_modules dependencies error
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
X-List-Received-Date: Mon, 17 Jul 2017 02:48:28 -0000

From: "Stanley Cheong Kwan, Phoong" <stanley.cheong.kwan.phoong@intel.com>

In the latest Juci build, Juci now has an offline node_modules that is
shipped together as a tar.gz. Some dependencies are not saved properly
inside the package.json which causes the npm shrinkwrap to file error.
This commit fixes this error.

Signed-off-by: Stanley Cheong Kwan, Phoong <stanley.cheong.kwan.phoong@intel.com>
---
 .../juci/juci/0006-package-json-update.patch       | 108 +++++++++++++++++++++
 recipes-core/juci/juci_git.bb                      |   5 +-
 2 files changed, 111 insertions(+), 2 deletions(-)
 create mode 100644 recipes-core/juci/juci/0006-package-json-update.patch

diff --git a/recipes-core/juci/juci/0006-package-json-update.patch b/recipes-core/juci/juci/0006-package-json-update.patch
new file mode 100644
index 0000000..68f45fc
--- /dev/null
+++ b/recipes-core/juci/juci/0006-package-json-update.patch
@@ -0,0 +1,108 @@
+Index: git/package.json
+===================================================================
+--- git.orig/package.json
++++ git/package.json
+@@ -18,7 +18,102 @@
+     "gettext-parser": "*",
+     "underscore": "*",
+     "ws": "*",
+-    "express-ws": "*"
++    "express-ws": "*",
++    "abbrev": "1.0.7",
++    "angular-gettext-tools": "2.1.11",
++    "espree": "2.2.5",
++    "argparse": "1.0.7",
++    "array-find-index": "1.0.1",
++    "binary-search": "1.2.0",
++    "boolbase": "1.0.0",
++    "builtin-modules": "1.1.1",
++    "camelcase": "2.1.1",
++    "camelcase-keys": "2.1.0",
++    "cheerio": "0.19.0",
++    "coffee-script": "1.10.0",
++    "colors": "1.1.2",
++    "css-select": "1.0.0",
++    "css-what": "1.0.0",
++    "dateformat": "1.0.12",
++    "decamelize": "1.2.0",
++    "dom-serializer": "0.1.0",
++    "domelementtype": "1.1.3",
++    "domelementtype": "1.3.0",
++    "domhandler": "2.3.0",
++    "domutils": "1.4.3",
++    "entities": "1.1.1",
++    "error-ex": "1.3.0",
++    "espree": "2.2.5",
++    "esprima": "2.7.2",
++    "eventemitter2": "0.4.14",
++    "exit": "0.1.2",
++    "find-up": "1.1.2",
++    "findup-sync": "0.3.0",
++    "glob": "7.0.3",
++    "get-stdin": "4.0.1",
++    "getobject": "0.1.0",
++    "grunt": "1.0.0",
++    "grunt-cli": "1.2.0",
++    "grunt-angular-gettext": "2.1.11",
++    "grunt-known-options": "1.1.0",
++    "grunt-legacy-log": "1.0.0",
++    "grunt-legacy-log-utils": "1.0.0",
++    "lodash": "4.3.0",
++    "grunt-legacy-util": "1.0.0",
++    "lodash": "4.3.0",
++    "hooker": "0.2.3",
++    "hosted-git-info": "2.1.4",
++    "htmlparser2": "3.8.3",
++    "indent-string": "2.1.0",
++    "is-absolute": "0.1.7",
++    "is-arrayish": "0.2.1",
++    "is-builtin-module": "1.0.0",
++    "is-finite": "1.0.1",
++    "is-relative": "0.1.3",
++    "is-utf8": "0.2.1",
++    "isarray": "0.0.1",
++    "isexe": "1.1.2",
++    "js-yaml": "3.5.5",
++    "karma": ">=0.12.8",
++    "load-json-file": "1.1.0",
++    "lodash": "3.10.1",
++    "lodash._isnative": "2.4.1",
++    "lodash.isarray": "2.4.1",
++    "loud-rejection": "1.3.0",
++    "map-obj": "1.0.1",
++    "meow": "3.7.0",
++    "minimist": "1.2.0",
++    "nopt": "3.0.6",
++    "normalize-package-data": "2.3.5",
++    "nth-check": "1.0.1",
++    "number-is-nan": "1.0.0",
++    "options": "0.0.6",
++    "parse-json": "2.2.0",
++    "path-exists": "2.1.0",
++    "path-type": "1.1.0",
++    "pify": "2.3.0",
++    "pofile": "1.0.2",
++    "read-pkg": "1.1.0",
++    "read-pkg-up": "1.0.1",
++    "readable-stream": "1.1.13",
++    "redent": "1.0.0",
++    "repeating": "2.0.0",
++    "resolve": "1.1.7",
++    "rimraf": "2.2.8",
++    "semver": "5.1.0",
++    "signal-exit": "2.1.2",
++    "spdx-correct": "1.0.2",
++    "spdx-exceptions": "1.0.4",
++    "spdx-expression-parse": "1.0.2",
++    "spdx-license-ids": "1.2.0",
++    "sprintf-js": "1.0.3",
++    "strip-bom": "2.0.0",
++    "strip-indent": "1.0.1",
++    "trim-newlines": "1.0.0",
++    "ultron": "1.0.2",
++    "underscore.string": "3.2.3",
++    "validate-npm-package-license": "3.0.1",
++    "which": "1.2.4"
+   },
+   "engines": {
+     "node": "0.10.x",
diff --git a/recipes-core/juci/juci_git.bb b/recipes-core/juci/juci_git.bb
index c79c064..4c7cc1c 100644
--- a/recipes-core/juci/juci_git.bb
+++ b/recipes-core/juci/juci_git.bb
@@ -12,13 +12,14 @@ SRC_URI = "git://github.com/mkschreder/juci"
 SRC_URI += "file://0002-fix-bootstrap.patch"
 SRC_URI += "file://0003-fix-juci-compile.patch"
 SRC_URI += "file://0005-makefile-local.patch"
+SRC_URI += "file://0006-package-json-update.patch"
 
 S = "${WORKDIR}/git"
 
 inherit npm-install
 
-NPM_INSTALL_append = " --save uglify-js less minify"
-DEPENDS += "jucid lua5.1 grunt-cli-native"
+NPM_INSTALL_append = " --save uglify-js less minify espree grunt-cli karma grunt@~0.4.1"
+DEPENDS += "jucid lua5.1 grunt-cli-native gettext-native"
 
 do_compile() {
 	oe_runmake node_modules
-- 
2.7.4


