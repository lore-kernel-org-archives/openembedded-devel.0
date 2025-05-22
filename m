Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A34BC54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 12:14:49 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.22627.1747916087913587577
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 May 2025 05:14:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=pCHukOCr;
 spf=pass (domain: konsulko.com, ip: 209.85.160.175, mailfrom: leon.anavi@konsulko.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4767e969b94so139136101cf.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 May 2025 05:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1747916087; x=1748520887; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GJE3farRLNT2jf61NImj2+fs8zi8m/RsNvsLw1Mjl7Y=;
        b=pCHukOCrk7XbIfjMAG2ccSX368huONf8EvMv06sow6oARqWkrR6UKtu9t1DrB4ddhD
         FkiUhPeujWeffQJHPluS51L+8pxi4sqZD495xoLlJArEyosZWPPfflYSQ423QF9TOoq8
         MCPcXjxIKZQcJxuzOfBbLt3XFAT5CvpBkSlq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747916087; x=1748520887;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GJE3farRLNT2jf61NImj2+fs8zi8m/RsNvsLw1Mjl7Y=;
        b=tlOo3dFR3rEA9oSQWRg29wRbpZjHk/puVN2Gs6FJ/PcnkzFNdeeN5VhI0kvUcCgTbq
         aygxrNsNnkaS9ZhSBk0by3RpK0QIc4ucLbfZlgGGAqSZPunEEGHkFhmQqKFxo1qQ/65L
         PhutVvD9nVdAKV9AUO1a+q3ldBWpC1LyQBL5riwG8RW+OAwf5aIohbXW134sKRX4FR7z
         CY6k9GLbL6VrBbpOi+Y/z0fODPxIT0ylE3IpYskShp7M4tVsu12+YSajIaNjlr2Q/++/
         66FgCnZ/s53fMfrg4c91Ty6OxWh9QyP9fY+/8B6v+4SlQNQHAiT7XiTYtpYaQKnMYZ7r
         Sv7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVVo0MaZfIEq5OA/T7MlWQxIPJR2ulgju6nNuMluEM4kAmUK9QvhoGvpAJwJ4b2aZGuV28wYiLGnE6iLrSEAAjMdVo=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw0qvmkvhPtkccAGz4TNhVltt8eh/KxVHR6KGr3WDXDJGWHRYbT
	GG3u1O20HEbp3/rjHvkq6BF9Tv7DrCN9IL31/mF0E/lSOlQB/UZ2x53gDccqiQxIQX2UiqCqz1X
	uzY1smEb1zylW3sVz8/PaEwBqY/8a3Bbsb2lCeLt8yQ==
X-Gm-Gg: ASbGncs0+YcCsHC4aH0jgj1dTHOQgj6yLc6RSsl+kKjRB9ZmYNym0fanYO3li3YYVY0
	Iz4M/bYlJXmMJ5OXyvdZNqVfIFzrO1O2706bepu6SJqKoAhdhN4NLrzkMtkdhAhSAkju70Pa+UJ
	CfGPgFlUNk5uK3l2dBXLRU6ToFudqjvEw=
X-Google-Smtp-Source: AGHT+IGTfH2fM9G3Ud+9606W8+Y5G7zGyxDrLYEpHIkOxYg6We9PJ8UiZHTADhH3nF3rqRFumgPS0xw+LnbgyLgRAFw=
X-Received: by 2002:a05:622a:986:b0:47a:eade:95ec with SMTP id
 d75a77b69052e-494b0956ea0mr408247641cf.38.1747916085898; Thu, 22 May 2025
 05:14:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250508063335.1498917-1-leon.anavi@konsulko.com>
 <CAMSfU+66CD4OPMjf4ofm1UEDY4TqSsrdppaeOg-qCYBCPVf2yw@mail.gmail.com> <CAMKF1sqs3n66kb-qbM+22PLPNGf6qFNEjgbX6m7YVnnVGKTLnw@mail.gmail.com>
In-Reply-To: <CAMKF1sqs3n66kb-qbM+22PLPNGf6qFNEjgbX6m7YVnnVGKTLnw@mail.gmail.com>
From: Leon Anavi <leon.anavi@konsulko.com>
Date: Thu, 22 May 2025 15:14:33 +0300
X-Gm-Features: AX0GCFuxm9Raj5tnHOcWKiKIsErhBYcJF61BRRRHQnSgrgIYhLuECS_7jGhvyjQ
Message-ID: <CALtQ3O1qMj2CxSYPFn4vkpygkEjZSd5=LMy3fhcSCMrjJQvX9Q@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCHv2] python3-pillow-heif: Add recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: yoann.congal@smile.fr, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000065c95e0635b86db3"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 May 2025 12:14:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117590

