Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EB05D11195
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 19:13:11 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2028.1764184381409230622
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Nov 2025 11:13:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=brem2Tuq;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-787e35ab178so1039027b3.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 11:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764184380; x=1764789180; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=136JUa7sbQKQmG6hnF8LAN7M03s3vGTJyYjyjZBJzrg=;
        b=brem2TuquHF0WfAdTyd+5uRfFtbW5HU+BioJaPEUv61965GY2WH16LKQ0KfEZI1uZQ
         99gwRoYr0iqqCo7Tdmp+gTa+ru6XiA67oihY0GGlMjQ5QiBWa9tYH1JAqsMXKUHf4VVM
         ut/DTRtlhWzxVTA1DreYPQVcskEyG4FLNcI23J3qET5PP82GcRLCbOWFMr44eWBldmgP
         ys2J6NwcZlDTpipmRHMgTUFFmiWNOYjnW+IF4pSA06Phtd+M2vPdmD7WR5TUJj1N3OxO
         Maq7O0Xbmz0ZQAJY5sxfOcRhi4/UKyCZkDZBCsvXTF6ZkEfqv1K8+s5hyR6ptRRImNz+
         3BXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764184380; x=1764789180;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=136JUa7sbQKQmG6hnF8LAN7M03s3vGTJyYjyjZBJzrg=;
        b=TaCZuw5m7JnH6avLgc8sC0+E6uC0k6rp428p5kXb/JNWzLGA3G6YEIPUnixO/lAG0p
         5Tw9NU5/mG7f/HKnbH2RfegGQpDFCsNiZsGLmHUqsurkKh9LllGbmMPEDNgX2zXmwee4
         07UfjDo4OtVemtNP7+H7WvF9AghOHBltz6fYiyWSmvAoABhW+G4N9aXp2dLZlQDpZQzm
         z3m8Tk3DQDajgGFFVeEX2wiFhfjIkAuinSELOmssMqxpYmN+qRV6Nfz8BFm0yQ3ucSDB
         GyCrFsVbayAHyF+2Ll6fJEDSBBYIO9+j2wHHvOvJK+qUFDyt4U1+M0mYue7n9B+WSG4n
         le8g==
X-Gm-Message-State: AOJu0YwdOotIj5doVw03zfcquVMJw1ewJK1OlpLR0YDZGwSvsLXfMEjo
	ACPEBaY5hm234S0ttvmSib7y++u1gptvm59xY9XJ+ru+A4fks3aR3GmR/+bGfbJblYovmDDyHNt
	gNDhMuUMdrdZ/3GYUVjhPFyYnpSkD6Hw=
X-Gm-Gg: ASbGncuSp2m/iOdR4hLmeFJBt7Xvnkv5CGHZaG1pR1lbawRPruV7QZ0lcFywSa0ievN
	P+fy9BjosNQWE4CucXuoLKl8YDIvSF7gUj3iw7OF+jKO1XixKMPOuBMmM67JpqJqFotZdfDwUyD
	EAKjQ2ZqgtVQHr9yNoxlRGm/QrztPlZzwk8sPd6MKqp+rn2a9Nbwq86XSr1V9T0Kb5JcTJt83Q0
	mQkKhGitMrUn7JWUak7R5eBMPL7LS3ZnXf61oYiYHYK2cBljsalYvXujmCx8hfCOG/KBec5CXPe
	6hh+W5ZSiWh002BN5r6yZv1myv8eWtAFCSVTHRSYN+YefWWJY3/2i0VbxCwj01p3iTxtzInMzh1
	KLWDSEBufrNIS1mxRds/Mu/AESgaTbkRboZVmO3CAlxIOqQ==
X-Google-Smtp-Source: AGHT+IGjr34LmX+pZI6gp4Y+9xEq7X+BNeDlBn0HPzVXfbjcn31REGxqGyEHiHWkFmyGfpohvZ0svFI7nT7vj+n1lIA=
X-Received: by 2002:a05:690c:688f:b0:786:6b92:b1f6 with SMTP id
 00721157ae682-78a8b478ae8mr182151807b3.14.1764184380402; Wed, 26 Nov 2025
 11:13:00 -0800 (PST)
