Return-Path: <andrej.valek@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 469557D11A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Apr 2019 14:09:10 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x31E9Bfq001133
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 1 Apr 2019 16:09:11 +0200
Received: from dev.vm6.ccp.siemens.com (md1wg6qc.ad001.siemens.net
	[163.242.44.88])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id x31E9Bp2005760;
	Mon, 1 Apr 2019 16:09:11 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id F10B895182D;
	Mon,  1 Apr 2019 16:09:10 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Apr 2019 16:08:21 +0200
Message-Id: <20190401140821.2226-3-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190401140821.2226-1-andrej.valek@siemens.com>
References: <20190401140821.2226-1-andrej.valek@siemens.com>
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-java][PATCH 2/2] openjdk-8: add missing unzip-native dependency
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
X-List-Received-Date: Mon, 01 Apr 2019 14:09:11 -0000

From: Peter Marko <peter.marko@siemens.com>

When building openjre-8 from hosttools, build fails due to
missing unzip.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 recipes-core/openjdk/openjdk-8-cross.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/openjdk/openjdk-8-cross.inc b/recipes-core/openjdk/openjdk-8-cross.inc
index a2bfa27..95f9979 100644
--- a/recipes-core/openjdk/openjdk-8-cross.inc
+++ b/recipes-core/openjdk/openjdk-8-cross.inc
@@ -2,7 +2,7 @@ JDK_HOME = "${libdir_jvm}/openjdk-8"
 JRE_HOME = "${libdir_jvm}/openjre-8"
 
 DEPENDS = "\
-    openjdk-8-native zip-native ant-native libxslt \
+    openjdk-8-native zip-native unzip-native ant-native libxslt \
     krb5 libffi fontconfig freetype \
 "
 
-- 
2.11.0


