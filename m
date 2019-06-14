Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6D7737E9D2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jun 2019 19:49:21 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id y57so3892733qtk.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jun 2019 12:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KMg4InHhFyat+22ccE1oYVTFgFx9uultimHCatiOOWs=;
	b=qgIdOeQeuNm5ecnIz/blXnJaVwcYaHq6uA8jQ7yiCikFwCGyLidSasrRoMuyoPy82Z
	3Nyt17S9QT1AWqVa9i5t2gAmqwJBh4EtDuaUxW/F3QQ9UcEcucrE8Fdttg+rXFiURMJ6
	37kXpBrpMRmXLUcDnn25qhdScnGIFs3jYycntfa9IldorMCEJA8SMnbZfKCUPnpFWj2P
	8Qo+yHAp1Ue9BNCb1CHkRNYt8kD7waeoxBWqg3Wrj8lYSiaq+R1Dv0/f47Kfvpkr7luP
	t/8XVTA+gb3kIAZV+WinAwtPU9MK4WfrUbLuNBHi4/cQLTE0uq0gjgVdqgJVRInHxtHj
	Jadw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KMg4InHhFyat+22ccE1oYVTFgFx9uultimHCatiOOWs=;
	b=DnyVoTHYvRPgMsWY0Io94Vgo4H+U0TTmwQzxpzBk5AEyV9Zlf51mXUxxEuIT6Q4YrE
	LymNOI+t/htypljsdq4cFSC7kgqYHUMvbp1fXoqTKsaryK4C/MUlokQUhYeGpQ9o2nD1
	T+SHhbabA0dkwnmqt/Xjv8bi0a9sD3M8L38KXrlYC9+QHNF7UxF6+awby2I9Oukg/Oau
	KfGRbPMW8UIExMG4vQ7arR28VHqLLpuOxNpQH7oCXAeDHC7RgmLlmynDuh4YO38X3vlk
	2dFZmycdMXfktxUL23axhd3APe63v9XwJ5NYSofOdV2/AXyOfNuVVo4Q9INH8x4qH29g
	RJ2Q==
X-Gm-Message-State: APjAAAWuWfSji7nHQJVggQAXf2FzCrVSNCDFXoFNfGbhNI9/+gruez5Z
	tJZ38q/rVWduJgme690KYMq6e+q/HscUI4JrooE=
X-Google-Smtp-Source: APXvYqxb+6aBsG0dBbbLdmWE5DGGrkdtGFzmUEwU1tEjwRNPhXaHNx+5+mgZ7uGOadiv0tSEdbmwxw2o2Nov85k7ehM=
X-Received: by 2002:ac8:2cfc:: with SMTP id 57mr81010391qtx.194.1560541762059; 
	Fri, 14 Jun 2019 12:49:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190612081605.11382-1-pascal.bach@siemens.com>
	<CAMKF1sq1Zm4OfXwHohkgD6BvZU6_UduK-AhFzN8-NiZt=1XmFw@mail.gmail.com>
	<1859077.ga1B1cmZR3@yow-masselst-lx1>
In-Reply-To: <1859077.ga1B1cmZR3@yow-masselst-lx1>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Jun 2019 12:48:55 -0700
Message-ID: <CAMKF1sqDHckz4hX5SKo-yEY-yFcybbZr0dpR1xZyPOKvUoJL8A@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCHv2] rocksdb: 5.18.3 -> 6.0.2
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
X-List-Received-Date: Fri, 14 Jun 2019 19:49:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 14, 2019 at 12:40 PM Mark Asselstine
<mark.asselstine@windriver.com> wrote:
>
> On Friday, June 14, 2019 3:23:09 P.M. EDT Khem Raj wrote:
> > Hi Pascal
> >
> > Do we still need to inject the compiler options we are doing in
> > do_compile_prepend()
> > proposed with
> >
> > https://patchwork.openembedded.org/patch/161810/
>
> I was thinking they can be dropped. At least the trial build I did which was
> failing was successful with Pascal's uprev and the patch.

Yeah i see that it fails on clang with
| error: unknown warning option '-Werror=deprecated-copy'; did you
mean '-Werror=deprecated'? [-Werror,-Wunknown-warning-option]

I was wondering if we introduced that to cmdline but it seems not. so
maybe I need to patch it.

