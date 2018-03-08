Return-Path: <Daniel.Dragomir@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0846778967
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Mar 2018 16:52:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w28Gqc3p022384
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 8 Mar 2018 08:52:38 -0800 (PST)
Received: from localhost.localdomain (128.224.125.89) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Thu, 8 Mar 2018 08:52:03 -0800
From: Daniel Dragomir <daniel.dragomir@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 8 Mar 2018 18:54:58 +0200
Message-ID: <1520528098-8881-4-git-send-email-daniel.dragomir@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520528098-8881-1-git-send-email-daniel.dragomir@windriver.com>
References: <1520528098-8881-1-git-send-email-daniel.dragomir@windriver.com>
MIME-Version: 1.0
Subject: [meta-python] [PATCH 4/4] python-robotframework: add recipe for 3.0.2 version
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
X-List-Received-Date: Thu, 08 Mar 2018 16:52:37 -0000
Content-Type: text/plain

Robot Framework is a generic open source test automation framework
for acceptance testing and acceptance test-driven development (ATDD).
It has easy-to-use tabular test data syntax and it utilizes the
keyword-driven testing approach. Its testing capabilities can be
extended by test libraries implemented either with Python or Java,
and users can create new higher-level keywords from existing ones
using the same syntax that is used for creating test cases.

Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>
---
 .../recipes-devtools/python/python-robotframework.inc     | 15 +++++++++++++++
 .../python/python-robotframework_3.0.2.bb                 |  2 ++
 .../python/python3-robotframework_3.0.2.bb                |  2 ++
 3 files changed, 19 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-robotframework.inc
 create mode 100644 meta-python/recipes-devtools/python/python-robotframework_3.0.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-robotframework_3.0.2.bb

diff --git a/meta-python/recipes-devtools/python/python-robotframework.inc b/meta-python/recipes-devtools/python/python-robotframework.inc
new file mode 100644
index 0000000..cc20d64
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-robotframework.inc
@@ -0,0 +1,15 @@
+SUMMARY = "A Python generic test automation framework"
+DESCRIPTION = "Generic open source test atomation framework for acceptance\
+testing and acceptance test-driven development (ATDD). It has easy-to-use\
+tabular test data syntax and it utilizes the keyword-driven testing approach.\
+Its testing capabilities can be extended by test libraries implemented either\
+with Python or Java, and users can create new higher-level keywords from\
+existing ones using the same syntax that is used for creating test cases."
+HOMEPAGE = "http://robotframework.org"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+inherit pypi
+
+SRC_URI[md5sum] = "ea49a54b9d7e38302712194e85c37eaa"
+SRC_URI[sha256sum] = "2018f233568227f9af8c366f93e243a157b742f3baf5b649ecc9750ac0ee1ff7"
diff --git a/meta-python/recipes-devtools/python/python-robotframework_3.0.2.bb b/meta-python/recipes-devtools/python/python-robotframework_3.0.2.bb
new file mode 100644
index 0000000..16eaa78
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-robotframework_3.0.2.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-robotframework.inc
diff --git a/meta-python/recipes-devtools/python/python3-robotframework_3.0.2.bb b/meta-python/recipes-devtools/python/python3-robotframework_3.0.2.bb
new file mode 100644
index 0000000..8f613c3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-robotframework_3.0.2.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-robotframework.inc
-- 
2.7.4


