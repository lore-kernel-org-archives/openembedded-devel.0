Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id A1D5672207
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 May 2015 07:55:00 +0000 (UTC)
Received: by wicmx19 with SMTP id mx19so41811012wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 May 2015 00:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=CLYf3J8VL1UgiGhuHdph8tKHBtFz91RscnVAPMC+UJs=;
	b=dtM5t6F8T93WYW7JlQPQTUnO7L/tvgW4J0GSHxFdqfHvBS6rCBjolUqyFtxq8Gky5m
	Q9gi7ZVVxkeW4B6RHDacaSmHg4vWeBQ7ZWmfpD7a/wfdTahUu4dN1KwEpNQvJeMzB9RV
	cTS2+d1dTyDluVKCqb+Knoau36m48HQe77Ldepi1grHjqXHl69ixZjk1jVJ1RZFDQFZN
	TsaCoZQZw4h9ydH2mrP9RCSA3Z9yk+ejPw7qNPGULu7HDta2Ki2Q8JdK0eTybQwZKiVH
	WOiH2GuUqK9Xg1w+VPvAIij+wuZ/z1iAfraJ6SUeFUEGEHV7XqCnLEHS1AwEEFDd+oSA
	PGbw==
X-Received: by 10.180.99.39 with SMTP id en7mr11741574wib.31.1431849300444;
	Sun, 17 May 2015 00:55:00 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	xb3sm10814905wjc.38.2015.05.17.00.54.58
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 May 2015 00:54:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 17 May 2015 09:55:25 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150517075525.GB9407@jama>
References: <1431721640-6515-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1431721640-6515-1-git-send-email-akuster808@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH] whireshark: update to 12.5
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 17 May 2015 07:55:05 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2015 at 01:27:20PM -0700, Armin Kuster wrote:
> fixed broken url and cleaned up the PACKAGECONFIG
> removed patch as it is included in this release
> update SECTION name
>=20
> The following vulnerabilities have been fixed.
> * [1]wnpa-sec-2015-12
> The LBMR dissector could go into an infinite loop. ([2]Bug 11036)
> [3]CVE-2015-3808 [4]CVE-2015-3809
>=20
> * [5]wnpa-sec-2015-13
> The WebSocket dissector could recurse excessively. ([6]Bug 10989)
> [7]CVE-2015-3810
>=20
> * [8]wnpa-sec-2015-14
> The WCP dissector could crash while decompressing data. ([9]Bug
> 10978) [10]CVE-2015-3811
>=20
> * [11]wnpa-sec-2015-15
> The X11 dissector could leak memory. ([12]Bug 11088)
> [13]CVE-2015-3812
>=20
> * [14]wnpa-sec-2015-16
> The packet reassembly code could leak memory. ([15]Bug 11129)
> [16]CVE-2015-3813
>=20
> * [17]wnpa-sec-2015-17
> The IEEE 802.11 dissector could go into an infinite loop. ([18]Bug
> 11110) [19]CVE-2015-3814
>=20
> * [20]wnpa-sec-2015-18
> The Android Logcat file parser could crash. Discovered by Hanno
> B=F6ck. ([21]Bug 11188) [22]CVE-2015-3815
>=20
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../{wireshark_1.12.4.bb =3D> wireshark_1.12.5.bb}   | 26 ++++++++++----=
--------
>  1 file changed, 12 insertions(+), 14 deletions(-)
>  rename meta-networking/recipes-support/wireshark/{wireshark_1.12.4.bb =
=3D> wireshark_1.12.5.bb} (65%)
>=20
> diff --git a/meta-networking/recipes-support/wireshark/wireshark_1.12.4.b=
b b/meta-networking/recipes-support/wireshark/wireshark_1.12.5.bb
> similarity index 65%
> rename from meta-networking/recipes-support/wireshark/wireshark_1.12.4.bb
> rename to meta-networking/recipes-support/wireshark/wireshark_1.12.5.bb
> index 6833216..21a7ce9 100644
> --- a/meta-networking/recipes-support/wireshark/wireshark_1.12.4.bb
> +++ b/meta-networking/recipes-support/wireshark/wireshark_1.12.5.bb
> @@ -1,20 +1,17 @@
>  DESCRIPTION =3D "wireshark - a popular network protocol analyzer"
>  HOMEPAGE =3D "http://www.wireshark.org"
> -SECTION =3D "network"
> +SECTION =3D "net"
>  LICENSE =3D "GPL-2.0"
>  LIC_FILES_CHKSUM =3D "file://README.linux;md5=3D631e077455b7972172eb1491=
95e065b0"
> =20
>  DEPENDS =3D "perl-native pcre expat glib-2.0 sbc"
> =20
> -SRC_URI =3D " \
> -    http://wiresharkdownloads.riverbed.com/wireshark/src/wireshark-${PV}=
=2Etar.bz2 \
> -    file://Do-not-set-CC_FOR_BUILD-flags.patch \
> -"
> +SRC_URI =3D "https://2.na.dl.wireshark.org/src/wireshark-${PV}.tar.bz2"
> =20
>  PE =3D "1"
> =20
> -SRC_URI[md5sum] =3D "acfa156fd35cb66c867b1ace992e4b5b"
> -SRC_URI[sha256sum] =3D "de804e98e252e4b795d28d6ac2d48d7f5aacd9b046ee44d4=
4266983795ebc312"
> +SRC_URI[md5sum] =3D "9ee199dde4f36a3d71f7b81dd6764e93"
> +SRC_URI[sha256sum] =3D "d0f177b2ef49e4deae4ff7d3299bdd295ba558a3934ce8ae=
489b2f13927cbd82"
> =20
>  inherit autotools pkgconfig
> =20
> @@ -23,14 +20,15 @@ ARM_INSTRUCTION_SET =3D "arm"
>  # Works with either gtk+ or gtk3.
>  WHICH_GTK =3D "gtk3"
> =20
> -PACKAGECONFIG ??=3D "libcap gnutls libnl"
> +PACKAGECONFIG ?=3D "libpcap gnutls libnl libcap"
>  PACKAGECONFIG +=3D " ${@bb.utils.contains("DISTRO_FEATURES", "x11", "${W=
HICH_GTK}  graphics", "", d)}"
>  PACKAGECONFIG +=3D " ${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ip=
v6", "", d)}"
> =20
> -PACKAGECONFIG[libcap] =3D "--with-libcap=3D${STAGING_DIR_HOST}, --with-l=
ibcap=3Dno, libcap"
> -PACKAGECONFIG[libsmi] =3D "--with-libsmi=3Dyes, --with-libsmi=3Dno, libs=
mi"
> -PACKAGECONFIG[libnl] =3D "--with-libnl=3Dyes, --with-libnl=3Dno, libnl"
> -PACKAGECONFIG[portaudio] =3D "--with-portaudio=3Dyes, --with-portaudio=
=3Dno, portaudio-v19"
> +PACKAGECONFIG[libcap] =3D " --with-libcap=3D${STAGING_LIBDIR}, --with-li=
bcap=3Dno --enable-pcap-ng-default , libcap"
> +PACKAGECONFIG[libpcap] =3D " --with-pcap=3D${STAGING_LIBDIR} --with-pcap=
-remote, --with-pcap=3Dno --enable-pcap-ng-default  , libpcap"
> +PACKAGECONFIG[libsmi] =3D " --with-libsmi=3Dyes, --with-libsmi=3Dno, lib=
smi"
> +PACKAGECONFIG[libnl] =3D " --with-libnl=3Dyes, --with-libnl=3Dno, libnl"
> +PACKAGECONFIG[portaudio] =3D " --with-portaudio=3Dyes, --with-portaudio=
=3Dno, portaudio-v19"

