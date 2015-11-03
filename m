Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ED07B71633
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Nov 2015 09:02:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tA392R2B024727
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 3 Nov 2015 01:02:27 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 3 Nov 2015 01:02:26 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 3 Nov 2015 04:02:24 -0500
Message-ID: <1446541344-186769-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-python] python-pygpgme: add python-pygpgme 0.3
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
X-List-Received-Date: Tue, 03 Nov 2015 09:02:27 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

PyGPGME is a Python module that lets you sign, verify, encrypt and
decrypt messages using the OpenPGP format.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../recipes-devtools/python/python-pygpgme_0.3.bb      | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pygpgme_0.3.bb

diff --git a/meta-python/recipes-devtools/python/python-pygpgme_0.3.bb b/meta-python/recipes-devtools/python/python-pygpgme_0.3.bb
new file mode 100644
index 0000000..f06c344
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pygpgme_0.3.bb
@@ -0,0 +1,18 @@
+SUMMARY = "A Python module for working with OpenPGP messages"
+DESCRIPTION = "PyGPGME is a Python module that lets you sign, verify, \
+               encrypt and decrypt messages using the OpenPGP format."
+HOMEPAGE = "https://launchpad.net/pygpgme"
+SECTION = "devel/python"
+
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=6517bdc8f2416f27ab725d4702f7aac3"
+
+SRC_URI = "https://pypi.python.org/packages/source/p/pygpgme/pygpgme-${PV}.tar.gz"
+SRC_URI[md5sum] = "d38355af73f0352cde3d410b25f34fd0"
+SRC_URI[sha256sum] = "5fd887c407015296a8fd3f4b867fe0fcca3179de97ccde90449853a3dfb802e1"
+
+S = "${WORKDIR}/pygpgme-${PV}"
+
+DEPENDS += "gpgme"
+
+inherit setuptools
-- 
1.9.1


