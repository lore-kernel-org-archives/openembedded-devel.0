Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3A44F77343
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2016 14:23:41 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 23 Feb 2016 06:23:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,489,1449561600"; d="scan'208";a="751677023"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 23 Feb 2016 06:23:41 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Feb 2016 16:20:05 +0200
Message-Id: <3a468b9614c945dee07ced1b88d09063bc45ab8f.1456236552.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
References: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
References: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 26/34] babl: update to 0.1.16
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
X-List-Received-Date: Tue, 23 Feb 2016 14:23:41 -0000

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