MIME-Version: 1.0
References: <20251108143141.3117797-1-skandigraun@gmail.com>
 <20251108143141.3117797-5-skandigraun@gmail.com> <acab1ff7-bfc9-4be9-a5a4-6ad099ac05e2@gmail.com>
In-Reply-To: <acab1ff7-bfc9-4be9-a5a4-6ad099ac05e2@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Nov 2025 11:12:33 -0800
X-Gm-Features: AWmQ_bmhMPhtZlnD7eJtEGGn8F3-ACAH_vEWZ66YxPCJnoV74df2jyv5dY_iDiM
Message-ID: <CAMKF1sq1oKOqt6b8ZunomOQ0BKdi98cEsaZ+Hx_15Ove5O9Y4w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 5/5] breakpad: correct SRC_URI branch
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004ff2450644842f26"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 19:13:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122082

--0000000000004ff2450644842f26
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2025 at 9:42=E2=80=AFAM Gyorgy Sarvari via lists.openembedd=
ed.org
<skandigraun=3Dgmail.com@lists.openembedded.org> wrote:

> ping
>
>
Thanks for the reminder, it fell through cracks somehow.


> On 11/8/25 15:31, Gyorgy Sarvari wrote:
> > master was renamed to main
> >
> > Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> > ---
> >  meta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb
> b/meta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb
> > index 0e51289507..e7cb29289d 100644
> > --- a/meta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb
> > +++ b/meta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb
> > @@ -28,7 +28,7 @@ SRCREV_lss =3D "9719c1e1e676814c456b55f5f070eabad6709=
d31"
> >
> >  SRC_URI =3D "git://
> github.com/google/breakpad;name=3Dbreakpad;branch=3Dmain;protocol=3Dhttps=
 \
> >             git://
> github.com/google/googletest.git;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX=
}/src/testing/gtest;name=3Dgtest;branch=3Dmain;protocol=3Dhttps
> <http://github.com/google/googletest.git;destsuffix=3D$%7BBB_GIT_DEFAULT_=
DESTSUFFIX%7D/src/testing/gtest;name=3Dgtest;branch=3Dmain;protocol=3Dhttps=
>
> \
> > -           git://
> github.com/protocolbuffers/protobuf.git;destsuffix=3D${BB_GIT_DEFAULT_DES=
TSUFFIX}/src/third_party/protobuf/protobuf;name=3Dprotobuf;branch=3Dmaster;=
protocol=3Dhttps
> <http://github.com/protocolbuffers/protobuf.git;destsuffix=3D$%7BBB_GIT_D=
EFAULT_DESTSUFFIX%7D/src/third_party/protobuf/protobuf;name=3Dprotobuf;bran=
ch=3Dmaster;protocol=3Dhttps>
> \
> > +           git://
> github.com/protocolbuffers/protobuf.git;destsuffix=3D${BB_GIT_DEFAULT_DES=
TSUFFIX}/src/third_party/protobuf/protobuf;name=3Dprotobuf;branch=3Dmain;pr=
otocol=3Dhttps
> <http://github.com/protocolbuffers/protobuf.git;destsuffix=3D$%7BBB_GIT_D=
EFAULT_DESTSUFFIX%7D/src/third_party/protobuf/protobuf;name=3Dprotobuf;bran=
ch=3Dmain;protocol=3Dhttps>
> \
> >             git://
> chromium.googlesource.com/linux-syscall-support;protocol=3Dhttps;branch=
=3Dmain;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/src/third_party/lss;name=
=3Dlss
> <http://chromium.googlesource.com/linux-syscall-support;protocol=3Dhttps;=
branch=3Dmain;destsuffix=3D$%7BBB_GIT_DEFAULT_DESTSUFFIX%7D/src/third_party=
/lss;name=3Dlss>
> \
> >
>  file://0001-include-sys-reg.h-to-get-__WORDSIZE-on-musl-libc.patch \
> >
>  file://0003-Fix-conflict-between-musl-libc-dirent.h-and-lss.patch \
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122081):
> https://lists.openembedded.org/g/openembedded-devel/message/122081
> Mute This Topic: https://lists.openembedded.org/mt/116188100/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000004ff2450644842f26
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 26,=
 2025 at 9:42=E2=80=AFAM Gyorgy Sarvari via <a href=3D"http://lists.openemb=
