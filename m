Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CB5D97422C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Sep 2015 08:45:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t878jLxo029968
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 7 Sep 2015 01:45:21 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 7 Sep 2015 01:45:21 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <1440667822-23807-1-git-send-email-kai.kang@windriver.com>
	<7ABBBA32-C72C-49A1-8B3E-2E8C17A5DB07@gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <55ED4EA9.6020107@windriver.com>
Date: Mon, 7 Sep 2015 16:45:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <7ABBBA32-C72C-49A1-8B3E-2E8C17A5DB07@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] efibootmgr: fix build error with gcc 5.2
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
X-List-Received-Date: Mon, 07 Sep 2015 08:45:23 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2015年08月28日 14:30, Khem Raj wrote:
>> On Aug 27, 2015, at 2:30 AM, kai.kang@windriver.com wrote:
>>
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> It fails to build efibootmgr with gcc 5.2:
>>
>> src/lib/disk.o: In function `disk_get_scsi_pci':
>> src/lib/disk.c:154: undefined reference to `get_scsi_pci'
>> src/lib/efi.o: In function `make_edd30_device_path':
>> src/lib/efi.c:474: undefined reference to `get_scsi_idlun'
>> collect2: error: ld returned 1 exit status
>>
>> Because functions get_scsi_pci and get_scsi_idlun are declared as
>> inline. It has different semantics for inilne function between gcc 4
>> and gcc 5.
>>
>> Pass flag '-fgnu89-inline' to gcc to fix the errors.
>>
>> Ref:
>> https://gcc.gnu.org/gcc-5/porting_to.html
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>> meta-oe/recipes-extended/efibootmgr/efibootmgr_0.6.0.bb | 2 +-
> can you update it to 0.12+ see https://github.com/rhinstaller/efibootmgr not sure if it will work for arm, you should let original
> authors from Linaro know.

OK. I'll do it.


>
> secondly if you take a closer look then it might be possible to move the function definitions into .h file and make them  static inline

Let me try. Thanks.

--Kai


>
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.6.0.bb b/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.6.0.bb
>> index 1870455..501ff2a 100644
>> --- a/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.6.0.bb
>> +++ b/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.6.0.bb
>> @@ -19,7 +19,7 @@ SRC_URI = "http://linux.dell.com/efibootmgr/permalink/efibootmgr-${PV}.tar.gz \
>> SRC_URI[md5sum] = "9e9a31d79e579644de83a14139b66d10"
>> SRC_URI[sha256sum] = "5167488b92950e60028d1025942ce6bda04638c6fb5e110abb8c8f687844d155"
>>
>> -EXTRA_OEMAKE = "'CC=${CC}' 'CFLAGS=${CFLAGS} -I${S}/src/lib -I${S}/src/include'"
>> +EXTRA_OEMAKE = "'CC=${CC}' 'CFLAGS=${CFLAGS} -I${S}/src/lib -I${S}/src/include -fgnu89-inline'"
>>
>> do_install () {
>>      install -D -p -m0755 src/efibootmgr/efibootmgr ${D}/${sbindir}/efibootmgr
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


-- 
Regards,
Neil | Kai Kang


