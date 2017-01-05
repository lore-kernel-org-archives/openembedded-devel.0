Return-Path: <pascal.bach@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 1D02871A8D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jan 2017 17:34:41 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id v05HDh4b029252
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Thu, 5 Jan 2017 18:13:43 +0100
Received: from dev.sbt.siemens.com ([139.16.29.3])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id v05HDhtK006088;
	Thu, 5 Jan 2017 18:13:43 +0100
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Jan 2017 18:13:40 +0100
Message-Id: <1483636420-22196-4-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Cc: Pascal Bach <pascal.bach@nextrem.ch>
Subject: [meta-python][PATCH 4/4] python3-multidict: add package for multidict
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
X-List-Received-Date: Thu, 05 Jan 2017 17:34:42 -0000

From: Pascal Bach <pascal.bach@nextrem.ch>

This package is Python 3 only

Signed-off-by: Pascal Bach <pascal.bach@nextrem.ch>
---
 meta-python/recipes-devtools/python/python3-multidict_2.1.4.bb | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100755 meta-python/recipes-devtools/python/python3-multidict_2.1.4.bb

diff --git a/meta-python/recipes-devtools/python/python3-multidict_2.1.4.bb b/meta-python/recipes-devtools/python/python3-multidict_2.1.4.bb
new file mode 100755
index 0000000..4a36a3d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-multidict_2.1.4.bb
@@ -0,0 +1,9 @@
+SUMMARY = "Multidicts are useful for working with HTTP headers, URL query args etc."
+HOMEPAGE = "https://github.com/aio-libs/multidict/"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "051d92edec87fd98e43ea83f3ce6072d"
+SRC_URI[sha256sum] = "a77aa8c9f68846c3b5db43ff8ed2a7a884dbe845d01f55113a3fba78518c4cd7"
-- 
2.1.4


