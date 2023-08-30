Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A46C83F01
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 17:32:10 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.832.1693416722515121510
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Aug 2023 10:32:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=dYVLn/aa;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-31c479ede21so5007903f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 10:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693416721; x=1694021521; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YjiXsf2TPZGF0ErzzoKRaRlAhKFy0WPHMS7C3oAoGVA=;
        b=dYVLn/aa9IfuDCqk43T+CCu//7sYl7R8PcEhW5oXN6692QSwcjqqORO1flnseGZMvd
         94eBfk/iAqVpnFAMtvt6LbobxKLDVnq4V53/kq5Id4JP1Ot9OjLud0BPn3nmbd/av43N
         VK6zdX2mHsXdrzItcl11adeKI+5Bj94Aio0vcxBNdU8FfNQiaINwGywqTVv/8Kx7XnHy
         rxYlN2sflA7vzHoL6n6xLlAKeAixO/3zsT90cxR166FbQKsXsuFbxcHy99Tr13N5Ty2Q
         v3j+fN22xN1duH89K3mfD3bywmOB+UN2vC0Ja9KMGMfrucd5OFaHHJ2xjpmIAG7g2Sjh
         Qp0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693416721; x=1694021521;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YjiXsf2TPZGF0ErzzoKRaRlAhKFy0WPHMS7C3oAoGVA=;
        b=J07hCSJJvA+Oor3M6mBGCCm89AcvN8pu+Bgggc8o4MsQx/unHGlZFptMu2uQ74A/4t
         JyNdQLnluTXw/K+5JNxUXtK8aHo7G+DqumPywhjPRiOe3i/U+p5jwcnPi3KGFBo7tCpA
         Ib1abxyko+j1ZJ7gyM9axXJ/I7lXUssvFynUorWiosYyizPmsExJ4xtu2o8lvoJ/+jJ0
         a/uFuzAl0DciL47HF6lPCP0TTreB/J/xDYCc/4qcn+DqKZQU5FtJizfcbse2/t+/lin+
         NahRAZtfoaFDfDih6gJsTE6YlgH7c83uSGj0IhYczcRR9EqB/6zN5eVSItIcIFoG/Pql
         gsig==
X-Gm-Message-State: AOJu0YyoV82HiMl6AKdfjHRqt8niMwwvGdW2LNRgcodFdEPlsACKXtV0
	4zPxsVSQLO6WZSzGSHK8mHO8PqYTjMucE6CCbsg=
X-Google-Smtp-Source: AGHT+IF4R1DTjS5Gtg26esNVVdNQp/c2D00nJenSt6g0gysxkiizWZRA78Rm0QxuJLxzzeg2/POlmyhjQeFw8qsOJPw=
X-Received: by 2002:adf:f70b:0:b0:314:a3f:9c08 with SMTP id
 r11-20020adff70b000000b003140a3f9c08mr1831643wrp.39.1693416720644; Wed, 30
 Aug 2023 10:32:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230830162330.2967-1-f_l_k@t-online.de>
In-Reply-To: <20230830162330.2967-1-f_l_k@t-online.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 30 Aug 2023 19:31:36 +0200
Message-ID: <CA+chaQeJ=PazOmdkHbwnCjE7ZmRMV=6FqpMFMSG+v-9DBfKZtQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libosinfo: build vapi only if
 gobject-introspection is enabled
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001740b90604274e4d"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 17:32:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104676

--0000000000001740b90604274e4d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

On Wed, Aug 30, 2023 at 6:23=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wro=
te:

> this fixes:
> meson.build:40:8: ERROR: Problem encountered: vala support was requested,
> but introspection support is mandatory.
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta-oe/recipes-support/libosinfo/libosinfo_1.10.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-support/libosinfo/libosinfo_1.10.bb
> b/meta-oe/recipes-support/libosinfo/libosinfo_1.10.bb
> index b02bc1281..d724c52ea 100644
> --- a/meta-oe/recipes-support/libosinfo/libosinfo_1.10.bb
> +++ b/meta-oe/recipes-support/libosinfo/libosinfo_1.10.bb
> @@ -23,10 +23,10 @@ GIR_MESON_ENABLE_FLAG =3D 'enabled'
>  GIR_MESON_DISABLE_FLAG =3D 'disabled'
>  GTKDOC_MESON_OPTION =3D "enable-gtk-doc"
>
> -EXTRA_OEMESON =3D " \
> +EXTRA_OEMESON +=3D " \
>         -Dwith-pci-ids-path=3D${datadir}/pci.ids \
>         -Dwith-usb-ids-path=3D${datadir}/usb.ids \
> -       -Denable-vala=3Denabled \
> +       ${@bb.utils.contains('GI_DATA_ENABLED', 'True',
> '-Denable-vala=3Denabled', '-Denable-vala=3Ddisabled', d)} \
>  "
>
>  RDEPENDS:${PN} =3D "pciutils-ids usbids"
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104671):
> https://lists.openembedded.org/g/openembedded-devel/message/104671
> Mute This Topic: https://lists.openembedded.org/mt/101056232/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000001740b90604274e4d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Acked-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@=
gmail.com">Martin.Jansa@gmail.com</a>&gt;<br></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 30, 2023 at 6:23=
=E2=80=AFPM Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t-on=
line.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">this fixes:<br>
meson.build:40:8: ERROR: Problem encountered: vala support was requested, b=
ut introspection support is mandatory.<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-support/libosinfo/<a href=3D"http://libosinfo_1.10.bb=
" rel=3D"noreferrer" target=3D"_blank">libosinfo_1.10.bb</a> | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta-oe/recipes-support/libosinfo/<a href=3D"http://libosinfo_=
1.10.bb" rel=3D"noreferrer" target=3D"_blank">libosinfo_1.10.bb</a> b/meta-=
oe/recipes-support/libosinfo/<a href=3D"http://libosinfo_1.10.bb" rel=3D"no=
referrer" target=3D"_blank">libosinfo_1.10.bb</a><br>
index b02bc1281..d724c52ea 100644<br>
--- a/meta-oe/recipes-support/libosinfo/<a href=3D"http://libosinfo_1.10.bb=
" rel=3D"noreferrer" target=3D"_blank">libosinfo_1.10.bb</a><br>
+++ b/meta-oe/recipes-support/libosinfo/<a href=3D"http://libosinfo_1.10.bb=
" rel=3D"noreferrer" target=3D"_blank">libosinfo_1.10.bb</a><br>
@@ -23,10 +23,10 @@ GIR_MESON_ENABLE_FLAG =3D &#39;enabled&#39;<br>
=C2=A0GIR_MESON_DISABLE_FLAG =3D &#39;disabled&#39;<br>
=C2=A0GTKDOC_MESON_OPTION =3D &quot;enable-gtk-doc&quot;<br>
<br>
-EXTRA_OEMESON =3D &quot; \<br>
+EXTRA_OEMESON +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dwith-pci-ids-path=3D${datadir}/pci.ids \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dwith-usb-ids-path=3D${datadir}/usb.ids \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0-Denable-vala=3Denabled \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;GI_DATA_ENABLED&#39;,=
 &#39;True&#39;, &#39;-Denable-vala=3Denabled&#39;, &#39;-Denable-vala=3Ddi=
sabled&#39;, d)} \<br>
=C2=A0&quot;<br>
<br>
=C2=A0RDEPENDS:${PN} =3D &quot;pciutils-ids usbids&quot;<br>
-- <br>
2.41.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#104671): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/104671" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/104671</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101056232/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/101056232/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000001740b90604274e4d--

