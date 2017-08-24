Return-Path: <liu.ming50@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5ABA2782AF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Aug 2017 01:53:22 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id g12so517674vkf.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Aug 2017 18:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KrzrUiBfI/qPmoqPVpIgozepBgx109B2DuH45lfEoJU=;
	b=Yw3Gvp+WgJWvYcCkDV+pi52d5TLqPlbO6ViOKRZD3CxU1E6JFqVW8HJ3ZDjjNRkrb9
	OZKSwttGsdEpWO4+4MYj08nmEetuC1jR+406nsOybMbpVksSaFxLL7AdxKfo3cl7PT7g
	Vv1P78ZCZ+pF/hrObWLQKySvyNbxsswGurJxESpswPj1cgzdJWxx6lQRuhMV5R0rpGC0
	ZNd51v47jUUFuvj5ljYncDZ4Kph3HiiIENWyrSJm+QtybQT9AGaExUq1cIx29ccujCjl
	JRlUi7PYLQ2FtXj62W3dKHREqzZzi60sRv67cl9fuGSpfuQDctnlBiLVlfMyXlomZctT
	4jhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KrzrUiBfI/qPmoqPVpIgozepBgx109B2DuH45lfEoJU=;
	b=ehIMk2C+/paAyQh9XsLuimAiOd5zMn03FC6N9H+dqMXSTdoXgXDiSFFEsidfXxe1xO
	R6HUlDu8FLqo3r5gWl+CuMXA41kvYXrjrTPZz9Lw9ZtjYsd7w2alwYMB7m2EJQoyFrCZ
	WYKPW9i4i//24noLWxGskr9vC05FYQUjHo6MI9U5hRYCv+8Ar0VR236KV+4F9rCWXbp2
	miytInQkFxRTmGi6T2y4umEHszzRhgntKeq8I9kQUrL47IHF76fSgXGCFHEbwXkLuKWi
	46BP1o7owynTt0gVNfhslCGtlESnZoAlzomZLFwJ16un+E8sgvYcMhQ5vX8H8DAD291I
	BQEw==
X-Gm-Message-State: AHYfb5jz8m1cg8dM7fMKmHFjVMiKJWMsnwH+7ygXJcpicIRLatIaB7zW
	OBjENLNcsfKL4VdvGCi8/qvCJqkgmA==
X-Received: by 10.31.136.196 with SMTP id k187mr2994801vkd.85.1503539603490;
	Wed, 23 Aug 2017 18:53:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.88.220 with HTTP; Wed, 23 Aug 2017 18:53:23 -0700 (PDT)
In-Reply-To: <2981c645-6874-7925-c512-04f7dcd0038c@gmail.com>
References: <1503473173-12677-1-git-send-email-liu.ming50@gmail.com>
	<2981c645-6874-7925-c512-04f7dcd0038c@gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Thu, 24 Aug 2017 03:53:23 +0200
Message-ID: <CALatG=6TUZD07-LsPg+Hpxcq65nHxse5tm7S=kKb4Ub9514Uzw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-clang] [PATCH] clang: fix nativesdk build
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
X-List-Received-Date: Thu, 24 Aug 2017 01:53:22 -0000
Content-Type: text/plain; charset="UTF-8"

Hi, Khem:

I have not tested that with gcc7, will do that and let you know.

//Ming Liu

2017-08-23 21:23 GMT+02:00 Khem Raj <raj.khem@gmail.com>:

> On 8/23/17 12:26 AM, liu.ming50@gmail.com wrote:
> > From: Ming Liu <peter.x.liu@external.atlascopco.com>
> >
> > I could not manage to build nativesdk-clang, I encountered errors as
> > follows: (trimmed for purpose)
> > | ../gcc/x86_64-pokysdk-linux/6.3.0/ld::
> > | cannot find crt1.o: No such file or directory
> > | cannot find crtbegin.o: No such file or directory
> > | cannot find -lgcc
> > | cannot find -lgcc_s
> >
> > After some investigation, I found it's caused by the llvm native tools
> > could not compile with crosssdk toolchains. (special linking flags
> > are needed)
> >
> > So we introduce a cmake-native class with a task to generate a native
> > toolchain file, it will be used to build llvm native tools by passed
> > with CROSS_TOOLCHAIN_FLAGS_NATIVE.
>
> I have applied it. But does this happen when you use gcc7 for gcc as well ?
> >
> > Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> > ---
> >  classes/cmake-native.bbclass        | 47 ++++++++++++++++++++++++++++++
> +++++++
> >  recipes-devtools/clang/clang_git.bb |  3 ++-
> >  2 files changed, 49 insertions(+), 1 deletion(-)
> >  create mode 100644 classes/cmake-native.bbclass
> >
> > diff --git a/classes/cmake-native.bbclass b/classes/cmake-native.bbclass
> > new file mode 100644
> > index 0000000..911476e
> > --- /dev/null
> > +++ b/classes/cmake-native.bbclass
> > @@ -0,0 +1,47 @@
> > +# We need to unset CCACHE otherwise cmake gets too confused
> > +CCACHE = ""
> > +
> > +# Native C/C++ compiler (without cpu arch/tune arguments)
> > +OECMAKE_NATIVE_C_COMPILER ?= "`echo ${BUILD_CC} | sed 's/^\([^
> ]*\).*/\1/'`"
> > +OECMAKE_NATIVE_CXX_COMPILER ?= "`echo ${BUILD_CXX} | sed 's/^\([^
> ]*\).*/\1/'`"
> > +OECMAKE_NATIVE_AR ?= "${BUILD_AR}"
> > +
> > +# Native compiler flags
> > +OECMAKE_NATIVE_C_FLAGS ?= "${BUILD_CC_ARCH} ${BUILD_CFLAGS}"
> > +OECMAKE_NATIVE_CXX_FLAGS ?= "${BUILD_CC_ARCH} ${BUILD_CXXFLAGS}"
> > +OECMAKE_NATIVE_C_FLAGS_RELEASE ?= "-DNDEBUG"
> > +OECMAKE_NATIVE_CXX_FLAGS_RELEASE ?= "-DNDEBUG"
> > +OECMAKE_NATIVE_C_LINK_FLAGS ?= "${BUILD_CC_ARCH} ${BUILD_CPPFLAGS}
> ${BUILD_LDFLAGS}"
> > +OECMAKE_NATIVE_CXX_LINK_FLAGS ?= "${BUILD_CC_ARCH} ${BUILD_CXXFLAGS}
> ${BUILD_LDFLAGS}"
> > +BUILD_CXXFLAGS += "${BUILD_CC_ARCH}"
> > +BUILD_CFLAGS += "${BUILD_CC_ARCH}"
> > +
> > +do_generate_native_toolchain_file() {
> > +        cat > ${WORKDIR}/toolchain-native.cmake <<EOF
> > +set( CMAKE_SYSTEM_NAME `echo ${BUILD_OS} | sed -e 's/^./\u&/' -e
> 's/^\(Linux\).*/\1/'` )
> > +set( CMAKE_SYSTEM_PROCESSOR ${BUILD_ARCH} )
> > +set( CMAKE_C_COMPILER ${OECMAKE_NATIVE_C_COMPILER} )
> > +set( CMAKE_CXX_COMPILER ${OECMAKE_NATIVE_CXX_COMPILER} )
> > +set( CMAKE_ASM_COMPILER ${OECMAKE_NATIVE_C_COMPILER} )
> > +set( CMAKE_AR ${OECMAKE_NATIVE_AR} CACHE FILEPATH "Archiver" )
> > +set( CMAKE_C_FLAGS "${OECMAKE_NATIVE_C_FLAGS}" CACHE STRING "CFLAGS" )
> > +set( CMAKE_CXX_FLAGS "${OECMAKE_NATIVE_CXX_FLAGS}" CACHE STRING
> "CXXFLAGS" )
> > +set( CMAKE_ASM_FLAGS "${OECMAKE_NATIVE_C_FLAGS}" CACHE STRING "ASM
> FLAGS" )
> > +set( CMAKE_C_FLAGS_RELEASE "${OECMAKE_NATIVE_C_FLAGS_RELEASE}" CACHE
> STRING "Additional CFLAGS for release" )
> > +set( CMAKE_CXX_FLAGS_RELEASE "${OECMAKE_NATIVE_CXX_FLAGS_RELEASE}"
> CACHE STRING "Additional CXXFLAGS for release" )
> > +set( CMAKE_ASM_FLAGS_RELEASE "${OECMAKE_NATIVE_C_FLAGS_RELEASE}" CACHE
> STRING "Additional ASM FLAGS for release" )
> > +set( CMAKE_C_LINK_FLAGS "${OECMAKE_NATIVE_C_LINK_FLAGS}" CACHE STRING
> "LDFLAGS" )
> > +set( CMAKE_CXX_LINK_FLAGS "${OECMAKE_NATIVE_CXX_LINK_FLAGS}" CACHE
> STRING "LDFLAGS" )
> > +
> > +set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_NATIVE} )
> > +set( CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY )
> > +set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM BOTH )
> > +set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
> > +set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )
> > +
> > +# Use native cmake modules
> > +list(APPEND CMAKE_MODULE_PATH "${STAGING_DATADIR_NATIVE}/
> cmake/Modules/")
> > +EOF
> > +}
> > +
> > +addtask generate_native_toolchain_file after do_patch before
> do_configure
> > diff --git a/recipes-devtools/clang/clang_git.bb
> b/recipes-devtools/clang/clang_git.bb
> > index fb7854c..c226093 100644
> > --- a/recipes-devtools/clang/clang_git.bb
> > +++ b/recipes-devtools/clang/clang_git.bb
> > @@ -27,7 +27,7 @@ INHIBIT_DEFAULT_DEPS = "1"
> >
> >  S = "${WORKDIR}/git"
> >
> > -inherit cmake
> > +inherit cmake cmake-native
> >
> >  OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "BOTH"
> >
> > @@ -85,6 +85,7 @@ EXTRA_OECMAKE_append_class-native = "\
> >  "
> >  EXTRA_OECMAKE_append_class-nativesdk = "\
> >                    -DCMAKE_CROSSCOMPILING:BOOL=ON \
> > +                  -DCROSS_TOOLCHAIN_FLAGS_NATIVE='-DCMAKE_TOOLCHAIN_
> FILE=${WORKDIR}/toolchain-native.cmake' \
> >                    -DLLVM_TARGETS_TO_BUILD='${LLVM_TARGETS_TO_BUILD}' \
> >                    -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen
> \
> >                    -DCLANG_TABLEGEN=${STAGING_BINDIR_NATIVE}/clang-tblgen
> \
> >
>
>

