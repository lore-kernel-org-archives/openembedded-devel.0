Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3CE206157A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2020 06:31:12 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id u124so18000111qkh.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2020 22:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=D+VRA1WIQ8mWfGR2ilt5TzMaWtFNFPAXvwAXBIYz5a4=;
	b=Gu5qzAXounJMNB3niJ3v9ukyMZ9zMUd8r+Asfz7zXtogN4A0SYRZFOEK9nQIdkkrVQ
	UUQw22sKo1nlv1ijup6PALL8iCaymRYIbVq3ZynA9dDU7WL7fU26Mbi4tVrQVFODZwv8
	CVV+B/JcaYOTdoelqc3o3PwXhZ3eM1XV22GtKxD0j8Bh9lQKK0MBsp/l35TqvZ8FO+fs
	PlaYiDLFtupgGh3nSMsaXKHzrtI407wI3Eqk4T1Igz0h9Mr83DlPblUz2Ugovic9zmJK
	GSWVX5+hgFZyShzG6LH7pb1n3dXnsZ69mt/0psa/V5NZlQIIDUC8E5gLbhRe2yE92c2n
	BZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=D+VRA1WIQ8mWfGR2ilt5TzMaWtFNFPAXvwAXBIYz5a4=;
	b=KlD1DkmPPj7POmSaHkqqBnE0FjeLGHJMNuPIYOG2WiHLn+v/xTKXVJMTbpvSkQFB7x
	BbkuDFMW1rVdGlPIzGcwZ4eQjdF4SSutD30nXo+IL0OAzCx37QvgdEsILj7rSG2i8BKu
	n1CNacXoW3285s0Vev7fE1tT/erRiFj9Ppd+gwcBt926vnLJqRT1/KrcUSZdHK2wWVCG
	LgcuVcqeDv46xFBkNg9CEwZmUXmRQwXU1lmQF2BlnzxQdyDcMsYxEqHE0YNvdiymeTBy
	Tkz/6HzR+/HVH7ayj4pOCq5QZXYFd1R+IW5lp7zO3qwTppKuQz/bbLkk/bHysDDLqfL2
	RArg==
X-Gm-Message-State: APjAAAUXySduJwSSc94IaWcBHJMDW2+aUlJEuLncBYnDLeoSlbwUErjH
	ugLteX4ZPoQQxcBya1YSg0yw88kcapiHwBcSqM/Z9eua
X-Google-Smtp-Source: APXvYqzML7oMEY05mCw4pzo3vC13C6Mk1Rp9wuDKvpLTy8T/EoVecSxXxINA/v6b9n4kjoST64CRmEIZpmv6V5281N8=
X-Received: by 2002:a37:de05:: with SMTP id h5mr17976518qkj.474.1582007472752; 
	Mon, 17 Feb 2020 22:31:12 -0800 (PST)
MIME-Version: 1.0
References: <20200218052544.9467-1-leo.yan@linaro.org>
	<20200218052544.9467-4-leo.yan@linaro.org>
