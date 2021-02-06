Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web11.9798.1612634703773795860
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Feb 2021 10:05:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bZ2zXOTe;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id w20so7554710qta.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Feb 2021 10:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/NSxsDxJsyRG8dz7Esr3SosufV7raXyIBrgmBuF30eo=;
        b=bZ2zXOTeGw48ypbsDN4uagbhZ4iWBQIPTiq92KBkrDFOVTwWQ38YhDGHyy06i6R2qX
         x6JJ/uYiQ6yivewS5CNaRU5/h9IEogYzIZqLqRgXwRK9LTHN1O4zr+WYdAOp3msBatDt
         g9dMS/aHIm4AS9Dq7yT02SDzUHZVSozSHcyUdpOUMnPa0o5j8eavTQRxR/wWevL1+9C8
         ZjOX9B7NIzEEfYjCX1pQfffYaze3vU4mS+CFWnnwOpTEQRw3umPndvKSKzHCshEXQy+t
         2MI7wlajBav9JBeXzZlpNi5ePorte0Rm93aCYLy1y7eVCZrfDcSjRXrcqTU0QPZjIaFp
         XKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/NSxsDxJsyRG8dz7Esr3SosufV7raXyIBrgmBuF30eo=;
        b=kha6teXI+HwEwwk8pBHkRW5r4pa1xHhG+nDeD+V4ac7j/TnA1fAwujAZueM5PF3E2d
         Qi78BBAVo84zTS/tkaYuwM6lI+shojs+zW9FeBtkfRInIY3gYql8sYUhtgGTxjg1Gdae
         c0r90KKRsSodpDdeTPXEl96SFbDnV99guSZz7T0RGefuboslQ7FmM9szxyq+AhxfojGu
         MvD0YsJrHBCV3Pm/KVDLdi0MkfQs/IFj6STCaJNlf9/JdD5r6/gDxxf6JDFLD/yX7Ioo
         arbPyA0+FtW3cI5PTFM5wLqTVCkZEpAhnrrKFajDjvY8v7fD66nU4o5ljfVixlEcBE2x
         E21Q==
X-Gm-Message-State: AOAM530EKZb/64GBmv8tYgw7gTxbfsBq8DKDaNDoapaCbaN3tabBZRo7
	hqSpWRn7AbDuyL+yv3XSlnQq1v3qTwzImqzCPfU=
X-Google-Smtp-Source: ABdhPJwf5H+iBP/Imt7Fv/vNauuKZJ8AcxngexyR+/GlyTwewjDqIjrwQKpkW+TRruxwag4apjfquaEJ3AcBSCoKYtc=
X-Received: by 2002:ac8:60c9:: with SMTP id i9mr1762954qtm.88.1612634702822;
 Sat, 06 Feb 2021 10:05:02 -0800 (PST)
MIME-Version: 1.0
References: <20210206174155.2670243-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20210206174155.2670243-1-open.source@oleksandr-kravchuk.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 6 Feb 2021 10:04:52 -0800
Message-ID: <CAMKF1sqmbanbwmvYMtff1R6N0P8TpjEHeyhiDPX4RbzXYiajuA@mail.gmail.com>
Subject: Re: [oe] [PATCH][meta-oe] cereal: update to 1.3.0
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009d406405baaec63e"

--0000000000009d406405baaec63e
Content-Type: text/plain; charset="UTF-8"

Thanks for patch we also have libcereal in meta-Oe can you merge changes
from that recipe here as well and then delete the other libcereal recipe

On Sat, Feb 6, 2021 at 9:42 AM Oleksandr Kravchuk <
open.source@oleksandr-kravchuk.com> wrote:

> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../cereal/{cereal_1.0.bb => cereal_1.3.0.bb}                 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-devtools/cereal/{cereal_1.0.bb => cereal_1.3.0.bb}
> (92%)
>
> diff --git a/meta-oe/recipes-devtools/cereal/cereal_1.0.bb
> b/meta-oe/recipes-devtools/cereal/cereal_1.3.0.bb
> similarity index 92%
> rename from meta-oe/recipes-devtools/cereal/cereal_1.0.bb
> rename to meta-oe/recipes-devtools/cereal/cereal_1.3.0.bb
> index dd3dc189d..a4b7f3432 100644
> --- a/meta-oe/recipes-devtools/cereal/cereal_1.0.bb
> +++ b/meta-oe/recipes-devtools/cereal/cereal_1.3.0.bb
> @@ -18,7 +18,7 @@ SRC_URI = " \
>      file://0001-add-license-files-for-components-of-cereal.patch \
>  "
>
> -SRCREV = "48fda3f0a6b58f9a9278ec15c15e7b7c3dceeceb"
> +SRCREV = "02eace19a99ce3cd564ca4e379753d69af08c2c8"
>
>  EXTRA_OECMAKE += "\
>      -DCEREAL_INSTALL=TRUE \
> @@ -32,5 +32,5 @@ PROVIDES += "${PN}-dev"
>  FILES_${PN}-dev = " \
>      ${includedir} \
>      ${libdir} \
> +    ${datadir}/cmake \
>  "
> -
> --
> 2.25.1
>
>
> 
>
>

