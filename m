Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id E141A727E8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Dec 2014 12:20:02 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id b13so1436640wgh.32
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Dec 2014 04:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PZhjfz19fj9tzo2fr08TAHS0r3kxcqrHgS4ii7vW6hg=;
	b=OHK4S/7MjtV/75qrWTnLcxoSH92xlA7QikAq2TkuZyPbNhAphqJ1/cwNh8SqMW5tfm
	HBUq0HHqONHWQwW+G+e7MJYBBICEM777OSKoir/NAw8G8PYdhjyW7KVw8t4ISP2rchGB
	OPiIPFgkn4F1VzNkR/B6X2vTdHsSOn29DIcBzIsZ/yPJhPT/PoIcuiBZxZ4G6erBLnKK
	dpIXhC78ThJ3mqx+9PlTmAzLUMrZ2wL8ZIo5HTUYUegvF+wCkqxbIakxsRuLA1vgXH9P
	mTSqZp+fSg5xealgJ/5eqcgSUzkU+D2fnRpeQh7GXH5Md5xFgGA4c5KY+QhpYPDM+OXV
	61ew==
X-Received: by 10.194.19.4 with SMTP id a4mr3778598wje.3.1418905201868;
	Thu, 18 Dec 2014 04:20:01 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	s4sm24577385wiy.13.2014.12.18.04.20.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Dec 2014 04:20:01 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Dec 2014 13:19:50 +0100
Message-Id: <1418905190-27541-8-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.2.0
In-Reply-To: <1418905190-27541-1-git-send-email-Martin.Jansa@gmail.com>
References: <1418905190-27541-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-python][PATCH 8/8] python-dbusmock: import from meta-webos-ports
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
X-List-Received-Date: Thu, 18 Dec 2014 12:20:03 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...nality-to-add-own-objects-to-internal-obj.patch | 53 ++++++++++++++++++++++
 ...-t-use-gobject-introspection-for-bindings.patch | 29 ++++++++++++
 ...ibility-to-import-templates-from-packages.patch | 29 ++++++++++++
 .../python/python-dbusmock_0.10.1.bb               | 22 +++++++++
 4 files changed, 133 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-dbusmock/0001-Add-functionality-to-add-own-objects-to-internal-obj.patch
 create mode 100644 meta-python/recipes-devtools/python/python-dbusmock/0001-Don-t-use-gobject-introspection-for-bindings.patch
 create mode 100644 meta-python/recipes-devtools/python/python-dbusmock/0002-Add-possibility-to-import-templates-from-packages.patch
 create mode 100644 meta-python/recipes-devtools/python/python-dbusmock_0.10.1.bb

