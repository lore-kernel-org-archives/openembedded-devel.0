Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 12FF97F3E4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Jul 2019 06:49:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6V6nfua008209
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 30 Jul 2019 23:49:41 -0700 (PDT)
Received: from [128.224.162.170] (128.224.162.170) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Tue, 30 Jul 2019 23:49:40 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <20190722211814.14237-1-raj.khem@gmail.com>
	<20190722211814.14237-2-raj.khem@gmail.com>
	<5D413747.3050905@windriver.com>
	<CAMKF1srck4LCAV2pGtcF6sr9JT8BguePF6z-snuBPy85SEhmbw@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5D413AA5.7080903@windriver.com>
Date: Wed, 31 Jul 2019 14:52:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1srck4LCAV2pGtcF6sr9JT8BguePF6z-snuBPy85SEhmbw@mail.gmail.com>
X-Originating-IP: [128.224.162.170]
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [meta-oe][PATCH] log4cplus: Fix build with gold linker
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
X-List-Received-Date: Wed, 31 Jul 2019 06:49:42 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2019年07月31日 14:46, Khem Raj wrote:
> On Tue, Jul 30, 2019 at 11:36 PM Yu, Mingli <mingli.yu@windriver.com> wrote:
>>
>> Hi Khem,
>>
>> On 2019年07月23日 05:18, Khem Raj wrote:
>>> Fixes a potential linker error and eventual linker crash when using gold
>>> linker [1]
>>>
>>> [1] https://errors.yoctoproject.org/Errors/Details/253440/
>>>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> Cc: Adrian Bunk <bunk@stusta.de>
>>> Cc: Mingli Yu <mingli.yu@windriver.com>
>>> ---
>>>    ...-version-entry-from-ELF-.comment-sec.patch | 40 +++++++++++++++++++
>>>    .../log4cplus/log4cplus_2.0.4.bb              |  6 ++-
>>>    2 files changed, 45 insertions(+), 1 deletion(-)
>>>    create mode 100644 meta-oe/recipes-devtools/log4cplus/log4cplus/0001-Remove-log4cplus-version-entry-from-ELF-.comment-sec.patch
>>>
>>> diff --git a/meta-oe/recipes-devtools/log4cplus/log4cplus/0001-Remove-log4cplus-version-entry-from-ELF-.comment-sec.patch b/meta-oe/recipes-devtools/log4cplus/log4cplus/0001-Remove-log4cplus-version-entry-from-ELF-.comment-sec.patch
>>> new file mode 100644
>>> index 0000000000..44a835c35f
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-devtools/log4cplus/log4cplus/0001-Remove-log4cplus-version-entry-from-ELF-.comment-sec.patch
>>> @@ -0,0 +1,40 @@
>>> +From da5338e68f146efadab7c221291ba4c949d8f12f Mon Sep 17 00:00:00 2001
>>> +From: Vaclav Haisman <vhaisman@gmail.com>
>>> +Date: Sun, 21 Jul 2019 23:23:16 -0700
>>> +Subject: [PATCH] Remove log4cplus version entry from ELF .comment section
>>> +
>>> +Reverts
>>> +https://github.com/log4cplus/log4cplus/commit/9cb0d4ade619da4e40628c9b95ff51de3df29f1b
>>> +
>>> +Upstream-Status: Backport [https://github.com/log4cplus/log4cplus/commit/7e6addc70dffd2e30e902efd18eb845c5d5dd7bb]
>>> +
>>> +Suggested-by: Adrian Bunk <bunk@stusta.de>
>>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> +---
>>> + src/version.cxx | 12 ------------
>>> + 1 file changed, 12 deletions(-)
>>> +
>>> +diff --git a/src/version.cxx b/src/version.cxx
>>> +index ce18212..e002de9 100644
>>> +--- a/src/version.cxx
>>> ++++ b/src/version.cxx
>>> +@@ -34,16 +34,4 @@ namespace log4cplus
>>> + unsigned const version = LOG4CPLUS_VERSION;
>>> + char const versionStr[] = LOG4CPLUS_VERSION_STR LOG4CPLUS_VERSION_STR_SUFFIX;
>>> +
>>> +-namespace
>>> +-{
>>> +-
>>> +-#if defined (__ELF__) && (defined (__GNUC__) || defined (__clang__))
>>> +-char const versionStrComment[]
>>> +-    __attribute__ ((__used__, __section__ ((".comment"))))
>>> +-    = "log4cplus " LOG4CPLUS_VERSION_STR LOG4CPLUS_VERSION_STR_SUFFIX;
>>> +-#endif
>>> +-
>>> +-
>>> +-} // namespace
>>> +-
>>> + } // namespace log4cplus
>>> +--
>>> +2.22.0
>>> +
>>> diff --git a/meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.4.bb b/meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.4.bb
>>> index d86521aba3..b396cabf3f 100644
>>> --- a/meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.4.bb
>>> +++ b/meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.4.bb
>>> @@ -6,7 +6,9 @@ BUGTRACKER = "http://sourceforge.net/p/log4cplus/bugs/"
>>>    LICENSE = "Apache-2.0 & BSD-2-Clause"
>>>    LIC_FILES_CHKSUM = "file://LICENSE;md5=41e8e060c26822886b592ab4765c756b"
>>>
>>> -SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}-stable/${PV}/${BP}.tar.gz"
>>> +SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}-stable/${PV}/${BP}.tar.gz \
>>> +           file://0001-Remove-log4cplus-version-entry-from-ELF-.comment-sec.patch \
>>> +          "
>>>    SRC_URI[md5sum] = "2b5b7bc294698bf30a315a259ef9eec2"
>>>    SRC_URI[sha256sum] = "196eedbc7f2dd792dae721b1159c7ac132255bb368226353c24d4d5fa7c7797a"
>>>
>>> @@ -16,3 +18,5 @@ UPSTREAM_CHECK_REGEX = "log4cplus-stable/(?P<pver>\d+(\.\d+)+)/"
>>>    inherit autotools pkgconfig
>>>
>>>    BBCLASSEXTEND = "native"
>>> +
>>> +CXXFLAGS += "-fuse-ld=gold"
>>
>> The logic [CXXFLAGS += "-fuse-ld=gold"] you added is used to fix the
>> linker crash on arm though I didn't encounter.
>
> this was not needed infact. It was for testing only please send a
> patch to remove
>   CXXFLAGS += "-fuse-ld=gold"

Okay, thanks Khem!

Thanks,

>>
>> BTW, after you add [CXXFLAGS += "-fuse-ld=gold"], it fails the build for
>> "bitbake libn32-log4cplus" with below logic in local.conf
>> MACHINE ??= "qemumips64"
>> MULTILIB_GLOBAL_VARIANTS_append = " libn32"
>> MULTILIBS ?= "multilib:lib32 multilib:libn32"
>> DEFAULTTUNE_virtclass-multilib-lib32 ?= "mips"
>> DEFAULTTUNE_virtclass-multilib-libn32 ?= "mips64-n32"
>> require conf/multilib.conf
>>
>> Thanks,
>>
>>>
>

