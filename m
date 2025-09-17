Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAA32CAC59A
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 13:03:32 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.22320.1758114202595483165
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Sep 2025 06:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=hIOcfBRF;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3ea115556b2so2325638f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 06:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1758114201; x=1758719001; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AbiIUmitSui75kJyb0QtBQxfUlZzbiynIFXtB40PieI=;
        b=hIOcfBRF9r1eF7dqEOX840tAWXAsL03Qfe4jZS1H9rgoyGKrBHZz0ytNBKssLG5vuY
         21YtMcDUz5dksOEWzkBSKNHE5ocpZ97OuLMzCz5SQ2G9jH45rwixPg3x6DC5zTm8Vmbz
         Z/xGXKpfR4DUOu5vgqFQcvaJn4hYbZ1qWLOEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758114201; x=1758719001;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AbiIUmitSui75kJyb0QtBQxfUlZzbiynIFXtB40PieI=;
        b=RC7GpZoQDyDIyEY4O0S7OMNvacx4Mnc78b6SDmuciaLWk5Dvgh7iRWXgtnqxkNhFcN
         c3qZTLZotCtokMpzQBsg2lkLjvkqd2Yx96sLC6mkwSHO+boeLa4gMGrfxBf37SqSrjl2
         t6xgKfID7FnGjdtUG+ugINOrs2oSlOkvKtcBvn8w2thsTfVduOGc4xdPbot52stjTopv
         ZOksMAdpcv78Y8mAgBkKYqHYAi/5bmeGvMp9Sk4SyrjHUSCWY1w/m5GnPUMxhGI074Nv
         Ipk29tiQP5Zlp0Tg0GeIs7lKjxJGPTIbJKl/jgWNF2nWA/+CISzD0Lj7iI6YPchV99YF
         tUew==
X-Forwarded-Encrypted: i=1; AJvYcCW3nt9gVjD+pDr+E3Xtn9ztHbquYIQ2dnkUMndmlSZtTSGqoRPq9i7yTmwsEEpJk8xOKjDNAF55Pr43wg892xEDng0=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyK4A393pKiqQBmKd9npq3pyy5+80aqTV5nkIicIxeMHFBGbbCk
	fd6gynxXCrr83bKeULtFb3SZz/+ed7rscntI6SEQhRGzdLGQNcK3UIXUWsnBXz3whqrRHkr4nKs
	U4qrNwcnI0iCCfuFP58NetimC3CoYID3d9iOcD9a5Rg==
X-Gm-Gg: ASbGncuqPgbi1mMucEShRMwPiu9H1uI1ab6r1aQFXkCT+71ut70t7b/o8axn6Hborvc
	vJurW6oMBJMMm+T258a49/xb8+IHq1T55mbp4BDNIPLQXPaMpsyVsFe2xQuTI1kYIKO7GxsTYPS
	wbkELxuwlf7NHPyeXiro0J2qYGXEnOWuBAOx/mdLEMwrSdKKc6NgVIyfnhPLRkNBI99QEKghp0d
	iVkmLukcw==
X-Google-Smtp-Source: AGHT+IEIsnaET30GeNdCqOPE6YufcLEDlKufjO/SLaf0QgkYxIYpXvl7kbSUaXMq0LIbIAU+JiZi4FEmA0gXQPdG6TI=
X-Received: by 2002:a5d:5d06:0:b0:3eb:17b4:3919 with SMTP id
 ffacd0b85a97d-3ecdfa5ed84mr2341019f8f.43.1758114200707; Wed, 17 Sep 2025
 06:03:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250904221139.3131569-1-peter.marko@siemens.com>
 <20250904221139.3131569-9-peter.marko@siemens.com> <CABF_=yi6KqviCqT4MFTKwbLFuBSCNjB0g+ucy+HvvYM0Xp36qw@mail.gmail.com>
 <AS1PR10MB5697405DE0AFC728BBE605BFFD15A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <754e2c0a-dc81-4255-b8c0-447c8b350dfd@gmail.com> <AS1PR10MB5697E6E6EEBAEF6748B1CB13FD14A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CAMSfU+4WmCPG-T0gD8dq4_wT79EfoNShej+cmumaLLg6PkezVg@mail.gmail.com>
