Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id AFBC67721C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Feb 2016 08:08:33 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 29 Feb 2016 00:08:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,519,1449561600"; d="scan'208";a="661016167"
Received: from rebeccas-ilbpg3.png.intel.com ([10.88.227.80])
	by FMSMGA003.fm.intel.com with ESMTP; 29 Feb 2016 00:08:34 -0800
From: Rebecca Chang <rebecca.swee.fun.chang@intel.com>
To: openembedded-devel@lists.openembedded.org,
	Rebecca Chang <rebecca.swee.fun.chang@intel.com>
Date: Mon, 29 Feb 2016 16:08:26 +0800
Message-Id: <1456733307-8500-1-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe] [PATCH] Upgrade libvpx to v1.5.0
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
X-List-Received-Date: Mon, 29 Feb 2016 08:08:34 -0000

From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>

Hi,

I would like to upgrade libvpx version to v1.5.0.
This version has included VP9 encoder improvement and speeds
up overall encoding and decoding process.

From webm release changelog:
 - Upgrading:
    This release is ABI incompatible with 1.4.0. It drops deprecated VP8
    controls and adds a variety of VP9 controls for testing.

    The vpxenc utility now prefers VP9 by default.

  - Enhancements:
    Faster VP9 encoding and decoding
    Smaller library size by combining functions used by VP8 and VP9

  - Bug Fixes:
    A variety of fuzzing issues

I would like to merge this recipe upgrade to master and jethro branch.
Please review and provide feedback on this changes.

Thank you.

Regards,
Rebecca

Chang Rebecca Swee Fun (1):
  libvpx: upgrade to version 1.5.0

 meta-oe/recipes-multimedia/webm/libvpx_1.4.0.bb | 51 -------------------------
 meta-oe/recipes-multimedia/webm/libvpx_1.5.0.bb | 50 ++++++++++++++++++++++++
 2 files changed, 50 insertions(+), 51 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/webm/libvpx_1.4.0.bb
 create mode 100644 meta-oe/recipes-multimedia/webm/libvpx_1.5.0.bb

-- 
1.9.1


