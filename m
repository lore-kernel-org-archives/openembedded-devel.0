Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD138C369B1
	for <webhook@archiver.kernel.org>; Sun, 13 Apr 2025 14:24:55 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web10.29491.1744554287127149068
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Apr 2025 07:24:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mU91EENx;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5fcd61e9bcdso1720000eaf.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Apr 2025 07:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744554286; x=1745159086; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZjQKbPqNdoXtKFvijJr+thfeFb9YzIf0vL3uguRPy8o=;
        b=mU91EENx6tW8USni+RuXAUP9OFnv6JMQtSX1iucDX+X6bdr5ETTddfEWaXmTcRakV5
         NnRhU1bu5XDn2GEcDGpCF40BqhMrFY0+Mg1FvofDi4TojLJ0ibA+KGWOUarx6gZgo+x5
         aTXJGOKZ436wEvdiwZt8pLS93jCXe23yTeLhiKbpz+AOGdpAiJkHguM9dGQdHRp9pTLE
         FzzIJ8UWAnMEDBK/SKQ7G/76iJEe/mXEnLnzkuqwHS0MMIzJ1hhfF5Fd/E+2at/q9PrI
         6Ye7pF0jvZKwxd0BmZGm8pmZnqHoYsCyNucRsPloC9heF3vvFq5nKaPt0XCJ1krcm7uS
         MFVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744554286; x=1745159086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZjQKbPqNdoXtKFvijJr+thfeFb9YzIf0vL3uguRPy8o=;
        b=nFOSKrLSIBna4ZZEKvUbp63ZaA9l9Dgi77jIfZuSQmP35yMAO8NL625AMwMPwjoRTX
         LbYJvL5PJrvFYL9J/egUOtAbHy7T0+Gc1Bx/6SJCbV9JowxQuBqtApwH+/POXtqCBj6F
         LvyZw2b2KCK5BCAfZQLvCh66RCC7moFeGdYXY/qH3El2MnO6fseJLxivHhWeF8zXgUBB
         s4zg7fwKB6+DaNU8tyjd8/QYsfa4xabTaPRgUmJs5r3ESkTCMtLLB0Mss6gUSN2j6k2i
         vGm2IOVq4QmmH+5wM0O17Lt/w0BN/WyUz/RKeFRAVtjdAHMCFGnsFnpdUV3FObCqvMMM
         j0Kw==
X-Gm-Message-State: AOJu0Yz0+79SwGoGDisGxTwVdU4pN6QUAJQbAwellaMRhpHlDu+m/g3x
	WjsEfxAgWS+Yw0vT6HtArBPDu1pDN4kdv5HThDHzfttNfBoO6xyE8pvjwDHbQJhhqd9rMp2JYH4
	XZjUJxUdbfkCM+wVk7Sv6J14PqxE=
X-Gm-Gg: ASbGncvbxR9TXzMctTQAlhWiSkNfT2mfi32ov7R/c8hlhoApHoC9lAmbDobHAyul+8J
	P2dZ88iIErCJj17n2JrzNcnVisl11UufMf3uCTvA9I0eSTshDrt2N38SStg/13hOnXY44OoYbXh
	TOYWJV+9Z7ZJxtqKXNqH2D
X-Google-Smtp-Source: AGHT+IEr0h3lFQCi9AbH7k5FIn9tsOY/DOTJZ6uOuiyPfGkABtXleVo9l92yKvCfKD6n8p3rL0kKfz5iNqfioKaCj3s=
X-Received: by 2002:a05:6820:4b8c:b0:604:7f1f:623e with SMTP id
 006d021491bc7-6047f1f674emr2260485eaf.2.1744554286234; Sun, 13 Apr 2025
 07:24:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250401185718.2447415-1-jan.vermaete@gmail.com>
 <CAMKF1srQL9v2vfqEpdk6BffkhPc5K=gVJf5oN1gwxCp6SGKYyg@mail.gmail.com> <CABF_=yjZjDmgk3=W0v6fbb_1Ecm5Z=KG+HykptnMzZr700hTVg@mail.gmail.com>
In-Reply-To: <CABF_=yjZjDmgk3=W0v6fbb_1Ecm5Z=KG+HykptnMzZr700hTVg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 13 Apr 2025 07:24:20 -0700
X-Gm-Features: ATxdqUGgYwptLvW-nxK0HUXjUJNJrroEl_obsFWs3g9cIfgLj1ooYipWIxOKaB8
Message-ID: <CAMKF1spRasSdTPBCZqMhwbfpAueDiTFTZHevT2URREPxDiS42A@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 1/4] python3-mdurl: new recipe version 0.1.2
To: jan vermaete <jan.vermaete@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Apr 2025 14:24:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116831

On Sun, Apr 13, 2025 at 2:07=E2=80=AFAM jan vermaete <jan.vermaete@gmail.co=
m> wrote:
>
> Hi Khem,
>
> Sorry for the late response.
>
> The code on github does have tests.  However the archive on pypi.org
> does not have them.
> Would you like to start from the github code to have the tests included?
>
yeah I have seen that with many python packages. pypi tarballs do not conta=
in
tests. we are building from source so it will improve quality of
recipes if we added
tests

>
> On Wed, Apr 2, 2025 at 6:55=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrot=
e:
> >
> > it seems to have pytests please add support for it and tie it into
> > meta-python/conf/include/ptest-packagelists-meta-python.inc
> >
> > On Tue, Apr 1, 2025 at 11:57=E2=80=AFAM Jan Vermaete via
> > lists.openembedded.org <jan.vermaete=3Dgmail.com@lists.openembedded.org=
>
> > wrote:
> > >
> > > * no tests are distributed in the pypi package
> > >
> > > Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
> > > ---
> > >  .../recipes-devtools/python/python3-mdurl_0.1.2.bb  | 13 +++++++++++=
++
> > >  1 file changed, 13 insertions(+)
> > >  create mode 100644 meta-python/recipes-devtools/python/python3-mdurl=
_0.1.2.bb
> > >
> > > diff --git a/meta-python/recipes-devtools/python/python3-mdurl_0.1.2.=
bb b/meta-python/recipes-devtools/python/python3-mdurl_0.1.2.bb
> > > new file mode 100644
> > > index 0000000000..cc110784e3
> > > --- /dev/null
> > > +++ b/meta-python/recipes-devtools/python/python3-mdurl_0.1.2.bb
> > > @@ -0,0 +1,13 @@
> > > +SUMMARY =3D "Markdown URL utilities"
> > > +DESCRIPTION =3D "This is a Python port of the JavaScript mdurl packa=
ge."
> > > +HOMEPAGE =3D "https://github.com/executablebooks/mdurl"
> > > +LICENSE =3D "MIT"
> > > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Daca1dc6b9088f1dda81c89cad=
2c77ad1"
> > > +
> > > +SRC_URI[sha256sum] =3D "bb413d29f5eea38f31dd4754dd7377d4465116fb2075=
85f97bf925588687c1ba"
> > > +
> > > +inherit pypi python_flit_core
> > > +
> > > +PYPI_PACKAGE =3D "mdurl"
> > > +
> > > +BBCLASSEXTEND =3D "native nativesdk"
> > > --
> > > 2.39.5
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#116484): https://lists.openembedded.org/g/openemb=
edded-devel/message/116484
> > > Mute This Topic: https://lists.openembedded.org/mt/112032802/1997914
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b [raj.khem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
>
>
>
> --
> Jan Vermaete
> =E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel

