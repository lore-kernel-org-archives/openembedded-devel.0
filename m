Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.22999.1589726102256787426
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 May 2020 07:35:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=SyEFMmxF;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=5ztw=67=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49Q4Rk4MgNz3p
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2020 16:34:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589726098;
	bh=xndmlh0J7jsoDXYhpSFx1VRP5UP/kE7AipBoH1F+x9k=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SyEFMmxFgRsEonUL9JrCI7Wug8zocVFBwkGcS6rT84vlovJkcJK+NZLb3MFZRG8od
	 QgXT02YBkEZm+Xku9OfB8m82mK10uxBpu7xS1tV1+SMySyJKDnW+c7CfmpwLwxWKnM
	 uz/Se3QMZhNV1S27OblhF2fqWkmOzbVdGKzz6y899idywIzhBEH/8EKApXZI2Dvg8p
	 nRLvWHY76jqIYVHUcuOq0+YFvuHfK+l0PNmLRwViCtv0erF8vfbIpPoKjZBsebVQp6
	 c9+ZouGDAMgGsQNnICc/Do5mewqnEe2Dh2yORLwAKrbdXTEXF1//B60MGzf1fOCqUv
	 4C/wEOk15+3BqqdbEg+W7wTZj3zMAdlledbwb1i6fsCEVaWmi61pSz1Q8j+z6eRtvi
	 ki3haY7jaL5GAyQWSEUjbYpMoy1RO9UC7NMo5+ANqr8Ia1BIzANijul6KJLhmBw5fZ
	 vYL30ae+kJyqDtKmgMx8FP8gJsZE3HFXHPLGrEpbeXBMCVp0uKqxvLJUthhDEogmVP
	 QGWnpj9LoKaDUPkVNzFYndLezRMZXQyHKEmSvaR/sjF50vOv3BC2aEi8IEu5yo8XqT
	 7yS3JM/pNVBNnC00306UgAEVN/uZFyXKpI8iei+BI5JF6zA2lT61JVMdLec9jIGpej
	 onBOcPU1IwdIZ05mJVrsxMUo=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/4] python3-dbusmock: Remove, moved to OE-core
Date: Sun, 17 May 2020 17:34:54 +0300
Message-Id: <20200517143456.24873-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200517143456.24873-1-bunk@stusta.de>
References: <20200517143456.24873-1-bunk@stusta.de>

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...y-to-add-own-objects-to-internal-obj.patch | 52 -------------------
 ...ty-to-import-templates-from-packages.patch | 27 ----------
 .../python/python3-dbusmock_0.16.7.bb         | 25 ---------
 3 files changed, 104 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-dbusmock/0001-Add-functionality-to-add-own-objects-to-internal-obj.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-dbusmock/0002-Add-possibility-to-import-templates-from-packages.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-dbusmock_0.16.7.bb

