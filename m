Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f182.google.com (mail-ua0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id 5152077AB3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 09:33:50 +0000 (UTC)
Received: by mail-ua0-f182.google.com with SMTP id q29so18063200uaf.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 02:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0Bo4nCgl+cdeofm91tjeas/bGeAx0hsn4eCtxingL54=;
	b=bRjsNqsBm9jsGwTQJhm1aTowju2fAmxVaTddCeKhHh6rbCEjWMOAhCpFu3ec3UAX5t
	7lsbqeFh6b2UfVQUoukVSmOs7H0AxTvdOkDkI1BxaaEmPdYGojESirnAqwOxRKByxU4Q
	qKux5GFrJXL+ZaoamS9afoho/zeGrjdI5FwkfNW5unkl0FUxvjMuJka19Guj25PtwsVT
	baE2OUw4AH4LIaFqVvkEs8hI0yR9o7mA53Omy/Xu82LQWL6XSoP5Ux1tre99msu7CoZP
	RqCivOo9K2igJxLdaGQg+E31au9Vvr+57WyXkp5tTnaG+jaIlq8hgRrk/N9WgPVQ/UCh
	DeZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0Bo4nCgl+cdeofm91tjeas/bGeAx0hsn4eCtxingL54=;
	b=LEN1BsWxEz8bW1cEddbV/KGNDCBMNQGoiANVymCVE2v4wVG1MmZuxg8C1VPQcQTpuL
	1FEfgm822caoQ523ymZnj6Oiu/gXGuE64Vyr0/TXjXTSQ29Vr2VEsveizBMWARHxjcZ+
	rGx2a7zkVKo7nny3rMHqvm4tuTtbGxIh1dziqq8csUgypkgFSN0UldHinHcat932SXHR
	T6JTKOGQ55JZMuygJWqDvzCan6uaT1ipr5liYDcF4W+BRRp6EiF/n6VaHEhDdgOpqdnb
	0FMBOOkCSMlYQUtMHD2Thg0BT0IB4BfcjQaBWk8I0pQzJOthckK+FrQrK8U4YEN4DHK5
	wSFQ==
X-Gm-Message-State: AHPjjUiSb35eYb3nfRC/3ORkqlOaA8qn/88dV6bs9amKkqq3SLNWpPY0
	5n2EYoQHG2ndnZAdqrGyr5ixL4W5H5pW1mM+IV4=
X-Google-Smtp-Source: AOwi7QBTL115k2JG8gO4gmCuNlg7Ddbd7sFwxMSPTCHrcn0XIN4QpRhaAlC73iqC5m/D8ge0dd4JctdFiTimLWuypQQ=
X-Received: by 10.176.2.5 with SMTP id 5mr14809803uas.160.1505295231967; Wed,
	13 Sep 2017 02:33:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.67.130 with HTTP; Wed, 13 Sep 2017 02:33:51 -0700 (PDT)
In-Reply-To: <20170907035758.41689-2-raj.khem@gmail.com>
References: <20170907035758.41689-1-raj.khem@gmail.com>
	<20170907035758.41689-2-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 13 Sep 2017 11:33:51 +0200
Message-ID: <CA+chaQc4dtQCRYuXcOxME66WAPPFVC4gap4P54vFWHTU2+S28g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH V2 2/5] leveldb: Fix build with clang
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
X-List-Received-Date: Wed, 13 Sep 2017 09:33:51 -0000
Content-Type: text/plain; charset="UTF-8"

I'm keeping this one in master-next for a bit longer because in some builds
I've seen some issues which might be caused by enabled parallelism.

The log doesn't show much, the only error is:

Assembler messages:
Fatal error: can't create out-shared/db/db_bench.o: No such file or
directory
mkdir out-shared/db

So I've removed the parallelism part from this change and re-running the
builds.

On Thu, Sep 7, 2017 at 5:57 AM, Khem Raj <raj.khem@gmail.com> wrote:

