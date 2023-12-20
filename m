Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 034D7C3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 22:03:54 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web11.33428.1703109831598325279
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Dec 2023 14:03:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QOh4Xesj;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3ba4850f65dso61357b6e.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 14:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703109831; x=1703714631; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wCwuXqpi9kljTWhbMVJdvffEbQskuYCvu6iYvwnaWhE=;
        b=QOh4Xesjq5BYqUHiHGlPYmL7dNfoBKloE9T2/zxHURPYv8ZdnJmG3bCmTCd5c/+v8n
         JeIvulC1ccUqnKIi3cxMwq8Cl+zzogs3HZTedAxyWmW8obQWRmkEFElCjViz7H2ZEVV4
         y5hnH/H2TWUJo3uvPbaGNUk78cpGAnTJmtByfOCBZgO/O70xdtmSm5fuD/zyrhOr4Qt0
         M+2kxamwP9zqjQdm3+VFKVOxmcbLQPhLYO8Gy17M2vXHvEQ24iNimk52zMb5uAJj4b5z
         6ci8LkC93EFJkLIfmTjYwvkdaKXfE7kUOeKyc6W7kIDT4oQcaHw5OOKyFsTogatV9lQ9
         tTkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703109831; x=1703714631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wCwuXqpi9kljTWhbMVJdvffEbQskuYCvu6iYvwnaWhE=;
        b=gHcoaWvaFPoB2FhsIMf/I8mHm2SL/coblPq0NcsPIZdLtPRU+Q1hITyCv6pu2vjxft
         Zn55WDVW+hfozG8Z3Iju8X0DPz/bJ6Ik+Qrm1owMC0b15ufnzuoBWTyvJD6KPThR0qjS
         gkGHROHm4U8V2bghzvXE4D9o5sVsu07s7I0hI3Pr2PO9McpHczxRX3CFpZgxQ/B+g7an
         931/yOcovzReRr9TrwnTLtINikRP0xrPeEpIIlaTuqxl0FBfeh0s3k77l5a6zzAePFIT
         1CTycUpFvCqhbmCOKQm46fiCfqSm/rzt8mVfk/FmlGx5FuV5TfYoOxaOJgSYfg+MYYiR
         qUDw==
X-Gm-Message-State: AOJu0YzMk896s1PrxUYVnUOvA6d4SdCJ5keZMkc2H/GDhQSsoMeM43kN
	fTQJO/NfABmzNE4HKQDFqk3fP5+og6lhKVS+pOQ=
X-Google-Smtp-Source: AGHT+IHMVG8rY8D2V9XtcDh82GyhPzHyxtmkwtbtj6M5ZxBxFGjL18D8BW7zCbi6xo5WnPOSU2auq41+lLQQzu4gJYk=
X-Received: by 2002:a05:6870:fba9:b0:203:edf8:8ef4 with SMTP id
 kv41-20020a056870fba900b00203edf88ef4mr485310oab.82.1703109830676; Wed, 20
 Dec 2023 14:03:50 -0800 (PST)
MIME-Version: 1.0
References: <20231220155334.1055853-1-ross.burton@arm.com> <CAMKF1sqC=LDFtm3eXqeWiSnDo7NW6=BTh3mJHzcFAOxDDSN0+g@mail.gmail.com>
 <CA+chaQfTmXgxVmxQkcLEKxbqoK-aCGufyou3M1D4yLvCEMQQWA@mail.gmail.com>
In-Reply-To: <CA+chaQfTmXgxVmxQkcLEKxbqoK-aCGufyou3M1D4yLvCEMQQWA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Dec 2023 14:03:24 -0800
Message-ID: <CAMKF1sr_ExqYwxDau__PsuE4jExq6bO5BVMcEaf1tWg-RdJN4A@mail.gmail.com>
Subject: Re: [oe] [PATCH 1/2] lemon: upgrade to 3.44.2
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 22:03:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107678

