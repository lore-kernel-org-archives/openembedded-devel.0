Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC2EDC433EF
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 03:57:43 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web09.2912.1653451056686103217
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 May 2022 20:57:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Zfz8pVWb;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id gk22so135705pjb.1
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 May 2022 20:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rr5cnHYssBiRvFyDXu2D++fBkin7ytQ8Tkj8kdsdJ7U=;
        b=Zfz8pVWb8o4imFg5VNR00ZCq/D9IABUTPEfw4RWL66lXVMM5mTA9UygDkzM6S1vjtK
         6ATiwfa9I5SazMu2h0WlwiALC9zRPrQEQawSFwzJ97plnFjXaZsAFUuL3/ttCsALdafx
         szvY2MF5BlDTBFTWC0A6UBBnsdCvADebn5Bjds8Mf3BBnLprd4RO8HXrxGSxCVrJbqPg
         mozGUGwPvGhWaiu6RS79Ti+7oROU78HY18tAVhPwnLPwF5xm8chIQmVGGxpogUbsS2g6
         +PpkDy4mlQc6gfP1NklZB7vf77jHS8K0g22wN/jdTfIsn2Sf4zYpC3hmibAnJApdUH0r
         IAOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rr5cnHYssBiRvFyDXu2D++fBkin7ytQ8Tkj8kdsdJ7U=;
        b=P+fCBEigpnFRJbXwoCHXiD7DMDdIevQohAgP8RUDxsvvDI6GTWwq/u0TOdJrChCOT+
         w+65zDXzf/OJWs1XH7AAwBlhVMwmJ39Org88ZJT16LG3beBPWmJeaNPreQenKXOyqecT
         aJ2E6iI+i3viI5KSrsIQxcvw1vBn4ar+5XkmdvQZ3qEeJAcMOSD7QC4jlawOgCqH3L0r
         UxLMUrzSToOZbpqMzAiPL4GBQ4Ds3h3vzCsepFK9Yn1draVN9ZCR4VBwrcsIqj6vw1om
         8Y5O28ztWkYedaQ5JcflqhxMscerJyqt9a40ceO26q75zZYyX9Jzm3e8eKqP9tYVQVwc
         D2cg==
X-Gm-Message-State: AOAM533Z3j12HeKqiUtFf78SVz38xJlJoUmRaaELioFHznd3IZICfhAD
	GxUSZoSNVBuvi/VtvkOS0G0P7rTqvj17qubSirA=
X-Google-Smtp-Source: 
 ABdhPJyoI2B9DPzgcLtn8mhU3OROEWH+lzMmZvMIJf2V3Gc/lJxEricq1JxodpB1yzA4U2/W2I3dApsg5q+W/GeZp/U=
X-Received: by 2002:a17:903:244f:b0:162:4daf:f8bb with SMTP id
 l15-20020a170903244f00b001624daff8bbmr4753825pls.20.1653451055849; Tue, 24
 May 2022 20:57:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220524194642.203911-1-brgl@bgdev.pl>
In-Reply-To: <20220524194642.203911-1-brgl@bgdev.pl>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 24 May 2022 20:57:24 -0700
Message-ID: 
 <CANx9H-Au-zd4U43t=zYLrFLZQ9HwbJy5teCk=t27pw3rjEZYZQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-uinput: new package
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d663d905dfce128f"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 May 2022 03:57:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97265

--000000000000d663d905dfce128f
Content-Type: text/plain; charset="UTF-8"

On Tue, May 24, 2022 at 12:46 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> Add a recipe for python3-uinput: a python module for controlling the
> virtual input devices on linux.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  .../packagegroups/packagegroup-meta-python.bb |  1 +
>  ...-use-setuptools-instead-of-distutils.patch | 28 +++++++++++++++++++
>  .../python/python3-uinput_0.11.2.bb           | 18 ++++++++++++
>  3 files changed, 47 insertions(+)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-uinput/0001-setup-use-setuptools-instead-of-distutils.patch
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-uinput_0.11.2.bb
>
> diff --git a/meta-python/recipes-core/packagegroups/
> packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/
> packagegroup-meta-python.bb
> index 6ca652e12..e3ae050ec 100644
> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> @@ -436,6 +436,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
>      python3-typeguard \
>      python3-tzlocal \
>      python3-u-msgpack-python \
> +    python3-uinput \
>      python3-ujson \
>      python3-unidiff \
>      python3-uritemplate \
> diff --git
> a/meta-python/recipes-devtools/python/python3-uinput/0001-setup-use-setuptools-instead-of-distutils.patch
> b/meta-python/recipes-devtools/python/python3-uinput/0001-setup-use-setuptools-instead-of-distutils.patch
> new file mode 100644
> index 000000000..54a3c1867
> --- /dev/null
> +++
> b/meta-python/recipes-devtools/python/python3-uinput/0001-setup-use-setuptools-instead-of-distutils.patch
> @@ -0,0 +1,28 @@
> +From 7a4dde83a9584adb42c7f810d882b1fbf5767e2c Mon Sep 17 00:00:00 2001
> +From: Bartosz Golaszewski <brgl@bgdev.pl>
> +Date: Tue, 24 May 2022 21:43:35 +0200
> +Subject: [PATCH] setup: use setuptools instead of distutils
> +
> +The latter is deprecated, use setuptools instead.
> +


