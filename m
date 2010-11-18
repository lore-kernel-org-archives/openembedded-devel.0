Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PJ9gJ-00065W-10
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Nov 2010 19:58:06 +0100
Received: by pxi17 with SMTP id 17so894751pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Nov 2010 10:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=zAx7TcozNrgKNSFl32/uPwXoFlV1gZ3V1MjQMZcFhKE=;
	b=qyAeSB5L+ZCt+qm5IJ1w92x2o17M5luIslUr5O3t9D7gE3PDCmgfk/f231AoYcNRQx
	rNWEF2p96isreoN755Vwbdu0kRW7r8V0G+U7Uk9AI8fARD7Fc1v3aoiRcq6SQ4hJNbi7
	R/EJWOxmSMj0Te5p8SddvPhi9teJiuD0RGZSk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=AVteJS6WzF20FMT/K2XbsZMtpP1eLwDaZoJp0ORsWPo5E1XfWwLJjtCVDjkx9oPtFZ
	Cb4K+4Uisns8Cjt9wVqpfFVBAj5TB629QV1P2WVRvlzZx5WhnpN56MK9+8nhC3beWW0K
	WeaYj91ZRY5phZdB8AUQdcJaLC46Es9LCgp68=
Received: by 10.42.177.136 with SMTP id bi8mr658468icb.97.1290106612189; Thu,
	18 Nov 2010 10:56:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Thu, 18 Nov 2010 10:56:31 -0800 (PST)
In-Reply-To: <1290106426-5974-1-git-send-email-khimov@altell.ru>
References: <1290106426-5974-1-git-send-email-khimov@altell.ru>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 18 Nov 2010 10:56:31 -0800
Message-ID: <AANLkTi=_F7unVBoztZs_WUwmKxzFKc_97KreAzksOvx2@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] openssl: update 1.0.0a to 1.0.0b
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Nov 2010 18:58:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 18, 2010 at 10:53 AM, Roman I Khimov <khimov@altell.ru> wrote:
> =C2=A0* fixes CVE-2010-3864
> =C2=A0* considered as safe upgrade
>
> Signed-off-by: Roman I Khimov <khimov@altell.ru>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0.../include/angstrom-2008-preferred-versions.inc =C2=A0 | =C2=A0 =
=C2=A04 +-
> =C2=A0.../include/angstrom-2010-preferred-versions.inc =C2=A0 | =C2=A0 =
=C2=A04 +-
> =C2=A0conf/distro/include/preferred-shr-versions.inc =C2=A0 =C2=A0 | =C2=
=A0 =C2=A04 +-
> =C2=A0.../openssl/openssl-1.0.0a/configure-targets.patch | =C2=A0 25 -
> =C2=A0recipes/openssl/openssl-1.0.0a/debian.patch =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0515 --------------------
> =C2=A0.../engines-install-in-libdir-ssl.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 53 --
> =C2=A0recipes/openssl/openssl-1.0.0a/libdeps-first.patch | =C2=A0 27 -
> =C2=A0recipes/openssl/openssl-1.0.0a/oe-ldflags.patch =C2=A0 =C2=A0| =C2=
=A0 22 -
> =C2=A0...ssl-fix-ssl3_get_key_exchange-double-free.patch | =C2=A0 12 -
> =C2=A0recipes/openssl/openssl-1.0.0a/shared-libs.patch =C2=A0 | =C2=A0 48=
 --
> =C2=A0.../openssl/openssl-1.0.0b/configure-targets.patch | =C2=A0 25 +
> =C2=A0recipes/openssl/openssl-1.0.0b/debian.patch =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0515 ++++++++++++++++++++
> =C2=A0.../engines-install-in-libdir-ssl.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 53 ++
> =C2=A0recipes/openssl/openssl-1.0.0b/libdeps-first.patch | =C2=A0 27 +
> =C2=A0recipes/openssl/openssl-1.0.0b/oe-ldflags.patch =C2=A0 =C2=A0| =C2=
=A0 22 +
> =C2=A0recipes/openssl/openssl-1.0.0b/shared-libs.patch =C2=A0 | =C2=A0 48=
 ++
> =C2=A0recipes/openssl/openssl-native_1.0.0a.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 27 -
> =C2=A0recipes/openssl/openssl-native_1.0.0b.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 27 +
> =C2=A0recipes/openssl/openssl_1.0.0a.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 31 --
> =C2=A0recipes/openssl/openssl_1.0.0b.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 30 ++
> =C2=A020 files changed, 753 insertions(+), 766 deletions(-)
> =C2=A0delete mode 100644 recipes/openssl/openssl-1.0.0a/configure-targets=
.patch
> =C2=A0delete mode 100644 recipes/openssl/openssl-1.0.0a/debian.patch
> =C2=A0delete mode 100644 recipes/openssl/openssl-1.0.0a/engines-install-i=
n-libdir-ssl.patch
> =C2=A0delete mode 100644 recipes/openssl/openssl-1.0.0a/libdeps-first.pat=
ch
> =C2=A0delete mode 100644 recipes/openssl/openssl-1.0.0a/oe-ldflags.patch
> =C2=A0delete mode 100644 recipes/openssl/openssl-1.0.0a/openssl-fix-ssl3_=
get_key_exchange-double-free.patch
> =C2=A0delete mode 100644 recipes/openssl/openssl-1.0.0a/shared-libs.patch
> =C2=A0create mode 100644 recipes/openssl/openssl-1.0.0b/configure-targets=
.patch
> =C2=A0create mode 100644 recipes/openssl/openssl-1.0.0b/debian.patch
> =C2=A0create mode 100644 recipes/openssl/openssl-1.0.0b/engines-install-i=
n-libdir-ssl.patch
> =C2=A0create mode 100644 recipes/openssl/openssl-1.0.0b/libdeps-first.pat=
ch
> =C2=A0create mode 100644 recipes/openssl/openssl-1.0.0b/oe-ldflags.patch
> =C2=A0create mode 100644 recipes/openssl/openssl-1.0.0b/shared-libs.patch
> =C2=A0delete mode 100644 recipes/openssl/openssl-native_1.0.0a.bb
> =C2=A0create mode 100644 recipes/openssl/openssl-native_1.0.0b.bb
> =C2=A0delete mode 100644 recipes/openssl/openssl_1.0.0a.bb
> =C2=A0create mode 100644 recipes/openssl/openssl_1.0.0b.bb
>
> diff --git a/conf/distro/include/angstrom-2008-preferred-versions.inc b/c=
onf/distro/include/angstrom-2008-preferred-versions.inc
> index fc86eef..f79e48b 100644
> --- a/conf/distro/include/angstrom-2008-preferred-versions.inc
> +++ b/conf/distro/include/angstrom-2008-preferred-versions.inc
> @@ -37,8 +37,8 @@ PREFERRED_VERSION_mythtv =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 "0.22"
> =C2=A0PREFERRED_VERSION_mplayer =C2=A0 =C2=A0 =C2=A0 =3D "0.0+1.0rc3+svnr=
30165"
> =C2=A0PREFERRED_VERSION_network-manager-applet =3D "0.8.1"
> =C2=A0PREFERRED_VERSION_networkmanager =3D "0.8.1"
> -PREFERRED_VERSION_openssl =3D "1.0.0a"
> -PREFERRED_VERSION_openssl-native =3D "1.0.0a"
> +PREFERRED_VERSION_openssl =3D "1.0.0b"
> +PREFERRED_VERSION_openssl-native =3D "1.0.0b"
> =C2=A0PREFERRED_VERSION_pango =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "1.24.4"
> =C2=A0PREFERRED_VERSION_pango-native =C2=A0 =C2=A0 =3D "1.24.4"
> =C2=A0#PREFERRED_VERSION_pixman =C2=A0 =C2=A0 =C2=A0=3D "0.13.2"
> diff --git a/conf/distro/include/angstrom-2010-preferred-versions.inc b/c=
onf/distro/include/angstrom-2010-preferred-versions.inc
> index 36b26b1..12ee900 100644
> --- a/conf/distro/include/angstrom-2010-preferred-versions.inc
> +++ b/conf/distro/include/angstrom-2010-preferred-versions.inc
> @@ -45,8 +45,8 @@ PREFERRED_VERSION_mplayer =C2=A0 =C2=A0 =C2=A0 =3D "0.0=
+1.0rc3+svnr30165"
> =C2=A0PREFERRED_VERSION_network-manager-applet =3D "0.8.1"
> =C2=A0PREFERRED_VERSION_networkmanager =3D "0.8.1"
> =C2=A0PREFERRED_VERSION_networkmanager-openvpn =3D "0.8.1"
> -PREFERRED_VERSION_openssl =3D "1.0.0a"
> -PREFERRED_VERSION_openssl-native =3D "1.0.0a"
> +PREFERRED_VERSION_openssl =3D "1.0.0b"
> +PREFERRED_VERSION_openssl-native =3D "1.0.0b"
> =C2=A0PREFERRED_VERSION_pango =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "1.28.3"
> =C2=A0PREFERRED_VERSION_pango-native =C2=A0 =C2=A0 =3D "1.28.3"
> =C2=A0PREFERRED_VERSION_perl =3D "5.10.1"
> diff --git a/conf/distro/include/preferred-shr-versions.inc b/conf/distro=
/include/preferred-shr-versions.inc
> index 8089d2e..22e1c82 100644
> --- a/conf/distro/include/preferred-shr-versions.inc
> +++ b/conf/distro/include/preferred-shr-versions.inc
> @@ -46,8 +46,8 @@ PREFERRED_VERSION_usbutils =C2=A0 =C2=A0 =C2=A0=3D "0.8=
6"
> =C2=A0PREFERRED_VERSION_wpa-supplicant =3D "0.6.9"
> =C2=A0PREFERRED_VERSION_glib-2.0 =C2=A0 =C2=A0 =C2=A0=3D "2.24.1"
> =C2=A0PREFERRED_VERSION_glib-2.0-native =3D "2.24.1"
> -PREFERRED_VERSION_openssl =3D "1.0.0a"
> -PREFERRED_VERSION_openssl-native =3D "1.0.0a"
> +PREFERRED_VERSION_openssl =3D "1.0.0b"
> +PREFERRED_VERSION_openssl-native =3D "1.0.0b"
> =C2=A0UDEV_GE_141 =3D "1"
>
> =C2=A0PREFERRED_VERSION_postgresql =3D "8.4.4"
> diff --git a/recipes/openssl/openssl-1.0.0a/configure-targets.patch b/rec=
ipes/openssl/openssl-1.0.0a/configure-targets.patch
> deleted file mode 100644
> index 112732b..0000000
> --- a/recipes/openssl/openssl-1.0.0a/configure-targets.patch
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -
> -The number of colons are important :)
> -
> -
> -Index: openssl-1.0.0/Configure
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- openssl-1.0.0.orig/Configure =C2=A0 =C2=A0 =C2=A0 2010-01-19 13:40:5=
4.000000000 -0800
> -+++ openssl-1.0.0/Configure =C2=A0 =C2=A02010-05-26 22:58:01.238104854 -=
0700
> -@@ -380,6 +380,16 @@ my %table=3D(
> - "linux-alpha-ccc","ccc:-fast -readonly_strings -DL_ENDIAN -DTERMIO::-D_=
REENTRANT:::SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_INT DES_PTR DES_RISC1 DES_UNR=
OLL:${alpha_asm}",
> - "linux-alpha+bwx-ccc","ccc:-fast -readonly_strings -DL_ENDIAN -DTERMIO:=
:-D_REENTRANT:::SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_INT DES_PTR DES_=
RISC1 DES_UNROLL:${alpha_asm}",
> -
> -+ # Linux on ARM
> -+"linux-elf-arm","$ENV{'CC'}:-DL_ENDIAN -DTERMIO -O3 -fomit-frame-pointe=
r -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared=
:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> -+"linux-elf-armeb","$ENV{'CC'}:-DB_ENDIAN -DTERMIO -O3 -fomit-frame-poin=
ter -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shar=
ed:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> -+"linux-gnueabi-arm","$ENV{'CC'}:-DL_ENDIAN -DTERMIO -O3 -fomit-frame-po=
inter -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-sh=
ared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> -+"linux-gnueabi-armeb","$ENV{'CC'}:-DB_ENDIAN -DTERMIO -O3 -fomit-frame-=
pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-=
shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> -+"linux-uclibceabi-arm","$ENV{'CC'}:-DL_ENDIAN -DTERMIO -O3 -fomit-frame=
-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux=
-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> -+"linux-uclibceabi-armeb","$ENV{'CC'}:-DB_ENDIAN -DTERMIO -O3 -fomit-fra=
me-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:lin=
ux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> -+
> -+"linux-avr32","$ENV{'CC'}:-DTERMIO -O3 -fomit-frame-pointer -Wall::-D_R=
EENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\=
$(SHLIB_MAJOR).",
> -+
> - #### *BSD [do see comment about ${BSDthreads} above!]
> - "BSD-generic32","gcc:-DTERMIOS -O3 -fomit-frame-pointer -Wall::${BSDthr=
eads}:::BN_LLONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL:${no_asm}:dlfcn:bsd-=
gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> - "BSD-x86", =C2=A0 =C2=A0"gcc:-DL_ENDIAN -DTERMIOS -O3 -fomit-frame-poin=
ter -Wall::${BSDthreads}:::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_as=
m}:a.out:dlfcn:bsd-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> diff --git a/recipes/openssl/openssl-1.0.0a/debian.patch b/recipes/openss=
l/openssl-1.0.0a/debian.patch
> deleted file mode 100644
> index 1cd6e11..0000000
> --- a/recipes/openssl/openssl-1.0.0a/debian.patch
> +++ /dev/null
> @@ -1,515 +0,0 @@
> -Index: openssl-1.0.0/Makefile
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- openssl-1.0.0.orig/Makefile
> -+++ openssl-1.0.0/Makefile
> -@@ -26,10 +26,10 @@ HERE=3D.
> - # for, say, /usr/ and yet have everything installed to /tmp/somedir/usr=
/.
> - # Normally it is left empty.
> - INSTALL_PREFIX=3D
> --INSTALLTOP=3D/usr/local/ssl
> -+INSTALLTOP=3D/usr
> -
> - # Do not edit this manually. Use Configure --openssldir=3DDIR do change=
 this!
