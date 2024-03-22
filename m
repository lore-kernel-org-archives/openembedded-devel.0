Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B44CC47DD9
	for <webhook@archiver.kernel.org>; Fri, 22 Mar 2024 07:25:29 +0000 (UTC)
Received: from so254-41.mailgun.net (so254-41.mailgun.net [198.61.254.41])
 by mx.groups.io with SMTP id smtpd.web10.7140.1711092319307246849
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Mar 2024 00:25:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@asterius.io header.s=mailo header.b=k2cyAE+s;
 spf=pass (domain: asterius.io, ip: 198.61.254.41, mailfrom: bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt; s=mailo; t=1711092318; x=1711099518;
 h=Content-Type: Cc: To: To: Subject: Subject: Message-ID: Date: From: From: In-Reply-To: References: MIME-Version: Sender: Sender;
 bh=IdgbSGEIy3wgqA8E+gc4oEJMqV8I9jHLLCGDRqPWYLk=;
 b=k2cyAE+sFZ3cSFTdOPCSSu4cxJxd1GeyQabj9lP3OeGzWGGcPjjJHAqsdZfFo2bULTqjSFOZyIFqI3aTmh7aove//hSxYflUVXuuPuiVV/u0S/WbRRSRpA6iRHYn066ZA6IrNW+YmC91iapL2Whh7Bx6BpuqWGRVm78X5Tc2EQI=
X-Mailgun-Sending-Ip: 198.61.254.41
X-Mailgun-Sid: WyIzN2NkMyIsIm9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIiwiM2E1Njg1Il0=
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46]) by
 6980d5785bf2 with SMTP id 65fd325ef4c3d187fb2d40b7 (version=TLS1.3,
 cipher=TLS_AES_128_GCM_SHA256); Fri, 22 Mar 2024 07:25:18 GMT
Sender: derek@asterius.io
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a46f0da1b4fso232448066b.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Mar 2024 00:25:18 -0700 (PDT)
X-Gm-Message-State: AOJu0YwI7OENwc1DNljZ0kYfzx2TtLacEd3iSwaNTbxSak4HdHHXpNBE
	LiSzq9fihbMQDDAobjS4Wnf3ojP7j8npUKXQ85YxpayuxVH81QZ8hcQfM9bQzWUmUVRse1zziRr
	t4PgmEjwCEV+wVNkugs99bj66Ueg=
X-Google-Smtp-Source: AGHT+IE4UuOTeUiGznBCoF9j2SP++xLHBGWX1e/h++rWvYmZcCEEvwbd/hkqCWJs+ilqUA6suoNDXqIcycSmFSiAC/I=
X-Received: by 2002:a17:907:7ba2:b0:a43:ab98:d376 with SMTP id
 ne34-20020a1709077ba200b00a43ab98d376mr1339596ejc.15.1711092317190; Fri, 22
 Mar 2024 00:25:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240321221812.2714481-1-derek@asterius.io> <CANNYZj92=q7jzJwy9oRq50pzzj90NBkmcF8WxHPVnHfYF1pe3A@mail.gmail.com>
In-Reply-To: <CANNYZj92=q7jzJwy9oRq50pzzj90NBkmcF8WxHPVnHfYF1pe3A@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Fri, 22 Mar 2024 02:25:06 -0500
X-Gmail-Original-Message-ID: <CADNbA1qEbJFpg6xmncZEwKPQrj5toPEPMFmOe7NxtUDHmm+SJA@mail.gmail.com>
Message-ID: <CADNbA1qEbJFpg6xmncZEwKPQrj5toPEPMFmOe7NxtUDHmm+SJA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-dbus: re-add recipe with latest
 patches and add ptest
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000be8b3a06143ab945"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Mar 2024 07:25:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109512

--000000000000be8b3a06143ab945
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Thanks for your reply.  I didn't know Inactive-Upstream was part of the
enum.  I'll update and send a v2 in the morning.

I hear the concerns about adding packages that aren't actively maintained.
I also agree with the sentiment you raise regarding the broader context of
downstream consumers, etc.   Ultimately, it's a package that matters to my
use cases, and I'm going to request we allow the patchset.  I'll accept
responsibility for the additional maintenance burdens, etc.  To mitigate
future issues, I'll push the consumers I can influence to move to a
maintained before the next release.

-Derek


On Fri, Mar 22, 2024, 12:39=E2=80=AFAM Alexander Kanavin <alex.kanavin@gmai=
l.com>
wrote:

