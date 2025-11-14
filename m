Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D60EACDE027
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 08:19:27 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13486.1763108363737163997
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Nov 2025 00:19:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XTS25Jov;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-786d1658793so16914037b3.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 00:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763108363; x=1763713163; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fndNAvynuHHVYfIFR8UXvmWkRnefL7Jx36lwLAbITWs=;
        b=XTS25Jovqan8HlVWgMM2gaFYb69Itm9mZE9YWAsWnWjYsGAf4znbeQ30XVE7E8EIBz
         JcR3JulygcHxG5RvucwGQo+EPTlnDckmmaHi/nUIwm8ATdQCZNQTe5UjRfXNP1BRI36i
         uUY3hltazCuSWLiY78rfqM76e96Cut3MF7WWe1xBoxh8dwLZ+7iXJchcs7gFtxwWLCLF
         Jg1p1dvyRgZS9FQ/eMQ7Nub5f/yxD36fc90bYzyHgApQ1gSp/3ebE7RO1sWJZM9twrtq
         Jj7o3uwWk5LsJBLWLW+DAq9myRRvH1sbrqp3bnboSmur+nLNrjqTblIRzJVzpLKB5gKr
         7P3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763108363; x=1763713163;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fndNAvynuHHVYfIFR8UXvmWkRnefL7Jx36lwLAbITWs=;
        b=dKmT+EwpCOgACJvhbmsw457lSDd523TERaVey+D60JdvNSNGY/6NNuRQikJ2kwNm48
         4h6Ci0T5Q+szj/PuRljvoggHu32odu0O1g15LZWThiSnfvBatr68rf0AzRTp//tSqcWf
         ZaQvOGa0BrngG4ZAothQEKroXqwtTMOdYl5CXDbjs+DmWoSnbTL7hB8F/Z/hDquO/j5u
         FCoJ6NZPfukFod7DyysfdwIdeyfRIuLae5PdDbVs+5NLVTsgRZFV+jtjxibcUDg2oSId
         RN3D25xxWwwZFu7cQkW6K5WEkYgtrKoxRnkReb+hY3yLjIl0frvDR0+9YgFmfNXJs13p
         qMYw==
X-Gm-Message-State: AOJu0Yy9HxY1uQq9FJOQKaJb2FjFrGL0JrMFMKE+MHIZ3MAsX/Naols8
	4PR3DXubvw2QfrJ8tEbXOZ0rtFbiqwNoMJdmNlHReDq120XChgV27nyQITC/0qCbpASQSY7Vmzy
	c/7dHtyc+bKt67Pwf5t3ZWW9fYxg8oFw=
X-Gm-Gg: ASbGncuTX3shoVgsyYKM4OWDCe51TRgP0CvulVJVoeF56Ls+RcMoHcJGT6NqlegY6Ti
	SN0kZGAHwRJ821f9i25EPA7OL+D9txG+0a1uq1gH3n1XQB4Zu0POOti1wRADAMeLbrtGpmJ0xNZ
	BBsn/AtL+D3prWENze6EvKk+m8ay7iHUa5pETyuq78QiK+1DRwKEIGSNnPlU8pwQwNo81GrimtX
	60lTrispTWGSSGNVyefJm8dvE/J7pqrde/qfUU2W9rCYukdHFIkWB10aTTbdWa1hT8LaQ5Th4NV
	4h28Ntk4ylwaV08ptsCkcU9W8E9EDfWG7pH8snGUty6XOxKwFZlwVTmCVv2adPllOG0eqfk5O3n
	hxvPWUrJ6GCcUlG5WCyibDe1IRy3R4qU6yr0=
X-Google-Smtp-Source: AGHT+IHoQfaiHpocp3zDp15npa/xgwf9KVilIB3aV2SJxPpdZJi989YM2Tw6Uq3aIXFzMIkml1mfDYxHGhDx+q5cHso=
X-Received: by 2002:a05:690c:6206:b0:786:581d:f24b with SMTP id
 00721157ae682-78929ef5d0dmr34008187b3.47.1763108362799; Fri, 14 Nov 2025
 00:19:22 -0800 (PST)
