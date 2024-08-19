Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D1EAC3DA4A
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 15:36:28 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web10.213563.1724081780195231078
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Aug 2024 08:36:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k4dm9Aby;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5d5c324267aso2633297eaf.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Aug 2024 08:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724081779; x=1724686579; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ew4XnmyitvlxscbulTiCQ7Nc49tzd3PBRApb/WJjJVQ=;
        b=k4dm9Abyy7BILdG568fbpSIiNPPdjTtJKzpIxFNKBTgUtzA9bvGr3tFIPJYrGCU5EZ
         h75P0qY1vck86B/Xppd1wsmNniMI0re5fVhpOo0Xt+psMdKtyDeSe6GcCIHNzbdxMELx
         3UMH1h/ujo92KcRZ1yDuRYSIvI3rcRvx+F+YK4XkkWE4sQZTJ0qy7tE8QwXFg3DV3JOg
         pEJ59E4h5Lw4yAZ/llKX6VYvlNnw7MKNLmKpuQlnSwZ8+ILfNk7iA4L0XLiCdUiOzzfO
         AXZ48fcsv2QuAliYWLV4kh2CEeLMxKfE78ZredPog+TSVTrjuYZ31bqhxh6XYeVUfCtR
         xnMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724081779; x=1724686579;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ew4XnmyitvlxscbulTiCQ7Nc49tzd3PBRApb/WJjJVQ=;
        b=R0/e74PkKiEow7j6xRhFQJQdhytnc0jx/9Q6jWjDMW3T0EsWeFgH0hwqxcZpc6RsV8
         yBhI3l9805bQaSfb/FGD/6dBpFv2oStxf6Ukcd2ZXyAUchSlr3jsLhvSA+YvkCPzWVoT
         rmATj3fwUocYw2HlR8w5LbJxSdO7M9HahqgJbG5odX0Yz3/d4IkBUKQFkZzFDJhy3TO5
         gjWlVqxO40d0drvvIvfn+yQTHkTkNKT2N5DPxyx68bTTQKy85aEqxhUKFYor3d9hp4x0
         RK90gbvqKhV+l2NHxH340Fuj8fBFuh/8KgbWB/KaD+t8ClM8jRNa9gRss/9RavzM6G+9
         BlHA==
X-Gm-Message-State: AOJu0YyLYgUP/QG2cWJNhXKz9rdMBNIDlQk4T88udhwRE1GjnceuciNy
	3OoPUK/6Q1+iXJIMSglRoYY/4zix0ICIpUHjRqK22oxaYiVzdT4akQk65jR7mo7gx7LSrDR7uUY
	k8333H3NiKbnaKmkDQ5aeJav7R+YwhA==
X-Google-Smtp-Source: AGHT+IEnzJmPxhgf0Y5MZfgnea9BDSOo8rllA+0d8wvR2WDCcMoXp/Vbfy2u6psKbFrzLuDc7wx4AP2TqZanM9mGDNg=
X-Received: by 2002:a05:6820:1c85:b0:5c9:d9db:6a51 with SMTP id
 006d021491bc7-5da97d412cbmr13595124eaf.0.1724081779485; Mon, 19 Aug 2024
 08:36:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240818225620.2226473-1-raj.khem@gmail.com> <20240818225620.2226473-2-raj.khem@gmail.com>
 <DB5PR02MB10213E8A744BD7731C1DD7591EF8C2@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB10213E8A744BD7731C1DD7591EF8C2@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Aug 2024 08:36:08 -0700
Message-ID: <CAMKF1soBMmrqeX5PWqSoAv_b09Wn7=HRapKu9BfHzs0vzd+nUA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 2/5] fwknop: Specify target
 locations of gpg and wget
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000007b55606200b12ec"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Aug 2024 15:36:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111852

--00000000000007b55606200b12ec
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 8:33=E2=80=AFAM Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> > -----Original Message-----
> > From: openembedded-devel@lists.openembedded.org <
> openembedded-devel@lists.openembedded.org> On Behalf Of Khem Raj
> > Sent: den 19 augusti 2024 00:56
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Khem Raj <raj.khem@gmail.com>
> > Subject: [oe] [meta-networking][PATCH 2/5] fwknop: Specify target
> locations of gpg and wget
> >
> > This fixes emitting buildpaths into binary and also
> > fixes the issue where these tools wont exist on
> > the paths they were found on build machine
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta-networking/recipes-support/fwknop/fwknop_2.6.11.bb | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta-networking/recipes-support/fwknop/fwknop_2.6.11.bb
> b/meta-networking/recipes-support/fwknop/fwknop_2.6.11.bb
> > index c9f9596eb4..0e7998b6dc 100644
> > --- a/meta-networking/recipes-support/fwknop/fwknop_2.6.11.bb
> > +++ b/meta-networking/recipes-support/fwknop/fwknop_2.6.11.bb
> > @@ -12,7 +12,9 @@ SRC_URI[sha256sum] =3D
> "a4ec7c22dd90dd684f9f7b96d3a901c4131ec8c7a3b9db26d0428513f6
> >
> >  DEPENDS =3D "libpcap gpgme"
> >
> > -EXTRA_OECONF =3D " --with-iptables=3D${sbindir}/iptables"
> > +EXTRA_OECONF =3D "--with-iptables=3D${sbindir}/iptables \
> > +                             --with-gpg=3D${bindir}/gpg \
> > +                             --with-wget=3D${base_bindir}/wget"
>
> Do you happen to have tabs configured to be four spaces wide?
> Please use spaces instead for alignment since the above looks
> weird with 8-character tabs.


