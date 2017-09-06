Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f46.google.com (mail-vk0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id 064BF7760A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Sep 2017 08:10:39 +0000 (UTC)
Received: by mail-vk0-f46.google.com with SMTP id t10so10739716vke.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Sep 2017 01:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3WgoPhPjW/PI51w5jRg+9mxjoQge+7xswjnjGD1khtQ=;
	b=aRLmeoqGouZH617NS8f7m+iGgboTPDaAtACD5cmGECgWxsMiKXjAG5d0n+7aUsfxri
	iGytPUS8jly6jSBtrpBz5zGLihKicTupCZ6IeUtqKlbgczJDvbwo8d/yLw+9+rJUPX9z
	1DTT4g+3Q1CpgwfqUWQTb1Pj4uIq2PUuXDqhX1JBVivIRsVeifXRTH8r8xa91c11LZvw
	P8b7POzlfl+diWs7+y5fgP0xxvVqukFMPRCaFJLBEbaBPJNIGx+2bxTGWs16o2ulxOn/
	6SI3F5sNojnwlfEM74fzCk20hbQrObkMtIi8xvbQkZ/51tp2VOll42q18YJHTb5zdFg7
	yulA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3WgoPhPjW/PI51w5jRg+9mxjoQge+7xswjnjGD1khtQ=;
	b=WAp/nQGLncEjXP2hZCySrZUk0aGh2qIPW8n/quCEwdVCASbejYdETayXNAaRS1ybM4
	nlzi4VeyE3fHSzGIG3IRxR0JAaWV6Eo7UfYygwy/yHToRSoSnspm73JYOnc+DpGVhq3C
	WIdT1UCaWBsuwF0eEPe8XwugaIRoGYPr0w9AkrMogKQNOZ/+Ni1jVs2zRq+5eo/ByFIJ
	cEykLe9vU7UWi3IDC/A2UCA7zY9/GHrFOGg98sXVx7JxXD/+b/93qWidhXyToAiO1gNg
	RsIPYKGjZJobSyfu4gn3TuBZccKEk8/0mmRub3TVV3XgCSd8T1LJ2hOAI7lKHfs4HrtO
	7lvw==
X-Gm-Message-State: AHPjjUin/7rDS8kge8aXsDmbv78NeL6+g27+1v+Rbu/DON2+AnXrlap8
	7kXEABDWKk17P0xqKmwSIwAxvmhyuA==
X-Google-Smtp-Source: ADKCNb54gofvbst2f71ghQQ/s0Y+eIpkM81qZxXHb3sxLiijlFPwW960gVU/UZTwGCi/zEu/eeRCXmUF1HihB76NFy8=
X-Received: by 10.31.157.71 with SMTP id g68mr1090111vke.130.1504685441013;
	Wed, 06 Sep 2017 01:10:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.15.69 with HTTP; Wed, 6 Sep 2017 01:10:40 -0700 (PDT)
In-Reply-To: <20170905054618.42430-1-raj.khem@gmail.com>
References: <20170905054618.42430-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 6 Sep 2017 10:10:40 +0200
Message-ID: <CA+chaQente3F7hKPWWzTF7H4MnzQcK6-CPEEoiw8SyFFc1-WAQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] leveldb: Fix build with clang
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
X-List-Received-Date: Wed, 06 Sep 2017 08:10:40 -0000
Content-Type: text/plain; charset="UTF-8"

Fails to build:
http://errors.yoctoproject.org/Errors/Details/155161/

On Tue, Sep 5, 2017 at 7:46 AM, Khem Raj <raj.khem@gmail.com> wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...uild_detect_platform-Check-for-__SSE4_2__.patch | 40
> ++++++++++++++++++++
>  .../0002-makefile-build-SHARED_MEMENVLIB.patch     | 43
> ++++++++++++++++++++++
>  meta-oe/recipes-extended/leveldb/leveldb_git.bb    |  4 +-
>  3 files changed, 86 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-extended/leveldb/leveldb/0001-build_
> detect_platform-Check-for-__SSE4_2__.patch
>  create mode 100644 meta-oe/recipes-extended/
> leveldb/leveldb/0002-makefile-build-SHARED_MEMENVLIB.patch
>
> diff --git a/meta-oe/recipes-extended/leveldb/leveldb/0001-build_
> detect_platform-Check-for-__SSE4_2__.patch b/meta-oe/recipes-extended/
> leveldb/leveldb/0001-build_detect_platform-Check-for-__SSE4_2__.patch
> new file mode 100644
> index 000000000..a44ff883b
> --- /dev/null
> +++ b/meta-oe/recipes-extended/leveldb/leveldb/0001-build_
> detect_platform-Check-for-__SSE4_2__.patch
> @@ -0,0 +1,40 @@
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
> +diff --git a/build_detect_platform b/build_detect_platform
> +index d2a20ce..a06d49e 100755
> +--- a/build_detect_platform
> ++++ b/build_detect_platform
> +@@ -224,13 +224,13 @@ EOF
> +     rm -f $CXXOUTPUT 2>/dev/null
> +
> +     # Test if gcc SSE 4.2 is supported
> +-    $CXX $CXXFLAGS -x c++ - -o $CXXOUTPUT -msse4.2 2>/dev/null  <<EOF
> ++    $CXX $CXXFLAGS -x c++ -Werror - -o $CXXOUTPUT -msse4.2 -dD -E
> 2>/dev/null  <<EOF
> +       int main() {}
> + EOF
> ++    eval fgrep __SSE4_2__ $CXXOUTPUT 2>/dev/null
> +     if [ "$?" = 0 ]; then
> +         PLATFORM_SSEFLAGS="-msse4.2"
> +     fi
> +-
> +     rm -f $CXXOUTPUT 2>/dev/null
> + fi
> +
> +--
> +2.14.1
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
> index d44aa14d2..dfe4b459a 100644
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
> --
> 2.14.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

