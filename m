Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D71EEE810AD
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 08:48:48 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.13334.1695804521811851376
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Sep 2023 01:48:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K1uq5SEZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: peron.clem@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-50444e756deso13161171e87.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 01:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695804520; x=1696409320; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OEfQN6e6T8JzmJlYQga4XfSIE3rdfGK090anRrv8E9M=;
        b=K1uq5SEZsuJ+gMFJkV+bvyLZEHenA8QTSzw19/65ngnfy0xDySkksOkTw9I1Jwp3Xo
         2k8vJUAMMEUlk0sFay6gfTM84Jas/kucdMroccvR7RIiW7xHuZICj/++0TF7h3r2eQZ3
         GQbexAvuPfTuzy2Huk07eIqUbcZ7OeMuY2Q3ud+q5MZWIG51SNMxR9UwL2GyMBfNwmjo
         PrgAUkIy4hIb1aecnK9CIQK/onUHLGISoaNT3WV3xyKkhnCrjFgLOFHV/0usw9ZAPjFt
         91pKrdc6FCEqbzBy3//84EXSAfo5zjyzDfYTCaw4YjO7IaeSG6Wr6OBlg1/HB5h5uCWK
         dN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695804520; x=1696409320;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OEfQN6e6T8JzmJlYQga4XfSIE3rdfGK090anRrv8E9M=;
        b=XGI9luSI56IXZyi2EZH27aoTSyBm3LUwtaTPghDPHPv4r6JVwa8mhLyifojABjSbNx
         WaRQC2s7gA/E7GfcQepwIlnM1BSIzX57NAcJDdzVmVUJPIuFsPxADR2gkLjmPlEYK6Jg
         A4CIDQi+VHH/NkP3CAUazzXjEnHCy33R79gPCy8hee1fAnncESCyTSL5YTkn4tBkYiPz
         8BIok1FdmjBX2cxKELDkII7FTZvKKcVx2LRFc/xW6/yMs9czVhUtRlXKL6xKE2yxJdaU
         t4cTqKe+n2hhNHaicia0AQ60VzHewf/rtY2ZyrFJOBWGW29ISDW+z7nLOTk89HuP9npb
         ssFA==
X-Gm-Message-State: AOJu0Yx61dVBGpQ7v41sFIU+5RP6Bz6hzAF5TvEeQC3Rvj42KszoY2pc
	h223Vr1tpyVP3+xknvmcn6aFtRLXVdd5bJbuA6Dbghg2
X-Google-Smtp-Source: AGHT+IE4MrXSqzC240X6tcrBdOIhrF5LgEtuvV3yFjTjw7jP0W4g67mnXyhcH6TWRkiMoMyzEFq0PJDofzIcT0M6WfE=
X-Received: by 2002:ac2:4c31:0:b0:500:cb2b:8678 with SMTP id
 u17-20020ac24c31000000b00500cb2b8678mr1328426lfq.40.1695804519598; Wed, 27
 Sep 2023 01:48:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220221174242.17760-1-ceggers@arri.de>
In-Reply-To: <20220221174242.17760-1-ceggers@arri.de>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Wed, 27 Sep 2023 10:48:27 +0200
Message-ID: <CAJiuCcd8NnR97ARjOsB4JzDR1r1H7Ek+97L04co=WeCX+VVSnQ@mail.gmail.com>
Subject: Re: [meta-oe][RFC PATCH] pcapplusplus: add new recipe
To: Christian Eggers <ceggers@arri.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/mixed; boundary="00000000000000639606065342bb"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 08:48:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105185

--00000000000000639606065342bb
Content-Type: multipart/alternative; boundary="00000000000000639506065342b9"

--00000000000000639506065342b9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christian,



On Mon, 21 Feb 2022 at 18:43, Christian Eggers <ceggers@arri.de> wrote:

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
>

If you are still interested in adding PcapPlusPlus to openEmbedded we have
released a new version (23.09) with CMake support.

If you are no more interested let me know and I will propose a recipe.

Thanks,
Clement



