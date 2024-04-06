Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DFACCD1284
	for <webhook@archiver.kernel.org>; Sat,  6 Apr 2024 17:48:30 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.39556.1712425705061117744
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Apr 2024 10:48:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZTc3xh6X;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-22ed28b4a25so740295fac.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Apr 2024 10:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712425704; x=1713030504; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e8QuGd4S0uUfeFMKGvaIpCKOabI9uJmPXaQ8ftHyQ30=;
        b=ZTc3xh6XY/BzlTgWLYIZIZDK/2q+b8WLPRn+NJbalQmJpQL+b0CG07h2tu6GilCFVx
         rbRkPUrK/ITxPCzC1iYtkPLWts9TiDSyn+pyP1BZ5RTXtNXvsOduu8/LTU8V7dSTk6KI
         L0L8Db60qOJmttMXZqflbjmbcEJ2i5MARJYAYOdtTTvjyY7GqZiu21kK42KH9bkEEa9q
         BscOh66NCXM3XyiZ4qULtJvC7wHi6Ajb8q1tOrmzLd7SP6xrHmZtvo43jcrCCkWoR/fO
         SU8MBxlZyi6yk0ZkSP7Q8FjNZ6XaVxMVq0/C9YJjGugmRP9I4rjSqLNWPhWBx9wzsrj9
         2kSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712425704; x=1713030504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e8QuGd4S0uUfeFMKGvaIpCKOabI9uJmPXaQ8ftHyQ30=;
        b=gIWjN8D7UnuFGZwzIq2/7z/SJkY6sQyRPLvYXH4DeWw9UkYpVM0olxgTDBw4uh9Gdk
         KX6R2vvsNpHNenJ13Yw7h5LioPJQP0iNVe7szUVGA5m/cOTW9WShRezIVtnqARqgSCbG
         wDybo8BQFQIrh96bRkaKtn1pMhXGzbT2/ep1j9gOQjIY1OFPIGDR1t07/J0L+WUzcHNP
         MxIWlmSe2HXX8346kzLsia4ZPQvKqIURxaxf34A+Hi1oECXCqHKhdnEZqNfO3FYlyYda
         VHT0toJwiK1UpRwY/aZzzAf6y3JH568cH2vwylu16h0O43h8IewrN406F/geuyNgqB/w
         ZtRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCXrstQ87WWS6w3LhBXAYCafbPaLJ4pHfejhyExe0HZC28IkEc1M4ZZc+oB0wMk0Ost5ixd+oQYcWMpIOsHK/iWoNLFToyIbPApKJf0BQc+Qw08Or+YIoF4A==
X-Gm-Message-State: AOJu0Yzzm+FvdiLOCx0w+hFnFGt2S7WOsQzasJegmhd/imrJsAQE/f+2
	6OJ8lzBunDfwUrOlUT5nq5CGfRh8gGS7SHosGTAGVLWPotKuteYaLN7paXMs6mF5dn1ik+swMsf
	vsxOsGG0ojKffPKp5zavGXkUA8Us=
X-Google-Smtp-Source: AGHT+IH9kw9alWCnuPWhQQz4Ae3EkL9cnjxxZO6nUesOlAT5tL4RQbnj+18BSB8oLy84yhyBpKpHZAn1MSeDxH17IjE=
X-Received: by 2002:a05:6870:b69b:b0:22e:c4e7:8aba with SMTP id
 cy27-20020a056870b69b00b0022ec4e78abamr5172387oab.47.1712425704302; Sat, 06
 Apr 2024 10:48:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240405215254.1338168-1-alperyasinak1@gmail.com>
 <CAMKF1sp0N4cVm=qmz=Gh6MOQQXgMMtWB-9TAPMd8x-F0O+zjPw@mail.gmail.com>
 <CAGpma=61Z11fO0w_m9dL_+cZeJq4xU3z4X2pgr1b+V=tvwAAaA@mail.gmail.com> <CANx9H-Cz8DH3DkKPJh5toZAxKJ9+vmaMYA0Z+Ge+zG++PiV0Vg@mail.gmail.com>
In-Reply-To: <CANx9H-Cz8DH3DkKPJh5toZAxKJ9+vmaMYA0Z+Ge+zG++PiV0Vg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 6 Apr 2024 10:47:58 -0700
Message-ID: <CAMKF1sqxK0y1NT-WAvLbUty5DTc42XXqd3+wmL3vmbp5PucXaw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-bleak: enable ptest and add
 missing runtime dependency
To: Tim Orling <ticotimo@gmail.com>
Cc: Alper Ak <alperyasinak1@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 Apr 2024 17:48:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109835

On Sat, Apr 6, 2024 at 7:13=E2=80=AFAM Tim Orling <ticotimo@gmail.com> wrot=
e:
>
>
>
> On Fri, Apr 5, 2024 at 10:34=E2=80=AFPM Alper Ak <alperyasinak1@gmail.com=
> wrote:
>>
>> Sorry, I overlooked it. The tests directory was not present in the packa=
ge downloaded with the default PYPI_SRC_URI value.
>
>
> Unfortunately, many pypi.org tarballs exclude tests. So switching to git =
fetcher will make sense in those cases.

Hmm ok. So is this SRCREV corresponding to same release ? if so we are
ok, otherwise perhaps adding +git to SRCREV would
be appropriate

> Given the =E2=80=9Cxz backdoor=E2=80=9D incident, we might decide to pref=
er git.

Nah, that would not mitigate it

>>
>>
>> Khem Raj <raj.khem@gmail.com>, 6 Nis 2024 Cmt, 01:46 tarihinde =C5=9Funu=
 yazd=C4=B1:
