Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D30CB76AC4;
	Wed, 30 Sep 2015 02:32:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8U2Wxxs001265
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 29 Sep 2015 19:32:59 -0700 (PDT)
Received: from [128.224.162.211] (128.224.162.211) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.235.1;
	Tue, 29 Sep 2015 19:32:58 -0700
Message-ID: <560B49E0.8080004@windriver.com>
Date: Wed, 30 Sep 2015 10:33:04 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: akuster <akuster@mvista.com>, <openembedded-devel@lists.openembedded.org>, 
	<openembedded-commits@lists.openembedded.org>
References: <20150917150451.AD524502CC@opal.openembedded.org>
	<560A28F9.7020402@windriver.com> <560AB662.2090707@mvista.com>
In-Reply-To: <560AB662.2090707@mvista.com>
X-Originating-IP: [128.224.162.211]
Subject: Re: [oe-commits] Armin Kuster : netmap: add new package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Sep 2015 02:33:00 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/30/2015 12:03 AM, akuster wrote:
> Chen Qi,
>
>   It looks like "NETMAP_LINUX_IXGBE_DESC" needs to be defined. Supported
> values are 1-3.
>
> That variable can be appended to ${S}/LINUX/netmap_linux_config.h. Maybe
> it needs to be added to the recipe?

I tried these three values. None of them work.

>
> if not try add to the EXTRA_OECONF:
>
> --no-drivers=       do not compile the given drivers (comma sep.)
> or
> --drivers=          only compile the given drivers (comma sep.)

EXTRA_OECONF += "--no-drivers=ixgbe"
The above configuration works.

Best Regards,
Chen Qi

