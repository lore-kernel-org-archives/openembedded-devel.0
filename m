Return-Path: <andrej.valek@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 0CFAD6C50E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Dec 2018 15:13:25 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id wB3FDPCs016520
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 3 Dec 2018 16:13:26 +0100
Received: from dev.vm6.ccp.siemens.com ([163.242.53.42])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id wB3FDPnn009902;
	Mon, 3 Dec 2018 16:13:25 +0100
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 7716395179E;
	Mon,  3 Dec 2018 16:13:25 +0100 (CET)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Dec 2018 16:13:18 +0100
Message-Id: <20181203151318.8401-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH] nodejs: 8.12.0 -> 8.14.0
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
X-List-Received-Date: Mon, 03 Dec 2018 15:13:26 -0000

Update nodejs to latest 8.x stable release 8.14.0.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 .../recipes-devtools/nodejs/{nodejs_8.12.0.bb => nodejs_8.14.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_8.12.0.bb => nodejs_8.14.0.bb} (96%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_8.12.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_8.14.0.bb
similarity index 96%
rename from meta-oe/recipes-devtools/nodejs/nodejs_8.12.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_8.14.0.bb
index 8c3397821..14837b763 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_8.12.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_8.14.0.bb
@@ -14,8 +14,8 @@ COMPATIBLE_MACHINE_mips64 = "(!.*mips64).*"
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0001-Disable-running-gyp-files-for-bundled-deps.patch \
 "
-SRC_URI[md5sum] = "8b3abd033dae96b6fadcb6a872a44d3c"
-SRC_URI[sha256sum] = "5a9dff58016c18fb4bf902d963b124ff058a550ebcd9840c677757387bce419a"
+SRC_URI[md5sum] = "07b05463e479a69750e7f9e33745ddd7"
+SRC_URI[sha256sum] = "8ce252913c9f6aaa9871f2d9661b6e54858dae2f0064bd3c624676edb09083c4"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.11.0


