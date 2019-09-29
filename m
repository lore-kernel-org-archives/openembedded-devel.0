Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CFE477F26A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2019 05:54:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id x8T5sSWL001380
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Sep 2019 22:54:28 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Sat, 28 Sep 2019 22:54:28 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 29 Sep 2019 13:42:40 +0800
Message-ID: <5281daf45b81bd251181b61e22ad971e9846f446.1569734973.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569734973.git.jackie.huang@windriver.com>
References: <cover.1569734973.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 3/4] python-statistics: add new recipe
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
X-List-Received-Date: Sun, 29 Sep 2019 05:54:28 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

A port of Python 3.4 statistics module to Python 2.*, initially done
through the 3to2 tool. This module provides functions for calculating
mathematical statistics of numeric (Real-valued) data.

This is required by python-pyperf.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-devtools/python/python-statistics_1.0.3.5.bb  | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-statistics_1.0.3.5.bb

diff --git a/meta-python/recipes-devtools/python/python-statistics_1.0.3.5.bb b/meta-python/recipes-devtools/python/python-statistics_1.0.3.5.bb
new file mode 100644
index 0000000..ee3b822
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-statistics_1.0.3.5.bb
@@ -0,0 +1,15 @@
+SUMMARY = "A port of Python 3.4 statistics module to Python 2.x"
+DESCRIPTION = " \
+A port of Python 3.4 statistics module to Python 2.*, initially done \
+through the 3to2 tool. This module provides functions for calculating \
+mathematical statistics of numeric (Real-valued) data. \
+"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://statistics/__init__.py;beginline=6;endline=16;md5=b76960ee777a1529f60db47ada2a8e6e"
+
+SRC_URI[md5sum] = "d6d97f3a1a7b3192cff99e0f2b5956c3"
+SRC_URI[sha256sum] = "2dc379b80b07bf2ddd5488cad06b2b9531da4dd31edb04dc9ec0dc226486c138"
+
+inherit pypi setuptools
+
+PYPI_PACKAGE = "statistics"
-- 
2.7.4


