Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BCD4C433EF
	for <webhook@archiver.kernel.org>; Sat, 19 Feb 2022 18:25:06 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web12.13008.1645295105287300061
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Feb 2022 10:25:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lfonpe8H;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id c14so21498745qvl.12
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Feb 2022 10:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ABMRmtoGvWZ7rHSUweZgsVF9pHen5KKip2LuByFrkMQ=;
        b=lfonpe8HBG3wLHghjeO4CoacKNJzru5CuY6/ZEikAreMui9vuxQEdIlfu2NT0JAug3
         E7GEnEOt9gskUuEOFSWaY3bJ1WdR2IbSwYaCdRdVgVcof7/p3Yxxqjbal69yv65VuKuu
         RfShMbUzWHu/j2GD5PB7F8z5GoBGpE4PtF8fQgPuO7pefGUMA8EKL9BFwgMAaCP5YcLg
         ZnanW6NdAo8R49cklWSFvn2BjeX5i6fLqZZ7GEOk2lLCW7XUiolU6fUxDEOaBhFDohtu
         ZiDTuFByKTjREEooZ4eghu9OBCgjEYgJSEgLNTDqNUZqALwBYzw/Vd/5aeKxZ4Vatn7B
         ioXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ABMRmtoGvWZ7rHSUweZgsVF9pHen5KKip2LuByFrkMQ=;
        b=ZhyA8wQ6j4Et7t8ZBBG5phDEwhDnFcg6Fsc/j1o3BNlhTU6oGnkId9ST9Y7WFSfAcK
         NXrEd4TxjK/6nPGX/DTBggLRJNa8eSo/JfGTywzJwhsGJCi+kK/22T5ZSG06wQGr6KjE
         V0O9I88R+nFceBZ2MMS89UttMMeuM3Ec4KdRD2AkizM5u4nxGbusAM8VHl5nSZwDYLHz
         1O7508g2o1d235gcIWG7E6DjXxIzxcGfUduyheTXRQ8qFDsDJ02hYqxZTOLf9RlJDK51
         6r6eV2AUirV/RFH/e1hm9YJ1gRtXwNEms+cH8G82iRol8A84TxGMYfZI5RwEFomnRmlW
         ickw==
X-Gm-Message-State: AOAM532Rbp8g4Y/+rGmIME5lOUprMuexS+7bXjRM6IVj8LpqgSZ6/Mj8
	mLRRkbAGI9OTw0bfglbRZUl9vcenbbbTjeNUuvQ=
X-Google-Smtp-Source: 
 ABdhPJx+D0maPtLXw+PAWGEKQ0lQgmzOGhlDALJF54wAXkTTvPXix99xeZp9JMP9bXojJ4+W/qAIUyGm0u6beuWGroY=
X-Received: by 2002:ac8:5742:0:b0:2cb:96f2:a4da with SMTP id
 2-20020ac85742000000b002cb96f2a4damr11663614qtx.634.1645295104187; Sat, 19
 Feb 2022 10:25:04 -0800 (PST)
MIME-Version: 1.0
References: <20220217144533.23247-1-ceggers@arri.de>
 <CAJiuCcccjYudzAPyM0RYzkGj1pmD9Nj3Kt+cKcpbU=zRFuggBw@mail.gmail.com>
In-Reply-To: 
 <CAJiuCcccjYudzAPyM0RYzkGj1pmD9Nj3Kt+cKcpbU=zRFuggBw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 19 Feb 2022 10:24:37 -0800
Message-ID: 
 <CAMKF1sr+uxB-0ncjSrTSs=GyyqE6JPgODx5F5k-ekmUKP4bsfg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] pcapplusplus: add new recipe
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: Christian Eggers <ceggers@arri.de>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Feb 2022 18:25:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95391

On Sat, Feb 19, 2022 at 1:05 AM Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.c=
om> wrote:
>
> Hi Christian,
>
> On Thu, 17 Feb 2022 at 15:45, Christian Eggers <ceggers@arri.de> wrote:
> >
> > "A multiplatform C++ library for capturing, parsing and crafting of
> > network packets"
> >
> > PcapPlusPlus uses as custom build system (shell script + Makefile).
> > There were attempts for using cmake but this work has never been
> > finished.
>
> Work is still ongoing by me
> (https://github.com/seladb/PcapPlusPlus/pull/652), Review and help is
> welcome :)

this fails on riscv32 which has 64bit time_t on by default unlike
older 32bit architectures
see
https://errors.yoctoproject.org/Errors/Details/629829/

>
> >
> > Signed-off-by: Christian Eggers <ceggers@arri.de>
> > ---
> >  .../pcapplusplus/pcapplusplus_21.11.bb        | 40 +++++++++++++++++++
> >  1 file changed, 40 insertions(+)
> >  create mode 100644 meta-oe/recipes-connectivity/pcapplusplus/pcapplusp=
lus_21.11.bb
> >
> > diff --git a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_21.=
11.bb b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_21.11.bb
> > new file mode 100644
> > index 000000000000..0d2f83cf4af7
> > --- /dev/null
> > +++ b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_21.11.bb
> > @@ -0,0 +1,40 @@
> > +SUMMARY =3D "A multiplatform C++ library for capturing, parsing and cr=
afting of network packets"
> > +HOMEPAGE =3D "https://pcapplusplus.github.io/"
> > +BUGTRACKER =3D "https://github.com/seladb/PcapPlusPlus/issues"
> > +SECTION =3D "libs/network"
> > +LICENSE =3D "Unlicense"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D911690f51af322440237a253d69=
5d19f"
> > +
> > +DEPENDS =3D "libpcap"
> > +
> > +SRC_URI =3D "git://github.com/seladb/PcapPlusPlus.git;protocol=3Dhttps=
;branch=3Dmaster"
> > +SRCREV =3D "ddce58723a4ef7ab19bf1507e6323990b4d2d15e"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +EXTRA_CONF:libc-musl +=3D "--musl"
> I think there is one fix required to build musl
> https://github.com/seladb/PcapPlusPlus/commit/0607f5ccb7a26bc1567908507e4=
6603e7c16b1ac
>

additionally we should be using

EXTRA_CONF:append:libc-musl =3D " --musl"

> > +# PcapPlusPlus uses a custom shell script for configuration
> > +do_configure () {
> > +    # must use the --default switch only if no other switches are set
> > +    mkdir -p "${D}${prefix}"
> > +    ./configure-linux.sh --install-dir "${D}${prefix}" ${EXTRA_CONF}
> > +}
> > +
> > +do_compile () {
> > +    # build only libs
> > +    oe_runmake libs
> > +}
> > +
> > +do_install () {
> > +    # install script uses PKG_CONFIG_PATH as destination path for .pc =
files
> > +    export PKG_CONFIG_PATH=3D"${D}${libdir}/pkgconfig"
> > +    oe_runmake install
> > +    # remove example makefile
> > +    rm -rf "${D}${prefix}/etc"
> > +    # remove ${D} in .pc file
> > +    sed -i "s@${D}@@g" ${D}${libdir}/pkgconfig/*.pc
> > +    chown -R root:root ${D}${libdir}/pkgconfig/*.pc
> > +}
> > +
> > +# main package is empty
> > +RDEPENDS:${PN}-dev =3D ""
>
> Why not use ALLOW_EMPTY here ?

lesser of two evils.

>
> > --
> > 2.34.1
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95390): https://lists.openembedded.org/g/openembedded=
-devel/message/95390
> Mute This Topic: https://lists.openembedded.org/mt/89210336/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

