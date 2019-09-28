Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5F5087E97A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Sep 2019 19:48:38 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id r5so11770214qtd.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Sep 2019 12:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NI6Ivifu9wQMVnJCMt7hr8nlu5yfjZt9/0t/hwhkyLw=;
	b=YE7Usb5aUpK2uAzruD8+v2x6U7Tzp6lVufzmf8pmV5N08JkMx0N8ERnpqehxg5k8PI
	wkl7e5fvCtuxmJYl8EhqwxKjCcODdMTn9BqIY7uXK1580iBZpKX8KtHK2TZKfWaJucTs
	t2ltJlSHv7qWU3WcREUdPxV8sDNozm1kKlzLBH1K14DzcLiW+3JnONvqUjlEh4VeTbAC
	7z0xG9QAjkona7BV/AftO4tSAAuE876mrKqeuhqDMtbCKyaHplqkUGg/PB1Ogt//82u9
	WiVFSktg6e2ddgwpswdUEfMwGcq0eZetJstTeMGRIJMAoBpGElzeUB4bKNdaFE3Jdyh2
	F/9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NI6Ivifu9wQMVnJCMt7hr8nlu5yfjZt9/0t/hwhkyLw=;
	b=e0pYYwbauADozIUTo+wznvO8y7IOsHRrWBjOeZuiQ8iVk5VJd1bRgi5kanwNfL6Afl
	pAaIXlXCUBhBhNA6uiV5+5M8oDZBa59Byo8+NWw5meKZW0ih25K5+7SbDZVnyNJODIEx
	jP2njhu9UizXYVmWtcqU0tZyJKxLfdFGwe/viouRLhpSTFx0QfgZertyf/0DODSQGAyB
	IWVqQrrCXndHtiMf58pX2h3JmJp4Fa1chmPl9rW3w56Z4eugBu7A0dScwYbtQz62enxj
	1JgUXhlqW+GQ6PB+GDe3ii5cdcf3a9faSmeDq6RJYzBfhz0FBnE4bgelERsPR5ZOkfTT
	w2GA==
X-Gm-Message-State: APjAAAVJnJgOMnrJ4c++ciqC4dNA/X55esThOcNs8Xjf9zETwcE3gEMd
	LJus2BOaHolIaSU6+EVX8qWrJIzSj+vYoHetCFz9UgdEUAE=
X-Google-Smtp-Source: APXvYqyjeL9x945fCx3pWadn+B6bmGC6K24+5CER2me0HxV9y0let6Z9iDDkY6eCxLlbJ8ryUO+9b66CGJM7bvFU1sA=
X-Received: by 2002:a05:6214:180a:: with SMTP id
	o10mr14072721qvw.51.1569700118636; 
	Sat, 28 Sep 2019 12:48:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190927165605.1900768-1-adrian.ratiu@collabora.com>