In-Reply-To: <CAMSfU+4WmCPG-T0gD8dq4_wT79EfoNShej+cmumaLLg6PkezVg@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 17 Sep 2025 15:02:52 +0200
X-Gm-Features: AS18NWCW2FfM0qdjTzAs9XbnOeCoKoTOkUqQYnwgiLNv5TzPr6LjNaDHY9j4av8
Message-ID: <CAMSfU+5G4R6uVv9AZN69kvpmy8iNhMmLXvkvjciQ_g+7tHpZBQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 09/10] utf8proc: add new recipe with ptest
To: peter.marko@siemens.com
Cc: Gyorgy Sarvari <skandigraun@gmail.com>, jan vermaete <jan.vermaete@gmail.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000687eac063efedc04"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 13:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119482

--000000000000687eac063efedc04
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 16 sept. 2025 =C3=A0 19:43, Yoann Congal <yoann.congal@smile.fr> a
=C3=A9crit :

>
>
> Le mar. 16 sept. 2025 =C3=A0 12:28, Peter Marko via lists.openembedded.or=
g
> <peter.marko=3Dsiemens.com@lists.openembedded.org> a =C3=A9crit :
>
>>
>>
>> > -----Original Message-----
>> > From: Gyorgy Sarvari <skandigraun@gmail.com>
>> > Sent: Tuesday, September 16, 2025 11:16
>> > To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>; jan
>> vermaete
>> > <jan.vermaete@gmail.com>
>> > Cc: openembedded-devel@lists.openembedded.org
>> > Subject: Re: [oe] [meta-oe][PATCH 09/10] utf8proc: add new recipe with
>> ptest
>> >
>> > On 9/15/25 12:53, Peter Marko via lists.openembedded.org wrote:
>> > >> -----Original Message-----
>> > >> From: jan vermaete <jan.vermaete@gmail.com>
>> > >> Sent: Saturday, September 6, 2025 19:22
>> > >> To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
>> > >> Cc: openembedded-devel@lists.openembedded.org
>> > >> Subject: Re: [oe] [meta-oe][PATCH 09/10] utf8proc: add new recipe
>> with ptest
>> > >>
>> > >> If I'm not mistaken the usage of a tag in the fetcher does require
>> > >> network access.
>> > >> What's not always the case.
>> > >> This does break the parsing by bitbake when no network/Internet is
>> available.
>> > > Hello, that is true for older releases.
>> > > In master, using tag is possible and even encouraged/required to
>> validate that
>> > the hash belongs to a tag.
>> > >
>> >
>> > Yes, but this patch seems to be missing a revision also, in which case
>> > the old behavior stays.
>>
>> Oops, sorry for that.
>> I'll send a patch in the evening if someone didn't already.
>>
>
> Hello,
>
> This is an ideal newcomer patch.
> A coworker of mine and beginner contributor wants to take a look at it.
> Could you wait a day to see if he can get it sent tomorrow?
>

Patch sent here :
https://lists.openembedded.org/g/openembedded-devel/message/119481

Thanks!

