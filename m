Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EED20C3ABD8
	for <webhook@archiver.kernel.org>; Sun, 18 May 2025 21:03:07 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.37634.1747602178661717448
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 May 2025 14:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=t6Kqoesm;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a36ab95a13so481632f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 May 2025 14:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1747602177; x=1748206977; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7+tEMYySD4QmtIDIGkd/dn+kRR7SJcBSYXMm2/DzVV0=;
        b=t6KqoesmpaEu/mlQ6aKNJktpdBT8r0PRykjuNDeok7ESo45PbXb4cxqeMoi/UCGOa0
         UidF6e91Efd1VBxqaAdwGbSQn0JmVAyW14vPLuLheAqn+brV3s/VhPl6y3JQkwSgE+9W
         xkCICNJ6DN2dVyEy3SHCVGgTWuvCRco2HLiBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747602177; x=1748206977;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7+tEMYySD4QmtIDIGkd/dn+kRR7SJcBSYXMm2/DzVV0=;
        b=LMfesnsWhtIv+D4qFnTV2Hds7cFJcPcaICGwhzFhGsrwSRDOVKn6X/X8GWcqEHBnkz
         E1R6pESEMmGCnnwBFIt0k+RFXzeWd0bydPf63EbTBq/kQhgRJXNC8q0mOhZ9o+dNLj01
         P/U9dGR5Y9vYxVxHJAfOqC3KsU87PO9oLFJsY50FRyKoQJQcXWnzg9yScdZk+NEwPWjc
         KgQf1G30hiC9l4vUl50wjXwmDIdUsm8164iyVzsTrFCfnw+gMppfB/6tRAAhcDA7yGV2
         7oC6CsuY0o6eIn3pypWa1bzdYeNjkpd22FLs4pNq8et3AE2QsMZJ3WR+3Qv4S+Z/2OJK
         6lCg==
X-Gm-Message-State: AOJu0YxSItDl0hAKLhGgA7Krce+kBwYYXhxWNfWvWGuXCUGl/2alOFWX
	JI/WuGEojg03TQnSPG/P3X4FTbEtZUXYWy+/v8uWWq/GFHQgc0ZIYnJXA7Mfl545jCehfxZreYp
	6CzAdmMFjj/3mtJhW3SdQfSR5jiF4MQ0SD8zg4fKbjA==
X-Gm-Gg: ASbGncsSji4k5PnChp8XsGnWyqCHaNvv61o4mUXUTftzc1qTfrNHVBTx89HGLXarXkU
	y00736Zhl+JYs+qniu0usUD0bKIcSS/P9hni+UU3I1Dn9PW/hRQ0EHRKBPCUiPf8h22RlWLh1zY
	hKbB+rSHJz0GbGXZJDPk18KtW7JH4q5yTpBx+efstTCKM/swOQStOBDts3UNJvjchbjeH+4AYxn
	lDgDw==
X-Google-Smtp-Source: AGHT+IHGrighCZ1PziNjnEx6AkqIbOXegubcy4MA2G4W1Pwxoqga33Bb/Ui647TWQaaU3c+a2TpdcSBsgxT2z/tNdGM=
X-Received: by 2002:a5d:5f83:0:b0:3a3:6bff:973e with SMTP id
 ffacd0b85a97d-3a36bff9910mr2170837f8f.56.1747602176916; Sun, 18 May 2025
 14:02:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250508063335.1498917-1-leon.anavi@konsulko.com>
In-Reply-To: <20250508063335.1498917-1-leon.anavi@konsulko.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Sun, 18 May 2025 23:02:30 +0200
X-Gm-Features: AX0GCFvpNsB2N5epEmJnqnOQBkfPzgRhcO4Cek0psKywmU5Zu9GEV2iGD2s-3wM
Message-ID: <CAMSfU+66CD4OPMjf4ofm1UEDY4TqSsrdppaeOg-qCYBCPVf2yw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCHv2] python3-pillow-heif: Add recipe
To: leon.anavi@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f6d33806356f5607"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 May 2025 21:03:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117464

--000000000000f6d33806356f5607
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 8 mai 2025 =C3=A0 08:33, Leon Anavi via lists.openembedded.org
<leon.anavi=3Dkonsulko.com@lists.openembedded.org> a =C3=A9crit :

> Add recipe for release 0.22.0:
>
> - Boolean pillow_heif.options.DISABLE_SECURITY_LIMITS to bypass
>   security limit of libheif for the image size.
> - libx265 library was updated to the latest 4.1 version.
> - libheif was updated from the 1.19.5 to 1.19.7 version.
> - AVIF format marked as deprecated and pending for the removal.
>
> This work was sponsored by GOVCERT.LU.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>

