Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 12267605BE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 01:40:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w5A1euIs021614
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 9 Jun 2018 18:40:56 -0700 (PDT)
Received: from [128.224.162.190] (128.224.162.190) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Sat, 9 Jun 2018 18:40:55 -0700
To: Khem Raj <raj.khem@gmail.com>, <anuj.mittal@intel.com>,
	<openembedded-devel@lists.openembedded.org>
References: <1528422567-14811-1-git-send-email-dengke.du@windriver.com>
	<6effc8de-1e88-ea90-4f5b-7f44305ef48b@gmail.com>
From: Dengke Du <dengke.du@windriver.com>
Message-ID: <fc156970-7b31-d61a-19ca-53a56789b9ef@windriver.com>
Date: Sun, 10 Jun 2018 09:38:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <6effc8de-1e88-ea90-4f5b-7f44305ef48b@gmail.com>
X-Originating-IP: [128.224.162.190]
Subject: Re: [meta-intel][PATCH V2] mce-test: add it
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
X-List-Received-Date: Sun, 10 Jun 2018 01:40:57 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Sorry for my mistake, thanks for reminding.


On 2018年06月08日 15:41, Khem Raj wrote:
> Hi Dengke
>
> subject seems to indicate its for meta-intel. if so then its sent to 
> wrong ml.
>
> On 6/7/18 6:49 PM, Dengke Du wrote:
>> Signed-off-by: Dengke Du <dengke.du@windriver.com>
>> ---
>>   .../mce-test/files/makefile-remove-ldflags.patch   | 23 +++++++++++
>>   recipes-kernel/mce-test/mce-test_git.bb            | 48 
>> ++++++++++++++++++++++
>>   2 files changed, 71 insertions(+)
>>   create mode 100644 
>> recipes-kernel/mce-test/files/makefile-remove-ldflags.patch
>>   create mode 100644 recipes-kernel/mce-test/mce-test_git.bb
>>
>> diff --git 
>> a/recipes-kernel/mce-test/files/makefile-remove-ldflags.patch 
>> b/recipes-kernel/mce-test/files/makefile-remove-ldflags.patch
>> new file mode 100644
>> index 0000000..0ffedd2
>> --- /dev/null
>> +++ b/recipes-kernel/mce-test/files/makefile-remove-ldflags.patch
>> @@ -0,0 +1,23 @@
>> +Remove the default CFLAGS and LDFLAGS in Makefile. Ensure the extra 
>> linker flags can be passed.
>> +
>> +Upstream-Status: Inappropriate [embedded specific]
>> +
>> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> +
>> +diff --git a/cases/stress/hwpoison/Makefile 
>> b/cases/stress/hwpoison/Makefile
>> +index da1cbd8..dec5b14 100644
>> +--- a/cases/stress/hwpoison/Makefile
>> ++++ b/cases/stress/hwpoison/Makefile
>> +@@ -1,8 +1,8 @@
>> +-CFLAGS := -g -Wall
>> +-LDFLAGS := -g
>> ++#CFLAGS := -g -Wall
>> ++#LDFLAGS := -g
>> +
>> +-export CFLAGS
>> +-export LDFLAGS
>> ++#export CFLAGS
>> ++#export LDFLAGS
>> +
>> + all:
>> +     mkdir -p bin
>> diff --git a/recipes-kernel/mce-test/mce-test_git.bb 
>> b/recipes-kernel/mce-test/mce-test_git.bb
>> new file mode 100644
>> index 0000000..dca26a6
>> --- /dev/null
>> +++ b/recipes-kernel/mce-test/mce-test_git.bb
>> @@ -0,0 +1,48 @@
>> +#
>> +# Copyright (C) 2012 Wind River Systems, Inc.
>> +#
>> +SUMMARY = "MCE test suite"
>> +
>> +DESCRIPTION = "The MCE test suite is a collection of tools and test 
>> scripts for \
>> +testing the Linux RAS related features, including CPU/Memory error \
>> +containment and recovery, ACPI/APEI support etc."
>> +
>> +LICENSE = "GPLv2"
>> +LIC_FILES_CHKSUM = 
>> "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
>> +
>> +PR = "r2"
>
> Drop PR
>
>> +
>> +SRC_URI = 
>> "git://git.kernel.org/pub/scm/utils/cpu/mce/mce-test.git;protocol=git \
>> +           file://makefile-remove-ldflags.patch \
>> +          "
>> +# Use the commit date of SRCREV in PV.
>> +#
>> +SRCREV = "74bffd8b0aa27051aeaa1983a7b23975ca8d8726"
>> +PE = "1"
>
> We do not need PE its a new recipe.
>
>> +PV = "20171030+git${SRCPV}"
>> +
>> +RDEPENDS_${PN} = "mcelog mce-inject dialog bash"
>> +
>> +COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
>> +
>> +S ="${WORKDIR}/git"
>> +
>> +inherit autotools-brokensep
>> +
>> +do_install_append(){
>> +   install -d ${D}/opt/mce-test
>> +   cp -rf ${S}/* ${D}/opt/mce-test/
>> +}
>> +
>> +FILES_${PN} += "/opt"
>> +FILES_${PN}-dbg += "/opt/mce-test/cases/function/hwpoison/.debug"
>> +FILES_${PN}-dbg += "/opt/mce-test/cases/function/erst-inject/.debug"
>> +FILES_${PN}-dbg += "/opt/mce-test/cases/function/pfa/.debug"
>> +FILES_${PN}-dbg += "/opt/mce-test/cases/function/core_recovery/.debug"
>> +FILES_${PN}-dbg += "/opt/mce-test/cases/stress/hwpoison/bin/.debug"
>> +FILES_${PN}-dbg += 
>> "/opt/mce-test/cases/stress/hwpoison/tools/page-poisoning/.debug"
>> +FILES_${PN}-dbg += 
>> "/opt/mce-test/cases/stress/hwpoison/tools/fs-metadata/.debug"
>> +FILES_${PN}-dbg += "/opt/mce-test/bin/.debug"
>> +FILES_${PN}-dbg += "/opt/mce-test/tools/ltp-pan/.debug"
>> +FILES_${PN}-dbg += "/opt/mce-test/tools/simple_process/.debug"
>> +FILES_${PN}-dbg += "/opt/mce-test/tools/page-types/.debug"
>>
>


