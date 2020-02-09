Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id C0D6060CD2
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Feb 2020 16:56:45 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id w15so4232661qkf.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Feb 2020 08:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lz+ZxCBDlOv0ZFEQJ2npi3Bdw1mIsxdhnI56VZetaVY=;
	b=XXnq6pDlNtf7U+3mdCMsJcSutnX0ie9df5W21XjXLR1aGsa9P1eMad0ool1cdESLuF
	e4EslMgu1BpwXe1BR2ecFDwbGJp+HRGIUimcTvbu1Gbz+Q9eYMrPnFQZYX8Z+XYCXUHt
	rcBTDGSZ6I2GeZ7vBNHeQA9Z3lhMlaU+RQA37T9rgzfFQNrK7COPhlHyuyPCltXYB+AF
	7S7eOxPOzM+h6AZcnpHVUjyaJDPBzBi3yPoNIU01G1kTdJ6B/tAfyDh8TwAcNp/3Ce9X
	9FpMQJNpysHhkJ83vA4Rv2FfuSV43v1zfpwf7W6ibwbFiBhtRF0sTsXeaNlionlcNC2g
	Z/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lz+ZxCBDlOv0ZFEQJ2npi3Bdw1mIsxdhnI56VZetaVY=;
	b=udzT8WqHhTJdw1yPwk4fPiisKs2KpUl0IH+A9YUkzls6kn/dEei0jyuxAzpy0XLd8o
	79mxPSS5sTK7RuebL9lICA7ZJUb3LIXM0ZdBBG/2UCrtJQdkgiSMm4yNfsB3/Edl3k1D
	IXkrurD00oqinQpZx169i9LoV5huKtgtRLNoAhll3pC33uI6ydRyfps8yJzJVY4oXWrk
	7PqDBMU68U760ssgzOvcsn9Pzlf2//tIKdB8JNhueHm0rTtbWr4rMf3QC2jx6pYD38//
	ljK1NcFgw2BBGJO2cpZn1jwsZCzGzVhYEfZ8JCDTyMb/einJsdGN2SiVMzoFF687py3g
	pijg==
X-Gm-Message-State: APjAAAXt3jdHQeP7pVB2nG54WkkCJf2DzX0LIPvvg4/SjaXyt0gnrEa6
	U6uln8pWqNLvhFWpt4NkBINMQcSZq4qb1q4L6WE=
X-Google-Smtp-Source: APXvYqxQajN2Ui/jtcvBe9ZJvASzfxZ6jWYc7NTaPzvSeRS0F3Qb+Sg2t2UVNrYDjpN7qM6+VwD7VQZ644c/E6d+3NE=
X-Received: by 2002:ae9:ef50:: with SMTP id d77mr7158001qkg.71.1581267406317; 
	Sun, 09 Feb 2020 08:56:46 -0800 (PST)
MIME-Version: 1.0
References: <20200209034641.19378-1-okaya@kernel.org>
	<CAMKF1sorVApNQ69i3QOUiK6yF1gCvubzNvT=VMkjPcFtK+XC+w@mail.gmail.com>
In-Reply-To: <CAMKF1sorVApNQ69i3QOUiK6yF1gCvubzNvT=VMkjPcFtK+XC+w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 9 Feb 2020 08:56:20 -0800
Message-ID: <CAMKF1sphX1U9MWnhvOhiyKNWy8BJNJtxeJuf9WOYV4qWWrXY7A@mail.gmail.com>
To: Sinan Kaya <okaya@kernel.org>
Cc: Sinan Kaya <sinan.kaya@microsoft.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Changyi Li <Changyu.Li@microsoft.com>
Subject: Re: [meta-oe][PATCH] abseil-cpp: add recipe for git version
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
X-List-Received-Date: Sun, 09 Feb 2020 16:56:45 -0000
Content-Type: text/plain; charset="UTF-8"

It also fails to build on musl
https://errors.yoctoproject.org/Errors/Details/390527/