Missing Upstream-Status
Please submit upstream and add link to PR, etc.


> +Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> +---
> + setup.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/setup.py b/setup.py
> +index 3fa3343..4900b8b 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -3,7 +3,7 @@
> + import errno
> + import subprocess
> +
> +-from distutils.core import setup, Extension
> ++from setuptools import setup, Extension
> +
> + libudev_so = "libudev.so.1"
> +
> +--
> +2.34.1
> +
> diff --git a/meta-python/recipes-devtools/python/python3-uinput_0.11.2.bb
> b/meta-python/recipes-devtools/python/python3-uinput_0.11.2.bb
> new file mode 100644
> index 000000000..737bbfe2c
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-uinput_0.11.2.bb
> @@ -0,0 +1,18 @@
> +SUMMARY = "Python interface to Linux uinput kernel module."
> +HOMEPAGE = "https://pypi.org/project/python-uinput/"
> +LICENSE = "GPL-3.0-only"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
> +
> +SRC_URI[sha256sum] =
> "99392b676c77b5795b86b7d75274db33fe754fd1e06fb3d58b167c797dc47f0c"
> +SRC_URI += "file://0001-setup-use-setuptools-instead-of-distutils.patch"
> +
> +PYPI_PACKAGE = "python-uinput"
> +
> +inherit pypi setuptools3
> +
> +DEPENDS += "udev"
> +RDEPENDS:${PN} += " \
> +    python3-ctypes \
> +    python3-distutils \
> +"
> +RRECOMMENDS:${PN} += "kernel-module-uinput"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97262):
> https://lists.openembedded.org/g/openembedded-devel/message/97262
> Mute This Topic: https://lists.openembedded.org/mt/91319273/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000d663d905dfce128f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, May 24, 2022 at 12:46 PM Bartosz Golaszewski &lt;<a=
 href=3D"mailto:brgl@bgdev.pl">brgl@bgdev.pl</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">Add a recipe for python3-uinput: a python module f=
or controlling the<br>
virtual input devices on linux.<br>
<br>
Signed-off-by: Bartosz Golaszewski &lt;<a href=3D"mailto:brgl@bgdev.pl" tar=
get=3D"_blank">brgl@bgdev.pl</a>&gt;<br>
---<br>
=C2=A0.../packagegroups/<a href=3D"http://packagegroup-meta-python.bb" rel=
=3D"noreferrer" target=3D"_blank">packagegroup-meta-python.bb</a> |=C2=A0 1=
 +<br>
=C2=A0...-use-setuptools-instead-of-distutils.patch | 28 ++++++++++++++++++=
+<br>
=C2=A0.../python/<a href=3D"http://python3-uinput_0.11.2.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-uinput_0.11.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 18 ++++++++++++<br>
=C2=A03 files changed, 47 insertions(+)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-uinput=
/0001-setup-use-setuptools-instead-of-distutils.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-uinput_0.11.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-=
uinput_0.11.2.bb</a><br>
<br>
diff --git a/meta-python/recipes-core/packagegroups/<a href=3D"http://packa=
gegroup-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-m=
eta-python.bb</a> b/meta-python/recipes-core/packagegroups/<a href=3D"http:=
//packagegroup-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">package=
group-meta-python.bb</a><br>
index 6ca652e12..e3ae050ec 100644<br>
--- a/meta-python/recipes-core/packagegroups/<a href=3D"http://packagegroup=
-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-pyt=
hon.bb</a><br>
+++ b/meta-python/recipes-core/packagegroups/<a href=3D"http://packagegroup=
-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-pyt=
hon.bb</a><br>
@@ -436,6 +436,7 @@ RDEPENDS:packagegroup-meta-python3 =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-typeguard \<br>
=C2=A0 =C2=A0 =C2=A0python3-tzlocal \<br>
=C2=A0 =C2=A0 =C2=A0python3-u-msgpack-python \<br>
+=C2=A0 =C2=A0 python3-uinput \<br>
=C2=A0 =C2=A0 =C2=A0python3-ujson \<br>
=C2=A0 =C2=A0 =C2=A0python3-unidiff \<br>
=C2=A0 =C2=A0 =C2=A0python3-uritemplate \<br>
diff --git a/meta-python/recipes-devtools/python/python3-uinput/0001-setup-=
use-setuptools-instead-of-distutils.patch b/meta-python/recipes-devtools/py=
thon/python3-uinput/0001-setup-use-setuptools-instead-of-distutils.patch<br=
>
new file mode 100644<br>
index 000000000..54a3c1867<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/python3-uinput/0001-setup-use-set=
uptools-instead-of-distutils.patch<br>
@@ -0,0 +1,28 @@<br>
+From 7a4dde83a9584adb42c7f810d882b1fbf5767e2c Mon Sep 17 00:00:00 2001<br>
+From: Bartosz Golaszewski &lt;<a href=3D"mailto:brgl@bgdev.pl" target=3D"_=
blank">brgl@bgdev.pl</a>&gt;<br>
+Date: Tue, 24 May 2022 21:43:35 +0200<br>
+Subject: [PATCH] setup: use setuptools instead of distutils<br>
+<br>
+The latter is deprecated, use setuptools instead.<br>
+</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Missing Upstrea=
m-Status</div><div dir=3D"auto">Please submit upstream and add link to PR, =
etc.</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D=
"auto"><br>
+Signed-off-by: Bartosz Golaszewski &lt;<a href=3D"mailto:brgl@bgdev.pl" ta=
rget=3D"_blank">brgl@bgdev.pl</a>&gt;<br>
+---<br>
+ setup.py | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/setup.py b/setup.py<br>
+index 3fa3343..4900b8b 100644<br>
+--- a/setup.py<br>
++++ b/setup.py<br>
+@@ -3,7 +3,7 @@<br>
+ import errno<br>
+ import subprocess<br>
+ <br>
+-from distutils.core import setup, Extension<br>
++from setuptools import setup, Extension<br>
+ <br>
+ libudev_so =3D &quot;libudev.so.1&quot;<br>
+ <br>
+-- <br>
+2.34.1<br>
+<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
uinput_0.11.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-uinput_0.11.=
2.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-ui=
nput_0.11.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-uinput_0.11.2.=
bb</a><br>
new file mode 100644<br>
index 000000000..737bbfe2c<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-uinput_=
0.11.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-uinput_0.11.2.bb</a=
><br>
@@ -0,0 +1,18 @@<br>
+SUMMARY =3D &quot;Python interface to Linux uinput kernel module.&quot;<br=
>
+HOMEPAGE =3D &quot;<a href=3D"https://pypi.org/project/python-uinput/" rel=
=3D"noreferrer" target=3D"_blank">https://pypi.org/project/python-uinput/</=
a>&quot;<br>
+LICENSE =3D &quot;GPL-3.0-only&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Df27defe1e96c2e1ecd4e0c9be8=
967949&quot;<br>
+<br>
+SRC_URI[sha256sum] =3D &quot;99392b676c77b5795b86b7d75274db33fe754fd1e06fb=
3d58b167c797dc47f0c&quot;<br>
+SRC_URI +=3D &quot;file://0001-setup-use-setuptools-instead-of-distutils.p=
atch&quot;<br>
+<br>
+PYPI_PACKAGE =3D &quot;python-uinput&quot;<br>
+<br>
+inherit pypi setuptools3<br>
+<br>
+DEPENDS +=3D &quot;udev&quot;<br>
+RDEPENDS:${PN} +=3D &quot; \<br>
+=C2=A0 =C2=A0 python3-ctypes \<br>
+=C2=A0 =C2=A0 python3-distutils \<br>
+&quot;<br>
+RRECOMMENDS:${PN} +=3D &quot;kernel-module-uinput&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#97262): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/97262" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/97262</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91319273/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
91319273/924729</a><br>
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

--000000000000d663d905dfce128f--

