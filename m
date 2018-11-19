Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id A8CA26C0FE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Nov 2018 21:26:27 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id n12so51145971qkh.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Nov 2018 13:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qz6KwBWbbOC4slXVrHcIdoegY0bs/nJSNq6vUU8O/yQ=;
	b=Et3kjt9znYkOZIPU+iVCaxx+4Swq/GxvlDIuIqCXeBct2r4/WCK8hHA/jBNugXyXjZ
	MDcsmvpRuI9zqeU/etRiojqYNDI3r/3bRcTBLkXjIK/WYg9eKSyZsL7yKQ826Ydty5UB
	EOplmx6Sfp5lBsZ3G4yM6H+rQGAXiMEgynZkcsgGQVR8X2YSvL0EfBGKQJdS9POsLHTT
	/QAV+PvqRclIjlqAjjOASHZavX0aURLaII+MUKLVsPnJtj4CCnYqVJc61w/Qn6DIrfHx
	Z17r7MiSG3NQF55bBjkcWabI7mzCjnd7QuNtHYlcOYhUZVu4wIcolMtpawPftXkZWiUA
	7FzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qz6KwBWbbOC4slXVrHcIdoegY0bs/nJSNq6vUU8O/yQ=;
	b=b+69xgYMfS/MGa17hbhvfflIeLFzPyJqLXKLAgNqpnT4soOgTZs+dqAiwfL3CxBKwa
	5wZ7vN9ltUVzTa8XfQC6zH1eAqRD9tVHGYzXyKXFW6SLWftqc8oB2PdsFkJL2UkiVy8f
	mdrWZblEP3bKgNkl7yY9PDWoINQxKBh6PMik9Aq6UjFpkRNIHVZu3FlQCXwHhtzfnNbT
	wE4zXqZcNjWHCzy/JcDknVgBtMfxj8nZ/QGrwB4m64Lwu/iCPX2MILMvZ54QLOhI7/aK
	/MeNBSgkUyyfA9lmXbuyw2HZQJbq5bVTAqbLHkStrIjVZznk5j5A7d2fa6k8qh3wHZxY
	aCNg==
X-Gm-Message-State: AGRZ1gIs+z6ya9roO+Pn0Jfrm49birvVszuHU/4EwXJg9GrJCuAml/nU
	/n/+6OngQfxOGMCDu1KVsmL0M/2sSHIpXCYBD6U=
X-Google-Smtp-Source: AJdET5dAaoF/ktrJJsLYKkiDLcLKe4P/0NA3+JnTk0PFn9HA7Z4jF3xIWUVWfh1rmU941G/K1EukDel/SBrKekQwud4=
X-Received: by 2002:ac8:518d:: with SMTP id c13mr22167224qtn.254.1542662788367;
	Mon, 19 Nov 2018 13:26:28 -0800 (PST)
MIME-Version: 1.0
References: <20181119151819.124335-1-uvv.mail@gmail.com>
In-Reply-To: <20181119151819.124335-1-uvv.mail@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Nov 2018 13:26:02 -0800
Message-ID: <CAMKF1spi6ndHWCrHyw6hmdZnBdDbO4UvboNvmvSwdpBgmqX-tg@mail.gmail.com>
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: Vyacheslav.Yurkov@bruker.com,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] glog: fixed the build for mips and other platforms
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Nov 2018 21:26:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 19, 2018 at 7:19 AM Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:
>
> From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
>
> According to build log http://errors.yoctoproject.org/Errors/Details/201286/
> FindLibunwind wokred only for x86, arm, and x86_64. This patch extends the
> cmake module to work with mips, ia64, ppc(64) and other architectures supported
> by libunwind

It would be good to add riscv64 and arc to this list as well.

