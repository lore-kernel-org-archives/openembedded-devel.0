Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.22292.1622305427240747352
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 May 2021 09:23:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rPbu1Ns5;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id g8so1433801ejx.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 29 May 2021 09:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=67uE7QUnFGVwoMu121EgL3UDiZG2qkzflikQGVXQtdA=;
        b=rPbu1Ns5zdiPN48zOdCSt1MGfj72UN+IjA39EpIA4Rx7V5S7fRGFUB0OFwN4enAOf8
         lS8Y12Qo0Ehcj8xoRz5hWSpaNUDPWSLgd3RIRhlfQhGFG6ytZg5TCQWqTybnXozOkuYl
         0EFfIOI9GNjBpLWTboJfCkAzyoq4bl6znhPhbRts246bytoF6y6Tu90oa7iac9ijEAIF
         7Dcf0JhMqBkZF+aTSfXyu/i6c9YbtERBdDk3bDx6XoJzkB8mQk0G01SATOI/MhVqM62k
         /yTSOBeYuhmOMLKl0/K2/zI+jdM/4bVy+dRifCQdRG/wT7Qtq2Xis6910MsmqoTWmdn8
         95Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=67uE7QUnFGVwoMu121EgL3UDiZG2qkzflikQGVXQtdA=;
        b=aPQA/i2gi7yWd+tgpb6uF9dpuWmsAzip6596RU+LJki+SoiHsEEAxNTnqZprPTSehE
         e0zlSUiCkarfbWxneDetrnmKwyoQJ+jOUbIx+DbFRfRdz45Arzj6vaEv5ou5v9IbHPDi
         UcXB3zVnR/nhs9RoRyTjvjKV+hiYZrkuSfJXWny6NQwpfXJXxGrONxiXGo6owPinvzqD
         hImd3GxZhrMNVmmWt6Z1GmELYvJcJO5Wn3oQHgMgTBVQKr5mm1gbM77SMPnwhrCAIFPb
         9IOMPO3wtK9F93RAcdvENd9s9QHvwherGWnLnLfw6hIzO4iK2xMFiwKIYx3dPblaKinn
         M6TQ==
X-Gm-Message-State: AOAM530xO2wNOFHZw8xH9cQoxRhkbcqgODmC0GiGnkV+tqIhd4/aT+8+
	vGL/C6FXiECyLWtJzBBBfl6AprW1K1oBa5FcwMI=
X-Google-Smtp-Source: ABdhPJz4DZNLDs+A0NJSLRPdfcSoVoj+bR+fPrUxgV7aVvlZhkUeMZY17SZ9rxLShKi3tVD3foEjBqOT+VgfigVoxdM=
X-Received: by 2002:a17:906:5495:: with SMTP id r21mr14839101ejo.471.1622305425753;
 Sat, 29 May 2021 09:23:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210529095120.2135584-1-Martin.Jansa@gmail.com> <168380C770F967C6.28811@lists.openembedded.org>
In-Reply-To: <168380C770F967C6.28811@lists.openembedded.org>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Sat, 29 May 2021 18:23:34 +0200
Message-ID: <CA+chaQeAnoFKCY-mYjor9N8WWMmbCqi8DquJc3KR2v2CAd=ixQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/2] gtkwave: set REQUIRED_DISTRO_FEATURES only to wayland
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009e8b8105c37a6ac9"

--0000000000009e8b8105c37a6ac9
Content-Type: text/plain; charset="UTF-8"

v2 coming soon as it actually needs both wayland and x11 (instead of either
one used before), because tk requires x11

ERROR: Nothing PROVIDES 'tk' (but
meta-openembedded/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.109.bb
DEPENDS on or otherwise requires it)
tk was skipped: missing required distro feature 'x11' (not in
DISTRO_FEATURES)

On Sat, May 29, 2021 at 11:51 AM Martin Jansa via lists.openembedded.org
<Martin.Jansa=gmail.com@lists.openembedded.org> wrote:

