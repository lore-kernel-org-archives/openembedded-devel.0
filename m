Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C4E9778F61
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 16:11:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7DGBpT2027961
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Aug 2018 09:11:51 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Mon, 13 Aug 2018 09:11:51 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 14 Aug 2018 00:22:16 +0800
Message-ID: <f5d4cc597533692525cd69fa0efe3b4cf5028d4b.1534177115.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1534177115.git.hongxu.jia@windriver.com>
References: <cover.1534177115.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/5] python3-pydbus: cherry-pick patches from fedora
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
X-List-Received-Date: Mon, 13 Aug 2018 16:11:51 -0000
Content-Type: text/plain

Fedora enhanced python3-pydbus:

- Support asynchronous calls

- Support transformation between D-Bus errors and
  exceptions.

https://src.fedoraproject.org/cgit/rpms/python-pydbus.git/

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-Support-asynchronous-calls-58.patch       |  93 ++++++++++
 ...nsformation-between-D-Bus-errors-and-exce.patch | 203 +++++++++++++++++++++
 .../python/python3-pydbus_0.6.0.bb                 |   4 +
 3 files changed, 300 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pydbus/0001-Support-asynchronous-calls-58.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pydbus/0002-Support-transformation-between-D-Bus-errors-and-exce.patch

diff --git a/meta-python/recipes-devtools/python/python3-pydbus/0001-Support-asynchronous-calls-58.patch b/meta-python/recipes-devtools/python/python3-pydbus/0001-Support-asynchronous-calls-58.patch
new file mode 100644
index 0000000..c5cb9a8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pydbus/0001-Support-asynchronous-calls-58.patch
@@ -0,0 +1,93 @@
+From 39a7d79ee6c548902fbac8b95c934af7e4c69260 Mon Sep 17 00:00:00 2001
+From: Vendula Poncova <vponcova@redhat.com>
+Date: Thu, 2 Aug 2018 15:30:45 +0800
+Subject: [PATCH 1/2] Support asynchronous calls (#58)
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
+Upstream-Status: Cherry-pick [https://src.fedoraproject.org/cgit/rpms/python-pydbus.git/]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pydbus/proxy_method.py | 44 ++++++++++++++++++++++++++++++++++++++------
+ 1 file changed, 38 insertions(+), 6 deletions(-)
+
+diff --git a/pydbus/proxy_method.py b/pydbus/proxy_method.py
+index 8798edd..4ea4304 100644
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
+-- 
+2.7.4
+
diff --git a/meta-python/recipes-devtools/python/python3-pydbus/0002-Support-transformation-between-D-Bus-errors-and-exce.patch b/meta-python/recipes-devtools/python/python3-pydbus/0002-Support-transformation-between-D-Bus-errors-and-exce.patch
new file mode 100644
index 0000000..f5c0390
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pydbus/0002-Support-transformation-between-D-Bus-errors-and-exce.patch
@@ -0,0 +1,203 @@
+From 69968dec867053e38de0b91d76ac41d5a5735e36 Mon Sep 17 00:00:00 2001
+From: Vendula Poncova <vponcova@redhat.com>
+Date: Thu, 2 Aug 2018 15:31:56 +0800
+Subject: [PATCH 2/2] Support transformation between D-Bus errors and
+ exceptions.
+
+Exceptions can be registered with decorators, raised in a remote
+method and recreated after return from the remote call.
+
+Upstream-Status: Cherry-pick [https://src.fedoraproject.org/cgit/rpms/python-pydbus.git/]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pydbus/error.py        | 97 ++++++++++++++++++++++++++++++++++++++++++++++++++
+ pydbus/proxy_method.py | 18 ++++++++--
+ pydbus/registration.py | 16 ++++++---
+ 3 files changed, 123 insertions(+), 8 deletions(-)
+ create mode 100644 pydbus/error.py
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
+index 4ea4304..e9496f5 100644
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
+-- 
+2.7.4
+
diff --git a/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb b/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
index 7ed1c63..adaa86d 100644
--- a/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
@@ -1,2 +1,6 @@
 require python-pydbus.inc
 inherit pypi setuptools3
+
+SRC_URI += "file://0001-Support-asynchronous-calls-58.patch \
+            file://0002-Support-transformation-between-D-Bus-errors-and-exce.patch \
+"
-- 
2.7.4


