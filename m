Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 81A5E75478
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Nov 2018 06:21:45 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id t13so12482253qtn.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 22:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bltaz3CCYfKQnNZ7BkcDGM70oGFpUefLMZhEqVC0QSQ=;
	b=uAEhUMn3lAQTWZ0dr/nmzF8F7CPT5IY42ULRxnG3sA5t9fjOr9NOixzGk7kH/dukMa
	ZNapRbl/GpNGhXQrN1hO7Lp7qqRIaAtskIJpnIp7tNwHKXAkYUSn/KC0HFEB7a/0ztn3
	x6nrN/la7HT1dHWHMJMV7tnyIDpHwvUUSIrBEaoUToH5u86ALXpwBOXbS6PhBq/nvyJp
	1XnWLIeuhgcjDkVvbljsBY4gK2lhqn9KBot19vKEFcSdZxSKU9dc3cXuiqGwpi8qhjZq
	MObKrNqN/ccKYi1YVfeetr0o6Jq7wIjYvjlJW6tEgVrzQUWju9GK2WJ9nLsCF4qaOmoo
	MvCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bltaz3CCYfKQnNZ7BkcDGM70oGFpUefLMZhEqVC0QSQ=;
	b=ncKh3ShZyEoKfcHYnukrM/RPjLYyBodRC3fhR/LnFB1AFlUF3eHGiDTvHM2pih1wk6
	fyHP1Dp4OJXg1E9d4eFhZudvsTvg3r7WAWWO54AU2qpxPLAMsvzwhMDQxjCwvy6iMS6e
	9a2MEIrkttsX5feSVKxR+NriQMYarUlkS/lm1PQKfbuh1QWKXgjW0PEbgP/iUlXquXlh
	+Uo2KvyiHff44P7R3V1Cxpt4A6ev+WLFR2MgP39zVMefMV5ohM9GG1M2J9FTe6nuHxCD
	ZXjcYIAlWMqptJTCAHwbXFm0JuJkIXBku7lvj2LTQ86jyXz1DwkWZWwoMd8LKUmwgdti
	97kQ==
X-Gm-Message-State: AA+aEWZBfHagXoJt+6N/LZCCwkn5FwXBKoUM0Uc/MlVRzliCghepp7RP
	rueWA/zMhTYB2KGxlcLwgAINiV5XKiyn2gGzJGOwID1Ua9M=
X-Google-Smtp-Source: AFSGD/WyoBePOqndgQ4RiUndSuyS7tNuh2WLFdlBnfM0+RLziqCoBEIrkttNAnFsTTX1m0sdHHyJQiWhlGbHYPXchCs=
X-Received: by 2002:ac8:518d:: with SMTP id c13mr17133404qtn.254.1543040506194;
	Fri, 23 Nov 2018 22:21:46 -0800 (PST)
MIME-Version: 1.0
References: <20181123153941.10186-1-brgl@bgdev.pl>
	<20181123153941.10186-4-brgl@bgdev.pl>
In-Reply-To: <20181123153941.10186-4-brgl@bgdev.pl>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 23 Nov 2018 22:21:19 -0800
Message-ID: <CAMKF1soiSDJSQ8+_m0R9fG+itVbhH=S2wGG9+QpvChR6MQkM=A@mail.gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 3/6] doxygen: new native package
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
X-List-Received-Date: Sat, 24 Nov 2018 06:21:45 -0000
Content-Type: text/plain; charset="UTF-8"

I think its better to have doxygen for target as well. So probably use
bbclassextend for native see

http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-devtools/doxygen/doxygen_1.8.9.1.bb?h=master

Once you merge the changes from this into your patch. Also send a
patch to meta-ti to remove it,

On Fri, Nov 23, 2018 at 7:39 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> Doxygen binary is necessary to generate C++ bindings for libsigrok.
>
> We're adding this as a native-only package since it's very unlikely
> it would be needed on any target.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  .../doxygen/doxygen-native_1.8.14.bb          | 15 ++++++++
>  .../0001-build-don-t-look-for-Iconv.patch     | 36 +++++++++++++++++++
>  2 files changed, 51 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/doxygen/doxygen-native_1.8.14.bb
>  create mode 100644 meta-oe/recipes-devtools/doxygen/doxygen/0001-build-don-t-look-for-Iconv.patch
>
> diff --git a/meta-oe/recipes-devtools/doxygen/doxygen-native_1.8.14.bb b/meta-oe/recipes-devtools/doxygen/doxygen-native_1.8.14.bb
> new file mode 100644
> index 000000000..38157085e
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/doxygen/doxygen-native_1.8.14.bb
> @@ -0,0 +1,15 @@
> +DESCRIPTION = "Doxygen is the de facto standard tool for generating documentation from annotated C++ sources."
> +HOMEPAGE = "http://www.doxygen.org/"
> +
> +LICENSE = "GPL-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +inherit cmake python3native native
> +
> +DEPENDS = "flex-native bison-native"
> +
> +SRC_URI = "ftp://ftp.stack.nl/pub/users/dimitri/doxygen-${PV}.src.tar.gz \
> +           file://0001-build-don-t-look-for-Iconv.patch"
> +
> +SRC_URI[md5sum] = "41d8821133e8d8104280030553e2b42b"
> +SRC_URI[sha256sum] = "d1757e02755ef6f56fd45f1f4398598b920381948d6fcfa58f5ca6aa56f59d4d"
> diff --git a/meta-oe/recipes-devtools/doxygen/doxygen/0001-build-don-t-look-for-Iconv.patch b/meta-oe/recipes-devtools/doxygen/doxygen/0001-build-don-t-look-for-Iconv.patch
> new file mode 100644
> index 000000000..0eefe0729
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/doxygen/doxygen/0001-build-don-t-look-for-Iconv.patch
> @@ -0,0 +1,36 @@
> +From f3a6c05e3a8afdac547c6c8176fa6b57636db65c Mon Sep 17 00:00:00 2001
> +From: Bartosz Golaszewski <brgl@bgdev.pl>
> +Date: Fri, 23 Nov 2018 11:44:56 +0100
> +Subject: [PATCH] build: don't look for Iconv
> +
> +Drop the find_package() for Iconv. CMake is unable to find iconv.h in
> +native build but all modern systems supply it as part of the standard
> +C library. We don't need this check in meta-openembedded.
> +
> +Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> +
> +Upstream-status: Inappropriate
> +- upstream doxygen must build on many architectures, this change is
> +  too intrusive for upstream
> +---
> + CMakeLists.txt | 4 ----
> + 1 file changed, 4 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index ba105b89..16252247 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -89,10 +89,6 @@ if (sqlite3)
> +     find_package(SQLite3 REQUIRED)
> + endif()
> +
> +-find_package(Iconv REQUIRED)
> +-include_directories(${ICONV_INCLUDE_DIR})
> +-
> +-
> + #set(DOXYDOCS ${CMAKE_SOURCE_DIR}/doc CACHE INTERNAL "Path to doxygen docs")
> + set(DOXYDOCS ${PROJECT_BINARY_DIR}/doc)
> + set(ENV{DOXYGEN_DOCDIR} ${DOXYDOCS})
> +--
> +2.19.1
> +
> --
> 2.19.1
>