--0000000000009d406405baaec63e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks for patch we also have libcereal in meta-Oe can yo=
u merge changes from that recipe here as well and then delete the other lib=
cereal recipe=C2=A0</div><div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sat, Feb 6, 2021 at 9:42 AM Oleksandr Kravchuk &=
lt;<a href=3D"mailto:open.source@oleksandr-kravchuk.com">open.source@oleksa=
ndr-kravchuk.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Sig=
ned-off-by: Oleksandr Kravchuk &lt;<a href=3D"mailto:open.source@oleksandr-=
kravchuk.com" target=3D"_blank">open.source@oleksandr-kravchuk.com</a>&gt;<=
br>
---<br>
=C2=A0.../cereal/{<a href=3D"http://cereal_1.0.bb" rel=3D"noreferrer" targ=
et=3D"_blank">cereal_1.0.bb</a> =3D&gt; <a href=3D"http://cereal_1.3.0.bb" =
rel=3D"noreferrer" target=3D"_blank">cereal_1.3.0.bb</a>}=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-oe/recipes-devtools/cereal/{<a href=3D"http://cereal_1.0=
.bb" rel=3D"noreferrer" target=3D"_blank">cereal_1.0.bb</a> =3D&gt; <a href=
=
=3D"http://cereal_1.3.0.bb" rel=3D"noreferrer" target=3D"_blank">cereal_1.=
3.0.bb</a>} (92%)<br>
<br>
diff --git a/meta-oe/recipes-devtools/cereal/<a href=3D"http://cereal_1.0.=
bb" rel=3D"noreferrer" target=3D"_blank">cereal_1.0.bb</a> b/meta-oe/recipe=
s-devtools/cereal/<a href=3D"http://cereal_1.3.0.bb" rel=3D"noreferrer" tar=
get=3D"_blank">cereal_1.3.0.bb</a><br>
similarity index 92%<br>
rename from meta-oe/recipes-devtools/cereal/<a href=3D"http://cereal_1.0.b=
b" rel=3D"noreferrer" target=3D"_blank">cereal_1.0.bb</a><br>
rename to meta-oe/recipes-devtools/cereal/<a href=3D"http://cereal_1.3.0.b=
b" rel=3D"noreferrer" target=3D"_blank">cereal_1.3.0.bb</a><br>
index dd3dc189d..a4b7f3432 100644<br>
--- a/meta-oe/recipes-devtools/cereal/<a href=3D"http://cereal_1.0.bb" rel=
=
=3D"noreferrer" target=3D"_blank">cereal_1.0.bb</a><br>
+++ b/meta-oe/recipes-devtools/cereal/<a href=3D"http://cereal_1.3.0.bb" r=
el=3D"noreferrer" target=3D"_blank">cereal_1.3.0.bb</a><br>
@@ -18,7 +18,7 @@ SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-add-license-files-for-components-of-cereal=
.patch \<br>
=C2=A0&quot;<br>
<br>
-SRCREV =3D &quot;48fda3f0a6b58f9a9278ec15c15e7b7c3dceeceb&quot;<br>
+SRCREV =3D &quot;02eace19a99ce3cd564ca4e379753d69af08c2c8&quot;<br>
<br>
=C2=A0EXTRA_OECMAKE +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0-DCEREAL_INSTALL=3DTRUE \<br>
@@ -32,5 +32,5 @@ PROVIDES +=3D &quot;${PN}-dev&quot;<br>
=C2=A0FILES_${PN}-dev =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${includedir} \<br>
=C2=A0 =C2=A0 =C2=A0${libdir} \<br>
+=C2=A0 =C2=A0 ${datadir}/cmake \<br>
=C2=A0&quot;<br>
-<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--0000000000009d406405baaec63e--
