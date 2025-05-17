Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FBB9C2D0CD
	for <webhook@archiver.kernel.org>; Sat, 17 May 2025 06:09:26 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web10.7235.1747462164855536786
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 May 2025 23:09:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ngHQ26ZW;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3f6dccdcadaso2326918b6e.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 May 2025 23:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747462164; x=1748066964; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IKtqQLUaPjAdnqghKtaa3hjO3EFFxsjlCEEglt2E/S0=;
        b=ngHQ26ZWkXdha4tio87KIurrkYQmM4ynI2i+8YtJByvBm0quiQdnATokAPA6yzRs2n
         wClwCky7wEJrXGErFffFq4NI8IJFosPFe+kjzRZnDcV3MD33jMeuYkOMskBpcY7scTuL
         fvsN3ZCJNDDnIaeRnrJ6/H+ms4j+fAjS1GJL5uTVDcG0LuMDvCgCmjqGTbWIqctQxVog
         XHzOTQ/b6TCbwNODkRYL/oX8lyM+aeQ7XkrXEhh3zBXBT8pfXJPaRmOVBjJupBlOuYYw
         SKfyRo28MKeJ2caEdQA9vgtgqkAV+Lh0ZQEIH5sRvOfDhviVna5e70hZ3X9ogY4jH8DF
         eq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747462164; x=1748066964;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IKtqQLUaPjAdnqghKtaa3hjO3EFFxsjlCEEglt2E/S0=;
        b=B76C2GxJmMC2NJBmHl4qIZyFngVvnJpbaYBbUeygY9/ArBvwaOnBREeysP4akmSIyn
         APpgamAiJAwHwtb2vRX1YzUG1xj+1VcTcxUL15csnZ4P3gWwZuO9W6NE7wILApqMhAD0
         u4/37CI17HBUw+VbP+Q+1Gi3uso8+ewE3aEtE5/EXwQA6Uuux/yTTVORFgm7kjOYI6Fx
         kXU+XDMJXbsOUhlcmnjEZ5nB9UBNPK07sx+0BXZVpuvjT0x4583k96Y73udLQq6RMiaJ
         Ix9TRvlkI5TIzRUB4lwCa4MAOLmAtW3rhwcSoCYrdge1AiUwxZJR89b7lj9Tz7SbYAOS
         UBGA==
X-Gm-Message-State: AOJu0YzZOYSi8DROXvg5zOh2rQM3j/F1Z2JwPD5iobHCfA3cm5Islrdg
	of4hI8Ypr1jTqMkSG7+6kgJ2AKwKiL/gJSPy0XDo7ZgeIgezxiyGrSvtSE1wlmgCOeFLOClzVmD
	3Pf1p/HXPdDx3gdySh4l0cQNRyFf4Qag=
X-Gm-Gg: ASbGncszRRMBjjtRQ/ucUcULKgmxEyuWUf5n0uW/xlu3NYsoo2j0lHA5p4VuUq+kAom
	lmJnAvfM60h9tEYTgbFPCrRPnLxB1AOh9qh2UohVU9fX0pC5Y0eIyzzM4mKrUjQldC9rkRfy8JI
	3juD5AlsiNmuTHs6t0pjjlV1a9V3sqjMMOwVBs81OPM7a4HomKJ8EoZtFhZT9kY7GkIw==
X-Google-Smtp-Source: AGHT+IFq4TDKF1wjkDrm6odF6OouUQaLT4wdIoKNn0DHq7dIcpEdPSverfudykboF5TLQNL9Pr0NYHVoqY/c8Jot7Vk=
X-Received: by 2002:a05:6808:11d1:b0:403:34b1:878a with SMTP id
 5614622812f47-404d88d34e5mr3314783b6e.35.1747462163881; Fri, 16 May 2025
 23:09:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250516162617.2910805-1-f_l_k@t-online.de> <CAMKF1srLxh-ge+ud=7FKioaXhuABo_forxrU2fiDbu6vF2cZoA@mail.gmail.com>
 <GN5EWS.RKKQFDABMYVG1@t-online.de>
In-Reply-To: <GN5EWS.RKKQFDABMYVG1@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 16 May 2025 23:09:13 -0700
X-Gm-Features: AX0GCFvRu33-pcby0wWcCQNrF2kStEFe2LodVoTnQEzqzV46qEXhxBQQYHM-9Hs
Message-ID: <CAMKF1spwi7z5UKawqDiEBcokOxXfPS_ZqFoFUF9-5RdiBwApVw@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] librest: update 0.8.1 -> 0.9.1
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000089625a06354ebdd7"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 May 2025 06:09:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117441

