Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
	[209.85.160.180])
	by mail.openembedded.org (Postfix) with ESMTP id DCC8E7F345
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Aug 2019 17:35:23 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id t12so14291727qtp.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Aug 2019 10:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5hPpSSQ6j5+93HgbTabmDkwfEqBNYSSpSoxQMR6Q6fg=;
	b=suo6ycVWFwNZ4Mhcuvhrwx/h+SDg2KjWDwDjZ6dJJyZb0v8h8Pt87+ov7vZ0dt0EHb
	sO272pZmSgWoJqWd7sXGwOjcR/o2inPn5Jj3xrHdlL1g7KCkt7x4GmEehsvkEMy5cRap
	PoYvxJkxqhpcyQHh/+x3IPSfeOredA7e7HE0q4HYjGElVDU2zF+AgrHL+/4hPui6LHeM
	qHZjzhGV11/xJXUUp3vaXzK/ofmWydztAGtMuCmZ46/ZMcAuaD+W+a4K4f78r2CqLkah
	5mXEdHtsk5Mi5K+/JgA7M4vF+bcno+DXjyRv0dJfSVC9FbAwERs9BvNrEtKtgfalSVWi
	TM5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5hPpSSQ6j5+93HgbTabmDkwfEqBNYSSpSoxQMR6Q6fg=;
	b=o2Ky953vGdttcmJ0l7303mWYg13gfE9/YjUe1iyllNa8RQld7nAvxuKnpizG3DKsn1
	oUZ+Ar3+zYYG/vP8S1tJ4RwOc/gvbMsCrpfh36JwbWJyDhi6I/aFEw3vsrfTVNXy8yv9
	NdDbL5kriq62ETTZMvNUwI+4jd24eN6uIdndm8yjauoKXaOmB7btPsXtgwsv29fXY//h
	KzdI75YJfgtHlFfQnxKkCvG8HuNaqNRRMbjoSsw+C9rPCldIDRW5u3L9a2aJGCRG8Eee
	r7y2QY5TY7E+EMO8aI6lq6YGbHulfiFPyvnATBVa2PhLtp0eHuqOfVom1WnvAmqPc411
	HChA==
X-Gm-Message-State: APjAAAUFpYD+ha81RtU71p/qB0jMfCMrLEH6xWpDSu4kEsQ2QM/neWAz
	nMr1IJeywFLz2i4T43rYWo7P7TUZMJFykKsjJTGeTDhl
X-Google-Smtp-Source: APXvYqzSCK0WmuDO2ZqlHrFrP3WPfEISeUsBXLWu6IhtNDouZ20Fkm34zHW2DBblDW07RPWq5jDhKkwM1u/0P3yjLxo=
X-Received: by 2002:ac8:d4c:: with SMTP id r12mr10279837qti.88.1566668124472; 
	Sat, 24 Aug 2019 10:35:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190823105345.12430-1-eero.aaltonen@vaisala.com>
