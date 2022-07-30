Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3FA4C19F2A
	for <webhook@archiver.kernel.org>; Sat, 30 Jul 2022 21:24:46 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web09.7336.1659216284801636095
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Jul 2022 14:24:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=V1gUi6Po;
 spf=pass (domain: underview.tech, ip: 209.85.167.50,
 mailfrom: vince@underview.tech)
Received: by mail-lf1-f50.google.com with SMTP id t22so11964751lfg.1
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Jul 2022 14:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1IYb2LGH2Wt99qyq/2ENjXEuNdqVW0ahsbrAbzCiyik=;
        b=V1gUi6PoQHFp3f89Y5jtbls0twgnQea/4vq016yDaFvSgDKGTzx4o1CyfR361KkRAw
         Vfb2dzi7hAqHqO6ff6ZBk5tp1X4d/pK+Mt7cgIqidv6PoMeYr4qkY1beFCzEfvWfZFU4
         X/5lYFsWztVryrdhMjcEHGT46vmtz/hqgLAEwxaPaRDBDYEIjUeHXTcX0zr/9UtnVwyw
         jfs5qOtvYsInZqM5/lG7FXCfrRu1ZfwAAuFu3SxN5rcQkS1oO7R0FKzvplgCNhA7a/XJ
         8PiBdA2tsCuGvP+QhUmBCXTrQnRD+4de/Lh8yOWVcA4fZ/qFJNFiHqmqSeqYaZgAZTp2
         yZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1IYb2LGH2Wt99qyq/2ENjXEuNdqVW0ahsbrAbzCiyik=;
        b=lMQta3702kmvqjtsHBZruCEgckMd0S3Xw3JB2O2Vc7mr32vPZkTeEQyS+psjLDhXLq
         MhZ/QVXxwDGDHV1MrQXCepcX2GLh0jrFhUZpzh62Y2m5R9VyURvRc/iBzDF5eQWqqvz5
         1R+RB00fjVtISICMkNF35ItWbFCZHpNrhRZD8Q7bQHy4NGi7oIJlQHRt+mMMof8OnU9p
         iGRN6riGtiR2z/V0msMvLVzfiqJj5q5AgWAL0ErKSqAdZa5IW17dYYpVBu4koM8Yqy6l
         m9QM35nDgm4cpxz7dxQXJZ5Ape68lu95f8QNjYH/p6o7rI9IvIo6IKDNxtKTxg71gAx5
         N4YQ==
X-Gm-Message-State: ACgBeo2Y4nbPBfBVyf3nlDaB83a8qzxJTucR3gRw042DpG7dsilOhGgl
	U+tr1KArzgDQGQrRqxk5ZhRBBWsI6LHFFHmpHTOlDQ==
X-Google-Smtp-Source: 
 AGRyM1vbSyO8lL/9Wx14B7mYtv6AQLMbUEmH3zLAdXIWi8rWdLOo+lP7pGfzd7qWwgBSUdMbIVeEFAkRbO1nwsypTMQ=
X-Received: by 2002:a05:6512:3f11:b0:48a:3043:e7 with SMTP id
 y17-20020a0565123f1100b0048a304300e7mr3214807lfa.524.1659216282605; Sat, 30
 Jul 2022 14:24:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220730022855.50524-1-vince@underview.tech>
 <8D884F32-A736-495B-B9A0-AB06F11DE265@arm.com>
In-Reply-To: <8D884F32-A736-495B-B9A0-AB06F11DE265@arm.com>
From: Vincent Davis <vince@underview.tech>
Date: Sat, 30 Jul 2022 16:24:30 -0500
Message-ID: 
 <CAPQx_gMv2y3L519Q=+a3ckLdsVfD=QDf-X6c+AUGUYb_Ed0zaw@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH] vlc: add virtual/vlc alias
To: Ross Burton <Ross.Burton@arm.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002174ba05e50c6585"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Jul 2022 21:24:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98063

