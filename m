Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3659670034
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Sep 2016 11:41:06 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 01 Sep 2016 04:41:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,267,1470726000"; d="scan'208";a="1050112963"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 01 Sep 2016 04:41:06 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 7D5B66A4080
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Sep 2016 04:40:46 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Sep 2016 14:40:39 +0300
Message-Id: <1472730043-31245-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 0/4] move tslib, pointercal and xtscal recipes from oe-core
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
X-List-Received-Date: Thu, 01 Sep 2016 11:41:07 -0000

Move tslib tslib, pointercal and xtscal recipes from oe-core. These recipes
are already removed from oe-core with these commits:

1. xtscal: remove recipe : 5bcdb9f0995474635789cf0774aba9b774277c53
2. tslib: remove recipe : d37f6b595fd9ce53c79ff9281f2e20df7fa0503d
3. pointercal: remove recipe: d56dffe629dfc86a8d3c7a043c8c2893004f803e

Maxin B. John (4):
  pointercal: move recipe from oe-core
  meta-gpe: add pointercal to layer.conf
  xtscal: move recipe from oe-core
  tslib: move recipe from oe-core

 meta-gpe/conf/layer.conf                           |   2 +
 meta-gpe/recipes-bsp/pointercal/pointercal/COPYING |   2 +
 .../recipes-bsp/pointercal/pointercal/pointercal   |   0
 .../pointercal/pointercal/qemuarm/pointercal       |   1 +
 .../pointercal/pointercal/qemuarmv6/pointercal     |   1 +
 .../pointercal/pointercal/qemuarmv7/pointercal     |   1 +
 .../pointercal/pointercal/qemumips/pointercal      |   1 +
 .../pointercal/pointercal/qemuppc/pointercal       | Bin 0 -> 36 bytes
 .../pointercal/pointercal/qemux86-64/pointercal    |   1 +
 .../pointercal/pointercal/qemux86/pointercal       |   1 +
 meta-gpe/recipes-bsp/pointercal/pointercal_0.0.bb  |  22 +
 meta-gpe/recipes-graphics/tslib/tslib/ts.conf      |  25 +
 meta-gpe/recipes-graphics/tslib/tslib/tslib.sh     |   8 +
 meta-gpe/recipes-graphics/tslib/tslib_1.1.bb       |  53 ++
 .../xtscal/xtscal/30xTs_Calibrate.sh               |  13 +
 .../xtscal/xtscal/change-cross.patch               |  18 +
 .../recipes-graphics/xtscal/xtscal/cleanup.patch   | 621 +++++++++++++++++++++
 .../xtscal/dso_linking_change_build_fix.patch      |  27 +
 meta-gpe/recipes-graphics/xtscal/xtscal_0.6.3.bb   |  33 ++
 19 files changed, 830 insertions(+)
 create mode 100644 meta-gpe/recipes-bsp/pointercal/pointercal/COPYING
 create mode 100644 meta-gpe/recipes-bsp/pointercal/pointercal/pointercal
 create mode 100644 meta-gpe/recipes-bsp/pointercal/pointercal/qemuarm/pointercal
 create mode 100644 meta-gpe/recipes-bsp/pointercal/pointercal/qemuarmv6/pointercal
 create mode 100644 meta-gpe/recipes-bsp/pointercal/pointercal/qemuarmv7/pointercal
 create mode 100644 meta-gpe/recipes-bsp/pointercal/pointercal/qemumips/pointercal
 create mode 100644 meta-gpe/recipes-bsp/pointercal/pointercal/qemuppc/pointercal
 create mode 100644 meta-gpe/recipes-bsp/pointercal/pointercal/qemux86-64/pointercal
 create mode 100644 meta-gpe/recipes-bsp/pointercal/pointercal/qemux86/pointercal
 create mode 100644 meta-gpe/recipes-bsp/pointercal/pointercal_0.0.bb
 create mode 100644 meta-gpe/recipes-graphics/tslib/tslib/ts.conf
 create mode 100644 meta-gpe/recipes-graphics/tslib/tslib/tslib.sh
 create mode 100644 meta-gpe/recipes-graphics/tslib/tslib_1.1.bb
 create mode 100644 meta-gpe/recipes-graphics/xtscal/xtscal/30xTs_Calibrate.sh
 create mode 100644 meta-gpe/recipes-graphics/xtscal/xtscal/change-cross.patch
 create mode 100644 meta-gpe/recipes-graphics/xtscal/xtscal/cleanup.patch
 create mode 100644 meta-gpe/recipes-graphics/xtscal/xtscal/dso_linking_change_build_fix.patch
 create mode 100644 meta-gpe/recipes-graphics/xtscal/xtscal_0.6.3.bb

-- 
2.4.0


