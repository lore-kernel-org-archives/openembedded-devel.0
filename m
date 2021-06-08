Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web09.9088.1623135275527525076
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jun 2021 23:54:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XD/xQSDB;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id b11so23293088edy.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Jun 2021 23:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5MRwjNNEuGGizFCBuMnffHq1RvKdrHg29MlX5x2xscc=;
        b=XD/xQSDBUV2RGlfHRXktmYNHhYkzjXwyECjWiWEIGhRz3o/4/H3Kh/UUbmB0+qoiYg
         NpSiI3jY/QzEVsww6SEMXJIO01HVHwCSLbkjNYx5UfObKRfTdFEPTtcyY3u2YKFRcTVf
         fofo42J9ykmSPcGB0zaMWUTPXi4L21+OTf0ujaEDKc79NnTRCXfE7yPDlh9Y5JrF+kLU
         Mn33JBRG9l8cQ1Xp9VDIPPmbZLxS18j9//hX2Sle8+48Coy3+vwDGhBW08pKhCriSXC3
         mWWTMsLfS+ngr0AiE4QbuTICMxjW7XG7Pd+cMxnFus6bNCFoG83vNbeV1KXmHBzToFgH
         5FHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5MRwjNNEuGGizFCBuMnffHq1RvKdrHg29MlX5x2xscc=;
        b=hih0lnmhlMfbGf3S2otlI7OQdNzwhwE6VrYZuUpLHok6SF8pZDgazm2PDxmxJLZwid
         BasjwQchTTWqUxeyT3ym8ulSw7D2OmrCaYh0Iw/+24NZ9EkZ7uWqB58xubkzvreTOCtC
         6Ouy2SqbgMjvOxO5Hm83HP0SGzIDoJb6H+VfB6mYq2/Uy2KehZOxY9pCniRvURadJxWi
         2OupmHgbv8BKg+Gow1T+sT4XmuzOmCekpgy/7JFl7RLzouXG5eXTYRHkTx5lAuU+YX1p
         zfyH88ORykbCbwH0NVE7K9eHK2aU+KBbyvgRl+WD5ghfvX9YwBqGEM9BOGE9eMMJOt9Y
         jFsA==
X-Gm-Message-State: AOAM533LIozW3Jv5JbDT7bkHp2HBikh5lFGM1Mp0rYCpCZIOq3mt2ivP
	+G7BqHBcjjhWX5N45caXM/B4bB/4Qa53DrmTkCY=
X-Google-Smtp-Source: ABdhPJz53dBM2XY07RYItkm5lt5tAkoKUOAcB4fOaTi4P8TrAq6DJ8fcN7CjwWW0F+qkS8aD5p7e0qpJ5Pm0jZEgXhU=
X-Received: by 2002:a05:6402:1609:: with SMTP id f9mr23510582edv.76.1623135274008;
 Mon, 07 Jun 2021 23:54:34 -0700 (PDT)
MIME-Version: 1.0
References: <1623128336-11544-1-git-send-email-akash.hadke@kpit.com>
In-Reply-To: <1623128336-11544-1-git-send-email-akash.hadke@kpit.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 8 Jun 2021 08:54:22 +0200
Message-ID: <CA+chaQeq0w=bAhvqkG8rSZs4xX+Z-jjC3F0pMsrWtSufn8fACQ@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][dunfell][PATCH] sysprof: depend on polkit only if DISTRO_FEATURES has it
To: akash hadke <akash.hadke@kpit.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Nisha Parrakat <nisha.parrakat@kpit.com>, 
	Harpritkaur Bhandari <harpritkaur.bhandari@kpit.com>, Mikko Rapeli <mikko.rapeli@bmw.de>
Content-Type: multipart/alternative; boundary="0000000000006e056105c43ba136"

--0000000000006e056105c43ba136
Content-Type: text/plain; charset="UTF-8"

Backport the commit from master instead:
https://git.openembedded.org/meta-openembedded/commit/?id=4ff5b43edd3dd5843d29b66d809cb5365e9f9857

On Tue, Jun 8, 2021 at 6:59 AM akash hadke <akash.hadke@kpit.com> wrote:

> From: Mikko Rapeli <mikko.rapeli@bmw.de>
>
> Fixes yocto-check-layer error:
>
> ERROR: Nothing PROVIDES 'polkit' (but
> /home/builder/src/base/meta-openembedded/meta-gnome/recipes-kernel/sysprof/
> sysprof_3.34.1.bb DEPENDS on or otherwise requires it)
> polkit was skipped: missing required distro feature 'polkit' (not in
> DISTRO_FEATURES)
> ERROR: Required build target 'meta-world-pkgdata' has no buildable
> providers.
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> Signed-off-by: akash hadke <akash.hadke@kpit.com>
> ---
>  meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb
> b/meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb
> index ad69ab6..87acb29 100644
> --- a/meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb
> +++ b/meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb
> @@ -16,7 +16,10 @@ SRC_URI +=
> "file://0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch \
>              file://0001-libsysprof-ui-Rename-environ-to-sys_environ.patch
> \
>              "
>
> -PACKAGECONFIG ?= "sysprofd libsysprof
> ${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'gtk',
> '', d)}"
> +PACKAGECONFIG ?= " \
> +     ${@bb.utils.contains_any('DISTRO_FEATURES', 'polkit', 'sysprofd
> libsysprof', '', d)} \
> +     ${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}',
> 'gtk', '', d)} \
> +"
>  PACKAGECONFIG[gtk] = "-Denable_gtk=true,-Denable_gtk=false,gtk+3
> libdazzle"
>  PACKAGECONFIG[sysprofd] =
> "-Dwith_sysprofd=bundled,-Dwith_sysprofd=none,polkit"
>  PACKAGECONFIG[libsysprof] = "-Dlibsysprof=true,-Dlibsysprof=false,polkit"
> --
> 2.7.4
>
>
> 
>
>

