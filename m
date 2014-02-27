Return-Path: <ticotimo@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id CB3266EDAA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 17:18:14 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id kl14so2790916pab.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 09:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:message-id:mime-version:subject:date:references
	:to:in-reply-to;
	bh=2PmsSFSaZeJFlNXv4p1nz4TUpNGM2Ls4Lis/kVtcJ8c=;
	b=l8STZqUocrtu8ZmbHcDBf/K83CC1BFpWDomhrgMVBeXGSxo4YkW/tS4yxw9B4BAa7r
	SqsEZMxQIyZyf8ZAxzJYtc1s4/lzm7KmR7ZarnpJuUdLRVafvGEZ71YC6slE3yLfUNFg
	g6K1EZU0VrgrnczmkHZOTfeA/EUVCYXH3rv/iYUQV9wOdKqVj+r6IADTWZJz8vtczgQm
	t3rd5fivPT2ha2XQ8Fz3teUNRsp48WFifZW8igblbyJbJxPenr6e3G0VmFONGNrFtIU9
	ziTzL+ALXYbp8Qt5SAIqRuOIMIXHiR7Ir8InVEDpErPVUfPKryoxit0zECySJctiHbAc
	Dx7g==
X-Received: by 10.66.158.132 with SMTP id wu4mr16505830pab.66.1393521495323;
	Thu, 27 Feb 2014 09:18:15 -0800 (PST)
Received: from [192.168.1.136] (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	js7sm15354867pbc.35.2014.02.27.09.18.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 27 Feb 2014 09:18:14 -0800 (PST)
From: Timothy Orling <ticotimo@gmail.com>
Message-Id: <19638B13-5CD4-431E-811D-F184416165C3@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
Date: Thu, 27 Feb 2014 09:18:12 -0800
References: <1393393197-23806-1-git-send-email-ticotimo@gmail.com>
	<1393393197-23806-4-git-send-email-ticotimo@gmail.com>
	<530DE2A2.5000608@home.nl>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <530DE2A2.5000608@home.nl>
X-Mailer: Apple Mail (2.1827)
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-multimedia][PATCH v2 3/3] vlc: update to 2.1.2
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
X-List-Received-Date: Thu, 27 Feb 2014 17:18:14 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Feb 26, 2014, at 4:48 AM, Walter Goossens <waltergoossens@home.nl> =
wrote:

