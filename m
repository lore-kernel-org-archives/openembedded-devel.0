Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.7596.1605368421486733682
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2020 07:40:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kuUZXrPv;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id e18so14227847edy.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2020 07:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tEr7YrQdpl7yu1oA8PZ/u71/MVzTpFuCDIiWSHgx2QA=;
        b=kuUZXrPvFHnr6U8FJ0o2OpwofbrgRbVzha3dq+WLQ4vRwkaX0MCPoMd3bUZzvez3Nu
         nHTvTTGUDFuifb/Ul02CsedhZFwW3n17Ht69Lkz7UpmyS5goihGuhRWitSJVlVrxSyIV
         TJHDti7mmqVtzlQt3Dqsb8ou3KhV+xHd4rCYLVUd8aCWp97BQD9jV6uI23jF70qAXEtk
         H6K4wP5n4TfdC5jgFmO8VgvlSY5bDtMB5zyUMIKqRLiC9GD/stHbYYt4IuADw+svaZ/E
         1NC/xQBZIorUYNmrvu7Eu/Roz0mn6NdzcDPYtfDNirpLRswntotZq5gT6V6+vcUW/zHE
         s71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tEr7YrQdpl7yu1oA8PZ/u71/MVzTpFuCDIiWSHgx2QA=;
        b=BYkvwhgeF+LhyF5PcLkAitouHI0N3gxNKMTmMgLoIDZR1CZDcrkqABIwMfD5rQhWA2
         TX+jxZdAXAusqL2tMPj2LUxc8P1uFOuFUu59qTzSCNN9IGM8Sya+E9rw5f2UVz+DATfE
         L8ZUKghgI54Oip87pel4QkKKJ8kAtrVRx7wG3/e04Dgxo5z/g0SCLRmttJPKqEHXnqct
         yEiqlqZccj7SrxEhmr8ZVqJhnoVERalytm2CsUSWxIDRxJXehuqUF8RZdN5dWfBNNa2z
         zhlwtuPD+W/LzFbWMTaZbkxpo39jYblMqD8WfemnlPBG4MJnPkFkLfHNhfhost7n3C7M
         7H2Q==
X-Gm-Message-State: AOAM530pFtqVy9OGBkmqlKBY7oi8hYpxcSspKuh1g4ng3/6enmN3J0Bl
	BZrUURzTsyR7S99ynnKD79n7jkdY5WdmexELNUM=
X-Google-Smtp-Source: ABdhPJx2I7AfJcjwRZMU2XuPJLcBPwRWiDhodTQA4R26gsidjlWLOQkLxIZSfUydr4V90smWjN6NkaJR6DuGzzlvi2g=
X-Received: by 2002:aa7:dcd6:: with SMTP id w22mr7922417edu.19.1605368419640;
 Sat, 14 Nov 2020 07:40:19 -0800 (PST)
MIME-Version: 1.0
References: <20201114150443.2647350-1-quaresma.jose@gmail.com> <CAMKF1srwKRGRsqWyWx08fWdGicfa077HsGbOUNd2bjhe2Yd2kQ@mail.gmail.com>
In-Reply-To: <CAMKF1srwKRGRsqWyWx08fWdGicfa077HsGbOUNd2bjhe2Yd2kQ@mail.gmail.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Sat, 14 Nov 2020 15:40:08 +0000
Message-ID: <CANPvuRk12rGO+3nNa75kG+O2o3AXovn1eakLqJ8qEs+XtOkpUw@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH] srt: add receipe
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for that, I will add it in v2

Khem Raj <raj.khem@gmail.com> escreveu no dia s=C3=A1bado, 14/11/2020 =C3=
=A0(s) 15:28:
>
> thanks Jose this also should be added to
> meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multi=
media.bb
>
> On Sat, Nov 14, 2020 at 7:04 AM Jose Quaresma <quaresma.jose@gmail.com> =
wrote:
> >
> > Secure Reliable Transport (SRT) Protocol
> >
> > Secure Reliable Transport (SRT) is an open source transport technology=
 that
> > optimizes streaming performance across unpredictable networks, such as=
 the Internet.
> >
> > SRT is applied to contribution and distribution endpoints as part of a=
 video
> > stream workflow to deliver the best quality and lowest latency video a=
t all times.
> >
> > As audio/video packets are streamed from a source to a destination dev=
ice,
> > SRT detects and adapts to the real-time network conditions between the=
 two endpoints.
