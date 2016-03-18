Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 1B0436FF78
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2016 06:56:44 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 9F10568A01D; Fri, 18 Mar 2016 06:56:44 +0000 (GMT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=ALL_TRUSTED,BAYES_50,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 1076B68A019;
	Fri, 18 Mar 2016 06:56:42 +0000 (GMT)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 949C96740B35;
	Fri, 18 Mar 2016 07:56:41 +0100 (CET)
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <1457626042-28653-1-git-send-email-gary@mlbassoc.com>
	<1457626042-28653-2-git-send-email-gary@mlbassoc.com>
	<20160317144440.GC2553@jama>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <56EBA6A8.5080404@mlbassoc.com>
Date: Fri, 18 Mar 2016 07:56:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <20160317144440.GC2553@jama>
Subject: Re: [meta-oe][PATCH v3 1/2] libass: Update to latest version
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
X-List-Received-Date: Fri, 18 Mar 2016 06:56:45 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-03-17 15:44, Martin Jansa wrote:
> On Thu, Mar 10, 2016 at 05:07:21PM +0100, Gary Thomas wrote:
>> libass has moved from Google to github.com
>> Also update to the latest version (libass.so.5)
>
> libass-0.13.2: ELF binary
> '/tmp/work/i586-oe-linux/libass/0.13.2-r0/packages-split/libass/usr/lib/libass.so.5.3.0'
> has relocations in .text [textrel]
>

Hmm, this doesn't happen on arm (cortexa9) builds :-(

Please tell me how you do "world builds" and I'll try to duplicate this and the mpv issues.

>> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
>> ---
>>   meta-oe/recipes-multimedia/libass/libass.inc       | 7 ++-----
>>   meta-oe/recipes-multimedia/libass/libass_0.10.1.bb | 5 -----
>>   meta-oe/recipes-multimedia/libass/libass_0.13.2.bb | 4 ++++
>>   3 files changed, 6 insertions(+), 10 deletions(-)
>>   delete mode 100644 meta-oe/recipes-multimedia/libass/libass_0.10.1.bb
>>   create mode 100644 meta-oe/recipes-multimedia/libass/libass_0.13.2.bb
>>
>> diff --git a/meta-oe/recipes-multimedia/libass/libass.inc b/meta-oe/recipes-multimedia/libass/libass.inc
>> index 328cd14..a394c56 100644
>> --- a/meta-oe/recipes-multimedia/libass/libass.inc
>> +++ b/meta-oe/recipes-multimedia/libass/libass.inc
>> @@ -1,5 +1,5 @@
>>   DESCRIPTION = "libass is a portable subtitle renderer for the ASS/SSA (Advanced Substation Alpha/Substation Alpha) subtitle format. It is mostly compatible with VSFilter."
>> -HOMEPAGE = "http://code.google.com/p/libass/"
>> +HOMEPAGE = "http://github.com/libass/libass/"
>>   SECTION = "libs/multimedia"
>>
>>   LICENSE = "ISC"
>> @@ -7,10 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ae98663bac55afe5d989919d296f28a"
>>
>>   DEPENDS = "enca fontconfig freetype libpng fribidi"
>>
>> -INC_PR = "r1"
>> -
>> -SRC_URI = "http://${BPN}.googlecode.com/files/${BP}.tar.gz"
>> -
>> +SRC_URI = "https://github.com/${PN}/${PN}/releases/download/0.13.2/${BP}.tar.gz"
>>   inherit autotools pkgconfig
>>
>>   PACKAGECONFIG ??= ""
>> diff --git a/meta-oe/recipes-multimedia/libass/libass_0.10.1.bb b/meta-oe/recipes-multimedia/libass/libass_0.10.1.bb
>> deleted file mode 100644
>> index 0b32276..0000000
>> --- a/meta-oe/recipes-multimedia/libass/libass_0.10.1.bb
>> +++ /dev/null
>> @@ -1,5 +0,0 @@
>> -require ${PN}.inc
>> -PR = "${INC_PR}.0"
>> -
>> -SRC_URI[md5sum] = "6cace482a013a3c4bf3b31a68ac66026"
>> -SRC_URI[sha256sum] = "629a7e81fff92dea8d0399b818a41fd1b61e381c67a5961b1eaec2efadb14c6c"
>> diff --git a/meta-oe/recipes-multimedia/libass/libass_0.13.2.bb b/meta-oe/recipes-multimedia/libass/libass_0.13.2.bb
>> new file mode 100644
>> index 0000000..123c9dd
>> --- /dev/null
>> +++ b/meta-oe/recipes-multimedia/libass/libass_0.13.2.bb
>> @@ -0,0 +1,4 @@
>> +require ${PN}.inc
>> +
>> +SRC_URI[md5sum] = "b4d82616bb18e8e954b18746a105a3b8"
>> +SRC_URI[sha256sum] = "8baccf663553b62977b1c017d18b3879835da0ef79dc4d3b708f2566762f1d5e"
>> --
>> 2.5.0

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