> * after the migration to gtk3 in:
>
> https://git.openembedded.org/meta-openembedded/commit/?id=8221db74e300619d002e2b385d12a5fe13e8999a
>   this was now failing with:
>
> | In file included from ../../gtkwave-gtk3-3.3.109/src/debug.h:17,
> |                  from ../../gtkwave-gtk3-3.3.109/src/vlist.h:18,
> |                  from ../../gtkwave-gtk3-3.3.109/src/analyzer.h:18,
> |                  from ../../gtkwave-gtk3-3.3.109/src/symbol.h:20,
> |                  from ../../gtkwave-gtk3-3.3.109/src/vcd.h:32,
> |                  from ../../gtkwave-gtk3-3.3.109/src/ae2.h:16,
> |                  from ../../gtkwave-gtk3-3.3.109/src/globals.h:27,
> |                  from ../../gtkwave-gtk3-3.3.109/src/timeentry.c:11:
> | ../../gtkwave-gtk3-3.3.109/src/gtk23compat.h:12:10: fatal error:
> gdk/gdkwayland.h: No such file or directory
> |    12 | #include <gdk/gdkwayland.h>
> |       |          ^~~~~~~~~~~~~~~~~~
>
>   for distributions without wayland in DISTRO_FEATURES.
>
> * because
> https://github.com/gtkwave/gtkwave/blob/f9d82a82aa3ddc30ca47984278371f62c9a3bd81/gtkwave3-gtk3/src/gtk23compat.h#L10
>   explicitly includes gdk/gdkwayland.h for gtk-3.22.26 and newer (oe-core
> currently has 3.24.29)
>
> * restrict REQUIRED_DISTRO_FEATURES to wayland only (instead of
> GTK3DISTROFEATURES which includes x11 as well).
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.109.bb | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.109.bb
> b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.109.bb
> index 2b572f7e2f..c8d7e959c1 100644
> --- a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.109.bb
> +++ b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.109.bb
> @@ -23,9 +23,12 @@ DEPENDS = " \
>
>  inherit pkgconfig autotools gettext texinfo mime mime-xdg
>
> -# depends on gtk+3 which has this restriction
>  inherit features_check
> -ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
> +# depends on gtk+3 which has this restriction
> +# ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
> +# but
> https://github.com/gtkwave/gtkwave/blob/f9d82a82aa3ddc30ca47984278371f62c9a3bd81/gtkwave3-gtk3/src/gtk23compat.h#L10
> +# explicitly includes gdk/gdkwayland.h for gtk-3.22.26 and newer (oe-core
> currently has 3.24.29)
> +REQUIRED_DISTRO_FEATURES = "wayland"
>
>  EXTRA_OECONF = " \
>      --enable-gtk3 \
> --
> 2.30.2
>
>
> 
>
>

