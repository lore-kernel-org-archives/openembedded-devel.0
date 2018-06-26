Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 27BFF7479D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jun 2018 05:58:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w5Q5wVt6013294
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jun 2018 22:58:31 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Mon, 25 Jun 2018 22:58:30 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 26 Jun 2018 14:00:48 +0800
Message-ID: <1529992863-24711-5-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1529992863-24711-1-git-send-email-Qi.Chen@windriver.com>
References: <1529992863-24711-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 05/20] python3-ordered-set: upgrade 2.0.2 -> 3.0.0
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
X-List-Received-Date: Tue, 26 Jun 2018 05:58:30 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The license checksum changes but the license remains the same.
The change is just about year, 2013 -> 2018.

Add python3-pytest-runner to DEPENDS to solve the following error.
  | distutils.errors.DistutilsError: Could not find suitable distribution \
    for Requirement.parse('pytest-runner')

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../recipes-devtools/python/python3-ordered-set_2.0.2.bb      | 10 ----------
 .../recipes-devtools/python/python3-ordered-set_3.0.0.bb      | 11 +++++++++++
 2 files changed, 11 insertions(+), 10 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-ordered-set_2.0.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-ordered-set_3.0.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-ordered-set_2.0.2.bb b/meta-python/recipes-devtools/python/python3-ordered-set_2.0.2.bb
deleted file mode 100644
index be6d4e169..000000000
--- a/meta-python/recipes-devtools/python/python3-ordered-set_2.0.2.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-SUMMARY = "A MutableSet that remembers its order, so that every entry has an index."
-HOMEPAGE = "http://github.com/LuminosoInsight/ordered-set"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://MIT-LICENSE;md5=0feb0c85b722f488b87844fb5f81d2dc"
-
-SRC_URI[md5sum] = "7b8d73dc64fd3c783ecb48e050bfcc0d"
-SRC_URI[sha256sum] = "942cad5d7d5b0760d5cbe93dfb385ac2ed402ca1d48c9f4e102d7d5cce3a90eb"
-
-inherit pypi setuptools3
-
diff --git a/meta-python/recipes-devtools/python/python3-ordered-set_3.0.0.bb b/meta-python/recipes-devtools/python/python3-ordered-set_3.0.0.bb
new file mode 100644
index 000000000..b731c28d2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ordered-set_3.0.0.bb
@@ -0,0 +1,11 @@
+SUMMARY = "A MutableSet that remembers its order, so that every entry has an index."
+HOMEPAGE = "http://github.com/LuminosoInsight/ordered-set"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://MIT-LICENSE;md5=2b36be0d99854aa2ae292a800a7c1d4e"
+
+SRC_URI[md5sum] = "c8f5b99b717618803b914dd9cfe5ef43"
+SRC_URI[sha256sum] = "a34399fe6aa78358aaa00129d67c65b4aa099adfc023731b1d756c85776a89bb"
+
+inherit pypi setuptools3
+
+DEPENDS += "python3-pytest-runner-native"
-- 
2.11.0


