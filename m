Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id B985E60C79
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Feb 2020 17:14:08 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id d18so4929552qtj.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Feb 2020 09:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GAkncZ1SYJESymoL6g+T53gNnMTqOzGY2aiRKq7Bvno=;
	b=tDIKO96zRGi24ilmqOdJhp89WmJxVb01ABzEKOKCvV+7DMWAj1O6+TGvj9pgrYYAUK
	Pc4qeG/8dtG10qowXsLE/n5J57aVH5MRZEfWFnOtP39Lc9S9QdBFFIKC+kBUXElES0Bs
	y2NEZLlCzTOy0/Mj0vmcH8H7az/dIuklPh2OmzvzliH0J13rCIIWQC5M22gKd5pf+uKm
	A/FhtrZAN3/mBa304Eeex6NhvFkmp6XM0mti0YsK/Z7V1dQh4Kx6IEtBtsQcoGjgAvJ+
	HTb2MWF77j7ThMrnVUzT22DGEMsPd699D+CTqnOxWBdQO1AKSXekMIgL9AQnCcoEinI+
	Z47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GAkncZ1SYJESymoL6g+T53gNnMTqOzGY2aiRKq7Bvno=;
	b=hYw366Jjklpt/4GWICvReJwLlM7Kn3boOMpaTjI4Xqmst2VsYLXOr1RbaN/pmQBBTX
	B5IY83mmSWS+FvvG47KeB2jIREe7PUIKwHiES/fNsAqpZc9G0J5PUQgeedzwUk2aZjp7
	19FRKaTbDya30ZcUebxgRVUIMsWTvhLmnqQQsT9vzY9JJLfKbiG3amEoK4r9O1GG6zVG
	S1ec38mywHTuSy/MhBBrcBXWpVIUweZWY5DtmDVuh3wMHz+GyHs1v6m/bL48dSg6IdeC
	7OkEzWJND2tDAwtul08h3E/dw/pJHaPRPZj/12MwzX/MkESbZnsCsgpcp99b9iWwkl4G
	w5pw==
X-Gm-Message-State: APjAAAWmhqSjfP/fuCaPwazCJ5+nRKDbLNt4/KzINZ1mx6dKd1nyHuRj
	4boyDF9AapPZz4b7ds0Cqzgk/7mBetbAvonoOnw=
X-Google-Smtp-Source: APXvYqzuUVP5ybkLiqZMVAx04b3aDOvF5L/B2YLNlqwDSp5alUKvuqOChjob9chNuqf70V3a5N0IQ7dpzV6YsKt8aqo=
X-Received: by 2002:ac8:1a30:: with SMTP id v45mr12375869qtj.80.1581614030946; 
	Thu, 13 Feb 2020 09:13:50 -0800 (PST)
MIME-Version: 1.0
References: <20200213091950.25001-1-asmithakarun@gmail.com>
In-Reply-To: <20200213091950.25001-1-asmithakarun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Feb 2020 09:13:25 -0800
Message-ID: <CAMKF1sqLP9LeN3yiNmRWSNZM==W4P3pTLQr7spU=YMy1D6O12g@mail.gmail.com>
To: Asmitha Karunanithi <asmithakarun@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: Re: [meta-oe][PATCH v2] libmimetic: Library to aid multi-part form data parsing
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
X-List-Received-Date: Thu, 13 Feb 2020 17:14:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 13, 2020 at 1:20 AM <asmithakarun@gmail.com> wrote:
>
> From: asmitha <asmithakarun@gmail.com>
>
> Mimetic library helps parsing the multi-part form data. This library
> can be used for scenarios that includes multi-part form data file uploads
> to the system.
>
> The patch file includes:
> i) The test directory is removed as there were errors (relocation errors)
> since the shared object files of libc++ and libc were not taken from the
> sysroot path but from the system's library path where the required
> version of the .so is not present.
>
> ii) The files 'mimetic/codec/other_codecs.h' and 'mimetic/contenttype.cxx'
> contains changes that resolves errors when compiling on target system
> aarch64-yoe-linux-musl.
>

Thanks for sending a v2, There is another error I see when using clang compiler

mimetic/os/mmfile.cxx:60:14: error: ordered comparison between pointer
and zero ('char *' and 'int')

Details here.
https://errors.yoctoproject.org/Errors/Details/390682/

Will you be able to work on it ?

