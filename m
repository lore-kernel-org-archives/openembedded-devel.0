Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id EEA1A7737A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2016 14:23:32 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 23 Feb 2016 06:23:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,489,1449561600"; d="scan'208";a="751676986"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 23 Feb 2016 06:23:33 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Feb 2016 16:19:57 +0200
Message-Id: <4291eb4c1d9d648cffc5e3fa4e56201dc493cc6e.1456236552.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
References: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
References: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 18/34] bluez4: use real introspection instead of legacy pygobject
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
X-List-Received-Date: Tue, 23 Feb 2016 14:23:33 -0000

Now that the real introspection is available, and legacy pygobject is not,
the patch to use the latter should be removed.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...pygobject-instead-ofgobject-introspection.patch | 27 ----------------------
 meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb |  1 -
 2 files changed, 28 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/bluez/bluez4-4.101/use-legacy-pygobject-instead-ofgobject-introspection.patch

diff --git a/meta-oe/recipes-connectivity/bluez/bluez4-4.101/use-legacy-pygobject-instead-ofgobject-introspection.patch b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/use-legacy-pygobject-instead-ofgobject-introspection.patch
deleted file mode 100644
index 37037f5..0000000
--- a/meta-oe/recipes-connectivity/bluez/bluez4-4.101/use-legacy-pygobject-instead-ofgobject-introspection.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Upstream-Status: Inappropriate
-
-use legacy pygobject instead of gobject-introspection
-
-Signed-off-by: Zhong Hongbo <hongbo.zhong@windriver.com>
----
-diff -Nurd bluez-4.101.orig/test/simple-agent bluez-4.101/test/simple-agent
---- bluez-4.101.orig/test/simple-agent	2013-11-13 17:14:08.138118159 +0800
-+++ bluez-4.101/test/simple-agent	2013-11-13 17:14:29.034118107 +0800
-@@ -2,7 +2,7 @@
- 
- from __future__ import absolute_import, print_function, unicode_literals
- 
--from gi.repository import GObject
-+import gobject
- 
- import sys
- import dbus
-@@ -122,7 +122,7 @@
- 	path = "/test/agent"
- 	agent = Agent(bus, path)
- 
--	mainloop = GObject.MainLoop()
-+	mainloop = gobject.MainLoop()
- 
- 	if len(args) > 1:
- 		if len(args) > 2:
diff --git a/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb b/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb
index 7719d05..d6d16c0 100644
--- a/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb
+++ b/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb
@@ -10,7 +10,6 @@ SRC_URI += "file://bluetooth.conf \
             file://obsolete_automake_macros.patch \
             file://network-fix-network-Connect-method-parameters.patch \
             file://install-test-script.patch \
-            file://use-legacy-pygobject-instead-ofgobject-introspection.patch \
             file://fix_encrypt_collision.patch \
 "
 
-- 
2.7.0


