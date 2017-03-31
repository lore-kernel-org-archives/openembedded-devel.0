Return-Path: <dmitry.rozhkov@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id E9BD171A37
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 11:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490958773; x=1522494773;
	h=from:to:cc:subject:date:message-id;
	bh=biplWTMda+fC3JUWGZLcX40n23j84Qj1PtVYbNMPNCU=;
	b=cT6Kwqmm1KjlNJnOYFeruoCxr/asQc4stQaspIvEixF+kUP3T78Mg0hO
	ItDoXQn91Et4pIcfmEQKU2eVKyhXnw==;
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Mar 2017 04:12:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,251,1486454400"; d="scan'208";a="67338539"
Received: from drozhkov-desk.fi.intel.com ([10.237.72.60])
	by orsmga002.jf.intel.com with ESMTP; 31 Mar 2017 04:12:52 -0700
From: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 14:10:32 +0300
Message-Id: <20170331111032.6573-1-dmitry.rozhkov@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [meta-oe][PATCH] opencv: remove redundant build dependency on python2
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
X-List-Received-Date: Fri, 31 Mar 2017 11:12:53 -0000

The recipe opencv_3.2.bb inherits to either distutils-base or
distutils3-base classes or both which do add appropriate
build dependency on python or python3 respectively.
There's no need to have python in DEPENDS explicitly.

It can even make things needlessly complicated in case a user
wants to build python3-only images.

The redundant build dependency on python is removed from DEPENDS.

Signed-off-by: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
---
 meta-oe/recipes-support/opencv/opencv_3.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.2.bb b/meta-oe/recipes-support/opencv/opencv_3.2.bb
index f47347a..f50bc05 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.2.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.2.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2b2f8752cc5edf504d283107d033f544"
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
 
-DEPENDS = "libtool swig swig-native python bzip2 zlib glib-2.0 libwebp"
+DEPENDS = "libtool swig swig-native bzip2 zlib glib-2.0 libwebp"
 
 SRCREV_opencv = "70bbf17b133496bd7d54d034b0f94bd869e0e810"
 SRCREV_contrib = "86342522b0eb2b16fa851c020cc4e0fef4e010b7"
-- 
2.9.3