> Signed-off-by: asmitha <asmithakarun@gmail.com>
> ---
>  ...ing-test-directory-from-the-Makefile.patch | 67 +++++++++++++++++++
>  .../libmimetic/libmimetic_0.9.8.bb            | 21 ++++++
>  2 files changed, 88 insertions(+)
>  create mode 100644 meta-oe/recipes-support/libmimetic/libmimetic/0001-libmimetic-Removing-test-directory-from-the-Makefile.patch
>  create mode 100644 meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb
>
> diff --git a/meta-oe/recipes-support/libmimetic/libmimetic/0001-libmimetic-Removing-test-directory-from-the-Makefile.patch b/meta-oe/recipes-support/libmimetic/libmimetic/0001-libmimetic-Removing-test-directory-from-the-Makefile.patch
> new file mode 100644
> index 000000000..50cd4d427
> --- /dev/null
> +++ b/meta-oe/recipes-support/libmimetic/libmimetic/0001-libmimetic-Removing-test-directory-from-the-Makefile.patch
> @@ -0,0 +1,67 @@
> +From 64fd25af5fea3a3c9c12122a2fd0fab3cd420f72 Mon Sep 17 00:00:00 2001
> +From: asmitk01-in <asmitk01@in.ibm.com>
> +Date: Wed, 5 Feb 2020 00:14:42 -0600
> +Subject: [PATCH] libmimetic: Removing test directory from the Makefile
> +
> +The test directory is removed as there were errors (relocation errors)
> +since the shared object files of libc++ and libc were not taken from the
> +sysroot path but from the system's library path where the required
> +version of the .so is not present.
> +
> +The files 'mimetic/codec/other_codecs.h' and 'mimetic/contenttype.cxx'
> +contains changes that resolves errors when compiling on target system
> +aarch64-yoe-linux-musl.
> +
> +Signed-off-by: asmitk01-in <asmitk01@in.ibm.com>
> +Change-Id: I1822b36ad4a1fa5e7b165d8cac3a6e96aca11c35
> +---
> + Makefile.am                  | 2 +-
> + mimetic/codec/other_codecs.h | 4 ++++
> + mimetic/contenttype.cxx      | 4 ++++
> + 3 files changed, 9 insertions(+), 1 deletion(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 634bd4c..c7cbae7 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -1,6 +1,6 @@
> + MAINTAINERCLEANFILES = Makefile Makefile.in config.cache
> + EXTRA_DIST=LICENSE m4
> +-SUBDIRS = mimetic doc examples test win32
> ++SUBDIRS = mimetic doc examples win32
> + INCLUDES=-I$(top_srcdir)
> + ACLOCAL_AMFLAGS=-I m4
> +
> +diff --git a/mimetic/codec/other_codecs.h b/mimetic/codec/other_codecs.h
> +index c4ccf3f..0fc88fd 100644
> +--- a/mimetic/codec/other_codecs.h
> ++++ b/mimetic/codec/other_codecs.h
> +@@ -8,6 +8,10 @@
> + #define _MIMETIC_CODEC_OTHER_CODECS_H_
> + #include <mimetic/codec/codec_base.h>
> +
> ++#ifndef __GLIBC__
> ++    typedef unsigned int uint;
> ++#endif
> ++
> + namespace mimetic
> + {
> +
> +diff --git a/mimetic/contenttype.cxx b/mimetic/contenttype.cxx
> +index 522082d..0577d44 100644
> +--- a/mimetic/contenttype.cxx
> ++++ b/mimetic/contenttype.cxx
> +@@ -13,6 +13,10 @@
> + #include <mimetic/tokenizer.h>
> + #include <mimetic/utils.h>
> +
> ++#ifndef __GLIBC__
> ++    typedef unsigned int uint;
> ++#endif
> ++
> + namespace mimetic
> + {
> + using namespace std;
> +--
> +2.9.3
> +
> diff --git a/meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb b/meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb
> new file mode 100644
> index 000000000..fd65db2d3
> --- /dev/null
> +++ b/meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb
> @@ -0,0 +1,21 @@
> +# Released under the MIT license.
> +
> +SUMMARY = "Mimetic Library for multi-part parsing"
> +DESCRIPTION = "Email library (MIME) written in C++ designed to be easy to use and integrate but yet fast and efficient."
> +AUTHOR = "Stefano Barbato <stefano@codesink.org>"
> +HOMEPAGE = "http://www.codesink.org/mimetic_mime_library.html"
> +BUGTRACKER = "https://github.com/LadislavSopko/mimetic/issues"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=b49da7df0ca479ef01ff7f2d799eabee"
> +
> +SRCREV = "50486af99b4f9b35522d7b3de40b6ce107505279"
> +SRC_URI += "git://github.com/LadislavSopko/mimetic/ \
> +            file://0001-libmimetic-Removing-test-directory-from-the-Makefile.patch \
> +           "
> +
> +S = "${WORKDIR}/git"
> +
> +CXXFLAGS += "-Wno-narrowing"
> +
> +inherit autotools
> --
> 2.23.0
>

