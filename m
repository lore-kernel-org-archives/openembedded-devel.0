Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8AFBD726D0
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 11:01:03 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 05 Jan 2015 03:01:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,698,1413270000"; d="scan'208";a="646381106"
Received: from kregan-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.17.116])
	by fmsmga001.fm.intel.com with ESMTP; 05 Jan 2015 03:01:03 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Jan 2015 11:00:47 +0000
Message-Id: <a0ff960271975254d1c2760e4af4d83996a6b388.1420455602.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1420455602.git.paul.eggleton@linux.intel.com>
References: <cover.1420455602.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1420455602.git.paul.eggleton@linux.intel.com>
References: <cover.1420455602.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 03/10] ddrescue: update to 1.19
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
X-List-Received-Date: Mon, 05 Jan 2015 11:01:06 -0000

* License changed to GPLv2+
* Upstream now only releases .lz files for new releases

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../ddrescue/{ddrescue_1.16.bb => ddrescue_1.19.bb}       | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-extended/ddrescue/{ddrescue_1.16.bb => ddrescue_1.19.bb} (54%)

diff --git a/meta-oe/recipes-extended/ddrescue/ddrescue_1.16.bb b/meta-oe/recipes-extended/ddrescue/ddrescue_1.19.bb
similarity index 54%
rename from meta-oe/recipes-extended/ddrescue/ddrescue_1.16.bb
rename to meta-oe/recipes-extended/ddrescue/ddrescue_1.19.bb
index a36c250..dc485b3 100644
--- a/meta-oe/recipes-extended/ddrescue/ddrescue_1.16.bb
+++ b/meta-oe/recipes-extended/ddrescue/ddrescue_1.19.bb
@@ -4,14 +4,17 @@ DESCRIPTION = "GNU ddrescue is a data recovery tool. It copies data \
     trying hard to rescue data in case of read errors."
 HOMEPAGE = "http://www.gnu.org/software/ddrescue/ddrescue.html"
 SECTION = "console"
-LICENSE = "GPLv3+"
+LICENSE = "GPLv2+"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
-                    file://main_common.cc;beginline=5;endline=16;md5=b5a59150a33658cc1ffc31b1a4ffb9f2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=76d6e300ffd8fb9d18bd9b136a9bba13 \
+                    file://main_common.cc;beginline=5;endline=16;md5=3ec288b2676528cd2b069364e313016f"
 
-SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz"
-SRC_URI[md5sum] = "57b67407e882c6418531d48a2f20d16b"
-SRC_URI[sha256sum] = "76b3f2e5fb0306d24f2632c3e168cccb73dc0a348e3a7089cd9230748ff23de6"
+SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.lz"
+SRC_URI[md5sum] = "ed6b5b82d74cbd925db2b829350e74b1"
+SRC_URI[sha256sum] = "ed8d0c9d9aac80a9110e9cb0d0a91a7390d3bf9f816b67a62ca4eb140f4747b8"
+
+# This isn't already added by base.bbclass
+do_unpack[depends] += "lzip-native:do_populate_sysroot"
 
 inherit autotools
 
-- 
1.9.3


