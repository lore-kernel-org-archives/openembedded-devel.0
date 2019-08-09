Return-Path: <andrej.valek@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id EA61D7F270
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Aug 2019 06:17:48 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x796HmRe009601
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 9 Aug 2019 08:17:49 +0200
Received: from dev.vm6.ccp.siemens.com ([163.242.58.54])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id x796Hmaa022872;
	Fri, 9 Aug 2019 08:17:48 +0200
Received: from dev.localdomain (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 1BE4898021E;
	Fri,  9 Aug 2019 08:17:48 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Aug 2019 08:17:42 +0200
Message-Id: <20190809061742.3749-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190806064731.17490-1-andrej.valek@siemens.com>
References: <20190806064731.17490-1-andrej.valek@siemens.com>
Subject: [meta-oe][PATCH v3] nodejs: 10.16.0 -> 10.16.2
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
X-List-Received-Date: Fri, 09 Aug 2019 06:17:49 -0000

- update nodejs to active 10.x LTS release 10.16.2.
- add python running dependency due to samples.py requirements

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 .../nodejs/{nodejs_10.16.0.bb => nodejs_10.16.2.bb}                 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_10.16.0.bb => nodejs_10.16.2.bb} (94%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_10.16.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_10.16.2.bb
similarity index 94%
rename from meta-oe/recipes-devtools/nodejs/nodejs_10.16.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_10.16.2.bb
index aaa1da0aa..e259c45be 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_10.16.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_10.16.2.bb
@@ -23,8 +23,8 @@ SRC_URI_append_class-target = " \
            file://0002-Using-native-torque.patch \
            "
 
-SRC_URI[md5sum] = "c9a7ab43f8b50c8a4d5545de307b7540"
-SRC_URI[sha256sum] = "18e37f891d10ea7fbc8f6410c444c2b1d9cc3cbbb1d35aa9c41f761816956608"
+SRC_URI[md5sum] = "fa70b942c5e3379ce96219fe90f50c8f"
+SRC_URI[sha256sum] = "6cbc17795e9259dce7a8f5fd5a2e46f9e6920fb48b7d9539c5b2faa5bb5db4d8"
 
 S = "${WORKDIR}/node-v${PV}"
 
@@ -100,7 +100,7 @@ do_install_append_class-target() {
 
 PACKAGES =+ "${PN}-npm"
 FILES_${PN}-npm = "${exec_prefix}/lib/node_modules ${bindir}/npm ${bindir}/npx"
-RDEPENDS_${PN}-npm = "bash python-shell python-datetime python-subprocess python-textutils \
+RDEPENDS_${PN}-npm = "bash python python-shell python-datetime python-subprocess python-textutils \
     python-compiler python-misc python-multiprocessing"
 
 PACKAGES =+ "${PN}-systemtap"
-- 
2.11.0


