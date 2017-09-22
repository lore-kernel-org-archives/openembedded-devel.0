Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 79C5F7826D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Sep 2017 01:06:12 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id u18so4324408pgo.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Sep 2017 18:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=H/ShteBlq6VDTIv15C00WaFEH9LLtd8x/fuRjYncXpQ=;
	b=MUhVL9tc8Vyu4G3jv2ZYZysFADQsMY64Bdm0bqcQDgAIh05IgboP/hJKh5X4LT4rqX
	kLD6q6PMFjHc69xT2ChJvhAdBswfJYY/3IfyiR76hsYlUVfjsuc/oKslkZL4ppkaJSyD
	vzbJPgcL2QZpaZW8Fa/pf8rjiBcrcWrmCVDK+lgCxqvygeksy/0faC8EWy2kmrGKBDeg
	LIdHSYvzyA6UAC7zC1SYD43GauZXBP1x7NT3oSXGI0c4xvIBpWnoT+2GBJJTC9DArxVm
	xC1P8iASphUxt9xknYxy6RSdn1vVIDkRSsGiyqn/wIFyAsFU+9dGDkUsn8ZAxz8Pdbjw
	6qLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=H/ShteBlq6VDTIv15C00WaFEH9LLtd8x/fuRjYncXpQ=;
	b=VwwAp7zKn57VO5+0mXgy/hTdpremO+1c4E4ohtNrp3uqWz9UuJPoK61e4HUpxgveMc
	M4AfHIhEfMF8OU7DrTwAEuEt+xeNBlFdNIYzgDi5+cV5H6wofgzICQsDYTsd5hD3Nai8
	AvHSwQwqmGX1noz9ek+VUNz6pg2gVrrZ0Ffbo5RX+vnydknFKdPGrisFZWhIB6tHs6Yu
	aYEvtzs870JuF7zti75jUwrkl2Y4UO0ydPlVo7IJZMqcr4h5yFGMDzLm/7qw0JAlFjrz
	aKXiQcJU4KS0uKXatYoWAcFcqXP6EjSvLLLiltw8F9FJ2d/Yl1fOuHq8t07C4y9DLy19
	/EVg==
X-Gm-Message-State: AHPjjUjj5p3mSWjdpnPEgRyZvmhpLMGmh4RL/OJN/HMmdEaJG8Rdq4AU
	zG3Y4gj4+BwV5jf4txpy6FG5yxn5MCBJASfBtuo=
X-Google-Smtp-Source: AOwi7QDOklPuWpYNto1zMgZi2fBh3xMs0dJmL1MdcZqlhn59yEzAoc3wdWY9kBqdox4IOoX1566S25JclIZ9GyMmiGY=
X-Received: by 10.84.177.129 with SMTP id x1mr7425101plb.161.1506042373487;
	Thu, 21 Sep 2017 18:06:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.149.73 with HTTP; Thu, 21 Sep 2017 18:05:42 -0700 (PDT)
In-Reply-To: <CA+chaQc4dtQCRYuXcOxME66WAPPFVC4gap4P54vFWHTU2+S28g@mail.gmail.com>
References: <20170907035758.41689-1-raj.khem@gmail.com>
	<20170907035758.41689-2-raj.khem@gmail.com>
	<CA+chaQc4dtQCRYuXcOxME66WAPPFVC4gap4P54vFWHTU2+S28g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Sep 2017 18:05:42 -0700
Message-ID: <CAMKF1sorLe7z3W1NV+CheGT20dCR=MXK4py_xz6w5q_xhQKuJw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
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
X-List-Received-Date: Fri, 22 Sep 2017 01:06:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 13, 2017 at 2:33 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> I'm keeping this one in master-next for a bit longer because in some builds
> I've seen some issues which might be caused by enabled parallelism.
>
> The log doesn't show much, the only error is:
>
> Assembler messages:
> Fatal error: can't create out-shared/db/db_bench.o: No such file or
> directory
> mkdir out-shared/db
>
> So I've removed the parallelism part from this change and re-running the
> builds.

I have reproduced this issue. I have a potential fix. I will send a v3 tonight

