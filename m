Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 70FCB7D166
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Mar 2019 06:22:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2S6LoiI009725
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2019 23:22:01 -0700
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Wed, 27 Mar 2019 23:21:40 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 28 Mar 2019 14:21:33 +0800
Message-ID: <1553754094-3471-2-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1553754094-3471-1-git-send-email-yi.zhao@windriver.com>
References: <1553754094-3471-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-python][PATCH 1/2 v2] python-tqdm: add recipe
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
X-List-Received-Date: Thu, 28 Mar 2019 06:22:10 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-python/recipes-devtools/python/python-tqdm.inc        | 13 +++++++++++++
 meta-python/recipes-devtools/python/python-tqdm_4.31.1.bb  |  2 ++
 meta-python/recipes-devtools/python/python3-tqdm_4.31.1.bb |  2 ++
 3 files changed, 17 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-tqdm.inc
 create mode 100644 meta-python/recipes-devtools/python/python-tqdm_4.31.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-tqdm_4.31.1.bb

diff --git a/meta-python/recipes-devtools/python/python-tqdm.inc b/meta-python/recipes-devtools/python/python-tqdm.inc
new file mode 100644
index 0000000..967a80c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-tqdm.inc
@@ -0,0 +1,13 @@
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
+
+BBCLASSEXTEND = "native nativesdk"
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


