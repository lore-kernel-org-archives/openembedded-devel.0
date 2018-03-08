Return-Path: <Daniel.Dragomir@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0B9EC78951
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Mar 2018 16:52:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w28GqXJ2022359
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 8 Mar 2018 08:52:35 -0800 (PST)
Received: from localhost.localdomain (128.224.125.89) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Thu, 8 Mar 2018 08:51:58 -0800
From: Daniel Dragomir <daniel.dragomir@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 8 Mar 2018 18:54:56 +0200
Message-ID: <1520528098-8881-2-git-send-email-daniel.dragomir@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520528098-8881-1-git-send-email-daniel.dragomir@windriver.com>
References: <1520528098-8881-1-git-send-email-daniel.dragomir@windriver.com>
MIME-Version: 1.0
Subject: [meta-python] [PATCH 2/4] python-pyexpect: add recipe for 1.0.17 version
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
X-List-Received-Date: Thu, 08 Mar 2018 16:52:34 -0000
Content-Type: text/plain

Minimal but very flexible implementation of the expect pattern.

Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>
---
 meta-python/recipes-devtools/python/python-pyexpect.inc       | 11 +++++++++++
 meta-python/recipes-devtools/python/python-pyexpect_1.0.17.bb |  2 ++
 .../recipes-devtools/python/python3-pyexpect_1.0.17.bb        |  2 ++
 3 files changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pyexpect.inc
 create mode 100644 meta-python/recipes-devtools/python/python-pyexpect_1.0.17.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pyexpect_1.0.17.bb

diff --git a/meta-python/recipes-devtools/python/python-pyexpect.inc b/meta-python/recipes-devtools/python/python-pyexpect.inc
new file mode 100644
index 0000000..d2d41d5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyexpect.inc
@@ -0,0 +1,11 @@
+SUMMARY = "Python expectaton library"
+DESCRIPTION = "Minimal but very flexible implementation of the expect pattern"
+SECTION = "devel/python"
+HOMEPAGE = " https://bitbucket.org/dwt/pyexpect"
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://README.md;md5=500b884e9dcd5f677a53cbbee8ace939"
+
+inherit pypi
+
+SRC_URI[md5sum] = "c71307d6c7096fdbde0813018dfa0092"
+SRC_URI[sha256sum] = "d656ef7e07a8aa539ce0a4883a683341037b6fc1c329bf55b63bffbf2cce9582"
diff --git a/meta-python/recipes-devtools/python/python-pyexpect_1.0.17.bb b/meta-python/recipes-devtools/python/python-pyexpect_1.0.17.bb
new file mode 100644
index 0000000..d26beb7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyexpect_1.0.17.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-pyexpect.inc
diff --git a/meta-python/recipes-devtools/python/python3-pyexpect_1.0.17.bb b/meta-python/recipes-devtools/python/python3-pyexpect_1.0.17.bb
new file mode 100644
index 0000000..bfd5840
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyexpect_1.0.17.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-pyexpect.inc
-- 
2.7.4