> Let me know what works.
>
> regards,
> Armin
>
>
> On 09/28/2015 11:00 PM, ChenQi wrote:
>> Hi Armin,
>>
>> I found that if CONFIG_IXGBE is enabled in kernel. This package fails to
>> build with error messages like below.
>>
>> |  #error "unsupported ixgbe driver version"
>> |   ^
>>
>> .......
>> .......
>>
>> error: request for member 'count' in something not a structure or union
>> |   na.num_rx_desc = NM_IXGBE_RX_RING(adapter, 0)->count;
>> |                                                ^
>> | cc1: some warnings being treated as errors
>>
>>
>> Do you have any idea how to fix it? Thanks.
>>
>> Best Regards,
>> Chen Qi
>>
>> On 09/17/2015 11:04 PM, git@opal.openembedded.org wrote:
>>> Module: meta-openembedded.git
>>> Branch: master-next
>>> Commit: 1692d5c3020434404fc1ee6911a60b88287a5efb
>>> URL:
>>> http://git.openembedded.org/?p=meta-openembedded.git&a=commit;h=1692d5c3020434404fc1ee6911a60b88287a5efb
>>>
>>>
>>> Author: Armin Kuster <akuster@mvista.com>
>>> Date:   Sun Aug  9 05:56:30 2015 +0530
>>>
>>> netmap: add new package
>>>
>>> this adds netmap, the fast packet I/O framework
>>> http://info.iet.unipi.it/~luigi/netmap/
>>>
>>>       - updated to latest version to get kernel 4.1 support
>>>       - fixed printf type issue
>>>       - Fixed manual config options
>>>
>>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
>>>
>>> ---
>>>
>>>    ...1-testmmap-fix-compile-issue-with-gcc-5.x.patch | 33 ++++++++
>>>    .../netmap/files/makefile_fixup.patch              | 97
>>> ++++++++++++++++++++++
>>>    .../recipes-kernel/netmap/netmap-modules_git.bb    | 57 +++++++++++++
>>>    meta-networking/recipes-kernel/netmap/netmap.inc   | 17 ++++
>>>    .../recipes-kernel/netmap/netmap_git.bb            | 35 ++++++++
>>>    5 files changed, 239 insertions(+)
>>>
>>> diff --git
>>> a/meta-networking/recipes-kernel/netmap/files/0001-testmmap-fix-compile-issue-with-gcc-5.x.patch
>>> b/meta-networking/recipes-kernel/netmap/files/0001-testmmap-fix-compile-issue-with-gcc-5.x.patch
>>>
>>> new file mode 100644
>>> index 0000000..ea36b1c
>>> --- /dev/null
>>> +++
>>> b/meta-networking/recipes-kernel/netmap/files/0001-testmmap-fix-compile-issue-with-gcc-5.x.patch
>>>
>>> @@ -0,0 +1,33 @@
>>> +Upstream-Status: Pending
>>> +
>>> +From c81bf54d6eb870286662a11d3b4a994717c47696 Mon Sep 17 00:00:00 2001
>>> +From: Armin Kuster <akuster808@gmail.com>
>>> +Date: Tue, 8 Sep 2015 05:36:27 -0700
>>> +Subject: [PATCH] testmmap: fix compile issue with gcc 5.x
>>> +
>>> +this fixes:
>>> +examples/testmmap.c:540:10: error: format '%ld' expects argument of
>>> type 'long int', but argument 3 has type 'ssize_t {aka const int}'
>>> [-Werror=format=]
>>> +|    printf("ring_ofs[%d] %ld\n", i, nifp->ring_ofs[i]);
>>> +|           ^
>>> +
>>> +Signed-off-by: Armin Kuster <akuster808@gmail.com>
>>> +---
>>> + examples/testmmap.c | 2 +-
>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>> +
>>> +diff --git a/examples/testmmap.c b/examples/testmmap.c
>>> +index d7f6acc..934489a 100644
>>> +--- a/examples/testmmap.c
>>> ++++ b/examples/testmmap.c
>>> +@@ -537,7 +537,7 @@ do_if()
>>> +     for (i = 0; i < 5; i++)
>>> +         printf("spare1[%d]  %u\n", i, nifp->ni_spare1[i]);
>>> +     for (i = 0; i < (nifp->ni_tx_rings + nifp->ni_rx_rings + 2); i++)
>>> +-        printf("ring_ofs[%d] %ld\n", i, nifp->ring_ofs[i]);
>>> ++        printf("ring_ofs[%d] %zd\n", i, nifp->ring_ofs[i]);
>>> + }
>>> +
>>> + struct netmap_ring *
>>> +--
>>> +2.3.5
>>> +
>>> diff --git
>>> a/meta-networking/recipes-kernel/netmap/files/makefile_fixup.patch
>>> b/meta-networking/recipes-kernel/netmap/files/makefile_fixup.patch
>>> new file mode 100644
>>> index 0000000..b050bf0
>>> --- /dev/null
>>> +++ b/meta-networking/recipes-kernel/netmap/files/makefile_fixup.patch
>>> @@ -0,0 +1,97 @@
>>> +The makefile assumes building locally.
>>> +
>>> +Upstream Status: Inappropriate [Native]
>>> +
>>> +The configure is not auto-make based
>>> +
>>> +Signed-of-by: Armin Kuster <akuster@mvista.com>
>>> +
>>> +Index: LINUX/netmap.mak.in
>>> +===================================================================
>>> +--- a/LINUX/netmap.mak.in
>>> ++++ b/LINUX/netmap.mak.in
>>> +@@ -12,10 +12,9 @@ SRCDIR:=@SRCDIR@
>>> + # The following commands are needed to build the modules as
>>> out-of-tree,
>>> + # in fact the kernel sources path must be specified.
>>> +
>>> +-PWD ?= $(CURDIR)
>>> +
>>> + # Additional compile flags (e.g. header location)
>>> +-EXTRA_CFLAGS := -I$(PWD) -I$(SRCDIR) -I$(SRCDIR)/../sys
>>> -I$(SRCDIR)/../sys/dev -DCONFIG_NETMAP
>>> ++EXTRA_CFLAGS := -I$(SRCDIR) -I$(SRCDIR)/../sys
>>> -I$(SRCDIR)/../sys/dev -DCONFIG_NETMAP
>>> + EXTRA_CFLAGS += -Wno-unused-but-set-variable
>>> + EXTRA_CFLAGS += $(foreach s,$(SUBSYS),-DCONFIG_NETMAP_$(shell echo
>>> $s|tr a-z- A-Z_))
>>> +
>>> +Index: LINUX/configure
>>> +===================================================================
>>> +--- a/LINUX/configure
>>> ++++ b/LINUX/configure
>>> +@@ -349,52 +349,6 @@ reset_tests() {
>>> +     EOF
>>> + }
>>> +
>>> +-# run_tests: run all accumulated tests and exec the pertinent
>>> +-#   success/failure actions for each one.
>>> +-run_tests() {
>>> +-    local t=     # prevent -EOF to eat the make TAB
>>> +-    cat > $TMPDIR/Makefile <<-EOF
>>> +-        ifneq (\$(KERNELRELEASE),)
>>> +-        obj-m := $TESTOBJS
>>> +-        else
>>> +-        S_DRIVERS := $(drv print)
>>> +-        all: \$(S_DRIVERS:%=get-%)
>>> +-        $t    \$(MAKE) -C $ksrc M=\$\$PWD $kopts
>>> +-
>>> +-        -include $TOPDIR/drivers.mak
>>> +-    EOF
>>> +-    for d in $(drv print); do
>>> +-        cat >> $TMPDIR/Makefile <<-EOF
>>> +-            get-$d:
>>> +-            $t    [ -z "\$($d-src)" ] || cp -Rp \$($d-src) \$(if
>>> \$($d-dst),\$($d-dst),.)
>>> +-            $t    touch get-$d
>>> +-        EOF
>>> +-    done
>>> +-    echo endif >> $TMPDIR/Makefile
>>> +-    {
>>> +-        cat <<-EOF
>>> +-##############################################################################
>>>
>>> +-## BEGIN RUNNING TESTS: $(date)
>>> +-##############################################################################
>>>
>>> +-## Makefile:
>>> +-        EOF
>>> +-        cat $TMPDIR/Makefile
>>> +-        cat <<-EOF
>>> +-##############################################################################
>>>
>>> +-        EOF
>>> +-    } >> config.log
>>> +-    (
>>> +-        cd $TMPDIR
>>> +-        make -k -j $(grep -c processor /proc/cpuinfo)
>>> +-    ) >> config.log
>>> +-    eval "$TESTPOSTPROC"
>>> +-    cat >> config.log <<-EOF
>>> +-##############################################################################
>>>
>>> +-## END RUNNING TESTS: $(date)
>>> +-##############################################################################
>>>
>>> +-    EOF
>>> +-}
>>> +-
>>> + configh=netmap_linux_config.h
>>> + # succes/failure actions are expected to write some macros
>>> + # in netma_linux_config.h. The following functions can be
>>> +@@ -619,7 +573,6 @@ configuration. Please check 'config.log'
>>> + reset_tests
>>> + rm -f drivers.mak
>>> + add_test true broken_buildsystem < /dev/null
>>> +-run_tests
>>> +
>>> + drvname2config() {
>>> +     local name=$1
>>> +@@ -1280,7 +1233,6 @@ cat > $configh <<-EOF
>>> + EOF
>>> +
>>> + # the TESTPOSTPROC script will add macros to $configh
>>> +-run_tests
>>> +
>>> + define DRIVER_SUFFIX \"$drvsuffix\"
>>> +
>>> diff --git
>>> a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
>>> b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
>>> new file mode 100644
>>> index 0000000..f9ac9cc
>>> --- /dev/null
>>> +++ b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
>>> @@ -0,0 +1,57 @@
>>> +require netmap.inc
>>> +
>>> +DEPENDS = "virtual/kernel"
>>> +do_configure[depends] += "virtual/kernel:do_shared_workdir"
>>> +
>>> +inherit module
>>> +
>>> +CLEANBROKEN = "1"
>>> +
>>> +export INSTALL_MOD_DIR="kernel/netmap-modules"
>>> +
>>> +EXTRA_OECONF = "--kernel-dir=${STAGING_KERNEL_BUILDDIR} \
>>> +                --kernel-sources=${STAGING_KERNEL_DIR} \
>>> +                --install-mod-path=${D} \
>>> +                --driver-suffix="-netmap" \
>>> +                "
>>> +
>>> +LDFLAGS := "${@'${LDFLAGS}'.replace('-Wl,-O1', '')}"
>>> +LDFLAGS := "${@'${LDFLAGS}'.replace('-Wl,--as-needed', '')}"
>>> +
>>> +do_configure () {
>>> +    cd ${S}/LINUX
>>> +    ./configure ${EXTRA_OECONF}
>>> +}
>>> +
>>> +do_configure_append () {
>>> +    cat >>  ${S}/LINUX/netmap_linux_config.h <<EOF
>>> +#define NETMAP_LINUX_HAVE_HRTIMER_MODE_REL
>>> +#define NETMAP_LINUX_HAVE_HRTIMER_FORWARD_NOW
>>> +#define NETMAP_LINUX_HAVE_PHYS_ADDR_T
>>> +#define NETMAP_LINUX_HAVE_ACCESS_ONCE
>>> +#define NETMAP_LINUX_HAVE_NETDEV_OPS
>>> +#define NETMAP_LINUX_ALLOC_NETDEV_4ARGS
>>> +#define NETMAP_LINUX_HAVE_INIT_NET
>>> +#define NETMAP_LINUX_HAVE_LIVE_ADDR_CHANGE
>>> +#define NETMAP_LINUX_HAVE_TX_SKB_SHARING
>>> +#define NETMAP_LINUX_HAVE_UNLOCKED_IOCTL
>>> +#define NETMAP_LINUX_HAVE_PERNET_OPS_ID
>>> +#define NETMAP_LINUX_VIRTIO_FUNCTIONS
>>> +#define NETMAP_LINUX_VIRTIO_FREE_PAGES
>>> +#define NETMAP_LINUX_VIRTIO_GET_VRSIZE
>>> +#define NETMAP_LINUX_TIMER_RTYPE enum hrtimer_restart
>>> +#define NETMAP_LINUX_VIRTIO_MULTI_QUEUE
>>> +#define NETMAP_LINUX_HAVE_E1000E_EXT_RXDESC
>>> +#define NETMAP_LINUX_HAVE_E1000E_DOWN2
>>> +EOF
>>> +}
>>> +
>>> +do_compile () {
>>> +    cd ${S}/LINUX
>>> +    oe_runmake
>>> +}
>>> +
>>> +do_install () {
>>> +    cd ${S}/LINUX
>>> +    oe_runmake install
>>> +}
>>> diff --git a/meta-networking/recipes-kernel/netmap/netmap.inc
>>> b/meta-networking/recipes-kernel/netmap/netmap.inc
>>> new file mode 100644
>>> index 0000000..ab33e76
>>> --- /dev/null
>>> +++ b/meta-networking/recipes-kernel/netmap/netmap.inc
>>> @@ -0,0 +1,17 @@
>>> +SUMMARY = "netmap and VALE - very fast packet I/O from userspace
>>> (FreeBSD/Linux)"
>>> +DESCRIPTION= "NETMAP is a framework for very fast packet I/O from
>>> userspace.  VALE is an equally fast in-kernel software switch using
>>> the netmap API.  Both are implemented as a single kernel module for
>>> FreeBSD and Linux, and can deal with line rate on real or emulated 10
>>> Gbit ports."
>>> +SECTION = "networking"
>>> +HOMEPAGE = "http://code.google.com/p/netmap/"
>>> +LICENSE = "GPLv2+"
>>> +
>>> +LIC_FILES_CHKSUM =
>>> "file://README;beginline=13;endline=14;md5=56ae0b9c7ba0476ab9098de94c2714d6"
>>>
>>> +
>>> +SRCREV = "da9e19e69b84e4f6f8ae125f8d01b42a4abade6a"
>>> +PV = "master+git${SRCPV}"
>>> +
>>> +SRC_URI = "git://github.com/luigirizzo/netmap.git"
>>> +SRC_URI += "file://makefile_fixup.patch"
>>> +
>>> +S = "${WORKDIR}/git"
>>> +
>>> +COMPATIBLE_HOST = '(x86_64|i.86|mips|arm).*-linux'
>>> diff --git a/meta-networking/recipes-kernel/netmap/netmap_git.bb
>>> b/meta-networking/recipes-kernel/netmap/netmap_git.bb
>>> new file mode 100644
>>> index 0000000..f15a626
>>> --- /dev/null
>>> +++ b/meta-networking/recipes-kernel/netmap/netmap_git.bb
>>> @@ -0,0 +1,35 @@
>>> +require netmap.inc
>>> +
>>> +DEPENDS = "netmap-modules"
>>> +
>>> +EXTRA_OECONF = "--kernel-dir=${STAGING_KERNEL_BUILDDIR} \
>>> +                --kernel-sources=${STAGING_KERNEL_DIR} \
>>> +                --no-drivers \
>>> +                --disable-generic \
>>> +                --prefix=${prefix} \
>>> +                --destdir=${D} \
>>> +                --cc='${CC}' \
>>> +                --ld='${LD}' \
>>> +                "
>>> +SRC_URI += "file://0001-testmmap-fix-compile-issue-with-gcc-5.x.patch"
>>> +
>>> +do_fetch[depends] += "netmap-modules:do_fetch"
>>> +
>>> +do_configure () {
>>> +    cd ${S}/LINUX
>>> +    ./configure ${EXTRA_OECONF}
>>> +}
>>> +
>>> +do_compile () {
>>> +    cd ${S}/LINUX
>>> +    make apps
>>> +}
>>> +
>>> +do_install () {
>>> +    cd ${S}/LINUX
>>> +    make install-apps DESTDIR=${D}
>>> +}
>>> +
>>> +FILES_${PN} += "${bindir}"
>>> +RDEPENDS_${PN} = "kernel-module-netmap"
>>> +RRECOMMENDS_${PN} = "kernel-module-netmap"
>>>
>


