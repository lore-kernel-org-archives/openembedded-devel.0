Return-Path: <sjl@vctlabs.com>
Received: from dent.vctlabs.com (net-cf9a4187.iis.impulse.net [207.154.65.135])
	by mail.openembedded.org (Postfix) with ESMTP id 9025D78AE3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Aug 2018 00:41:13 +0000 (UTC)
Received: by dent.vctlabs.com (Postfix, from userid 1000)
	id 894392804CF; Mon,  6 Aug 2018 17:45:07 -0700 (PDT)
Date: Mon, 6 Aug 2018 17:45:07 -0700
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20180807004507.GG20696@vctlabs.com>
Mail-Followup-To: "S. Lockwood-Childs" <sjl@vctlabs.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [sumo][meta-python][PATCH] python-future: make recipe available as python3 version
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
X-List-Received-Date: Tue, 07 Aug 2018 00:41:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
---
 meta-python/recipes-devtools/python/python-future.inc     | 13 +++++++++++++
 .../recipes-devtools/python/python-future_0.16.0.bb       | 15 ++-------------
 .../recipes-devtools/python/python3-future_0.16.0.bb      |  2 ++
 3 files changed, 17 insertions(+), 13 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-future.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-future_0.16.0.bb

diff --git a/meta-python/recipes-devtools/python/python-future.inc b/meta-python/recipes-devtools/python/python-future.inc
new file mode 100644
index 0000000..2247561
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-future.inc
@@ -0,0 +1,13 @@
+DESCRIPTION = "Clean single-source support for Python 3 and 2"
+HOMEPAGE = "https://python-future.org"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3f457538b297bd0ef86564b8ac216ad7"
+
+SRC_URI[md5sum] = "3e8e88a2bda48d54b1da7634d04760d7"
+SRC_URI[sha256sum] = "e39ced1ab767b5936646cedba8bcce582398233d6a627067d4c6a454c90cfedb"
+
+PYPI_PACKAGE_HASH = "99abde815842bc6e97d5a7806ad51236630da14ca2f3b1fce94c0bb94d3d"
+
+inherit pypi
+
+BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python-future_0.16.0.bb b/meta-python/recipes-devtools/python/python-future_0.16.0.bb
index 46f7fe5..d95e1ba 100644
--- a/meta-python/recipes-devtools/python/python-future_0.16.0.bb
+++ b/meta-python/recipes-devtools/python/python-future_0.16.0.bb
@@ -1,13 +1,2 @@
-DESCRIPTION = "Clean single-source support for Python 3 and 2"
-HOMEPAGE = "https://python-future.org"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3f457538b297bd0ef86564b8ac216ad7"
-
-SRC_URI[md5sum] = "3e8e88a2bda48d54b1da7634d04760d7"
-SRC_URI[sha256sum] = "e39ced1ab767b5936646cedba8bcce582398233d6a627067d4c6a454c90cfedb"
-
-PYPI_PACKAGE_HASH = "99abde815842bc6e97d5a7806ad51236630da14ca2f3b1fce94c0bb94d3d"
-
-inherit pypi setuptools
-
-BBCLASSEXTEND = "native"
+inherit setuptools
+require python-future.inc
diff --git a/meta-python/recipes-devtools/python/python3-future_0.16.0.bb b/meta-python/recipes-devtools/python/python3-future_0.16.0.bb
new file mode 100644
index 0000000..f059186
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-future_0.16.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-future.inc
-- 
1.9.4


