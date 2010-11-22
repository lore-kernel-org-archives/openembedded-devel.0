Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PKdnX-0002x9-MU
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 22:19:41 +0100
Received: by iwn7 with SMTP id 7so244434iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 13:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=hjx0OHOx7JieDpMzFrDcKkMxAfAPw52BN644xK7xjBY=;
	b=sCWN5iPwzFPXipxZu6ThoLGbTFGvzGAoLPw7IrLicx4eE8IdJyJUqTDKa4HVJWAQoP
	szBwHAqCdTA1GogwHHs/5GBM9lxyhdS+dfxevyTXNUTSIh/OvenJFtJzmxLfJHxng3jg
	lgAXnZPweDem1NrICSLGsXbBvvj3GEZoQkgNY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=DnUCKYvMtgUaBn8IXV2qj+4hfQCvBzDOkLcJnPDqLUdY4BO9LG+p022Wnndxb9L49L
	oRbe1tRZRgtW+gmrMt38Xz5U+FodUnt84Bqn7sVsIrM86A30vvafcV5yRDJtzG6J2ArK
	1BIsd/zk3aWBUUd9YJeaqGU1Kffc73NOHY1Z0=
MIME-Version: 1.0
Received: by 10.231.15.136 with SMTP id k8mr7333845iba.51.1290460704630; Mon,
	22 Nov 2010 13:18:24 -0800 (PST)
Received: by 10.231.33.4 with HTTP; Mon, 22 Nov 2010 13:18:24 -0800 (PST)
In-Reply-To: <AANLkTi=QoWn7136TxZ9WOJydF9og7dC3mTuzt3CJDn33@mail.gmail.com>
References: <1290455639-7387-1-git-send-email-fransmeulenbroeks@gmail.com>
	<AANLkTi=QoWn7136TxZ9WOJydF9og7dC3mTuzt3CJDn33@mail.gmail.com>
Date: Mon, 22 Nov 2010 22:18:24 +0100
Message-ID: <AANLkTi=OATb64XP6nRBUiKiOQQ3Q3sqzgy9corHHiG57@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v3] uclibc++: moved to git head
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
X-List-Received-Date: Mon, 22 Nov 2010 21:19:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/11/22 Khem Raj <raj.khem@gmail.com>:
> On Mon, Nov 22, 2010 at 11:53 AM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> Removed the 0.1.9 version as it is quite old and does not compile
>> renamed files dir to uclibc++
>> added patches to get things compiling.
>> Patches are gracefully picked from openwrt
>> (https://dev.openwrt.org/browser/packages/libs/uclibc%2B%2B/patches?rev=
=3D24017)
>>
>> note that it was decided to move to git head instead of the latest relea=
se (0.2.2)
>> because there were quite some patches after 0.2.2 was made and it does n=
ot look like there will
>> be a new release soon (there is hardly any activity last 2 years or so).
>>
>> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>
> looks ok, It would be good if you were more precise on the license versio=
ns

Oops. I'm sure I changed it but guess that was lost somewhere
it is LGPLv2+. Changed it. Will make sure it is in the patch when I push it=
.

Frans