>
> Mark
>
> >
> > On Wed, Jun 12, 2019 at 1:16 AM Pascal Bach <pascal.bach@siemens.com> wrote:
> > > Also add support for gflags as these are enabled by default
> > > and recipes are available in meta-oe. They can still be disabled via
> > > PACKAGECONFIG.
> > >
> > > zstd is also added as an PACKAGECONFIG but currently the zstd recipe is
> > > not in meta-oe so it stays disabled for the moment.
> > >
> > > This also includes a patch that fixes GCC9 compatibility, it's currently
> > > submitted upstream but not yet accepted due to style issues.
> > >
> > > Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> > > ---
> > >
> > >  ...01-CMake-has-stock-FindZLIB-in-upper-case.patch | 29 ++++++++
> > >  .../rocksdb/files/0001-fix-Issue-5303.patch        | 80
> > >  ++++++++++++++++++++++ meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
> > >   | 14 ++--
> > >  3 files changed, 118 insertions(+), 5 deletions(-)
> > >  create mode 100644
> > >  meta-oe/recipes-dbs/rocksdb/files/0001-CMake-has-stock-FindZLIB-in-upper
> > >  -case.patch create mode 100644
> > >  meta-oe/recipes-dbs/rocksdb/files/0001-fix-Issue-5303.patch>
> > > diff --git
> > > a/meta-oe/recipes-dbs/rocksdb/files/0001-CMake-has-stock-FindZLIB-in-uppe
> > > r-case.patch
> > > b/meta-oe/recipes-dbs/rocksdb/files/0001-CMake-has-stock-FindZLIB-in-uppe
> > > r-case.patch new file mode 100644
> > > index 000000000..9682f8ad4
> > > --- /dev/null
> > > +++
> > > b/meta-oe/recipes-dbs/rocksdb/files/0001-CMake-has-stock-FindZLIB-in-uppe
> > > r-case.patch @@ -0,0 +1,29 @@
> > > +From 38146a5d803a1fb9b10f011aa857872b6f20cd02 Mon Sep 17 00:00:00 2001
> > > +From: Tongliang Liao <xkszltl@gmail.com>
> > > +Date: Mon, 29 Apr 2019 03:51:51 -0700
> > > +Subject: [PATCH] CMake has stock FindZLIB in upper case. More details in
> > > + https://cmake.org/cmake/help/v3.14/module/FindZLIB.html
> > > +
> > > +
> > > +Upstream-Status: Backport https://github.com/facebook/rocksdb/pull/5261
> > > +
> > > +---
> > > + CMakeLists.txt | 2 +-
> > > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > > +
> > > +diff --git a/CMakeLists.txt b/CMakeLists.txt
> > > +index 40cdd26bb..355686566 100644
> > > +--- a/CMakeLists.txt
> > > ++++ b/CMakeLists.txt
> > > +@@ -92,7 +92,7 @@ else()
> > > +   endif()
> > > +
> > > +   if(WITH_ZLIB)
> > > +-    find_package(zlib REQUIRED)
> > > ++    find_package(ZLIB REQUIRED)
> > > +     add_definitions(-DZLIB)
> > > +     if(ZLIB_INCLUDE_DIRS)
> > > +       # CMake 3
> > > +--
> > > +2.11.0
> > > +
> > > diff --git a/meta-oe/recipes-dbs/rocksdb/files/0001-fix-Issue-5303.patch
> > > b/meta-oe/recipes-dbs/rocksdb/files/0001-fix-Issue-5303.patch new file
> > > mode 100644
> > > index 000000000..ba9834dfe
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-dbs/rocksdb/files/0001-fix-Issue-5303.patch
> > > @@ -0,0 +1,80 @@
> > > +From 512aaf3d833973f6146c6f1235b590901876175e Mon Sep 17 00:00:00 2001
> > > +From: biocodz <biocodz@protonmail.com>
> > > +Date: Fri, 7 Jun 2019 09:49:37 -0400
> > > +Subject: [PATCH] fix Issue 5303
> > > +
> > > +Upstream-Status: Submitted
> > > [https://github.com/facebook/rocksdb/pull/5426]
> > > +
> > > +---
> > > + db/internal_stats.h                                | 21
> > > +++++++++++++++++++++ + db/version_edit.h
> > >  |  8 ++++++++ + utilities/persistent_cache/persistent_cache_util.h |  2
> > > +-
> > > + 3 files changed, 30 insertions(+), 1 deletion(-)
> > > +
> > > +diff --git a/db/internal_stats.h b/db/internal_stats.h
> > > +index 6fa8727a4..09447644d 100644
> > > +--- a/db/internal_stats.h
> > > ++++ b/db/internal_stats.h
> > > +@@ -236,6 +236,27 @@ class InternalStats {
> > > +       }
> > > +     }
> > > +
> > > ++      CompactionStats & operator=(const CompactionStats& c) {
> > > ++        count = c.count;
> > > ++        micros = c.micros;
> > > ++        cpu_micros = c.cpu_micros;
> > > ++        bytes_read_non_output_levels = c.bytes_read_non_output_levels;
> > > ++        bytes_read_output_level = c.bytes_read_output_level;
> > > ++        bytes_written = c.bytes_written;
> > > ++        bytes_moved = c.bytes_moved;
> > > ++        num_input_files_in_non_output_levels =
> > > ++            c.num_input_files_in_non_output_levels;
> > > ++        num_input_files_in_output_level =
> > > c.num_input_files_in_output_level; ++        num_output_files =
> > > c.num_output_files;
> > > ++        num_input_records = c.num_input_records;
> > > ++        num_dropped_records = c.num_dropped_records;
> > > ++        int num_of_reasons =
> > > static_cast<int>(CompactionReason::kNumOfReasons); ++        for (int i =
> > > 0; i < num_of_reasons; i++) {
> > > ++              counts[i] = c.counts[i];
> > > ++        }
> > > ++        return *this;
> > > ++      }
> > > ++
> > > +     void Clear() {
> > > +       this->micros = 0;
> > > +       this->cpu_micros = 0;
> > > +diff --git a/db/version_edit.h b/db/version_edit.h
> > > +index 229531792..5c50ef552 100644
> > > +--- a/db/version_edit.h
> > > ++++ b/db/version_edit.h
> > > +@@ -52,6 +52,14 @@ struct FileDescriptor {
> > > +         smallest_seqno(_smallest_seqno),
> > > +         largest_seqno(_largest_seqno) {}
> > > +
> > > ++  FileDescriptor(const FileDescriptor& fd) {
> > > ++    table_reader = fd.table_reader;
> > > ++    packed_number_and_path_id = fd.packed_number_and_path_id;
> > > ++    file_size = fd.file_size;
> > > ++    smallest_seqno = fd.smallest_seqno;
> > > ++    largest_seqno = fd.largest_seqno;
> > > ++  }
> > > ++
> > > +   FileDescriptor& operator=(const FileDescriptor& fd) {
> > > +     table_reader = fd.table_reader;
> > > +     packed_number_and_path_id = fd.packed_number_and_path_id;
> > > +diff --git a/utilities/persistent_cache/persistent_cache_util.h
> > > b/utilities/persistent_cache/persistent_cache_util.h +index
> > > 214bb5875..254c038f9 100644
> > > +--- a/utilities/persistent_cache/persistent_cache_util.h
> > > ++++ b/utilities/persistent_cache/persistent_cache_util.h
> > > +@@ -48,7 +48,7 @@ class BoundedQueue {
> > > +     T t = std::move(q_.front());
> > > +     size_ -= t.Size();
> > > +     q_.pop_front();
> > > +-    return std::move(t);
> > > ++    return t;
> > > +   }
> > > +
> > > +   size_t Size() const {
> > > +--
> > > +2.11.0
> > > +
> > > diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
> > > b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb index 8d846197a..9fd5ee15b
> > > 100644
> > > --- a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
> > > +++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
> > > @@ -6,24 +6,28 @@ LIC_FILES_CHKSUM =
> > > "file://LICENSE.Apache;md5=3b83ef96387f14655fc854ddc3c6bd57 \>
> > >                      file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> > >                      file://LICENSE.leveldb;md5=fb04ff57a14f308f2eed4a9b87
> > >                      d45837"
> > >
> > > -SRCREV = "641fae60f63619ed5d0c9d9e4c4ea5a0ffa3e253"
> > > -SRCBRANCH = "5.18.fb"
> > > -PV = "5.18.3"
> > > +SRCREV = "628a7fd74b5611657106c57f724f1682b114684c"
> > > +SRCBRANCH = "6.0.fb"
> > > +PV = "6.0.2"
> > >
> > >  SRC_URI = "git://github.com/facebook/${BPN}.git;branch=${SRCBRANCH} \
> > >
> > > +           file://0001-CMake-has-stock-FindZLIB-in-upper-case.patch \
> > >
> > >             file://0001-Disable-Wshadow-and-do-not-mark-default-copy-const
> > >             ru.patch \
> > >             file://0001-utilities-Fix-build-failure-with-Werror-maybe-unin
> > >             it.patch \
> > >
> > > +           file://0001-fix-Issue-5303.patch \
> > >
> > >            "
> > >
> > >  S = "${WORKDIR}/git"
> > >
> > >  inherit cmake
> > >
> > > -PACKAGECONFIG ??= "bzip2 zlib lz4"
> > > +PACKAGECONFIG ??= "bzip2 zlib lz4 gflags"
> > >
> > >  PACKAGECONFIG[bzip2] = "-DWITH_BZ2=ON
> > >  -DBZIP2_LIBRARIES:STRING=bz2,-DWITH_BZ2=OFF,bzip2" PACKAGECONFIG[lz4] =
> > >  "-DWITH_LZ4=ON -DLZ4_LIBRARIES:STRING=lz4,-DWITH_LZ4=OFF,lz4">
> > > -PACKAGECONFIG[zlib] = "-DWITH_ZLIB=ON
> > > -DZLIB_LIBRARIES:STRING=z,-DWITH_ZLIB=OFF,zlib" +PACKAGECONFIG[zlib] =
> > > "-DWITH_ZLIB=ON -DZLIB_LIBRARY:STRING=z,-DWITH_ZLIB=OFF,zlib"
> > > +PACKAGECONFIG[zstd] = "-DWITH_ZSTD=ON,-DWITH_ZSTD=OFF,zstd"
> > >
> > >  PACKAGECONFIG[lite] = "-DROCKSDB_LITE=ON,-DROCKSDB_LITE=OFF"
> > >
> > > +PACKAGECONFIG[gflags] = "-DWITH_GFLAGS=ON,-DWITH_GFLAGS=OFF,gflags"
> > >
> > >  # Tools and tests currently don't compile on armv5 so we disable them
> > >  EXTRA_OECMAKE = "\
> > >
> > > --
> > > 2.11.0
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>
>

