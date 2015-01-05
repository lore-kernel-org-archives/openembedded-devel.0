Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D231F725DC
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 11:01:02 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 05 Jan 2015 03:01:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,698,1413270000"; d="scan'208";a="646381102"
Received: from kregan-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.17.116])
	by fmsmga001.fm.intel.com with ESMTP; 05 Jan 2015 03:01:02 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Jan 2015 11:00:46 +0000
Message-Id: <c0f0580287fb3551630f23bf43c4fc8db0100049.1420455602.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1420455602.git.paul.eggleton@linux.intel.com>
References: <cover.1420455602.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1420455602.git.paul.eggleton@linux.intel.com>
References: <cover.1420455602.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 02/10] lzip: update to 1.16
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
X-List-Received-Date: Mon, 05 Jan 2015 11:01:05 -0000

* License changed to GPLv2+
* Trim SUMMARY
* gz file is definitely being provided for download upstream, so drop
  comment saying it isn't

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-support/lzip/{lzip_1.15.bb => lzip_1.16.bb}    | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-support/lzip/{lzip_1.15.bb => lzip_1.16.bb} (64%)

diff --git a/meta-oe/recipes-support/lzip/lzip_1.15.bb b/meta-oe/recipes-support/lzip/lzip_1.16.bb
similarity index 64%
rename from meta-oe/recipes-support/lzip/lzip_1.15.bb
rename to meta-oe/recipes-support/lzip/lzip_1.16.bb
index 3d64695..af0b6ae 100644
--- a/meta-oe/recipes-support/lzip/lzip_1.15.bb
+++ b/meta-oe/recipes-support/lzip/lzip_1.16.bb
@@ -1,16 +1,14 @@
-SUMMARY = "Lzip is a lossless data compressor based on the LZMA algorithm"
+SUMMARY = "Lossless data compressor based on the LZMA algorithm"
 HOMEPAGE = "http://lzip.nongnu.org/lzip.html"
 SECTION = "console/utils"
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=76d6e300ffd8fb9d18bd9b136a9bba13 \
+                    file://decoder.cc;endline=16;md5=0809128ac32163252846e09a70c8b80b"
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/lzip/lzip-${PV}.tar.gz"
 
-# Only the latest version is available in .tar.gz format from savannah.gnu.org,
-# FreeBSD distfiles is known to have version 1.13.
-
-SRC_URI[md5sum] = "e83a364c8544fc66cccb552369d93220"
-SRC_URI[sha256sum] = "7cd3fcda68fc9900efcf7784313e3bdd1303fef1a0546db9723f5e5564dd05b6"
+SRC_URI[md5sum] = "716a9876dc595ec52d4f3bda81e42471"
+SRC_URI[sha256sum] = "128cc25baf92c8b69700831e6f984d954016318cc78edca87870d0c033112751"
 
 CONFIGUREOPTS = "\
     '--srcdir=${S}' \
-- 
1.9.3


