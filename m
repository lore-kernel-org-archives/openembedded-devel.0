Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7EBCD7546A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2018 07:27:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6G7RIfZ004170
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 16 Jul 2018 00:27:18 -0700 (PDT)
Received: from [128.224.162.173] (128.224.162.173) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Mon, 16 Jul 2018 00:27:17 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <20180713011903.84114-1-mingli.yu@windriver.com>
	<CAMKF1spHkse1PnbcvYX7-5XxFRnVRt9rdjzD0VxzD-x=w3fJtA@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5B4C4789.4020700@windriver.com>
Date: Mon, 16 Jul 2018 15:21:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spHkse1PnbcvYX7-5XxFRnVRt9rdjzD0VxzD-x=w3fJtA@mail.gmail.com>
X-Originating-IP: [128.224.162.173]
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] cryptsetup: Upgrade to 2.0.3
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
X-List-Received-Date: Mon, 16 Jul 2018 07:27:18 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2018年07月15日 02:23, Khem Raj wrote:
> This fails to build when systemd is selected in DISTRO_FEATURES
>
> cryptsetup-2.0.3: cryptsetup: Files/directories were installed but not
> shipped in any package:
>    /usr/lib/tmpfiles.d
>    /usr/lib/tmpfiles.d/cryptsetup.conf
> Please set FILES such that these items are packaged. Alternatively if
> they are unneeded, avoid installing them or delete them within
> do_install.

Will send out V2 to address this.

Thanks,

>
>
> On Thu, Jul 12, 2018 at 6:19 PM <mingli.yu@windriver.com> wrote:
>>
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> * Update the homepage to https://gitlab.com/cryptsetup/cryptsetup
>> * Add json-c to DEPENDS as cryptsetup requires the
>>    json-c library for JSON data processing since cryptsetup
>>    2.0.0 per "The LUKS2 format and features" part of
>>    https://mirrors.edge.kernel.org/pub/linux/utils/cryptsetup/v2.0/v2.0.0-ReleaseNotes
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>   .../{cryptsetup_1.7.4.bb => cryptsetup_2.0.3.bb}       | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>   rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_1.7.4.bb => cryptsetup_2.0.3.bb} (78%)
>>
>> diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_1.7.4.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.0.3.bb
>> similarity index 78%
>> rename from meta-oe/recipes-crypto/cryptsetup/cryptsetup_1.7.4.bb
>> rename to meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.0.3.bb
>> index c13b764f7..176e29a91 100644
>> --- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_1.7.4.bb
>> +++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.0.3.bb
>> @@ -4,16 +4,16 @@ device-mapper mappings. These include plain dm-crypt volumes and \
>>   LUKS volumes. The difference is that LUKS uses a metadata header \
>>   and can hence offer more features than plain dm-crypt. On the other \
>>   hand, the header is visible and vulnerable to damage."
>> -HOMEPAGE = "http://code.google.com/p/cryptsetup/"
>> +HOMEPAGE = "https://gitlab.com/cryptsetup/cryptsetup"
>>   SECTION = "console"
>>   LICENSE = "GPL-2.0-with-OpenSSL-exception"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=32107dd283b1dfeb66c9b3e6be312326"
>>
>> -DEPENDS = "util-linux libdevmapper popt libgcrypt"
>> +DEPENDS = "util-linux libdevmapper popt libgcrypt json-c"
>>
>> -SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v1.7/${BP}.tar.xz"
>> -SRC_URI[md5sum] = "058ed35c5b776032c2a036838f9e22a7"
>> -SRC_URI[sha256sum] = "7ccf893ef79a38fb92d61f03c17b964982119f5319cdaa85a1335b8558cca016"
>> +SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v2.0/${BP}.tar.xz"
>> +SRC_URI[md5sum] = "ea1c722f8d4c4e36427628b679b1f819"
>> +SRC_URI[sha256sum] = "4d6cca04c1f5ff4a68d045d190efb2623087eda0274ded92f92a4b6911e501d4"
>>
>>   inherit autotools gettext pkgconfig
>>
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

