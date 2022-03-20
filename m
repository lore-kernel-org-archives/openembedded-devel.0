Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10D02C433F5
	for <webhook@archiver.kernel.org>; Sun, 20 Mar 2022 17:33:19 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.20479.1647797598043749164
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 10:33:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OYdBsNR6;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: ticotimo@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id h16so6805809wmd.0
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 10:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lCRmIRKqcmdZ047eWC++y0rWpbUypMn1VmQ+hkSI0Zw=;
        b=OYdBsNR6guXNsNgiBEyv/WSalWu9KtwzJyldGlYOnljWm/zfSQMh4Xagly8v89jHlJ
         RdhPxd6sewEOAgvMrMzwX2LBQEayiSrv0IQn43H/ASCbSFTP7enMh//W/zVfU7TcBVzs
         s4ASotE1b4jgCTjSb9wwWqpv4oYEtWJwv+76oTdcvUsbhatXFPzoPkps67IVS7ECrn4c
         YgV7OXl5eotyqK9YDWopxWXCej1NM+WLqcc/Q8lph9+pkOYRoINj6y+944E0d3rzRLKd
         fTSyMlSabIldurXxfN/bYls++ry2qZlp4fXfoOQW7TaOPU42lTu92oseBrL5IuBDWr6q
         Za2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lCRmIRKqcmdZ047eWC++y0rWpbUypMn1VmQ+hkSI0Zw=;
        b=fElWBlsvAyb3FecGyR6KhYkKnAHLzDxfUXHQl0SJX+D41aH4qcerKZGfMDFPJLR0vd
         lfaIXzWoAGWqE6VnzfmOQne3cSQKnzGlTdTrywVK2IyPe5tP5PZ5hZkCgV28D65dVd1Z
         hzNQ4fzJtVgc1Ka3ECsvgqAof+TzEdTM4kv3zWconZT5fLNK8bEq6vqOx6wCegyd21Or
         4Fl3TsIrYzX1nlvwtl6QhzZKWjls2c2NW+1tVAUZpmfa1emMoXGlfoknow17/lsMWqpR
         QtTU6zIBYYyWkgZJI2C7fs9Ed4oKEcKTJxGU+fwnUGU1oO/5Lfoo5MVHP5CrO5xjmMIG
         DAhw==
X-Gm-Message-State: AOAM530l4NZ1jJSbMODClBL+UmQfm+8NYW9A+JcVTT0qbTI/o0YMM9Jp
	olqYmeZl8vXcb3zLOkDvPenzf9pIbVLH0hBqRZ4=
X-Google-Smtp-Source: 
 ABdhPJx5vjnqVynJMFhs6+BqD2PiNao6cL5WpR0e3h046ZzDoMZwTQ3P6QObT8gBkYuDH3OqN5ESHmOSsxYDfciyieo=
X-Received: by 2002:a05:600c:500e:b0:38c:6d79:d5ac with SMTP id
 n14-20020a05600c500e00b0038c6d79d5acmr19994068wmr.42.1647797596110; Sun, 20
 Mar 2022 10:33:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220320084455.878607-1-raj.khem@gmail.com>
 <20220320084455.878607-2-raj.khem@gmail.com>
In-Reply-To: <20220320084455.878607-2-raj.khem@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sun, 20 Mar 2022 10:33:05 -0700
Message-ID: 
 <CANx9H-AG6oHrDq_yYZDY-2r-KjJHQ-RkMpiQQFFrxh0uYa9Mig@mail.gmail.com>
Subject: Re: [oe] [meta-perl][PATCH 2/2]
 io-compress-lzma-perl,io-compress-perl:
 Do not mark allarch
To: Khem Raj <raj.khem@gmail.com>
Cc: Hongxu Jia <hongxu.jia@windriver.com>,
 openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000060c44305daa9c6a8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 20 Mar 2022 17:33:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96084

--00000000000060c44305daa9c6a8
Content-Type: text/plain; charset="UTF-8"

These should also be using Debian naming: libio-compress-lzma-perl.

On Sun, Mar 20, 2022 at 1:45 AM Khem Raj <raj.khem@gmail.com> wrote:

