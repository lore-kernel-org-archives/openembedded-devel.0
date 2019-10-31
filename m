Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 251157FA88
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 18:34:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id x9VIYwoL002023
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 11:34:58 -0700 (PDT)
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 31 Oct 2019 11:34:57 -0700
From: Trevor Gamblin <Trevor.Gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 31 Oct 2019 14:34:53 -0400
Message-ID: <20191031183453.24150-5-Trevor.Gamblin@windriver.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191031183453.24150-1-Trevor.Gamblin@windriver.com>
References: <20191031183453.24150-1-Trevor.Gamblin@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] python-hpack: add recipe
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
X-List-Received-Date: Thu, 31 Oct 2019 18:34:57 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../recipes-connectivity/python-hpack/python-hpack.inc | 10 ++++++++++
 .../python-hpack/python-hpack_3.0.0.bb                 |  3 +++
 .../python-hpack/python3-hpack_3.0.0.bb                |  3 +++
 3 files changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-connectivity/python-hpack/python-hpack.inc
 create mode 100644 meta-python/recipes-connectivity/python-hpack/python-hpack_3.0.0.bb
 create mode 100644 meta-python/recipes-connectivity/python-hpack/python3-hpack_3.0.0.bb

diff --git a/meta-python/recipes-connectivity/python-hpack/python-hpack.inc b/meta-python/recipes-connectivity/python-hpack/python-hpack.inc
new file mode 100644
index 000000000..eccfa8c56
--- /dev/null
+++ b/meta-python/recipes-connectivity/python-hpack/python-hpack.inc
@@ -0,0 +1,10 @@
+DESCRIPTION = "Pure-Python HPACK header compression"
+HOMEPAGE = "https://github.com/python-hyper/hpack"
+LICENSE = "MIT"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5bf1c68e73fbaec2b1687b7e71514393"
+
+SRC_URI[md5sum] = "556b0ae66180f54c2ce8029a0952088b"
+SRC_URI[sha256sum] = "8eec9c1f4bfae3408a3f30500261f7e6a65912dc138526ea054f9ad98892e9d2"
+
+inherit pypi
diff --git a/meta-python/recipes-connectivity/python-hpack/python-hpack_3.0.0.bb b/meta-python/recipes-connectivity/python-hpack/python-hpack_3.0.0.bb
new file mode 100644
index 000000000..faaeb8555
--- /dev/null
+++ b/meta-python/recipes-connectivity/python-hpack/python-hpack_3.0.0.bb
@@ -0,0 +1,3 @@
+require python-hpack.inc
+
+inherit setuptools
diff --git a/meta-python/recipes-connectivity/python-hpack/python3-hpack_3.0.0.bb b/meta-python/recipes-connectivity/python-hpack/python3-hpack_3.0.0.bb
new file mode 100644
index 000000000..e196c55b3
--- /dev/null
+++ b/meta-python/recipes-connectivity/python-hpack/python3-hpack_3.0.0.bb
@@ -0,0 +1,3 @@
+require python-hpack.inc
+
+inherit setuptools3
-- 
2.21.0