>
>> > > Peter
>> > >
>> > >> On Fri, Sep 5, 2025 at 12:13=E2=80=AFAM Peter Marko via
>> lists.openembedded.org
>> > >> <peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>> > >>> From: Peter Marko <peter.marko@siemens.com>
>> > >>>
>> > >>> It is needed for poco 1.14+
>> > >>> Ptest runs for less than a second.
>> > >>>
>> > >>> Signed-off-by: Peter Marko <peter.marko@siemens.com>
>> > >>> ---
>> > >>>  .../include/ptest-packagelists-meta-oe.inc    |  1 +
>> > >>>  .../utf8proc/utf8proc/run-ptest               | 15 +++++++++
>> > >>>  .../utf8proc/utf8proc_2.10.0.bb               | 33
>> +++++++++++++++++++
>> > >>>  3 files changed, 49 insertions(+)
>> > >>>  create mode 100644
>> meta-oe/recipes-support/utf8proc/utf8proc/run-ptest
>> > >>>  create mode 100644 meta-oe/recipes-support/utf8proc/
>> utf8proc_2.10.0.bb
>> > >>>
>> > >>> diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
>> b/meta-
>> > >> oe/conf/include/ptest-packagelists-meta-oe.inc
>> > >>> index d77b97d576..18324ff0d3 100644
>> > >>> --- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
>> > >>> +++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
>> > >>> @@ -44,6 +44,7 @@ PTESTS_FAST_META_OE =3D "\
>> > >>>      pv \
>> > >>>      sdbus-c++ \
>> > >>>      tomlplusplus \
>> > >>> +    utf8proc \
>> > >>>      uthash \
>> > >>>      xmlsec1 \
>> > >>>      zeromq \
>> > >>> diff --git a/meta-oe/recipes-support/utf8proc/utf8proc/run-ptest
>> b/meta-
>> > >> oe/recipes-support/utf8proc/utf8proc/run-ptest
>> > >>> new file mode 100644
>> > >>> index 0000000000..349e496d68
>> > >>> --- /dev/null
>> > >>> +++ b/meta-oe/recipes-support/utf8proc/utf8proc/run-ptest
>> > >>> @@ -0,0 +1,15 @@
>> > >>> +#!/bin/sh
>> > >>> +
>> > >>> +execute_test() {
>> > >>> +    eval "./$1" && echo "PASS: $1" || echo "FAIL: $1"
>> > >>> +}
>> > >>> +
>> > >>> +execute_test "case"
>> > >>> +execute_test "custom"
>> > >>> +execute_test "iterate"
>> > >>> +execute_test "misc"
>> > >>> +execute_test "printproperty"
>> > >>> +execute_test "valid"
>> > >>> +execute_test "charwidth"
>> > >>> +execute_test "graphemetest data/GraphemeBreakTest.txt"
>> > >>> +execute_test "normtest data/NormalizationTest.txt"
>> > >>> diff --git a/meta-oe/recipes-support/utf8proc/utf8proc_2.10.0.bb
>> b/meta-
>> > >> oe/recipes-support/utf8proc/utf8proc_2.10.0.bb
>> > >>> new file mode 100644
>> > >>> index 0000000000..e42d16b8b7
>> > >>> --- /dev/null
>> > >>> +++ b/meta-oe/recipes-support/utf8proc/utf8proc_2.10.0.bb
>> > >>> @@ -0,0 +1,33 @@
>> > >>> +SUMMARY =3D "library that provides operations for data in the UTF=
-8
>> > encoding"
>> > >>> +DESCRIPTION =3D "utf8proc is a small, clean C library that provid=
es
>> Unicode \
>> > >>> +normalization, case-folding, and other operations for data in the
>> UTF-8 \
>> > >>> +encoding, supporting Unicode version 16.0"
>> > >>> +HOMEPAGE =3D "https://juliastrings.github.io/utf8proc/"
>> > >>> +SECTION =3D "libs"
>> > >>> +
>> > >>> +LICENSE =3D "MIT & Unicode-3.0"
>> > >>> +LIC_FILES_CHKSUM =3D
>> > >> "file://LICENSE.md;md5=3D96d5a3ba306e0f24fb289427af484408"
>> > >>> +
>> > >>> +SRC_URI =3D "\
>> > >>> +
>> > >>
>> > git://
>> github.com/JuliaStrings/utf8proc;protocol=3Dhttps;branch=3Dmaster;tag=3D=
v${PV}
>> <http://github.com/JuliaStrings/utf8proc;protocol=3Dhttps;branch=3Dmaste=
r;tag=3Dv$%7BPV%7D>
>> \
>> > >>> +    file://run-ptest \
>> > >>> +"
>> > >>> +
>> > >>> +inherit cmake ptest
>> > >>> +
>> > >>> +EXTRA_OECMAKE =3D "\
>> > >>> +    -DBUILD_SHARED_LIBS=3DON \
>> > >>> +    ${@bb.utils.contains('PTEST_ENABLED', '1', '-DBUILD_TESTING=
=3DON
>> -
>> > >> DUTF8PROC_ENABLE_TESTING=3DON ', '', d)} \
>> > >>> +"
>> > >>> +
>> > >>> +do_install_ptest() {
>> > >>> +    # this list and run-ptest needs to be updated on upgrade (the
>> project uses
>> > >> add_test feature)
>> > >>> +    for t in "case" custom iterate misc printproperty valid
>> charwidth
>> > >> graphemetest normtest; do
>> > >>> +        install -m 0755 ${B}/$t ${D}${PTEST_PATH}/
>> > >>> +    done
>> > >>> +    install -d ${D}${PTEST_PATH}/data
>> > >>> +    install -m 0644 ${B}/data/GraphemeBreakTest.txt
>> > >> ${D}${PTEST_PATH}/data/
>> > >>> +    install -m 0644 ${B}/data/NormalizationTest.txt
>> ${D}${PTEST_PATH}/data/
>> > >>> +}
>> > >>> +
>> > >>> +BBCLASSEXTEND =3D "native"
>> > >>>
>> > >>>
>> > >>>
>> > >>
>> > >> --
>> > >> Jan Vermaete
>> > >> =E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary =
Hamel
>> > >>
>> > >>
>> > >>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#119465):
>> https://lists.openembedded.org/g/openembedded-devel/message/119465
>> Mute This Topic: https://lists.openembedded.org/mt/115073156/4316185
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
>> yoann.congal@smile.fr]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>
>
> --
> Yoann Congal
> Smile ECS
>