In-Reply-To: <20190927165605.1900768-1-adrian.ratiu@collabora.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 28 Sep 2019 12:48:10 -0700
Message-ID: <CAMKF1sqTmvwNDbXnvHvUfPVjq-hPLAQ6Yne=sph3Q-gqLGU3UA@mail.gmail.com>
To: Adrian Ratiu <adrian.ratiu@collabora.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v3] renderdoc: add new recipe
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
X-List-Received-Date: Sat, 28 Sep 2019 19:48:38 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 27, 2019 at 9:56 AM Adrian Ratiu <adrian.ratiu@collabora.com> wrote:
>
> RenderDoc is a MIT licensed stand-alone multi-platform graphics
> debugger that allows easy frame by frame capture and detailed
> introspection of any applications using Vulkan, OpenGL, OpenGL ES,
> and others.
>
> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
> ---
>
> Changes since v2:
>     - Replace the multiple COMPATIBLE_MACHINE assignments with a single
>     COMPATIBLE_HOST regexp
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
>  .../renderdoc/renderdoc_1.4.bb                | 37 ++++++++++++
>  3 files changed, 142 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/renderdoc/renderdoc/0001-renderdoc-use-xxd-instead-of-cross-compiling-shim-bi.patch
>  create mode 100644 meta-oe/recipes-graphics/renderdoc/renderdoc/0002-q-renderdoc-CMakeLists.txt-remove-flag-unsupported-b.patch
>  create mode 100644 meta-oe/recipes-graphics/renderdoc/renderdoc_1.4.bb
>
> diff --git a/meta-oe/recipes-graphics/renderdoc/renderdoc/0001-renderdoc-use-xxd-instead-of-cross-compiling-shim-bi.patch b/meta-oe/recipes-graphics/renderdoc/renderdoc/0001-renderdoc-use-xxd-instead-of-cross-compiling-shim-bi.patch
> new file mode 100644
> index 000000000..e96dedfc3
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/renderdoc/renderdoc/0001-renderdoc-use-xxd-instead-of-cross-compiling-shim-bi.patch
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
> +-    # If we're cross-compiling, include-bin will get built for the target and we
> +-    # then can't execute it. Instead, we force calling c++ (which we can safely
> +-    # assume is present) directly to build the binary
> +-
> +-    if(CMAKE_CROSSCOMPILING)
> +-        set(HOST_NATIVE_CPP_COMPILER c++ CACHE STRING "Command to run to compile a .cpp into an executable. Default is just c++")
> +-
> +-        add_custom_command(OUTPUT ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/include-bin
> +-            WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
> +-            COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}
> +-            COMMAND ${HOST_NATIVE_CPP_COMPILER} 3rdparty/include-bin/main.cpp -o ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/include-bin
> +-            DEPENDS 3rdparty/include-bin/main.cpp)
> +-        set(INCLUDE_BIN_EXE "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/include-bin")
> +-        set(INCLUDE_BIN_DEP "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/include-bin")
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
> diff --git a/meta-oe/recipes-graphics/renderdoc/renderdoc/0002-q-renderdoc-CMakeLists.txt-remove-flag-unsupported-b.patch b/meta-oe/recipes-graphics/renderdoc/renderdoc/0002-q-renderdoc-CMakeLists.txt-remove-flag-unsupported-b.patch
> new file mode 100644
> index 000000000..8cfac3b0e
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/renderdoc/renderdoc/0002-q-renderdoc-CMakeLists.txt-remove-flag-unsupported-b.patch
> @@ -0,0 +1,48 @@
> +From 40511a6f4dc6311c8cf7f2954d1202ede55881ff Mon Sep 17 00:00:00 2001
> +From: Adrian Ratiu <adrian.ratiu@collabora.com>
> +Date: Wed, 25 Sep 2019 19:31:14 +0300
> +Subject: [PATCH] (q)renderdoc/CMakeLists.txt: remove flag unsupported by GCC
> +
> +-Wno-unknown-warning is not supported by GCC, only by Clang so we
> +remove it because newer GCC versions like 9.2.0 will complain, older
> +versions would just ignore it.
> +
> +Upstream-Status: Pending [https://github.com/baldurk/renderdoc/pull/1530]
> +

gcc9 does support -Wno-unknown-warning perhaps you want
-Wno-error=unknown-warning

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
> +-        "QMAKE_CXXFLAGS+=-Wno-unknown-warning -Wno-implicit-fallthrough -Wno-cast-function-type -Wno-stringop-truncation\n")
> ++        "QMAKE_CXXFLAGS+=-Wno-implicit-fallthrough -Wno-cast-function-type -Wno-stringop-truncation\n")
> + endif()
> +
> + # propagate build version info. Lots of escaping needed here to pass ""s into the define value
> +diff --git a/renderdoc/CMakeLists.txt b/renderdoc/CMakeLists.txt
> +index 453a034ba..abe7e1302 100644
> +--- a/renderdoc/CMakeLists.txt
> ++++ b/renderdoc/CMakeLists.txt
> +@@ -320,10 +320,10 @@ if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang" OR APPLE)
> +
> +     if(CMAKE_COMPILER_IS_GNUCXX)
> +         set_property(SOURCE 3rdparty/jpeg-compressor/jpgd.cpp
> +-            APPEND_STRING PROPERTY COMPILE_FLAGS " -Wno-unknown-warning -Wno-implicit-fallthrough")
> ++            APPEND_STRING PROPERTY COMPILE_FLAGS " -Wno-implicit-fallthrough")
> +
> +         set_property(SOURCE strings/utf8printf.cpp
> +-            APPEND_STRING PROPERTY COMPILE_FLAGS " -Wno-unknown-warning -Wno-format-truncation")
> ++            APPEND_STRING PROPERTY COMPILE_FLAGS " -Wno-format-truncation")
> +     endif()
> +
> +     # Need to add -Wno-unknown-warning-option since only newer clang versions have
> diff --git a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.4.bb b/meta-oe/recipes-graphics/renderdoc/renderdoc_1.4.bb
> new file mode 100644
> index 000000000..1bd0c71b4
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/renderdoc/renderdoc_1.4.bb
> @@ -0,0 +1,37 @@
> +SUMMARY = "RenderDoc recipe providing renderdoccmd"
> +DESCRIPTION = "RenderDoc is a frame-capture based graphics debugger"
> +HOMEPAGE = "https://github.com/baldurk/renderdoc"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE.md;md5=9753b1b4fba3261c27d1ce5c1acef667"
> +
> +SRCREV = "214d85228538e71cc63a0d7fa11dd75b1d56cc81"
> +SRC_URI = "git://github.com/baldurk/${BPN}.git;protocol=http;branch=v1.x \
> +          file://0001-renderdoc-use-xxd-instead-of-cross-compiling-shim-bi.patch \
> +          file://0002-q-renderdoc-CMakeLists.txt-remove-flag-unsupported-b.patch \
> +"
> +S = "${WORKDIR}/git"
> +
> +DEPENDS += "virtual/libx11 virtual/libgl libxcb xcb-util-keysyms vim-native"
> +
> +RDEPENDS_${PN} = "libxcb xcb-util-keysyms"
> +
> +inherit cmake python3native
> +
> +python __anonymous () {
> +    # only works on glibc systems
> +    if d.getVar('TCLIBC') != "glibc":
> +        raise bb.parse.SkipRecipe("incompatible with %s C library" % d.getVar('TCLIBC'))
> +}
> +
> +COMPATIBLE_HOST = "(x86_64|i.86|arm|aarch64).*-linux"
> +
> +EXTRA_OECMAKE += "\
> +    -DENABLE_QRENDERDOC=OFF \
> +    -DENABLE_PYRENDERDOC=OFF \
> +    -DENABLE_RENDERDOCCMD=ON \
> +"
> +
> +TARGET_CFLAGS += "-Wno-error=deprecated-copy"
> +

this option is GCC specific mark it
TARGET_CFLAGS_append_toolchain-gcc

> +FILES_${PN} += "${libdir}"
> +FILES_${PN}-dev = "${includedir}"
> --
> 2.23.0
>

