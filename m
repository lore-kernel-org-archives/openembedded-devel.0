Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E53E47F36C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Nov 2019 09:31:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id xAB9Vxl4000911
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Nov 2019 01:31:59 -0800 (PST)
Received: from localhost (128.224.158.241) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Mon, 11 Nov 2019 01:31:59 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 11 Nov 2019 17:31:56 +0800
Message-ID: <20191111093156.26287-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [128.224.158.241]
Subject: [meta-python][PATCH] python-ipy: add recipes
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
X-List-Received-Date: Mon, 11 Nov 2019 09:31:59 -0000
Content-Type: text/plain

Move it from meta-selinux to meta-python and update to 1.00.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-devtools/python/python-ipy.inc    | 19 +++++++++++++++++++
 .../python/python-ipy_1.00.bb                 |  2 ++
 .../python/python3-ipy_1.00.bb                |  2 ++
 3 files changed, 23 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-ipy.inc
 create mode 100644 meta-python/recipes-devtools/python/python-ipy_1.00.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-ipy_1.00.bb

diff --git a/meta-python/recipes-devtools/python/python-ipy.inc b/meta-python/recipes-devtools/python/python-ipy.inc
new file mode 100644
index 000000000..46b2fad03
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-ipy.inc
@@ -0,0 +1,19 @@
+SUMMARY = "IPy - class and tools for handling of IPv4 and IPv6 addresses and networks"
+DESCRIPTION = "IPy is a Python module for handling IPv4 and IPv6 Addresses and Networks \
+in a fashion similar to perl's Net::IP and friends. The IP class allows \
+a comfortable parsing and handling for most notations in use for IPv4 \
+and IPv6 Addresses and Networks."
+SECTION = "devel/python"
+HOMEPAGE = "https://github.com/autocracy/python-ipy"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=848d24919845901b4f48bae5f13252e6"
+
+SRC_URI[md5sum] = "1a90c68174234672241a7e60c7ea0fb9"
+SRC_URI[sha256sum] = "2f2bf658a858d43868d8a4352b3889cf78c66e2ce678b300dcf518c9149ba621"
+
+inherit pypi
+
+PYPI_PACKAGE = "IPy"
+
+BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python-ipy_1.00.bb b/meta-python/recipes-devtools/python/python-ipy_1.00.bb
new file mode 100644
index 000000000..587a517e3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-ipy_1.00.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-ipy.inc
diff --git a/meta-python/recipes-devtools/python/python3-ipy_1.00.bb b/meta-python/recipes-devtools/python/python3-ipy_1.00.bb
new file mode 100644
index 000000000..ea6a1055a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ipy_1.00.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-ipy.inc
-- 
2.17.1


