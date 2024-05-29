Return-Path: <abhilash.kollam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A62B9C27C43
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 09:21:38 +0000 (UTC)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
 by mx.groups.io with SMTP id smtpd.web11.9457.1716974493363579537
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 May 2024 02:21:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SLB/jVLI;
 spf=pass (domain: gmail.com, ip: 209.85.221.179, mailfrom: abhilash.kollam@gmail.com)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-4e77620cf38so617938e0c.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 May 2024 02:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716974492; x=1717579292; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ruezImBbQn/wnzsBGrteAI9+aidh++XiZEIH+n2pvV8=;
        b=SLB/jVLIKUIB9+hX3LO9df/Dv9UNzwOF0EYWNn+FJv3lgS8bja9tmsKgOy6rK9IijH
         kWHMe/A1eKvWlGgsR7rs4ZWeJRWvT/MjCWnFiioZagBn03BK80QeQ9zSWpl/Up8KGjfY
         ydloyS8cd827wdUQZkpre1FtZgDCsaPaLP5uzgTr4u6uW7Lad6Q14vPKxI2RdHKojuPl
         WQWZVZ8KThynEiDEEUIK+nVE/bHJGlGiKzdosopfJIKtO0JbMYJU6Dx0KR6O7psm1ZMW
         oEX8zh023PBRcHTFDNDtaVdWBXPR/h/4YWOAT0meoG6JjPLkbMzDfbEuP35V2bBzGzK2
         9s/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716974492; x=1717579292;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ruezImBbQn/wnzsBGrteAI9+aidh++XiZEIH+n2pvV8=;
        b=vbBwOg9YUUIQhPseLyZTG4/0XTyck+yy+qT5DAVeVvEkoJBpP1q5bu5GICrt0n0p7j
         5nJziPmvJF/SxRAp/XMzlQxCxixZx6YZReJjRMetHCbg6ps2x+Ev3/3JeoAd+0Jd7BTS
         e/v39B3yVCacl13pKxRri4EESRlx3ymguH2SGFntqpFbqSIy+uQYu9OGKaZfbNaDHEZL
         Tecq2G9e/N25csS40FvXB3A9pp2Ax8T7N1xLrXW+YRFn8FGOYWPiQDlSfbJVpYUr0ZOJ
         iW2yWW+xzZHts7gZY6EiuL53uJ0/4rwDvOpAaWFjp45JhYjDFnGfZo1sKEE4nawNuc2X
         wSmA==
X-Gm-Message-State: AOJu0YyiiKXSrzj8IqZ7bBxJ3IV8bXP0/6p+Ie5Bb1jTj97gM0YUALYc
	kDtz/X2OgGNPWxPtWa7Zi4uODCX1awV/87mRkcTufAcbrdD8QoCE49iavACHXJifR38ueAH02Nv
	yBe9LPOtbGSbTeYVxz4QEmlcgEDk=
X-Google-Smtp-Source: AGHT+IESj02qimgJwdXd+21ROTucFlNgqp7WcWJZyqOG814CIjmwktRojRv6oE9kAM43RimxjMA5+YehpkBrW7gHf2s=
X-Received: by 2002:a05:6122:200d:b0:4d4:ef9:71b0 with SMTP id
 71dfb90a1353d-4e4f0280326mr14325227e0c.7.1716974492234; Wed, 29 May 2024
 02:21:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240515052002.3843823-1-abhilash.kollam@gmail.com> <d0f2806d27a4cac32d0760c0e1289daf0261c687.camel@intel.com>
In-Reply-To: <d0f2806d27a4cac32d0760c0e1289daf0261c687.camel@intel.com>
From: Abhilash Kollam <abhilash.kollam@gmail.com>
Date: Wed, 29 May 2024 14:51:21 +0530
Message-ID: <CA+ST34QkcG3NrRT3LGFswheVnoMX5FBpnccUxRtEcWu1k+NpYA@mail.gmail.com>
Subject: Re: [oe] [PATCH] opentelemetry-cpp: add opentelemtry recipe
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b2ba4906199446f2"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 May 2024 09:21:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110610

--000000000000b2ba4906199446f2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Done.

On Wed, May 15, 2024 at 1:34=E2=80=AFPM Mittal, Anuj <anuj.mittal@intel.com=
> wrote:

