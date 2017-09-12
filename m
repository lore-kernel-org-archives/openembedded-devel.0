Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 82CF9784AB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Sep 2017 05:58:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v8C5w2sZ014373
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Sep 2017 22:58:02 -0700
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 11 Sep 2017 22:58:01 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <1503983946-187275-1-git-send-email-dengke.du@windriver.com>
From: Dengke Du <dengke.du@windriver.com>
Message-ID: <c7d8d623-cf9a-3ee6-41f6-9424e8eebe37@windriver.com>
Date: Tue, 12 Sep 2017 13:57:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1503983946-187275-1-git-send-email-dengke.du@windriver.com>
X-Originating-IP: [128.224.162.194]
Subject: Re: [meta-networking][PATCH] squid: upgrade to 3.5.27
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
X-List-Received-Date: Tue, 12 Sep 2017 05:58:01 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Ping.


On 2017年08月29日 13:19, Dengke Du wrote:
> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ---
>   .../0001-Before-use-rpc-rpc.h-check-it-first.patch | 32 +++++++++++++++
>   ...e-noexcept-instead-of-throw-for-C-11-comp.patch | 48 ----------------------
>   .../recipes-daemons/squid/files/gcc7-fixes.patch   | 17 --------
>   .../squid/{squid_3.5.26.bb => squid_3.5.27.bb}     | 11 +++--
>   4 files changed, 39 insertions(+), 69 deletions(-)
>   create mode 100644 meta-networking/recipes-daemons/squid/files/0001-Before-use-rpc-rpc.h-check-it-first.patch
>   delete mode 100644 meta-networking/recipes-daemons/squid/files/0001-SquidNew-use-noexcept-instead-of-throw-for-C-11-comp.patch
>   delete mode 100644 meta-networking/recipes-daemons/squid/files/gcc7-fixes.patch
>   rename meta-networking/recipes-daemons/squid/{squid_3.5.26.bb => squid_3.5.27.bb} (93%)
>
> diff --git a/meta-networking/recipes-daemons/squid/files/0001-Before-use-rpc-rpc.h-check-it-first.patch b/meta-networking/recipes-daemons/squid/files/0001-Before-use-rpc-rpc.h-check-it-first.patch
> new file mode 100644
> index 0000000..485b18c
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/squid/files/0001-Before-use-rpc-rpc.h-check-it-first.patch
> @@ -0,0 +1,32 @@
> +From b5de7a89f31a17d37beb5d22857bbf829dbfb367 Mon Sep 17 00:00:00 2001
> +From: Dengke Du <dengke.du@windriver.com>
> +Date: Mon, 28 Aug 2017 23:17:04 -0400
> +Subject: [PATCH] Before use rpc/rpc.h, check it first.
> +
> +When generate configure using *.m4, the ../NIS/required.m4, we should
> +check the rpc/rpc.h first before using it.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Dengke Du <dengke.du@windriver.com>
> +---
> + helpers/basic_auth/NIS/required.m4 | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/helpers/basic_auth/NIS/required.m4 b/helpers/basic_auth/NIS/required.m4
> +index fdb1360..ec4fe69 100755
> +--- a/helpers/basic_auth/NIS/required.m4
> ++++ b/helpers/basic_auth/NIS/required.m4
> +@@ -6,7 +6,8 @@
> + ##
> +
> + BUILD_HELPER="NIS"
> +-AC_CHECK_HEADERS([sys/types.h rpc/rpc.h rpcsvc/ypclnt.h rpcsvc/yp_prot.h crypt.h],[],[BUILD_HELPER=""],AC_INCLUDES_DEFAULT([
> ++AC_CHECK_HEADERS([rpc/rpc.h])
> ++AC_CHECK_HEADERS([sys/types.h rpcsvc/ypclnt.h rpcsvc/yp_prot.h crypt.h],[],[BUILD_HELPER=""],AC_INCLUDES_DEFAULT([
> + #if HAVE_RPC_RPC_H
> + #include <rpc/rpc.h>
> + #endif
> +--
> +2.8.1
> +
> diff --git a/meta-networking/recipes-daemons/squid/files/0001-SquidNew-use-noexcept-instead-of-throw-for-C-11-comp.patch b/meta-networking/recipes-daemons/squid/files/0001-SquidNew-use-noexcept-instead-of-throw-for-C-11-comp.patch
> deleted file mode 100644
> index 48674c3..0000000
> --- a/meta-networking/recipes-daemons/squid/files/0001-SquidNew-use-noexcept-instead-of-throw-for-C-11-comp.patch
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -From f9150a0dc092ab2cbd47ee428436b747dce323a9 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sun, 23 Apr 2017 10:28:28 -0700
> -Subject: [PATCH] SquidNew: use noexcept instead of throw for C++11 compilers
> -
> -Fixes errors with gcc7 which is more pedantic about c++11
> -conformance regarding deprecated features
> -
> -include/SquidNew.h:21:51: error: dynamic exception specifications are deprecated in C++11
> -_SQUID_EXTERNNEW_ void *operator new[] (size_t size) throw (std::bad_alloc)
> -                                                       ^~~~~
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - include/SquidNew.h | 8 ++++----
> - 1 file changed, 4 insertions(+), 4 deletions(-)
> -
> -diff --git a/include/SquidNew.h b/include/SquidNew.h
> -index 39fcee0..c960347 100644
> ---- a/include/SquidNew.h
> -+++ b/include/SquidNew.h
> -@@ -18,19 +18,19 @@
> -  */
> - #include <new>
> -
> --_SQUID_EXTERNNEW_ void *operator new(size_t size) throw (std::bad_alloc)
> -+_SQUID_EXTERNNEW_ void *operator new(size_t size) noexcept(false)
> - {
> -     return xmalloc(size);
> - }
> --_SQUID_EXTERNNEW_ void operator delete (void *address) throw()
> -+_SQUID_EXTERNNEW_ void operator delete (void *address) noexcept(true)
> - {
> -     xfree(address);
> - }
> --_SQUID_EXTERNNEW_ void *operator new[] (size_t size) throw (std::bad_alloc)
> -+_SQUID_EXTERNNEW_ void *operator new[] (size_t size) noexcept(false)
> - {
> -     return xmalloc(size);
> - }
> --_SQUID_EXTERNNEW_ void operator delete[] (void *address) throw()
> -+_SQUID_EXTERNNEW_ void operator delete[] (void *address) noexcept(true)
> - {
> -     xfree(address);
> - }
> ---
> -2.12.2
> -
> diff --git a/meta-networking/recipes-daemons/squid/files/gcc7-fixes.patch b/meta-networking/recipes-daemons/squid/files/gcc7-fixes.patch
> deleted file mode 100644
> index cc1ea78..0000000
> --- a/meta-networking/recipes-daemons/squid/files/gcc7-fixes.patch
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -../../squid-3.5.26/src/DiskIO/DiskThreads/aiops.cc: In function 'void squidaio_init()':                                                              ../../squid-3.5.26/src/DiskIO/DiskThreads/DiskThreads.h:30:50: error: '*' in boolean context, suggest '&&' instead [-Werror=int-in-bool-context]      #define NUMTHREADS (Config.cacheSwap.n_configured*16)
> -
> -
> -Upstream-Status: Backport
> -Index: squid-3.5.26/src/DiskIO/DiskThreads/aiops.cc
> -===================================================================
> ---- squid-3.5.26.orig/src/DiskIO/DiskThreads/aiops.cc
> -+++ squid-3.5.26/src/DiskIO/DiskThreads/aiops.cc
> -@@ -290,7 +290,7 @@ squidaio_init(void)
> -     /* Create threads and get them to sit in their wait loop */
> -     squidaio_thread_pool = memPoolCreate("aio_thread", sizeof(squidaio_thread_t));
> -
> --    assert(NUMTHREADS);
> -+    assert(NUMTHREADS != 0);
> -
> -     for (i = 0; i < NUMTHREADS; ++i) {
> -         threadp = (squidaio_thread_t *)squidaio_thread_pool->alloc();
> diff --git a/meta-networking/recipes-daemons/squid/squid_3.5.26.bb b/meta-networking/recipes-daemons/squid/squid_3.5.27.bb
> similarity index 93%
> rename from meta-networking/recipes-daemons/squid/squid_3.5.26.bb
> rename to meta-networking/recipes-daemons/squid/squid_3.5.27.bb
> index a78a091..4626852 100644
> --- a/meta-networking/recipes-daemons/squid/squid_3.5.26.bb
> +++ b/meta-networking/recipes-daemons/squid/squid_3.5.27.bb
> @@ -21,13 +21,12 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${MIN_VER}/${BPN}-${P
>              file://volatiles.03_squid \
>              file://set_sysroot_patch.patch \
>              file://squid-don-t-do-squid-conf-tests-at-build-time.patch \
> -           file://0001-SquidNew-use-noexcept-instead-of-throw-for-C-11-comp.patch \
>              file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch \
> -           file://gcc7-fixes.patch \
>              file://0001-tools.cc-fixed-unused-result-warning.patch \
> +           file://0001-Before-use-rpc-rpc.h-check-it-first.patch \
>              "
> -SRC_URI[md5sum] = "dc1830cd361e077814aa39bcc3691d8b"
> -SRC_URI[sha256sum] = "41d8845863dcd026c856508cd1599d417c8947ffd96e86e24085f9893cb8b8c2"
> +SRC_URI[md5sum] = "c17a3ed3a40cd59c23f48b8539dafcd8"
> +SRC_URI[sha256sum] = "467da134eaf0f7962ba5881793d106772fb05fefa4aea7d9569eec0412c52433"
>   
>   LIC_FILES_CHKSUM = "file://COPYING;md5=c492e2d6d32ec5c1aad0e0609a141ce9 \
>                       file://errors/COPYRIGHT;md5=8861130fae91400bcf99b66f133172b3 \
> @@ -68,6 +67,10 @@ do_compile_ptest() {
>       oe_runmake -C ${TESTDIR} buildtest-TESTS
>   }
>   
> +do_compile_prepend() {
> +    sed -i 's,$(PERL),/usr/bin/perl,g' `find ${S} -name Makefile.in`
> +}
> +
>   do_install_ptest() {
>       cp -rf ${B}/${TESTDIR} ${D}${PTEST_PATH}
>       cp -rf ${S}/${TESTDIR} ${D}${PTEST_PATH}


