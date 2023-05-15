Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A04FC77B7D
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 08:14:01 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.83206.1684138436371971873
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 May 2023 01:13:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=pdpzOMA1;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-307d20548adso2560368f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 May 2023 01:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684138435; x=1686730435;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yd+2i2PFaRR2UDL0UfNpZZcCo7jyR4pQUX5EMpoUUZY=;
        b=pdpzOMA1cmwWlQ+lxQuGXgCI7ot3Cy79BLwmJPrVbSw9X87bnTakyQRr/5Tym1a8nd
         AkJ3xvTHYd31NIvuh6eYy5Skufyne4AHWK+rW68Tv4p1y5aM3DrXf0RG+ugUHnuSQezp
         mWC97Zef1q4HFkpsBMC2HFToaYnu/hTH98MogElblUbb7oJcpow4BnVJMTR8GzmVVuTK
         qNJwrVaemE3gO+eDs+OQX2zZzEqzpP8gmI5C385tCAMrq3tWQrd17+YrdCjQ8T8YKPKX
         FfeL+3MzIi+19ueSMqKnZFGmJF6HDL5Sw/jB1NTrM6Y5RVcdkDEZbnXI16n71p0uJ2uj
         pPog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684138435; x=1686730435;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yd+2i2PFaRR2UDL0UfNpZZcCo7jyR4pQUX5EMpoUUZY=;
        b=FOxZrU8zByAfOnQwtt+MfjeYR9VsWO5OQd0fTy6dgMU5FYsmc0TilXQbjOdHHKE0mx
         bae+1A74ECMJ568pVlwbpVKiItohhDfOhkp+yMh/YU2dPr55Ea/GiL+Dq1JPXGautVTc
         qNShCdMZST+VtnwgvIYay8gRtwzW/xmBuJNBD7woBVwmYwBX9zoYxvmT1+kSrV7oLk1z
         BmcNEDb5MkJcMhRJgTdgBWF9sMbWPK0BOT+SFPQQNKROYZqpMMjsRBeNUTPncM1jYA0V
         zdLTWOTA0S/Ous3ylw0o1PHdb6MfY7xtlaSAlMZL9dnnpd90oc39Yw10g+8G94WANCJ/
         QuKg==
X-Gm-Message-State: AC+VfDwxBMY65d59l2t5P4FSzHtMhYkZH30nlj7EjORNDSG+pv5143PT
	spjLvdnjP82is+j+mTFP2SBH9F8nKT7F3KhJMXA=
X-Google-Smtp-Source: ACHHUZ7MxjWIhy0i69VI66oun2B6vcQ46IWDwQcR93h2gltWFu56uZlxGwN4LbE7dPDxcIlokBsY+1+6zuJJILHtqI8=
X-Received: by 2002:adf:ecc4:0:b0:2f9:ee8c:a2fa with SMTP id
 s4-20020adfecc4000000b002f9ee8ca2famr23225411wro.64.1684138434545; Mon, 15
 May 2023 01:13:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230509124612.37627-1-f_l_k@t-online.de>
In-Reply-To: <20230509124612.37627-1-f_l_k@t-online.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 15 May 2023 10:13:41 +0200
Message-ID: <CA+chaQdJjtYgByUO9wNXEC-2hRC7EmsMF_2gwVGY0qRDkSveuQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] paprefs: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000024cdc905fbb7092c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 May 2023 08:14:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102596

--00000000000024cdc905fbb7092c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 9, 2023 at 2:46=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wrot=
e:

> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../pulseaudio/paprefs_1.2.bb                  | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta-oe/recipes-multimedia/pulseaudio/paprefs_1.2.bb
>
> diff --git a/meta-oe/recipes-multimedia/pulseaudio/paprefs_1.2.bb
> b/meta-oe/recipes-multimedia/pulseaudio/paprefs_1.2.bb
> new file mode 100644
> index 0000000000..6d0cf7ed7f
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/pulseaudio/paprefs_1.2.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION =3D "PulseAudio Preferences (paprefs) is a simple GTK based
> configuration dialog for the PulseAudio sound server."
> +HOMEPAGE =3D "https://freedesktop.org/software/pulseaudio/paprefs/"
> +LICENSE =3D "GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D751419260aa954499f7abaabaa882=
bbe"
> +
> +DEPENDS =3D "pulseaudio gtkmm3 gtk+3 libsigc++-3 glibmm"
> +
> +inherit meson pkgconfig features_check
> +
> +ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
>