> These recipes are using target perl install during build so they can not be
> allarch, the issue becomes evident when libdir for target the native
> build hosts do not match e.g. ppc64 where target libdir is usr/lib64
> then the do_configure starts to fail because it can not find
> Config_heavy-target.pl script which is part of tatget perl install and
> allarch recipes seems to assume libdir defaults to /usr/lib when
> accessing it.
>
> I think it can be fixed by perhaps building the missing perl files into
> perl native perhaps.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Hongxu Jia <hongxu.jia@windriver.com>
> Cc: Tim "moto-timo" Orling <ticotimo@gmail.com>
> ---
>  meta-perl/recipes-perl/libio/io-compress-lzma-perl_2.096.bb | 2 +-
>  meta-perl/recipes-perl/libio/io-compress-perl_2.096.bb      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-perl/recipes-perl/libio/io-compress-lzma-perl_2.096.bb
> b/meta-perl/recipes-perl/libio/io-compress-lzma-perl_2.096.bb
> index 9655176a86..3b8ce8d02d 100644
> --- a/meta-perl/recipes-perl/libio/io-compress-lzma-perl_2.096.bb
> +++ b/meta-perl/recipes-perl/libio/io-compress-lzma-perl_2.096.bb
> @@ -19,6 +19,6 @@ RDEPENDS:${PN} += "io-compress-perl"
>
>  S = "${WORKDIR}/IO-Compress-Lzma-${PV}"
>
> -inherit cpan allarch
> +inherit cpan
>
>  BBCLASSEXTEND = "native"
> diff --git a/meta-perl/recipes-perl/libio/io-compress-perl_2.096.bb
> b/meta-perl/recipes-perl/libio/io-compress-perl_2.096.bb
> index ccc78d0078..c00d8945b7 100644
> --- a/meta-perl/recipes-perl/libio/io-compress-perl_2.096.bb
> +++ b/meta-perl/recipes-perl/libio/io-compress-perl_2.096.bb
> @@ -19,6 +19,6 @@ RDEPENDS:${PN} += "compress-raw-zlib-perl"
>
>  S = "${WORKDIR}/IO-Compress-${PV}"
>
> -inherit cpan allarch
> +inherit cpan
>
>  BBCLASSEXTEND = "native"
> --
> 2.35.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96083):
> https://lists.openembedded.org/g/openembedded-devel/message/96083
> Mute This Topic: https://lists.openembedded.org/mt/89903797/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000060c44305daa9c6a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">These should also be using Debian naming: libio-compress-=
lzma-perl.</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Mar 20, 2022 at 1:45 AM Khem Raj &lt;<a href=3D"mai=
lto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">These recipes are using target perl install during b=
uild so they can not be<br>
allarch, the issue becomes evident when libdir for target the native<br>
build hosts do not match e.g. ppc64 where target libdir is usr/lib64<br>
then the do_configure starts to fail because it can not find<br>
Config_heavy-target.pl script which is part of tatget perl install and<br>
allarch recipes seems to assume libdir defaults to /usr/lib when<br>
accessing it.<br>
<br>
I think it can be fixed by perhaps building the missing perl files into<br>
perl native perhaps.<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
Cc: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" target=3D"_b=
lank">hongxu.jia@windriver.com</a>&gt;<br>
Cc: Tim &quot;moto-timo&quot; Orling &lt;<a href=3D"mailto:ticotimo@gmail.c=
om" target=3D"_blank">ticotimo@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-perl/recipes-perl/libio/<a href=3D"http://io-compress-lzma-perl_=
2.096.bb" rel=3D"noreferrer" target=3D"_blank">io-compress-lzma-perl_2.096.=
bb</a> | 2 +-<br>
=C2=A0meta-perl/recipes-perl/libio/<a href=3D"http://io-compress-perl_2.096=
.bb" rel=3D"noreferrer" target=3D"_blank">io-compress-perl_2.096.bb</a>=C2=
=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta-perl/recipes-perl/libio/<a href=3D"http://io-compress-lzm=
a-perl_2.096.bb" rel=3D"noreferrer" target=3D"_blank">io-compress-lzma-perl=
_2.096.bb</a> b/meta-perl/recipes-perl/libio/<a href=3D"http://io-compress-=
lzma-perl_2.096.bb" rel=3D"noreferrer" target=3D"_blank">io-compress-lzma-p=
erl_2.096.bb</a><br>
index 9655176a86..3b8ce8d02d 100644<br>
--- a/meta-perl/recipes-perl/libio/<a href=3D"http://io-compress-lzma-perl_=
2.096.bb" rel=3D"noreferrer" target=3D"_blank">io-compress-lzma-perl_2.096.=
bb</a><br>
+++ b/meta-perl/recipes-perl/libio/<a href=3D"http://io-compress-lzma-perl_=
2.096.bb" rel=3D"noreferrer" target=3D"_blank">io-compress-lzma-perl_2.096.=
bb</a><br>
@@ -19,6 +19,6 @@ RDEPENDS:${PN} +=3D &quot;io-compress-perl&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/IO-Compress-Lzma-${PV}&quot;<br>
<br>
-inherit cpan allarch<br>
+inherit cpan<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native&quot;<br>
diff --git a/meta-perl/recipes-perl/libio/<a href=3D"http://io-compress-per=
l_2.096.bb" rel=3D"noreferrer" target=3D"_blank">io-compress-perl_2.096.bb<=
/a> b/meta-perl/recipes-perl/libio/<a href=3D"http://io-compress-perl_2.096=
.bb" rel=3D"noreferrer" target=3D"_blank">io-compress-perl_2.096.bb</a><br>
index ccc78d0078..c00d8945b7 100644<br>
--- a/meta-perl/recipes-perl/libio/<a href=3D"http://io-compress-perl_2.096=
.bb" rel=3D"noreferrer" target=3D"_blank">io-compress-perl_2.096.bb</a><br>
+++ b/meta-perl/recipes-perl/libio/<a href=3D"http://io-compress-perl_2.096=
.bb" rel=3D"noreferrer" target=3D"_blank">io-compress-perl_2.096.bb</a><br>
@@ -19,6 +19,6 @@ RDEPENDS:${PN} +=3D &quot;compress-raw-zlib-perl&quot;<br=
>
<br>
=C2=A0S =3D &quot;${WORKDIR}/IO-Compress-${PV}&quot;<br>
<br>
-inherit cpan allarch<br>
+inherit cpan<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native&quot;<br>
-- <br>
2.35.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#96083): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/96083" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/96083</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89903797/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
89903797/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000060c44305daa9c6a8--

