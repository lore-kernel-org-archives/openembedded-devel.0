Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9915FC47DD9
	for <webhook@archiver.kernel.org>; Fri, 22 Mar 2024 14:26:01 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.14683.1711117558207546196
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Mar 2024 07:25:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: straka.derek@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-789db917876so136220085a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Mar 2024 07:25:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711117556; x=1711722356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K6l2+PsX+6d8eLwbt++OVHtHEaejX8zxwRiq13c0i/k=;
        b=qoyCTZXS9QxIY+Se67H6eRUHyXBdGJKA1aLh3l1Leo7+pSpscMtXJGB6Qgw72CTlR/
         JJ9yC4sT5vP390akw0iMXMbKsUwz5DTVwiv8t8KKjZBIGlrU1ZzKRfxZ7a/JfF1Kd4bm
         RJV3xpi3hxPc+n/6jFYnB//cxxIXhDDjui4iuyhFDKkh5eTFw749GcRtkGGPyhhooAAt
         QDVSpHh8bRCLwaAM+S83vw7tMvc0NjPO1xjUTpYmZTqNwhHIGyb7klxlMRDVCGiPg/Rg
         1i1V6MpnM5iHVezQTajf8qrLwoVEvUlwuJdBP4o6rExrRKn1t+cxTWRgMw0lq/p1X4O8
         Wo2w==
X-Gm-Message-State: AOJu0YwVg3GiMZoHTDvlpp/O31+R1S6Hoei+uPHCHzCFzYTXdrKZ+8LR
	Qyt1cIFRrYDdo0hPZoNft3GhcR0Mju6hDKT4datYmehCbn1XZ8Fm025q0Mmwp6c=
X-Google-Smtp-Source: AGHT+IEKryxv2dY0odbfNBUBKFr/vzHL2DXwsHt9Bq2viYV4vNXW2lhyHbh1TCi1tEMB1pGbm4e3rQ==
X-Received: by 2002:a05:620a:5711:b0:78a:3c41:574a with SMTP id wi17-20020a05620a571100b0078a3c41574amr1630365qkn.68.1711117556061;
        Fri, 22 Mar 2024 07:25:56 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id x17-20020a05620a099100b00789ed8823f5sm805097qkx.0.2024.03.22.07.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 07:25:55 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH v2] python3-dbus: re-add recipe with latest patches and add ptest
Date: Fri, 22 Mar 2024 14:25:28 +0000
Message-Id: <20240322142528.2729139-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Mar 2024 14:26:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109520

The python3-dbus package was removed in (dac933e).  While the upstream
project isn't active, other distributions (e.g. Fedora, Debian, etc)
continue to offer the package and apply patches to resolve reported issues.

While other packages offer similar functionality (e.g. dasbus), they are not
drop in replacements and the general dbus functionality works out of the box.
The python package has accomplished it's goal of providing useful functionality,
and the proposal is to continue to have it available in meta-python for use.

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../ptest-packagelists-meta-python.inc        |   1 +
 .../packagegroups/packagegroup-meta-python.bb |   1 +
 ...ttribute-conforming-to-introspect.dt.patch |  38 ++
 .../0002-Support-asynchronous-calls-58.patch  | 204 ++++++++
 ...mation-between-D-Bus-errors-and-exce.patch | 493 ++++++++++++++++++
 .../python/python3-pydbus/run-ptest           |  15 +
 .../python/python3-pydbus_0.6.0.bb            |  26 +
 7 files changed, 778 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pydbus/0001-make-direction-attribute-conforming-to-introspect.dt.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pydbus/0002-Support-asynchronous-calls-58.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pydbus/0003-Support-transformation-between-D-Bus-errors-and-exce.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pydbus/run-ptest
 create mode 100644 meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 447e0b938..ec26f768e 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -53,6 +53,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-pytest-mock \
     python3-pytoml \
     python3-pyyaml-include \
+    python3-pydbus \
     python3-rapidjson \
     python3-requests-file \
     python3-requests-toolbelt \
diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index eb5a26463..e0446da28 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -311,6 +311,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-pycodestyle \
     python3-pyconnman \
     python3-pycurl \
+    python3-pydbus \
     python3-pydicti \
     python3-pyephem \
     python3-pyexpect \
diff --git a/meta-python/recipes-devtools/python/python3-pydbus/0001-make-direction-attribute-conforming-to-introspect.dt.patch b/meta-python/recipes-devtools/python/python3-pydbus/0001-make-direction-attribute-conforming-to-introspect.dt.patch
new file mode 100644
index 000000000..e1162f0ca
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pydbus/0001-make-direction-attribute-conforming-to-introspect.dt.patch
@@ -0,0 +1,38 @@
+From 5fe65a35e0e7106347639f0258206fadb451c439 Mon Sep 17 00:00:00 2001
+From: Hiroaki KAWAI <hiroaki.kawai@gmail.com>
+Date: Wed, 1 Feb 2017 18:00:33 +0900
+Subject: [PATCH 1/3] make direction attribute conforming to introspect.dtd
+
+direction attribute defaults to "in" as
+in the DTD(*1), direction attribute is defined as following:
+
+```
+<!ATTRLIST arg direction (in|out) "in">
+```
+
+*1) http://www.freedesktop.org/standards/dbus/1.0/introspect.dtd
+
+Upstream-Status: Inactive-Upstream [https://src.fedoraproject.org/cgit/rpms/python-pydbus.git/]
+
+Signed-off-by: Derek Straka <derek@asterius.io>
+---
+ pydbus/proxy_method.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/pydbus/proxy_method.py b/pydbus/proxy_method.py
+index 8798edd..3e6e6ee 100644
+--- a/pydbus/proxy_method.py
++++ b/pydbus/proxy_method.py
+@@ -33,8 +33,8 @@ class ProxyMethod(object):
+ 		self.__name__ = method.attrib["name"]
+ 		self.__qualname__ = self._iface_name + "." + self.__name__
+ 
+-		self._inargs  = [(arg.attrib.get("name", ""), arg.attrib["type"]) for arg in method if arg.tag == "arg" and arg.attrib["direction"] == "in"]
+-		self._outargs = [arg.attrib["type"] for arg in method if arg.tag == "arg" and arg.attrib["direction"] == "out"]
++		self._inargs  = [(arg.attrib.get("name", ""), arg.attrib["type"]) for arg in method if arg.tag == "arg" and arg.attrib.get("direction", "in") == "in"]
++		self._outargs = [arg.attrib["type"] for arg in method if arg.tag == "arg" and arg.attrib.get("direction", "in") == "out"]
+ 		self._sinargs  = "(" + "".join(x[1] for x in self._inargs) + ")"
+ 		self._soutargs = "(" + "".join(self._outargs) + ")"
+ 
+-- 
+2.13.5
diff --git a/meta-python/recipes-devtools/python/python3-pydbus/0002-Support-asynchronous-calls-58.patch b/meta-python/recipes-devtools/python/python3-pydbus/0002-Support-asynchronous-calls-58.patch
new file mode 100644
index 000000000..ee38ed778
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pydbus/0002-Support-asynchronous-calls-58.patch
@@ -0,0 +1,204 @@
+From 31d6dd7893a5e1bb9eb14bfcee861a5b62f64960 Mon Sep 17 00:00:00 2001
+From: Vendula Poncova <vponcova@redhat.com>
+Date: Thu, 27 Jul 2017 18:41:29 +0200
+Subject: [PATCH 2/3] Support asynchronous calls (#58)
+
+Added support for asynchronous calls of methods. A method is called
+synchronously unless its callback parameter is specified. A callback
+is a function f(*args, returned=None, error=None), where args is
+callback_args specified in the method call, returned is a return
+value of the method and error is an exception raised by the method.
+
+Example of an asynchronous call:
+
+def func(x, y, returned=None, error=None):
+  pass
+
+proxy.Method(a, b, callback=func, callback_args=(x, y))
+
+Upstream-Status: Inactive-Upstream [https://src.fedoraproject.org/cgit/rpms/python-pydbus.git/]
+
+Signed-off-by: Derek Straka <derek@asterius.io>
+---
+ doc/tutorial.rst       | 11 ++++++++-
+ pydbus/proxy_method.py | 44 ++++++++++++++++++++++++++++++-----
+ tests/publish_async.py | 63 ++++++++++++++++++++++++++++++++++++++++++++++++++
+ tests/run.sh           |  1 +
+ 4 files changed, 112 insertions(+), 7 deletions(-)
+ create mode 100644 tests/publish_async.py
+
+diff --git a/doc/tutorial.rst b/doc/tutorial.rst
+index 7474de3..b8479cf 100644
+--- a/doc/tutorial.rst
++++ b/doc/tutorial.rst
+@@ -84,7 +84,8 @@ All objects have methods, properties and signals.
+ Setting up an event loop
+ ========================
+ 
+-To handle signals emitted by exported objects, or to export your own objects, you need to setup an event loop.
++To handle signals emitted by exported objects, to asynchronously call methods
++or to export your own objects, you need to setup an event loop.
+ 
+ The only main loop supported by ``pydbus`` is GLib.MainLoop.
+ 
+@@ -156,6 +157,14 @@ To call a method::
+ 
+     dev.Disconnect()
+ 
++To asynchronously call a method::
++
++    def print_result(returned=None, error=None):
++        print(returned, error)
++
++    dev.GetAppliedConnection(0, callback=print_result)
++    loop.run()
++
+ To read a property::
+ 
+     print(dev.Autoconnect)
+diff --git a/pydbus/proxy_method.py b/pydbus/proxy_method.py
+index 3e6e6ee..442fe07 100644
+--- a/pydbus/proxy_method.py
++++ b/pydbus/proxy_method.py
+@@ -65,15 +65,34 @@ class ProxyMethod(object):
+ 
+ 		# Python 2 sux
+ 		for kwarg in kwargs:
+-			if kwarg not in ("timeout",):
++			if kwarg not in ("timeout", "callback", "callback_args"):
+ 				raise TypeError(self.__qualname__ + " got an unexpected keyword argument '{}'".format(kwarg))
+ 		timeout = kwargs.get("timeout", None)
++		callback = kwargs.get("callback", None)
++		callback_args = kwargs.get("callback_args", tuple())
++
++		call_args = (
++			instance._bus_name,
++			instance._path,
++			self._iface_name,
++			self.__name__,
++			GLib.Variant(self._sinargs, args),
++			GLib.VariantType.new(self._soutargs),
++			0,
++			timeout_to_glib(timeout),
++			None
++		)
++
++		if callback:
++			call_args += (self._finish_async_call, (callback, callback_args))
++			instance._bus.con.call(*call_args)
++			return None
++		else:
++			ret = instance._bus.con.call_sync(*call_args)
++			return self._unpack_return(ret)
+ 
+-		ret = instance._bus.con.call_sync(
+-			instance._bus_name, instance._path,
+-			self._iface_name, self.__name__, GLib.Variant(self._sinargs, args), GLib.VariantType.new(self._soutargs),
+-			0, timeout_to_glib(timeout), None).unpack()
+-
++	def _unpack_return(self, values):
++		ret = values.unpack()
+ 		if len(self._outargs) == 0:
+ 			return None
+ 		elif len(self._outargs) == 1:
+@@ -81,6 +100,19 @@ class ProxyMethod(object):
+ 		else:
+ 			return ret
+ 
++	def _finish_async_call(self, source, result, user_data):
++		error = None
++		return_args = None
++
++		try:
++			ret = source.call_finish(result)
++			return_args = self._unpack_return(ret)
++		except Exception as err:
++			error = err
++
++		callback, callback_args = user_data
++		callback(*callback_args, returned=return_args, error=error)
++
+ 	def __get__(self, instance, owner):
+ 		if instance is None:
+ 			return self
+diff --git a/tests/publish_async.py b/tests/publish_async.py
+new file mode 100644
+index 0000000..3f79b62
+--- /dev/null
++++ b/tests/publish_async.py
+@@ -0,0 +1,63 @@
++from pydbus import SessionBus
++from gi.repository import GLib
++from threading import Thread
++import sys
++
++done = 0
++loop = GLib.MainLoop()
++
++class TestObject(object):
++	'''
++<node>
++	<interface name='net.lew21.pydbus.tests.publish_async'>
++		<method name='HelloWorld'>
++			<arg type='i' name='x' direction='in'/>
++			<arg type='s' name='response' direction='out'/>
++		</method>
++	</interface>
++</node>
++	'''
++	def __init__(self, id):
++		self.id = id
++
++	def HelloWorld(self, x):
++		res = self.id + ": " + str(x)
++		print(res)
++		return res
++
++bus = SessionBus()
++
++with bus.publish("net.lew21.pydbus.tests.publish_async", TestObject("Obj")):
++	remote = bus.get("net.lew21.pydbus.tests.publish_async")
++
++	def callback(x, returned=None, error=None):
++		print("asyn: " + returned)
++		assert (returned is not None)
++		assert(error is None)
++		assert(x == int(returned.split()[1]))
++
++		global done
++		done += 1
++		if done == 3:
++			loop.quit()
++
++	def t1_func():
++		remote.HelloWorld(1, callback=callback, callback_args=(1,))
++		remote.HelloWorld(2, callback=callback, callback_args=(2,))
++		print("sync: " + remote.HelloWorld(3))
++		remote.HelloWorld(4, callback=callback, callback_args=(4,))
++
++	t1 = Thread(None, t1_func)
++	t1.daemon = True
++
++	def handle_timeout():
++		print("ERROR: Timeout.")
++		sys.exit(1)
++
++	GLib.timeout_add_seconds(2, handle_timeout)
++
++	t1.start()
++
++	loop.run()
++
++	t1.join()
+diff --git a/tests/run.sh b/tests/run.sh
+index 8d93644..271c58a 100755
+--- a/tests/run.sh
++++ b/tests/run.sh
+@@ -15,4 +15,5 @@ then
+ 	"$PYTHON" $TESTS_DIR/publish.py
+ 	"$PYTHON" $TESTS_DIR/publish_properties.py
+ 	"$PYTHON" $TESTS_DIR/publish_multiface.py
++	"$PYTHON" $TESTS_DIR/publish_async.py
+ fi
+-- 
+2.13.5
diff --git a/meta-python/recipes-devtools/python/python3-pydbus/0003-Support-transformation-between-D-Bus-errors-and-exce.patch b/meta-python/recipes-devtools/python/python3-pydbus/0003-Support-transformation-between-D-Bus-errors-and-exce.patch
new file mode 100644
index 000000000..64e6c0d5e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pydbus/0003-Support-transformation-between-D-Bus-errors-and-exce.patch
@@ -0,0 +1,493 @@
+From 773858e1afd21cdf3ceef2cd35509f0b4882bf16 Mon Sep 17 00:00:00 2001
+From: Vendula Poncova <vponcova@redhat.com>
+Date: Tue, 1 Aug 2017 16:54:24 +0200
+Subject: [PATCH 3/3] Support transformation between D-Bus errors and
+ exceptions.
+
+Exceptions can be registered with decorators, raised in a remote
+method and recreated after return from the remote call.
+
+Upstream-Status: Inactive-Upstream [https://src.fedoraproject.org/cgit/rpms/python-pydbus.git/]
+
+Signed-off-by: Derek Straka <derek@asterius.io>
+---
+ doc/tutorial.rst       |  47 ++++++++++++++++++
+ pydbus/error.py        |  97 ++++++++++++++++++++++++++++++++++++
+ pydbus/proxy_method.py |  18 +++++--
+ pydbus/registration.py |  16 ++++--
+ tests/error.py         |  67 +++++++++++++++++++++++++
+ tests/publish_error.py | 132 +++++++++++++++++++++++++++++++++++++++++++++++++
+ tests/run.sh           |   2 +
+ 7 files changed, 371 insertions(+), 8 deletions(-)
+ create mode 100644 pydbus/error.py
+ create mode 100644 tests/error.py
+ create mode 100644 tests/publish_error.py
+
+diff --git a/doc/tutorial.rst b/doc/tutorial.rst
+index b8479cf..7fe55e1 100644
+--- a/doc/tutorial.rst
++++ b/doc/tutorial.rst
+@@ -341,6 +341,53 @@ See ``help(bus.request_name)`` and ``help(bus.register_object)`` for details.
+ 
+ .. --------------------------------------------------------------------
+ 
++Error handling
++==============
++
++You can map D-Bus errors to your exception classes for better error handling.
++To handle D-Bus errors, use the ``@map_error`` decorator::
++
++    from pydbus.error import map_error
++
++    @map_error("org.freedesktop.DBus.Error.InvalidArgs")
++    class InvalidArgsException(Exception):
++        pass
++
++    try:
++        ...
++    catch InvalidArgsException as e:
++        print(e)
++
++To register new D-Bus errors, use the ``@register_error`` decorator::
++
++    from pydbus.error import register_error
++
++    @map_error("net.lew21.pydbus.TutorialExample.MyError", MY_DOMAIN, MY_EXCEPTION_CODE)
++    class MyException(Exception):
++        pass
++
++Then you can raise ``MyException`` from the D-Bus method of the remote object::
++
++    def Method():
++        raise MyException("Message")
++
++And catch the same exception on the client side::
++
++    try:
++        proxy.Method()
++    catch MyException as e:
++        print(e)
++
++To handle all unknown D-Bus errors, use the ``@map_by_default`` decorator to specify the default exception::
++
++    from pydbus.error import map_by_default
++
++    @map_by_default
++    class DefaultException(Exception):
++        pass
++
++.. --------------------------------------------------------------------
++
+ Data types
+ ==========
+ 
+diff --git a/pydbus/error.py b/pydbus/error.py
+new file mode 100644
+index 0000000..aaa3510
+--- /dev/null
++++ b/pydbus/error.py
+@@ -0,0 +1,97 @@
++from gi.repository import GLib, Gio
++
++
++def register_error(name, domain, code):
++	"""Register and map decorated exception class to a DBus error."""
++	def decorated(cls):
++		error_registration.register_error(cls, name, domain, code)
++		return cls
++
++	return decorated
++
++
++def map_error(error_name):
++	"""Map decorated exception class to a DBus error."""
++	def decorated(cls):
++		error_registration.map_error(cls, error_name)
++		return cls
++
++	return decorated
++
++
++def map_by_default(cls):
++	"""Map decorated exception class to all unknown DBus errors."""
++	error_registration.map_by_default(cls)
++	return cls
++
++
++class ErrorRegistration(object):
++	"""Class for mapping exceptions to DBus errors."""
++
++	_default = None
++	_map = dict()
++	_reversed_map = dict()
++
++	def map_by_default(self, exception_cls):
++		"""Set the exception class as a default."""
++		self._default = exception_cls
++
++	def map_error(self, exception_cls, name):
++		"""Map the exception class to a DBus name."""
++		self._map[name] = exception_cls
++		self._reversed_map[exception_cls] = name
++
++	def register_error(self, exception_cls, name, domain, code):
++		"""Map and register the exception class to a DBus name."""
++		self.map_error(exception_cls, name)
++		return Gio.DBusError.register_error(domain, code, name)
++
++	def is_registered_exception(self, obj):
++		"""Is the exception registered?"""
++		return obj.__class__ in self._reversed_map
++
++	def get_dbus_name(self, obj):
++		"""Get the DBus name of the exception."""
++		return self._reversed_map.get(obj.__class__)
++
++	def get_exception_class(self, name):
++		"""Get the exception class mapped to the DBus name."""
++		return self._map.get(name, self._default)
++
++	def transform_message(self, name, message):
++		"""Transform the message of the exception."""
++		prefix = "{}:{}: ".format("GDBus.Error", name)
++
++		if message.startswith(prefix):
++			return message[len(prefix):]
++
++		return message
++
++	def transform_exception(self, e):
++		"""Transform the remote error to the exception."""
++		if not isinstance(e, GLib.Error):
++			return e
++
++		if not Gio.DBusError.is_remote_error(e):
++			return e
++
++		# Get DBus name of the error.
++		name = Gio.DBusError.get_remote_error(e)
++		# Get the exception class.
++		exception_cls = self.get_exception_class(name)
++
++		# Return the original exception.
++		if not exception_cls:
++			return e
++
++		# Return new exception.
++		message = self.transform_message(name, e.message)
++		exception = exception_cls(message)
++		exception.dbus_name = name
++		exception.dbus_domain = e.domain
++		exception.dbus_code = e.code
++		return exception
++
++
++# Default error registration.
++error_registration = ErrorRegistration()
+diff --git a/pydbus/proxy_method.py b/pydbus/proxy_method.py
+index 442fe07..a73f9eb 100644
+--- a/pydbus/proxy_method.py
++++ b/pydbus/proxy_method.py
+@@ -2,6 +2,7 @@ from gi.repository import GLib
+ from .generic import bound_method
+ from .identifier import filter_identifier
+ from .timeout import timeout_to_glib
++from .error import error_registration
+ 
+ try:
+ 	from inspect import Signature, Parameter
+@@ -87,9 +88,20 @@ class ProxyMethod(object):
+ 			call_args += (self._finish_async_call, (callback, callback_args))
+ 			instance._bus.con.call(*call_args)
+ 			return None
++
+ 		else:
+-			ret = instance._bus.con.call_sync(*call_args)
+-			return self._unpack_return(ret)
++			result = None
++			error = None
++
++			try:
++				result = instance._bus.con.call_sync(*call_args)
++			except Exception as e:
++				error = error_registration.transform_exception(e)
++
++			if error:
++				raise error
++
++			return self._unpack_return(result)
+ 
+ 	def _unpack_return(self, values):
+ 		ret = values.unpack()
+@@ -108,7 +120,7 @@ class ProxyMethod(object):
+ 			ret = source.call_finish(result)
+ 			return_args = self._unpack_return(ret)
+ 		except Exception as err:
+-			error = err
++			error = error_registration.transform_exception(err)
+ 
+ 		callback, callback_args = user_data
+ 		callback(*callback_args, returned=return_args, error=error)
+diff --git a/pydbus/registration.py b/pydbus/registration.py
+index f531539..1d2cbcb 100644
+--- a/pydbus/registration.py
++++ b/pydbus/registration.py
+@@ -5,6 +5,7 @@ from . import generic
+ from .exitable import ExitableWithAliases
+ from functools import partial
+ from .method_call_context import MethodCallContext
++from .error import error_registration
+ import logging
+ 
+ try:
+@@ -91,11 +92,16 @@ class ObjectWrapper(ExitableWithAliases("unwrap")):
+ 			logger = logging.getLogger(__name__)
+ 			logger.exception("Exception while handling %s.%s()", interface_name, method_name)
+ 
+-			#TODO Think of a better way to translate Python exception types to DBus error types.
+-			e_type = type(e).__name__
+-			if not "." in e_type:
+-				e_type = "unknown." + e_type
+-			invocation.return_dbus_error(e_type, str(e))
++			if error_registration.is_registered_exception(e):
++				name = error_registration.get_dbus_name(e)
++				invocation.return_dbus_error(name, str(e))
++			else:
++				logger.info("name is not registered")
++				e_type = type(e).__name__
++				if not "." in e_type:
++					e_type = "unknown." + e_type
++
++				invocation.return_dbus_error(e_type, str(e))
+ 
+ 	def Get(self, interface_name, property_name):
+ 		type = self.readable_properties[interface_name + "." + property_name]
+diff --git a/tests/error.py b/tests/error.py
+new file mode 100644
+index 0000000..3ec507d
+--- /dev/null
++++ b/tests/error.py
+@@ -0,0 +1,67 @@
++from pydbus.error import ErrorRegistration
++
++
++class ExceptionA(Exception):
++	pass
++
++
++class ExceptionB(Exception):
++	pass
++
++
++class ExceptionC(Exception):
++	pass
++
++
++class ExceptionD(Exception):
++	pass
++
++
++class ExceptionE(Exception):
++	pass
++
++
++def test_error_mapping():
++	r = ErrorRegistration()
++	r.map_error(ExceptionA, "net.lew21.pydbus.tests.ErrorA")
++	r.map_error(ExceptionB, "net.lew21.pydbus.tests.ErrorB")
++	r.map_error(ExceptionC, "net.lew21.pydbus.tests.ErrorC")
++
++	assert r.is_registered_exception(ExceptionA("Test"))
++	assert r.is_registered_exception(ExceptionB("Test"))
++	assert r.is_registered_exception(ExceptionC("Test"))
++	assert not r.is_registered_exception(ExceptionD("Test"))
++	assert not r.is_registered_exception(ExceptionE("Test"))
++
++	assert r.get_dbus_name(ExceptionA("Test")) == "net.lew21.pydbus.tests.ErrorA"
++	assert r.get_dbus_name(ExceptionB("Test")) == "net.lew21.pydbus.tests.ErrorB"
++	assert r.get_dbus_name(ExceptionC("Test")) == "net.lew21.pydbus.tests.ErrorC"
++
++	assert r.get_exception_class("net.lew21.pydbus.tests.ErrorA") == ExceptionA
++	assert r.get_exception_class("net.lew21.pydbus.tests.ErrorB") == ExceptionB
++	assert r.get_exception_class("net.lew21.pydbus.tests.ErrorC") == ExceptionC
++	assert r.get_exception_class("net.lew21.pydbus.tests.ErrorD") is None
++	assert r.get_exception_class("net.lew21.pydbus.tests.ErrorE") is None
++
++	r.map_by_default(ExceptionD)
++	assert not r.is_registered_exception(ExceptionD("Test"))
++	assert r.get_exception_class("net.lew21.pydbus.tests.ErrorD") == ExceptionD
++	assert r.get_exception_class("net.lew21.pydbus.tests.ErrorE") == ExceptionD
++
++
++def test_transform_message():
++	r = ErrorRegistration()
++	n1 = "net.lew21.pydbus.tests.ErrorA"
++	m1 = "GDBus.Error:net.lew21.pydbus.tests.ErrorA: Message1"
++
++	n2 = "net.lew21.pydbus.tests.ErrorB"
++	m2 = "GDBus.Error:net.lew21.pydbus.tests.ErrorB: Message2"
++
++	assert r.transform_message(n1, m1) == "Message1"
++	assert r.transform_message(n2, m2) == "Message2"
++	assert r.transform_message(n1, m2) == m2
++	assert r.transform_message(n2, m1) == m1
++
++
++test_error_mapping()
++test_transform_message()
+diff --git a/tests/publish_error.py b/tests/publish_error.py
+new file mode 100644
+index 0000000..aa8a18a
+--- /dev/null
++++ b/tests/publish_error.py
+@@ -0,0 +1,132 @@
++import sys
++from threading import Thread
++from gi.repository import GLib, Gio
++from pydbus import SessionBus
++from pydbus.error import register_error, map_error, map_by_default, error_registration
++
++import logging
++logger = logging.getLogger('pydbus.registration')
++logger.disabled = True
++
++loop = GLib.MainLoop()
++DOMAIN = Gio.DBusError.quark()  # TODO: Register new domain.
++
++
++@register_error("net.lew21.pydbus.tests.ErrorA", DOMAIN, 1000)
++class ExceptionA(Exception):
++	pass
++
++
++@register_error("net.lew21.pydbus.tests.ErrorB", DOMAIN, 2000)
++class ExceptionB(Exception):
++	pass
++
++
++@map_error("org.freedesktop.DBus.Error.InvalidArgs")
++class ExceptionC(Exception):
++	pass
++
++
++@map_by_default
++class ExceptionD(Exception):
++	pass
++
++
++class ExceptionE(Exception):
++	pass
++
++
++class TestObject(object):
++	'''
++<node>
++	<interface name='net.lew21.pydbus.tests.TestInterface'>
++		<method name='RaiseA'>
++			<arg type='s' name='msg' direction='in'/>
++		</method>
++		<method name='RaiseB'>
++			<arg type='s' name='msg' direction='in'/>
++		</method>
++		<method name='RaiseD'>
++			<arg type='s' name='msg' direction='in'/>
++		</method>
++		<method name='RaiseE'>
++			<arg type='s' name='msg' direction='in'/>
++		</method>
++	</interface>
++</node>
++	'''
++
++	def RaiseA(self, msg):
++		raise ExceptionA(msg)
++
++	def RaiseB(self, msg):
++		raise ExceptionB(msg)
++
++	def RaiseD(self, msg):
++		raise ExceptionD(msg)
++
++	def RaiseE(self, msg):
++		raise ExceptionE(msg)
++
++bus = SessionBus()
++
++with bus.publish("net.lew21.pydbus.tests.Test", TestObject()):
++	remote = bus.get("net.lew21.pydbus.tests.Test")
++
++	def t_func():
++		# Test new registered errors.
++		try:
++			remote.RaiseA("Test A")
++		except ExceptionA as e:
++			assert str(e) == "Test A"
++
++		try:
++			remote.RaiseB("Test B")
++		except ExceptionB as e:
++			assert str(e) == "Test B"
++
++		# Test mapped errors.
++		try:
++			remote.Get("net.lew21.pydbus.tests.TestInterface", "Foo")
++		except ExceptionC as e:
++			assert str(e) == "No such property 'Foo'"
++
++		# Test default errors.
++		try:
++			remote.RaiseD("Test D")
++		except ExceptionD as e:
++			assert str(e) == "Test D"
++
++		try:
++			remote.RaiseE("Test E")
++		except ExceptionD as e:
++			assert str(e) == "Test E"
++
++		# Test with no default errors.
++		error_registration.map_by_default(None)
++
++		try:
++			remote.RaiseD("Test D")
++		except Exception as e:
++			assert not isinstance(e, ExceptionD)
++
++		try:
++			remote.RaiseE("Test E")
++		except Exception as e:
++			assert not isinstance(e, ExceptionD)
++			assert not isinstance(e, ExceptionE)
++
++		loop.quit()
++
++	t = Thread(None, t_func)
++	t.daemon = True
++
++	def handle_timeout():
++		print("ERROR: Timeout.")
++		sys.exit(1)
++
++	GLib.timeout_add_seconds(4, handle_timeout)
++
++	t.start()
++	loop.run()
++	t.join()
+diff --git a/tests/run.sh b/tests/run.sh
+index 271c58a..a08baf8 100755
+--- a/tests/run.sh
++++ b/tests/run.sh
+@@ -10,10 +10,11 @@ PYTHON=${1:-python}
+ 
+ "$PYTHON" $TESTS_DIR/context.py
+ "$PYTHON" $TESTS_DIR/identifier.py
++"$PYTHON" $TESTS_DIR/error.py
+ if [ "$2" != "dontpublish" ]
+ then
+ 	"$PYTHON" $TESTS_DIR/publish.py
+ 	"$PYTHON" $TESTS_DIR/publish_properties.py
+ 	"$PYTHON" $TESTS_DIR/publish_multiface.py
+ 	"$PYTHON" $TESTS_DIR/publish_async.py
+ fi
+-- 
+2.13.5
diff --git a/meta-python/recipes-devtools/python/python3-pydbus/run-ptest b/meta-python/recipes-devtools/python/python3-pydbus/run-ptest
new file mode 100644
index 000000000..782ceed3b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pydbus/run-ptest
@@ -0,0 +1,15 @@
+#!/bin/sh
+
+for case in `find tests -type f -name '*.sh'`; do
+    bash $case python3 >$case.output 2>&1
+    ret=$?
+    if [ $ret -ne 0 ]; then
+        cat $case.output
+        echo "FAIL: ${case}"
+    elif grep -i 'SKIP' $case.output; then
+        echo "SKIP: ${case}"
+    else
+        echo "PASS: ${case}"
+    fi
+    rm -f $case.output
+done
\ No newline at end of file
diff --git a/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb b/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
new file mode 100644
index 000000000..ac9b8e8ab
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "Pythonic DBus library"
+HOMEPAGE = "https://pypi.python.org/pypi/pydbus/"
+LICENSE = "LGPL-2.1-only"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a916467b91076e631dd8edb7424769c7"
+
+SRCREV = "f2e6355a88351e7d644ccb2b4d67b19305507312"
+SRC_URI = " \
+    git://github.com/LEW21/pydbus.git;protocol=https;branch=master \
+    file://0001-make-direction-attribute-conforming-to-introspect.dt.patch \
+    file://0002-Support-asynchronous-calls-58.patch \
+    file://0003-Support-transformation-between-D-Bus-errors-and-exce.patch \
+    file://run-ptest \
+"
+
+inherit ptest setuptools3
+
+S = "${WORKDIR}/git"
+
+RDEPENDS:${PN} = "${PYTHON_PN}-pygobject \
+                  ${PYTHON_PN}-io \
+                  ${PYTHON_PN}-logging"
+
+do_install_ptest() {
+        install -d ${D}${PTEST_PATH}/tests
+        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
\ No newline at end of file
-- 
2.34.1


