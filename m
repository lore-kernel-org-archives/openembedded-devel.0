Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web12.37941.1595799733654372294
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Jul 2020 14:42:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=f+YvhTqP;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id dk23so3219599ejb.11
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Jul 2020 14:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b5sg87L/4ZjhTaD5Cl4bNl6YbcmbYTrvnU/UvtJwvjU=;
        b=f+YvhTqPtqhSVbiyw5mqx+CVl4iaRl5T0gIY2ytq9kqNcANten1NeY36+21699tkVn
         hAZ3gdqErhNTaSqIpNk8tpEtFI3XY4O2BXnRERb+gWbTQbwOTtxiPgBpopxO8B+qbswQ
         wFel31+AIFHObgzZClqyx/pRb2wLQHsYKXg7Jqs/cX29eTY0gpLSjnRc2yL/HoH5clF6
         g1XQfc4DR7o0/oLJSC9xSoMPR777r8M4LSXUFG4WPBcTKxfSiJ+Qqewvl8Q8AXQzx4ul
         /pjT331azVExMi7NO1yub4Vg2Z1DEaX1/cpKvNalg9bUatVCDZWzzYQZhmvGWDJtKUkw
         q67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b5sg87L/4ZjhTaD5Cl4bNl6YbcmbYTrvnU/UvtJwvjU=;
        b=RAjhEdM/iE6aDp9TNuiWZ1os4IQDoD8lx2GFAzWZKS9f74JIBLmgBN8ADwQOuZ0/cf
         69nmHQWsS5dCGO04dWdgo3SBJVW/m0l64IKmEIYyihlZbiFiKE5A7s1Y56E5R2cfLV1/
         4pszZCxcGahAWvyb1vhHf2GJgUgc9Wiq85SEeH2ITJTeKW0z1/SsG27fim/Jt0hHlww9
         CvYISKV0jTpYeN9S5AmVxXRgFrPJoS159UjcTZ4ATo+QZAvd0NF+6eit6dCCL8bDG7K2
         ts+j0HvfyOsAC6DdtnsXfxubrPVqEzsQk3U7yZ5jphy/uJ/pZ06EHx6bkWrs41uQQ6M+
         qLVg==
X-Gm-Message-State: AOAM530skPnKxI1ztxEJH7VcYOLE4xMclMpjYyzFNZ0azONtbATTJvwh
	wzVtIavvDgYu8Qjo4Zj8HC7S7JZRzrZhFkDeDdw=
X-Google-Smtp-Source: ABdhPJyB5NICiZXoSo63PNGQmOtfIDSRVvoCv2NHYyJeFT9TFDP008dHh38fP4oHNCd4A/XI21Od0/dRqgAo0PgIc9w=
X-Received: by 2002:a17:906:3e54:: with SMTP id t20mr18110993eji.471.1595799732174;
 Sun, 26 Jul 2020 14:42:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200726182237.561-1-akuster808@gmail.com> <20200726182237.561-2-akuster808@gmail.com>
In-Reply-To: <20200726182237.561-2-akuster808@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Sun, 26 Jul 2020 21:42:00 -0700
Message-ID: <CA+chaQchMFa1ASRYz=oFyz+fKLm4mbdhrPnShXZ81Hus6cK6NA@mail.gmail.com>
Subject: Re: [oe] [PATCH 2/2] khronos: includes virtual/libgles2 , needs opengl
To: akuster <akuster808@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002b467705ab5f140c"

--0000000000002b467705ab5f140c
Content-Type: text/plain; charset="UTF-8"

Hi,

I've already sent this one:
https://lists.openembedded.org/g/openembedded-devel/message/85932

On Sun, Jul 26, 2020 at 11:22 AM akuster <akuster808@gmail.com> wrote:

> add FEATURE_CHECK on opengl.
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
> b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
> index bd75cdb1f4..1cd0a476aa 100644
> --- a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
> +++ b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
> @@ -16,7 +16,9 @@ SRCREV_FORMAT = "vk-gl-cts"
>
>  S = "${WORKDIR}/git"
>
> -inherit pkgconfig cmake
> +inherit pkgconfig cmake features_check
> +
> +REQUIRED_DISTRO_FEATURES = "opengl"
>
>  DEPENDS += "libpng zlib virtual/libgles2 virtual/egl"
>
> --
> 2.17.1
>
> 
>

--0000000000002b467705ab5f140c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I&#39;ve already sent this one:</di=
v><div><a href=3D"https://lists.openembedded.org/g/openembedded-devel/messa=
ge/85932">https://lists.openembedded.org/g/openembedded-devel/message/85932=
</a>=C2=A0=C2=A0<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Sun, Jul 26, 2020 at 11:22 AM akuster &lt;<a h=
ref=3D"mailto:akuster808@gmail.com">akuster808@gmail.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">add FEATURE_CHECK o=
n opengl.<br>
<br>
Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.com" ta=
rget=3D"_blank">akuster808@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc | 4 +++-<br>
=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc b/meta-oe/=
recipes-graphics/vk-gl-cts/khronos-cts.inc<br>
index bd75cdb1f4..1cd0a476aa 100644<br>
--- a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc<br>
+++ b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc<br>
@@ -16,7 +16,9 @@ SRCREV_FORMAT =3D &quot;vk-gl-cts&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
-inherit pkgconfig cmake<br>
+inherit pkgconfig cmake features_check<br>
+<br>
+REQUIRED_DISTRO_FEATURES =3D &quot;opengl&quot;<br>
<br>
=C2=A0DEPENDS +=3D &quot;libpng zlib virtual/libgles2 virtual/egl&quot;<br=
>
<br>
-- <br>
2.17.1<br>
<br>
<br>
</blockquote></div>

--0000000000002b467705ab5f140c--
