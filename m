Return-Path: <ismo.puustinen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DA56C72F11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Mar 2017 10:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490266102; x=1521802102;
	h=from:to:cc:subject:date:message-id;
	bh=2WlfaxvKscoGCnDegNb/wreG7JX03jwb/Nq/4JZ7W8s=;
	b=tQnSJkfZdoC0hZmYrRhqfEOXP0QzXJhGWPW3r2DqNVq0a4KiCyLX2tf0
	4ycNMS/X6LJCcf4kPJpGv6muktYeFw==;
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Mar 2017 03:48:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,209,1486454400"; d="scan'208";a="1145994102"
Received: from ipuustin-desk.fi.intel.com ([10.237.72.72])
	by fmsmga002.fm.intel.com with ESMTP; 23 Mar 2017 03:48:20 -0700
From: Ismo Puustinen <ismo.puustinen@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Mar 2017 12:48:16 +0200
Message-Id: <20170323104816.22461-1-ismo.puustinen@intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH] opencv: do not depend on swig.
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
X-List-Received-Date: Thu, 23 Mar 2017 10:48:21 -0000

Since swig is a code generator, just depend on swig-native.

Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
---
 meta-oe/recipes-support/opencv/opencv_3.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.2.bb b/meta-oe/recipes-support/opencv/opencv_3.2.bb
index f47347a..cf77fe8 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.2.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.2.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2b2f8752cc5edf504d283107d033f544"
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
 
-DEPENDS = "libtool swig swig-native python bzip2 zlib glib-2.0 libwebp"
+DEPENDS = "libtool swig-native python bzip2 zlib glib-2.0 libwebp"
 
 SRCREV_opencv = "70bbf17b133496bd7d54d034b0f94bd869e0e810"
 SRCREV_contrib = "86342522b0eb2b16fa851c020cc4e0fef4e010b7"
-- 
2.9.3


