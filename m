Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 17BC678D62
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Aug 2018 09:23:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w739Nix0012299
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 3 Aug 2018 02:23:44 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Fri, 3 Aug 2018 02:23:43 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 3 Aug 2018 17:34:03 +0800
Message-ID: <1533288843-73014-3-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533288843-73014-1-git-send-email-liezhi.yang@windriver.com>
References: <1533288843-73014-1-git-send-email-liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 2/2] python-pbr.inc: remove it
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
X-List-Received-Date: Fri, 03 Aug 2018 09:23:43 -0000
Content-Type: text/plain

There is one in oe-ocore, so remove it, and let python-pbr_4.2.0.bb use the one
in oe-core.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-python/recipes-devtools/python/python-pbr.inc      | 14 --------------
 meta-python/recipes-devtools/python/python-pbr_4.2.0.bb |  3 ++-
 2 files changed, 2 insertions(+), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pbr.inc

diff --git a/meta-python/recipes-devtools/python/python-pbr.inc b/meta-python/recipes-devtools/python/python-pbr.inc
deleted file mode 100644
index 225d78b..0000000
--- a/meta-python/recipes-devtools/python/python-pbr.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION = "Python Build Reasonableness: PBR is a library that injects some useful and sensible default behaviors into your setuptools run"
-HOMEPAGE = "https://pypi.python.org/pypi/pbr"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
-
-SRC_URI[md5sum] = "6619780896ca81c7cd19c6e2f439b6c9"
-SRC_URI[sha256sum] = "1b8be50d938c9bb75d0eaf7eda111eec1bf6dc88a62a6412e33bf077457e0f45"
-
-inherit pypi
-
-RDEPENDS_${PN} += "${PYTHON_PN}-pip"
-
-BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python-pbr_4.2.0.bb b/meta-python/recipes-devtools/python/python-pbr_4.2.0.bb
index 8f7f924..a4b56cd 100644
--- a/meta-python/recipes-devtools/python/python-pbr_4.2.0.bb
+++ b/meta-python/recipes-devtools/python/python-pbr_4.2.0.bb
@@ -1,2 +1,3 @@
 inherit setuptools
-require python-pbr.inc
+# The inc file is in oe-core
+require recipes-devtools/python/python-pbr.inc
-- 
2.7.4


