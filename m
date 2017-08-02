Return-Path: <sjl@vctlabs.com>
Received: from dent.vctlabs.com (net-cf9a4187.iis.impulse.net [207.154.65.135])
	by mail.openembedded.org (Postfix) with ESMTP id 20CBC6011C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Aug 2017 21:48:53 +0000 (UTC)
Received: by dent.vctlabs.com (Postfix, from userid 1000)
	id C885F2802D9; Wed,  2 Aug 2017 14:51:23 -0700 (PDT)
Date: Wed, 2 Aug 2017 14:51:23 -0700
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170802215123.GS1001@vctlabs.com>
Mail-Followup-To: "S. Lockwood-Childs" <sjl@vctlabs.com>,
	openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [meta-python][PATCH] python-pyusb: make recipe available as python3 version
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
X-List-Received-Date: Wed, 02 Aug 2017 21:48:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Refactored existing python-pyusb recipe so that pyusb can also be built 
for python3. 

Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
---
 meta-python/recipes-devtools/python/python-pyusb.inc         | 10 ++++++++++
 meta-python/recipes-devtools/python/python-pyusb_1.0.0b2.bb  | 12 ++----------
 meta-python/recipes-devtools/python/python3-pyusb_1.0.0b2.bb |  2 ++
 3 files changed, 14 insertions(+), 10 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-pyusb.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-pyusb_1.0.0b2.bb

diff --git a/meta-python/recipes-devtools/python/python-pyusb.inc b/meta-python/recipes-devtools/python/python-pyusb.inc
new file mode 100644
index 0000000..af20109
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyusb.inc
@@ -0,0 +1,10 @@
+SUMMARY = "PyUSB provides USB access on the Python language"
+HOMEPAGE = "http://pyusb.sourceforge.net/"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=50d46bda6248a0b4a46a6d59a66ee08e"
+DEPENDS += "libusb1"
+
+SRC_URI[md5sum] = "bc12e83ff3ef1045d4306d13a9955fc1"
+SRC_URI[sha256sum] = "14ec66077bdcd6f1aa9e892a0a35a54bb3c1ec56aa740ead64349c18f0186d19"
+
+inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-pyusb_1.0.0b2.bb b/meta-python/recipes-devtools/python/python-pyusb_1.0.0b2.bb
index d279abc..bb73d9f 100644
--- a/meta-python/recipes-devtools/python/python-pyusb_1.0.0b2.bb
+++ b/meta-python/recipes-devtools/python/python-pyusb_1.0.0b2.bb
@@ -1,10 +1,2 @@
-SUMMARY = "PyUSB provides USB access on the Python language"
-HOMEPAGE = "http://pyusb.sourceforge.net/"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=50d46bda6248a0b4a46a6d59a66ee08e"
-DEPENDS = "libusb1"
-
-SRC_URI[md5sum] = "bc12e83ff3ef1045d4306d13a9955fc1"
-SRC_URI[sha256sum] = "14ec66077bdcd6f1aa9e892a0a35a54bb3c1ec56aa740ead64349c18f0186d19"
-
-inherit pypi distutils
+inherit distutils
+require python-pyusb.inc
diff --git a/meta-python/recipes-devtools/python/python3-pyusb_1.0.0b2.bb b/meta-python/recipes-devtools/python/python3-pyusb_1.0.0b2.bb
new file mode 100644
index 0000000..813e6f0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyusb_1.0.0b2.bb
@@ -0,0 +1,2 @@
+inherit distutils3
+require python-pyusb.inc
-- 
1.9.4


