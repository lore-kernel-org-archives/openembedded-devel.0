Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EB26C369CA
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 15:11:51 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web11.14103.1744989106040314461
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Apr 2025 08:11:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WMr+cRNq;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-72bb97260ceso675727a34.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 08:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744989105; x=1745593905; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EwqtmBDK1N5H+gQ6c9wTh1ogkRFm341j5vXvRQeKOeI=;
        b=WMr+cRNqOi8g+hI6bWjbbCESsNs4gwRLOR/ZThgxmjnm7aA2a2fegiUcs3UyxqjORf
         5TwEqDlmDtRPetBCE0pgH1f4wGkSVRrOIPTRZbLrkZVBdqkIJGEl87H0shYXOsN0Z8qe
         JAYa7yeWlLlSIIKquJEtb+Gnrp7c9MURuo2NPvQ8dC+r2t+7oAqSpWlrA4fczMvIxb7y
         7HehkcDVT9bV2CF2Q/QDi5S88eu8ezypvZsQJgMwYK33FH5VUNslhhylMo2GLv418ygv
         N7PMGj01RKke3oLtajb8/EWCyAeh3O0OUFsTXgqW4GkjZowY+Pcd6Ik6NSGTmb+Xfg5A
         C4mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744989105; x=1745593905;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EwqtmBDK1N5H+gQ6c9wTh1ogkRFm341j5vXvRQeKOeI=;
        b=VQETQ89/ACLQ6/9D5pP2bRk+NE7ZnFdmD6gQyrI+NiBf1saxMPpaXbbBXdCyrXnHAP
         vCkB6oOd+EmumJqm5QsXLcud2zUb+Ca3KVgDWeMk21oFYrsvY0QhmK8oYgAHtfuVaeBe
         lHNH9XHr+WixsZi5k7szEaS3TsLNMuIaOBd4gqEWOLNwXXsSyRTVQFlvslKyUpTeIM3e
         Te/53t3Lu8GZ0Rl+nuSp2oB/Zoaip7ZypNbYk2RoGiV/JpEpBm4sqscSDzq2S02Zz6pr
         JSGKEeBBHOx8qDMzuO48Hcn+r8ptymh4nNnFSDvxpVuL//c6NmbbKByY8+NKP9Jx6m2J
         7d6w==
X-Forwarded-Encrypted: i=1; AJvYcCUwMNwoR7qe86AKGj6seePiS9nShL/O63k6c87v+hhJfGgi9yESQ2g9RUEeh25TgOMruHt0VXglvMOTKdzhcgqrwDM=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxcJQFFrQymOx812wVJ4vSK75GasCeNvoWjZ9Yny+VSGjOEN2NI
	OQiw8A4WHvawC4FpBbLm+FSS7gwlz/VtNAJAT4gM20orrg1g+jYaYUhmkIv8iMrqcRneegbYaWy
	rDPMNfR/MGDD7vrO0uY9HnAfy3hs=
X-Gm-Gg: ASbGncvTlIs9UMonkKs97bmpDneL+E2ctvAGYf6D4YvXsLOS5TDC4g2AZbvGRxDbSx6
	d6U06tTvuE+feNInu5zl8/jzv1GaiGCM2eiA8sanlq6fblFtOMC/+N73M/kU6YjndZ7PHPWIoSJ
	2+imlxH7gOS/Bd9/A5enSZquRxspDepAkjQjP91/ht9+OrArjdkI/dySE=
X-Google-Smtp-Source: AGHT+IH0GFxoT069QWaBS+wJ4cujAlR1ir2sKJMSD6mCWagrsUx6yD9wylNwQu3mXZOFZB/DiV6iTHSUVWx/qRgkF4w=
X-Received: by 2002:a05:6820:1621:b0:604:29f8:3cc with SMTP id
 006d021491bc7-60600569213mr1620023eaf.8.1744989104867; Fri, 18 Apr 2025
 08:11:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250418014123.3684623-1-raj.khem@gmail.com> <CA+chaQewE4WX=DXQv17=aw2etQLj4wxJ_hmtHDY0zaGFgerpBA@mail.gmail.com>
 <6af6f2ee-a84f-4c17-bb3c-3bd65aa23297@gmail.com>
In-Reply-To: <6af6f2ee-a84f-4c17-bb3c-3bd65aa23297@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Apr 2025 08:11:32 -0700
X-Gm-Features: ATxdqUGaHHDp_n8cKwfPDEIjl74vydAmjYuiQSlpZGTZc_YU37TuJagOOMYhNeY
Message-ID: <CAMKF1sowz-63uS+b_Y7h8YUPT+ZnOFaOhTMyiJ-dAAt+vBrfEA@mail.gmail.com>
Subject: Re: [oe] [meta-initramfs][PATCH] klibc.bbclass: Add spaces around assignment
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: martin.jansa@gmail.com, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000bb958d06330eefa3"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 15:11:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116969

--000000000000bb958d06330eefa3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 18, 2025 at 5:25=E2=80=AFAM Gyorgy Sarvari <skandigraun@gmail.c=
om>
wrote:

