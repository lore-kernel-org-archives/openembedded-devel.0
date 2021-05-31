Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web10.46494.1622479286275528366
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 May 2021 09:41:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=u/oRYZOu;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id q10so11682037qkc.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 May 2021 09:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kSg0cKzx1LcMHOUDl636ijelGYwcMSUoxRK0v6Ebzp4=;
        b=u/oRYZOuXuX8tKVQb0D6bFDrFk19vTqHPYdS+16Gnyc97R80ktwn0Y353jCv1bcHuW
         ITli3/HtukPi7iZaejYvMrsNtMPHceHdAFmW4gUMH5zIyooaPqtCMbEeMuCN1aVTcncJ
         0KkJvnJdL1YNCkRHAPXks9+1TA0krjsJJ8YgsL/SsjNQGcg6XFv0RTPROLjAJbp20cQU
         J+npm69TlLpGHl6qI0cxc+g3CRsDvBQtr0iFh/8jFzroM/d9tk9yi7Ob1WcTBxe6Ommy
         MvSd5DpNABIUwDGhuo8sh5rw+El1VMnELdLUPRSxkp1xoqNI4sS6at1JdRhyBSuMTVxK
         I0IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kSg0cKzx1LcMHOUDl636ijelGYwcMSUoxRK0v6Ebzp4=;
        b=QfMk0JYuu5uNP3PbnDrMkqCCJGpON/D/wWmRLyTwg7U7FQ5BFU6ng3ACdY+9FNtjDO
         W3x1FWKNbgDpRJRCJHtEjxd7ELGOqDAQ7X8+H2ACKATBVMsbSQQb2yI+6uL9ycTl2TvC
         U7LJmTgow9H8TRHpQ/AVscPVRhmQCAFt2vHb+Gq07BwksidF4ZYDxce2aX6wqWE5GNtm
         8SS5dv42se5IVh2/h0tzgKYM9a9Io9DC7Ma9n1k45eWxWAeKGxbc8mmbvg33nPUC3XKK
         uOOKnOa1E0+szyo1IhUPy7qayt6vc/MJ3Zdhrct5hkAV6FqEtgmJ+pK/kprN4ceNzHle
         8xEA==
X-Gm-Message-State: AOAM533BL52ITMK/MT7Dvsgj4Pb5bP0SNyFYoErm99e1ptzbcDStiepv
	voBC75VCKHp1wo6fgAHnlCfdmnxluLehQ3YXajY=
X-Google-Smtp-Source: ABdhPJx15snXyOJyUNthCi3VLpKsnJEWgFeNmZ9M/XhY5RUmChSu+H7qeXVOUol1712RbgWOJFvA9RJ8KYf5PphCTo0=
X-Received: by 2002:ae9:e40f:: with SMTP id q15mr10615290qkc.125.1622479285329;
 Mon, 31 May 2021 09:41:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210530172125.16258-1-ayoub.zaki@embexus.com>
 <CAMKF1sq56JqYJ6+R8On3zc_HnUO4VwvAP91QNASS8y_P7AZCgw@mail.gmail.com> <588c056c-7880-c98f-7464-beb6347017bf@embexus.com>
In-Reply-To: <588c056c-7880-c98f-7464-beb6347017bf@embexus.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 31 May 2021 09:40:59 -0700
Message-ID: <CAMKF1spBjCLrJV+ccHE1HS7scCN1=Z7fZ3fPWV-Uh5cPzA-A9A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] evemu-tools: Add initial recipe
To: Ayoub Zaki <ayoub.zaki@embexus.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 31, 2021 at 8:17 AM Ayoub Zaki <ayoub.zaki@embexus.com> wrote:
>
> Hi,
>
> On 5/31/21 4:45 PM, Khem Raj wrote:
> > On Sun, May 30, 2021 at 10:21 AM Ayoub Zaki <ayoub.zaki@embexus.com> w=
rote:
> >> ---
> >>   .../evemu-tools/evemu-tools_git.bb            | 23 ++++++++++++++++=
+++
> >>   1 file changed, 23 insertions(+)
> >>   create mode 100644 meta-oe/recipes-support/evemu-tools/evemu-tools_=
git.bb
> >>
> >> diff --git a/meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb b=
/meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb
> >> new file mode 100644
> >> index 000000000..f1172b0ef
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb
> >> @@ -0,0 +1,23 @@
> >> +SUMMARY =3D "Kernel evdev device emulation"
> >> +DESCRIPTION =3D "The evemu library and tools are used to describe de=
vices, record data, create devices and replay data from kernel evdev device=
s."
> >> +HOMEPAGE =3D "https://www.freedesktop.org/wiki/Evemu"
> >> +
> >> +LICENSE =3D "GPLv3"
> >> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De6a600fd5e1d9cbde2d983680=
233ad02"
> >> +
> >> +DEPENDS =3D "libevdev"
> >> +
> >> +SRCREV =3D "86a5627dbeac8d9d9bc34326a758d6a477e876e4"
> >> +SRC_URI =3D "git://git@gitlab.freedesktop.org/libevdev/evemu.git;pro=
tocol=3Dhttps;branch=3Dmaster"
> >> +
> >> +S =3D "${WORKDIR}/git"
> >> +PV =3D "gitr${SRCPV}"
> >> +
> >> +inherit autotools pkgconfig
> >> +
> >> +EXTRA_OECONF_append =3D " --prefix=3D/usr"
> > why do we need this
>
>
> default prefix is /usr/local

this recipe is inheriting autotools bbclass and should ser --prefix
properly. So I wonder.
Can you check your confgure logs and see where /usr/local is being passed

>
> >
> >> +
> >> +PACKAGES =3D+ "${PN}-python"
> >> +FILES_${PN}-python =3D "${libdir}/python*/site-packages/*"
> >> +RDEPENDS_${PN}-python =3D "python3"
> >> +
> >> --
> >> 2.17.1
> >>
> >>
> >>=20
> >>
> Mit freundlichen Gr=C3=BC=C3=9Fen / Kind regards
>
> --
> Ayoub Zaki
> Embedded Systems Consultant
>
> Vaihinger Stra=C3=9Fe 2/1
> D-71634 Ludwigsburg
>
> Mobile   : +4917662901545
> Email    : ayoub.zaki@embexus.com
> Homepage : https://embexus.com
> VAT No.  : DE313902634
>
