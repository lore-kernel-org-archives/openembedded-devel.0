Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 121AD782CE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Aug 2017 19:23:49 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id u9so437499pgn.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Aug 2017 12:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=xyrCmvdhzxtud8GN0pwgVPwrt62JzB4pCQddqz2sEyo=;
	b=Wd/9eTRveZ6pjEbxM9WvBawiDnPfF/fEOYiFwLBuyzGSc0gTuUKUlPROYxTsq+SS5M
	nilNHeK+W5dL9chto95M/r+VNBr+pUTID86rviDl6EVLJueAGwZ9AUZHTcvXPwd9Xg2E
	swxbRcjjyXsOToIx2GXVbdd347vxLB5yPGtM2MhJmDy5w3XBTky0lyQfXbADLROXJXMP
	7Mb4U8nNscGfbSWm/JdkpVkR+PavMkGv77LuXpX+YozyLnVmT3LbKJDh5qCxq7mEzrz5
	FQF4mQjXfL70mrbtk0qcXkPpOLCi94MK+jxS8XNsmpHqpnn74rMFagr5nfBioOegbejb
	veTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=xyrCmvdhzxtud8GN0pwgVPwrt62JzB4pCQddqz2sEyo=;
	b=K4EZRyiDXAVY+RCFnEg6JwhSG5zcZ06IEAodm+5xcLrdoSkB0qVrau5DKI6/0BbsvS
	aD8NVbnQkwgnHJxiRkWEtkKL4fJeymsHuc0yv1FSnZVRTEj/EiZlF5Jdhy2/+1FJ1F2P
	QDWR3FYgAsq9PdUZarYPAB2DUDGDqmfzhz9kovYbHHTeOTldfu4xId/eR4LwMHOerCfW
	B+ANuuqiMlC6KIOWx48AwmWrITLKjINRtDlZHw5BVrvc+r1nGmv8coEJKETWJvVFeCfh
	QQo4OPqJb1aCL2VUDV27aVc3VheVMPuOBmbcbm9M7bZscbedU1dAX9eAz50P3U2wi2f3
	Xvgw==
X-Gm-Message-State: AHYfb5hdYjZ2/eI86j+lB99H5zxNcx1wGUF0z/kEl1BcWeiSGdvd9xDn
	XL4GdI7sbUganw==
X-Received: by 10.98.37.199 with SMTP id l190mr3950155pfl.332.1503516231339;
	Wed, 23 Aug 2017 12:23:51 -0700 (PDT)
Received: from ?IPv6:2601:647:4c00:6cf9:1d5a:396a:8869:87e0?
	([2601:647:4c00:6cf9:1d5a:396a:8869:87e0])
	by smtp.gmail.com with ESMTPSA id
	z189sm3440037pgb.12.2017.08.23.12.23.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Aug 2017 12:23:50 -0700 (PDT)
To: liu.ming50@gmail.com, openembedded-devel@lists.openembedded.org
References: <1503473173-12677-1-git-send-email-liu.ming50@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <2981c645-6874-7925-c512-04f7dcd0038c@gmail.com>
Date: Wed, 23 Aug 2017 12:23:50 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:56.0)
	Gecko/20100101 Thunderbird/56.0
MIME-Version: 1.0
In-Reply-To: <1503473173-12677-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
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
X-List-Received-Date: Wed, 23 Aug 2017 19:23:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/23/17 12:26 AM, liu.ming50@gmail.com wrote:
> From: Ming Liu <peter.x.liu@external.atlascopco.com>
> 
> I could not manage to build nativesdk-clang, I encountered errors as
> follows: (trimmed for purpose)
> | ../gcc/x86_64-pokysdk-linux/6.3.0/ld::
> | cannot find crt1.o: No such file or directory
> | cannot find crtbegin.o: No such file or directory
> | cannot find -lgcc
> | cannot find -lgcc_s
> 
> After some investigation, I found it's caused by the llvm native tools
> could not compile with crosssdk toolchains. (special linking flags
> are needed)
> 
> So we introduce a cmake-native class with a task to generate a native
> toolchain file, it will be used to build llvm native tools by passed
> with CROSS_TOOLCHAIN_FLAGS_NATIVE.