MIME-Version: 1.0
References: <20251114013528.108047-1-raj.khem@gmail.com> <ea2ee27f-989f-49d3-b810-ed3e79611f02@gmail.com>
In-Reply-To: <ea2ee27f-989f-49d3-b810-ed3e79611f02@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Nov 2025 00:18:56 -0800
X-Gm-Features: AWmQ_blwlYPc_ajRPya-O4SAIjLyKODKdIVEwI6GOLLnGhPZFxzTSvTsAwXBk6c
Message-ID: <CAMKF1spUhc_s8kcES2DjLAsKFZzyha7Nn8SwjddaEYtSMG69HQ@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] audiofile: Fix build with clang++
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000aa4ea2064389a72a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 08:19:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121693

--000000000000aa4ea2064389a72a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Can you include this patch in your series as well ? and send v3

On Thu, Nov 13, 2025 at 11:44=E2=80=AFPM Gyorgy Sarvari <skandigraun@gmail.=
com>
wrote:

> Works on my machine, lgtm
>
> On 11/14/25 02:35, Khem Raj wrote:
> > When tests are enabled additional C++ code is compiled and clang does
> > not like the code.
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Gyorgy Sarvari <skandigraun@gmail.com>
> > ---
> >  .../audiofile/audiofile_0.3.6.bb              |  1 +
> >  ...test-sign.cpp-Fix-C-narrowing-errors.patch | 41 +++++++++++++++++++
> >  2 files changed, 42 insertions(+)
> >  create mode 100644
> meta-oe/recipes-multimedia/audiofile/files/0001-test-sign.cpp-Fix-C-narro=
wing-errors.patch
> >
> > diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
> b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
> > index cc7fef2a26..6ebb54e261 100644
> > --- a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
> > +++ b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
> > @@ -19,6 +19,7 @@ SRC_URI =3D " \
> >      file://0006-Check-for-multiplication-overflow-in-sfconvert.patch \
> >      file://0007-Actually-fail-when-error-occurs-in-parseFormat.patch \
> >
> file://0008-Check-for-multiplication-overflow-in-MSADPCM-decodeS.patch \
> > +    file://0001-test-sign.cpp-Fix-C-narrowing-errors.patch \
> >      file://test-for-CVE-2015-7747.patch \
> >      file://CVE-2019-13147.patch \
> >      file://CVE-2022-24599.patch \
> > diff --git
> a/meta-oe/recipes-multimedia/audiofile/files/0001-test-sign.cpp-Fix-C-nar=
rowing-errors.patch
> b/meta-oe/recipes-multimedia/audiofile/files/0001-test-sign.cpp-Fix-C-nar=
rowing-errors.patch
> > new file mode 100644
> > index 0000000000..83c573a873
> > --- /dev/null
> > +++
> b/meta-oe/recipes-multimedia/audiofile/files/0001-test-sign.cpp-Fix-C-nar=
rowing-errors.patch
> > @@ -0,0 +1,41 @@
> > +From bed0eb57c3294bac1c743cbe4404168c1007287d Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Thu, 13 Nov 2025 17:00:59 -0800
> > +Subject: [PATCH] test/sign.cpp: Fix C++ narrowing errors
> > +
> > +The error is because -kMinInt32 is both overflowing and a narrowing
> conversion in a brace initializer.
> > +Fix it by doing the negation in a wider type and explicitly casting to
> uint32_t in the initializer.
> > +
> > +Fixes
> > +
> > +../../sources/audiofile-0.3.6/test/Sign.cpp:160:39: error:
> non-constant-expression cannot be narrowed from type 'int32_t' (aka 'int'=
)
> to 'uint32_t' (aka 'unsigned int') in initializer list [-Wc++11-narrowing=
]
> > +  160 |         const uint32_t expectedData[] =3D { 0, -kMinInt32,
> kMaxUInt32 };
> > +      |                                              ^~~~~~~~~~
> > +../../sources/audiofile-0.3.6/test/Sign.cpp:160:39: note: insert an
> explicit cast to silence this issue
> > +  160 |         const uint32_t expectedData[] =3D { 0, -kMinInt32,
> kMaxUInt32 };
> > +      |                                              ^~~~~~~~~~
> > +      |
> static_cast<uint32_t>( )
> > +../../sources/audiofile-0.3.6/test/Sign.cpp:160:39: warning: overflow
> in expression; result is -2'147'483'648 with type 'int32_t' (aka 'int')
> [-Winteger-overflow]
> > +  160 |         const uint32_t expectedData[] =3D { 0, -kMinInt32,
> kMaxUInt32 };
> > +      |                                              ^~~~~~~~~~
> > +1 warning and 1 error generated.
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + test/Sign.cpp | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/test/Sign.cpp b/test/Sign.cpp
> > +index c339514..0d80fe6 100644
> > +--- a/test/Sign.cpp
> > ++++ b/test/Sign.cpp
> > +@@ -157,7 +157,7 @@ TEST_F(SignConversionTest, Int32)
> > +     AFframecount framesRead =3D afReadFrames(file, AF_DEFAULT_TRACK,
> readData, frameCount);
> > +     ASSERT_EQ(framesRead, frameCount);
> > +     afCloseFile(file);
> > +-    const uint32_t expectedData[] =3D { 0, -kMinInt32, kMaxUInt32 };
> > ++    const uint32_t expectedData[] =3D { 0,
> static_cast<uint32_t>(-static_cast<int64_t>(kMinInt32)), kMaxUInt32 };
> > +     for (int i=3D0; i<frameCount; i++)
> > +             EXPECT_EQ(readData[i], expectedData[i]);
> > + }
>
>

