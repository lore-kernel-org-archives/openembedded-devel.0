Return-Path: <maxin.john@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 506C871C14
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Mar 2017 09:22:50 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 13 Mar 2017 02:22:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,158,1486454400"; d="scan'208";a="66851277"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 13 Mar 2017 02:22:51 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	by linux.intel.com (Postfix) with ESMTP id 6ABAF2C8001
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Mar 2017 02:22:47 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Mar 2017 11:22:17 +0200
Message-Id: <1489396937-21461-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [meta-java][PATCH] jikes: fix absolute symlink error
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
X-List-Received-Date: Mon, 13 Mar 2017 09:22:51 -0000

The following oe-core commit made asbolute symlink an error:

commit 3eee8e99e114b3db8b718834ca52da8d2919b83f
sstate: Make absolute symlinks an error

Fix this by inheritting relative_symlinks class:
ERROR: jikes-native-1.22-r0 do_populate_sysroot: sstate found an
absolute path symlink

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 recipes-core/jikes/jikes_1.22.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/jikes/jikes_1.22.bb b/recipes-core/jikes/jikes_1.22.bb
index 0c33118..a35cfcf 100644
--- a/recipes-core/jikes/jikes_1.22.bb
+++ b/recipes-core/jikes/jikes_1.22.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = " \
                    "
 SRC_URI = "${SOURCEFORGE_MIRROR}/jikes/jikes-${PV}.tar.bz2"
 
-inherit autotools update-alternatives
+inherit autotools update-alternatives relative_symlinks
 
 BBCLASSEXTEND = "native"
 
-- 
2.4.0


