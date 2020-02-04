Return-Path: <naveen.kumar.saini@intel.com>
X-Greylist: delayed 425 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 04 Feb 2020 01:43:18 UTC
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0042A61010
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Feb 2020 01:43:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Feb 2020 17:36:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,398,1574150400"; d="scan'208";a="431355642"
Received: from saininav-desk1.png.intel.com ([172.30.199.23])
	by fmsmga006.fm.intel.com with ESMTP; 03 Feb 2020 17:36:12 -0800
From: Naveen Saini <naveen.kumar.saini@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Feb 2020 09:41:10 +0800
Message-Id: <20200204014110.25910-1-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH] python3-imageio: add a new package.
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
X-List-Received-Date: Tue, 04 Feb 2020 01:43:19 -0000

ImageIO is a Python library for doing basic I/O operations for images.

This recipe is moved from meta-refkit-extra
https://layers.openembedded.org/layerindex/recipe/68891/

upgraded from v2.2.0 -> v2.6.0

Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 .../python/python3-imageio_2.6.0.bb                | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-imageio_2.6.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.6.0.bb b/meta-python/recipes-devtools/python/python3-imageio_2.6.0.bb
new file mode 100644
index 000000000..8fe4b988d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.6.0.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Python library that provides an easy interface to read and \
+write a wide range of image data, including animated images, video, \
+volumetric data, and scientific formats."
+SECTION = "devel/python"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d8b7fdd0dff0fd18f35c05365d3d7bf7"
+
+SRC_URI = "git://github.com/imageio/imageio.git;protocol=https"
+SRCREV = "0b161649b3ee108f80bd99466aeab2e65cf82cd8"
+S = "${WORKDIR}/git"
+
+inherit setuptools3
+
+RDEPENDS_${PN} = "python3-numpy python3-pillow"
-- 
2.17.1