> The patches are taken from Fedora, and so aren't backports. Should be
> marked Inactive-Upstream rather.
>
> I would only add it back if it has real consumers or use cases that
> can't be fulfilled by maintained alternatives. Otherwise, anyone can
> carry it privately,
>
> Alex
>
> On Thu, 21 Mar 2024 at 23:18, Derek Straka <derek@asterius.io> wrote:
> >
> > The python3-dbus package was removed in (dac933e).  While the upstream
> > project isn't active, other distributions (e.g. Fedora, Debian, etc)
> > continue to offer the package and apply patches to resolve reported
> issues.
> >
> > While other packages offer similar functionality (e.g. dasbus), they ar=
e
> not
> > drop in replacements and the general dbus functionality works out of th=
e
> box.
> > The python package has accomplished it's goal of providing useful
> functionality,
> > and the proposal is to continue to have it available in meta-python for
> use.
> >
> > Signed-off-by: Derek Straka <derek@asterius.io>
> > ---
> >  .../ptest-packagelists-meta-python.inc        |   1 +
> >  .../packagegroups/packagegroup-meta-python.bb |   1 +
> >  ...ttribute-conforming-to-introspect.dt.patch |   0
> >  .../0002-Support-asynchronous-calls-58.patch  | 204 ++++++++
> >  ...mation-between-D-Bus-errors-and-exce.patch | 493 ++++++++++++++++++
> >  .../python/python3-pydbus/run-ptest           |  15 +
> >  .../python/python3-pydbus_0.6.0.bb            |  26 +
> >  7 files changed, 740 insertions(+)
> >  create mode 100644
> meta-python/recipes-devtools/python/python3-pydbus/0001-make-direction-at=
tribute-conforming-to-introspect.dt.patch
> >  create mode 100644
> meta-python/recipes-devtools/python/python3-pydbus/0002-Support-asynchron=
ous-calls-58.patch
> >  create mode 100644
> meta-python/recipes-devtools/python/python3-pydbus/0003-Support-transform=
ation-between-D-Bus-errors-and-exce.patch
> >  create mode 100644
> meta-python/recipes-devtools/python/python3-pydbus/run-ptest
> >  create mode 100644 meta-python/recipes-devtools/python/
> python3-pydbus_0.6.0.bb
> >
> > diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.in=
c
> b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> > index 447e0b938..ec26f768e 100644
> > --- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
> > +++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> > @@ -53,6 +53,7 @@ PTESTS_FAST_META_PYTHON =3D "\
> >      python3-pytest-mock \
> >      python3-pytoml \
> >      python3-pyyaml-include \
> > +    python3-pydbus \
> >      python3-rapidjson \
> >      python3-requests-file \
> >      python3-requests-toolbelt \
> > diff --git a/meta-python/recipes-core/packagegroups/
> packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/
> packagegroup-meta-python.bb
> > index eb5a26463..e0446da28 100644
> > --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.b=
b
> > +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.b=
b
> > @@ -311,6 +311,7 @@ RDEPENDS:packagegroup-meta-python3 =3D "\
> >      python3-pycodestyle \
> >      python3-pyconnman \
> >      python3-pycurl \
> > +    python3-pydbus \
> >      python3-pydicti \
> >      python3-pyephem \
> >      python3-pyexpect \
> > diff --git
> a/meta-python/recipes-devtools/python/python3-pydbus/0001-make-direction-=
attribute-conforming-to-introspect.dt.patch
> b/meta-python/recipes-devtools/python/python3-pydbus/0001-make-direction-=
attribute-conforming-to-introspect.dt.patch
> > new file mode 100644
> > index 000000000..e69de29bb
> > diff --git
> a/meta-python/recipes-devtools/python/python3-pydbus/0002-Support-asynchr=
onous-calls-58.patch
> b/meta-python/recipes-devtools/python/python3-pydbus/0002-Support-asynchr=
onous-calls-58.patch
> > new file mode 100644
> > index 000000000..44600a8e6
> > --- /dev/null
> > +++
> b/meta-python/recipes-devtools/python/python3-pydbus/0002-Support-asynchr=
onous-calls-58.patch
> > @@ -0,0 +1,204 @@
> > +From 31d6dd7893a5e1bb9eb14bfcee861a5b62f64960 Mon Sep 17 00:00:00 2001
> > +From: Vendula Poncova <vponcova@redhat.com>
> > +Date: Thu, 27 Jul 2017 18:41:29 +0200
> > +Subject: [PATCH 2/3] Support asynchronous calls (#58)
> > +
> > +Added support for asynchronous calls of methods. A method is called
> > +synchronously unless its callback parameter is specified. A callback
> > +is a function f(*args, returned=3DNone, error=3DNone), where args is
> > +callback_args specified in the method call, returned is a return
> > +value of the method and error is an exception raised by the method.
> > +
> > +Example of an asynchronous call:
> > +
> > +def func(x, y, returned=3DNone, error=3DNone):
> > +  pass
> > +
> > +proxy.Method(a, b, callback=3Dfunc, callback_args=3D(x, y))
> > +
> > +Upstream-Status: Backport [
> https://src.fedoraproject.org/cgit/rpms/python-pydbus.git/]
> > +
> > +Signed-off-by: Derek Straka <derek@asterius.io>
> > +---
> > + doc/tutorial.rst       | 11 ++++++++-
> > + pydbus/proxy_method.py | 44 ++++++++++++++++++++++++++++++-----
> > + tests/publish_async.py | 63
> ++++++++++++++++++++++++++++++++++++++++++++++++++
> > + tests/run.sh           |  1 +
> > + 4 files changed, 112 insertions(+), 7 deletions(-)
> > + create mode 100644 tests/publish_async.py
> > +
> > +diff --git a/doc/tutorial.rst b/doc/tutorial.rst
> > +index 7474de3..b8479cf 100644
> > +--- a/doc/tutorial.rst
> > ++++ b/doc/tutorial.rst
> > +@@ -84,7 +84,8 @@ All objects have methods, properties and signals.
> > + Setting up an event loop
> > + =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > +
> > +-To handle signals emitted by exported objects, or to export your own
> objects, you need to setup an event loop.
> > ++To handle signals emitted by exported objects, to asynchronously call
> methods
> > ++or to export your own objects, you need to setup an event loop.
> > +
> > + The only main loop supported by ``pydbus`` is GLib.MainLoop.
> > +
> > +@@ -156,6 +157,14 @@ To call a method::
> > +
> > +     dev.Disconnect()
> > +
> > ++To asynchronously call a method::
> > ++
> > ++    def print_result(returned=3DNone, error=3DNone):
> > ++        print(returned, error)
> > ++
> > ++    dev.GetAppliedConnection(0, callback=3Dprint_result)
> > ++    loop.run()
> > ++
> > + To read a property::
> > +
> > +     print(dev.Autoconnect)
> > +diff --git a/pydbus/proxy_method.py b/pydbus/proxy_method.py
> > +index 3e6e6ee..442fe07 100644
> > +--- a/pydbus/proxy_method.py
> > ++++ b/pydbus/proxy_method.py
> > +@@ -65,15 +65,34 @@ class ProxyMethod(object):
> > +
> > +               # Python 2 sux
> > +               for kwarg in kwargs:
> > +-                      if kwarg not in ("timeout",):
> > ++                      if kwarg not in ("timeout", "callback",
> "callback_args"):
> > +                               raise TypeError(self.__qualname__ + "
> got an unexpected keyword argument '{}'".format(kwarg))
> > +               timeout =3D kwargs.get("timeout", None)
> > ++              callback =3D kwargs.get("callback", None)
> > ++              callback_args =3D kwargs.get("callback_args", tuple())
> > ++
> > ++              call_args =3D (
> > ++                      instance._bus_name,
> > ++                      instance._path,
> > ++                      self._iface_name,
> > ++                      self.__name__,
> > ++                      GLib.Variant(self._sinargs, args),
> > ++                      GLib.VariantType.new(self._soutargs),
> > ++                      0,
> > ++                      timeout_to_glib(timeout),
> > ++                      None
> > ++              )
> > ++
> > ++              if callback:
> > ++                      call_args +=3D (self._finish_async_call,
> (callback, callback_args))
> > ++                      instance._bus.con.call(*call_args)
> > ++                      return None
> > ++              else:
> > ++                      ret =3D instance._bus.con.call_sync(*call_args)
> > ++                      return self._unpack_return(ret)
> > +
> > +-              ret =3D instance._bus.con.call_sync(
> > +-                      instance._bus_name, instance._path,
> > +-                      self._iface_name, self.__name__,
> GLib.Variant(self._sinargs, args), GLib.VariantType.new(self._soutargs),
> > +-                      0, timeout_to_glib(timeout), None).unpack()
> > +-
> > ++      def _unpack_return(self, values):
> > ++              ret =3D values.unpack()
> > +               if len(self._outargs) =3D=3D 0:
> > +                       return None
> > +               elif len(self._outargs) =3D=3D 1:
> > +@@ -81,6 +100,19 @@ class ProxyMethod(object):
> > +               else:
> > +                       return ret
> > +
> > ++      def _finish_async_call(self, source, result, user_data):
> > ++              error =3D None
> > ++              return_args =3D None
> > ++
> > ++              try:
> > ++                      ret =3D source.call_finish(result)
> > ++                      return_args =3D self._unpack_return(ret)
> > ++              except Exception as err:
> > ++                      error =3D err
> > ++
> > ++              callback, callback_args =3D user_data
> > ++              callback(*callback_args, returned=3Dreturn_args,
> error=3Derror)
> > ++
> > +       def __get__(self, instance, owner):
> > +               if instance is None:
> > +                       return self
> > +diff --git a/tests/publish_async.py b/tests/publish_async.py
> > +new file mode 100644
> > +index 0000000..3f79b62
> > +--- /dev/null
> > ++++ b/tests/publish_async.py
> > +@@ -0,0 +1,63 @@
> > ++from pydbus import SessionBus
> > ++from gi.repository import GLib
> > ++from threading import Thread
> > ++import sys
> > ++
> > ++done =3D 0
> > ++loop =3D GLib.MainLoop()
> > ++
> > ++class TestObject(object):
> > ++      '''
> > ++<node>
> > ++      <interface name=3D'net.lew21.pydbus.tests.publish_async'>
> > ++              <method name=3D'HelloWorld'>
> > ++                      <arg type=3D'i' name=3D'x' direction=3D'in'/>
> > ++                      <arg type=3D's' name=3D'response' direction=3D'=
out'/>
> > ++              </method>
> > ++      </interface>
> > ++</node>
> > ++      '''
> > ++      def __init__(self, id):
> > ++              self.id =3D id
> > ++
> > ++      def HelloWorld(self, x):
> > ++              res =3D self.id + ": " + str(x)
> > ++              print(res)
> > ++              return res
> > ++
> > ++bus =3D SessionBus()
> > ++
> > ++with bus.publish("net.lew21.pydbus.tests.publish_async",
> TestObject("Obj")):
> > ++      remote =3D bus.get("net.lew21.pydbus.tests.publish_async")
> > ++
> > ++      def callback(x, returned=3DNone, error=3DNone):
> > ++              print("asyn: " + returned)
> > ++              assert (returned is not None)
> > ++              assert(error is None)
> > ++              assert(x =3D=3D int(returned.split()[1]))
> > ++
> > ++              global done
> > ++              done +=3D 1
> > ++              if done =3D=3D 3:
> > ++                      loop.quit()
> > ++
> > ++      def t1_func():
> > ++              remote.HelloWorld(1, callback=3Dcallback,
> callback_args=3D(1,))
> > ++              remote.HelloWorld(2, callback=3Dcallback,
> callback_args=3D(2,))
> > ++              print("sync: " + remote.HelloWorld(3))
> > ++              remote.HelloWorld(4, callback=3Dcallback,
> callback_args=3D(4,))
> > ++
> > ++      t1 =3D Thread(None, t1_func)
> > ++      t1.daemon =3D True
> > ++
> > ++      def handle_timeout():
> > ++              print("ERROR: Timeout.")
> > ++              sys.exit(1)
> > ++
> > ++      GLib.timeout_add_seconds(2, handle_timeout)
> > ++
> > ++      t1.start()
> > ++
> > ++      loop.run()
> > ++
> > ++      t1.join()
> > +diff --git a/tests/run.sh b/tests/run.sh
> > +index 8d93644..271c58a 100755
> > +--- a/tests/run.sh
> > ++++ b/tests/run.sh
> > +@@ -15,4 +15,5 @@ then
> > +       "$PYTHON" $TESTS_DIR/publish.py
> > +       "$PYTHON" $TESTS_DIR/publish_properties.py
> > +       "$PYTHON" $TESTS_DIR/publish_multiface.py
> > ++      "$PYTHON" $TESTS_DIR/publish_async.py
> > + fi
> > +--
> > +2.13.5
> > diff --git
> a/meta-python/recipes-devtools/python/python3-pydbus/0003-Support-transfo=
rmation-between-D-Bus-errors-and-exce.patch
> b/meta-python/recipes-devtools/python/python3-pydbus/0003-Support-transfo=
rmation-between-D-Bus-errors-and-exce.patch
> > new file mode 100644
> > index 000000000..1d45470f0
> > --- /dev/null
> > +++
> b/meta-python/recipes-devtools/python/python3-pydbus/0003-Support-transfo=
rmation-between-D-Bus-errors-and-exce.patch
> > @@ -0,0 +1,493 @@
> > +From 773858e1afd21cdf3ceef2cd35509f0b4882bf16 Mon Sep 17 00:00:00 2001
> > +From: Vendula Poncova <vponcova@redhat.com>
> > +Date: Tue, 1 Aug 2017 16:54:24 +0200
> > +Subject: [PATCH 3/3] Support transformation between D-Bus errors and
> > + exceptions.
> > +
> > +Exceptions can be registered with decorators, raised in a remote
> > +method and recreated after return from the remote call.
> > +
> > +Upstream-Status: Backport [
> https://src.fedoraproject.org/cgit/rpms/python-pydbus.git/]
> > +
> > +Signed-off-by: Derek Straka <derek@asterius.io>
> > +---
> > + doc/tutorial.rst       |  47 ++++++++++++++++++
> > + pydbus/error.py        |  97 ++++++++++++++++++++++++++++++++++++
> > + pydbus/proxy_method.py |  18 +++++--
> > + pydbus/registration.py |  16 ++++--
> > + tests/error.py         |  67 +++++++++++++++++++++++++
> > + tests/publish_error.py | 132
> +++++++++++++++++++++++++++++++++++++++++++++++++
> > + tests/run.sh           |   2 +
> > + 7 files changed, 371 insertions(+), 8 deletions(-)
> > + create mode 100644 pydbus/error.py
> > + create mode 100644 tests/error.py
> > + create mode 100644 tests/publish_error.py
> > +
> > +diff --git a/doc/tutorial.rst b/doc/tutorial.rst
> > +index b8479cf..7fe55e1 100644
> > +--- a/doc/tutorial.rst
> > ++++ b/doc/tutorial.rst
> > +@@ -341,6 +341,53 @@ See ``help(bus.request_name)`` and
> ``help(bus.register_object)`` for details.
> > +
> > + .. ------------------------------------------------------------------=
--
> > +
> > ++Error handling
> > ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ++
> > ++You can map D-Bus errors to your exception classes for better error
> handling.
> > ++To handle D-Bus errors, use the ``@map_error`` decorator::
> > ++
> > ++    from pydbus.error import map_error
> > ++
> > ++    @map_error("org.freedesktop.DBus.Error.InvalidArgs")
> > ++    class InvalidArgsException(Exception):
> > ++        pass
> > ++
> > ++    try:
> > ++        ...
> > ++    catch InvalidArgsException as e:
> > ++        print(e)
> > ++
> > ++To register new D-Bus errors, use the ``@register_error`` decorator::
> > ++
> > ++    from pydbus.error import register_error
> > ++
> > ++    @map_error("net.lew21.pydbus.TutorialExample.MyError", MY_DOMAIN,
> MY_EXCEPTION_CODE)
> > ++    class MyException(Exception):
> > ++        pass
> > ++
> > ++Then you can raise ``MyException`` from the D-Bus method of the remot=
e
> object::
> > ++
> > ++    def Method():
> > ++        raise MyException("Message")
> > ++
> > ++And catch the same exception on the client side::
> > ++
> > ++    try:
> > ++        proxy.Method()
> > ++    catch MyException as e:
> > ++        print(e)
> > ++
> > ++To handle all unknown D-Bus errors, use the ``@map_by_default``
> decorator to specify the default exception::
> > ++
> > ++    from pydbus.error import map_by_default
> > ++
> > ++    @map_by_default
> > ++    class DefaultException(Exception):
> > ++        pass
> > ++
> > ++.. ------------------------------------------------------------------=
--
> > ++
> > + Data types
> > + =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +diff --git a/pydbus/error.py b/pydbus/error.py
> > +new file mode 100644
> > +index 0000000..aaa3510
> > +--- /dev/null
> > ++++ b/pydbus/error.py
> > +@@ -0,0 +1,97 @@
> > ++from gi.repository import GLib, Gio
> > ++
> > ++
> > ++def register_error(name, domain, code):
> > ++      """Register and map decorated exception class to a DBus error."=
""
> > ++      def decorated(cls):
> > ++              error_registration.register_error(cls, name, domain,
> code)
> > ++              return cls
> > ++
> > ++      return decorated
> > ++
> > ++
> > ++def map_error(error_name):
> > ++      """Map decorated exception class to a DBus error."""
> > ++      def decorated(cls):
> > ++              error_registration.map_error(cls, error_name)
> > ++              return cls
> > ++
> > ++      return decorated
> > ++
> > ++
> > ++def map_by_default(cls):
> > ++      """Map decorated exception class to all unknown DBus errors."""
> > ++      error_registration.map_by_default(cls)
> > ++      return cls
> > ++
> > ++
> > ++class ErrorRegistration(object):
> > ++      """Class for mapping exceptions to DBus errors."""
> > ++
> > ++      _default =3D None
> > ++      _map =3D dict()
> > ++      _reversed_map =3D dict()
> > ++
> > ++      def map_by_default(self, exception_cls):
> > ++              """Set the exception class as a default."""
> > ++              self._default =3D exception_cls
> > ++
> > ++      def map_error(self, exception_cls, name):
> > ++              """Map the exception class to a DBus name."""
> > ++              self._map[name] =3D exception_cls
> > ++              self._reversed_map[exception_cls] =3D name
> > ++
> > ++      def register_error(self, exception_cls, name, domain, code):
> > ++              """Map and register the exception class to a DBus
> name."""
> > ++              self.map_error(exception_cls, name)
> > ++              return Gio.DBusError.register_error(domain, code, name)
> > ++
> > ++      def is_registered_exception(self, obj):
> > ++              """Is the exception registered?"""
> > ++              return obj.__class__ in self._reversed_map
> > ++
> > ++      def get_dbus_name(self, obj):
> > ++              """Get the DBus name of the exception."""
> > ++              return self._reversed_map.get(obj.__class__)
> > ++
> > ++      def get_exception_class(self, name):
> > ++              """Get the exception class mapped to the DBus name."""
> > ++              return self._map.get(name, self._default)
> > ++
> > ++      def transform_message(self, name, message):
> > ++              """Transform the message of the exception."""
> > ++              prefix =3D "{}:{}: ".format("GDBus.Error", name)
> > ++
> > ++              if message.startswith(prefix):
> > ++                      return message[len(prefix):]
> > ++
> > ++              return message
> > ++
> > ++      def transform_exception(self, e):
> > ++              """Transform the remote error to the exception."""
> > ++              if not isinstance(e, GLib.Error):
> > ++                      return e
> > ++
> > ++              if not Gio.DBusError.is_remote_error(e):
> > ++                      return e
> > ++
> > ++              # Get DBus name of the error.
> > ++              name =3D Gio.DBusError.get_remote_error(e)
> > ++              # Get the exception class.
> > ++              exception_cls =3D self.get_exception_class(name)
> > ++
> > ++              # Return the original exception.
> > ++              if not exception_cls:
> > ++                      return e
> > ++
> > ++              # Return new exception.
> > ++              message =3D self.transform_message(name, e.message)
> > ++              exception =3D exception_cls(message)
> > ++              exception.dbus_name =3D name
> > ++              exception.dbus_domain =3D e.domain
> > ++              exception.dbus_code =3D e.code
> > ++              return exception
> > ++
> > ++
> > ++# Default error registration.
> > ++error_registration =3D ErrorRegistration()
> > +diff --git a/pydbus/proxy_method.py b/pydbus/proxy_method.py
> > +index 442fe07..a73f9eb 100644
> > +--- a/pydbus/proxy_method.py
> > ++++ b/pydbus/proxy_method.py
> > +@@ -2,6 +2,7 @@ from gi.repository import GLib
> > + from .generic import bound_method
> > + from .identifier import filter_identifier
> > + from .timeout import timeout_to_glib
> > ++from .error import error_registration
> > +
> > + try:
> > +       from inspect import Signature, Parameter
> > +@@ -87,9 +88,20 @@ class ProxyMethod(object):
> > +                       call_args +=3D (self._finish_async_call,
> (callback, callback_args))
> > +                       instance._bus.con.call(*call_args)
> > +                       return None
> > ++
> > +               else:
> > +-                      ret =3D instance._bus.con.call_sync(*call_args)
> > +-                      return self._unpack_return(ret)
> > ++                      result =3D None
> > ++                      error =3D None
> > ++
> > ++                      try:
> > ++                              result =3D
> instance._bus.con.call_sync(*call_args)
> > ++                      except Exception as e:
> > ++                              error =3D
> error_registration.transform_exception(e)
> > ++
> > ++                      if error:
> > ++                              raise error
> > ++
> > ++                      return self._unpack_return(result)
> > +
> > +       def _unpack_return(self, values):
> > +               ret =3D values.unpack()
> > +@@ -108,7 +120,7 @@ class ProxyMethod(object):
> > +                       ret =3D source.call_finish(result)
> > +                       return_args =3D self._unpack_return(ret)
> > +               except Exception as err:
> > +-                      error =3D err
> > ++                      error =3D
> error_registration.transform_exception(err)
> > +
> > +               callback, callback_args =3D user_data
> > +               callback(*callback_args, returned=3Dreturn_args,
> error=3Derror)
> > +diff --git a/pydbus/registration.py b/pydbus/registration.py
> > +index f531539..1d2cbcb 100644
> > +--- a/pydbus/registration.py
> > ++++ b/pydbus/registration.py
> > +@@ -5,6 +5,7 @@ from . import generic
> > + from .exitable import ExitableWithAliases
> > + from functools import partial
> > + from .method_call_context import MethodCallContext
> > ++from .error import error_registration
> > + import logging
> > +
> > + try:
> > +@@ -91,11 +92,16 @@ class ObjectWrapper(ExitableWithAliases("unwrap"))=
:
> > +                       logger =3D logging.getLogger(__name__)
> > +                       logger.exception("Exception while handling
> %s.%s()", interface_name, method_name)
> > +
> > +-                      #TODO Think of a better way to translate Python
> exception types to DBus error types.
> > +-                      e_type =3D type(e).__name__
> > +-                      if not "." in e_type:
> > +-                              e_type =3D "unknown." + e_type
> > +-                      invocation.return_dbus_error(e_type, str(e))
> > ++                      if error_registration.is_registered_exception(e=
):
> > ++                              name =3D
> error_registration.get_dbus_name(e)
> > ++                              invocation.return_dbus_error(name,
> str(e))
> > ++                      else:
> > ++                              logger.info("name is not registered")
> > ++                              e_type =3D type(e).__name__
> > ++                              if not "." in e_type:
> > ++                                      e_type =3D "unknown." + e_type
> > ++
> > ++                              invocation.return_dbus_error(e_type,
> str(e))
> > +
> > +       def Get(self, interface_name, property_name):
> > +               type =3D self.readable_properties[interface_name + "." =
+
> property_name]
> > +diff --git a/tests/error.py b/tests/error.py
> > +new file mode 100644
> > +index 0000000..3ec507d
> > +--- /dev/null
> > ++++ b/tests/error.py
> > +@@ -0,0 +1,67 @@
> > ++from pydbus.error import ErrorRegistration
> > ++
> > ++
> > ++class ExceptionA(Exception):
> > ++      pass
> > ++
> > ++
> > ++class ExceptionB(Exception):
> > ++      pass
> > ++
> > ++
> > ++class ExceptionC(Exception):
> > ++      pass
> > ++
> > ++
> > ++class ExceptionD(Exception):
> > ++      pass
> > ++
> > ++
> > ++class ExceptionE(Exception):
> > ++      pass
> > ++
> > ++
> > ++def test_error_mapping():
> > ++      r =3D ErrorRegistration()
> > ++      r.map_error(ExceptionA, "net.lew21.pydbus.tests.ErrorA")
> > ++      r.map_error(ExceptionB, "net.lew21.pydbus.tests.ErrorB")
> > ++      r.map_error(ExceptionC, "net.lew21.pydbus.tests.ErrorC")
> > ++
> > ++      assert r.is_registered_exception(ExceptionA("Test"))
> > ++      assert r.is_registered_exception(ExceptionB("Test"))
> > ++      assert r.is_registered_exception(ExceptionC("Test"))
> > ++      assert not r.is_registered_exception(ExceptionD("Test"))
> > ++      assert not r.is_registered_exception(ExceptionE("Test"))
> > ++
> > ++      assert r.get_dbus_name(ExceptionA("Test")) =3D=3D
> "net.lew21.pydbus.tests.ErrorA"
> > ++      assert r.get_dbus_name(ExceptionB("Test")) =3D=3D
> "net.lew21.pydbus.tests.ErrorB"
> > ++      assert r.get_dbus_name(ExceptionC("Test")) =3D=3D
> "net.lew21.pydbus.tests.ErrorC"
> > ++
> > ++      assert r.get_exception_class("net.lew21.pydbus.tests.ErrorA") =
=3D=3D
> ExceptionA
> > ++      assert r.get_exception_class("net.lew21.pydbus.tests.ErrorB") =
=3D=3D
> ExceptionB
> > ++      assert r.get_exception_class("net.lew21.pydbus.tests.ErrorC") =
=3D=3D
> ExceptionC
> > ++      assert r.get_exception_class("net.lew21.pydbus.tests.ErrorD") i=
s
> None
> > ++      assert r.get_exception_class("net.lew21.pydbus.tests.ErrorE") i=
s
> None
> > ++
> > ++      r.map_by_default(ExceptionD)
> > ++      assert not r.is_registered_exception(ExceptionD("Test"))
> > ++      assert r.get_exception_class("net.lew21.pydbus.tests.ErrorD") =
=3D=3D
> ExceptionD
> > ++      assert r.get_exception_class("net.lew21.pydbus.tests.ErrorE") =
=3D=3D
> ExceptionD
> > ++
> > ++
> > ++def test_transform_message():
> > ++      r =3D ErrorRegistration()
> > ++      n1 =3D "net.lew21.pydbus.tests.ErrorA"
> > ++      m1 =3D "GDBus.Error:net.lew21.pydbus.tests.ErrorA: Message1"
> > ++
> > ++      n2 =3D "net.lew21.pydbus.tests.ErrorB"
> > ++      m2 =3D "GDBus.Error:net.lew21.pydbus.tests.ErrorB: Message2"
> > ++
> > ++      assert r.transform_message(n1, m1) =3D=3D "Message1"
> > ++      assert r.transform_message(n2, m2) =3D=3D "Message2"
> > ++      assert r.transform_message(n1, m2) =3D=3D m2
> > ++      assert r.transform_message(n2, m1) =3D=3D m1
> > ++
> > ++
> > ++test_error_mapping()
> > ++test_transform_message()
> > +diff --git a/tests/publish_error.py b/tests/publish_error.py
> > +new file mode 100644
> > +index 0000000..aa8a18a
> > +--- /dev/null
> > ++++ b/tests/publish_error.py
> > +@@ -0,0 +1,132 @@
> > ++import sys
> > ++from threading import Thread
> > ++from gi.repository import GLib, Gio
> > ++from pydbus import SessionBus
> > ++from pydbus.error import register_error, map_error, map_by_default,
> error_registration
> > ++
> > ++import logging
> > ++logger =3D logging.getLogger('pydbus.registration')
> > ++logger.disabled =3D True
> > ++
> > ++loop =3D GLib.MainLoop()
> > ++DOMAIN =3D Gio.DBusError.quark()  # TODO: Register new domain.
> > ++
> > ++
> > ++@register_error("net.lew21.pydbus.tests.ErrorA", DOMAIN, 1000)
> > ++class ExceptionA(Exception):
> > ++      pass
> > ++
> > ++
> > ++@register_error("net.lew21.pydbus.tests.ErrorB", DOMAIN, 2000)
> > ++class ExceptionB(Exception):
> > ++      pass
> > ++
> > ++
> > ++@map_error("org.freedesktop.DBus.Error.InvalidArgs")
> > ++class ExceptionC(Exception):
> > ++      pass
> > ++
> > ++
> > ++@map_by_default
> > ++class ExceptionD(Exception):
> > ++      pass
> > ++
> > ++
> > ++class ExceptionE(Exception):
> > ++      pass
> > ++
> > ++
> > ++class TestObject(object):
> > ++      '''
> > ++<node>
> > ++      <interface name=3D'net.lew21.pydbus.tests.TestInterface'>
> > ++              <method name=3D'RaiseA'>
> > ++                      <arg type=3D's' name=3D'msg' direction=3D'in'/>
> > ++              </method>
> > ++              <method name=3D'RaiseB'>
> > ++                      <arg type=3D's' name=3D'msg' direction=3D'in'/>
> > ++              </method>
> > ++              <method name=3D'RaiseD'>
> > ++                      <arg type=3D's' name=3D'msg' direction=3D'in'/>
> > ++              </method>
> > ++              <method name=3D'RaiseE'>
> > ++                      <arg type=3D's' name=3D'msg' direction=3D'in'/>
> > ++              </method>
> > ++      </interface>
> > ++</node>
> > ++      '''
> > ++
> > ++      def RaiseA(self, msg):
> > ++              raise ExceptionA(msg)
> > ++
> > ++      def RaiseB(self, msg):
> > ++              raise ExceptionB(msg)
> > ++
> > ++      def RaiseD(self, msg):
> > ++              raise ExceptionD(msg)
> > ++
> > ++      def RaiseE(self, msg):
> > ++              raise ExceptionE(msg)
> > ++
> > ++bus =3D SessionBus()
> > ++
> > ++with bus.publish("net.lew21.pydbus.tests.Test", TestObject()):
> > ++      remote =3D bus.get("net.lew21.pydbus.tests.Test")
> > ++
> > ++      def t_func():
> > ++              # Test new registered errors.
> > ++              try:
> > ++                      remote.RaiseA("Test A")
> > ++              except ExceptionA as e:
> > ++                      assert str(e) =3D=3D "Test A"
> > ++
> > ++              try:
> > ++                      remote.RaiseB("Test B")
> > ++              except ExceptionB as e:
> > ++                      assert str(e) =3D=3D "Test B"
> > ++
> > ++              # Test mapped errors.
> > ++              try:
> > ++
> remote.Get("net.lew21.pydbus.tests.TestInterface", "Foo")
> > ++              except ExceptionC as e:
> > ++                      assert str(e) =3D=3D "No such property 'Foo'"
> > ++
> > ++              # Test default errors.
> > ++              try:
> > ++                      remote.RaiseD("Test D")
> > ++              except ExceptionD as e:
> > ++                      assert str(e) =3D=3D "Test D"
> > ++
> > ++              try:
> > ++                      remote.RaiseE("Test E")
> > ++              except ExceptionD as e:
> > ++                      assert str(e) =3D=3D "Test E"
> > ++
> > ++              # Test with no default errors.
> > ++              error_registration.map_by_default(None)
> > ++
> > ++              try:
> > ++                      remote.RaiseD("Test D")
> > ++              except Exception as e:
> > ++                      assert not isinstance(e, ExceptionD)
> > ++
> > ++              try:
> > ++                      remote.RaiseE("Test E")
> > ++              except Exception as e:
> > ++                      assert not isinstance(e, ExceptionD)
> > ++                      assert not isinstance(e, ExceptionE)
> > ++
> > ++              loop.quit()
> > ++
> > ++      t =3D Thread(None, t_func)
> > ++      t.daemon =3D True
> > ++
> > ++      def handle_timeout():
> > ++              print("ERROR: Timeout.")
> > ++              sys.exit(1)
> > ++
> > ++      GLib.timeout_add_seconds(4, handle_timeout)
> > ++
> > ++      t.start()
> > ++      loop.run()
> > ++      t.join()
> > +diff --git a/tests/run.sh b/tests/run.sh
> > +index 271c58a..a08baf8 100755
> > +--- a/tests/run.sh
> > ++++ b/tests/run.sh
> > +@@ -10,10 +10,11 @@ PYTHON=3D${1:-python}
> > +
> > + "$PYTHON" $TESTS_DIR/context.py
> > + "$PYTHON" $TESTS_DIR/identifier.py
> > ++"$PYTHON" $TESTS_DIR/error.py
> > + if [ "$2" !=3D "dontpublish" ]
> > + then
> > +       "$PYTHON" $TESTS_DIR/publish.py
> > +       "$PYTHON" $TESTS_DIR/publish_properties.py
> > +       "$PYTHON" $TESTS_DIR/publish_multiface.py
> > +       "$PYTHON" $TESTS_DIR/publish_async.py
> > + fi
> > +--
> > +2.13.5
> > diff --git
> a/meta-python/recipes-devtools/python/python3-pydbus/run-ptest
> b/meta-python/recipes-devtools/python/python3-pydbus/run-ptest
> > new file mode 100644
> > index 000000000..782ceed3b
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-pydbus/run-ptest
> > @@ -0,0 +1,15 @@
> > +#!/bin/sh
> > +
> > +for case in `find tests -type f -name '*.sh'`; do
> > +    bash $case python3 >$case.output 2>&1
> > +    ret=3D$?
> > +    if [ $ret -ne 0 ]; then
> > +        cat $case.output
> > +        echo "FAIL: ${case}"
> > +    elif grep -i 'SKIP' $case.output; then
> > +        echo "SKIP: ${case}"
> > +    else
> > +        echo "PASS: ${case}"
> > +    fi
> > +    rm -f $case.output
> > +done
> > \ No newline at end of file
> > diff --git a/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.b=
b
> b/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
> > new file mode 100644
> > index 000000000..ac9b8e8ab
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
> > @@ -0,0 +1,26 @@
> > +DESCRIPTION =3D "Pythonic DBus library"
> > +HOMEPAGE =3D "https://pypi.python.org/pypi/pydbus/"
> > +LICENSE =3D "LGPL-2.1-only"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da916467b91076e631dd8edb7424=
769c7"
> > +
> > +SRCREV =3D "f2e6355a88351e7d644ccb2b4d67b19305507312"
> > +SRC_URI =3D " \
> > +    git://github.com/LEW21/pydbus.git;protocol=3Dhttps;branch=3Dmaster=
 \
> > +
> file://0001-make-direction-attribute-conforming-to-introspect.dt.patch \
> > +    file://0002-Support-asynchronous-calls-58.patch \
> > +
> file://0003-Support-transformation-between-D-Bus-errors-and-exce.patch \
> > +    file://run-ptest \
> > +"
> > +
> > +inherit ptest setuptools3
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +RDEPENDS:${PN} =3D "${PYTHON_PN}-pygobject \
> > +                  ${PYTHON_PN}-io \
> > +                  ${PYTHON_PN}-logging"
> > +
> > +do_install_ptest() {
> > +        install -d ${D}${PTEST_PATH}/tests
> > +        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> > +}
> > \ No newline at end of file
> > --
> > 2.34.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#109506):
> https://lists.openembedded.org/g/openembedded-devel/message/109506
> > Mute This Topic: https://lists.openembedded.org/mt/105075352/1686489
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000be8b3a06143ab945
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Alex,<div dir=3D"auto"><br></div><div dir=3D"auto">Tha=
nks for your reply.=C2=A0 I didn&#39;t know Inactive-Upstream was part of t=
he enum.=C2=A0 I&#39;ll update and send a v2 in the morning.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">I hear the concerns about adding pack=
ages that aren&#39;t actively maintained.=C2=A0 I also agree with the senti=
ment you raise regarding the broader context of downstream consumers, etc.=
=C2=A0 =C2=A0Ultimately, it&#39;s a package that matters to my use cases, a=
nd I&#39;m going to request we allow the patchset.=C2=A0 I&#39;ll accept re=
sponsibility for the additional maintenance burdens, etc.=C2=A0 To mitigate=
 future issues, I&#39;ll push the consumers I can influence to move to a ma=
intained before the next release.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">-Derek</div><br><br><div class=3D"gmail_quote" dir=3D"auto"><div =
dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 22, 2024, 12:39=E2=80=AFAM Ale=
xander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@g=
mail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The patches=
 are taken from Fedora, and so aren&#39;t backports. Should be<br>
marked Inactive-Upstream rather.<br>
<br>
I would only add it back if it has real consumers or use cases that<br>
can&#39;t be fulfilled by maintained alternatives. Otherwise, anyone can<br=
>
carry it privately,<br>
<br>
Alex<br>
<br>
On Thu, 21 Mar 2024 at 23:18, Derek Straka &lt;<a href=3D"mailto:derek@aste=
rius.io" target=3D"_blank" rel=3D"noreferrer">derek@asterius.io</a>&gt; wro=
te:<br>
&gt;<br>
&gt; The python3-dbus package was removed in (dac933e).=C2=A0 While the ups=
tream<br>
&gt; project isn&#39;t active, other distributions (e.g. Fedora, Debian, et=
c)<br>
&gt; continue to offer the package and apply patches to resolve reported is=
sues.<br>
&gt;<br>
&gt; While other packages offer similar functionality (e.g. dasbus), they a=
re not<br>
&gt; drop in replacements and the general dbus functionality works out of t=
he box.<br>
&gt; The python package has accomplished it&#39;s goal of providing useful =
functionality,<br>
&gt; and the proposal is to continue to have it available in meta-python fo=
r use.<br>
&gt;<br>
&gt; Signed-off-by: Derek Straka &lt;<a href=3D"mailto:derek@asterius.io" t=
arget=3D"_blank" rel=3D"noreferrer">derek@asterius.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../ptest-packagelists-meta-python.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 .../packagegroups/<a href=3D"http://packagegroup-meta-python.bb"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">packagegroup-meta-python.b=
b</a> |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 ...ttribute-conforming-to-introspect.dt.patch |=C2=A0 =C2=A00<br=
>
&gt;=C2=A0 .../0002-Support-asynchronous-calls-58.patch=C2=A0 | 204 +++++++=
+<br>
&gt;=C2=A0 ...mation-between-D-Bus-errors-and-exce.patch | 493 ++++++++++++=
++++++<br>
&gt;=C2=A0 .../python/python3-pydbus/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 15 +<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-pydbus_0.6.0.bb" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">python3-pydbus_0.6.0.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 26 +<br>
&gt;=C2=A0 7 files changed, 740 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/python3-p=
ydbus/0001-make-direction-attribute-conforming-to-introspect.dt.patch<br>
&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/python3-p=
ydbus/0002-Support-asynchronous-calls-58.patch<br>
&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/python3-p=
ydbus/0003-Support-transformation-between-D-Bus-errors-and-exce.patch<br>
&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/python3-p=
ydbus/run-ptest<br>
&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/<a href=
=3D"http://python3-pydbus_0.6.0.bb" rel=3D"noreferrer noreferrer" target=3D=
"_blank">python3-pydbus_0.6.0.bb</a><br>
&gt;<br>
&gt; diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.i=
nc b/meta-python/conf/include/ptest-packagelists-meta-python.inc<br>
&gt; index 447e0b938..ec26f768e 100644<br>
&gt; --- a/meta-python/conf/include/ptest-packagelists-meta-python.inc<br>
&gt; +++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc<br>
&gt; @@ -53,6 +53,7 @@ PTESTS_FAST_META_PYTHON =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-pytest-mock \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-pytoml \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-pyyaml-include \<br>
&gt; +=C2=A0 =C2=A0 python3-pydbus \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-rapidjson \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-requests-file \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-requests-toolbelt \<br>
&gt; diff --git a/meta-python/recipes-core/packagegroups/<a href=3D"http://=
packagegroup-meta-python.bb" rel=3D"noreferrer noreferrer" target=3D"_blank=
">packagegroup-meta-python.bb</a> b/meta-python/recipes-core/packagegroups/=
<a href=3D"http://packagegroup-meta-python.bb" rel=3D"noreferrer noreferrer=
" target=3D"_blank">packagegroup-meta-python.bb</a><br>
&gt; index eb5a26463..e0446da28 100644<br>
&gt; --- a/meta-python/recipes-core/packagegroups/<a href=3D"http://package=
group-meta-python.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">packa=
gegroup-meta-python.bb</a><br>
&gt; +++ b/meta-python/recipes-core/packagegroups/<a href=3D"http://package=
group-meta-python.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">packa=
gegroup-meta-python.bb</a><br>
&gt; @@ -311,6 +311,7 @@ RDEPENDS:packagegroup-meta-python3 =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-pycodestyle \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-pyconnman \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-pycurl \<br>
&gt; +=C2=A0 =C2=A0 python3-pydbus \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-pydicti \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-pyephem \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-pyexpect \<br>
&gt; diff --git a/meta-python/recipes-devtools/python/python3-pydbus/0001-m=
ake-direction-attribute-conforming-to-introspect.dt.patch b/meta-python/rec=
ipes-devtools/python/python3-pydbus/0001-make-direction-attribute-conformin=
g-to-introspect.dt.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..e69de29bb<br>
&gt; diff --git a/meta-python/recipes-devtools/python/python3-pydbus/0002-S=
upport-asynchronous-calls-58.patch b/meta-python/recipes-devtools/python/py=
thon3-pydbus/0002-Support-asynchronous-calls-58.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..44600a8e6<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-python/recipes-devtools/python/python3-pydbus/0002-Support-=
asynchronous-calls-58.patch<br>
&gt; @@ -0,0 +1,204 @@<br>
&gt; +From 31d6dd7893a5e1bb9eb14bfcee861a5b62f64960 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Vendula Poncova &lt;<a href=3D"mailto:vponcova@redhat.com" targ=
et=3D"_blank" rel=3D"noreferrer">vponcova@redhat.com</a>&gt;<br>
&gt; +Date: Thu, 27 Jul 2017 18:41:29 +0200<br>
&gt; +Subject: [PATCH 2/3] Support asynchronous calls (#58)<br>
&gt; +<br>
&gt; +Added support for asynchronous calls of methods. A method is called<b=
r>
&gt; +synchronously unless its callback parameter is specified. A callback<=
br>
&gt; +is a function f(*args, returned=3DNone, error=3DNone), where args is<=
br>
&gt; +callback_args specified in the method call, returned is a return<br>
&gt; +value of the method and error is an exception raised by the method.<b=
r>
&gt; +<br>
&gt; +Example of an asynchronous call:<br>
&gt; +<br>
&gt; +def func(x, y, returned=3DNone, error=3DNone):<br>
&gt; +=C2=A0 pass<br>
&gt; +<br>
&gt; +proxy.Method(a, b, callback=3Dfunc, callback_args=3D(x, y))<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://src.fedoraproject.org/c=
git/rpms/python-pydbus.git/" rel=3D"noreferrer noreferrer" target=3D"_blank=
">https://src.fedoraproject.org/cgit/rpms/python-pydbus.git/</a>]<br>
&gt; +<br>
&gt; +Signed-off-by: Derek Straka &lt;<a href=3D"mailto:derek@asterius.io" =
target=3D"_blank" rel=3D"noreferrer">derek@asterius.io</a>&gt;<br>
&gt; +---<br>
&gt; + doc/tutorial.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 ++++++++-<br>
&gt; + pydbus/proxy_method.py | 44 ++++++++++++++++++++++++++++++-----<br>
&gt; + tests/publish_async.py | 63 ++++++++++++++++++++++++++++++++++++++++=
++++++++++<br>
&gt; + tests/run.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt; + 4 files changed, 112 insertions(+), 7 deletions(-)<br>
&gt; + create mode 100644 tests/publish_async.py<br>
&gt; +<br>
&gt; +diff --git a/doc/tutorial.rst b/doc/tutorial.rst<br>
&gt; +index 7474de3..b8479cf 100644<br>
&gt; +--- a/doc/tutorial.rst<br>
&gt; ++++ b/doc/tutorial.rst<br>
&gt; +@@ -84,7 +84,8 @@ All objects have methods, properties and signals.<b=
r>
&gt; + Setting up an event loop<br>
&gt; + =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
&gt; +<br>
&gt; +-To handle signals emitted by exported objects, or to export your own=
 objects, you need to setup an event loop.<br>
&gt; ++To handle signals emitted by exported objects, to asynchronously cal=
l methods<br>
&gt; ++or to export your own objects, you need to setup an event loop.<br>
&gt; +<br>
&gt; + The only main loop supported by ``pydbus`` is GLib.MainLoop.<br>
&gt; +<br>
&gt; +@@ -156,6 +157,14 @@ To call a method::<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev.Disconnect()<br>
&gt; +<br>
&gt; ++To asynchronously call a method::<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 def print_result(returned=3DNone, error=3DNone):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 print(returned, error)<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 dev.GetAppliedConnection(0, callback=3Dprint_result)<b=
r>
&gt; ++=C2=A0 =C2=A0 loop.run()<br>
&gt; ++<br>
&gt; + To read a property::<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0print(dev.Autoconnect)<br>
&gt; +diff --git a/pydbus/proxy_method.py b/pydbus/proxy_method.py<br>
&gt; +index 3e6e6ee..442fe07 100644<br>
&gt; +--- a/pydbus/proxy_method.py<br>
&gt; ++++ b/pydbus/proxy_method.py<br>
&gt; +@@ -65,15 +65,34 @@ class ProxyMethod(object):<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Python 2 sux=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for kwarg in k=
wargs:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if kwarg not in (&quot;timeout&quot;,):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if kwarg not in (&quot;timeout&quot;, &quot;callback&quot;, &quo=
t;callback_args&quot;):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise TypeError(self.__qualname__=
 + &quot; got an unexpected keyword argument &#39;{}&#39;&quot;.format(kwar=
g))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timeout =3D kw=
args.get(&quot;timeout&quot;, None)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 callback =3D kwargs=
.get(&quot;callback&quot;, None)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 callback_args =3D k=
wargs.get(&quot;callback_args&quot;, tuple())<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 call_args =3D (<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 instance._bus_name,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 instance._path,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 self._iface_name,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 self.__name__,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 GLib.Variant(self._sinargs, args),<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 GLib.VariantType.new(self._soutargs),<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 timeout_to_glib(timeout),<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 None<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if callback:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 call_args +=3D (self._finish_async_call, (callback, callback_arg=
s))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 instance._bus.con.call(*call_args)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return None<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ret =3D instance._bus.con.call_sync(*call_args)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return self._unpack_return(ret)<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D instance._b=
us.con.call_sync(<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 instance._bus_name, instance._path,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 self._iface_name, self.__name__, GLib.Variant(self._sinargs, arg=
s), GLib.VariantType.new(self._soutargs),<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0, timeout_to_glib(timeout), None).unpack()<br>
&gt; +-<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 def _unpack_return(self, values):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D values.unpa=
ck()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if len(self._o=
utargs) =3D=3D 0:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return None<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif len(self.=
_outargs) =3D=3D 1:<br>
&gt; +@@ -81,6 +100,19 @@ class ProxyMethod(object):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return ret<br>
&gt; +<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 def _finish_async_call(self, source, result, us=
er_data):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error =3D None<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return_args =3D Non=
e<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ret =3D source.call_finish(result)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return_args =3D self._unpack_return(ret)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except Exception as=
 err:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 error =3D err<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 callback, callback_=
args =3D user_data<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 callback(*callback_=
args, returned=3Dreturn_args, error=3Derror)<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0def __get__(self, instance, owner):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if instance is=
 None:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return self<br>
&gt; +diff --git a/tests/publish_async.py b/tests/publish_async.py<br>
&gt; +new file mode 100644<br>
&gt; +index 0000000..3f79b62<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/tests/publish_async.py<br>
&gt; +@@ -0,0 +1,63 @@<br>
&gt; ++from pydbus import SessionBus<br>
&gt; ++from gi.repository import GLib<br>
&gt; ++from threading import Thread<br>
&gt; ++import sys<br>
&gt; ++<br>
&gt; ++done =3D 0<br>
&gt; ++loop =3D GLib.MainLoop()<br>
&gt; ++<br>
&gt; ++class TestObject(object):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 &#39;&#39;&#39;<br>
&gt; ++&lt;node&gt;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 &lt;interface name=3D&#39;net.lew21.pydbus.test=
s.publish_async&#39;&gt;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;method name=3D&=
#39;HelloWorld&#39;&gt;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &lt;arg type=3D&#39;i&#39; name=3D&#39;x&#39; direction=3D&#39;i=
n&#39;/&gt;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &lt;arg type=3D&#39;s&#39; name=3D&#39;response&#39; direction=
=3D&#39;out&#39;/&gt;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/method&gt;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 &lt;/interface&gt;<br>
&gt; ++&lt;/node&gt;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 &#39;&#39;&#39;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 def __init__(self, id):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://s=
elf.id" rel=3D"noreferrer noreferrer" target=3D"_blank">self.id</a> =3D id<=
br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 def HelloWorld(self, x):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D <a href=3D"=
http://self.id" rel=3D"noreferrer noreferrer" target=3D"_blank">self.id</a>=
 + &quot;: &quot; + str(x)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(res)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return res<br>
&gt; ++<br>
&gt; ++bus =3D SessionBus()<br>
&gt; ++<br>
&gt; ++with bus.publish(&quot;net.lew21.pydbus.tests.publish_async&quot;, T=
estObject(&quot;Obj&quot;)):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 remote =3D bus.get(&quot;net.lew21.pydbus.tests=
.publish_async&quot;)<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 def callback(x, returned=3DNone, error=3DNone):=
<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&quot;asyn: &=
quot; + returned)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert (returned is=
 not None)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(error is Non=
e)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(x =3D=3D int=
(returned.split()[1]))<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 global done<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done +=3D 1<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if done =3D=3D 3:<b=
r>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 loop.quit()<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 def t1_func():<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remote.HelloWorld(1=
, callback=3Dcallback, callback_args=3D(1,))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remote.HelloWorld(2=
, callback=3Dcallback, callback_args=3D(2,))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&quot;sync: &=
quot; + remote.HelloWorld(3))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remote.HelloWorld(4=
, callback=3Dcallback, callback_args=3D(4,))<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 t1 =3D Thread(None, t1_func)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 t1.daemon =3D True<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 def handle_timeout():<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&quot;ERROR: =
Timeout.&quot;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.exit(1)<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 GLib.timeout_add_seconds(2, handle_timeout)<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 t1.start()<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 loop.run()<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 t1.join()<br>
&gt; +diff --git a/tests/run.sh b/tests/run.sh<br>
&gt; +index 8d93644..271c58a 100755<br>
&gt; +--- a/tests/run.sh<br>
&gt; ++++ b/tests/run.sh<br>
&gt; +@@ -15,4 +15,5 @@ then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;$PYTHON&quot; $TESTS_DIR/publish.py<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;$PYTHON&quot; $TESTS_DIR/publish_pro=
perties.py<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;$PYTHON&quot; $TESTS_DIR/publish_mul=
tiface.py<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 &quot;$PYTHON&quot; $TESTS_DIR/publish_async.py=
<br>
&gt; + fi<br>
&gt; +--<br>
&gt; +2.13.5<br>
&gt; diff --git a/meta-python/recipes-devtools/python/python3-pydbus/0003-S=
upport-transformation-between-D-Bus-errors-and-exce.patch b/meta-python/rec=
ipes-devtools/python/python3-pydbus/0003-Support-transformation-between-D-B=
us-errors-and-exce.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..1d45470f0<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-python/recipes-devtools/python/python3-pydbus/0003-Support-=
transformation-between-D-Bus-errors-and-exce.patch<br>
&gt; @@ -0,0 +1,493 @@<br>
&gt; +From 773858e1afd21cdf3ceef2cd35509f0b4882bf16 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Vendula Poncova &lt;<a href=3D"mailto:vponcova@redhat.com" targ=
et=3D"_blank" rel=3D"noreferrer">vponcova@redhat.com</a>&gt;<br>
&gt; +Date: Tue, 1 Aug 2017 16:54:24 +0200<br>
&gt; +Subject: [PATCH 3/3] Support transformation between D-Bus errors and<=
br>
&gt; + exceptions.<br>
&gt; +<br>
&gt; +Exceptions can be registered with decorators, raised in a remote<br>
&gt; +method and recreated after return from the remote call.<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://src.fedoraproject.org/c=
git/rpms/python-pydbus.git/" rel=3D"noreferrer noreferrer" target=3D"_blank=
">https://src.fedoraproject.org/cgit/rpms/python-pydbus.git/</a>]<br>
&gt; +<br>
&gt; +Signed-off-by: Derek Straka &lt;<a href=3D"mailto:derek@asterius.io" =
target=3D"_blank" rel=3D"noreferrer">derek@asterius.io</a>&gt;<br>
&gt; +---<br>
&gt; + doc/tutorial.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 47 ++++++++++++++=
++++<br>
&gt; + pydbus/error.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 97 ++++++++++++++=
++++++++++++++++++++++<br>
&gt; + pydbus/proxy_method.py |=C2=A0 18 +++++--<br>
&gt; + pydbus/registration.py |=C2=A0 16 ++++--<br>
&gt; + tests/error.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 67 +++++++++=
++++++++++++++++<br>
&gt; + tests/publish_error.py | 132 +++++++++++++++++++++++++++++++++++++++=
++++++++++<br>
&gt; + tests/run.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02=
 +<br>
&gt; + 7 files changed, 371 insertions(+), 8 deletions(-)<br>
&gt; + create mode 100644 pydbus/error.py<br>
&gt; + create mode 100644 tests/error.py<br>
&gt; + create mode 100644 tests/publish_error.py<br>
&gt; +<br>
&gt; +diff --git a/doc/tutorial.rst b/doc/tutorial.rst<br>
&gt; +index b8479cf..7fe55e1 100644<br>
&gt; +--- a/doc/tutorial.rst<br>
&gt; ++++ b/doc/tutorial.rst<br>
&gt; +@@ -341,6 +341,53 @@ See ``help(bus.request_name)`` and ``help(bus.re=
gister_object)`` for details.<br>
&gt; +<br>
&gt; + .. -----------------------------------------------------------------=
---<br>
&gt; +<br>
&gt; ++Error handling<br>
&gt; ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ++<br>
&gt; ++You can map D-Bus errors to your exception classes for better error =
handling.<br>
&gt; ++To handle D-Bus errors, use the ``@map_error`` decorator::<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 from pydbus.error import map_error<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 @map_error(&quot;org.freedesktop.DBus.Error.InvalidArg=
s&quot;)<br>
&gt; ++=C2=A0 =C2=A0 class InvalidArgsException(Exception):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 try:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ...<br>
&gt; ++=C2=A0 =C2=A0 catch InvalidArgsException as e:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 print(e)<br>
&gt; ++<br>
&gt; ++To register new D-Bus errors, use the ``@register_error`` decorator:=
:<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 from pydbus.error import register_error<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 @map_error(&quot;net.lew21.pydbus.TutorialExample.MyEr=
ror&quot;, MY_DOMAIN, MY_EXCEPTION_CODE)<br>
&gt; ++=C2=A0 =C2=A0 class MyException(Exception):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; ++<br>
&gt; ++Then you can raise ``MyException`` from the D-Bus method of the remo=
te object::<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 def Method():<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise MyException(&quot;Message&quot;)<b=
r>
&gt; ++<br>
&gt; ++And catch the same exception on the client side::<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 try:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 proxy.Method()<br>
&gt; ++=C2=A0 =C2=A0 catch MyException as e:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 print(e)<br>
&gt; ++<br>
&gt; ++To handle all unknown D-Bus errors, use the ``@map_by_default`` deco=
rator to specify the default exception::<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 from pydbus.error import map_by_default<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 @map_by_default<br>
&gt; ++=C2=A0 =C2=A0 class DefaultException(Exception):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; ++<br>
&gt; ++.. -----------------------------------------------------------------=
---<br>
&gt; ++<br>
&gt; + Data types<br>
&gt; + =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +<br>
&gt; +diff --git a/pydbus/error.py b/pydbus/error.py<br>
&gt; +new file mode 100644<br>
&gt; +index 0000000..aaa3510<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/pydbus/error.py<br>
&gt; +@@ -0,0 +1,97 @@<br>
&gt; ++from gi.repository import GLib, Gio<br>
&gt; ++<br>
&gt; ++<br>
&gt; ++def register_error(name, domain, code):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Register and map decorated ex=
ception class to a DBus error.&quot;&quot;&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 def decorated(cls):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_registration.=
register_error(cls, name, domain, code)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return cls<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return decorated<br>
&gt; ++<br>
&gt; ++<br>
&gt; ++def map_error(error_name):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Map decorated exception class=
 to a DBus error.&quot;&quot;&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 def decorated(cls):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_registration.=
map_error(cls, error_name)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return cls<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return decorated<br>
&gt; ++<br>
&gt; ++<br>
&gt; ++def map_by_default(cls):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Map decorated exception class=
 to all unknown DBus errors.&quot;&quot;&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 error_registration.map_by_default(cls)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return cls<br>
&gt; ++<br>
&gt; ++<br>
&gt; ++class ErrorRegistration(object):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Class for mapping exceptions =
to DBus errors.&quot;&quot;&quot;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 _default =3D None<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 _map =3D dict()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 _reversed_map =3D dict()<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 def map_by_default(self, exception_cls):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;S=
et the exception class as a default.&quot;&quot;&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._default =3D e=
xception_cls<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 def map_error(self, exception_cls, name):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;M=
ap the exception class to a DBus name.&quot;&quot;&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._map[name] =3D=
 exception_cls<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._reversed_map[=
exception_cls] =3D name<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 def register_error(self, exception_cls, name, d=
omain, code):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;M=
ap and register the exception class to a DBus name.&quot;&quot;&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.map_error(exce=
ption_cls, name)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return Gio.DBusErro=
r.register_error(domain, code, name)<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 def is_registered_exception(self, obj):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;I=
s the exception registered?&quot;&quot;&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return obj.__class_=
_ in self._reversed_map<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 def get_dbus_name(self, obj):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;G=
et the DBus name of the exception.&quot;&quot;&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return self._revers=
ed_map.get(obj.__class__)<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 def get_exception_class(self, name):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;G=
et the exception class mapped to the DBus name.&quot;&quot;&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return self._map.ge=
t(name, self._default)<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 def transform_message(self, name, message):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;T=
ransform the message of the exception.&quot;&quot;&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prefix =3D &quot;{}=
:{}: &quot;.format(&quot;GDBus.Error&quot;, name)<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if message.startswi=
th(prefix):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return message[len(prefix):]<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return message<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 def transform_exception(self, e):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;T=
ransform the remote error to the exception.&quot;&quot;&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not isinstance(e=
, GLib.Error):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return e<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not Gio.DBusErro=
r.is_remote_error(e):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return e<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Get DBus name of =
the error.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D Gio.DBusEr=
ror.get_remote_error(e)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Get the exception=
 class.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exception_cls =3D s=
elf.get_exception_class(name)<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Return the origin=
al exception.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not exception_cl=
s:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return e<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Return new except=
ion.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 message =3D self.tr=
ansform_message(name, e.message)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exception =3D excep=
tion_cls(message)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exception.dbus_name=
 =3D name<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exception.dbus_doma=
in =3D e.domain<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exception.dbus_code=
 =3D e.code<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return exception<br=
>
&gt; ++<br>
&gt; ++<br>
&gt; ++# Default error registration.<br>
&gt; ++error_registration =3D ErrorRegistration()<br>
&gt; +diff --git a/pydbus/proxy_method.py b/pydbus/proxy_method.py<br>
&gt; +index 442fe07..a73f9eb 100644<br>
&gt; +--- a/pydbus/proxy_method.py<br>
&gt; ++++ b/pydbus/proxy_method.py<br>
&gt; +@@ -2,6 +2,7 @@ from gi.repository import GLib<br>
&gt; + from .generic import bound_method<br>
&gt; + from .identifier import filter_identifier<br>
&gt; + from .timeout import timeout_to_glib<br>
&gt; ++from .error import error_registration<br>
&gt; +<br>
&gt; + try:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0from inspect import Signature, Parameter<b=
r>
&gt; +@@ -87,9 +88,20 @@ class ProxyMethod(object):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0call_args +=3D (self._finish_async_call, (callback, callback_=
args))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0instance._bus.con.call(*call_args)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return None<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ret =3D instance._bus.con.call_sync(*call_args)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return self._unpack_return(ret)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 result =3D None<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 error =3D None<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 try:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D instance._bus.con.call_sy=
nc(*call_args)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 except Exception as e:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error =3D error_registration.transfo=
rm_exception(e)<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if error:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise error<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return self._unpack_return(result)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0def _unpack_return(self, values):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D values=
.unpack()<br>
&gt; +@@ -108,7 +120,7 @@ class ProxyMethod(object):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0ret =3D source.call_finish(result)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return_args =3D self._unpack_return(ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except Excepti=
on as err:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 error =3D err<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 error =3D error_registration.transform_exception(err)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0callback, call=
back_args =3D user_data<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0callback(*call=
back_args, returned=3Dreturn_args, error=3Derror)<br>
&gt; +diff --git a/pydbus/registration.py b/pydbus/registration.py<br>
&gt; +index f531539..1d2cbcb 100644<br>
&gt; +--- a/pydbus/registration.py<br>
&gt; ++++ b/pydbus/registration.py<br>
&gt; +@@ -5,6 +5,7 @@ from . import generic<br>
&gt; + from .exitable import ExitableWithAliases<br>
&gt; + from functools import partial<br>
&gt; + from .method_call_context import MethodCallContext<br>
&gt; ++from .error import error_registration<br>
&gt; + import logging<br>
&gt; +<br>
&gt; + try:<br>
&gt; +@@ -91,11 +92,16 @@ class ObjectWrapper(ExitableWithAliases(&quot;unw=
rap&quot;)):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0logger =3D logging.getLogger(__name__)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0logger.exception(&quot;Exception while handling %s.%s()&quot;=
, interface_name, method_name)<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 #TODO Think of a better way to translate Python exception types =
to DBus error types.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 e_type =3D type(e).__name__<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if not &quot;.&quot; in e_type:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e_type =3D &quot;unknown.&quot; + e_=
type<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 invocation.return_dbus_error(e_type, str(e))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if error_registration.is_registered_exception(e):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D error_registration.get_dbus=
_name(e)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 invocation.return_dbus_error(name, s=
tr(e))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 else:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logger.info" rel=
=3D"noreferrer noreferrer" target=3D"_blank">logger.info</a>(&quot;name is =
not registered&quot;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e_type =3D type(e).__name__<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not &quot;.&quot; in e_type:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e_type =
=3D &quot;unknown.&quot; + e_type<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 invocation.return_dbus_error(e_type,=
 str(e))<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0def Get(self, interface_name, property_nam=
e):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0type =3D self.=
readable_properties[interface_name + &quot;.&quot; + property_name]<br>
&gt; +diff --git a/tests/error.py b/tests/error.py<br>
&gt; +new file mode 100644<br>
&gt; +index 0000000..3ec507d<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/tests/error.py<br>
&gt; +@@ -0,0 +1,67 @@<br>
&gt; ++from pydbus.error import ErrorRegistration<br>
&gt; ++<br>
&gt; ++<br>
&gt; ++class ExceptionA(Exception):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; ++<br>
&gt; ++<br>
&gt; ++class ExceptionB(Exception):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; ++<br>
&gt; ++<br>
&gt; ++class ExceptionC(Exception):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; ++<br>
&gt; ++<br>
&gt; ++class ExceptionD(Exception):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; ++<br>
&gt; ++<br>
&gt; ++class ExceptionE(Exception):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; ++<br>
&gt; ++<br>
&gt; ++def test_error_mapping():<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 r =3D ErrorRegistration()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 r.map_error(ExceptionA, &quot;net.lew21.pydbus.=
tests.ErrorA&quot;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 r.map_error(ExceptionB, &quot;net.lew21.pydbus.=
tests.ErrorB&quot;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 r.map_error(ExceptionC, &quot;net.lew21.pydbus.=
tests.ErrorC&quot;)<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 assert r.is_registered_exception(ExceptionA(&qu=
ot;Test&quot;))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 assert r.is_registered_exception(ExceptionB(&qu=
ot;Test&quot;))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 assert r.is_registered_exception(ExceptionC(&qu=
ot;Test&quot;))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 assert not r.is_registered_exception(ExceptionD=
(&quot;Test&quot;))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 assert not r.is_registered_exception(ExceptionE=
(&quot;Test&quot;))<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 assert r.get_dbus_name(ExceptionA(&quot;Test&qu=
ot;)) =3D=3D &quot;net.lew21.pydbus.tests.ErrorA&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 assert r.get_dbus_name(ExceptionB(&quot;Test&qu=
ot;)) =3D=3D &quot;net.lew21.pydbus.tests.ErrorB&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 assert r.get_dbus_name(ExceptionC(&quot;Test&qu=
ot;)) =3D=3D &quot;net.lew21.pydbus.tests.ErrorC&quot;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 assert r.get_exception_class(&quot;net.lew21.py=
dbus.tests.ErrorA&quot;) =3D=3D ExceptionA<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 assert r.get_exception_class(&quot;net.lew21.py=
dbus.tests.ErrorB&quot;) =3D=3D ExceptionB<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 assert r.get_exception_class(&quot;net.lew21.py=
dbus.tests.ErrorC&quot;) =3D=3D ExceptionC<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 assert r.get_exception_class(&quot;net.lew21.py=
dbus.tests.ErrorD&quot;) is None<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 assert r.get_exception_class(&quot;net.lew21.py=
dbus.tests.ErrorE&quot;) is None<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 r.map_by_default(ExceptionD)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 assert not r.is_registered_exception(ExceptionD=
(&quot;Test&quot;))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 assert r.get_exception_class(&quot;net.lew21.py=
dbus.tests.ErrorD&quot;) =3D=3D ExceptionD<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 assert r.get_exception_class(&quot;net.lew21.py=
dbus.tests.ErrorE&quot;) =3D=3D ExceptionD<br>
&gt; ++<br>
&gt; ++<br>
&gt; ++def test_transform_message():<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 r =3D ErrorRegistration()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 n1 =3D &quot;net.lew21.pydbus.tests.ErrorA&quot=
;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 m1 =3D &quot;GDBus.Error:net.lew21.pydbus.tests=
.ErrorA: Message1&quot;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 n2 =3D &quot;net.lew21.pydbus.tests.ErrorB&quot=
;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 m2 =3D &quot;GDBus.Error:net.lew21.pydbus.tests=
.ErrorB: Message2&quot;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 assert r.transform_message(n1, m1) =3D=3D &quot=
;Message1&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 assert r.transform_message(n2, m2) =3D=3D &quot=
;Message2&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 assert r.transform_message(n1, m2) =3D=3D m2<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 assert r.transform_message(n2, m1) =3D=3D m1<br=
>
&gt; ++<br>
&gt; ++<br>
&gt; ++test_error_mapping()<br>
&gt; ++test_transform_message()<br>
&gt; +diff --git a/tests/publish_error.py b/tests/publish_error.py<br>
&gt; +new file mode 100644<br>
&gt; +index 0000000..aa8a18a<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/tests/publish_error.py<br>
&gt; +@@ -0,0 +1,132 @@<br>
&gt; ++import sys<br>
&gt; ++from threading import Thread<br>
&gt; ++from gi.repository import GLib, Gio<br>
&gt; ++from pydbus import SessionBus<br>
&gt; ++from pydbus.error import register_error, map_error, map_by_default, =
error_registration<br>
&gt; ++<br>
&gt; ++import logging<br>
&gt; ++logger =3D logging.getLogger(&#39;pydbus.registration&#39;)<br>
&gt; ++logger.disabled =3D True<br>
&gt; ++<br>
&gt; ++loop =3D GLib.MainLoop()<br>
&gt; ++DOMAIN =3D Gio.DBusError.quark()=C2=A0 # TODO: Register new domain.<=
br>
&gt; ++<br>
&gt; ++<br>
&gt; ++@register_error(&quot;net.lew21.pydbus.tests.ErrorA&quot;, DOMAIN, 1=
000)<br>
&gt; ++class ExceptionA(Exception):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; ++<br>
&gt; ++<br>
&gt; ++@register_error(&quot;net.lew21.pydbus.tests.ErrorB&quot;, DOMAIN, 2=
000)<br>
&gt; ++class ExceptionB(Exception):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; ++<br>
&gt; ++<br>
&gt; ++@map_error(&quot;org.freedesktop.DBus.Error.InvalidArgs&quot;)<br>
&gt; ++class ExceptionC(Exception):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; ++<br>
&gt; ++<br>
&gt; ++@map_by_default<br>
&gt; ++class ExceptionD(Exception):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; ++<br>
&gt; ++<br>
&gt; ++class ExceptionE(Exception):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; ++<br>
&gt; ++<br>
&gt; ++class TestObject(object):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 &#39;&#39;&#39;<br>
&gt; ++&lt;node&gt;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 &lt;interface name=3D&#39;net.lew21.pydbus.test=
s.TestInterface&#39;&gt;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;method name=3D&=
#39;RaiseA&#39;&gt;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &lt;arg type=3D&#39;s&#39; name=3D&#39;msg&#39; direction=3D&#39=
;in&#39;/&gt;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/method&gt;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;method name=3D&=
#39;RaiseB&#39;&gt;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &lt;arg type=3D&#39;s&#39; name=3D&#39;msg&#39; direction=3D&#39=
;in&#39;/&gt;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/method&gt;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;method name=3D&=
#39;RaiseD&#39;&gt;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &lt;arg type=3D&#39;s&#39; name=3D&#39;msg&#39; direction=3D&#39=
;in&#39;/&gt;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/method&gt;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;method name=3D&=
#39;RaiseE&#39;&gt;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &lt;arg type=3D&#39;s&#39; name=3D&#39;msg&#39; direction=3D&#39=
;in&#39;/&gt;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/method&gt;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 &lt;/interface&gt;<br>
&gt; ++&lt;/node&gt;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 &#39;&#39;&#39;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 def RaiseA(self, msg):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise ExceptionA(ms=
g)<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 def RaiseB(self, msg):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise ExceptionB(ms=
g)<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 def RaiseD(self, msg):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise ExceptionD(ms=
g)<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 def RaiseE(self, msg):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise ExceptionE(ms=
g)<br>
&gt; ++<br>
&gt; ++bus =3D SessionBus()<br>
&gt; ++<br>
&gt; ++with bus.publish(&quot;net.lew21.pydbus.tests.Test&quot;, TestObject=
()):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 remote =3D bus.get(&quot;net.lew21.pydbus.tests=
.Test&quot;)<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 def t_func():<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Test new register=
ed errors.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 remote.RaiseA(&quot;Test A&quot;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except ExceptionA a=
s e:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 assert str(e) =3D=3D &quot;Test A&quot;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 remote.RaiseB(&quot;Test B&quot;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except ExceptionB a=
s e:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 assert str(e) =3D=3D &quot;Test B&quot;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Test mapped error=
s.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 remote.Get(&quot;net.lew21.pydbus.tests.TestInterface&quot;, &qu=
ot;Foo&quot;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except ExceptionC a=
s e:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 assert str(e) =3D=3D &quot;No such property &#39;Foo&#39;&quot;<=
br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Test default erro=
rs.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 remote.RaiseD(&quot;Test D&quot;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except ExceptionD a=
s e:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 assert str(e) =3D=3D &quot;Test D&quot;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 remote.RaiseE(&quot;Test E&quot;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except ExceptionD a=
s e:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 assert str(e) =3D=3D &quot;Test E&quot;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Test with no defa=
ult errors.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_registration.=
map_by_default(None)<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 remote.RaiseD(&quot;Test D&quot;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except Exception as=
 e:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 assert not isinstance(e, ExceptionD)<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 remote.RaiseE(&quot;Test E&quot;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except Exception as=
 e:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 assert not isinstance(e, ExceptionD)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 assert not isinstance(e, ExceptionE)<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 loop.quit()<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 t =3D Thread(None, t_func)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 t.daemon =3D True<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 def handle_timeout():<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&quot;ERROR: =
Timeout.&quot;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.exit(1)<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 GLib.timeout_add_seconds(4, handle_timeout)<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 t.start()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 loop.run()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 t.join()<br>
&gt; +diff --git a/tests/run.sh b/tests/run.sh<br>
&gt; +index 271c58a..a08baf8 100755<br>
&gt; +--- a/tests/run.sh<br>
&gt; ++++ b/tests/run.sh<br>
&gt; +@@ -10,10 +10,11 @@ PYTHON=3D${1:-python}<br>
&gt; +<br>
&gt; + &quot;$PYTHON&quot; $TESTS_DIR/context.py<br>
&gt; + &quot;$PYTHON&quot; $TESTS_DIR/identifier.py<br>
&gt; ++&quot;$PYTHON&quot; $TESTS_DIR/error.py<br>
&gt; + if [ &quot;$2&quot; !=3D &quot;dontpublish&quot; ]<br>
&gt; + then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;$PYTHON&quot; $TESTS_DIR/publish.py<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;$PYTHON&quot; $TESTS_DIR/publish_pro=
perties.py<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;$PYTHON&quot; $TESTS_DIR/publish_mul=
tiface.py<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;$PYTHON&quot; $TESTS_DIR/publish_asy=
nc.py<br>
&gt; + fi<br>
&gt; +--<br>
&gt; +2.13.5<br>
&gt; diff --git a/meta-python/recipes-devtools/python/python3-pydbus/run-pt=
est b/meta-python/recipes-devtools/python/python3-pydbus/run-ptest<br>
&gt; new file mode 100644<br>
&gt; index 000000000..782ceed3b<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-python/recipes-devtools/python/python3-pydbus/run-ptest<br>
&gt; @@ -0,0 +1,15 @@<br>
&gt; +#!/bin/sh<br>
&gt; +<br>
&gt; +for case in `find tests -type f -name &#39;*.sh&#39;`; do<br>
&gt; +=C2=A0 =C2=A0 bash $case python3 &gt;$case.output 2&gt;&amp;1<br>
&gt; +=C2=A0 =C2=A0 ret=3D$?<br>
&gt; +=C2=A0 =C2=A0 if [ $ret -ne 0 ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cat $case.output<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;FAIL: ${case}&quot;<br>
&gt; +=C2=A0 =C2=A0 elif grep -i &#39;SKIP&#39; $case.output; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;SKIP: ${case}&quot;<br>
&gt; +=C2=A0 =C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;PASS: ${case}&quot;<br>
&gt; +=C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 rm -f $case.output<br>
&gt; +done<br>
&gt; \ No newline at end of file<br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-pydbus_0.6.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">pytho=
n3-pydbus_0.6.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-pydbus_0.6.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank=
">python3-pydbus_0.6.0.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 000000000..ac9b8e8ab<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-py=
dbus_0.6.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3-pydb=
us_0.6.0.bb</a><br>
&gt; @@ -0,0 +1,26 @@<br>
&gt; +DESCRIPTION =3D &quot;Pythonic DBus library&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://pypi.python.org/pypi/pydbus/" r=
el=3D"noreferrer noreferrer" target=3D"_blank">https://pypi.python.org/pypi=
/pydbus/</a>&quot;<br>
&gt; +LICENSE =3D &quot;LGPL-2.1-only&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Da916467b91076e631dd8e=
db7424769c7&quot;<br>
&gt; +<br>
&gt; +SRCREV =3D &quot;f2e6355a88351e7d644ccb2b4d67b19305507312&quot;<br>
&gt; +SRC_URI =3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 git://<a href=3D"http://github.com/LEW21/pydbus.git;pro=
tocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">github.com/LEW21/pydbus.git;protocol=3Dhttps;branch=3Dmaster</a> \<br>
&gt; +=C2=A0 =C2=A0 file://0001-make-direction-attribute-conforming-to-intr=
ospect.dt.patch \<br>
&gt; +=C2=A0 =C2=A0 file://0002-Support-asynchronous-calls-58.patch \<br>
&gt; +=C2=A0 =C2=A0 file://0003-Support-transformation-between-D-Bus-errors=
-and-exce.patch \<br>
&gt; +=C2=A0 =C2=A0 file://run-ptest \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +inherit ptest setuptools3<br>
&gt; +<br>
&gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; +<br>
&gt; +RDEPENDS:${PN} =3D &quot;${PYTHON_PN}-pygobject \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTH=
ON_PN}-io \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTH=
ON_PN}-logging&quot;<br>
&gt; +<br>
&gt; +do_install_ptest() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/tests<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tes=
ts/<br>
&gt; +}<br>
&gt; \ No newline at end of file<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#109506): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/109506" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-devel/message/109=
506</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10507535=
2/1686489" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.op=
enembedded.org/mt/105075352/1686489</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+owner@l=
ists.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.=
openembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:alex.kan=
avin@gmail.com" target=3D"_blank" rel=3D"noreferrer">alex.kanavin@gmail.com=
</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--000000000000be8b3a06143ab945--

