Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4187FD116F5
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 13:00:00 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20964.1764593986449990854
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Dec 2025 04:59:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ph0Xjs5m;
 spf=pass (domain: konsulko.com, ip: 209.85.222.181, mailfrom: leon.anavi@konsulko.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8b2ed01ba15so341289285a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 04:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1764593985; x=1765198785; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0TFZgjOJAUICw/kFou66h/1eUYE9aUR65GRErf242eg=;
        b=ph0Xjs5muGN8ykymK9k4TREFgI+ZFbgvKKlP2GCw4kPpRMagNUqVZiciqBBXstg42H
         a6TQUEDzIHQ0uNt++prlzbt0i9ocULLHMxwU8vNMP/qODM2aGDDh3j2V7HyHYgcXOBuq
         dMxiyjpn0fj63+Yyftmjn0cwaPs/1kmJPECbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764593985; x=1765198785;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0TFZgjOJAUICw/kFou66h/1eUYE9aUR65GRErf242eg=;
        b=DoWfUx1rq5yJ+EY/BF9YtI9oe0DoT6r5pOzigb2+m8Lqwz2lZBQlNnjqQz2CGeOdp0
         7WukrMwHoS3eECUUHh9dG22r8eVdET0D1Mqfg2p89G2b6p9bRnHljo9LzDk1D80wQkwZ
         24J56a/AmKe6LbAt4sNZuToiirxgyYpMiLYCnUTl6XjDYPaRYu8viKysd3nchSIcNTSn
         vMEKjWWrfesYhh7wVsAlTBOxQMFoQhOgOIFV9FpxdmAAOW2zmvMHpb4GxdoCiONai+pZ
         wvnSCFz1Z2d7mf8xsQPMwPcO6wrCHIHpjI4OrI5Lddrfh8TZEgP0nGtD9IjtZmkc7htu
         NrZg==
X-Gm-Message-State: AOJu0YwEgPB23i8Y1t4Q4qn91KjaGq5OxKnXcxy1DS7bf9r9D2rZ7py6
	ryjbN+U1mE4mKqNp7WZkXJ+Cx7Rpqvcl9kGHFqp99oQnmxi2qES5/rx73FZhggL/RiTmmHDyvEt
	mWqzLB1YzzbEDo2jHVR9jBGCTPTjIYvMnEptA8MlL4qmm7LvHFXwhy+4=
X-Gm-Gg: ASbGnctexeYa3HEFwF2wQ/ALP4ghxeUnXye0gjvKGrukJlk2PRmSGttni0UHekqPROR
	g3mepwO2GM4u1hYQDhNrODMD63XaUic+lsQ+BB6+Ajj4KtuI/SAUmcydls6AwrIENuU6fj07EN8
	Ju9O7XSGzGMXUauleRvt2btcBmCBptP0XYKFci9vJ6bvIfFXScjn0TpKTvRY5RhpuuPdEAMXM/Z
	U2s4ytrI5jx3fOHXnu44FQKy3wKqUmEFjSfo1dDpIR6lYakNgXjblyGb0w8UryGHRRntg==
X-Google-Smtp-Source: AGHT+IHycwb5srSb+Eb5QNxK03O3/lq7L0LTtHuQud7XnOCp6XnvOQwU1snXO0uVaLcmwRECqSEt4QlJyWt+zWncOpg=
X-Received: by 2002:a05:620a:2a04:b0:8b2:e177:eca7 with SMTP id
 af79cd13be357-8b33d482752mr4932211285a.65.1764593985206; Mon, 01 Dec 2025
 04:59:45 -0800 (PST)
MIME-Version: 1.0
References: <20251128083658.1285605-1-leon.anavi@konsulko.com> <AS1PR10MB569777F76474C5BDAB080439FDDCA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB569777F76474C5BDAB080439FDDCA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Leon Anavi <leon.anavi@konsulko.com>
Date: Mon, 1 Dec 2025 14:59:33 +0200
X-Gm-Features: AWmQ_bmoU_vIXsUgkmASziIGX5K6b_Gx-w3En7OTHT0ihsYKm8I8HLgya9qQgIk
Message-ID: <CALtQ3O0aC_OTRibw5h-WCBb=rGdTySCxd0C=gg+vDsY5zE=ARg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] colortail: Add recipe
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a94ca70644e38def"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 13:00:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122206

--000000000000a94ca70644e38def
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Fri, Nov 28, 2025 at 10:50=E2=80=AFAM Marko, Peter <Peter.Marko@siemens.=
com>
wrote:

>
>
> > -----Original Message-----
> > From: openembedded-devel@lists.openembedded.org <openembedded-
> > devel@lists.openembedded.org> On Behalf Of Leon Anavi via
> > lists.openembedded.org
> > Sent: Friday, November 28, 2025 9:37
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Leon Anavi <leon.anavi@konsulko.com>
> > Subject: [oe] [meta-oe][PATCH] colortail: Add recipe
> >
> > Colortails is like the tail command line utility but with colors.
> > Add recipe for the latest release 0.3.5:
> >
> > - Print error messages to stderr
> > - Fix memory leaks and Valgrind warnings
> > - Improve detection of file truncation due to log rotation
> > - Fix ./autogen.sh on macOS
> > - Avoid emitting excessive color sequences
> > - Output ansi reset code when the program is interrupted
> >
> > This work was sponsored by GOVCERT.LU.
> >
> > Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> > ---
> >  meta-oe/recipes-extended/colortail/colortail_0.3.5.bb | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >  create mode 100644 meta-oe/recipes-extended/colortail/
> colortail_0.3.5.bb
> >
> > diff --git a/meta-oe/recipes-extended/colortail/colortail_0.3.5.bb
> b/meta-oe/recipes-
> > extended/colortail/colortail_0.3.5.bb
> > new file mode 100644
> > index 0000000000..bf31ee9882
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/colortail/colortail_0.3.5.bb
> > @@ -0,0 +1,10 @@
> > +SUMMARY =3D "Like the tail command line utility but with colors"
> > +DESCRIPTION =3D "Colortail - like tail but with color highlighting
> configured via
> > patterns"
> > +HOMEPAGE =3D "https://github.com/joakim666/colortail"
> > +LICENSE =3D "GPL-2.0-only"
> > +LIC_FILES_CHKSUM =3D
> > "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae19f"
> > +
> > +SRC_URI =3D
> > "git://github.com/joakim666/colortail.git;branch=3Dmaster;protocol=3Dht=
tps"
>
> Please add ";tag=3D${PV}" to the SRC_URI.
>

