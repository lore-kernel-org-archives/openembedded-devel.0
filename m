Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D6CC2783CD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Aug 2017 09:37:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7P9bHdG016149
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Aug 2017 02:37:19 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Fri, 25 Aug 2017 01:41:26 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 25 Aug 2017 16:40:41 +0800
Message-ID: <81bf3cf5b1c3f8e481b7f9f3f0a08f9f0af7e945.1503650271.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1503650271.git.jackie.huang@windriver.com>
References: <cover.1503650271.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 2/3] python-webencodings: add Python3 support
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
X-List-Received-Date: Fri, 25 Aug 2017 09:37:18 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Extend the recipe for Python3 support.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-python/recipes-devtools/python/python-webencodings.inc  | 10 ++++++++++
 .../recipes-devtools/python/python-webencodings_0.5.1.bb     | 12 ++----------
 .../recipes-devtools/python/python3-webencodings_0.5.1.bb    |  2 ++
 3 files changed, 14 insertions(+), 10 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-webencodings.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-webencodings_0.5.1.bb

diff --git a/meta-python/recipes-devtools/python/python-webencodings.inc b/meta-python/recipes-devtools/python/python-webencodings.inc
new file mode 100644
index 000000000..ed57c52e5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-webencodings.inc
@@ -0,0 +1,10 @@
+SUMMARY = "Character encoding aliases for legacy web content"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://PKG-INFO;startline=8;endline=9;md5=af5c81bfe98855a56d36b6ba5de2906f"
+
+SRC_URI[md5sum] = "32f6e261d52e57bf7e1c4d41546d15b8"
+SRC_URI[sha256sum] = "b36a1c245f2d304965eb4e0a82848379241dc04b865afcc4aab16748587e1923"
+
+inherit pypi
+
+RDEPENDS_${PN} += "${PYTHON_PN}-codecs"
diff --git a/meta-python/recipes-devtools/python/python-webencodings_0.5.1.bb b/meta-python/recipes-devtools/python/python-webencodings_0.5.1.bb
index d7e4d2ebb..5de2ed1d7 100644
--- a/meta-python/recipes-devtools/python/python-webencodings_0.5.1.bb
+++ b/meta-python/recipes-devtools/python/python-webencodings_0.5.1.bb
@@ -1,10 +1,2 @@
-SUMMARY = "Character encoding aliases for legacy web content"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://PKG-INFO;startline=8;endline=9;md5=af5c81bfe98855a56d36b6ba5de2906f"
-
-SRC_URI[md5sum] = "32f6e261d52e57bf7e1c4d41546d15b8"
-SRC_URI[sha256sum] = "b36a1c245f2d304965eb4e0a82848379241dc04b865afcc4aab16748587e1923"
-
-inherit pypi setuptools
-
-RDEPENDS_${PN} += "${PYTHON_PN}-codecs"
+inherit setuptools
+require python-webencodings.inc
diff --git a/meta-python/recipes-devtools/python/python3-webencodings_0.5.1.bb b/meta-python/recipes-devtools/python/python3-webencodings_0.5.1.bb
new file mode 100644
index 000000000..71fe741e4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-webencodings_0.5.1.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-webencodings.inc
-- 
2.11.0