> Add build parallelism, since we do not use oe_runmake
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  ...uild_detect_platform-Check-for-__SSE4_2__.patch | 36
> ++++++++++++++++++
>  .../0002-makefile-build-SHARED_MEMENVLIB.patch     | 43
> ++++++++++++++++++++++
>  meta-oe/recipes-extended/leveldb/leveldb_git.bb    |  6 ++-
>  3 files changed, 83 insertions(+), 2 deletions(-)
>  create mode 100644 meta-oe/recipes-extended/leveldb/leveldb/0001-build_
> detect_platform-Check-for-__SSE4_2__.patch
>  create mode 100644 meta-oe/recipes-extended/
> leveldb/leveldb/0002-makefile-build-SHARED_MEMENVLIB.patch
>
> diff --git a/meta-oe/recipes-extended/leveldb/leveldb/0001-build_
> detect_platform-Check-for-__SSE4_2__.patch b/meta-oe/recipes-extended/
> leveldb/leveldb/0001-build_detect_platform-Check-for-__SSE4_2__.patch
> new file mode 100644
> index 000000000..bbabf688d
> --- /dev/null
> +++ b/meta-oe/recipes-extended/leveldb/leveldb/0001-build_
> detect_platform-Check-for-__SSE4_2__.patch
> @@ -0,0 +1,36 @@
> +From 5fd0918df2bb30e8f3edb2ee895d178edbf26f40 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Mon, 4 Sep 2017 22:38:03 -0700
> +Subject: [PATCH 1/2] build_detect_platform: Check for __SSE4_2__
> +
> +just using -msse4.2 is not enough, especially with clang
> +where it may accept -msse4.2 even during cross compiling
> +for say arm, however the difference is that builtin defines
> +wont be defined.
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> +Upstream-Status: Pending
> +
> + build_detect_platform | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +Index: git/build_detect_platform
> +===================================================================
> +--- git.orig/build_detect_platform
> ++++ git/build_detect_platform
> +@@ -230,13 +230,12 @@ EOF
> +     rm -f $CXXOUTPUT 2>/dev/null
> +
> +     # Test if gcc SSE 4.2 is supported
> +-    $CXX $CXXFLAGS -x c++ - -o $CXXOUTPUT -msse4.2 2>/dev/null  <<EOF
> ++    $CXX $CXXFLAGS -Werror -x c++ - -o $CXXOUTPUT -msse4.2 -dD -E
> 2>/dev/null | fgrep __SSE4_2__ $CXXOUTPUT 2>/dev/null  <<EOF
> +       int main() {}
> + EOF
> +     if [ "$?" = 0 ]; then
> +         PLATFORM_SSEFLAGS="-msse4.2"
> +     fi
> +-
> +     rm -f $CXXOUTPUT 2>/dev/null
> + fi
> +
> diff --git a/meta-oe/recipes-extended/leveldb/leveldb/0002-makefile-build-SHARED_MEMENVLIB.patch
> b/meta-oe/recipes-extended/leveldb/leveldb/0002-makefile-
> build-SHARED_MEMENVLIB.patch
> new file mode 100644
> index 000000000..fc708b23a
> --- /dev/null
> +++ b/meta-oe/recipes-extended/leveldb/leveldb/0002-makefile-
> build-SHARED_MEMENVLIB.patch
> @@ -0,0 +1,43 @@
> +From 1ed8cec1fcf666904bb3ebd29fc85e235b72d122 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Mon, 4 Sep 2017 22:40:49 -0700
> +Subject: [PATCH 2/2] makefile: build SHARED_MEMENVLIB
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> +Upstream-Status: Pending
> +
> + Makefile | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index f7cc7d7..cb42278 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -126,12 +126,12 @@ SHARED_VERSION_MINOR = 20
> + SHARED_LIB1 = libleveldb.$(PLATFORM_SHARED_EXT)
> + SHARED_LIB2 = $(SHARED_LIB1).$(SHARED_VERSION_MAJOR)
> + SHARED_LIB3 = $(SHARED_LIB1).$(SHARED_VERSION_MAJOR).$(SHARED_
> VERSION_MINOR)
> +-SHARED_LIBS = $(SHARED_OUTDIR)/$(SHARED_LIB1) $(SHARED_OUTDIR)/$(SHARED_LIB2)
> $(SHARED_OUTDIR)/$(SHARED_LIB3)
> ++SHARED_LIBS = $(SHARED_OUTDIR)/$(SHARED_LIB1) $(SHARED_OUTDIR)/$(SHARED_LIB2)
> $(SHARED_OUTDIR)/$(SHARED_LIB3) $(SHARED_MEMENVLIB)
> + $(SHARED_OUTDIR)/$(SHARED_LIB1): $(SHARED_OUTDIR)/$(SHARED_LIB3)
> +       ln -fs $(SHARED_LIB3) $(SHARED_OUTDIR)/$(SHARED_LIB1)
> + $(SHARED_OUTDIR)/$(SHARED_LIB2): $(SHARED_OUTDIR)/$(SHARED_LIB3)
> +       ln -fs $(SHARED_LIB3) $(SHARED_OUTDIR)/$(SHARED_LIB2)
> +-SHARED_MEMENVLIB = $(SHARED_OUTDIR)/libmemenv.a
> ++SHARED_MEMENVLIB = $(SHARED_OUTDIR)/libmemenv.$(
> PLATFORM_SHARED_EXT).$(SHARED_VERSION_MAJOR).$(SHARED_VERSION_MINOR)
> + endif
> +
> + $(SHARED_OUTDIR)/$(SHARED_LIB3): $(SHARED_LIBOBJECTS)
> +@@ -294,7 +294,7 @@ endif
> +
> + $(SHARED_MEMENVLIB):$(SHARED_MEMENVOBJECTS)
> +       rm -f $@
> +-      $(AR) -rs $@ $(SHARED_MEMENVOBJECTS)
> ++      $(CXX) $(LDFLAGS) $(PLATFORM_SHARED_LDFLAGS)$(basename $(notdir
> $(SHARED_MEMENVLIB))) $(SHARED_MEMENVOBJECTS) -o $(SHARED_MEMENVLIB) $(LIBS)
> +
> + $(STATIC_OUTDIR)/db_bench:db/db_bench.cc $(STATIC_LIBOBJECTS)
> $(TESTUTIL)
> +       $(CXX) $(LDFLAGS) $(CXXFLAGS) db/db_bench.cc $(STATIC_LIBOBJECTS)
> $(TESTUTIL) -o $@ $(LIBS)
> +--
> +2.14.1
> +
> diff --git a/meta-oe/recipes-extended/leveldb/leveldb_git.bb
> b/meta-oe/recipes-extended/leveldb/leveldb_git.bb
> index d44aa14d2..93ae2fdea 100644
> --- a/meta-oe/recipes-extended/leveldb/leveldb_git.bb
> +++ b/meta-oe/recipes-extended/leveldb/leveldb_git.bb
> @@ -8,7 +8,9 @@ SRCREV = "a53934a3ae1244679f812d998a4f16f2c7f309a6"
>  PV = "1.20+git${SRCPV}"
>
>  SRC_URI = "git://github.com/google/${BPN}.git \
> -"
> +           file://0001-build_detect_platform-Check-for-__SSE4_2__.patch \
> +           file://0002-makefile-build-SHARED_MEMENVLIB.patch \
> +           "
>
>  S = "${WORKDIR}/git"
>
> @@ -17,7 +19,7 @@ inherit utils
>  do_compile() {
>      # do not use oe_runmake. oe_runmake pass to make compilation
> arguments and override
>      # leveldb makefile variable CFLAGS and broke leveldb build.
> -    CFLAGS="${CFLAGS}" make || die
> +    CFLAGS="${CFLAGS}" make ${PARALLEL_MAKE}|| die
>  }
>
>  do_install() {
> --
> 2.14.1
>
>

