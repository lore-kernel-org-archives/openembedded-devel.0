Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E606B74050
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jun 2015 07:48:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t547mM8S005861
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 4 Jun 2015 00:48:22 -0700 (PDT)
Received: from localhost (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Thu, 4 Jun 2015 00:48:22 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 4 Jun 2015 15:48:12 +0800
Message-ID: <e819b28e36860ca55195d58e5279ee699c5f45ef.1433403866.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1433403866.git.yi.zhao@windriver.com>
References: <cover.1433403866.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.163.137]
Subject: [meta-oe][PATCH 2/3] nodejs: fix build failure for multilib
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
X-List-Received-Date: Thu, 04 Jun 2015 07:48:21 -0000
Content-Type: text/plain

bitbake nodejs
[snip]
sed: can't read /buildarea2/build/tmp/work/core2-64-poky-linux/nodejs/0.12.4-r0/image/usr/lib64/node_modules/npm/bin/npm-cli.js:
No such file or directory
[snip]

The node modules are not binary files. It doesn't make sense to install
them to /usr/lib64.
Use /usr/lib/node_modules instead of /usr/lib64/node_modules even on
multilib.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_0.12.4.bb |    9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.12.4.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.12.4.bb
index 4e1ba1f..81b8c0d 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_0.12.4.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.12.4.bb
@@ -61,20 +61,17 @@ do_install_append_class-native() {
     # /usr/bin/npm is symlink to /usr/lib/node_modules/npm/bin/npm-cli.js
     # use sed on npm-cli.js because otherwise symlink is replaced with normal file and
     # npm-cli.js continues to use old shebang
-    sed "1s^.*^#\!/usr/bin/env node^g" -i ${D}${libdir}/node_modules/npm/bin/npm-cli.js
+    sed "1s^.*^#\!/usr/bin/env node^g" -i ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js
 }
 
 do_install_append_class-target() {
-    sed "1s^.*^#\!${bindir}/env node^g" -i ${D}${libdir}/node_modules/npm/bin/npm-cli.js
+    sed "1s^.*^#\!${bindir}/env node^g" -i ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js
 }
 
 PACKAGES =+ "${PN}-npm"
-FILES_${PN}-npm = "${libdir}/node_modules ${bindir}/npm"
+FILES_${PN}-npm = "${exec_prefix}/lib/node_modules ${bindir}/npm"
 RDEPENDS_${PN}-npm = "bash python-shell python-datetime python-subprocess python-textutils"
 
-PACKAGES =+ "${PN}-dtrace"
-FILES_${PN}-dtrace = "${libdir}/dtrace"
-
 PACKAGES =+ "${PN}-systemtap"
 FILES_${PN}-systemtap = "${datadir}/systemtap"
 
-- 
1.7.9.5


