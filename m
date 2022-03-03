Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F247FC433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 22:39:28 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.662.1646347167560262278
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 14:39:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JfVhoUKS;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: ticotimo@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id r13so13757325ejd.5
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 14:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d2bDgLK1v7ZqA+SAdYRUj9rslgnLjRXqpHpBUS5S8pw=;
        b=JfVhoUKSNaG8qSRpVThTwV61rKCKJK3UE2NkcaeH2FOi6QWPUeYDQT2FX0bDG1uq0K
         ZqB9JkDxv3d/nJ83M2TKH0Y9D5/CVir2h43sEsFVCCAgfI1FPTPTCHob+HG5zCq0qpvs
         EaNcjMs60l30uqKFI0eovCdRF0JNrLzlZJ6rnFp62mYcFOQZHuGnpvjwolhUkDiz8FCY
         kuCrs2Ra/Wa7WlQ2RtGQ1s8wOs4Lc+1MZWApkjltqqZtYe6tH6poePVeKCQpLiqi1uRz
         3dtXHIz6vd8JnXIg2A7nvW0toeMaxnV4KZJTj3FICsnZIyeJDrN/MRi74a+/g6vye3w3
         tZ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d2bDgLK1v7ZqA+SAdYRUj9rslgnLjRXqpHpBUS5S8pw=;
        b=TmA/p7h+SLitacGxcRwJVLJEUzOEY5kVek6y6wJGsI7JU4RWX+P70V/2/4WRMVNjhV
         b7NQ1kYE5msYWnaTM7eu2k44lCHiIWnOo4986jnxnxrb+YJk9FHM/TjptXRUqfbiYyqb
         BdgmZAwWUJyltJnWsGTeCXMo0nzKNX8P19KRZBtTwMWQ6sQxatEuH2tigv6lFZT3PSWE
         PS/HE43Q81ggQswsS/seetMuE2AllgiwRuYav00sy0FjA/tVLP/erJFOeUqOFEmrP5xr
         N0EpPx/vgbDWmg7c5R4Q69OWebQL2jJZH5mHlVBmiV8lbY8LC1IbsHl8JDP06cEU75xF
         mB1A==
X-Gm-Message-State: AOAM530XOQ4uDX++uduS94zo0CbZ667ZrnLeX4DLYFOna8fAKx8+u6Se
	+y5mPDfC+NtWujIE8tzphf20JnCfIohbVBPEung=
X-Google-Smtp-Source: 
 ABdhPJzGkulDGhopqIxqXaOrzd1PbxzzmZgK8kb58IamyTLC6Gjgqa7wn0Hfrqw6wJ+M/wZ7eMdTfyRQbEeoA0PKjvI=
X-Received: by 2002:a17:906:154c:b0:6ce:21d7:2826 with SMTP id
 c12-20020a170906154c00b006ce21d72826mr29165256ejd.9.1646347165704; Thu, 03
 Mar 2022 14:39:25 -0800 (PST)
MIME-Version: 1.0
References: <20220303065954.909740-1-raj.khem@gmail.com>
In-Reply-To: <20220303065954.909740-1-raj.khem@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 3 Mar 2022 14:39:14 -0800
Message-ID: 
 <CANx9H-BZGJUKYqPAsv-9tvm7vu=_m2=Oz0DPMoST0aGjekmNtg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-slip-dbus: Fix build with wheel
 packaging
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fd273005d95811f0"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Mar 2022 22:39:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95765

--000000000000fd273005d95811f0
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 2, 2022 at 10:59 PM Khem Raj <raj.khem@gmail.com> wrote:

> Migrate to use setuptools instead of distutils
> merge slip.dbus into slip module since we use
> slip.dbus, it works fine for OE
>

Nice solution. Thank you for this and all the other recipes you have fixed.