> Hi Tim,
>=20
> I've been working on slimmed down version of this recipe for audio =
only
> and I got stuck on the lua scripts being incorrectly compiled, have =
you
> looked at the scripts for this recipe?
> It's not entirely clear to me how (in)portable lua bytecode is as the
> documentation seems inconclusive about this. It seems the word-size
> should at least be the same, but I've also read the endianness should =
be
> the same.
> Anyway, I'm using an x86_64 machine to compile for a raspberry pi
> (arm-le) and it doesn't work out of the box, and also when using a =
32bit
> lua compiler (as suggested
> =
https://wiki.videolan.org/Win32Compile_Under_Fedora/#Install_32-bit_Lua)
> I'll be trying your recipe soon but I fear it'll have the same =
problem.
>=20
I have not looked into the lua/scripts yet. I was just happy to get it =
to compile!

Any feedback is welcomed.

> Walter
>=20
> On 02/26/14 06:39, Tim Orling wrote:
>> From: Tim Orling <TicoTimo@gmail.com>
>>=20
>> Signed-off-by: Tim Orling <TicoTimo@gmail.com>
>> ---
>> .../vlc/files/0001-enable-subdir-objects.patch        | 13 =
+++++++++++++
>> .../files/0002-glibc-does-not-provide-strlcpy.patch   | 17 =
+++++++++++++++++
>> meta-multimedia/recipes-multimedia/vlc/vlc.inc        | 10 +++++++---
>> meta-multimedia/recipes-multimedia/vlc/vlc_1.1.11.bb  | 19 =
-------------------
>> meta-multimedia/recipes-multimedia/vlc/vlc_2.1.2.bb   | 17 =
+++++++++++++++++
>> 5 files changed, 54 insertions(+), 22 deletions(-)
>> create mode 100644 =
meta-multimedia/recipes-multimedia/vlc/files/0001-enable-subdir-objects.pa=
tch
>> create mode 100644 =
meta-multimedia/recipes-multimedia/vlc/files/0002-glibc-does-not-provide-s=
trlcpy.patch
>> delete mode 100644 =
meta-multimedia/recipes-multimedia/vlc/vlc_1.1.11.bb
>> create mode 100644 =
meta-multimedia/recipes-multimedia/vlc/vlc_2.1.2.bb
>>=20
>> diff --git =
a/meta-multimedia/recipes-multimedia/vlc/files/0001-enable-subdir-objects.=
patch =
b/meta-multimedia/recipes-multimedia/vlc/files/0001-enable-subdir-objects.=
patch
>> new file mode 100644
>> index 0000000..9f0e708
>> --- /dev/null
>> +++ =
b/meta-multimedia/recipes-multimedia/vlc/files/0001-enable-subdir-objects.=
patch
>> @@ -0,0 +1,13 @@
>> +Index: vlc-2.1.2/configure.ac
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- vlc-2.1.2.orig/configure.ac
>> ++++ vlc-2.1.2/configure.ac
>> +@@ -24,7 +24,7 @@ AC_CANONICAL_BUILD
>> + AC_CANONICAL_HOST
>> + AC_PRESERVE_HELP_ORDER
>> +=20
>> +-AM_INIT_AUTOMAKE(tar-ustar color-tests foreign)
>> ++AM_INIT_AUTOMAKE(tar-ustar color-tests foreign subdir-objects)
>> + AC_CONFIG_HEADERS([config.h])
>> +=20
>> + # Disable with "./configure --disable-silent-rules" or "make V=3D1"
>> diff --git =
a/meta-multimedia/recipes-multimedia/vlc/files/0002-glibc-does-not-provide=
-strlcpy.patch =
b/meta-multimedia/recipes-multimedia/vlc/files/0002-glibc-does-not-provide=
-strlcpy.patch
>> new file mode 100644
>> index 0000000..6d2a46f
>> --- /dev/null
>> +++ =
b/meta-multimedia/recipes-multimedia/vlc/files/0002-glibc-does-not-provide=
-strlcpy.patch
>> @@ -0,0 +1,17 @@
>> +Index: vlc-2.1.2/src/input/subtitles.c
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- vlc-2.1.2.orig/src/input/subtitles.c
>> ++++ vlc-2.1.2/src/input/subtitles.c
>> +@@ -44,6 +44,12 @@
>> + #include "input_internal.h"
>> +=20
>> + /**
>> ++ * Drepper's alternative=20
>> ++ * =
http://en.wikibooks.org/wiki/C_Programming/C_Reference/nonstandard/strlcpy=

>> ++ */
>> ++#define strlcpy(dst, src, n) *((char* ) mempcpy(dst, src, n)) =3D =
'\0'
>> ++
>> ++/**
>> +  * We are not going to autodetect more subtitle files than this.
>> +  */
>> + #define MAX_SUBTITLE_FILES 128
>> diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc =
b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
>> index 6400719..976c3bf 100644
>> --- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
>> +++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
>> @@ -5,13 +5,13 @@ SECTION =3D "multimedia"
>>=20
>> DEPENDS =3D "libfribidi libtool libgcrypt gst-plugins-bad =
virtual/libsdl qt4-x11-free dbus libxml2 gnutls tremor faad2 ffmpeg flac =
libxpm fluidsynth alsa-lib"
>>=20
>> -SRC_URI =3D =
"http://download.videolan.org/pub/videolan/vlc/${PV}/vlc-${PV}.tar.bz2"
>> +SRC_URI =3D =
"http://download.videolan.org/pub/videolan/vlc/${PV}/vlc-${PV}.tar.xz"
>>=20
>> inherit autotools gettext
>>=20
>> ARM_INSTRUCTION_SET =3D "arm"
>>=20
>> -DEPENDS +=3D "libdvdcss libdvdread lua5.1-native lua5.1"
>> +DEPENDS +=3D "libdvdcss libdvdread lua-native lua"
>>=20
>> LEAD_SONAME =3D "libvlc.so.5"
>>=20
>> @@ -36,6 +36,8 @@ FILES_libvlc-dbg =3D "\
>>=20
>> FILES_libvlc =3D "${libdir}/lib*.so.*"
>>=20
>> +FILES_libvlc-staticdev =3D "${libdir}/vlc/plugins/*/*.a"
>> +
>> FILES_${PN} +=3D "${bindir}/vlc \
>>     ${datadir}/applications \
>>     ${datadir}/vlc/ \
>> @@ -71,6 +73,7 @@ PACKAGECONFIG[id3tag] =3D =
"--enable-id3tag,--disable-id3tag,libid3tag"
>> PACKAGECONFIG[a52] =3D "--enable-a52,--disable-a52,liba52"
>> PACKAGECONFIG[mpeg2dec] =3D =
"--enable-mpeg2dec,--disable-mpeg2dec,mpeg2dec"
>> PACKAGECONFIG[jack] =3D "--enable-jack,--disable-jack,jack"
>> +PACKAGECONFIG[live555] =3D =
"--enable-live555,--disable-live555,live555"
>>=20
>> do_configure() {
>>     cp ${STAGING_DATADIR}/aclocal/libgcrypt.m4 ${S}/m4/=20
>> @@ -81,6 +84,7 @@ do_configure() {
>>     cp ${STAGING_DATADIR}/libtool/config.* ${S}/autotools/ || true
>>     oe_runconf
>>     rm config.log
>> -    sed -i -e s:-L/usr/lib:-L${STAGING_LIBDIR}/:g vlc-config
>> +    #sed -i -e s:-L/usr/lib:-L${STAGING_LIBDIR}/:g vlc-config
>>     sed -i -e s:'$(MOC) $(DEFS) $(CPPFLAGS)':'$(MOC) $(DEFS)'\ =
-I${S}/include\ -DSYS_LINUX:g ${S}/modules/gui/qt4/Makefile
>> +    sed -i -e =
s:'${top_builddir_slash}libtool':${TARGET_ARCH}-${DISTRO}-${TARGET_OS}-lib=
tool:g doltlibtool
>> }
>> diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_1.1.11.bb =
b/meta-multimedia/recipes-multimedia/vlc/vlc_1.1.11.bb
>> deleted file mode 100644
>> index 368db59..0000000
>> --- a/meta-multimedia/recipes-multimedia/vlc/vlc_1.1.11.bb
>> +++ /dev/null
>> @@ -1,19 +0,0 @@
>> -# This recipe packages vlc as a library as well, so qt4 dependencies
>> -# can be avoided when only the library is installed.
>> -
>> -LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Ded7e492ee44e70125a5d42e118354a13"
>> -
>> -require vlc.inc
>> -
>> -SRC_URI +=3D =
"file://0001-V4L2-mark-horizontal-and-vertical-center-controls-ob.patch"
>> -SRC_URI +=3D "file://0002-fix-build-with-newer-freetype.patch"
>> -SRC_URI +=3D "file://0003-fix-build-with-newer-flac-1.3.0.patch"
>> -
>> -PR =3D "r4"
>> -
>> -# work around build failure
>> -EXTRA_OECONF +=3D " --enable-libxml2=3Dno"
>> -
>> -SRC_URI[md5sum] =3D "a64846d6f21ea179ae8e8bfb6f9447fe"
>> -SRC_URI[sha256sum] =3D =
"682560be08b82bedfaf30d8a611d80093c5883c1de72fcbcf05715b8e9f4e1cb"
>> -
>> diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.2.bb =
b/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.2.bb
>> new file mode 100644
>> index 0000000..a33f93f
>> --- /dev/null
>> +++ b/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.2.bb
>> @@ -0,0 +1,17 @@
>> +# This recipe packages vlc as a library as well, so qt4 dependencies
>> +# can be avoided when only the library is installed.
>> +
>> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
>> +
>> +require vlc.inc
>> +
>> +# work around build failure
>> +EXTRA_OECONF +=3D " --enable-libxml2=3Dno"
>> +
>> +SRC_URI +=3D "file://0001-enable-subdir-objects.patch \
>> +            file://0002-glibc-does-not-provide-strlcpy.patch \
>> +"
>> +
>> +SRC_URI[md5sum] =3D "fb6787ad749aadcfaeab3471939b3426"
>> +SRC_URI[sha256sum] =3D =
"219b812be1bc2eba40faa86419d0aa2c479a7380af8af216e8bfa22eb6fc8ec4"
>> +
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--Tim=

