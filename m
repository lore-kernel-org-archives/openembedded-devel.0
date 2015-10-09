Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AE167605D2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Oct 2015 09:24:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t999O4ua026710
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 9 Oct 2015 02:24:04 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 9 Oct 2015 02:24:04 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <1443510290-26782-1-git-send-email-kai.kang@windriver.com>
	<1443510290-26782-2-git-send-email-kai.kang@windriver.com>
	<20151008095912.GA2385@jama>
	<8A50AA18-F461-4AF7-8CE4-2BABCB8710C4@gmail.com>
	<CA+chaQf_cZxKpd+12V+xJLGLtLgqcBYKmX-pmpGNg+V9RX9e3g@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <561787B2.6060003@windriver.com>
Date: Fri, 9 Oct 2015 17:24:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQf_cZxKpd+12V+xJLGLtLgqcBYKmX-pmpGNg+V9RX9e3g@mail.gmail.com>
Subject: Re: [PATCH 1/2] efivar: 0.7 -> 0.21
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
X-List-Received-Date: Fri, 09 Oct 2015 09:24:05 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2015年10月09日 16:50, Martin Jansa wrote:
> There is no gcc-native recipe.

There are 2 options that the old gcc can NOT recognize: 
'-Wmaybe-uninitialized' and '-std=gnu11'

I think we can drop them and use default value of option '-std=' only 
for native package.

It needs some tiny fixes for C99 mode:

| guid.h:34:2: error: 'for' loop initial declarations are only allowed 
in C99 mode

I'll send the V3 pull request if no objection.

Thanks,
Kai


