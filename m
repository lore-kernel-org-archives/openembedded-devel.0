Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C7F8C19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 10:06:28 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.7856.1741341985857827763
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Mar 2025 02:06:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=EA/sI11/;
 spf=pass (domain: snapchat.com, ip: 209.85.208.50, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e5bc066283so2503694a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Mar 2025 02:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1741341984; x=1741946784; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DkRmxUuGyGRBLa2wbMHEKnwGfama9FnCeA2dRUNSOPs=;
        b=EA/sI11/sBcLWkLHpn2Af5G03BGqhFcaPw2FDsBndNRHNXjNnCqQ/fLsDaIZC2wycA
         /6em/+ux+DWO30w69el8jXUzZkRMRkOeoH/UH1IeOEp3QPOPN3ZUiXYEIvwWramWCkFh
         /urfDOyyetDeyap+GVQn2smJll7LexfjDGfLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741341984; x=1741946784;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DkRmxUuGyGRBLa2wbMHEKnwGfama9FnCeA2dRUNSOPs=;
        b=blVwzWpx2S0Li+zUtShywifZWhE9SlZQnlCY87MYt4AJpRZJTOpWPMliKe29zc3EvZ
         ZelLNLzGq2gQ5O3S4xMxaEhwkiiqjqh2cdg/7bLwENkRYNGlQuHWEqTuX66FOQa+rLL8
         N2EqXTiLMgR2FSin/7xhoZ2NwcBZDvNPkk9MIVLq8o1eNNPS62mRuq3KcsJF6643t3uM
         N+gp70eEAds3uE/w8asXVPA8kyh3jYkg19ur8IxpR6CIw84K90z8x/wtaWsktVl8L8Rx
         f2ZGuzh1F2uueW9nEaJ9DDVrUfPZihIj2p3SCT2U+mQLWFjzTTLnRnQmmz5XKRlbNpUh
         RGzQ==
X-Gm-Message-State: AOJu0YyfpdNxrrhwE+xZr4saYOTHqOFe+oIjIZpKKEYkrYRI7Bi+LKiF
	qpwB2fhk3nDTv3oF6M64McsDv9Eq7FC/vx5AtDJN3EiMFoJzGloyeQtW2B0X/j4wRZYWNgDa2t1
	OwhCszmyNtGgpXj80TJKmy3pa1F//MP+pIjY0kA==
X-Gm-Gg: ASbGncvkDhUnqHXP+TYiCwlrQHG+VcN8i14C105Uoti7SQTrqtDSfgk8ujdh8mVuIo0
	J+VPikwJRFmubAz2/72bbUghOGyqOWAQyiTtJvOrFG2USE0I5ka/yEPRheJUe6JXmOviSR6RDDC
	uyZyoD92lQ1Ch//v5zn3lxFEMlMw==
X-Google-Smtp-Source: AGHT+IETJaVTDQLNMVfByyuLRnMmoXEt4WubYCa/2+7wMvBtLXiPhWM6CbqPgttR9ONpKK7sPFSqMntNvF/kb2Rkv2c=
X-Received: by 2002:a17:906:4fcc:b0:abf:7964:f9e5 with SMTP id
 a640c23a62f3a-ac2530558b0mr302264266b.56.1741341983985; Fri, 07 Mar 2025
 02:06:23 -0800 (PST)
MIME-Version: 1.0
References: <181E3AF09E1F8B4D.4788@lists.openembedded.org> <9081184e-c6be-4151-a658-2613ce0d2eb6@gmail.com>
 <CAHUKmYb001Y2tzbOd2Ew+Yy5q--Vhwv_Mt41afoQZboE+o6kYw@mail.gmail.com> <b0a50e60-3f5b-4b64-b6cd-0f8cf958ce0e@gmail.com>
In-Reply-To: <b0a50e60-3f5b-4b64-b6cd-0f8cf958ce0e@gmail.com>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Fri, 7 Mar 2025 11:06:12 +0100
X-Gm-Features: AQ5f1JrrFp4s111RO7SWrS6HuQ7avrvLHrNsG3sG2-FI4tKaweXLggCsqLLNwec
Message-ID: <CAHUKmYaikWGctirhH2MGi8CQMjekZvXnRShXXhjU8AHpOQEMsw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] uutils-coreutils: remove TMPDIR from build output
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000637b34062fbdc68a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Mar 2025 10:06:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115782

