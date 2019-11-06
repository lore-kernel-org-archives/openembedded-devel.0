Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 41A397F95B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2019 07:49:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id xA67ndKd024907
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 5 Nov 2019 23:49:39 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 5 Nov 2019 23:49:38 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 5 Nov 2019 23:49:32 -0800
Message-ID: <20191106074935.46751-5-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191106074935.46751-1-hongxu.jia@windriver.com>
References: <20191106074935.46751-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 5/8] python-contextlib2/python3-contextlib2: add version 0.6.0
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
X-List-Received-Date: Wed, 06 Nov 2019 07:49:38 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The python-contextlib2 is required by python-importlib-metadata,
the newly added recipes refers the one in meta-cloud-services

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../recipes-devtools/python/python-contextlib2.inc        | 8 ++++++++
 .../recipes-devtools/python/python-contextlib2_0.6.0.bb   | 3 +++
 .../recipes-devtools/python/python3-contextlib2_0.6.0.bb  | 3 +++
 3 files changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-contextlib2.inc
 create mode 100644 meta-python/recipes-devtools/python/python-contextlib2_0.6.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-contextlib2_0.6.0.bb

diff --git a/meta-python/recipes-devtools/python/python-contextlib2.inc b/meta-python/recipes-devtools/python/python-contextlib2.inc
new file mode 100644
index 000000000..50c93e943
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-contextlib2.inc
@@ -0,0 +1,8 @@
+DESCRIPTION = "Backports and enhancements for the contextlib module"
+HOMEPAGE = "http://contextlib2.readthedocs.org/"
+SECTION = "devel/python"
+LICENSE = "PSF"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=43d1c7827e8fad6454b553caf0e1d734"
+
+SRC_URI[md5sum] = "d03a631073b40073b5c41364ad8f5979"
+SRC_URI[sha256sum] = "7197aa736777caac513dbd800944c209a49765bf1979b12b037dce0277077ed3"
diff --git a/meta-python/recipes-devtools/python/python-contextlib2_0.6.0.bb b/meta-python/recipes-devtools/python/python-contextlib2_0.6.0.bb
new file mode 100644
index 000000000..87cffb98f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-contextlib2_0.6.0.bb
@@ -0,0 +1,3 @@
+inherit pypi setuptools
+require python-contextlib2.inc
+
diff --git a/meta-python/recipes-devtools/python/python3-contextlib2_0.6.0.bb b/meta-python/recipes-devtools/python/python3-contextlib2_0.6.0.bb
new file mode 100644
index 000000000..1c0b560b4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-contextlib2_0.6.0.bb
@@ -0,0 +1,3 @@
+inherit pypi setuptools3
+require python-contextlib2.inc
+
-- 
2.21.0


