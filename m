Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web12.59643.1594047695747557720
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2020 08:01:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dd/3MhHW;
 spf=pass (domain: gmail.com, ip: 209.85.166.179, mailfrom: ticotimo@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id s21so18001261ilk.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2020 08:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3VmzkMYgYdA2K9rkPYtXJAx+AeYKHmxVxgCylp0rEq8=;
        b=dd/3MhHWgmqdUf/1KFPLRikWc1kcIA+wUKthdS48LXC8Hxla84+KhyFmpCQDUdFKM4
         PpGOGQpoFcWNOdy00cca9E74T9rUcWT/kHbC8YoD/uBUPgVPvbYecVaVKNe39RVfx7UF
         AbVC6wNgBZnRtIVHvPM2ofq4rFc7HCHTIK19OWhN9vcLoNC7u49zS1tgbdDoejtFrwaX
         F8nw1Q4AAmqgXG/PZcVgjIKDLSbYm98/O03tWqPo7SLR82NADisKMkxhJprkJUnfyfY3
         yoUyuq9ocvquxRReCOZbtC5Ld5jcrgECBjjzR8SpLdR6NQ4dDr9smkftbmnd60TNF9fv
         VFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3VmzkMYgYdA2K9rkPYtXJAx+AeYKHmxVxgCylp0rEq8=;
        b=k/OEZPoJxs6vd0B66ilz03F73l/2qr2xDHr7HHdTYFRS1mqOTlt8PU8xgTwihfGgl9
         BL3ZDZ280lVpTNOWcFzKGgU5kllYHnh5iCmfpqPm7F+pNdirmM5w8d5hGTazu88vK21h
         OyYxV+GLKWaA/WV1QyrNkbhHKz+CINlz90GojfqcDDVZgSswNbQTxxMueepm0V3JVJ41
         y3i4M6Op0upPXQBWbKOuLss/+accpMG/1bXgfQZIIRcmm8IEhMgDR8MHDMvjnnKd/k9t
         kXotR6TCFsoavXShTfZQ17wC5k/m0T+S2eddvE3DpFv1GeU+UexW6xFiwRdUKOFbuET8
         mQAA==
X-Gm-Message-State: AOAM5330lHL3qFhVnosK91170ACHu0SqIaJwsRtYP3jUFSSIZ/6yl/XX
	TZLzuGabTBhVBAgEhfyuzHiMnq88ZTsdF93pQXU=
X-Google-Smtp-Source: ABdhPJw4W9GnuObonf58+F6/ocDuX571qSRq/GjFjU+hcb1npqdFh4YWBxocmvlY+hE2rFc/jx85Fho9e8a0TPcgqEg=
X-Received: by 2002:a92:cf51:: with SMTP id c17mr22447244ilr.122.1594047695081;
 Mon, 06 Jul 2020 08:01:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200706145109.600956-1-raj.khem@gmail.com>
In-Reply-To: <20200706145109.600956-1-raj.khem@gmail.com>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Mon, 6 Jul 2020 08:01:24 -0700
Message-ID: <CANx9H-DHHuFfeM0ab3txSrvgjEHiRLC7Rq4KeRp-BgriAxyGzw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-requests-toolbelt: Remove py3-mock from rdeps
To: Sakib Sajal <sakib.sajal@windriver.com>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009ed76605a9c726bc"

--0000000000009ed76605a9c726bc
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 6, 2020 at 7:51 AM Khem Raj <raj.khem@gmail.com> wrote:

> python3-mock does not exist as independent package
>

Sakib,
Perhaps you were bringing it in from meta-cloud-services?
http://layers.openembedded.org/layerindex/recipe/120255/


> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  .../recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb   | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-requests-toolbelt_0.9.1.bb b/meta-python/recipes-devtools/python/
> python3-requests-toolbelt_0.9.1.bb
> index e075c019d0..27d122cd52 100644
> --- a/meta-python/recipes-devtools/python/
> python3-requests-toolbelt_0.9.1.bb
> +++ b/meta-python/recipes-devtools/python/
> python3-requests-toolbelt_0.9.1.bb
> @@ -20,7 +20,6 @@ RDEPENDS_${PN} += " \
>  RDEPENDS_${PN}-ptest += " \
>         ${PYTHON_PN}-pytest \
>         ${PYTHON_PN}-betamax \
> -       ${PYTHON_PN}-mock \
>  "
>
>  do_install_ptest() {
> --
> 2.27.0
>
> 
>

--0000000000009ed76605a9c726bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Jul 6, 2020 at 7:51 AM Khem Raj &lt;<a href=3D"mai=
lto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">python3-mock does not exist as independent package<b=
r>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Sakib,</div><di=
v dir=3D"auto">Perhaps you were bringing it in from meta-cloud-services?</d=
iv><div dir=3D"auto"><div><a href=3D"http://layers.openembedded.org/layerin=
dex/recipe/120255/">http://layers.openembedded.org/layerindex/recipe/120255=
/</a></div></div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
Cc: Sakib Sajal &lt;<a href=3D"mailto:sakib.sajal@windriver.com" target=3D=
"_blank">sakib.sajal@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-requests-toolb=
elt_0.9.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-requests-toolbel=
t_0.9.1.bb</a>=C2=A0 =C2=A0| 1 -<br>
=C2=A01 file changed, 1 deletion(-)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3=
-requests-toolbelt_0.9.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-r=
equests-toolbelt_0.9.1.bb</a> b/meta-python/recipes-devtools/python/<a href=
=
=3D"http://python3-requests-toolbelt_0.9.1.bb" rel=3D"noreferrer" target=
=3D"_blank">python3-requests-toolbelt_0.9.1.bb</a><br>
index e075c019d0..27d122cd52 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-reques=
ts-toolbelt_0.9.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-requests=
-toolbelt_0.9.1.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-reques=
ts-toolbelt_0.9.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-requests=
-toolbelt_0.9.1.bb</a><br>
@@ -20,7 +20,6 @@ RDEPENDS_${PN} +=3D &quot; \<br>
=C2=A0RDEPENDS_${PN}-ptest +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-pytest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-betamax \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-mock \<br>
=C2=A0&quot;<br>
<br>
=C2=A0do_install_ptest() {<br>
-- <br>
2.27.0<br>
<br>
<br>
</blockquote></div></div>

--0000000000009ed76605a9c726bc--