Thank you for the code review. Following your recommendation I
added ";tag=3D${PV}" and I sent v2 of the patch.

Best regards,
Leon


>
> > +SRCREV =3D "653bbbe3292759f5fb5ae9f769f131c1a320965d"
> > +
> > +inherit autotools pkgconfig
> > --
> > 2.47.3
>
>

--000000000000a94ca70644e38def
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Peter,</div><br><div class=3D"gmail_quote gmail_qu=
ote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 28, 2025 a=
t 10:50=E2=80=AFAM Marko, Peter &lt;<a href=3D"mailto:Peter.Marko@siemens.c=
om">Peter.Marko@siemens.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><br>
<br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-devel@lists.openembedded.org" tar=
get=3D"_blank">openembedded-devel@lists.openembedded.org</a> &lt;openembedd=
ed-<br>
&gt; <a href=3D"mailto:devel@lists.openembedded.org" target=3D"_blank">deve=
l@lists.openembedded.org</a>&gt; On Behalf Of Leon Anavi via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a><br>
&gt; Sent: Friday, November 28, 2025 9:37<br>
&gt; To: <a href=3D"mailto:openembedded-devel@lists.openembedded.org" targe=
t=3D"_blank">openembedded-devel@lists.openembedded.org</a><br>
&gt; Cc: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" target=
=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
&gt; Subject: [oe] [meta-oe][PATCH] colortail: Add recipe<br>
&gt; <br>
&gt; Colortails is like the tail command line utility but with colors.<br>
&gt; Add recipe for the latest release 0.3.5:<br>
&gt; <br>
&gt; - Print error messages to stderr<br>
&gt; - Fix memory leaks and Valgrind warnings<br>
&gt; - Improve detection of file truncation due to log rotation<br>
&gt; - Fix ./autogen.sh on macOS<br>
&gt; - Avoid emitting excessive color sequences<br>
&gt; - Output ansi reset code when the program is interrupted<br>
&gt; <br>
&gt; This work was sponsored by <a href=3D"http://GOVCERT.LU" rel=3D"norefe=
rrer" target=3D"_blank">GOVCERT.LU</a>.<br>
&gt; <br>
&gt; Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.co=
m" target=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-oe/recipes-extended/colortail/<a href=3D"http://colortail_0=
.3.5.bb" rel=3D"noreferrer" target=3D"_blank">colortail_0.3.5.bb</a> | 10 +=
+++++++++<br>
&gt;=C2=A0 1 file changed, 10 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-extended/colortail/<a href=3D=
"http://colortail_0.3.5.bb" rel=3D"noreferrer" target=3D"_blank">colortail_=
0.3.5.bb</a><br>
&gt; <br>
&gt; diff --git a/meta-oe/recipes-extended/colortail/<a href=3D"http://colo=
rtail_0.3.5.bb" rel=3D"noreferrer" target=3D"_blank">colortail_0.3.5.bb</a>=
 b/meta-oe/recipes-<br>
&gt; extended/colortail/<a href=3D"http://colortail_0.3.5.bb" rel=3D"norefe=
rrer" target=3D"_blank">colortail_0.3.5.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..bf31ee9882<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-extended/colortail/<a href=3D"http://colortail_0=
.3.5.bb" rel=3D"noreferrer" target=3D"_blank">colortail_0.3.5.bb</a><br>
&gt; @@ -0,0 +1,10 @@<br>
&gt; +SUMMARY =3D &quot;Like the tail command line utility but with colors&=
quot;<br>
&gt; +DESCRIPTION =3D &quot;Colortail - like tail but with color highlighti=
ng configured via<br>
&gt; patterns&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://github.com/joakim666/colortail"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/joakim666/colortai=
l</a>&quot;<br>
&gt; +LICENSE =3D &quot;GPL-2.0-only&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D<br>
&gt; &quot;file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae19f&quot;<br>
&gt; +<br>
&gt; +SRC_URI =3D<br>
&gt; &quot;git://<a href=3D"http://github.com/joakim666/colortail.git;branc=
h=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.co=
m/joakim666/colortail.git;branch=3Dmaster;protocol=3Dhttps</a>&quot;<br>
<br>
Please add &quot;;tag=3D${PV}&quot; to the SRC_URI.<br></blockquote><div><b=
r>Thank you for the code review. Following your recommendation I added=C2=
=A0&quot;;tag=3D${PV}&quot; and I sent v2 of the patch.<br><br>Best regards=
,<br>Leon</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<br>
&gt; +SRCREV =3D &quot;653bbbe3292759f5fb5ae9f769f131c1a320965d&quot;<br>
&gt; +<br>
&gt; +inherit autotools pkgconfig<br>
&gt; --<br>
&gt; 2.47.3<br>
<br>
</blockquote></div><div><br></div><div dir=3D"ltr" class=3D"gmail_signature=
"><div dir=3D"ltr"><div></div></div></div></div>

--000000000000a94ca70644e38def--

