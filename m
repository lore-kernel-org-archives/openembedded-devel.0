Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id B384D6FF56
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Mar 2016 15:10:47 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 09 Mar 2016 07:10:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,311,1455004800"; d="scan'208";a="62869210"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 09 Mar 2016 07:10:20 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Mar 2016 17:05:41 +0200
Message-Id: <43778e1f4e4eb68d3bd09a7a95ced28d5855c493.1457535831.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 25/38] babl: update to 0.1.16
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
X-List-Received-Date: Wed, 09 Mar 2016 15:10:49 -0000

This fixes gobject introspection support.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta-oe/recipes-graphics/babl/{babl_0.1.10.bb => babl_0.1.16.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/babl/{babl_0.1.10.bb => babl_0.1.16.bb} (72%)

diff --git a/meta-oe/recipes-graphics/babl/babl_0.1.10.bb b/meta-oe/recipes-graphics/babl/babl_0.1.16.bb
similarity index 72%
rename from meta-oe/recipes-graphics/babl/babl_0.1.10.bb
rename to meta-oe/recipes-graphics/babl/babl_0.1.16.bb
index 4892021..daea052 100644
--- a/meta-oe/recipes-graphics/babl/babl_0.1.10.bb
+++ b/meta-oe/recipes-graphics/babl/babl_0.1.16.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
 inherit gnomebase
 
 SRC_URI = "http://ftp.gimp.org/pub/${BPN}/0.1/${BP}.tar.bz2"
-SRC_URI[md5sum] = "9e1542ab5c0b12ea3af076a9a2f02d79"
-SRC_URI[sha256sum] = "943fc36ceac7dd25bc928256bc7b535a42989c6b971578146869eee5fe5955f4"
+SRC_URI[md5sum] = "a1c72e5f5d55a8b736ef2fa67ddb86ec"
+SRC_URI[sha256sum] = "7d6ba55ec53ee6f6bf6945beec28839d09ff72376f4d83035eb379cd4f3e980e"
 
 FILES_${PN} += "${libdir}/babl-*/*.so"
 FILES_${PN}-dev += "${libdir}/babl-*/*.la"
-- 
2.7.0


