Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4046ECAC5A0
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 16:28:24 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web10.28263.1758126499931071482
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Sep 2025 09:28:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EI01Ziz6;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-71d6014810fso631437b3.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 09:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758126499; x=1758731299; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BBATYbti9hzrHHAhd/sbVX0jKvmH/V1cdXj7k+VLKkw=;
        b=EI01Ziz6l+pXkWGZpAa68lyMA3ZAmcitI6rvsf+h5rcLi6cqQLEq4I38jLcU/wFDgk
         Xt06ISWgufK70Ss+dpoAJjaLz+yKL4gJ801TP9oHTvtXv4mbOo6MntkkuRsijxtdfl7W
         p4YDPE7Xc2yt0TrYsfQiJdRTafeTyiiA0yQg+CFuOMy5tgspTHjAxCbqBGW7N6CNJDix
         Upsou/X2fMELyjeOm3AhjWUaSPTysOIGR21hWtDjU0NGlRHXXyLlDOKfcPyOHf6sJ+db
         162NKL8O9D2SCpJK+jE6opi1DpxRgpSnuG4AgZp3kNQzqOLZlVSXAybYdtavLlLX1wme
         WwFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758126499; x=1758731299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BBATYbti9hzrHHAhd/sbVX0jKvmH/V1cdXj7k+VLKkw=;
        b=EwmB/rBXC+PTlOCAx2CIyNzvzrv6/D18rdymAC/xJB0hMHZNR4E5wcGxZmUVTNGqnH
         r7h1Q9XvgUCb65sMShvxetEEqMobuZ1BTPsvFGYuf/X0/mwkBfrmRjPbnSCjNcGx3gCX
         SuVXvoXDdGP8oOk8hEv3CQgQOHQCjIKSjYxwCN4zBTvq91qBAntKzwRG8wbWnSvzgiTc
         w/TBYTD0fZFesM7s5ya70rejeowb8szkPcb3mn/jrTM/b4VmiRJG2vBeJ3vPCxfpvNZN
         NV0cG+kYr0Y12VsnYyv7BesCjAIvbj2eEZMYm99nB93A772k2slrVCt0InOKaQL7EWRP
         rDdw==
X-Forwarded-Encrypted: i=1; AJvYcCWdHPBXP2KrOb5AGlRv1K75kmideUUxDd59g20+fxkbmUelt81i5owrXbSkFsZGbdY0Tt6gF/MtvFcj/2G12h9WgW0=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwJufkTp9fIwqtmFhbsbz8lht5+x87md+ItlDZ+o0JCpk9BSSl6
	wYG8Vpbou19LnEC1rLmj8Z7loPsmVNNH8G3+2n3Nrhf6dXgl0l4gHgNHxhpYSYyCiFnLd6Iq2lk
	V0vL1QKopiAxTqq0zJuPxLLpJM+gwQCw=
X-Gm-Gg: ASbGncvZxf/2dLauBH0hryz4o/56bdeIWtXIMagxurzof44mg+1CAT9lj49WMMML2+8
	zXVTyDk/hl1A5MEH8ZqN7XQNx0gv7U8frGFeRb5R8PEcsCeXCwOOMbpx5CIvuJRoWoSgjxpFa16
	PnjfmAVRiBQZrZ3n31SAuvImuzskKhwyxx3r9ftxex2/SvKLvPtlWNee+yaAVIWUyecGLY399hp
	q70Y/vdq8xaHcjq0pmbbBq/aDmPBHwJjZhnSSysb8NQCBv2wwwvtOzKoxX/mgAnaL8/Azsl0/qw
	98Y7u+HYSnmW3Ib+tvOYcowNEJK/OZCAJd4=
X-Google-Smtp-Source: AGHT+IF/9bKAqpM/SRI2ahpo87ALTj+Lt6nmNwtZkvUCTONDQAzlhZXtFeK/Gxm2tBR9Qe6/4Yl7wCRyiC32V9FVubM=
X-Received: by 2002:a05:690c:6181:b0:735:6fbc:596c with SMTP id
 00721157ae682-738908b8be4mr26518307b3.12.1758126498788; Wed, 17 Sep 2025
 09:28:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250904221139.3131569-1-peter.marko@siemens.com>
 <20250904221139.3131569-9-peter.marko@siemens.com> <CABF_=yi6KqviCqT4MFTKwbLFuBSCNjB0g+ucy+HvvYM0Xp36qw@mail.gmail.com>
 <AS1PR10MB5697405DE0AFC728BBE605BFFD15A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <754e2c0a-dc81-4255-b8c0-447c8b350dfd@gmail.com> <AS1PR10MB5697E6E6EEBAEF6748B1CB13FD14A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CAMSfU+4WmCPG-T0gD8dq4_wT79EfoNShej+cmumaLLg6PkezVg@mail.gmail.com> <CAMSfU+5G4R6uVv9AZN69kvpmy8iNhMmLXvkvjciQ_g+7tHpZBQ@mail.gmail.com>
