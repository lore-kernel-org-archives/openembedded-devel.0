Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DF17C433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 17:21:28 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web12.10622.1645636887547014688
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 09:21:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Zg04NNB6;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id j11so9742469qvy.0
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 09:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OeMBkE/kfJlFLukEWyLSudie4OjgAS/GY3sCh5ZGDQQ=;
        b=Zg04NNB622RPdZHW9nWwbnGO8fkQsPmPwdIXZdFeUmSSTVcri5/51ZDiPNV4GCx4yf
         gOjx3T/ky4hDP+N48BucNreDd0n82L6/nw2lKAdyfVEyyV8l62O2lNSwVQ7IFl0gYZly
         NHB454Rgswm+wazr/MnasEWD2MXGUwi0tDRVGxRmm+wOsHA0wsy2bf1YWmyv1qd5PCkU
         FBUMyZlqGHwQvWRvSSEA+iyDByZbGAAnLV/3M/XSih3WJOTmQSjstIEAsSmFqbaj7mN3
         C4tjBbrCK2evcypCZCxXEqey81/O6F3870ayZOf4dX9Av7YA1TEMBjk8npXs0z2CyZNT
         x/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OeMBkE/kfJlFLukEWyLSudie4OjgAS/GY3sCh5ZGDQQ=;
        b=MqIHc0FkH/u0ZajUrA/Iy5dnDv+QRgbR9nYfPw1yQDjBao8SntuBuAbNv+hDoAUEtn
         K4qSLjX+upGi0FzFWTcw1ZpsgNbbbncMSX8uh75GkS0Qs767gAMomOKXV3vTsH8N6QUi
         vkENqHxw/nlN2TDkFkHL3lTixj02gLutmpHHcTGd8fUGk3tp38x+3jvJN3aOEjE3bTzE
         0srHVNzbw3mIXlvetW9E+IdufIYQ1ThqV2Duon47WdTPo+RAdGHf4/MXc+a5Zm3NteX2
         dMNOsob90eoqN7Woqu6CpejGRahwew+wuIHQPU6d6hJK93Y3RgrIrr5ekQjZBE/aTVOL
         Sv1Q==
X-Gm-Message-State: AOAM533czIOYXrpHuswEp67u9L+NysajiZDRR/FQMMqibjxIRnHScsZr
	qnGRSAx8dPhq52ww14KhwkdRFLLanEZ4yScP0Jc=
X-Google-Smtp-Source: 
 ABdhPJyL1dNb72Kw2fW3RtVfL7qALSFFa5qoq7a3YJm0Ecu8HSNGQYnF2fB7lkJFC5b4xueEePgB4iND3eQErM+JnL0=
X-Received: by 2002:a05:6214:b6b:b0:42c:a44:6b72 with SMTP id
 ey11-20020a0562140b6b00b0042c0a446b72mr668246qvb.24.1645636886441; Wed, 23
 Feb 2022 09:21:26 -0800 (PST)
MIME-Version: 1.0
References: <20220222064130.17190-1-ceggers@arri.de>
In-Reply-To: <20220222064130.17190-1-ceggers@arri.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Feb 2022 09:21:00 -0800
Message-ID: 
 <CAMKF1srreo8BKes+3DDnJWjkmu-ZdGqFKeGF7_x3dxUj08xrJQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH RFC] pcapplusplus: add new recipe
To: Christian Eggers <ceggers@arri.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	=?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Feb 2022 17:21:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95483

https://errors.yoctoproject.org/Errors/Details/636127/

On Mon, Feb 21, 2022 at 10:41 PM Christian Eggers <ceggers@arri.de> wrote:
>
> "A multiplatform C++ library for capturing, parsing and crafting of
> network packets"
>
> PcapPlusPlus uses as custom build system (shell script + Makefile).
> There were attempts for using cmake but this work has never been
> finished.
>
> Signed-off-by: Christian Eggers <ceggers@arri.de>
> ---
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
>
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
> index 000000000000..548a0f0ca0e2
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
> +Upstream-Status: Submitted [https://github.com/seladb/PcapPlusPlus/pull/=
814]
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
> index 000000000000..c9cf5adb974f
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
> +    file://0001-Fix-timeval-to-timespec-conversions.patch \
> +    "
> +SRCREV =3D "1360d0ed91640daf90b3713a4574b8b369990bb3"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +# When 'zstd' is not selected, cmake findPackage() finds files from zstd=
-native.
> +# They are not used, but is there a way to avoid this?
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
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95439): https://lists.openembedded.org/g/openembedded=
-devel/message/95439
> Mute This Topic: https://lists.openembedded.org/mt/89312067/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