I have applied it. But does this happen when you use gcc7 for gcc as well ?
> 
> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> ---
>  classes/cmake-native.bbclass        | 47 +++++++++++++++++++++++++++++++++++++
>  recipes-devtools/clang/clang_git.bb |  3 ++-
>  2 files changed, 49 insertions(+), 1 deletion(-)
>  create mode 100644 classes/cmake-native.bbclass
> 
> diff --git a/classes/cmake-native.bbclass b/classes/cmake-native.bbclass
> new file mode 100644
> index 0000000..911476e
> --- /dev/null
> +++ b/classes/cmake-native.bbclass
> @@ -0,0 +1,47 @@
> +# We need to unset CCACHE otherwise cmake gets too confused
> +CCACHE = ""
> +
> +# Native C/C++ compiler (without cpu arch/tune arguments)
> +OECMAKE_NATIVE_C_COMPILER ?= "`echo ${BUILD_CC} | sed 's/^\([^ ]*\).*/\1/'`"
> +OECMAKE_NATIVE_CXX_COMPILER ?= "`echo ${BUILD_CXX} | sed 's/^\([^ ]*\).*/\1/'`"
> +OECMAKE_NATIVE_AR ?= "${BUILD_AR}"
> +
> +# Native compiler flags
> +OECMAKE_NATIVE_C_FLAGS ?= "${BUILD_CC_ARCH} ${BUILD_CFLAGS}"
> +OECMAKE_NATIVE_CXX_FLAGS ?= "${BUILD_CC_ARCH} ${BUILD_CXXFLAGS}"
> +OECMAKE_NATIVE_C_FLAGS_RELEASE ?= "-DNDEBUG"
> +OECMAKE_NATIVE_CXX_FLAGS_RELEASE ?= "-DNDEBUG"
> +OECMAKE_NATIVE_C_LINK_FLAGS ?= "${BUILD_CC_ARCH} ${BUILD_CPPFLAGS} ${BUILD_LDFLAGS}"
> +OECMAKE_NATIVE_CXX_LINK_FLAGS ?= "${BUILD_CC_ARCH} ${BUILD_CXXFLAGS} ${BUILD_LDFLAGS}"
> +BUILD_CXXFLAGS += "${BUILD_CC_ARCH}"
> +BUILD_CFLAGS += "${BUILD_CC_ARCH}"
> +
> +do_generate_native_toolchain_file() {
> +        cat > ${WORKDIR}/toolchain-native.cmake <<EOF
> +set( CMAKE_SYSTEM_NAME `echo ${BUILD_OS} | sed -e 's/^./\u&/' -e 's/^\(Linux\).*/\1/'` )
> +set( CMAKE_SYSTEM_PROCESSOR ${BUILD_ARCH} )
> +set( CMAKE_C_COMPILER ${OECMAKE_NATIVE_C_COMPILER} )
> +set( CMAKE_CXX_COMPILER ${OECMAKE_NATIVE_CXX_COMPILER} )
> +set( CMAKE_ASM_COMPILER ${OECMAKE_NATIVE_C_COMPILER} )
> +set( CMAKE_AR ${OECMAKE_NATIVE_AR} CACHE FILEPATH "Archiver" )
> +set( CMAKE_C_FLAGS "${OECMAKE_NATIVE_C_FLAGS}" CACHE STRING "CFLAGS" )
> +set( CMAKE_CXX_FLAGS "${OECMAKE_NATIVE_CXX_FLAGS}" CACHE STRING "CXXFLAGS" )
> +set( CMAKE_ASM_FLAGS "${OECMAKE_NATIVE_C_FLAGS}" CACHE STRING "ASM FLAGS" )
> +set( CMAKE_C_FLAGS_RELEASE "${OECMAKE_NATIVE_C_FLAGS_RELEASE}" CACHE STRING "Additional CFLAGS for release" )
> +set( CMAKE_CXX_FLAGS_RELEASE "${OECMAKE_NATIVE_CXX_FLAGS_RELEASE}" CACHE STRING "Additional CXXFLAGS for release" )
> +set( CMAKE_ASM_FLAGS_RELEASE "${OECMAKE_NATIVE_C_FLAGS_RELEASE}" CACHE STRING "Additional ASM FLAGS for release" )
> +set( CMAKE_C_LINK_FLAGS "${OECMAKE_NATIVE_C_LINK_FLAGS}" CACHE STRING "LDFLAGS" )
> +set( CMAKE_CXX_LINK_FLAGS "${OECMAKE_NATIVE_CXX_LINK_FLAGS}" CACHE STRING "LDFLAGS" )
> +
> +set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_NATIVE} )
> +set( CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY )
> +set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM BOTH )
> +set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
> +set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )
> +
> +# Use native cmake modules
> +list(APPEND CMAKE_MODULE_PATH "${STAGING_DATADIR_NATIVE}/cmake/Modules/")
> +EOF
> +}
> +
> +addtask generate_native_toolchain_file after do_patch before do_configure
> diff --git a/recipes-devtools/clang/clang_git.bb b/recipes-devtools/clang/clang_git.bb
> index fb7854c..c226093 100644
> --- a/recipes-devtools/clang/clang_git.bb
> +++ b/recipes-devtools/clang/clang_git.bb
> @@ -27,7 +27,7 @@ INHIBIT_DEFAULT_DEPS = "1"
>  
>  S = "${WORKDIR}/git"
>  
> -inherit cmake
> +inherit cmake cmake-native
>  
>  OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "BOTH"
>  
> @@ -85,6 +85,7 @@ EXTRA_OECMAKE_append_class-native = "\
>  "
>  EXTRA_OECMAKE_append_class-nativesdk = "\
>                    -DCMAKE_CROSSCOMPILING:BOOL=ON \
> +                  -DCROSS_TOOLCHAIN_FLAGS_NATIVE='-DCMAKE_TOOLCHAIN_FILE=${WORKDIR}/toolchain-native.cmake' \
>                    -DLLVM_TARGETS_TO_BUILD='${LLVM_TARGETS_TO_BUILD}' \
>                    -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen \
>                    -DCLANG_TABLEGEN=${STAGING_BINDIR_NATIVE}/clang-tblgen \
> 


