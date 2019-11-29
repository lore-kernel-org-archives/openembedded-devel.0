Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 35E647F973
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Nov 2019 05:35:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id xAT5Z9aP016208
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Nov 2019 21:35:09 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Thu, 28 Nov 2019 21:35:08 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 29 Nov 2019 13:34:46 +0800
Message-ID: <1575005686-133171-2-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575005686-133171-1-git-send-email-changqing.li@windriver.com>
References: <1575005686-133171-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] python-sqlparse/python3-sqlparse: move from meta-cloud-services
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
X-List-Received-Date: Fri, 29 Nov 2019 05:35:09 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

move these recipes from meta-cloud-services, since python3-django
RDEPENDS on this, and extend for native and nativesdk.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-python/recipes-devtools/python/python-sqlparse.inc     | 13 +++++++++++++
 .../recipes-devtools/python/python-sqlparse_0.3.0.bb        |  2 ++
 .../recipes-devtools/python/python3-sqlparse_0.3.0.bb       |  3 +++
 3 files changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-sqlparse.inc
 create mode 100644 meta-python/recipes-devtools/python/python-sqlparse_0.3.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-sqlparse_0.3.0.bb

diff --git a/meta-python/recipes-devtools/python/python-sqlparse.inc b/meta-python/recipes-devtools/python/python-sqlparse.inc
new file mode 100644
index 0000000..f71f815
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-sqlparse.inc
@@ -0,0 +1,13 @@
+DESCRIPTION = "Non-validating SQL parser module"
+HOMEPAGE = "http://pypi.python.org/pypi/sqlparse"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2b136f573f5386001ea3b7b9016222fc"
+
+SRC_URI[md5sum] = "2ce34181d6b7b234c9f3c0ecd1ffb93e"
+SRC_URI[sha256sum] = "7c3dca29c022744e95b547e867cee89f4fce4373f3549ccd8797d8eb52cdb873"
+
+export BUILD_SYS
+export HOST_SYS
+
+inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-sqlparse_0.3.0.bb b/meta-python/recipes-devtools/python/python-sqlparse_0.3.0.bb
new file mode 100644
index 0000000..2b7773f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-sqlparse_0.3.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-sqlparse.inc
diff --git a/meta-python/recipes-devtools/python/python3-sqlparse_0.3.0.bb b/meta-python/recipes-devtools/python/python3-sqlparse_0.3.0.bb
new file mode 100644
index 0000000..a646ac6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-sqlparse_0.3.0.bb
@@ -0,0 +1,3 @@
+inherit setuptools3
+require python-sqlparse.inc
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


