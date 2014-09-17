Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 6B81F71499
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Sep 2014 14:41:47 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 17 Sep 2014 07:32:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="387425240"
Received: from cfitzsim-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.123])
	by FMSMGA003.fm.intel.com with ESMTP; 17 Sep 2014 07:36:11 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Sep 2014 15:41:22 +0100
Message-Id: <cover.1410964797.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [meta-oe/meta-systemd][PATCH 0/4] Tidy up for recent OE-Core changes
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
X-List-Received-Date: Wed, 17 Sep 2014 14:41:55 -0000

The following changes since commit 28e26a9b0ad37d0c92ba42b2727215eef1edf5a2:

  tcpslice: add recipe under tcpdump (2014-09-09 10:32:51 -0400)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/cleanup5
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/cleanup5

Paul Eggleton (4):
  libunwind: remove as recipe is now in OE-Core
  dhcp: remove parts now merged into OE-Core recipe
  portmap: systemd support now in OE-Core
  keymaps: systemd support now in OE-Core

 meta-oe/recipes-support/libunwind/libunwind.inc    | 30 ----------------------
 meta-oe/recipes-support/libunwind/libunwind_1.1.bb |  4 ---
 .../recipes-bsp/keymaps/keymaps/keymaps.service    |  9 -------
 .../recipes-bsp/keymaps/keymaps_1.0.bbappend       | 11 --------
 .../recipes-connectivity/dhcp/dhcp/dhcpd.service   | 12 ---------
 .../dhcp/dhcp/dhcrelay.service                     | 10 --------
 .../recipes-connectivity/dhcp/dhcp_%.bbappend      | 23 +++--------------
 .../portmap/portmap/portmap.service                | 10 --------
 .../portmap/portmap_6.0.bbappend                   | 11 --------
 9 files changed, 3 insertions(+), 117 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libunwind/libunwind.inc
 delete mode 100644 meta-oe/recipes-support/libunwind/libunwind_1.1.bb
 delete mode 100644 meta-systemd/oe-core/recipes-bsp/keymaps/keymaps/keymaps.service
 delete mode 100644 meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp/dhcpd.service
 delete mode 100644 meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp/dhcrelay.service
 delete mode 100644 meta-systemd/oe-core/recipes-connectivity/portmap/portmap/portmap.service

-- 
1.9.3


