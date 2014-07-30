Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 98BD9708B3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 06:11:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s6U6BGmX013530
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jul 2014 23:11:16 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 29 Jul 2014 23:11:15 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 30 Jul 2014 14:11:18 +0800
Message-ID: <1406700678-5877-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH][meta-python] python-decorator: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Jul 2014 06:11:16 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../python/python-decorator_3.4.0.bb               |   22 ++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-python/recipes-python/python/python-decorator_3.4.0.bb

diff --git a/meta-python/recipes-python/python/python-decorator_3.4.0.bb b/meta-python/recipes-python/python/python-decorator_3.4.0.bb
new file mode 100644
index 0000000..4316630
--- /dev/null
+++ b/meta-python/recipes-python/python/python-decorator_3.4.0.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Python decorator utilities"
+HOMEPAGE = "http://pypi.python.org/pypi/decorator/"
+DESCRIPTION = "\
+The aim of the decorator module it to simplify the usage of decorators \
+for the average programmer, and to popularize decorators by showing \
+various non-trivial examples. Of course, as all techniques, decorators \
+can be abused and you should not try to solve every problem with a \
+decorator, just because you can."
+
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://documentation3.py;beginline=848;endline=877;md5=0b56661417fb7b841afc8892e14ba241"
+
+SRCNAME = "decorator"
+
+SRC_URI = "https://pypi.python.org/packages/source/d/decorator/decorator-${PV}.tar.gz"
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+SRC_URI[md5sum] = "1e8756f719d746e2fc0dd28b41251356"
+SRC_URI[sha256sum] = "c20b404cbb7ee5cebd506688e0114e3cd76f5ce233805a51f36e1a7988d9d783"
-- 
1.7.10.4


