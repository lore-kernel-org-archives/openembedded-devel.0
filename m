Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 768316FFA1
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Nov 2017 20:54:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vA6KstsM014359
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 Nov 2017 12:54:55 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 6 Nov 2017 12:54:54 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 6 Nov 2017 15:54:54 -0500
Message-ID: <1510001694-24323-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-python][PATCH] python-scrypt: add new package
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
X-List-Received-Date: Mon, 06 Nov 2017 20:54:54 -0000
Content-Type: text/plain

This python package provides bindings for the scrypt key derivation
function library. (https://bitbucket.org/mhallin/py-scrypt/overview)

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-python/recipes-devtools/python/python-scrypt.inc       | 12 ++++++++++++
 meta-python/recipes-devtools/python/python-scrypt_0.8.0.bb  |  3 +++
 meta-python/recipes-devtools/python/python3-scrypt_0.8.0.bb |  3 +++
 3 files changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-scrypt.inc
 create mode 100644 meta-python/recipes-devtools/python/python-scrypt_0.8.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-scrypt_0.8.0.bb

diff --git a/meta-python/recipes-devtools/python/python-scrypt.inc b/meta-python/recipes-devtools/python/python-scrypt.inc
new file mode 100644
index 0000000..85f1d27
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-scrypt.inc
@@ -0,0 +1,12 @@
+DESCRIPTION = "Bindings for the scrypt key derivation function library"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=8bef8e6712b1be5aa76af1ebde9d6378"
+HOMEPAGE="https://bitbucket.org/mhallin/py-scrypt/overview"
+
+SRC_URI[md5sum] = "0704e59cc3afb3845c27bb3827baeea9"
+SRC_URI[sha256sum] = "d4a5a4f53450b8ef629bbf1ee4be6105c69936e49b3d8bc621ac2287f0c86020"
+
+inherit pypi
+
+RDEPENDS_${PN}_class-target += "\
+"
diff --git a/meta-python/recipes-devtools/python/python-scrypt_0.8.0.bb b/meta-python/recipes-devtools/python/python-scrypt_0.8.0.bb
new file mode 100644
index 0000000..9fbd00e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-scrypt_0.8.0.bb
@@ -0,0 +1,3 @@
+inherit setuptools python-dir
+require python-scrypt.inc
+
diff --git a/meta-python/recipes-devtools/python/python3-scrypt_0.8.0.bb b/meta-python/recipes-devtools/python/python3-scrypt_0.8.0.bb
new file mode 100644
index 0000000..f496653
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-scrypt_0.8.0.bb
@@ -0,0 +1,3 @@
+inherit setuptools3 python3-dir
+require python-scrypt.inc
+
-- 
2.7.4