In-Reply-To: <CAMSfU+5G4R6uVv9AZN69kvpmy8iNhMmLXvkvjciQ_g+7tHpZBQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Sep 2025 09:27:51 -0700
X-Gm-Features: AS18NWAsBgoEhlCZrBuAJIZ-HnjJXwROZkaArhKYGo39bOMXsz0hkbD-dGjs0AY
Message-ID: <CAMKF1sq0AMd6MX+EmSaEfWaPNAuZFn5KZ+a1d3C==07ba1bmnQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 09/10] utf8proc: add new recipe with ptest
To: yoann.congal@smile.fr
Cc: peter.marko@siemens.com, Gyorgy Sarvari <skandigraun@gmail.com>, 
	jan vermaete <jan.vermaete@gmail.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 16:28:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119485

On Wed, Sep 17, 2025 at 6:03=E2=80=AFAM Yoann Congal via
lists.openembedded.org <yoann.congal=3Dsmile.fr@lists.openembedded.org>
wrote:
>
>
>
> Le mar. 16 sept. 2025 =C3=A0 19:43, Yoann Congal <yoann.congal@smile.fr> =
a =C3=A9crit :
>>
>>
>>
>> Le mar. 16 sept. 2025 =C3=A0 12:28, Peter Marko via lists.openembedded.o=
rg <peter.marko=3Dsiemens.com@lists.openembedded.org> a =C3=A9crit :
>>>
>>>
>>>
>>> > -----Original Message-----
>>> > From: Gyorgy Sarvari <skandigraun@gmail.com>
>>> > Sent: Tuesday, September 16, 2025 11:16
>>> > To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>; jan ver=
maete
>>> > <jan.vermaete@gmail.com>
>>> > Cc: openembedded-devel@lists.openembedded.org
>>> > Subject: Re: [oe] [meta-oe][PATCH 09/10] utf8proc: add new recipe wit=
h ptest
>>> >
>>> > On 9/15/25 12:53, Peter Marko via lists.openembedded.org wrote:
>>> > >> -----Original Message-----
>>> > >> From: jan vermaete <jan.vermaete@gmail.com>
>>> > >> Sent: Saturday, September 6, 2025 19:22
>>> > >> To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
>>> > >> Cc: openembedded-devel@lists.openembedded.org
>>> > >> Subject: Re: [oe] [meta-oe][PATCH 09/10] utf8proc: add new recipe =
with ptest
>>> > >>
>>> > >> If I'm not mistaken the usage of a tag in the fetcher does require
>>> > >> network access.
>>> > >> What's not always the case.
>>> > >> This does break the parsing by bitbake when no network/Internet is=
 available.
>>> > > Hello, that is true for older releases.
>>> > > In master, using tag is possible and even encouraged/required to va=
lidate that
>>> > the hash belongs to a tag.
>>> > >
>>> >
>>> > Yes, but this patch seems to be missing a revision also, in which cas=
e
>>> > the old behavior stays.
>>>
>>> Oops, sorry for that.
>>> I'll send a patch in the evening if someone didn't already.
>>
>>
>> Hello,
>>
>> This is an ideal newcomer patch.
>> A coworker of mine and beginner contributor wants to take a look at it.
>> Could you wait a day to see if he can get it sent tomorrow?
>
>
> Patch sent here : https://lists.openembedded.org/g/openembedded-devel/mes=
sage/119481
>

Thanks for addressing it,

