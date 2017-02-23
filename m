Return-Path: <amarnath.valluri@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 063C860721
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 09:09:27 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Feb 2017 01:09:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,197,1484035200"; d="scan'208";a="937176340"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by orsmga003.jf.intel.com with ESMTP; 23 Feb 2017 01:09:27 -0800
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2017 11:05:34 +0200
Message-Id: <1487840743-23198-1-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/9] Resending the patches that were missed in patchwork
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
X-List-Received-Date: Thu, 23 Feb 2017 09:09:28 -0000

This patch set replaces the hard-coded paths in recipes with appropriate
bitbake variables, which makes recipe more portable.

Amarnath Valluri (9):
  aufs-utils: Replace install paths with appropriate bitbake environment
  inetutils: Move files only when src != dst.
  ebtables: Move files only when src != dst.
  netcf_git: Check if src != dst while moving files.
  libgphoto: Replace 'lib' with ${nonarch_base_libdir}
  xf86-input-tslib: Replace 'lib' with ${nonarch_base_libdir} for
    placing udev rules.
  lvm2: Replace 'lib' with ${nonarch_base_libdir} for placing udev
    rules.
  multipath-tools: Replace 'lib' with ${nonarch_base_libdir} for placing
    udev rules.
  openct: Replace /lib/udev with ${nonarch_base_libdir}/udev.

 meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb         | 7 +++++++
 meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb | 8 +++++---
 meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb      | 6 ++++--
 meta-networking/recipes-support/netcf/netcf_git.bb                | 8 +++++---
 meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.8.bb              | 2 +-
 meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb    | 6 +++---
 meta-oe/recipes-support/lvm2/lvm2.inc                             | 4 ++--
 meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb    | 7 ++++---
 meta-oe/recipes-support/openct/openct_0.6.20.bb                   | 6 +++---
 9 files changed, 34 insertions(+), 20 deletions(-)

-- 
2.7.4