>>>
>>> On Fri, Apr 5, 2024 at 2:53=E2=80=AFPM Alper Ak <alperyasinak1@gmail.co=
m> wrote:
>>> >
>>> > * Ptest tested on qemux86-64 and qemuarm64
>>> >
>>> > * Add ptest into PTESTS_FAST_META_PYTHON
>>> >
>>> > qemux86-64:
>>> >
>>> > Testsuite summary
>>> > TOTAL: 14
>>> > PASS: 14
>>> > SKIP: 0
>>> > XFAIL: 0
>>> > FAIL: 0
>>> > XPASS: 0
>>> > ERROR: 0
>>> > DURATION: 9
>>> > END: /usr/lib/python3-bleak/ptest
>>> > 2024-04-05T18:44
>>> > STOP: ptest-runner
>>> > TOTAL: 1 FAIL: 0
>>> >
>>> > qemuarm64:
>>> >
>>> > Testsuite summary
>>> > TOTAL: 14
>>> > PASS: 14
>>> > SKIP: 0
>>> > XFAIL: 0
>>> > FAIL: 0
>>> > XPASS: 0
>>> > ERROR: 0
>>> > DURATION: 8
>>> > END: /usr/lib/python3-bleak/ptest
>>> > 2024-04-05T21:15
>>> > STOP: ptest-runner
>>> > TOTAL: 1 FAIL: 0
>>> >
>>> > Signed-off-by: alperak <alperyasinak1@gmail.com>
>>> > ---
>>> >  .../ptest-packagelists-meta-python.inc        |  1 +
>>> >  .../python/python3-bleak/run-ptest            |  3 ++
>>> >  .../python/python3-bleak_0.21.1.bb            | 29 +++++++++++++++--=
--
>>> >  3 files changed, 27 insertions(+), 6 deletions(-)
>>> >  create mode 100644 meta-python/recipes-devtools/python/python3-bleak=
/run-ptest
>>> >
>>> > diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.=
inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
>>> > index 2f7babe48..63f312b45 100644
>>> > --- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
>>> > +++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
>>> > @@ -12,6 +12,7 @@ PTESTS_FAST_META_PYTHON =3D "\
>>> >      python3-ansicolors \
>>> >      python3-asgiref \
>>> >      python3-aspectlib \
>>> > +    python3-bleak \
>>> >      python3-blinker \
>>> >      python3-cachetools \
>>> >      python3-cbor2 \
>>> > diff --git a/meta-python/recipes-devtools/python/python3-bleak/run-pt=
est b/meta-python/recipes-devtools/python/python3-bleak/run-ptest
>>> > new file mode 100644
>>> > index 000000000..8d2017d39
>>> > --- /dev/null
>>> > +++ b/meta-python/recipes-devtools/python/python3-bleak/run-ptest
>>> > @@ -0,0 +1,3 @@
>>> > +#!/bin/sh
>>> > +
>>> > +pytest --automake
>>> > diff --git a/meta-python/recipes-devtools/python/python3-bleak_0.21.1=
.bb b/meta-python/recipes-devtools/python/python3-bleak_0.21.1.bb
>>> > index 4a1fafb5d..96f3fcbcf 100644
>>> > --- a/meta-python/recipes-devtools/python/python3-bleak_0.21.1.bb
>>> > +++ b/meta-python/recipes-devtools/python/python3-bleak_0.21.1.bb
>>> > @@ -3,14 +3,31 @@ HOMEPAGE =3D "https://github.com/hbldh/bleak"
>>> >  LICENSE =3D "MIT"
>>> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbcbc2069a86cba1b5e4725367=
9f66ed7"
>>> >
>>> > -SRC_URI[sha256sum] =3D "ec4a1a2772fb315b992cbaa1153070c7e26968a52b0e=
2727035f443a1af5c18f"
>>> > +SRCREV =3D "054b092e19c7a45d5ea07d8948022f54117fe5e8"
>>> > +PYPI_SRC_URI =3D "git://github.com/hbldh/bleak.git;protocol=3Dhttps;=
branch=3Ddevelop"
>>>
>>> why do we need this change if we are not bumping versions ?
>>>
>>> >
>>> > -PYPI_PACKAGE =3D "bleak"
>>> > +inherit pypi python_poetry_core ptest
>>> >
>>> > -inherit pypi python_poetry_core
>>> > +S =3D "${WORKDIR}/git"
>>> > +
>>> > +SRC_URI +=3D " \
>>> > +       file://run-ptest \
>>> > +"
>>> > +
>>> > +RDEPENDS:${PN}-ptest +=3D " \
>>> > +       python3-pytest \
>>> > +       python3-pytest-asyncio \
>>> > +       python3-unittest-automake-output \
>>> > +"
>>> > +
>>> > +do_install_ptest() {
>>> > +       install -d ${D}${PTEST_PATH}/tests
>>> > +       cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
>>> > +}
>>> >
>>> >  RDEPENDS:${PN} +=3D " \
>>> > -    python3-core (>3.7) \
>>> > -    python3-async-timeout \
>>> > -    python3-dbus-fast \
>>> > +       python3-core (>3.7) \
>>> > +       python3-async-timeout \
>>> > +       python3-dbus-fast \
>>> > +       python3-xml \
>>> >  "
>>> > --
>>> > 2.25.1
>>> >
>>> >
>>> >
>>> >
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#109831): https://lists.openembedded.org/g/openembedd=
ed-devel/message/109831
>> Mute This Topic: https://lists.openembedded.org/mt/105358066/924729
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
ticotimo@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

