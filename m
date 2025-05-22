Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B09C54E90
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 15:50:40 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.27441.1747929034005926766
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 May 2025 08:50:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=jzlKDYrV;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a3673e12c4so3648976f8f.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 May 2025 08:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1747929032; x=1748533832; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oef1mW5T/vfeHB86l1+xyfiaKYxFJaFW1uCRU4g/K4g=;
        b=jzlKDYrVkwdEiaUHDCz49O2RMBXewDwPl2cbKaAaXxlUt9OwRnDcAJAjEZapPu2MFO
         yy9xWwW7hj7yBLaIaHFDoiaXXLw3sEPzgqEAJUkA3o+MBiWmKvKxI/P4ErOwxRPJadkk
         XqC8LpMY/v9RC9UB16r3aCFjUW7YvT75mW9cQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747929032; x=1748533832;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oef1mW5T/vfeHB86l1+xyfiaKYxFJaFW1uCRU4g/K4g=;
        b=UvTfoLoA15viDK4ABIuoyqLZPPPmhAjyxbkuKyU3k30KYZOefH3Y1JN8HEQbd6aD30
         6aKME/NJ695hHTtO52vISnGTupVmo0ljTGvcDkOovd2Wdm4zS9VRYwqUngUvtb8ojj9v
         P7mFJ+rjINNv6w7p5w0RKOYZPoVGc7t/LRMYJ+kWRbri+ZLASYhc6ClM7mTeJ2M5yugI
         iDDb9mjrCprmh3WIPHMs8tsEda1ZcB84Nn7tVau5Ow/zD9USd46GM41SeqmCpnAyb7/x
         qTpPeUJ5URaer7A2gkGI8pubVOyfY1nfD69l5cz+n6ADjA5Df7UCaJSef5vRkZ5Fqa79
         Kg1g==
X-Forwarded-Encrypted: i=1; AJvYcCVSPZlms3M30VvGuRDHpWkpuKyINFhgLu7yN1+9LpXzgbGQ2hBAS+4HOz2hQf1k0GXaIU8OLsPYwEjb/jm7dNKqAG4=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz1LXaFpGJRGb4aXae9wLnmlrM4G67fij3ULsf49T3OlUoCNL4O
	3lq/BsvG7WhMp6UIKBwIcBXJRLYPP73ybW50lewN1YcuokTsxLbOTxEWyOpOXtPeBE1A3VHg3dG
	QHuuL9ZJaddzagtA7ty0MrAN+vjMh8vfh8i555Pc+7A==
X-Gm-Gg: ASbGncvet2T9uaiP0WQ5XaiLhRJaChUZyuuIwpykKndqGwIe+Amsin0/XhvhIkL6kQV
	Yr4gvDdLtgKd7++RZstLsekPqeiAqEhQI2OV4MlEoKhWHHAa7xm8ya4ZShLgxNi62gSDSlQ2+Ek
	I8/x0+KDp/TSn2F2Eb1O15AqrE8+0ah1CW6mY=
X-Google-Smtp-Source: AGHT+IHTqXKMfLopluk+D191j+GuVY7qAWnUQQjHb7V5T70zQQ+SxnyzMogHVDNbk3tnzKecSEQcM8qDGwoaGccC+lo=
X-Received: by 2002:a5d:65c2:0:b0:3a3:5c7c:188c with SMTP id
 ffacd0b85a97d-3a35c856459mr17278846f8f.57.1747929032190; Thu, 22 May 2025
 08:50:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250508063335.1498917-1-leon.anavi@konsulko.com>
 <CAMSfU+66CD4OPMjf4ofm1UEDY4TqSsrdppaeOg-qCYBCPVf2yw@mail.gmail.com>
 <CAMKF1sqs3n66kb-qbM+22PLPNGf6qFNEjgbX6m7YVnnVGKTLnw@mail.gmail.com> <CALtQ3O1qMj2CxSYPFn4vkpygkEjZSd5=LMy3fhcSCMrjJQvX9Q@mail.gmail.com>
