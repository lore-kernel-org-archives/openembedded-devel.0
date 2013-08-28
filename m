Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3C1806BCA4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2013 10:45:07 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 28 Aug 2013 03:44:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,975,1367996400"; d="scan'208";a="394649054"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.7])
	by orsmga002.jf.intel.com with ESMTP; 28 Aug 2013 03:44:40 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Aug 2013 11:43:27 +0100
Message-Id: <dc8895d290f57dfc73053aa911c14d07257118e4.1377686481.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1377686481.git.paul.eggleton@linux.intel.com>
References: <cover.1377686481.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1377686481.git.paul.eggleton@linux.intel.com>
References: <cover.1377686481.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe,meta-gnome][PATCH 5/6] libnotify: remove
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
X-List-Received-Date: Wed, 28 Aug 2013 10:45:07 -0000

This is now in OE-Core as of f72c0ff46d6895978e7e5230cb882d8eee4005ba
(libnotify3 remains).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-gnome/recipes-gnome/libnotify/libnotify_0.6.0.bb | 17 -----------------
 1 file changed, 17 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/libnotify/libnotify_0.6.0.bb

diff --git a/meta-gnome/recipes-gnome/libnotify/libnotify_0.6.0.bb b/meta-gnome/recipes-gnome/libnotify/libnotify_0.6.0.bb
deleted file mode 100644
index 0a590e3..0000000
--- a/meta-gnome/recipes-gnome/libnotify/libnotify_0.6.0.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION = "Send desktop notifications to a notification daemon"
-SECTION = "libs"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
-
-PR = "r1"
-
-DEPENDS = "dbus gtk+"
-
-inherit gnome
-SRC_URI[archive.md5sum] = "732c9d2cd5eb6a9069264a319d330516"
-SRC_URI[archive.sha256sum] = "73b16a79bb2fed62dcf146b11c4405776cb96a09dce66379ca541da7dbd64210"
-
-do_configure_prepend() {
-    sed -i /GTK3/d configure.ac
-    sed -i -e /test-gtk3/d -e 's/test-xy-stress \\/test-xy-stress/' tests/Makefile.am
-}
-- 
1.8.1.2