--=20
Yoann Congal
Smile ECS

--000000000000687eac063efedc04
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 16=
 sept. 2025 =C3=A0=C2=A019:43, Yoann Congal &lt;<a href=3D"mailto:yoann.con=
gal@smile.fr">yoann.congal@smile.fr</a>&gt; a =C3=A9crit=C2=A0:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=
=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">Le=C2=A0mar. 16 sept. 2025 =C3=A0=C2=A012:28, Peter Marko via =
<a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembed=
ded.org</a> &lt;peter.marko=3D<a href=3D"mailto:siemens.com@lists.openembed=
ded.org" target=3D"_blank">siemens.com@lists.openembedded.org</a>&gt; a =C3=
=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com" targ=
et=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
&gt; Sent: Tuesday, September 16, 2025 11:16<br>
&gt; To: Marko, Peter (FT D EU SK BFS1) &lt;<a href=3D"mailto:Peter.Marko@s=
iemens.com" target=3D"_blank">Peter.Marko@siemens.com</a>&gt;; jan vermaete=
<br>
&gt; &lt;<a href=3D"mailto:jan.vermaete@gmail.com" target=3D"_blank">jan.ve=
rmaete@gmail.com</a>&gt;<br>
&gt; Cc: <a href=3D"mailto:openembedded-devel@lists.openembedded.org" targe=
t=3D"_blank">openembedded-devel@lists.openembedded.org</a><br>
&gt; Subject: Re: [oe] [meta-oe][PATCH 09/10] utf8proc: add new recipe with=
 ptest<br>
