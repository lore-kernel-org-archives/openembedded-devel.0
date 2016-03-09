Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id CBA9B73182
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Mar 2016 15:10:49 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 09 Mar 2016 07:10:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,311,1455004800"; d="scan'208";a="62869321"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 09 Mar 2016 07:10:28 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Mar 2016 17:05:48 +0200
Message-Id: <ece5994cb713308f043a12a4b0335f82d4a15a61.1457535831.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 32/38] python-dbusmock: use real introspection instead on legacy pygobject
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
X-List-Received-Date: Wed, 09 Mar 2016 15:10:50 -0000

The patch that switches to pygobject can be now dropped, because
real introspection is provided in oe-core.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...-t-use-gobject-introspection-for-bindings.patch | 29 ----------------------
 .../python/python-dbusmock_0.10.1.bb               |  1 -
 2 files changed, 30 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-dbusmock/0001-Don-t-use-gobject-introspection-for-bindings.patch

diff --git a/meta-python/recipes-devtools/python/python-dbusmock/0001-Don-t-use-gobject-introspection-for-bindings.patch b/meta-python/recipes-devtools/python/python-dbusmock/0001-Don-t-use-gobject-introspection-for-bindings.patch
deleted file mode 100644
index f3ab53c..0000000
--- a/meta-python/recipes-devtools/python/python-dbusmock/0001-Don-t-use-gobject-introspection-for-bindings.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 29960f2fce7ab42ed0a1bf8ce96499fdb6eedf3c Mon Sep 17 00:00:00 2001
-From: Simon Busch <simon.busch@lge.com>
-Date: Tue, 25 Mar 2014 15:28:54 +0100
-Subject: [PATCH] Don't use gobject introspection for bindings
-
-In our environment we're not providing the glib python bindings through
-introspection but just pygobject so we need to use the right import.
-
-Signed-off-by: Simon Busch <simon.busch@lge.com>
----
- dbusmock/__main__.py |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/dbusmock/__main__.py b/dbusmock/__main__.py
-index 44b63fb..bfd089c 100644
---- a/dbusmock/__main__.py
-+++ b/dbusmock/__main__.py
-@@ -51,7 +51,7 @@ def parse_args():
- 
- if __name__ == '__main__':
-     import dbus.mainloop.glib
--    from gi.repository import GLib
-+    import glib as GLib
- 
-     args = parse_args()
-     dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
--- 
-1.7.9.5
-
diff --git a/meta-python/recipes-devtools/python/python-dbusmock_0.10.1.bb b/meta-python/recipes-devtools/python/python-dbusmock_0.10.1.bb
index b247943..2520bfc 100644
--- a/meta-python/recipes-devtools/python/python-dbusmock_0.10.1.bb
+++ b/meta-python/recipes-devtools/python/python-dbusmock_0.10.1.bb
@@ -14,7 +14,6 @@ SRC_URI[md5sum] = "7370d325c4a75494dd71885ca65b79e8"
 SRC_URI[sha256sum] = "03aadc93bdc26ea18d4d78fcff7b6cb34f4e18623bc5cc41cf9539d663cee11e"
 
 SRC_URI += " \
-    file://0001-Don-t-use-gobject-introspection-for-bindings.patch \
     file://0001-Add-functionality-to-add-own-objects-to-internal-obj.patch \
     file://0002-Add-possibility-to-import-templates-from-packages.patch \
 "
-- 
2.7.0