> Thanks!
>
>>> >
>>> > > Peter
>>> > >
>>> > >> On Fri, Sep 5, 2025 at 12:13=E2=80=AFAM Peter Marko via lists.open=
embedded.org
>>> > >> <peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>>> > >>> From: Peter Marko <peter.marko@siemens.com>
>>> > >>>
>>> > >>> It is needed for poco 1.14+
>>> > >>> Ptest runs for less than a second.
>>> > >>>
>>> > >>> Signed-off-by: Peter Marko <peter.marko@siemens.com>
>>> > >>> ---
>>> > >>>  .../include/ptest-packagelists-meta-oe.inc    |  1 +
>>> > >>>  .../utf8proc/utf8proc/run-ptest               | 15 +++++++++
>>> > >>>  .../utf8proc/utf8proc_2.10.0.bb               | 33 +++++++++++++=
++++++
>>> > >>>  3 files changed, 49 insertions(+)
>>> > >>>  create mode 100644 meta-oe/recipes-support/utf8proc/utf8proc/run=
-ptest
>>> > >>>  create mode 100644 meta-oe/recipes-support/utf8proc/utf8proc_2.1=
0.0.bb
>>> > >>>
>>> > >>> diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc =
b/meta-
>>> > >> oe/conf/include/ptest-packagelists-meta-oe.inc
>>> > >>> index d77b97d576..18324ff0d3 100644
>>> > >>> --- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
>>> > >>> +++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
>>> > >>> @@ -44,6 +44,7 @@ PTESTS_FAST_META_OE =3D "\
>>> > >>>      pv \
>>> > >>>      sdbus-c++ \
>>> > >>>      tomlplusplus \
>>> > >>> +    utf8proc \
>>> > >>>      uthash \
>>> > >>>      xmlsec1 \
>>> > >>>      zeromq \
>>> > >>> diff --git a/meta-oe/recipes-support/utf8proc/utf8proc/run-ptest =
b/meta-
>>> > >> oe/recipes-support/utf8proc/utf8proc/run-ptest
>>> > >>> new file mode 100644
>>> > >>> index 0000000000..349e496d68
>>> > >>> --- /dev/null
>>> > >>> +++ b/meta-oe/recipes-support/utf8proc/utf8proc/run-ptest
>>> > >>> @@ -0,0 +1,15 @@
>>> > >>> +#!/bin/sh
>>> > >>> +
>>> > >>> +execute_test() {
>>> > >>> +    eval "./$1" && echo "PASS: $1" || echo "FAIL: $1"
>>> > >>> +}
>>> > >>> +
>>> > >>> +execute_test "case"
>>> > >>> +execute_test "custom"
>>> > >>> +execute_test "iterate"
>>> > >>> +execute_test "misc"
>>> > >>> +execute_test "printproperty"
>>> > >>> +execute_test "valid"
>>> > >>> +execute_test "charwidth"
>>> > >>> +execute_test "graphemetest data/GraphemeBreakTest.txt"
>>> > >>> +execute_test "normtest data/NormalizationTest.txt"
>>> > >>> diff --git a/meta-oe/recipes-support/utf8proc/utf8proc_2.10.0.bb =
b/meta-
>>> > >> oe/recipes-support/utf8proc/utf8proc_2.10.0.bb
>>> > >>> new file mode 100644
>>> > >>> index 0000000000..e42d16b8b7
>>> > >>> --- /dev/null
>>> > >>> +++ b/meta-oe/recipes-support/utf8proc/utf8proc_2.10.0.bb
>>> > >>> @@ -0,0 +1,33 @@
>>> > >>> +SUMMARY =3D "library that provides operations for data in the UT=
F-8
>>> > encoding"
>>> > >>> +DESCRIPTION =3D "utf8proc is a small, clean C library that provi=
des Unicode \
>>> > >>> +normalization, case-folding, and other operations for data in th=
e UTF-8 \
>>> > >>> +encoding, supporting Unicode version 16.0"
>>> > >>> +HOMEPAGE =3D "https://juliastrings.github.io/utf8proc/"
>>> > >>> +SECTION =3D "libs"
>>> > >>> +
>>> > >>> +LICENSE =3D "MIT & Unicode-3.0"
>>> > >>> +LIC_FILES_CHKSUM =3D
>>> > >> "file://LICENSE.md;md5=3D96d5a3ba306e0f24fb289427af484408"
>>> > >>> +
>>> > >>> +SRC_URI =3D "\
>>> > >>> +
>>> > >>
>>> > git://github.com/JuliaStrings/utf8proc;protocol=3Dhttps;branch=3Dmast=
er;tag=3Dv${PV} \
>>> > >>> +    file://run-ptest \
>>> > >>> +"
>>> > >>> +
>>> > >>> +inherit cmake ptest
>>> > >>> +
>>> > >>> +EXTRA_OECMAKE =3D "\
>>> > >>> +    -DBUILD_SHARED_LIBS=3DON \
>>> > >>> +    ${@bb.utils.contains('PTEST_ENABLED', '1', '-DBUILD_TESTING=
=3DON -
>>> > >> DUTF8PROC_ENABLE_TESTING=3DON ', '', d)} \
>>> > >>> +"
>>> > >>> +
>>> > >>> +do_install_ptest() {
>>> > >>> +    # this list and run-ptest needs to be updated on upgrade (th=
e project uses
>>> > >> add_test feature)
>>> > >>> +    for t in "case" custom iterate misc printproperty valid char=
width
>>> > >> graphemetest normtest; do
>>> > >>> +        install -m 0755 ${B}/$t ${D}${PTEST_PATH}/
>>> > >>> +    done
>>> > >>> +    install -d ${D}${PTEST_PATH}/data
>>> > >>> +    install -m 0644 ${B}/data/GraphemeBreakTest.txt
>>> > >> ${D}${PTEST_PATH}/data/
>>> > >>> +    install -m 0644 ${B}/data/NormalizationTest.txt ${D}${PTEST_=
PATH}/data/
>>> > >>> +}
>>> > >>> +
>>> > >>> +BBCLASSEXTEND =3D "native"
>>> > >>>
>>> > >>>
>>> > >>>
>>> > >>
>>> > >> --
>>> > >> Jan Vermaete
>>> > >> =E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary=
 Hamel
>>> > >>
>>> > >>
>>> > >>
>>>
>>>
>>>
>>>
>>
>>
>> --
>> Yoann Congal
>> Smile ECS
>
>
>
> --
> Yoann Congal
> Smile ECS
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119482): https://lists.openembedded.org/g/openembedde=
d-devel/message/119482
> Mute This Topic: https://lists.openembedded.org/mt/115073156/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

