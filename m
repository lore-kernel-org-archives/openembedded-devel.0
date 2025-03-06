Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD3B3C282D1
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 15:59:53 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.17219.1741276787885188236
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Mar 2025 07:59:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=HdPv7wov;
 spf=pass (domain: snapchat.com, ip: 209.85.208.45, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e5dce099f4so519694a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 Mar 2025 07:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1741276786; x=1741881586; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6lFDkl5nMQvO6fgoC5cfEQi1p5X5gt03wC2NoPZ+/mc=;
        b=HdPv7wov6fOy20pEz0fWD/dg0TYRHjnKtCRkJQ4l1oCUJN1PlNQmJ5Fjo9u6DHFqXV
         KynGwK5U0ilv8sxxjWLaSPeCKY5LYAedUrorprS8XJPC8KSh/BA+HB09v1I6v0qiM6ft
         FCsgESO9IAY9aEHCASMBz++rm02bQUS5AtmyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741276786; x=1741881586;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6lFDkl5nMQvO6fgoC5cfEQi1p5X5gt03wC2NoPZ+/mc=;
        b=r3gFOxfZsgCuVwDwdbHusemf7S6Ov4AQXegmkIkHA9SOtZ8Xg2gSjPY2DhSr1pbnRP
         krA2osUBVC+sHFgD3uSxFa/+GN57mIIe5La42SogyCohIAKgK3stWEfl0cTJei4J96Re
         NS5YwSgA1f0tjxfW8ZBHOrtEl8Zuis7PMzt2xAGuNHdONRi/1iipYx42Muwjt+EVQhVa
         SkKoGTe9CtKmZnzE3P19rdELO+MeBlvdmQt/XUmNGCwNVwSD/9fyXJpwfmS1JYl5AWuo
         61xUVrJz4swyhnqYYsKVa+eueWkB38Js2g0sPpGTnuRQdgO65woubQLuyBb+LJWylB+K
         xPdw==
X-Gm-Message-State: AOJu0YyS5n70grE3rUT3pvdbcghAT3QKUQToNaMRg/e1W/TkC4+oW+MC
	Q2M43aIPynHa0AsbA5T2c3eNazvzDTkw6ga66XnZlBURWW63BBDPGBF/j9h90flZ+L6ycDkPEsL
	vaUUgPxusWiXuPsb4mJEJfESL6WU5dZwIhlAGvw==
X-Gm-Gg: ASbGncsr8sFIibvXy/Oioi2lob2l8qFBypVyJdkItM7uy7/RBPRBZUqEtqoFz1rfOrT
	HL+t/JiLrF7S/QsKlRmnGjkbZYNAaDdz/QClws4ICXQGr/ZrSSQwn+E2O2WxG4wRAfqiC+6I96z
	GsXUn5d91uhMIeYZGwj2tNtlXYm6c=
X-Google-Smtp-Source: AGHT+IE1MpUABX5c+p++PXOs4iH7SaX1NygxHDVkKlsGhNbKaNU5GcbUfuQMbqcCCSZuaQnYfRE1Hjp5Wek7ogn92W4=
X-Received: by 2002:a17:907:962a:b0:ac1:f7a6:fba9 with SMTP id
 a640c23a62f3a-ac20db13a78mr747012066b.53.1741276785884; Thu, 06 Mar 2025
 07:59:45 -0800 (PST)
MIME-Version: 1.0
References: <181E3AF09E1F8B4D.4788@lists.openembedded.org> <9081184e-c6be-4151-a658-2613ce0d2eb6@gmail.com>
In-Reply-To: <9081184e-c6be-4151-a658-2613ce0d2eb6@gmail.com>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Thu, 6 Mar 2025 16:59:34 +0100
X-Gm-Features: AQ5f1JqQFfvvIZFDIBHaJkkgOcjKeehLWm0JKR0CLrI5Tq-YHpIFwHlWzdvuiQw
Message-ID: <CAHUKmYb001Y2tzbOd2Ew+Yy5q--Vhwv_Mt41afoQZboE+o6kYw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] uutils-coreutils: remove TMPDIR from build output
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000477fbe062fae98da"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Mar 2025 15:59:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115772

--000000000000477fbe062fae98da
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Gyorgy,
it is nice that you found the root-cause. I had debugged this as part of
https://github.com/uutils/coreutils/issues/6833 , but had not found why the
yocto build had this issue and not the normal ubuntu build of
uutils-coreutils.
Have you received some feedback regarding this patch?

=C3=89tienne

On Sun, Jan 26, 2025 at 12:37=E2=80=AFPM Gyorgy Sarvari via lists.openembed=
ded.org
<skandigraun=3Dgmail.com@lists.openembedded.org> wrote:

