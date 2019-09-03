Return-Path: <andrej.valek@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id E2BCD7F22D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2019 08:06:33 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x8386X0H005855
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 3 Sep 2019 10:06:33 +0200
Received: from dev.vm6.ccp.siemens.com (sk1pv77c.siemens.sk [163.242.57.59])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id x8386Xek028895;
	Tue, 3 Sep 2019 10:06:33 +0200
Received: from mail3.siemens.de (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id AA15B98021E;
	Tue,  3 Sep 2019 10:06:32 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Sep 2019 10:06:09 +0200
Message-Id: <20190903080609.388-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH] nodejs: 10.16.2 -> 10.16.3
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
X-List-Received-Date: Tue, 03 Sep 2019 08:06:34 -0000

- update nodejs to active 10.x LTS release 10.16.3
 - include fix multiple HTTP/2 vulnerabilities

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 .../recipes-devtools/nodejs/{nodejs_10.16.2.bb => nodejs_10.16.3.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_10.16.2.bb => nodejs_10.16.3.bb} (97%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_10.16.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_10.16.3.bb
similarity index 97%
rename from meta-oe/recipes-devtools/nodejs/nodejs_10.16.2.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_10.16.3.bb
index d464e9d8a..30724d41a 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_10.16.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_10.16.3.bb
@@ -23,8 +23,8 @@ SRC_URI_append_class-target = " \
            file://0002-Using-native-torque.patch \
            "
 
-SRC_URI[md5sum] = "fa70b942c5e3379ce96219fe90f50c8f"
-SRC_URI[sha256sum] = "6cbc17795e9259dce7a8f5fd5a2e46f9e6920fb48b7d9539c5b2faa5bb5db4d8"
+SRC_URI[md5sum] = "b41275a018e670947c1950b12f050a2f"
+SRC_URI[sha256sum] = "7bf1123d7415964775b8f81fe6ec6dd5c3c08abb42bb71dfe4409dbeeba26bbd"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.11.0