In-Reply-To: <CALtQ3O1qMj2CxSYPFn4vkpygkEjZSd5=LMy3fhcSCMrjJQvX9Q@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 22 May 2025 17:50:05 +0200
X-Gm-Features: AX0GCFu4b0Yn_o6ESao1CTn5du7QrBPC1LULM6iUlttGDmTfeKokdDwCfTFV1-I
Message-ID: <CAMSfU+5jgsHNCaH7bfhpoJcf2EFfhqB7Gb+ADBJJn6jrMDWovw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCHv2] python3-pillow-heif: Add recipe
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000e7f350635bb71a7"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 May 2025 15:50:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117594

--0000000000000e7f350635bb71a7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 22 mai 2025 =C3=A0 14:14, Leon Anavi <leon.anavi@konsulko.com> a =
=C3=A9crit :

> Hi Yoann, Khem,
>
> On Mon, May 19, 2025 at 12:56=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wr=
ote:
>
>> On Sun, May 18, 2025 at 2:03=E2=80=AFPM Yoann Congal via
>> lists.openembedded.org <yoann.congal=3Dsmile.fr@lists.openembedded.org>
>> wrote:
>> >
>> >
>> >
>> > Le jeu. 8 mai 2025 =C3=A0 08:33, Leon Anavi via lists.openembedded.org
>> <leon.anavi=3Dkonsulko.com@lists.openembedded.org> a =C3=A9crit :
>> >>
>> >> Add recipe for release 0.22.0:
>> >>
>> >> - Boolean pillow_heif.options.DISABLE_SECURITY_LIMITS to bypass
>> >>   security limit of libheif for the image size.
>> >> - libx265 library was updated to the latest 4.1 version.
>> >> - libheif was updated from the 1.19.5 to 1.19.7 version.
>> >> - AVIF format marked as deprecated and pending for the removal.
>> >>
>> >> This work was sponsored by GOVCERT.LU.
>> >>
>> >> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>> >
>> >
>> > Hello,
>> >
>> > This recipe triggers build failures when doing a meta-python world
>> build : libheif is in meta-multimedia but meta-python does not depend on
>> meta-multimedia.
>> >
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/46/st=
eps/41/logs/stdio
>> (line 74)
>> >
>> > Maybe this recipe should be moved to meta-multimedia?
>> >
>> > NB: meta-multimedia does depends on meta-python
>> >
>>
>> Seems good to me. Please send a patch
>>
>
> Thank you for the suggestion. As you recommended, I have just sent a patc=
h
> to move  python3-pillow-heif to meta-multimedia:
>
> https://lists.openembedded.org/g/openembedded-devel/topic/meta_multimedia=
_patch/113245750
>

Thanks a lot for the patch :-)