On Sat, Feb 8, 2020 at 11:53 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Sat, Feb 8, 2020 at 7:56 PM Sinan Kaya <okaya@kernel.org> wrote:
> >
> > The repository contains the Abseil C++ library code. Abseil is an
> > open-source collection of C++ code (compliant to C++11) designed to
> > augment the C++ standard library.
> >
> > https://github.com/abseil/abseil-cpp
> >
> > Signed-off-by: Changyi Li <Changyu.Li@microsoft.com>
> > Signed-off-by: Sinan Kaya <sinan.kaya@microsoft.com>
> > ---
> >  ...e-maes-option-from-cross-compilation.patch | 53 +++++++++++++++++++
> >  .../abseil-cpp/abseil-cpp_git.bb              | 27 ++++++++++
> >  2 files changed, 80 insertions(+)
> >  create mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Remove-maes-option-from-cross-compilation.patch
> >  create mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
> >
> > diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Remove-maes-option-from-cross-compilation.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Remove-maes-option-from-cross-compilation.patch
> > new file mode 100644
> > index 0000000000..4c41cd8902
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Remove-maes-option-from-cross-compilation.patch
> > @@ -0,0 +1,53 @@
> > +From 70926666f7c5c35add363e3bcade6eaabace7206 Mon Sep 17 00:00:00 2001
> > +From: Sinan Kaya <sinan.kaya@microsoft.com>
> > +Date: Mon, 3 Feb 2020 03:25:57 +0000
> > +Subject: [PATCH] Remove maes option from cross-compilation
> > +
> > +---
> > + absl/copts/GENERATED_AbseilCopts.cmake | 4 ----
> > + absl/copts/GENERATED_copts.bzl         | 4 ----
> > + absl/copts/copts.py                    | 4 ----
> > + 3 files changed, 12 deletions(-)
> > +
> > +diff --git a/absl/copts/GENERATED_AbseilCopts.cmake b/absl/copts/GENERATED_AbseilCopts.cmake
> > +index 01bd40b..af99694 100644
> > +--- a/absl/copts/GENERATED_AbseilCopts.cmake
> > ++++ b/absl/copts/GENERATED_AbseilCopts.cmake
> > +@@ -230,7 +230,3 @@ list(APPEND ABSL_RANDOM_HWAES_MSVC_X64_FLAGS
> > +     "/Ob2"
> > + )
> > +
> > +-list(APPEND ABSL_RANDOM_HWAES_X64_FLAGS
> > +-    "-maes"
> > +-    "-msse4.1"
> > +-)
> > +diff --git a/absl/copts/GENERATED_copts.bzl b/absl/copts/GENERATED_copts.bzl
> > +index 82f332f..9a548d1 100644
> > +--- a/absl/copts/GENERATED_copts.bzl
> > ++++ b/absl/copts/GENERATED_copts.bzl
> > +@@ -231,7 +231,3 @@ ABSL_RANDOM_HWAES_MSVC_X64_FLAGS = [
> > +     "/Ob2",
> > + ]
> > +
> > +-ABSL_RANDOM_HWAES_X64_FLAGS = [
> > +-    "-maes",
> > +-    "-msse4.1",
> > +-]
> > +diff --git a/absl/copts/copts.py b/absl/copts/copts.py
> > +index 068abce..c2f70fb 100644
> > +--- a/absl/copts/copts.py
> > ++++ b/absl/copts/copts.py
> > +@@ -203,10 +203,6 @@ COPT_VARS = {
> > +     # to improve performance of some random bit generators.
> > +     "ABSL_RANDOM_HWAES_ARM64_FLAGS": ["-march=armv8-a+crypto"],
> > +     "ABSL_RANDOM_HWAES_ARM32_FLAGS": ["-mfpu=neon"],
> > +-    "ABSL_RANDOM_HWAES_X64_FLAGS": [
> > +-        "-maes",
> > +-        "-msse4.1",
> > +-    ],
> > +     "ABSL_RANDOM_HWAES_MSVC_X64_FLAGS": [
> > +         "/O2",  # Maximize speed
> > +         "/Ob2",  # Aggressive inlining
> > +--
> > +2.23.0
> > +
> > diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
> > new file mode 100644
> > index 0000000000..c7077c129f
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
> > @@ -0,0 +1,27 @@
> > +SUMMARY = "Abseil is a cpp library like STL"
> > +DESCRIPTION = "It's got containers, algorithms, useful stuff!"
>
> maybe we can be more specific about it from
> https://github.com/abseil/abseil-cpp/blob/master/README.md
>
> > +HOMEPAGE = ""
>
> perhaps https://abseil.io/ instead of leaving it empty is better.
>
> > +SECTION = "libs"
> > +LICENSE = "Apache-2"
>
> The current value is not wrong but Apache-2.0 would be better to match SPDX
>
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=df52c6edb7adc22e533b2bacc3bd3915"
> > +
> > +SRCREV = "aa844899c937bde5d2b24f276b59997e5b668bde"
> > +BRANCH = "lts_2019_08_08"
> > +SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH}         \
> > +           file://0001-Remove-maes-option-from-cross-compilation.patch \
> > +          "
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +TARGET_CXXFLAGS += "${@bb.utils.contains('TARGET_ARCH', 'aarch64', ' -march=armv8-a+crypto', '', d)}"
> > +TARGET_CXXFLAGS += "${@bb.utils.contains('TARGET_ARCH', 'x64', ' -maes -msse4.1', '', d)}"
> > +
> > +CXXFLAGS_append_class-nativesdk = " -Wl,--no-as-needed -fPIC"
> > +CXXFLAGS_append_class-native = " -Wl,--no-as-needed -fPIC"
>
> perhaps use ASNEEDED_<override> = ""
>
> > +CXXFLAGS_append_class-target = " -fPIC"
> > +
> > +inherit cmake
> > +
> > +BBCLASSEXTEND = "native nativesdk"
> > +ALLOW_EMPTY_${PN} = "1"
>
> why do we need this ?

