Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BE8F973D29
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Aug 2015 05:39:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t745cpZF009431
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 3 Aug 2015 22:38:51 -0700 (PDT)
Received: from [128.224.163.137] (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.235.1;
	Mon, 3 Aug 2015 22:38:50 -0700
Message-ID: <55C04FE7.2040608@windriver.com>
Date: Tue, 4 Aug 2015 13:38:47 +0800
From: Yi Zhao <yi.zhao@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Rongqing Li <rongqing.li@windriver.com>
References: <1437723785-7137-1-git-send-email-lixin.fnst@cn.fujitsu.com>	<55BF30F6.7070000@windriver.com>
	<A8FC939F80655644A89BB21CCD3741E8011BCB2E96@G08CNEXMBPEKD03.g08.fujitsu.local>
	<A8FC939F80655644A89BB21CCD3741E8011BCB4F28@G08CNEXMBPEKD03.g08.fujitsu.local>
In-Reply-To: <A8FC939F80655644A89BB21CCD3741E8011BCB4F28@G08CNEXMBPEKD03.g08.fujitsu.local>
X-Originating-IP: [128.224.163.137]
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] numactl: upgrade 2.0.9 -> 2.0.10
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
X-List-Received-Date: Tue, 04 Aug 2015 05:39:02 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Add Rongqing Li to the list.  The initial ptest was added by him.

Hi Roy,

Would you please have a look at Li Xin's patch ?

Thanks,
Yi


