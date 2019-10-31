Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A0CF47FAC4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 18:34:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x9VIYueS018401
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 11:34:56 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 31 Oct 2019 11:34:56 -0700
From: Trevor Gamblin <Trevor.Gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 31 Oct 2019 14:34:51 -0400
Message-ID: <20191031183453.24150-3-Trevor.Gamblin@windriver.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191031183453.24150-1-Trevor.Gamblin@windriver.com>
References: <20191031183453.24150-1-Trevor.Gamblin@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] python-h2: add recipe
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
X-List-Received-Date: Thu, 31 Oct 2019 18:34:55 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../recipes-connectivity/python-h2/python-h2.inc       | 10 ++++++++++
 .../recipes-connectivity/python-h2/python-h2_3.1.1.bb  |  3 +++
 .../recipes-connectivity/python-h2/python3-h2_3.1.1.bb |  3 +++
 3 files changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-connectivity/python-h2/python-h2.inc
 create mode 100644 meta-python/recipes-connectivity/python-h2/python-h2_3.1.1.bb
 create mode 100644 meta-python/recipes-connectivity/python-h2/python3-h2_3.1.1.bb

diff --git a/meta-python/recipes-connectivity/python-h2/python-h2.inc b/meta-python/recipes-connectivity/python-h2/python-h2.inc
new file mode 100644
index 000000000..42629c261
--- /dev/null
+++ b/meta-python/recipes-connectivity/python-h2/python-h2.inc
@@ -0,0 +1,10 @@
+DESCRIPTION = "HTTP/2 State-Machine based protocol implementation"
+HOMEPAGE = "https://github.com/python-hyper/hyper-h2"
+LICENSE = "MIT"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b6b2f6bbe76528af543242d606c14851"
+
+SRC_URI[md5sum] = "950b5a62a2a608dc4547a01edf99aa8f"
+SRC_URI[sha256sum] = "b8a32bd282594424c0ac55845377eea13fa54fe4a8db012f3a198ed923dc3ab4"
+
+inherit pypi
diff --git a/meta-python/recipes-connectivity/python-h2/python-h2_3.1.1.bb b/meta-python/recipes-connectivity/python-h2/python-h2_3.1.1.bb
new file mode 100644
index 000000000..b84129742
--- /dev/null
+++ b/meta-python/recipes-connectivity/python-h2/python-h2_3.1.1.bb
@@ -0,0 +1,3 @@
+require python-h2.inc
+
+inherit setuptools
diff --git a/meta-python/recipes-connectivity/python-h2/python3-h2_3.1.1.bb b/meta-python/recipes-connectivity/python-h2/python3-h2_3.1.1.bb
new file mode 100644
index 000000000..7230a27e8
--- /dev/null
+++ b/meta-python/recipes-connectivity/python-h2/python3-h2_3.1.1.bb
@@ -0,0 +1,3 @@
+require python-h2.inc
+
+inherit setuptools3
-- 
2.21.0