>
> On Thu, Sep 7, 2017 at 5:57 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Add build parallelism, since we do not use oe_runmake
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>>  ...uild_detect_platform-Check-for-__SSE4_2__.patch | 36
>> ++++++++++++++++++
>>  .../0002-makefile-build-SHARED_MEMENVLIB.patch     | 43
>> ++++++++++++++++++++++
>>  meta-oe/recipes-extended/leveldb/leveldb_git.bb    |  6 ++-
>>  3 files changed, 83 insertions(+), 2 deletions(-)
>>  create mode 100644
>> meta-oe/recipes-extended/leveldb/leveldb/0001-build_detect_platform-Check-for-__SSE4_2__.patch
>>  create mode 100644
>> meta-oe/recipes-extended/leveldb/leveldb/0002-makefile-build-SHARED_MEMENVLIB.patch
>>
>> diff --git
>> a/meta-oe/recipes-extended/leveldb/leveldb/0001-build_detect_platform-Check-for-__SSE4_2__.patch
>> b/meta-oe/recipes-extended/leveldb/leveldb/0001-build_detect_platform-Check-for-__SSE4_2__.patch
>> new file mode 100644
>> index 000000000..bbabf688d
>> --- /dev/null
>> +++
>> b/meta-oe/recipes-extended/leveldb/leveldb/0001-build_detect_platform-Check-for-__SSE4_2__.patch
>> @@ -0,0 +1,36 @@
>> +From 5fd0918df2bb30e8f3edb2ee895d178edbf26f40 Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Mon, 4 Sep 2017 22:38:03 -0700
>> +Subject: [PATCH 1/2] build_detect_platform: Check for __SSE4_2__
>> +
>> +just using -msse4.2 is not enough, especially with clang
>> +where it may accept -msse4.2 even during cross compiling
>> +for say arm, however the difference is that builtin defines
>> +wont be defined.
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> +Upstream-Status: Pending
>> +
>> + build_detect_platform | 4 ++--
>> + 1 file changed, 2 insertions(+), 2 deletions(-)
>> +
>> +Index: git/build_detect_platform
>> +===================================================================
>> +--- git.orig/build_detect_platform
>> ++++ git/build_detect_platform
>> +@@ -230,13 +230,12 @@ EOF
>> +     rm -f $CXXOUTPUT 2>/dev/null
>> +
>> +     # Test if gcc SSE 4.2 is supported
>> +-    $CXX $CXXFLAGS -x c++ - -o $CXXOUTPUT -msse4.2 2>/dev/null  <<EOF
>> ++    $CXX $CXXFLAGS -Werror -x c++ - -o $CXXOUTPUT -msse4.2 -dD -E
>> 2>/dev/null | fgrep __SSE4_2__ $CXXOUTPUT 2>/dev/null  <<EOF
>> +       int main() {}
>> + EOF
>> +     if [ "$?" = 0 ]; then
>> +         PLATFORM_SSEFLAGS="-msse4.2"
>> +     fi
>> +-
>> +     rm -f $CXXOUTPUT 2>/dev/null
>> + fi
>> +
>> diff --git
>> a/meta-oe/recipes-extended/leveldb/leveldb/0002-makefile-build-SHARED_MEMENVLIB.patch
>> b/meta-oe/recipes-extended/leveldb/leveldb/0002-makefile-build-SHARED_MEMENVLIB.patch
>> new file mode 100644
>> index 000000000..fc708b23a
>> --- /dev/null
>> +++
>> b/meta-oe/recipes-extended/leveldb/leveldb/0002-makefile-build-SHARED_MEMENVLIB.patch
>> @@ -0,0 +1,43 @@
>> +From 1ed8cec1fcf666904bb3ebd29fc85e235b72d122 Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Mon, 4 Sep 2017 22:40:49 -0700
>> +Subject: [PATCH 2/2] makefile: build SHARED_MEMENVLIB
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> +Upstream-Status: Pending
>> +
>> + Makefile | 6 +++---
>> + 1 file changed, 3 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/Makefile b/Makefile
>> +index f7cc7d7..cb42278 100644
>> +--- a/Makefile
>> ++++ b/Makefile
>> +@@ -126,12 +126,12 @@ SHARED_VERSION_MINOR = 20
>> + SHARED_LIB1 = libleveldb.$(PLATFORM_SHARED_EXT)
>> + SHARED_LIB2 = $(SHARED_LIB1).$(SHARED_VERSION_MAJOR)
>> + SHARED_LIB3 =
>> $(SHARED_LIB1).$(SHARED_VERSION_MAJOR).$(SHARED_VERSION_MINOR)
>> +-SHARED_LIBS = $(SHARED_OUTDIR)/$(SHARED_LIB1)
>> $(SHARED_OUTDIR)/$(SHARED_LIB2) $(SHARED_OUTDIR)/$(SHARED_LIB3)
>> ++SHARED_LIBS = $(SHARED_OUTDIR)/$(SHARED_LIB1)
>> $(SHARED_OUTDIR)/$(SHARED_LIB2) $(SHARED_OUTDIR)/$(SHARED_LIB3)
>> $(SHARED_MEMENVLIB)
>> + $(SHARED_OUTDIR)/$(SHARED_LIB1): $(SHARED_OUTDIR)/$(SHARED_LIB3)
>> +       ln -fs $(SHARED_LIB3) $(SHARED_OUTDIR)/$(SHARED_LIB1)
>> + $(SHARED_OUTDIR)/$(SHARED_LIB2): $(SHARED_OUTDIR)/$(SHARED_LIB3)
>> +       ln -fs $(SHARED_LIB3) $(SHARED_OUTDIR)/$(SHARED_LIB2)
>> +-SHARED_MEMENVLIB = $(SHARED_OUTDIR)/libmemenv.a
>> ++SHARED_MEMENVLIB =
>> $(SHARED_OUTDIR)/libmemenv.$(PLATFORM_SHARED_EXT).$(SHARED_VERSION_MAJOR).$(SHARED_VERSION_MINOR)
>> + endif
>> +
>> + $(SHARED_OUTDIR)/$(SHARED_LIB3): $(SHARED_LIBOBJECTS)
>> +@@ -294,7 +294,7 @@ endif
>> +
>> + $(SHARED_MEMENVLIB):$(SHARED_MEMENVOBJECTS)
>> +       rm -f $@
>> +-      $(AR) -rs $@ $(SHARED_MEMENVOBJECTS)
>> ++      $(CXX) $(LDFLAGS) $(PLATFORM_SHARED_LDFLAGS)$(basename $(notdir
>> $(SHARED_MEMENVLIB))) $(SHARED_MEMENVOBJECTS) -o $(SHARED_MEMENVLIB) $(LIBS)
>> +
>> + $(STATIC_OUTDIR)/db_bench:db/db_bench.cc $(STATIC_LIBOBJECTS)
>> $(TESTUTIL)
>> +       $(CXX) $(LDFLAGS) $(CXXFLAGS) db/db_bench.cc $(STATIC_LIBOBJECTS)
>> $(TESTUTIL) -o $@ $(LIBS)
>> +--
>> +2.14.1
>> +
>> diff --git a/meta-oe/recipes-extended/leveldb/leveldb_git.bb
>> b/meta-oe/recipes-extended/leveldb/leveldb_git.bb
>> index d44aa14d2..93ae2fdea 100644
>> --- a/meta-oe/recipes-extended/leveldb/leveldb_git.bb
>> +++ b/meta-oe/recipes-extended/leveldb/leveldb_git.bb
>> @@ -8,7 +8,9 @@ SRCREV = "a53934a3ae1244679f812d998a4f16f2c7f309a6"
>>  PV = "1.20+git${SRCPV}"
>>
>>  SRC_URI = "git://github.com/google/${BPN}.git \
>> -"
>> +           file://0001-build_detect_platform-Check-for-__SSE4_2__.patch \
>> +           file://0002-makefile-build-SHARED_MEMENVLIB.patch \
>> +           "
>>
>>  S = "${WORKDIR}/git"
>>
>> @@ -17,7 +19,7 @@ inherit utils
>>  do_compile() {
>>      # do not use oe_runmake. oe_runmake pass to make compilation
>> arguments and override
>>      # leveldb makefile variable CFLAGS and broke leveldb build.
>> -    CFLAGS="${CFLAGS}" make || die
>> +    CFLAGS="${CFLAGS}" make ${PARALLEL_MAKE}|| die
>>  }
>>
>>  do_install() {
>> --
>> 2.14.1
>>
>

