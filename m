Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 77EEC601F1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Nov 2017 10:10:49 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id vAKAAoAZ016829
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Nov 2017 11:10:50 +0100
Received: from dev.vm6.ccp.siemens.com (MD1FZU9C.ad001.siemens.net
	[139.16.77.154])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id vAKAAoOD018340;
	Mon, 20 Nov 2017 11:10:50 +0100
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 0794A1000098;
	Mon, 20 Nov 2017 11:10:50 +0100 (CET)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Nov 2017 11:10:43 +0100
Message-Id: <20171120101043.5620-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH] poco: update to 1.8.0.1
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
X-List-Received-Date: Mon, 20 Nov 2017 10:10:50 -0000

1.8 is a minor update from 1.7 and is planned to be the last version before
2.0.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta-oe/recipes-support/poco/{poco_1.7.9.bb => poco_1.8.0.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/poco/{poco_1.7.9.bb => poco_1.8.0.1.bb} (97%)

diff --git a/meta-oe/recipes-support/poco/poco_1.7.9.bb b/meta-oe/recipes-support/poco/poco_1.8.0.1.bb
similarity index 97%
rename from meta-oe/recipes-support/poco/poco_1.7.9.bb
rename to meta-oe/recipes-support/poco/poco_1.8.0.1.bb
index ac6573507..160b4d391 100644
--- a/meta-oe/recipes-support/poco/poco_1.7.9.bb
+++ b/meta-oe/recipes-support/poco/poco_1.8.0.1.bb
@@ -12,9 +12,9 @@ inherit cmake ptest
 
 BBCLASSEXTEND = "native"
 
-SRCREV = "bfbe6a328744eaa84cb443b93ee20947aa0be91f"
+SRCREV = "af527ab21fca5ab2659285408aec9920ed7c7b17"
 SRC_URI = " \
-    git://github.com/pocoproject/poco.git;branch=master \
+    git://github.com/pocoproject/poco.git \
     file://run-ptest \
    "
 
-- 
2.11.0