Hello,

This recipe triggers build failures when doing a meta-python world build :
libheif is in meta-multimedia but meta-python does not depend on
meta-multimedia.
https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/46/steps=
/41/logs/stdio
(line 74)

Maybe this recipe should be moved to meta-multimedia?

NB: meta-multimedia does depends on meta-python

Regards,

> ---
>  ...001-setup.py-support-cross-compiling.patch | 56 +++++++++++++++++++
>  .../python/python3-pillow-heif_0.22.0.bb      | 20 +++++++
>  2 files changed, 76 insertions(+)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pillow-heif/0001-setup.py-sup=
port-cross-compiling.patch
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-pillow-heif_0.22.0.bb
>
> diff --git
> a/meta-python/recipes-devtools/python/python3-pillow-heif/0001-setup.py-s=
upport-cross-compiling.patch
> b/meta-python/recipes-devtools/python/python3-pillow-heif/0001-setup.py-s=
upport-cross-compiling.patch
> new file mode 100644
> index 0000000000..66cf7a9244
> --- /dev/null
> +++
> b/meta-python/recipes-devtools/python/python3-pillow-heif/0001-setup.py-s=
upport-cross-compiling.patch
> @@ -0,0 +1,56 @@
> +From 98e6831754712221ce030ce8b27e100a3926c543 Mon Sep 17 00:00:00 2001
> +From: Leon Anavi <leon.anavi@konsulko.com>
> +Date: Mon, 5 May 2025 16:08:37 +0000
> +Subject: [PATCH] setup.py: support cross compiling
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> +---
> + setup.py | 19 +++++++++++--------
> + 1 file changed, 11 insertions(+), 8 deletions(-)
> +
> +diff --git a/setup.py b/setup.py
> +index 68945e4..67566e8 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -125,12 +125,12 @@ class PillowHeifBuildExt(build_ext):
> +                     self._add_directory(library_dirs, match.group(1))
> +
> +         # include, rpath, if set as environment variables
> +-        for k in ("C_INCLUDE_PATH", "CPATH", "INCLUDE"):
> ++        for k in ("C_INCLUDE_PATH", "CPATH", "INCLUDE",
> "STAGING_INCDIR"):
> +             if k in os.environ:
> +                 for d in os.environ[k].split(os.path.pathsep):
> +                     self._add_directory(include_dirs, d)
> +
> +-        for k in ("LD_RUN_PATH", "LIBRARY_PATH", "LIB"):
> ++        for k in ("LD_RUN_PATH", "LIBRARY_PATH", "LIB",
> "STAGING_LIBDIR"):
> +             if k in os.environ:
> +                 for d in os.environ[k].split(os.path.pathsep):
> +                     self._add_directory(library_dirs, d)
> +@@ -199,12 +199,15 @@ class PillowHeifBuildExt(build_ext):
> +             self._update_extension("_pillow_heif", ["heif"],
> extra_compile_args=3D["-O3", "-Werror"])
> +         else:  # let's assume it's some kind of linux
> +             # this old code waiting for refactoring, when time comes.
> +-            self._add_directory(include_dirs, "/usr/local/include")
> +-            self._add_directory(include_dirs, "/usr/include")
> +-            self._add_directory(library_dirs, "/usr/local/lib")
> +-            self._add_directory(library_dirs, "/usr/lib64")
> +-            self._add_directory(library_dirs, "/usr/lib")
> +-            self._add_directory(library_dirs, "/lib")
> ++            include_os_path =3D os.environ.get("STAGING_INCDIR")
> ++            if include_os_path:
> ++                for path in include_os_path.split(os.pathsep):
> ++                    self._add_directory(include_dirs, path)
> ++
> ++            lib_os_path =3D os.environ.get("STAGING_LIBDIR")
> ++            if lib_os_path:
> ++                for path in lib_os_path.split(os.pathsep):
> ++                    self._add_directory(library_dirs, path)
> +
> +             self._update_extension("_pillow_heif", ["heif"],
> extra_compile_args=3D["-O3", "-Werror"])
> +
> +--
> +2.39.5
> +
> diff --git a/meta-python/recipes-devtools/python/
> python3-pillow-heif_0.22.0.bb b/meta-python/recipes-devtools/python/
> python3-pillow-heif_0.22.0.bb
> new file mode 100644
> index 0000000000..7f5dfac702
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pillow-heif_0.22.0.bb
> @@ -0,0 +1,20 @@
> +DESCRIPTION =3D "Python interface for libheif library"
> +HOMEPAGE =3D "https://github.com/bigcat88/pillow_heif"
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3Db6c07a92aed67c33bc346748d7c7e991"
> +
> +# While this item does not require it, it depends on libheif which does
> +LICENSE_FLAGS =3D "commercial"
> +
> +PYPI_PACKAGE =3D "pillow_heif"
> +
> +inherit pypi python_setuptools_build_meta
> +
> +SRC_URI +=3D "file://0001-setup.py-support-cross-compiling.patch"
> +SRC_URI[sha256sum] =3D
> "61d473929340d3073722f6316b7fbbdb11132faa6bac0242328e8436cc55b39a"
> +
> +DEPENDS +=3D "libheif"
> +
> +RDEPENDS:${PN} +=3D "python3-pillow"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117361):
> https://lists.openembedded.org/g/openembedded-devel/message/117361
> Mute This Topic: https://lists.openembedded.org/mt/112783025/4316185
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--000000000000f6d33806356f5607
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 8 =
mai 2025 =C3=A0=C2=A008:33, Leon Anavi via <a href=3D"http://lists.openembe=
dded.org">lists.openembedded.org</a> &lt;leon.anavi=3D<a href=3D"mailto:kon=
sulko.com@lists.openembedded.org">konsulko.com@lists.openembedded.org</a>&g=
t; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">Add recipe for release 0.22.0:<br>
<br>
- Boolean pillow_heif.options.DISABLE_SECURITY_LIMITS to bypass<br>
=C2=A0 security limit of libheif for the image size.<br>
- libx265 library was updated to the latest 4.1 version.<br>
- libheif was updated from the 1.19.5 to 1.19.7 version.<br>
- AVIF format marked as deprecated and pending for the removal.<br>
<br>
This work was sponsored by <a href=3D"http://GOVCERT.LU" rel=3D"noreferrer"=
 target=3D"_blank">GOVCERT.LU</a>.<br>
