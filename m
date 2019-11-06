Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9B4177F872
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2019 07:49:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xA67nZfe005072
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 5 Nov 2019 23:49:35 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 5 Nov 2019 23:49:35 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 5 Nov 2019 23:49:28 -0800
Message-ID: <20191106074935.46751-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/8] python-more-itertools: downgrade 7.2.0 -> 5.0.0
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
X-List-Received-Date: Wed, 06 Nov 2019 07:49:37 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Python 2.7 is no longer supported. The 5.0.0 release will be the last
version targeting Python 2.7. [1]

[1] https://github.com/erikrose/more-itertools/commit/560b045b430e8292c18cf5283de4fdc3e13e56f7

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-python/recipes-devtools/python/python-more-itertools.inc  | 3 ---
 ...-more-itertools_7.2.0.bb => python-more-itertools_5.0.0.bb} | 3 +++
 .../recipes-devtools/python/python3-more-itertools_7.2.0.bb    | 3 +++
 3 files changed, 6 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-more-itertools_7.2.0.bb => python-more-itertools_5.0.0.bb} (29%)

diff --git a/meta-python/recipes-devtools/python/python-more-itertools.inc b/meta-python/recipes-devtools/python/python-more-itertools.inc
index 8d814a6f0..33095b3d3 100644
--- a/meta-python/recipes-devtools/python/python-more-itertools.inc
+++ b/meta-python/recipes-devtools/python/python-more-itertools.inc
@@ -2,6 +2,3 @@ DESCRIPTION = "More routines for operating on iterables, beyond itertools"
 HOMEPAGE = "https://github.com/erikrose/more-itertools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
-
-SRC_URI[md5sum] = "f647bfd27243a7bebe53b5ddb6a3b1c4"
-SRC_URI[sha256sum] = "409cd48d4db7052af495b09dec721011634af3753ae1ef92d2b32f73a745f832"
diff --git a/meta-python/recipes-devtools/python/python-more-itertools_7.2.0.bb b/meta-python/recipes-devtools/python/python-more-itertools_5.0.0.bb
similarity index 29%
rename from meta-python/recipes-devtools/python/python-more-itertools_7.2.0.bb
rename to meta-python/recipes-devtools/python/python-more-itertools_5.0.0.bb
index 0702aad4e..c66e55cac 100644
--- a/meta-python/recipes-devtools/python/python-more-itertools_7.2.0.bb
+++ b/meta-python/recipes-devtools/python/python-more-itertools_5.0.0.bb
@@ -1,2 +1,5 @@
 inherit pypi setuptools
 require python-more-itertools.inc
+
+SRC_URI[md5sum] = "f2ea58aa336ce6c13b7b225b3bbe305d"
+SRC_URI[sha256sum] = "38a936c0a6d98a38bcc2d03fdaaedaba9f412879461dd2ceff8d37564d6522e4"
diff --git a/meta-python/recipes-devtools/python/python3-more-itertools_7.2.0.bb b/meta-python/recipes-devtools/python/python3-more-itertools_7.2.0.bb
index 28ddf88fb..06d45ce54 100644
--- a/meta-python/recipes-devtools/python/python3-more-itertools_7.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-more-itertools_7.2.0.bb
@@ -1,2 +1,5 @@
 inherit pypi setuptools3
 require python-more-itertools.inc
+
+SRC_URI[md5sum] = "f647bfd27243a7bebe53b5ddb6a3b1c4"
+SRC_URI[sha256sum] = "409cd48d4db7052af495b09dec721011634af3753ae1ef92d2b32f73a745f832"
-- 
2.21.0