>
> Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
> ---
>  ...0002-Find-Libunwind-during-configure.patch | 34 ++++++++++++++-----
>  1 file changed, 25 insertions(+), 9 deletions(-)
>
> diff --git a/meta-oe/recipes-support/glog/glog/0002-Find-Libunwind-during-configure.patch b/meta-oe/recipes-support/glog/glog/0002-Find-Libunwind-during-configure.patch
> index 3a6f824ea..4ad302cbe 100644
> --- a/meta-oe/recipes-support/glog/glog/0002-Find-Libunwind-during-configure.patch
> +++ b/meta-oe/recipes-support/glog/glog/0002-Find-Libunwind-during-configure.patch
> @@ -1,11 +1,11 @@
>  diff -uNr a/cmake/FindLibunwind.cmake b/cmake/FindLibunwind.cmake
>  --- a/cmake/FindLibunwind.cmake        1970-01-01 01:00:00.000000000 +0100
> -+++ b/cmake/FindLibunwind.cmake        2018-11-02 14:04:35.460437058 +0100
> -@@ -0,0 +1,37 @@
> ++++ b/cmake/FindLibunwind.cmake        2018-11-19 16:07:17.652031645 +0100
> +@@ -0,0 +1,54 @@
>  +# - Try to find libunwind
>  +# Once done this will define
>  +#
> -+#  LIBUNWIND_FOUND - system has libunwind
> ++#  Libunwind_FOUND - system has libunwind
>  +#  unwind - cmake target for libunwind
>  +
>  +find_library (UNWIND_LIBRARY NAMES unwind DOC "unwind library")
> @@ -15,11 +15,24 @@ diff -uNr a/cmake/FindLibunwind.cmake b/cmake/FindLibunwind.cmake
>  +
>  +if (CMAKE_SYSTEM_PROCESSOR MATCHES "^arm")
>  +    set(LIBUNWIND_ARCH "arm")
> ++elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^aarch64")
> ++    set(LIBUNWIND_ARCH "aarch64")
>  +elseif (CMAKE_SYSTEM_PROCESSOR STREQUAL "x86_64" OR
> -+        CMAKE_SYSTEM_PROCESSOR STREQUAL "amd64")
> ++        CMAKE_SYSTEM_PROCESSOR STREQUAL "amd64" OR
> ++        CMAKE_SYSTEM_PROCESSOR STREQUAL "corei7-64")
>  +    set(LIBUNWIND_ARCH "x86_64")
>  +elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^i.86$")
>  +    set(LIBUNWIND_ARCH "x86")
> ++elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^ppc64")
> ++    set(LIBUNWIND_ARCH "ppc64")
> ++elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^ppc")
> ++    set(LIBUNWIND_ARCH "ppc32")
> ++elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^mips")
> ++    set(LIBUNWIND_ARCH "mips")
> ++elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^hppa")
> ++    set(LIBUNWIND_ARCH "hppa")
> ++elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^ia64")
> ++    set(LIBUNWIND_ARCH "ia64")
>  +endif()
>  +
>  +find_library (UNWIND_LIBRARY_PLATFORM NAMES "unwind-${LIBUNWIND_ARCH}" DOC "unwind library platform")
> @@ -35,13 +48,17 @@ diff -uNr a/cmake/FindLibunwind.cmake b/cmake/FindLibunwind.cmake
>  +
>  +mark_as_advanced (UNWIND_LIBRARY UNWIND_LIBRARY_PLATFORM)
>  +
> ++if (NOT Libunwind_FOUND)
> ++    message(FATAL_ERROR "Can't find libunwind library")
> ++endif()
> ++
>  +add_library(unwind INTERFACE IMPORTED)
>  +set_target_properties(unwind PROPERTIES
>  +    INTERFACE_LINK_LIBRARIES "${UNWIND_LIBRARY};${UNWIND_LIBRARY_PLATFORM}"
>  +)
>  diff -uNr a/CMakeLists.txt b/CMakeLists.txt
> ---- a/CMakeLists.txt   2018-11-02 14:02:21.784835854 +0100
> -+++ b/CMakeLists.txt   2018-11-02 14:03:16.796935594 +0100
> +--- a/CMakeLists.txt   2018-11-19 15:55:05.293665965 +0100
> ++++ b/CMakeLists.txt   2018-11-19 15:57:37.828381535 +0100
>  @@ -58,7 +58,6 @@
>   check_include_file (execinfo.h HAVE_EXECINFO_H)
>   check_include_file (glob.h HAVE_GLOB_H)
> @@ -91,10 +108,9 @@ diff -uNr a/CMakeLists.txt b/CMakeLists.txt
>     DESTINATION lib/cmake/glog)
>
>   install (EXPORT glog-targets NAMESPACE glog:: DESTINATION lib/cmake/glog)
> -Binary files a/.git/index and b/.git/index differ
>  diff -uNr a/glog-config.cmake.in b/glog-config.cmake.in
> ---- a/glog-config.cmake.in     2018-11-02 14:02:21.784835854 +0100
> -+++ b/glog-config.cmake.in     2018-11-02 14:03:16.796935594 +0100
> +--- a/glog-config.cmake.in     2018-11-19 15:55:05.293665965 +0100
> ++++ b/glog-config.cmake.in     2018-11-19 15:57:37.828381535 +0100
>  @@ -4,4 +4,15 @@
>
>   @gflags_DEPENDENCY@
> --
> 2.19.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