> - change recipe to cmake
> - add patch for -Wnarrowing warnings/errors
>
> This is the 2nd attempt to move the build system of PcapPlusPlus to
> CMake. Currently there is a QA issue when trying to build a shared
> libraries.
>
> ...-Fix-timeval-to-timespec-conversions.patch | 58 +++++++++++++++++++
> .../pcapplusplus/pcapplusplus_21.11.bb | 38 ++++++++++++
> 2 files changed, 96 insertions(+)
> create mode 100644
> meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-Fix-timeval-t=
o-timespec-conversions.patch
> create mode 100644 meta-oe/recipes-connectivity/pcapplusplus/
> pcapplusplus_21.11.bb
>
> diff --git
> a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-Fix-timeval=
-to-timespec-conversions.patch
> b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-Fix-timeval=
-to-timespec-conversions.patch
> new file mode 100644
> index 000000000000..548a0f0ca0e2
> --- /dev/null
> +++
> b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-Fix-timeval=
-to-timespec-conversions.patch
> @@ -0,0 +1,58 @@
> +From 740971bb451e1147e19a1b0498436d2332b01293 Mon Sep 17 00:00:00 2001
> +
> _______________________________________________________
> Christian
> Eggers
> Software Engineer
> ARRI
> Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
> Arriweg 17 ,
> 83071
> Stephanskirchen
>
>
> *www.arri.com * <http://www.arri.com/>
> *+49 8036 3009-3118* <+49%208036%203009-3118>
> *CEggers@arri.de* <CEggers@arri.de>
>
> [image: Orbiter Docking Ring]
> <https://www.arri.com/en/lighting/led/orbiter-accessories/orbiter-docking=
ring/>
> Get all the latest information from *www.arri.com* <http://www.arri.com/>
> , *Facebook* <https://www.facebook.com/TeamARRI>, *Twitter*
> <https://twitter.com/ARRIChannel>, *Instagram* <http://instagram.com/arri=
>
>  and *YouTube* <http://www.youtube.com/user/ARRIChannel>.
>
> Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
>
> Sitz: M=C3=BCnchen =E2=80=91 Registergericht: Amtsgericht M=C3=BCnchen =
=E2=80=91 Handelsregisternummer: HRA 57918
> Pers=C3=B6nlich haftender Gesellschafter: Arnold & Richter Cine Technik G=
mbH
>
> Sitz: M=C3=BCnchen =E2=80=91 Registergericht: Amtsgericht M=C3=BCnchen =
=E2=80=91 Handelsregisternummer: HRB 54477
>
> Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Neuh=C3=A4user; Stephan Schenk; Wa=
lter Trauninger; Markus Zeiler
>
>
> From: Christian Eggers <ceggers@arri.de>
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
> +Upstream-Status: Submitted [
> https://github.com/seladb/PcapPlusPlus/pull/814]
> +
> +Signed-off-by: Christian Eggers <ceggers@arri.de>
> +---
> + Pcap++/src/NetworkUtils.cpp | 4 ++--
> + Pcap++/src/PcapFileDevice.cpp | 2 +-
> + 2 files changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/Pcap++/src/NetworkUtils.cpp b/Pcap++/src/NetworkUtils.cpp
> +index bdbf87f4c380..749853927ecd 100644
> +--- a/Pcap++/src/NetworkUtils.cpp
> ++++ b/Pcap++/src/NetworkUtils.cpp
> +@@ -169,7 +169,7 @@ MacAddress NetworkUtils::getMacAddress(IPv4Address
> ipAddr, PcapLiveDevice* devic
> + // create the timeout
> + timespec timeout =3D {
> + now.tv_sec + arpTimeout,
> +- now.tv_usec
> ++ static_cast<long>(now.tv_usec * 1000)
> + };
> +
> + // start capturing. The capture is done on another thread, hence
> "arpPacketRecieved" is running on that thread
> +@@ -436,7 +436,7 @@ IPv4Address NetworkUtils::getIPv4Address(std::string
> hostname, PcapLiveDevice* d
> + // create the timeout
> + timespec timeout =3D {
> + now.tv_sec + dnsTimeout,
> +- now.tv_usec
> ++ static_cast<long>(now.tv_usec * 1000)
> + };
> +
> + // start capturing. The capture is done on another thread, hence
> "dnsResponseRecieved" is running on that thread
> +diff --git a/Pcap++/src/PcapFileDevice.cpp b/Pcap++/src/PcapFileDevice.c=
pp
> +index 6bf04c1dd31a..256554407c50 100644
> +--- a/Pcap++/src/PcapFileDevice.cpp
> ++++ b/Pcap++/src/PcapFileDevice.cpp
> +@@ -188,7 +188,7 @@ bool PcapFileReaderDevice::getNextPacket(RawPacket&
> rawPacket)
> + uint8_t* pMyPacketData =3D new uint8_t[pkthdr.caplen];
> + memcpy(pMyPacketData, pPacketData, pkthdr.caplen);
> + #if defined(PCAP_TSTAMP_PRECISION_NANO)
> +- timespec ts =3D { pkthdr.ts.tv_sec, pkthdr.ts.tv_usec }; //because we
> opened with nano second precision 'tv_usec' is actually nanos
> ++ timespec ts =3D { pkthdr.ts.tv_sec, static_cast<long>(pkthdr.ts.tv_use=
c)
> }; //because we opened with nano second precision 'tv_usec' is actually
> nanos
> + #else
> + struct timeval ts =3D pkthdr.ts;
> + #endif
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-connectivity/pcapplusplus/
> pcapplusplus_21.11.bb b/meta-oe/recipes-connectivity/pcapplusplus/
> pcapplusplus_21.11.bb
> new file mode 100644
> index 000000000000..d7b88dfe2ef7
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_21.11.bb
> @@ -0,0 +1,38 @@
> +SUMMARY =3D "A multiplatform C++ library for capturing, parsing and
> crafting of network packets"
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
> +#SRC_URI =3D "git://
> github.com/seladb/PcapPlusPlus.git;protocol=3Dhttps;branch=3Dmaster"
> +
> +# cmake-ng branch
> +SRC_URI =3D " \
> + git://
> github.com/clementperon/PcapPlusPlus.git;protocol=3Dhttps;branch=3Dcmake-=
ng \
> + file://0001-Fix-timeval-to-timespec-conversions.patch \
> + "
> +SRCREV =3D "1525e592596a1f38470488cbacb0d10f2cde5603"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +# When 'zstd' is not selected, cmake findPackage() finds files from
> zstd-native.
> +# They are not used, but is there a way to avoid this?
> +PACKAGECONFIG ??=3D ""
> +PACKAGECONFIG[zstd] =3D
> "-DLIGHT_PCAPNG_ZSTD=3Dtrue,-DLIGHT_PCAPNG_ZSTD=3Dfalse,zstd"
> +
> +# ERROR: pcapplusplus-gitAUTOINC+1525e59259-r0 do_package_qa: QA Issue:
> +# -dev package pcapplusplus-dev contains non-symlink .so
> '/usr/lib/libpacket++.so'
> +# -dev package pcapplusplus-dev contains non-symlink .so
> '/usr/lib/libpcap++.so'
> +# -dev package pcapplusplus-dev contains non-symlink .so
> '/usr/lib/libcommon++.so' [dev-elf]
> +#EXTRA_OECMAKE:append =3D "-DBUILD_SHARED_LIBS=3Don"
> +
> +# main package is empty
> +ALLOW_EMPTY:${PN} =3D "1"
> --
> 2.34.1
>
>

--00000000000000639506065342b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:monospace">Hi Christian,</div><div class=3D"gmail_default" style=
=3D"font-family:monospace"><br></div><div class=3D"gmail_default" style=3D"=
font-family:monospace"><br></div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Mon, 21 Feb 2022 at 18:43, Christian Eg=
gers &lt;<a href=3D"mailto:ceggers@arri.de" target=3D"_blank">ceggers@arri.=
de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div><div>&quot;A multiplatform C++ library for capturing, parsing and cr=
afting of<br>network packets&quot;<br><br>PcapPlusPlus uses as custom build=
 system (shell script + Makefile).<br>There were attempts for using cmake b=
ut this work has never been<br>finished.<br><br>Signed-off-by: Christian Eg=
gers &lt;<a href=3D"mailto:ceggers@arri.de" target=3D"_blank">ceggers@arri.=
de</a>&gt;<br>---<br>v1 --&gt; RFC:<br>------------<br>- move to Cl=C3=A9me=
nt P=C3=A9ron&#39;s fork [branch: cmake-ng]<br></div></div></blockquote><di=
v><br></div><div><div class=3D"gmail_default" style=3D"font-family:monospac=
e">If you are still interested in adding PcapPlusPlus to openEmbedded we ha=
ve released a new version (23.09) with CMake support.</div><div class=3D"gm=
ail_default" style=3D"font-family:monospace"><br></div><div class=3D"gmail_=
default" style=3D"font-family:monospace">If you are no more interested let=
=C2=A0me know and I will propose a recipe.</div><div class=3D"gmail_default=
" style=3D"font-family:monospace"><br></div><div class=3D"gmail_default" st=
yle=3D"font-family:monospace">Thanks,</div><div class=3D"gmail_default" sty=
le=3D"font-family:monospace">Clement</div><br></div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex"><div><div>- change recipe to cm=
ake<br>- add patch for -Wnarrowing warnings/errors<br><br>This is the 2nd a=
ttempt to move the build system of PcapPlusPlus to<br>CMake. Currently ther=
e is a QA issue when trying to build a shared<br>libraries.<br><br> ...-Fix=
-timeval-to-timespec-conversions.patch | 58 +++++++++++++++++++<br> .../pca=
pplusplus/<a href=3D"http://pcapplusplus_21.11.bb" target=3D"_blank">pcappl=
usplus_21.11.bb</a>        | 38 ++++++++++++<br> 2 files changed, 96 insert=
ions(+)<br> create mode 100644 meta-oe/recipes-connectivity/pcapplusplus/pc=
applusplus/0001-Fix-timeval-to-timespec-conversions.patch<br> create mode 1=
00644 meta-oe/recipes-connectivity/pcapplusplus/<a href=3D"http://pcapplusp=
lus_21.11.bb" target=3D"_blank">pcapplusplus_21.11.bb</a><br><br>diff --git=
 a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-Fix-timeval-=
to-timespec-conversions.patch b/meta-oe/recipes-connectivity/pcapplusplus/p=
capplusplus/0001-Fix-timeval-to-timespec-conversions.patch<br>new file mode=
 100644<br>index 000000000000..548a0f0ca0e2<br>--- /dev/null<br>+++ b/meta-=
oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-Fix-timeval-to-times=
pec-conversions.patch<br>@@ -0,0 +1,58 @@<br>+From 740971bb451e1147e19a1b04=
98436d2332b01293 Mon Sep 17 00:00:00 2001<br>+<div dir=3D"ltr" style=3D"dir=
ection:ltr"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=
=3D"width:100%"><tbody><tr style=3D"font-size:0px"><td align=3D"left" style=
=3D"vertical-align:top"><table cellpadding=3D"0" cellspacing=3D"0" border=
=3D"0" style=3D"font-size:0px"><tbody><tr style=3D"font-size:0px"><td align=
=3D"left" style=3D"padding:0px;vertical-align:top"><table cellpadding=3D"0"=
 cellspacing=3D"0" border=3D"0" style=3D"width:100%;font-size:0px"><tbody><=
tr style=3D"font-size:14.67px;color:rgb(127,127,127);font-style:normal;font=
-weight:400;white-space:nowrap"><td align=3D"left" style=3D"vertical-align:=
top;font-family:Calibri,Arial,sans-serif">_________________________________=
______________________<span style=3D"font-family:remialcxesans;font-size:1p=
x;color:rgb(255,255,255);line-height:1px"></span></td></tr><tr style=3D"fon=
t-size:0px"><td align=3D"left" style=3D"vertical-align:top"><table cellpadd=
ing=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0px"><tbody><tr=
 style=3D"font-size:0px"><td align=3D"left" style=3D"vertical-align:top"><t=
able cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0p=
x;color:rgb(127,127,127);font-style:normal;font-weight:400;white-space:nowr=
ap"><tbody><tr style=3D"font-size:14.67px"><td align=3D"left" style=3D"vert=
ical-align:top;font-family:Calibri,Arial,sans-serif">Christian</td><td alig=
n=3D"left" style=3D"vertical-align:top;color:rgb(0,0,1);font-family:Calibri=
,Arial,sans-serif">=C2=A0<br></td><td align=3D"left" style=3D"vertical-alig=
n:top;font-family:Calibri,Arial,sans-serif">Eggers</td></tr></tbody></table=
></td></tr><tr style=3D"font-size:0px"><td align=3D"left" style=3D"vertical=
-align:top"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=
=3D"font-size:0px;color:rgb(127,127,127);font-style:normal;font-weight:400;=
white-space:nowrap"><tbody><tr style=3D"font-size:14.67px"><td align=3D"lef=
t" style=3D"vertical-align:top;font-family:Calibri,Arial,sans-serif">Softwa=
re=C2=A0Engineer</td></tr><tr style=3D"font-size:14.67px;color:rgb(0,0,1)">=
<td align=3D"left" style=3D"vertical-align:top;font-family:Calibri,Arial,sa=
ns-serif"></td></tr></tbody></table></td></tr></tbody></table></td></tr><tr=
 style=3D"font-size:0px"><td align=3D"left" style=3D"vertical-align:top"><t=
able cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0p=
x"><tbody><tr style=3D"font-size:0px"><td align=3D"left" style=3D"vertical-=
align:top"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D=
"font-size:0px;color:rgb(14,80,173);font-style:normal;font-weight:400;white=
-space:nowrap"><tbody><tr style=3D"font-size:13.33px"><td align=3D"left" st=
yle=3D"vertical-align:top;font-family:&quot;Arial Black&quot;">ARRI</td></t=
r><tr style=3D"font-size:10.67px;color:rgb(127,127,127)"><td align=3D"left"=
 style=3D"vertical-align:top;font-family:Arial"><span style=3D"font-size:11=
px">Arnold=C2=A0&amp;=C2=A0Richter=C2=A0Cine=C2=A0Technik=C2=A0GmbH=C2=A0&a=
mp;=C2=A0Co.=C2=A0Betriebs=C2=A0KG</span>=C2=A0<br></td></tr></tbody></tabl=
e></td></tr><tr style=3D"font-size:0px"><td align=3D"left" style=3D"vertica=
l-align:top"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=
=3D"font-size:0px;color:rgb(127,127,127);font-style:normal;font-weight:400;=
white-space:nowrap"><tbody><tr style=3D"font-size:10.67px"><td align=3D"lef=
t" style=3D"vertical-align:top;font-family:Arial">Arriweg=C2=A017</td><td a=
lign=3D"left" style=3D"vertical-align:top;font-family:Arial">,=C2=A0<br></t=
d><td align=3D"left" style=3D"vertical-align:middle;font-family:Arial">8307=
1</td><td align=3D"left" style=3D"vertical-align:middle;font-family:Arial">=
=C2=A0<br></td><td align=3D"left" style=3D"vertical-align:middle;font-famil=
y:Arial">Stephanskirchen</td></tr></tbody></table></td></tr></tbody></table=
></td></tr><tr style=3D"font-size:0px"><td align=3D"left" style=3D"vertical=
-align:top"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=
=3D"font-size:0px"><tbody><tr style=3D"font-size:0px"><td align=3D"left" st=
yle=3D"vertical-align:top"><table cellpadding=3D"0" cellspacing=3D"0" borde=
r=3D"0" style=3D"font-size:0px;color:rgb(21,50,185);font-style:normal;font-=
weight:400;white-space:nowrap"><tbody><tr style=3D"font-size:11px"><td alig=
n=3D"left" style=3D"vertical-align:top;font-family:Arial"><span style=3D"te=
xt-decoration:underline"><a href=3D"http://www.arri.com/" id=3D"m_505046196=
0622656914m_-5170287399297411972m_-2160900225383597984LPlnk689713" style=3D=
"text-decoration:underline;color:rgb(21,50,185)" target=3D"_blank"><strong =
style=3D"font-weight:400">www.arri.com=C2=A0<br><br></strong></a></span></t=
d></tr><tr style=3D"font-size:0px"><td align=3D"left" style=3D"vertical-ali=
gn:top"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"fo=
nt-size:0px;color:rgb(133,128,128);font-style:normal;font-weight:400;line-h=
eight:normal;white-space:nowrap"><tbody><tr style=3D"font-size:14.67px"><td=
 align=3D"left" style=3D"padding:0px;vertical-align:top;font-size:0px"><img=
 src=3D"cid:image133231.png@7C741948.2A15F35B" width=3D"20" border=3D"0" al=
t=3D"" style=3D"width:20px;min-width:20px;max-width:20px;font-size:0px"></t=
d><td align=3D"left" style=3D"padding:0px;vertical-align:top;font-family:Ca=
libri,Arial,sans-serif"><a href=3D"tel:+49%208036%203009-3118" id=3D"m_5050=
461960622656914m_-5170287399297411972m_-2160900225383597984LPlnk689713" sty=
le=3D"text-decoration:none;color:rgb(133,128,128)" target=3D"_blank"><stron=
g style=3D"font-weight:400">+49=C2=A08036=C2=A03009-3118</strong></a></td><=
/tr><tr style=3D"font-size:0px"><td align=3D"left" style=3D"padding:0px;ver=
tical-align:top"></td><td align=3D"left" style=3D"padding:0px;vertical-alig=
n:top"></td></tr><tr style=3D"font-size:0px"><td align=3D"left" style=3D"pa=
dding:0px;vertical-align:top"></td><td align=3D"left" style=3D"padding:0px;=
vertical-align:top"></td></tr><tr style=3D"font-size:14.67px"><td align=3D"=
left" style=3D"padding:0px;vertical-align:top;font-size:0px"><img src=3D"ci=
d:image118770.png@136ED042.90DC7691" width=3D"20" border=3D"0" alt=3D"" sty=
le=3D"width:20px;min-width:20px;max-width:20px;font-size:0px"></td><td alig=
n=3D"left" style=3D"padding:0px;vertical-align:top;font-family:Calibri,Aria=
l,sans-serif"><a href=3D"mailto:CEggers@arri.de" id=3D"m_505046196062265691=
4m_-5170287399297411972m_-2160900225383597984LPlnk689713" style=3D"text-dec=
oration:none;color:rgb(133,128,128)" target=3D"_blank"><strong style=3D"fon=
t-weight:400">CEggers@arri.de</strong></a></td></tr></tbody></table></td></=
tr></tbody></table></td></tr></tbody></table></td></tr><tr style=3D"font-si=
ze:14.67px;color:rgb(0,0,1);font-style:normal;font-weight:400;white-space:n=
owrap"><td align=3D"left" style=3D"vertical-align:top;font-family:Calibri,A=
rial,sans-serif"><br></td></tr></tbody></table></td></tr><tr style=3D"font-=
size:0px;line-height:normal"><td align=3D"left" style=3D"padding:0px;vertic=
al-align:top"><a href=3D"https://www.arri.com/en/lighting/led/orbiter-acces=
sories/orbiter-dockingring/" id=3D"m_5050461960622656914m_-5170287399297411=
972m_-2160900225383597984LPlnk689713" style=3D"text-decoration:none" target=
=3D"_blank"><img src=3D"https://assets.arri.com/media/sign/2022_Orbiter_Doc=
king-Ring_E-mail-Signature_650x95.jpg" border=3D"0" title=3D"Orbiter Dockin=
g Ring" alt=3D"Orbiter Docking Ring" style=3D"font-size:12px"></a></td></tr=
><tr style=3D"font-size:13px;color:rgb(127,127,127);font-style:normal;font-=
weight:400;white-space:nowrap"><td align=3D"left" style=3D"padding:0px;vert=
ical-align:top;font-family:Calibri,Arial,sans-serif">Get=C2=A0all=C2=A0the=
=C2=A0latest=C2=A0information=C2=A0from=C2=A0<span style=3D"text-decoration=
:underline"><a href=3D"http://www.arri.com/" id=3D"m_5050461960622656914m_-=
5170287399297411972m_-2160900225383597984LPlnk689713" title=3D"www.arri.com=
" style=3D"text-decoration:underline;color:rgb(127,127,127)" target=3D"_bla=
nk"><strong style=3D"font-weight:400">www.arri.com</strong></a></span>,=C2=
=A0<span style=3D"text-decoration:underline"><a href=3D"https://www.faceboo=
k.com/TeamARRI" id=3D"m_5050461960622656914m_-5170287399297411972m_-2160900=
225383597984LPlnk689713" style=3D"text-decoration:underline;color:rgb(127,1=
27,127)" target=3D"_blank"><strong style=3D"font-weight:400">Facebook</stro=
ng></a></span>,=C2=A0<span style=3D"text-decoration:underline"><a href=3D"h=
ttps://twitter.com/ARRIChannel" id=3D"m_5050461960622656914m_-5170287399297=
411972m_-2160900225383597984LPlnk689713" style=3D"text-decoration:underline=
;color:rgb(127,127,127)" target=3D"_blank"><strong style=3D"font-weight:400=
">Twitter</strong></a></span>,=C2=A0<span style=3D"text-decoration:underlin=
e"><a href=3D"http://instagram.com/arri" id=3D"m_5050461960622656914m_-5170=
287399297411972m_-2160900225383597984LPlnk689713" style=3D"text-decoration:=
underline;color:rgb(127,127,127)" target=3D"_blank"><strong style=3D"font-w=
eight:400">Instagram</strong></a></span>=C2=A0and=C2=A0<span style=3D"text-=
decoration:underline"><a href=3D"http://www.youtube.com/user/ARRIChannel" i=
d=3D"m_5050461960622656914m_-5170287399297411972m_-2160900225383597984LPlnk=
689713" style=3D"text-decoration:underline;color:rgb(127,127,127)" target=
=3D"_blank"><strong style=3D"font-weight:400">YouTube</strong></a></span>.<=
br></td></tr><tr style=3D"font-size:0px"><td align=3D"left" style=3D"paddin=
g:0px;vertical-align:top"><table cellpadding=3D"0" cellspacing=3D"0" border=
=3D"0" style=3D"font-size:0px;color:rgb(106,106,106);font-style:normal;font=
-weight:400;white-space:nowrap"><tbody><tr style=3D"font-size:10px"><td ali=
gn=3D"left" style=3D"vertical-align:top;font-family:Arial"><br>Arnold=C2=A0=
&amp;=C2=A0Richter=C2=A0Cine=C2=A0Technik=C2=A0GmbH=C2=A0&amp;=C2=A0Co.=C2=
=A0Betriebs=C2=A0KG<br>Sitz:=C2=A0M=C3=BCnchen=C2=A0=E2=80=91=C2=A0Register=
gericht:=C2=A0Amtsgericht=C2=A0M=C3=BCnchen=C2=A0=E2=80=91=C2=A0Handelsregi=
sternummer:=C2=A0HRA=C2=A057918<br>Pers=C3=B6nlich=C2=A0haftender=C2=A0Gese=
llschafter:=C2=A0Arnold=C2=A0&amp;=C2=A0Richter=C2=A0Cine=C2=A0Technik=C2=
=A0GmbH<br>Sitz:=C2=A0M=C3=BCnchen=C2=A0=E2=80=91=C2=A0Registergericht:=C2=
=A0Amtsgericht=C2=A0M=C3=BCnchen=C2=A0=E2=80=91=C2=A0Handelsregisternummer:=
=C2=A0HRB=C2=A054477<br>Gesch=C3=A4ftsf=C3=BChrer:=C2=A0Dr.=C2=A0Michael=C2=
=A0Neuh=C3=A4user;=C2=A0Stephan=C2=A0Schenk;=C2=A0Walter=C2=A0Trauninger;=
=C2=A0Markus=C2=A0Zeiler<br></td></tr><tr style=3D"font-size:14.67px;color:=
rgb(0,0,1)"><td align=3D"left" style=3D"vertical-align:top;font-family:Cali=
bri,Arial,sans-serif"><br><br></td></tr></tbody></table></td></tr></tbody><=
/table></td></tr></tbody></table></div>From: Christian Eggers &lt;<a href=
=3D"mailto:ceggers@arri.de" target=3D"_blank">ceggers@arri.de</a>&gt;<br>+D=
ate: Mon, 21 Feb 2022 13:53:49 +0100<br>+Subject: [PATCH] Fix timeval-to-ti=
mespec conversions<br>+<br>+Time values returned by gettimeofday() have mic=
roseconds in<br>+timeval::tv_usec while timespec::ts_nsec is nanoseconds.<b=
r>+<br>+timeval::tv_usec is 64 bit (at least on some platforms), while<br>+=
timespec::tv_nsec is always &#39;long&#39;. An explicit cast is required to=
<br>+avoid -Wnarrowing warnings/errors.<br>+<br>+Upstream-Status: Submitted=
 [<a href=3D"https://github.com/seladb/PcapPlusPlus/pull/814" target=3D"_bl=
ank">https://github.com/seladb/PcapPlusPlus/pull/814</a>]<br>+<br>+Signed-o=
ff-by: Christian Eggers &lt;<a href=3D"mailto:ceggers@arri.de" target=3D"_b=
lank">ceggers@arri.de</a>&gt;<br>+---<br>+ Pcap++/src/NetworkUtils.cpp   | =
4 ++--<br>+ Pcap++/src/PcapFileDevice.cpp | 2 +-<br>+ 2 files changed, 3 in=
sertions(+), 3 deletions(-)<br>+<br>+diff --git a/Pcap++/src/NetworkUtils.c=
pp b/Pcap++/src/NetworkUtils.cpp<br>+index bdbf87f4c380..749853927ecd 10064=
4<br>+--- a/Pcap++/src/NetworkUtils.cpp<br>++++ b/Pcap++/src/NetworkUtils.c=
pp<br>+@@ -169,7 +169,7 @@ MacAddress NetworkUtils::getMacAddress(IPv4Addre=
ss ipAddr, PcapLiveDevice* devic<br>+ 	// create the timeout
<br>+ 	timespec timeout =3D {
<br>+ 			now.tv_sec + arpTimeout,
<br>+-			now.tv_usec
<br>++			static_cast&lt;long&gt;(now.tv_usec * 1000)
<br>+ 	};
<br>+=20
<br>+ 	// start capturing. The capture is done on another thread, hence &qu=
ot;arpPacketRecieved&quot; is running on that thread
<br>+@@ -436,7 +436,7 @@ IPv4Address NetworkUtils::getIPv4Address(std::stri=
ng hostname, PcapLiveDevice* d<br>+ 	// create the timeout
<br>+ 	timespec timeout =3D {
<br>+ 			now.tv_sec + dnsTimeout,
<br>+-			now.tv_usec
<br>++			static_cast&lt;long&gt;(now.tv_usec * 1000)
<br>+ 	};
<br>+=20
<br>+ 	// start capturing. The capture is done on another thread, hence &qu=
ot;dnsResponseRecieved&quot; is running on that thread
<br>+diff --git a/Pcap++/src/PcapFileDevice.cpp b/Pcap++/src/PcapFileDevice=
.cpp<br>+index 6bf04c1dd31a..256554407c50 100644<br>+--- a/Pcap++/src/PcapF=
ileDevice.cpp<br>++++ b/Pcap++/src/PcapFileDevice.cpp<br>+@@ -188,7 +188,7 =
@@ bool PcapFileReaderDevice::getNextPacket(RawPacket&amp; rawPacket)<br>+ =
	uint8_t* pMyPacketData =3D new uint8_t[pkthdr.caplen];
<br>+ 	memcpy(pMyPacketData, pPacketData, pkthdr.caplen);
<br>+ #if defined(PCAP_TSTAMP_PRECISION_NANO)
<br>+-	timespec ts =3D { pkthdr.ts.tv_sec, pkthdr.ts.tv_usec }; //because w=
e opened with nano second precision &#39;tv_usec&#39; is actually nanos
<br>++	timespec ts =3D { pkthdr.ts.tv_sec, static_cast&lt;long&gt;(pkthdr.t=
s.tv_usec) }; //because we opened with nano second precision &#39;tv_usec&#=
39; is actually nanos
<br>+ #else
<br>+ 	struct timeval ts =3D pkthdr.ts;
<br>+ #endif
<br>+-- <br>+2.34.1<br>+<br>diff --git a/meta-oe/recipes-connectivity/pcapp=
lusplus/<a href=3D"http://pcapplusplus_21.11.bb" target=3D"_blank">pcapplus=
plus_21.11.bb</a> b/meta-oe/recipes-connectivity/pcapplusplus/<a href=3D"ht=
tp://pcapplusplus_21.11.bb" target=3D"_blank">pcapplusplus_21.11.bb</a><br>=
new file mode 100644<br>index 000000000000..d7b88dfe2ef7<br>--- /dev/null<b=
r>+++ b/meta-oe/recipes-connectivity/pcapplusplus/<a href=3D"http://pcapplu=
splus_21.11.bb" target=3D"_blank">pcapplusplus_21.11.bb</a><br>@@ -0,0 +1,3=
8 @@<br>+SUMMARY =3D &quot;A multiplatform C++ library for capturing, parsi=
ng and crafting of network packets&quot;<br>+HOMEPAGE =3D &quot;<a href=3D"=
https://pcapplusplus.github.io/" target=3D"_blank">https://pcapplusplus.git=
hub.io/</a>&quot;<br>+BUGTRACKER =3D &quot;<a href=3D"https://github.com/se=
ladb/PcapPlusPlus/issues" target=3D"_blank">https://github.com/seladb/PcapP=
lusPlus/issues</a>&quot;<br>+SECTION =3D &quot;libs/network&quot;<br>+LICEN=
SE =3D &quot;Unlicense&quot;<br>+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;=
md5=3D911690f51af322440237a253d695d19f&quot;<br>+<br>+DEPENDS =3D &quot;lib=
pcap&quot;<br>+<br>+PV =3D &quot;git${SRCPV}&quot;<br>+<br>+# master branch=
 with hand-crafted build system<br>+#SRC_URI =3D &quot;git://<a href=3D"htt=
p://github.com/seladb/PcapPlusPlus.git;protocol=3Dhttps;branch=3Dmaster" ta=
rget=3D"_blank">github.com/seladb/PcapPlusPlus.git;protocol=3Dhttps;branch=
=3Dmaster</a>&quot;<br>+<br>+# cmake-ng branch<br>+SRC_URI =3D &quot; \<br>=
+    git://<a href=3D"http://github.com/clementperon/PcapPlusPlus.git;proto=
col=3Dhttps;branch=3Dcmake-ng" target=3D"_blank">github.com/clementperon/Pc=
apPlusPlus.git;protocol=3Dhttps;branch=3Dcmake-ng</a> \<br>+    file://0001=
-Fix-timeval-to-timespec-conversions.patch \<br>+    &quot;<br>+SRCREV =3D =
&quot;1525e592596a1f38470488cbacb0d10f2cde5603&quot;<br>+<br>+S =3D &quot;$=
{WORKDIR}/git&quot;<br>+<br>+inherit cmake<br>+<br>+# When &#39;zstd&#39; i=
s not selected, cmake findPackage() finds files from zstd-native.<br>+# The=
y are not used, but is there a way to avoid this?<br>+PACKAGECONFIG ??=3D &=
quot;&quot;<br>+PACKAGECONFIG[zstd] =3D &quot;-DLIGHT_PCAPNG_ZSTD=3Dtrue,-D=
LIGHT_PCAPNG_ZSTD=3Dfalse,zstd&quot;<br>+<br>+# ERROR: pcapplusplus-gitAUTO=
INC+1525e59259-r0 do_package_qa: QA Issue:<br>+# -dev package pcapplusplus-=
dev contains non-symlink .so &#39;/usr/lib/libpacket++.so&#39;<br>+# -dev p=
ackage pcapplusplus-dev contains non-symlink .so &#39;/usr/lib/libpcap++.so=
&#39;<br>+# -dev package pcapplusplus-dev contains non-symlink .so &#39;/us=
r/lib/libcommon++.so&#39; [dev-elf]<br>+#EXTRA_OECMAKE:append =3D &quot;-DB=
UILD_SHARED_LIBS=3Don&quot;<br>+<br>+# main package is empty<br>+ALLOW_EMPT=
Y:${PN} =3D &quot;1&quot;<br>-- <br>2.34.1<br><br></div></div></blockquote>=
</div></div>

--00000000000000639506065342b9--

--00000000000000639606065342bb
Content-Type: image/png; name="image133231.png"
Content-Disposition: attachment; filename="image133231.png"
Content-Transfer-Encoding: base64
Content-ID: <18ad5d1a16ce91b7d751>
X-Attachment-Id: 18ad5d1a16ce91b7d751

iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAGlSURBVDhP1ZOxSgNBEIZ3o6QSSWGRwiJFCl9A
iCDEIqKFgo2FYGHjA1hYRZ0sGrURgq0WgkoqEUHQShJMYWFhmcLCwsIHsJBEs/5zmTvvJIE9sPGD
Zf7Zu/tvdndW/TVaogcRDSWVKlilMhvGVGQ6FoEhzAaTWt9AFji31q7C9Jh1HBISFSpbQPDMGK31
NlcsqTOBIRxmRPmkUTGJdubHUKmsxDA5ic6EDV8k+jRa1i6KdiYw/LL2QiTzDrNpY8yb5M4EhlvG
XKNdniXl9pkTHYvwkrlXDkTxIR3tEWUkcyZi2FbqBOGxm6lUR+tT7k/JnYgYYs8+sHfzkP7eTaJ1
LmGaktyjTDSGsSxphMjV89khyqGx7yG96rC3r7g5S5vGNHaJsrb7LI3RwPw6btQDv8f0NGRwTWYT
Wlch/eo+Mc5gPoWPfu9tpVgqrbGIHkoIVHOLQ5qAQVOmuNqVHma8guDK9jVkisY029aOQ/JhcYU9
wbLPRaoBiX2p1+utu1rtqpDPV9FKHVQziiqH5fETzMr40yHe68hcfPaJRnHyI5L+K5T6BsZ9gKi6
xb3hAAAAAElFTkSuQmCC
--00000000000000639606065342bb
Content-Type: image/png; name="image118770.png"
Content-Disposition: attachment; filename="image118770.png"
Content-Transfer-Encoding: base64
Content-ID: <18ad5d1a16cd73cf30e2>
X-Attachment-Id: 18ad5d1a16cd73cf30e2

iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAALNSURBVDhPtZQ/SNVRFMfv1Z/S4PCGBoeg1Uih
oaFB8j1wMGgweBJBgUNRUQ2BQaH2e79SaKipwcGhlkioQEiooT++7RUOBkYODg0GgiIOLyi1bp/v
/d3fL8U31hfuO/ec3z3nfM895z7zr2GDbIg4jgutxvQ6Yw5IRy5uGzOfJMmKP9AADQMSaH+LtQ/5
WEaNUutfEHj5t3OXbyfJTDDl2BNwPI7LxtoJthFOD5A1WM0hf7QY04FDB98vohdZjzeduwbjOnuP
piA9QrBnMJjl4KHRJBmD3hJlF5HdW8Z8HU6SqeFKpeScu4BLmUoepd4pcoYqs9XaLwo2UqkMoEfo
YjrIysreNs6dI+kk515b516wf4ptgETPdSBnqDtDRFuUIJ1g0s/jOE3pJ7TQZ30AY9pg4tmyn8E2
AYE29mlmdVMNwInrSFbG4vgq5kvY7lHeLZ0ROFcj0SrbCFYfZNM9N1n7XveLOucZajQQCl6TTsYr
MFv66dyo1wNItoFQg4QF/dAwL0GnfnxAnP2cqZu6S3WSD1MEwLQbnFVpdcpdlM6ZNcSatfaw9Cyg
2Ml5G7bd3ubcJ8md0D2RTEzmU0uOPLEPyM8yIiLqEYIXZMtY7wTJhsI2K1tJ2hHtEPgs3QfcVPdS
HGP5UijhtGSGO3F8EuOw9pmzGNOkSbYbkHkjGxWkGK9UXsGqk7Hp4tBLTN3oU2RcQvahH0VO49DP
XgxF4iyr8Is5zJ6hZyg08TY5XCDY3WbnzgTnMnKEz5FeBgN/ijG5gW1fSKLh7tr5pnOGguaPUjXQ
93l6GhlddlsYl13gmfZzVTXNbTB5NAfp8a5a/Vjq6flO0JsM6yD3sspaf1utruu77qy3WDzeWyo9
4T6HKO8bPunsBuximIHs+kfRo1eThA1KrHM46/w8pV/nzyNrZo6GATNwBRqjPtgeRK2H7i6MJEk+
Nv8ZxvwBPgIhrepF7fMAAAAASUVORK5CYII=
--00000000000000639606065342bb--

