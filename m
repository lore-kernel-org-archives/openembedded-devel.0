Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8F0EB6B6EA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Mar 2016 02:58:26 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 03 Mar 2016 18:58:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,534,1449561600"; d="scan'208";a="757841838"
Received: from rebeccas-ilbpg3.png.intel.com ([10.88.227.80])
	by orsmga003.jf.intel.com with ESMTP; 03 Mar 2016 18:58:25 -0800
From: Rebecca Chang <rebecca.swee.fun.chang@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Mar 2016 10:58:18 +0800
Message-Id: <1457060299-11836-1-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 1.9.1
Cc: Rebecca Chang <rebecca.swee.fun.chang@intel.com>
Subject: [meta-oe] [PATCH v4] Upgrade libvpx to v1.5.0
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
X-List-Received-Date: Fri, 04 Mar 2016 02:58:26 -0000

From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>

Hi,

[V4: Remove --enable-vp8 configuration options. It is enabled by default]

[V3: Resend with -M option, force git to detect rename]

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

 .../recipes-multimedia/webm/{libvpx_1.4.0.bb => libvpx_1.5.0.bb}  | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-multimedia/webm/{libvpx_1.4.0.bb => libvpx_1.5.0.bb} (86%)

-- 
1.9.1