--0000000000002174ba05e50c6585
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey again Ross sorry I know I already sent this meant to hit reply all.

Meant to say for layers that contain recipes that clone different
implementations of VLC and want to allow the ability to select an
implementation. Would be nice to have PROVIDES =3D "virtual/vlc" here versu=
s
multiple different layers providing bbappend files that add the PROVIDES
variable.

Working in PR were we want to allow either upstream implementation of VLC
or raspberry pi distro implementation.

https://github.com/agherzan/meta-raspberrypi/pull/985

On Sat, Jul 30, 2022, 14:32 Ross Burton <Ross.Burton@arm.com> wrote:

> > On 30 Jul 2022, at 03:28, Vincent Davis Jr via lists.openembedded.org
> <vince=3Dunderview.tech@lists.openembedded.org> wrote:
> >
> > For layers that want to provide the ability to
> > select a version of VLC.
>
> There=E2=80=99s no need for this.
>
> If there=E2=80=99s just different versions, then have vlc_1.2.3.bb alongs=
ide
> vlc_1.0.0.bb and use PREFERRED_VERSION.
>
> If you=E2=80=99ve got a fork, then just name it vlc-foo_1.2.3.bb and use
> PREFERRED_PROVIDER.
>
> There=E2=80=99s no need to use virtual/ with PREFERRED_PROVIDER.  virtual=
/* should
> only be used when you want an abstract thing and there are many
> implementation, such as virtual/libc, which can be glibc, newlib, musl, e=
tc.
>
> Ross

--0000000000002174ba05e50c6585
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hey again Ross sorry I know I already sent this meant to =
hit reply all.<div dir=3D"auto"><br></div><div dir=3D"auto">Meant to say fo=
r layers that contain recipes that clone different implementations of VLC a=
nd want to allow the ability to select an implementation. Would be nice to =
have PROVIDES =3D &quot;virtual/vlc&quot; here versus multiple different la=
yers providing bbappend files that add the PROVIDES variable.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Working in PR were we want to allow e=
ither upstream implementation of VLC or raspberry pi distro implementation.=
</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div dir=3D"auto"><div =
dir=3D"auto" style=3D"font-size:12.8px"><a href=3D"https://github.com/agher=
zan/meta-raspberrypi/pull/985" style=3D"color:rgb(66,133,244)">https://gith=
ub.com/agherzan/meta-raspberrypi/pull/985</a></div></div></div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jul =
30, 2022, 14:32 Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.com">Ross=
.Burton@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">&gt;=
 On 30 Jul 2022, at 03:28, Vincent Davis Jr via <a href=3D"http://lists.ope=
nembedded.org" rel=3D"noreferrer noreferrer" target=3D"_blank">lists.openem=
bedded.org</a> &lt;vince=3D<a href=3D"mailto:underview.tech@lists.openembed=
ded.org" target=3D"_blank" rel=3D"noreferrer">underview.tech@lists.openembe=
dded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; For layers that want to provide the ability to<br>
&gt; select a version of VLC.<br>
<br>
There=E2=80=99s no need for this.<br>
<br>
If there=E2=80=99s just different versions, then have <a href=3D"http://vlc=
_1.2.3.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">vlc_1.2.3.bb</a>=
 alongside <a href=3D"http://vlc_1.0.0.bb" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">vlc_1.0.0.bb</a> and use PREFERRED_VERSION.<br>
<br>
If you=E2=80=99ve got a fork, then just name it <a href=3D"http://vlc-foo_1=
.2.3.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">vlc-foo_1.2.3.bb</=
a> and use PREFERRED_PROVIDER.<br>
<br>
There=E2=80=99s no need to use virtual/ with PREFERRED_PROVIDER.=C2=A0 virt=
ual/* should only be used when you want an abstract thing and there are man=
y implementation, such as virtual/libc, which can be glibc, newlib, musl, e=
tc.<br>
<br>
Ross</blockquote></div>

--0000000000002174ba05e50c6585--

