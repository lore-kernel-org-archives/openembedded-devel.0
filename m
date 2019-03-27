Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4AE1F6C129
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2019 03:06:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x2R36Tlu022983
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Mar 2019 20:06:30 -0700 (PDT)
Received: from localhost (128.224.163.192) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Tue, 26 Mar 2019 20:06:29 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 27 Mar 2019 11:06:26 +0800
Message-ID: <1553655986-21571-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.163.192]
Subject: [meta-python][PATCH] python-tqdm: add recipe
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
X-List-Received-Date: Wed, 27 Mar 2019 03:06:29 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-python/recipes-devtools/python/python-tqdm.inc        | 11 +++++++++++
 meta-python/recipes-devtools/python/python-tqdm_4.31.1.bb  |  2 ++
 meta-python/recipes-devtools/python/python3-tqdm_4.31.1.bb |  2 ++
 3 files changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-tqdm.inc
 create mode 100644 meta-python/recipes-devtools/python/python-tqdm_4.31.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-tqdm_4.31.1.bb

diff --git a/meta-python/recipes-devtools/python/python-tqdm.inc b/meta-python/recipes-devtools/python/python-tqdm.inc
new file mode 100644
index 0000000..8e1146c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-tqdm.inc
@@ -0,0 +1,11 @@
+SUMMARY = "Fast, Extensible Progress Meter"
+HOMEPAGE = "http://tqdm.github.io/"
+SECTION = "devel/python"
+
+LICENSE = "MIT & MPL-2.0"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=054ef7105cba050017d1368262a1623c"
+
+inherit pypi
+
+SRC_URI[md5sum] = "807e8c13e16e3660ac88e05d711daeb0"
+SRC_URI[sha256sum] = "e22977e3ebe961f72362f6ddfb9197cc531c9737aaf5f607ef09740c849ecd05"
diff --git a/meta-python/recipes-devtools/python/python-tqdm_4.31.1.bb b/meta-python/recipes-devtools/python/python-tqdm_4.31.1.bb
new file mode 100644
index 0000000..b381009
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-tqdm_4.31.1.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-tqdm.inc
diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.31.1.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.31.1.bb
new file mode 100644
index 0000000..348337f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.31.1.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-tqdm.inc
-- 
2.7.4


