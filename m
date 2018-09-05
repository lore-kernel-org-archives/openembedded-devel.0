Return-Path: <Zhe.He@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AD92A74AE6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Sep 2018 02:52:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w852q8DY008235
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 4 Sep 2018 19:52:08 -0700 (PDT)
Received: from [128.224.162.216] (128.224.162.216) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Tue, 4 Sep 2018 19:52:07 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <20180904115659.46185-1-zhe.he@windriver.com>
	<CAMKF1sqm8h1A07vs7gMhUGLiE+=PZi8QC8EkV1gogHz77X8wQw@mail.gmail.com>
From: He Zhe <zhe.he@windriver.com>
Message-ID: <d4cc309b-4b81-d4ff-d924-7dda6d888431@windriver.com>
Date: Wed, 5 Sep 2018 10:52:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqm8h1A07vs7gMhUGLiE+=PZi8QC8EkV1gogHz77X8wQw@mail.gmail.com>
X-Originating-IP: [128.224.162.216]
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] spice: Upgrade 0.14.0 -> 0.14.1
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
X-List-Received-Date: Wed, 05 Sep 2018 02:52:08 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Raj,

I tried to config it as nodistro+musl+clang, but got the following. Could you please help fix spice for clang by the way? Thanks.

ERROR: clang-native-6.0.1+gitAUTOINC+5136df4d08_2f27999df4-r0 do_patch: Command Error: 'quilt --quiltrc /build/spice/tmp-musl/work/x86_64-linux/clang-native/6.0.1+gitAUTOINC+5136df4d08_2f27999df4-r0/recipe-sysroot-native/etc/quiltrc push' exited with 0  Output:
Applying patch 0009-clang-Driver-Avoid-invalidated-iterator-in-insertTar.patch
patching file tools/driver/driver.cpp
Hunk #1 FAILED at 212.
1 out of 1 hunk FAILED -- rejects in file tools/driver/driver.cpp
Patch 0009-clang-Driver-Avoid-invalidated-iterator-in-insertTar.patch can be reverse-applied
ERROR: clang-native-6.0.1+gitAUTOINC+5136df4d08_2f27999df4-r0 do_patch: Function failed: patch_do_patch
ERROR: Logfile of failure stored in: /build/spice/tmp-musl/work/x86_64-linux/clang-native/6.0.1+gitAUTOINC+5136df4d08_2f27999df4-r0/temp/log.do_patch.3654
ERROR: Task (virtual:native:/meta-clang/recipes-devtools/clang/clang_git.bb:do_patch) failed with exit code '1'

Zhe


On 2018年09月05日 04:56, Khem Raj wrote:
> Fails to build ( with clang )
> http://errors.yoctoproject.org/Errors/Details/190549/
>
> On Tue, Sep 4, 2018 at 4:57 AM He Zhe <zhe.he@windriver.com> wrote:
>> Adjust location of spice-common source as new spice asks spice-common
>> to be put under "subprojects" directory.
>>
>> Signed-off-by: He Zhe <zhe.he@windriver.com>
>> ---
>>  meta-networking/recipes-support/spice/spice_git.bb | 9 +++++----
>>  1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb
>> index 38b8bf306..022a09e19 100644
>> --- a/meta-networking/recipes-support/spice/spice_git.bb
>> +++ b/meta-networking/recipes-support/spice/spice_git.bb
>> @@ -13,18 +13,19 @@ architectures."
>>  LICENSE = "BSD & LGPLv2.1+"
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>>
>> -PV = "0.14.0+git${SRCPV}"
>> +PV = "0.14.1+git${SRCPV}"
>>
>> -SRCREV_spice = "f1050bfc76c9c4146257e087baf74e0b62d7d218"
>> -SRCREV_spice-common = "95743f40a2da39e0a19859c305e69e2c99d39e42"
>> +SRCREV_spice = "eaa07ef15cfc3bf57a69da2576af66f028787774"
>> +SRCREV_spice-common = "6b93b3fce8909b836ef1d1434d191900d8aa00be"
>>
>>  SRCREV_FORMAT = "spice_spice-common"
>>
>>  SRC_URI = " \
>>      git://anongit.freedesktop.org/spice/spice;name=spice \
>> -    git://anongit.freedesktop.org/spice/spice-common;destsuffix=git/spice-common;name=spice-common \
>> +    git://anongit.freedesktop.org/spice/spice-common;destsuffix=git/subprojects/spice-common;name=spice-common \
>>      file://0001-Convert-pthread_t-to-be-numeric.patch \
>>  "
>> +
>>  FOO = "\
>>      file://0001-build-allow-separated-src-and-build-dirs.patch \
>>  "
>> --
>> 2.11.0
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