--00000000000089625a06354ebdd7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 10:52=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wr=
ote:

> I overlooked the fact that the librest-0.9.1 update is already available
> as rest-0.9.1.
> After my update, rest and librest are the same version. The update can
> therefore be ignored
>

I think we should still delete the old librest recipe and let rest RPROVIDE
it so we can get rid of need for libsoup-2.4

>
> On Fri, May 16 2025 at 17:48:11 -07:00:00, Khem Raj <raj.khem@gmail.com>
> wrote:
>
> I am seeing this error
> https://errors.yoctoproject.org/Errors/Details/854795/ Rest-1.0.gir
> should perhaps come from librest and not from rest package ? On Fri, May
> 16, 2025 at 9:26=E2=80=AFAM Markus Volk via lists.openembedded.org <
> f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> - switch to meson buildsystem - add missing dependencies - use libsoup-3
> Signed-off-by: Markus Volk <f_l_k@t-online.de> --- .../recipes-gnome/rest=
/
> librest_0.8.1.bb | 33 ------------------- .../recipes-gnome/rest/
> librest_0.9.1.bb | 23 +++++++++++++ 2 files changed, 23 insertions(+), 33
> deletions(-) delete mode 100644 meta-gnome/recipes-gnome/rest/
> librest_0.8.1.bb create mode 100644 meta-gnome/recipes-gnome/rest/
> librest_0.9.1.bb diff --git a/meta-gnome/recipes-gnome/rest/
> librest_0.8.1.bb b/meta-gnome/recipes-gnome/rest/librest_0.8.1.bb deleted
> file mode 100644 index 63372afa5d..0000000000 ---
> a/meta-gnome/recipes-gnome/rest/librest_0.8.1.bb +++ /dev/null @@ -1,33
> +0,0 @@ -SUMMARY =3D "library to access web services that claim to be
> "RESTful"" -HOMEPAGE =3D "https://wiki.gnome.org/Projects/Librest" -LICEN=
SE
> =3D "LGPL-2.1-only" -LIC_FILES_CHKSUM =3D "
> file://COPYING;md5=3D2d5025d4aa3495befef8f17206a5b0a1" - -DEPENDS =3D " \=
 -
> glib-2.0 \ - glib-2.0-native \ - libsoup-2.4 \ - libxml2 \ -" -
> -GNOMEBASEBUILDCLASS =3D "autotools" -inherit gnomebase gobject-introspec=
tion
> vala pkgconfig gtk-doc - -GNOMEBN =3D "rest" - -SRC_URI[archive.sha256sum=
] =3D
> "0513aad38e5d3cedd4ae3c551634e3be1b9baaa79775e53b2dba9456f15b01c9" - -S =
=3D
> "${WORKDIR}/${GNOMEBN}-${PV}" -# * gnome environment requires libsoup bui=
ld
> with in gnome PACKAGECONFIG -# * libsoup-gnome support was removed upstre=
am
> three years ago [1] -# [1]
> https://gitlab.gnome.org/GNOME/librest/commit/8f904a8e2bb38a7bf72245cdf2f=
1ecad17e9a720
> -EXTRA_OECONF =3D "--without-gnome" - -do_configure:prepend() { - # rest
> expects introspection.m4 at custom location (see aclocal.m4). - cp -f
> ${STAGING_DIR_TARGET}/${datadir}/aclocal/introspection.m4 ${S}/build -} -
> -do_compile:prepend() { - export GIR_EXTRA_LIBS_PATH=3D"${B}/rest/.libs" =
-}
> diff --git a/meta-gnome/recipes-gnome/rest/librest_0.9.1.bb
> b/meta-gnome/recipes-gnome/rest/librest_0.9.1.bb new file mode 100644
> index 0000000000..f923c7c1cd --- /dev/null +++
> b/meta-gnome/recipes-gnome/rest/librest_0.9.1.bb @@ -0,0 +1,23 @@
> +SUMMARY =3D "library to access web services that claim to be "RESTful""
> +HOMEPAGE =3D "https://wiki.gnome.org/Projects/Librest" +LICENSE =3D
> "LGPL-2.1-only" +LIC_FILES_CHKSUM =3D "
> file://COPYING;md5=3D2d5025d4aa3495befef8f17206a5b0a1" + +DEPENDS =3D " \=
 +