In-Reply-To: <20190823105345.12430-1-eero.aaltonen@vaisala.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 24 Aug 2019 10:34:58 -0700
Message-ID: <CAMKF1soopEW2HsmTGjr-iOfyVNENSbNJLCgqSaFshMj-Jba=hw@mail.gmail.com>
To: Aaltonen Eero <eero.aaltonen@vaisala.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] Recipe for docopt.cpp option parsing library
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
X-List-Received-Date: Sat, 24 Aug 2019 17:35:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 23, 2019 at 3:55 AM Aaltonen Eero <eero.aaltonen@vaisala.com> wrote:
>
> Upstream is at
> https://github.com/docopt/docopt.cpp/
>
> Installs with a small build modification to pass QA checks.
>
> Signed-off-by: Eero Aaltonen <eero.aaltonen@vaisala.com>
> ---
>  file                                          |  0
>  ...01-Set-library-VERSION-and-SOVERSION.patch | 31 +++++++++++++++++++
>  .../docopt.cpp/docopt.cpp_git.bb              | 29 +++++++++++++++++
>  3 files changed, 60 insertions(+)
>  create mode 100644 file
>  create mode 100644 meta-oe/recipes-extended/docopt.cpp/docopt.cpp/0001-Set-library-VERSION-and-SOVERSION.patch
>  create mode 100644 meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb
>
> diff --git a/file b/file
> new file mode 100644
> index 000000000..e69de29bb
> diff --git a/meta-oe/recipes-extended/docopt.cpp/docopt.cpp/0001-Set-library-VERSION-and-SOVERSION.patch b/meta-oe/recipes-extended/docopt.cpp/docopt.cpp/0001-Set-library-VERSION-and-SOVERSION.patch
> new file mode 100644
> index 000000000..d4c776569
> --- /dev/null
> +++ b/meta-oe/recipes-extended/docopt.cpp/docopt.cpp/0001-Set-library-VERSION-and-SOVERSION.patch
> @@ -0,0 +1,31 @@
> +From a47ca75702318ff43446c70120f7aacde4ccee1b Mon Sep 17 00:00:00 2001
> +From: Eero Aaltonen <eero.aaltonen@vaisala.com>
> +Date: Thu, 20 Jun 2019 16:21:20 +0300
> +Subject: [PATCH] Set library VERSION and SOVERSION
> +
> +With soversion and version specified, `install` target will install the
> +library with the specified version and also create the proper symlink.
> +
> +Upstream-Status: Submitted [https://github.com/docopt/docopt.cpp/pull/112]
> +but unlikely to be merged soon as it is a duplicate of
> +[https://github.com/docopt/docopt.cpp/pull/112] which has been **Open**
> +since 2016-12-08.
> +---
> + CMakeLists.txt | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 23da468..feff32e 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -50,6 +50,10 @@ else()
> +     set_target_properties(docopt_o PROPERTIES POSITION_INDEPENDENT_CODE TRUE)
> +
> +     add_library(docopt SHARED $<TARGET_OBJECTS:docopt_o>)
> ++      set_target_properties(docopt PROPERTIES
> ++              VERSION ${PROJECT_VERSION}
> ++              SOVERSION ${PROJECT_VERSION_MAJOR}
> ++              )
> +     add_library(docopt_s STATIC $<TARGET_OBJECTS:docopt_o>)
> + endif()
> +
> diff --git a/meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb b/meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb
> new file mode 100644
> index 000000000..95c60617c
> --- /dev/null
> +++ b/meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb
> @@ -0,0 +1,29 @@
> +SUMMARY = "C++11 port of docopt command-line interface description language and parser"
> +
> +DESCRIPTION = "docopt is library that lets you define a command line interface with the \
> +utility argument syntax that has been used by command line utilities for \
> +decades (formalized in POSIX.1-2017). From the description, docopt \
> +automatically generates a parser for the command line arguments."
> +
> +HOMEPAGE = "https://github.com/docopt/docopt.cpp"
> +
> +LICENSE = "MIT | BSL-1.0"
> +LIC_FILES_CHKSUM = "\
> +    file://LICENSE-Boost-1.0;md5=e4224ccaecb14d942c71d31bef20d78c \
> +    file://LICENSE-MIT;md5=4b242fd9ef20207e18286d73da8a6677 \
> +"
> +
> +DEPENDS = "boost"
> +SRCREV = "3dd23e3280f213bacefdf5fcb04857bf52e90917"
> +PV = "0.6.2+git${SRCPV}"
> +
> +SRC_URI = "\
> +    git://git@github.com/docopt/docopt.cpp.git;protocol=ssh \
> +    file://0001-Set-library-VERSION-and-SOVERSION.patch \
> +"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake gitpkgv

lets just use SRCPV

> +
> +PKGV = "0.6.2+git${GITPKGV}"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