> Best regards,
> Leon
>
>
>>
>> > Regards,
>> >>
>> >> ---
>> >>  ...001-setup.py-support-cross-compiling.patch | 56 +++++++++++++++++=
++
>> >>  .../python/python3-pillow-heif_0.22.0.bb      | 20 +++++++
>> >>  2 files changed, 76 insertions(+)
>> >>  create mode 100644
>> meta-python/recipes-devtools/python/python3-pillow-heif/0001-setup.py-su=
pport-cross-compiling.patch
>> >>  create mode 100644 meta-python/recipes-devtools/python/
>> python3-pillow-heif_0.22.0.bb
>> >>
>> >> diff --git
>> a/meta-python/recipes-devtools/python/python3-pillow-heif/0001-setup.py-=
support-cross-compiling.patch
>> b/meta-python/recipes-devtools/python/python3-pillow-heif/0001-setup.py-=
support-cross-compiling.patch
>> >> new file mode 100644
>> >> index 0000000000..66cf7a9244
>> >> --- /dev/null
>> >> +++
>> b/meta-python/recipes-devtools/python/python3-pillow-heif/0001-setup.py-=
support-cross-compiling.patch
>> >> @@ -0,0 +1,56 @@
>> >> +From 98e6831754712221ce030ce8b27e100a3926c543 Mon Sep 17 00:00:00 20=
01
>> >> +From: Leon Anavi <leon.anavi@konsulko.com>
>> >> +Date: Mon, 5 May 2025 16:08:37 +0000
>> >> +Subject: [PATCH] setup.py: support cross compiling
>> >> +
>> >> +Upstream-Status: Inappropriate [oe specific]
>> >> +
>> >> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>> >> +---
>> >> + setup.py | 19 +++++++++++--------
>> >> + 1 file changed, 11 insertions(+), 8 deletions(-)
>> >> +
>> >> +diff --git a/setup.py b/setup.py
>> >> +index 68945e4..67566e8 100644
>> >> +--- a/setup.py
>> >> ++++ b/setup.py
>> >> +@@ -125,12 +125,12 @@ class PillowHeifBuildExt(build_ext):
>> >> +                     self._add_directory(library_dirs, match.group(1=
))
>> >> +
>> >> +         # include, rpath, if set as environment variables
>> >> +-        for k in ("C_INCLUDE_PATH", "CPATH", "INCLUDE"):
>> >> ++        for k in ("C_INCLUDE_PATH", "CPATH", "INCLUDE",
>> "STAGING_INCDIR"):
>> >> +             if k in os.environ:
>> >> +                 for d in os.environ[k].split(os.path.pathsep):
>> >> +                     self._add_directory(include_dirs, d)
>> >> +
>> >> +-        for k in ("LD_RUN_PATH", "LIBRARY_PATH", "LIB"):
>> >> ++        for k in ("LD_RUN_PATH", "LIBRARY_PATH", "LIB",
>> "STAGING_LIBDIR"):
>> >> +             if k in os.environ:
>> >> +                 for d in os.environ[k].split(os.path.pathsep):
>> >> +                     self._add_directory(library_dirs, d)
>> >> +@@ -199,12 +199,15 @@ class PillowHeifBuildExt(build_ext):
>> >> +             self._update_extension("_pillow_heif", ["heif"],
>> extra_compile_args=3D["-O3", "-Werror"])
>> >> +         else:  # let's assume it's some kind of linux
>> >> +             # this old code waiting for refactoring, when time come=
s.
>> >> +-            self._add_directory(include_dirs, "/usr/local/include")
>> >> +-            self._add_directory(include_dirs, "/usr/include")
>> >> +-            self._add_directory(library_dirs, "/usr/local/lib")
>> >> +-            self._add_directory(library_dirs, "/usr/lib64")
>> >> +-            self._add_directory(library_dirs, "/usr/lib")
>> >> +-            self._add_directory(library_dirs, "/lib")
>> >> ++            include_os_path =3D os.environ.get("STAGING_INCDIR")
>> >> ++            if include_os_path:
>> >> ++                for path in include_os_path.split(os.pathsep):
>> >> ++                    self._add_directory(include_dirs, path)
>> >> ++
>> >> ++            lib_os_path =3D os.environ.get("STAGING_LIBDIR")
>> >> ++            if lib_os_path:
>> >> ++                for path in lib_os_path.split(os.pathsep):
>> >> ++                    self._add_directory(library_dirs, path)
>> >> +
>> >> +             self._update_extension("_pillow_heif", ["heif"],
>> extra_compile_args=3D["-O3", "-Werror"])
>> >> +
>> >> +--
>> >> +2.39.5
>> >> +
>> >> diff --git a/meta-python/recipes-devtools/python/
>> python3-pillow-heif_0.22.0.bb b/meta-python/recipes-devtools/python/
>> python3-pillow-heif_0.22.0.bb
>> >> new file mode 100644
>> >> index 0000000000..7f5dfac702
>> >> --- /dev/null
>> >> +++ b/meta-python/recipes-devtools/python/
>> python3-pillow-heif_0.22.0.bb
>> >> @@ -0,0 +1,20 @@
>> >> +DESCRIPTION =3D "Python interface for libheif library"
>> >> +HOMEPAGE =3D "https://github.com/bigcat88/pillow_heif"
>> >> +LICENSE =3D "BSD-3-Clause"
>> >> +LIC_FILES_CHKSUM =3D
>> "file://LICENSE.txt;md5=3Db6c07a92aed67c33bc346748d7c7e991"
>> >> +
>> >> +# While this item does not require it, it depends on libheif which
>> does
>> >> +LICENSE_FLAGS =3D "commercial"
>> >> +
>> >> +PYPI_PACKAGE =3D "pillow_heif"
>> >> +
>> >> +inherit pypi python_setuptools_build_meta
>> >> +
>> >> +SRC_URI +=3D "file://0001-setup.py-support-cross-compiling.patch"
>> >> +SRC_URI[sha256sum] =3D
>> "61d473929340d3073722f6316b7fbbdb11132faa6bac0242328e8436cc55b39a"
>> >> +
>> >> +DEPENDS +=3D "libheif"
>> >> +
>> >> +RDEPENDS:${PN} +=3D "python3-pillow"
>> >> +
>> >> +BBCLASSEXTEND =3D "native nativesdk"
>> >> --
>> >> 2.39.5
>> >>
>> >>
>> >>
>> >>
>> >
>> >
>> > --
>> > Yoann Congal
>> > Smile ECS
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#117464):
>> https://lists.openembedded.org/g/openembedded-devel/message/117464
>> > Mute This Topic: https://lists.openembedded.org/mt/112783025/1997914
>> > Group Owner: openembedded-devel+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub
>> [raj.khem@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >
>>
>
>

--=20
Yoann Congal
Smile ECS

--0000000000000e7f350635bb71a7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 22=
 mai 2025 =C3=A0=C2=A014:14, Leon Anavi &lt;<a href=3D"mailto:leon.anavi@ko=
nsulko.com">leon.anavi@konsulko.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Hi Yo=
ann, Khem,<br><br></div><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, May 19, 2025 at 12:56=E2=80=AFAM Khem Raj &lt;<a hr=
ef=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Sun=
, May 18, 2025 at 2:03=E2=80=AFPM Yoann Congal via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;yoann.congal=3D<a href=3D"mailto:smile.f=
r@lists.openembedded.org" target=3D"_blank">smile.fr@lists.openembedded.org=
</a>&gt;<br>
wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Le jeu. 8 mai 2025 =C3=A0 08:33, Leon Anavi via <a href=3D"http://list=
s.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded=
.org</a> &lt;leon.anavi=3D<a href=3D"mailto:konsulko.com@lists.openembedded=
.org" target=3D"_blank">konsulko.com@lists.openembedded.org</a>&gt; a =C3=
=A9crit :<br>
&gt;&gt;<br>
&gt;&gt; Add recipe for release 0.22.0:<br>
&gt;&gt;<br>
&gt;&gt; - Boolean pillow_heif.options.DISABLE_SECURITY_LIMITS to bypass<br=
>
&gt;&gt;=C2=A0 =C2=A0security limit of libheif for the image size.<br>
&gt;&gt; - libx265 library was updated to the latest 4.1 version.<br>
&gt;&gt; - libheif was updated from the 1.19.5 to 1.19.7 version.<br>
&gt;&gt; - AVIF format marked as deprecated and pending for the removal.<br=
>
&gt;&gt;<br>
&gt;&gt; This work was sponsored by <a href=3D"http://GOVCERT.LU" rel=3D"no=
referrer" target=3D"_blank">GOVCERT.LU</a>.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulk=
o.com" target=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
&gt;<br>
&gt;<br>
&gt; Hello,<br>
&gt;<br>
&gt; This recipe triggers build failures when doing a meta-python world bui=
ld : libheif is in meta-multimedia but meta-python does not depend on meta-=
multimedia.<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/87=
/builds/46/steps/41/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https:=
//autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/46/steps/41/lo=
gs/stdio</a> (line 74)<br>
&gt;<br>
&gt; Maybe this recipe should be moved to meta-multimedia?<br>
&gt;<br>
&gt; NB: meta-multimedia does depends on meta-python<br>
&gt;<br>
<br>
Seems good to me. Please send a patch<br></blockquote><div><br></div><div>T=
hank you for the suggestion. As you recommended, I have just sent a patch t=
o move =C2=A0python3-pillow-heif to meta-multimedia:<br><a href=3D"https://=
lists.openembedded.org/g/openembedded-devel/topic/meta_multimedia_patch/113=
245750" target=3D"_blank">https://lists.openembedded.org/g/openembedded-dev=
el/topic/meta_multimedia_patch/113245750</a></div></div></div></blockquote>=
<div><br></div><div>Thanks a lot for the patch :-)</div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=
=3D"gmail_quote"><div>Best regards,<br>Leon</div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; Regards,<br>
&gt;&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 ...001-setup.py-support-cross-compiling.patch | 56 +++++++++=
++++++++++<br>
&gt;&gt;=C2=A0 .../python/<a href=3D"http://python3-pillow-heif_0.22.0.bb" =
rel=3D"noreferrer" target=3D"_blank">python3-pillow-heif_0.22.0.bb</a>=C2=
=A0 =C2=A0 =C2=A0 | 20 +++++++<br>
&gt;&gt;=C2=A0 2 files changed, 76 insertions(+)<br>
&gt;&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/pytho=
n3-pillow-heif/0001-setup.py-support-cross-compiling.patch<br>
&gt;&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/<a hr=
ef=3D"http://python3-pillow-heif_0.22.0.bb" rel=3D"noreferrer" target=3D"_b=
lank">python3-pillow-heif_0.22.0.bb</a><br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-python/recipes-devtools/python/python3-pillow-he=
if/0001-setup.py-support-cross-compiling.patch b/meta-python/recipes-devtoo=
ls/python/python3-pillow-heif/0001-setup.py-support-cross-compiling.patch<b=
r>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..66cf7a9244<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta-python/recipes-devtools/python/python3-pillow-heif/0001=
-setup.py-support-cross-compiling.patch<br>
&gt;&gt; @@ -0,0 +1,56 @@<br>
&gt;&gt; +From 98e6831754712221ce030ce8b27e100a3926c543 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" t=
arget=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
&gt;&gt; +Date: Mon, 5 May 2025 16:08:37 +0000<br>
&gt;&gt; +Subject: [PATCH] setup.py: support cross compiling<br>
&gt;&gt; +<br>
&gt;&gt; +Upstream-Status: Inappropriate [oe specific]<br>
&gt;&gt; +<br>
&gt;&gt; +Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsul=
ko.com" target=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
&gt;&gt; +---<br>
&gt;&gt; + setup.py | 19 +++++++++++--------<br>
&gt;&gt; + 1 file changed, 11 insertions(+), 8 deletions(-)<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/setup.py b/setup.py<br>
&gt;&gt; +index 68945e4..67566e8 100644<br>
&gt;&gt; +--- a/setup.py<br>
&gt;&gt; ++++ b/setup.py<br>
&gt;&gt; +@@ -125,12 +125,12 @@ class PillowHeifBuildExt(build_ext):<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0self._add_directory(library_dirs, match.group(1))<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# include, rpath, if set as env=
ironment variables<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for k in (&quot;C_INCLUDE_PATH&quot;=
, &quot;CPATH&quot;, &quot;INCLUDE&quot;):<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 for k in (&quot;C_INCLUDE_PATH&quot;=
, &quot;CPATH&quot;, &quot;INCLUDE&quot;, &quot;STAGING_INCDIR&quot;):<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if k in os.enviro=
n:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for=
 d in os.environ[k].split(os.path.pathsep):<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0self._add_directory(include_dirs, d)<br>
