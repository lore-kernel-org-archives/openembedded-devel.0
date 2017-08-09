Return-Path: <ismo.puustinen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7F4BA71C56
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Aug 2017 12:59:23 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Aug 2017 05:59:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,348,1498546800"; d="scan'208";a="1001727872"
Received: from ipuustin-desk.fi.intel.com ([10.237.72.72])
	by orsmga003.jf.intel.com with ESMTP; 09 Aug 2017 05:59:21 -0700
From: Ismo Puustinen <ismo.puustinen@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Aug 2017 15:58:59 +0300
Message-Id: <20170809125900.6039-1-ismo.puustinen@intel.com>
X-Mailer: git-send-email 2.13.4
Subject: [PATCH 0/1] Update OpenCV from version 3.2 to 3.3.
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
X-List-Received-Date: Wed, 09 Aug 2017 12:59:23 -0000

OpenCV has a number of configuration options, and I couldn't test all of
them. Further testing would be very welcome! I removed the patches which
were just backporting functionality or which said that future commits
would make them obsolete, and rebased some others.

Ismo Puustinen (1):
  opencv: update to version 3.3.

 ...01-3rdparty-ippicv-Use-pre-downloaded-ipp.patch |  44 ++--
 .../0001-Revert-cuda-fix-fp16-compilation.patch    |  27 ---
 ...cking-make-opencv_dnn-dependancy-optional.patch | 243 --------------------
 ...ts-create-share-library-intead-of-static.patch} |  12 +-
 ...vert-check-FP16-build-condition-correctly.patch | 245 ---------------------
 ...patch => 0003-To-fix-errors-as-following.patch} |  22 +-
 .../opencv/opencv/uselocalxfeatures.patch          |  26 ++-
 .../opencv/opencv/useoeprotobuf.patch              |  13 --
 .../opencv/{opencv_3.2.bb => opencv_3.3.bb}        |  43 ++--
 9 files changed, 89 insertions(+), 586 deletions(-)
 delete mode 100644 meta-oe/recipes-support/opencv/opencv/0001-Revert-cuda-fix-fp16-compilation.patch
 delete mode 100644 meta-oe/recipes-support/opencv/opencv/0001-tracking-make-opencv_dnn-dependancy-optional.patch
 rename meta-oe/recipes-support/opencv/opencv/{0001-Make-opencv-ts-create-share-library-intead-of-static.patch => 0002-Make-opencv-ts-create-share-library-intead-of-static.patch} (64%)
 delete mode 100644 meta-oe/recipes-support/opencv/opencv/0002-Revert-check-FP16-build-condition-correctly.patch
 rename meta-oe/recipes-support/opencv/opencv/{0001-To-fix-errors-as-following.patch => 0003-To-fix-errors-as-following.patch} (82%)
 delete mode 100644 meta-oe/recipes-support/opencv/opencv/useoeprotobuf.patch
 rename meta-oe/recipes-support/opencv/{opencv_3.2.bb => opencv_3.3.bb} (89%)

-- 
2.13.4


