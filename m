Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PIo8C-0000HC-1p
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 20:57:25 +0100
Received: by iwn6 with SMTP id 6so267837iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Nov 2010 11:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=RWCJWsf7M8dBVhj2cD2bEOmjAwRYBEe6Ld3ec+AHcnI=;
	b=AQxtRSI/fZAfDY7sbOU2fkoOSGsYQ/Z4Bwk1Np0oNi7FQ8ygC3ScuwrfSAMnv9V2yZ
	8fREyJbFZZodmdRuSCBu8Px0hp0VHzfZp9KaJesGuHbDtjMGBc5BB9wCh7SwZbLRUKdo
	lY/GVSAGOrk7aNdOO0zGihC3SiaeoMzcZKhcY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=So0vwv35x4DUHYSLrM9dp8qVLu7+B2foVVc8ond1dXE/QGF47MxGSiMbS42tB2+say
	TDvPLVVUSRkqNP53zPes/C22BW8bsUfHeoNTJsiBndQmI9IE5nQ9q+yuIffShjCCDzRo
	1BrxlkS2KeJhcf6WLoeguESAHEnxNcNVGm7dA=
MIME-Version: 1.0
Received: by 10.231.144.21 with SMTP id x21mr7375460ibu.126.1290023773099;
	Wed, 17 Nov 2010 11:56:13 -0800 (PST)
Received: by 10.231.33.4 with HTTP; Wed, 17 Nov 2010 11:56:13 -0800 (PST)
In-Reply-To: <AANLkTi=YqETnOXFgSfbGvaR8AbW0HAtnm2=ZJVNCboUM@mail.gmail.com>
References: <1289988503-14693-1-git-send-email-fransmeulenbroeks@gmail.com>
	<AANLkTi=YqETnOXFgSfbGvaR8AbW0HAtnm2=ZJVNCboUM@mail.gmail.com>
Date: Wed, 17 Nov 2010 20:56:13 +0100
Message-ID: <AANLkTimq5JgxA+T3U9WhBMxgr+Of_H27RF3SemZc69fY@mail.gmail.com>
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
X-List-Received-Date: Wed, 17 Nov 2010 19:57:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/11/17 Khem Raj <raj.khem@gmail.com>:
> On Wed, Nov 17, 2010 at 2:08 AM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> Removed the 0.1.9 version as it is quite old and does not compile
>> renamed files dir to uclibc++
>> added patches to get 0.2.2 compiling.
>> Patches are gracefully picked from openwrt
>> (https://dev.openwrt.org/browser/packages/libs/uclibc%2B%2B/patches?rev=
=3D24017)
>>
>> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>>
>> ---
>>
>> For the review:
>> note that I also added a patch for include/cstring (cstring.patch).
>>
>> With that patch the stuff compiles, without it I get these errors
>> (distro minimal, target calamari, eglibc)
>> If there is a better solution, please advise.
>>
>> | WRAPPER_INCLUDEDIR=3D-I../include ../bin/g++-uc =A0 =A0-ansi =A0-fPIC =
-o eh_alloc.o -c eh_alloc.cpp
>> | In file included from eh_alloc.cpp:21:0:
>> | ../include/cstring: In function 'void* std::memchr(void*, int, size_t)=
':
>> | ../include/cstring:55:46: error: 'void* std::memchr(void*, int, size_t=
)' conflicts with previous using declaration 'void* memchr(void*, int, size=
_t)'
>> | ../include/cstring:56:50: error: invalid conversion from 'const void*'=
 to 'void*'
>> | ../include/cstring: In function 'char* std::strchr(char*, int)':
>> | ../include/cstring:59:36: error: 'char* std::strchr(char*, int)' confl=
icts with previous using declaration 'char* strchr(char*, int)'
>> | ../include/cstring:60:47: error: invalid conversion from 'const char*'=
 to 'char*'
>> | ../include/cstring: In function 'char* std::strpbrk(char*, const char*=
)':
>> | ../include/cstring:63:47: error: 'char* std::strpbrk(char*, const char=
*)' conflicts with previous using declaration 'char* strpbrk(char*, const c=
har*)'
>> | ../include/cstring:64:50: error: invalid conversion from 'const char*'=
 to 'char*'
>> | ../include/cstring: In function 'char* std::strrchr(char*, int)':
>> | ../include/cstring:67:37: error: 'char* std::strrchr(char*, int)' conf=
licts with previous using declaration 'char* strrchr(char*, int)'
>> | ../include/cstring:68:48: error: invalid conversion from 'const char*'=
 to 'char*'
