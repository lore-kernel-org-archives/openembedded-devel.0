Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55050C433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 09:34:16 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web08.4855.1645781655344364670
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Feb 2022 01:34:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NbeLI93z;
 spf=pass (domain: gmail.com, ip: 209.85.167.173,
 mailfrom: peron.clem@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id y7so6754302oih.5
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Feb 2022 01:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mUA2qCyc4jcvX9mJVpnTQ2RG7v9cBhNLOdWfR1jZy/8=;
        b=NbeLI93zz/Vym0mt/VPUsLmKed6vY74P6FmptzmQ5Ridnml/cu8eEZt16lDWwqdTWK
         asY0iYyXOCYA7Esvr5B1y7L/v1GHQpB/wl8hn/X6qIqzVljpHjs61pjuL86xeZcE2KZ3
         pJDffw+5tikskup13mi7+L0XXSmoLorSyeFSJLcTnUVzX0rnoxKDfQvv5MrcFLbz3HDQ
         +U4gWLYV4KI5osyRGy8dutsvd8M8B9v9rBpVNBc47/cPCk6brZmILeL1llYiA//JFCGq
         FDWI85+Psy9mHPTlo5JH8WNrZkrUS9/6lgxkBzYF2zH5hZ+uR5iUb3Racojbtb6mJBuJ
         dlmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mUA2qCyc4jcvX9mJVpnTQ2RG7v9cBhNLOdWfR1jZy/8=;
        b=c2RomIoBWnYOzZN/kIjEGvSYa3rfuvXLeaAFIkrPE/TExgaC1L4nezpQsWFEMfUwRQ
         hsEd6d3n9snds1HrFK2vK4B1XebByYZ057r8+/5CriXH+UXShdWqQANabtk+hKHX/LFa
         qEBp0WrMv9Pjy/rg+nOoFfLgr9EBQPPmxd4IgVhAzt2+G1DHIo4NgLPt5AVnhy/ihtHS
         xozvmXPOCojfdsluRHEoK4uJJw096mJ5iEITqo3Euy2o6h9Tr446IFUbCFsGNVThgHFa
         k+dSzxawuVsKt1SYDDNDQPfoRd6jjozVVW6cEkN/rgvzOSz90gh7bIVr7Up/Ppn+Ct+v
         0kbQ==
X-Gm-Message-State: AOAM530ChOjZEEfkA2l5Swga8jPwHK29V5wUTbUVP7eOWUNa+qBO6j4r
	OPkGF1fV4zcq9PkLRjsRqNjTYk8g68986+IabpQ=
X-Google-Smtp-Source: 
 ABdhPJwt73yAx5JFBRvdqhQJex+2dLRgekdo8l0JJpTbx1UaSKwx+FKSwzP5pN0jq83z2fkr2roUbS6aRRh0aximDsI=
X-Received: by 2002:a05:6808:e89:b0:2cf:cad3:e427 with SMTP id
 k9-20020a0568080e8900b002cfcad3e427mr1026563oil.20.1645781654169; Fri, 25 Feb
 2022 01:34:14 -0800 (PST)
MIME-Version: 1.0
References: <20220225073933.8251-1-ceggers@arri.de>
In-Reply-To: <20220225073933.8251-1-ceggers@arri.de>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Fri, 25 Feb 2022 10:34:03 +0100
Message-ID: 
 <CAJiuCce+oPGbeJRZdj1VPuiwrwuLKvz0zNuAf_ox+JestBf=_Q@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v2] pcapplusplus: add new recipe
To: Christian Eggers <ceggers@arri.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	seladb <pcapplusplus@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Feb 2022 09:34:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95518

Hi Christian,

On Fri, 25 Feb 2022 at 08:39, Christian Eggers <ceggers@arri.de> wrote:
>
> "A multiplatform C++ library for capturing, parsing and crafting of
> network packets"
>
> PcapPlusPlus is currently transitioning from a custom build system
> (shell script + Makefile) to CMake. After this has been merged, SRC_URI
> must be set the main repository.
>
> Signed-off-by: Christian Eggers <ceggers@arri.de>
> ---
> RFC --> v2:
> ------------
> - Update patch status (Submitted --> Accepted)
> - inherit dox2unix (files in GIT have Windows line endings)

We will soon convert to Unix EOL.