> On Wed, 2024-05-15 at 00:20 -0500, Abhilash Raju wrote:
> > An Observability framework to create and manage telemetry data such
> > as
> > traces, metrics, and logs
> >
> > Signed-off-by: Abhilash Raju <abhilash.kollam@gmail.com>
> > ---
> >  .../opentelemetry/opentelemetry-cpp_1.15.0.bb   | 17
> > +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >  create mode 100644 meta-oe/recipes-
> > support/opentelemetry/opentelemetry-cpp_1.15.0.bb
> >
> > diff --git a/meta-oe/recipes-support/opentelemetry/opentelemetry-
> > cpp_1.15.0.bb b/meta-oe/recipes-support/opentelemetry/opentelemetry-
> > cpp_1.15.0.bb
> > new file mode 100644
> > index 000000000..85df5be82
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/opentelemetry/opentelemetry-
> > cpp_1.15.0.bb
> > @@ -0,0 +1,17 @@
> > +SUMMARY =3D "Open Telemetry Library"
> > +DESCRIPTION =3D "An Observability framework to create and manage
> > telemetry data \
> > +such as traces, metrics, and logs."
> > +HOMEPAGE =3D "https://github.com/open-telemetry/opentelemetry-cpp"
> > +SECTION =3D "libs"
> > +LICENSE =3D "Apache-2.0"
> > +LIC_FILES_CHKSUM =3D
> > "file://${S}/LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4327"
>
> ${S} shouldn't be needed here.
>
> > +
> > +DEPENDS =3D "nlohmann-json"
> > +
> > +SRC_URI =3D
> > "https://github.com/open-telemetry/opentelemetry-cpp/archive/refs/tag
> > s/v${PV}.tar.gz"
> > +SRC_URI[sha256sum] =3D
> > "69b0fef380658e15be9d817bfcb32e3f5de96da652bcdce77b4e750ed8beddee"
> > +
> > +S =3D "${WORKDIR}/opentelemetry-cpp-${PV}"
>
> This is default so shouldn't be needed.
>
> https://git.yoctoproject.org/poky/tree/meta/conf/bitbake.conf#n411
>

--000000000000b2ba4906199446f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Done.=C2=A0<br></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Wed, May 15, 2024 at 1:34=E2=80=AFPM Mit=
tal, Anuj &lt;<a href=3D"mailto:anuj.mittal@intel.com">anuj.mittal@intel.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On Wed, 2024-05-15 at 00:20 -0500, Abhilash Raju wrote:<br>
&gt; An Observability framework to create and manage telemetry data such<br=
>
&gt; as<br>
&gt; traces, metrics, and logs<br>
&gt; <br>
&gt; Signed-off-by: Abhilash Raju &lt;<a href=3D"mailto:abhilash.kollam@gma=
il.com" target=3D"_blank">abhilash.kollam@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0.../opentelemetry/<a href=3D"http://opentelemetry-cpp_1.15.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">opentelemetry-cpp_1.15.0.bb</a>=C2=A0=
=C2=A0 | 17<br>
&gt; +++++++++++++++++<br>
&gt; =C2=A01 file changed, 17 insertions(+)<br>
&gt; =C2=A0create mode 100644 meta-oe/recipes-<br>
&gt; support/opentelemetry/<a href=3D"http://opentelemetry-cpp_1.15.0.bb" r=
el=3D"noreferrer" target=3D"_blank">opentelemetry-cpp_1.15.0.bb</a><br>
&gt; <br>
&gt; diff --git a/meta-oe/recipes-support/opentelemetry/opentelemetry-<br>
&gt; <a href=3D"http://cpp_1.15.0.bb" rel=3D"noreferrer" target=3D"_blank">=
cpp_1.15.0.bb</a> b/meta-oe/recipes-support/opentelemetry/opentelemetry-<br=
>
&gt; <a href=3D"http://cpp_1.15.0.bb" rel=3D"noreferrer" target=3D"_blank">=
cpp_1.15.0.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 000000000..85df5be82<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-support/opentelemetry/opentelemetry-<br>
&gt; <a href=3D"http://cpp_1.15.0.bb" rel=3D"noreferrer" target=3D"_blank">=
cpp_1.15.0.bb</a><br>
&gt; @@ -0,0 +1,17 @@<br>
&gt; +SUMMARY =3D &quot;Open Telemetry Library&quot;<br>
&gt; +DESCRIPTION =3D &quot;An Observability framework to create and manage=
<br>
&gt; telemetry data \<br>
&gt; +such as traces, metrics, and logs.&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://github.com/open-telemetry/opent=
elemetry-cpp" rel=3D"noreferrer" target=3D"_blank">https://github.com/open-=
telemetry/opentelemetry-cpp</a>&quot;<br>
&gt; +SECTION =3D &quot;libs&quot;<br>
&gt; +LICENSE =3D &quot;Apache-2.0&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D<br>
&gt; &quot;file://${S}/LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4327&quot;=
<br>
<br>
${S} shouldn&#39;t be needed here.<br>
<br>
&gt; +<br>
&gt; +DEPENDS =3D &quot;nlohmann-json&quot;<br>
&gt; +<br>
&gt; +SRC_URI =3D<br>
&gt; &quot;<a href=3D"https://github.com/open-telemetry/opentelemetry-cpp/a=
rchive/refs/tag" rel=3D"noreferrer" target=3D"_blank">https://github.com/op=
en-telemetry/opentelemetry-cpp/archive/refs/tag</a><br>
&gt; s/v${PV}.tar.gz&quot;<br>
&gt; +SRC_URI[sha256sum] =3D<br>
&gt; &quot;69b0fef380658e15be9d817bfcb32e3f5de96da652bcdce77b4e750ed8beddee=
&quot;<br>
&gt; +<br>
&gt; +S =3D &quot;${WORKDIR}/opentelemetry-cpp-${PV}&quot;<br>
<br>
This is default so shouldn&#39;t be needed.<br>
<br>
<a href=3D"https://git.yoctoproject.org/poky/tree/meta/conf/bitbake.conf#n4=
11" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.org/poky/=
tree/meta/conf/bitbake.conf#n411</a><br>
</blockquote></div>

--000000000000b2ba4906199446f2--