> > -ERROR_QA:remove =3D "buildpaths"
> > -WARN_QA:append =3D " buildpaths"
> > +BUILD_LDFLAGS:remove:class-target =3D "
> -Wl,-rpath,${STAGING_LIBDIR_NATIVE}  \
> > +
> -Wl,-rpath,${STAGING_BASE_LIBDIR_NATIVE} "
> >
> If this patch isn't shot down and you are trying to build this, there is =
a
> chance that it will fail: that's because BUILD_LDFLAGS is excluded from
> base config checksum, so your sscache might conflict with the actual
> recipe state.
>
> If you want, can send a v2, including a PR-bump, or something along the
> lines.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115101):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Ddevel_message_115101&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0=
hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&=
m=3DYru-Hz_1VrJInO_CPayuPmmjTpIq3jyiRHa5Rz7x9MqHysQQnpBZ6NRR143MBmi1&s=3D1K=
kFM14R2UQ7JO-6EseQURf5y34LFqkZw0utLRAXoTk&e=3D
> Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_110820444_7048771&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DYru-Hz_1VrJIn=
O_CPayuPmmjTpIq3jyiRHa5Rz7x9MqHysQQnpBZ6NRR143MBmi1&s=3DYitLjZ8Dz37qUS8nauv=
E0C8CELqvGUPDhZo4LQ_5PzQ&e=3D
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Ddevel_unsub&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHv=
abgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DYru-H=
z_1VrJInO_CPayuPmmjTpIq3jyiRHa5Rz7x9MqHysQQnpBZ6NRR143MBmi1&s=3DKewRVjyJaNI=
2vMrB_GXcyi4smxqyuSViorm5-wvLgXQ&e=3D
> [ecordonnier@snap.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000477fbe062fae98da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Gyorgy,<br>it is nice that you found the root-cause. I =
had debugged this as part of=C2=A0<a href=3D"https://github.com/uutils/core=
utils/issues/6833">https://github.com/uutils/coreutils/issues/6833</a> , bu=
t had not found why the yocto build had this issue and not the normal ubunt=
u build of uutils-coreutils.<br>Have you received some feedback regarding t=
his patch?<br><br>=C3=89tienne</div><br><div class=3D"gmail_quote gmail_quo=
te_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jan 26, 2025 at=
 12:37=E2=80=AFPM Gyorgy Sarvari via <a href=3D"http://lists.openembedded.o=
rg">lists.openembedded.org</a> &lt;skandigraun=3D<a href=3D"mailto:gmail.co=
m@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; -ERROR_QA:re=
move =3D &quot;buildpaths&quot;<br>
&gt; -WARN_QA:append =3D &quot; buildpaths&quot;<br>
&gt; +BUILD_LDFLAGS:remove:class-target =3D &quot; -Wl,-rpath,${STAGING_LIB=
DIR_NATIVE}=C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Wl,-rpath,=
${STAGING_BASE_LIBDIR_NATIVE} &quot;<br>
&gt;<br>
If this patch isn&#39;t shot down and you are trying to build this, there i=
s a<br>
chance that it will fail: that&#39;s because BUILD_LDFLAGS is excluded from=
<br>
base config checksum, so your sscache might conflict with the actual <br>
recipe state.<br>
<br>
If you want, can send a v2, including a PR-bump, or something along the <br=
>
lines.<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#115101): <a href=3D"https://urldefense.proofpoint.com/v=
2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Ddevel_message_1=
15101&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&am=
p;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DYru-Hz_1VrJInO_CP=
ayuPmmjTpIq3jyiRHa5Rz7x9MqHysQQnpBZ6NRR143MBmi1&amp;s=3D1KkFM14R2UQ7JO-6Ese=
QURf5y34LFqkZw0utLRAXoTk&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">htt=
ps://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_=
g_openembedded-2Ddevel_message_115101&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjID=
Ph0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa=
66m67E&amp;m=3DYru-Hz_1VrJInO_CPayuPmmjTpIq3jyiRHa5Rz7x9MqHysQQnpBZ6NRR143M=
Bmi1&amp;s=3D1KkFM14R2UQ7JO-6EseQURf5y34LFqkZw0utLRAXoTk&amp;e=3D</a> <br>
Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dht=
tps-3A__lists.openembedded.org_mt_110820444_7048771&amp;d=3DDwIFaQ&amp;c=3D=
ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&amp;m=3DYru-Hz_1VrJInO_CPayuPmmjTpIq3jyiRHa5Rz7x9MqHys=
QQnpBZ6NRR143MBmi1&amp;s=3DYitLjZ8Dz37qUS8nauvE0C8CELqvGUPDhZo4LQ_5PzQ&amp;=
e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_110820444_7048771&amp;d=3D=
DwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DYru-Hz_1VrJInO_CPayuPmmjTpIq3jy=
iRHa5Rz7x9MqHysQQnpBZ6NRR143MBmi1&amp;s=3DYitLjZ8Dz37qUS8nauvE0C8CELqvGUPDh=
Zo4LQ_5PzQ&amp;e=3D</a> <br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__lists.openembedded.org_g_openembedded-2Ddevel_unsub&amp;d=3DDwIFaQ&amp;=
c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj=
9TsRih1DULJTKUkSGa66m67E&amp;m=3DYru-Hz_1VrJInO_CPayuPmmjTpIq3jyiRHa5Rz7x9M=
qHysQQnpBZ6NRR143MBmi1&amp;s=3DKewRVjyJaNI2vMrB_GXcyi4smxqyuSViorm5-wvLgXQ&=
amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoin=
t.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Ddevel_un=
sub&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;=
r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DYru-Hz_1VrJInO_CPay=
uPmmjTpIq3jyiRHa5Rz7x9MqHysQQnpBZ6NRR143MBmi1&amp;s=3DKewRVjyJaNI2vMrB_GXcy=
i4smxqyuSViorm5-wvLgXQ&amp;e=3D</a>=C2=A0 [<a href=3D"mailto:ecordonnier@sn=
ap.com" target=3D"_blank">ecordonnier@snap.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000477fbe062fae98da--

