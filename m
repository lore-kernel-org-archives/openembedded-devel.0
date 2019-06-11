Return-Path: <asselsm@gmail.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9D3ED7E6A1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2019 19:48:46 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id r10so13114727otd.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2019 12:48:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
	:from:date:message-id:subject:to:cc;
	bh=3ZsajDi0TNWsAgSC/kqTA3KHG7j0KW45UmDmvnNneE4=;
	b=KI7+phrcoL2tLyvHYHrzQbzNMTPHGahqJCbgCSPZGsAd5tsqrnQ1ib+seltOzPbanx
	+ln7bek/IWf+23b7ku5a1+kFv+9h4WPXk5I7+Ro2gTNNHBjfm2O41R299ynBjztzDtA+
	RzkqLS1CdjM/7VjO1chlUtXrIKny7KMu0ebMHAyLiEmrUHyEW9tfNEluafRhEEKf2hD0
	kjSCqxt5c3KLJeoaAyGDS9TexkRdbZOVc8k+e0lInFObl8x9z0QjTH5qXlSn0Tlejdde
	76L+Mx4JlzwjaOibTEjOr3Xn5kuwyVVRqnYFCtAtI3UubBghZIZNa8Uwx85I+jnJNGmG
	Q/cw==
X-Gm-Message-State: APjAAAXglnGJKYmw4XLBWNufg29IAnp0dR2A5YPCqokieoPm81PKUBzU
	NwiXgY4ZQIdj7/eawgA4W6qFcxTZEFQoUtSzMxY=
X-Google-Smtp-Source: APXvYqzilK94+71F7rs+uqAANgZUTE27k5Ldx3BhZ52XfzYx27cQjIFaTaAP6lj41fav1PxV7pGePPFgZ3b7qJRzjl0=
X-Received: by 2002:a9d:3f62:: with SMTP id m89mr37124700otc.128.1560282526421;
	Tue, 11 Jun 2019 12:48:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190611153239.29835-1-pascal.bach@siemens.com>
In-Reply-To: <20190611153239.29835-1-pascal.bach@siemens.com>
Reply-To: mark.asselstine@windriver.com
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Tue, 11 Jun 2019 15:48:35 -0400
Message-ID: <CAPuovEKTDjuoCj4e1-XQuK4XQTcQwNTmJPBy29PApdse9yBdOw@mail.gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] rocksdb: 5.18.3 -> 6.0.2
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
X-List-Received-Date: Tue, 11 Jun 2019 19:48:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 11, 2019 at 11:32 AM Pascal Bach <pascal.bach@siemens.com> wrote:
>
> Also add support for snappy and gflags as these are enabled by default
> and recipes are available in meta-oe. They can still be disabled via
> PACKAGECONFIG.
>
> zstd is also added as an PACKAGECONFIG but currently the zstd recipe is not in
> meta-oe so it stays disabled for the moment.
>
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---

Please consider adding the fix for gcc9 along with this
https://github.com/facebook/rocksdb/pull/5426/commits/e03a10b0c5ba55b081f49e607c49480d799b5b37
(there is a space-tab issue in the change but otherwise it merges
cleanly to your uprev.)

The gcc9 issue exists in 5.18.3 and 6.0.2 but since you are in here we
might as well ensure that builds of master are working.

Regards,
Mark Asselstine