It was a different editor than usual thanks for noting


>
> >
> >  do_configure:prepend () {
> >       install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess
> ${S}/config
>
> //Peter
>
>

--00000000000007b55606200b12ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Aug 19, 2024 at 8:33=E2=80=AFAM Peter Kjellerstedt =
&lt;<a href=3D"mailto:peter.kjellerstedt@axis.com">peter.kjellerstedt@axis.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">&gt; -----Origin=
al Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-devel@lists.openembedded.org" tar=
get=3D"_blank">openembedded-devel@lists.openembedded.org</a> &lt;<a href=3D=
"mailto:openembedded-devel@lists.openembedded.org" target=3D"_blank">openem=
bedded-devel@lists.openembedded.org</a>&gt; On Behalf Of Khem Raj<br>
&gt; Sent: den 19 augusti 2024 00:56<br>
&gt; To: <a href=3D"mailto:openembedded-devel@lists.openembedded.org" targe=
t=3D"_blank">openembedded-devel@lists.openembedded.org</a><br>
&gt; Cc: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blan=
k">raj.khem@gmail.com</a>&gt;<br>
&gt; Subject: [oe] [meta-networking][PATCH 2/5] fwknop: Specify target loca=
tions of gpg and wget<br>
&gt; <br>
&gt; This fixes emitting buildpaths into binary and also<br>
&gt; fixes the issue where these tools wont exist on<br>
&gt; the paths they were found on build machine<br>
&gt; <br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-networking/recipes-support/fwknop/<a href=3D"http://fwknop_=
2.6.11.bb" rel=3D"noreferrer" target=3D"_blank">fwknop_2.6.11.bb</a> | 4 ++=
+-<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta-networking/recipes-support/fwknop/<a href=3D"http://=
fwknop_2.6.11.bb" rel=3D"noreferrer" target=3D"_blank">fwknop_2.6.11.bb</a>=
 b/meta-networking/recipes-support/fwknop/<a href=3D"http://fwknop_2.6.11.b=
b" rel=3D"noreferrer" target=3D"_blank">fwknop_2.6.11.bb</a><br>
&gt; index c9f9596eb4..0e7998b6dc 100644<br>
&gt; --- a/meta-networking/recipes-support/fwknop/<a href=3D"http://fwknop_=
2.6.11.bb" rel=3D"noreferrer" target=3D"_blank">fwknop_2.6.11.bb</a><br>
&gt; +++ b/meta-networking/recipes-support/fwknop/<a href=3D"http://fwknop_=
2.6.11.bb" rel=3D"noreferrer" target=3D"_blank">fwknop_2.6.11.bb</a><br>
&gt; @@ -12,7 +12,9 @@ SRC_URI[sha256sum] =3D &quot;a4ec7c22dd90dd684f9f7b9=
6d3a901c4131ec8c7a3b9db26d0428513f6<br>
&gt; <br>
&gt;=C2=A0 DEPENDS =3D &quot;libpcap gpgme&quot;<br>
&gt; <br>
&gt; -EXTRA_OECONF =3D &quot; --with-iptables=3D${sbindir}/iptables&quot;<b=
r>
&gt; +EXTRA_OECONF =3D &quot;--with-iptables=3D${sbindir}/iptables \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-gpg=3D${bindir}/gpg \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-wget=3D${base_bindir}/wget&quot;<=
br>
<br>
Do you happen to have tabs configured to be four spaces wide?<br>
Please use spaces instead for alignment since the above looks <br>
weird with 8-character tabs.</blockquote><div dir=3D"auto"><br></div><div d=
ir=3D"auto">It was a different editor than usual thanks for noting</div><di=
v dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
&gt; <br>
&gt;=C2=A0 do_configure:prepend () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 ${STAGING_DATADIR_NATIVE}/gn=
u-config/config.guess ${S}/config<br>
<br>
//Peter<br>
<br>
</blockquote></div></div>

--00000000000007b55606200b12ec--

