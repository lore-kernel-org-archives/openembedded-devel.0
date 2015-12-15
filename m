Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DA0BB6AC37
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 02:41:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tBF2fC1s019230
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 18:41:12 -0800
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 14 Dec 2015 18:41:11 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 15 Dec 2015 10:28:44 +0800
Message-ID: <1450146525-31866-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
MIME-Version: 1.0
Subject: [PATCH 1/2] python-pexpect: drop old version recipe
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
X-List-Received-Date: Tue, 15 Dec 2015 02:41:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Kai Kang <kai.kang@windriver.com>

Drop old version recipe of python-pexpect and use the one in oe-core
which version is 3.3 now. And according to release notes of version 3.0,
"The new major version number doesn’t indicate any deliberate API
incompatibility."

Ref:
http://pexpect.readthedocs.org/en/stable/history.html

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-devtools/python/python-pexpect_2.3.bb  | 23 ----------------------
 1 file changed, 23 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pexpect_2.3.bb

diff --git a/meta-python/recipes-devtools/python/python-pexpect_2.3.bb b/meta-python/recipes-devtools/python/python-pexpect_2.3.bb
deleted file mode 100644
index d4c2ba4..0000000
--- a/meta-python/recipes-devtools/python/python-pexpect_2.3.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "A Pure Python Expect like Module for Python"
-SECTION = "devel/python"
-LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=04a2bf11b85ce49d4a8c0c413fd34404"
-SRCNAME = "pexpect"
-PR = "ml3"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit distutils
-
-RDEPENDS_${PN} = "\
-    python-core \
-    python-io \
-    python-terminal \
-    python-resource \
-    python-fcntl \
-"
-
-
-SRC_URI[md5sum] = "bf107cf54e67bc6dec5bea1f3e6a65c3"
-SRC_URI[sha256sum] = "d315e7f3a8544fd85034d7e17fd7c5854e8f0828f5791f83cf313f8fa5740b75"
-- 
2.6.1