在 2015年08月04日 13:17, Li, Xin 写道:
> Hi, Yi,
>
> I am unfamiliar with ptest.
> Since binaries in test directory have been changed by default in 2.0.10
> So how about the modify as following:
> -----------------------------------------------------
> diff --git a/meta-oe/recipes-support/numactl/numactl_2.0.10.bb b/meta-oe/recipes-support/numactl/numactl_2.0.10.bb
> index 3a10ebb..148a44b 100644
> --- a/meta-oe/recipes-support/numactl/numactl_2.0.10.bb
> +++ b/meta-oe/recipes-support/numactl/numactl_2.0.10.bb
> @@ -30,10 +30,8 @@ do_install() {
>
>   do_install_ptest() {
>          #install tests binaries
> -        local test_binaries="checkaffinity checktopology distance      \
> -               ftok mbind_mig_pages migrate_pages move_pages mynode    \
> -               nodemap pagesize prefered printcpu randmap realloc_test \
> -               regress regress2 runltp shmtest tbitmap tshared bind_range"
> +        local test_binaries="checkaffinity checktopology \
> +               numademo printcpu regress regress2 runltp shmtest"
>
>          [ ! -d ${D}/${PTEST_PATH}/test ] && mkdir -p ${D}/${PTEST_PATH}/test
>          for i in $test_binaries; do
> ----------------------------------------------------
>
> Cheers,
> Li
>
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org
>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of Li,
>> Xin
>> Sent: Tuesday, August 04, 2015 10:18 AM
>> To: Yi Zhao
>> Cc: openembedded-devel@lists.openembedded.org
>> Subject: Re: [oe] [meta-oe][PATCH] numactl: upgrade 2.0.9 -> 2.0.10
>>
>> Hi, Yi,
>>
>> Thank you very much for doing test for me.
>> I can reproduce the error.
>> Patch V2 will be sent.
>>
>> Cheers,
>> Li
>>> -----Original Message-----
>>> From: Yi Zhao [mailto:yi.zhao@windriver.com]
>>> Sent: Monday, August 03, 2015 5:15 PM
>>> To: Li, Xin/李 欣
>>> Cc: openembedded-devel@lists.openembedded.org
>>> Subject: Re: [oe] [meta-oe][PATCH] numactl: upgrade 2.0.9 -> 2.0.10
>>>
>>> Hi,
>>>
>>> I got an error for do_install_ptest_base:
>>>
>>> ERROR: Function failed: do_install_ptest_base (log file is located at
>>> /buildarea2/build/tmp/work/core2-64-poky-linux/numactl/2.0.10-r0/temp/l
>>> og.do_ins
>>> tall_ptest_base.25330)
>>> ERROR: Logfile of failure stored in:
>>> /buildarea2/build/tmp/work/core2-64-poky-linux/numactl/2.0.10-r0/temp/l
>>> og.do_ins
>>> tall_ptest_base.25330
>>> Log data follows:
>>> | DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc',
>>> 'bit-64', 'x86_64-linux', 'common']
>>> | DEBUG: Executing shell function do_install_ptest_base
>>> | install: cannot stat
>>> '/buildarea2/build/tmp/work/core2-64-poky-linux/numactl/2.0.10-r0/numac
>>> tl-2.0.10
>>> /test/distance':
>>> No such file or directory
>>> | WARNING:
>>> /buildarea2/build/tmp/work/core2-64-poky-linux/numactl/2.0.10-r0/temp/r
>>> un.do_in
>>> stall_ptest_base.25330:1
>>> exit 1 from
>>> |   install -m 0755
>>> /buildarea2/build/tmp/work/core2-64-poky-linux/numactl/2.0.10-r0/numact
>>> l-2.0.10/
>>> test/$i
>>> /buildarea2/build/tmp/work/core2-64-poky-linux/numactl/2.0.10-r0/image/
>>> usr/lib64
>>> /numactl/ptest/test
>>> | ERROR: Function failed: do_install_ptest_base (log file is located at
>>> /buildarea2/build/tmp/work/core2-64-poky-linux/numactl/2.0.10-r0/temp/l
>>> og.do_ins
>>> tall_ptest_base.25330)
>>> ERROR: Task 2
>>> (/buildarea/poky/meta-openembedded/meta-oe/recipes-support/numactl/numa
>>> ctl_
>>> 2.0.10.bb,
>>> do_install_ptest_base) failed with exit code '1'
>>> NOTE: Tasks Summary: Attempted 557 tasks of which 507 didn't need to be
>>> rerun and 1 failed.
>>> Waiting for 0 running tasks to finish:
>>>
>>>
>>> Thanks,
>>> Yi
>>>
>>>
>>> 在 2015年07月24日 15:43, Li xin 写道:
>>>> 1) Update Fix-the-test-output-format.patch,since the contents has
>>>> been changed.
>>>>
>>>> 2) Update the checksum, beginline and endline of LICENSE file, but
>>>> the LICENSE has not been changed.
>>>>
>>>> 3) Remove "libdir=${D}/${libdir}" to avoid build Warning:
>>>> QA Issue: numactl: Files/directories were installed but not shipped
>>>> in any package
>>>>
>>>> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
>>>> ---
>>>>    .../numactl/Fix-the-test-output-format.patch       | 41
>>> ++++++++++++----------
>>>>    .../{numactl_2.0.9.bb => numactl_2.0.10.bb}        |  8 ++---
>>>>    2 files changed, 27 insertions(+), 22 deletions(-)
>>>>    rename meta-oe/recipes-support/numactl/{numactl_2.0.9.bb =>
>>>> numactl_2.0.10.bb} (80%)
>>>>
>>>> diff --git
>>>> a/meta-oe/recipes-support/numactl/numactl/Fix-the-test-output-format.
>>>> p
>>>> atch
>>>> b/meta-oe/recipes-support/numactl/numactl/Fix-the-test-output-format.
>>>> p
>>>> atch
>>>> index 8c309a4..7d52503 100644
>>>> ---
>>>> a/meta-oe/recipes-support/numactl/numactl/Fix-the-test-output-format.
>>>> p
>>>> atch
>>>> +++ b/meta-oe/recipes-support/numactl/numactl/Fix-the-test-output-for
>>>> +++ m
>>>> +++ at.patch
>>>> @@ -1,26 +1,30 @@
>>>> -[PATCH] Fix the test output format
>>>> +From 59fd750a84bbe5874dec936d2bee9ef11a1b6505 Mon Sep 17 00:00:00
>>>> +2001
>>>> +From: Li xin <lixin.fnst@cn.fujitsu.com>
>>>> +Date: Tue, 21 Jul 2015 02:01:22 +0900
>>>> +Subject: [PATCH] Fix the test output format
>>>>
>>>>    Upstream-Status: Pending
>>>>
>>>>    Signed-off-by: Roy Li <rongqing.li@windriver.com>
>>>> +Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
>>>>    ---
>>>> - test/regress  |    6 +++---
>>>> - test/regress2 |    9 ++++-----
>>>> - 2 files changed, 7 insertions(+), 8 deletions(-)
>>>> + test/regress  |  6 +++---
>>>> + test/regress2 | 11 +++++------
>>>> + 2 files changed, 8 insertions(+), 9 deletions(-)
>>>>
>>>>    diff --git a/test/regress b/test/regress -index 05eff5b..10d72f7
>>>> 100755
>>>> +index 2ce1705..d086a47 100755
>>>>    --- a/test/regress
>>>>    +++ b/test/regress
>>>> -@@ -73,6 +73,7 @@ probe_hardware()
>>>> +@@ -74,6 +74,7 @@ probe_hardware()
>>>>     	if [ $numnodes -lt 2 ] ; then
>>>>     	    echo "need at least two nodes with at least $NEEDPAGES each of"
>>>>     	    echo "free memory for mempolicy regression tests"
>>>>    +	    echo "FAIL: numa regress"
>>>> - 	    exit 1
>>>> +	    exit 77  # Skip test
>>>>     	fi
>>>>     }
>>>> -@@ -206,10 +207,9 @@ main()
>>>> +@@ -207,10 +208,9 @@ main()
>>>>     	rm A B
>>>>
>>>>     	if [ "$EXIT" = 0 ] ; then
>>>> @@ -34,26 +38,27 @@ index 05eff5b..10d72f7 100755
>>>>     }
>>>>
>>>>    diff --git a/test/regress2 b/test/regress2 -index 6a254fa..9c97943
>>>> 100755
>>>> +index aa6ea41..450c510 100755
>>>>    --- a/test/regress2
>>>>    +++ b/test/regress2
>>>> -@@ -6,12 +6,11 @@ VALGRIND=${VALGRIND:-}
>>>> - export LD_LIBRARY_PATH=`pwd`/..
>>>> +@@ -9,12 +9,11 @@ testdir=`dirname "$0"`  export
>>>> +PATH=${builddir}:$PATH
>>>>
>>>>     T() {
>>>>    -       echo "$@"
>>>>    -       if ! $VALGRIND "$@" ;  then
>>>>    -	  echo	$1 FAILED!!!!
>>>>    -	  exit 1
>>>> -+       if ! $VALGRIND "$@" 2>&1 1>/dev/null;  then
>>>> -+	  echo	"FAIL: $1"
>>>> -+       else
>>>> -+	  echo "PASS: $1"
>>>> -        fi
>>>> +-       fi
>>>>    -       echo
>>>> ++	if ! $VALGRIND "$@" 2>&1 1>/dev/null;  then
>>>> ++	   echo  "FAIL: $1"
>>>> ++	else
>>>> ++	   echo "PASS: $1"
>>>> ++	fi
>>>>     }
>>>>
>>>> - # various tests
>>>> + # still broken
>>>>    --
>>>> -1.7.10.4
>>>> +1.8.4.2
>>>>
>>>> diff --git a/meta-oe/recipes-support/numactl/numactl_2.0.9.bb
>>>> b/meta-oe/recipes-support/numactl/numactl_2.0.10.bb
>>>> similarity index 80%
>>>> rename from meta-oe/recipes-support/numactl/numactl_2.0.9.bb
>>>> rename to meta-oe/recipes-support/numactl/numactl_2.0.10.bb
>>>> index 29e57d9..3a10ebb 100644
>>>> --- a/meta-oe/recipes-support/numactl/numactl_2.0.9.bb
>>>> +++ b/meta-oe/recipes-support/numactl/numactl_2.0.10.bb
>>>> @@ -8,9 +8,7 @@ RDEPENDS_${PN} = "perl"
>>>>
>>>>    inherit autotools-brokensep ptest
>>>>
>>>> -LIC_FILES_CHKSUM =
>>> "file://README;beginline=19;endline=32;md5=5644cc3851cb2499f6c48e52fe19
>>> 8bd
>>> 9"
>>>> -SRC_URI[md5sum] = "136685c8eaf9d6569c351fe1d453b30c"
>>>> -SRC_URI[sha256sum] =
>>> "9ca033e6c14c0f26c20379b0cf9299429fd5a354a79c3c7880fd41ef69f7751c"
>>>> +LIC_FILES_CHKSUM =
>>> "file://README;beginline=19;endline=32;md5=00b9fb4504ff2afcb7fb2a518780f412
>> "
>>>>    SRC_URI =
>>> "ftp://oss.sgi.com/www/projects/libnuma/download/${BPN}-${PV}.tar.gz \
>>>>    	   file://fix-null-pointer.patch \ @@ -18,12 +16,14 @@ SRC_URI =
>>> "ftp://oss.sgi.com/www/projects/libnuma/download/${BPN}-${PV}.tar.gz \
>>>>    	   file://Makefile \
>>>>    	   file://run-ptest \
>>>>              "
>>>> +SRC_URI[md5sum] = "682c38305b2596967881f3d77bc3fc9c"
>>>> +SRC_URI[sha256sum] =
>>> "dbdac8fe74f13b2e2864bba352f1597ab1d3345c8c485d7805f58d66f414db61"
>>>>    # ARM does not currently support NUMA
>>>>    COMPATIBLE_HOST = "^((?!arm).*)$"
>>>>
>>>>    do_install() {
>>>> -        oe_runmake DESTDIR=${D} prefix=${D}/usr libdir=${D}/${libdir} install
>>>> +        oe_runmake DESTDIR=${D} prefix=${D}/usr install
>>>>    	#remove the empty man2 directory
>>>>    	rm -r ${D}${mandir}/man2
>>>>    }
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