This doesn't build with any gtk3 DISTRO_FEATURES, without x11 in
DISTRO_FEATURES gtk3+ doesn't provide gdkx.h and paprefs build fails with:
http://errors.yoctoproject.org/Errors/Details/704195/

../paprefs-1.2/src/paprefs.cc:30:10: fatal error: gdk/gdkx.h: No such file
or directory
   30 | #include <gdk/gdkx.h>
      |          ^~~~~~~~~~~~

Please change it to REQUIRED_DISTRO_FEATURES =3D "x11" if you don't care
about non-x11 usecase or fix otherwise if you do care.

Regards,

--00000000000024cdc905fbb7092c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, May 9, 2023 at 2:46=E2=80=AFPM Ma=
rkus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt=
; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@=
t-online.de" target=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0.../pulseaudio/<a href=3D"http://paprefs_1.2.bb" rel=3D"noreferrer" t=
arget=3D"_blank">paprefs_1.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 18 ++++++++++++++++++<br>
=C2=A01 file changed, 18 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-multimedia/pulseaudio/<a href=3D"h=
ttp://paprefs_1.2.bb" rel=3D"noreferrer" target=3D"_blank">paprefs_1.2.bb</=
a><br>
<br>
diff --git a/meta-oe/recipes-multimedia/pulseaudio/<a href=3D"http://papref=
s_1.2.bb" rel=3D"noreferrer" target=3D"_blank">paprefs_1.2.bb</a> b/meta-oe=
/recipes-multimedia/pulseaudio/<a href=3D"http://paprefs_1.2.bb" rel=3D"nor=
eferrer" target=3D"_blank">paprefs_1.2.bb</a><br>
new file mode 100644<br>
index 0000000000..6d0cf7ed7f<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-multimedia/pulseaudio/<a href=3D"http://paprefs_1.2.b=
b" rel=3D"noreferrer" target=3D"_blank">paprefs_1.2.bb</a><br>
@@ -0,0 +1,18 @@<br>
+DESCRIPTION =3D &quot;PulseAudio Preferences (paprefs) is a simple GTK bas=
ed configuration dialog for the PulseAudio sound server.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://freedesktop.org/software/pulseaudio/=
paprefs/" rel=3D"noreferrer" target=3D"_blank">https://freedesktop.org/soft=
ware/pulseaudio/paprefs/</a>&quot;<br>
+LICENSE =3D &quot;GPL-2.0-only&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D751419260aa954499f7abaabaa=
882bbe&quot;<br>
+<br>
+DEPENDS =3D &quot;pulseaudio gtkmm3 gtk+3 libsigc++-3 glibmm&quot;<br>
+<br>
+inherit meson pkgconfig features_check<br>
+<br>
+ANY_OF_DISTRO_FEATURES =3D &quot;${GTK3DISTROFEATURES}&quot;<br></blockquo=
te><div><br></div><div>This doesn&#39;t build with any gtk3 DISTRO_FEATURES=
, without x11 in DISTRO_FEATURES gtk3+ doesn&#39;t provide=C2=A0gdkx.h and =
paprefs build fails with:</div><div><a href=3D"http://errors.yoctoproject.o=
rg/Errors/Details/704195/">http://errors.yoctoproject.org/Errors/Details/70=
4195/</a></div><div><br></div><div>../paprefs-1.2/src/paprefs.cc:30:10: fat=
al error: gdk/gdkx.h: No such file or directory<br>=C2=A0 =C2=A030 | #inclu=
de &lt;gdk/gdkx.h&gt;<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0^~~~~~~~~~~~<br></div><div><br></div><div>Please change it to REQUIR=
ED_DISTRO_FEATURES =3D &quot;x11&quot; if you don&#39;t care about non-x11 =
usecase or fix otherwise if you do care.</div><div><br></div><div>Regards,<=
/div></div></div>

--00000000000024cdc905fbb7092c--