--00000000000065c95e0635b86db3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann, Khem,

On Mon, May 19, 2025 at 12:56=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrot=
e:

> On Sun, May 18, 2025 at 2:03=E2=80=AFPM Yoann Congal via
> lists.openembedded.org <yoann.congal=3Dsmile.fr@lists.openembedded.org>
> wrote:
> >
> >
> >
> > Le jeu. 8 mai 2025 =C3=A0 08:33, Leon Anavi via lists.openembedded.org
> <leon.anavi=3Dkonsulko.com@lists.openembedded.org> a =C3=A9crit :
> >>
> >> Add recipe for release 0.22.0:
> >>
> >> - Boolean pillow_heif.options.DISABLE_SECURITY_LIMITS to bypass
> >>   security limit of libheif for the image size.
> >> - libx265 library was updated to the latest 4.1 version.
> >> - libheif was updated from the 1.19.5 to 1.19.7 version.
> >> - AVIF format marked as deprecated and pending for the removal.
> >>
> >> This work was sponsored by GOVCERT.LU.
> >>
> >> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> >
> >
> > Hello,
> >
> > This recipe triggers build failures when doing a meta-python world buil=
d
> : libheif is in meta-multimedia but meta-python does not depend on
> meta-multimedia.
> >
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/46/ste=
ps/41/logs/stdio
> (line 74)
> >
> > Maybe this recipe should be moved to meta-multimedia?
> >
> > NB: meta-multimedia does depends on meta-python
> >
>
> Seems good to me. Please send a patch
>

Thank you for the suggestion. As you recommended, I have just sent a patch
to move  python3-pillow-heif to meta-multimedia:
https://lists.openembedded.org/g/openembedded-devel/topic/meta_multimedia_p=
atch/113245750

Best regards,
Leon


