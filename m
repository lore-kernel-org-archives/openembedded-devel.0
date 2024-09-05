Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAA7CCD5BA3
	for <webhook@archiver.kernel.org>; Thu,  5 Sep 2024 10:16:06 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.5990.1725531364432177174
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Sep 2024 03:16:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UceR+Uh9;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5334b0e1a8eso663538e87.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Sep 2024 03:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725531362; x=1726136162; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=urwdOlLiQ+eS/8AgXzJasvcpch/GgvIoxjDTFjg0a4w=;
        b=UceR+Uh93SPG5ylI4AwZ/KMTKX4HWPM9fsUzTTJubVt++7kdsPIGPLzBi/EvhFnNlQ
         vU0ts7UcsbbhgnMVv1aiDtQcNDPEisS9/sasLbBYeK8rR1ewINra3UEK7j0OYEtRYT1I
         hNOjWhYlBcmdDvIQ/3qM3Im1qb4F3oUGhE7i2LeJbMAPAqn0pVgJl7q/AfTnO7aaLCRN
         pD0b4yA4KK3Bb+sK0jBYYgVzql9by+oY3d9j+0jZtANQAg5qqPYP2Z2Q38B/SAh6NNmf
         Cp3VmWbk7q8h2jG8FeNonIKHdoQlMh+HCo9Ywi3ttCIR5N05rQVZyRHgKi9pNGmuhE0f
         qtbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725531362; x=1726136162;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=urwdOlLiQ+eS/8AgXzJasvcpch/GgvIoxjDTFjg0a4w=;
        b=LO27QqNSsmE5WTn2Wsmwdi6Cq5fM+nPFErQXcu+8QBXfSd+wfgnNbEQwT1/pbDPe6a
         e8RrHq/lbjU3jVueOar2S2PesvbJ7vyn2jnquQhK6kK3iv5DPMm1eHcu+qd5stK2viX4
         0VYsE1r3GQKbJ6MYRGG/kwrw2uQVvns+P3xD5Fy8aB5nwbiRGH/f5PhGfcJUwATlEx/M
         IkETsVYEGTse3JOFtISpfWZBW/I/+o6KWGoDjJz+L77As03m6c+XHGgXDalTEXnHrpK5
         wogigVI/jl0VO3XANJzK0WK488YuU3CJQFC3D3YqDzysvPwpS4x40D5sPYPtYS95ii/B
         cDwA==
X-Gm-Message-State: AOJu0YxZV9FhbC3DtS9CmyEHfHe64E2QNqePbJFtWSQ2++crOi/ydnct
	Yez2KM2DM0Y2D7StL6i/9MIV5LKMt+oBwAyEFtUWLnNC/G6SyuBeMByjDqSW511Ok7+gedg7I28
	L/5ifc1OhVgwNm9UfS6aMgMeT3q8=
X-Google-Smtp-Source: AGHT+IEMgqWBEk/9RwuPsZdQB0JHGn5o61YzmzovheJWu9E5mwqs66KZ2QdFLXKJUtvNY4ZiFeLnC+nBMHnggXKisto=
X-Received: by 2002:a05:6512:e94:b0:52e:74d5:89ae with SMTP id
 2adb3069b0e04-53546b8e017mr16220754e87.39.1725531361386; Thu, 05 Sep 2024
 03:16:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240905093005.2731956-1-yoann.congal@smile.fr>
In-Reply-To: <20240905093005.2731956-1-yoann.congal@smile.fr>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 5 Sep 2024 12:15:50 +0200
Message-ID: <CANNYZj8WR11Cm+Chio-FeS-tpS3Ydi=MTM1ivVTuNXZ6eXktLw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2 1/2] polkit: Switch PAM files to common-*
To: yoann.congal@smile.fr
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d82f6206215c9323"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Sep 2024 10:16:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112100

--000000000000d82f6206215c9323
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Should we rather define =E2=80=98openembedded=E2=80=99 as an option and sub=
mit that
upstream?

Alex

On Thu 5. Sep 2024 at 11.30, Yoann Congal via lists.openembedded.org
<yoann.congal=3Dsmile.fr@lists.openembedded.org> wrote:

> From: Yoann Congal <yoann.congal@smile.fr>
>
> Polkit meson.build tries to autodetect host OS to change PAM include
> file to match distro. Force the distro to Suse which happens to match
> OE-Core libpam configuration.
>
> NB: This also may fix a non-reproducibility bug.
>
> Fixes: https://github.com/openembedded/meta-openembedded/issues/860
>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
> v1->v2: removed patch and switch to the preexisting "Suse" OS config.
> ---
>  meta-oe/recipes-extended/polkit/polkit_125.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta-oe/recipes-extended/polkit/polkit_125.bb
> b/meta-oe/recipes-extended/polkit/polkit_125.bb
> index fe1ee467c3..54a2b3636f 100644
> --- a/meta-oe/recipes-extended/polkit/polkit_125.bb
> +++ b/meta-oe/recipes-extended/polkit/polkit_125.bb
> @@ -16,6 +16,10 @@ inherit meson pkgconfig useradd systemd gettext
> gobject-introspection features_c
>
>  REQUIRED_DISTRO_FEATURES =3D "polkit"
>
> +# meson.build try to autodetect host OS to change PAM include file to
> match distro.
> +# Force the distro to Suse which happens to match OE-Core libpam
> configuration.
> +EXTRA_OEMESON =3D "-Dos_type=3Dsuse"
> +
>  PACKAGECONFIG =3D " \
>         ${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
>         ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd',
> 'consolekit', d)} \
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112099):
> https://lists.openembedded.org/g/openembedded-devel/message/112099
> Mute This Topic: https://lists.openembedded.org/mt/108281789/1686489
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000d82f6206215c9323
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Should we rather define =E2=80=98openembedded=E2=80=99 as=
 an option and submit that upstream?</div><div dir=3D"auto"><br></div><div =
dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Thu 5. Sep 2024 at 11.30, Yoann Congal via <a href=
=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;yoann.con=
gal=3D<a href=3D"mailto:smile.fr@lists.openembedded.org">smile.fr@lists.ope=
nembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:soli=
d;padding-left:1ex;border-left-color:rgb(204,204,204)">From: Yoann Congal &=
lt;<a href=3D"mailto:yoann.congal@smile.fr" target=3D"_blank">yoann.congal@=
smile.fr</a>&gt;<br>
<br>
Polkit meson.build tries to autodetect host OS to change PAM include<br>
file to match distro. Force the distro to Suse which happens to match<br>
OE-Core libpam configuration.<br>
<br>
NB: This also may fix a non-reproducibility bug.<br>
<br>
Fixes: <a href=3D"https://github.com/openembedded/meta-openembedded/issues/=
860" rel=3D"noreferrer" target=3D"_blank">https://github.com/openembedded/m=
eta-openembedded/issues/860</a><br>
<br>
Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" ta=
rget=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
---<br>
v1-&gt;v2: removed patch and switch to the preexisting &quot;Suse&quot; OS =
config.<br>
---<br>
=C2=A0meta-oe/recipes-extended/polkit/<a href=3D"http://polkit_125.bb" rel=
=3D"noreferrer" target=3D"_blank">polkit_125.bb</a> | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/meta-oe/recipes-extended/polkit/<a href=3D"http://polkit_125.b=
b" rel=3D"noreferrer" target=3D"_blank">polkit_125.bb</a> b/meta-oe/recipes=
-extended/polkit/<a href=3D"http://polkit_125.bb" rel=3D"noreferrer" target=
=3D"_blank">polkit_125.bb</a><br>
index fe1ee467c3..54a2b3636f 100644<br>
--- a/meta-oe/recipes-extended/polkit/<a href=3D"http://polkit_125.bb" rel=
=3D"noreferrer" target=3D"_blank">polkit_125.bb</a><br>
+++ b/meta-oe/recipes-extended/polkit/<a href=3D"http://polkit_125.bb" rel=
=3D"noreferrer" target=3D"_blank">polkit_125.bb</a><br>
@@ -16,6 +16,10 @@ inherit meson pkgconfig useradd systemd gettext gobject-=
introspection features_c<br>
<br>
=C2=A0REQUIRED_DISTRO_FEATURES =3D &quot;polkit&quot;<br>
<br>
+# meson.build try to autodetect host OS to change PAM include file to matc=
h distro.<br>
+# Force the distro to Suse which happens to match OE-Core libpam configura=
tion.<br>
+EXTRA_OEMESON =3D &quot;-Dos_type=3Dsuse&quot;<br>
+<br>
=C2=A0PACKAGECONFIG =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &=
#39;pam&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;,=
 &#39;systemd&#39;, &#39;systemd&#39;, &#39;consolekit&#39;, d)} \<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#112099): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/112099" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/112099</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/108281789/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/108281789/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" =
target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000d82f6206215c9323--

