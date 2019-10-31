Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 963657FAA7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 18:34:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id x9VIYtua002020
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 11:34:55 -0700 (PDT)
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 31 Oct 2019 11:34:55 -0700
From: Trevor Gamblin <Trevor.Gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 31 Oct 2019 14:34:50 -0400
Message-ID: <20191031183453.24150-2-Trevor.Gamblin@windriver.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191031183453.24150-1-Trevor.Gamblin@windriver.com>
References: <20191031183453.24150-1-Trevor.Gamblin@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] python-priority: add recipe
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
X-List-Received-Date: Thu, 31 Oct 2019 18:34:54 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../python-priority/python-priority.inc                | 10 ++++++++++
 .../python-priority/python-priority_1.3.0.bb           |  3 +++
 .../python-priority/python3-priority_1.3.0.bb          |  3 +++
 3 files changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-connectivity/python-priority/python-priority.inc
 create mode 100644 meta-python/recipes-connectivity/python-priority/python-priority_1.3.0.bb
 create mode 100644 meta-python/recipes-connectivity/python-priority/python3-priority_1.3.0.bb

diff --git a/meta-python/recipes-connectivity/python-priority/python-priority.inc b/meta-python/recipes-connectivity/python-priority/python-priority.inc
new file mode 100644
index 000000000..aa93819bc
--- /dev/null
+++ b/meta-python/recipes-connectivity/python-priority/python-priority.inc
@@ -0,0 +1,10 @@
+DESCRIPTION = "A pure-Python implementation of the HTTP/2 priority tree"
+HOMEPAGE = "https://github.com/python-hyper/priority"
+LICENSE = "MIT"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ae57d8a09fc8b6b164d7357339619045"
+
+SRC_URI[md5sum] = "4f1ff52f7fa448e9d9cb46337ae86d1e"
+SRC_URI[sha256sum] = "6bc1961a6d7fcacbfc337769f1a382c8e746566aaa365e78047abe9f66b2ffbe"
+
+inherit pypi
diff --git a/meta-python/recipes-connectivity/python-priority/python-priority_1.3.0.bb b/meta-python/recipes-connectivity/python-priority/python-priority_1.3.0.bb
new file mode 100644
index 000000000..cbe262576
--- /dev/null
+++ b/meta-python/recipes-connectivity/python-priority/python-priority_1.3.0.bb
@@ -0,0 +1,3 @@
+require python-priority.inc
+
+inherit setuptools
diff --git a/meta-python/recipes-connectivity/python-priority/python3-priority_1.3.0.bb b/meta-python/recipes-connectivity/python-priority/python3-priority_1.3.0.bb
new file mode 100644
index 000000000..fe756b56b
--- /dev/null
+++ b/meta-python/recipes-connectivity/python-priority/python3-priority_1.3.0.bb
@@ -0,0 +1,3 @@
+require python-priority.inc
+
+inherit setuptools3
-- 
2.21.0