--000000000000aa4ea2064389a72a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Can you include this patch in your series as well ? and se=
nd v3</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D=
"ltr" class=3D"gmail_attr">On Thu, Nov 13, 2025 at 11:44=E2=80=AFPM Gyorgy =
Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com">skandigraun@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">W=
orks on my machine, lgtm<br>
<br>
On 11/14/25 02:35, Khem Raj wrote:<br>
&gt; When tests are enabled additional C++ code is compiled and clang does<=
br>
&gt; not like the code.<br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; Cc: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com" target=
=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../audiofile/<a href=3D"http://audiofile_0.3.6.bb" rel=3D"noref=
errer" target=3D"_blank">audiofile_0.3.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 ...test-sign.cpp-Fix-C-narrowing-errors.patch | 41 +++++++++++++=
++++++<br>
&gt;=C2=A0 2 files changed, 42 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/00=
01-test-sign.cpp-Fix-C-narrowing-errors.patch<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-multimedia/audiofile/<a href=3D"http://au=
diofile_0.3.6.bb" rel=3D"noreferrer" target=3D"_blank">audiofile_0.3.6.bb</=
a> b/meta-oe/recipes-multimedia/audiofile/<a href=3D"http://audiofile_0.3.6=
.bb" rel=3D"noreferrer" target=3D"_blank">audiofile_0.3.6.bb</a><br>
&gt; index cc7fef2a26..6ebb54e261 100644<br>
&gt; --- a/meta-oe/recipes-multimedia/audiofile/<a href=3D"http://audiofile=
_0.3.6.bb" rel=3D"noreferrer" target=3D"_blank">audiofile_0.3.6.bb</a><br>
&gt; +++ b/meta-oe/recipes-multimedia/audiofile/<a href=3D"http://audiofile=
_0.3.6.bb" rel=3D"noreferrer" target=3D"_blank">audiofile_0.3.6.bb</a><br>
&gt; @@ -19,6 +19,7 @@ SRC_URI =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0006-Check-for-multiplication-overflow-in-s=
fconvert.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0007-Actually-fail-when-error-occurs-in-par=
seFormat.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0008-Check-for-multiplication-overflow-in-M=
SADPCM-decodeS.patch \<br>
&gt; +=C2=A0 =C2=A0 file://0001-test-sign.cpp-Fix-C-narrowing-errors.patch =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://test-for-CVE-2015-7747.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://CVE-2019-13147.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://CVE-2022-24599.patch \<br>
&gt; diff --git a/meta-oe/recipes-multimedia/audiofile/files/0001-test-sign=
.cpp-Fix-C-narrowing-errors.patch b/meta-oe/recipes-multimedia/audiofile/fi=
les/0001-test-sign.cpp-Fix-C-narrowing-errors.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..83c573a873<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-multimedia/audiofile/files/0001-test-sign.cpp-Fi=
x-C-narrowing-errors.patch<br>
&gt; @@ -0,0 +1,41 @@<br>
&gt; +From bed0eb57c3294bac1c743cbe4404168c1007287d Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
&gt; +Date: Thu, 13 Nov 2025 17:00:59 -0800<br>
&gt; +Subject: [PATCH] test/sign.cpp: Fix C++ narrowing errors<br>
&gt; +<br>
&gt; +The error is because -kMinInt32 is both overflowing and a narrowing c=
onversion in a brace initializer.<br>
&gt; +Fix it by doing the negation in a wider type and explicitly casting t=
o uint32_t in the initializer.<br>
&gt; +<br>
&gt; +Fixes<br>
&gt; +<br>
&gt; +../../sources/audiofile-0.3.6/test/Sign.cpp:160:39: error: non-consta=
nt-expression cannot be narrowed from type &#39;int32_t&#39; (aka &#39;int&=
#39;) to &#39;uint32_t&#39; (aka &#39;unsigned int&#39;) in initializer lis=
t [-Wc++11-narrowing]<br>
&gt; +=C2=A0 160 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const uint32_t expected=
Data[] =3D { 0, -kMinInt32, kMaxUInt32 };<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~<br>
&gt; +../../sources/audiofile-0.3.6/test/Sign.cpp:160:39: note: insert an e=
xplicit cast to silence this issue<br>
&gt; +=C2=A0 160 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const uint32_t expected=
Data[] =3D { 0, -kMinInt32, kMaxUInt32 };<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 static_cast&lt;uint32_t&gt;( )<br=
>
&gt; +../../sources/audiofile-0.3.6/test/Sign.cpp:160:39: warning: overflow=
 in expression; result is -2&#39;147&#39;483&#39;648 with type &#39;int32_t=