Why do you add leading space before first --with?

>  PACKAGECONFIG[gtk2] =3D "--with-gtk2=3Dyes, --with-gtk2=3Dno, gtk+"
>  PACKAGECONFIG[gtk3] =3D "--with-gtk3=3Dyes, --with-gtk3=3Dno, gtk+3"
>  PACKAGECONFIG[graphics] =3D "--enable-wireshark, --disable-wireshark,"
> @@ -39,14 +37,14 @@ PACKAGECONFIG[gnutls] =3D "--with-gnutls=3Dyes, --wit=
h-gnutls=3Dno, gnutls"
>  PACKAGECONFIG[gcrypt] =3D "--with-gcrypt=3Dyes, --with-gcrypt=3Dno, libg=
crypt"
>  PACKAGECONFIG[krb5] =3D "--with-krb5=3Dyes, --with-krb5=3Dno, krb5"
>  PACKAGECONFIG[lua] =3D "--with-lua=3Dyes, --with-lua=3Dno, lua"
> -PACKAGECONFIG[zlib] =3D "--with-zlib=3Dyes, --with-zlib=3Dno, zlib"
> +PACKAGECONFIG[zlib] =3D " -with-zlib=3Dyes, --with-zlib=3Dno, zlib"

This doesn't look correct

I've removed leading spaces before --with and added - here when
cherry-picking to master-next (if you agree you don't need to resend).

>  PACKAGECONFIG[geoip] =3D "--with-geoip=3Dyes, --with-geoip=3Dno, geoip"
> =20
>  # these next two options require addional layers
>  PACKAGECONFIG[adns] =3D "--with-adns=3Dyes, --with-adns=3Dno, adns"
>  PACKAGECONFIG[c-ares] =3D "--with-c-ares=3Dyes, --with-c-ares=3Dno, c-ar=
es"
> =20
> -EXTRA_OECONF +=3D "--with-qt=3Dno --enable-usr-local=3Dno --enable-tshar=
k --with-pcap=3Dno --enable-pcap-ng-default"
> +EXTRA_OECONF +=3D "--with-qt=3Dno --enable-usr-local=3Dno --enable-tshar=
k --enable-rawshark"
> =20
>  do_configure_prepend() {
>      # force to use fallback=20
> --=20
> 2.3.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

