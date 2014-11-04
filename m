Return-Path: <ignas.anikevicius@realvnc.com>
Received: from SP39.realvnc.ltd (mx.realvnc.com [212.69.41.4])
	by mail.openembedded.org (Postfix) with ESMTP id 471E265C87
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Nov 2014 14:55:05 +0000 (UTC)
Received: from santadi.realvnc.ltd (10.10.30.155) by SP39.realvnc.ltd
	(10.10.99.12) with Microsoft SMTP Server (TLS) id 15.0.775.38;
	Tue, 4 Nov 2014 14:39:27 +0000
From: Ignas Anikevicius <ignas.anikevicius@realvnc.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 4 Nov 2014 14:39:20 +0000
Message-ID: <1415111960-5672-1-git-send-email-ignas.anikevicius@realvnc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.10.30.155]
X-ClientProxiedBy: SP39.realvnc.ltd (10.10.99.12) To SP39.realvnc.ltd
	(10.10.99.12)
Subject: [meta-oe][daisy][PATCH] Add a bitbake recipe for Python psutil v2.1.3
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
X-List-Received-Date: Tue, 04 Nov 2014 14:55:08 -0000
Content-Type: text/plain

This bitbake recipe is based on the existing
'python-psutil_v0.6.9' bitbake recipe in the same folder.

I have tested the recipe locally and it work without any issues.

Signed-off-by: Ignas Anikevicius <ignas.anikevicius@realvnc.com>
---
 meta-oe/recipes-devtools/python/python-psutil_2.1.3.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/python/python-psutil_2.1.3.bb

diff --git a/meta-oe/recipes-devtools/python/python-psutil_2.1.3.bb b/meta-oe/recipes-devtools/python/python-psutil_2.1.3.bb
new file mode 100644
index 0000000..76380ba
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-psutil_2.1.3.bb
@@ -0,0 +1,13 @@
+SUMMARY = "A cross-platform process and system utilities module for Python"
+SECTION = "devel/python"
+HOMEPAGE = "https://github.com/giampaolo/psutil"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0f02e99f7f3c9a7fe8ecfc5d44c2be62"
+
+SRC_URI = "https://pypi.python.org/packages/source/p/psutil/psutil-${PV}.tar.gz"
+SRC_URI[md5sum] = "015a013c46bb9bc30b5c344f26dea0d3"
+SRC_URI[sha256sum] = "b434c75f01715777391f10f456002e33d0ca14633f96fdbd9ff9139b42d9452c"
+
+S = "${WORKDIR}/psutil-${PV}"
+
+inherit setuptools
-- 
1.9.1


