Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4AAC07EB5D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jun 2019 19:40:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5EJdvVv006420
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 14 Jun 2019 12:40:07 -0700
Received: from yow-masselst-lx1.localnet (128.224.20.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.439.0; Fri, 14 Jun 2019 12:39:47 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Jun 2019 15:39:45 -0400
Message-ID: <1859077.ga1B1cmZR3@yow-masselst-lx1>
Organization: Wind River
In-Reply-To: <CAMKF1sq1Zm4OfXwHohkgD6BvZU6_UduK-AhFzN8-NiZt=1XmFw@mail.gmail.com>
References: <20190612081605.11382-1-pascal.bach@siemens.com>
	<CAMKF1sq1Zm4OfXwHohkgD6BvZU6_UduK-AhFzN8-NiZt=1XmFw@mail.gmail.com>
MIME-Version: 1.0
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
X-List-Received-Date: Fri, 14 Jun 2019 19:40:45 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, June 14, 2019 3:23:09 P.M. EDT Khem Raj wrote:
> Hi Pascal
> 
> Do we still need to inject the compiler options we are doing in
> do_compile_prepend()
> proposed with
> 
> https://patchwork.openembedded.org/patch/161810/

I was thinking they can be dropped. At least the trial build I did which was 
failing was successful with Pascal's uprev and the patch.

Mark

> 
> On Wed, Jun 12, 2019 at 1:16 AM Pascal Bach <pascal.bach@siemens.com> wrote:
> > Also add support for gflags as these are enabled by default
> > and recipes are available in meta-oe. They can still be disabled via
> > PACKAGECONFIG.
> > 
> > zstd is also added as an PACKAGECONFIG but currently the zstd recipe is
> > not in meta-oe so it stays disabled for the moment.
> > 
> > This also includes a patch that fixes GCC9 compatibility, it's currently
> > submitted upstream but not yet accepted due to style issues.
> > 
> > Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> > ---
> > 
> >  ...01-CMake-has-stock-FindZLIB-in-upper-case.patch | 29 ++++++++
> >  .../rocksdb/files/0001-fix-Issue-5303.patch        | 80
> >  ++++++++++++++++++++++ meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb       
> >   | 14 ++--
> >  3 files changed, 118 insertions(+), 5 deletions(-)
> >  create mode 100644
> >  meta-oe/recipes-dbs/rocksdb/files/0001-CMake-has-stock-FindZLIB-in-upper
> >  -case.patch create mode 100644
> >  meta-oe/recipes-dbs/rocksdb/files/0001-fix-Issue-5303.patch> 
> > diff --git
> > a/meta-oe/recipes-dbs/rocksdb/files/0001-CMake-has-stock-FindZLIB-in-uppe
> > r-case.patch
> > b/meta-oe/recipes-dbs/rocksdb/files/0001-CMake-has-stock-FindZLIB-in-uppe
> > r-case.patch new file mode 100644
> > index 000000000..9682f8ad4
> > --- /dev/null
> > +++
> > b/meta-oe/recipes-dbs/rocksdb/files/0001-CMake-has-stock-FindZLIB-in-uppe
> > r-case.patch @@ -0,0 +1,29 @@
> > +From 38146a5d803a1fb9b10f011aa857872b6f20cd02 Mon Sep 17 00:00:00 2001
> > +From: Tongliang Liao <xkszltl@gmail.com>
> > +Date: Mon, 29 Apr 2019 03:51:51 -0700
> > +Subject: [PATCH] CMake has stock FindZLIB in upper case. More details in
> > + https://cmake.org/cmake/help/v3.14/module/FindZLIB.html
> > +
> > +
> > +Upstream-Status: Backport https://github.com/facebook/rocksdb/pull/5261
> > +
> > +---
> > + CMakeLists.txt | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/CMakeLists.txt b/CMakeLists.txt
> > +index 40cdd26bb..355686566 100644
> > +--- a/CMakeLists.txt
> > ++++ b/CMakeLists.txt
> > +@@ -92,7 +92,7 @@ else()
> > +   endif()
> > +
> > +   if(WITH_ZLIB)
> > +-    find_package(zlib REQUIRED)
> > ++    find_package(ZLIB REQUIRED)
> > +     add_definitions(-DZLIB)
> > +     if(ZLIB_INCLUDE_DIRS)
> > +       # CMake 3
> > +--
> > +2.11.0
> > +
> > diff --git a/meta-oe/recipes-dbs/rocksdb/files/0001-fix-Issue-5303.patch
> > b/meta-oe/recipes-dbs/rocksdb/files/0001-fix-Issue-5303.patch new file
> > mode 100644
> > index 000000000..ba9834dfe
> > --- /dev/null
> > +++ b/meta-oe/recipes-dbs/rocksdb/files/0001-fix-Issue-5303.patch
> > @@ -0,0 +1,80 @@
> > +From 512aaf3d833973f6146c6f1235b590901876175e Mon Sep 17 00:00:00 2001
> > +From: biocodz <biocodz@protonmail.com>
> > +Date: Fri, 7 Jun 2019 09:49:37 -0400
> > +Subject: [PATCH] fix Issue 5303
> > +
> > +Upstream-Status: Submitted
> > [https://github.com/facebook/rocksdb/pull/5426]
> > +
> > +---
> > + db/internal_stats.h                                | 21
> > +++++++++++++++++++++ + db/version_edit.h                                
> >  |  8 ++++++++ + utilities/persistent_cache/persistent_cache_util.h |  2
> > +-
> > + 3 files changed, 30 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/db/internal_stats.h b/db/internal_stats.h
> > +index 6fa8727a4..09447644d 100644
> > +--- a/db/internal_stats.h
> > ++++ b/db/internal_stats.h
> > +@@ -236,6 +236,27 @@ class InternalStats {
> > +       }
> > +     }
> > +
> > ++      CompactionStats & operator=(const CompactionStats& c) {
> > ++        count = c.count;
> > ++        micros = c.micros;
> > ++        cpu_micros = c.cpu_micros;
> > ++        bytes_read_non_output_levels = c.bytes_read_non_output_levels;
> > ++        bytes_read_output_level = c.bytes_read_output_level;
> > ++        bytes_written = c.bytes_written;
> > ++        bytes_moved = c.bytes_moved;
> > ++        num_input_files_in_non_output_levels =
> > ++            c.num_input_files_in_non_output_levels;
> > ++        num_input_files_in_output_level =
> > c.num_input_files_in_output_level; ++        num_output_files =
> > c.num_output_files;
> > ++        num_input_records = c.num_input_records;
> > ++        num_dropped_records = c.num_dropped_records;
> > ++        int num_of_reasons =
> > static_cast<int>(CompactionReason::kNumOfReasons); ++        for (int i =
> > 0; i < num_of_reasons; i++) {
> > ++              counts[i] = c.counts[i];
> > ++        }
> > ++        return *this;
> > ++      }
> > ++
> > +     void Clear() {
> > +       this->micros = 0;
> > +       this->cpu_micros = 0;
> > +diff --git a/db/version_edit.h b/db/version_edit.h
> > +index 229531792..5c50ef552 100644
> > +--- a/db/version_edit.h
> > ++++ b/db/version_edit.h
> > +@@ -52,6 +52,14 @@ struct FileDescriptor {
> > +         smallest_seqno(_smallest_seqno),
> > +         largest_seqno(_largest_seqno) {}
> > +
> > ++  FileDescriptor(const FileDescriptor& fd) {
> > ++    table_reader = fd.table_reader;
> > ++    packed_number_and_path_id = fd.packed_number_and_path_id;
> > ++    file_size = fd.file_size;
> > ++    smallest_seqno = fd.smallest_seqno;
> > ++    largest_seqno = fd.largest_seqno;
> > ++  }
> > ++
> > +   FileDescriptor& operator=(const FileDescriptor& fd) {
> > +     table_reader = fd.table_reader;
> > +     packed_number_and_path_id = fd.packed_number_and_path_id;
> > +diff --git a/utilities/persistent_cache/persistent_cache_util.h
> > b/utilities/persistent_cache/persistent_cache_util.h +index
> > 214bb5875..254c038f9 100644
> > +--- a/utilities/persistent_cache/persistent_cache_util.h
> > ++++ b/utilities/persistent_cache/persistent_cache_util.h
> > +@@ -48,7 +48,7 @@ class BoundedQueue {
> > +     T t = std::move(q_.front());
> > +     size_ -= t.Size();
> > +     q_.pop_front();
> > +-    return std::move(t);
> > ++    return t;
> > +   }
> > +
> > +   size_t Size() const {
> > +--
> > +2.11.0
> > +
> > diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
> > b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb index 8d846197a..9fd5ee15b
> > 100644
> > --- a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
> > +++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
> > @@ -6,24 +6,28 @@ LIC_FILES_CHKSUM =
> > "file://LICENSE.Apache;md5=3b83ef96387f14655fc854ddc3c6bd57 \> 
> >                      file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> >                      file://LICENSE.leveldb;md5=fb04ff57a14f308f2eed4a9b87
> >                      d45837"
> > 
> > -SRCREV = "641fae60f63619ed5d0c9d9e4c4ea5a0ffa3e253"
> > -SRCBRANCH = "5.18.fb"
> > -PV = "5.18.3"
> > +SRCREV = "628a7fd74b5611657106c57f724f1682b114684c"
> > +SRCBRANCH = "6.0.fb"
> > +PV = "6.0.2"
> > 
> >  SRC_URI = "git://github.com/facebook/${BPN}.git;branch=${SRCBRANCH} \
> > 
> > +           file://0001-CMake-has-stock-FindZLIB-in-upper-case.patch \
> > 
> >             file://0001-Disable-Wshadow-and-do-not-mark-default-copy-const
> >             ru.patch \
> >             file://0001-utilities-Fix-build-failure-with-Werror-maybe-unin
> >             it.patch \
> > 
> > +           file://0001-fix-Issue-5303.patch \
> > 
> >            "
> >  
> >  S = "${WORKDIR}/git"
> >  
> >  inherit cmake
> > 
> > -PACKAGECONFIG ??= "bzip2 zlib lz4"
> > +PACKAGECONFIG ??= "bzip2 zlib lz4 gflags"
> > 
> >  PACKAGECONFIG[bzip2] = "-DWITH_BZ2=ON
> >  -DBZIP2_LIBRARIES:STRING=bz2,-DWITH_BZ2=OFF,bzip2" PACKAGECONFIG[lz4] =
> >  "-DWITH_LZ4=ON -DLZ4_LIBRARIES:STRING=lz4,-DWITH_LZ4=OFF,lz4"> 
> > -PACKAGECONFIG[zlib] = "-DWITH_ZLIB=ON
> > -DZLIB_LIBRARIES:STRING=z,-DWITH_ZLIB=OFF,zlib" +PACKAGECONFIG[zlib] =
> > "-DWITH_ZLIB=ON -DZLIB_LIBRARY:STRING=z,-DWITH_ZLIB=OFF,zlib"
> > +PACKAGECONFIG[zstd] = "-DWITH_ZSTD=ON,-DWITH_ZSTD=OFF,zstd"
> > 
> >  PACKAGECONFIG[lite] = "-DROCKSDB_LITE=ON,-DROCKSDB_LITE=OFF"
> > 
> > +PACKAGECONFIG[gflags] = "-DWITH_GFLAGS=ON,-DWITH_GFLAGS=OFF,gflags"
> > 
> >  # Tools and tests currently don't compile on armv5 so we disable them
> >  EXTRA_OECMAKE = "\
> > 
> > --
> > 2.11.0
> > 
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel





