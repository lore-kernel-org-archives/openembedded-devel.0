Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90313C77B7C
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 17:14:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.309.1684948483786532190
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 10:14:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7CBD9113E;
	Wed, 24 May 2023 10:15:28 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F24DA3F6C4;
	Wed, 24 May 2023 10:14:42 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/6] python3-pydbus: remove obsolete recipe
Date: Wed, 24 May 2023 18:14:34 +0100
Message-Id: <20230524171438.122588-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230524171438.122588-1-ross.burton@arm.com>
References: <20230524171438.122588-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 17:14:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102786

From: Ross Burton <ross.burton@arm.com>

This project has been untouched since 2018 and doesn't appear to have
any real dependents.

If something similar to pydbus is needed, then a maintained alternative
would be https://github.com/rhinstaller/dasbus (recipe available in
meta-anaconda).

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../packagegroups/packagegroup-meta-python.bb |   1 -
 .../0001-Support-asynchronous-calls-58.patch  |  93 --------
 ...mation-between-D-Bus-errors-and-exce.patch | 203 ------------------
 .../python/python3-pydbus_0.6.0.bb            |  19 --
 4 files changed, 316 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pydbus/00=
01-Support-asynchronous-calls-58.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-pydbus/00=
02-Support-transformation-between-D-Bus-errors-and-exce.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-pydbus_0.=
6.0.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-pyt=
hon.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.=
bb
index c78fd1e7f7..982e41303c 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -314,7 +314,6 @@ RDEPENDS:packagegroup-meta-python3 =3D "\
     python3-pycodestyle \
     python3-pyconnman \
     python3-pycurl \
-    python3-pydbus \
     python3-pydicti \
     python3-pyephem \
     python3-pyexpect \
diff --git a/meta-python/recipes-devtools/python/python3-pydbus/0001-Supp=
ort-asynchronous-calls-58.patch b/meta-python/recipes-devtools/python/pyt=
hon3-pydbus/0001-Support-asynchronous-calls-58.patch
deleted file mode 100644
index eb97f05850..0000000000
--- a/meta-python/recipes-devtools/python/python3-pydbus/0001-Support-asy=
nchronous-calls-58.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-From 39a7d79ee6c548902fbac8b95c934af7e4c69260 Mon Sep 17 00:00:00 2001
-From: Vendula Poncova <vponcova@redhat.com>
-Date: Thu, 2 Aug 2018 15:30:45 +0800
-Subject: [PATCH 1/2] Support asynchronous calls (#58)
-
-Added support for asynchronous calls of methods. A method is called
-synchronously unless its callback parameter is specified. A callback
-is a function f(*args, returned=3DNone, error=3DNone), where args is
-callback_args specified in the method call, returned is a return
-value of the method and error is an exception raised by the method.
-
-Example of an asynchronous call:
-
-def func(x, y, returned=3DNone, error=3DNone):
-  pass
-
-proxy.Method(a, b, callback=3Dfunc, callback_args=3D(x, y))
-
-Upstream-Status: Backport [https://src.fedoraproject.org/cgit/rpms/pytho=
n-pydbus.git/]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- pydbus/proxy_method.py | 44 ++++++++++++++++++++++++++++++++++++++-----=
-
- 1 file changed, 38 insertions(+), 6 deletions(-)
-
-diff --git a/pydbus/proxy_method.py b/pydbus/proxy_method.py
-index 8798edd..4ea4304 100644
---- a/pydbus/proxy_method.py
-+++ b/pydbus/proxy_method.py
-@@ -65,15 +65,34 @@ class ProxyMethod(object):
-=20
- 		# Python 2 sux
- 		for kwarg in kwargs:
--			if kwarg not in ("timeout",):
-+			if kwarg not in ("timeout", "callback", "callback_args"):
- 				raise TypeError(self.__qualname__ + " got an unexpected keyword arg=
ument '{}'".format(kwarg))
- 		timeout =3D kwargs.get("timeout", None)
-+		callback =3D kwargs.get("callback", None)
-+		callback_args =3D kwargs.get("callback_args", tuple())
-+
-+		call_args =3D (
-+			instance._bus_name,
-+			instance._path,
-+			self._iface_name,
-+			self.__name__,
-+			GLib.Variant(self._sinargs, args),
-+			GLib.VariantType.new(self._soutargs),
-+			0,
-+			timeout_to_glib(timeout),
-+			None
-+		)
-+
-+		if callback:
-+			call_args +=3D (self._finish_async_call, (callback, callback_args))
-+			instance._bus.con.call(*call_args)
-+			return None
-+		else:
-+			ret =3D instance._bus.con.call_sync(*call_args)
-+			return self._unpack_return(ret)
-=20
--		ret =3D instance._bus.con.call_sync(
--			instance._bus_name, instance._path,
--			self._iface_name, self.__name__, GLib.Variant(self._sinargs, args), =
GLib.VariantType.new(self._soutargs),
--			0, timeout_to_glib(timeout), None).unpack()
--
-+	def _unpack_return(self, values):
-+		ret =3D values.unpack()
- 		if len(self._outargs) =3D=3D 0:
- 			return None
- 		elif len(self._outargs) =3D=3D 1:
-@@ -81,6 +100,19 @@ class ProxyMethod(object):
- 		else:
- 			return ret
-=20
-+	def _finish_async_call(self, source, result, user_data):
-+		error =3D None
-+		return_args =3D None
-+
-+		try:
-+			ret =3D source.call_finish(result)
-+			return_args =3D self._unpack_return(ret)
-+		except Exception as err:
-+			error =3D err
-+
-+		callback, callback_args =3D user_data
-+		callback(*callback_args, returned=3Dreturn_args, error=3Derror)
-+
- 	def __get__(self, instance, owner):
- 		if instance is None:
- 			return self
---=20
-2.7.4
-
diff --git a/meta-python/recipes-devtools/python/python3-pydbus/0002-Supp=
ort-transformation-between-D-Bus-errors-and-exce.patch b/meta-python/reci=
pes-devtools/python/python3-pydbus/0002-Support-transformation-between-D-=
Bus-errors-and-exce.patch
deleted file mode 100644
index 9c9b9b779b..0000000000
--- a/meta-python/recipes-devtools/python/python3-pydbus/0002-Support-tra=
nsformation-between-D-Bus-errors-and-exce.patch
+++ /dev/null
@@ -1,203 +0,0 @@
-From 69968dec867053e38de0b91d76ac41d5a5735e36 Mon Sep 17 00:00:00 2001
-From: Vendula Poncova <vponcova@redhat.com>
-Date: Thu, 2 Aug 2018 15:31:56 +0800
-Subject: [PATCH 2/2] Support transformation between D-Bus errors and
- exceptions.
-
-Exceptions can be registered with decorators, raised in a remote
-method and recreated after return from the remote call.
-
-Upstream-Status: Backport [https://src.fedoraproject.org/cgit/rpms/pytho=
n-pydbus.git/]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- pydbus/error.py        | 97 +++++++++++++++++++++++++++++++++++++++++++=
+++++++
- pydbus/proxy_method.py | 18 ++++++++--
- pydbus/registration.py | 16 ++++++---
- 3 files changed, 123 insertions(+), 8 deletions(-)
- create mode 100644 pydbus/error.py
-
-diff --git a/pydbus/error.py b/pydbus/error.py
-new file mode 100644
-index 0000000..aaa3510
---- /dev/null
-+++ b/pydbus/error.py
-@@ -0,0 +1,97 @@
-+from gi.repository import GLib, Gio
-+
-+
-+def register_error(name, domain, code):
-+	"""Register and map decorated exception class to a DBus error."""
-+	def decorated(cls):
-+		error_registration.register_error(cls, name, domain, code)
-+		return cls
-+
-+	return decorated
-+
-+
-+def map_error(error_name):
-+	"""Map decorated exception class to a DBus error."""
-+	def decorated(cls):
-+		error_registration.map_error(cls, error_name)
-+		return cls
-+
-+	return decorated
-+
-+
-+def map_by_default(cls):
-+	"""Map decorated exception class to all unknown DBus errors."""
-+	error_registration.map_by_default(cls)
-+	return cls
-+
-+
-+class ErrorRegistration(object):
-+	"""Class for mapping exceptions to DBus errors."""
-+
-+	_default =3D None
-+	_map =3D dict()
-+	_reversed_map =3D dict()
-+
-+	def map_by_default(self, exception_cls):
-+		"""Set the exception class as a default."""
-+		self._default =3D exception_cls
-+
-+	def map_error(self, exception_cls, name):
-+		"""Map the exception class to a DBus name."""
-+		self._map[name] =3D exception_cls
-+		self._reversed_map[exception_cls] =3D name
-+
-+	def register_error(self, exception_cls, name, domain, code):
-+		"""Map and register the exception class to a DBus name."""
-+		self.map_error(exception_cls, name)
-+		return Gio.DBusError.register_error(domain, code, name)
-+
-+	def is_registered_exception(self, obj):
-+		"""Is the exception registered?"""
-+		return obj.__class__ in self._reversed_map
-+
-+	def get_dbus_name(self, obj):
-+		"""Get the DBus name of the exception."""
-+		return self._reversed_map.get(obj.__class__)
-+
-+	def get_exception_class(self, name):
-+		"""Get the exception class mapped to the DBus name."""
-+		return self._map.get(name, self._default)
-+
-+	def transform_message(self, name, message):
-+		"""Transform the message of the exception."""
-+		prefix =3D "{}:{}: ".format("GDBus.Error", name)
-+
-+		if message.startswith(prefix):
-+			return message[len(prefix):]
-+
-+		return message
-+
-+	def transform_exception(self, e):
-+		"""Transform the remote error to the exception."""
-+		if not isinstance(e, GLib.Error):
-+			return e
-+
-+		if not Gio.DBusError.is_remote_error(e):
-+			return e
-+
-+		# Get DBus name of the error.
-+		name =3D Gio.DBusError.get_remote_error(e)
-+		# Get the exception class.
-+		exception_cls =3D self.get_exception_class(name)
-+
-+		# Return the original exception.
-+		if not exception_cls:
-+			return e
-+
-+		# Return new exception.
-+		message =3D self.transform_message(name, e.message)
-+		exception =3D exception_cls(message)
-+		exception.dbus_name =3D name
-+		exception.dbus_domain =3D e.domain
-+		exception.dbus_code =3D e.code
-+		return exception
-+
-+
-+# Default error registration.
-+error_registration =3D ErrorRegistration()
-diff --git a/pydbus/proxy_method.py b/pydbus/proxy_method.py
-index 4ea4304..e9496f5 100644
---- a/pydbus/proxy_method.py
-+++ b/pydbus/proxy_method.py
-@@ -2,6 +2,7 @@ from gi.repository import GLib
- from .generic import bound_method
- from .identifier import filter_identifier
- from .timeout import timeout_to_glib
-+from .error import error_registration
-=20
- try:
- 	from inspect import Signature, Parameter
-@@ -87,9 +88,20 @@ class ProxyMethod(object):
- 			call_args +=3D (self._finish_async_call, (callback, callback_args))
- 			instance._bus.con.call(*call_args)
- 			return None
-+
- 		else:
--			ret =3D instance._bus.con.call_sync(*call_args)
--			return self._unpack_return(ret)
-+			result =3D None
-+			error =3D None
-+
-+			try:
-+				result =3D instance._bus.con.call_sync(*call_args)
-+			except Exception as e:
-+				error =3D error_registration.transform_exception(e)
-+
-+			if error:
-+				raise error
-+
-+			return self._unpack_return(result)
-=20
- 	def _unpack_return(self, values):
- 		ret =3D values.unpack()
-@@ -108,7 +120,7 @@ class ProxyMethod(object):
- 			ret =3D source.call_finish(result)
- 			return_args =3D self._unpack_return(ret)
- 		except Exception as err:
--			error =3D err
-+			error =3D error_registration.transform_exception(err)
-=20
- 		callback, callback_args =3D user_data
- 		callback(*callback_args, returned=3Dreturn_args, error=3Derror)
-diff --git a/pydbus/registration.py b/pydbus/registration.py
-index f531539..1d2cbcb 100644
---- a/pydbus/registration.py
-+++ b/pydbus/registration.py
-@@ -5,6 +5,7 @@ from . import generic
- from .exitable import ExitableWithAliases
- from functools import partial
- from .method_call_context import MethodCallContext
-+from .error import error_registration
- import logging
-=20
- try:
-@@ -91,11 +92,16 @@ class ObjectWrapper(ExitableWithAliases("unwrap")):
- 			logger =3D logging.getLogger(__name__)
- 			logger.exception("Exception while handling %s.%s()", interface_name,=
 method_name)
-=20
--			#TODO Think of a better way to translate Python exception types to D=
Bus error types.
--			e_type =3D type(e).__name__
--			if not "." in e_type:
--				e_type =3D "unknown." + e_type
--			invocation.return_dbus_error(e_type, str(e))
-+			if error_registration.is_registered_exception(e):
-+				name =3D error_registration.get_dbus_name(e)
-+				invocation.return_dbus_error(name, str(e))
-+			else:
-+				logger.info("name is not registered")
-+				e_type =3D type(e).__name__
-+				if not "." in e_type:
-+					e_type =3D "unknown." + e_type
-+
-+				invocation.return_dbus_error(e_type, str(e))
-=20
- 	def Get(self, interface_name, property_name):
- 		type =3D self.readable_properties[interface_name + "." + property_nam=
e]
---=20
-2.7.4
-
diff --git a/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb =
b/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
deleted file mode 100644
index a1b9fffea6..0000000000
--- a/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION =3D "Pythonic DBus library"
-HOMEPAGE =3D "https://pypi.python.org/pypi/pydbus/"
-LICENSE =3D "LGPL-2.1-only"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da916467b91076e631dd8edb742476=
9c7"
-
-SRC_URI +=3D "file://0001-Support-asynchronous-calls-58.patch \
-            file://0002-Support-transformation-between-D-Bus-errors-and-=
exce.patch \
-"
-
-SRC_URI[md5sum] =3D "c6abd44862322679bd4e907bebc3e0d0"
-SRC_URI[sha256sum] =3D "4207162eff54223822c185da06c1ba8a34137a9602f3da5a=
528eedf3f78d0f2c"
-
-inherit pypi setuptools3
-
-S =3D "${WORKDIR}/pydbus-${PV}"
-
-RDEPENDS:${PN} =3D "${PYTHON_PN}-pygobject \
-                  ${PYTHON_PN}-io \
-                  ${PYTHON_PN}-logging"
--=20
2.34.1


