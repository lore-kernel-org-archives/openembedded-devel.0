Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
 by mx.groups.io with SMTP id smtpd.web10.13733.1600943835445075481
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Sep 2020 03:37:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.66, mailfrom: aehs29@gmail.com)
Received: by mail-lf1-f66.google.com with SMTP id 77so3377249lfj.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2020 03:37:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VTDa9AnfTPJSHAlaVq180UmGh3XKTR++l6rYPFu/bqQ=;
        b=dv1afFLO3NvZLjk0r5FAU1IA7td5x7D+f6dMFwFcDLBUeNQs/L1MJ7l0yOT5f5KaH0
         YZfRj2fVMBrZjJWq3fGTRmUWZ3l+xEza4LA7TSzFXLpFnPfecqM7IwWlJozd/duKcPBC
         PL0CuLK5d5S8XJSoLzb8McSsKl/zwskKA5WU1LTPz3rRTR1rVAYQ/LkosAdbQa1SLmEj
         qTYbazj6RirwQzrJBwZSQQd60dJTGiLMO1RdgSLtSRnQ3HpAepTkKKj/E+IWSTFtczm5
         83IzPgnjLC9QWQHRARGHwnzCbGnHmvgvuVkyj6+/xCyC3JHo+EAgDGHoMYhCaOMdk2Y4
         U4yg==
X-Gm-Message-State: AOAM530JjlnBtgGAvdU9EKb/D/X5cBoqN3jgnsdW9kv7UFef/hRTC+uK
	VImkoipGfds1jqzkChp42SOmIFH64kpe6g==
X-Google-Smtp-Source: ABdhPJwrB77g2gNJ9a7JNToxxbIM8Ut7Y5AmyUzwbP9U6Nh34+7QwR4st0vXCtC6j98eLaiOtrqzhA==
X-Received: by 2002:a19:8209:: with SMTP id e9mr70320lfd.254.1600943833208;
        Thu, 24 Sep 2020 03:37:13 -0700 (PDT)
Return-Path: <aehs29@gmail.com>
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id o8sm1682974lfn.179.2020.09.24.03.37.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2020 03:37:12 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id z17so3282115lfi.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2020 03:37:12 -0700 (PDT)
X-Received: by 2002:a19:82c3:: with SMTP id e186mr71978lfd.144.1600943832678;
 Thu, 24 Sep 2020 03:37:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200924044218.33009-1-alejandro@enedino.org> <CALbNGRR+QJad7PQA3hQSw8JkD8X8HLHt_gemWZZz8DAqQCJBGA@mail.gmail.com>
In-Reply-To: <CALbNGRR+QJad7PQA3hQSw8JkD8X8HLHt_gemWZZz8DAqQCJBGA@mail.gmail.com>
From: "Alejandro Hernandez Samaniego" <alejandro@enedino.org>
Date: Thu, 24 Sep 2020 04:36:59 -0600
X-Gmail-Original-Message-ID: <CAHMutrYNzyT23ZzEnC=f5wJM=U-Ur7BMj7FNEOwwEErAYLr9yw@mail.gmail.com>
Message-ID: <CAHMutrYNzyT23ZzEnC=f5wJM=U-Ur7BMj7FNEOwwEErAYLr9yw@mail.gmail.com>
Subject: Re: [oe] [PATCH] gedit: Add gsettings-desktop-schemas to RDEPENDS
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000073c78305b00cc8c3"

--00000000000073c78305b00cc8c3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2020, 1:34 AM Andreas M=C3=BCller <schnitzeltony@gmail.com>
wrote:

> On Thu, Sep 24, 2020 at 6:42 AM Alejandro Hernandez Samaniego
> <alejandro@enedino.org> wrote:
> >
> > gedit isn't able to start at all, showing the following error:
> >
> > (org.gnome.gedit:32150): GLib-GIO-ERROR **: 04:29:21.795: Settings
> schema \
> > 'org.gnome.desktop.lockdown' is not installed
> > Trace/breakpoint trap
> >
> > gedit tries to look for the lockdown schema which is part of the
> > gsettings-desktop-schemas package.
> >
> > Add gsettings-desktop-schemas to RDEPENDS_gedit so when gedit is
> installed it
> > finds the required files in the rootfs.
> >
> > Signed-off-by: Alejandro Hernandez Samaniego <alejandro@enedino.org>
> > ---
> >  meta-gnome/recipes-gnome/gedit/gedit_3.36.2.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-gnome/recipes-gnome/gedit/gedit_3.36.2.bb
> b/meta-gnome/recipes-gnome/gedit/gedit_3.36.2.bb
> > index afd9146ac..4da44b605 100644
> > --- a/meta-gnome/recipes-gnome/gedit/gedit_3.36.2.bb
> > +++ b/meta-gnome/recipes-gnome/gedit/gedit_3.36.2.bb
> > @@ -16,6 +16,8 @@ DEPENDS =3D " \
> >      tepl \
> >  "
> >
> > +RDEPENDS_${PN} =3D "gsettings-desktop-schemas"
> Should be
>
> RDEPENDS_${PN} +=3D "gsettings-desktop-schemas"
>
> Andreas
>

