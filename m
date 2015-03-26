Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1113F73C47
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Mar 2015 18:43:33 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Mar 2015 19:43:29 +0100
Message-Id: <1427395411-16303-3-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1427395411-16303-1-git-send-email-obi@opendreambox.org>
References: <1427395411-16303-1-git-send-email-obi@opendreambox.org>
Subject: [meta-python][PATCH 3/5] python-enum34: backport of Python 3.4's enum package, version 1.0.4
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
X-List-Received-Date: Thu, 26 Mar 2015 18:43:35 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta-python/recipes-devtools/python/python-enum34_1.0.4.bb | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-enum34_1.0.4.bb

diff --git a/meta-python/recipes-devtools/python/python-enum34_1.0.4.bb b/meta-python/recipes-devtools/python/python-enum34_1.0.4.bb
new file mode 100644
index 0000000..2ef5df1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-enum34_1.0.4.bb
@@ -0,0 +1,8 @@
+SUMMARY = "backport of Python 3.4's enum package"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://enum/LICENSE;md5=0a97a53a514564c20efd7b2e8976c87e"
+
+SRC_URI[md5sum] = "ac80f432ac9373e7d162834b264034b6"
+SRC_URI[sha256sum] = "d3c19f26a6a34629c18c775f59dfc5dd595764c722b57a2da56ebfb69b94e447"
+
+inherit pypi
-- 
1.9.1