>
> Acked-by: Khem Raj <raj.khem@gmail.com>
>
>
>> ---
>>
>> moved to latest git version
>> this also eliminated some patches that are now upstream
>>
>> =A0recipes/uclibc++/files/defconfig =A0 =A0 =A0 =A0 =A0 =A0 | =A0 64 ---=
-----------------------
>> =A0recipes/uclibc++/files/nobash.patch =A0 =A0 =A0 =A0 =A0| =A0 13 -----
>> =A0recipes/uclibc++/uclibc++/006-eabi_fix.patch | =A0 42 +++++++++++++++=
++
>> =A0recipes/uclibc++/uclibc++/defconfig =A0 =A0 =A0 =A0 =A0| =A0 53 +++++=
++++++++++++++++
>> =A0recipes/uclibc++/uclibc++_0.1.9.bb =A0 =A0 =A0 =A0 =A0 | =A0 54 -----=
-----------------
>> =A0recipes/uclibc++/uclibc++_git.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 47 +++=
++++++++++++++++
>> =A06 files changed, 142 insertions(+), 131 deletions(-)
>> =A0delete mode 100644 recipes/uclibc++/files/defconfig
>> =A0delete mode 100644 recipes/uclibc++/files/nobash.patch
>> =A0create mode 100644 recipes/uclibc++/uclibc++/006-eabi_fix.patch
>> =A0create mode 100644 recipes/uclibc++/uclibc++/defconfig
>> =A0delete mode 100644 recipes/uclibc++/uclibc++_0.1.9.bb
>> =A0create mode 100644 recipes/uclibc++/uclibc++_git.bb
>>
>> diff --git a/recipes/uclibc++/files/defconfig b/recipes/uclibc++/files/d=
efconfig
>> deleted file mode 100644
>> index 19b4aa5..0000000
>> --- a/recipes/uclibc++/files/defconfig
>> +++ /dev/null
>> @@ -1,64 +0,0 @@
>> -#
>> -# Automatically generated make config: don't edit
>> -#
>> -# TARGET_arm is not set
>> -TARGET_i386=3Dy
>> -# TARGET_powerpc is not set
>> -
>> -#
>> -# Target Architecture Features and Options
>> -#
>> -HAVE_ELF=3Dy
>> -TARGET_ARCH=3D"i386"
>> -# CONFIG_GENERIC_386 is not set
>> -# CONFIG_386 is not set
>> -# CONFIG_486 is not set
>> -# CONFIG_586 is not set
>> -# CONFIG_586MMX is not set
>> -# CONFIG_686 is not set
>> -# CONFIG_PENTIUMIII is not set
>> -CONFIG_PENTIUM4=3Dy
>> -# CONFIG_K6 is not set
>> -# CONFIG_K7 is not set
>> -# CONFIG_CRUSOE is not set
>> -# CONFIG_WINCHIPC6 is not set
>> -# CONFIG_WINCHIP2 is not set
>> -# CONFIG_CYRIXIII is not set
>> -ARCH_LITTLE_ENDIAN=3Dy
>> -# ARCH_BIG_ENDIAN is not set
>> -UCLIBCXX_HAS_FLOATS=3Dy
>> -WARNINGS=3D"-Wall"
>> -HAVE_DOT_CONFIG=3Dy
>> -
>> -#
>> -# String and I/O Stream Support
>> -#
>> -# UCLIBCXX_HAS_WCHAR is not set
>> -UCLIBCXX_IOSTREAM_BUFSIZE=3D32
>> -UCLIBCXX_HAS_LFS=3Dy
>> -UCLIBCXX_SUPPORT_CDIR=3Dy
>> -UCLIBCXX_SUPPORT_CIN=3Dy
>> -UCLIBCXX_SUPPORT_COUT=3Dy
>> -UCLIBCXX_SUPPORT_CERR=3Dy
>> -
>> -#
>> -# STL and Code Expansion
>> -#
>> -UCLIBCXX_STL_BUFFER_SIZE=3D32
>> -UCLIBCXX_CODE_EXPANSION=3Dy
>> -UCLIBCXX_EXPAND_STRING_CHAR=3Dy
>> -UCLIBCXX_EXPAND_VECTOR_BASIC=3Dy
>> -UCLIBCXX_EXPAND_ISTREAM_CHAR=3Dy
>> -UCLIBCXX_EXPAND_OSTREAM_CHAR=3Dy
>> -UCLIBCXX_EXPAND_FSTREAM_CHAR=3Dy
>> -
>> -#
>> -# Library Installation Options
>> -#
>> -UCLIBCXX_RUNTIME_PREFIX=3D"/usr/$(TARGET_ARCH)-linux-uclibc"
>> -UCLIBCXX_RUNTIME_INCLUDE_SUBDIR=3D"/include"
>> -UCLIBCXX_RUNTIME_LIB_SUBDIR=3D"/lib"
>> -UCLIBCXX_RUNTIME_BIN_SUBDIR=3D"/bin"
>> -UCLIBCXX_EXCEPTION_SUPPORT=3Dy
>> -IMPORT_LIBSUP=3Dy
>> -# DODEBUG is not set
>> diff --git a/recipes/uclibc++/files/nobash.patch b/recipes/uclibc++/file=
s/nobash.patch
>> deleted file mode 100644
>> index 657c47b..0000000
>> --- a/recipes/uclibc++/files/nobash.patch
>> +++ /dev/null
>> @@ -1,13 +0,0 @@
>> -Index: uClibc++/bin/Makefile
>> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> ---- uClibc++.orig/bin/Makefile 2005-01-18 12:22:26.000000000 -0500
>> -+++ uClibc++/bin/Makefile =A0 =A0 =A02005-03-10 18:19:30.799531304 -050=
0
>> -@@ -26,7 +26,7 @@
>> - =A0 =A0 =A0 $(INSTALL) -m 755 $(WRAPPER) $(PREFIX)$(UCLIBCXX_RUNTIME_P=
REFIX)$(UCLIBCXX_RUNTIME_BIN_SUBDIR)
>> -
>> - $(WRAPPER):
>> -- =A0 =A0 =A0echo "#!/bin/bash" > $(WRAPPER)
>> -+ =A0 =A0 =A0echo "#!/bin/sh" > $(WRAPPER)
>> - =A0 =A0 =A0 echo "" >> $(WRAPPER)
>> - =A0 =A0 =A0 echo "OPTIONS=3D\"$(INITIALOPTIONS)\"" >> $(WRAPPER)
>> - =A0 =A0 =A0 echo 'INCLIB=3D"Y"' >> $(WRAPPER)
>> diff --git a/recipes/uclibc++/uclibc++/006-eabi_fix.patch b/recipes/ucli=
bc++/uclibc++/006-eabi_fix.patch
>> new file mode 100644
>> index 0000000..bc970a7
>> --- /dev/null
>> +++ b/recipes/uclibc++/uclibc++/006-eabi_fix.patch
>> @@ -0,0 +1,42 @@
>> +Index: uClibc++-0.2.2/include/typeinfo
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- uClibc++-0.2.2.orig/include/typeinfo =A0 =A0 =A0 2008-02-13 00:37:0=
4.000000000 +0100
>> ++++ uClibc++-0.2.2/include/typeinfo =A0 =A02008-02-13 00:37:34.00000000=
0 +0100
>> +@@ -44,6 +44,7 @@
>> + =A0 class __class_type_info;
>> + } // namespace __cxxabiv1
>> +
>> ++#ifndef __GXX_MERGED_TYPEINFO_NAMES
>> + #if !__GXX_WEAK__
>> + =A0 // If weak symbols are not supported, typeinfo names are not merge=
d.
>> + =A0 #define __GXX_MERGED_TYPEINFO_NAMES 0
>> +@@ -51,6 +52,7 @@
>> + =A0 // On platforms that support weak symbols, typeinfo names are merg=
ed.
>> + =A0 #define __GXX_MERGED_TYPEINFO_NAMES 1
>> + #endif
>> ++#endif
>> +
>> + namespace std
>> + {
>> +Index: uClibc++-0.2.2/include/unwind-cxx.h
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- uClibc++-0.2.2.orig/include/unwind-cxx.h =A0 2008-02-13 00:38:04.00=
0000000 +0100
>> ++++ uClibc++-0.2.2/include/unwind-cxx.h =A0 =A0 =A0 =A02008-02-13 00:40=
:32.000000000 +0100
>> +@@ -135,6 +135,7 @@
>> +
>> + // This is the exception class we report -- "GNUCC++\0".
>> + const _Unwind_Exception_Class __gxx_exception_class
>> ++#ifndef __ARM_EABI_UNWINDER__
>> + =3D ((((((((_Unwind_Exception_Class) 'G'
>> + =A0 =A0 =A0 =A0<< 8 | (_Unwind_Exception_Class) 'N')
>> + =A0 =A0 =A0 << 8 | (_Unwind_Exception_Class) 'U')
>> +@@ -143,6 +144,9 @@
>> + =A0 =A0 =A0<< 8 | (_Unwind_Exception_Class) '+')
>> + =A0 =A0 << 8 | (_Unwind_Exception_Class) '+')
>> + =A0 =A0<< 8 | (_Unwind_Exception_Class) '\0');
>> ++#else
>> ++=3D "GNUC++";
>> ++#endif
>> +
>> + // GNU C++ personality routine, Version 0.
>> + extern "C" _Unwind_Reason_Code __gxx_personality_v0
>> diff --git a/recipes/uclibc++/uclibc++/defconfig b/recipes/uclibc++/ucli=
bc++/defconfig
>> new file mode 100644
>> index 0000000..168e9a4
>> --- /dev/null
>> +++ b/recipes/uclibc++/uclibc++/defconfig
>> @@ -0,0 +1,53 @@
>> +#
>> +# Automatically generated make config: don't edit
>> +#
>> +
>> +#
>> +# Target Features and Options
>> +#
>> +# UCLIBCXX_HAS_FLOATS is not set
>> +UCLIBCXX_HAS_TLS=3Dy
>> +WARNINGS=3D"-Wall"
>> +BUILD_EXTRA_LIBRARIES=3D""
>> +HAVE_DOT_CONFIG=3Dy
>> +
>> +#
>> +# String and I/O Stream Support
>> +#
>> +# UCLIBCXX_HAS_WCHAR is not set
>> +UCLIBCXX_IOSTREAM_BUFSIZE=3D32
>> +UCLIBCXX_HAS_LFS=3Dy
>> +UCLIBCXX_SUPPORT_CDIR=3Dy
>> +UCLIBCXX_SUPPORT_CIN=3Dy
>> +UCLIBCXX_SUPPORT_COUT=3Dy
>> +UCLIBCXX_SUPPORT_CERR=3Dy
>> +# UCLIBCXX_SUPPORT_CLOG is not set
>> +
>> +#
>> +# STL and Code Expansion
>> +#
>> +UCLIBCXX_STL_BUFFER_SIZE=3D32
>> +UCLIBCXX_CODE_EXPANSION=3Dy
>> +UCLIBCXX_EXPAND_CONSTRUCTORS_DESTRUCTORS=3Dy
>> +UCLIBCXX_EXPAND_STRING_CHAR=3Dy
>> +UCLIBCXX_EXPAND_VECTOR_BASIC=3Dy
>> +UCLIBCXX_EXPAND_IOS_CHAR=3Dy
>> +UCLIBCXX_EXPAND_STREAMBUF_CHAR=3Dy
>> +UCLIBCXX_EXPAND_ISTREAM_CHAR=3Dy
>> +UCLIBCXX_EXPAND_OSTREAM_CHAR=3Dy
>> +UCLIBCXX_EXPAND_FSTREAM_CHAR=3Dy
>> +UCLIBCXX_EXPAND_SSTREAM_CHAR=3Dy
>> +
>> +#
>> +# Library Installation Options
>> +#
>> +UCLIBCXX_RUNTIME_PREFIX=3D"/usr/uClibc++"
>> +UCLIBCXX_RUNTIME_INCLUDE_SUBDIR=3D"/include"
>> +UCLIBCXX_RUNTIME_LIB_SUBDIR=3D"/lib"
>> +UCLIBCXX_RUNTIME_BIN_SUBDIR=3D"/bin"
>> +UCLIBCXX_EXCEPTION_SUPPORT=3Dy
>> +IMPORT_LIBSUP=3Dy
>> +IMPORT_LIBGCC_EH=3Dy
>> +BUILD_STATIC_LIB=3Dy
>> +# BUILD_ONLY_STATIC_LIB is not set
>> +# DODEBUG is not set
>> diff --git a/recipes/uclibc++/uclibc++_0.1.9.bb b/recipes/uclibc++/uclib=
c++_0.1.9.bb
>> deleted file mode 100644
>> index be1ac14..0000000
>> --- a/recipes/uclibc++/uclibc++_0.1.9.bb
>> +++ /dev/null
>> @@ -1,54 +0,0 @@
>> -DESCRIPTION =3D "A C++ standard library targeted towards the embedded \
>> -systems/software market."
>> -HOMEPAGE =3D "http://cxx.uclibc.org/"
>> -LICENSE =3D "LGPL"
>> -PRIORITY =3D "optional"
>> -SECTION =3D "libs"
>> -
>> -PR =3D "r2"
>> -
>> -SRC_URI =3D "http://cxx.uclibc.org/src/uClibc++-${PV}.tbz2 \
>> - =A0 =A0 =A0 =A0 =A0file://nobash.patch \
>> - =A0 =A0 =A0 =A0 =A0file://defconfig"
>> -S =3D "${WORKDIR}/uClibc++"
>> -
>> -# uClibc++ runtime prefix directory (UCLIBCXX_RUNTIME_PREFIX) [/usr/$(T=
ARGET_ARCH)-linux-uclibc] (NEW)
>> -# uClibc++ header file subdirectory (UCLIBCXX_RUNTIME_INCLUDE_SUBDIR) [=
/include] (NEW)
>> -# uClibc++ library subdirectory (UCLIBCXX_RUNTIME_LIB_SUBDIR) [/lib] (N=
EW)
>> -# uClibc++ application file subdirectory (UCLIBCXX_RUNTIME_BIN_SUBDIR) =
[/bin] (NEW)
>> -
>> -do_unpack_real () {
>> - =A0 =A0 =A0 bzcat uClibc++-${PV}.tbz2 | tar -xvf -
>> -}
>> -do_unpack_real[dirs] =3D "${WORKDIR}"
>> -addtask unpack_real before do_patch after do_unpack
>> -
>> -EXTRA_OEMAKE =3D "'OPTIMIZATION=3D' 'XWARNINGS=3D' 'XARCH_CFLAGS=3D${CF=
LAGS}' \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 'CPU_FLAGS=3D' 'STRIPTOOL=3Dtrue' 'LD=3D${=
LD}'"
>> -configmangle =3D 's,^UCLIBCXX_RUNTIME_PREFIX=3D.*,UCLIBCXX_RUNTIME_PREF=
IX=3D"${exec_prefix}",; \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s,^UCLIBCXX_RUNTIME_INCLUDE_SUBDIR=3D.*,UC=
LIBCXX_RUNTIME_INCLUDE_SUBDIR=3D"/include/c++-uc",; \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s,^UCLIBCXX_RUNTIME_LIB_SUBDIR=3D.*,UCLIBC=
XX_RUNTIME_LIB_SUBDIR=3D"/lib",; \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s,^UCLIBCXX_RUNTIME_BIN_SUBDIR=3D.*,UCLIBC=
XX_RUNTIME_BIN_SUBDIR=3D"/bin",;'
>> -PARALLEL_MAKE =3D ""
>> -
>> -do_configure () {
>> - =A0 =A0 =A0 cp ${WORKDIR}/defconfig ${S}/.config
>> -
>> - =A0 =A0 =A0 perl -i -p -e 's,^CROSS=3D.*,TARGET_ARCH=3D${TARGET_ARCH}\=
nCROSS=3D${TARGET_PREFIX},g' ${S}/Rules.mak
>> - =A0 =A0 =A0 perl -i -p -e '${configmangle}' ${S}/.config
>> -
>> - =A0 =A0 =A0 oe_runmake oldconfig
>> -}
>> -
>> -do_install () {
>> - =A0 =A0 =A0 oe_runmake 'DESTDIR=3D${D}' install
>> - =A0 =A0 =A0 chmod +x ${D}${libdir}/libuClibc++.so.*
>> -}
>> -
>> -PACKAGES =3D "g++-uc libuclibc++ libuclibc++-dev"
>> -FILES_g++-uc =3D "${bindir}/g++-uc"
>> -FILES_libuclibc++ =3D "${libdir}/*.so.*"
>> -FILES_libuclibc++-dev =3D "${FILES_uclibc++-dev}"
>> -
>> -SRC_URI[md5sum] =3D "ebf58e04d72eab5c131c2c9118737024"
>> -SRC_URI[sha256sum] =3D "82342a5d6088421e79699dd7af614ebecf6dd335eabce07=
690902a379f5ea8de"
>> diff --git a/recipes/uclibc++/uclibc++_git.bb b/recipes/uclibc++/uclibc+=
+_git.bb
>> new file mode 100644
>> index 0000000..5b0d374
>> --- /dev/null
>> +++ b/recipes/uclibc++/uclibc++_git.bb
>> @@ -0,0 +1,47 @@
>> +DESCRIPTION =3D "A C++ standard library targeted towards the embedded \
>> +systems/software market."
>> +HOMEPAGE =3D "http://cxx.uclibc.org/"
>> +LICENSE =3D "LGPL"
>> +PRIORITY =3D "optional"
>> +SECTION =3D "libs"
>> +
>> +PR =3D "r0"
>> +
>> +SRCREV =3D "7efcc107b6bf7a59a85beaf7c7f35da6de0f321e"
>> +
>> +SRC_URI =3D "git://git.busybox.net/uClibc++;protocol=3Dgit \
>> + =A0 =A0 =A0 =A0 =A0file://006-eabi_fix.patch \
>> + =A0 =A0 =A0 =A0 =A0file://defconfig"
>> +S =3D "${WORKDIR}/git"
>> +
>> +# uClibc++ runtime prefix directory (UCLIBCXX_RUNTIME_PREFIX) [/usr/$(T=
ARGET_ARCH)-linux-uclibc] (NEW)
>> +# uClibc++ header file subdirectory (UCLIBCXX_RUNTIME_INCLUDE_SUBDIR) [=
/include] (NEW)
>> +# uClibc++ library subdirectory (UCLIBCXX_RUNTIME_LIB_SUBDIR) [/lib] (N=
EW)
>> +# uClibc++ application file subdirectory (UCLIBCXX_RUNTIME_BIN_SUBDIR) =
[/bin] (NEW)
>> +
>> +EXTRA_OEMAKE =3D "'OPTIMIZATION=3D' 'XWARNINGS=3D' 'XARCH_CFLAGS=3D${CF=
LAGS}' \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 'CPU_FLAGS=3D' 'STRIPTOOL=3Dtrue' 'LD=3D${=
LD}'"
>> +configmangle =3D 's,^UCLIBCXX_RUNTIME_PREFIX=3D.*,UCLIBCXX_RUNTIME_PREF=
IX=3D"${exec_prefix}",; \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s,^UCLIBCXX_RUNTIME_INCLUDE_SUBDIR=3D.*,UC=
LIBCXX_RUNTIME_INCLUDE_SUBDIR=3D"/include/c++-uc",; \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s,^UCLIBCXX_RUNTIME_LIB_SUBDIR=3D.*,UCLIBC=
XX_RUNTIME_LIB_SUBDIR=3D"/lib",; \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s,^UCLIBCXX_RUNTIME_BIN_SUBDIR=3D.*,UCLIBC=
XX_RUNTIME_BIN_SUBDIR=3D"/bin",;'
>> +PARALLEL_MAKE =3D ""
>> +
>> +do_configure () {
>> + =A0 =A0 =A0 cp ${WORKDIR}/defconfig ${S}/.config
>> +
>> + =A0 =A0 =A0 perl -i -p -e 's,^CROSS=3D.*,TARGET_ARCH=3D${TARGET_ARCH}\=
nCROSS=3D${TARGET_PREFIX},g' ${S}/Rules.mak
>> + =A0 =A0 =A0 perl -i -p -e '${configmangle}' ${S}/.config
>> +
>> + =A0 =A0 =A0 oe_runmake oldconfig
>> +}
>> +
>> +do_install () {
>> + =A0 =A0 =A0 oe_runmake 'DESTDIR=3D${D}' install
>> + =A0 =A0 =A0 chmod +x ${D}${libdir}/libuClibc++.so.*
>> +}
>> +
>> +PACKAGES =3D "g++-uc libuclibc++ libuclibc++-dev"
>> +FILES_g++-uc =3D "${bindir}/g++-uc"
>> +FILES_libuclibc++ =3D "${libdir}/*.so.*"
>> +FILES_libuclibc++-dev =3D "${FILES_uclibc++-dev}"
>> --
>> 1.6.4.2
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


