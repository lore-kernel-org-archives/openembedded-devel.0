Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 40A577F23B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2019 05:54:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8T5sQeP003987
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Sep 2019 22:54:26 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Sat, 28 Sep 2019 22:54:25 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 29 Sep 2019 13:42:38 +0800
Message-ID: <5009124accb35db6c229d72bd30fc01a0e7aafb3.1569734973.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569734973.git.jackie.huang@windriver.com>
References: <cover.1569734973.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 1/4] python-versiontools: add recipes for python2 and python3
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
X-List-Received-Date: Sun, 29 Sep 2019 05:54:25 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

python-versiontools is a smart replacement for plain
tuple used in __version__.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-python/recipes-devtools/python/python-versiontools.inc    | 10 ++++++++++
 .../recipes-devtools/python/python-versiontools_1.9.1.bb       |  2 ++
 .../recipes-devtools/python/python3-versiontools_1.9.1.bb      |  2 ++
 3 files changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-versiontools.inc
 create mode 100644 meta-python/recipes-devtools/python/python-versiontools_1.9.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-versiontools_1.9.1.bb

diff --git a/meta-python/recipes-devtools/python/python-versiontools.inc b/meta-python/recipes-devtools/python/python-versiontools.inc
new file mode 100644
index 0000000..b0e696f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-versiontools.inc
@@ -0,0 +1,10 @@
+SUMMARY = "Smart replacement for plain tuple used in __version__"
+SECTION = "devel/python"
+HOMEPAGE = "https://launchpad.net/versiontools"
+LICENSE = "LGPLv3"
+LIC_FILES_CHKSUM = "file://setup.py;beginline=3;endline=20;md5=02193721a38fd8a05a4ddeb7df8e294d"
+
+inherit pypi
+
+SRC_URI[md5sum] = "602b7db8eea30dd29a1d451997adf251"
+SRC_URI[sha256sum] = "a969332887a18a9c98b0df0ea4d4ca75972f24ca94f06fb87d591377e83414f6"
diff --git a/meta-python/recipes-devtools/python/python-versiontools_1.9.1.bb b/meta-python/recipes-devtools/python/python-versiontools_1.9.1.bb
new file mode 100644
index 0000000..6bfe82e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-versiontools_1.9.1.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-versiontools.inc
diff --git a/meta-python/recipes-devtools/python/python3-versiontools_1.9.1.bb b/meta-python/recipes-devtools/python/python3-versiontools_1.9.1.bb
new file mode 100644
index 0000000..e8d6b7d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-versiontools_1.9.1.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-versiontools.inc
-- 
2.7.4


