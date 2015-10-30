Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id 6F6CD770C9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 17:43:01 +0000 (UTC)
Received: (qmail 19346 invoked by uid 1003); 30 Oct 2015 17:43:01 -0000
Received: from unknown (HELO ?10.16.32.95?)
	(philip@opensdr.com@207.114.172.147)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	30 Oct 2015 17:43:01 -0000
To: openembedded-devel@lists.openembedded.org
References: <1445901886-17887-1-git-send-email-philip@blister.org>
	<20151029191455.GC2564@jama>
	<37B60086-7E99-499A-AEDD-891A4F38F828@gmail.com>
From: Philip Balister <philip@balister.org>
Message-ID: <5633AC24.1@balister.org>
Date: Fri, 30 Oct 2015 10:43:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <37B60086-7E99-499A-AEDD-891A4F38F828@gmail.com>
Subject: Re: [meta-oe][PATCH] llvm: Add recipe for llvm-3.7.0.
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
X-List-Received-Date: Fri, 30 Oct 2015 17:43:02 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 10/30/2015 01:17 AM, Jens Rehsack wrote:
> 
>> Am 29.10.2015 um 20:14 schrieb Martin Jansa <martin.jansa@gmail.com>:
>>
>> On Mon, Oct 26, 2015 at 04:24:46PM -0700, Philip Balister wrote:
>>> From: Philip Balister <philip@opensdr.com>
>>>
>>> This version builds in parallel with the 3.3 recipe. I had to use the
>>> mesa llvmpipe driver, which required updates to llvm and mesa before it
>>> worked. With updates, I succesfully used the mesa llvmpipe driver.
>>>
>>> * Move the licence file checksum to the version specific part of the recipe
>>> * License changed for 3.7.0 due to year change and adding related software
>>> * llvm source is now compressed with xz not gz.
>>
>> It fails to build on older Ubuntu-12.04 with:
>> | checking whether GCC is new enough... no
>> | configure: error:
>> | The selected GCC C++ compiler is not new enough to build LLVM. Please upgrade
>> | to GCC 4.7. You may pass --disable-compiler-version-checks to configure to
>> | bypass these sanity checks.
>>
>> Shouldn't it check the cross compiler instead of the native one from
>> host? (in this build it was 5.2)
> 
> Usually some tools run on the host to preprocess input specifically for
> a distribution might be build using the host compiler.
> 
> Either Yocto moves to generate native tools during bootstrapping itself
> or you have to update :(


In this case, it is testing the host compiler. But we are sure it uses
the cross compiler OE built, so we can disable the check.

The alternative is to fix the configure test, but many times this ends
up being patch it out since m4 can make your eyes bleed.

Philip

> 
>>> Signed-off-by: Philip Balister <philip@opensdr.com>
>>> ---
>>> meta-oe/recipes-core/llvm/llvm.inc           |  3 +--
>>> meta-oe/recipes-core/llvm/llvm3.3_3.3.bb     |  4 ++++
>>> meta-oe/recipes-core/llvm/llvm3.7.0_3.7.0.bb | 24 ++++++++++++++++++++++++
>>> 3 files changed, 29 insertions(+), 2 deletions(-)
>>> create mode 100644 meta-oe/recipes-core/llvm/llvm3.7.0_3.7.0.bb
>>>
>>> diff --git a/meta-oe/recipes-core/llvm/llvm.inc b/meta-oe/recipes-core/llvm/llvm.inc
>>> index 04c87aa..7df4f4c 100644
>>> --- a/meta-oe/recipes-core/llvm/llvm.inc
>>> +++ b/meta-oe/recipes-core/llvm/llvm.inc
>>> @@ -23,7 +23,6 @@ HOMEPAGE = "http://llvm.org"
>>> # 3-clause BSD-like
>>> # University of Illinois/NCSA Open Source License
>>> LICENSE = "NCSA"
>>> -LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=d0a3ef0d3e0e8f5cf59e5ffc273ab1f8"
>>>
>>> DEPENDS = "libffi libxml2-native llvm-common"
>>>
>>> @@ -32,7 +31,7 @@ inherit perlnative pythonnative autotools
>>> LLVM_RELEASE = "${PV}"
>>> LLVM_DIR = "llvm${LLVM_RELEASE}"
>>>
>>> -SRC_URI = "http://llvm.org/releases/${PV}/llvm-${PV}.src.tar.gz"
>>> +SRC_URI = "http://llvm.org/releases/${PV}/llvm-${PV}.src.tar.xz"
>>> S = "${WORKDIR}/llvm-${PV}.src"
>>>
>>> LLVM_BUILD_DIR = "${WORKDIR}/llvm-${PV}.build"
>>> diff --git a/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb b/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb
>>> index 60a2221..f1562f6 100644
>>> --- a/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb
>>> +++ b/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb
>>> @@ -1,8 +1,12 @@
>>> require llvm.inc
>>>
>>> +LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=d0a3ef0d3e0e8f5cf59e5ffc273ab1f8"
>>> +
>>> DEPENDS += "zlib"
>>> EXTRA_OECONF += "--enable-zlib"
>>>
>>> +# Overwrite SRC_URI from include file since older llvm uses .gz compression
>>> +SRC_URI = "http://llvm.org/releases/${PV}/llvm-${PV}.src.tar.gz"
>>> SRC_URI += "file://Remove-error-output-from-configure-if-CFLAGS-is-set-.patch"
>>>
>>> SRC_URI_append_libc-uclibc = " file://arm_fenv_uclibc.patch "
>>> diff --git a/meta-oe/recipes-core/llvm/llvm3.7.0_3.7.0.bb b/meta-oe/recipes-core/llvm/llvm3.7.0_3.7.0.bb
>>> new file mode 100644
>>> index 0000000..813b185
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-core/llvm/llvm3.7.0_3.7.0.bb
>>> @@ -0,0 +1,24 @@
>>> +require llvm.inc
>>> +
>>> +LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=4c0bc17c954e99fd547528d938832bfa"
>>> +
>>> +DEPENDS += "zlib"
>>> +EXTRA_OECONF += "--enable-zlib"
>>> +
>>> +SRC_URI_append_libc-uclibc = " file://arm_fenv_uclibc.patch "
>>> +
>>> +SRC_URI[md5sum] = "b98b9495e5655a672d6cb83e1a180f8e"
>>> +SRC_URI[sha256sum] = "ab45895f9dcdad1e140a3a79fd709f64b05ad7364e308c0e582c5b02e9cc3153"
>>> +
>>> +PACKAGECONFIG ??= ""
>>> +PACKAGECONFIG[r600] = "--enable-experimental-targets=R600,,,"
>>> +
>>> +PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
>>> +
>>> +# Fails to build with thumb-1 (qemuarm)
>>> +# | {standard input}: Assembler messages:
>>> +# | {standard input}:22: Error: selected processor does not support Thumb mode `stmdb sp!,{r0,r1,r2,r3,lr}'
>>> +# | {standard input}:31: Error: lo register required -- `ldmia sp!,{r0,r1,r2,r3,lr}'
>>> +# | {standard input}:32: Error: lo register required -- `ldr pc,[sp],#4'
>>> +# | make[3]: *** [/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/llvm3.3/3.3-r0/llvm-3.3.build/lib/Target/ARM/Release/ARMJITInfo.o] Error 1
>>> +ARM_INSTRUCTION_SET = "arm"
>>> -- 
>>> 1.9.3
>>>
>>> -- 
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>> -- 
>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>> -- 
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 