&gt; <br>
&gt; On 9/15/25 12:53, Peter Marko via <a href=3D"http://lists.openembedded=
.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote=
:<br>
&gt; &gt;&gt; -----Original Message-----<br>
&gt; &gt;&gt; From: jan vermaete &lt;<a href=3D"mailto:jan.vermaete@gmail.c=
om" target=3D"_blank">jan.vermaete@gmail.com</a>&gt;<br>
&gt; &gt;&gt; Sent: Saturday, September 6, 2025 19:22<br>
&gt; &gt;&gt; To: Marko, Peter (FT D EU SK BFS1) &lt;<a href=3D"mailto:Pete=
r.Marko@siemens.com" target=3D"_blank">Peter.Marko@siemens.com</a>&gt;<br>
&gt; &gt;&gt; Cc: <a href=3D"mailto:openembedded-devel@lists.openembedded.o=
rg" target=3D"_blank">openembedded-devel@lists.openembedded.org</a><br>
&gt; &gt;&gt; Subject: Re: [oe] [meta-oe][PATCH 09/10] utf8proc: add new re=
cipe with ptest<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; If I&#39;m not mistaken the usage of a tag in the fetcher doe=
s require<br>
&gt; &gt;&gt; network access.<br>
&gt; &gt;&gt; What&#39;s not always the case.<br>
&gt; &gt;&gt; This does break the parsing by bitbake when no network/Intern=
et is available.<br>
&gt; &gt; Hello, that is true for older releases.<br>
&gt; &gt; In master, using tag is possible and even encouraged/required to =
validate that<br>
&gt; the hash belongs to a tag.<br>
&gt; &gt;<br>
&gt; <br>
&gt; Yes, but this patch seems to be missing a revision also, in which case=
<br>
&gt; the old behavior stays.<br>
<br>
Oops, sorry for that.<br>
I&#39;ll send a patch in the evening if someone didn&#39;t already.<br></bl=
ockquote><div><br></div><div>Hello,</div><div><br></div><div>This is an ide=
al newcomer patch.</div><div>A coworker of mine and beginner contributor wa=
nts to take a look at it.</div><div>Could you wait a day to see if he can g=
et it sent tomorrow?</div></div></div></blockquote><div><br></div><div>Patc=
h sent here :=C2=A0<a href=3D"https://lists.openembedded.org/g/openembedded=
-devel/message/119481">https://lists.openembedded.org/g/openembedded-devel/=
message/119481</a></div><div><br></div><div>Thanks!</div><div><br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=
=3D"gmail_quote"><div></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
&gt; <br>
&gt; &gt; Peter<br>
&gt; &gt;<br>
&gt; &gt;&gt; On Fri, Sep 5, 2025 at 12:13=E2=80=AFAM Peter Marko via <a hr=
ef=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">l=
ists.openembedded.org</a><br>
&gt; &gt;&gt; &lt;peter.marko=3D<a href=3D"mailto:siemens.com@lists.openemb=
edded.org" target=3D"_blank">siemens.com@lists.openembedded.org</a>&gt; wro=
te:<br>
&gt; &gt;&gt;&gt; From: Peter Marko &lt;<a href=3D"mailto:peter.marko@sieme=
ns.com" target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; It is needed for poco 1.14+<br>
&gt; &gt;&gt;&gt; Ptest runs for less than a second.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.ma=
rko@siemens.com" target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
&gt; &gt;&gt;&gt; ---<br>
&gt; &gt;&gt;&gt;=C2=A0 .../include/ptest-packagelists-meta-oe.inc=C2=A0 =
=C2=A0 |=C2=A0 1 +<br>
&gt; &gt;&gt;&gt;=C2=A0 .../utf8proc/utf8proc/run-ptest=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 15 +++++++++<br>
&gt; &gt;&gt;&gt;=C2=A0 .../utf8proc/<a href=3D"http://utf8proc_2.10.0.bb" =
rel=3D"noreferrer" target=3D"_blank">utf8proc_2.10.0.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 33 +++++++++++++++++++<br>
&gt; &gt;&gt;&gt;=C2=A0 3 files changed, 49 insertions(+)<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/utf8proc=
/utf8proc/run-ptest<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/utf8proc=
/<a href=3D"http://utf8proc_2.10.0.bb" rel=3D"noreferrer" target=3D"_blank"=
>utf8proc_2.10.0.bb</a><br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; diff --git a/meta-oe/conf/include/ptest-packagelists-meta=
-oe.inc b/meta-<br>
&gt; &gt;&gt; oe/conf/include/ptest-packagelists-meta-oe.inc<br>
&gt; &gt;&gt;&gt; index d77b97d576..18324ff0d3 100644<br>
&gt; &gt;&gt;&gt; --- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc=
<br>
&gt; &gt;&gt;&gt; +++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc=
<br>
&gt; &gt;&gt;&gt; @@ -44,6 +44,7 @@ PTESTS_FAST_META_OE =3D &quot;\<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 pv \<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 sdbus-c++ \<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 tomlplusplus \<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 utf8proc \<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 uthash \<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 xmlsec1 \<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 zeromq \<br>
&gt; &gt;&gt;&gt; diff --git a/meta-oe/recipes-support/utf8proc/utf8proc/ru=
n-ptest b/meta-<br>
&gt; &gt;&gt; oe/recipes-support/utf8proc/utf8proc/run-ptest<br>
&gt; &gt;&gt;&gt; new file mode 100644<br>
&gt; &gt;&gt;&gt; index 0000000000..349e496d68<br>
&gt; &gt;&gt;&gt; --- /dev/null<br>
&gt; &gt;&gt;&gt; +++ b/meta-oe/recipes-support/utf8proc/utf8proc/run-ptest=
<br>
&gt; &gt;&gt;&gt; @@ -0,0 +1,15 @@<br>
&gt; &gt;&gt;&gt; +#!/bin/sh<br>
&gt; &gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt; +execute_test() {<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 eval &quot;./$1&quot; &amp;&amp; echo &quo=
t;PASS: $1&quot; || echo &quot;FAIL: $1&quot;<br>
&gt; &gt;&gt;&gt; +}<br>
&gt; &gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt; +execute_test &quot;case&quot;<br>
&gt; &gt;&gt;&gt; +execute_test &quot;custom&quot;<br>
&gt; &gt;&gt;&gt; +execute_test &quot;iterate&quot;<br>
&gt; &gt;&gt;&gt; +execute_test &quot;misc&quot;<br>
&gt; &gt;&gt;&gt; +execute_test &quot;printproperty&quot;<br>
&gt; &gt;&gt;&gt; +execute_test &quot;valid&quot;<br>
&gt; &gt;&gt;&gt; +execute_test &quot;charwidth&quot;<br>
&gt; &gt;&gt;&gt; +execute_test &quot;graphemetest data/GraphemeBreakTest.t=
xt&quot;<br>
&gt; &gt;&gt;&gt; +execute_test &quot;normtest data/NormalizationTest.txt&q=
uot;<br>
&gt; &gt;&gt;&gt; diff --git a/meta-oe/recipes-support/utf8proc/<a href=3D"=
http://utf8proc_2.10.0.bb" rel=3D"noreferrer" target=3D"_blank">utf8proc_2.=
10.0.bb</a> b/meta-<br>
&gt; &gt;&gt; oe/recipes-support/utf8proc/<a href=3D"http://utf8proc_2.10.0=
.bb" rel=3D"noreferrer" target=3D"_blank">utf8proc_2.10.0.bb</a><br>
&gt; &gt;&gt;&gt; new file mode 100644<br>
&gt; &gt;&gt;&gt; index 0000000000..e42d16b8b7<br>
&gt; &gt;&gt;&gt; --- /dev/null<br>
&gt; &gt;&gt;&gt; +++ b/meta-oe/recipes-support/utf8proc/<a href=3D"http://=
utf8proc_2.10.0.bb" rel=3D"noreferrer" target=3D"_blank">utf8proc_2.10.0.bb=
</a><br>
&gt; &gt;&gt;&gt; @@ -0,0 +1,33 @@<br>
&gt; &gt;&gt;&gt; +SUMMARY =3D &quot;library that provides operations for d=
ata in the UTF-8<br>
&gt; encoding&quot;<br>
&gt; &gt;&gt;&gt; +DESCRIPTION =3D &quot;utf8proc is a small, clean C libra=
ry that provides Unicode \<br>
&gt; &gt;&gt;&gt; +normalization, case-folding, and other operations for da=
ta in the UTF-8 \<br>
&gt; &gt;&gt;&gt; +encoding, supporting Unicode version 16.0&quot;<br>
&gt; &gt;&gt;&gt; +HOMEPAGE =3D &quot;<a href=3D"https://juliastrings.githu=
b.io/utf8proc/" rel=3D"noreferrer" target=3D"_blank">https://juliastrings.g=
ithub.io/utf8proc/</a>&quot;<br>
&gt; &gt;&gt;&gt; +SECTION =3D &quot;libs&quot;<br>
&gt; &gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt; +LICENSE =3D &quot;MIT &amp; Unicode-3.0&quot;<br>
&gt; &gt;&gt;&gt; +LIC_FILES_CHKSUM =3D<br>
&gt; &gt;&gt; &quot;file://LICENSE.md;md5=3D96d5a3ba306e0f24fb289427af48440=
8&quot;<br>
&gt; &gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt; +SRC_URI =3D &quot;\<br>
&gt; &gt;&gt;&gt; +<br>
&gt; &gt;&gt;<br>
&gt; git://<a href=3D"http://github.com/JuliaStrings/utf8proc;protocol=3Dht=
tps;branch=3Dmaster;tag=3Dv$%7BPV%7D" rel=3D"noreferrer" target=3D"_blank">=
github.com/JuliaStrings/utf8proc;protocol=3Dhttps;branch=3Dmaster;tag=3Dv${=
PV}</a> \<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 file://run-ptest \<br>
&gt; &gt;&gt;&gt; +&quot;<br>
&gt; &gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt; +inherit cmake ptest<br>
&gt; &gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt; +EXTRA_OECMAKE =3D &quot;\<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 -DBUILD_SHARED_LIBS=3DON \<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;PTEST_ENABLED&#3=
9;, &#39;1&#39;, &#39;-DBUILD_TESTING=3DON -<br>
&gt; &gt;&gt; DUTF8PROC_ENABLE_TESTING=3DON &#39;, &#39;&#39;, d)} \<br>
&gt; &gt;&gt;&gt; +&quot;<br>
&gt; &gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt; +do_install_ptest() {<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 # this list and run-ptest needs to be upda=
ted on upgrade (the project uses<br>
&gt; &gt;&gt; add_test feature)<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 for t in &quot;case&quot; custom iterate m=
isc printproperty valid charwidth<br>
&gt; &gt;&gt; graphemetest normtest; do<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0755 ${B}/$t ${D}=
${PTEST_PATH}/<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 done<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/data<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 install -m 0644 ${B}/data/GraphemeBreakTes=
t.txt<br>
&gt; &gt;&gt; ${D}${PTEST_PATH}/data/<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 install -m 0644 ${B}/data/NormalizationTes=
t.txt ${D}${PTEST_PATH}/data/<br>
&gt; &gt;&gt;&gt; +}<br>
&gt; &gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt; +BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; --<br>
&gt; &gt;&gt; Jan Vermaete<br>
&gt; &gt;&gt; =E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D --=
 Gary Hamel<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; <br>
&gt; &gt;&gt;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#119465): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/119465" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/119465</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115073156/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/115073156/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" t=
arget=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000687eac063efedc04--