diff --git a/meta-python/recipes-devtools/python/python-dbusmock/0001-Add-functionality-to-add-own-objects-to-internal-obj.patch b/meta-python/recipes-devtools/python/python-dbusmock/0001-Add-functionality-to-add-own-objects-to-internal-obj.patch
new file mode 100644
index 0000000..fdd00b6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-dbusmock/0001-Add-functionality-to-add-own-objects-to-internal-obj.patch
@@ -0,0 +1,53 @@
+From eebe0f66435c4d821b0f5f93f69efe17b4a384c2 Mon Sep 17 00:00:00 2001
+From: Simon Busch <simon.busch@lge.com>
+Date: Wed, 9 Apr 2014 13:18:33 +0200
+Subject: [PATCH 1/2] Add functionality to add own objects to internal object
+ list
+
+In some case the tests might want to create dynamically dbus objects which extended
+functionality from own class definitions within templates. In such cases we need to
+register those objects with the internal object manager of dbusmock.
+
+Signed-off-by: Simon Busch <simon.busch@lge.com>
+---
+ dbusmock/__init__.py   |    4 ++--
+ dbusmock/mockobject.py |    8 ++++++++
+ 2 files changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/dbusmock/__init__.py b/dbusmock/__init__.py
+index f799cc7..6718c06 100644
+--- a/dbusmock/__init__.py
++++ b/dbusmock/__init__.py
+@@ -14,8 +14,8 @@ __license__ = 'LGPL 3+'
+ __version__ = '0.10.1'
+ 
+ from dbusmock.mockobject import (DBusMockObject, MOCK_IFACE,
+-                                 OBJECT_MANAGER_IFACE, get_object, get_objects)
++                                 OBJECT_MANAGER_IFACE, get_object, get_objects, add_object)
+ from dbusmock.testcase import DBusTestCase
+ 
+ __all__ = ['DBusMockObject', 'MOCK_IFACE', 'OBJECT_MANAGER_IFACE',
+-           'DBusTestCase', 'get_object', 'get_objects']
++           'DBusTestCase', 'get_object', 'get_objects', 'add_object']
+diff --git a/dbusmock/mockobject.py b/dbusmock/mockobject.py
+index 97b79ce..a98e03d 100644
+--- a/dbusmock/mockobject.py
++++ b/dbusmock/mockobject.py
+@@ -682,6 +682,14 @@ dbus.service._method_lookup = _dbusmock_method_lookup
+ # Helper API for templates
+ #
+ 
++def add_object(path, obj):
++    if path in objects:
++        raise dbus.exceptions.DBusException(
++                'org.freedesktop.DBus.Mock.NameError',
++                'object %s already exists' % path)
++
++    objects[path] = obj
++
+ 
+ def get_objects():
+     '''Return all existing object paths'''
+-- 
+1.7.9.5
+
diff --git a/meta-python/recipes-devtools/python/python-dbusmock/0001-Don-t-use-gobject-introspection-for-bindings.patch b/meta-python/recipes-devtools/python/python-dbusmock/0001-Don-t-use-gobject-introspection-for-bindings.patch
new file mode 100644
index 0000000..f3ab53c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-dbusmock/0001-Don-t-use-gobject-introspection-for-bindings.patch
@@ -0,0 +1,29 @@
+From 29960f2fce7ab42ed0a1bf8ce96499fdb6eedf3c Mon Sep 17 00:00:00 2001
+From: Simon Busch <simon.busch@lge.com>
+Date: Tue, 25 Mar 2014 15:28:54 +0100
+Subject: [PATCH] Don't use gobject introspection for bindings
+
+In our environment we're not providing the glib python bindings through
+introspection but just pygobject so we need to use the right import.
+
+Signed-off-by: Simon Busch <simon.busch@lge.com>
+---
+ dbusmock/__main__.py |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/dbusmock/__main__.py b/dbusmock/__main__.py
+index 44b63fb..bfd089c 100644
+--- a/dbusmock/__main__.py
++++ b/dbusmock/__main__.py
+@@ -51,7 +51,7 @@ def parse_args():
+ 
+ if __name__ == '__main__':
+     import dbus.mainloop.glib
+-    from gi.repository import GLib
++    import glib as GLib
+ 
+     args = parse_args()
+     dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
+-- 
+1.7.9.5
+
diff --git a/meta-python/recipes-devtools/python/python-dbusmock/0002-Add-possibility-to-import-templates-from-packages.patch b/meta-python/recipes-devtools/python/python-dbusmock/0002-Add-possibility-to-import-templates-from-packages.patch
new file mode 100644
index 0000000..981694f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-dbusmock/0002-Add-possibility-to-import-templates-from-packages.patch
@@ -0,0 +1,29 @@
+From ff1dffd5673bcd2cbd9554ad62476d108dbc18af Mon Sep 17 00:00:00 2001
+From: Simon Busch <simon.busch@lge.com>
+Date: Wed, 9 Apr 2014 13:20:33 +0200
+Subject: [PATCH 2/2] Add possibility to import templates from packages
+
+Does not have any unit tests yet.
+
+Signed-off-by: Simon Busch <simon.busch@lge.com>
+---
+ dbusmock/mockobject.py |    3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/dbusmock/mockobject.py b/dbusmock/mockobject.py
+index a98e03d..9530c2a 100644
+--- a/dbusmock/mockobject.py
++++ b/dbusmock/mockobject.py
+@@ -49,6 +49,9 @@ def load_module(name):
+ 
+         return module
+ 
++    if '.' in name:
++        return importlib.import_module(name)
++
+     return importlib.import_module('dbusmock.templates.' + name)
+ 
+ 
+-- 
+1.7.9.5
+
diff --git a/meta-python/recipes-devtools/python/python-dbusmock_0.10.1.bb b/meta-python/recipes-devtools/python/python-dbusmock_0.10.1.bb
new file mode 100644
index 0000000..b247943
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-dbusmock_0.10.1.bb
@@ -0,0 +1,22 @@
+# Copyright (c) 2014 LG Electronics, Inc.
+
+SUMMARY = "With this program/Python library you can easily create mock objects on D-Bus"
+AUTHOR = "Martin Pitt <martin.pitt@ubuntu.com>"
+SECTION = "devel/python"
+
+LICENSE = "GPL-3.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
+
+DEPENDS += "python-pygobject python-dbus"
+
+SRC_URI = "https://launchpad.net/${BPN}/trunk/${PV}/+download/${BP}.tar.gz"
+SRC_URI[md5sum] = "7370d325c4a75494dd71885ca65b79e8"
+SRC_URI[sha256sum] = "03aadc93bdc26ea18d4d78fcff7b6cb34f4e18623bc5cc41cf9539d663cee11e"
+
+SRC_URI += " \
+    file://0001-Don-t-use-gobject-introspection-for-bindings.patch \
+    file://0001-Add-functionality-to-add-own-objects-to-internal-obj.patch \
+    file://0002-Add-possibility-to-import-templates-from-packages.patch \
+"
+
+inherit setuptools
-- 
2.2.0


