Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E1E3562009
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Jul 2013 14:47:37 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 Jul 2013 07:45:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,659,1367996400"; d="scan'208";a="345067073"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.68])
	by orsmga001.jf.intel.com with ESMTP; 13 Jul 2013 07:47:33 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Jul 2013 15:47:21 +0100
Message-Id: <f70cc47eb65740d7307194b9a4e3414f78180348.1373726565.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1373726565.git.paul.eggleton@linux.intel.com>
References: <cover.1373726565.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1373726565.git.paul.eggleton@linux.intel.com>
References: <cover.1373726565.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 1/3] protobuf: add recipe from meta-virtualization and tweak
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
X-List-Received-Date: Sat, 13 Jul 2013 14:47:38 -0000

* Add proper SUMMARY
* Break long DESCRIPTION onto multiple lines
* Reorder some lines

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf_2.4.1.bb | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf_2.4.1.bb

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_2.4.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf_2.4.1.bb
new file mode 100644
index 0000000..c4ed5e6
--- /dev/null
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_2.4.1.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Protocol Buffers - structured data serialisation mechanism"
+DESCRIPTION = "Protocol Buffers are a way of encoding structured data in an \
+efficient yet extensible format. Google uses Protocol Buffers for almost \
+all of its internal RPC protocols and file formats."
+HOMEPAGE = "http://code.google.com/p/protobuf/"
+SECTION = "console/tools"
+LICENSE = "BSD-3-Clause"
+
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=af6809583bfde9a31595a58bb4a24514"
+
+SRC_URI = "http://protobuf.googlecode.com/files/protobuf-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "dc84e9912ea768baa1976cb7bbcea7b5"
+SRC_URI[sha256sum] = "eac6969b617f397247e805267da2b0db3ff9e5a9163b123503a192fbb5776567"
+
+EXTRA_OECONF += " --with-protoc=echo"
+
+inherit autotools
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.8.1.2