&#39; (aka &#39;int&#39;) [-Winteger-overflow]<br>
&gt; +=C2=A0 160 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const uint32_t expected=
Data[] =3D { 0, -kMinInt32, kMaxUInt32 };<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~<br>
&gt; +1 warning and 1 error generated.<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + test/Sign.cpp | 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/test/Sign.cpp b/test/Sign.cpp<br>
&gt; +index c339514..0d80fe6 100644<br>
&gt; +--- a/test/Sign.cpp<br>
&gt; ++++ b/test/Sign.cpp<br>
&gt; +@@ -157,7 +157,7 @@ TEST_F(SignConversionTest, Int32)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0AFframecount framesRead =3D afReadFrames(file, AF=
_DEFAULT_TRACK, readData, frameCount);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ASSERT_EQ(framesRead, frameCount);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0afCloseFile(file);<br>
&gt; +-=C2=A0 =C2=A0 const uint32_t expectedData[] =3D { 0, -kMinInt32, kMa=
xUInt32 };<br>
&gt; ++=C2=A0 =C2=A0 const uint32_t expectedData[] =3D { 0, static_cast&lt;=
uint32_t&gt;(-static_cast&lt;int64_t&gt;(kMinInt32)), kMaxUInt32 };<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (int i=3D0; i&lt;frameCount; i++)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0EXPECT_EQ(readData[i]=
, expectedData[i]);<br>
&gt; + }<br>
<br>
</blockquote></div>

--000000000000aa4ea2064389a72a--

