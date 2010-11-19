Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PJY5h-0000kP-MP
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Nov 2010 22:02:07 +0100
Received: by gyd12 with SMTP id 12so332209gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Nov 2010 13:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=OXEkwZPpwNsRdhs37Bmh5OdiDZp+URTXV5WhtsAJuyQ=;
	b=hHFypccP4jlD6iByZZFrg9Hkpgt358iDoIrVjcZDPsbPDVgzahzWkldqCNr92g0P01
	bgUtfRLgGrFyVVMJBPKHXHVQ2nKgB2fwKdRNwzS9siHz0P9K/qacli9us61xnCbhBnS9
	OQcYpV9/Ch7k++cObLOCSUlca9fBl77qP1S+k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=dY1f/yHFp/dBGEB6MeQFiWcoWy/k8rd1aRxcD2ATib7iqhOgjl3DBw8P/T4unwUdVb
	UFaMqm3xvvVukotJCwja/8OpYIPIGUbbHlrcYE+wFaDx+R+x/3Z8EfIoAv9i3iQrUXsq
	ZIcVIW4AbDoa4MJFNGJ4OQ8z6jZGTTijzZa3c=
Received: by 10.90.4.19 with SMTP id 19mr3230286agd.195.1290200443789;
	Fri, 19 Nov 2010 13:00:43 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id m46sm1303716yha.44.2010.11.19.13.00.42
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 19 Nov 2010 13:00:43 -0800 (PST)
Date: Fri, 19 Nov 2010 13:00:07 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101119210007.GC8017@gmail.com>
References: <1290179402-28793-1-git-send-email-fransmeulenbroeks@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1290179402-28793-1-git-send-email-fransmeulenbroeks@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] uclibc++: moved to git head
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
X-List-Received-Date: Fri, 19 Nov 2010 21:02:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (19/11/10 16:10), Frans Meulenbroeks wrote:
> Removed the 0.1.9 version as it is quite old and does not compile
> renamed files dir to uclibc++
> added patches to get things compiling.
> Patches are gracefully picked from openwrt
> (https://dev.openwrt.org/browser/packages/libs/uclibc%2B%2B/patches?rev=24017)
> 
> note that it was decided to move to git head instead of the latest release (0.2.2)
> because there were quite some patches after 0.2.2 was made and it does not look like there will
> be a new release soon (there is hardly any activity last 2 years or so).
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

ok I think this is due to conflict with function prototypes from libstdc++
I would suggest look into installed cstring and make them match.

> | WRAPPER_INCLUDEDIR=-I../include ../bin/g++-uc    -ansi  -fPIC -o eh_alloc.o -c eh_alloc.cpp
> | In file included from eh_alloc.cpp:21:0:
> | ../include/cstring: In function 'void* std::memchr(void*, int, size_t)':
> | ../include/cstring:55:46: error: 'void* std::memchr(void*, int, size_t)' conflicts with previous using declaration 'void* memchr(void*, int, size_t)'
> | ../include/cstring:56:50: error: invalid conversion from 'const void*' to 'void*'
> | ../include/cstring: In function 'char* std::strchr(char*, int)':
> | ../include/cstring:59:36: error: 'char* std::strchr(char*, int)' conflicts with previous using declaration 'char* strchr(char*, int)'
> | ../include/cstring:60:47: error: invalid conversion from 'const char*' to 'char*'
> | ../include/cstring: In function 'char* std::strpbrk(char*, const char*)':
> | ../include/cstring:63:47: error: 'char* std::strpbrk(char*, const char*)' conflicts with previous using declaration 'char* strpbrk(char*, const char*)'
> | ../include/cstring:64:50: error: invalid conversion from 'const char*' to 'char*'
> | ../include/cstring: In function 'char* std::strrchr(char*, int)':
> | ../include/cstring:67:37: error: 'char* std::strrchr(char*, int)' conflicts with previous using declaration 'char* strrchr(char*, int)'
> | ../include/cstring:68:48: error: invalid conversion from 'const char*' to 'char*'
> | ../include/cstring: In function 'char* std::strstr(char*, const char*)':
> | ../include/cstring:71:46: error: 'char* std::strstr(char*, const char*)' conflicts with previous using declaration 'char* strstr(char*, const char*)'
> | ../include/cstring:72:49: error: invalid conversion from 'const char*' to 'char*'
> | make[1]: *** [eh_alloc.o] Error 1
> | make[1]: Leaving directory `/home/frans/workspace/tmp/work/ppce500v2-oe-linux-gnuspe/uclibc++-0.2.2-r1/uClibc++-0.2.2/src'
> | make: *** [all] Error 2
> | FATAL: oe_runmake failed
> | ERROR: Function do_compile failed
> 
> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> ---
>  recipes/uclibc++/files/defconfig                   |   64 ------------------
>  recipes/uclibc++/files/nobash.patch                |   13 ----
>  recipes/uclibc++/uclibc++/006-eabi_fix.patch       |   42 ++++++++++++
>  recipes/uclibc++/uclibc++/009-compile_fixes.patch  |   70 ++++++++++++++++++++
>  .../uclibc++/900-dependent_exception.patch         |   68 +++++++++++++++++++
>  recipes/uclibc++/uclibc++/cstring.patch            |   21 ++++++
>  recipes/uclibc++/uclibc++/defconfig                |   53 +++++++++++++++
>  recipes/uclibc++/uclibc++/nobash.patch             |   13 ++++
>  recipes/uclibc++/uclibc++_0.1.9.bb                 |   54 ---------------
>  recipes/uclibc++/uclibc++_git.bb                   |   51 ++++++++++++++
>  10 files changed, 318 insertions(+), 131 deletions(-)
>  delete mode 100644 recipes/uclibc++/files/defconfig
>  delete mode 100644 recipes/uclibc++/files/nobash.patch
>  create mode 100644 recipes/uclibc++/uclibc++/006-eabi_fix.patch
>  create mode 100644 recipes/uclibc++/uclibc++/009-compile_fixes.patch
>  create mode 100644 recipes/uclibc++/uclibc++/900-dependent_exception.patch
>  create mode 100644 recipes/uclibc++/uclibc++/cstring.patch
>  create mode 100644 recipes/uclibc++/uclibc++/defconfig
>  create mode 100644 recipes/uclibc++/uclibc++/nobash.patch
>  delete mode 100644 recipes/uclibc++/uclibc++_0.1.9.bb
>  create mode 100644 recipes/uclibc++/uclibc++_git.bb
> 
> diff --git a/recipes/uclibc++/files/defconfig b/recipes/uclibc++/files/defconfig
> deleted file mode 100644
> index 19b4aa5..0000000
> --- a/recipes/uclibc++/files/defconfig
> +++ /dev/null
> @@ -1,64 +0,0 @@
> -#
> -# Automatically generated make config: don't edit
> -#
> -# TARGET_arm is not set
> -TARGET_i386=y
> -# TARGET_powerpc is not set
> -
> -#
> -# Target Architecture Features and Options
> -#
> -HAVE_ELF=y
> -TARGET_ARCH="i386"
> -# CONFIG_GENERIC_386 is not set
> -# CONFIG_386 is not set
> -# CONFIG_486 is not set
> -# CONFIG_586 is not set
> -# CONFIG_586MMX is not set
> -# CONFIG_686 is not set
> -# CONFIG_PENTIUMIII is not set
> -CONFIG_PENTIUM4=y
> -# CONFIG_K6 is not set
> -# CONFIG_K7 is not set
> -# CONFIG_CRUSOE is not set
> -# CONFIG_WINCHIPC6 is not set
> -# CONFIG_WINCHIP2 is not set
> -# CONFIG_CYRIXIII is not set
> -ARCH_LITTLE_ENDIAN=y
> -# ARCH_BIG_ENDIAN is not set
> -UCLIBCXX_HAS_FLOATS=y
> -WARNINGS="-Wall"
> -HAVE_DOT_CONFIG=y
> -
> -#
> -# String and I/O Stream Support
> -#
> -# UCLIBCXX_HAS_WCHAR is not set
> -UCLIBCXX_IOSTREAM_BUFSIZE=32
> -UCLIBCXX_HAS_LFS=y
> -UCLIBCXX_SUPPORT_CDIR=y
> -UCLIBCXX_SUPPORT_CIN=y
> -UCLIBCXX_SUPPORT_COUT=y
> -UCLIBCXX_SUPPORT_CERR=y
> -
> -#
> -# STL and Code Expansion
> -#
> -UCLIBCXX_STL_BUFFER_SIZE=32
> -UCLIBCXX_CODE_EXPANSION=y
> -UCLIBCXX_EXPAND_STRING_CHAR=y
> -UCLIBCXX_EXPAND_VECTOR_BASIC=y
> -UCLIBCXX_EXPAND_ISTREAM_CHAR=y
> -UCLIBCXX_EXPAND_OSTREAM_CHAR=y
> -UCLIBCXX_EXPAND_FSTREAM_CHAR=y
> -
> -#
> -# Library Installation Options
> -#
> -UCLIBCXX_RUNTIME_PREFIX="/usr/$(TARGET_ARCH)-linux-uclibc"
> -UCLIBCXX_RUNTIME_INCLUDE_SUBDIR="/include"
> -UCLIBCXX_RUNTIME_LIB_SUBDIR="/lib"
> -UCLIBCXX_RUNTIME_BIN_SUBDIR="/bin"
> -UCLIBCXX_EXCEPTION_SUPPORT=y
> -IMPORT_LIBSUP=y
> -# DODEBUG is not set
> diff --git a/recipes/uclibc++/files/nobash.patch b/recipes/uclibc++/files/nobash.patch
> deleted file mode 100644
> index 657c47b..0000000
> --- a/recipes/uclibc++/files/nobash.patch
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -Index: uClibc++/bin/Makefile
> -===================================================================
> ---- uClibc++.orig/bin/Makefile	2005-01-18 12:22:26.000000000 -0500
> -+++ uClibc++/bin/Makefile	2005-03-10 18:19:30.799531304 -0500
> -@@ -26,7 +26,7 @@
> - 	$(INSTALL) -m 755 $(WRAPPER) $(PREFIX)$(UCLIBCXX_RUNTIME_PREFIX)$(UCLIBCXX_RUNTIME_BIN_SUBDIR)
> - 
> - $(WRAPPER):
> --	echo "#!/bin/bash" > $(WRAPPER)
> -+	echo "#!/bin/sh" > $(WRAPPER)
> - 	echo "" >> $(WRAPPER)
> - 	echo "OPTIONS=\"$(INITIALOPTIONS)\"" >> $(WRAPPER)
> - 	echo 'INCLIB="Y"' >> $(WRAPPER)
> diff --git a/recipes/uclibc++/uclibc++/006-eabi_fix.patch b/recipes/uclibc++/uclibc++/006-eabi_fix.patch
> new file mode 100644
> index 0000000..bc970a7
> --- /dev/null
> +++ b/recipes/uclibc++/uclibc++/006-eabi_fix.patch
> @@ -0,0 +1,42 @@
> +Index: uClibc++-0.2.2/include/typeinfo
> +===================================================================
> +--- uClibc++-0.2.2.orig/include/typeinfo	2008-02-13 00:37:04.000000000 +0100
> ++++ uClibc++-0.2.2/include/typeinfo	2008-02-13 00:37:34.000000000 +0100
> +@@ -44,6 +44,7 @@
> +   class __class_type_info;
> + } // namespace __cxxabiv1
> + 
> ++#ifndef __GXX_MERGED_TYPEINFO_NAMES
> + #if !__GXX_WEAK__
> +   // If weak symbols are not supported, typeinfo names are not merged.
> +   #define __GXX_MERGED_TYPEINFO_NAMES 0
> +@@ -51,6 +52,7 @@
> +   // On platforms that support weak symbols, typeinfo names are merged.
> +   #define __GXX_MERGED_TYPEINFO_NAMES 1
> + #endif
> ++#endif
> + 
> + namespace std 
> + {
> +Index: uClibc++-0.2.2/include/unwind-cxx.h
> +===================================================================
> +--- uClibc++-0.2.2.orig/include/unwind-cxx.h	2008-02-13 00:38:04.000000000 +0100
> ++++ uClibc++-0.2.2/include/unwind-cxx.h	2008-02-13 00:40:32.000000000 +0100
> +@@ -135,6 +135,7 @@
> + 
> + // This is the exception class we report -- "GNUCC++\0".
> + const _Unwind_Exception_Class __gxx_exception_class
> ++#ifndef __ARM_EABI_UNWINDER__
> + = ((((((((_Unwind_Exception_Class) 'G' 
> + 	 << 8 | (_Unwind_Exception_Class) 'N')
> + 	<< 8 | (_Unwind_Exception_Class) 'U')
> +@@ -143,6 +144,9 @@
> +      << 8 | (_Unwind_Exception_Class) '+')
> +     << 8 | (_Unwind_Exception_Class) '+')
> +    << 8 | (_Unwind_Exception_Class) '\0');
> ++#else
> ++= "GNUC++";
> ++#endif
> + 
> + // GNU C++ personality routine, Version 0.
> + extern "C" _Unwind_Reason_Code __gxx_personality_v0
> diff --git a/recipes/uclibc++/uclibc++/009-compile_fixes.patch b/recipes/uclibc++/uclibc++/009-compile_fixes.patch
> new file mode 100644
> index 0000000..efcb9e6
> --- /dev/null
> +++ b/recipes/uclibc++/uclibc++/009-compile_fixes.patch
> @@ -0,0 +1,70 @@
> +--- a/include/associative_base
> ++++ b/include/associative_base
> +@@ -318,7 +318,7 @@ protected:
> + 	typedef std::list<ValueType> listtype;
> + 
> + 	typename listtype::iterator base_iter;
> +-	typedef _associative_citer<ValueType, Compare, Allocator> _associative_citer;
> ++	typedef _associative_citer<ValueType, Compare, Allocator> __associative_citer;
> + 
> + 	
> + public:
> +@@ -347,13 +347,13 @@ public:
> + 	bool operator==(const _associative_iter & m) const{
> + 		return m.base_iter == base_iter;
> + 	}
> +-	bool operator==(const _associative_citer & m) const{
> ++	bool operator==(const __associative_citer & m) const{
> + 		return m.base_iter == base_iter;
> + 	}
> + 	bool operator!=(const _associative_iter & m) const{
> + 		return m.base_iter != base_iter;
> + 	}
> +-	bool operator!=(const _associative_citer & m) const{
> ++	bool operator!=(const __associative_citer & m) const{
> + 		return m.base_iter != base_iter;
> + 	}
> + 	_associative_iter & operator++(){
> +@@ -378,8 +378,8 @@ public:
> + 		--base_iter;
> + 		return temp;
> + 	}
> +-	operator _associative_citer() const{
> +-		return _associative_citer(base_iter);
> ++	operator __associative_citer() const{
> ++		return __associative_citer(base_iter);
> + 	}
> + 	typename listtype::iterator base_iterator(){
> + 		return base_iter;
> +--- a/include/string
> ++++ b/include/string
> +@@ -1017,11 +1017,11 @@ template<class charT, class traits, clas
> + 
> + template <> _UCXXEXPORT bool operator==(const string & lhs, const string & rhs);
> + template <> _UCXXEXPORT bool operator==(const char * lhs, const string & rhs);
> +-template <> _UCXXEXPORT bool operator==(const string & rhs, const char * rhs);
> ++template <> _UCXXEXPORT bool operator==(const string & lhs, const char * rhs);
> + 
> + template <> _UCXXEXPORT bool operator!=(const string & lhs, const string & rhs);
> + template <> _UCXXEXPORT bool operator!=(const char * lhs, const string & rhs);
> +-template <> _UCXXEXPORT bool operator!=(const string & rhs, const char * rhs);
> ++template <> _UCXXEXPORT bool operator!=(const string & lhs, const char * rhs);
> + 
> + template <> _UCXXEXPORT string operator+(const string & lhs, const char* rhs);
> + template <> _UCXXEXPORT string operator+(const char* lhs, const string & rhs);
> +--- a/src/string.cpp
> ++++ b/src/string.cpp
> +@@ -76,11 +76,11 @@ namespace std{
> + 
> + 	template _UCXXEXPORT bool operator==(const string & lhs, const string & rhs);
> + 	template _UCXXEXPORT bool operator==(const char * lhs, const string & rhs);
> +-	template _UCXXEXPORT bool operator==(const string & rhs, const char * rhs);
> ++	template _UCXXEXPORT bool operator==(const string & lhs, const char * rhs);
> + 
> + 	template _UCXXEXPORT bool operator!=(const string & lhs, const string & rhs);
> + 	template _UCXXEXPORT bool operator!=(const char * lhs, const string & rhs);
> +-	template _UCXXEXPORT bool operator!=(const string & rhs, const char * rhs);
> ++	template _UCXXEXPORT bool operator!=(const string & lhs, const char * rhs);
> + 
> + 	template _UCXXEXPORT string operator+(const string & lhs, const char* rhs);
> + 	template _UCXXEXPORT string operator+(const char* lhs, const string & rhs);
> diff --git a/recipes/uclibc++/uclibc++/900-dependent_exception.patch b/recipes/uclibc++/uclibc++/900-dependent_exception.patch
> new file mode 100644
> index 0000000..3a5cb7d
> --- /dev/null
> +++ b/recipes/uclibc++/uclibc++/900-dependent_exception.patch
> @@ -0,0 +1,68 @@
> +--- a/src/eh_alloc.cpp	2007-06-03 23:51:13.000000000 +0100
> ++++ b/src/eh_alloc.cpp	2009-07-13 09:42:39.000000000 +0100
> +@@ -42,4 +42,21 @@
> + 	free( (char *)(vptr) - sizeof(__cxa_exception) );
> + }
> + 
> ++#if __GNUC__ * 100 + __GNUC_MINOR__ >= 404
> ++extern "C" __cxa_dependent_exception* __cxa_allocate_dependent_exception() throw(){
> ++	__cxa_dependent_exception *retval;
> ++
> ++	retval = static_cast<__cxa_dependent_exception*>(malloc(sizeof(__cxa_dependent_exception)));
> ++	if(0 == retval){
> ++		std::terminate();
> ++	}
> ++	memset (retval, 0, sizeof(__cxa_dependent_exception));
> ++	return retval ;
> ++}
> ++
> ++extern "C" void __cxa_free_dependent_exception(__cxa_dependent_exception *vptr) throw(){
> ++	free( vptr );
> ++}
> ++#endif
> ++
> + }
> +--- a/include/unwind-cxx.h	2009-07-13 10:01:11.000000000 +0100
> ++++ b/include/unwind-cxx.h	2009-07-13 10:14:08.000000000 +0100
> +@@ -79,6 +79,41 @@
> +   _Unwind_Exception unwindHeader;
> + };
> + 
> ++#if __GNUC__ * 100 + __GNUC_MINOR__ >= 404
> ++// A dependent C++ exception object consists of a wrapper around an unwind
> ++// object header with additional C++ specific information, containing a pointer
> ++// to a primary exception object.
> ++
> ++struct __cxa_dependent_exception
> ++{
> ++  // The primary exception this thing depends on.
> ++  void *primaryException;
> ++
> ++  // The C++ standard has entertaining rules wrt calling set_terminate
> ++  // and set_unexpected in the middle of the exception cleanup process.
> ++  std::unexpected_handler unexpectedHandler;
> ++  std::terminate_handler terminateHandler;
> ++
> ++  // The caught exception stack threads through here.
> ++  __cxa_exception *nextException;
> ++
> ++  // How many nested handlers have caught this exception.  A negated
> ++  // value is a signal that this object has been rethrown.
> ++  int handlerCount;
> ++
> ++  // Cache parsed handler data from the personality routine Phase 1
> ++  // for Phase 2 and __cxa_call_unexpected.
> ++  int handlerSwitchValue;
> ++  const unsigned char *actionRecord;
> ++  const unsigned char *languageSpecificData;
> ++  _Unwind_Ptr catchTemp;
> ++  void *adjustedPtr;
> ++
> ++  // The generic exception header.  Must be last.
> ++  _Unwind_Exception unwindHeader;
> ++};
> ++
> ++#endif
> + // Each thread in a C++ program has access to a __cxa_eh_globals object.
> + struct __cxa_eh_globals
> + {
> diff --git a/recipes/uclibc++/uclibc++/cstring.patch b/recipes/uclibc++/uclibc++/cstring.patch
> new file mode 100644
> index 0000000..57c2317
> --- /dev/null
> +++ b/recipes/uclibc++/uclibc++/cstring.patch
> @@ -0,0 +1,21 @@
> +Index: uClibc++-0.2.2/include/cstring
> +===================================================================
> +--- uClibc++-0.2.2.orig/include/cstring	2010-11-17 10:35:02.525119882 +0100
> ++++ uClibc++-0.2.2/include/cstring	2010-11-17 10:35:19.274494437 +0100
> +@@ -49,6 +49,7 @@
> + 	using ::strxfrm;
> + 
> + 
> ++#if 0
> + 	//Extra definitions required in c++ spec
> + 
> + 
> +@@ -71,7 +72,7 @@
> + 	inline char* strstr(char* s1, const char* s2){
> + 		return strstr(const_cast<const char *>(s1), s2);
> + 	}
> +-
> ++#endif
> + }
> + 
> + #endif
> diff --git a/recipes/uclibc++/uclibc++/defconfig b/recipes/uclibc++/uclibc++/defconfig
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
> +UCLIBCXX_HAS_TLS=y
> +WARNINGS="-Wall"
> +BUILD_EXTRA_LIBRARIES=""
> +HAVE_DOT_CONFIG=y
> +
> +#
> +# String and I/O Stream Support
> +#
> +# UCLIBCXX_HAS_WCHAR is not set
> +UCLIBCXX_IOSTREAM_BUFSIZE=32
> +UCLIBCXX_HAS_LFS=y
> +UCLIBCXX_SUPPORT_CDIR=y
> +UCLIBCXX_SUPPORT_CIN=y
> +UCLIBCXX_SUPPORT_COUT=y
> +UCLIBCXX_SUPPORT_CERR=y
> +# UCLIBCXX_SUPPORT_CLOG is not set
> +
> +#
> +# STL and Code Expansion
> +#
> +UCLIBCXX_STL_BUFFER_SIZE=32
> +UCLIBCXX_CODE_EXPANSION=y
> +UCLIBCXX_EXPAND_CONSTRUCTORS_DESTRUCTORS=y
> +UCLIBCXX_EXPAND_STRING_CHAR=y
> +UCLIBCXX_EXPAND_VECTOR_BASIC=y
> +UCLIBCXX_EXPAND_IOS_CHAR=y
> +UCLIBCXX_EXPAND_STREAMBUF_CHAR=y
> +UCLIBCXX_EXPAND_ISTREAM_CHAR=y
> +UCLIBCXX_EXPAND_OSTREAM_CHAR=y
> +UCLIBCXX_EXPAND_FSTREAM_CHAR=y
> +UCLIBCXX_EXPAND_SSTREAM_CHAR=y
> +
> +#
> +# Library Installation Options
> +#
> +UCLIBCXX_RUNTIME_PREFIX="/usr/uClibc++"
> +UCLIBCXX_RUNTIME_INCLUDE_SUBDIR="/include"
> +UCLIBCXX_RUNTIME_LIB_SUBDIR="/lib"
> +UCLIBCXX_RUNTIME_BIN_SUBDIR="/bin"
> +UCLIBCXX_EXCEPTION_SUPPORT=y
> +IMPORT_LIBSUP=y
> +IMPORT_LIBGCC_EH=y
> +BUILD_STATIC_LIB=y
> +# BUILD_ONLY_STATIC_LIB is not set
> +# DODEBUG is not set
> diff --git a/recipes/uclibc++/uclibc++/nobash.patch b/recipes/uclibc++/uclibc++/nobash.patch
> new file mode 100644
> index 0000000..0b1501b
> --- /dev/null
> +++ b/recipes/uclibc++/uclibc++/nobash.patch
> @@ -0,0 +1,13 @@
> +Index: uClibc++-0.2.2/bin/Makefile
> +===========================================================================
> +--- uClibc++-0.2.2.orig/bin/Makefile	2007-06-03 23:51:12.000000000 +0100
> ++++ uClibc++-0.2.2/bin/Makefile	        2010-11-11 10:09:48.000000000 +0000
> +@@ -13,7 +13,7 @@
> + 	$(INSTALL) -m 755 $(WRAPPER) $(PREFIX)$(UCLIBCXX_RUNTIME_BINDIR)
> + 
> + $(WRAPPER):
> +-	echo "#!/bin/bash" > $(WRAPPER)
> ++	echo "#!/bin/sh" > $(WRAPPER)
> + 	echo "" >> $(WRAPPER)
> + 	echo 'WRAPPER_INCLUDEDIR="$${WRAPPER_INCLUDEDIR:=-I$(UCLIBCXX_RUNTIME_INCLUDEDIR)}"' >> $(WRAPPER)
> + 	echo 'WRAPPER_LIBDIR="$${WRAPPER_LIBDIR:=-L$(UCLIBCXX_RUNTIME_LIBDIR)}"' >> $(WRAPPER)
> diff --git a/recipes/uclibc++/uclibc++_0.1.9.bb b/recipes/uclibc++/uclibc++_0.1.9.bb
> deleted file mode 100644
> index be1ac14..0000000
> --- a/recipes/uclibc++/uclibc++_0.1.9.bb
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -DESCRIPTION = "A C++ standard library targeted towards the embedded \
> -systems/software market."
> -HOMEPAGE = "http://cxx.uclibc.org/"
> -LICENSE = "LGPL"
> -PRIORITY = "optional"
> -SECTION = "libs"
> -
> -PR = "r2"
> -
> -SRC_URI = "http://cxx.uclibc.org/src/uClibc++-${PV}.tbz2 \
> -	   file://nobash.patch \
> -	   file://defconfig"
> -S = "${WORKDIR}/uClibc++"
> -
> -# uClibc++ runtime prefix directory (UCLIBCXX_RUNTIME_PREFIX) [/usr/$(TARGET_ARCH)-linux-uclibc] (NEW)
> -# uClibc++ header file subdirectory (UCLIBCXX_RUNTIME_INCLUDE_SUBDIR) [/include] (NEW)
> -# uClibc++ library subdirectory (UCLIBCXX_RUNTIME_LIB_SUBDIR) [/lib] (NEW)
> -# uClibc++ application file subdirectory (UCLIBCXX_RUNTIME_BIN_SUBDIR) [/bin] (NEW)
> -
> -do_unpack_real () {
> -	bzcat uClibc++-${PV}.tbz2 | tar -xvf -
> -}
> -do_unpack_real[dirs] = "${WORKDIR}"
> -addtask unpack_real before do_patch after do_unpack
> -
> -EXTRA_OEMAKE = "'OPTIMIZATION=' 'XWARNINGS=' 'XARCH_CFLAGS=${CFLAGS}' \
> -		'CPU_FLAGS=' 'STRIPTOOL=true' 'LD=${LD}'"
> -configmangle = 's,^UCLIBCXX_RUNTIME_PREFIX=.*,UCLIBCXX_RUNTIME_PREFIX="${exec_prefix}",; \
> -		s,^UCLIBCXX_RUNTIME_INCLUDE_SUBDIR=.*,UCLIBCXX_RUNTIME_INCLUDE_SUBDIR="/include/c++-uc",; \
> -		s,^UCLIBCXX_RUNTIME_LIB_SUBDIR=.*,UCLIBCXX_RUNTIME_LIB_SUBDIR="/lib",; \
> -		s,^UCLIBCXX_RUNTIME_BIN_SUBDIR=.*,UCLIBCXX_RUNTIME_BIN_SUBDIR="/bin",;'
> -PARALLEL_MAKE = ""
> -
> -do_configure () {
> -	cp ${WORKDIR}/defconfig ${S}/.config
> -
> -	perl -i -p -e 's,^CROSS=.*,TARGET_ARCH=${TARGET_ARCH}\nCROSS=${TARGET_PREFIX},g' ${S}/Rules.mak
> -	perl -i -p -e '${configmangle}' ${S}/.config
> -
> -	oe_runmake oldconfig
> -}
> -
> -do_install () {
> -	oe_runmake 'DESTDIR=${D}' install
> -	chmod +x ${D}${libdir}/libuClibc++.so.*
> -}
> -
> -PACKAGES = "g++-uc libuclibc++ libuclibc++-dev"
> -FILES_g++-uc = "${bindir}/g++-uc"
> -FILES_libuclibc++ = "${libdir}/*.so.*"
> -FILES_libuclibc++-dev = "${FILES_uclibc++-dev}"
> -
> -SRC_URI[md5sum] = "ebf58e04d72eab5c131c2c9118737024"
> -SRC_URI[sha256sum] = "82342a5d6088421e79699dd7af614ebecf6dd335eabce07690902a379f5ea8de"
> diff --git a/recipes/uclibc++/uclibc++_git.bb b/recipes/uclibc++/uclibc++_git.bb
> new file mode 100644
> index 0000000..58e62d6
> --- /dev/null
> +++ b/recipes/uclibc++/uclibc++_git.bb
> @@ -0,0 +1,51 @@
> +DESCRIPTION = "A C++ standard library targeted towards the embedded \
> +systems/software market."
> +HOMEPAGE = "http://cxx.uclibc.org/"
> +LICENSE = "LGPL"
> +PRIORITY = "optional"
> +SECTION = "libs"
> +
> +PR = "r0"
> +
> +SRCREV = "5976d7536d8c7a8d5a7f60fd2a3c34876a224f30"
> +
> +SRC_URI = "git://git.busybox.net/uClibc++;protocol=git \
> +	   file://nobash.patch \
> +	   file://006-eabi_fix.patch \
> +	   file://009-compile_fixes.patch \
> +	   file://900-dependent_exception.patch \
> +	   file://cstring.patch \
> +	   file://defconfig"
> +S = "${WORKDIR}/git"
> +
> +# uClibc++ runtime prefix directory (UCLIBCXX_RUNTIME_PREFIX) [/usr/$(TARGET_ARCH)-linux-uclibc] (NEW)
> +# uClibc++ header file subdirectory (UCLIBCXX_RUNTIME_INCLUDE_SUBDIR) [/include] (NEW)
> +# uClibc++ library subdirectory (UCLIBCXX_RUNTIME_LIB_SUBDIR) [/lib] (NEW)
> +# uClibc++ application file subdirectory (UCLIBCXX_RUNTIME_BIN_SUBDIR) [/bin] (NEW)
> +
> +EXTRA_OEMAKE = "'OPTIMIZATION=' 'XWARNINGS=' 'XARCH_CFLAGS=${CFLAGS}' \
> +		'CPU_FLAGS=' 'STRIPTOOL=true' 'LD=${LD}'"
> +configmangle = 's,^UCLIBCXX_RUNTIME_PREFIX=.*,UCLIBCXX_RUNTIME_PREFIX="${exec_prefix}",; \
> +		s,^UCLIBCXX_RUNTIME_INCLUDE_SUBDIR=.*,UCLIBCXX_RUNTIME_INCLUDE_SUBDIR="/include/c++-uc",; \
> +		s,^UCLIBCXX_RUNTIME_LIB_SUBDIR=.*,UCLIBCXX_RUNTIME_LIB_SUBDIR="/lib",; \
> +		s,^UCLIBCXX_RUNTIME_BIN_SUBDIR=.*,UCLIBCXX_RUNTIME_BIN_SUBDIR="/bin",;'
> +PARALLEL_MAKE = ""
> +
> +do_configure () {
> +	cp ${WORKDIR}/defconfig ${S}/.config
> +
> +	perl -i -p -e 's,^CROSS=.*,TARGET_ARCH=${TARGET_ARCH}\nCROSS=${TARGET_PREFIX},g' ${S}/Rules.mak
> +	perl -i -p -e '${configmangle}' ${S}/.config
> +
> +	oe_runmake oldconfig
> +}
> +
> +do_install () {
> +	oe_runmake 'DESTDIR=${D}' install
> +	chmod +x ${D}${libdir}/libuClibc++.so.*
> +}
> +
> +PACKAGES = "g++-uc libuclibc++ libuclibc++-dev"
> +FILES_g++-uc = "${bindir}/g++-uc"
> +FILES_libuclibc++ = "${libdir}/*.so.*"
> +FILES_libuclibc++-dev = "${FILES_uclibc++-dev}"
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