>  ...01-CMake-has-stock-FindZLIB-in-upper-case.patch | 29 ++++++++++++++++++++++
>  meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb         | 11 +++++---
>  2 files changed, 36 insertions(+), 4 deletions(-)
>  create mode 100644 meta-oe/recipes-dbs/rocksdb/files/0001-CMake-has-stock-FindZLIB-in-upper-case.patch
>
> diff --git a/meta-oe/recipes-dbs/rocksdb/files/0001-CMake-has-stock-FindZLIB-in-upper-case.patch b/meta-oe/recipes-dbs/rocksdb/files/0001-CMake-has-stock-FindZLIB-in-upper-case.patch
> new file mode 100644
> index 000000000..9682f8ad4
> --- /dev/null
> +++ b/meta-oe/recipes-dbs/rocksdb/files/0001-CMake-has-stock-FindZLIB-in-upper-case.patch
> @@ -0,0 +1,29 @@
> +From 38146a5d803a1fb9b10f011aa857872b6f20cd02 Mon Sep 17 00:00:00 2001
> +From: Tongliang Liao <xkszltl@gmail.com>
> +Date: Mon, 29 Apr 2019 03:51:51 -0700
> +Subject: [PATCH] CMake has stock FindZLIB in upper case. More details in
> + https://cmake.org/cmake/help/v3.14/module/FindZLIB.html
> +
> +
> +Upstream-Status: Backport https://github.com/facebook/rocksdb/pull/5261
> +
> +---
> + CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 40cdd26bb..355686566 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -92,7 +92,7 @@ else()
> +   endif()
> +
> +   if(WITH_ZLIB)
> +-    find_package(zlib REQUIRED)
> ++    find_package(ZLIB REQUIRED)
> +     add_definitions(-DZLIB)
> +     if(ZLIB_INCLUDE_DIRS)
> +       # CMake 3
> +--
> +2.11.0
> +
> diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
> index 8d846197a..6320c10fa 100644
> --- a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
> +++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
> @@ -6,11 +6,12 @@ LIC_FILES_CHKSUM = "file://LICENSE.Apache;md5=3b83ef96387f14655fc854ddc3c6bd57 \
>                      file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>                      file://LICENSE.leveldb;md5=fb04ff57a14f308f2eed4a9b87d45837"
>
> -SRCREV = "641fae60f63619ed5d0c9d9e4c4ea5a0ffa3e253"
> -SRCBRANCH = "5.18.fb"
> -PV = "5.18.3"
> +SRCREV = "628a7fd74b5611657106c57f724f1682b114684c"
> +SRCBRANCH = "6.0.fb"
> +PV = "6.0.2"
>
>  SRC_URI = "git://github.com/facebook/${BPN}.git;branch=${SRCBRANCH} \
> +           file://0001-CMake-has-stock-FindZLIB-in-upper-case.patch \
>             file://0001-Disable-Wshadow-and-do-not-mark-default-copy-constru.patch \
>             file://0001-utilities-Fix-build-failure-with-Werror-maybe-uninit.patch \
>            "
> @@ -19,11 +20,13 @@ S = "${WORKDIR}/git"
>
>  inherit cmake
>
> -PACKAGECONFIG ??= "bzip2 zlib lz4"
> +PACKAGECONFIG ??= "bzip2 zlib lz4 snappy gflags"
>  PACKAGECONFIG[bzip2] = "-DWITH_BZ2=ON -DBZIP2_LIBRARIES:STRING=bz2,-DWITH_BZ2=OFF,bzip2"
>  PACKAGECONFIG[lz4] = "-DWITH_LZ4=ON -DLZ4_LIBRARIES:STRING=lz4,-DWITH_LZ4=OFF,lz4"
>  PACKAGECONFIG[zlib] = "-DWITH_ZLIB=ON -DZLIB_LIBRARIES:STRING=z,-DWITH_ZLIB=OFF,zlib"
> +PACKAGECONFIG[zstd] = "-DWITH_ZSTD=ON,-DWITH_ZSTD=OFF,zstd"
>  PACKAGECONFIG[lite] = "-DROCKSDB_LITE=ON,-DROCKSDB_LITE=OFF"
> +PACKAGECONFIG[gflags] = "-DWITH_GFLAGS=ON,-DWITH_GFLAGS=OFF,gflags"
>
>  # Tools and tests currently don't compile on armv5 so we disable them
>  EXTRA_OECMAKE = "\
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

