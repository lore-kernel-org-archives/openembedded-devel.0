Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id ABD2E70A40
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Aug 2014 16:15:00 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 10 Aug 2014 09:09:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,837,1400050800"; d="scan'208";a="586134168"
Received: from mrdissan-mobl.gar.corp.intel.com (HELO peggleto-mobl5.lan)
	([10.252.122.124])
	by orsmga002.jf.intel.com with ESMTP; 10 Aug 2014 09:15:01 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Aug 2014 17:14:45 +0100
Message-Id: <999cb66f195845ae6087651e1bc7fdce4bc6b0ab.1407687153.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1407687153.git.paul.eggleton@linux.intel.com>
References: <cover.1407687153.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1407687153.git.paul.eggleton@linux.intel.com>
References: <cover.1407687153.git.paul.eggleton@linux.intel.com>
Subject: [meta-systemd][PATCH 5/5] libpam: systemd support now in OE-Core
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
X-List-Received-Date: Sun, 10 Aug 2014 16:15:00 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-systemd/oe-core/recipes-extended/pam/libpam_1.1.6.bbappend | 4 ----
 1 file changed, 4 deletions(-)
 delete mode 100644 meta-systemd/oe-core/recipes-extended/pam/libpam_1.1.6.bbappend

diff --git a/meta-systemd/oe-core/recipes-extended/pam/libpam_1.1.6.bbappend b/meta-systemd/oe-core/recipes-extended/pam/libpam_1.1.6.bbappend
deleted file mode 100644
index db55082..0000000
--- a/meta-systemd/oe-core/recipes-extended/pam/libpam_1.1.6.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-# Register with logind to make screen/tmux/etc work
-do_install_append() {
-    echo "session required    pam_systemd.so" >> ${D}${sysconfdir}/pam.d/common-session
-}
-- 
1.9.3