diff --git a/meta-python/recipes-devtools/python/python3-dbusmock/0001-Add-functionality-to-add-own-objects-to-internal-obj.patch b/meta-python/recipes-devtools/python/python3-dbusmock/0001-Add-functionality-to-add-own-objects-to-internal-obj.patch
deleted file mode 100644
index c4d817849..000000000
--- a/meta-python/recipes-devtools/python/python3-dbusmock/0001-Add-functionality-to-add-own-objects-to-internal-obj.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From c4436fd42f2936e5fb0f95434d06e45aa9959ca0 Mon Sep 17 00:00:00 2001
-From: Simon Busch <simon.busch@lge.com>
-Date: Wed, 9 Apr 2014 13:18:33 +0200
-Subject: [PATCH] Add functionality to add own objects to internal object
-
- list
-
-In some case the tests might want to create dynamically dbus objects which extended
-functionality from own class definitions within templates. In such cases we need to
-register those objects with the internal object manager of dbusmock.
-
-Signed-off-by: Simon Busch <simon.busch@lge.com>
-
----
- dbusmock/__init__.py   | 4 ++--
- dbusmock/mockobject.py | 8 ++++++++
- 2 files changed, 10 insertions(+), 2 deletions(-)
-
-diff --git a/dbusmock/__init__.py b/dbusmock/__init__.py
-index 8a482ab..3d5d71a 100644
---- a/dbusmock/__init__.py
-+++ b/dbusmock/__init__.py
-@@ -14,8 +14,8 @@ __license__ = 'LGPL 3+'
- __version__ = '0.16.7'
- 
- from dbusmock.mockobject import (DBusMockObject, MOCK_IFACE,
--                                 OBJECT_MANAGER_IFACE, get_object, get_objects)
-+                                 OBJECT_MANAGER_IFACE, get_object, get_objects, add_object)
- from dbusmock.testcase import DBusTestCase
- 
- __all__ = ['DBusMockObject', 'MOCK_IFACE', 'OBJECT_MANAGER_IFACE',
--           'DBusTestCase', 'get_object', 'get_objects']
-+           'DBusTestCase', 'get_object', 'get_objects', 'add_object']
-diff --git a/dbusmock/mockobject.py b/dbusmock/mockobject.py
-index 586dbad..e4f130f 100644
---- a/dbusmock/mockobject.py
-+++ b/dbusmock/mockobject.py
-@@ -688,6 +688,14 @@ dbus.service._method_lookup = _dbusmock_method_lookup
- # Helper API for templates
- #
- 
-+def add_object(path, obj):
-+    if path in objects:
-+        raise dbus.exceptions.DBusException(
-+                'org.freedesktop.DBus.Mock.NameError',
-+                'object %s already exists' % path)
-+
-+    objects[path] = obj
-+
- 
- def get_objects():
-     '''Return all existing object paths'''
diff --git a/meta-python/recipes-devtools/python/python3-dbusmock/0002-Add-possibility-to-import-templates-from-packages.patch b/meta-python/recipes-devtools/python/python3-dbusmock/0002-Add-possibility-to-import-templates-from-packages.patch
deleted file mode 100644
index 06ab1f05e..000000000
--- a/meta-python/recipes-devtools/python/python3-dbusmock/0002-Add-possibility-to-import-templates-from-packages.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 03bd5cb77c54033857810bb17562859eefa41221 Mon Sep 17 00:00:00 2001
-From: Simon Busch <simon.busch@lge.com>
-Date: Wed, 9 Apr 2014 13:20:33 +0200
-Subject: [PATCH] Add possibility to import templates from packages
-
-Does not have any unit tests yet.
-
-Signed-off-by: Simon Busch <simon.busch@lge.com>
-
----
- dbusmock/mockobject.py | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/dbusmock/mockobject.py b/dbusmock/mockobject.py
-index e4f130f..389df70 100644
---- a/dbusmock/mockobject.py
-+++ b/dbusmock/mockobject.py
-@@ -46,6 +46,9 @@ def load_module(name):
-             exec(f.read(), mod.__dict__, mod.__dict__)
-         return mod
- 
-+    if '.' in name:
-+        return importlib.import_module(name)
-+
-     return importlib.import_module('dbusmock.templates.' + name)
- 
- 
diff --git a/meta-python/recipes-devtools/python/python3-dbusmock_0.16.7.bb b/meta-python/recipes-devtools/python/python3-dbusmock_0.16.7.bb
deleted file mode 100644
index cd760ab89..000000000
--- a/meta-python/recipes-devtools/python/python3-dbusmock_0.16.7.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-# Copyright (c) 2014 LG Electronics, Inc.
-
-SUMMARY = "With this program/Python library you can easily create mock objects on D-Bus"
-AUTHOR = "Martin Pitt <martin.pitt@ubuntu.com>"
-
-LICENSE = "GPL-3.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
-
-SRC_URI[md5sum] = "80f8caa838fad96483a8751e11d384f9"
-SRC_URI[sha256sum] = "2d2ea892fa4633c3ec6ac1e912120ec493047a5c6522849b7d1c95ad755bce75"
-
-SRC_URI += " \
-    file://0001-Add-functionality-to-add-own-objects-to-internal-obj.patch \
-    file://0002-Add-possibility-to-import-templates-from-packages.patch \
-"
-
-PYPI_PACKAGE = "python-dbusmock"
-
-inherit pypi setuptools3
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-dbus \
-    ${PYTHON_PN}-pygobject \
-    ${PYTHON_PN}-xml \
-    "
-- 
2.17.1

