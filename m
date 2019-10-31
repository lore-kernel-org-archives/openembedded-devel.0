Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0E2F47FAAD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 18:42:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id x9VIgR9I014710
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 11:42:27 -0700 (PDT)
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 31 Oct 2019 11:42:26 -0700
From: Trevor Gamblin <Trevor.Gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 31 Oct 2019 14:42:22 -0400
Message-ID: <20191031184223.14080-4-Trevor.Gamblin@windriver.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191031184223.14080-1-Trevor.Gamblin@windriver.com>
References: <20191031184223.14080-1-Trevor.Gamblin@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] python-hyperframe: add recipe
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
X-List-Received-Date: Thu, 31 Oct 2019 18:42:26 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../python-hyperframe/python-hyperframe.inc            | 10 ++++++++++
 .../python-hyperframe/python-hyperframe_5.2.0.bb       |  3 +++
 .../python-hyperframe/python3-hyperframe_5.2.0.bb      |  3 +++
 3 files changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-connectivity/python-hyperframe/python-hyperframe.inc
 create mode 100644 meta-python/recipes-connectivity/python-hyperframe/python-hyperframe_5.2.0.bb
 create mode 100644 meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_5.2.0.bb

diff --git a/meta-python/recipes-connectivity/python-hyperframe/python-hyperframe.inc b/meta-python/recipes-connectivity/python-hyperframe/python-hyperframe.inc
new file mode 100644
index 000000000..0066bf8e6
--- /dev/null
+++ b/meta-python/recipes-connectivity/python-hyperframe/python-hyperframe.inc
@@ -0,0 +1,10 @@
+DESCRIPTION = "HTTP/2 framing layer for Python"
+HOMEPAGE = "https://github.com/python-hyper/hyperframe"
+LICENSE = "MIT"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5bf1c68e73fbaec2b1687b7e71514393"
+
+SRC_URI[md5sum] = "6919183242feb26d8bce3b4cba81defd"
+SRC_URI[sha256sum] = "a9f5c17f2cc3c719b917c4f33ed1c61bd1f8dfac4b1bd23b7c80b3400971b41f"
+
+inherit pypi
diff --git a/meta-python/recipes-connectivity/python-hyperframe/python-hyperframe_5.2.0.bb b/meta-python/recipes-connectivity/python-hyperframe/python-hyperframe_5.2.0.bb
new file mode 100644
index 000000000..4f0c9977a
--- /dev/null
+++ b/meta-python/recipes-connectivity/python-hyperframe/python-hyperframe_5.2.0.bb
@@ -0,0 +1,3 @@
+require python-hyperframe.inc
+
+inherit setuptools
diff --git a/meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_5.2.0.bb b/meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_5.2.0.bb
new file mode 100644
index 000000000..f10fb6df1
--- /dev/null
+++ b/meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_5.2.0.bb
@@ -0,0 +1,3 @@
+require python-hyperframe.inc
+
+inherit setuptools3
-- 
2.21.0


