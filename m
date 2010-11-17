Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PInQ0-0000NK-OV
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 20:13:23 +0100
Received: by gwaa11 with SMTP id a11so1388268gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Nov 2010 11:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=p7w/xIclbQ2d819g+s0pavP5wxWNjAhvWNJ1NeUFPwY=;
	b=EirQuLzb594H6RxA7hJvspKxSvvtPOL/FeRD82lei1EbXzHld8uNFJOZwOl+iK/J9r
	j06j9GII4u6grLbcJOTwtzr53ocFKjH4I3FhNPI49kCijTkb5LZz7duqJYWkFXWUadtF
	WuHB78d+fl0xynqIyNKunQJ7E1VH1PaZ3Ay/Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=n7r2bhO2yZT+ldy0o1QrtzyfEArTIW/t4eG+IsurkIjLIRR7uKPe6Juo7Q55sM/iiS
	jfWSEsh40KRCHk8bujZB6pXhOCcUNPI10DPM3xoCx+AuHkWc/7GP7NyH7+zO6s/hz7J0
	kewDdyK97H93ytELpy07oelTKiBgIBrPdwTtY=
Received: by 10.91.42.30 with SMTP id u30mr12001814agj.102.1290021020597; Wed,
	17 Nov 2010 11:10:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Wed, 17 Nov 2010 11:09:58 -0800 (PST)
