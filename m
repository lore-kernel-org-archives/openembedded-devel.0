Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33CA1C3DA4A
	for <webhook@archiver.kernel.org>; Sun, 11 Aug 2024 17:23:58 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web10.28384.1723397030833013999
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Aug 2024 10:23:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ULlk+xe1;
 spf=pass (domain: gmail.com, ip: 209.85.219.178, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e0b167da277so3522034276.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Aug 2024 10:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723397030; x=1724001830; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v6BSe5kDvMQulSU3ZAfCfjeOZEjrhh1x7u79qO691Dg=;
        b=ULlk+xe15JppUpm7QLujRhx58Opssbe4+sVOVFCSC6xP5j8HAkTzRQNGCkSAL3IgcP
         Bp83gpsO5PBV6K719gubwR5ReR4Cg0N3eqiQ+tiICrIbu7curcwLoFcSZj34OSLtgjH/
         CkyXROxLWiKFsF2TY5TX0VoKvW5c3wsujf/3+WJcK2VEv9gHNG0BfBsBb1FoVR/I/3Ir
         NMxdKNWiDmcSF6UuRYGwqhoOfbt6PACkZvFYTFTwrgCucmyiC9h4VODy0YTICZWvU0Qw
         Xm+RSE7ekhQIf3DhP0WdTOMoHswsBxurroHwuipI0D9f0H9r5LUC4vz2vJbHRIs0pa8n
         jQVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723397030; x=1724001830;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v6BSe5kDvMQulSU3ZAfCfjeOZEjrhh1x7u79qO691Dg=;
        b=DlUGd73/201GqFA4VF/HgXZZF3DGUjio1wppnPK8Akks+xolbdhLpKjHlkJ0p6mSAb
         p1+lCxzxMtp5hxhOXDGNINN2/XsnwcnhS4iGxQIfvwRzTcmjuOBWjTLkD9DnX1EgDEQJ
         Uf+n0j7ZHRCPkTS3mJwX0F/rDrI3LBxMcurUgumlzrYY9F03UuXkPg0xLVmNA/R2E9s2
         KMaIj2nt1LtQIWNFZG3fj5ssbItKIwEhcOuyr/yDcFUIiRSGYm432Mn/3i+X/iru1Yd9
         URCNIMjx+VJ/eLQrhDaG7L/rW8FgmZlGCqipMD320TBWynJngo6rnktuqVHY12ZTjZU5
         czZA==
X-Gm-Message-State: AOJu0YxPkWMEnn5Ol8b0YoAYFnS1Zdo2Ho22zluTjKhPlXJu836O0mX0
	Tc/+vrGBCTY+ftvdMq+RsJvN2lEyNJeJNXCJl+oI2lDuiK66zCxrUUupIxCaFF1CDnaIUWnhIif
	GS0ICcY0RzhvWu0R56x1smeVM7FM=
X-Google-Smtp-Source: AGHT+IFnZuuMBoOBkhD7mQYDgOKUWkyDrJJICcWG9gTuRuPIdL4rxSFal+Mcew5JfHLRNe5L4hTSWmmKxOewOuehKKw=
X-Received: by 2002:a05:690c:2b05:b0:64b:89cd:7db8 with SMTP id
 00721157ae682-69ec86be5e7mr79886647b3.28.1723397029560; Sun, 11 Aug 2024
 10:23:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240811060530.34509-1-raj.khem@gmail.com>
In-Reply-To: <20240811060530.34509-1-raj.khem@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sun, 11 Aug 2024 10:23:38 -0700
Message-ID: <CANx9H-BFu9BZ+X1h65ZT0ftRKxt50zCbztzip3KwBq3sQwT-tw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-daemon: Fix build with PEP-575
 build backend
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c108a1061f6ba334"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 11 Aug 2024 17:23:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111755

--000000000000c108a1061f6ba334
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think you meant PEP-517

https://peps.python.org/pep-0517/

Not PEP-575
https://peps.python.org/pep-0575/



On Sat, Aug 10, 2024 at 11:05=E2=80=AFPM Khem Raj via lists.openembedded.or=
g
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:

> Apply required backports
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...-packaging-module-instead-of-setupto.patch | 44 +++++++++++++++++++
>  .../python/python3-daemon_3.0.1.bb            |  3 +-
>  2 files changed, 46 insertions(+), 1 deletion(-)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-daemon/0001-Use-version-from-=
packaging-module-instead-of-setupto.patch
>
> diff --git
> a/meta-python/recipes-devtools/python/python3-daemon/0001-Use-version-fro=
m-packaging-module-instead-of-setupto.patch
> b/meta-python/recipes-devtools/python/python3-daemon/0001-Use-version-fro=
m-packaging-module-instead-of-setupto.patch
> new file mode 100644
> index 0000000000..316f7d9618
> --- /dev/null
> +++
> b/meta-python/recipes-devtools/python/python3-daemon/0001-Use-version-fro=
m-packaging-module-instead-of-setupto.patch
> @@ -0,0 +1,44 @@
> +From b7418ab4a3232431373bf0680c6b74fef06910de Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sat, 10 Aug 2024 22:44:08 -0700
> +Subject: [PATCH] Use version from packaging module instead of setuptools
> extern
> +
> +Fixes build problems when using PEP-575 build backend
> +
> +
> +Drop the patch on upgrading to >=3D 3.0.2
> +
> +Upstream-Status: Backport [
> https://pagure.io/fork/khemraj/python-daemon/c/3bbc46967d35cd7e05677018bd=
c9d552efaeea3e?branch=3Dmain
> ]
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + test_version.py | 2 +-
> + version.py      | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/test_version.py b/test_version.py
> +index c43cd36..d0a124d 100644
> +--- a/test_version.py
> ++++ b/test_version.py
> +@@ -23,7 +23,7 @@ import docutils.writers
> + import setuptools
> + import setuptools.command
> + import setuptools.dist
> +-from setuptools.extern.packaging.version import InvalidVersion
> ++from packaging.version import InvalidVersion
> + import testscenarios
> + import testtools
> +
> +diff --git a/version.py b/version.py
> +index 20d3ef3..fbdc462 100644
> +--- a/version.py
> ++++ b/version.py
> +@@ -36,7 +36,7 @@ import setuptools.command.build
> + import setuptools.command.build_py
> + import setuptools.command.egg_info
> + import setuptools.dist
> +-import setuptools.extern.packaging.version
> ++import packaging.version
> +
> +
> + def ensure_class_bases_begin_with(namespace, class_name, base_class):
> diff --git a/meta-python/recipes-devtools/python/python3-daemon_3.0.1.bb
> b/meta-python/recipes-devtools/python/python3-daemon_3.0.1.bb
> index 715d3bf120..cb85262b41 100644
> --- a/meta-python/recipes-devtools/python/python3-daemon_3.0.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-daemon_3.0.1.bb
> @@ -11,8 +11,9 @@ RDEPENDS:${PN} =3D "python3-docutils \
>  LICENSE =3D "Apache-2.0 & GPL-3.0-only"
>  LIC_FILES_CHKSUM =3D "file://README;md5=3Da3a94c615dc969a70525f1eebbacf2=
35"
>
> -inherit pypi setuptools3
> +inherit pypi python_setuptools_build_meta
>
> +SRC_URI +=3D
> "file://0001-Use-version-from-packaging-module-instead-of-setupto.patch"
>  SRC_URI[sha256sum] =3D
> "6c57452372f7eaff40934a1c03ad1826bf5e793558e87fef49131e6464b4dae5"
>
>  PYPI_PACKAGE =3D "python-daemon"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111753):
> https://lists.openembedded.org/g/openembedded-devel/message/111753
> Mute This Topic: https://lists.openembedded.org/mt/107836692/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000c108a1061f6ba334
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I think you meant PEP-517=C2=A0</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto"><div><a href=3D"https://peps.python.org/pep-0517/=
">https://peps.python.org/pep-0517/</a></div><div dir=3D"auto"><br></div>No=
t PEP-575</div><div dir=3D"auto"><div><a href=3D"https://peps.python.org/pe=
p-0575/">https://peps.python.org/pep-0575/</a></div><br></div><div dir=3D"a=
uto"><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Aug 10, 2024 at 11:05=E2=80=AFPM Khem Raj via <a hr=
ef=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;raj.khe=
m=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.ope=
nembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:soli=
d;padding-left:1ex;border-left-color:rgb(204,204,204)">Apply required backp=
orts<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0...-packaging-module-instead-of-setupto.patch | 44 ++++++++++++++++++=
+<br>
=C2=A0.../python/<a href=3D"http://python3-daemon_3.0.1.bb" rel=3D"noreferr=
er" target=3D"_blank">python3-daemon_3.0.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 3 +-<br>
=C2=A02 files changed, 46 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-daemon=
/0001-Use-version-from-packaging-module-instead-of-setupto.patch<br>
<br>
diff --git a/meta-python/recipes-devtools/python/python3-daemon/0001-Use-ve=
rsion-from-packaging-module-instead-of-setupto.patch b/meta-python/recipes-=
devtools/python/python3-daemon/0001-Use-version-from-packaging-module-inste=
ad-of-setupto.patch<br>
new file mode 100644<br>
index 0000000000..316f7d9618<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/python3-daemon/0001-Use-version-f=
rom-packaging-module-instead-of-setupto.patch<br>
@@ -0,0 +1,44 @@<br>
+From b7418ab4a3232431373bf0680c6b74fef06910de Mon Sep 17 00:00:00 2001<br>
+From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
+Date: Sat, 10 Aug 2024 22:44:08 -0700<br>
+Subject: [PATCH] Use version from packaging module instead of setuptools e=
xtern<br>
+<br>
+Fixes build problems when using PEP-575 build backend<br>
+<br>
+<br>
+Drop the patch on upgrading to &gt;=3D 3.0.2<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://pagure.io/fork/khemraj/pytho=
n-daemon/c/3bbc46967d35cd7e05677018bdc9d552efaeea3e?branch=3Dmain" rel=3D"n=
oreferrer" target=3D"_blank">https://pagure.io/fork/khemraj/python-daemon/c=
/3bbc46967d35cd7e05677018bdc9d552efaeea3e?branch=3Dmain</a>]<br>
+<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+---<br>
+ test_version.py | 2 +-<br>
+ version.py=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
+ 2 files changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/test_version.py b/test_version.py<br>
+index c43cd36..d0a124d 100644<br>
+--- a/test_version.py<br>
++++ b/test_version.py<br>
+@@ -23,7 +23,7 @@ import docutils.writers<br>
+ import setuptools<br>
+ import setuptools.command<br>
+ import setuptools.dist<br>
+-from setuptools.extern.packaging.version import InvalidVersion<br>
++from packaging.version import InvalidVersion<br>
+ import testscenarios<br>
+ import testtools<br>
+ <br>
+diff --git a/version.py b/version.py<br>
+index 20d3ef3..fbdc462 100644<br>
+--- a/version.py<br>
++++ b/version.py<br>
+@@ -36,7 +36,7 @@ import setuptools.command.build<br>
+ import setuptools.command.build_py<br>
+ import setuptools.command.egg_info<br>
+ import setuptools.dist<br>
+-import setuptools.extern.packaging.version<br>
++import packaging.version<br>
+ <br>
+ <br>
+ def ensure_class_bases_begin_with(namespace, class_name, base_class):<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
daemon_3.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-daemon_3.0.1.=
bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-daem=
on_3.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-daemon_3.0.1.bb</=
a><br>
index 715d3bf120..cb85262b41 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-daemon_=
3.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-daemon_3.0.1.bb</a><=
br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-daemon_=
3.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-daemon_3.0.1.bb</a><=
br>
@@ -11,8 +11,9 @@ RDEPENDS:${PN} =3D &quot;python3-docutils \<br>
=C2=A0LICENSE =3D &quot;Apache-2.0 &amp; GPL-3.0-only&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://README;md5=3Da3a94c615dc969a70525f1=
eebbacf235&quot;<br>
<br>
-inherit pypi setuptools3<br>
+inherit pypi python_setuptools_build_meta<br>
<br>
+SRC_URI +=3D &quot;file://0001-Use-version-from-packaging-module-instead-o=
f-setupto.patch&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;6c57452372f7eaff40934a1c03ad1826bf5e7935=
58e87fef49131e6464b4dae5&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;python-daemon&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#111753): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/111753" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/111753</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/107836692/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/107836692/924729</a><br>
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

--000000000000c108a1061f6ba334--