--0000000000009e8b8105c37a6ac9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">v2 coming soon as it actually needs both wayland and x11 (=
instead of either one used before), because tk requires x11<div><br></div><=
div>ERROR: Nothing PROVIDES &#39;tk&#39; (but meta-openembedded/meta-oe/rec=
ipes-graphics/gtkwave/<a href=3D"http://gtkwave_3.3.109.bb">gtkwave_3.3.109=
.bb</a> DEPENDS on or otherwise requires it)<br>tk was skipped: missing req=
uired distro feature &#39;x11&#39; (not in DISTRO_FEATURES)<br></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat=
, May 29, 2021 at 11:51 AM Martin Jansa via <a href=3D"http://lists.openemb=
edded.org">lists.openembedded.org</a> &lt;Martin.Jansa=3D<a href=3D"mailto:=
gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">* after t=
he migration to gtk3 in:<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded/commit/?i=
d=3D8221db74e300619d002e2b385d12a5fe13e8999a" rel=3D"noreferrer" target=3D"=
_blank">https://git.openembedded.org/meta-openembedded/commit/?id=3D8221db7=
4e300619d002e2b385d12a5fe13e8999a</a><br>
=C2=A0 this was now failing with:<br>
<br>
| In file included from ../../gtkwave-gtk3-3.3.109/src/debug.h:17,<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from ../..=
/gtkwave-gtk3-3.3.109/src/vlist.h:18,<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from ../..=
/gtkwave-gtk3-3.3.109/src/analyzer.h:18,<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from ../..=
/gtkwave-gtk3-3.3.109/src/symbol.h:20,<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from ../..=
/gtkwave-gtk3-3.3.109/src/vcd.h:32,<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from ../..=
/gtkwave-gtk3-3.3.109/src/ae2.h:16,<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from ../..=
/gtkwave-gtk3-3.3.109/src/globals.h:27,<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from ../..=
/gtkwave-gtk3-3.3.109/src/timeentry.c:11:<br>
| ../../gtkwave-gtk3-3.3.109/src/gtk23compat.h:12:10: fatal error: gdk/gdk=
wayland.h: No such file or directory<br>
|=C2=A0 =C2=A0 12 | #include &lt;gdk/gdkwayland.h&gt;<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~=
~~~~~~~~<br>
<br>
=C2=A0 for distributions without wayland in DISTRO_FEATURES.<br>
<br>
* because <a href=3D"https://github.com/gtkwave/gtkwave/blob/f9d82a82aa3dd=
c30ca47984278371f62c9a3bd81/gtkwave3-gtk3/src/gtk23compat.h#L10" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/gtkwave/gtkwave/blob/f9d82a82=
aa3ddc30ca47984278371f62c9a3bd81/gtkwave3-gtk3/src/gtk23compat.h#L10</a><br=
>
=C2=A0 explicitly includes gdk/gdkwayland.h for gtk-3.22.26 and newer (oe-=
core currently has 3.24.29)<br>
<br>
* restrict REQUIRED_DISTRO_FEATURES to wayland only (instead of GTK3DISTRO=
FEATURES which includes x11 as well).<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-graphics/gtkwave/<a href=3D"http://gtkwave_3.3.109.b=
b" rel=3D"noreferrer" target=3D"_blank">gtkwave_3.3.109.bb</a> | 7 +++++--<=
br>
=C2=A01 file changed, 5 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta-oe/recipes-graphics/gtkwave/<a href=3D"http://gtkwave_3.=
3.109.bb" rel=3D"noreferrer" target=3D"_blank">gtkwave_3.3.109.bb</a> b/met=
a-oe/recipes-graphics/gtkwave/<a href=3D"http://gtkwave_3.3.109.bb" rel=3D"=
noreferrer" target=3D"_blank">gtkwave_3.3.109.bb</a><br>
index 2b572f7e2f..c8d7e959c1 100644<br>
--- a/meta-oe/recipes-graphics/gtkwave/<a href=3D"http://gtkwave_3.3.109.b=
b" rel=3D"noreferrer" target=3D"_blank">gtkwave_3.3.109.bb</a><br>
+++ b/meta-oe/recipes-graphics/gtkwave/<a href=3D"http://gtkwave_3.3.109.b=
b" rel=3D"noreferrer" target=3D"_blank">gtkwave_3.3.109.bb</a><br>
@@ -23,9 +23,12 @@ DEPENDS =3D &quot; \<br>
<br>
=C2=A0inherit pkgconfig autotools gettext texinfo mime mime-xdg<br>
<br>
-# depends on gtk+3 which has this restriction<br>
=C2=A0inherit features_check<br>
-ANY_OF_DISTRO_FEATURES =3D &quot;${GTK3DISTROFEATURES}&quot;<br>
+# depends on gtk+3 which has this restriction<br>
+# ANY_OF_DISTRO_FEATURES =3D &quot;${GTK3DISTROFEATURES}&quot;<br>
+# but <a href=3D"https://github.com/gtkwave/gtkwave/blob/f9d82a82aa3ddc30=
ca47984278371f62c9a3bd81/gtkwave3-gtk3/src/gtk23compat.h#L10" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/gtkwave/gtkwave/blob/f9d82a82aa3=
ddc30ca47984278371f62c9a3bd81/gtkwave3-gtk3/src/gtk23compat.h#L10</a><br>
+# explicitly includes gdk/gdkwayland.h for gtk-3.22.26 and newer (oe-core=
 currently has 3.24.29)<br>
+REQUIRED_DISTRO_FEATURES =3D &quot;wayland&quot;<br>
<br>
=C2=A0EXTRA_OECONF =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0--enable-gtk3 \<br>
-- <br>
2.30.2<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000009e8b8105c37a6ac9--
