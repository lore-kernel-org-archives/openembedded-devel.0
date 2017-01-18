Return-Path: <Zhe.He@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C71B4600E2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jan 2017 01:35:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v0I1ZOpr003335
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 17 Jan 2017 17:35:24 -0800
Received: from [128.224.162.137] (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Tue, 17 Jan 2017 17:35:23 -0800
To: Joe MacDonald <Joe_MacDonald@mentor.com>
References: <1484623661-7017-1-git-send-email-zhe.he@windriver.com>
	<20170117152932.GC7248@mentor.com>
From: He Zhe <zhe.he@windriver.com>
Message-ID: <4b704411-b8f9-6ae6-7114-6cd01c6e6ca0@windriver.com>
Date: Wed, 18 Jan 2017 09:35:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <20170117152932.GC7248@mentor.com>
X-Originating-IP: [128.224.162.137]
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] iscsitarget: Fix call trace of ahash API calling
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
X-List-Received-Date: Wed, 18 Jan 2017 01:35:24 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

Got it, thanks. v2 is sent out.

Zhe


On 01/17/2017 11:29 PM, Joe MacDonald wrote:
> [[oe] [meta-networking][PATCH] iscsitarget: Fix call trace of ahash API calling] On 17.01.17 (Tue 11:27) zhe.he@windriver.com wrote:
>
>> From: He Zhe <zhe.he@windriver.com>
>>
>> The orignal patch does not alloc struct ahash_request before using it.
>> This will cause the kernel call trace below when calling gen_scsiid on
>> kernel 4.8 or later version.
> Understood, but please don't modify the patch in place, this makes it
> difficult for the original author to track upstream status, if they've
> opted to send it along (note the original upstream status was
> 'Pending').  If you were the original author this approach might make
> more sense.
>
> Please just re-send as a standalone patch at the end of the patch list
> with your own upstream status line.
>
> Thanks.
> -J.
>
>> This patch normalizes the calling of ahash API according to the example
>> in kernel doc Documentation/crypto/api-intro.txt.
>>
>> BUG: unable to handle kernel NULL pointer dereference at 0000000000000020
>> IP: [<ffffffffa0008d45>] volume_add+0x625/0x7f0 [iscsi_trgt]
>> PGD dd77067 PUD dd7c067 PMD 0 
>> Oops: 0000 [#1] PREEMPT SMP
>> Modules linked in: iscsi_trgt(O)
>> CPU: 0 PID: 350 Comm: ietd Tainted: G           O    4.8.12-yocto-standard #1
>> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.9.3-0-ge2fc41e-prebuilt.qemu-project.org 04/01/2014
>> task: ffff88000dfe2c00 task.stack: ffff88000de88000
>> RIP: 0010:[<ffffffffa0008d45>]  [<ffffffffa0008d45>] volume_add+0x625/0x7f0 [iscsi_trgt]
>> RSP: 0018:ffff88000de8bd90  EFLAGS: 00000206
>> RAX: 000000000000ddfa RBX: ffff88000ddd1d78 RCX: ffffea0000000000
>> RDX: 0000000000000600 RSI: 0000000000000000 RDI: ffff88000ddd1c14
>> RBP: ffff88000de8be38 R08: ffff88000de44180 R09: ffff88000de8bdd0
>> R10: 000000000000002c R11: 0000000000000000 R12: ffff88000ddfa600
>> R13: 0000000000000000 R14: 0000000000000000 R15: ffff88000de92200
>> FS:  00007f767548b700(0000) GS:ffff88000fc00000(0000) knlGS:0000000000000000
>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> CR2: 0000000000000020 CR3: 000000000dd2d000 CR4: 00000000000006f0
>> Stack:
>>  ffff88000de8bdd0 ffff88000dc1b3d0 ffff88000ddfa650 ffff88000ddfa660
>>  ffff88000df8f000 ffff88000ddd1c00 ffff88000de44180 0000000000000000
>>  ffffea0000377440 0000000f00000c14 0000000000000000 0000000000000000
>> Call Trace:
>>  [<ffffffffa0006547>] ioctl+0x217/0x390 [iscsi_trgt]
>>  [<ffffffff81192574>] do_vfs_ioctl+0x94/0x5c0
>>  [<ffffffff8117ff73>] ? vfs_read+0xf3/0x120
>>  [<ffffffff81192b19>] SyS_ioctl+0x79/0x90
>>  [<ffffffff8191a45b>] entry_SYSCALL_64_fastpath+0x13/0x8f
>> Code: 4c 01 e0 0f 82 a2 01 00 00 48 b9 00 00 00 80 ff 77 00 00 48 01
>> c8 45 31 f6 48 b9 00 00 00 00 00 ea ff ff 89 54 24 68 48 c1 e8 0c <49>
>> 8b 56 20 4c 89 44 24 20 4c 89 f7 48 c1 e0 06 c7 44 24 6c 04 
>> RIP  [<ffffffffa0008d45>] volume_add+0x625/0x7f0 [iscsi_trgt]
>>  RSP <ffff88000de8bd90>
>> CR2: 0000000000000020
>> end trace cd2016297df21635 ]
>> ietd_response_recv 200 0 -5
>> Input/output error.
>>
>> Signed-off-by: He Zhe <zhe.he@windriver.com>
>> ---
>>  ...ith_updated_interfaces_of_linux_v4.8_and_above.patch | 17 ++++++++++++-----
>>  1 file changed, 12 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta-networking/recipes-extended/iscsitarget/files/build_with_updated_interfaces_of_linux_v4.8_and_above.patch b/meta-networking/recipes-extended/iscsitarget/files/build_with_updated_interfaces_of_linux_v4.8_and_above.patch
>> index e55c407..c83b080 100644
>> --- a/meta-networking/recipes-extended/iscsitarget/files/build_with_updated_interfaces_of_linux_v4.8_and_above.patch
>> +++ b/meta-networking/recipes-extended/iscsitarget/files/build_with_updated_interfaces_of_linux_v4.8_and_above.patch
>> @@ -89,6 +89,9 @@ Upstream-Status: Pending
>>  
>>  Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
>>  
>> +Correct and normalize the calling of ahash APIs
>> +Signed-off-by: Zhe He <zhe.he@windriver.com>
>> +
>>  diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/block-io.c iscsitarget-1.4.20.3+svn502/kernel/block-io.c
>>  --- iscsitarget-1.4.20.3+svn502_org/kernel/block-io.c	2016-09-25 19:45:01.814641016 +0530
>>  +++ iscsitarget-1.4.20.3+svn502/kernel/block-io.c	2016-09-25 19:47:59.666474094 +0530
>> @@ -477,7 +480,7 @@ diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/nthread.c iscsitarget-1.4.20.
>>  diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/volume.c iscsitarget-1.4.20.3+svn502/kernel/volume.c
>>  --- iscsitarget-1.4.20.3+svn502_org/kernel/volume.c	2016-09-25 19:45:01.734641099 +0530
>>  +++ iscsitarget-1.4.20.3+svn502/kernel/volume.c	2016-09-25 19:47:59.666474094 +0530
>> -@@ -84,12 +84,25 @@ static int set_scsisn(struct iet_volume
>> +@@ -84,12 +84,26 @@ static int set_scsisn(struct iet_volume
>>   /* Generate a MD5 hash of the target IQN and LUN number */
>>   static void gen_scsiid(struct iet_volume *volume)
>>   {
>> @@ -490,28 +493,32 @@ diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/volume.c iscsitarget-1.4.20.3
>>   
>>  +#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
>>  +	tfm = crypto_alloc_ahash("md5", 0, CRYPTO_ALG_ASYNC);
>> ++	hash = ahash_request_alloc(tfm, GFP_ATOMIC);
>>  +#else
>>   	hash.tfm = crypto_alloc_hash("md5", 0, CRYPTO_ALG_ASYNC);
>>   	hash.flags = 0;
>>  +#endif
>>   
>>  +#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
>> -+	if (!IS_ERR(tfm)) {
>> ++	if (tfm && !IS_ERR(tfm)) {
>>  +#else
>>   	if (!IS_ERR(hash.tfm)) {
>>  +#endif
>>   		struct scatterlist sg[2];
>>   		unsigned int nbytes = 0;
>>   
>> -@@ -102,11 +115,19 @@ static void gen_scsiid(struct iet_volume
>> +@@ -102,11 +115,22 @@ static void gen_scsiid(struct iet_volume
>>   		sg_set_buf(&sg[1], &volume->lun, sizeof(volume->lun));
>>   		nbytes += sizeof(volume->lun);
>>   
>>  +#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
>> -+		crypto_ahash_init(hash);
>> ++		ahash_request_set_callback(hash, 0, NULL, NULL);
>>  +		ahash_request_set_crypt(hash, sg, volume->scsi_id, nbytes);
>> -+		crypto_ahash_update(hash);
>>  +		crypto_ahash_digest(hash);
>> ++		crypto_ahash_init(hash);
>> ++		crypto_ahash_update(hash);
>> ++		crypto_ahash_final(hash);
>> ++		ahash_request_free(hash);
>>  +		crypto_free_ahash(tfm);
>>  +#else
>>   		crypto_hash_init(&hash);
>> -- 
>> 2.9.3
>>


