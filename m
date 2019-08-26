Return-Path: <anuj.mittal@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id F1CCE7E71C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2019 23:15:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Aug 2019 16:15:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,435,1559545200"; d="scan'208";a="264095140"
Received: from anmitta2-mobl1.gar.corp.intel.com (HELO
	anmitta2-mobl1.png.intel.com) ([172.30.199.133])
	by orsmga001.jf.intel.com with ESMTP; 26 Aug 2019 16:15:12 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Aug 2019 07:15:10 +0800
Message-Id: <20190826231510.20677-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] pugixml: add recipe
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
X-List-Received-Date: Mon, 26 Aug 2019 23:15:15 -0000
Content-Transfer-Encoding: 8bit

pugixml is a light-weight, simple and fast XML parser for C++ with XPath
support.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../recipes-devtools/pugixml/pugixml_1.9.bb   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/pugixml/pugixml_1.9.bb

diff --git a/meta-oe/recipes-devtools/pugixml/pugixml_1.9.bb b/meta-oe/recipes-devtools/pugixml/pugixml_1.9.bb
new file mode 100644
index 000000000..ad45f87ec
--- /dev/null
+++ b/meta-oe/recipes-devtools/pugixml/pugixml_1.9.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Light-weight C++ XML Processing Library"
+DESCRIPTION = "pugixml is a C++ XML processing library, which consists of a \
+DOM-like interface with rich traversal/modification capabilities, \
+an extremely fast XML parser which constructs the DOM tree from \
+n XML file/buffer, and an XPath 1.0 implementation for complex \
+data-driven tree queries."
+HOMPAGE = "https://pugixml.org/"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://readme.txt;beginline=29;endline=52;md5=1d569c2ed59c94ddd9586051f8c67da6"
+
+SRC_URI = "https://github.com/zeux/${BPN}/releases/download/v${PV}/${BP}.tar.gz"
+SRC_URI[md5sum] = "7286ee2ed11376b6b780ced19fae0b64"
+SRC_URI[sha256sum] = "d156d35b83f680e40fd6412c4455fdd03544339779134617b9b28d19e11fdba6"
+
+inherit cmake
+
+EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON \
+                  -DCMAKE_BUILD_TYPE=Release \
+                  "
-- 
2.21.0