>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...-Use-setuptools-instead-of-distutils.patch | 38 ++++++++++
>  ...9c0b534c1b7958fa0a3c7aedf30bca910431.patch | 76 +++++++++++++++++++
>  .../python/python3-slip-dbus_0.6.5.bb         | 11 ++-
>  3 files changed, 121 insertions(+), 4 deletions(-)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-slip-dbus/0001-setup.py-Use-setuptools-instead-of-distutils.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-slip-dbus/9b939c0b534c1b7958fa0a3c7aedf30bca910431.patch
>
> diff --git
> a/meta-python/recipes-devtools/python/python3-slip-dbus/0001-setup.py-Use-setuptools-instead-of-distutils.patch
> b/meta-python/recipes-devtools/python/python3-slip-dbus/0001-setup.py-Use-setuptools-instead-of-distutils.patch
> new file mode 100644
> index 0000000000..1208769b2f
> --- /dev/null
> +++
> b/meta-python/recipes-devtools/python/python3-slip-dbus/0001-setup.py-Use-setuptools-instead-of-distutils.patch
> @@ -0,0 +1,38 @@
> +From 4309ce76351b1685d08b3ba55d4f62b3e53ef76b Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Tue, 1 Mar 2022 19:06:35 -0800
> +Subject: [PATCH] setup.py: Use setuptools instead of distutils
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + setup.py.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +--- a/setup.py.in
> ++++ b/setup.py.in
> +@@ -2,20 +2,17 @@
> + # -*- coding: utf-8 -*-
> +
> + import sys
> +-from distutils.core import setup
> ++from setuptools import setup, find_packages
> +
> + setup(name="slip", version="@VERSION@",
> +         py_modules=["slip.__init__", "slip.util.__init__",
> +             "slip.util.hookable", "slip.util.files",
> +-            "slip._wrappers.__init__", "slip._wrappers._glib"],
> +-        requires=["selinux"])
> +-
> +-setup(name="slip.dbus", version="@VERSION@",
> +-        py_modules=["slip.dbus.__init__", "slip.dbus.bus",
> ++            "slip._wrappers.__init__", "slip._wrappers._glib",
> ++            "slip.dbus.__init__", "slip.dbus.bus",
> +             "slip.dbus.constants", "slip.dbus.introspection",
> +             "slip.dbus.mainloop", "slip.dbus.polkit",
> "slip.dbus.proxies",
> +             "slip.dbus.service"],
> +-        requires=["dbus", "decorator", "StringIO",
> "xml.etree.ElementTree"])
> ++      requires=["dbus", "decorator", "selinux", "StringIO",
> "xml.etree.ElementTree"])
> +
> + if sys.version_info.major == 2:
> +     setup(name="slip.gtk", version="@VERSION@",
> diff --git
> a/meta-python/recipes-devtools/python/python3-slip-dbus/9b939c0b534c1b7958fa0a3c7aedf30bca910431.patch
> b/meta-python/recipes-devtools/python/python3-slip-dbus/9b939c0b534c1b7958fa0a3c7aedf30bca910431.patch
> new file mode 100644
> index 0000000000..b0e9d2215f
> --- /dev/null
> +++
> b/meta-python/recipes-devtools/python/python3-slip-dbus/9b939c0b534c1b7958fa0a3c7aedf30bca910431.patch
> @@ -0,0 +1,76 @@
> +From 9b939c0b534c1b7958fa0a3c7aedf30bca910431 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Miro=20Hron=C4=8Dok?= <miro@hroncok.cz>
> +Date: Mon, 7 Jun 2021 23:23:47 +0200
> +Subject: [PATCH] Python 3.10+ fix: Use collections.abc.Callable instead of
> + collections.Callable
> +
> +The deprecated aliases to Collections Abstract Base Classes were removed
> from
> +the collections module in Python 3.10.
> +
> https://docs.python.org/3.10/whatsnew/changelog.html#python-3-10-0-alpha-5
> +https://bugs.python.org/issue37324
> +---
> + slip/dbus/polkit.py   | 6 +++---
> + slip/util/hookable.py | 6 +++---
> + 2 files changed, 6 insertions(+), 6 deletions(-)
> +
> +diff --git a/slip/dbus/polkit.py b/slip/dbus/polkit.py
> +index 128e8ce..320676d 100644
> +--- a/slip/dbus/polkit.py
> ++++ b/slip/dbus/polkit.py
> +@@ -26,7 +26,7 @@
> +
> + from __future__ import absolute_import
> +
> +-import collections
> ++import collections.abc
> + import dbus
> + from decorator import decorator
> + from functools import reduce
> +@@ -103,14 +103,14 @@ class MyProxy(object):
> +             def some_method(self, ...):
> +                 ..."""
> +
> +-    assert(func is None or isinstance(func, collections.Callable))
> ++    assert(func is None or isinstance(func, collections.abc.Callable))
> +
> +     assert(
> +         authfail_result in (None, AUTHFAIL_DONTCATCH) or
> +         authfail_exception is None)
> +     assert(
> +         authfail_callback is None or
> +-        isinstance(authfail_callback, collections.Callable))
> ++        isinstance(authfail_callback, collections.abc.Callable))
> +     assert(
> +         authfail_exception is None or
> +         issubclass(authfail_exception, Exception))
> +diff --git a/slip/util/hookable.py b/slip/util/hookable.py
> +index 89c7392..0cd9967 100644
> +--- a/slip/util/hookable.py
> ++++ b/slip/util/hookable.py
> +@@ -23,7 +23,7 @@
> + """This module contains variants of certain base types which call
> registered
> + hooks on changes."""
> +
> +-import collections
> ++import collections.abc
> + from six import with_metaclass
> +
> + __all__ = ["Hookable", "HookableSet"]
> +@@ -67,7 +67,7 @@ class _HookEntry(object):
> +
> +     def __init__(self, hook, args, kwargs, hookable=None):
> +
> +-        assert(isinstance(hook, collections.Callable))
> ++        assert(isinstance(hook, collections.abc.Callable))
> +         assert(isinstance(hookable, Hookable))
> +
> +         for n, x in enumerate(args):
> +@@ -174,7 +174,7 @@ def add_hook_hookable(self, hook, *args, **kwargs):
> +         self.__add_hook(hook, self, *args, **kwargs)
> +
> +     def __add_hook(self, hook, _hookable, *args, **kwargs):
> +-        assert isinstance(hook, collections.Callable)
> ++        assert isinstance(hook, collections.abc.Callable)
> +         assert isinstance(_hookable, Hookable)
> +         hookentry = _HookEntry(hook, args, kwargs, hookable=_hookable)
> +         self.__hooks__.add(hookentry)
> diff --git a/meta-python/recipes-devtools/python/
> python3-slip-dbus_0.6.5.bb b/meta-python/recipes-devtools/python/
> python3-slip-dbus_0.6.5.bb
> index 00d83ab61b..57a9185289 100644
> --- a/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb
> @@ -14,12 +14,14 @@ LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
>  SRCNAME = "python-slip"
>
> -SRC_URI = "
> https://github.com/nphilipp/${SRCNAME}/releases/download/${SRCNAME}-${PV}/${SRCNAME}-${PV}.tar.bz2
> "
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -SRC_URI[md5sum] = "28ae5f93853466c44ec96706ba2a1eb4"
> +SRC_URI = "
> https://github.com/nphilipp/${SRCNAME}/releases/download/${SRCNAME}-${PV}/${SRCNAME}-${PV}.tar.bz2
> \
> +           file://9b939c0b534c1b7958fa0a3c7aedf30bca910431.patch \
> +           file://0001-setup.py-Use-setuptools-instead-of-distutils.patch
> \
> +          "
>  SRC_URI[sha256sum] =
> "c726c086f0dd93a0ac7a0176f383a12af91b6657b78a301e3f5b25d9f8d4d10b"
>
> +S = "${WORKDIR}/${SRCNAME}-${PV}"
> +
>  do_compile:prepend() {
>      sed -e 's/@VERSION@/${PV}/g' ${S}/setup.py.in > ${S}/setup.py
>  }
> @@ -32,3 +34,4 @@ RDEPENDS:${PN} += "\
>  CLEANBROKEN = "1"
>
>  inherit setuptools3
> +PIP_INSTALL_PACKAGE = "slip"
> --
> 2.35.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95729):
> https://lists.openembedded.org/g/openembedded-devel/message/95729
> Mute This Topic: https://lists.openembedded.org/mt/89520915/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000fd273005d95811f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Mar 2, 2022 at 10:59 PM Khem Raj &lt;<a href=3D"mai=
lto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">Migrate to use setuptools instead of distutils<br>
merge slip.dbus into slip module since we use<br>
slip.dbus, it works fine for OE<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Nice solution. T=
hank you for this and all the other recipes you have fixed.</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex"><br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0...-Use-setuptools-instead-of-distutils.patch | 38 ++++++++++<br>
=C2=A0...9c0b534c1b7958fa0a3c7aedf30bca910431.patch | 76 ++++++++++++++++++=
+<br>
=C2=A0.../python/<a href=3D"http://python3-slip-dbus_0.6.5.bb" rel=3D"noref=
errer" target=3D"_blank">python3-slip-dbus_0.6.5.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| 11 ++-<br>
=C2=A03 files changed, 121 insertions(+), 4 deletions(-)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-slip-d=
bus/0001-setup.py-Use-setuptools-instead-of-distutils.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-slip-d=
bus/9b939c0b534c1b7958fa0a3c7aedf30bca910431.patch<br>
<br>
diff --git a/meta-python/recipes-devtools/python/python3-slip-dbus/0001-set=
up.py-Use-setuptools-instead-of-distutils.patch b/meta-python/recipes-devto=
ols/python/python3-slip-dbus/0001-setup.py-Use-setuptools-instead-of-distut=
ils.patch<br>
new file mode 100644<br>
index 0000000000..1208769b2f<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/python3-slip-dbus/0001-setup.py-U=
se-setuptools-instead-of-distutils.patch<br>
@@ -0,0 +1,38 @@<br>
+From 4309ce76351b1685d08b3ba55d4f62b3e53ef76b Mon Sep 17 00:00:00 2001<br>
+From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
+Date: Tue, 1 Mar 2022 19:06:35 -0800<br>
+Subject: [PATCH] setup.py: Use setuptools instead of distutils<br>
+<br>
+Upstream-Status: Pending<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+---<br>
+ <a href=3D"http://setup.py.in" rel=3D"noreferrer" target=3D"_blank">setup=
.py.in</a> | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+--- a/<a href=3D"http://setup.py.in" rel=3D"noreferrer" target=3D"_blank">=
setup.py.in</a><br>
++++ b/<a href=3D"http://setup.py.in" rel=3D"noreferrer" target=3D"_blank">=
setup.py.in</a><br>
+@@ -2,20 +2,17 @@<br>
+ # -*- coding: utf-8 -*-<br>
+ <br>
+ import sys<br>
+-from distutils.core import setup<br>
++from setuptools import setup, find_packages<br>
+ <br>
+ setup(name=3D&quot;slip&quot;, version=3D&quot;@VERSION@&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0py_modules=3D[&quot;slip.__init__&quot;,=
 &quot;slip.util.__init__&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;slip.util.hookable&q=
uot;, &quot;slip.util.files&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;slip._wrappers.__init__&q=
uot;, &quot;slip._wrappers._glib&quot;],<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 requires=3D[&quot;selinux&quot;])<br>
+-<br>
+-setup(name=3D&quot;slip.dbus&quot;, version=3D&quot;@VERSION@&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 py_modules=3D[&quot;slip.dbus.__init__&quot;,=
 &quot;slip.dbus.bus&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;slip._wrappers.__init__&q=
uot;, &quot;slip._wrappers._glib&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;slip.dbus.__init__&quot;,=
 &quot;slip.dbus.bus&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;slip.dbus.constants&=
quot;, &quot;slip.dbus.introspection&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;slip.dbus.mainloop&q=
uot;, &quot;slip.dbus.polkit&quot;, &quot;slip.dbus.proxies&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;slip.dbus.service&qu=
ot;],<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 requires=3D[&quot;dbus&quot;, &quot;decorator=
&quot;, &quot;StringIO&quot;, &quot;xml.etree.ElementTree&quot;])<br>
++=C2=A0 =C2=A0 =C2=A0 requires=3D[&quot;dbus&quot;, &quot;decorator&quot;,=
 &quot;selinux&quot;, &quot;StringIO&quot;, &quot;xml.etree.ElementTree&quo=
t;])<br>
+ <br>
+ if sys.version_info.major =3D=3D 2:<br>
+=C2=A0 =C2=A0 =C2=A0setup(name=3D&quot;slip.gtk&quot;, version=3D&quot;@VE=
RSION@&quot;,<br>
diff --git a/meta-python/recipes-devtools/python/python3-slip-dbus/9b939c0b=
534c1b7958fa0a3c7aedf30bca910431.patch b/meta-python/recipes-devtools/pytho=
n/python3-slip-dbus/9b939c0b534c1b7958fa0a3c7aedf30bca910431.patch<br>
new file mode 100644<br>
index 0000000000..b0e9d2215f<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/python3-slip-dbus/9b939c0b534c1b7=
958fa0a3c7aedf30bca910431.patch<br>
@@ -0,0 +1,76 @@<br>
+From 9b939c0b534c1b7958fa0a3c7aedf30bca910431 Mon Sep 17 00:00:00 2001<br>
+From: =3D?UTF-8?q?Miro=3D20Hron=3DC4=3D8Dok?=3D &lt;<a href=3D"mailto:miro=
@hroncok.cz" target=3D"_blank">miro@hroncok.cz</a>&gt;<br>
+Date: Mon, 7 Jun 2021 23:23:47 +0200<br>
+Subject: [PATCH] Python 3.10+ fix: Use collections.abc.Callable instead of=
<br>
+ collections.Callable<br>
+<br>
+The deprecated aliases to Collections Abstract Base Classes were removed f=
rom<br>
+the collections module in Python 3.10.<br>
+<a href=3D"https://docs.python.org/3.10/whatsnew/changelog.html#python-3-1=
0-0-alpha-5" rel=3D"noreferrer" target=3D"_blank">https://docs.python.org/3=
.10/whatsnew/changelog.html#python-3-10-0-alpha-5</a><br>
+<a href=3D"https://bugs.python.org/issue37324" rel=3D"noreferrer" target=
=3D"_blank">https://bugs.python.org/issue37324</a><br>
+---<br>
+ slip/dbus/polkit.py=C2=A0 =C2=A0| 6 +++---<br>
+ slip/util/hookable.py | 6 +++---<br>
+ 2 files changed, 6 insertions(+), 6 deletions(-)<br>
+<br>
+diff --git a/slip/dbus/polkit.py b/slip/dbus/polkit.py<br>
+index 128e8ce..320676d 100644<br>
+--- a/slip/dbus/polkit.py<br>
++++ b/slip/dbus/polkit.py<br>
+@@ -26,7 +26,7 @@<br>
+ <br>
+ from __future__ import absolute_import<br>
+ <br>
+-import collections<br>
++import collections.abc<br>
+ import dbus<br>
+ from decorator import decorator<br>
+ from functools import reduce<br>
+@@ -103,14 +103,14 @@ class MyProxy(object):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0def some_method(self, ...)=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0...&quot;&qu=
ot;&quot;<br>
+ <br>
+-=C2=A0 =C2=A0 assert(func is None or isinstance(func, collections.Callabl=
e))<br>
++=C2=A0 =C2=A0 assert(func is None or isinstance(func, collections.abc.Cal=
lable))<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0assert(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0authfail_result in (None, AUTHFAIL_DONTC=
ATCH) or<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0authfail_exception is None)<br>
+=C2=A0 =C2=A0 =C2=A0assert(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0authfail_callback is None or<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 isinstance(authfail_callback, collections.Cal=
lable))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 isinstance(authfail_callback, collections.abc=
.Callable))<br>
+=C2=A0 =C2=A0 =C2=A0assert(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0authfail_exception is None or<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0issubclass(authfail_exception, Exception=
))<br>
+diff --git a/slip/util/hookable.py b/slip/util/hookable.py<br>
+index 89c7392..0cd9967 100644<br>
+--- a/slip/util/hookable.py<br>
++++ b/slip/util/hookable.py<br>
+@@ -23,7 +23,7 @@<br>
+ &quot;&quot;&quot;This module contains variants of certain base types whi=
ch call registered<br>
+ hooks on changes.&quot;&quot;&quot;<br>
+ <br>
+-import collections<br>
++import collections.abc<br>
+ from six import with_metaclass<br>
+ <br>
+ __all__ =3D [&quot;Hookable&quot;, &quot;HookableSet&quot;]<br>
+@@ -67,7 +67,7 @@ class _HookEntry(object):<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0def __init__(self, hook, args, kwargs, hookable=3DNone=
):<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(isinstance(hook, collections.Callable)=
)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(isinstance(hook, collections.abc.Calla=
ble))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(isinstance(hookable, Hookable))<b=
r>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for n, x in enumerate(args):<br>
+@@ -174,7 +174,7 @@ def add_hook_hookable(self, hook, *args, **kwargs):<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.__add_hook(hook, self, *args, **kwa=
rgs)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0def __add_hook(self, hook, _hookable, *args, **kwargs)=
:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert isinstance(hook, collections.Callable)=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert isinstance(hook, collections.abc.Calla=
ble)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert isinstance(_hookable, Hookable)<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hookentry =3D _HookEntry(hook, args, kwa=
rgs, hookable=3D_hookable)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.__hooks__.add(hookentry)<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
slip-dbus_0.6.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-slip-dbus_=
0.6.5.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python=
3-slip-dbus_0.6.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-slip-dbu=
s_0.6.5.bb</a><br>
index 00d83ab61b..57a9185289 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-slip-db=
us_0.6.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-slip-dbus_0.6.5.b=
b</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-slip-db=
us_0.6.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-slip-dbus_0.6.5.b=
b</a><br>
@@ -14,12 +14,14 @@ LICENSE =3D &quot;GPLv2+&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D5574c6965ae5f583e5588=
0e397fbb018&quot;<br>
=C2=A0SRCNAME =3D &quot;python-slip&quot;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"https://github.com/nphilipp/$%7BSRCNAME%7D/re=
leases/download/$%7BSRCNAME%7D-$%7BPV%7D/$%7BSRCNAME%7D-$%7BPV%7D.tar.bz2" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/nphilipp/${SRCNAME}=
/releases/download/${SRCNAME}-${PV}/${SRCNAME}-${PV}.tar.bz2</a>&quot;<br>
-S =3D &quot;${WORKDIR}/${SRCNAME}-${PV}&quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;28ae5f93853466c44ec96706ba2a1eb4&quot;<br>
+SRC_URI =3D &quot;<a href=3D"https://github.com/nphilipp/$%7BSRCNAME%7D/re=
leases/download/$%7BSRCNAME%7D-$%7BPV%7D/$%7BSRCNAME%7D-$%7BPV%7D.tar.bz2" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/nphilipp/${SRCNAME}=
/releases/download/${SRCNAME}-${PV}/${SRCNAME}-${PV}.tar.bz2</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://9b939c0b534c1b7958fa0a3c7a=
edf30bca910431.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-setup.py-Use-setuptoo=
ls-instead-of-distutils.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;c726c086f0dd93a0ac7a0176f383a12af91b6657=
b78a301e3f5b25d9f8d4d10b&quot;<br>
<br>
+S =3D &quot;${WORKDIR}/${SRCNAME}-${PV}&quot;<br>
+<br>
=C2=A0do_compile:prepend() {<br>
=C2=A0 =C2=A0 =C2=A0sed -e &#39;s/@VERSION@/${PV}/g&#39; ${S}/<a href=3D"ht=
tp://setup.py.in" rel=3D"noreferrer" target=3D"_blank">setup.py.in</a> &gt;=
 ${S}/setup.py<br>
=C2=A0}<br>
@@ -32,3 +34,4 @@ RDEPENDS:${PN} +=3D &quot;\<br>
=C2=A0CLEANBROKEN =3D &quot;1&quot;<br>
<br>
=C2=A0inherit setuptools3<br>
+PIP_INSTALL_PACKAGE =3D &quot;slip&quot;<br>
-- <br>
2.35.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#95729): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/95729" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/95729</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89520915/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
89520915/924729</a><br>
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

--000000000000fd273005d95811f0--

