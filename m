Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA9FC47DD9
	for <webhook@archiver.kernel.org>; Fri, 22 Mar 2024 19:20:25 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web11.4142.1711135218196948744
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Mar 2024 12:20:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NH/5XiVk;
 spf=pass (domain: gmail.com, ip: 209.85.219.177, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dc6d8bd612dso2482232276.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Mar 2024 12:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711135217; x=1711740017; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oTe7wW3IQ60DRw/ymaSCpA4vQQIaC7arC7AX6wDkX2g=;
        b=NH/5XiVkHRPetJ8YqSgdKhmD6dAIp5y7cEL+vNMUyELxeqo0XhSnKhqNIk8HkEAFtJ
         UdLJAGAiUqgQUU0/wY7rz6j4sK6oQ0tkJjlYCCYJ6ZqB9i9TYCaIAwk2F8prk9/DjAsE
         Lb/tAZb3S4ASFbGc/6GY1CTwZbhlJs849dZGj1Y/NH/OmQ67dUWKDR4oLrmWYQkn8Q47
         lBLMxh5NSwhSYVO8Osiqba1maRa0CKQk4Kg2JJFqqJgUIbpeueHvrYphtMwJ3YzvdX5v
         Y5xH0NWn3JdkLHI2mVigeEhnfgTet9og9KFSqfIQX7gNiXfDykJrwySbRzqKqaTPE9KT
         ke9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711135217; x=1711740017;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oTe7wW3IQ60DRw/ymaSCpA4vQQIaC7arC7AX6wDkX2g=;
        b=bhLULHBkG7w/CLmIxpCEcHypgX/HEZzLJUmhcsNITQ0hm1/Mt/05eXnzqQ7gplKduO
         rsPfzICQq8ysvVEXNSr+eKPryBZikTP/2x/GG3B+0TEyNLotKX5+sKEig+Ay+yAI8vES
         unJL63dmU5hFq8q01h/oR5jxcYf+zIXHG5DHv3VLaKRxKtwYH2T9mryCP0TCuP3Wv465
         Asys6hEvy5+uHgL99d8IwUg54MXclCu9zUZHLG93Jot2Jg3PFQ/Y3RhJHu2zeND+P/2E
         QERUwCJ9jY0TNgQOIm+WgtbC4QaUEsU7WDb1Gh5ONfPD9eyd73X20W0qCPxDuGaoWZLq
         sUIw==
X-Gm-Message-State: AOJu0YzeDTfb2r56MqpHB11JJrhdfO09MgNY+QTdVc4ap1fmxIK8EJrx
	xyohTyLYeAXXx1Kxi+9LGGvxuLz2XIT58TysdMQBcdAkx/3hfJ68KQQsTwHlwXq56xrcIinYW0e
	qg/ltQVhAdfS1s4FOrW45ZQrSnYc=
X-Google-Smtp-Source: AGHT+IEki0iin7WXPifdZmAZUr5pU4xVlm7aLScQa4dZvtZoHN8ZfwxZgKUEszgcgjg5irPXZhTFVoCSOmH/fw7kH7U=
X-Received: by 2002:a25:c5cc:0:b0:dc7:5a73:184e with SMTP id
 v195-20020a25c5cc000000b00dc75a73184emr298353ybe.14.1711135216779; Fri, 22
 Mar 2024 12:20:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240322165954.2729615-1-derek@asterius.io>
In-Reply-To: <20240322165954.2729615-1-derek@asterius.io>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 22 Mar 2024 12:20:05 -0700
Message-ID: <CANx9H-CWkosfLFC946JJm=HG5k8OtLWZPYeXgO8JJfDS6V0zyw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH v3] python3-dbus: re-add recipe with
 latest patches and add ptest
To: Derek Straka <derek@asterius.io>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c24ae9061444b651"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Mar 2024 19:20:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109526

--000000000000c24ae9061444b651
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 22, 2024 at 10:00=E2=80=AFAM Derek Straka <derek@asterius.io> w=
rote:

> The python3-dbus package was removed in (dac933e).  While the upstream
> project isn't active, other distributions (e.g. Fedora, Debian, etc)
> continue to offer the package and apply patches to resolve reported issue=
s.
>
> While other packages offer similar functionality (e.g. dasbus), they are
> not
> drop in replacements and the general dbus functionality works out of the
> box.
> The python package has accomplished it's goal of providing useful
> functionality,
> and the proposal is to continue to have it available in meta-python for
> use.
>
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  .../ptest-packagelists-meta-python.inc        |   1 +
>  .../packagegroups/packagegroup-meta-python.bb |   1 +
>  ...ttribute-conforming-to-introspect.dt.patch |  40 ++
>  .../0002-Support-asynchronous-calls-58.patch  | 206 ++++++++
>  ...mation-between-D-Bus-errors-and-exce.patch | 495 ++++++++++++++++++
>  .../python/python3-pydbus/run-ptest           |  15 +
>  .../python/python3-pydbus_0.6.0.bb            |  26 +
>  7 files changed, 784 insertions(+)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pydbus/0001-make-direction-at=
tribute-conforming-to-introspect.dt.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pydbus/0002-Support-asynchron=
ous-calls-58.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pydbus/0003-Support-transform=
ation-between-D-Bus-errors-and-exce.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pydbus/run-ptest
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-pydbus_0.6.0.bb
>
> diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc
> b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> index 447e0b938..ec26f768e 100644
> --- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
> +++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> @@ -53,6 +53,7 @@ PTESTS_FAST_META_PYTHON =3D "\
>      python3-pytest-mock \
>      python3-pytoml \
>      python3-pyyaml-include \
> +    python3-pydbus \
>      python3-rapidjson \
>      python3-requests-file \
>      python3-requests-toolbelt \
> diff --git a/meta-python/recipes-core/packagegroups/
> packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/
> packagegroup-meta-python.bb
> index eb5a26463..e0446da28 100644
> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> @@ -311,6 +311,7 @@ RDEPENDS:packagegroup-meta-python3 =3D "\
>      python3-pycodestyle \
>      python3-pyconnman \
>      python3-pycurl \
> +    python3-pydbus \
>      python3-pydicti \
>      python3-pyephem \
>      python3-pyexpect \
> diff --git
> a/meta-python/recipes-devtools/python/python3-pydbus/0001-make-direction-=
attribute-conforming-to-introspect.dt.patch
> b/meta-python/recipes-devtools/python/python3-pydbus/0001-make-direction-=
attribute-conforming-to-introspect.dt.patch
> new file mode 100644
> index 000000000..1bd17986e
> --- /dev/null
> +++
> b/meta-python/recipes-devtools/python/python3-pydbus/0001-make-direction-=
attribute-conforming-to-introspect.dt.patch
> @@ -0,0 +1,40 @@
> +From 5fe65a35e0e7106347639f0258206fadb451c439 Mon Sep 17 00:00:00 2001
> +From: Hiroaki KAWAI <hiroaki.kawai@gmail.com>
> +Date: Wed, 1 Feb 2017 18:00:33 +0900
> +Subject: [PATCH 1/3] make direction attribute conforming to introspect.d=
td
> +
> +direction attribute defaults to "in" as
> +in the DTD(*1), direction attribute is defined as following:
> +
> +```
> +<!ATTRLIST arg direction (in|out) "in">
> +```
> +
> +*1) http://www.freedesktop.org/standards/dbus/1.0/introspect.dtd
> +
> +Adapted from Fedora [
> https://src.fedoraproject.org/cgit/rpms/python-pydbus.git/]
> +
> +Upstream-Status: Inactive-Upstream (Last release 12/18/2016; Last commit
> 05/6/2018)
>

For the record, I am ok with this recipe coming back, especially since
Derek is clearly willing to help maintain it.
If we see some unhandled vulnerabilities come up, we can revisit the
decision to drop it.

I do appreciate Alex's concerns.


> +
> +Signed-off-by: Derek Straka <derek@asterius.io>
> +---
> + pydbus/proxy_method.py | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/pydbus/proxy_method.py b/pydbus/proxy_method.py
> +index 8798edd..3e6e6ee 100644
> +--- a/pydbus/proxy_method.py
> ++++ b/pydbus/proxy_method.py
> +@@ -33,8 +33,8 @@ class ProxyMethod(object):
> +               self.__name__ =3D method.attrib["name"]
> +               self.__qualname__ =3D self._iface_name + "." + self.__nam=
e__
> +
> +-              self._inargs  =3D [(arg.attrib.get("name", ""),
> arg.attrib["type"]) for arg in method if arg.tag =3D=3D "arg" and
> arg.attrib["direction"] =3D=3D "in"]
> +-              self._outargs =3D [arg.attrib["type"] for arg in method i=
f
> arg.tag =3D=3D "arg" and arg.attrib["direction"] =3D=3D "out"]
> ++              self._inargs  =3D [(arg.attrib.get("name", ""),
> arg.attrib["type"]) for arg in method if arg.tag =3D=3D "arg" and
> arg.attrib.get("direction", "in") =3D=3D "in"]
> ++              self._outargs =3D [arg.attrib["type"] for arg in method i=
f
> arg.tag =3D=3D "arg" and arg.attrib.get("direction", "in") =3D=3D "out"]
> +               self._sinargs  =3D "(" + "".join(x[1] for x in self._inar=
gs)
> + ")"
> +               self._soutargs =3D "(" + "".join(self._outargs) + ")"
> +
> +--
> +2.13.5
> diff --git
> a/meta-python/recipes-devtools/python/python3-pydbus/0002-Support-asynchr=
onous-calls-58.patch
> b/meta-python/recipes-devtools/python/python3-pydbus/0002-Support-asynchr=
onous-calls-58.patch
> new file mode 100644
> index 000000000..b3c57edad
> --- /dev/null
> +++
> b/meta-python/recipes-devtools/python/python3-pydbus/0002-Support-asynchr=
onous-calls-58.patch
> @@ -0,0 +1,206 @@
> +From 31d6dd7893a5e1bb9eb14bfcee861a5b62f64960 Mon Sep 17 00:00:00 2001
> +From: Vendula Poncova <vponcova@redhat.com>
> +Date: Thu, 27 Jul 2017 18:41:29 +0200
> +Subject: [PATCH 2/3] Support asynchronous calls (#58)
> +
> +Added support for asynchronous calls of methods. A method is called
> +synchronously unless its callback parameter is specified. A callback
> +is a function f(*args, returned=3DNone, error=3DNone), where args is
> +callback_args specified in the method call, returned is a return
> +value of the method and error is an exception raised by the method.
> +
> +Example of an asynchronous call:
> +
> +def func(x, y, returned=3DNone, error=3DNone):
> +  pass
> +
> +proxy.Method(a, b, callback=3Dfunc, callback_args=3D(x, y))
> +
> +Adapted from Fedora [
> https://src.fedoraproject.org/cgit/rpms/python-pydbus.git/]
> +
> +Upstream-Status: Inactive-Upstream (Last release 12/18/2016; Last commit
> 05/6/2018)
> +
> +Signed-off-by: Derek Straka <derek@asterius.io>
> +---
> + doc/tutorial.rst       | 11 ++++++++-
> + pydbus/proxy_method.py | 44 ++++++++++++++++++++++++++++++-----
> + tests/publish_async.py | 63
> ++++++++++++++++++++++++++++++++++++++++++++++++++
> + tests/run.sh           |  1 +
> + 4 files changed, 112 insertions(+), 7 deletions(-)
> + create mode 100644 tests/publish_async.py
> +
> +diff --git a/doc/tutorial.rst b/doc/tutorial.rst
> +index 7474de3..b8479cf 100644
> +--- a/doc/tutorial.rst
> ++++ b/doc/tutorial.rst
> +@@ -84,7 +84,8 @@ All objects have methods, properties and signals.
> + Setting up an event loop
> + =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> +
> +-To handle signals emitted by exported objects, or to export your own
> objects, you need to setup an event loop.
> ++To handle signals emitted by exported objects, to asynchronously call
> methods
> ++or to export your own objects, you need to setup an event loop.
> +
> + The only main loop supported by ``pydbus`` is GLib.MainLoop.
> +
> +@@ -156,6 +157,14 @@ To call a method::
> +
> +     dev.Disconnect()
> +
> ++To asynchronously call a method::
> ++
> ++    def print_result(returned=3DNone, error=3DNone):
> ++        print(returned, error)
> ++
> ++    dev.GetAppliedConnection(0, callback=3Dprint_result)
> ++    loop.run()
> ++
> + To read a property::
> +
> +     print(dev.Autoconnect)
> +diff --git a/pydbus/proxy_method.py b/pydbus/proxy_method.py
> +index 3e6e6ee..442fe07 100644
> +--- a/pydbus/proxy_method.py
> ++++ b/pydbus/proxy_method.py
> +@@ -65,15 +65,34 @@ class ProxyMethod(object):
> +
> +               # Python 2 sux
> +               for kwarg in kwargs:
> +-                      if kwarg not in ("timeout",):
> ++                      if kwarg not in ("timeout", "callback",
> "callback_args"):
> +                               raise TypeError(self.__qualname__ + " got
> an unexpected keyword argument '{}'".format(kwarg))
> +               timeout =3D kwargs.get("timeout", None)
> ++              callback =3D kwargs.get("callback", None)
> ++              callback_args =3D kwargs.get("callback_args", tuple())
> ++
> ++              call_args =3D (
> ++                      instance._bus_name,
> ++                      instance._path,
> ++                      self._iface_name,
> ++                      self.__name__,
> ++                      GLib.Variant(self._sinargs, args),
> ++                      GLib.VariantType.new(self._soutargs),
> ++                      0,
> ++                      timeout_to_glib(timeout),
> ++                      None
> ++              )
> ++
> ++              if callback:
> ++                      call_args +=3D (self._finish_async_call, (callbac=
k,
> callback_args))
> ++                      instance._bus.con.call(*call_args)
> ++                      return None
> ++              else:
> ++                      ret =3D instance._bus.con.call_sync(*call_args)
> ++                      return self._unpack_return(ret)
> +
> +-              ret =3D instance._bus.con.call_sync(
> +-                      instance._bus_name, instance._path,
> +-                      self._iface_name, self.__name__,
> GLib.Variant(self._sinargs, args), GLib.VariantType.new(self._soutargs),
> +-                      0, timeout_to_glib(timeout), None).unpack()
> +-
> ++      def _unpack_return(self, values):
> ++              ret =3D values.unpack()
> +               if len(self._outargs) =3D=3D 0:
> +                       return None
> +               elif len(self._outargs) =3D=3D 1:
> +@@ -81,6 +100,19 @@ class ProxyMethod(object):
> +               else:
> +                       return ret
> +
> ++      def _finish_async_call(self, source, result, user_data):
> ++              error =3D None
> ++              return_args =3D None
> ++
> ++              try:
> ++                      ret =3D source.call_finish(result)
> ++                      return_args =3D self._unpack_return(ret)
> ++              except Exception as err:
> ++                      error =3D err
> ++
> ++              callback, callback_args =3D user_data
> ++              callback(*callback_args, returned=3Dreturn_args, error=3D=
error)
> ++
> +       def __get__(self, instance, owner):
> +               if instance is None:
> +                       return self
> +diff --git a/tests/publish_async.py b/tests/publish_async.py
> +new file mode 100644
> +index 0000000..3f79b62
> +--- /dev/null
> ++++ b/tests/publish_async.py
> +@@ -0,0 +1,63 @@
> ++from pydbus import SessionBus
> ++from gi.repository import GLib
> ++from threading import Thread
> ++import sys
> ++
> ++done =3D 0
> ++loop =3D GLib.MainLoop()
> ++
> ++class TestObject(object):
> ++      '''
> ++<node>
> ++      <interface name=3D'net.lew21.pydbus.tests.publish_async'>
> ++              <method name=3D'HelloWorld'>
> ++                      <arg type=3D'i' name=3D'x' direction=3D'in'/>
> ++                      <arg type=3D's' name=3D'response' direction=3D'ou=
t'/>
> ++              </method>
> ++      </interface>
> ++</node>
> ++      '''
> ++      def __init__(self, id):
> ++              self.id =3D id
> ++
> ++      def HelloWorld(self, x):
> ++              res =3D self.id + ": " + str(x)
> ++              print(res)
> ++              return res
> ++
> ++bus =3D SessionBus()
> ++
> ++with bus.publish("net.lew21.pydbus.tests.publish_async",
> TestObject("Obj")):
> ++      remote =3D bus.get("net.lew21.pydbus.tests.publish_async")
> ++
> ++      def callback(x, returned=3DNone, error=3DNone):
> ++              print("asyn: " + returned)
> ++              assert (returned is not None)
> ++              assert(error is None)
> ++              assert(x =3D=3D int(returned.split()[1]))
> ++
> ++              global done
> ++              done +=3D 1
> ++              if done =3D=3D 3:
> ++                      loop.quit()
> ++
> ++      def t1_func():
> ++              remote.HelloWorld(1, callback=3Dcallback, callback_args=
=3D(1,))
> ++              remote.HelloWorld(2, callback=3Dcallback, callback_args=
=3D(2,))
> ++              print("sync: " + remote.HelloWorld(3))
> ++              remote.HelloWorld(4, callback=3Dcallback, callback_args=
=3D(4,))
> ++
> ++      t1 =3D Thread(None, t1_func)
> ++      t1.daemon =3D True
> ++
> ++      def handle_timeout():
> ++              print("ERROR: Timeout.")
> ++              sys.exit(1)
> ++
> ++      GLib.timeout_add_seconds(2, handle_timeout)
> ++
> ++      t1.start()
> ++
> ++      loop.run()
> ++
> ++      t1.join()
> +diff --git a/tests/run.sh b/tests/run.sh
> +index 8d93644..271c58a 100755
> +--- a/tests/run.sh
> ++++ b/tests/run.sh
> +@@ -15,4 +15,5 @@ then
> +       "$PYTHON" $TESTS_DIR/publish.py
> +       "$PYTHON" $TESTS_DIR/publish_properties.py
> +       "$PYTHON" $TESTS_DIR/publish_multiface.py
> ++      "$PYTHON" $TESTS_DIR/publish_async.py
> + fi
> +--
> +2.13.5
> diff --git
> a/meta-python/recipes-devtools/python/python3-pydbus/0003-Support-transfo=
rmation-between-D-Bus-errors-and-exce.patch
> b/meta-python/recipes-devtools/python/python3-pydbus/0003-Support-transfo=
rmation-between-D-Bus-errors-and-exce.patch
> new file mode 100644
> index 000000000..a1b8a6c38
> --- /dev/null
> +++
> b/meta-python/recipes-devtools/python/python3-pydbus/0003-Support-transfo=
rmation-between-D-Bus-errors-and-exce.patch
> @@ -0,0 +1,495 @@
> +From 773858e1afd21cdf3ceef2cd35509f0b4882bf16 Mon Sep 17 00:00:00 2001
> +From: Vendula Poncova <vponcova@redhat.com>
> +Date: Tue, 1 Aug 2017 16:54:24 +0200
> +Subject: [PATCH 3/3] Support transformation between D-Bus errors and
> + exceptions.
> +
> +Exceptions can be registered with decorators, raised in a remote
> +method and recreated after return from the remote call.
> +
> +Adapted from Fedora [
> https://src.fedoraproject.org/cgit/rpms/python-pydbus.git/]
> +
> +Upstream-Status: Inactive-Upstream (Last release 12/18/2016; Last commit
> 05/6/2018)
> +
> +Signed-off-by: Derek Straka <derek@asterius.io>
> +---
> + doc/tutorial.rst       |  47 ++++++++++++++++++
> + pydbus/error.py        |  97 ++++++++++++++++++++++++++++++++++++
> + pydbus/proxy_method.py |  18 +++++--
> + pydbus/registration.py |  16 ++++--
> + tests/error.py         |  67 +++++++++++++++++++++++++
> + tests/publish_error.py | 132
> +++++++++++++++++++++++++++++++++++++++++++++++++
> + tests/run.sh           |   2 +
> + 7 files changed, 371 insertions(+), 8 deletions(-)
> + create mode 100644 pydbus/error.py
> + create mode 100644 tests/error.py
> + create mode 100644 tests/publish_error.py
> +
> +diff --git a/doc/tutorial.rst b/doc/tutorial.rst
> +index b8479cf..7fe55e1 100644
> +--- a/doc/tutorial.rst
> ++++ b/doc/tutorial.rst
> +@@ -341,6 +341,53 @@ See ``help(bus.request_name)`` and
> ``help(bus.register_object)`` for details.
> +
> + .. --------------------------------------------------------------------
> +
> ++Error handling
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ++
> ++You can map D-Bus errors to your exception classes for better error
> handling.
> ++To handle D-Bus errors, use the ``@map_error`` decorator::
> ++
> ++    from pydbus.error import map_error
> ++
> ++    @map_error("org.freedesktop.DBus.Error.InvalidArgs")
> ++    class InvalidArgsException(Exception):
> ++        pass
> ++
> ++    try:
> ++        ...
> ++    catch InvalidArgsException as e:
> ++        print(e)
> ++
> ++To register new D-Bus errors, use the ``@register_error`` decorator::
> ++
> ++    from pydbus.error import register_error
> ++
> ++    @map_error("net.lew21.pydbus.TutorialExample.MyError", MY_DOMAIN,
> MY_EXCEPTION_CODE)
> ++    class MyException(Exception):
> ++        pass
> ++
> ++Then you can raise ``MyException`` from the D-Bus method of the remote
> object::
> ++
> ++    def Method():
> ++        raise MyException("Message")
> ++
> ++And catch the same exception on the client side::
> ++
> ++    try:
> ++        proxy.Method()
> ++    catch MyException as e:
> ++        print(e)
> ++
> ++To handle all unknown D-Bus errors, use the ``@map_by_default``
> decorator to specify the default exception::
> ++
> ++    from pydbus.error import map_by_default
> ++
> ++    @map_by_default
> ++    class DefaultException(Exception):
> ++        pass
> ++
> ++.. --------------------------------------------------------------------
> ++
> + Data types
> + =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +diff --git a/pydbus/error.py b/pydbus/error.py
> +new file mode 100644
> +index 0000000..aaa3510
> +--- /dev/null
> ++++ b/pydbus/error.py
> +@@ -0,0 +1,97 @@
> ++from gi.repository import GLib, Gio
> ++
> ++
> ++def register_error(name, domain, code):
> ++      """Register and map decorated exception class to a DBus error."""
> ++      def decorated(cls):
> ++              error_registration.register_error(cls, name, domain, code=
)
> ++              return cls
> ++
> ++      return decorated
> ++
> ++
> ++def map_error(error_name):
> ++      """Map decorated exception class to a DBus error."""
> ++      def decorated(cls):
> ++              error_registration.map_error(cls, error_name)
> ++              return cls
> ++
> ++      return decorated
> ++
> ++
> ++def map_by_default(cls):
> ++      """Map decorated exception class to all unknown DBus errors."""
> ++      error_registration.map_by_default(cls)
> ++      return cls
> ++
> ++
> ++class ErrorRegistration(object):
> ++      """Class for mapping exceptions to DBus errors."""
> ++
> ++      _default =3D None
> ++      _map =3D dict()
> ++      _reversed_map =3D dict()
> ++
> ++      def map_by_default(self, exception_cls):
> ++              """Set the exception class as a default."""
> ++              self._default =3D exception_cls
> ++
> ++      def map_error(self, exception_cls, name):
> ++              """Map the exception class to a DBus name."""
> ++              self._map[name] =3D exception_cls
> ++              self._reversed_map[exception_cls] =3D name
> ++
> ++      def register_error(self, exception_cls, name, domain, code):
> ++              """Map and register the exception class to a DBus name.""=
"
> ++              self.map_error(exception_cls, name)
> ++              return Gio.DBusError.register_error(domain, code, name)
> ++
> ++      def is_registered_exception(self, obj):
> ++              """Is the exception registered?"""
> ++              return obj.__class__ in self._reversed_map
> ++
> ++      def get_dbus_name(self, obj):
> ++              """Get the DBus name of the exception."""
> ++              return self._reversed_map.get(obj.__class__)
> ++
> ++      def get_exception_class(self, name):
> ++              """Get the exception class mapped to the DBus name."""
> ++              return self._map.get(name, self._default)
> ++
> ++      def transform_message(self, name, message):
> ++              """Transform the message of the exception."""
> ++              prefix =3D "{}:{}: ".format("GDBus.Error", name)
> ++
> ++              if message.startswith(prefix):
> ++                      return message[len(prefix):]
> ++
> ++              return message
> ++
> ++      def transform_exception(self, e):
> ++              """Transform the remote error to the exception."""
> ++              if not isinstance(e, GLib.Error):
> ++                      return e
> ++
> ++              if not Gio.DBusError.is_remote_error(e):
> ++                      return e
> ++
> ++              # Get DBus name of the error.
> ++              name =3D Gio.DBusError.get_remote_error(e)
> ++              # Get the exception class.
> ++              exception_cls =3D self.get_exception_class(name)
> ++
> ++              # Return the original exception.
> ++              if not exception_cls:
> ++                      return e
> ++
> ++              # Return new exception.
> ++              message =3D self.transform_message(name, e.message)
> ++              exception =3D exception_cls(message)
> ++              exception.dbus_name =3D name
> ++              exception.dbus_domain =3D e.domain
> ++              exception.dbus_code =3D e.code
> ++              return exception
> ++
> ++
> ++# Default error registration.
> ++error_registration =3D ErrorRegistration()
> +diff --git a/pydbus/proxy_method.py b/pydbus/proxy_method.py
> +index 442fe07..a73f9eb 100644
> +--- a/pydbus/proxy_method.py
> ++++ b/pydbus/proxy_method.py
> +@@ -2,6 +2,7 @@ from gi.repository import GLib
> + from .generic import bound_method
> + from .identifier import filter_identifier
> + from .timeout import timeout_to_glib
> ++from .error import error_registration
> +
> + try:
> +       from inspect import Signature, Parameter
> +@@ -87,9 +88,20 @@ class ProxyMethod(object):
> +                       call_args +=3D (self._finish_async_call, (callbac=
k,
> callback_args))
> +                       instance._bus.con.call(*call_args)
> +                       return None
> ++
> +               else:
> +-                      ret =3D instance._bus.con.call_sync(*call_args)
> +-                      return self._unpack_return(ret)
> ++                      result =3D None
> ++                      error =3D None
> ++
> ++                      try:
> ++                              result =3D
> instance._bus.con.call_sync(*call_args)
> ++                      except Exception as e:
> ++                              error =3D
> error_registration.transform_exception(e)
> ++
> ++                      if error:
> ++                              raise error
> ++
> ++                      return self._unpack_return(result)
> +
> +       def _unpack_return(self, values):
> +               ret =3D values.unpack()
> +@@ -108,7 +120,7 @@ class ProxyMethod(object):
> +                       ret =3D source.call_finish(result)
> +                       return_args =3D self._unpack_return(ret)
> +               except Exception as err:
> +-                      error =3D err
> ++                      error =3D error_registration.transform_exception(=
err)
> +
> +               callback, callback_args =3D user_data
> +               callback(*callback_args, returned=3Dreturn_args, error=3D=
error)
> +diff --git a/pydbus/registration.py b/pydbus/registration.py
> +index f531539..1d2cbcb 100644
> +--- a/pydbus/registration.py
> ++++ b/pydbus/registration.py
> +@@ -5,6 +5,7 @@ from . import generic
> + from .exitable import ExitableWithAliases
> + from functools import partial
> + from .method_call_context import MethodCallContext
> ++from .error import error_registration
> + import logging
> +
> + try:
> +@@ -91,11 +92,16 @@ class ObjectWrapper(ExitableWithAliases("unwrap")):
> +                       logger =3D logging.getLogger(__name__)
> +                       logger.exception("Exception while handling
> %s.%s()", interface_name, method_name)
> +
> +-                      #TODO Think of a better way to translate Python
> exception types to DBus error types.
> +-                      e_type =3D type(e).__name__
> +-                      if not "." in e_type:
> +-                              e_type =3D "unknown." + e_type
> +-                      invocation.return_dbus_error(e_type, str(e))
> ++                      if error_registration.is_registered_exception(e):
> ++                              name =3D error_registration.get_dbus_name=
(e)
> ++                              invocation.return_dbus_error(name, str(e)=
)
> ++                      else:
> ++                              logger.info("name is not registered")
> ++                              e_type =3D type(e).__name__
> ++                              if not "." in e_type:
> ++                                      e_type =3D "unknown." + e_type
> ++
> ++                              invocation.return_dbus_error(e_type,
> str(e))
> +
> +       def Get(self, interface_name, property_name):
> +               type =3D self.readable_properties[interface_name + "." +
> property_name]
> +diff --git a/tests/error.py b/tests/error.py
> +new file mode 100644
> +index 0000000..3ec507d
> +--- /dev/null
> ++++ b/tests/error.py
> +@@ -0,0 +1,67 @@
> ++from pydbus.error import ErrorRegistration
> ++
> ++
> ++class ExceptionA(Exception):
> ++      pass
> ++
> ++
> ++class ExceptionB(Exception):
> ++      pass
> ++
> ++
> ++class ExceptionC(Exception):
> ++      pass
> ++
> ++
> ++class ExceptionD(Exception):
> ++      pass
> ++
> ++
> ++class ExceptionE(Exception):
> ++      pass
> ++
> ++
> ++def test_error_mapping():
> ++      r =3D ErrorRegistration()
> ++      r.map_error(ExceptionA, "net.lew21.pydbus.tests.ErrorA")
> ++      r.map_error(ExceptionB, "net.lew21.pydbus.tests.ErrorB")
> ++      r.map_error(ExceptionC, "net.lew21.pydbus.tests.ErrorC")
> ++
> ++      assert r.is_registered_exception(ExceptionA("Test"))
> ++      assert r.is_registered_exception(ExceptionB("Test"))
> ++      assert r.is_registered_exception(ExceptionC("Test"))
> ++      assert not r.is_registered_exception(ExceptionD("Test"))
> ++      assert not r.is_registered_exception(ExceptionE("Test"))
> ++
> ++      assert r.get_dbus_name(ExceptionA("Test")) =3D=3D
> "net.lew21.pydbus.tests.ErrorA"
> ++      assert r.get_dbus_name(ExceptionB("Test")) =3D=3D
> "net.lew21.pydbus.tests.ErrorB"
> ++      assert r.get_dbus_name(ExceptionC("Test")) =3D=3D
> "net.lew21.pydbus.tests.ErrorC"
> ++
> ++      assert r.get_exception_class("net.lew21.pydbus.tests.ErrorA") =3D=
=3D
> ExceptionA
> ++      assert r.get_exception_class("net.lew21.pydbus.tests.ErrorB") =3D=
=3D
> ExceptionB
> ++      assert r.get_exception_class("net.lew21.pydbus.tests.ErrorC") =3D=
=3D
> ExceptionC
> ++      assert r.get_exception_class("net.lew21.pydbus.tests.ErrorD") is
> None
> ++      assert r.get_exception_class("net.lew21.pydbus.tests.ErrorE") is
> None
> ++
> ++      r.map_by_default(ExceptionD)
> ++      assert not r.is_registered_exception(ExceptionD("Test"))
> ++      assert r.get_exception_class("net.lew21.pydbus.tests.ErrorD") =3D=
=3D
> ExceptionD
> ++      assert r.get_exception_class("net.lew21.pydbus.tests.ErrorE") =3D=
=3D
> ExceptionD
> ++
> ++
> ++def test_transform_message():
> ++      r =3D ErrorRegistration()
> ++      n1 =3D "net.lew21.pydbus.tests.ErrorA"
> ++      m1 =3D "GDBus.Error:net.lew21.pydbus.tests.ErrorA: Message1"
> ++
> ++      n2 =3D "net.lew21.pydbus.tests.ErrorB"
> ++      m2 =3D "GDBus.Error:net.lew21.pydbus.tests.ErrorB: Message2"
> ++
> ++      assert r.transform_message(n1, m1) =3D=3D "Message1"
> ++      assert r.transform_message(n2, m2) =3D=3D "Message2"
> ++      assert r.transform_message(n1, m2) =3D=3D m2
> ++      assert r.transform_message(n2, m1) =3D=3D m1
> ++
> ++
> ++test_error_mapping()
> ++test_transform_message()
> +diff --git a/tests/publish_error.py b/tests/publish_error.py
> +new file mode 100644
> +index 0000000..aa8a18a
> +--- /dev/null
> ++++ b/tests/publish_error.py
> +@@ -0,0 +1,132 @@
> ++import sys
> ++from threading import Thread
> ++from gi.repository import GLib, Gio
> ++from pydbus import SessionBus
> ++from pydbus.error import register_error, map_error, map_by_default,
> error_registration
> ++
> ++import logging
> ++logger =3D logging.getLogger('pydbus.registration')
> ++logger.disabled =3D True
> ++
> ++loop =3D GLib.MainLoop()
> ++DOMAIN =3D Gio.DBusError.quark()  # TODO: Register new domain.
> ++
> ++
> ++@register_error("net.lew21.pydbus.tests.ErrorA", DOMAIN, 1000)
> ++class ExceptionA(Exception):
> ++      pass
> ++
> ++
> ++@register_error("net.lew21.pydbus.tests.ErrorB", DOMAIN, 2000)
> ++class ExceptionB(Exception):
> ++      pass
> ++
> ++
> ++@map_error("org.freedesktop.DBus.Error.InvalidArgs")
> ++class ExceptionC(Exception):
> ++      pass
> ++
> ++
> ++@map_by_default
> ++class ExceptionD(Exception):
> ++      pass
> ++
> ++
> ++class ExceptionE(Exception):
> ++      pass
> ++
> ++
> ++class TestObject(object):
> ++      '''
> ++<node>
> ++      <interface name=3D'net.lew21.pydbus.tests.TestInterface'>
> ++              <method name=3D'RaiseA'>
> ++                      <arg type=3D's' name=3D'msg' direction=3D'in'/>
> ++              </method>
> ++              <method name=3D'RaiseB'>
> ++                      <arg type=3D's' name=3D'msg' direction=3D'in'/>
> ++              </method>
> ++              <method name=3D'RaiseD'>
> ++                      <arg type=3D's' name=3D'msg' direction=3D'in'/>
> ++              </method>
> ++              <method name=3D'RaiseE'>
> ++                      <arg type=3D's' name=3D'msg' direction=3D'in'/>
> ++              </method>
> ++      </interface>
> ++</node>
> ++      '''
> ++
> ++      def RaiseA(self, msg):
> ++              raise ExceptionA(msg)
> ++
> ++      def RaiseB(self, msg):
> ++              raise ExceptionB(msg)
> ++
> ++      def RaiseD(self, msg):
> ++              raise ExceptionD(msg)
> ++
> ++      def RaiseE(self, msg):
> ++              raise ExceptionE(msg)
> ++
> ++bus =3D SessionBus()
> ++
> ++with bus.publish("net.lew21.pydbus.tests.Test", TestObject()):
> ++      remote =3D bus.get("net.lew21.pydbus.tests.Test")
> ++
> ++      def t_func():
> ++              # Test new registered errors.
> ++              try:
> ++                      remote.RaiseA("Test A")
> ++              except ExceptionA as e:
> ++                      assert str(e) =3D=3D "Test A"
> ++
> ++              try:
> ++                      remote.RaiseB("Test B")
> ++              except ExceptionB as e:
> ++                      assert str(e) =3D=3D "Test B"
> ++
> ++              # Test mapped errors.
> ++              try:
> ++                      remote.Get("net.lew21.pydbus.tests.TestInterface"=
,
> "Foo")
> ++              except ExceptionC as e:
> ++                      assert str(e) =3D=3D "No such property 'Foo'"
> ++
> ++              # Test default errors.
> ++              try:
> ++                      remote.RaiseD("Test D")
> ++              except ExceptionD as e:
> ++                      assert str(e) =3D=3D "Test D"
> ++
> ++              try:
> ++                      remote.RaiseE("Test E")
> ++              except ExceptionD as e:
> ++                      assert str(e) =3D=3D "Test E"
> ++
> ++              # Test with no default errors.
> ++              error_registration.map_by_default(None)
> ++
> ++              try:
> ++                      remote.RaiseD("Test D")
> ++              except Exception as e:
> ++                      assert not isinstance(e, ExceptionD)
> ++
> ++              try:
> ++                      remote.RaiseE("Test E")
> ++              except Exception as e:
> ++                      assert not isinstance(e, ExceptionD)
> ++                      assert not isinstance(e, ExceptionE)
> ++
> ++              loop.quit()
> ++
> ++      t =3D Thread(None, t_func)
> ++      t.daemon =3D True
> ++
> ++      def handle_timeout():
> ++              print("ERROR: Timeout.")
> ++              sys.exit(1)
> ++
> ++      GLib.timeout_add_seconds(4, handle_timeout)
> ++
> ++      t.start()
> ++      loop.run()
> ++      t.join()
> +diff --git a/tests/run.sh b/tests/run.sh
> +index 271c58a..a08baf8 100755
> +--- a/tests/run.sh
> ++++ b/tests/run.sh
> +@@ -10,10 +10,11 @@ PYTHON=3D${1:-python}
> +
> + "$PYTHON" $TESTS_DIR/context.py
> + "$PYTHON" $TESTS_DIR/identifier.py
> ++"$PYTHON" $TESTS_DIR/error.py
> + if [ "$2" !=3D "dontpublish" ]
> + then
> +       "$PYTHON" $TESTS_DIR/publish.py
> +       "$PYTHON" $TESTS_DIR/publish_properties.py
> +       "$PYTHON" $TESTS_DIR/publish_multiface.py
> +       "$PYTHON" $TESTS_DIR/publish_async.py
> + fi
> +--
> +2.13.5
> diff --git a/meta-python/recipes-devtools/python/python3-pydbus/run-ptest
> b/meta-python/recipes-devtools/python/python3-pydbus/run-ptest
> new file mode 100644
> index 000000000..782ceed3b
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pydbus/run-ptest
> @@ -0,0 +1,15 @@
> +#!/bin/sh
> +
> +for case in `find tests -type f -name '*.sh'`; do
> +    bash $case python3 >$case.output 2>&1
> +    ret=3D$?
> +    if [ $ret -ne 0 ]; then
> +        cat $case.output
> +        echo "FAIL: ${case}"
> +    elif grep -i 'SKIP' $case.output; then
> +        echo "SKIP: ${case}"
> +    else
> +        echo "PASS: ${case}"
> +    fi
> +    rm -f $case.output
> +done
> \ No newline at end of file
> diff --git a/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
> b/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
> new file mode 100644
> index 000000000..ac9b8e8ab
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
> @@ -0,0 +1,26 @@
> +DESCRIPTION =3D "Pythonic DBus library"
> +HOMEPAGE =3D "https://pypi.python.org/pypi/pydbus/"
> +LICENSE =3D "LGPL-2.1-only"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da916467b91076e631dd8edb742476=
9c7"
> +
> +SRCREV =3D "f2e6355a88351e7d644ccb2b4d67b19305507312"
> +SRC_URI =3D " \
> +    git://github.com/LEW21/pydbus.git;protocol=3Dhttps;branch=3Dmaster \
> +
> file://0001-make-direction-attribute-conforming-to-introspect.dt.patch \
> +    file://0002-Support-asynchronous-calls-58.patch \
> +
> file://0003-Support-transformation-between-D-Bus-errors-and-exce.patch \
> +    file://run-ptest \
> +"
> +
> +inherit ptest setuptools3
> +
> +S =3D "${WORKDIR}/git"
> +
> +RDEPENDS:${PN} =3D "${PYTHON_PN}-pygobject \
> +                  ${PYTHON_PN}-io \
> +                  ${PYTHON_PN}-logging"
> +
> +do_install_ptest() {
> +        install -d ${D}${PTEST_PATH}/tests
> +        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +}
> \ No newline at end of file
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109522):
> https://lists.openembedded.org/g/openembedded-devel/message/109522
> Mute This Topic: https://lists.openembedded.org/mt/105089440/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000c24ae9061444b651
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 22, 2024 at 10:00=E2=80=
=AFAM Derek Straka &lt;<a href=3D"mailto:derek@asterius.io">derek@asterius.=
io</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">The python3-dbus package was removed in (dac933e).=C2=A0 While the upstre=
am<br>
project isn&#39;t active, other distributions (e.g. Fedora, Debian, etc)<br=
>
continue to offer the package and apply patches to resolve reported issues.=
<br>
<br>
While other packages offer similar functionality (e.g. dasbus), they are no=
t<br>
drop in replacements and the general dbus functionality works out of the bo=
x.<br>
The python package has accomplished it&#39;s goal of providing useful funct=
ionality,<br>
and the proposal is to continue to have it available in meta-python for use=
.<br>
<br>
Signed-off-by: Derek Straka &lt;<a href=3D"mailto:derek@asterius.io" target=
=3D"_blank">derek@asterius.io</a>&gt;<br>
---<br>
=C2=A0.../ptest-packagelists-meta-python.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A01 +<br>
=C2=A0.../packagegroups/<a href=3D"http://packagegroup-meta-python.bb" rel=
=3D"noreferrer" target=3D"_blank">packagegroup-meta-python.bb</a> |=C2=A0 =
=C2=A01 +<br>
=C2=A0...ttribute-conforming-to-introspect.dt.patch |=C2=A0 40 ++<br>
=C2=A0.../0002-Support-asynchronous-calls-58.patch=C2=A0 | 206 ++++++++<br>
=C2=A0...mation-between-D-Bus-errors-and-exce.patch | 495 +++++++++++++++++=
+<br>
=C2=A0.../python/python3-pydbus/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 15 +<br>
=C2=A0.../python/<a href=3D"http://python3-pydbus_0.6.0.bb" rel=3D"noreferr=
er" target=3D"_blank">python3-pydbus_0.6.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 26 +<br>
=C2=A07 files changed, 784 insertions(+)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pydbus=
/0001-make-direction-attribute-conforming-to-introspect.dt.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pydbus=
/0002-Support-asynchronous-calls-58.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pydbus=
/0003-Support-transformation-between-D-Bus-errors-and-exce.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pydbus=
/run-ptest<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-pydbus_0.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-p=
ydbus_0.6.0.bb</a><br>
<br>
diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/=
meta-python/conf/include/ptest-packagelists-meta-python.inc<br>
index 447e0b938..ec26f768e 100644<br>
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc<br>
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc<br>
@@ -53,6 +53,7 @@ PTESTS_FAST_META_PYTHON =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-pytest-mock \<br>
=C2=A0 =C2=A0 =C2=A0python3-pytoml \<br>
=C2=A0 =C2=A0 =C2=A0python3-pyyaml-include \<br>
+=C2=A0 =C2=A0 python3-pydbus \<br>
=C2=A0 =C2=A0 =C2=A0python3-rapidjson \<br>
=C2=A0 =C2=A0 =C2=A0python3-requests-file \<br>
=C2=A0 =C2=A0 =C2=A0python3-requests-toolbelt \<br>
diff --git a/meta-python/recipes-core/packagegroups/<a href=3D"http://packa=
gegroup-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-m=
eta-python.bb</a> b/meta-python/recipes-core/packagegroups/<a href=3D"http:=
//packagegroup-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">package=
group-meta-python.bb</a><br>
index eb5a26463..e0446da28 100644<br>
--- a/meta-python/recipes-core/packagegroups/<a href=3D"http://packagegroup=
-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-pyt=
hon.bb</a><br>
+++ b/meta-python/recipes-core/packagegroups/<a href=3D"http://packagegroup=
-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-pyt=
hon.bb</a><br>
@@ -311,6 +311,7 @@ RDEPENDS:packagegroup-meta-python3 =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-pycodestyle \<br>
=C2=A0 =C2=A0 =C2=A0python3-pyconnman \<br>
=C2=A0 =C2=A0 =C2=A0python3-pycurl \<br>
+=C2=A0 =C2=A0 python3-pydbus \<br>
=C2=A0 =C2=A0 =C2=A0python3-pydicti \<br>
=C2=A0 =C2=A0 =C2=A0python3-pyephem \<br>
=C2=A0 =C2=A0 =C2=A0python3-pyexpect \<br>
diff --git a/meta-python/recipes-devtools/python/python3-pydbus/0001-make-d=
irection-attribute-conforming-to-introspect.dt.patch b/meta-python/recipes-=
devtools/python/python3-pydbus/0001-make-direction-attribute-conforming-to-=
introspect.dt.patch<br>
new file mode 100644<br>
index 000000000..1bd17986e<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/python3-pydbus/0001-make-directio=
n-attribute-conforming-to-introspect.dt.patch<br>
@@ -0,0 +1,40 @@<br>
+From 5fe65a35e0e7106347639f0258206fadb451c439 Mon Sep 17 00:00:00 2001<br>
+From: Hiroaki KAWAI &lt;<a href=3D"mailto:hiroaki.kawai@gmail.com" target=
=3D"_blank">hiroaki.kawai@gmail.com</a>&gt;<br>
+Date: Wed, 1 Feb 2017 18:00:33 +0900<br>
+Subject: [PATCH 1/3] make direction attribute conforming to introspect.dtd=
<br>
+<br>
+direction attribute defaults to &quot;in&quot; as<br>
+in the DTD(*1), direction attribute is defined as following:<br>
+<br>
+```<br>
+&lt;!ATTRLIST arg direction (in|out) &quot;in&quot;&gt;<br>
+```<br>
+<br>
+*1) <a href=3D"http://www.freedesktop.org/standards/dbus/1.0/introspect.dt=
d" rel=3D"noreferrer" target=3D"_blank">http://www.freedesktop.org/standard=
s/dbus/1.0/introspect.dtd</a><br>
+<br>
+Adapted from Fedora [<a href=3D"https://src.fedoraproject.org/cgit/rpms/py=
thon-pydbus.git/" rel=3D"noreferrer" target=3D"_blank">https://src.fedorapr=
oject.org/cgit/rpms/python-pydbus.git/</a>]<br>
+<br>
+Upstream-Status: Inactive-Upstream (Last release 12/18/2016; Last commit 0=
5/6/2018)<br></blockquote><div><br></div><div>For the record, I am ok with =
this recipe coming back, especially since Derek is clearly willing to help =
maintain it.</div><div>If we see some unhandled vulnerabilities come up, we=
 can revisit the decision to drop it.</div><div><br></div><div>I do appreci=
ate Alex&#39;s concerns.</div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
+<br>
+Signed-off-by: Derek Straka &lt;<a href=3D"mailto:derek@asterius.io" targe=
t=3D"_blank">derek@asterius.io</a>&gt;<br>
+---<br>
+ pydbus/proxy_method.py | 4 ++--<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/pydbus/proxy_method.py b/pydbus/proxy_method.py<br>
+index 8798edd..3e6e6ee 100644<br>
+--- a/pydbus/proxy_method.py<br>
++++ b/pydbus/proxy_method.py<br>
+@@ -33,8 +33,8 @@ class ProxyMethod(object):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.__name__ =3D m=
ethod.attrib[&quot;name&quot;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.__qualname__ =
=3D self._iface_name + &quot;.&quot; + self.__name__<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._inargs=C2=A0 =3D [=
(arg.attrib.get(&quot;name&quot;, &quot;&quot;), arg.attrib[&quot;type&quot=
;]) for arg in method if arg.tag =3D=3D &quot;arg&quot; and arg.attrib[&quo=
t;direction&quot;] =3D=3D &quot;in&quot;]<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._outargs =3D [arg.a=
ttrib[&quot;type&quot;] for arg in method if arg.tag =3D=3D &quot;arg&quot;=
 and arg.attrib[&quot;direction&quot;] =3D=3D &quot;out&quot;]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._inargs=C2=A0 =3D [=
(arg.attrib.get(&quot;name&quot;, &quot;&quot;), arg.attrib[&quot;type&quot=
;]) for arg in method if arg.tag =3D=3D &quot;arg&quot; and arg.attrib.get(=
&quot;direction&quot;, &quot;in&quot;) =3D=3D &quot;in&quot;]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._outargs =3D [arg.a=
ttrib[&quot;type&quot;] for arg in method if arg.tag =3D=3D &quot;arg&quot;=
 and arg.attrib.get(&quot;direction&quot;, &quot;in&quot;) =3D=3D &quot;out=
&quot;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._sinargs=C2=A0=
 =3D &quot;(&quot; + &quot;&quot;.join(x[1] for x in self._inargs) + &quot;=
)&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._soutargs =3D =
&quot;(&quot; + &quot;&quot;.join(self._outargs) + &quot;)&quot;<br>
+ <br>
+-- <br>
+2.13.5<br>
diff --git a/meta-python/recipes-devtools/python/python3-pydbus/0002-Suppor=
t-asynchronous-calls-58.patch b/meta-python/recipes-devtools/python/python3=
-pydbus/0002-Support-asynchronous-calls-58.patch<br>
new file mode 100644<br>
index 000000000..b3c57edad<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/python3-pydbus/0002-Support-async=
hronous-calls-58.patch<br>
@@ -0,0 +1,206 @@<br>
+From 31d6dd7893a5e1bb9eb14bfcee861a5b62f64960 Mon Sep 17 00:00:00 2001<br>
+From: Vendula Poncova &lt;<a href=3D"mailto:vponcova@redhat.com" target=3D=
"_blank">vponcova@redhat.com</a>&gt;<br>
+Date: Thu, 27 Jul 2017 18:41:29 +0200<br>
+Subject: [PATCH 2/3] Support asynchronous calls (#58)<br>
+<br>
+Added support for asynchronous calls of methods. A method is called<br>
+synchronously unless its callback parameter is specified. A callback<br>
+is a function f(*args, returned=3DNone, error=3DNone), where args is<br>
+callback_args specified in the method call, returned is a return<br>
+value of the method and error is an exception raised by the method.<br>
+<br>
+Example of an asynchronous call:<br>
+<br>
+def func(x, y, returned=3DNone, error=3DNone):<br>
+=C2=A0 pass<br>
+<br>
+proxy.Method(a, b, callback=3Dfunc, callback_args=3D(x, y))<br>
+<br>
+Adapted from Fedora [<a href=3D"https://src.fedoraproject.org/cgit/rpms/py=
thon-pydbus.git/" rel=3D"noreferrer" target=3D"_blank">https://src.fedorapr=
oject.org/cgit/rpms/python-pydbus.git/</a>]<br>
+<br>
+Upstream-Status: Inactive-Upstream (Last release 12/18/2016; Last commit 0=
5/6/2018)<br>
+<br>
+Signed-off-by: Derek Straka &lt;<a href=3D"mailto:derek@asterius.io" targe=
t=3D"_blank">derek@asterius.io</a>&gt;<br>
+---<br>
+ doc/tutorial.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 ++++++++-<br>
+ pydbus/proxy_method.py | 44 ++++++++++++++++++++++++++++++-----<br>
+ tests/publish_async.py | 63 +++++++++++++++++++++++++++++++++++++++++++++=
+++++<br>
+ tests/run.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
+ 4 files changed, 112 insertions(+), 7 deletions(-)<br>
+ create mode 100644 tests/publish_async.py<br>
+<br>
+diff --git a/doc/tutorial.rst b/doc/tutorial.rst<br>
+index 7474de3..b8479cf 100644<br>
+--- a/doc/tutorial.rst<br>
++++ b/doc/tutorial.rst<br>
+@@ -84,7 +84,8 @@ All objects have methods, properties and signals.<br>
+ Setting up an event loop<br>
+ =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<=
br>
+ <br>
+-To handle signals emitted by exported objects, or to export your own obje=
cts, you need to setup an event loop.<br>
++To handle signals emitted by exported objects, to asynchronously call met=
hods<br>
++or to export your own objects, you need to setup an event loop.<br>
+ <br>
+ The only main loop supported by ``pydbus`` is GLib.MainLoop.<br>
+ <br>
+@@ -156,6 +157,14 @@ To call a method::<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0dev.Disconnect()<br>
+ <br>
++To asynchronously call a method::<br>
++<br>
++=C2=A0 =C2=A0 def print_result(returned=3DNone, error=3DNone):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 print(returned, error)<br>
++<br>
++=C2=A0 =C2=A0 dev.GetAppliedConnection(0, callback=3Dprint_result)<br>
++=C2=A0 =C2=A0 loop.run()<br>
++<br>
+ To read a property::<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0print(dev.Autoconnect)<br>
+diff --git a/pydbus/proxy_method.py b/pydbus/proxy_method.py<br>
+index 3e6e6ee..442fe07 100644<br>
+--- a/pydbus/proxy_method.py<br>
++++ b/pydbus/proxy_method.py<br>
+@@ -65,15 +65,34 @@ class ProxyMethod(object):<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Python 2 sux<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for kwarg in kwargs=
:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if kwarg not in (&quot;timeout&quot;,):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if kwarg not in (&quot;timeout&quot;, &quot;callback&quot;, &quot;callb=
ack_args&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise TypeError(self.__qualname__ + &=
quot; got an unexpected keyword argument &#39;{}&#39;&quot;.format(kwarg))<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timeout =3D kwargs.=
get(&quot;timeout&quot;, None)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 callback =3D kwargs.get(=
&quot;callback&quot;, None)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 callback_args =3D kwargs=
.get(&quot;callback_args&quot;, tuple())<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 call_args =3D (<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 instance._bus_name,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 instance._path,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 self._iface_name,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 self.__name__,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 GLib.Variant(self._sinargs, args),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 GLib.VariantType.new(self._soutargs),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 timeout_to_glib(timeout),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 None<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if callback:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 call_args +=3D (self._finish_async_call, (callback, callback_args))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 instance._bus.con.call(*call_args)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return None<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ret =3D instance._bus.con.call_sync(*call_args)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return self._unpack_return(ret)<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D instance._bus.co=
n.call_sync(<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 instance._bus_name, instance._path,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 self._iface_name, self.__name__, GLib.Variant(self._sinargs, args), GLi=
b.VariantType.new(self._soutargs),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0, timeout_to_glib(timeout), None).unpack()<br>
+-<br>
++=C2=A0 =C2=A0 =C2=A0 def _unpack_return(self, values):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D values.unpack()<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if len(self._outarg=
s) =3D=3D 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif len(self._outa=
rgs) =3D=3D 1:<br>
+@@ -81,6 +100,19 @@ class ProxyMethod(object):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return ret<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 def _finish_async_call(self, source, result, user_da=
ta):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error =3D None<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return_args =3D None<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ret =3D source.call_finish(result)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return_args =3D self._unpack_return(ret)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except Exception as err:=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 error =3D err<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 callback, callback_args =
=3D user_data<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 callback(*callback_args,=
 returned=3Dreturn_args, error=3Derror)<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0def __get__(self, instance, owner):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if instance is None=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return self<br>
+diff --git a/tests/publish_async.py b/tests/publish_async.py<br>
+new file mode 100644<br>
+index 0000000..3f79b62<br>
+--- /dev/null<br>
++++ b/tests/publish_async.py<br>
+@@ -0,0 +1,63 @@<br>
++from pydbus import SessionBus<br>
++from gi.repository import GLib<br>
++from threading import Thread<br>
++import sys<br>
++<br>
++done =3D 0<br>
++loop =3D GLib.MainLoop()<br>
++<br>
++class TestObject(object):<br>
++=C2=A0 =C2=A0 =C2=A0 &#39;&#39;&#39;<br>
++&lt;node&gt;<br>
++=C2=A0 =C2=A0 =C2=A0 &lt;interface name=3D&#39;net.lew21.pydbus.tests.pub=
lish_async&#39;&gt;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;method name=3D&#39;H=
elloWorld&#39;&gt;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &lt;arg type=3D&#39;i&#39; name=3D&#39;x&#39; direction=3D&#39;in&#39;/=
&gt;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &lt;arg type=3D&#39;s&#39; name=3D&#39;response&#39; direction=3D&#39;o=
ut&#39;/&gt;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/method&gt;<br>
++=C2=A0 =C2=A0 =C2=A0 &lt;/interface&gt;<br>
++&lt;/node&gt;<br>
++=C2=A0 =C2=A0 =C2=A0 &#39;&#39;&#39;<br>
++=C2=A0 =C2=A0 =C2=A0 def __init__(self, id):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://self.i=
d" rel=3D"noreferrer" target=3D"_blank">self.id</a> =3D id<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 def HelloWorld(self, x):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D <a href=3D"http:=
//self.id" rel=3D"noreferrer" target=3D"_blank">self.id</a> + &quot;: &quot=
; + str(x)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(res)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return res<br>
++<br>
++bus =3D SessionBus()<br>
++<br>
++with bus.publish(&quot;net.lew21.pydbus.tests.publish_async&quot;, TestOb=
ject(&quot;Obj&quot;)):<br>
++=C2=A0 =C2=A0 =C2=A0 remote =3D bus.get(&quot;net.lew21.pydbus.tests.publ=
ish_async&quot;)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 def callback(x, returned=3DNone, error=3DNone):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&quot;asyn: &quot;=
 + returned)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert (returned is not =
None)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(error is None)<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(x =3D=3D int(retu=
rned.split()[1]))<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 global done<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done +=3D 1<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if done =3D=3D 3:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 loop.quit()<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 def t1_func():<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remote.HelloWorld(1, cal=
lback=3Dcallback, callback_args=3D(1,))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remote.HelloWorld(2, cal=
lback=3Dcallback, callback_args=3D(2,))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&quot;sync: &quot;=
 + remote.HelloWorld(3))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remote.HelloWorld(4, cal=
lback=3Dcallback, callback_args=3D(4,))<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 t1 =3D Thread(None, t1_func)<br>
++=C2=A0 =C2=A0 =C2=A0 t1.daemon =3D True<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 def handle_timeout():<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&quot;ERROR: Timeo=
ut.&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.exit(1)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 GLib.timeout_add_seconds(2, handle_timeout)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 t1.start()<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 loop.run()<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 t1.join()<br>
+diff --git a/tests/run.sh b/tests/run.sh<br>
+index 8d93644..271c58a 100755<br>
+--- a/tests/run.sh<br>
++++ b/tests/run.sh<br>
+@@ -15,4 +15,5 @@ then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;$PYTHON&quot; $TESTS_DIR/publish.py<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;$PYTHON&quot; $TESTS_DIR/publish_properti=
es.py<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;$PYTHON&quot; $TESTS_DIR/publish_multifac=
e.py<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;$PYTHON&quot; $TESTS_DIR/publish_async.py<br>
+ fi<br>
+-- <br>
+2.13.5<br>
diff --git a/meta-python/recipes-devtools/python/python3-pydbus/0003-Suppor=
t-transformation-between-D-Bus-errors-and-exce.patch b/meta-python/recipes-=
devtools/python/python3-pydbus/0003-Support-transformation-between-D-Bus-er=
rors-and-exce.patch<br>
new file mode 100644<br>
index 000000000..a1b8a6c38<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/python3-pydbus/0003-Support-trans=
formation-between-D-Bus-errors-and-exce.patch<br>
@@ -0,0 +1,495 @@<br>
+From 773858e1afd21cdf3ceef2cd35509f0b4882bf16 Mon Sep 17 00:00:00 2001<br>
+From: Vendula Poncova &lt;<a href=3D"mailto:vponcova@redhat.com" target=3D=
"_blank">vponcova@redhat.com</a>&gt;<br>
+Date: Tue, 1 Aug 2017 16:54:24 +0200<br>
+Subject: [PATCH 3/3] Support transformation between D-Bus errors and<br>
+ exceptions.<br>
+<br>
+Exceptions can be registered with decorators, raised in a remote<br>
+method and recreated after return from the remote call.<br>
+<br>
+Adapted from Fedora [<a href=3D"https://src.fedoraproject.org/cgit/rpms/py=
thon-pydbus.git/" rel=3D"noreferrer" target=3D"_blank">https://src.fedorapr=
oject.org/cgit/rpms/python-pydbus.git/</a>]<br>
+<br>
+Upstream-Status: Inactive-Upstream (Last release 12/18/2016; Last commit 0=
5/6/2018)<br>
+<br>
+Signed-off-by: Derek Straka &lt;<a href=3D"mailto:derek@asterius.io" targe=
t=3D"_blank">derek@asterius.io</a>&gt;<br>
+---<br>
+ doc/tutorial.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 47 ++++++++++++++++++<=
br>
+ pydbus/error.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 97 +++++++++++++++++++=
+++++++++++++++++<br>
+ pydbus/proxy_method.py |=C2=A0 18 +++++--<br>
+ pydbus/registration.py |=C2=A0 16 ++++--<br>
+ tests/error.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 67 ++++++++++++++=
+++++++++++<br>
+ tests/publish_error.py | 132 ++++++++++++++++++++++++++++++++++++++++++++=
+++++<br>
+ tests/run.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br=
>
+ 7 files changed, 371 insertions(+), 8 deletions(-)<br>
+ create mode 100644 pydbus/error.py<br>
+ create mode 100644 tests/error.py<br>
+ create mode 100644 tests/publish_error.py<br>
+<br>
+diff --git a/doc/tutorial.rst b/doc/tutorial.rst<br>
+index b8479cf..7fe55e1 100644<br>
+--- a/doc/tutorial.rst<br>
++++ b/doc/tutorial.rst<br>
+@@ -341,6 +341,53 @@ See ``help(bus.request_name)`` and ``help(bus.registe=
r_object)`` for details.<br>
+ <br>
+ .. --------------------------------------------------------------------<b=
r>
+ <br>
++Error handling<br>
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
++<br>
++You can map D-Bus errors to your exception classes for better error handl=
ing.<br>
++To handle D-Bus errors, use the ``@map_error`` decorator::<br>
++<br>
++=C2=A0 =C2=A0 from pydbus.error import map_error<br>
++<br>
++=C2=A0 =C2=A0 @map_error(&quot;org.freedesktop.DBus.Error.InvalidArgs&quo=
t;)<br>
++=C2=A0 =C2=A0 class InvalidArgsException(Exception):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
++<br>
++=C2=A0 =C2=A0 try:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ...<br>
++=C2=A0 =C2=A0 catch InvalidArgsException as e:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 print(e)<br>
++<br>
++To register new D-Bus errors, use the ``@register_error`` decorator::<br>
++<br>
++=C2=A0 =C2=A0 from pydbus.error import register_error<br>
++<br>
++=C2=A0 =C2=A0 @map_error(&quot;net.lew21.pydbus.TutorialExample.MyError&q=
uot;, MY_DOMAIN, MY_EXCEPTION_CODE)<br>
++=C2=A0 =C2=A0 class MyException(Exception):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
++<br>
++Then you can raise ``MyException`` from the D-Bus method of the remote ob=
ject::<br>
++<br>
++=C2=A0 =C2=A0 def Method():<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise MyException(&quot;Message&quot;)<br>
++<br>
++And catch the same exception on the client side::<br>
++<br>
++=C2=A0 =C2=A0 try:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 proxy.Method()<br>
++=C2=A0 =C2=A0 catch MyException as e:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 print(e)<br>
++<br>
++To handle all unknown D-Bus errors, use the ``@map_by_default`` decorator=
 to specify the default exception::<br>
++<br>
++=C2=A0 =C2=A0 from pydbus.error import map_by_default<br>
++<br>
++=C2=A0 =C2=A0 @map_by_default<br>
++=C2=A0 =C2=A0 class DefaultException(Exception):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
++<br>
++.. --------------------------------------------------------------------<b=
r>
++<br>
+ Data types<br>
+ =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+ <br>
+diff --git a/pydbus/error.py b/pydbus/error.py<br>
+new file mode 100644<br>
+index 0000000..aaa3510<br>
+--- /dev/null<br>
++++ b/pydbus/error.py<br>
+@@ -0,0 +1,97 @@<br>
++from gi.repository import GLib, Gio<br>
++<br>
++<br>
++def register_error(name, domain, code):<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Register and map decorated excepti=
on class to a DBus error.&quot;&quot;&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 def decorated(cls):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_registration.regis=
ter_error(cls, name, domain, code)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return cls<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 return decorated<br>
++<br>
++<br>
++def map_error(error_name):<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Map decorated exception class to a=
 DBus error.&quot;&quot;&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 def decorated(cls):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_registration.map_e=
rror(cls, error_name)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return cls<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 return decorated<br>
++<br>
++<br>
++def map_by_default(cls):<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Map decorated exception class to a=
ll unknown DBus errors.&quot;&quot;&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 error_registration.map_by_default(cls)<br>
++=C2=A0 =C2=A0 =C2=A0 return cls<br>
++<br>
++<br>
++class ErrorRegistration(object):<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Class for mapping exceptions to DB=
us errors.&quot;&quot;&quot;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 _default =3D None<br>
++=C2=A0 =C2=A0 =C2=A0 _map =3D dict()<br>
++=C2=A0 =C2=A0 =C2=A0 _reversed_map =3D dict()<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 def map_by_default(self, exception_cls):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Set th=
e exception class as a default.&quot;&quot;&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._default =3D except=
ion_cls<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 def map_error(self, exception_cls, name):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Map th=
e exception class to a DBus name.&quot;&quot;&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._map[name] =3D exce=
ption_cls<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._reversed_map[excep=
tion_cls] =3D name<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 def register_error(self, exception_cls, name, domain=
, code):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Map an=
d register the exception class to a DBus name.&quot;&quot;&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.map_error(exception=
_cls, name)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return Gio.DBusError.reg=
ister_error(domain, code, name)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 def is_registered_exception(self, obj):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Is the=
 exception registered?&quot;&quot;&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return obj.__class__ in =
self._reversed_map<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 def get_dbus_name(self, obj):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Get th=
e DBus name of the exception.&quot;&quot;&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return self._reversed_ma=
p.get(obj.__class__)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 def get_exception_class(self, name):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Get th=
e exception class mapped to the DBus name.&quot;&quot;&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return self._map.get(nam=
e, self._default)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 def transform_message(self, name, message):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Transf=
orm the message of the exception.&quot;&quot;&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prefix =3D &quot;{}:{}: =
&quot;.format(&quot;GDBus.Error&quot;, name)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if message.startswith(pr=
efix):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return message[len(prefix):]<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return message<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 def transform_exception(self, e):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Transf=
orm the remote error to the exception.&quot;&quot;&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not isinstance(e, GLi=
b.Error):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return e<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not Gio.DBusError.is_=
remote_error(e):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return e<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Get DBus name of the e=
rror.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D Gio.DBusError.g=
et_remote_error(e)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Get the exception clas=
s.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exception_cls =3D self.g=
et_exception_class(name)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Return the original ex=
ception.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not exception_cls:<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return e<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Return new exception.<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 message =3D self.transfo=
rm_message(name, e.message)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exception =3D exception_=
cls(message)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exception.dbus_name =3D =
name<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exception.dbus_domain =
=3D e.domain<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exception.dbus_code =3D =
e.code<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return exception<br>
++<br>
++<br>
++# Default error registration.<br>
++error_registration =3D ErrorRegistration()<br>
+diff --git a/pydbus/proxy_method.py b/pydbus/proxy_method.py<br>
+index 442fe07..a73f9eb 100644<br>
+--- a/pydbus/proxy_method.py<br>
++++ b/pydbus/proxy_method.py<br>
+@@ -2,6 +2,7 @@ from gi.repository import GLib<br>
+ from .generic import bound_method<br>
+ from .identifier import filter_identifier<br>
+ from .timeout import timeout_to_glib<br>
++from .error import error_registration<br>
+ <br>
+ try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0from inspect import Signature, Parameter<br>
+@@ -87,9 +88,20 @@ class ProxyMethod(object):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0call_args +=3D (self._finish_async_call, (callback, callback_args=
))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0instance._bus.con.call(*call_args)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return None<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ret =3D instance._bus.con.call_sync(*call_args)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return self._unpack_return(ret)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 result =3D None<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 error =3D None<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 try:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D instance._bus.con.call_sync(*cal=
l_args)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 except Exception as e:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error =3D error_registration.transform_exce=
ption(e)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if error:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise error<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return self._unpack_return(result)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0def _unpack_return(self, values):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D values.unpa=
ck()<br>
+@@ -108,7 +120,7 @@ class ProxyMethod(object):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret =3D source.call_finish(result)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return_args =3D self._unpack_return(ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except Exception as=
 err:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 error =3D err<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 error =3D error_registration.transform_exception(err)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0callback, callback_=
args =3D user_data<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0callback(*callback_=
args, returned=3Dreturn_args, error=3Derror)<br>
+diff --git a/pydbus/registration.py b/pydbus/registration.py<br>
+index f531539..1d2cbcb 100644<br>
+--- a/pydbus/registration.py<br>
++++ b/pydbus/registration.py<br>
+@@ -5,6 +5,7 @@ from . import generic<br>
+ from .exitable import ExitableWithAliases<br>
+ from functools import partial<br>
+ from .method_call_context import MethodCallContext<br>
++from .error import error_registration<br>
+ import logging<br>
+ <br>
+ try:<br>
+@@ -91,11 +92,16 @@ class ObjectWrapper(ExitableWithAliases(&quot;unwrap&q=
uot;)):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0logger =3D logging.getLogger(__name__)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0logger.exception(&quot;Exception while handling %s.%s()&quot;, in=
terface_name, method_name)<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 #TODO Think of a better way to translate Python exception types to DBus=
 error types.<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 e_type =3D type(e).__name__<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if not &quot;.&quot; in e_type:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e_type =3D &quot;unknown.&quot; + e_type<br=
>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 invocation.return_dbus_error(e_type, str(e))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if error_registration.is_registered_exception(e):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D error_registration.get_dbus_name(e=
)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 invocation.return_dbus_error(name, str(e))<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 else:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logger.info" rel=3D"noref=
errer" target=3D"_blank">logger.info</a>(&quot;name is not registered&quot;=
)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e_type =3D type(e).__name__<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not &quot;.&quot; in e_type:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e_type =3D &quo=
t;unknown.&quot; + e_type<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 invocation.return_dbus_error(e_type, str(e)=
)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0def Get(self, interface_name, property_name):<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0type =3D self.reada=
ble_properties[interface_name + &quot;.&quot; + property_name]<br>
+diff --git a/tests/error.py b/tests/error.py<br>
+new file mode 100644<br>
+index 0000000..3ec507d<br>
+--- /dev/null<br>
++++ b/tests/error.py<br>
+@@ -0,0 +1,67 @@<br>
++from pydbus.error import ErrorRegistration<br>
++<br>
++<br>
++class ExceptionA(Exception):<br>
++=C2=A0 =C2=A0 =C2=A0 pass<br>
++<br>
++<br>
++class ExceptionB(Exception):<br>
++=C2=A0 =C2=A0 =C2=A0 pass<br>
++<br>
++<br>
++class ExceptionC(Exception):<br>
++=C2=A0 =C2=A0 =C2=A0 pass<br>
++<br>
++<br>
++class ExceptionD(Exception):<br>
++=C2=A0 =C2=A0 =C2=A0 pass<br>
++<br>
++<br>
++class ExceptionE(Exception):<br>
++=C2=A0 =C2=A0 =C2=A0 pass<br>
++<br>
++<br>
++def test_error_mapping():<br>
++=C2=A0 =C2=A0 =C2=A0 r =3D ErrorRegistration()<br>
++=C2=A0 =C2=A0 =C2=A0 r.map_error(ExceptionA, &quot;net.lew21.pydbus.tests=
.ErrorA&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 r.map_error(ExceptionB, &quot;net.lew21.pydbus.tests=
.ErrorB&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 r.map_error(ExceptionC, &quot;net.lew21.pydbus.tests=
.ErrorC&quot;)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 assert r.is_registered_exception(ExceptionA(&quot;Te=
st&quot;))<br>
++=C2=A0 =C2=A0 =C2=A0 assert r.is_registered_exception(ExceptionB(&quot;Te=
st&quot;))<br>
++=C2=A0 =C2=A0 =C2=A0 assert r.is_registered_exception(ExceptionC(&quot;Te=
st&quot;))<br>
++=C2=A0 =C2=A0 =C2=A0 assert not r.is_registered_exception(ExceptionD(&quo=
t;Test&quot;))<br>
++=C2=A0 =C2=A0 =C2=A0 assert not r.is_registered_exception(ExceptionE(&quo=
t;Test&quot;))<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 assert r.get_dbus_name(ExceptionA(&quot;Test&quot;))=
 =3D=3D &quot;net.lew21.pydbus.tests.ErrorA&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 assert r.get_dbus_name(ExceptionB(&quot;Test&quot;))=
 =3D=3D &quot;net.lew21.pydbus.tests.ErrorB&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 assert r.get_dbus_name(ExceptionC(&quot;Test&quot;))=
 =3D=3D &quot;net.lew21.pydbus.tests.ErrorC&quot;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 assert r.get_exception_class(&quot;net.lew21.pydbus.=
tests.ErrorA&quot;) =3D=3D ExceptionA<br>
++=C2=A0 =C2=A0 =C2=A0 assert r.get_exception_class(&quot;net.lew21.pydbus.=
tests.ErrorB&quot;) =3D=3D ExceptionB<br>
++=C2=A0 =C2=A0 =C2=A0 assert r.get_exception_class(&quot;net.lew21.pydbus.=
tests.ErrorC&quot;) =3D=3D ExceptionC<br>
++=C2=A0 =C2=A0 =C2=A0 assert r.get_exception_class(&quot;net.lew21.pydbus.=
tests.ErrorD&quot;) is None<br>
++=C2=A0 =C2=A0 =C2=A0 assert r.get_exception_class(&quot;net.lew21.pydbus.=
tests.ErrorE&quot;) is None<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 r.map_by_default(ExceptionD)<br>
++=C2=A0 =C2=A0 =C2=A0 assert not r.is_registered_exception(ExceptionD(&quo=
t;Test&quot;))<br>
++=C2=A0 =C2=A0 =C2=A0 assert r.get_exception_class(&quot;net.lew21.pydbus.=
tests.ErrorD&quot;) =3D=3D ExceptionD<br>
++=C2=A0 =C2=A0 =C2=A0 assert r.get_exception_class(&quot;net.lew21.pydbus.=
tests.ErrorE&quot;) =3D=3D ExceptionD<br>
++<br>
++<br>
++def test_transform_message():<br>
++=C2=A0 =C2=A0 =C2=A0 r =3D ErrorRegistration()<br>
++=C2=A0 =C2=A0 =C2=A0 n1 =3D &quot;net.lew21.pydbus.tests.ErrorA&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 m1 =3D &quot;GDBus.Error:net.lew21.pydbus.tests.Erro=
rA: Message1&quot;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 n2 =3D &quot;net.lew21.pydbus.tests.ErrorB&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 m2 =3D &quot;GDBus.Error:net.lew21.pydbus.tests.Erro=
rB: Message2&quot;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 assert r.transform_message(n1, m1) =3D=3D &quot;Mess=
age1&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 assert r.transform_message(n2, m2) =3D=3D &quot;Mess=
age2&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 assert r.transform_message(n1, m2) =3D=3D m2<br>
++=C2=A0 =C2=A0 =C2=A0 assert r.transform_message(n2, m1) =3D=3D m1<br>
++<br>
++<br>
++test_error_mapping()<br>
++test_transform_message()<br>
+diff --git a/tests/publish_error.py b/tests/publish_error.py<br>
+new file mode 100644<br>
+index 0000000..aa8a18a<br>
+--- /dev/null<br>
++++ b/tests/publish_error.py<br>
+@@ -0,0 +1,132 @@<br>
++import sys<br>
++from threading import Thread<br>
++from gi.repository import GLib, Gio<br>
++from pydbus import SessionBus<br>
++from pydbus.error import register_error, map_error, map_by_default, error=
_registration<br>
++<br>
++import logging<br>
++logger =3D logging.getLogger(&#39;pydbus.registration&#39;)<br>
++logger.disabled =3D True<br>
++<br>
++loop =3D GLib.MainLoop()<br>
++DOMAIN =3D Gio.DBusError.quark()=C2=A0 # TODO: Register new domain.<br>
++<br>
++<br>
++@register_error(&quot;net.lew21.pydbus.tests.ErrorA&quot;, DOMAIN, 1000)<=
br>
++class ExceptionA(Exception):<br>
++=C2=A0 =C2=A0 =C2=A0 pass<br>
++<br>
++<br>
++@register_error(&quot;net.lew21.pydbus.tests.ErrorB&quot;, DOMAIN, 2000)<=
br>
++class ExceptionB(Exception):<br>
++=C2=A0 =C2=A0 =C2=A0 pass<br>
++<br>
++<br>
++@map_error(&quot;org.freedesktop.DBus.Error.InvalidArgs&quot;)<br>
++class ExceptionC(Exception):<br>
++=C2=A0 =C2=A0 =C2=A0 pass<br>
++<br>
++<br>
++@map_by_default<br>
++class ExceptionD(Exception):<br>
++=C2=A0 =C2=A0 =C2=A0 pass<br>
++<br>
++<br>
++class ExceptionE(Exception):<br>
++=C2=A0 =C2=A0 =C2=A0 pass<br>
++<br>
++<br>
++class TestObject(object):<br>
++=C2=A0 =C2=A0 =C2=A0 &#39;&#39;&#39;<br>
++&lt;node&gt;<br>
++=C2=A0 =C2=A0 =C2=A0 &lt;interface name=3D&#39;net.lew21.pydbus.tests.Tes=
tInterface&#39;&gt;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;method name=3D&#39;R=
aiseA&#39;&gt;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &lt;arg type=3D&#39;s&#39; name=3D&#39;msg&#39; direction=3D&#39;in&#39=
;/&gt;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/method&gt;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;method name=3D&#39;R=
aiseB&#39;&gt;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &lt;arg type=3D&#39;s&#39; name=3D&#39;msg&#39; direction=3D&#39;in&#39=
;/&gt;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/method&gt;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;method name=3D&#39;R=
aiseD&#39;&gt;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &lt;arg type=3D&#39;s&#39; name=3D&#39;msg&#39; direction=3D&#39;in&#39=
;/&gt;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/method&gt;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;method name=3D&#39;R=
aiseE&#39;&gt;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &lt;arg type=3D&#39;s&#39; name=3D&#39;msg&#39; direction=3D&#39;in&#39=
;/&gt;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/method&gt;<br>
++=C2=A0 =C2=A0 =C2=A0 &lt;/interface&gt;<br>
++&lt;/node&gt;<br>
++=C2=A0 =C2=A0 =C2=A0 &#39;&#39;&#39;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 def RaiseA(self, msg):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise ExceptionA(msg)<br=
>
++<br>
++=C2=A0 =C2=A0 =C2=A0 def RaiseB(self, msg):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise ExceptionB(msg)<br=
>
++<br>
++=C2=A0 =C2=A0 =C2=A0 def RaiseD(self, msg):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise ExceptionD(msg)<br=
>
++<br>
++=C2=A0 =C2=A0 =C2=A0 def RaiseE(self, msg):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise ExceptionE(msg)<br=
>
++<br>
++bus =3D SessionBus()<br>
++<br>
++with bus.publish(&quot;net.lew21.pydbus.tests.Test&quot;, TestObject()):<=
br>
++=C2=A0 =C2=A0 =C2=A0 remote =3D bus.get(&quot;net.lew21.pydbus.tests.Test=
&quot;)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 def t_func():<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Test new registered er=
rors.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 remote.RaiseA(&quot;Test A&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except ExceptionA as e:<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 assert str(e) =3D=3D &quot;Test A&quot;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 remote.RaiseB(&quot;Test B&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except ExceptionB as e:<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 assert str(e) =3D=3D &quot;Test B&quot;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Test mapped errors.<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 remote.Get(&quot;net.lew21.pydbus.tests.TestInterface&quot;, &quot;Foo&=
quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except ExceptionC as e:<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 assert str(e) =3D=3D &quot;No such property &#39;Foo&#39;&quot;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Test default errors.<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 remote.RaiseD(&quot;Test D&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except ExceptionD as e:<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 assert str(e) =3D=3D &quot;Test D&quot;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 remote.RaiseE(&quot;Test E&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except ExceptionD as e:<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 assert str(e) =3D=3D &quot;Test E&quot;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Test with no default e=
rrors.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_registration.map_b=
y_default(None)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 remote.RaiseD(&quot;Test D&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except Exception as e:<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 assert not isinstance(e, ExceptionD)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 remote.RaiseE(&quot;Test E&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except Exception as e:<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 assert not isinstance(e, ExceptionD)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 assert not isinstance(e, ExceptionE)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 loop.quit()<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 t =3D Thread(None, t_func)<br>
++=C2=A0 =C2=A0 =C2=A0 t.daemon =3D True<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 def handle_timeout():<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&quot;ERROR: Timeo=
ut.&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.exit(1)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 GLib.timeout_add_seconds(4, handle_timeout)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 t.start()<br>
++=C2=A0 =C2=A0 =C2=A0 loop.run()<br>
++=C2=A0 =C2=A0 =C2=A0 t.join()<br>
+diff --git a/tests/run.sh b/tests/run.sh<br>
+index 271c58a..a08baf8 100755<br>
+--- a/tests/run.sh<br>
++++ b/tests/run.sh<br>
+@@ -10,10 +10,11 @@ PYTHON=3D${1:-python}<br>
+ <br>
+ &quot;$PYTHON&quot; $TESTS_DIR/context.py<br>
+ &quot;$PYTHON&quot; $TESTS_DIR/identifier.py<br>
++&quot;$PYTHON&quot; $TESTS_DIR/error.py<br>
+ if [ &quot;$2&quot; !=3D &quot;dontpublish&quot; ]<br>
+ then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;$PYTHON&quot; $TESTS_DIR/publish.py<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;$PYTHON&quot; $TESTS_DIR/publish_properti=
es.py<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;$PYTHON&quot; $TESTS_DIR/publish_multifac=
e.py<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;$PYTHON&quot; $TESTS_DIR/publish_async.py=
<br>
+ fi<br>
+-- <br>
+2.13.5<br>
diff --git a/meta-python/recipes-devtools/python/python3-pydbus/run-ptest b=
/meta-python/recipes-devtools/python/python3-pydbus/run-ptest<br>
new file mode 100644<br>
index 000000000..782ceed3b<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/python3-pydbus/run-ptest<br>
@@ -0,0 +1,15 @@<br>
+#!/bin/sh<br>
+<br>
+for case in `find tests -type f -name &#39;*.sh&#39;`; do<br>
+=C2=A0 =C2=A0 bash $case python3 &gt;$case.output 2&gt;&amp;1<br>
+=C2=A0 =C2=A0 ret=3D$?<br>
+=C2=A0 =C2=A0 if [ $ret -ne 0 ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cat $case.output<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;FAIL: ${case}&quot;<br>
+=C2=A0 =C2=A0 elif grep -i &#39;SKIP&#39; $case.output; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;SKIP: ${case}&quot;<br>
+=C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;PASS: ${case}&quot;<br>
+=C2=A0 =C2=A0 fi<br>
+=C2=A0 =C2=A0 rm -f $case.output<br>
+done<br>
\ No newline at end of file<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pydbus_0.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydbus_0.6.0.=
bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pydb=
us_0.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydbus_0.6.0.bb</=
a><br>
new file mode 100644<br>
index 000000000..ac9b8e8ab<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pydbus_=
0.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydbus_0.6.0.bb</a><=
br>
@@ -0,0 +1,26 @@<br>
+DESCRIPTION =3D &quot;Pythonic DBus library&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://pypi.python.org/pypi/pydbus/" rel=3D=
"noreferrer" target=3D"_blank">https://pypi.python.org/pypi/pydbus/</a>&quo=
t;<br>
+LICENSE =3D &quot;LGPL-2.1-only&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Da916467b91076e631dd8edb742=
4769c7&quot;<br>
+<br>
+SRCREV =3D &quot;f2e6355a88351e7d644ccb2b4d67b19305507312&quot;<br>
+SRC_URI =3D &quot; \<br>
+=C2=A0 =C2=A0 git://<a href=3D"http://github.com/LEW21/pydbus.git;protocol=
=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">github.com/L=
EW21/pydbus.git;protocol=3Dhttps;branch=3Dmaster</a> \<br>
+=C2=A0 =C2=A0 file://0001-make-direction-attribute-conforming-to-introspec=
t.dt.patch \<br>
+=C2=A0 =C2=A0 file://0002-Support-asynchronous-calls-58.patch \<br>
+=C2=A0 =C2=A0 file://0003-Support-transformation-between-D-Bus-errors-and-=
exce.patch \<br>
+=C2=A0 =C2=A0 file://run-ptest \<br>
+&quot;<br>
+<br>
+inherit ptest setuptools3<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+RDEPENDS:${PN} =3D &quot;${PYTHON_PN}-pygobject \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN=
}-io \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN=
}-logging&quot;<br>
+<br>
+do_install_ptest() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/tests<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/<b=
r>
+}<br>
\ No newline at end of file<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#109522): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/109522" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/109522</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105089440/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/105089440/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000c24ae9061444b651--