--0000000000006e056105c43ba136
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Backport the commit from master instead:<div><a href=3D"ht=
tps://git.openembedded.org/meta-openembedded/commit/?id=3D4ff5b43edd3dd5843=
d29b66d809cb5365e9f9857">https://git.openembedded.org/meta-openembedded/com=
mit/?id=3D4ff5b43edd3dd5843d29b66d809cb5365e9f9857</a><br></div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun=
 8, 2021 at 6:59 AM akash hadke &lt;<a href=3D"mailto:akash.hadke@kpit.com"=
>akash.hadke@kpit.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">From: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@=
bmw.de" target=3D"_blank">mikko.rapeli@bmw.de</a>&gt;<br>
<br>
Fixes yocto-check-layer error:<br>
<br>
ERROR: Nothing PROVIDES &#39;polkit&#39; (but /home/builder/src/base/meta-=
openembedded/meta-gnome/recipes-kernel/sysprof/<a href=3D"http://sysprof_3.=
34.1.bb" rel=3D"noreferrer" target=3D"_blank">sysprof_3.34.1.bb</a> DEPENDS=
 on or otherwise requires it)<br>
polkit was skipped: missing required distro feature &#39;polkit&#39; (not =
in DISTRO_FEATURES)<br>
ERROR: Required build target &#39;meta-world-pkgdata&#39; has no buildable=
 providers.<br>
<br>
Signed-off-by: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@bmw.de" tar=
get=3D"_blank">mikko.rapeli@bmw.de</a>&gt;<br>
Signed-off-by: akash hadke &lt;<a href=3D"mailto:akash.hadke@kpit.com" tar=
get=3D"_blank">akash.hadke@kpit.com</a>&gt;<br>
---<br>
=C2=A0meta-gnome/recipes-kernel/sysprof/<a href=3D"http://sysprof_3.34.1.b=
b" rel=3D"noreferrer" target=3D"_blank">sysprof_3.34.1.bb</a> | 5 ++++-<br>
=C2=A01 file changed, 4 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta-gnome/recipes-kernel/sysprof/<a href=3D"http://sysprof_3=
.34.1.bb" rel=3D"noreferrer" target=3D"_blank">sysprof_3.34.1.bb</a> b/meta=
-gnome/recipes-kernel/sysprof/<a href=3D"http://sysprof_3.34.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">sysprof_3.34.1.bb</a><br>
index ad69ab6..87acb29 100644<br>
--- a/meta-gnome/recipes-kernel/sysprof/<a href=3D"http://sysprof_3.34.1.b=
b" rel=3D"noreferrer" target=3D"_blank">sysprof_3.34.1.bb</a><br>
+++ b/meta-gnome/recipes-kernel/sysprof/<a href=3D"http://sysprof_3.34.1.b=
b" rel=3D"noreferrer" target=3D"_blank">sysprof_3.34.1.bb</a><br>
@@ -16,7 +16,10 @@ SRC_URI +=3D &quot;file://0001-sysprof-Define-NT_GNU_BU=
ILD_ID-if-undefined.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-libsysprof-ui-=
Rename-environ-to-sys_environ.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-PACKAGECONFIG ?=3D &quot;sysprofd libsysprof ${@bb.utils.contains_any(&#3=
9;DISTRO_FEATURES&#39;, &#39;${GTK3DISTROFEATURES}&#39;, &#39;gtk&#39;, &#3=
9;&#39;, d)}&quot;<br>
+PACKAGECONFIG ?=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains_any(&#39;DISTRO_FEATURES&#39;, &=
#39;polkit&#39;, &#39;sysprofd libsysprof&#39;, &#39;&#39;, d)} \<br>
+=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains_any(&#39;DISTRO_FEATURES&#39;, &=
#39;${GTK3DISTROFEATURES}&#39;, &#39;gtk&#39;, &#39;&#39;, d)} \<br>
+&quot;<br>
=C2=A0PACKAGECONFIG[gtk] =3D &quot;-Denable_gtk=3Dtrue,-Denable_gtk=3Dfals=
e,gtk+3 libdazzle&quot;<br>
=C2=A0PACKAGECONFIG[sysprofd] =3D &quot;-Dwith_sysprofd=3Dbundled,-Dwith_s=
ysprofd=3Dnone,polkit&quot;<br>
=C2=A0PACKAGECONFIG[libsysprof] =3D &quot;-Dlibsysprof=3Dtrue,-Dlibsysprof=
=
=3Dfalse,polkit&quot;<br>
-- <br>
2.7.4<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000006e056105c43ba136--
