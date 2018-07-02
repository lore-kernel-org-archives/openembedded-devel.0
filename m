Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id E40927891D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Jul 2018 13:24:42 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id w62DOgDu013126
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 2 Jul 2018 15:24:42 +0200
Received: from dev.vm6.ccp.siemens.com (MD1FZU9C.ad001.siemens.net
	[139.16.76.87])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id w62DOgRt013811;
	Mon, 2 Jul 2018 15:24:42 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 2862510CCDAD;
	Mon,  2 Jul 2018 15:24:42 +0200 (CEST)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Jul 2018 15:24:34 +0200
Message-Id: <20180702132434.12029-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH] nodejs: update to 8.11.3
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
X-List-Received-Date: Mon, 02 Jul 2018 13:24:43 -0000

Fixes the following CVEs:
- CVE-2018-7167
- CVE-2018-7161
- CVE-2018-1000168

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 .../recipes-devtools/nodejs/{nodejs_8.11.2.bb => nodejs_8.11.3.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_8.11.2.bb => nodejs_8.11.3.bb} (96%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_8.11.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_8.11.3.bb
similarity index 96%
rename from meta-oe/recipes-devtools/nodejs/nodejs_8.11.2.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_8.11.3.bb
index 4e81b0392..4017d9284 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_8.11.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_8.11.3.bb
@@ -12,8 +12,8 @@ COMPATIBLE_MACHINE_mips64 = "(!.*mips64).*"
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0001-Disable-running-gyp-files-for-bundled-deps.patch \
 "
-SRC_URI[md5sum] = "56be405b63b8c6c8ecd98c002fb15e4a"
-SRC_URI[sha256sum] = "539946c0381809576bed07424a35fc1740d52f4bd56305d6278d9e76c88f4979"
+SRC_URI[md5sum] = "6cb0e19089ad13a4ec02640b604d2e0f"
+SRC_URI[sha256sum] = "577c751fdca91c46c60ffd8352e5b465881373bfdde212c17c3a3c1bd2616ee0"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.11.0