In-Reply-To: <1289988503-14693-1-git-send-email-fransmeulenbroeks@gmail.com>
References: <1289988503-14693-1-git-send-email-fransmeulenbroeks@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Nov 2010 11:09:58 -0800
Message-ID: <AANLkTi=YqETnOXFgSfbGvaR8AbW0HAtnm2=ZJVNCboUM@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] uclibc++: moved to 0.2.2
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
X-List-Received-Date: Wed, 17 Nov 2010 19:14:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 17, 2010 at 2:08 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> Removed the 0.1.9 version as it is quite old and does not compile
> renamed files dir to uclibc++
> added patches to get 0.2.2 compiling.
> Patches are gracefully picked from openwrt
> (https://dev.openwrt.org/browser/packages/libs/uclibc%2B%2B/patches?rev=
=3D24017)
>
> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>
> ---
>
> For the review:
> note that I also added a patch for include/cstring (cstring.patch).
>
> With that patch the stuff compiles, without it I get these errors
> (distro minimal, target calamari, eglibc)
> If there is a better solution, please advise.
>
> | WRAPPER_INCLUDEDIR=3D-I../include ../bin/g++-uc =C2=A0 =C2=A0-ansi =C2=
=A0-fPIC -o eh_alloc.o -c eh_alloc.cpp
> | In file included from eh_alloc.cpp:21:0:
> | ../include/cstring: In function 'void* std::memchr(void*, int, size_t)'=
:
> | ../include/cstring:55:46: error: 'void* std::memchr(void*, int, size_t)=
' conflicts with previous using declaration 'void* memchr(void*, int, size_=
t)'
> | ../include/cstring:56:50: error: invalid conversion from 'const void*' =
to 'void*'
> | ../include/cstring: In function 'char* std::strchr(char*, int)':
> | ../include/cstring:59:36: error: 'char* std::strchr(char*, int)' confli=
cts with previous using declaration 'char* strchr(char*, int)'
> | ../include/cstring:60:47: error: invalid conversion from 'const char*' =
to 'char*'
> | ../include/cstring: In function 'char* std::strpbrk(char*, const char*)=
':
> | ../include/cstring:63:47: error: 'char* std::strpbrk(char*, const char*=
)' conflicts with previous using declaration 'char* strpbrk(char*, const ch=
ar*)'
> | ../include/cstring:64:50: error: invalid conversion from 'const char*' =
to 'char*'
> | ../include/cstring: In function 'char* std::strrchr(char*, int)':
> | ../include/cstring:67:37: error: 'char* std::strrchr(char*, int)' confl=
icts with previous using declaration 'char* strrchr(char*, int)'
> | ../include/cstring:68:48: error: invalid conversion from 'const char*' =
to 'char*'
> | ../include/cstring: In function 'char* std::strstr(char*, const char*)'=
:
> | ../include/cstring:71:46: error: 'char* std::strstr(char*, const char*)=
' conflicts with previous using declaration 'char* strstr(char*, const char=
*)'
> | ../include/cstring:72:49: error: invalid conversion from 'const char*' =
to 'char*'
> | make[1]: *** [eh_alloc.o] Error 1
> | make[1]: Leaving directory `/home/frans/workspace/tmp/work/ppce500v2-oe=
-linux-gnuspe/uclibc++-0.2.2-r1/uClibc++-0.2.2/src'
> | make: *** [all] Error 2
> | FATAL: oe_runmake failed
> | ERROR: Function do_compile failed
> ---
> =C2=A0recipes/uclibc++/files/defconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 64 ------------------
> =C2=A0recipes/uclibc++/files/nobash.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 13 ----
> =C2=A0recipes/uclibc++/uclibc++/006-eabi_fix.patch =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 42 ++++++++++++
> =C2=A0recipes/uclibc++/uclibc++/009-compile_fixes.patch =C2=A0| =C2=A0 70=
 ++++++++++++++++++++
> =C2=A0.../uclibc++/900-dependent_exception.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 68 +++++++++++++++++++
> =C2=A0recipes/uclibc++/uclibc++/cstring.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 21 ++++++
> =C2=A0recipes/uclibc++/uclibc++/defconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 53 +++++++++++++++
> =C2=A0recipes/uclibc++/uclibc++/nobash.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 13 ++++
> =C2=A0recipes/uclibc++/uclibc++_0.1.9.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 54 ---------------
> =C2=A0recipes/uclibc++/uclibc++_0.2.2.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 57 ++++++++++++++++
> =C2=A010 files changed, 324 insertions(+), 131 deletions(-)
> =C2=A0delete mode 100644 recipes/uclibc++/files/defconfig
> =C2=A0delete mode 100644 recipes/uclibc++/files/nobash.patch
> =C2=A0create mode 100644 recipes/uclibc++/uclibc++/006-eabi_fix.patch
> =C2=A0create mode 100644 recipes/uclibc++/uclibc++/009-compile_fixes.patc=
h
> =C2=A0create mode 100644 recipes/uclibc++/uclibc++/900-dependent_exceptio=
n.patch
> =C2=A0create mode 100644 recipes/uclibc++/uclibc++/cstring.patch
> =C2=A0create mode 100644 recipes/uclibc++/uclibc++/defconfig
> =C2=A0create mode 100644 recipes/uclibc++/uclibc++/nobash.patch
> =C2=A0delete mode 100644 recipes/uclibc++/uclibc++_0.1.9.bb
> =C2=A0create mode 100644 recipes/uclibc++/uclibc++_0.2.2.bb
>
> diff --git a/recipes/uclibc++/files/defconfig b/recipes/uclibc++/files/de=
fconfig
> deleted file mode 100644
> index 19b4aa5..0000000
> --- a/recipes/uclibc++/files/defconfig
> +++ /dev/null
> @@ -1,64 +0,0 @@
> -#
> -# Automatically generated make config: don't edit
> -#
> -# TARGET_arm is not set
> -TARGET_i386=3Dy
> -# TARGET_powerpc is not set
> -
> -#
> -# Target Architecture Features and Options
> -#
> -HAVE_ELF=3Dy
> -TARGET_ARCH=3D"i386"
> -# CONFIG_GENERIC_386 is not set
> -# CONFIG_386 is not set
> -# CONFIG_486 is not set
> -# CONFIG_586 is not set
> -# CONFIG_586MMX is not set
> -# CONFIG_686 is not set
> -# CONFIG_PENTIUMIII is not set
> -CONFIG_PENTIUM4=3Dy
> -# CONFIG_K6 is not set
> -# CONFIG_K7 is not set
> -# CONFIG_CRUSOE is not set
> -# CONFIG_WINCHIPC6 is not set
> -# CONFIG_WINCHIP2 is not set
> -# CONFIG_CYRIXIII is not set
> -ARCH_LITTLE_ENDIAN=3Dy
> -# ARCH_BIG_ENDIAN is not set
> -UCLIBCXX_HAS_FLOATS=3Dy
> -WARNINGS=3D"-Wall"
> -HAVE_DOT_CONFIG=3Dy
> -
> -#
> -# String and I/O Stream Support
> -#
> -# UCLIBCXX_HAS_WCHAR is not set
> -UCLIBCXX_IOSTREAM_BUFSIZE=3D32
> -UCLIBCXX_HAS_LFS=3Dy
> -UCLIBCXX_SUPPORT_CDIR=3Dy
> -UCLIBCXX_SUPPORT_CIN=3Dy
> -UCLIBCXX_SUPPORT_COUT=3Dy
> -UCLIBCXX_SUPPORT_CERR=3Dy
> -
> -#
> -# STL and Code Expansion
> -#
> -UCLIBCXX_STL_BUFFER_SIZE=3D32
> -UCLIBCXX_CODE_EXPANSION=3Dy
> -UCLIBCXX_EXPAND_STRING_CHAR=3Dy
> -UCLIBCXX_EXPAND_VECTOR_BASIC=3Dy
> -UCLIBCXX_EXPAND_ISTREAM_CHAR=3Dy
> -UCLIBCXX_EXPAND_OSTREAM_CHAR=3Dy
> -UCLIBCXX_EXPAND_FSTREAM_CHAR=3Dy
> -
> -#
> -# Library Installation Options
> -#
> -UCLIBCXX_RUNTIME_PREFIX=3D"/usr/$(TARGET_ARCH)-linux-uclibc"
> -UCLIBCXX_RUNTIME_INCLUDE_SUBDIR=3D"/include"
> -UCLIBCXX_RUNTIME_LIB_SUBDIR=3D"/lib"
> -UCLIBCXX_RUNTIME_BIN_SUBDIR=3D"/bin"
> -UCLIBCXX_EXCEPTION_SUPPORT=3Dy
> -IMPORT_LIBSUP=3Dy
> -# DODEBUG is not set
> diff --git a/recipes/uclibc++/files/nobash.patch b/recipes/uclibc++/files=
/nobash.patch
> deleted file mode 100644
> index 657c47b..0000000
> --- a/recipes/uclibc++/files/nobash.patch
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -Index: uClibc++/bin/Makefile
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- uClibc++.orig/bin/Makefile 2005-01-18 12:22:26.000000000 -0500
> -+++ uClibc++/bin/Makefile =C2=A0 =C2=A0 =C2=A02005-03-10 18:19:30.799531=
304 -0500
> -@@ -26,7 +26,7 @@
> - =C2=A0 =C2=A0 =C2=A0 $(INSTALL) -m 755 $(WRAPPER) $(PREFIX)$(UCLIBCXX_R=
UNTIME_PREFIX)$(UCLIBCXX_RUNTIME_BIN_SUBDIR)
> -
> - $(WRAPPER):
> -- =C2=A0 =C2=A0 =C2=A0echo "#!/bin/bash" > $(WRAPPER)
> -+ =C2=A0 =C2=A0 =C2=A0echo "#!/bin/sh" > $(WRAPPER)
> - =C2=A0 =C2=A0 =C2=A0 echo "" >> $(WRAPPER)
> - =C2=A0 =C2=A0 =C2=A0 echo "OPTIONS=3D\"$(INITIALOPTIONS)\"" >> $(WRAPPE=
R)
> - =C2=A0 =C2=A0 =C2=A0 echo 'INCLIB=3D"Y"' >> $(WRAPPER)
> diff --git a/recipes/uclibc++/uclibc++/006-eabi_fix.patch b/recipes/uclib=
c++/uclibc++/006-eabi_fix.patch
> new file mode 100644
> index 0000000..bc970a7
> --- /dev/null
> +++ b/recipes/uclibc++/uclibc++/006-eabi_fix.patch
> @@ -0,0 +1,42 @@
> +Index: uClibc++-0.2.2/include/typeinfo
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- uClibc++-0.2.2.orig/include/typeinfo =C2=A0 =C2=A0 =C2=A0 2008-02-13=
 00:37:04.000000000 +0100
> ++++ uClibc++-0.2.2/include/typeinfo =C2=A0 =C2=A02008-02-13 00:37:34.000=
000000 +0100
> +@@ -44,6 +44,7 @@
> + =C2=A0 class __class_type_info;
> + } // namespace __cxxabiv1
> +
> ++#ifndef __GXX_MERGED_TYPEINFO_NAMES
> + #if !__GXX_WEAK__
> + =C2=A0 // If weak symbols are not supported, typeinfo names are not mer=
ged.
> + =C2=A0 #define __GXX_MERGED_TYPEINFO_NAMES 0
> +@@ -51,6 +52,7 @@
> + =C2=A0 // On platforms that support weak symbols, typeinfo names are me=
rged.
> + =C2=A0 #define __GXX_MERGED_TYPEINFO_NAMES 1
> + #endif
> ++#endif
> +
> + namespace std
> + {
> +Index: uClibc++-0.2.2/include/unwind-cxx.h
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- uClibc++-0.2.2.orig/include/unwind-cxx.h =C2=A0 2008-02-13 00:38:04.=
000000000 +0100
> ++++ uClibc++-0.2.2/include/unwind-cxx.h =C2=A0 =C2=A0 =C2=A0 =C2=A02008-=
02-13 00:40:32.000000000 +0100
> +@@ -135,6 +135,7 @@
> +
> + // This is the exception class we report -- "GNUCC++\0".
> + const _Unwind_Exception_Class __gxx_exception_class
> ++#ifndef __ARM_EABI_UNWINDER__
> + =3D ((((((((_Unwind_Exception_Class) 'G'
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0<< 8 | (_Unwind_Exception_Class) 'N')
> + =C2=A0 =C2=A0 =C2=A0 << 8 | (_Unwind_Exception_Class) 'U')
> +@@ -143,6 +144,9 @@
> + =C2=A0 =C2=A0 =C2=A0<< 8 | (_Unwind_Exception_Class) '+')
> + =C2=A0 =C2=A0 << 8 | (_Unwind_Exception_Class) '+')
> + =C2=A0 =C2=A0<< 8 | (_Unwind_Exception_Class) '\0');
> ++#else
> ++=3D "GNUC++";
> ++#endif
> +
> + // GNU C++ personality routine, Version 0.
> + extern "C" _Unwind_Reason_Code __gxx_personality_v0
> diff --git a/recipes/uclibc++/uclibc++/009-compile_fixes.patch b/recipes/=
uclibc++/uclibc++/009-compile_fixes.patch
> new file mode 100644
> index 0000000..efcb9e6
> --- /dev/null
> +++ b/recipes/uclibc++/uclibc++/009-compile_fixes.patch
> @@ -0,0 +1,70 @@
> +--- a/include/associative_base
> ++++ b/include/associative_base
> +@@ -318,7 +318,7 @@ protected:
> + =C2=A0 =C2=A0 =C2=A0 typedef std::list<ValueType> listtype;
> +
> + =C2=A0 =C2=A0 =C2=A0 typename listtype::iterator base_iter;
> +- =C2=A0 =C2=A0 =C2=A0typedef _associative_citer<ValueType, Compare, All=
ocator> _associative_citer;
> ++ =C2=A0 =C2=A0 =C2=A0typedef _associative_citer<ValueType, Compare, All=
ocator> __associative_citer;
> +
> +
> + public:
> +@@ -347,13 +347,13 @@ public:
> + =C2=A0 =C2=A0 =C2=A0 bool operator=3D=3D(const _associative_iter & m) c=
onst{
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return m.base_iter =3D=
=3D base_iter;
> + =C2=A0 =C2=A0 =C2=A0 }
> +- =C2=A0 =C2=A0 =C2=A0bool operator=3D=3D(const _associative_citer & m) =
const{
> ++ =C2=A0 =C2=A0 =C2=A0bool operator=3D=3D(const __associative_citer & m)=
 const{
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return m.base_iter =3D=
=3D base_iter;
> + =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 bool operator!=3D(const _associative_iter & m) con=
st{
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return m.base_iter !=
=3D base_iter;
> + =C2=A0 =C2=A0 =C2=A0 }
> +- =C2=A0 =C2=A0 =C2=A0bool operator!=3D(const _associative_citer & m) co=
nst{
> ++ =C2=A0 =C2=A0 =C2=A0bool operator!=3D(const __associative_citer & m) c=
onst{
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return m.base_iter !=
=3D base_iter;
> + =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 _associative_iter & operator++(){
> +@@ -378,8 +378,8 @@ public:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --base_iter;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return temp;
> + =C2=A0 =C2=A0 =C2=A0 }
> +- =C2=A0 =C2=A0 =C2=A0operator _associative_citer() const{
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return _associative_ci=
ter(base_iter);
> ++ =C2=A0 =C2=A0 =C2=A0operator __associative_citer() const{
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return __associative_c=
iter(base_iter);
> + =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 typename listtype::iterator base_iterator(){
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return base_iter;
> +--- a/include/string
> ++++ b/include/string
> +@@ -1017,11 +1017,11 @@ template<class charT, class traits, clas
> +
> + template <> _UCXXEXPORT bool operator=3D=3D(const string & lhs, const s=
tring & rhs);
> + template <> _UCXXEXPORT bool operator=3D=3D(const char * lhs, const str=
ing & rhs);
> +-template <> _UCXXEXPORT bool operator=3D=3D(const string & rhs, const c=
har * rhs);
> ++template <> _UCXXEXPORT bool operator=3D=3D(const string & lhs, const c=
har * rhs);
> +
> + template <> _UCXXEXPORT bool operator!=3D(const string & lhs, const str=
ing & rhs);
> + template <> _UCXXEXPORT bool operator!=3D(const char * lhs, const strin=
g & rhs);
> +-template <> _UCXXEXPORT bool operator!=3D(const string & rhs, const cha=
r * rhs);
> ++template <> _UCXXEXPORT bool operator!=3D(const string & lhs, const cha=
r * rhs);
> +
> + template <> _UCXXEXPORT string operator+(const string & lhs, const char=
* rhs);
> + template <> _UCXXEXPORT string operator+(const char* lhs, const string =
& rhs);
> +--- a/src/string.cpp
> ++++ b/src/string.cpp
> +@@ -76,11 +76,11 @@ namespace std{
> +
> + =C2=A0 =C2=A0 =C2=A0 template _UCXXEXPORT bool operator=3D=3D(const str=
ing & lhs, const string & rhs);
> + =C2=A0 =C2=A0 =C2=A0 template _UCXXEXPORT bool operator=3D=3D(const cha=
r * lhs, const string & rhs);
> +- =C2=A0 =C2=A0 =C2=A0template _UCXXEXPORT bool operator=3D=3D(const str=
ing & rhs, const char * rhs);
> ++ =C2=A0 =C2=A0 =C2=A0template _UCXXEXPORT bool operator=3D=3D(const str=
ing & lhs, const char * rhs);
> +
> + =C2=A0 =C2=A0 =C2=A0 template _UCXXEXPORT bool operator!=3D(const strin=
g & lhs, const string & rhs);
> + =C2=A0 =C2=A0 =C2=A0 template _UCXXEXPORT bool operator!=3D(const char =
* lhs, const string & rhs);
> +- =C2=A0 =C2=A0 =C2=A0template _UCXXEXPORT bool operator!=3D(const strin=
g & rhs, const char * rhs);
> ++ =C2=A0 =C2=A0 =C2=A0template _UCXXEXPORT bool operator!=3D(const strin=
g & lhs, const char * rhs);
> +
> + =C2=A0 =C2=A0 =C2=A0 template _UCXXEXPORT string operator+(const string=
 & lhs, const char* rhs);
> + =C2=A0 =C2=A0 =C2=A0 template _UCXXEXPORT string operator+(const char* =
lhs, const string & rhs);
> diff --git a/recipes/uclibc++/uclibc++/900-dependent_exception.patch b/re=
cipes/uclibc++/uclibc++/900-dependent_exception.patch
> new file mode 100644
> index 0000000..3a5cb7d
> --- /dev/null
> +++ b/recipes/uclibc++/uclibc++/900-dependent_exception.patch
> @@ -0,0 +1,68 @@
> +--- a/src/eh_alloc.cpp 2007-06-03 23:51:13.000000000 +0100
> ++++ b/src/eh_alloc.cpp 2009-07-13 09:42:39.000000000 +0100
> +@@ -42,4 +42,21 @@
> + =C2=A0 =C2=A0 =C2=A0 free( (char *)(vptr) - sizeof(__cxa_exception) );
> + }
> +
> ++#if __GNUC__ * 100 + __GNUC_MINOR__ >=3D 404
> ++extern "C" __cxa_dependent_exception* __cxa_allocate_dependent_exceptio=
n() throw(){
> ++ =C2=A0 =C2=A0 =C2=A0__cxa_dependent_exception *retval;
> ++
> ++ =C2=A0 =C2=A0 =C2=A0retval =3D static_cast<__cxa_dependent_exception*>=
(malloc(sizeof(__cxa_dependent_exception)));
> ++ =C2=A0 =C2=A0 =C2=A0if(0 =3D=3D retval){
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0std::terminate();
> ++ =C2=A0 =C2=A0 =C2=A0}
> ++ =C2=A0 =C2=A0 =C2=A0memset (retval, 0, sizeof(__cxa_dependent_exceptio=
n));
> ++ =C2=A0 =C2=A0 =C2=A0return retval ;
> ++}
> ++
> ++extern "C" void __cxa_free_dependent_exception(__cxa_dependent_exceptio=
n *vptr) throw(){
> ++ =C2=A0 =C2=A0 =C2=A0free( vptr );
> ++}
> ++#endif
> ++
> + }
> +--- a/include/unwind-cxx.h =C2=A0 =C2=A0 2009-07-13 10:01:11.000000000 +=
0100
> ++++ b/include/unwind-cxx.h =C2=A0 =C2=A0 2009-07-13 10:14:08.000000000 +=
0100
> +@@ -79,6 +79,41 @@
> + =C2=A0 _Unwind_Exception unwindHeader;
> + };
> +
> ++#if __GNUC__ * 100 + __GNUC_MINOR__ >=3D 404
> ++// A dependent C++ exception object consists of a wrapper around an unw=
ind
> ++// object header with additional C++ specific information, containing a=
 pointer
> ++// to a primary exception object.
> ++
> ++struct __cxa_dependent_exception
> ++{
> ++ =C2=A0// The primary exception this thing depends on.
> ++ =C2=A0void *primaryException;
> ++
> ++ =C2=A0// The C++ standard has entertaining rules wrt calling set_termi=
nate
> ++ =C2=A0// and set_unexpected in the middle of the exception cleanup pro=
cess.
> ++ =C2=A0std::unexpected_handler unexpectedHandler;
> ++ =C2=A0std::terminate_handler terminateHandler;
> ++
> ++ =C2=A0// The caught exception stack threads through here.
> ++ =C2=A0__cxa_exception *nextException;
> ++
> ++ =C2=A0// How many nested handlers have caught this exception. =C2=A0A =
negated
> ++ =C2=A0// value is a signal that this object has been rethrown.
> ++ =C2=A0int handlerCount;
> ++
> ++ =C2=A0// Cache parsed handler data from the personality routine Phase =
1
> ++ =C2=A0// for Phase 2 and __cxa_call_unexpected.
> ++ =C2=A0int handlerSwitchValue;
> ++ =C2=A0const unsigned char *actionRecord;
> ++ =C2=A0const unsigned char *languageSpecificData;
> ++ =C2=A0_Unwind_Ptr catchTemp;
> ++ =C2=A0void *adjustedPtr;
> ++
> ++ =C2=A0// The generic exception header. =C2=A0Must be last.
> ++ =C2=A0_Unwind_Exception unwindHeader;
> ++};
> ++
> ++#endif
> + // Each thread in a C++ program has access to a __cxa_eh_globals object=
.
> + struct __cxa_eh_globals
> + {
> diff --git a/recipes/uclibc++/uclibc++/cstring.patch b/recipes/uclibc++/u=
clibc++/cstring.patch
> new file mode 100644
> index 0000000..57c2317
> --- /dev/null
> +++ b/recipes/uclibc++/uclibc++/cstring.patch
> @@ -0,0 +1,21 @@
> +Index: uClibc++-0.2.2/include/cstring
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- uClibc++-0.2.2.orig/include/cstring =C2=A0 =C2=A0 =C2=A0 =C2=A02010-=
11-17 10:35:02.525119882 +0100
> ++++ uClibc++-0.2.2/include/cstring =C2=A0 =C2=A0 2010-11-17 10:35:19.274=
494437 +0100
> +@@ -49,6 +49,7 @@
> + =C2=A0 =C2=A0 =C2=A0 using ::strxfrm;
> +
> +
> ++#if 0
> + =C2=A0 =C2=A0 =C2=A0 //Extra definitions required in c++ spec
> +
> +
> +@@ -71,7 +72,7 @@
> + =C2=A0 =C2=A0 =C2=A0 inline char* strstr(char* s1, const char* s2){
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return strstr(const_ca=
st<const char *>(s1), s2);
> + =C2=A0 =C2=A0 =C2=A0 }
> +-
> ++#endif
> + }
> +

why is this needed. do u get compilation errors ? if yes post the error

> + #endif
> diff --git a/recipes/uclibc++/uclibc++/defconfig b/recipes/uclibc++/uclib=
c++/defconfig
> new file mode 100644
> index 0000000..168e9a4
> --- /dev/null
> +++ b/recipes/uclibc++/uclibc++/defconfig
> @@ -0,0 +1,53 @@
> +#
> +# Automatically generated make config: don't edit
> +#
> +
> +#
> +# Target Features and Options
> +#
> +# UCLIBCXX_HAS_FLOATS is not set
> +UCLIBCXX_HAS_TLS=3Dy
> +WARNINGS=3D"-Wall"
> +BUILD_EXTRA_LIBRARIES=3D""
> +HAVE_DOT_CONFIG=3Dy
> +
> +#
> +# String and I/O Stream Support
> +#
> +# UCLIBCXX_HAS_WCHAR is not set
> +UCLIBCXX_IOSTREAM_BUFSIZE=3D32
> +UCLIBCXX_HAS_LFS=3Dy
> +UCLIBCXX_SUPPORT_CDIR=3Dy
> +UCLIBCXX_SUPPORT_CIN=3Dy
> +UCLIBCXX_SUPPORT_COUT=3Dy
> +UCLIBCXX_SUPPORT_CERR=3Dy
> +# UCLIBCXX_SUPPORT_CLOG is not set
> +
> +#
> +# STL and Code Expansion
> +#
> +UCLIBCXX_STL_BUFFER_SIZE=3D32
> +UCLIBCXX_CODE_EXPANSION=3Dy
> +UCLIBCXX_EXPAND_CONSTRUCTORS_DESTRUCTORS=3Dy
> +UCLIBCXX_EXPAND_STRING_CHAR=3Dy
> +UCLIBCXX_EXPAND_VECTOR_BASIC=3Dy
> +UCLIBCXX_EXPAND_IOS_CHAR=3Dy
> +UCLIBCXX_EXPAND_STREAMBUF_CHAR=3Dy
> +UCLIBCXX_EXPAND_ISTREAM_CHAR=3Dy
> +UCLIBCXX_EXPAND_OSTREAM_CHAR=3Dy
> +UCLIBCXX_EXPAND_FSTREAM_CHAR=3Dy
> +UCLIBCXX_EXPAND_SSTREAM_CHAR=3Dy
> +
> +#
> +# Library Installation Options
> +#
> +UCLIBCXX_RUNTIME_PREFIX=3D"/usr/uClibc++"
> +UCLIBCXX_RUNTIME_INCLUDE_SUBDIR=3D"/include"
> +UCLIBCXX_RUNTIME_LIB_SUBDIR=3D"/lib"
> +UCLIBCXX_RUNTIME_BIN_SUBDIR=3D"/bin"
> +UCLIBCXX_EXCEPTION_SUPPORT=3Dy
> +IMPORT_LIBSUP=3Dy
> +IMPORT_LIBGCC_EH=3Dy
> +BUILD_STATIC_LIB=3Dy
> +# BUILD_ONLY_STATIC_LIB is not set
> +# DODEBUG is not set
> diff --git a/recipes/uclibc++/uclibc++/nobash.patch b/recipes/uclibc++/uc=
libc++/nobash.patch
> new file mode 100644
> index 0000000..0b1501b
> --- /dev/null
> +++ b/recipes/uclibc++/uclibc++/nobash.patch
> @@ -0,0 +1,13 @@
> +Index: uClibc++-0.2.2/bin/Makefile
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> +--- uClibc++-0.2.2.orig/bin/Makefile =C2=A0 2007-06-03 23:51:12.00000000=
0 +0100
> ++++ uClibc++-0.2.2/bin/Makefile =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A02010-11-11 10:09:48.000000000 +0000
> +@@ -13,7 +13,7 @@
> + =C2=A0 =C2=A0 =C2=A0 $(INSTALL) -m 755 $(WRAPPER) $(PREFIX)$(UCLIBCXX_R=
UNTIME_BINDIR)
> +
> + $(WRAPPER):
> +- =C2=A0 =C2=A0 =C2=A0echo "#!/bin/bash" > $(WRAPPER)
> ++ =C2=A0 =C2=A0 =C2=A0echo "#!/bin/sh" > $(WRAPPER)
> + =C2=A0 =C2=A0 =C2=A0 echo "" >> $(WRAPPER)
> + =C2=A0 =C2=A0 =C2=A0 echo 'WRAPPER_INCLUDEDIR=3D"$${WRAPPER_INCLUDEDIR:=
=3D-I$(UCLIBCXX_RUNTIME_INCLUDEDIR)}"' >> $(WRAPPER)
> + =C2=A0 =C2=A0 =C2=A0 echo 'WRAPPER_LIBDIR=3D"$${WRAPPER_LIBDIR:=3D-L$(U=
CLIBCXX_RUNTIME_LIBDIR)}"' >> $(WRAPPER)
> diff --git a/recipes/uclibc++/uclibc++_0.1.9.bb b/recipes/uclibc++/uclibc=
++_0.1.9.bb
> deleted file mode 100644
> index be1ac14..0000000
> --- a/recipes/uclibc++/uclibc++_0.1.9.bb
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -DESCRIPTION =3D "A C++ standard library targeted towards the embedded \
> -systems/software market."
> -HOMEPAGE =3D "http://cxx.uclibc.org/"
> -LICENSE =3D "LGPL"
> -PRIORITY =3D "optional"
> -SECTION =3D "libs"
> -
> -PR =3D "r2"
> -
> -SRC_URI =3D "http://cxx.uclibc.org/src/uClibc++-${PV}.tbz2 \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://nobash.patch \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://defconfig"
> -S =3D "${WORKDIR}/uClibc++"
> -
> -# uClibc++ runtime prefix directory (UCLIBCXX_RUNTIME_PREFIX) [/usr/$(TA=
RGET_ARCH)-linux-uclibc] (NEW)
> -# uClibc++ header file subdirectory (UCLIBCXX_RUNTIME_INCLUDE_SUBDIR) [/=
include] (NEW)
> -# uClibc++ library subdirectory (UCLIBCXX_RUNTIME_LIB_SUBDIR) [/lib] (NE=
W)
> -# uClibc++ application file subdirectory (UCLIBCXX_RUNTIME_BIN_SUBDIR) [=
/bin] (NEW)
> -
> -do_unpack_real () {
> - =C2=A0 =C2=A0 =C2=A0 bzcat uClibc++-${PV}.tbz2 | tar -xvf -
> -}
> -do_unpack_real[dirs] =3D "${WORKDIR}"
> -addtask unpack_real before do_patch after do_unpack
> -
> -EXTRA_OEMAKE =3D "'OPTIMIZATION=3D' 'XWARNINGS=3D' 'XARCH_CFLAGS=3D${CFL=
AGS}' \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 'CPU_FLAGS=3D' 'STRIPT=
OOL=3Dtrue' 'LD=3D${LD}'"
> -configmangle =3D 's,^UCLIBCXX_RUNTIME_PREFIX=3D.*,UCLIBCXX_RUNTIME_PREFI=
X=3D"${exec_prefix}",; \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s,^UCLIBCXX_RUNTIME_IN=
CLUDE_SUBDIR=3D.*,UCLIBCXX_RUNTIME_INCLUDE_SUBDIR=3D"/include/c++-uc",; \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s,^UCLIBCXX_RUNTIME_LI=
B_SUBDIR=3D.*,UCLIBCXX_RUNTIME_LIB_SUBDIR=3D"/lib",; \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s,^UCLIBCXX_RUNTIME_BI=
N_SUBDIR=3D.*,UCLIBCXX_RUNTIME_BIN_SUBDIR=3D"/bin",;'
> -PARALLEL_MAKE =3D ""
> -
> -do_configure () {
> - =C2=A0 =C2=A0 =C2=A0 cp ${WORKDIR}/defconfig ${S}/.config
> -
> - =C2=A0 =C2=A0 =C2=A0 perl -i -p -e 's,^CROSS=3D.*,TARGET_ARCH=3D${TARGE=
T_ARCH}\nCROSS=3D${TARGET_PREFIX},g' ${S}/Rules.mak
> - =C2=A0 =C2=A0 =C2=A0 perl -i -p -e '${configmangle}' ${S}/.config
> -
> - =C2=A0 =C2=A0 =C2=A0 oe_runmake oldconfig
> -}
> -
> -do_install () {
> - =C2=A0 =C2=A0 =C2=A0 oe_runmake 'DESTDIR=3D${D}' install
> - =C2=A0 =C2=A0 =C2=A0 chmod +x ${D}${libdir}/libuClibc++.so.*
> -}
> -
> -PACKAGES =3D "g++-uc libuclibc++ libuclibc++-dev"
> -FILES_g++-uc =3D "${bindir}/g++-uc"
> -FILES_libuclibc++ =3D "${libdir}/*.so.*"
> -FILES_libuclibc++-dev =3D "${FILES_uclibc++-dev}"
> -
> -SRC_URI[md5sum] =3D "ebf58e04d72eab5c131c2c9118737024"
> -SRC_URI[sha256sum] =3D "82342a5d6088421e79699dd7af614ebecf6dd335eabce076=
90902a379f5ea8de"
> diff --git a/recipes/uclibc++/uclibc++_0.2.2.bb b/recipes/uclibc++/uclibc=
++_0.2.2.bb
> new file mode 100644
> index 0000000..c42772b
> --- /dev/null
> +++ b/recipes/uclibc++/uclibc++_0.2.2.bb
> @@ -0,0 +1,57 @@
> +DESCRIPTION =3D "A C++ standard library targeted towards the embedded \
> +systems/software market."
> +HOMEPAGE =3D "http://cxx.uclibc.org/"
> +LICENSE =3D "LGPL"

LGPL also have versions find out which one it is licensed under

> +PRIORITY =3D "optional"
> +SECTION =3D "libs"
> +
> +PR =3D "r0"
> +
> +SRC_URI =3D "http://cxx.uclibc.org/src/uClibc++-${PV}.tar.bz2 \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://nobash.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://006-eabi_fix.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://009-compile_fixes.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://900-dependent_exception.patch =
\
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://cstring.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://defconfig"
> +SRC_URI[md5sum] =3D "1ceef3209cca88be8f1bd9de99735954"
> +SRC_URI[sha256sum] =3D "f140596469e0ab0523c0774d14fe82ba2831d48ad1304157=
48250dbab149318e"
> +S =3D "${WORKDIR}/uClibc++-${PV}"
> +
> +# uClibc++ runtime prefix directory (UCLIBCXX_RUNTIME_PREFIX) [/usr/$(TA=
RGET_ARCH)-linux-uclibc] (NEW)
> +# uClibc++ header file subdirectory (UCLIBCXX_RUNTIME_INCLUDE_SUBDIR) [/=
include] (NEW)
> +# uClibc++ library subdirectory (UCLIBCXX_RUNTIME_LIB_SUBDIR) [/lib] (NE=
W)
> +# uClibc++ application file subdirectory (UCLIBCXX_RUNTIME_BIN_SUBDIR) [=
/bin] (NEW)
> +
> +EXTRA_OEMAKE =3D "'OPTIMIZATION=3D' 'XWARNINGS=3D' 'XARCH_CFLAGS=3D${CFL=
AGS}' \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 'CPU_FLAGS=3D' 'STRIPT=
OOL=3Dtrue' 'LD=3D${LD}'"
> +configmangle =3D 's,^UCLIBCXX_RUNTIME_PREFIX=3D.*,UCLIBCXX_RUNTIME_PREFI=
X=3D"${exec_prefix}",; \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s,^UCLIBCXX_RUNTIME_IN=
CLUDE_SUBDIR=3D.*,UCLIBCXX_RUNTIME_INCLUDE_SUBDIR=3D"/include/c++-uc",; \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s,^UCLIBCXX_RUNTIME_LI=
B_SUBDIR=3D.*,UCLIBCXX_RUNTIME_LIB_SUBDIR=3D"/lib",; \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s,^UCLIBCXX_RUNTIME_BI=
N_SUBDIR=3D.*,UCLIBCXX_RUNTIME_BIN_SUBDIR=3D"/bin",;'
> +PARALLEL_MAKE =3D ""
> +
> +do_configure () {
> + =C2=A0 =C2=A0 =C2=A0 cp ${WORKDIR}/defconfig ${S}/.config
> +
> + =C2=A0 =C2=A0 =C2=A0 perl -i -p -e 's,^CROSS=3D.*,TARGET_ARCH=3D${TARGE=
T_ARCH}\nCROSS=3D${TARGET_PREFIX},g' ${S}/Rules.mak
> + =C2=A0 =C2=A0 =C2=A0 perl -i -p -e '${configmangle}' ${S}/.config
> +
> + =C2=A0 =C2=A0 =C2=A0 oe_runmake oldconfig
> +}
> +
> +do_stage () {
> + =C2=A0 =C2=A0 =C2=A0 oe_runmake 'UCLIBCXX_RUNTIME_PREFIX=3D${STAGING_LI=
BDIR}/../' \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install
> + =C2=A0 =C2=A0 =C2=A0 chmod +x ${STAGING_LIBDIR}/libuClibc++.so.*
> +}
> +

try to get rid of do_stage

> +do_install () {
> + =C2=A0 =C2=A0 =C2=A0 oe_runmake 'DESTDIR=3D${D}' install
> + =C2=A0 =C2=A0 =C2=A0 chmod +x ${D}${libdir}/libuClibc++.so.*
> +}
> +
> +PACKAGES =3D "g++-uc libuclibc++ libuclibc++-dev"
> +FILES_g++-uc =3D "${bindir}/g++-uc"
> +FILES_libuclibc++ =3D "${libdir}/*.so.*"
> +FILES_libuclibc++-dev =3D "${FILES_uclibc++-dev}"
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