>
> On 4/18/25 13:30, Martin Jansa via lists.openembedded.org wrote:
> > On Fri, Apr 18, 2025 at 3:41=E2=80=AFAM Khem Raj via lists.openembedded=
.org
> > <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >>  meta-initramfs/classes/klibc.bbclass | 11 ++++++++---
> >>  1 file changed, 8 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/meta-initramfs/classes/klibc.bbclass
> b/meta-initramfs/classes/klibc.bbclass
> >> index ca50a3d431..935ee10c40 100644
> >> --- a/meta-initramfs/classes/klibc.bbclass
> >> +++ b/meta-initramfs/classes/klibc.bbclass
> >> @@ -9,8 +9,13 @@ CC:append:armv7ve =3D " ${@'
> -mfloat-abi=3D${TUNE_CCARGS_MFLOAT}' if (d.getVar('TUNE
> >>  CC:append:armv7a =3D " ${@' -mfloat-abi=3D${TUNE_CCARGS_MFLOAT}' if
> (d.getVar('TUNE_CCARGS_MFLOAT') !=3D '') else ''}"
> >>
> >>  # klcc uses own optimizations by default. See klcc(1) man file.
> >> -export CFLAGS=3D"${TUNE_CCARGS} ${DEBUG_PREFIX_MAP}"
> >> -export CPPFLAGS=3D"${TUNE_CCARGS}"
> >> -export LDFLAGS=3D"${TUNE_CCARGS}"
> >> +CFLAGS =3D "${TUNE_CCARGS} ${DEBUG_PREFIX_MAP}"
> >> +CFLAGS[export] =3D "1"
> >> +
> >> +CPPFLAGS =3D "${TUNE_CCARGS}"
> >> +CPPFLAGS[export] =3D "1"
> >> +
> >> +LDFLAGS=3D" ${TUNE_CCARGS}"
> >> +LDFLAGS[export] =3D "1"
> > Why the change in export syntax, is the varflag preferred now?


It=E2=80=99s fine either way. I preferred bitbakes way of doing it here for=
 not
mixing shell syntax ourside of functions

>
> Meta comment: maybe it should be preferred... It is at least a bit
> confusing that bitbake's and shell's "export" look and work very very
> similarly, but one of them complains about not having spaces, and the
> other complains about having spaces.
>

--000000000000bb958d06330eefa3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 18, 2025 at 5:25=E2=80=AFAM=
 Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com">skandigraun@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
On 4/18/25 13:30, Martin Jansa via <a href=3D"http://lists.openembedded.org=
" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br=
>
&gt; On Fri, Apr 18, 2025 at 3:41=E2=80=AFAM Khem Raj via <a href=3D"http:/=
/lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openemb=
edded.org</a><br>
&gt; &lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" tar=
get=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" =
target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meta-initramfs/classes/klibc.bbclass | 11 ++++++++---<br>
&gt;&gt;=C2=A0 1 file changed, 8 insertions(+), 3 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-initramfs/classes/klibc.bbclass b/meta-initramfs=
/classes/klibc.bbclass<br>
&gt;&gt; index ca50a3d431..935ee10c40 100644<br>
&gt;&gt; --- a/meta-initramfs/classes/klibc.bbclass<br>
&gt;&gt; +++ b/meta-initramfs/classes/klibc.bbclass<br>
&gt;&gt; @@ -9,8 +9,13 @@ CC:append:armv7ve =3D &quot; ${@&#39; -mfloat-abi=
=3D${TUNE_CCARGS_MFLOAT}&#39; if (d.getVar(&#39;TUNE<br>
&gt;&gt;=C2=A0 CC:append:armv7a =3D &quot; ${@&#39; -mfloat-abi=3D${TUNE_CC=
ARGS_MFLOAT}&#39; if (d.getVar(&#39;TUNE_CCARGS_MFLOAT&#39;) !=3D &#39;&#39=
;) else &#39;&#39;}&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 # klcc uses own optimizations by default. See klcc(1) man fi=
le.<br>
&gt;&gt; -export CFLAGS=3D&quot;${TUNE_CCARGS} ${DEBUG_PREFIX_MAP}&quot;<br=
>
&gt;&gt; -export CPPFLAGS=3D&quot;${TUNE_CCARGS}&quot;<br>
&gt;&gt; -export LDFLAGS=3D&quot;${TUNE_CCARGS}&quot;<br>
&gt;&gt; +CFLAGS =3D &quot;${TUNE_CCARGS} ${DEBUG_PREFIX_MAP}&quot;<br>
&gt;&gt; +CFLAGS[export] =3D &quot;1&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +CPPFLAGS =3D &quot;${TUNE_CCARGS}&quot;<br>
&gt;&gt; +CPPFLAGS[export] =3D &quot;1&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +LDFLAGS=3D&quot; ${TUNE_CCARGS}&quot;<br>
&gt;&gt; +LDFLAGS[export] =3D &quot;1&quot;<br>
&gt; Why the change in export syntax, is the varflag preferred now?</blockq=
uote><div dir=3D"auto"><br></div><div dir=3D"auto">It=E2=80=99s fine either=
 way. I preferred bitbakes way of doing it here for not mixing shell syntax=
 ourside of functions=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto=
"><br>
Meta comment: maybe it should be preferred... It is at least a bit<br>
confusing that bitbake&#39;s and shell&#39;s &quot;export&quot; look and wo=
rk very very<br>
similarly, but one of them complains about not having spaces, and the<br>
other complains about having spaces.<br>
</blockquote></div></div>

--000000000000bb958d06330eefa3--