>
> > Regards,
> >>
> >> ---
> >>  ...001-setup.py-support-cross-compiling.patch | 56 ++++++++++++++++++=
+
> >>  .../python/python3-pillow-heif_0.22.0.bb      | 20 +++++++
> >>  2 files changed, 76 insertions(+)
> >>  create mode 100644
> meta-python/recipes-devtools/python/python3-pillow-heif/0001-setup.py-sup=
port-cross-compiling.patch
> >>  create mode 100644 meta-python/recipes-devtools/python/
> python3-pillow-heif_0.22.0.bb
> >>
> >> diff --git
> a/meta-python/recipes-devtools/python/python3-pillow-heif/0001-setup.py-s=
upport-cross-compiling.patch
> b/meta-python/recipes-devtools/python/python3-pillow-heif/0001-setup.py-s=
upport-cross-compiling.patch
> >> new file mode 100644
> >> index 0000000000..66cf7a9244
> >> --- /dev/null
> >> +++
> b/meta-python/recipes-devtools/python/python3-pillow-heif/0001-setup.py-s=
upport-cross-compiling.patch
> >> @@ -0,0 +1,56 @@
> >> +From 98e6831754712221ce030ce8b27e100a3926c543 Mon Sep 17 00:00:00 200=
1
> >> +From: Leon Anavi <leon.anavi@konsulko.com>
> >> +Date: Mon, 5 May 2025 16:08:37 +0000
> >> +Subject: [PATCH] setup.py: support cross compiling
> >> +
> >> +Upstream-Status: Inappropriate [oe specific]
> >> +
> >> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> >> +---
> >> + setup.py | 19 +++++++++++--------
> >> + 1 file changed, 11 insertions(+), 8 deletions(-)
> >> +
> >> +diff --git a/setup.py b/setup.py
> >> +index 68945e4..67566e8 100644
> >> +--- a/setup.py
> >> ++++ b/setup.py
> >> +@@ -125,12 +125,12 @@ class PillowHeifBuildExt(build_ext):
> >> +                     self._add_directory(library_dirs, match.group(1)=
)
> >> +
> >> +         # include, rpath, if set as environment variables
> >> +-        for k in ("C_INCLUDE_PATH", "CPATH", "INCLUDE"):
> >> ++        for k in ("C_INCLUDE_PATH", "CPATH", "INCLUDE",
> "STAGING_INCDIR"):
> >> +             if k in os.environ:
> >> +                 for d in os.environ[k].split(os.path.pathsep):
> >> +                     self._add_directory(include_dirs, d)
> >> +
> >> +-        for k in ("LD_RUN_PATH", "LIBRARY_PATH", "LIB"):
> >> ++        for k in ("LD_RUN_PATH", "LIBRARY_PATH", "LIB",
> "STAGING_LIBDIR"):
> >> +             if k in os.environ:
> >> +                 for d in os.environ[k].split(os.path.pathsep):
> >> +                     self._add_directory(library_dirs, d)
> >> +@@ -199,12 +199,15 @@ class PillowHeifBuildExt(build_ext):
> >> +             self._update_extension("_pillow_heif", ["heif"],
> extra_compile_args=3D["-O3", "-Werror"])
> >> +         else:  # let's assume it's some kind of linux
> >> +             # this old code waiting for refactoring, when time comes=
.
> >> +-            self._add_directory(include_dirs, "/usr/local/include")
> >> +-            self._add_directory(include_dirs, "/usr/include")
> >> +-            self._add_directory(library_dirs, "/usr/local/lib")
> >> +-            self._add_directory(library_dirs, "/usr/lib64")
> >> +-            self._add_directory(library_dirs, "/usr/lib")
> >> +-            self._add_directory(library_dirs, "/lib")
> >> ++            include_os_path =3D os.environ.get("STAGING_INCDIR")
> >> ++            if include_os_path:
> >> ++                for path in include_os_path.split(os.pathsep):
> >> ++                    self._add_directory(include_dirs, path)
> >> ++
> >> ++            lib_os_path =3D os.environ.get("STAGING_LIBDIR")
> >> ++            if lib_os_path:
> >> ++                for path in lib_os_path.split(os.pathsep):
> >> ++                    self._add_directory(library_dirs, path)
> >> +
> >> +             self._update_extension("_pillow_heif", ["heif"],
> extra_compile_args=3D["-O3", "-Werror"])
> >> +
> >> +--
> >> +2.39.5
> >> +
> >> diff --git a/meta-python/recipes-devtools/python/
> python3-pillow-heif_0.22.0.bb b/meta-python/recipes-devtools/python/
> python3-pillow-heif_0.22.0.bb
> >> new file mode 100644
> >> index 0000000000..7f5dfac702
> >> --- /dev/null
> >> +++ b/meta-python/recipes-devtools/python/python3-pillow-heif_0.22.0.b=
b
> >> @@ -0,0 +1,20 @@
> >> +DESCRIPTION =3D "Python interface for libheif library"
> >> +HOMEPAGE =3D "https://github.com/bigcat88/pillow_heif"
> >> +LICENSE =3D "BSD-3-Clause"
> >> +LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3Db6c07a92aed67c33bc346748d7c7e991"
> >> +
> >> +# While this item does not require it, it depends on libheif which do=
es
> >> +LICENSE_FLAGS =3D "commercial"
> >> +
> >> +PYPI_PACKAGE =3D "pillow_heif"
> >> +
> >> +inherit pypi python_setuptools_build_meta
> >> +
> >> +SRC_URI +=3D "file://0001-setup.py-support-cross-compiling.patch"
> >> +SRC_URI[sha256sum] =3D
> "61d473929340d3073722f6316b7fbbdb11132faa6bac0242328e8436cc55b39a"
> >> +
> >> +DEPENDS +=3D "libheif"
> >> +
> >> +RDEPENDS:${PN} +=3D "python3-pillow"
> >> +
> >> +BBCLASSEXTEND =3D "native nativesdk"
> >> --
> >> 2.39.5
> >>
> >>
> >>
> >>
> >
> >
> > --
> > Yoann Congal
> > Smile ECS
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#117464):
> https://lists.openembedded.org/g/openembedded-devel/message/117464
> > Mute This Topic: https://lists.openembedded.org/mt/112783025/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--00000000000065c95e0635b86db3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Yoann, Khem,<br><br></div><div class=3D"gmail_quot=
e gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, May =
19, 2025 at 12:56=E2=80=AFAM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.=
com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">On Sun, May 18, 2025 at 2:03=E2=80=AFPM Yoann Congal=
 via<br>
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
245750">https://lists.openembedded.org/g/openembedded-devel/topic/meta_mult=
imedia_patch/113245750</a><br><br>Best regards,<br>Leon</div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
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

--00000000000065c95e0635b86db3--