>> | ../include/cstring: In function 'char* std::strstr(char*, const char*)=
':
>> | ../include/cstring:71:46: error: 'char* std::strstr(char*, const char*=
)' conflicts with previous using declaration 'char* strstr(char*, const cha=
r*)'
>> | ../include/cstring:72:49: error: invalid conversion from 'const char*'=
 to 'char*'
>> | make[1]: *** [eh_alloc.o] Error 1
>> | make[1]: Leaving directory `/home/frans/workspace/tmp/work/ppce500v2-o=
e-linux-gnuspe/uclibc++-0.2.2-r1/uClibc++-0.2.2/src'
>> | make: *** [all] Error 2
>> | FATAL: oe_runmake failed
>> | ERROR: Function do_compile failed
>> ---

[...]

>> diff --git a/recipes/uclibc++/uclibc++/cstring.patch b/recipes/uclibc++/=
uclibc++/cstring.patch
>> new file mode 100644
>> index 0000000..57c2317
>> --- /dev/null
>> +++ b/recipes/uclibc++/uclibc++/cstring.patch
>> @@ -0,0 +1,21 @@
>> +Index: uClibc++-0.2.2/include/cstring
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- uClibc++-0.2.2.orig/include/cstring =A0 =A0 =A0 =A02010-11-17 10:35=
:02.525119882 +0100
>> ++++ uClibc++-0.2.2/include/cstring =A0 =A0 2010-11-17 10:35:19.27449443=
7 +0100
>> +@@ -49,6 +49,7 @@
>> + =A0 =A0 =A0 using ::strxfrm;
>> +
>> +
>> ++#if 0
>> + =A0 =A0 =A0 //Extra definitions required in c++ spec
>> +
>> +
>> +@@ -71,7 +72,7 @@
>> + =A0 =A0 =A0 inline char* strstr(char* s1, const char* s2){
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return strstr(const_cast<const char *>(s1)=
, s2);
>> + =A0 =A0 =A0 }
>> +-
>> ++#endif
>> + }
>> +
>
> why is this needed. do u get compilation errors ? if yes post the error

Yes, I get compile errors, They are already in my first post (and also
on this one).
Immediately after the commit message and before the list of files.

>
[...]

>> -SRC_URI[md5sum] =3D "ebf58e04d72eab5c131c2c9118737024"
>> -SRC_URI[sha256sum] =3D "82342a5d6088421e79699dd7af614ebecf6dd335eabce07=
690902a379f5ea8de"
>> diff --git a/recipes/uclibc++/uclibc++_0.2.2.bb b/recipes/uclibc++/uclib=
c++_0.2.2.bb
>> new file mode 100644
>> index 0000000..c42772b
>> --- /dev/null
>> +++ b/recipes/uclibc++/uclibc++_0.2.2.bb
>> @@ -0,0 +1,57 @@
>> +DESCRIPTION =3D "A C++ standard library targeted towards the embedded \
>> +systems/software market."
>> +HOMEPAGE =3D "http://cxx.uclibc.org/"
>> +LICENSE =3D "LGPL"
>
> LGPL also have versions find out which one it is licensed under

Will do

>
>> +PRIORITY =3D "optional"
>> +SECTION =3D "libs"
>> +
>> +PR =3D "r0"
>> +
>> +SRC_URI =3D "http://cxx.uclibc.org/src/uClibc++-${PV}.tar.bz2 \
>> + =A0 =A0 =A0 =A0 =A0file://nobash.patch \
>> + =A0 =A0 =A0 =A0 =A0file://006-eabi_fix.patch \
>> + =A0 =A0 =A0 =A0 =A0file://009-compile_fixes.patch \
>> + =A0 =A0 =A0 =A0 =A0file://900-dependent_exception.patch \
>> + =A0 =A0 =A0 =A0 =A0file://cstring.patch \
>> + =A0 =A0 =A0 =A0 =A0file://defconfig"
>> +SRC_URI[md5sum] =3D "1ceef3209cca88be8f1bd9de99735954"
>> +SRC_URI[sha256sum] =3D "f140596469e0ab0523c0774d14fe82ba2831d48ad130415=
748250dbab149318e"
>> +S =3D "${WORKDIR}/uClibc++-${PV}"
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
>> +do_stage () {
>> + =A0 =A0 =A0 oe_runmake 'UCLIBCXX_RUNTIME_PREFIX=3D${STAGING_LIBDIR}/..=
/' \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0install
>> + =A0 =A0 =A0 chmod +x ${STAGING_LIBDIR}/libuClibc++.so.*
>> +}
>> +
>
> try to get rid of do_stage

Will check.
Actually this was needed by one of our customers, and not sure if he
is using a version that already removed legacy staging.
>

[..]

Frans