edded.org">lists.openembedded.org</a> &lt;skandigraun=3D<a href=3D"mailto:g=
mail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">ping<br>
<br></blockquote><div><br></div><div>Thanks for the reminder, it fell throu=
gh cracks somehow.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
On 11/8/25 15:31, Gyorgy Sarvari wrote:<br>
&gt; master was renamed to main<br>
&gt;<br>
&gt; Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.=
com" target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-oe/recipes-devtools/breakpad/<a href=3D"http://breakpad_202=
3.06.01.bb" rel=3D"noreferrer" target=3D"_blank">breakpad_2023.06.01.bb</a>=
 | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-devtools/breakpad/<a href=3D"http://break=
pad_2023.06.01.bb" rel=3D"noreferrer" target=3D"_blank">breakpad_2023.06.01=
.bb</a> b/meta-oe/recipes-devtools/breakpad/<a href=3D"http://breakpad_2023=
.06.01.bb" rel=3D"noreferrer" target=3D"_blank">breakpad_2023.06.01.bb</a><=
br>
&gt; index 0e51289507..e7cb29289d 100644<br>
&gt; --- a/meta-oe/recipes-devtools/breakpad/<a href=3D"http://breakpad_202=
3.06.01.bb" rel=3D"noreferrer" target=3D"_blank">breakpad_2023.06.01.bb</a>=
<br>
&gt; +++ b/meta-oe/recipes-devtools/breakpad/<a href=3D"http://breakpad_202=
3.06.01.bb" rel=3D"noreferrer" target=3D"_blank">breakpad_2023.06.01.bb</a>=
<br>
&gt; @@ -28,7 +28,7 @@ SRCREV_lss =3D &quot;9719c1e1e676814c456b55f5f070eab=
ad6709d31&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/google/brea=
kpad;name=3Dbreakpad;branch=3Dmain;protocol=3Dhttps" rel=3D"noreferrer" tar=
get=3D"_blank">github.com/google/breakpad;name=3Dbreakpad;branch=3Dmain;pro=
tocol=3Dhttps</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http:/=
/github.com/google/googletest.git;destsuffix=3D$%7BBB_GIT_DEFAULT_DESTSUFFI=
X%7D/src/testing/gtest;name=3Dgtest;branch=3Dmain;protocol=3Dhttps" rel=3D"=
noreferrer" target=3D"_blank">github.com/google/googletest.git;destsuffix=
=3D${BB_GIT_DEFAULT_DESTSUFFIX}/src/testing/gtest;name=3Dgtest;branch=3Dmai=
n;protocol=3Dhttps</a> \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://gith=
ub.com/protocolbuffers/protobuf.git;destsuffix=3D$%7BBB_GIT_DEFAULT_DESTSUF=
FIX%7D/src/third_party/protobuf/protobuf;name=3Dprotobuf;branch=3Dmaster;pr=
otocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.com/protocolbuf=
fers/protobuf.git;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/src/third_party=
/protobuf/protobuf;name=3Dprotobuf;branch=3Dmaster;protocol=3Dhttps</a> \<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://gith=
ub.com/protocolbuffers/protobuf.git;destsuffix=3D$%7BBB_GIT_DEFAULT_DESTSUF=
FIX%7D/src/third_party/protobuf/protobuf;name=3Dprotobuf;branch=3Dmain;prot=
ocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.com/protocolbuffe=
rs/protobuf.git;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/src/third_party/p=
rotobuf/protobuf;name=3Dprotobuf;branch=3Dmain;protocol=3Dhttps</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http:/=
/chromium.googlesource.com/linux-syscall-support;protocol=3Dhttps;branch=3D=
main;destsuffix=3D$%7BBB_GIT_DEFAULT_DESTSUFFIX%7D/src/third_party/lss;name=
=3Dlss" rel=3D"noreferrer" target=3D"_blank">chromium.googlesource.com/linu=
x-syscall-support;protocol=3Dhttps;branch=3Dmain;destsuffix=3D${BB_GIT_DEFA=
ULT_DESTSUFFIX}/src/third_party/lss;name=3Dlss</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-include-sys=
-reg.h-to-get-__WORDSIZE-on-musl-libc.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-Fix-conflic=
t-between-musl-libc-dirent.h-and-lss.patch \<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#122081): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/122081" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/122081</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116188100/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116188100/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000004ff2450644842f26--