> - convert patch to unix line endings
>
> v1 --> RFC:
> ------------
> - move to Cl=C3=A9ment P=C3=A9ron's fork [branch: cmake-ng]
> - change recipe to cmake
> - add patch for -Wnarrowing warnings/errors
> - build shared libraries
> - remove RDEPENDS:${PN}-dev (main pkg contains now shared libs)
> - add -Wno-psabi to CXXFLAGS
>
> This is the 2nd attempt to move the build system of PcapPlusPlus to
> CMake. I highly suppose that this will get merged soon.
>  ...-Fix-timeval-to-timespec-conversions.patch | 58 +++++++++++++++++++
>  .../pcapplusplus/pcapplusplus_21.11.bb        | 33 +++++++++++
>  2 files changed, 91 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/pcapplusplus/pcapplusplu=
s/0001-Fix-timeval-to-timespec-conversions.patch
>  create mode 100644 meta-oe/recipes-connectivity/pcapplusplus/pcapplusplu=
s_21.11.bb
>
> diff --git a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-=
Fix-timeval-to-timespec-conversions.patch b/meta-oe/recipes-connectivity/pc=
applusplus/pcapplusplus/0001-Fix-timeval-to-timespec-conversions.patch
> new file mode 100644
> index 000000000000..1f050815be61
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-Fix-tim=
eval-to-timespec-conversions.patch
> @@ -0,0 +1,58 @@
> +From 740971bb451e1147e19a1b0498436d2332b01293 Mon Sep 17 00:00:00 2001
> +From: Christian Eggers <ceggers@arri.de>
> +Date: Mon, 21 Feb 2022 13:53:49 +0100
> +Subject: [PATCH] Fix timeval-to-timespec conversions
> +
> +Time values returned by gettimeofday() have microseconds in
> +timeval::tv_usec while timespec::ts_nsec is nanoseconds.
> +
> +timeval::tv_usec is 64 bit (at least on some platforms), while
> +timespec::tv_nsec is always 'long'. An explicit cast is required to
> +avoid -Wnarrowing warnings/errors.
> +
> +Upstream-Status: Accepted [https://github.com/seladb/PcapPlusPlus/pull/8=
14]
> +
> +Signed-off-by: Christian Eggers <ceggers@arri.de>
> +---
> + Pcap++/src/NetworkUtils.cpp   | 4 ++--
> + Pcap++/src/PcapFileDevice.cpp | 2 +-
> + 2 files changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/Pcap++/src/NetworkUtils.cpp b/Pcap++/src/NetworkUtils.cpp
> +index bdbf87f4c380..749853927ecd 100644
> +--- a/Pcap++/src/NetworkUtils.cpp
> ++++ b/Pcap++/src/NetworkUtils.cpp
> +@@ -169,7 +169,7 @@ MacAddress NetworkUtils::getMacAddress(IPv4Address i=
pAddr, PcapLiveDevice* devic
> +       // create the timeout
> +       timespec timeout =3D {
> +                       now.tv_sec + arpTimeout,
> +-                      now.tv_usec
> ++                      static_cast<long>(now.tv_usec * 1000)
> +       };
> +
> +       // start capturing. The capture is done on another thread, hence =
"arpPacketRecieved" is running on that thread
> +@@ -436,7 +436,7 @@ IPv4Address NetworkUtils::getIPv4Address(std::string=
 hostname, PcapLiveDevice* d
> +       // create the timeout
> +       timespec timeout =3D {
> +                       now.tv_sec + dnsTimeout,
> +-                      now.tv_usec
> ++                      static_cast<long>(now.tv_usec * 1000)
> +       };
> +
> +       // start capturing. The capture is done on another thread, hence =
"dnsResponseRecieved" is running on that thread
> +diff --git a/Pcap++/src/PcapFileDevice.cpp b/Pcap++/src/PcapFileDevice.c=
pp
> +index 6bf04c1dd31a..256554407c50 100644
> +--- a/Pcap++/src/PcapFileDevice.cpp
> ++++ b/Pcap++/src/PcapFileDevice.cpp
> +@@ -188,7 +188,7 @@ bool PcapFileReaderDevice::getNextPacket(RawPacket& =
rawPacket)
> +       uint8_t* pMyPacketData =3D new uint8_t[pkthdr.caplen];
> +       memcpy(pMyPacketData, pPacketData, pkthdr.caplen);
> + #if defined(PCAP_TSTAMP_PRECISION_NANO)
> +-      timespec ts =3D { pkthdr.ts.tv_sec, pkthdr.ts.tv_usec }; //becaus=
e we opened with nano second precision 'tv_usec' is actually nanos
> ++      timespec ts =3D { pkthdr.ts.tv_sec, static_cast<long>(pkthdr.ts.t=
v_usec) }; //because we opened with nano second precision 'tv_usec' is actu=
ally nanos
> + #else
> +       struct timeval ts =3D pkthdr.ts;
> + #endif
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_21.11=
.bb b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_21.11.bb
> new file mode 100644
> index 000000000000..e2a2d104cf7e
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_21.11.bb
> @@ -0,0 +1,33 @@
> +SUMMARY =3D "A multiplatform C++ library for capturing, parsing and craf=
ting of network packets"
> +HOMEPAGE =3D "https://pcapplusplus.github.io/"
> +BUGTRACKER =3D "https://github.com/seladb/PcapPlusPlus/issues"
> +SECTION =3D "libs/network"
> +LICENSE =3D "Unlicense"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D911690f51af322440237a253d695d=
19f"
> +
> +DEPENDS =3D "libpcap"
> +
> +PV =3D "git${SRCPV}"
> +
> +# master branch with hand-crafted build system
> +#SRC_URI =3D "git://github.com/seladb/PcapPlusPlus.git;protocol=3Dhttps;=
branch=3Dmaster"
> +
> +# cmake-ng branch
> +SRC_URI =3D " \
> +    git://github.com/clementperon/PcapPlusPlus.git;protocol=3Dhttps;bran=
ch=3Dcmake-ng \

Please don't use my fork, it's still under Dev and I 'push -f' in it freque=
ntly.

It should be ready in a couple weeks I hope.


> +    file://0001-Fix-timeval-to-timespec-conversions.patch \
> +    "
> +SRCREV =3D "1360d0ed91640daf90b3713a4574b8b369990bb3"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit cmake dos2unix
> +
> +# When 'zstd' is not selected, cmake findPackage() finds files from zstd=
-native.
> +# They are not used, but is there a way to avoid this?

Yes find_package(ZSTD) is always called even when ZSTD is not selected
I will fix this.

Thanks for the report,
Regards
Clement

> +PACKAGECONFIG ??=3D ""
> +PACKAGECONFIG[zstd] =3D "-DLIGHT_PCAPNG_ZSTD=3Dtrue,-DLIGHT_PCAPNG_ZSTD=
=3Dfalse,zstd"
> +
> +EXTRA_OECMAKE:append =3D " -DBUILD_SHARED_LIBS=3DON"
> +# get rid of "note: parameter passing for argument of type 'xxx' changed=
 in GCC 7.1"
> +CXXFLAGS:append =3D " -Wno-psabi"
> --
> 2.34.1
>