&gt;&gt; +<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for k in (&quot;LD_RUN_PATH&quot;, &=
quot;LIBRARY_PATH&quot;, &quot;LIB&quot;):<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 for k in (&quot;LD_RUN_PATH&quot;, &=
quot;LIBRARY_PATH&quot;, &quot;LIB&quot;, &quot;STAGING_LIBDIR&quot;):<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if k in os.enviro=
n:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for=
 d in os.environ[k].split(os.path.pathsep):<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0self._add_directory(library_dirs, d)<br>
&gt;&gt; +@@ -199,12 +199,15 @@ class PillowHeifBuildExt(build_ext):<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._update_exte=
nsion(&quot;_pillow_heif&quot;, [&quot;heif&quot;], extra_compile_args=3D[&=
quot;-O3&quot;, &quot;-Werror&quot;])<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:=C2=A0 # let&#39;s assume =
it&#39;s some kind of linux<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# this old code w=
aiting for refactoring, when time comes.<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._add_directory(in=
clude_dirs, &quot;/usr/local/include&quot;)<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._add_directory(in=
clude_dirs, &quot;/usr/include&quot;)<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._add_directory(li=
brary_dirs, &quot;/usr/local/lib&quot;)<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._add_directory(li=
brary_dirs, &quot;/usr/lib64&quot;)<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._add_directory(li=
brary_dirs, &quot;/usr/lib&quot;)<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._add_directory(li=
brary_dirs, &quot;/lib&quot;)<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 include_os_path =3D os=
.environ.get(&quot;STAGING_INCDIR&quot;)<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if include_os_path:<br=
>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for path=
 in include_os_path.split(os.pathsep):<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 self._add_directory(include_dirs, path)<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lib_os_path =3D os.env=
