Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 413D778416
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Aug 2017 09:37:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7P9bHdC016149
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Aug 2017 02:37:18 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Fri, 25 Aug 2017 01:41:27 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 25 Aug 2017 16:40:42 +0800
Message-ID: <5efec29a974de0e2a4f6be5af0dbaaae415fb0aa.1503650271.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1503650271.git.jackie.huang@windriver.com>
References: <cover.1503650271.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 3/3] python-beautifulsoup4: add new recipe for both python2 and python3
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
X-List-Received-Date: Fri, 25 Aug 2017 09:37:17 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Beautiful Soup sits atop an HTML or XML parser,
providing Pythonic idioms for iterating, searching,
and modifying the parse tree.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-devtools/python/python-beautifulsoup4.inc   | 17 +++++++++++++++++
 .../python/python-beautifulsoup4_4.6.0.bb               |  2 ++
 .../python/python3-beautifulsoup4_4.6.0.bb              |  2 ++
 3 files changed, 21 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-beautifulsoup4.inc
 create mode 100644 meta-python/recipes-devtools/python/python-beautifulsoup4_4.6.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-beautifulsoup4_4.6.0.bb

diff --git a/meta-python/recipes-devtools/python/python-beautifulsoup4.inc b/meta-python/recipes-devtools/python/python-beautifulsoup4.inc
new file mode 100644
index 000000000..d60d987ca
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-beautifulsoup4.inc
@@ -0,0 +1,17 @@
+SUMMARY = "Screen-scraping library"
+HOMEPAGE = " https://www.crummy.com/software/BeautifulSoup/bs4"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=f2d38d8a40bf73fd4b3d16ca2e5882d1"
+
+SRC_URI[md5sum] = "c17714d0f91a23b708a592cb3c697728"
+SRC_URI[sha256sum] = "808b6ac932dccb0a4126558f7dfdcf41710dd44a4ef497a0bb59a77f9f078e89"
+
+inherit pypi
+
+RDEPENDS_${PN}_class-target = "\
+    ${PYTHON_PN}-core \
+    ${PYTHON_PN}-html5lib \
+    ${PYTHON_PN}-lxml \
+"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-beautifulsoup4_4.6.0.bb b/meta-python/recipes-devtools/python/python-beautifulsoup4_4.6.0.bb
new file mode 100644
index 000000000..907285ac1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-beautifulsoup4_4.6.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-beautifulsoup4.inc
diff --git a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.6.0.bb b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.6.0.bb
new file mode 100644
index 000000000..d98df11e3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.6.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-beautifulsoup4.inc
-- 
2.11.0


