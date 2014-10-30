Return-Path: <Hongjun.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 36F9465DEB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Oct 2014 10:12:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9UACRgr017811
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Oct 2014 03:12:27 -0700 (PDT)
Received: from [128.224.162.164] (128.224.162.164) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 30 Oct 2014 03:12:26 -0700
Message-ID: <54520F04.90105@windriver.com>
Date: Thu, 30 Oct 2014 18:12:20 +0800
From: Yang Hongjun <Hongjun.Yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1413971847-8154-1-git-send-email-Hongjun.Yang@windriver.com>
	<20141030081123.GD15148@jama>
In-Reply-To: <20141030081123.GD15148@jama>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] tree: Add a new package
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
X-List-Received-Date: Thu, 30 Oct 2014 10:12:29 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2014年10月30日 16:11, Martin Jansa wrote:
> On Wed, Oct 22, 2014 at 05:57:27PM +0800, Hongjun Yang wrote:
>> From: "Hongjun.Yang" <hongjun.yang@windriver.com>
>>
>> Add tree command, some test scripts need it.
> Fails
>
> qemuarm:
> ERROR: objcopy failed with exit code 256 (cmd was 'arm-oe-linux-gnueabi-objcopy' --only-keep-debug '/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/tree/1.7.0-r0/package/usr/bin/tree' '/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/tree/1.7.0-r0/package/usr/bin/.debug/tree'):
> arm-oe-linux-gnueabi-objcopy:/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/tree/1.7.0-r0/package/usr/bin/tree: File format not recognized
> ERROR: Function failed: split_and_strip_files
> ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/tree/1.7.0-r0/temp/log.do_package.4732
> NOTE: recipe tree-1.7.0-r0: task do_package: Failed
> ERROR: Task 2994 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/tree/tree_1.7.0.bb, do_package) failed with exit code '1'
>
> qemux86:
> NOTE: recipe tree-1.7.0-r0: task do_package_qa: Started
> NOTE: recipe gnome-system-monitor-2.28.2-r2: task do_rm_work_all: Started
> ERROR: QA Issue: Architecture did not match (3 to 62) on /work/i586-oe-linux/tree/1.7.0-r0/packages-split/tree-dbg/usr/bin/.debug/tree [arch]
> NOTE: recipe gnome-system-monitor-2.28.2-r2: task do_rm_work_all: Succeeded
> NOTE: Running task 28653 of 30030 (ID: 2991, /home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/guile/guile_2.0.11.bb, do_populate_lic)
> ERROR: QA Issue: Architecture did not match (3 to 62) on /work/i586-oe-linux/tree/1.7.0-r0/packages-split/tree/usr/bin/tree [arch]
> WARNING: QA Issue: tree requires libc.so.6()(64bit), libc.so.6(GLIBC_2.2.5)(64bit), libc.so.6(GLIBC_2.4)(64bit), libc.so.6(GLIBC_2.3)(64bit), but no providers in its RDEPENDS [file-rdeps]
> ERROR: QA run found fatal errors. Please consider fixing them.
> ERROR: Function failed: do_package_qa
> ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/tree/1.7.0-r0/temp/log.do_package_qa.2106
> NOTE: recipe tree-1.7.0-r0: task do_package_qa: Failed
> ERROR: Task 3008 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/tree/tree_1.7.0.bb, do_package_qa) failed with exit code '1'
>
>> Signed-off-by: Hongjun.Yang <hongjun.yang@windriver.com>
>>
>> ---
>>   .../tree/tree-1.7.0/fix-cross-env.patch            | 32 ++++++++++++++++++++++
>>   meta-oe/recipes-support/tree/tree_1.7.0.bb         | 16 +++++++++++
>>   2 files changed, 48 insertions(+)
>>   create mode 100644 meta-oe/recipes-support/tree/tree-1.7.0/fix-cross-env.patch
>>   create mode 100644 meta-oe/recipes-support/tree/tree_1.7.0.bb
>>
>> diff --git a/meta-oe/recipes-support/tree/tree-1.7.0/fix-cross-env.patch b/meta-oe/recipes-support/tree/tree-1.7.0/fix-cross-env.patch
>> new file mode 100644
>> index 0000000..ccdf635
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/tree/tree-1.7.0/fix-cross-env.patch
>> @@ -0,0 +1,32 @@
>> +From 7ad835ae0c2b2b311002fda0be2dbf8f17c5a3d5 Mon Sep 17 00:00:00 2001
>> +From: "Hongjun.Yang" <hongjun.yang@windriver.com>
>> +Date: Wed, 22 Oct 2014 11:05:35 +0800
>> +Subject: [PATCH] fix the install path change the install path for cross
>> + compile environment.
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Hongjun.Yang <hongjun.yang@windriver.com>
>> +---
>> + Makefile | 4 ++--
>> + 1 file changed, 2 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/Makefile b/Makefile
>> +index e91f1f6..776f1f3 100644
>> +--- a/Makefile
>> ++++ b/Makefile
>> +@@ -22,9 +22,9 @@ CC=gcc
>> +
>> + VERSION=1.7.0
>> + TREE_DEST=tree
>> +-BINDIR=${prefix}/bin
>> ++BINDIR=${DESTDIR}/${prefix}/bin
>> + MAN=tree.1
>> +-MANDIR=${prefix}/man/man1
>> ++MANDIR=${DESTDIR}/${prefix}/man/man1
>> + OBJS=tree.o unix.o html.o xml.o json.o hash.o color.o
>> +
>> + # Uncomment options below for your particular OS:
>> +--
>> +1.9.1
>> +
>> diff --git a/meta-oe/recipes-support/tree/tree_1.7.0.bb b/meta-oe/recipes-support/tree/tree_1.7.0.bb
>> new file mode 100644
>> index 0000000..b7fc43b
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/tree/tree_1.7.0.bb
>> @@ -0,0 +1,16 @@
>> +DESCRIPTION = "This is a handy little utility to display a tree view of directories."
>> +HOMEPAGE = "http://mama.indstate.edu/users/ice/tree/"
>> +LICENSE="GPLv2"
>> +SECTION = "console/utils"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
>> +
>> +inherit autotools-brokensep
>> +
>> +FILES_${PN}-doc += "${prefix}/man"
>> +
>> +SRC_URI = "http://mama.indstate.edu/users/ice/tree/src/tree-1.7.0.tgz \
>> +	   file://fix-cross-env.patch \
>> +	  "
>> +
>> +SRC_URI[md5sum] = "abe3e03e469c542d8e157cdd93f4d8a6"
>> +SRC_URI[sha256sum] = "6957c20e82561ac4231638996e74f4cfa4e6faabc5a2f511f0b4e3940e8f7b12"
>> -- 
>> 1.9.1
>>
>> -- 
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
thanks
I'll fix it and send new patch.

