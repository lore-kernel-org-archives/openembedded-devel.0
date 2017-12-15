Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E9F4378844
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Dec 2017 20:22:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vBFKMGtW023620
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Dec 2017 12:22:16 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 15 Dec 2017 12:22:16 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 15 Dec 2017 15:21:58 -0500
Message-ID: <1513369321-18274-6-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1513369321-18274-1-git-send-email-mark.asselstine@windriver.com>
References: <1513369321-18274-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][v2][rocko][PATCH 5/8] python-incremental: add an initial recipe for version 17.5.0
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
X-List-Received-Date: Fri, 15 Dec 2017 20:22:15 -0000
Content-Type: text/plain

From: Derek Straka <derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---

Cerry-pick from master
63791edb3f69269fc6e0b83863e76f6a4a35965c
                                                                                                                                                                                                                  meta-python/recipes-devtools/python/python-incremental.inc | 14 ++++++++++++++
 .../recipes-devtools/python/python-incremental_17.5.0.bb   |  2 ++
 .../recipes-devtools/python/python3-incremental_17.5.0.bb  |  2 ++
 3 files changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-incremental.inc
 create mode 100644 meta-python/recipes-devtools/python/python-incremental_17.5.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-incremental_17.5.0.bb

diff --git a/meta-python/recipes-devtools/python/python-incremental.inc b/meta-python/recipes-devtools/python/python-incremental.inc
new file mode 100644
index 0000000..3675458
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-incremental.inc
@@ -0,0 +1,14 @@
+DESCRIPTION = "Incremental is a small library that versions your Python projects"
+HOMEPAGE = "https://github.com/twisted/incremental"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6ca9b07f08e2c72d48c74d363d1e0e15"
+
+SRC_URI[md5sum] = "602746e0d438e075a5a9e0678140bba2"
+SRC_URI[sha256sum] = "7b751696aaf36eebfab537e458929e194460051ccad279c72b755a167eebd4b3"
+
+inherit pypi
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-twisted \
+    ${PYTHON_PN}-click \
+"
diff --git a/meta-python/recipes-devtools/python/python-incremental_17.5.0.bb b/meta-python/recipes-devtools/python/python-incremental_17.5.0.bb
new file mode 100644
index 0000000..139ac0c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-incremental_17.5.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-incremental.inc
diff --git a/meta-python/recipes-devtools/python/python3-incremental_17.5.0.bb b/meta-python/recipes-devtools/python/python3-incremental_17.5.0.bb
new file mode 100644
index 0000000..0f04df4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-incremental_17.5.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-incremental.inc
-- 
2.7.4