<br>
Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" ta=
rget=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br></blockquote><div><br></=
div><div>Hello,</div><div><br></div><div>This recipe triggers build failure=
s when doing a meta-python world build : libheif is in meta-multimedia but =
meta-python does not depend on meta-multimedia.</div><div><a href=3D"https:=
//autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/46/steps/41/lo=
gs/stdio">https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/build=
s/46/steps/41/logs/stdio</a> (line 74)</div><div><br></div><div>Maybe this =
recipe should be moved to meta-multimedia?</div><div><br></div><div>NB: met=
a-multimedia does depends on meta-python</div><div><br></div><div>Regards, =
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0...001-setup.py-support-cross-compiling.patch | 56 ++++++++++++++++++=
+<br>
=C2=A0.../python/<a href=3D"http://python3-pillow-heif_0.22.0.bb" rel=3D"no=
referrer" target=3D"_blank">python3-pillow-heif_0.22.0.bb</a>=C2=A0 =C2=A0 =
=C2=A0 | 20 +++++++<br>
=C2=A02 files changed, 76 insertions(+)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pillow=
-heif/0001-setup.py-support-cross-compiling.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-pillow-heif_0.22.0.bb" rel=3D"noreferrer" target=3D"_blank">pyt=
hon3-pillow-heif_0.22.0.bb</a><br>
<br>
diff --git a/meta-python/recipes-devtools/python/python3-pillow-heif/0001-s=
etup.py-support-cross-compiling.patch b/meta-python/recipes-devtools/python=
/python3-pillow-heif/0001-setup.py-support-cross-compiling.patch<br>
new file mode 100644<br>
index 0000000000..66cf7a9244<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/python3-pillow-heif/0001-setup.py=
-support-cross-compiling.patch<br>
@@ -0,0 +1,56 @@<br>
+From 98e6831754712221ce030ce8b27e100a3926c543 Mon Sep 17 00:00:00 2001<br>
+From: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" target=3D"=
_blank">leon.anavi@konsulko.com</a>&gt;<br>
+Date: Mon, 5 May 2025 16:08:37 +0000<br>
+Subject: [PATCH] setup.py: support cross compiling<br>
+<br>
+Upstream-Status: Inappropriate [oe specific]<br>
+<br>
+Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" t=
arget=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
+---<br>
+ setup.py | 19 +++++++++++--------<br>
+ 1 file changed, 11 insertions(+), 8 deletions(-)<br>
+<br>
+diff --git a/setup.py b/setup.py<br>
+index 68945e4..67566e8 100644<br>
+--- a/setup.py<br>
++++ b/setup.py<br>
+@@ -125,12 +125,12 @@ class PillowHeifBuildExt(build_ext):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0self._add_directory(library_dirs, match.group(1))<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# include, rpath, if set as environment =
variables<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for k in (&quot;C_INCLUDE_PATH&quot;, &quot;C=
PATH&quot;, &quot;INCLUDE&quot;):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 for k in (&quot;C_INCLUDE_PATH&quot;, &quot;C=
PATH&quot;, &quot;INCLUDE&quot;, &quot;STAGING_INCDIR&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if k in os.environ:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for d in os.=
environ[k].split(os.path.pathsep):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0self._add_directory(include_dirs, d)<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for k in (&quot;LD_RUN_PATH&quot;, &quot;LIBR=
ARY_PATH&quot;, &quot;LIB&quot;):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 for k in (&quot;LD_RUN_PATH&quot;, &quot;LIBR=
ARY_PATH&quot;, &quot;LIB&quot;, &quot;STAGING_LIBDIR&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if k in os.environ:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for d in os.=
environ[k].split(os.path.pathsep):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0self._add_directory(library_dirs, d)<br>
+@@ -199,12 +199,15 @@ class PillowHeifBuildExt(build_ext):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._update_extension(&qu=
ot;_pillow_heif&quot;, [&quot;heif&quot;], extra_compile_args=3D[&quot;-O3&=
quot;, &quot;-Werror&quot;])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:=C2=A0 # let&#39;s assume it&#39;s =
some kind of linux<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# this old code waiting fo=
r refactoring, when time comes.<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._add_directory(include_dir=
s, &quot;/usr/local/include&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._add_directory(include_dir=
s, &quot;/usr/include&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._add_directory(library_dir=
s, &quot;/usr/local/lib&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._add_directory(library_dir=
s, &quot;/usr/lib64&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._add_directory(library_dir=
s, &quot;/usr/lib&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._add_directory(library_dir=
s, &quot;/lib&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 include_os_path =3D os.environ.=
get(&quot;STAGING_INCDIR&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if include_os_path:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for path in inclu=
de_os_path.split(os.pathsep):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sel=
f._add_directory(include_dirs, path)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lib_os_path =3D os.environ.get(=
&quot;STAGING_LIBDIR&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if lib_os_path:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for path in lib_o=
s_path.split(os.pathsep):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sel=
f._add_directory(library_dirs, path)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._update_extension(&qu=
ot;_pillow_heif&quot;, [&quot;heif&quot;], extra_compile_args=3D[&quot;-O3&=
quot;, &quot;-Werror&quot;])<br>
+ <br>
+-- <br>
+2.39.5<br>
+<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pillow-heif_0.22.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pillow-=
heif_0.22.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://=
python3-pillow-heif_0.22.0.bb" rel=3D"noreferrer" target=3D"_blank">python3=
-pillow-heif_0.22.0.bb</a><br>
new file mode 100644<br>
index 0000000000..7f5dfac702<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pillow-=
heif_0.22.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pillow-heif_0.=
22.0.bb</a><br>
@@ -0,0 +1,20 @@<br>
+DESCRIPTION =3D &quot;Python interface for libheif library&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/bigcat88/pillow_heif" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/bigcat88/pillow_heif</=
a>&quot;<br>
+LICENSE =3D &quot;BSD-3-Clause&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3Db6c07a92aed67c33bc3467=
48d7c7e991&quot;<br>
+<br>
+# While this item does not require it, it depends on libheif which does<br=
>
+LICENSE_FLAGS =3D &quot;commercial&quot;<br>
+<br>
+PYPI_PACKAGE =3D &quot;pillow_heif&quot;<br>
+<br>
+inherit pypi python_setuptools_build_meta<br>
+<br>
+SRC_URI +=3D &quot;file://0001-setup.py-support-cross-compiling.patch&quot=
;<br>
+SRC_URI[sha256sum] =3D &quot;61d473929340d3073722f6316b7fbbdb11132faa6bac0=
242328e8436cc55b39a&quot;<br>
+<br>
+DEPENDS +=3D &quot;libheif&quot;<br>
+<br>
+RDEPENDS:${PN} +=3D &quot;python3-pillow&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-- <br>
2.39.5<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#117361): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/117361" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/117361</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/112783025/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/112783025/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" t=
arget=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000f6d33806356f5607--