> > SRT helps compensate for jitter and bandwidth fluctuations due to cong=
estion
> > over noisy networks, such as the Internet. Its error recovery mechanis=
m minimizes
> > the packet loss typical of Internet connections. And SRT supports AES =
encryption for
> > end-to-end security, keeping your streams safe from prying eyes.
> >
> >     * 0001-don-t-install-srt-ffplay.patch
> >       Upstream-Status: Pending
> >
> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > ---
> >  .../srt/0001-don-t-install-srt-ffplay.patch   | 28 ++++++++++++++++++=
+
> >  .../recipes-support/srt/srt_1.4.2.bb          | 27 ++++++++++++++++++
> >  2 files changed, 55 insertions(+)
> >  create mode 100644 meta-multimedia/recipes-support/srt/srt/0001-don-t=
-install-srt-ffplay.patch
> >  create mode 100644 meta-multimedia/recipes-support/srt/srt_1.4.2.bb
> >
> > diff --git a/meta-multimedia/recipes-support/srt/srt/0001-don-t-instal=
l-srt-ffplay.patch b/meta-multimedia/recipes-support/srt/srt/0001-don-t-ins=
tall-srt-ffplay.patch
> > new file mode 100644
> > index 0000000000..5b76b16328
> > --- /dev/null
> > +++ b/meta-multimedia/recipes-support/srt/srt/0001-don-t-install-srt-f=
fplay.patch
> > @@ -0,0 +1,28 @@
> > +From a45b43a2acd4c29bc8a204f51a3fa5e7b9815613 Mon Sep 17 00:00:00 200=
1
> > +From: Jose Quaresma <quaresma.jose@gmail.com>
> > +Date: Sat, 14 Nov 2020 12:29:56 +0000
> > +Subject: [PATCH] don't install srt-ffplay
> > +
> > +srt-ffplay is a simple bash scripts that pipes the output of srt-live=
-transmit to ffplay.
> > +It need ffmpeg as dependencie and requeire that libsrt is builded wit=
h -DENABLE_APPS=3DON.
> > +So remove it because there are no option to disable the instalation.
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > +---
> > + CMakeLists.txt | 1 -
> > + 1 file changed, 1 deletion(-)
> > +
> > +diff --git a/CMakeLists.txt b/CMakeLists.txt
> > +index ed6e603..ef53dc5 100644
> > +--- a/CMakeLists.txt
> > ++++ b/CMakeLists.txt
> > +@@ -1224,7 +1224,6 @@ if (ENABLE_UNITTESTS AND ENABLE_CXX11)
> > + endif()
> > +
> > +
> > +-install(PROGRAMS scripts/srt-ffplay DESTINATION ${CMAKE_INSTALL_BIND=
IR})
> > +
> > +
> > + if (DEFINED SRT_EXTRA_APPS_INC)
> > diff --git a/meta-multimedia/recipes-support/srt/srt_1.4.2.bb b/meta-m=
ultimedia/recipes-support/srt/srt_1.4.2.bb
> > new file mode 100644
> > index 0000000000..567ea68edf
> > --- /dev/null
> > +++ b/meta-multimedia/recipes-support/srt/srt_1.4.2.bb
> > @@ -0,0 +1,27 @@
> > +SUMMARY =3D "Secure Reliable Transport (SRT) Protocol"
> > +DESCRIPTION =3D "Secure Reliable Transport (SRT) is an open source tr=
ansport technology \
> > +that optimizes streaming performance across unpredictable networks, s=
uch as the Internet."
> > +SECTION =3D "libs"
> > +HOMEPAGE =3D "https://github.com/Haivision/srt"
> > +LICENSE =3D "MPL-2.0"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D815ca599c9df247a0c7f619bab=
123dad"
> > +
> > +SRCREV =3D "50b7af06f3a0a456c172b4cb3aceafa8a5cc0036"
> > +SRC_URI =3D "git://github.com/Haivision/srt;protocol=3Dhttps \
> > +           file://0001-don-t-install-srt-ffplay.patch \
> > +           "
> > +UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
> > +S =3D "${WORKDIR}/git"
> > +
> > +inherit cmake pkgconfig
> > +
> > +EXTRA_OECMAKE =3D "-DCMAKE_BUILD_TYPE=3DRelease -DENABLE_UNITTESTS=3D=
OFF"
> > +
> > +PACKAGECONFIG ??=3D "crypt"
> > +PACKAGECONFIG[debug] =3D "-DENABLE_DEBUG=3D1,,"
> > +PACKAGECONFIG[crypt] =3D "-DENABLE_ENCRYPTION=3DON,-DENABLE_ENCRYPTIO=
N=3DOFF,openssl"
> > +PACKAGECONFIG[utils] =3D "-DENABLE_APPS=3DON,-DENABLE_APPS=3DOFF,"
> > +
> > +PACKAGES +=3D "${@bb.utils.contains('PACKAGECONFIG', 'utils', '${PN}-=
utils', '', d)}"
> > +FILES_${PN}-utils +=3D "${bindir}"
> > +RDEPENDS_${PN}-utils +=3D "${PN}"
> > --
> > 2.29.2
> >
> >
> >=20
> >



--=20
best regards,
Jos=C3=A9 Quaresma
