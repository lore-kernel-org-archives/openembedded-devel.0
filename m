Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4CD527E467
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Oct 2019 19:33:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x97JXLDk028826
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 7 Oct 2019 12:33:21 -0700
Received: from [172.25.44.5] (172.25.44.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Mon, 7 Oct 2019 12:33:20 -0700
To: Peiran Hong <peiran.hong@windriver.com>,
	<openembedded-devel@lists.openembedded.org>, "Burton, Ross"
	<ross.burton@intel.com>
References: <20191007134340.36555-1-peiran.hong@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <438a899e-51bc-b1be-d6bb-2d9a75ab93f8@windriver.com>
Date: Mon, 7 Oct 2019 15:33:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191007134340.36555-1-peiran.hong@windriver.com>
X-Originating-IP: [172.25.44.5]
Subject: Re: [meta-oe][PATCH] tcpdump: upgrade 4.9.2 -> 4.9.3
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
X-List-Received-Date: Mon, 07 Oct 2019 19:33:24 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 10/7/19 9:43 AM, Peiran Hong wrote:
> This upgrade adds some new features and fixes numerous bugs including
> the following CVEs:
> CVE: CVE-2017-16808 (AoE)
> CVE: CVE-2018-14468 (FrameRelay)
> CVE: CVE-2018-14469 (IKEv1)
> CVE: CVE-2018-14470 (BABEL)
> CVE: CVE-2018-14466 (AFS/RX)
> CVE: CVE-2018-14461 (LDP)
> CVE: CVE-2018-14462 (ICMP)
> CVE: CVE-2018-14465 (RSVP)
> CVE: CVE-2018-14881 (BGP)
> CVE: CVE-2018-14464 (LMP)
> CVE: CVE-2018-14463 (VRRP)
> CVE: CVE-2018-14467 (BGP)
> CVE: CVE-2018-10103 (SMB - partially fixed, but SMB printing disabled)
> CVE: CVE-2018-10105 (SMB - too unreliably reproduced,
>                             SMB printing disabled)
> CVE: CVE-2018-14880 (OSPF6)
> CVE: CVE-2018-16451 (SMB)
> CVE: CVE-2018-14882 (RPL)
> CVE: CVE-2018-16227 (802.11)
> CVE: CVE-2018-16229 (DCCP)
> CVE: CVE-2018-16301 (was fixed in libpcap)
> CVE: CVE-2018-16230 (BGP)
> CVE: CVE-2018-16452 (SMB)
> CVE: CVE-2018-16300 (BGP)
> CVE: CVE-2018-16228 (HNCP)
> CVE: CVE-2019-15166 (LMP)
> CVE: CVE-2019-15167 (VRRP)
> CVE: CVE-2018-14879 (tcpdump -V)
> 
> Deleted patch "0001-CVE-2017-16808-AoE-Add-a-missing-bounds-check.patch"
> since the fix is included in the upgrade.
> 
> Modified patches "avoid-absolute-path-when-searching-for-libdlpi.patch",
> "unnecessary-to-check-libpcap.patch", and "add-ptest.path" since
> the upgrade renamed configure.in to configure.ac and made changes
> to the file.
> 
> Added PACKAGECONFIG for smb. It is disabled by default in
> the upgraded version in both the package's configure script and this
> bitbake recipe since it is insecure.
> 
> Modified the parsing of ptest result to align with the new output
> format.
> 
> With core-image-minimal on qemux86-64/kvm:
> Recipe         | Passed      | Failed   | Skipped   | Time(s)
> Before         | 408         | 0        | 2         | 4
> After          | 431         | 11       | 2         | 10
> 
> 11 test failed after the upgrade since libpcap is not upgraded
> alongside with tcpdump.

It's a shame that we missed updating libpcap for 3.0
but it was only released at the end of Sep 2019.

Since little depends on libpcap in oe-core but 14 pkgs
in meta-oe do, perhaps it will slip into oe-core-3.0 or 3.0.1...

It's 300 commits:
$ git log --oneline libpcap-1.9.0..libpcap-1.9.1 | wc -l

and there are some commits that are not just bug fixes (1).

Thanks Peiran,

../Randy


(1).

CHANGES:

Sunday, July 22, 2018
   Summary for 1.9.1 libpcap release
     Mention pcap_get_required_select_timeout() in the main pcap man page
     Fix pcap-usb-linux.c build on systems with musl
     Fix assorted man page and other documentation issues
     Plug assorted memory leaks
     Documentation changes to use https:
     Changes to how time stamp calculations are done
     Lots of tweaks to make newer compilers happier and warning-free and
         to fix instances of C undefined behavior
     Warn if AC_PROG_CC_C99 can't enable C99 support
     Rename pcap_set_protocol() to  pcap_set_protocol_linux().
     Align pcap_t private data on an 8-byte boundary.
     Fix various error messages
     Use 64-bit clean API in dag_findalldevs()
     Fix cleaning up after some errors
     Work around some ethtool ioctl bugs in newer Linux kernels (GitHub
         issue #689)
     Add backwards compatibility sections to some man pages (GitHub issue
         #745)
     Fix autotool configuration on AIX and macOS
     Don't export bpf_filter_with_aux_data() or struct bpf_aux_data;
         they're internal-only and subject to change
     Fix pcapng block size checking
     On macOS, don't build rpcapd or test programs any fatter than they
         need to be
     Fix reading of capture statistics for Linux USB
     Fix packet size values for Linux USB packets (GitHub issue #808)
     Check only VID in VLAN test in filterss (GitHub issue #461)
     Fix pcap_list_datalinks on 802.11 devices on macOS
     Fix overflows with very large snapshot length in pcap file
     Improve parsing of rpcapd configuration file (GitHub issue #767)
     Handle systems without strlcpy() or strlcat() better
     Fix crashes and other errors with invalid filter expressions
     Fix use of uninitialized file descriptor in remote capture
     Fix some CMake issues
     Fix some divide-by-zero issues with the filter compiler
     Work around a GNU libc bug in pcap_nametonetaddr()
     Add support for DLT_LINUX_SLL2
     Fix handling of the packet-count argument for Myricom SNF devices
     Fix --disable-rdma in configure script (GitHub issue #782)
     Fix compilation of TurboCap support (GitHub issue #764)
     Constify first argument to pcap_findalldevs_ex()
     Fix a number of issues when running rpcapd as an inetd-style daemon
     Fix CMake issues with D-Bus libraries
     In rpcapd, clean up termination of a capture session
     Redo remote capture protocol negotiation
     In rpcapd, report the same error for "invalid user name" and
         "invalid password", to make brute-forcing harder
     For remote captures, add an error code for "the server requires TLS"
     Fix pcap_dump_fopen() on Windows to avoid clashes between
         {Win,N}Pcap and application C runtimes
     Fix exporting of functions from Windows DLLs (GitHub issue #810)
     Fix building as part of Npcap
     Allow rpcapd to rebind more rapidly
     Fix building shared libpcap library on midipix (midipix.org)
     Fix hack to detect UTF-16LE adapter names on Windows not to go past
         the end of the string
     Fix handling of "wireless WAN" (mobile phone network modems) on
         Windows with WinPcap/Npcap (GitHub issue #824)
     Have pcap_dump_open_append() create the dump file if it doesn't
         exists (GitHub issue #247)
     Fix the maxmum snapshot length for DLT_USBPCAP
     Use -fPIC when building for 64-bit SPARC on Linux (GitHub issue #837)
     Fix CMake 64-bit library installation directory on some Linux
         distributions
     Boost the TPACKET_V3 timeout to the maximum if a timeout of 0 was
         specified
     Five CVE-2019-15161, CVE-2019-15162, CVE-2019-15163, 
CVE-2019-15164, CVE-2019-15165
     Fixes for CVE-2018-16301, errors in pcapng reading.
     PCAPNG reader applies some sanity checks before doing malloc().





> 
> Signed-off-by: Peiran Hong <peiran.hong@windriver.com>
> ---
>   .../tcpdump/tcpdump/add-ptest.patch           |  9 +++++----
>   ...lute-path-when-searching-for-libdlpi.patch | 19 ++++++++++---------
>   .../recipes-support/tcpdump/tcpdump/run-ptest |  4 ++--
>   .../unnecessary-to-check-libpcap.patch        | 15 ++++++++-------
>   .../{tcpdump_4.9.2.bb => tcpdump_4.9.3.bb}    | 12 +++++++++---
>   5 files changed, 34 insertions(+), 25 deletions(-)
>   rename meta-networking/recipes-support/tcpdump/{tcpdump_4.9.2.bb => tcpdump_4.9.3.bb} (74%)
> 
> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/add-ptest.patch b/meta-networking/recipes-support/tcpdump/tcpdump/add-ptest.patch
> index b71435a04..f8ff354fe 100644
> --- a/meta-networking/recipes-support/tcpdump/tcpdump/add-ptest.patch
> +++ b/meta-networking/recipes-support/tcpdump/tcpdump/add-ptest.patch
> @@ -1,18 +1,19 @@
> -From 8ee1ab1ac89557d48ac1ab7ddcc3c51be9b734ad Mon Sep 17 00:00:00 2001
> +From 8c9c728757f89ebe6c4019114b83a63c63596f69 Mon Sep 17 00:00:00 2001
>   From: "Hongjun.Yang" <hongjun.yang@windriver.com>
> -Date: Wed, 22 Oct 2014 10:02:48 +0800
> +Date: Wed, 2 Oct 2019 16:57:06 -0400
>   Subject: [PATCH] Add ptest for tcpdump
>   
>   Upstream-Status: Pending
>   
>   Signed-off-by: Hongjun.Yang <hongjun.yang@windriver.com>
> +Signed-off-by: Peiran Hong <peiran.hong@windriver.com>
>   
>   ---
>    Makefile.in | 10 +++++++++-
>    1 file changed, 9 insertions(+), 1 deletion(-)
>   
>   diff --git a/Makefile.in b/Makefile.in
> -index 0941f0e..3ce40c6 100644
> +index 3b589184..7b10e38c 100644
>   --- a/Makefile.in
>   +++ b/Makefile.in
>   @@ -437,9 +437,17 @@ distclean:
> @@ -23,7 +24,7 @@ index 0941f0e..3ce40c6 100644
>   +buildtest-TESTS: tcpdump
>   +
>   +runtest-PTEST:
> - 	(cd tests && ./TESTrun.sh)
> +	(mkdir -p tests && SRCDIR=`cd ${srcdir}; pwd` && export SRCDIR && $$SRCDIR/tests/TESTrun.sh )
>    
>   +install-ptest:
>   +	cp -r tests                     $(DESTDIR)
> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/avoid-absolute-path-when-searching-for-libdlpi.patch b/meta-networking/recipes-support/tcpdump/tcpdump/avoid-absolute-path-when-searching-for-libdlpi.patch
> index d82c16053..977ab95b7 100644
> --- a/meta-networking/recipes-support/tcpdump/tcpdump/avoid-absolute-path-when-searching-for-libdlpi.patch
> +++ b/meta-networking/recipes-support/tcpdump/tcpdump/avoid-absolute-path-when-searching-for-libdlpi.patch
> @@ -1,6 +1,6 @@
> -From a2bfd28034d9aa48d8ff109c1314e53bc9779752 Mon Sep 17 00:00:00 2001
> +From 02085028cdaf075943c27ebc02bb6de0289ec1d3 Mon Sep 17 00:00:00 2001
>   From: Andre McCurdy <armccurdy@gmail.com>
> -Date: Wed, 24 Oct 2018 22:26:08 -0700
> +Date: Wed, 2 Oct 2019 16:43:48 -0400
>   Subject: [PATCH] avoid absolute path when searching for libdlpi
>   
>   Let the build environment control library search paths.
> @@ -8,15 +8,16 @@ Let the build environment control library search paths.
>   Upstream-Status: Inappropriate [OE specific]
>   
>   Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> +Signed-off-by: Peiran Hong <peiran.hong@windriver.com>
>   ---
> - configure.in | 2 +-
> + configure.ac | 2 +-
>    1 file changed, 1 insertion(+), 1 deletion(-)
>   
> -diff --git a/configure.in b/configure.in
> -index c882909..52aefd6 100644
> ---- a/configure.in
> -+++ b/configure.in
> -@@ -542,7 +542,7 @@ don't.])
> +diff --git a/configure.ac b/configure.ac
> +index 3401a7a3..6a52485a 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -528,7 +528,7 @@ don't.])
>    fi
>    
>    # libdlpi is needed for Solaris 11 and later.
> @@ -26,5 +27,5 @@ index c882909..52aefd6 100644
>    dnl
>    dnl Check for "pcap_list_datalinks()", "pcap_set_datalink()",
>   --
> -1.9.1
> +2.17.1
>   
> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/run-ptest b/meta-networking/recipes-support/tcpdump/tcpdump/run-ptest
> index c03a8b8ef..2bfb2267d 100755
> --- a/meta-networking/recipes-support/tcpdump/tcpdump/run-ptest
> +++ b/meta-networking/recipes-support/tcpdump/tcpdump/run-ptest
> @@ -1,5 +1,5 @@
>   #!/bin/sh
>   make -k runtest-PTEST | sed -e '/: passed/ s/^/PASS: /g' \
> -			-e '/: failed/ s/^/FAIL: /g' \
> +			-e '/: TEST FAILED.*/ s/^/FAIL: /g' \
>   			-e 's/: passed//g' \
> -			-e 's/: failed//g'
> +			-e 's/: TEST FAILED.*//g'
> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/unnecessary-to-check-libpcap.patch b/meta-networking/recipes-support/tcpdump/tcpdump/unnecessary-to-check-libpcap.patch
> index 69d68baac..8793bf7a3 100644
> --- a/meta-networking/recipes-support/tcpdump/tcpdump/unnecessary-to-check-libpcap.patch
> +++ b/meta-networking/recipes-support/tcpdump/tcpdump/unnecessary-to-check-libpcap.patch
> @@ -15,15 +15,16 @@ Upstream-Status: Inappropriate [OE specific]
>   
>   Signed-off-by: Roy Li <rongqing.li@windriver.com>
>   Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> +Signed-off-by: Peiran Hong <peiran.hong@windriver.com>
>   ---
> - configure.in | 4 +++-
> + configure.ac | 4 +++-
>    1 file changed, 3 insertions(+), 1 deletion(-)
>   
> -diff --git a/configure.in b/configure.in
> -index b2305a5..c882909 100644
> ---- a/configure.in
> -+++ b/configure.in
> -@@ -418,7 +418,9 @@ dnl Some platforms may need -lnsl for getrpcbynumber.
> +diff --git a/configure.ac b/configure.ac
> +index 56e2a624..3401a7a3 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -404,7 +404,9 @@ dnl Some platforms may need -lnsl for getrpcbynumber.
>    AC_SEARCH_LIBS(getrpcbynumber, nsl,
>        AC_DEFINE(HAVE_GETRPCBYNUMBER, 1, [define if you have getrpcbynumber()]))
>    
> @@ -35,5 +36,5 @@ index b2305a5..c882909 100644
>    #
>    # Check for these after AC_LBL_LIBPCAP, so we link with the appropriate
>   --
> -1.9.1
> +2.17.1
>   
> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.9.2.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb
> similarity index 74%
> rename from meta-networking/recipes-support/tcpdump/tcpdump_4.9.2.bb
> rename to meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb
> index 9bd861cd4..3cd12aee7 100644
> --- a/meta-networking/recipes-support/tcpdump/tcpdump_4.9.2.bb
> +++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb
> @@ -6,17 +6,21 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1d4b0366557951c84a94fabe3529f867"
>   
>   DEPENDS = "libpcap"
>   
> +RDEPENDS_${PN}-ptest += " make perl \
> +	perl-module-file-basename \
> +	perl-module-posix \
> +	perl-module-carp"
> +
>   SRC_URI = " \
>       http://www.tcpdump.org/release/${BP}.tar.gz \
>       file://unnecessary-to-check-libpcap.patch \
>       file://avoid-absolute-path-when-searching-for-libdlpi.patch \
>       file://add-ptest.patch \
>       file://run-ptest \
> -    file://0001-CVE-2017-16808-AoE-Add-a-missing-bounds-check.patch \
>   "
>   
> -SRC_URI[md5sum] = "9bbc1ee33dab61302411b02dd0515576"
> -SRC_URI[sha256sum] = "798b3536a29832ce0cbb07fafb1ce5097c95e308a6f592d14052e1ef1505fe79"
> +SRC_URI[md5sum] = "a4ead41d371f91aa0a2287f589958bae"
> +SRC_URI[sha256sum] = "2cd47cb3d460b6ff75f4a9940f594317ad456cfbf2bd2c8e5151e16559db6410"
>   
>   inherit autotools-brokensep ptest
>   
> @@ -25,6 +29,8 @@ PACKAGECONFIG ?= "openssl"
>   PACKAGECONFIG[libcap-ng] = "--with-cap-ng,--without-cap-ng,libcap-ng"
>   PACKAGECONFIG[openssl] = "--with-crypto,--without-openssl --without-crypto,openssl"
>   PACKAGECONFIG[smi] = "--with-smi,--without-smi,libsmi"
> +# Note: CVE-2018-10103 (SMB - partially fixed, but SMB printing disabled)
> +PACKAGECONFIG[smb] = "--enable-smb,--disable-smb"
>   
>   EXTRA_AUTORECONF += "-I m4"
>   
> 


-- 
# Randy MacLeod
# Wind River Linux

