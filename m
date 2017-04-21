Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EEF9062133
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Apr 2017 09:08:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v3L98LSX007127
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Apr 2017 02:08:21 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Fri, 21 Apr 2017 02:08:20 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 21 Apr 2017 17:08:14 +0800
Message-ID: <3701c946b0beafb83e2563decf86b557116e6d40.1492765386.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1492765386.git.jackie.huang@windriver.com>
References: <cover.1492765386.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 1/4] python-ply: add new recipe
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
X-List-Received-Date: Fri, 21 Apr 2017 09:08:21 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

python-ply: PLY is yet another implementation
of lex and yacc for Python.

It's required by python-pysmi.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-python/recipes-devtools/python/python-ply_3.10.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-ply_3.10.bb

diff --git a/meta-python/recipes-devtools/python/python-ply_3.10.bb b/meta-python/recipes-devtools/python/python-ply_3.10.bb
new file mode 100644
index 000000000..8e61efa79
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-ply_3.10.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Python Lex and Yacc"
+DESCRIPTION = "Python ply: PLY is yet another implementation of lex and yacc for Python"
+HOMEPAGE = "https://pypi.python.org/pypi/ply"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://README.md;beginline=3;endline=30;md5=fcb04bc2f765e46ab7084d6ab6e452bb"
+
+SRCNAME = "ply"
+
+SRC_URI = "https://files.pythonhosted.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "1d63c166ab250bab87d8dcc42dcca70e"
+SRC_URI[sha256sum] = "96e94af7dd7031d8d6dd6e2a8e0de593b511c211a86e28a9c9621c275ac8bacb"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
-- 
2.11.0