> glib-2.0 \ + glib-2.0-native \ + gtksourceview5 \ + libadwaita \ + libsou=
p
> \ + libxml2 \ + json-glib \ +" + +inherit gnomebase gobject-introspection
> vala pkgconfig gi-docgen + +GNOMEBN =3D "rest" + +SRC_URI[archive.sha256s=
um]
> =3D "9266a5c10ece383e193dfb7ffb07b509cc1f51521ab8dad76af96ed14212c2e3" + =
+S =3D
> "${WORKDIR}/${GNOMEBN}-${PV}" + -- 2.49.0 -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=3D- Links:
> You receive all messages sent to this group. View/Reply Online (#117435):
> https://lists.openembedded.org/g/openembedded-devel/message/117435 Mute
> This Topic: https://lists.openembedded.org/mt/113148143/1997914 Group
> Owner: openembedded-devel+owner@lists.openembedded.org Unsubscribe:
> https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com] -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000089625a06354ebdd7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Fri, May 16, 2025 at 10:52=E2=80=AFP=
M Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1=
ex;border-left-color:rgb(204,204,204)"><div id=3D"m_-3036175233090344181gea=
ry-body" dir=3D"auto"><div>I overlooked the fact that the librest-0.9.1 upd=
ate is already available as rest-0.9.1.</div><div>After my update, rest and=
 librest are the same version. The update can therefore be ignored</div></d=
iv><div id=3D"m_-3036175233090344181geary-quote" dir=3D"auto"></div></block=
quote><div dir=3D"auto"><br></div><div dir=3D"auto">I think we should still=
 delete the old librest recipe and let rest RPROVIDE it so we can get rid o=
f need for libsoup-2.4=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
padding-left:1ex;border-left-color:rgb(204,204,204)"><div id=3D"m_-30361752=
33090344181geary-quote" dir=3D"auto"><br>On Fri, May 16 2025 at 17:48:11 -0=
7:00:00, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blan=
k">raj.khem@gmail.com</a>&gt; wrote:<br><blockquote type=3D"cite"><div styl=
e=3D"white-space:break-spaces">I am seeing this error

<a href=3D"https://errors.yoctoproject.org/Errors/Details/854795/" target=
=3D"_blank">https://errors.yoctoproject.org/Errors/Details/854795/</a>

Rest-1.0.gir should perhaps come from librest and not from rest package ?

On Fri, May 16, 2025 at 9:26=E2=80=AFAM Markus Volk via <a href=3D"http://l=
ists.openembedded.org" target=3D"_blank">lists.openembedded.org</a>
&lt;<a href=3D"mailto:f_l_k=3Dt-online.de@lists.openembedded.org" target=3D=
"_blank">f_l_k=3Dt-online.de@lists.openembedded.org</a>&gt; wrote:
<blockquote>
 - switch to meson buildsystem
 - add missing dependencies
 - use libsoup-3

 Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;
 ---
  .../recipes-gnome/rest/<a href=3D"http://librest_0.8.1.bb" target=3D"_bla=
nk">librest_0.8.1.bb</a>       | 33 -------------------
  .../recipes-gnome/rest/<a href=3D"http://librest_0.9.1.bb" target=3D"_bla=
nk">librest_0.9.1.bb</a>       | 23 +++++++++++++
  2 files changed, 23 insertions(+), 33 deletions(-)
  delete mode 100644 meta-gnome/recipes-gnome/rest/<a href=3D"http://libres=
t_0.8.1.bb" target=3D"_blank">librest_0.8.1.bb</a>
  create mode 100644 meta-gnome/recipes-gnome/rest/<a href=3D"http://libres=
t_0.9.1.bb" target=3D"_blank">librest_0.9.1.bb</a>

 diff --git a/meta-gnome/recipes-gnome/rest/<a href=3D"http://librest_0.8.1=
.bb" target=3D"_blank">librest_0.8.1.bb</a> b/meta-gnome/recipes-gnome/rest=
/<a href=3D"http://librest_0.8.1.bb" target=3D"_blank">librest_0.8.1.bb</a>
 deleted file mode 100644
 index 63372afa5d..0000000000
 --- a/meta-gnome/recipes-gnome/rest/<a href=3D"http://librest_0.8.1.bb" ta=
rget=3D"_blank">librest_0.8.1.bb</a>
 +++ /dev/null
 @@ -1,33 +0,0 @@
 -SUMMARY =3D &quot;library to access web services that claim to be &quot;R=
ESTful&quot;&quot;
 -HOMEPAGE =3D &quot;<a href=3D"https://wiki.gnome.org/Projects/Librest" ta=
rget=3D"_blank">https://wiki.gnome.org/Projects/Librest</a>&quot;
 -LICENSE =3D &quot;LGPL-2.1-only&quot;
 -LIC_FILES_CHKSUM =3D &quot;<a>file://COPYING;md5=3D2d5025d4aa3495befef8f1=