In-Reply-To: <20200218052544.9467-4-leo.yan@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Feb 2020 22:30:46 -0800
Message-ID: <CAMKF1spwQ+Y3D3MpdnV1OcNSVL=7=fENq8amqpBMq0d6WHuwiQ@mail.gmail.com>
To: Leo Yan <leo.yan@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v1 3/4] BCC: Add build recipe
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
X-List-Received-Date: Tue, 18 Feb 2020 06:31:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 17, 2020 at 9:27 PM Leo Yan <leo.yan@linaro.org> wrote:
>
> From: Sumit Garg <sumit.garg@linaro.org>
>
> BPF Compiler Collection (BCC) is a toolkit for creating efficient kernel
> tracing and manipulation programs, and includes versatile tools and
> examples which based on eBPF.  This tool is very widely used on server
> section, but we also can use it for embedded system, e.g. use its
> function trace utilities (trace.py and argdist.py) to trace kernel
> function parameters and return values.
>
> This patch adds recipe for BCC version 0.12.0.  This patch also contains
> a patch to change cmake file so can look for libraries and headers which
> are installed in target sysroot-recipe path for cross compilation.
>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> Co-developed-by: Leo Yan <leo.yan@linaro.org>
> ---
>  ...-with-OE-LLVM-cross-compiled-package.patch | 32 ++++++++++++++++
>  meta-oe/recipes-devtools/bcc/bcc_0.12.0.bb    | 37 +++++++++++++++++++
>  2 files changed, 69 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/bcc/bcc/0001-Allow-to-build-with-OE-LLVM-cross-compiled-package.patch
>  create mode 100644 meta-oe/recipes-devtools/bcc/bcc_0.12.0.bb
>
> diff --git a/meta-oe/recipes-devtools/bcc/bcc/0001-Allow-to-build-with-OE-LLVM-cross-compiled-package.patch b/meta-oe/recipes-devtools/bcc/bcc/0001-Allow-to-build-with-OE-LLVM-cross-compiled-package.patch
> new file mode 100644
> index 000000000..b5acadc1b
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/bcc/bcc/0001-Allow-to-build-with-OE-LLVM-cross-compiled-package.patch
> @@ -0,0 +1,32 @@
> +From 93cf25ba663e68a6a6f4237fbe0ef8349b3f37ef Mon Sep 17 00:00:00 2001
> +From: Sumit Garg <sumit.garg@linaro.org>
> +Date: Fri, 14 Feb 2020 07:40:11 +0000
> +Subject: [PATCH] Allow to build with OE LLVM cross compiled package
> +
> +The default LLVM cmake package requires all libraries, headers and tools
> +to be present but in case of cross compilation, OE only provides
> +target specific libraries and headers and requires native llvm tools.
> +
> +So instead of looking for a complete llvm package, look for libraries and
> +headers which are installed in target sysroot-recipe path.
> +
> +Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> +---
> + CMakeLists.txt | 2 --
> + 1 file changed, 2 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 7bd0f3b2..6f1f12c0 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -39,8 +39,6 @@ endif()
> + if(NOT PYTHON_ONLY AND ENABLE_CLANG_JIT)
> + find_package(BISON)
> + find_package(FLEX)
> +-find_package(LLVM REQUIRED CONFIG)
> +-message(STATUS "Found LLVM: ${LLVM_INCLUDE_DIRS} ${LLVM_PACKAGE_VERSION}")
> + find_package(LibElf REQUIRED)
> +
> + # clang is linked as a library, but the library path searching is
> +--
> +2.17.1
> diff --git a/meta-oe/recipes-devtools/bcc/bcc_0.12.0.bb b/meta-oe/recipes-devtools/bcc/bcc_0.12.0.bb
> new file mode 100644
> index 000000000..687fb64c7
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/bcc/bcc_0.12.0.bb
> @@ -0,0 +1,37 @@
> +SUMMARY = "BPF Compiler Collection (BCC)"
> +HOMEPAGE = "https://github.com/iovisor/bcc"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e3fc50a88d0a364313df4b21ef20c29e"
> +
> +DEPENDS += "bison-native \
> +            ninja-native \
> +            elfutils-native \
> +            flex-native \
> +            ${MLPREFIX}elfutils \
> +            ${MLPREFIX}binutils \
> +            ${MLPREFIX}flex \
> +            luajit \
> +            clang \
> +            "
> +

this will add meta-clang dependency directly into meta-oe, which is not desired
is it possible to make it optional or perhaps marked when meta-clang
is not in BBLAYERS

> +RDEPENDS_${PN} += "bash python"
> +
> +SRC_URI = "git://github.com/iovisor/bcc \
> +           file://0001-Allow-to-build-with-OE-LLVM-cross-compiled-package.patch \
> +           "
> +SRCREV = "368a5b0714961953f3e3f61607fa16cb71449c1b"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +EXTRA_OECMAKE = " \
> +    -DCMAKE_INSTALL_PREFIX=/usr \
> +    -DENABLE_LLVM_SHARED=ON \
> +    -DENABLE_CLANG_JIT=ON \
> +    -DENABLE_MAN=OFF \
> +    -DLLVM_PACKAGE_VERSION=${LLVMVERSION} \
> +    -DPYTHON_CMD=python3 \
> +"
> +
> +FILES_${PN} += "${libdir}/python*/dist-packages"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

