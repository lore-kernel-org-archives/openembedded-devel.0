Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 51CA36B67D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Aug 2013 22:30:10 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 13 Aug 2013 15:30:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,873,1367996400"; d="scan'208";a="281576319"
Received: from akagikob-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.122.214])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Aug 2013 15:30:09 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Aug 2013 23:30:02 +0100
Message-Id: <cover.1376432969.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [meta-oe][PATCH 0/3] Removals after addition of libav to OE-Core
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
X-List-Received-Date: Tue, 13 Aug 2013 22:30:10 -0000

The following changes since commit fa914e4c80bcb29d2526bda3d0d916f71f8f6df4:

  gst-ffmpeg: drop .bbappend, moved to oe-core (2013-08-14 00:20:24 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/libav-core
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/libav-core

Paul Eggleton (3):
  libav: remove
  x264: remove
  yasm: remove

 .../0001-configure-enable-pic-for-AArch64.patch    |  27 -----
 meta-oe/recipes-multimedia/libav/libav.inc         | 127 ---------------------
 meta-oe/recipes-multimedia/libav/libav_0.8.4.bb    |  28 -----
 meta-oe/recipes-multimedia/libav/libav_git.bb      |  23 ----
 .../don-t-default-to-cortex-a9-with-neon.patch     |  20 ----
 meta-oe/recipes-multimedia/x264/x264_git.bb        |  47 --------
 meta-oe/recipes-support/yasm/yasm_1.2.0.bb         |  15 ---
 7 files changed, 287 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/libav/libav-0.8.4/0001-configure-enable-pic-for-AArch64.patch
 delete mode 100644 meta-oe/recipes-multimedia/libav/libav.inc
 delete mode 100644 meta-oe/recipes-multimedia/libav/libav_0.8.4.bb
 delete mode 100644 meta-oe/recipes-multimedia/libav/libav_git.bb
 delete mode 100644 meta-oe/recipes-multimedia/x264/x264/don-t-default-to-cortex-a9-with-neon.patch
 delete mode 100644 meta-oe/recipes-multimedia/x264/x264_git.bb
 delete mode 100644 meta-oe/recipes-support/yasm/yasm_1.2.0.bb

-- 
1.8.1.2


