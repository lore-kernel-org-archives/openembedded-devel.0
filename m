Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1A24F736B6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2015 10:05:49 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 26 Aug 2015 03:05:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,415,1437462000"; d="scan'208";a="775907426"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2015 03:05:47 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Aug 2015 13:07:02 +0300
Message-Id: <1440583622-11664-3-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1440583622-11664-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1440583622-11664-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: [PATCH 3/3] iso-codes: remove the recipe due to its move to oe-core
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
X-List-Received-Date: Wed, 26 Aug 2015 10:05:49 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta-oe/recipes-support/iso-codes/iso-codes_1.4.bb | 17 -----------------
 1 file changed, 17 deletions(-)
 delete mode 100644 meta-oe/recipes-support/iso-codes/iso-codes_1.4.bb

diff --git a/meta-oe/recipes-support/iso-codes/iso-codes_1.4.bb b/meta-oe/recipes-support/iso-codes/iso-codes_1.4.bb
deleted file mode 100644
index ed89a12..0000000
--- a/meta-oe/recipes-support/iso-codes/iso-codes_1.4.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "ISO language, territory, currency, script codes and their translations"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://LGPL-2.1;md5=fbc093901857fcd118f065f900982c24"
-
-PR = "r2"
-
-SRC_URI = "ftp://pkg-isocodes.alioth.debian.org/pub/pkg-isocodes/iso-codes-${PV}.tar.bz2"
-SRC_URI[md5sum] = "4073466e57df23d39721513219e4f7ae"
-SRC_URI[sha256sum] = "0a7cf177c25b3f0d77c60a5f1149aab9e03ba70f69bac70138a867efe19a1d97"
-
-# inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
-# are inhibited by allarch
-DEPENDS = "gettext-native"
-
-inherit autotools allarch
-
-FILES_${PN} += "${datadir}/xml/"
-- 
2.1.4


