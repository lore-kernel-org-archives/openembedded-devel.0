Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
	[209.85.222.178])
	by mail.openembedded.org (Postfix) with ESMTP id EF8237F33C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Sep 2019 14:28:56 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id 4so2102950qki.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Sep 2019 07:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jqxBuSZg51bh80sT2EQ+uahau1Qwlwj5gfvB/PFjCfc=;
	b=L01RPwtl8uQ4XxK+D9HZaeqtou3qUOuHYquFoooOvLroUgFkWLXGLeyMJVkijvW5It
	gK1SumhyIjM3bh85bvBOWrpK+87KQ33JqsmemEXVIvUYJvLd72WWhvlG9FdZNd/s6hwO
	Vjj08fetwrZhjNjeknpVgrImtdQ4DRNltHZus+bh/JbOk4+TGg5PnCc8OxEWMbJS2qbR
	KXB6Y1a/09rpXKWMLg1Peq2cRPsbGuCRTOyj0aA54PUIVMBsTXrS2UMU9teIZo9JHLYS
	evnqhlHEflTKA6ykR5MpcjMv+VwEWorOsYIElpv0ctJQoa00aMQQZkgd1k8KqdHMONFM
	9fVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jqxBuSZg51bh80sT2EQ+uahau1Qwlwj5gfvB/PFjCfc=;
	b=Uhn2mp3OuhIjrhMTZMAAOAWuDsp+B51fyOoj8NotPvmxWi/K1ojXl85ikN//wy3Eol
	nueUlCUY5NOG9imyWRWRezXf7LQgnZ4NZtsNn+hBjCM5c/44LZWHIL05LGwf5CcKuzWd
	pNnk73lRraRd3JjYYe+cxCEQeU/CzOWYijq7dB3vioiIdn6WYrUXgP3dyCZF0L63fgZZ
	TuhIUdi3V/cB4qBD4dZO8JCxqPKdDn4v24H1ZAUFvUN9PIRgR8Pb3Q8iyj5hiuG9eiVT
	BnHVz7+1I1yvFuEkcqF4FLNQGdldaUbXXB7FapXpGFW5TF1UZF5DoBIqseo19w4pfxGt
	stjQ==
X-Gm-Message-State: APjAAAUwXFkAI8W6UQutFzGiEzGMFmYEP6kL8rxYTOTxtqHQfSwfLifo
	W7l7EHoTeZd4kTtzoyq2JaVtJjcCC7hFKhoUE5k=
X-Google-Smtp-Source: APXvYqyujl0gXfvNBs3Nk2FMyL/hO/zISeIXGc97Nci77Ou0KQQgnS1aXYxbEEZ4O1IOduSOYSPntzOvtx0Vjq/7pFw=
X-Received: by 2002:a37:6651:: with SMTP id a78mr4920066qkc.474.1569594537348; 
	Fri, 27 Sep 2019 07:28:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190927113815.1868263-1-adrian.ratiu@collabora.com>
In-Reply-To: <20190927113815.1868263-1-adrian.ratiu@collabora.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 27 Sep 2019 07:28:44 -0700
Message-ID: <CAMKF1spgJoP=t-5PP=DMczroQb3P_hMs7iJjggLPTjPN=hsg9Q@mail.gmail.com>
To: Adrian Ratiu <adrian.ratiu@collabora.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] renderdoc: add new recipe
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
X-List-Received-Date: Fri, 27 Sep 2019 14:28:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 27, 2019 at 4:38 AM Adrian Ratiu <adrian.ratiu@collabora.com>
wrote:

> RenderDoc is a MIT licensed stand-alone multi-platform graphics
> debugger that allows easy frame by frame capture and detailed
> introspection of any applications using Vulkan, OpenGL, OpenGL ES,
> and others.
>
> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
> ---
>
> Changes since v1:
>     - Add COMPATIBLE_MACHINE assignemnts to avoid CI failures on
>     unsupported architectures
>     - Add libc test because recipe is only buildable with glibc,
>     tested against musl
>     - Minor whitespace fixes
>
>  ...d-instead-of-cross-compiling-shim-bi.patch | 57 +++++++++++++++++++
>  ...eLists.txt-remove-flag-unsupported-b.patch | 48 ++++++++++++++++
>  .../renderdoc/renderdoc_1.4.bb                | 41 +++++++++++++
>  3 files changed, 146 insertions(+)
>  create mode 100644
> meta-oe/recipes-graphics/renderdoc/renderdoc/0001-renderdoc-use-xxd-instead-of-cross-compiling-shim-bi.patch
>  create mode 100644
> meta-oe/recipes-graphics/renderdoc/renderdoc/0002-q-renderdoc-CMakeLists.txt-remove-flag-unsupported-b.patch
>  create mode 100644 meta-oe/recipes-graphics/renderdoc/renderdoc_1.4.bb
>
> diff --git
> a/meta-oe/recipes-graphics/renderdoc/renderdoc/0001-renderdoc-use-xxd-instead-of-cross-compiling-shim-bi.patch
> b/meta-oe/recipes-graphics/renderdoc/renderdoc/0001-renderdoc-use-xxd-instead-of-cross-compiling-shim-bi.patch
> new file mode 100644
> index 000000000..e96dedfc3
> --- /dev/null
> +++
> b/meta-oe/recipes-graphics/renderdoc/renderdoc/0001-renderdoc-use-xxd-instead-of-cross-compiling-shim-bi.patch
> @@ -0,0 +1,57 @@
> +From 41a8c9b5ac13066770baee476ebf9828371f4dad Mon Sep 17 00:00:00 2001
> +From: Adrian Ratiu <adrian.ratiu@collabora.com>
> +Date: Tue, 24 Sep 2019 16:07:18 +0300
> +Subject: [PATCH] renderdoc: use xxd instead of cross-compiling shim binary
> +
> +Renderdoc's attempt to cross compile an xxd replacement by directly
> +calling a host cross-compiler breaks under OE's recipe specific
> +sysroots protection because this is not a native recipe, so we just
> +use xxd-native instead.
> +
> +Upstream-Status: Inappropriate [embedded-specific]
> +
> +---
> + renderdoc/CMakeLists.txt | 23 +----------------------
> + 1 file changed, 1 insertion(+), 22 deletions(-)
> +
> +diff --git a/renderdoc/CMakeLists.txt b/renderdoc/CMakeLists.txt
> +index 5cb7440a4..453a034ba 100644
> +--- a/renderdoc/CMakeLists.txt
> ++++ b/renderdoc/CMakeLists.txt
> +@@ -370,26 +370,6 @@ set(data
> + set(data_objects)
> +
> + if(UNIX)
> +-    # If we're cross-compiling, include-bin will get built for the
> target and we
> +-    # then can't execute it. Instead, we force calling c++ (which we can
> safely
> +-    # assume is present) directly to build the binary
> +-
> +-    if(CMAKE_CROSSCOMPILING)
> +-        set(HOST_NATIVE_CPP_COMPILER c++ CACHE STRING "Command to run to
> compile a .cpp into an executable. Default is just c++")
> +-
> +-        add_custom_command(OUTPUT
> ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/include-bin
> +-            WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
> +-            COMMAND ${CMAKE_COMMAND} -E make_directory
> ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}
> +-            COMMAND ${HOST_NATIVE_CPP_COMPILER}
> 3rdparty/include-bin/main.cpp -o
> ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/include-bin
> +-            DEPENDS 3rdparty/include-bin/main.cpp)
> +-        set(INCLUDE_BIN_EXE
> "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/include-bin")
> +-        set(INCLUDE_BIN_DEP
> "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/include-bin")
> +-    else()
> +-        add_executable(include-bin 3rdparty/include-bin/main.cpp)
> +-        set(INCLUDE_BIN_EXE $<TARGET_FILE:include-bin>)
> +-        set(INCLUDE_BIN_DEP include-bin)
> +-    endif()
> +-
> +     foreach(res ${data})
> +         set(in ${res})
> +         set(working_dir ${CMAKE_CURRENT_SOURCE_DIR})
> +@@ -399,8 +379,7 @@ if(UNIX)
> +         add_custom_command(OUTPUT ${out_src}
> +             WORKING_DIRECTORY ${working_dir}
> +             COMMAND ${CMAKE_COMMAND} -E make_directory ${out_src_dir}
> +-            COMMAND ${INCLUDE_BIN_EXE} ${in} ${out_src}
> +-            DEPENDS ${INCLUDE_BIN_DEP}
> ++            COMMAND xxd -i ${in} ${out_src}
> +             DEPENDS ${res})
> +
> +         list(APPEND data_objects ${out_src})
> diff --git
> a/meta-oe/recipes-graphics/renderdoc/renderdoc/0002-q-renderdoc-CMakeLists.txt-remove-flag-unsupported-b.patch
> b/meta-oe/recipes-graphics/renderdoc/renderdoc/0002-q-renderdoc-CMakeLists.txt-remove-flag-unsupported-b.patch
> new file mode 100644
> index 000000000..8cfac3b0e
> --- /dev/null
> +++
> b/meta-oe/recipes-graphics/renderdoc/renderdoc/0002-q-renderdoc-CMakeLists.txt-remove-flag-unsupported-b.patch
> @@ -0,0 +1,48 @@
> +From 40511a6f4dc6311c8cf7f2954d1202ede55881ff Mon Sep 17 00:00:00 2001
> +From: Adrian Ratiu <adrian.ratiu@collabora.com>
> +Date: Wed, 25 Sep 2019 19:31:14 +0300
> +Subject: [PATCH] (q)renderdoc/CMakeLists.txt: remove flag unsupported by
> GCC
> +
> +-Wno-unknown-warning is not supported by GCC, only by Clang so we
> +remove it because newer GCC versions like 9.2.0 will complain, older
> +versions would just ignore it.
> +
> +Upstream-Status: Pending [https://github.com/baldurk/renderdoc/pull/1530]
> +
> +Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
> +
> +---
> + qrenderdoc/CMakeLists.txt | 2 +-
> + renderdoc/CMakeLists.txt  | 4 ++--
> + 2 files changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/qrenderdoc/CMakeLists.txt b/qrenderdoc/CMakeLists.txt
> +index 9fd65b2d3..d52dd274e 100644
> +--- a/qrenderdoc/CMakeLists.txt
> ++++ b/qrenderdoc/CMakeLists.txt
> +@@ -149,7 +149,7 @@ file(WRITE
> + if(CMAKE_COMPILER_IS_GNUCXX)
> +     file(APPEND
> +         ${CMAKE_BINARY_DIR}/qrenderdoc/qrenderdoc_cmake.pri
> +-        "QMAKE_CXXFLAGS+=-Wno-unknown-warning -Wno-implicit-fallthrough
> -Wno-cast-function-type -Wno-stringop-truncation\n")
> ++        "QMAKE_CXXFLAGS+=-Wno-implicit-fallthrough
> -Wno-cast-function-type -Wno-stringop-truncation\n")
> + endif()
> +
> + # propagate build version info. Lots of escaping needed here to pass ""s
> into the define value
> +diff --git a/renderdoc/CMakeLists.txt b/renderdoc/CMakeLists.txt
> +index 453a034ba..abe7e1302 100644
> +--- a/renderdoc/CMakeLists.txt
> ++++ b/renderdoc/CMakeLists.txt
> +@@ -320,10 +320,10 @@ if(CMAKE_COMPILER_IS_GNUCXX OR
> CMAKE_CXX_COMPILER_ID MATCHES "Clang" OR APPLE)
> +
> +     if(CMAKE_COMPILER_IS_GNUCXX)
> +         set_property(SOURCE 3rdparty/jpeg-compressor/jpgd.cpp
> +-            APPEND_STRING PROPERTY COMPILE_FLAGS " -Wno-unknown-warning
> -Wno-implicit-fallthrough")
> ++            APPEND_STRING PROPERTY COMPILE_FLAGS "
> -Wno-implicit-fallthrough")
> +
> +         set_property(SOURCE strings/utf8printf.cpp
> +-            APPEND_STRING PROPERTY COMPILE_FLAGS " -Wno-unknown-warning
> -Wno-format-truncation")
> ++            APPEND_STRING PROPERTY COMPILE_FLAGS "
> -Wno-format-truncation")
> +     endif()
> +
> +     # Need to add -Wno-unknown-warning-option since only newer clang
> versions have
> diff --git a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.4.bb
> b/meta-oe/recipes-graphics/renderdoc/renderdoc_1.4.bb
> new file mode 100644
> index 000000000..e3bcbe6d4
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/renderdoc/renderdoc_1.4.bb
> @@ -0,0 +1,41 @@
> +SUMMARY = "RenderDoc recipe providing renderdoccmd"
> +DESCRIPTION = "RenderDoc is a frame-capture based graphics debugger"
> +HOMEPAGE = "https://github.com/baldurk/renderdoc"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM =
> "file://LICENSE.md;md5=9753b1b4fba3261c27d1ce5c1acef667"
> +
> +SRCREV = "214d85228538e71cc63a0d7fa11dd75b1d56cc81"
> +SRC_URI = "git://github.com/baldurk/${BPN}.git;protocol=http;branch=v1.x
> <http://github.com/baldurk/$%7BBPN%7D.git;protocol=http;branch=v1.x> \
> +
> file://0001-renderdoc-use-xxd-instead-of-cross-compiling-shim-bi.patch \
> +
> file://0002-q-renderdoc-CMakeLists.txt-remove-flag-unsupported-b.patch \
> +"
> +S = "${WORKDIR}/git"
> +
> +DEPENDS += "virtual/libx11 virtual/libgl libxcb xcb-util-keysyms
> vim-native"
> +
> +RDEPENDS_${PN} = "libxcb xcb-util-keysyms"
> +
> +inherit cmake python3native
> +
> +python __anonymous () {
> +    # only works on glibc systems
> +    if d.getVar('TCLIBC') != "glibc":
> +        raise bb.parse.SkipRecipe("incompatible with %s C library" %
> d.getVar('TCLIBC'))
> +}
> +
> +COMPATIBLE_MACHINE = "(^$)"
> +COMPATIBLE_MACHINE_x86 = "(.*)"
> +COMPATIBLE_MACHINE_x86-64 = "(.*)"
> +COMPATIBLE_MACHINE_arm = "(.*)"
> +COMPATIBLE_MACHINE_aarch64 = "(.*)"


We can use COMPATIBLE_HOST here and reduce
This to a single regexp there are
Many recipes doing that

>
> +
> +EXTRA_OECMAKE += "\
> +    -DENABLE_QRENDERDOC=OFF \
> +    -DENABLE_PYRENDERDOC=OFF \
> +    -DENABLE_RENDERDOCCMD=ON \
> +"
> +
> +TARGET_CFLAGS += "-Wno-error=deprecated-copy"
> +
> +FILES_${PN} += "${libdir}"
> +FILES_${PN}-dev = "${includedir}"
> --
> 2.23.0
>
>