--000000000000637b34062fbdc68a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I vote for merging this patch. Maybe with a comment pointing to
build-rust-ccld.

=C3=89tienne

On Thu, Mar 6, 2025 at 5:40=E2=80=AFPM Gyorgy Sarvari <skandigraun@gmail.co=
m> wrote:

> I haven't heard back anything, but based on my understanding the reason
> seems to be the wrapper script, created by cargo_common class, which
> includes config for both host and target.
>
> $UNPACKDIR/cargo_home/config.toml has the following:
> [target.x86_64-unknown-linux-gnu]
> linker =3D "${WORKDIR}/wrapper/build-rust-ccld"
>
> And in turn build-rust-ccld script passes all the the BUILD_LDFLAGS,
> including the rpath ones to gcc, and it invokes it directly a few lines
> later.
>
> I think you would see the same issue on Ubuntu if you would pass similar
> rpath arguments via RUSTFLAGS. E.g. if I do
>
> export RUSTFLAGS=3D"-C link-args=3D-Wl,-rpath,EASY_GREP"
>
> (which is kinda comparable in a very simplified way to what's going on
> in the script, in my understanding), then build coreutils on my machine
> (without Yocto, just my OS), I see the following:
>
> [meeee@desktop release]$ strings coreutils | grep EASY
> EASY_GREP
>
>
> On 06.03.25 16:59, Etienne Cordonnier wrote:
> > Hi Gyorgy,
> > it is nice that you found the root-cause. I had debugged this as part
> > of https://github.com/uutils/coreutils/issues/6833 , but had not found
> > why the yocto build had this issue and not the normal ubuntu build of
> > uutils-coreutils.
> > Have you received some feedback regarding this patch?
> >
> > =C3=89tienne
> >
> > On Sun, Jan 26, 2025 at 12:37=E2=80=AFPM Gyorgy Sarvari via
> > lists.openembedded.org <
> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.openembedded.=
org&d=3DDwIDaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3Dr_TOp8nVaCCSw19cijpXVbcjRvFVX1AYu1o=
LPSQzp02bVYipc0uH-2PY8vQ3v3Ju&s=3DOYWpHglwHPZhxYQ4FI7np0IioiBch7cCs5Q_naf7N=
GQ&e=3D
> >
> > <skandigraun=3Dgmail.com@lists.openembedded.org> wrote:
> >
> >     > -ERROR_QA:remove =3D "buildpaths"
> >     > -WARN_QA:append =3D " buildpaths"
> >     > +BUILD_LDFLAGS:remove:class-target =3D "
> >     -Wl,-rpath,${STAGING_LIBDIR_NATIVE}  \
> >     > +
> >     -Wl,-rpath,${STAGING_BASE_LIBDIR_NATIVE} "
> >     >
> >     If this patch isn't shot down and you are trying to build this,
> >     there is a
> >     chance that it will fail: that's because BUILD_LDFLAGS is excluded
> >     from
> >     base config checksum, so your sscache might conflict with the actua=
l
> >     recipe state.
> >
> >     If you want, can send a v2, including a PR-bump, or something
> >     along the
> >     lines.
> >
> >     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >     Links: You receive all messages sent to this group.
> >     View/Reply Online (#115101):
> >
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Ddevel_message_115101&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0=
hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&=
m=3DYru-Hz_1VrJInO_CPayuPmmjTpIq3jyiRHa5Rz7x9MqHysQQnpBZ6NRR143MBmi1&s=3D1K=
kFM14R2UQ7JO-6EseQURf5y34LFqkZw0utLRAXoTk&e=3D
> >     <
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Ddevel_message_115101&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0=
hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&=
m=3DYru-Hz_1VrJInO_CPayuPmmjTpIq3jyiRHa5Rz7x9MqHysQQnpBZ6NRR143MBmi1&s=3D1K=
kFM14R2UQ7JO-6EseQURf5y34LFqkZw0utLRAXoTk&e=3D
> >
> >
> >     Mute This Topic:
> >
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_110820444_7048771&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DYru-Hz_1VrJIn=
O_CPayuPmmjTpIq3jyiRHa5Rz7x9MqHysQQnpBZ6NRR143MBmi1&s=3DYitLjZ8Dz37qUS8nauv=
E0C8CELqvGUPDhZo4LQ_5PzQ&e=3D
> >     <
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_110820444_7048771&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DYru-Hz_1VrJIn=
O_CPayuPmmjTpIq3jyiRHa5Rz7x9MqHysQQnpBZ6NRR143MBmi1&s=3DYitLjZ8Dz37qUS8nauv=
E0C8CELqvGUPDhZo4LQ_5PzQ&e=3D
> >
> >
> >     Group Owner: openembedded-devel+owner@lists.openembedded.org
> >     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
> >     Unsubscribe:
> >
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Ddevel_unsub&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHv=
abgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DYru-H=
z_1VrJInO_CPayuPmmjTpIq3jyiRHa5Rz7x9MqHysQQnpBZ6NRR143MBmi1&s=3DKewRVjyJaNI=
2vMrB_GXcyi4smxqyuSViorm5-wvLgXQ&e=3D
> >     <
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Ddevel_unsub&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHv=
abgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DYru-H=
z_1VrJInO_CPayuPmmjTpIq3jyiRHa5Rz7x9MqHysQQnpBZ6NRR143MBmi1&s=3DKewRVjyJaNI=
2vMrB_GXcyi4smxqyuSViorm5-wvLgXQ&e=3D
> >
> >     [ecordonnier@snap.com]
> >     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000637b34062fbdc68a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I vote for merging this patch. Maybe with a comment pointi=
ng to build-rust-ccld.<div><br></div><div>=C3=89tienne</div></div><br><div =
class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, Mar 6, 2025 at 5:40=E2=80=AFPM Gyorgy Sarvari &lt;<a href=3D=
"mailto:skandigraun@gmail.com">skandigraun@gmail.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">I haven&#39;t heard bac=
k anything, but based on my understanding the reason<br>
seems to be the wrapper script, created by cargo_common class, which<br>
includes config for both host and target.<br>
<br>
$UNPACKDIR/cargo_home/config.toml has the following:<br>
[target.x86_64-unknown-linux-gnu]<br>
linker =3D &quot;${WORKDIR}/wrapper/build-rust-ccld&quot;<br>
<br>
And in turn build-rust-ccld script passes all the the BUILD_LDFLAGS,<br>
including the rpath ones to gcc, and it invokes it directly a few lines<br>
later.<br>
<br>
I think you would see the same issue on Ubuntu if you would pass similar<br=
>
rpath arguments via RUSTFLAGS. E.g. if I do<br>
<br>
export RUSTFLAGS=3D&quot;-C link-args=3D-Wl,-rpath,EASY_GREP&quot;<br>
<br>
(which is kinda comparable in a very simplified way to what&#39;s going on<=
br>
in the script, in my understanding), then build coreutils on my machine<br>
(without Yocto, just my OS), I see the following:<br>
<br>
[meeee@desktop release]$ strings coreutils | grep EASY<br>
EASY_GREP<br>
<br>
<br>
On 06.03.25 16:59, Etienne Cordonnier wrote:<br>
&gt; Hi Gyorgy,<br>
&gt; it is nice that you found the root-cause. I had debugged this as part<=
br>
&gt; of=C2=A0<a href=3D"https://github.com/uutils/coreutils/issues/6833" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/uutils/coreutils/issu=
es/6833</a> , but had not found<br>
&gt; why the yocto build had this issue and not the normal ubuntu build of<=
br>
&gt; uutils-coreutils.<br>
&gt; Have you received some feedback regarding this patch?<br>
&gt;<br>
&gt; =C3=89tienne<br>
&gt;<br>
&gt; On Sun, Jan 26, 2025 at 12:37=E2=80=AFPM Gyorgy Sarvari via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a> &lt;<a href=3D"https://urldefense.proof=
point.com/v2/url?u=3Dhttp-3A__lists.openembedded.org&amp;d=3DDwIDaQ&amp;c=
=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9=
TsRih1DULJTKUkSGa66m67E&amp;m=3Dr_TOp8nVaCCSw19cijpXVbcjRvFVX1AYu1oLPSQzp02=
bVYipc0uH-2PY8vQ3v3Ju&amp;s=3DOYWpHglwHPZhxYQ4FI7np0IioiBch7cCs5Q_naf7NGQ&a=
mp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint=
.com/v2/url?u=3Dhttp-3A__lists.openembedded.org&amp;d=3DDwIDaQ&amp;c=3DncDT=
mphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1D=
ULJTKUkSGa66m67E&amp;m=3Dr_TOp8nVaCCSw19cijpXVbcjRvFVX1AYu1oLPSQzp02bVYipc0=
uH-2PY8vQ3v3Ju&amp;s=3DOYWpHglwHPZhxYQ4FI7np0IioiBch7cCs5Q_naf7NGQ&amp;e=3D=
</a> &gt;<br>
&gt; &lt;skandigraun=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" =
target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -ERROR_QA:remove =3D &quot;buildpaths&quot;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -WARN_QA:append =3D &quot; buildpaths&quot;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +BUILD_LDFLAGS:remove:class-target =3D &quot;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0-Wl,-rpath,${STAGING_LIBDIR_NATIVE}=C2=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Wl,-rpath,${STAGING_BASE_LIBDIR_NATIVE} &quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0If this patch isn&#39;t shot down and you are tryin=
g to build this,<br>
&gt;=C2=A0 =C2=A0 =C2=A0there is a<br>
&gt;=C2=A0 =C2=A0 =C2=A0chance that it will fail: that&#39;s because BUILD_=
LDFLAGS is excluded<br>
&gt;=C2=A0 =C2=A0 =C2=A0from<br>
&gt;=C2=A0 =C2=A0 =C2=A0base config checksum, so your sscache might conflic=
t with the actual<br>
&gt;=C2=A0 =C2=A0 =C2=A0recipe state.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0If you want, can send a v2, including a PR-bump, or=
 something<br>
&gt;=C2=A0 =C2=A0 =C2=A0along the<br>
&gt;=C2=A0 =C2=A0 =C2=A0lines.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;=C2=A0 =C2=A0 =C2=A0Links: You receive all messages sent to this group.=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0View/Reply Online (#115101):<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://urldefense.proofpoint.com/v2/url=
?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Ddevel_message_115101=
&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=
=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DYru-Hz_1VrJInO_CPayu=
PmmjTpIq3jyiRHa5Rz7x9MqHysQQnpBZ6NRR143MBmi1&amp;s=3D1KkFM14R2UQ7JO-6EseQUR=
f5y34LFqkZw0utLRAXoTk&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https:=
//urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_o=
penembedded-2Ddevel_message_115101&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0=
hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m=
67E&amp;m=3DYru-Hz_1VrJInO_CPayuPmmjTpIq3jyiRHa5Rz7x9MqHysQQnpBZ6NRR143MBmi=
1&amp;s=3D1KkFM14R2UQ7JO-6EseQURf5y34LFqkZw0utLRAXoTk&amp;e=3D</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.proofpoint.com/v2=
/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Ddevel_message_11=
5101&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp=
;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DYru-Hz_1VrJInO_CPa=
yuPmmjTpIq3jyiRHa5Rz7x9MqHysQQnpBZ6NRR143MBmi1&amp;s=3D1KkFM14R2UQ7JO-6EseQ=
URf5y34LFqkZw0utLRAXoTk&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">http=
s://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g=
_openembedded-2Ddevel_message_115101&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDP=
h0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa6=
6m67E&amp;m=3DYru-Hz_1VrJInO_CPayuPmmjTpIq3jyiRHa5Rz7x9MqHysQQnpBZ6NRR143MB=
mi1&amp;s=3D1KkFM14R2UQ7JO-6EseQURf5y34LFqkZw0utLRAXoTk&amp;e=3D</a>&gt;<br=
>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Mute This Topic:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://urldefense.proofpoint.com/v2/url=
?u=3Dhttps-3A__lists.openembedded.org_mt_110820444_7048771&amp;d=3DDwIFaQ&a=
mp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx=
_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DYru-Hz_1VrJInO_CPayuPmmjTpIq3jyiRHa5Rz7=
x9MqHysQQnpBZ6NRR143MBmi1&amp;s=3DYitLjZ8Dz37qUS8nauvE0C8CELqvGUPDhZo4LQ_5P=
zQ&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofp=
oint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_110820444_7048771&a=
mp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DA=
hkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DYru-Hz_1VrJInO_CPayuPmmj=
TpIq3jyiRHa5Rz7x9MqHysQQnpBZ6NRR143MBmi1&amp;s=3DYitLjZ8Dz37qUS8nauvE0C8CEL=
qvGUPDhZo4LQ_5PzQ&amp;e=3D</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.proofpoint.com/v2=
/url?u=3Dhttps-3A__lists.openembedded.org_mt_110820444_7048771&amp;d=3DDwIF=
aQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIG=
RfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DYru-Hz_1VrJInO_CPayuPmmjTpIq3jyiRHa=
5Rz7x9MqHysQQnpBZ6NRR143MBmi1&amp;s=3DYitLjZ8Dz37qUS8nauvE0C8CELqvGUPDhZo4L=
Q_5PzQ&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.pr=
oofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_110820444_70487=
71&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=
=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DYru-Hz_1VrJInO_CPayu=
PmmjTpIq3jyiRHa5Rz7x9MqHysQQnpBZ6NRR143MBmi1&amp;s=3DYitLjZ8Dz37qUS8nauvE0C=
8CELqvGUPDhZo4LQ_5PzQ&amp;e=3D</a>&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Group Owner: <a href=3D"mailto:openembedded-devel%2=
Bowner@lists.openembedded.org" target=3D"_blank">openembedded-devel+owner@l=
ists.openembedded.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:openembedded-devel%252=
Bowner@lists.openembedded.org" target=3D"_blank">openembedded-devel%2Bowner=
@lists.openembedded.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Unsubscribe:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://urldefense.proofpoint.com/v2/url=
?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Ddevel_unsub&amp;d=3D=
DwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DYru-Hz_1VrJInO_CPayuPmmjTpIq3jy=
iRHa5Rz7x9MqHysQQnpBZ6NRR143MBmi1&amp;s=3DKewRVjyJaNI2vMrB_GXcyi4smxqyuSVio=
rm5-wvLgXQ&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefens=
e.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded=
-2Ddevel_unsub&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2ep=
ckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DYru-Hz_1=
VrJInO_CPayuPmmjTpIq3jyiRHa5Rz7x9MqHysQQnpBZ6NRR143MBmi1&amp;s=3DKewRVjyJaN=
I2vMrB_GXcyi4smxqyuSViorm5-wvLgXQ&amp;e=3D</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.proofpoint.com/v2=
/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Ddevel_unsub&amp;=
d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkb=
NonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DYru-Hz_1VrJInO_CPayuPmmjTpI=
q3jyiRHa5Rz7x9MqHysQQnpBZ6NRR143MBmi1&amp;s=3DKewRVjyJaNI2vMrB_GXcyi4smxqyu=
SViorm5-wvLgXQ&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urlde=
fense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembe=
dded-2Ddevel_unsub&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkIC=
C2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DYru-=
Hz_1VrJInO_CPayuPmmjTpIq3jyiRHa5Rz7x9MqHysQQnpBZ6NRR143MBmi1&amp;s=3DKewRVj=
yJaNI2vMrB_GXcyi4smxqyuSViorm5-wvLgXQ&amp;e=3D</a>&gt;=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0[<a href=3D"mailto:ecordonnier@snap.com" target=3D"=
_blank">ecordonnier@snap.com</a>]<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--000000000000637b34062fbdc68a--

