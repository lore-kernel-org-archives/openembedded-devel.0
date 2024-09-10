Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4057BECE58D
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 13:47:55 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web10.22694.1725972938925785197
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 05:55:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gaT5wHQV;
 spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: tolvupostur@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5e1bba9ac9eso1334219eaf.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 05:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725972938; x=1726577738; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ijS0w5YCOgK1lZIheoYI+XE8q6NqR68My10w02RJsRk=;
        b=gaT5wHQVHFH5eJJ8KfED5Z6TFFKGYsGQJTZW8u9uyCl7z2tSvt1r3e5ceLMit3g9B7
         qwIPVcJiiMknBmdePscu5ZvmGwCl+UnTKKTmfOusbL7SN3+psF+9xMt6qDz+qyx/9vNl
         879kC0O1RaRTeuDUR8t+vMfkcAzgZV6t3EqEIvGwLWNry1PorINFAnL8SeDi/kLrKfY1
         95ROn7CsNuzIBJj2iChqCqNRCYF6PfAyF8DjZOnSLA+Ly+woobg+0ggdvV+Ot11NuhJe
         wjH9mZm+J0L45rGOWSg3TWwe9BCYZaD8oyynC6mHlONMFozYsSyXYHWOvIopMRu2o5gq
         aiWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725972938; x=1726577738;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ijS0w5YCOgK1lZIheoYI+XE8q6NqR68My10w02RJsRk=;
        b=S62Alg01cGH7vyRsMX1j2v0pA9PQTTRc8Zg+3wW2HLBsHYSO3SZ7/pnODpWrnAEffY
         IYypI2OE15uL73RyW2akUIl5PsWe2Y1N2cI67/ZFjKElFnhRYHJFEpjSM8SXgAYyoaaG
         51CZXSUlt7uOxkDl6E3T20qf0icQERoVpohyhgRzwJtZWUaXSSOZGcxr5IXwMzrnG4d9
         dIe/bt3ZgEHPaIjIfIKbAiQOm0Ndx3CfGUQEPoRFT/7rD7Cn4ATPRBQTW3+gtWKxKJ5g
         6biJqESaiyt5nOXADpFZ1qi3KXZr6dwfv4eZOGR9YrcyuzUzBNEV4X/53p+sNHo3HTow
         13hw==
X-Gm-Message-State: AOJu0YyzJSYRicD8jyCWl6G1nIiPTgMzX6Xw45j+kOFQq2dL483duffI
	U2dasIx6poK2Ih8GNqvHwdl/qeNwT6T69T+sl2IVSaDqVPQT8UvcFzV9jGTG8i4SrETr7Hw6jY1
	lHTc0EdhKV0kOfdQRvGjUVJToxK2ycnLj28tSiQ==
X-Google-Smtp-Source: AGHT+IF+OACrTvi84nOsV9zrUUbXGY1Y2cay4Eqjp/NsEZOXFaP1FbBtjoZhXtiT0VbfHh08CKOmWvMb9uMfx3jujG8=
X-Received: by 2002:a05:6871:2b07:b0:259:8858:a330 with SMTP id
 586e51a60fabf-27be6d1d96fmr1214590fac.22.1725972937775; Tue, 10 Sep 2024
 05:55:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240910125239.21286-1-tolvupostur@gmail.com>
In-Reply-To: <20240910125239.21286-1-tolvupostur@gmail.com>
From: "Einar Gunnarsson" <tolvupostur@gmail.com>
Date: Tue, 10 Sep 2024 14:55:26 +0200
Message-ID: <CABhNV217uTWQBD-1x2pPFLOvPjpR_uj-+_D2c=NwnKir70O0rw@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] v4l-utils: Install media ctrl pkgconfig files
To: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d921f70621c363fa"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 13:47:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112231

--000000000000d921f70621c363fa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all

I'm not sure if this one should be a separate patch file or simply added
to
file://0001-media-ctl-Install-media-ctl-header-and-library-files.patch

I was not able to use the libraries without the pkgconfig files, but this
makes CMake
integration easy.
Best regards
Einar Jon

On Tue, 10 Sept 2024 at 14:52, Einar Jon Gunnarsson <tolvupostur@gmail.com>
wrote:

> Commit 5f453c3401e20eb5489fac4d3b54a5bf96d019ab installs
> libraries but without the pkgconfig files, making them harder to link
> to. This adds pkgconfig files for these libraries
>
> Signed-off-by: Einar Jon Gunnarsson <tolvupostur@gmail.com>
> ---
>  ...l-Install-media-ctl-pkg-config-files.patch | 49 +++++++++++++++++++
>  .../v4l2apps/v4l-utils_1.26.1.bb              |  1 +
>  2 files changed, 50 insertions(+)
>  create mode 100644
> meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-media-ctl-Install-medi=
a-ctl-pkg-config-files.patch
>
> diff --git
> a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-media-ctl-Install-me=
dia-ctl-pkg-config-files.patch
> b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-media-ctl-Install-me=
dia-ctl-pkg-config-files.patch
> new file mode 100644
> index 000000000..8a009ae80
> --- /dev/null
> +++
> b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-media-ctl-Install-me=
dia-ctl-pkg-config-files.patch
> @@ -0,0 +1,49 @@
> +From a422ddf7f8805d34ff1fbb46d335993c9cd05ead Mon Sep 17 00:00:00 2001
> +From: Einar Jon Gunnarsson <tolvupostur@gmail.com>
> +Date: Fri, 10 May 2024 11:56:17 +0200
> +Subject: [PATCH] media-ctl: Install media-ctl pkg-config files
> +
> +libv4l2subdev/libmediactl can not be used in projects without the
> +pkg-config files. This adds them as well.
> +
> +Upstream-Status: Denied
> +
> +This is an add-on to the previous patch:
> +0001-media-ctl-Install-media-ctl-header-and-library-files.patch
> +so same restrictions apply.
> +
> +Signed-off-by: Einar Jon Gunnarsson <tolvupostur@gmail.com>
> +---
> + utils/media-ctl/meson.build | 12 ++++++++++++
> + 1 file changed, 12 insertions(+)
> +
> +diff --git a/utils/media-ctl/meson.build b/utils/media-ctl/meson.build
> +index 40669b4c..6feba1af 100644
> +--- a/utils/media-ctl/meson.build
> ++++ b/utils/media-ctl/meson.build
> +@@ -38,6 +38,12 @@ libv4l2subdev =3D library('v4l2subdev',
> +
> + dep_libv4l2subdev =3D declare_dependency(link_with : libv4l2subdev)
> +
> ++pkg.generate(
> ++      libv4l2subdev,
> ++      name : 'libv4l2subdev',
> ++      version : meson.project_version(),
> ++      description : 'v4l2 subdev library')
> ++
> + media_ctl_sources =3D files(
> +     'media-ctl.c',
> +     'options.c',
> +@@ -55,3 +61,9 @@ media_ctl =3D executable('media-ctl',
> +                        dependencies : media_ctl_deps,
> +                        install : true,
> +                        include_directories : v4l2_utils_incdir)
> ++
> ++pkg.generate(
> ++     libmediactl,
> ++     name : 'libmediactl',
> ++     version : meson.project_version(),
> ++     description : 'v4l2 mediactl library')
> +--
> +2.43.5
> +
> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
> b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
> index eb38d9713..8ab96760a 100644
> --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
> +++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
> @@ -29,6 +29,7 @@ SRC_URI =3D "\
>      git://git.linuxtv.org/v4l-utils.git;protocol=3Dhttps;branch=3Dstable=
-1.26
> \
>
>  file://0001-keytable-meson-Restrict-the-installation-of-50-rc_ke.patch \
>
>  file://0001-media-ctl-Install-media-ctl-header-and-library-files.patch \
> +    file://0002-media-ctl-Install-media-ctl-pkg-config-files.patch \
>  "
>
>  SRCREV =3D "4aee01a027923cab1e40969f56f8ba58d3e6c0d1"
> --
> 2.43.5
>
>

--=20
Regards
Einar J=C3=B3n
+31 610 957234

--000000000000d921f70621c363fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi all<br><div><div><br>I&#39;m not sure =
if this one should be a separate patch file or simply added to=C2=A0 <br>fi=
le://0001-media-ctl-Install-media-ctl-header-and-library-files.patch

<br><br></div><div>I was not able to use the libraries without the pkgconfi=
g files, but this makes CMake <br>integration easy.<br></div><div></div></d=
iv></div><div>Best regards<br></div><div>Einar Jon<br></div><div><br></div>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 10=
 Sept 2024 at 14:52, Einar Jon Gunnarsson &lt;<a href=3D"mailto:tolvupostur=
@gmail.com">tolvupostur@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Commit 5f453c3401e20eb5489fac4d3b54a5bf96d=
019ab installs<br>
libraries but without the pkgconfig files, making them harder to link<br>
to. This adds pkgconfig files for these libraries<br>
<br>
Signed-off-by: Einar Jon Gunnarsson &lt;<a href=3D"mailto:tolvupostur@gmail=
.com" target=3D"_blank">tolvupostur@gmail.com</a>&gt;<br>
---<br>
=C2=A0...l-Install-media-ctl-pkg-config-files.patch | 49 ++++++++++++++++++=
+<br>
=C2=A0.../v4l2apps/<a href=3D"http://v4l-utils_1.26.1.bb" rel=3D"noreferrer=
" target=3D"_blank">v4l-utils_1.26.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A02 files changed, 50 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002=
-media-ctl-Install-media-ctl-pkg-config-files.patch<br>
<br>
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-media-ctl-I=
nstall-media-ctl-pkg-config-files.patch b/meta-oe/recipes-multimedia/v4l2ap=
ps/v4l-utils/0002-media-ctl-Install-media-ctl-pkg-config-files.patch<br>
new file mode 100644<br>
index 000000000..8a009ae80<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-media-ctl-Install-=
media-ctl-pkg-config-files.patch<br>
@@ -0,0 +1,49 @@<br>
+From a422ddf7f8805d34ff1fbb46d335993c9cd05ead Mon Sep 17 00:00:00 2001<br>
+From: Einar Jon Gunnarsson &lt;<a href=3D"mailto:tolvupostur@gmail.com" ta=
rget=3D"_blank">tolvupostur@gmail.com</a>&gt;<br>
+Date: Fri, 10 May 2024 11:56:17 +0200<br>
+Subject: [PATCH] media-ctl: Install media-ctl pkg-config files<br>
+<br>
+libv4l2subdev/libmediactl can not be used in projects without the<br>
+pkg-config files. This adds them as well.<br>
+<br>
+Upstream-Status: Denied<br>
+<br>
+This is an add-on to the previous patch:<br>
+0001-media-ctl-Install-media-ctl-header-and-library-files.patch<br>
+so same restrictions apply.<br>
+<br>
+Signed-off-by: Einar Jon Gunnarsson &lt;<a href=3D"mailto:tolvupostur@gmai=
l.com" target=3D"_blank">tolvupostur@gmail.com</a>&gt;<br>
+---<br>
+ utils/media-ctl/meson.build | 12 ++++++++++++<br>
+ 1 file changed, 12 insertions(+)<br>
+<br>
+diff --git a/utils/media-ctl/meson.build b/utils/media-ctl/meson.build<br>
+index 40669b4c..6feba1af 100644<br>
+--- a/utils/media-ctl/meson.build<br>
++++ b/utils/media-ctl/meson.build<br>
+@@ -38,6 +38,12 @@ libv4l2subdev =3D library(&#39;v4l2subdev&#39;,<br>
+ <br>
+ dep_libv4l2subdev =3D declare_dependency(link_with : libv4l2subdev)<br>
+ <br>
++pkg.generate(<br>
++=C2=A0 =C2=A0 =C2=A0 libv4l2subdev,<br>
++=C2=A0 =C2=A0 =C2=A0 name : &#39;libv4l2subdev&#39;,<br>
++=C2=A0 =C2=A0 =C2=A0 version : meson.project_version(),<br>
++=C2=A0 =C2=A0 =C2=A0 description : &#39;v4l2 subdev library&#39;)<br>
++<br>
+ media_ctl_sources =3D files(<br>
+=C2=A0 =C2=A0 =C2=A0&#39;media-ctl.c&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0&#39;options.c&#39;,<br>
+@@ -55,3 +61,9 @@ media_ctl =3D executable(&#39;media-ctl&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dependencies : media_ctl_deps,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 install : true,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 include_directories : v4l2_utils_incdir)<br>
++<br>
++pkg.generate(<br>
++=C2=A0 =C2=A0 =C2=A0libmediactl,<br>
++=C2=A0 =C2=A0 =C2=A0name : &#39;libmediactl&#39;,<br>
++=C2=A0 =C2=A0 =C2=A0version : meson.project_version(),<br>
++=C2=A0 =C2=A0 =C2=A0description : &#39;v4l2 mediactl library&#39;)<br>
+-- <br>
+2.43.5<br>
+<br>
diff --git a/meta-oe/recipes-multimedia/v4l2apps/<a href=3D"http://v4l-util=
s_1.26.1.bb" rel=3D"noreferrer" target=3D"_blank">v4l-utils_1.26.1.bb</a> b=
/meta-oe/recipes-multimedia/v4l2apps/<a href=3D"http://v4l-utils_1.26.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">v4l-utils_1.26.1.bb</a><br>
index eb38d9713..8ab96760a 100644<br>
--- a/meta-oe/recipes-multimedia/v4l2apps/<a href=3D"http://v4l-utils_1.26.=
1.bb" rel=3D"noreferrer" target=3D"_blank">v4l-utils_1.26.1.bb</a><br>
+++ b/meta-oe/recipes-multimedia/v4l2apps/<a href=3D"http://v4l-utils_1.26.=
1.bb" rel=3D"noreferrer" target=3D"_blank">v4l-utils_1.26.1.bb</a><br>
@@ -29,6 +29,7 @@ SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://git.linuxtv.org/v4l-utils.git;p=
rotocol=3Dhttps;branch=3Dstable-1.26" rel=3D"noreferrer" target=3D"_blank">=
git.linuxtv.org/v4l-utils.git;protocol=3Dhttps;branch=3Dstable-1.26</a> \<b=
r>
=C2=A0 =C2=A0 =C2=A0file://0001-keytable-meson-Restrict-the-installation-of=
-50-rc_ke.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-media-ctl-Install-media-ctl-header-and-libr=
ary-files.patch \<br>
+=C2=A0 =C2=A0 file://0002-media-ctl-Install-media-ctl-pkg-config-files.pat=
ch \<br>
=C2=A0&quot;<br>
<br>
=C2=A0SRCREV =3D &quot;4aee01a027923cab1e40969f56f8ba58d3e6c0d1&quot;<br>
-- <br>
2.43.5<br>
<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Regards<br>Ei=
nar J=C3=B3n<br>+31 610 957234</div></div>

--000000000000d921f70621c363fa--