>
> On Fri, Oct 9, 2015 at 9:20 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
>>> On Oct 8, 2015, at 2:59 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>>>
>>> On Tue, Sep 29, 2015 at 03:04:49PM +0800, kai.kang@windriver.com wrote:
>>>> From: Kai Kang <kai.kang@windriver.com>
>>>>
>>>> Upgrade efivar from 0.7 to 0.21.
>>>>
>>>> * update HOMEPAGE and git repo.
>>>> * add -native recipe to provide command makeguids
>>>>   and add patch for target package to use this native makeguids command
>>> -native version is failing on hosts with older gcc (like Ubuntu 12.04
>>> with 4.6*).
>>>
>>> http://errors.yoctoproject.org/Errors/Details/20231/
>> may be use gcc-native ?
>>
>>>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>>> ---
>>>> .../efivar/0001-efivar-fix-for-cross-compile.patch | 31
>> ++++++++++++++++++++++
>>>> meta-oe/recipes-extended/efivar/efivar_0.21.bb     | 28
>> +++++++++++++++++++
>>>> meta-oe/recipes-extended/efivar/efivar_git.bb      | 18 -------------
>>>> 3 files changed, 59 insertions(+), 18 deletions(-)
>>>> create mode 100644
>> meta-oe/recipes-extended/efivar/efivar/0001-efivar-fix-for-cross-compile.patch
>>>> create mode 100644 meta-oe/recipes-extended/efivar/efivar_0.21.bb
>>>> delete mode 100644 meta-oe/recipes-extended/efivar/efivar_git.bb
>>>>
>>>> diff --git
>> a/meta-oe/recipes-extended/efivar/efivar/0001-efivar-fix-for-cross-compile.patch
>> b/meta-oe/recipes-extended/efivar/efivar/0001-efivar-fix-for-cross-compile.patch
>>>> new file mode 100644
>>>> index 0000000..4bd7d95
>>>> --- /dev/null
>>>> +++
>> b/meta-oe/recipes-extended/efivar/efivar/0001-efivar-fix-for-cross-compile.patch
>>>> @@ -0,0 +1,31 @@
>>>> +From 7036e8b0dca61432970789e5397b6fb02b362c2b Mon Sep 17 00:00:00 2001
>>>> +From: Kai Kang <kai.kang@windriver.com>
>>>> +Date: Fri, 25 Sep 2015 18:14:31 +0800
>>>> +Subject: [PATCH] efivar: fix for cross compile
>>>> +
>>>> +It builds and calls elf file makeguids to generate a header file which
>>>> +doesn't work for cross compile. Fix it.
>>>> +
>>>> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>>> +---
>>>> + src/Makefile | 4 ++--
>>>> + 1 file changed, 2 insertions(+), 2 deletions(-)
>>>> +
>>>> +diff --git a/src/Makefile b/src/Makefile
>>>> +index 6eac858..ef4eb1d 100644
>>>> +--- a/src/Makefile
>>>> ++++ b/src/Makefile
>>>> +@@ -65,8 +65,8 @@ makeguids.o : makeguids.c
>>>> + makeguids : makeguids.o fakeguid.o
>>>> +    $(CC) $(cflags) -o $@ $^ -ldl
>>>> +
>>>> +-include/efivar/efivar-guids.h : makeguids guids.txt
>>>> +-   ./makeguids guids.txt guids.bin names.bin guid-symbols.S $@
>>>> ++include/efivar/efivar-guids.h : guids.txt
>>>> ++   makeguids guids.txt guids.bin names.bin guid-symbols.S $@
>>>> +
>>>> + guidlist.o : guids.S include/efivar/efivar-guids.h
>>>> +    $(CC) $(cflags) -c -o guidlist.o guids.S
>>>> +--
>>>> +2.6.0.rc2.10.gf4d9753
>>>> +
>>>> diff --git a/meta-oe/recipes-extended/efivar/efivar_0.21.bb
>> b/meta-oe/recipes-extended/efivar/efivar_0.21.bb
>>>> new file mode 100644
>>>> index 0000000..2e3b643
>>>> --- /dev/null
>>>> +++ b/meta-oe/recipes-extended/efivar/efivar_0.21.bb
>>>> @@ -0,0 +1,28 @@
>>>> +SUMMARY = "Tools to manipulate UEFI variables"
>>>> +DESCRIPTION = "efivar provides a simple command line interface to the
>> UEFI variable facility"
>>>> +HOMEPAGE = "https://github.com/rhinstaller/efivar"
>>>> +
>>>> +LICENSE = "LGPLv2.1"
>>>> +LIC_FILES_CHKSUM =
>> "file://COPYING;md5=6626bb1e20189cfa95f2c508ba286393"
>>>> +
>>>> +DEPENDS_class-target = "popt efivar-native"
>>>> +
>>>> +SRCREV = "aab6c2a64d90b6e5a63661fb5bd6be8d878b0784"
>>>> +SRC_URI = "git://github.com/rhinstaller/efivar.git"
>>>> +SRC_URI_append_class-target = "
>> file://0001-efivar-fix-for-cross-compile.patch"
>>>> +
>>>> +S = "${WORKDIR}/git"
>>>> +
>>>> +do_install() {
>>>> +    oe_runmake install DESTDIR=${D}
>>>> +}
>>>> +
>>>> +do_compile_class-native() {
>>>> +    oe_runmake -C src makeguids
>>>> +}
>>>> +
>>>> +do_install_class-native() {
>>>> +    install -D ${B}/src/makeguids ${D}${bindir}/makeguids
>>>> +}
>>>> +
>>>> +BBCLASSEXTEND = "native"
>>>> diff --git a/meta-oe/recipes-extended/efivar/efivar_git.bb
>> b/meta-oe/recipes-extended/efivar/efivar_git.bb
>>>> deleted file mode 100644
>>>> index 18446a0..0000000
>>>> --- a/meta-oe/recipes-extended/efivar/efivar_git.bb
>>>> +++ /dev/null
>>>> @@ -1,18 +0,0 @@
>>>> -SUMMARY = "Tools to manipulate UEFI variables"
>>>> -DESCRIPTION = "efivar provides a simple command line interface to the
>> UEFI variable facility"
>>>> -HOMEPAGE = "https://github.com/vathpela/efivar"
>>>> -
>>>> -LICENSE = "LGPLv2.1"
>>>> -LIC_FILES_CHKSUM =
>> "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
>>>> -
>>>> -DEPENDS = "popt"
>>>> -
>>>> -SRCREV = "c9e1f24a81b5374408bca5616402276e47171cf7"
>>>> -PV = "0.7+git${SRCPV}"
>>>> -SRC_URI = "git://github.com/vathpela/efivar.git"
>>>> -
>>>> -S = "${WORKDIR}/git"
>>>> -
>>>> -do_install() {
>>>> -    oe_runmake install DESTDIR=${D}
>>>> -}
>>>> --
>>>> 2.6.0.rc2.10.gf4d9753
>>>>
>>> --
>>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>>


-- 
Regards,
Neil | Kai Kang