On Wed, Dec 20, 2023 at 2:00=E2=80=AFPM Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>
>
>
> On Wed, Dec 20, 2023 at 10:42=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wr=
ote:
>>
>> On Wed, Dec 20, 2023 at 7:53=E2=80=AFAM Ross Burton <ross.burton@arm.com=
> wrote:
>> >
>> > From: Ross Burton <ross.burton@arm.com>
>> >
>> > Lemon is packaged as part of sqlite, and sqlite 3.7.3 was released bac=
k
>> > in 2010[1].
>> >
>> > As the small source tarballs no longer include the tools, fetch the
>> > sqlite github mirror instead.
>> >
>> > Don't bother installing a pretty minimal manpage, as very few projects
>> > use lemon (sqlite itself, and libpbnjson).
>> >
>> > [1] https://www.sqlite.org/releaselog/3_7_3.html
>> >
>> ...
>>
>> > diff --git a/meta-oe/recipes-devtools/lemon/lemon.inc b/meta-oe/recipe=
s-devtools/lemon/lemon.inc
>> > deleted file mode 100644
>> > index 57b9fb710e..0000000000
>> > --- a/meta-oe/recipes-devtools/lemon/lemon.inc
>> > +++ /dev/null
>> > @@ -1,25 +0,0 @@
>> > -DESCRIPTION =3D "The Lemon Parser Generator"
>> > -HOMEPAGE =3D "http://www.hwaci.com/sw/lemon/"
>> > -LICENSE =3D "PD"
>> > -SECTION =3D "devel"
>> > -
>> > -SRC_URI =3D "http://www.sqlite.org/sqlite-${PV}.tar.gz \
>> > -           file://lemon.1"
>> > -
>> > -S =3D "${WORKDIR}/sqlite-${PV}/tool"
>> > -
>> > -do_compile() {
>> > -    ${CC} ${CFLAGS} lemon.c -c -o lemon.o
>> > -    ${CCLD} ${LDFLAGS} lemon.o -o lemon
>> > -}
>> > -
>> > -do_install() {
>> > -    install -d ${D}${bindir}
>> > -    install -m 0755 lemon ${D}${bindir}
>> > -    install -m 0644 lempar.c ${D}${bindir}
>> > -    install -d ${D}${mandir}/man1
>> > -    install -m 0644 ${WORKDIR}/lemon.1 ${D}${mandir}/man1/
>> > -}
>> > -
>> > -BBCLASSEXTEND =3D "native"
>> > -
>> > diff --git a/meta-oe/recipes-devtools/lemon/lemon_3.44.2.bb b/meta-oe/=
recipes-devtools/lemon/lemon_3.44.2.bb
>> > new file mode 100644
>> > index 0000000000..1b849922a6
>> > --- /dev/null
>> > +++ b/meta-oe/recipes-devtools/lemon/lemon_3.44.2.bb
>> > @@ -0,0 +1,24 @@
>> > +DESCRIPTION =3D "The Lemon Parser Generator"
>> > +HOMEPAGE =3D "https://sqlite.org/src/file/doc/lemon.html"
>> > +LICENSE =3D "PD"
>> > +SECTION =3D "devel"
>> > +
>> > +LIC_FILES_CHKSUM =3D "file://tool/lemon.c;endline=3D8;md5=3Dc7551a78f=
a3fdecd96d1ad6761d205ee"
>> > +
>> > +SRC_URI =3D "git://github.com/sqlite/sqlite;protocol=3Dhttps;branch=
=3Dbranch-3.44"
>> > +
>> > +SRCREV =3D "c8f9803dc32bfee78a9ca2b1abbe39499729219b"
>> > +
>> > +S =3D "${WORKDIR}/git"
>> > +
>> > +do_compile() {
>> > +    ${CC} ${CPPFLAGS} ${CFLAGS} ${LDFLAGS} tool/lemon.c -o lemon
>>
>> why do we need CPPFLAGS here ?
>>
>> > +}
>> > +
>> > +do_install() {
>> > +    install -d ${D}${bindir}
>> > +    install -m 0755 lemon ${D}${bindir}
>> > +    install -m 0644 tool/lempar.c ${D}${bindir}
>>
>> .c file in bindir seems odd.
>
>
> I was wondering about it as well, but looks like lemon binary looks for t=
his as a default template next to lemon binary in:
> https://github.com/sqlite/sqlite/blob/master/tool/lemon.c#L3654
>
> that's why it's in bindir and was there before this upgrade as well.

Cool. Makes sense. Thanks Martin

>
>> > +}
>> > +
>> > +BBCLASSEXTEND =3D "native nativesdk"
>> > diff --git a/meta-oe/recipes-devtools/lemon/lemon_3.7.3.bb b/meta-oe/r=
ecipes-devtools/lemon/lemon_3.7.3.bb
>> > deleted file mode 100644
>> > index 354db17e6e..0000000000
>> > --- a/meta-oe/recipes-devtools/lemon/lemon_3.7.3.bb
>> > +++ /dev/null
>> > @@ -1,7 +0,0 @@
>> > -require lemon.inc
>> > -
>> > -LIC_FILES_CHKSUM =3D "file://lemon.c;endline=3D8;md5=3Dc7551a78fa3fde=
cd96d1ad6761d205ee"
>> > -
>> > -SRC_URI[md5sum] =3D "5437978aae90350cf984993091e0d695"
>> > -SRC_URI[sha256sum] =3D "dbf352e8fbb74829f5e7a88f9f6ceeb80a709537f668c=
36e4b6cdfb271309ef6"
>> > -
>> > --
>> > 2.34.1
>> >
>> >
>> >
>> >
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#107675): https://lists.openembedded.org/g/openembedd=
ed-devel/message/107675
>> Mute This Topic: https://lists.openembedded.org/mt/103283009/3617156
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
martin.jansa@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

