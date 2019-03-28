Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C55077D16C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Mar 2019 06:22:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x2S6M472001055
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2019 23:22:04 -0700 (PDT)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Wed, 27 Mar 2019 23:22:03 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 28 Mar 2019 14:21:34 +0800
Message-ID: <1553754094-3471-3-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1553754094-3471-1-git-send-email-yi.zhao@windriver.com>
References: <1553754094-3471-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-python][PATCH 2/2] python-cachetools: add recipe
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
X-List-Received-Date: Thu, 28 Mar 2019 06:22:03 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-devtools/python/python-cachetools.inc        | 16 ++++++++++++++++
 .../recipes-devtools/python/python-cachetools_3.1.0.bb   |  2 ++
 .../recipes-devtools/python/python3-cachetools_3.1.0.bb  |  2 ++
 3 files changed, 20 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-cachetools.inc
 create mode 100644 meta-python/recipes-devtools/python/python-cachetools_3.1.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-cachetools_3.1.0.bb

diff --git a/meta-python/recipes-devtools/python/python-cachetools.inc b/meta-python/recipes-devtools/python/python-cachetools.inc
new file mode 100644
index 0000000..52ae318
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-cachetools.inc
@@ -0,0 +1,16 @@
+SUMMARY = "Extensible memoizing collections and decorators"
+HOMEPAGE = "https://github.com/tkem/cachetools"
+DESCRIPTION = "This module provides various memoizing \
+collections and decorators, including variants of the \
+Python 3 Standard Library @lru_cache function decorator."
+SECTION = "devel/python"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=27f7518eb6f7dc686d0f953b2f28dae5"
+
+inherit pypi
+
+SRC_URI[md5sum] = "a7b1c5eb5390d50067c62d7bcb4e875c"
+SRC_URI[sha256sum] = "9efcc9fab3b49ab833475702b55edd5ae07af1af7a4c627678980b45e459c460"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-cachetools_3.1.0.bb b/meta-python/recipes-devtools/python/python-cachetools_3.1.0.bb
new file mode 100644
index 0000000..8c12ad0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-cachetools_3.1.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-cachetools.inc
diff --git a/meta-python/recipes-devtools/python/python3-cachetools_3.1.0.bb b/meta-python/recipes-devtools/python/python3-cachetools_3.1.0.bb
new file mode 100644
index 0000000..76b2f67
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cachetools_3.1.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-cachetools.inc
-- 
2.7.4