> --OPENSSLDIR=3D/usr/local/ssl
> -+OPENSSLDIR=3D/usr/lib/ssl
> -
> - # NO_IDEA - Define to build without the IDEA algorithm
> - # NO_RC4 =C2=A0- Define to build without the RC4 algorithm
> -@@ -133,12 +133,13 @@ TESTS =3D alltests
> -
> - MAKEFILE=3D Makefile
> -
> --MANDIR=3D$(OPENSSLDIR)/man
> -+MANDIR=3D/usr/share/man
> - MAN1=3D1
> - MAN3=3D3
> --MANSUFFIX=3D
> -+MANSUFFIX=3Dssl
> -+MANSECTION=3DSSL
> - HTMLSUFFIX=3Dhtml
> --HTMLDIR=3D$(OPENSSLDIR)/html
> -+HTMLDIR=3D/usr/share/doc/openssl/html
> - SHELL=3D/bin/sh
> -
> - TOP=3D =C2=A0 =C2=A0.
> -@@ -149,8 +150,8 @@ LIBS=3D =C2=A0 libcrypto.a libssl.a
> - SHARED_CRYPTO=3Dlibcrypto$(SHLIB_EXT)
> - SHARED_SSL=3Dlibssl$(SHLIB_EXT)
> - SHARED_LIBS=3D
> --SHARED_LIBS_LINK_EXTS=3D
> --SHARED_LDFLAGS=3D
> -+SHARED_LIBS_LINK_EXTS=3D.so
> -+SHARED_LDFLAGS=3D-m64 -Wl,--version-script=3Dopenssl.ld
> -
> - GENERAL=3D =C2=A0 =C2=A0 =C2=A0 =C2=A0Makefile
> - BASENAME=3D =C2=A0 =C2=A0 =C2=A0 openssl
> -@@ -324,7 +325,8 @@ libcrypto.pc: Makefile
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'Description: OpenSSL cryptogra=
phy library'; \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'Version: '$(VERSION); \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'Requires: '; \
> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'Libs: -L$${libdir} -lcrypto $(=
EX_LIBS)'; \
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'Libs: -L$${libdir} -lcrypto'; =
\
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'Libs.private: $(EX_LIBS)'; \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'Cflags: -I$${includedir} $(KRB=
5_INCLUDES)' ) > libcrypto.pc
> -
> - libssl.pc: Makefile
> -@@ -337,7 +339,8 @@ libssl.pc: Makefile
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'Description: Secure Sockets La=
yer and cryptography libraries'; \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'Version: '$(VERSION); \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'Requires: '; \
> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'Libs: -L$${libdir} -lssl -lcry=
pto $(EX_LIBS)'; \
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'Libs: -L$${libdir} -lssl'; \
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'Libs.private: -lcrypto $(EX_LI=
BS)'; \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'Cflags: -I$${includedir} $(KRB=
5_INCLUDES)' ) > libssl.pc
> -
> - openssl.pc: Makefile
> -@@ -350,7 +353,8 @@ openssl.pc: Makefile
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'Description: Secure Sockets La=
yer and cryptography libraries and tools'; \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'Version: '$(VERSION); \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'Requires: '; \
> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'Libs: -L$${libdir} -lssl -lcry=
pto $(EX_LIBS)'; \
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'Libs: -L$${libdir} -lssl -lcry=
pto'; \
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'Libs.private: $(EX_LIBS)'; \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'Cflags: -I$${includedir} $(KRB=
5_INCLUDES)' ) > openssl.pc
> -
> - Makefile: Makefile.org Configure config
> -@@ -499,7 +503,7 @@ install: all install_docs install_sw
> - install_sw:
> - =C2=A0 =C2=A0 =C2=A0 @$(PERL) $(TOP)/util/mkdir-p.pl $(INSTALL_PREFIX)$=
(INSTALLTOP)/bin \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(INSTALL_PREFIX)$(INS=
TALLTOP)/$(LIBDIR) \
> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL_PREFIX)$(INS=
TALLTOP)/$(LIBDIR)/engines \
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL_PREFIX)$(INS=
TALLTOP)/$(LIBDIR)/ssl/engines \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(INSTALL_PREFIX)$(INS=
TALLTOP)/$(LIBDIR)/pkgconfig \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(INSTALL_PREFIX)$(INS=
TALLTOP)/include/openssl \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(INSTALL_PREFIX)$(OPE=
NSSLDIR)/misc \
> -@@ -608,7 +612,7 @@ install_docs:
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo "installing man$$=
sec/$$fn.$${sec}$(MANSUFFIX)"; \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (cd `$(PERL) util/dirn=
ame.pl $$i`; \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sh -c "$$pod2man \
> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--section=3D$$sec --center=3DOpenSSL \
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--section=3D$${sec}$(MANSECTION) --center=3DOpenSSL \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --release=3D$(VERSION) `basename $$i`") \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 > =C2=A0$(INSTALL_PREFIX)$(MANDIR)/man$$sec/$$fn.$${sec}$(MANSUFFIX)=
; \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(PERL) util/extract-n=
ames.pl < $$i | \
> -@@ -625,7 +629,7 @@ install_docs:
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo "installing man$$=
sec/$$fn.$${sec}$(MANSUFFIX)"; \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (cd `$(PERL) util/dirn=
ame.pl $$i`; \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sh -c "$$pod2man \
> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--section=3D$$sec --center=3DOpenSSL \
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--section=3D$${sec}$(MANSECTION) --center=3DOpenSSL \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --release=3D$(VERSION) `basename $$i`") \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 > =C2=A0$(INSTALL_PREFIX)$(MANDIR)/man$$sec/$$fn.$${sec}$(MANSUFFIX)=
; \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(PERL) util/extract-n=
ames.pl < $$i | \
> -Index: openssl-1.0.0/Configure
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- openssl-1.0.0.orig/Configure
> -+++ openssl-1.0.0/Configure
> -@@ -1,4 +1,4 @@
> --:
> -+#!/usr/local/bin/perl
> - eval 'exec perl -S $0 ${1+"$@"}'
> - =C2=A0 =C2=A0 if $running_under_some_shell;
> - ##
> -@@ -331,6 +331,44 @@ my %table=3D(
> - "osf1-alpha-cc", =C2=A0"cc:-std1 -tune host -O4 -readonly_strings::(unk=
nown):::SIXTY_FOUR_BIT_LONG RC4_CHUNK:${alpha_asm}:dlfcn:alpha-osf1-shared:=
::.so",
> - "tru64-alpha-cc", "cc:-std1 -tune host -fast -readonly_strings::-pthrea=
d:::SIXTY_FOUR_BIT_LONG RC4_CHUNK:${alpha_asm}:dlfcn:alpha-osf1-shared::-ms=
ym:.so",
> -
> -+# Debian GNU/* (various architectures)
> -+"debian-alpha","gcc:-DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRA=
NT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_RISC1 DES_UNROLL:${no_asm}:dlfcn=
:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> -+"debian-alpha-ev4","gcc:-DTERMIO -O3 -Wa,--noexecstack -mcpu=3Dev4 -g -=
Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_RISC1 DES_UNROLL=
:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> -+"debian-alpha-ev5","gcc:-DTERMIO -O3 -Wa,--noexecstack -mcpu=3Dev5 -g -=
Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_RISC1 DES_UNROLL=
:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> -+"debian-arm","gcc:-DL_ENDIAN -DTERMIO -O2 -Wa,--noexecstack -g -Wall::-=
D_REENTRANT::-ldl:BN_LLONG DES_RISC1:::::::::::::::dlfcn:linux-shared:-fPIC=
::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> -+"debian-armeb","gcc:-DB_ENDIAN -DTERMIO -O2 -Wa,--noexecstack -g -Wall:=
:-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:::::::::::::::dlfcn:linux-shared:-fP=
IC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> -+"debian-armel","gcc:-DL_ENDIAN -DTERMIO -O2 -Wa,--noexecstack -g -Wall:=
:-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:::::::::::::::dlfcn:linux-shared:-fP=
IC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> -+"debian-amd64", "gcc:-m64 -DL_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g =
-Wall -DMD32_REG_T=3Dint::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK =
RC4_CHAR BF_PTR2 DES_INT DES_UNROLL:${x86_64_asm}:dlfcn:linux-shared:-fPIC:=
-m64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> -+"debian-kfreebsd-amd64","gcc:-m64 -DL_ENDIAN -DTERMIOS -O3 -Wa,--noexec=
stack -Wall -DMD32_REG_T=3Dint::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_=
CHUNK BF_PTR2 DES_INT DES_UNROLL:${x86_64_asm}:dlfcn:linux-shared:-fPIC:-m6=
4:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> -+"debian-kfreebsd-i386","gcc:-DL_ENDIAN -DTERMIOS -O3 -Wa,--noexecstack =
-g -m486 -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:=
${x86_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR=
)",
> -+"debian-hppa","gcc:-DB_ENDIAN -DTERMIO -O2 -Wa,--noexecstack -g -Wall::=
-D_REENTRANT::-ldl:BN_LLONG MD2_CHAR RC4_INDEX:::::::::::::::dlfcn:linux-sh=
ared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> -+"debian-hurd-i386","gcc:-DL_ENDIAN -DTERMIOS -O3 -Wa,--noexecstack -g -=
m486 -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x8=
6_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> -+"debian-ia64","gcc:-DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRAN=
T::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK RC4_CHAR:${ia64_asm}:dlfcn:linux-shar=
ed:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> -+"debian-i386","gcc:-DL_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::=
-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:::::::::::::::dl=
fcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> -+"debian-i386-i486","gcc:-DL_ENDIAN =C2=A0 =C2=A0-DTERMIO -fexpensive-op=
timizations -frename-registers -fomit-frame-pointer -O2 -ggdb3 -Wall::-D_RE=
ENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:=
linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> -+"debian-i386-i586","gcc:-DL_ENDIAN -DTERMIO -O3 -march=3Di586 -Wa,--noe=
xecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opt=
s}:${x86_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MI=
NOR)",
> -+"debian-i386-i686/cmov","gcc:-DL_ENDIAN -DTERMIO -O3 -march=3Di686 -Wa,=
--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gc=
c_opts}:${x86_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHL=
IB_MINOR)",
> -+"debian-m68k","gcc:-DB_ENDIAN -DTERMIO -O2 -Wa,--noexecstack -g -Wall::=
-D_REENTRANT::-ldl:BN_LLONG MD2_CHAR RC4_INDEX:::::::::::::::dlfcn:linux-sh=
ared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> -+"debian-mips", =C2=A0 "gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g=
 -Wall::-D_REENTRANT::-ldl:BN_LLONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL D=
ES_RISC2:::::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHL=
IB_MINOR)",
> -+"debian-mipsel", =C2=A0 "gcc:-DL_ENDIAN -DTERMIO -O3 -Wa,--noexecstack =
-g -Wall::-D_REENTRANT::-ldl:BN_LLONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL=
 DES_RISC2:::::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(S=
HLIB_MINOR)",
> -+"debian-netbsd-i386", "gcc:-DL_ENDIAN -DTERMIOS -O3 -Wa,--noexecstack -=
g -m486 -Wall::(unknown):::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:::::::::=
::::::dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> -+"debian-netbsd-m68k", "gcc:-DB_ENDIAN -DTERMIOS -O3 -Wa,--noexecstack -=
g -Wall::(unknown):::BN_LLONG MD2_CHAR RC4_INDEX DES_UNROLL:::::::::::::::d=
lfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> -+"debian-netbsd-sparc", =C2=A0 =C2=A0 =C2=A0 =C2=A0"gcc:-DB_ENDIAN -DTER=
MIOS -O3 -Wa,--noexecstack -g -mv8 -Wall::(unknown):::BN_LLONG MD2_CHAR RC4=
_INDEX DES_UNROLL:::::::::::::::dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MA=
JOR).\$(SHLIB_MINOR)",
> -+"debian-openbsd-alpha","gcc:-DTERMIOS -O3 -Wa,--noexecstack -g::(unknow=
n):::SIXTY_FOUR_BIT_LONG DES_INT DES_PTR DES_RISC2:::::::::::::::dlfcn:bsd-=
gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> -+"debian-openbsd-i386", =C2=A0"gcc:-DL_ENDIAN -DTERMIOS -O3 -Wa,--noexec=
stack -g -m486::(unknown):::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}::::dlfc=
n:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> -+"debian-openbsd-mips","gcc:-O2 -Wa,--noexecstack -g -DL_ENDIAN::(unknow=
n)::BN_LLONG MD2_CHAR RC4_INDEX RC4_CHAR DES_UNROLL DES_RISC2 DES_PTR BF_PT=
R::::::::::::::::dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_M=
INOR)",
> -+"debian-powerpc","gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wal=
l::-D_REENTRANT::-ldl:BN_LLONG DES_UNROLL DES_RISC2 DES_PTR MD2_CHAR RC4_IN=
DEX::linux_ppc32.o:::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR=
).\$(SHLIB_MINOR)",
> -+"debian-ppc64","gcc:-m64 -DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -=
Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_RISC1 D=
ES_UNROLL::linux_ppc64.o:::::::::::::dlfcn:linux-shared:-fPIC:-m64:.so.\$(S=
HLIB_MAJOR).\$(SHLIB_MINOR)",
> -+"debian-s390","gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::=
-D_REENTRANT::-ldl:BN_LLONG:::::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(=
SHLIB_MAJOR).\$(SHLIB_MINOR)",
> -+"debian-sh3", =C2=A0 "gcc:-DL_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g =
-Wall::-D_REENTRANT::-ldl:BN_LLONG:::::::::::::::dlfcn:linux-shared:-fPIC::=
.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> -+"debian-sh4", =C2=A0 "gcc:-DL_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g =
-Wall::-D_REENTRANT::-ldl:BN_LLONG:::::::::::::::dlfcn:linux-shared:-fPIC::=
.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> -+"debian-sh3eb", =C2=A0 "gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -=
g -Wall::-D_REENTRANT::-ldl:BN_LLONG:::::::::::::::dlfcn:linux-shared:-fPIC=
::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> -+"debian-sh4eb", =C2=A0 "gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -=
g -Wall::-D_REENTRANT::-ldl:BN_LLONG:::::::::::::::dlfcn:linux-shared:-fPIC=
::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> -+"debian-m32r","gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::=
-D_REENTRANT::-ldl:BN_LLONG:::::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(=
SHLIB_MAJOR).\$(SHLIB_MINOR)",
> -+"debian-sparc","gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall:=
:-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_UNROLL BF_PTR::::::::::=
:::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> -+"debian-sparc-v8","gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -mcpu=
=3Dv8 -g -Wall -DBN_DIV2W::-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK D=
ES_UNROLL BF_PTR::sparcv8.o:des_enc-sparc.o fcrypt_b.o::::::::::::dlfcn:lin=
ux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> -+"debian-sparc-v9","gcc:-DB_ENDIAN -DTERMIO -O3 -mcpu=3Dv9 -Wa,--noexecs=
tack -Wa,-Av8plus -g -Wall -DULTRASPARC -DBN_DIV2W::-D_REENTRANT::-ldl:BN_L=
LONG RC4_CHAR RC4_CHUNK DES_UNROLL BF_PTR::sparcv8plus.o:des_enc-sparc.o fc=
rypt_b.o:::md5-sparcv8plus.o:::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB=
_MAJOR).\$(SHLIB_MINOR)",
> -+
> - ####
> - #### Variety of LINUX:-)
> - ####
> -@@ -529,7 +567,7 @@ my %table=3D(
> - # Cygwin
> - "Cygwin-pre1.3", "gcc:-DTERMIOS -DL_ENDIAN -fomit-frame-pointer -O3 -m4=
86 -Wall::(unknown):CYGWIN32::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${no_=
asm}:win32",
> - "Cygwin", "gcc:-DTERMIOS -DL_ENDIAN -fomit-frame-pointer -O3 -march=3Di=
486 -Wall:::CYGWIN32::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_asm}:co=
ff:dlfcn:cygwin-shared:-D_WINDLL:-shared:.dll.a",
> --"debug-Cygwin", "gcc:-DTERMIOS -DL_ENDIAN -march=3Di486 -Wall -DBN_DEBU=
G -DREF_CHECK -DCONF_DEBUG -DBN_CTX_DEBUG -DCRYPTO_MDEBUG -DOPENSSL_NO_ASM =
-g -Wformat -Wshadow -Wmissing-prototypes -Wmissing-declarations -Werror:::=
CYGWIN32:::${no_asm}:dlfcn:cygwin-shared:-D_WINDLL:-shared:.dll.a",
> -+-"debug-Cygwin", "gcc:-DTERMIOS -DL_ENDIAN -march=3Di486 -Wall -DBN_DEB=
UG -DREF_CHECK -DCONF_DEBUG -DBN_CTX_DEBUG -DCRYPTO_MDEBUG -DOPENSSL_NO_ASM=
 -g -Wformat -Wshadow -Wmissing-prototypes -Wmissing-declarations -Werror::=
:CYGWIN32:::${no_asm}:dlfcn:cygwin-shared:-D_WINDLL:-shared:.dll.a",
> -
> - # NetWare from David Ward (dsward@novell.com)
> - # requires either MetroWerks NLM development tools, or gcc / nlmconv
> -@@ -1465,6 +1503,8 @@ if ($strict_warnings)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> - =C2=A0 =C2=A0 =C2=A0 }
> -
> -+$shared_ldflag .=3D " -Wl,--version-script=3Dopenssl.ld";
> -+
> - open(IN,'<Makefile.org') || die "unable to read Makefile.org:$!\n";
> - unlink("$Makefile.new") || die "unable to remove old $Makefile.new:$!\n=
" if -e "$Makefile.new";
> - open(OUT,">$Makefile.new") || die "unable to create $Makefile.new:$!\n"=
;
> -@@ -1555,7 +1595,8 @@ while (<IN>)
> - =C2=A0 =C2=A0 =C2=A0 elsif ($shared_extension ne "" && $shared_extensio=
n =3D~ /^\.s([ol])\.[^\.]*\.[^\.]*$/)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 my $sotmp =3D $1;
> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s/^SHARED_LIBS_LINK_EX=
TS=3D.*/SHARED_LIBS_LINK_EXTS=3D.s$sotmp.\$(SHLIB_MAJOR) .s$sotmp/;
> -+# =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s/^SHARED_LIBS_LINK_EXTS=3D=
.*/SHARED_LIBS_LINK_EXTS=3D.s$sotmp.\$(SHLIB_MAJOR) .s$sotmp/;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s/^SHARED_LIBS_LINK_EX=
TS=3D.*/SHARED_LIBS_LINK_EXTS=3D.s$sotmp/;
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> - =C2=A0 =C2=A0 =C2=A0 elsif ($shared_extension ne "" && $shared_extensio=
n =3D~ /^\.[^\.]*\.[^\.]*\.dylib$/)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {
> -@@ -1683,7 +1724,7 @@ while (<IN>)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> - =C2=A0 =C2=A0 =C2=A0 elsif =C2=A0 (/^#define\s+ENGINESDIR/)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {
> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0my $foo =3D "$prefix/$=
libdir/engines";
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0my $foo =3D "$prefix/l=
ib/ssl/engines";
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $foo =3D~ s/\\/\\\\/g;
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print OUT "#define ENG=
INESDIR \"$foo\"\n";
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> -Index: openssl-1.0.0/config
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- openssl-1.0.0.orig/config
> -+++ openssl-1.0.0/config
> -@@ -170,8 +170,8 @@ case "${SYSTEM}:${RELEASE}:${VERSION}:${
> - =C2=A0 =C2=A0 =C2=A0 echo "${MACHINE}-whatever-linux1"; exit 0
> - =C2=A0 =C2=A0 =C2=A0 ;;
> -
> -- =C2=A0 =C2=A0GNU*)
> -- =C2=A0 =C2=A0 =C2=A0echo "hurd-x86"; exit 0;
> -+ =C2=A0 =C2=A0GNU:*|GNU/*:*)
> -+ =C2=A0 =C2=A0 =C2=A0echo "${MACHINE}-gnuish"; exit 0;
> - =C2=A0 =C2=A0 =C2=A0 ;;
> -
> - =C2=A0 =C2=A0 LynxOS:*)
> -Index: openssl-1.0.0/Makefile.org
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- openssl-1.0.0.orig/Makefile.org
> -+++ openssl-1.0.0/Makefile.org
> -@@ -131,12 +131,13 @@ TESTS =3D alltests
> -
> - MAKEFILE=3D Makefile
> -
> --MANDIR=3D$(OPENSSLDIR)/man
> -+MANDIR=3D/usr/share/man
> - MAN1=3D1
> - MAN3=3D3
> --MANSUFFIX=3D
> -+MANSUFFIX=3Dssl
> -+MANSECTION=3DSSL
> - HTMLSUFFIX=3Dhtml
> --HTMLDIR=3D$(OPENSSLDIR)/html
> -+HTMLDIR=3D/usr/share/doc/openssl/html
> - SHELL=3D/bin/sh
> -
> - TOP=3D =C2=A0 =C2=A0.
> -@@ -322,7 +323,8 @@ libcrypto.pc: Makefile
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'Description: OpenSSL cryptogra=
phy library'; \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'Version: '$(VERSION); \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'Requires: '; \
> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'Libs: -L$${libdir} -lcrypto $(=
EX_LIBS)'; \
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'Libs: -L$${libdir} -lcrypto'; =
\
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'Libs.private: $(EX_LIBS)'; \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'Cflags: -I$${includedir} $(KRB=
5_INCLUDES)' ) > libcrypto.pc
> -
> - libssl.pc: Makefile
> -@@ -335,7 +337,8 @@ libssl.pc: Makefile
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'Description: Secure Sockets La=
yer and cryptography libraries'; \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'Version: '$(VERSION); \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'Requires: '; \
> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'Libs: -L$${libdir} -lssl -lcry=
pto $(EX_LIBS)'; \
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'Libs: -L$${libdir} -lssl'; \
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'Libs.private: -lcrypto $(EX_LI=
BS)'; \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'Cflags: -I$${includedir} $(KRB=
5_INCLUDES)' ) > libssl.pc
> -
> - openssl.pc: Makefile
> -@@ -348,7 +351,8 @@ openssl.pc: Makefile
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'Description: Secure Sockets La=
yer and cryptography libraries and tools'; \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'Version: '$(VERSION); \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'Requires: '; \
> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'Libs: -L$${libdir} -lssl -lcry=
pto $(EX_LIBS)'; \
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'Libs: -L$${libdir} -lssl -lcry=
pto'; \
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'Libs.private: $(EX_LIBS)'; \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'Cflags: -I$${includedir} $(KRB=
5_INCLUDES)' ) > openssl.pc
> -
> - Makefile: Makefile.org Configure config
> -@@ -497,7 +501,7 @@ install: all install_docs install_sw
> - install_sw:
> - =C2=A0 =C2=A0 =C2=A0 @$(PERL) $(TOP)/util/mkdir-p.pl $(INSTALL_PREFIX)$=
(INSTALLTOP)/bin \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(INSTALL_PREFIX)$(INS=
TALLTOP)/$(LIBDIR) \
> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL_PREFIX)$(INS=
TALLTOP)/$(LIBDIR)/engines \
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL_PREFIX)$(INS=
TALLTOP)/$(LIBDIR)/ssl/engines \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(INSTALL_PREFIX)$(INS=
TALLTOP)/$(LIBDIR)/pkgconfig \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(INSTALL_PREFIX)$(INS=
TALLTOP)/include/openssl \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(INSTALL_PREFIX)$(OPE=
NSSLDIR)/misc \
> -@@ -606,7 +610,7 @@ install_docs:
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo "installing man$$=
sec/$$fn.$${sec}$(MANSUFFIX)"; \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (cd `$(PERL) util/dirn=
ame.pl $$i`; \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sh -c "$$pod2man \
> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--section=3D$$sec --center=3DOpenSSL \
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--section=3D$${sec}$(MANSECTION) --center=3DOpenSSL \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --release=3D$(VERSION) `basename $$i`") \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 > =C2=A0$(INSTALL_PREFIX)$(MANDIR)/man$$sec/$$fn.$${sec}$(MANSUFFIX)=
; \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(PERL) util/extract-n=
ames.pl < $$i | \
> -@@ -623,7 +627,7 @@ install_docs:
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo "installing man$$=
sec/$$fn.$${sec}$(MANSUFFIX)"; \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (cd `$(PERL) util/dirn=
ame.pl $$i`; \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sh -c "$$pod2man \
> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--section=3D$$sec --center=3DOpenSSL \
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--section=3D$${sec}$(MANSECTION) --center=3DOpenSSL \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --release=3D$(VERSION) `basename $$i`") \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 > =C2=A0$(INSTALL_PREFIX)$(MANDIR)/man$$sec/$$fn.$${sec}$(MANSUFFIX)=
; \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(PERL) util/extract-n=
ames.pl < $$i | \
> -Index: openssl-1.0.0/openssl.ld
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- /dev/null
> -+++ openssl-1.0.0/openssl.ld
> -@@ -0,0 +1,5 @@
> -+OPENSSL_0.9.8 {
> -+ =C2=A0 =C2=A0 =C2=A0 global:
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *;
> -+};
> -+
> -Index: openssl-1.0.0/engines/openssl.ld
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- /dev/null
> -+++ openssl-1.0.0/engines/openssl.ld
> -@@ -0,0 +1,5 @@
> -+OPENSSL_0.9.8 {
> -+ =C2=A0 =C2=A0 =C2=A0 global:
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *;
> -+};
> -+
> -Index: openssl-1.0.0/doc/Makefile
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- /dev/null
> -+++ openssl-1.0.0/doc/Makefile
> -@@ -0,0 +1,40 @@
> -+VERSION =3D
> -+
> -+#PODS =3D $(wildcard *.pod)
> -+#MANS =3D $(addsuffix .man, $(basename $(PODS)))
> -+
> -+MANS =3D openssl.1 ssl.3 crypto.3
> -+
> -+P2M =3D pod2man --center=3D'OpenSSL Documentation' --release=3D"OpenSSL=
 $(VERSION)"
> -+
> -+all: manpages
> -+
> -+.PHONY: manpages
> -+
> -+manpages: openssl.1 crypto.3 ssl.3
> -+
> -+openssl.1:
> -+ =C2=A0 =C2=A0 =C2=A0$(P2M) --section=3D1 openssl.pod > openssl.1
> -+
> -+crypto.3:
> -+ =C2=A0 =C2=A0 =C2=A0$(P2M) --section=3D3 crypto.pod > crypto.3
> -+
> -+ssl.3:
> -+ =C2=A0 =C2=A0 =C2=A0$(P2M) --section=3D3 ssl.pod > ssl.3
> -+
> -+.PHONY: install
> -+install:
> -+ =C2=A0 =C2=A0 =C2=A0mkdir -p $(INSTALL_PREFIX)$(INSTALLTOP)/share/man/=
man1
> -+ =C2=A0 =C2=A0 =C2=A0mkdir -p $(INSTALL_PREFIX)$(INSTALLTOP)/share/man/=
man3
> -+ =C2=A0 =C2=A0 =C2=A0install -m 644 -p openssl.1 $(INSTALL_PREFIX)$(INS=
TALLTOP)/share/man/man1
> -+ =C2=A0 =C2=A0 =C2=A0install -m 644 -p crypto.3 $(INSTALL_PREFIX)$(INST=
ALLTOP)/share/man/man3
> -+ =C2=A0 =C2=A0 =C2=A0install -m 644 -p ssl.3 $(INSTALL_PREFIX)$(INSTALL=
TOP)/share/man/man3
> -+ =C2=A0 =C2=A0 =C2=A0rm -f $(MANS)
> -+
> -+.PHONY: clean
> -+clean:
> -+ =C2=A0 =C2=A0 =C2=A0rm -f $(MANS)
> -+
> -+.PHONY: realclean
> -+realclean:
> -+ =C2=A0 =C2=A0 =C2=A0-$(MAKE) clean
> -Index: openssl-1.0.0/doc/apps/c_rehash.pod
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- /dev/null
> -+++ openssl-1.0.0/doc/apps/c_rehash.pod
> -@@ -0,0 +1,55 @@
> -+
> -+=3Dpod
> -+
> -+=3Dhead1 NAME
> -+
> -+c_rehash - Create symbolic links to files named by the hash values
> -+
> -+=3Dhead1 SYNOPSIS
> -+
> -+B<c_rehash>
> -+[directory] ...
> -+
> -+=3Dhead1 DESCRIPTION
> -+
> -+c_rehash scans directories and takes a hash value of each .pem and .crt=
 file in the directory. It then creates symbolic links for each of the file=
s named by the hash value. This is useful as many programs require director=
ies to be set up like this in order to find the certificates they require.
> -+
> -+If any directories are named on the command line then these directories=
 are processed in turn. If not then and the environment variable SSL_CERT_D=
IR is defined then that is consulted. This variable should be a colon (:) s=
eparated list of directories, all of which will be processed. If neither of=
 these conditions are true then /usr/lib/ssl/certs is processed.
> -+
> -+For each directory that is to be processed he user must have write perm=
issions on the directory, if they do not then nothing will be printed for t=
hat directory.
> -+
> -+Note that this program deletes all the symbolic links that look like on=
es that it creates before processing a directory. Beware that if you run th=
e program on a directory that contains symbolic links for other purposes th=
at are named in the same format as those created by this program they will =
be lost.
> -+
> -+The hashes for certificate files are of the form <hash>.<n> where n is =
an integer. If the hash value already exists then n will be incremented, un=
less the file is a duplicate. Duplicates are detected using the fingerprint=
 of the certificate. A warning will be printed if a duplicate is detected. =
The hashes for CRL files are of the form <hash>.r<n> and have the same beha=
vior.
> -+
> -+The program will also warn if there are files with extension .pem which=
 are not certificate or CRL files.
> -+
> -+The program uses the openssl program to compute the hashes and fingerpr=
ints. It expects the executable to be named openssl and be on the PATH, or =
in the /usr/lib/ssl/bin directory. If the OPENSSL environment variable is d=
efined then this is used instead as the executable that provides the hashes=
 and fingerprints. When called as $OPENSSL x509 -hash -fingerprint -noout -=
in $file it must output the hash of $file on the first line followed by the=
 fingerprint on the second line, optionally prefixed with some text and an =
equals sign (=3D).
> -+
> -+=3Dhead1 OPTIONS
> -+
> -+None
> -+
> -+=3Dhead1 ENVIRONMENT
> -+
> -+=3Dover 4
> -+
> -+=3Ditem B<OPENSSL>
> -+
> -+The name (and path) of an executable to use to generate hashes and fing=
erprints (see above).
> -+
> -+=3Ditem B<SSL_CERT_DIR>
> -+
> -+Colon separated list of directories to operate on. Ignored if directori=
es are listed on the command line.
> -+
> -+=3Dhead1 SEE ALSO
> -+
> -+L<openssl(1)|openssl(1)>, L<x509(1)|x509(1)>
> -+
> -+=3Dback
> -+
> -+=3Dhead1 BUGS
> -+
> -+No known bugs
> -+
> -+=3Dcut
> -Index: openssl-1.0.0/crypto/opensslconf.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- openssl-1.0.0.orig/crypto/opensslconf.h
> -+++ openssl-1.0.0/crypto/opensslconf.h
> -@@ -11,6 +11,9 @@
> - #ifndef OPENSSL_NO_JPAKE
> - # define OPENSSL_NO_JPAKE
> - #endif
> -+#ifndef OPENSSL_NO_IDEA
> -+# define OPENSSL_NO_IDEA
> -+#endif
> - #ifndef OPENSSL_NO_KRB5
> - # define OPENSSL_NO_KRB5
> - #endif
> -@@ -44,6 +47,9 @@
> - # if defined(OPENSSL_NO_JPAKE) && !defined(NO_JPAKE)
> - # =C2=A0define NO_JPAKE
> - # endif
> -+# if defined(OPENSSL_NO_IDEA) && !defined(NO_IDEA)
> -+# =C2=A0define NO_IDEA
> -+# endif
> - # if defined(OPENSSL_NO_KRB5) && !defined(NO_KRB5)
> - # =C2=A0define NO_KRB5
> - # endif
> -@@ -68,8 +74,8 @@
> -
> - #if !(defined(VMS) || defined(__VMS)) /* VMS uses logical names instead=
 */
> - #if defined(HEADER_CRYPTLIB_H) && !defined(OPENSSLDIR)
> --#define ENGINESDIR "/usr/local/ssl/lib/engines"
> --#define OPENSSLDIR "/usr/local/ssl"
> -+#define ENGINESDIR "/usr/lib/ssl/engines"
> -+#define OPENSSLDIR "/usr/lib/ssl"
> - #endif
> - #endif
> -
> -@@ -100,14 +106,14 @@
> - =C2=A0* - Intel P6 because partial register stalls are very expensive;
> - =C2=A0* - elder Alpha because it lacks byte load/store instructions;
> - =C2=A0*/
> --#define RC4_INT unsigned int
> -+#define RC4_INT unsigned char
> - #endif
> - #if !defined(RC4_CHUNK)
> - /*
> - =C2=A0* This enables code handling data aligned at natural CPU word
> - =C2=A0* boundary. See crypto/rc4/rc4_enc.c for further details.
> - =C2=A0*/
> --#undef RC4_CHUNK
> -+#define RC4_CHUNK unsigned long
> - #endif
> - #endif
> -
> -@@ -115,7 +121,7 @@
> - /* If this is set to 'unsigned int' on a DEC Alpha, this gives about a
> - =C2=A0* %20 speed up (longs are 8 bytes, int's are 4). */
> - #ifndef DES_LONG
> --#define DES_LONG unsigned long
> -+#define DES_LONG unsigned int
> - #endif
> - #endif
> -
> -@@ -126,9 +132,9 @@
> - /* Should we define BN_DIV2W here? */
> -
> - /* Only one for the following should be defined */
> --#undef SIXTY_FOUR_BIT_LONG
> -+#define SIXTY_FOUR_BIT_LONG
> - #undef SIXTY_FOUR_BIT
> --#define THIRTY_TWO_BIT
> -+#undef THIRTY_TWO_BIT
> - #endif
> -
> - #if defined(HEADER_RC4_LOCL_H) && !defined(CONFIG_HEADER_RC4_LOCL_H)
> -@@ -140,7 +146,7 @@
> -
> - #if defined(HEADER_BF_LOCL_H) && !defined(CONFIG_HEADER_BF_LOCL_H)
> - #define CONFIG_HEADER_BF_LOCL_H
> --#undef BF_PTR
> -+#define BF_PTR2
> - #endif /* HEADER_BF_LOCL_H */
> -
> - #if defined(HEADER_DES_LOCL_H) && !defined(CONFIG_HEADER_DES_LOCL_H)
> -@@ -170,7 +176,7 @@ YOU SHOULD NOT HAVE BOTH DES_RISC1 AND D
> - /* Unroll the inner loop, this sometimes helps, sometimes hinders.
> - =C2=A0* Very mucy CPU dependant */
> - #ifndef DES_UNROLL
> --#undef DES_UNROLL
> -+#define DES_UNROLL
> - #endif
> -
> - /* These default values were supplied by
> -Index: openssl-1.0.0/crypto/sha/sha.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- openssl-1.0.0.orig/crypto/sha/sha.h
> -+++ openssl-1.0.0/crypto/sha/sha.h
> -@@ -59,6 +59,7 @@
> - #ifndef HEADER_SHA_H
> - #define HEADER_SHA_H
> -
> -+#include <stddef.h>
> - #include <openssl/e_os2.h>
> - #include <stddef.h>
> -
> diff --git a/recipes/openssl/openssl-1.0.0a/engines-install-in-libdir-ssl=
.patch b/recipes/openssl/openssl-1.0.0a/engines-install-in-libdir-ssl.patch
> deleted file mode 100644
> index 949d6ad..0000000
> --- a/recipes/openssl/openssl-1.0.0a/engines-install-in-libdir-ssl.patch
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -Index: openssl-1.0.0/engines/Makefile
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- openssl-1.0.0.orig/engines/Makefile
> -+++ openssl-1.0.0/engines/Makefile
> -@@ -107,7 +107,7 @@
> - =C2=A0 =C2=A0 =C2=A0 @[ -n "$(INSTALLTOP)" ] # should be set by top Mak=
efile...
> - =C2=A0 =C2=A0 =C2=A0 @if [ -n "$(SHARED_LIBS)" ]; then \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set -e; \
> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(PERL) $(TOP)/util/mk=
dir-p.pl $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines; \
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(PERL) $(TOP)/util/mk=
dir-p.pl $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engines; \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for l in $(LIBNAMES); =
do \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ( echo installing $$l; \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 pfx=3Dlib; \
> -@@ -119,13 +119,13 @@
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *DSO_WIN32*) =C2=A0 =C2=A0sfx=3D"eay32.d=
ll"; pfx=3D;; \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0sfx=3D".bad";; =C2=A0 =C2=A0\
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 esac; \
> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp $$pfx$$l$$sfx $(INSTALL_PREFIX)$(INSTA=
LLTOP)/$(LIBDIR)/engines/$$pfx$$l$$sfx.new; \
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp $$pfx$$l$$sfx $(INSTALL_PREFIX)$(INSTA=
LLTOP)/$(LIBDIR)/ssl/engines/$$pfx$$l$$sfx.new; \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 else \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sfx=3D".so"; \
> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp cyg$$l.dll $(INSTALL_PREFIX)$(INSTALLT=
OP)/$(LIBDIR)/engines/$$pfx$$l$$sfx.new; \
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp cyg$$l.dll $(INSTALL_PREFIX)$(INSTALLT=
OP)/$(LIBDIR)/ssl/engines/$$pfx$$l$$sfx.new; \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 fi; \
> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0chmod 555 $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/$$p=
fx$$l$$sfx.new; \
> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0mv -f $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/$$pfx$$=
l$$sfx.new $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/$$pfx$$l$$sfx )=
; \
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0chmod 555 $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engines=
/$$pfx$$l$$sfx.new; \
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0mv -f $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engines/$$p=
fx$$l$$sfx.new $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engines/$$pfx$$=
l$$sfx ); \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done; \
> - =C2=A0 =C2=A0 =C2=A0 fi
> - =C2=A0 =C2=A0 =C2=A0 @target=3Dinstall; $(RECURSIVE_MAKE)
> -Index: openssl-1.0.0/engines/ccgost/Makefile
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- openssl-1.0.0.orig/engines/ccgost/Makefile
> -+++ openssl-1.0.0/engines/ccgost/Makefile
> -@@ -53,13 +53,13 @@
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 *DSO_WIN32*) sfx=3D"eay32.dll"; pfx=3D;; \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 *) sfx=3D".bad";; \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 esac; \
> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0cp $${pfx}$(LIBNAME)$$sfx $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/en=
gines/$${pfx}$(LIBNAME)$$sfx.new; \
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0cp $${pfx}$(LIBNAME)$$sfx $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ss=
l/engines/$${pfx}$(LIBNAME)$$sfx.new; \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 sfx=3D".so"; \
> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0cp cyg$(LIBNAME).dll $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines=
/$${pfx}$(LIBNAME)$$sfx.new; \
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0cp cyg$(LIBNAME).dll $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/eng=
ines/$${pfx}$(LIBNAME)$$sfx.new; \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi; \
> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chmod 555 $(INSTALL_PR=
EFIX)$(INSTALLTOP)/$(LIBDIR)/engines/$${pfx}$(LIBNAME)$$sfx.new; \
> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv -f $(INSTALL_PREFIX=
)$(INSTALLTOP)/$(LIBDIR)/engines/$${pfx}$(LIBNAME)$$sfx.new $(INSTALL_PREFI=
X)$(INSTALLTOP)/$(LIBDIR)/engines/$${pfx}$(LIBNAME)$$sfx; \
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chmod 555 $(INSTALL_PR=
EFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engines/$${pfx}$(LIBNAME)$$sfx.new; \
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv -f $(INSTALL_PREFIX=
)$(INSTALLTOP)/$(LIBDIR)/ssl/engines/$${pfx}$(LIBNAME)$$sfx.new $(INSTALL_P=
REFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engines/$${pfx}$(LIBNAME)$$sfx; \
> - =C2=A0 =C2=A0 =C2=A0 fi
> -
> - links:
> diff --git a/recipes/openssl/openssl-1.0.0a/libdeps-first.patch b/recipes=
/openssl/openssl-1.0.0a/libdeps-first.patch
> deleted file mode 100644
> index 1fda69b..0000000
> --- a/recipes/openssl/openssl-1.0.0a/libdeps-first.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -Links to previously staged 0.9.8* easily otherwise
> -
> -Index: openssl-1.0.0/Makefile.shared
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- openssl-1.0.0.orig/Makefile.shared
> -+++ openssl-1.0.0/Makefile.shared
> -@@ -96,7 +96,7 @@
> - =C2=A0 =C2=A0 LIBPATH=3D`for x in $$LIBDEPS; do echo $$x; done | sed -e=
 's/^ *-L//;t' -e d | uniq`; \
> - =C2=A0 =C2=A0 LIBPATH=3D`echo $$LIBPATH | sed -e 's/ /:/g'`; \
> - =C2=A0 =C2=A0 LD_LIBRARY_PATH=3D$$LIBPATH:$$LD_LIBRARY_PATH \
> -- =C2=A0 =C2=A0$${LDCMD} $${LDFLAGS} -o $${APPNAME:=3D$(APPNAME)} $(OBJE=
CTS) $${LIBDEPS} )
> -+ =C2=A0 =C2=A0$${LDCMD} $${LIBDEPS} $${LDFLAGS} -o $${APPNAME:=3D$(APPN=
AME)} $(OBJECTS) )
> -
> - LINK_SO=3D =C2=A0 =C2=A0 =C2=A0\
> - =C2=A0 ( $(SET_X); =C2=A0 \
> -@@ -106,9 +106,9 @@
> - =C2=A0 =C2=A0 LIBPATH=3D`for x in $$LIBDEPS; do echo $$x; done | sed -e=
 's/^ *-L//;t' -e d | uniq`; \
> - =C2=A0 =C2=A0 LIBPATH=3D`echo $$LIBPATH | sed -e 's/ /:/g'`; \
> - =C2=A0 =C2=A0 LD_LIBRARY_PATH=3D$$LIBPATH:$$LD_LIBRARY_PATH \
> -- =C2=A0 =C2=A0$${SHAREDCMD} $${SHAREDFLAGS} \
> -+ =C2=A0 =C2=A0$${SHAREDCMD} $$LIBDEPS $${SHAREDFLAGS} \
> - =C2=A0 =C2=A0 =C2=A0 -o $$SHLIB$$SHLIB_SOVER$$SHLIB_SUFFIX \
> -- =C2=A0 =C2=A0 =C2=A0$$ALLSYMSFLAGS $$SHOBJECTS $$NOALLSYMSFLAGS $$LIBD=
EPS \
> -+ =C2=A0 =C2=A0 =C2=A0$$ALLSYMSFLAGS $$SHOBJECTS $$NOALLSYMSFLAGS \
> - =C2=A0 ) && $(SYMLINK_SO)
> -
> - SYMLINK_SO=3D =C2=A0 \
> diff --git a/recipes/openssl/openssl-1.0.0a/oe-ldflags.patch b/recipes/op=
enssl/openssl-1.0.0a/oe-ldflags.patch
> deleted file mode 100644
> index 3dd3bed..0000000
> --- a/recipes/openssl/openssl-1.0.0a/oe-ldflags.patch
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -Index: openssl-1.0.0/Makefile.shared
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- openssl-1.0.0.orig/Makefile.shared
> -+++ openssl-1.0.0/Makefile.shared
> -@@ -92,7 +92,7 @@
> - LINK_APP=3D =C2=A0 =C2=A0 \
> - =C2=A0 ( $(SET_X); =C2=A0 \
> - =C2=A0 =C2=A0 LIBDEPS=3D"$${LIBDEPS:-$(LIBDEPS)}"; \
> -- =C2=A0 =C2=A0LDCMD=3D"$${LDCMD:-$(CC)}"; LDFLAGS=3D"$${LDFLAGS:-$(CFLA=
GS)}"; \
> -+ =C2=A0 =C2=A0LDCMD=3D"$${LDCMD:-$(CC)}"; LDFLAGS=3D"$(OE_LDFLAGS) $${L=
DFLAGS:-$(CFLAGS)}"; \
> - =C2=A0 =C2=A0 LIBPATH=3D`for x in $$LIBDEPS; do echo $$x; done | sed -e=
 's/^ *-L//;t' -e d | uniq`; \
> - =C2=A0 =C2=A0 LIBPATH=3D`echo $$LIBPATH | sed -e 's/ /:/g'`; \
> - =C2=A0 =C2=A0 LD_LIBRARY_PATH=3D$$LIBPATH:$$LD_LIBRARY_PATH \
> -@@ -102,7 +102,7 @@
> - =C2=A0 ( $(SET_X); =C2=A0 \
> - =C2=A0 =C2=A0 LIBDEPS=3D"$${LIBDEPS:-$(LIBDEPS)}"; \
> - =C2=A0 =C2=A0 SHAREDCMD=3D"$${SHAREDCMD:-$(CC)}"; \
> -- =C2=A0 =C2=A0SHAREDFLAGS=3D"$${SHAREDFLAGS:-$(CFLAGS) $(SHARED_LDFLAGS=
)}"; \
> -+ =C2=A0 =C2=A0SHAREDFLAGS=3D"$(OE_LDFLAGS) $${SHAREDFLAGS:-$(CFLAGS) $(=
SHARED_LDFLAGS)}"; \
> - =C2=A0 =C2=A0 LIBPATH=3D`for x in $$LIBDEPS; do echo $$x; done | sed -e=
 's/^ *-L//;t' -e d | uniq`; \
> - =C2=A0 =C2=A0 LIBPATH=3D`echo $$LIBPATH | sed -e 's/ /:/g'`; \
> - =C2=A0 =C2=A0 LD_LIBRARY_PATH=3D$$LIBPATH:$$LD_LIBRARY_PATH \
> diff --git a/recipes/openssl/openssl-1.0.0a/openssl-fix-ssl3_get_key_exch=
ange-double-free.patch b/recipes/openssl/openssl-1.0.0a/openssl-fix-ssl3_ge=
t_key_exchange-double-free.patch
> deleted file mode 100644
> index 4e98849..0000000
> --- a/recipes/openssl/openssl-1.0.0a/openssl-fix-ssl3_get_key_exchange-do=
uble-free.patch
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -Index: openssl-1.0.0a/ssl/s3_clnt.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- openssl-1.0.0a.orig/ssl/s3_clnt.c =C2=A02010-09-13 18:38:01.00000000=
0 +0400
> -+++ openssl-1.0.0a/ssl/s3_clnt.c =C2=A0 =C2=A0 =C2=A0 2010-09-13 18:38:3=
5.000000000 +0400
> -@@ -1508,6 +1508,7 @@
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s->session->sess_cert-=
>peer_ecdh_tmp=3Decdh;
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ecdh=3DNULL;
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BN_CTX_free(bn_ctx);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bn_ctx =3D NULL;
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 EC_POINT_free(srvr_ecp=
oint);
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 srvr_ecpoint =3D NULL;
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> diff --git a/recipes/openssl/openssl-1.0.0a/shared-libs.patch b/recipes/o=
penssl/openssl-1.0.0a/shared-libs.patch
> deleted file mode 100644
> index 7cd70d8..0000000
> --- a/recipes/openssl/openssl-1.0.0a/shared-libs.patch
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -Index: openssl-1.0.0/crypto/Makefile
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- openssl-1.0.0.orig/crypto/Makefile
> -+++ openssl-1.0.0/crypto/Makefile
> -@@ -104,7 +104,7 @@
> -
> - shared: buildinf.h lib subdirs
> - =C2=A0 =C2=A0 =C2=A0 if [ -n "$(SHARED_LIBS)" ]; then \
> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(cd ..; $(MAKE) $(SHAR=
ED_LIB)); \
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(cd ..; $(MAKE) -e $(S=
HARED_LIB)); \
> - =C2=A0 =C2=A0 =C2=A0 fi
> -
> - libs:
> -Index: openssl-1.0.0/Makefile.org
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- openssl-1.0.0.orig/Makefile.org
> -+++ openssl-1.0.0/Makefile.org
> -@@ -260,7 +260,7 @@
> -
> - libcrypto$(SHLIB_EXT): libcrypto.a
> - =C2=A0 =C2=A0 =C2=A0 @if [ "$(SHLIB_TARGET)" !=3D "" ]; then \
> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(MAKE) SHLIBDIRS=3Dcr=
ypto build-shared; \
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(MAKE) -e SHLIBDIRS=
=3Dcrypto build-shared; \
> - =C2=A0 =C2=A0 =C2=A0 else \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo "There's no suppo=
rt for shared libraries on this platform" >&2; \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1; \
> -@@ -268,7 +268,7 @@
> -
> - libssl$(SHLIB_EXT): libcrypto$(SHLIB_EXT) libssl.a
> - =C2=A0 =C2=A0 =C2=A0 @if [ "$(SHLIB_TARGET)" !=3D "" ]; then \
> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(MAKE) SHLIBDIRS=3Dss=
l SHLIBDEPS=3D'-lcrypto' build-shared; \
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(MAKE) -e SHLIBDIRS=
=3Dssl SHLIBDEPS=3D'-lcrypto' build-shared; \
> - =C2=A0 =C2=A0 =C2=A0 else \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo "There's no suppo=
rt for shared libraries on this platform" >&2; \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1; \
> -Index: openssl-1.0.0/ssl/Makefile
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- openssl-1.0.0.orig/ssl/Makefile
> -+++ openssl-1.0.0/ssl/Makefile
> -@@ -62,7 +62,7 @@
> -
> - shared: lib
> - =C2=A0 =C2=A0 =C2=A0 if [ -n "$(SHARED_LIBS)" ]; then \
> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(cd ..; $(MAKE) $(SHAR=
ED_LIB)); \
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(cd ..; $(MAKE) -e $(S=
HARED_LIB)); \
> - =C2=A0 =C2=A0 =C2=A0 fi
> -
> - files:
> diff --git a/recipes/openssl/openssl-1.0.0b/configure-targets.patch b/rec=
ipes/openssl/openssl-1.0.0b/configure-targets.patch
> new file mode 100644
> index 0000000..112732b
> --- /dev/null
> +++ b/recipes/openssl/openssl-1.0.0b/configure-targets.patch
> @@ -0,0 +1,25 @@
> +
> +The number of colons are important :)
> +
> +
> +Index: openssl-1.0.0/Configure
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- openssl-1.0.0.orig/Configure =C2=A0 =C2=A0 =C2=A0 2010-01-19 13:40:5=
4.000000000 -0800
> ++++ openssl-1.0.0/Configure =C2=A0 =C2=A02010-05-26 22:58:01.238104854 -=
0700
> +@@ -380,6 +380,16 @@ my %table=3D(
> + "linux-alpha-ccc","ccc:-fast -readonly_strings -DL_ENDIAN -DTERMIO::-D_=
REENTRANT:::SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_INT DES_PTR DES_RISC1 DES_UNR=
OLL:${alpha_asm}",
> + "linux-alpha+bwx-ccc","ccc:-fast -readonly_strings -DL_ENDIAN -DTERMIO:=
:-D_REENTRANT:::SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_INT DES_PTR DES_=
RISC1 DES_UNROLL:${alpha_asm}",
> +
> ++ # Linux on ARM
> ++"linux-elf-arm","$ENV{'CC'}:-DL_ENDIAN -DTERMIO -O3 -fomit-frame-pointe=
r -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared=
:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"linux-elf-armeb","$ENV{'CC'}:-DB_ENDIAN -DTERMIO -O3 -fomit-frame-poin=
ter -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shar=
ed:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"linux-gnueabi-arm","$ENV{'CC'}:-DL_ENDIAN -DTERMIO -O3 -fomit-frame-po=
inter -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-sh=
ared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"linux-gnueabi-armeb","$ENV{'CC'}:-DB_ENDIAN -DTERMIO -O3 -fomit-frame-=
pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-=
shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"linux-uclibceabi-arm","$ENV{'CC'}:-DL_ENDIAN -DTERMIO -O3 -fomit-frame=
-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux=
-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"linux-uclibceabi-armeb","$ENV{'CC'}:-DB_ENDIAN -DTERMIO -O3 -fomit-fra=
me-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:lin=
ux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++
> ++"linux-avr32","$ENV{'CC'}:-DTERMIO -O3 -fomit-frame-pointer -Wall::-D_R=
EENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\=
$(SHLIB_MAJOR).",
> ++
> + #### *BSD [do see comment about ${BSDthreads} above!]
> + "BSD-generic32","gcc:-DTERMIOS -O3 -fomit-frame-pointer -Wall::${BSDthr=
eads}:::BN_LLONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL:${no_asm}:dlfcn:bsd-=
gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> + "BSD-x86", =C2=A0 =C2=A0"gcc:-DL_ENDIAN -DTERMIOS -O3 -fomit-frame-poin=
ter -Wall::${BSDthreads}:::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_as=
m}:a.out:dlfcn:bsd-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> diff --git a/recipes/openssl/openssl-1.0.0b/debian.patch b/recipes/openss=
l/openssl-1.0.0b/debian.patch
> new file mode 100644
> index 0000000..1cd6e11
> --- /dev/null
> +++ b/recipes/openssl/openssl-1.0.0b/debian.patch
> @@ -0,0 +1,515 @@
> +Index: openssl-1.0.0/Makefile
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- openssl-1.0.0.orig/Makefile
> ++++ openssl-1.0.0/Makefile
> +@@ -26,10 +26,10 @@ HERE=3D.
> + # for, say, /usr/ and yet have everything installed to /tmp/somedir/usr=
/.
> + # Normally it is left empty.
> + INSTALL_PREFIX=3D
> +-INSTALLTOP=3D/usr/local/ssl
> ++INSTALLTOP=3D/usr
> +
> + # Do not edit this manually. Use Configure --openssldir=3DDIR do change=
 this!
> +-OPENSSLDIR=3D/usr/local/ssl
> ++OPENSSLDIR=3D/usr/lib/ssl
> +
> + # NO_IDEA - Define to build without the IDEA algorithm
> + # NO_RC4 =C2=A0- Define to build without the RC4 algorithm
> +@@ -133,12 +133,13 @@ TESTS =3D alltests
> +
> + MAKEFILE=3D Makefile
> +
> +-MANDIR=3D$(OPENSSLDIR)/man
> ++MANDIR=3D/usr/share/man
> + MAN1=3D1
> + MAN3=3D3
> +-MANSUFFIX=3D
> ++MANSUFFIX=3Dssl
> ++MANSECTION=3DSSL
> + HTMLSUFFIX=3Dhtml
> +-HTMLDIR=3D$(OPENSSLDIR)/html
> ++HTMLDIR=3D/usr/share/doc/openssl/html
> + SHELL=3D/bin/sh
> +
> + TOP=3D =C2=A0 =C2=A0.
> +@@ -149,8 +150,8 @@ LIBS=3D =C2=A0 libcrypto.a libssl.a
> + SHARED_CRYPTO=3Dlibcrypto$(SHLIB_EXT)
> + SHARED_SSL=3Dlibssl$(SHLIB_EXT)
> + SHARED_LIBS=3D
> +-SHARED_LIBS_LINK_EXTS=3D
> +-SHARED_LDFLAGS=3D
> ++SHARED_LIBS_LINK_EXTS=3D.so
> ++SHARED_LDFLAGS=3D-m64 -Wl,--version-script=3Dopenssl.ld
> +
> + GENERAL=3D =C2=A0 =C2=A0 =C2=A0 =C2=A0Makefile
> + BASENAME=3D =C2=A0 =C2=A0 =C2=A0 openssl
> +@@ -324,7 +325,8 @@ libcrypto.pc: Makefile
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'Description: OpenSSL cryptogra=
phy library'; \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'Version: '$(VERSION); \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'Requires: '; \
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'Libs: -L$${libdir} -lcrypto $(=
EX_LIBS)'; \
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'Libs: -L$${libdir} -lcrypto'; =
\
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'Libs.private: $(EX_LIBS)'; \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'Cflags: -I$${includedir} $(KRB=
5_INCLUDES)' ) > libcrypto.pc
> +
> + libssl.pc: Makefile
> +@@ -337,7 +339,8 @@ libssl.pc: Makefile
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'Description: Secure Sockets La=
yer and cryptography libraries'; \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'Version: '$(VERSION); \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'Requires: '; \
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'Libs: -L$${libdir} -lssl -lcry=
pto $(EX_LIBS)'; \
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'Libs: -L$${libdir} -lssl'; \
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'Libs.private: -lcrypto $(EX_LI=
BS)'; \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'Cflags: -I$${includedir} $(KRB=
5_INCLUDES)' ) > libssl.pc
> +
> + openssl.pc: Makefile
> +@@ -350,7 +353,8 @@ openssl.pc: Makefile
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'Description: Secure Sockets La=
yer and cryptography libraries and tools'; \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'Version: '$(VERSION); \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'Requires: '; \
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'Libs: -L$${libdir} -lssl -lcry=
pto $(EX_LIBS)'; \
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'Libs: -L$${libdir} -lssl -lcry=
pto'; \
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'Libs.private: $(EX_LIBS)'; \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'Cflags: -I$${includedir} $(KRB=
5_INCLUDES)' ) > openssl.pc
> +
> + Makefile: Makefile.org Configure config
> +@@ -499,7 +503,7 @@ install: all install_docs install_sw
> + install_sw:
> + =C2=A0 =C2=A0 =C2=A0 @$(PERL) $(TOP)/util/mkdir-p.pl $(INSTALL_PREFIX)$=
(INSTALLTOP)/bin \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(INSTALL_PREFIX)$(INS=
TALLTOP)/$(LIBDIR) \
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL_PREFIX)$(INS=
TALLTOP)/$(LIBDIR)/engines \
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL_PREFIX)$(INS=
TALLTOP)/$(LIBDIR)/ssl/engines \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(INSTALL_PREFIX)$(INS=
TALLTOP)/$(LIBDIR)/pkgconfig \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(INSTALL_PREFIX)$(INS=
TALLTOP)/include/openssl \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(INSTALL_PREFIX)$(OPE=
NSSLDIR)/misc \
> +@@ -608,7 +612,7 @@ install_docs:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo "installing man$$=
sec/$$fn.$${sec}$(MANSUFFIX)"; \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (cd `$(PERL) util/dirn=
ame.pl $$i`; \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sh -c "$$pod2man \
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--section=3D$$sec --center=3DOpenSSL \
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--section=3D$${sec}$(MANSECTION) --center=3DOpenSSL \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --release=3D$(VERSION) `basename $$i`") \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 > =C2=A0$(INSTALL_PREFIX)$(MANDIR)/man$$sec/$$fn.$${sec}$(MANSUFFIX)=
; \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(PERL) util/extract-n=
ames.pl < $$i | \
> +@@ -625,7 +629,7 @@ install_docs:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo "installing man$$=
sec/$$fn.$${sec}$(MANSUFFIX)"; \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (cd `$(PERL) util/dirn=
ame.pl $$i`; \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sh -c "$$pod2man \
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--section=3D$$sec --center=3DOpenSSL \
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--section=3D$${sec}$(MANSECTION) --center=3DOpenSSL \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --release=3D$(VERSION) `basename $$i`") \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 > =C2=A0$(INSTALL_PREFIX)$(MANDIR)/man$$sec/$$fn.$${sec}$(MANSUFFIX)=
; \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(PERL) util/extract-n=
ames.pl < $$i | \
> +Index: openssl-1.0.0/Configure
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- openssl-1.0.0.orig/Configure
> ++++ openssl-1.0.0/Configure
> +@@ -1,4 +1,4 @@
> +-:
> ++#!/usr/local/bin/perl
> + eval 'exec perl -S $0 ${1+"$@"}'
> + =C2=A0 =C2=A0 if $running_under_some_shell;
> + ##
> +@@ -331,6 +331,44 @@ my %table=3D(
> + "osf1-alpha-cc", =C2=A0"cc:-std1 -tune host -O4 -readonly_strings::(unk=
nown):::SIXTY_FOUR_BIT_LONG RC4_CHUNK:${alpha_asm}:dlfcn:alpha-osf1-shared:=
::.so",
> + "tru64-alpha-cc", "cc:-std1 -tune host -fast -readonly_strings::-pthrea=
d:::SIXTY_FOUR_BIT_LONG RC4_CHUNK:${alpha_asm}:dlfcn:alpha-osf1-shared::-ms=
ym:.so",
> +
> ++# Debian GNU/* (various architectures)
> ++"debian-alpha","gcc:-DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRA=
NT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_RISC1 DES_UNROLL:${no_asm}:dlfcn=
:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-alpha-ev4","gcc:-DTERMIO -O3 -Wa,--noexecstack -mcpu=3Dev4 -g -=
Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_RISC1 DES_UNROLL=
:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-alpha-ev5","gcc:-DTERMIO -O3 -Wa,--noexecstack -mcpu=3Dev5 -g -=
Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_RISC1 DES_UNROLL=
:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-arm","gcc:-DL_ENDIAN -DTERMIO -O2 -Wa,--noexecstack -g -Wall::-=
D_REENTRANT::-ldl:BN_LLONG DES_RISC1:::::::::::::::dlfcn:linux-shared:-fPIC=
::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-armeb","gcc:-DB_ENDIAN -DTERMIO -O2 -Wa,--noexecstack -g -Wall:=
:-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:::::::::::::::dlfcn:linux-shared:-fP=
IC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-armel","gcc:-DL_ENDIAN -DTERMIO -O2 -Wa,--noexecstack -g -Wall:=
:-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:::::::::::::::dlfcn:linux-shared:-fP=
IC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-amd64", "gcc:-m64 -DL_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g =
-Wall -DMD32_REG_T=3Dint::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK =
RC4_CHAR BF_PTR2 DES_INT DES_UNROLL:${x86_64_asm}:dlfcn:linux-shared:-fPIC:=
-m64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-kfreebsd-amd64","gcc:-m64 -DL_ENDIAN -DTERMIOS -O3 -Wa,--noexec=
stack -Wall -DMD32_REG_T=3Dint::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_=
CHUNK BF_PTR2 DES_INT DES_UNROLL:${x86_64_asm}:dlfcn:linux-shared:-fPIC:-m6=
4:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-kfreebsd-i386","gcc:-DL_ENDIAN -DTERMIOS -O3 -Wa,--noexecstack =
-g -m486 -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:=
${x86_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR=
)",
> ++"debian-hppa","gcc:-DB_ENDIAN -DTERMIO -O2 -Wa,--noexecstack -g -Wall::=
-D_REENTRANT::-ldl:BN_LLONG MD2_CHAR RC4_INDEX:::::::::::::::dlfcn:linux-sh=
ared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-hurd-i386","gcc:-DL_ENDIAN -DTERMIOS -O3 -Wa,--noexecstack -g -=
m486 -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x8=
6_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-ia64","gcc:-DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRAN=
T::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK RC4_CHAR:${ia64_asm}:dlfcn:linux-shar=
ed:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-i386","gcc:-DL_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::=
-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:::::::::::::::dl=
fcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-i386-i486","gcc:-DL_ENDIAN =C2=A0 =C2=A0-DTERMIO -fexpensive-op=
timizations -frename-registers -fomit-frame-pointer -O2 -ggdb3 -Wall::-D_RE=
ENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:=
linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-i386-i586","gcc:-DL_ENDIAN -DTERMIO -O3 -march=3Di586 -Wa,--noe=
xecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opt=
s}:${x86_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MI=
NOR)",
> ++"debian-i386-i686/cmov","gcc:-DL_ENDIAN -DTERMIO -O3 -march=3Di686 -Wa,=
--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gc=
c_opts}:${x86_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHL=
IB_MINOR)",
> ++"debian-m68k","gcc:-DB_ENDIAN -DTERMIO -O2 -Wa,--noexecstack -g -Wall::=
-D_REENTRANT::-ldl:BN_LLONG MD2_CHAR RC4_INDEX:::::::::::::::dlfcn:linux-sh=
ared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-mips", =C2=A0 "gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g=
 -Wall::-D_REENTRANT::-ldl:BN_LLONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL D=
ES_RISC2:::::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHL=
IB_MINOR)",
> ++"debian-mipsel", =C2=A0 "gcc:-DL_ENDIAN -DTERMIO -O3 -Wa,--noexecstack =
-g -Wall::-D_REENTRANT::-ldl:BN_LLONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL=
 DES_RISC2:::::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(S=
HLIB_MINOR)",
> ++"debian-netbsd-i386", "gcc:-DL_ENDIAN -DTERMIOS -O3 -Wa,--noexecstack -=
g -m486 -Wall::(unknown):::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:::::::::=
::::::dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-netbsd-m68k", "gcc:-DB_ENDIAN -DTERMIOS -O3 -Wa,--noexecstack -=
g -Wall::(unknown):::BN_LLONG MD2_CHAR RC4_INDEX DES_UNROLL:::::::::::::::d=
lfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-netbsd-sparc", =C2=A0 =C2=A0 =C2=A0 =C2=A0"gcc:-DB_ENDIAN -DTER=
MIOS -O3 -Wa,--noexecstack -g -mv8 -Wall::(unknown):::BN_LLONG MD2_CHAR RC4=
_INDEX DES_UNROLL:::::::::::::::dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MA=
JOR).\$(SHLIB_MINOR)",
> ++"debian-openbsd-alpha","gcc:-DTERMIOS -O3 -Wa,--noexecstack -g::(unknow=
n):::SIXTY_FOUR_BIT_LONG DES_INT DES_PTR DES_RISC2:::::::::::::::dlfcn:bsd-=
gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-openbsd-i386", =C2=A0"gcc:-DL_ENDIAN -DTERMIOS -O3 -Wa,--noexec=
stack -g -m486::(unknown):::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}::::dlfc=
n:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-openbsd-mips","gcc:-O2 -Wa,--noexecstack -g -DL_ENDIAN::(unknow=
n)::BN_LLONG MD2_CHAR RC4_INDEX RC4_CHAR DES_UNROLL DES_RISC2 DES_PTR BF_PT=
R::::::::::::::::dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_M=
INOR)",
> ++"debian-powerpc","gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wal=
l::-D_REENTRANT::-ldl:BN_LLONG DES_UNROLL DES_RISC2 DES_PTR MD2_CHAR RC4_IN=
DEX::linux_ppc32.o:::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR=
).\$(SHLIB_MINOR)",
> ++"debian-ppc64","gcc:-m64 -DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -=
Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_RISC1 D=
ES_UNROLL::linux_ppc64.o:::::::::::::dlfcn:linux-shared:-fPIC:-m64:.so.\$(S=
HLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-s390","gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::=
-D_REENTRANT::-ldl:BN_LLONG:::::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(=
SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-sh3", =C2=A0 "gcc:-DL_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g =
-Wall::-D_REENTRANT::-ldl:BN_LLONG:::::::::::::::dlfcn:linux-shared:-fPIC::=
.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-sh4", =C2=A0 "gcc:-DL_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g =
-Wall::-D_REENTRANT::-ldl:BN_LLONG:::::::::::::::dlfcn:linux-shared:-fPIC::=
.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-sh3eb", =C2=A0 "gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -=
g -Wall::-D_REENTRANT::-ldl:BN_LLONG:::::::::::::::dlfcn:linux-shared:-fPIC=
::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-sh4eb", =C2=A0 "gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -=
g -Wall::-D_REENTRANT::-ldl:BN_LLONG:::::::::::::::dlfcn:linux-shared:-fPIC=
::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-m32r","gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::=
-D_REENTRANT::-ldl:BN_LLONG:::::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(=
SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-sparc","gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall:=
:-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_UNROLL BF_PTR::::::::::=
:::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-sparc-v8","gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -mcpu=
=3Dv8 -g -Wall -DBN_DIV2W::-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK D=
ES_UNROLL BF_PTR::sparcv8.o:des_enc-sparc.o fcrypt_b.o::::::::::::dlfcn:lin=
ux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-sparc-v9","gcc:-DB_ENDIAN -DTERMIO -O3 -mcpu=3Dv9 -Wa,--noexecs=
tack -Wa,-Av8plus -g -Wall -DULTRASPARC -DBN_DIV2W::-D_REENTRANT::-ldl:BN_L=
LONG RC4_CHAR RC4_CHUNK DES_UNROLL BF_PTR::sparcv8plus.o:des_enc-sparc.o fc=
rypt_b.o:::md5-sparcv8plus.o:::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB=
_MAJOR).\$(SHLIB_MINOR)",
> ++
> + ####
> + #### Variety of LINUX:-)
> + ####
> +@@ -529,7 +567,7 @@ my %table=3D(
> + # Cygwin
> + "Cygwin-pre1.3", "gcc:-DTERMIOS -DL_ENDIAN -fomit-frame-pointer -O3 -m4=
86 -Wall::(unknown):CYGWIN32::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${no_=
asm}:win32",
> + "Cygwin", "gcc:-DTERMIOS -DL_ENDIAN -fomit-frame-pointer -O3 -march=3Di=
486 -Wall:::CYGWIN32::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_asm}:co=
ff:dlfcn:cygwin-shared:-D_WINDLL:-shared:.dll.a",
> +-"debug-Cygwin", "gcc:-DTERMIOS -DL_ENDIAN -march=3Di486 -Wall -DBN_DEBU=
G -DREF_CHECK -DCONF_DEBUG -DBN_CTX_DEBUG -DCRYPTO_MDEBUG -DOPENSSL_NO_ASM =
-g -Wformat -Wshadow -Wmissing-prototypes -Wmissing-declarations -Werror:::=
CYGWIN32:::${no_asm}:dlfcn:cygwin-shared:-D_WINDLL:-shared:.dll.a",
> ++-"debug-Cygwin", "gcc:-DTERMIOS -DL_ENDIAN -march=3Di486 -Wall -DBN_DEB=
UG -DREF_CHECK -DCONF_DEBUG -DBN_CTX_DEBUG -DCRYPTO_MDEBUG -DOPENSSL_NO_ASM=
 -g -Wformat -Wshadow -Wmissing-prototypes -Wmissing-declarations -Werror::=
:CYGWIN32:::${no_asm}:dlfcn:cygwin-shared:-D_WINDLL:-shared:.dll.a",
> +
> + # NetWare from David Ward (dsward@novell.com)
> + # requires either MetroWerks NLM development tools, or gcc / nlmconv
> +@@ -1465,6 +1503,8 @@ if ($strict_warnings)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> ++$shared_ldflag .=3D " -Wl,--version-script=3Dopenssl.ld";
> ++
> + open(IN,'<Makefile.org') || die "unable to read Makefile.org:$!\n";
> + unlink("$Makefile.new") || die "unable to remove old $Makefile.new:$!\n=
" if -e "$Makefile.new";
> + open(OUT,">$Makefile.new") || die "unable to create $Makefile.new:$!\n"=
;
> +@@ -1555,7 +1595,8 @@ while (<IN>)
> + =C2=A0 =C2=A0 =C2=A0 elsif ($shared_extension ne "" && $shared_extensio=
n =3D~ /^\.s([ol])\.[^\.]*\.[^\.]*$/)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 my $sotmp =3D $1;
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s/^SHARED_LIBS_LINK_EX=
TS=3D.*/SHARED_LIBS_LINK_EXTS=3D.s$sotmp.\$(SHLIB_MAJOR) .s$sotmp/;
> ++# =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s/^SHARED_LIBS_LINK_EXTS=3D=
.*/SHARED_LIBS_LINK_EXTS=3D.s$sotmp.\$(SHLIB_MAJOR) .s$sotmp/;
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s/^SHARED_LIBS_LINK_EX=
TS=3D.*/SHARED_LIBS_LINK_EXTS=3D.s$sotmp/;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 elsif ($shared_extension ne "" && $shared_extensio=
n =3D~ /^\.[^\.]*\.[^\.]*\.dylib$/)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {
> +@@ -1683,7 +1724,7 @@ while (<IN>)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 elsif =C2=A0 (/^#define\s+ENGINESDIR/)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0my $foo =3D "$prefix/$=
libdir/engines";
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0my $foo =3D "$prefix/l=
ib/ssl/engines";
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $foo =3D~ s/\\/\\\\/g;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print OUT "#define ENG=
INESDIR \"$foo\"\n";
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> +Index: openssl-1.0.0/config
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- openssl-1.0.0.orig/config
> ++++ openssl-1.0.0/config
> +@@ -170,8 +170,8 @@ case "${SYSTEM}:${RELEASE}:${VERSION}:${
> + =C2=A0 =C2=A0 =C2=A0 echo "${MACHINE}-whatever-linux1"; exit 0
> + =C2=A0 =C2=A0 =C2=A0 ;;
> +
> +- =C2=A0 =C2=A0GNU*)
> +- =C2=A0 =C2=A0 =C2=A0echo "hurd-x86"; exit 0;
> ++ =C2=A0 =C2=A0GNU:*|GNU/*:*)
> ++ =C2=A0 =C2=A0 =C2=A0echo "${MACHINE}-gnuish"; exit 0;
> + =C2=A0 =C2=A0 =C2=A0 ;;
> +
> + =C2=A0 =C2=A0 LynxOS:*)
> +Index: openssl-1.0.0/Makefile.org
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- openssl-1.0.0.orig/Makefile.org
> ++++ openssl-1.0.0/Makefile.org
> +@@ -131,12 +131,13 @@ TESTS =3D alltests
> +
> + MAKEFILE=3D Makefile
> +
> +-MANDIR=3D$(OPENSSLDIR)/man
> ++MANDIR=3D/usr/share/man
> + MAN1=3D1
> + MAN3=3D3
> +-MANSUFFIX=3D
> ++MANSUFFIX=3Dssl
> ++MANSECTION=3DSSL
> + HTMLSUFFIX=3Dhtml
> +-HTMLDIR=3D$(OPENSSLDIR)/html
> ++HTMLDIR=3D/usr/share/doc/openssl/html
> + SHELL=3D/bin/sh
> +
> + TOP=3D =C2=A0 =C2=A0.
> +@@ -322,7 +323,8 @@ libcrypto.pc: Makefile
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'Description: OpenSSL cryptogra=
phy library'; \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'Version: '$(VERSION); \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'Requires: '; \
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'Libs: -L$${libdir} -lcrypto $(=
EX_LIBS)'; \
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'Libs: -L$${libdir} -lcrypto'; =
\
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'Libs.private: $(EX_LIBS)'; \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'Cflags: -I$${includedir} $(KRB=
5_INCLUDES)' ) > libcrypto.pc
> +
> + libssl.pc: Makefile
> +@@ -335,7 +337,8 @@ libssl.pc: Makefile
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'Description: Secure Sockets La=
yer and cryptography libraries'; \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'Version: '$(VERSION); \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'Requires: '; \
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'Libs: -L$${libdir} -lssl -lcry=
pto $(EX_LIBS)'; \
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'Libs: -L$${libdir} -lssl'; \
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'Libs.private: -lcrypto $(EX_LI=
BS)'; \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'Cflags: -I$${includedir} $(KRB=
5_INCLUDES)' ) > libssl.pc
> +
> + openssl.pc: Makefile
> +@@ -348,7 +351,8 @@ openssl.pc: Makefile
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'Description: Secure Sockets La=
yer and cryptography libraries and tools'; \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'Version: '$(VERSION); \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'Requires: '; \
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'Libs: -L$${libdir} -lssl -lcry=
pto $(EX_LIBS)'; \
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'Libs: -L$${libdir} -lssl -lcry=
pto'; \
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'Libs.private: $(EX_LIBS)'; \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'Cflags: -I$${includedir} $(KRB=
5_INCLUDES)' ) > openssl.pc
> +
> + Makefile: Makefile.org Configure config
> +@@ -497,7 +501,7 @@ install: all install_docs install_sw
> + install_sw:
> + =C2=A0 =C2=A0 =C2=A0 @$(PERL) $(TOP)/util/mkdir-p.pl $(INSTALL_PREFIX)$=
(INSTALLTOP)/bin \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(INSTALL_PREFIX)$(INS=
TALLTOP)/$(LIBDIR) \
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL_PREFIX)$(INS=
TALLTOP)/$(LIBDIR)/engines \
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL_PREFIX)$(INS=
TALLTOP)/$(LIBDIR)/ssl/engines \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(INSTALL_PREFIX)$(INS=
TALLTOP)/$(LIBDIR)/pkgconfig \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(INSTALL_PREFIX)$(INS=
TALLTOP)/include/openssl \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(INSTALL_PREFIX)$(OPE=
NSSLDIR)/misc \
> +@@ -606,7 +610,7 @@ install_docs:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo "installing man$$=
sec/$$fn.$${sec}$(MANSUFFIX)"; \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (cd `$(PERL) util/dirn=
ame.pl $$i`; \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sh -c "$$pod2man \
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--section=3D$$sec --center=3DOpenSSL \
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--section=3D$${sec}$(MANSECTION) --center=3DOpenSSL \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --release=3D$(VERSION) `basename $$i`") \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 > =C2=A0$(INSTALL_PREFIX)$(MANDIR)/man$$sec/$$fn.$${sec}$(MANSUFFIX)=
; \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(PERL) util/extract-n=
ames.pl < $$i | \
> +@@ -623,7 +627,7 @@ install_docs:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo "installing man$$=
sec/$$fn.$${sec}$(MANSUFFIX)"; \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (cd `$(PERL) util/dirn=
ame.pl $$i`; \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sh -c "$$pod2man \
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--section=3D$$sec --center=3DOpenSSL \
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--section=3D$${sec}$(MANSECTION) --center=3DOpenSSL \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --release=3D$(VERSION) `basename $$i`") \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 > =C2=A0$(INSTALL_PREFIX)$(MANDIR)/man$$sec/$$fn.$${sec}$(MANSUFFIX)=
; \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(PERL) util/extract-n=
ames.pl < $$i | \
> +Index: openssl-1.0.0/openssl.ld
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- /dev/null
> ++++ openssl-1.0.0/openssl.ld
> +@@ -0,0 +1,5 @@
> ++OPENSSL_0.9.8 {
> ++ =C2=A0 =C2=A0 =C2=A0 global:
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *;
> ++};
> ++
> +Index: openssl-1.0.0/engines/openssl.ld
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- /dev/null
> ++++ openssl-1.0.0/engines/openssl.ld
> +@@ -0,0 +1,5 @@
> ++OPENSSL_0.9.8 {
> ++ =C2=A0 =C2=A0 =C2=A0 global:
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *;
> ++};
> ++
> +Index: openssl-1.0.0/doc/Makefile
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- /dev/null
> ++++ openssl-1.0.0/doc/Makefile
> +@@ -0,0 +1,40 @@
> ++VERSION =3D
> ++
> ++#PODS =3D $(wildcard *.pod)
> ++#MANS =3D $(addsuffix .man, $(basename $(PODS)))
> ++
> ++MANS =3D openssl.1 ssl.3 crypto.3
> ++
> ++P2M =3D pod2man --center=3D'OpenSSL Documentation' --release=3D"OpenSSL=
 $(VERSION)"
> ++
> ++all: manpages
> ++
> ++.PHONY: manpages
> ++
> ++manpages: openssl.1 crypto.3 ssl.3
> ++
> ++openssl.1:
> ++ =C2=A0 =C2=A0 =C2=A0$(P2M) --section=3D1 openssl.pod > openssl.1
> ++
> ++crypto.3:
> ++ =C2=A0 =C2=A0 =C2=A0$(P2M) --section=3D3 crypto.pod > crypto.3
> ++
> ++ssl.3:
> ++ =C2=A0 =C2=A0 =C2=A0$(P2M) --section=3D3 ssl.pod > ssl.3
> ++
> ++.PHONY: install
> ++install:
> ++ =C2=A0 =C2=A0 =C2=A0mkdir -p $(INSTALL_PREFIX)$(INSTALLTOP)/share/man/=
man1
> ++ =C2=A0 =C2=A0 =C2=A0mkdir -p $(INSTALL_PREFIX)$(INSTALLTOP)/share/man/=
man3
> ++ =C2=A0 =C2=A0 =C2=A0install -m 644 -p openssl.1 $(INSTALL_PREFIX)$(INS=
TALLTOP)/share/man/man1
> ++ =C2=A0 =C2=A0 =C2=A0install -m 644 -p crypto.3 $(INSTALL_PREFIX)$(INST=
ALLTOP)/share/man/man3
> ++ =C2=A0 =C2=A0 =C2=A0install -m 644 -p ssl.3 $(INSTALL_PREFIX)$(INSTALL=
TOP)/share/man/man3
> ++ =C2=A0 =C2=A0 =C2=A0rm -f $(MANS)
> ++
> ++.PHONY: clean
> ++clean:
> ++ =C2=A0 =C2=A0 =C2=A0rm -f $(MANS)
> ++
> ++.PHONY: realclean
> ++realclean:
> ++ =C2=A0 =C2=A0 =C2=A0-$(MAKE) clean
> +Index: openssl-1.0.0/doc/apps/c_rehash.pod
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- /dev/null
> ++++ openssl-1.0.0/doc/apps/c_rehash.pod
> +@@ -0,0 +1,55 @@
> ++
> ++=3Dpod
> ++
> ++=3Dhead1 NAME
> ++
> ++c_rehash - Create symbolic links to files named by the hash values
> ++
> ++=3Dhead1 SYNOPSIS
> ++
> ++B<c_rehash>
> ++[directory] ...
> ++
> ++=3Dhead1 DESCRIPTION
> ++
> ++c_rehash scans directories and takes a hash value of each .pem and .crt=
 file in the directory. It then creates symbolic links for each of the file=
s named by the hash value. This is useful as many programs require director=
ies to be set up like this in order to find the certificates they require.
> ++
> ++If any directories are named on the command line then these directories=
 are processed in turn. If not then and the environment variable SSL_CERT_D=
IR is defined then that is consulted. This variable should be a colon (:) s=
eparated list of directories, all of which will be processed. If neither of=
 these conditions are true then /usr/lib/ssl/certs is processed.
> ++
> ++For each directory that is to be processed he user must have write perm=
issions on the directory, if they do not then nothing will be printed for t=
hat directory.
> ++
> ++Note that this program deletes all the symbolic links that look like on=
es that it creates before processing a directory. Beware that if you run th=
e program on a directory that contains symbolic links for other purposes th=
at are named in the same format as those created by this program they will =
be lost.
> ++
> ++The hashes for certificate files are of the form <hash>.<n> where n is =
an integer. If the hash value already exists then n will be incremented, un=
less the file is a duplicate. Duplicates are detected using the fingerprint=
 of the certificate. A warning will be printed if a duplicate is detected. =
The hashes for CRL files are of the form <hash>.r<n> and have the same beha=
vior.
> ++
> ++The program will also warn if there are files with extension .pem which=
 are not certificate or CRL files.
> ++
> ++The program uses the openssl program to compute the hashes and fingerpr=
ints. It expects the executable to be named openssl and be on the PATH, or =
in the /usr/lib/ssl/bin directory. If the OPENSSL environment variable is d=
efined then this is used instead as the executable that provides the hashes=
 and fingerprints. When called as $OPENSSL x509 -hash -fingerprint -noout -=
in $file it must output the hash of $file on the first line followed by the=
 fingerprint on the second line, optionally prefixed with some text and an =
equals sign (=3D).
> ++
> ++=3Dhead1 OPTIONS
> ++
> ++None
> ++
> ++=3Dhead1 ENVIRONMENT
> ++
> ++=3Dover 4
> ++
> ++=3Ditem B<OPENSSL>
> ++
> ++The name (and path) of an executable to use to generate hashes and fing=
erprints (see above).
> ++
> ++=3Ditem B<SSL_CERT_DIR>
> ++
> ++Colon separated list of directories to operate on. Ignored if directori=
es are listed on the command line.
> ++
> ++=3Dhead1 SEE ALSO
> ++
> ++L<openssl(1)|openssl(1)>, L<x509(1)|x509(1)>
> ++
> ++=3Dback
> ++
> ++=3Dhead1 BUGS
> ++
> ++No known bugs
> ++
> ++=3Dcut
> +Index: openssl-1.0.0/crypto/opensslconf.h
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- openssl-1.0.0.orig/crypto/opensslconf.h
> ++++ openssl-1.0.0/crypto/opensslconf.h
> +@@ -11,6 +11,9 @@
> + #ifndef OPENSSL_NO_JPAKE
> + # define OPENSSL_NO_JPAKE
> + #endif
> ++#ifndef OPENSSL_NO_IDEA
> ++# define OPENSSL_NO_IDEA
> ++#endif
> + #ifndef OPENSSL_NO_KRB5
> + # define OPENSSL_NO_KRB5
> + #endif
> +@@ -44,6 +47,9 @@
> + # if defined(OPENSSL_NO_JPAKE) && !defined(NO_JPAKE)
> + # =C2=A0define NO_JPAKE
> + # endif
> ++# if defined(OPENSSL_NO_IDEA) && !defined(NO_IDEA)
> ++# =C2=A0define NO_IDEA
> ++# endif
> + # if defined(OPENSSL_NO_KRB5) && !defined(NO_KRB5)
> + # =C2=A0define NO_KRB5
> + # endif
> +@@ -68,8 +74,8 @@
> +
> + #if !(defined(VMS) || defined(__VMS)) /* VMS uses logical names instead=
 */
> + #if defined(HEADER_CRYPTLIB_H) && !defined(OPENSSLDIR)
> +-#define ENGINESDIR "/usr/local/ssl/lib/engines"
> +-#define OPENSSLDIR "/usr/local/ssl"
> ++#define ENGINESDIR "/usr/lib/ssl/engines"
> ++#define OPENSSLDIR "/usr/lib/ssl"
> + #endif
> + #endif
> +
> +@@ -100,14 +106,14 @@
> + =C2=A0* - Intel P6 because partial register stalls are very expensive;
> + =C2=A0* - elder Alpha because it lacks byte load/store instructions;
> + =C2=A0*/
> +-#define RC4_INT unsigned int
> ++#define RC4_INT unsigned char
> + #endif
> + #if !defined(RC4_CHUNK)
> + /*
> + =C2=A0* This enables code handling data aligned at natural CPU word
> + =C2=A0* boundary. See crypto/rc4/rc4_enc.c for further details.
> + =C2=A0*/
> +-#undef RC4_CHUNK
> ++#define RC4_CHUNK unsigned long
> + #endif
> + #endif
> +
> +@@ -115,7 +121,7 @@
> + /* If this is set to 'unsigned int' on a DEC Alpha, this gives about a
> + =C2=A0* %20 speed up (longs are 8 bytes, int's are 4). */
> + #ifndef DES_LONG
> +-#define DES_LONG unsigned long
> ++#define DES_LONG unsigned int
> + #endif
> + #endif
> +
> +@@ -126,9 +132,9 @@
> + /* Should we define BN_DIV2W here? */
> +
> + /* Only one for the following should be defined */
> +-#undef SIXTY_FOUR_BIT_LONG
> ++#define SIXTY_FOUR_BIT_LONG
> + #undef SIXTY_FOUR_BIT
> +-#define THIRTY_TWO_BIT
> ++#undef THIRTY_TWO_BIT
> + #endif
> +
> + #if defined(HEADER_RC4_LOCL_H) && !defined(CONFIG_HEADER_RC4_LOCL_H)
> +@@ -140,7 +146,7 @@
> +
> + #if defined(HEADER_BF_LOCL_H) && !defined(CONFIG_HEADER_BF_LOCL_H)
> + #define CONFIG_HEADER_BF_LOCL_H
> +-#undef BF_PTR
> ++#define BF_PTR2
> + #endif /* HEADER_BF_LOCL_H */
> +
> + #if defined(HEADER_DES_LOCL_H) && !defined(CONFIG_HEADER_DES_LOCL_H)
> +@@ -170,7 +176,7 @@ YOU SHOULD NOT HAVE BOTH DES_RISC1 AND D
> + /* Unroll the inner loop, this sometimes helps, sometimes hinders.
> + =C2=A0* Very mucy CPU dependant */
> + #ifndef DES_UNROLL
> +-#undef DES_UNROLL
> ++#define DES_UNROLL
> + #endif
> +
> + /* These default values were supplied by
> +Index: openssl-1.0.0/crypto/sha/sha.h
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- openssl-1.0.0.orig/crypto/sha/sha.h
> ++++ openssl-1.0.0/crypto/sha/sha.h
> +@@ -59,6 +59,7 @@
> + #ifndef HEADER_SHA_H
> + #define HEADER_SHA_H
> +
> ++#include <stddef.h>
> + #include <openssl/e_os2.h>
> + #include <stddef.h>
> +
> diff --git a/recipes/openssl/openssl-1.0.0b/engines-install-in-libdir-ssl=
.patch b/recipes/openssl/openssl-1.0.0b/engines-install-in-libdir-ssl.patch
> new file mode 100644
> index 0000000..949d6ad
> --- /dev/null
> +++ b/recipes/openssl/openssl-1.0.0b/engines-install-in-libdir-ssl.patch
> @@ -0,0 +1,53 @@
> +Index: openssl-1.0.0/engines/Makefile
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- openssl-1.0.0.orig/engines/Makefile
> ++++ openssl-1.0.0/engines/Makefile
> +@@ -107,7 +107,7 @@
> + =C2=A0 =C2=A0 =C2=A0 @[ -n "$(INSTALLTOP)" ] # should be set by top Mak=
efile...
> + =C2=A0 =C2=A0 =C2=A0 @if [ -n "$(SHARED_LIBS)" ]; then \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set -e; \
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(PERL) $(TOP)/util/mk=
dir-p.pl $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines; \
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(PERL) $(TOP)/util/mk=
dir-p.pl $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engines; \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for l in $(LIBNAMES); =
do \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ( echo installing $$l; \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 pfx=3Dlib; \
> +@@ -119,13 +119,13 @@
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *DSO_WIN32*) =C2=A0 =C2=A0sfx=3D"eay32.d=
ll"; pfx=3D;; \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0sfx=3D".bad";; =C2=A0 =C2=A0\
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 esac; \
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp $$pfx$$l$$sfx $(INSTALL_PREFIX)$(INSTA=
LLTOP)/$(LIBDIR)/engines/$$pfx$$l$$sfx.new; \
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp $$pfx$$l$$sfx $(INSTALL_PREFIX)$(INSTA=
LLTOP)/$(LIBDIR)/ssl/engines/$$pfx$$l$$sfx.new; \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 else \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sfx=3D".so"; \
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp cyg$$l.dll $(INSTALL_PREFIX)$(INSTALLT=
OP)/$(LIBDIR)/engines/$$pfx$$l$$sfx.new; \
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp cyg$$l.dll $(INSTALL_PREFIX)$(INSTALLT=
OP)/$(LIBDIR)/ssl/engines/$$pfx$$l$$sfx.new; \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 fi; \
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0chmod 555 $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/$$p=
fx$$l$$sfx.new; \
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0mv -f $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/$$pfx$$=
l$$sfx.new $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/$$pfx$$l$$sfx )=
; \
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0chmod 555 $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engines=
/$$pfx$$l$$sfx.new; \
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0mv -f $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engines/$$p=
fx$$l$$sfx.new $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engines/$$pfx$$=
l$$sfx ); \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done; \
> + =C2=A0 =C2=A0 =C2=A0 fi
> + =C2=A0 =C2=A0 =C2=A0 @target=3Dinstall; $(RECURSIVE_MAKE)
> +Index: openssl-1.0.0/engines/ccgost/Makefile
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- openssl-1.0.0.orig/engines/ccgost/Makefile
> ++++ openssl-1.0.0/engines/ccgost/Makefile
> +@@ -53,13 +53,13 @@
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 *DSO_WIN32*) sfx=3D"eay32.dll"; pfx=3D;; \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 *) sfx=3D".bad";; \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 esac; \
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0cp $${pfx}$(LIBNAME)$$sfx $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/en=
gines/$${pfx}$(LIBNAME)$$sfx.new; \
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0cp $${pfx}$(LIBNAME)$$sfx $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ss=
l/engines/$${pfx}$(LIBNAME)$$sfx.new; \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 sfx=3D".so"; \
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0cp cyg$(LIBNAME).dll $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines=
/$${pfx}$(LIBNAME)$$sfx.new; \
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0cp cyg$(LIBNAME).dll $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/eng=
ines/$${pfx}$(LIBNAME)$$sfx.new; \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi; \
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chmod 555 $(INSTALL_PR=
EFIX)$(INSTALLTOP)/$(LIBDIR)/engines/$${pfx}$(LIBNAME)$$sfx.new; \
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv -f $(INSTALL_PREFIX=
)$(INSTALLTOP)/$(LIBDIR)/engines/$${pfx}$(LIBNAME)$$sfx.new $(INSTALL_PREFI=
X)$(INSTALLTOP)/$(LIBDIR)/engines/$${pfx}$(LIBNAME)$$sfx; \
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chmod 555 $(INSTALL_PR=
EFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engines/$${pfx}$(LIBNAME)$$sfx.new; \
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv -f $(INSTALL_PREFIX=
)$(INSTALLTOP)/$(LIBDIR)/ssl/engines/$${pfx}$(LIBNAME)$$sfx.new $(INSTALL_P=
REFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engines/$${pfx}$(LIBNAME)$$sfx; \
> + =C2=A0 =C2=A0 =C2=A0 fi
> +
> + links:
> diff --git a/recipes/openssl/openssl-1.0.0b/libdeps-first.patch b/recipes=
/openssl/openssl-1.0.0b/libdeps-first.patch
> new file mode 100644
> index 0000000..1fda69b
> --- /dev/null
> +++ b/recipes/openssl/openssl-1.0.0b/libdeps-first.patch
> @@ -0,0 +1,27 @@
> +Links to previously staged 0.9.8* easily otherwise
> +
> +Index: openssl-1.0.0/Makefile.shared
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- openssl-1.0.0.orig/Makefile.shared
> ++++ openssl-1.0.0/Makefile.shared
> +@@ -96,7 +96,7 @@
> + =C2=A0 =C2=A0 LIBPATH=3D`for x in $$LIBDEPS; do echo $$x; done | sed -e=
 's/^ *-L//;t' -e d | uniq`; \
> + =C2=A0 =C2=A0 LIBPATH=3D`echo $$LIBPATH | sed -e 's/ /:/g'`; \
> + =C2=A0 =C2=A0 LD_LIBRARY_PATH=3D$$LIBPATH:$$LD_LIBRARY_PATH \
> +- =C2=A0 =C2=A0$${LDCMD} $${LDFLAGS} -o $${APPNAME:=3D$(APPNAME)} $(OBJE=
CTS) $${LIBDEPS} )
> ++ =C2=A0 =C2=A0$${LDCMD} $${LIBDEPS} $${LDFLAGS} -o $${APPNAME:=3D$(APPN=
AME)} $(OBJECTS) )
> +
> + LINK_SO=3D =C2=A0 =C2=A0 =C2=A0\
> + =C2=A0 ( $(SET_X); =C2=A0 \
> +@@ -106,9 +106,9 @@
> + =C2=A0 =C2=A0 LIBPATH=3D`for x in $$LIBDEPS; do echo $$x; done | sed -e=
 's/^ *-L//;t' -e d | uniq`; \
> + =C2=A0 =C2=A0 LIBPATH=3D`echo $$LIBPATH | sed -e 's/ /:/g'`; \
> + =C2=A0 =C2=A0 LD_LIBRARY_PATH=3D$$LIBPATH:$$LD_LIBRARY_PATH \
> +- =C2=A0 =C2=A0$${SHAREDCMD} $${SHAREDFLAGS} \
> ++ =C2=A0 =C2=A0$${SHAREDCMD} $$LIBDEPS $${SHAREDFLAGS} \
> + =C2=A0 =C2=A0 =C2=A0 -o $$SHLIB$$SHLIB_SOVER$$SHLIB_SUFFIX \
> +- =C2=A0 =C2=A0 =C2=A0$$ALLSYMSFLAGS $$SHOBJECTS $$NOALLSYMSFLAGS $$LIBD=
EPS \
> ++ =C2=A0 =C2=A0 =C2=A0$$ALLSYMSFLAGS $$SHOBJECTS $$NOALLSYMSFLAGS \
> + =C2=A0 ) && $(SYMLINK_SO)
> +
> + SYMLINK_SO=3D =C2=A0 \
> diff --git a/recipes/openssl/openssl-1.0.0b/oe-ldflags.patch b/recipes/op=
enssl/openssl-1.0.0b/oe-ldflags.patch
> new file mode 100644
> index 0000000..3dd3bed
> --- /dev/null
> +++ b/recipes/openssl/openssl-1.0.0b/oe-ldflags.patch
> @@ -0,0 +1,22 @@
> +Index: openssl-1.0.0/Makefile.shared
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- openssl-1.0.0.orig/Makefile.shared
> ++++ openssl-1.0.0/Makefile.shared
> +@@ -92,7 +92,7 @@
> + LINK_APP=3D =C2=A0 =C2=A0 \
> + =C2=A0 ( $(SET_X); =C2=A0 \
> + =C2=A0 =C2=A0 LIBDEPS=3D"$${LIBDEPS:-$(LIBDEPS)}"; \
> +- =C2=A0 =C2=A0LDCMD=3D"$${LDCMD:-$(CC)}"; LDFLAGS=3D"$${LDFLAGS:-$(CFLA=
GS)}"; \
> ++ =C2=A0 =C2=A0LDCMD=3D"$${LDCMD:-$(CC)}"; LDFLAGS=3D"$(OE_LDFLAGS) $${L=
DFLAGS:-$(CFLAGS)}"; \
> + =C2=A0 =C2=A0 LIBPATH=3D`for x in $$LIBDEPS; do echo $$x; done | sed -e=
 's/^ *-L//;t' -e d | uniq`; \
> + =C2=A0 =C2=A0 LIBPATH=3D`echo $$LIBPATH | sed -e 's/ /:/g'`; \
> + =C2=A0 =C2=A0 LD_LIBRARY_PATH=3D$$LIBPATH:$$LD_LIBRARY_PATH \
> +@@ -102,7 +102,7 @@
> + =C2=A0 ( $(SET_X); =C2=A0 \
> + =C2=A0 =C2=A0 LIBDEPS=3D"$${LIBDEPS:-$(LIBDEPS)}"; \
> + =C2=A0 =C2=A0 SHAREDCMD=3D"$${SHAREDCMD:-$(CC)}"; \
> +- =C2=A0 =C2=A0SHAREDFLAGS=3D"$${SHAREDFLAGS:-$(CFLAGS) $(SHARED_LDFLAGS=
)}"; \
> ++ =C2=A0 =C2=A0SHAREDFLAGS=3D"$(OE_LDFLAGS) $${SHAREDFLAGS:-$(CFLAGS) $(=
SHARED_LDFLAGS)}"; \
> + =C2=A0 =C2=A0 LIBPATH=3D`for x in $$LIBDEPS; do echo $$x; done | sed -e=
 's/^ *-L//;t' -e d | uniq`; \
> + =C2=A0 =C2=A0 LIBPATH=3D`echo $$LIBPATH | sed -e 's/ /:/g'`; \
> + =C2=A0 =C2=A0 LD_LIBRARY_PATH=3D$$LIBPATH:$$LD_LIBRARY_PATH \
> diff --git a/recipes/openssl/openssl-1.0.0b/shared-libs.patch b/recipes/o=
penssl/openssl-1.0.0b/shared-libs.patch
> new file mode 100644
> index 0000000..7cd70d8
> --- /dev/null
> +++ b/recipes/openssl/openssl-1.0.0b/shared-libs.patch
> @@ -0,0 +1,48 @@
> +Index: openssl-1.0.0/crypto/Makefile
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- openssl-1.0.0.orig/crypto/Makefile
> ++++ openssl-1.0.0/crypto/Makefile
> +@@ -104,7 +104,7 @@
> +
> + shared: buildinf.h lib subdirs
> + =C2=A0 =C2=A0 =C2=A0 if [ -n "$(SHARED_LIBS)" ]; then \
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(cd ..; $(MAKE) $(SHAR=
ED_LIB)); \
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(cd ..; $(MAKE) -e $(S=
HARED_LIB)); \
> + =C2=A0 =C2=A0 =C2=A0 fi
> +
> + libs:
> +Index: openssl-1.0.0/Makefile.org
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- openssl-1.0.0.orig/Makefile.org
> ++++ openssl-1.0.0/Makefile.org
> +@@ -260,7 +260,7 @@
> +
> + libcrypto$(SHLIB_EXT): libcrypto.a
> + =C2=A0 =C2=A0 =C2=A0 @if [ "$(SHLIB_TARGET)" !=3D "" ]; then \
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(MAKE) SHLIBDIRS=3Dcr=
ypto build-shared; \
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(MAKE) -e SHLIBDIRS=
=3Dcrypto build-shared; \
> + =C2=A0 =C2=A0 =C2=A0 else \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo "There's no suppo=
rt for shared libraries on this platform" >&2; \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1; \
> +@@ -268,7 +268,7 @@
> +
> + libssl$(SHLIB_EXT): libcrypto$(SHLIB_EXT) libssl.a
> + =C2=A0 =C2=A0 =C2=A0 @if [ "$(SHLIB_TARGET)" !=3D "" ]; then \
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(MAKE) SHLIBDIRS=3Dss=
l SHLIBDEPS=3D'-lcrypto' build-shared; \
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(MAKE) -e SHLIBDIRS=
=3Dssl SHLIBDEPS=3D'-lcrypto' build-shared; \
> + =C2=A0 =C2=A0 =C2=A0 else \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo "There's no suppo=
rt for shared libraries on this platform" >&2; \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1; \
> +Index: openssl-1.0.0/ssl/Makefile
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- openssl-1.0.0.orig/ssl/Makefile
> ++++ openssl-1.0.0/ssl/Makefile
> +@@ -62,7 +62,7 @@
> +
> + shared: lib
> + =C2=A0 =C2=A0 =C2=A0 if [ -n "$(SHARED_LIBS)" ]; then \
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(cd ..; $(MAKE) $(SHAR=
ED_LIB)); \
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(cd ..; $(MAKE) -e $(S=
HARED_LIB)); \
> + =C2=A0 =C2=A0 =C2=A0 fi
> +
> + files:
> diff --git a/recipes/openssl/openssl-native_1.0.0a.bb b/recipes/openssl/o=
penssl-native_1.0.0a.bb
> deleted file mode 100644
> index bb471b0..0000000
> --- a/recipes/openssl/openssl-native_1.0.0a.bb
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -require openssl.inc
> -
> -inherit pkgconfig native
> -
> -SRC_URI[src.md5sum] =3D "e3873edfffc783624cfbdb65e2249cbd"
> -SRC_URI[src.sha256sum] =3D "18a9bd1fc02b8ef90dded34fafaa9089baaafef278a1=
9fc4e89c2ab0dcf70f63"
> -PR =3D "${INC_PR}.0"
> -
> -DEFAULT_PREFERENCE =3D "-1"
> -
> -export DIRS =3D "crypto ssl apps engines"
> -
> -# This flag can contain target options (e.g -mfpu=3Dneon for armv7-a sys=
tems)
> -export FULL_OPTIMIZATION =3D " "
> -export BUILD_OPTIMIZATION =3D " "
> -
> -SRC_URI +=3D "file://configure-targets.patch \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://shared-libs.patch \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://debian.patch \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://libdeps-first.patch \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"
> -
> -PARALLEL_MAKE =3D ""
> -
> -CFLAG +=3D " -Wa,--noexecstack "
> -
> -NATIVE_INSTALL_WORKS =3D "1"
> diff --git a/recipes/openssl/openssl-native_1.0.0b.bb b/recipes/openssl/o=
penssl-native_1.0.0b.bb
> new file mode 100644
> index 0000000..4ad4936
> --- /dev/null
> +++ b/recipes/openssl/openssl-native_1.0.0b.bb
> @@ -0,0 +1,27 @@
> +require openssl.inc
> +
> +inherit pkgconfig native
> +
> +SRC_URI[src.md5sum] =3D "104deb3b7e6820cae6de3f49ba0ff2b0"
> +SRC_URI[src.sha256sum] =3D "4e7b4e2fb33ee2d97c5e143561ab495dbbfc08f0a863=
e617a0c7adca19017331"
> +PR =3D "${INC_PR}.0"
> +
> +DEFAULT_PREFERENCE =3D "-1"
> +
> +export DIRS =3D "crypto ssl apps engines"
> +
> +# This flag can contain target options (e.g -mfpu=3Dneon for armv7-a sys=
tems)
> +export FULL_OPTIMIZATION =3D " "
> +export BUILD_OPTIMIZATION =3D " "
> +
> +SRC_URI +=3D "file://configure-targets.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://shared-libs.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://debian.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://libdeps-first.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"
> +
> +PARALLEL_MAKE =3D ""
> +
> +CFLAG +=3D " -Wa,--noexecstack "
> +
> +NATIVE_INSTALL_WORKS =3D "1"
> diff --git a/recipes/openssl/openssl_1.0.0a.bb b/recipes/openssl/openssl_=
1.0.0a.bb
> deleted file mode 100644
> index cc3a8ab..0000000
> --- a/recipes/openssl/openssl_1.0.0a.bb
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -inherit pkgconfig
> -
> -require openssl.inc
> -SRC_URI[src.md5sum] =3D "e3873edfffc783624cfbdb65e2249cbd"
> -SRC_URI[src.sha256sum] =3D "18a9bd1fc02b8ef90dded34fafaa9089baaafef278a1=
9fc4e89c2ab0dcf70f63"
> -
> -PR =3D "${INC_PR}.1"
> -
> -DEFAULT_PREFERENCE =3D "-1"
> -
> -export DIRS =3D "crypto ssl apps engines"
> -export OE_LDFLAGS=3D"${LDFLAGS}"
> -
> -SRC_URI +=3D "file://configure-targets.patch \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://shared-libs.patch \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://debian.patch \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://oe-ldflags.patch \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://libdeps-first.patch \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://engines-install-in-libdir-ssl=
.patch \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://openssl-fix-ssl3_get_key_exch=
ange-double-free.patch \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"
> -
> -PARALLEL_MAKE =3D ""
> -
> -PACKAGES +=3D " \
> - =C2=A0 =C2=A0 =C2=A0 ${PN}-engines \
> - =C2=A0 =C2=A0 =C2=A0 ${PN}-engines-dbg \
> - =C2=A0 =C2=A0 =C2=A0 "
> -
> -FILES_${PN}-engines =3D "${libdir}/ssl/engines/*.so"
> -FILES_${PN}-engines-dbg =3D "${libdir}/ssl/engines/.debug"
> diff --git a/recipes/openssl/openssl_1.0.0b.bb b/recipes/openssl/openssl_=
1.0.0b.bb
> new file mode 100644
> index 0000000..13236a4
> --- /dev/null
> +++ b/recipes/openssl/openssl_1.0.0b.bb
> @@ -0,0 +1,30 @@
> +inherit pkgconfig
> +
> +require openssl.inc
> +SRC_URI[src.md5sum] =3D "104deb3b7e6820cae6de3f49ba0ff2b0"
> +SRC_URI[src.sha256sum] =3D "4e7b4e2fb33ee2d97c5e143561ab495dbbfc08f0a863=
e617a0c7adca19017331"
> +
> +PR =3D "${INC_PR}.0"
> +
> +DEFAULT_PREFERENCE =3D "-1"
> +
> +export DIRS =3D "crypto ssl apps engines"
> +export OE_LDFLAGS=3D"${LDFLAGS}"
> +
> +SRC_URI +=3D "file://configure-targets.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://shared-libs.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://debian.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://oe-ldflags.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://libdeps-first.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://engines-install-in-libdir-ssl=
.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"
> +
> +PARALLEL_MAKE =3D ""
> +
> +PACKAGES +=3D " \
> + =C2=A0 =C2=A0 =C2=A0 ${PN}-engines \
> + =C2=A0 =C2=A0 =C2=A0 ${PN}-engines-dbg \
> + =C2=A0 =C2=A0 =C2=A0 "
> +
> +FILES_${PN}-engines =3D "${libdir}/ssl/engines/*.so"
> +FILES_${PN}-engines-dbg =3D "${libdir}/ssl/engines/.debug"
> --
> 1.6.4.2
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


