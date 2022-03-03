Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 577BBC433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 06:59:59 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web09.8379.1646290798237016714
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 22:59:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ahF3czs1;
 spf=pass (domain: gmail.com, ip: 209.85.210.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id k1so4009766pfu.2
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 22:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u61oHPG+P/NDjvpT99NLYkpsCo1l+cmd6+qon5u3ogI=;
        b=ahF3czs1onB+pd6DgeJU/BJmyDfI4PFmf4MqRn+1QpgZaN5NzmKaDycdVB2QIuABxY
         qvfU7hk/Jl6oQgje7tWjDx5i+u5kRowc54gySHgn65khmA2n17KNL+iMjVJUASs+pIOP
         hq5kSHdkBJBvNdHbuMy99SRZrzi2CJ/kN4miSuEwFWos2idbVg5l/jKszXStNrCQqdSv
         6fUREwBfXmL1/3vouD2TqLVN3A6fiQd2Cqe3kjxe+hASuRLYN016Jw6edJcKGyMayjcT
         8cCXkCYIe9EN4zpNEb+S97j1F9MGrp7AhUKRkQ5vIhN/6TK1iXxkYAWo/UGB5tJkgeQX
         R8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u61oHPG+P/NDjvpT99NLYkpsCo1l+cmd6+qon5u3ogI=;
        b=7ex4gLxs5pT1IsNux0kFZV2Es9zWl9u7ZhQnCBq57bjIrivKiOUqm971GWorpiBeSJ
         JRg9o7GVGL9rqKwgCpn+kti0DdPMXGGZQgmK9LTNtAFsxDr9DMtgOAk/ss0xYTwWkLmg
         kij0Ziq7TFVUftlhukvgn92Jrz4OPhDu4uvzSXQygKik+jWcQHF7oM6A3wQ9aEjjnGmK
         Lm923KMVIUyqnFPgd0uLWqPZ74POyamFcrLLVGliGNOaB7mGHF3Xj3btM6yHtLXY6Noo
         G8i6YNWL/HBfxYLfSXAw94Cn6B5SiUKf3D1FYHmexMO1B0mcrxBMwtGFZoHblQALYoV+
         FiKQ==
X-Gm-Message-State: AOAM5329VdLh+Nk8j9Ps+5wL5c/yGp1hJjWlTJXZctCWvkQ+u8/8BcIS
	U7r8zja+Bd/fUU9mifN8XTb+U9HVkGp7mQ==
X-Google-Smtp-Source: 
 ABdhPJyLQm81/7QUWI934MU8+zQ7sk23GGq/0DWAM6POxT0ygyLSr3/GL1iflaX2/URxpf0HfRg/DA==
X-Received: by 2002:a63:471f:0:b0:373:9b10:886e with SMTP id
 u31-20020a63471f000000b003739b10886emr24880664pga.307.1646290797231;
        Wed, 02 Mar 2022 22:59:57 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 nl12-20020a17090b384c00b001bc1bb5449bsm1229859pjb.2.2022.03.02.22.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 22:59:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-slip-dbus: Fix build with wheel
 packaging
Date: Wed,  2 Mar 2022 22:59:54 -0800
Message-Id: <20220303065954.909740-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Mar 2022 06:59:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95729

Migrate to use setuptools instead of distutils
merge slip.dbus into slip module since we use
slip.dbus, it works fine for OE

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Use-setuptools-instead-of-distutils.patch | 38 ++++++++++
 ...9c0b534c1b7958fa0a3c7aedf30bca910431.patch | 76 +++++++++++++++++++
 .../python/python3-slip-dbus_0.6.5.bb         | 11 ++-
 3 files changed, 121 insertions(+), 4 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-slip-dbus/0001-setup.py-Use-setuptools-instead-of-distutils.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-slip-dbus/9b939c0b534c1b7958fa0a3c7aedf30bca910431.patch

diff --git a/meta-python/recipes-devtools/python/python3-slip-dbus/0001-setup.py-Use-setuptools-instead-of-distutils.patch b/meta-python/recipes-devtools/python/python3-slip-dbus/0001-setup.py-Use-setuptools-instead-of-distutils.patch
new file mode 100644
index 0000000000..1208769b2f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-slip-dbus/0001-setup.py-Use-setuptools-instead-of-distutils.patch
@@ -0,0 +1,38 @@
+From 4309ce76351b1685d08b3ba55d4f62b3e53ef76b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 1 Mar 2022 19:06:35 -0800
+Subject: [PATCH] setup.py: Use setuptools instead of distutils
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ setup.py.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/setup.py.in
++++ b/setup.py.in
+@@ -2,20 +2,17 @@
+ # -*- coding: utf-8 -*-
+ 
+ import sys
+-from distutils.core import setup
++from setuptools import setup, find_packages
+ 
+ setup(name="slip", version="@VERSION@",
+         py_modules=["slip.__init__", "slip.util.__init__",
+             "slip.util.hookable", "slip.util.files",
+-            "slip._wrappers.__init__", "slip._wrappers._glib"],
+-        requires=["selinux"])
+-
+-setup(name="slip.dbus", version="@VERSION@",
+-        py_modules=["slip.dbus.__init__", "slip.dbus.bus",
++            "slip._wrappers.__init__", "slip._wrappers._glib",
++            "slip.dbus.__init__", "slip.dbus.bus",
+             "slip.dbus.constants", "slip.dbus.introspection",
+             "slip.dbus.mainloop", "slip.dbus.polkit", "slip.dbus.proxies",
+             "slip.dbus.service"],
+-        requires=["dbus", "decorator", "StringIO", "xml.etree.ElementTree"])
++      requires=["dbus", "decorator", "selinux", "StringIO", "xml.etree.ElementTree"])
+ 
+ if sys.version_info.major == 2:
+     setup(name="slip.gtk", version="@VERSION@",
diff --git a/meta-python/recipes-devtools/python/python3-slip-dbus/9b939c0b534c1b7958fa0a3c7aedf30bca910431.patch b/meta-python/recipes-devtools/python/python3-slip-dbus/9b939c0b534c1b7958fa0a3c7aedf30bca910431.patch
new file mode 100644
index 0000000000..b0e9d2215f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-slip-dbus/9b939c0b534c1b7958fa0a3c7aedf30bca910431.patch
@@ -0,0 +1,76 @@
+From 9b939c0b534c1b7958fa0a3c7aedf30bca910431 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Miro=20Hron=C4=8Dok?= <miro@hroncok.cz>
+Date: Mon, 7 Jun 2021 23:23:47 +0200
+Subject: [PATCH] Python 3.10+ fix: Use collections.abc.Callable instead of
+ collections.Callable
+
+The deprecated aliases to Collections Abstract Base Classes were removed from
+the collections module in Python 3.10.
+https://docs.python.org/3.10/whatsnew/changelog.html#python-3-10-0-alpha-5
+https://bugs.python.org/issue37324
+---
+ slip/dbus/polkit.py   | 6 +++---
+ slip/util/hookable.py | 6 +++---
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/slip/dbus/polkit.py b/slip/dbus/polkit.py
+index 128e8ce..320676d 100644
+--- a/slip/dbus/polkit.py
++++ b/slip/dbus/polkit.py
+@@ -26,7 +26,7 @@
+ 
+ from __future__ import absolute_import
+ 
+-import collections
++import collections.abc
+ import dbus
+ from decorator import decorator
+ from functools import reduce
+@@ -103,14 +103,14 @@ class MyProxy(object):
+             def some_method(self, ...):
+                 ..."""
+ 
+-    assert(func is None or isinstance(func, collections.Callable))
++    assert(func is None or isinstance(func, collections.abc.Callable))
+ 
+     assert(
+         authfail_result in (None, AUTHFAIL_DONTCATCH) or
+         authfail_exception is None)
+     assert(
+         authfail_callback is None or
+-        isinstance(authfail_callback, collections.Callable))
++        isinstance(authfail_callback, collections.abc.Callable))
+     assert(
+         authfail_exception is None or
+         issubclass(authfail_exception, Exception))
+diff --git a/slip/util/hookable.py b/slip/util/hookable.py
+index 89c7392..0cd9967 100644
+--- a/slip/util/hookable.py
++++ b/slip/util/hookable.py
+@@ -23,7 +23,7 @@
+ """This module contains variants of certain base types which call registered
+ hooks on changes."""
+ 
+-import collections
++import collections.abc
+ from six import with_metaclass
+ 
+ __all__ = ["Hookable", "HookableSet"]
+@@ -67,7 +67,7 @@ class _HookEntry(object):
+ 
+     def __init__(self, hook, args, kwargs, hookable=None):
+ 
+-        assert(isinstance(hook, collections.Callable))
++        assert(isinstance(hook, collections.abc.Callable))
+         assert(isinstance(hookable, Hookable))
+ 
+         for n, x in enumerate(args):
+@@ -174,7 +174,7 @@ def add_hook_hookable(self, hook, *args, **kwargs):
+         self.__add_hook(hook, self, *args, **kwargs)
+ 
+     def __add_hook(self, hook, _hookable, *args, **kwargs):
+-        assert isinstance(hook, collections.Callable)
++        assert isinstance(hook, collections.abc.Callable)
+         assert isinstance(_hookable, Hookable)
+         hookentry = _HookEntry(hook, args, kwargs, hookable=_hookable)
+         self.__hooks__.add(hookentry)
diff --git a/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb b/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb
index 00d83ab61b..57a9185289 100644
--- a/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb
+++ b/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb
@@ -14,12 +14,14 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
 SRCNAME = "python-slip"
 
-SRC_URI = "https://github.com/nphilipp/${SRCNAME}/releases/download/${SRCNAME}-${PV}/${SRCNAME}-${PV}.tar.bz2"
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-SRC_URI[md5sum] = "28ae5f93853466c44ec96706ba2a1eb4"
+SRC_URI = "https://github.com/nphilipp/${SRCNAME}/releases/download/${SRCNAME}-${PV}/${SRCNAME}-${PV}.tar.bz2 \
+           file://9b939c0b534c1b7958fa0a3c7aedf30bca910431.patch \
+           file://0001-setup.py-Use-setuptools-instead-of-distutils.patch \
+          "
 SRC_URI[sha256sum] = "c726c086f0dd93a0ac7a0176f383a12af91b6657b78a301e3f5b25d9f8d4d10b"
 
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
 do_compile:prepend() {
     sed -e 's/@VERSION@/${PV}/g' ${S}/setup.py.in > ${S}/setup.py
 }
@@ -32,3 +34,4 @@ RDEPENDS:${PN} += "\
 CLEANBROKEN = "1"
 
 inherit setuptools3
+PIP_INSTALL_PACKAGE = "slip"
-- 
2.35.1