iron.get(&quot;STAGING_LIBDIR&quot;)<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if lib_os_path:<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for path=
 in lib_os_path.split(os.pathsep):<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 self._add_directory(library_dirs, path)<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._update_exte=
nsion(&quot;_pillow_heif&quot;, [&quot;heif&quot;], extra_compile_args=3D[&=
quot;-O3&quot;, &quot;-Werror&quot;])<br>
&gt;&gt; +<br>
&gt;&gt; +--<br>
&gt;&gt; +2.39.5<br>
&gt;&gt; +<br>
&gt;&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http:/=
/python3-pillow-heif_0.22.0.bb" rel=3D"noreferrer" target=3D"_blank">python=
3-pillow-heif_0.22.0.bb</a> b/meta-python/recipes-devtools/python/<a href=
=3D"http://python3-pillow-heif_0.22.0.bb" rel=3D"noreferrer" target=3D"_bla=
nk">python3-pillow-heif_0.22.0.bb</a><br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..7f5dfac702<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python=
3-pillow-heif_0.22.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pillo=
w-heif_0.22.0.bb</a><br>
&gt;&gt; @@ -0,0 +1,20 @@<br>
&gt;&gt; +DESCRIPTION =3D &quot;Python interface for libheif library&quot;<=
br>
&gt;&gt; +HOMEPAGE =3D &quot;<a href=3D"https://github.com/bigcat88/pillow_=
heif" rel=3D"noreferrer" target=3D"_blank">https://github.com/bigcat88/pill=
ow_heif</a>&quot;<br>
&gt;&gt; +LICENSE =3D &quot;BSD-3-Clause&quot;<br>
&gt;&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3Db6c07a92aed67=
c33bc346748d7c7e991&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +# While this item does not require it, it depends on libheif whic=
h does<br>
&gt;&gt; +LICENSE_FLAGS =3D &quot;commercial&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +PYPI_PACKAGE =3D &quot;pillow_heif&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +inherit pypi python_setuptools_build_meta<br>
&gt;&gt; +<br>
&gt;&gt; +SRC_URI +=3D &quot;file://0001-setup.py-support-cross-compiling.p=
atch&quot;<br>
&gt;&gt; +SRC_URI[sha256sum] =3D &quot;61d473929340d3073722f6316b7fbbdb1113=
2faa6bac0242328e8436cc55b39a&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +DEPENDS +=3D &quot;libheif&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +RDEPENDS:${PN} +=3D &quot;python3-pillow&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt;&gt; --<br>
&gt;&gt; 2.39.5<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Yoann Congal<br>
&gt; Smile ECS<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#117464): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/117464" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/117464</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11278302=
5/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/112783025/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div><div><br></div><div dir=3D"ltr" class=3D"gmail_signature=
"><div dir=3D"ltr"></div></div></div>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--0000000000000e7f350635bb71a7--

