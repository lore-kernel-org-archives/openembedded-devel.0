Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0151065F1E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jun 2014 16:24:37 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 09 Jun 2014 09:19:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,1003,1392192000"; d="scan'208";a="545257401"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.49])
	by fmsmga001.fm.intel.com with ESMTP; 09 Jun 2014 09:24:35 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Jun 2014 17:24:30 +0100
Message-Id: <364f9086ac0c992f408413d9b2eb78d53d35b19b.1402331046.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1402331046.git.paul.eggleton@linux.intel.com>
References: <cover.1402331046.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1402331046.git.paul.eggleton@linux.intel.com>
References: <cover.1402331046.git.paul.eggleton@linux.intel.com>
Cc: Eric Benard <eric@eukrea.com>
Subject: [meta-oe][dylan][PATCH 1/1] x264: fix SRCREV after upstream repository change
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
X-List-Received-Date: Mon, 09 Jun 2014 16:24:38 -0000

The upstream x264 project has re-imported all of their old history,
meaning that all of the hashes have changed. Update SRCREV based on the
mapping list they have provided at:

  http://sprunge.us/dGOU

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/recipes-multimedia/x264/x264_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/x264/x264_git.bb b/meta-oe/recipes-multimedia/x264/x264_git.bb
index c767ffd..4da24cc 100644
--- a/meta-oe/recipes-multimedia/x264/x264_git.bb
+++ b/meta-oe/recipes-multimedia/x264/x264_git.bb
@@ -11,7 +11,7 @@ DEPENDS = "yasm-native"
 SRC_URI = "git://git.videolan.org/x264.git \
     file://don-t-default-to-cortex-a9-with-neon.patch \
 "
-SRCREV = "1cffe9f406cc54f4759fc9eeb85598fb8cae66c7"
+SRCREV = "bfed708c5358a2b4ef65923fb0683cefa9184e6f"
 
 PV = "r2230+git"
 
-- 
1.9.3