Thanks for pointing it out, sending v2

> +
> >  inherit gnomebase gsettings itstool gnome-help gobject-introspection
> gtk-doc vala gettext features_check upstream-version-is-even mime-xdg
> >
> >  REQUIRED_DISTRO_FEATURES =3D "x11"
> > --
> > 2.17.1
> >
> >
> >=20
> >
>

--00000000000073c78305b00cc8c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Sep 24, 2020, 1:34 AM Andreas M=C3=BCller &lt;=
<a href=3D"mailto:schnitzeltony@gmail.com">schnitzeltony@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">On Thu, Sep 24, 2020 at 6:42=
 AM Alejandro Hernandez Samaniego<br>
&lt;<a href=3D"mailto:alejandro@enedino.org" target=3D"_blank" rel=3D"nore=
ferrer">alejandro@enedino.org</a>&gt; wrote:<br>
&gt;<br>
&gt; gedit isn&#39;t able to start at all, showing the following error:<br=
>
&gt;<br>
&gt; (org.gnome.gedit:32150): GLib-GIO-ERROR **: 04:29:21.795: Settings sc=
hema \<br>
&gt; &#39;org.gnome.desktop.lockdown&#39; is not installed<br>
&gt; Trace/breakpoint trap<br>
&gt;<br>
&gt; gedit tries to look for the lockdown schema which is part of the<br>
&gt; gsettings-desktop-schemas package.<br>
&gt;<br>
&gt; Add gsettings-desktop-schemas to RDEPENDS_gedit so when gedit is inst=
alled it<br>
&gt; finds the required files in the rootfs.<br>
&gt;<br>
&gt; Signed-off-by: Alejandro Hernandez Samaniego &lt;<a href=3D"mailto:al=
ejandro@enedino.org" target=3D"_blank" rel=3D"noreferrer">alejandro@enedino=
.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-gnome/recipes-gnome/gedit/<a href=3D"http://gedit_3.36.2.b=
b" rel=3D"noreferrer noreferrer" target=3D"_blank">gedit_3.36.2.bb</a> | 2 =
++<br>
&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta-gnome/recipes-gnome/gedit/<a href=3D"http://gedit_3=
.36.2.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">gedit_3.36.2.bb</=
a> b/meta-gnome/recipes-gnome/gedit/<a href=3D"http://gedit_3.36.2.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">gedit_3.36.2.bb</a><br>
&gt; index afd9146ac..4da44b605 100644<br>
&gt; --- a/meta-gnome/recipes-gnome/gedit/<a href=3D"http://gedit_3.36.2.b=
b" rel=3D"noreferrer noreferrer" target=3D"_blank">gedit_3.36.2.bb</a><br>
&gt; +++ b/meta-gnome/recipes-gnome/gedit/<a href=3D"http://gedit_3.36.2.b=
b" rel=3D"noreferrer noreferrer" target=3D"_blank">gedit_3.36.2.bb</a><br>
&gt; @@ -16,6 +16,8 @@ DEPENDS =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tepl \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt; +RDEPENDS_${PN} =3D &quot;gsettings-desktop-schemas&quot;<br>
Should be<br>
<br>
RDEPENDS_${PN} +=3D &quot;gsettings-desktop-schemas&quot;<br>
<br>
Andreas<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Thanks for pointing it out, sending v2</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">
&gt; +<br>
&gt;=C2=A0 inherit gnomebase gsettings itstool gnome-help gobject-introspe=
ction gtk-doc vala gettext features_check upstream-version-is-even mime-xdg=
<br>
&gt;<br>
&gt;=C2=A0 REQUIRED_DISTRO_FEATURES =3D &quot;x11&quot;<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div></div></div>

--00000000000073c78305b00cc8c3--
