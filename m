Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id DE4B676D96
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Sep 2015 12:25:07 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 14 Sep 2015 05:25:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,527,1437462000"; d="scan'208";a="644443678"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 14 Sep 2015 05:25:08 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Sep 2015 15:26:44 +0300
Message-Id: <1442233610-32279-5-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1442233610-32279-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1442233610-32279-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: [PATCH 5/9] p11-kit: remove the recipe due to its move to oe-core
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
X-List-Received-Date: Mon, 14 Sep 2015 12:25:08 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb | 18 ------------------
 1 file changed, 18 deletions(-)
 delete mode 100644 meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb

diff --git a/meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb b/meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb
deleted file mode 100644
index e0ebe7d..0000000
--- a/meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "Provides a way to load and enumerate PKCS#11 modules"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=02933887f609807fbb57aa4237d14a50"
-
-inherit autotools gettext pkgconfig
-
-DEPENDS = "libtasn1 libffi"
-
-SRC_URI = "http://p11-glue.freedesktop.org/releases/${BP}.tar.gz"
-SRC_URI[md5sum] = "d96046ab6ac00d005342caf416ed76ab"
-SRC_URI[sha256sum] = "94fbed372c11d0a404762aad966e54eb4f44c1d5b871a1b79a1a3b4cf36ed256"
-
-FILES_${PN}-dev += " \
-    ${libdir}/p11-kit-proxy.so \
-    ${libdir}/pkcs11/p11-kit-trust.so \
-"
-FILES_${PN}-dev += "${libdir}/pkcs11/*.la"
-FILES_${PN}-dbg += "${libdir}/pkcs11/.debug"
-- 
2.1.4