7206a5b0a1&quot;</a>
 -
 -DEPENDS =3D &quot; \
 -    glib-2.0 \
 -    glib-2.0-native \
 -    libsoup-2.4 \
 -    libxml2 \
 -&quot;
 -
 -GNOMEBASEBUILDCLASS =3D &quot;autotools&quot;
 -inherit gnomebase gobject-introspection vala pkgconfig gtk-doc
 -
 -GNOMEBN =3D &quot;rest&quot;
 -
 -SRC_URI[archive.sha256sum] =3D &quot;0513aad38e5d3cedd4ae3c551634e3be1b9b=
aaa79775e53b2dba9456f15b01c9&quot;
 -
 -S =3D &quot;${WORKDIR}/${GNOMEBN}-${PV}&quot;
 -# * gnome environment requires libsoup build with in gnome PACKAGECONFIG
 -# * libsoup-gnome support was removed upstream three years ago [1]
 -# [1] <a href=3D"https://gitlab.gnome.org/GNOME/librest/commit/8f904a8e2b=
b38a7bf72245cdf2f1ecad17e9a720" target=3D"_blank">https://gitlab.gnome.org/=
GNOME/librest/commit/8f904a8e2bb38a7bf72245cdf2f1ecad17e9a720</a>
 -EXTRA_OECONF =3D &quot;--without-gnome&quot;
 -
 -do_configure:prepend() {
 -    # rest expects introspection.m4 at custom location (see aclocal.m4).
 -    cp -f ${STAGING_DIR_TARGET}/${datadir}/aclocal/introspection.m4 ${S}/=
build
 -}
 -
 -do_compile:prepend() {
 -    export GIR_EXTRA_LIBS_PATH=3D&quot;${B}/rest/.libs&quot;
 -}
 diff --git a/meta-gnome/recipes-gnome/rest/<a href=3D"http://librest_0.9.1=
.bb" target=3D"_blank">librest_0.9.1.bb</a> b/meta-gnome/recipes-gnome/rest=
/<a href=3D"http://librest_0.9.1.bb" target=3D"_blank">librest_0.9.1.bb</a>
 new file mode 100644
 index 0000000000..f923c7c1cd
 --- /dev/null
 +++ b/meta-gnome/recipes-gnome/rest/<a href=3D"http://librest_0.9.1.bb" ta=
rget=3D"_blank">librest_0.9.1.bb</a>
 @@ -0,0 +1,23 @@
 +SUMMARY =3D &quot;library to access web services that claim to be &quot;R=
ESTful&quot;&quot;
 +HOMEPAGE =3D &quot;<a href=3D"https://wiki.gnome.org/Projects/Librest" ta=
rget=3D"_blank">https://wiki.gnome.org/Projects/Librest</a>&quot;
 +LICENSE =3D &quot;LGPL-2.1-only&quot;
 +LIC_FILES_CHKSUM =3D &quot;<a>file://COPYING;md5=3D2d5025d4aa3495befef8f1=
7206a5b0a1&quot;</a>
 +
 +DEPENDS =3D &quot; \
 +    glib-2.0 \
 +    glib-2.0-native \
 +    gtksourceview5 \
 +    libadwaita \
 +    libsoup \
 +    libxml2 \
 +    json-glib \
 +&quot;
 +
 +inherit gnomebase gobject-introspection vala pkgconfig gi-docgen
 +
 +GNOMEBN =3D &quot;rest&quot;
 +
 +SRC_URI[archive.sha256sum] =3D &quot;9266a5c10ece383e193dfb7ffb07b509cc1f=
51521ab8dad76af96ed14212c2e3&quot;
 +
 +S =3D &quot;${WORKDIR}/${GNOMEBN}-${PV}&quot;
 +
 --
 2.49.0


 -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
 Links: You receive all messages sent to this group.
 View/Reply Online (#117435): <a href=3D"https://lists.openembedded.org/g/o=
penembedded-devel/message/117435" target=3D"_blank">https://lists.openembed=
ded.org/g/openembedded-devel/message/117435</a>
 Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/113148143/19=
97914" target=3D"_blank">https://lists.openembedded.org/mt/113148143/199791=
4</a>
 Group Owner: <a href=3D"mailto:openembedded-devel+owner@lists.openembedded=
.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a>
 Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-deve=
l/unsub" target=3D"_blank">https://lists.openembedded.org/g/openembedded-de=
vel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.=
khem@gmail.com</a>]
 -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</blockquote></div></blockquote></div></blockquote></div></div>

--00000000000089625a06354ebdd7--

