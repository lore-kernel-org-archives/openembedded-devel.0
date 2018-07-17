Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2F9417890D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jul 2018 03:41:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6H3f281002469
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 16 Jul 2018 20:41:02 -0700
Received: from [128.224.162.173] (128.224.162.173) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Mon, 16 Jul 2018 20:41:01 -0700
To: Khem Raj <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
References: <20180717015840.131005-1-mingli.yu@windriver.com>
	<a140d60a-53db-1a9a-d0b1-cbb4729379df@gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5B4D63FE.6080103@windriver.com>
Date: Tue, 17 Jul 2018 11:35:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <a140d60a-53db-1a9a-d0b1-cbb4729379df@gmail.com>
X-Originating-IP: [128.224.162.173]
Subject: Re: [meta-oe][PATCH v2] cryptsetup: Upgrade to 2.0.3
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
X-List-Received-Date: Tue, 17 Jul 2018 03:41:03 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2018年07月17日 10:37, Khem Raj wrote:
>
>
> On 7/16/18 6:58 PM, mingli.yu@windriver.com wrote:
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> * Update the homepage to https://gitlab.com/cryptsetup/cryptsetup
>> * Add json-c to DEPENDS as cryptsetup requires the
>>    json-c library for JSON data processing since cryptsetup
>>    2.0.0 per "The LUKS2 format and features" part of
>>
>> https://mirrors.edge.kernel.org/pub/linux/utils/cryptsetup/v2.0/v2.0.0-ReleaseNotes
>>
>> * Add file /usr/lib/tmpfiles.d/cryptsetup.conf to
>>    FILES_${PN} when systemd enabled in DISTRO_FEATURES
>>
>
> I am seeing a new failure for
> meta-oe/recipes-extended/libblockdev/libblockdev_2.16.bb

Will fix it in V3.

Thanks,

>
>
> | ../../../git/src/plugins/crypto.c: In function 'bd_crypto_tc_open':
> | ../../../git/src/plugins/crypto.c:973:12: error: missing initializer
> for field 'veracrypt_pim' of 'struct crypt_params_tcrypt'
> [-Werror=missing-field-initializers]
> |      struct crypt_params_tcrypt params =
> {NULL,0,NULL,0,NULL,NULL,NULL,0,0};
> |             ^~~~~~~~~~~~~~~~~~~
> | In file included from ../../../git/src/plugins/crypto.c:22:
> |
> /mnt/a/oe/build/tmp/work/cortexa7t2hf-neon-vfpv4-bec-linux-gnueabi/libblockdev/2.16-r0/recipe-sysroot/usr/include/libcryptsetup.h:436:11:
> note: 'veracrypt_pim' declared here
> |   uint32_t veracrypt_pim;    /**< VeraCrypt Personal Iteration
> Multiplier */
> |            ^~~~~~~~~~~~~
>
>
>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>   .../{cryptsetup_1.7.4.bb => cryptsetup_2.0.3.bb}     | 12 +++++++-----
>>   1 file changed, 7 insertions(+), 5 deletions(-)
>>   rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_1.7.4.bb =>
>> cryptsetup_2.0.3.bb} (72%)
>>
>> diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_1.7.4.bb
>> b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.0.3.bb
>> similarity index 72%
>> rename from meta-oe/recipes-crypto/cryptsetup/cryptsetup_1.7.4.bb
>> rename to meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.0.3.bb
>> index c13b764f7..df85add6a 100644
>> --- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_1.7.4.bb
>> +++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.0.3.bb
>> @@ -4,16 +4,16 @@ device-mapper mappings. These include plain dm-crypt
>> volumes and \
>>   LUKS volumes. The difference is that LUKS uses a metadata header \
>>   and can hence offer more features than plain dm-crypt. On the other \
>>   hand, the header is visible and vulnerable to damage."
>> -HOMEPAGE = "http://code.google.com/p/cryptsetup/"
>> +HOMEPAGE = "https://gitlab.com/cryptsetup/cryptsetup"
>>   SECTION = "console"
>>   LICENSE = "GPL-2.0-with-OpenSSL-exception"
>>   LIC_FILES_CHKSUM =
>> "file://COPYING;md5=32107dd283b1dfeb66c9b3e6be312326"
>> -DEPENDS = "util-linux libdevmapper popt libgcrypt"
>> +DEPENDS = "util-linux libdevmapper popt libgcrypt json-c"
>> -SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v1.7/${BP}.tar.xz"
>> -SRC_URI[md5sum] = "058ed35c5b776032c2a036838f9e22a7"
>> -SRC_URI[sha256sum] =
>> "7ccf893ef79a38fb92d61f03c17b964982119f5319cdaa85a1335b8558cca016"
>> +SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v2.0/${BP}.tar.xz"
>> +SRC_URI[md5sum] = "ea1c722f8d4c4e36427628b679b1f819"
>> +SRC_URI[sha256sum] =
>> "4d6cca04c1f5ff4a68d045d190efb2623087eda0274ded92f92a4b6911e501d4"
>>   inherit autotools gettext pkgconfig
>> @@ -33,4 +33,6 @@ RRECOMMENDS_${PN} = "kernel-module-aes-generic \
>>   EXTRA_OECONF = "--enable-static"
>> +FILES_${PN} +=
>> "${@bb.utils.contains('DISTRO_FEATURES','systemd','${exec_prefix}/lib/tmpfiles.d/cryptsetup.conf',
>> '', d)}"
>> +
>>   BBCLASSEXTEND = "native nativesdk"
>>
>

