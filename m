Return-Path: <christian.lindeberg@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B6F3CA100C
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 07:21:29 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.67])
 by mx.groups.io with SMTP id smtpd.web11.6533.1756884087934639256
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 00:21:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=aP/MgoTs;
 spf=pass (domain: axis.com, ip: 52.101.72.67, mailfrom: christian.lindeberg@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xahV+iOIZMCheqbCz1Sdvo1xnjiNr/gKH8J+CfO4L7I8OswlGCPjsHrZVD/IhBTOSTsnk3wV6NfEAOD/m9hCimsCj5U/7PJVpKOtTPbk5EvWj5Y133wmRwfe3PEc6r2yiqtNuytyoolhruAHpUAwTmFWscQPWgKAf0d85nVCURT6DXMseCVoj7a1LFj70vurSXBlUpiyvcUqGxO4EZSPpg33HM2NwaISSp3j6mPar+14qw1gZAFLYOVl14HQfoxTn9FkEExoBTMQaRmJxjOD+4EUdoNt7bg5GrcWbnBXr5wgGTk2+QYp1XexoC+nWEXFUr8LVHa6arWOFPvN7H7WXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ise31bN6PtXNNo8shVgqrhoTqkAsI3F3tyaeightkI=;
 b=eAqRhsqeBJO8RocTEai7HbEd2N44SCKjb34x6KtKqQF1qWViZ0UGVvqAVm50as7g1DfEus35JeEW0dfLaMqEhAFxBopXTt1AU3UXfZFPz967ZOEwBJNxKpNtcYA4KANEYUxFXvrUuQofN86LpC5SP7Cfc+H0ijh2IwDSakZ90n/nCPJIPAkAPai/hRvuQkKR2ksBSLFnKzVOFtvJ14aVIbn+XJ8BFzrIA64PSaYUf8KIzrBryKVvGxI2msRhp/xz0gW3oqzbutsVfNRAuz+FDLn8+k2lLVobFgzB6c777Ir5oC97yixzVO7rJR8AjhdAjobl2KaqID/ak9FpNXd9ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ise31bN6PtXNNo8shVgqrhoTqkAsI3F3tyaeightkI=;
 b=aP/MgoTsD9IEXFlbDV5UYUiVQ2dc8kROmyLnrck1kkn5gRH8IDGLzQV7d+tuQlzCaCJSNzEkJJAO62VeNd6hDC/Ei5YYYp+aECkZAz5YlXfKYbt8uvSRPYKo1k5ifZGJrqb+turfIto+oWLcJ8/WcwW3lpTcQhJBFLXjEfvUXVE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from DU0PR02MB9894.eurprd02.prod.outlook.com (2603:10a6:10:44a::6)
 by DU0PR02MB9658.eurprd02.prod.outlook.com (2603:10a6:10:421::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 07:21:24 +0000
Received: from DU0PR02MB9894.eurprd02.prod.outlook.com
 ([fe80::74bd:5b24:5e73:94e0]) by DU0PR02MB9894.eurprd02.prod.outlook.com
 ([fe80::74bd:5b24:5e73:94e0%3]) with mapi id 15.20.9094.016; Wed, 3 Sep 2025
 07:21:23 +0000
Message-ID: <5fc83613-e734-4011-b33f-8b42641bcb5d@axis.com>
Date: Wed, 3 Sep 2025 09:21:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH 4/4] influxdb: Update module cache content
To: Khem Raj <raj.khem@gmail.com>
CC: openembedded-devel@lists.openembedded.org
References: <20250902143030.139421-1-christli@axis.com>
 <20250902143030.139421-5-christli@axis.com>
 <CAMKF1sqXnXQy+4YN9wk9xKnFNBHkUkcWO7h3gYgVv-e7JMH=oA@mail.gmail.com>
Content-Language: en-US
From: Christian Lindeberg <christian.lindeberg@axis.com>
In-Reply-To: <CAMKF1sqXnXQy+4YN9wk9xKnFNBHkUkcWO7h3gYgVv-e7JMH=oA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MM0P280CA0103.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:9::17) To DU0PR02MB9894.eurprd02.prod.outlook.com
 (2603:10a6:10:44a::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR02MB9894:EE_|DU0PR02MB9658:EE_
X-MS-Office365-Filtering-Correlation-Id: 5acd3e7b-6eac-4147-4b7f-08ddeaba7cd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?GKHSz8587fFKbKUJp+I2D4Vkj7LdQ5bz97uehF8rfcrq1bvV43lvmndH1vfL?=
 =?us-ascii?Q?19jHg9EPiGqAiAilkPW7cBKKffyjx1zORRPed+CigtTlAEoPqDZMB0XF8Vij?=
 =?us-ascii?Q?lS68LidA8syLfSRJFEJtteJgBkug8ygnce4pYpwmZcZDEKs489gbsx2qExxw?=
 =?us-ascii?Q?gNJJV9+v1GSj/Tnr9+9oS+h4jUbqPp1w1L33A397BNuHQJcKRa88WQzgAKuj?=
 =?us-ascii?Q?dCYO1txxTPLgY9AVUK0io3SgICzJ0SdTMm8JcX4R2mxaIA64kaGCIKN3e8mr?=
 =?us-ascii?Q?mDtEfiAbQ+P+rQsqGizhGUKgUClcNWgRmoF8HXCYbh4hq0Gh4mRe+Wuqka5n?=
 =?us-ascii?Q?K5El0Jl21izIMkuKkdaMx33raNBeFcvRnOh4fxTqoyBnIfXR2HeLM/DyVUhW?=
 =?us-ascii?Q?gungsZPsDLNotDpwTPasI6skmpaO6N0X3PYRYPHMStc6cyriSjaF5VGFf5WH?=
 =?us-ascii?Q?baUXK9HriuVDg36iYvrwOSE4SX3KtzflNiCw1H8R050ENcbNcOmHLMmjbpgg?=
 =?us-ascii?Q?oKLg0ztF3/JrgIyFxslqE5SM6kUTpI/edrIibIN3Nf9gTUuYCf9EBiNg8gGF?=
 =?us-ascii?Q?4rWthneATJm337kH78jzfIzL33p3+8xTtmZZaG5n32J41rE9aPKfnnpf1+v+?=
 =?us-ascii?Q?hWNkPEzD9cHePYpk1CrhXv/HVNTgVda78IkeAkX5qVuJwfmzUGVOhvn+Y4v+?=
 =?us-ascii?Q?KypuEY9RbL/9lxdqj/u9YC8vE/RXphzftL802r5Tk7O07FPjxljFR0YxdRWa?=
 =?us-ascii?Q?yssYvCjuo0TSMCRRZ303Z3SiBjw5StmfCUFUysq2PiBGUdxaKLkKnksqKVsq?=
 =?us-ascii?Q?UKQSbeUdsGOKoURnvpX4+pFEueDN6cj40DTLpSFexDpohpiJ+0epS8JGEsku?=
 =?us-ascii?Q?vVgAM1ZajUaqVNMUW8aRVWr5lMFkFR/YmNZuUf5KXdExWHTr0roT/YQfmPLT?=
 =?us-ascii?Q?xffOJrCbyP9myZOrbHYWddkJvvBnJwLYF0iDd0JGpcTwe1vx9Mgz6YN2E34g?=
 =?us-ascii?Q?wNELEufAFvXBHEbs6khncXWMuStWAVKrVYKY43pof20hCvfskb+4a9q7Elbk?=
 =?us-ascii?Q?a/pB2st27Vwio5bpAGacUfwELegHmHvCsTUm4zeRKFF5FgW/gHlKjDRUtvvT?=
 =?us-ascii?Q?lz1EWNWqLIOqaNsAjnTU8HUM54wphE/SaHZD2WnrwDFl3DKytXuT8DTt4T1N?=
 =?us-ascii?Q?FHt/RdfHoGEOdiztCNYK0MG+J1SVpGNF75XopZXPipHG1EOcgd1bM+2K4I9O?=
 =?us-ascii?Q?0Ro4y3+KRkr2PSCndBApi2q/fvTOOl06FseqmjznrP60A9W/LwJrsMVjVn0Z?=
 =?us-ascii?Q?ac1HvtWVdUCQLqxe2R6FKi1R7SsYqo1HFnX9hvd8jhwLzaSEzy5iaW/qXTyo?=
 =?us-ascii?Q?6mg/6pg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR02MB9894.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tZpBW1TigN2dkHeqTxsBxAHXIdNtnb6uZn0OX5dJJAgbD2Gx8B5TNzrJDQJm?=
 =?us-ascii?Q?ej2e6BpRQcFKvJp8FrRCTpaRpaYWZvsudWyJEidFrYgPPZT0V5UJUmlEpWEl?=
 =?us-ascii?Q?Xw2gotEnd9C61kA2D4bV5mhichmm34wZn+uIycul3Jije6rsFYs4k0uKCvsC?=
 =?us-ascii?Q?3R4en9CxMePK+/ClfqyqHKoQzoxDZSpznKZmAvtVmiGFUoK4DXHJna3fzpcr?=
 =?us-ascii?Q?voHptglqK6KgS1RjFzkLhVD5RVZ4V3r0eoOIAQ1X4ZYeiNoXt0+0y+eByNh2?=
 =?us-ascii?Q?pgMtDtMmvTwpU2k39ojob6slR3zB7fmBcdiFocXyKZVgPSHAFbA+baIviAvd?=
 =?us-ascii?Q?V3DofAL71T6Y6PLu/yfU01UxsV8O8CtQgw9AoA3tae+1KUqlUlmF9GbqGzBP?=
 =?us-ascii?Q?rYiMZfbEnWuo743xe9hOZAmqg1Yko4bVtIqTClMR6w0t1p4QqDP5v0kWyu50?=
 =?us-ascii?Q?r2GkuPgICUdP+3m/Csvw2f86xAvx1tuXEPW6RPhAujMrHOAxmt9ITtALKQOK?=
 =?us-ascii?Q?2ffAixXB1P81SfSpbTJfcZXyvlzEyHjWXyHuAu/YJiXG9a441dyksgbygnLR?=
 =?us-ascii?Q?QmFp+V79twzQjJvqK3vgD+64oHKWpaAbGOI+6kbe22pDXvRxGaUhWJNtv46X?=
 =?us-ascii?Q?hFEvdygBMd96usbf0AGErrsv2HlLxeY6EgnqmteHJbnT6j5MP0JmSmjNH54D?=
 =?us-ascii?Q?EB3wx2RLk4lnTiafKPcJUdkefqhc6HxpGWvSTJN0aSOA5Lz82oc0EprM66VF?=
 =?us-ascii?Q?/PMEwmJ5F80TFJVuwAEdUno3EJioKr83F2R6wvUA1HqLXz6aftOIxDftbPzk?=
 =?us-ascii?Q?PMeXCNb1SxxO0CkZhBXdkKd9sDbAVLTJgz/+z1IDPW+riNhvpx41T9lj2hej?=
 =?us-ascii?Q?+/vbIJ8dPN8CyMlE6XkcUDELs7srfsZBsE8r6Rt4Ujh2jW8zdfUdgw1617R9?=
 =?us-ascii?Q?Nu9MSOuENhM4lZ1CAF5QYFlQjdEjbip3YKiv+4acx1drPS3PWM2DZoD0UV9p?=
 =?us-ascii?Q?Oypozv8aNOeGn3C6J7refES2btfOP+j/4KJbhZkaXQvA3pciY+x+KL4A2mfp?=
 =?us-ascii?Q?hRAxLPnC1p+rfhwr2dAnVQ3svnF6fZHEtVRpTVpEI8oQUOhk6T4BmfQ/KMlf?=
 =?us-ascii?Q?QjYNIM2HAHnpiu1YITAsrOSRq3mbykD4jHiQnxiFSdG53YDDsPdqCt4UIrYG?=
 =?us-ascii?Q?nWRUfixcj6tnEwaTj2Vvh82CXwvA8yVIGICKMDfuvfsDHH4diO3AJ8L9R118?=
 =?us-ascii?Q?SIlHrZNV+/etj668ub5eADFdjied9g8ODwKquNFmEHye6rvucxGzMBYgSh0r?=
 =?us-ascii?Q?rBo4RIcamncI8UB+7RFYLPEgHlzC4xX3Ovw8K7ap0JuDjNVL24IjWGRoWVQM?=
 =?us-ascii?Q?sn1ErlT5pbSMPEj3/NRIsPYkmC4+mjtuKcdnAjY5x2JbEUWthVBpTRDOAl3T?=
 =?us-ascii?Q?ISZeqcLaZKGNIzTfERSoCANY9p+UIcV43VmLhGq2tHA9hLbR6ip2Zs6IBU/H?=
 =?us-ascii?Q?Guuc35ZRDrQkd3hZs9bFh/tdi/nrryAyLzgKJYwaeaZnrkfLXk3qO4/YC7N6?=
 =?us-ascii?Q?IA8zXJZHeWaJ3zzPH0c0ssAjGTYr8OA8TEKoeb3O?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5acd3e7b-6eac-4147-4b7f-08ddeaba7cd7
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB9894.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 07:21:23.7748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iZrsAWOKn0SLjiTnu3UVlrdHt2awgDz8YWGC04mVmJ9szQFx8n2m7DqiA/sbiZa4cFJ9kqbEnoWrpLDHeZJ+og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB9658
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 07:21:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119196

An unintentional change github.com/klauspost/cpuid to go.mod file only=20
caused
by a change of GOARCH when listing dependencies (amd64 happens to have an
additional import of a package in this module).

I have sent a new version.

Thanks,
Christian

On 03/09/2025 04:46, Khem Raj wrote:
> its failing to build on AB -
> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/3411754/raw_inl=
ine
>
> On Tue, Sep 2, 2025 at 7:30=E2=80=AFAM Christian Lindeberg via
> lists.openembedded.org
> <christian.lindeberg=3Daxis.com@lists.openembedded.org> wrote:
>> From: Christian Lindeberg <christian.lindeberg@axis.com>
>>
>> The Go module cache content URIs has been regenerated by listing
>> dependencies with "${GO_INSTALL}" instead of "${GO_IMPORT}/..." as the
>> package patterns.
>>
>> Signed-off-by: Christian Lindeberg <christian.lindeberg@axis.com>
>> ---
>>   meta-oe/recipes-dbs/influxdb/influxdb-go-mods.inc | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta-oe/recipes-dbs/influxdb/influxdb-go-mods.inc b/meta-oe=
/recipes-dbs/influxdb/influxdb-go-mods.inc
>> index e191426431..28927580f4 100644
>> --- a/meta-oe/recipes-dbs/influxdb/influxdb-go-mods.inc
>> +++ b/meta-oe/recipes-dbs/influxdb/influxdb-go-mods.inc
>> @@ -119,7 +119,7 @@ SRC_URI +=3D "\
>>       gomod://github.com/kisielk/errcheck;version=3Dv1.5.0;mod=3D1;sha25=
6sum=3D107d26460d41b5322b6911c9b5eb233117421943b3a1453ba99f01c4fdf2f8e8 \
>>       gomod://github.com/kisielk/gotool;version=3Dv1.0.0;mod=3D1;sha256s=
um=3D77aca7bffc0ec29fc9f088d5962ab3128f405d7b10c7ceb9693ff7a08958955d \
>>       gomod://github.com/klauspost/compress;version=3Dv1.4.0;sha256sum=
=3D4af2ed530c00d9d09a72af0b4188dac27a38548ebbd953db7f3fb22a7f671a49 \
>> -    gomod://github.com/klauspost/cpuid;version=3Dv0.0.0-20170728055534-=
ae7887de9fa5;sha256sum=3D7073c12479a7d29db4ddaa4250a029b165fcc43c25987f4352=
5ae9ea3e7ab102 \
>> +    gomod://github.com/klauspost/cpuid;version=3Dv0.0.0-20170728055534-=
ae7887de9fa5;mod=3D1;sha256sum=3D9b443b5b06355eca91f4e773a4df7d8a3bf0c9abad=
5ff472d6973e688e6a9392 \
>>       gomod://github.com/klauspost/crc32;version=3Dv0.0.0-20161016154125=
-cb6bfca970f6;sha256sum=3D6b632853a19f039138f251f94dbbdfdb72809adc3a02da08e=
4301d3d48275b06 \
>>       gomod://github.com/klauspost/pgzip;version=3Dv1.0.2-0.201704021242=
21-0bf5dcad4ada;sha256sum=3Ded381fd7fbfbdb0379158426552b772bbaca91d9fee1a11=
2a84d4500da072dd5 \
>>       gomod://github.com/konsorten/go-windows-terminal-sequences;version=
=3Dv1.0.1;mod=3D1;sha256sum=3D6b69dafd3cf64d7b57e978848a7e271a2be0a04d9a256=
4dd2556491d27d0a034 \
>> @@ -144,7 +144,7 @@ SRC_URI +=3D "\
>>       gomod://github.com/mwitkow/go-conntrack;version=3Dv0.0.0-201611290=
95857-cc309e4a2223;mod=3D1;sha256sum=3D3f15a518f37228f2d08c6b43762d43869a5a=
b8ae7ba3b5124bf961035e71cc18 \
>>       gomod://github.com/opentracing/opentracing-go;version=3Dv1.0.2;mod=
=3D1;sha256sum=3D5b59c67ddd6e8f240a0008f739d14875c1af800b8e1b23d95c10c8bea4=
9655d7 \
>>       gomod://github.com/opentracing/opentracing-go;version=3Dv1.0.3-0.2=
0180606204148-bd9c31933947;sha256sum=3D9f713f45fe865453738633a69f35c8279ecb=
88f130ca2a140a7b44385656f776 \
>> -    gomod://github.com/paulbellamy/ratecounter;version=3Dv0.2.0;sha256s=
um=3Dfb012856582335cdac02ee17c08692d75d539158a82eda3a26fb8a51d4ef27e6 \
>> +    gomod://github.com/paulbellamy/ratecounter;version=3Dv0.2.0;mod=3D1=
;sha256sum=3D775c317e0e805101aacf9509f43a700e945f81a5348fd963b4db1a47d7c1b3=
bd \
>>       gomod://github.com/peterh/liner;version=3Dv1.0.1-0.20180619022028-=
8c1271fcf47f;sha256sum=3D0d96c450f9c55a8102f4ae7fd8a583ebfaeba23e3939d6b628=
4306a82a21430f \
>>       gomod://github.com/philhofer/fwd;version=3Dv1.0.0;sha256sum=3Db4e7=
9b1f5fdfe8c44bf6dae3dd593c62862930114411a30968f304084de1d0b3 \
>>       gomod://github.com/pierrec/lz4;version=3Dv2.0.5+incompatible;mod=
=3D1;sha256sum=3D2a50cf1993308244414372349e500770dde0671ee259159cf305f4b1f8=
4ebae9 \
>> @@ -161,7 +161,7 @@ SRC_URI +=3D "\
>>       gomod://github.com/prometheus/common;version=3Dv0.6.0;sha256sum=3D=
6fb74cce1a5bd84cf36954493d6157b1bd2231b20ba2587c224df9737b579314 \
>>       gomod://github.com/prometheus/procfs;version=3Dv0.0.0-201810051402=
18-185b4288413d;mod=3D1;sha256sum=3D52ded709607588200eff4bcfbd61fce32bb0c3f=
0efdd32d846e3ea150b196352 \
>>       gomod://github.com/prometheus/procfs;version=3Dv0.0.2;sha256sum=3D=
d5e9430b0a3209ccd75569f7c6f9c9fcfc48f554557f44562352adab9c617464 \
>> -    gomod://github.com/retailnext/hllpp;version=3Dv1.0.1-0.201803080140=
38-101a6d2f8b52;sha256sum=3D7863938cb01dfe9d4495df3c6608bedceec2d1195da0561=
2f3c1b0e27d37729d \
>> +    gomod://github.com/retailnext/hllpp;version=3Dv1.0.1-0.201803080140=
38-101a6d2f8b52;mod=3D1;sha256sum=3D57ec187307e4b0d0457a8a28a6a32f683e4cfa3=
74d2449fa72838a18b1230e2e \
>>       gomod://github.com/rogpeppe/go-internal;version=3Dv1.3.0;mod=3D1;s=
ha256sum=3D33b55e839b0754283c3eeec1f33e16cc66432dffb8b8a96d24f536d01e51495b=
 \
>>       gomod://github.com/segmentio/kafka-go;version=3Dv0.1.0;mod=3D1;sha=
256sum=3D02ca00937516b509446c5eb0bd0a4e613b76388af2a65e58f9669434ca0668b6 \
>>       gomod://github.com/segmentio/kafka-go;version=3Dv0.2.0;sha256sum=
=3Db2a88eb5b65fbb75dac0ba5e721cd2cb8e39275d1702a0f97e3c4807d78e8b48 \
>> @@ -170,7 +170,7 @@ SRC_URI +=3D "\
>>       gomod://github.com/smartystreets/assertions;version=3Dv0.0.0-20180=
927180507-b2de0cb4f26d;mod=3D1;sha256sum=3D75ccd8771f23a04379e7631044c4fb70=
b49b27a09650299752ee712f08a6add7 \
>>       gomod://github.com/smartystreets/goconvey;version=3Dv1.6.4;mod=3D1=
;sha256sum=3D37e964c8dc1be33116055227dc75838037c5b5cbbe1b7923d6c6270d0eeafd=
05 \
>>       gomod://github.com/spaolacci/murmur3;version=3Dv0.0.0-201801182028=
30-f09979ecbc72;mod=3D1;sha256sum=3D55565ffdc59d315a952774815afa98668ab9011=
e8cc11e35be5243e63a23260d \
>> -    gomod://github.com/spf13/cast;version=3Dv1.3.0;sha256sum=3D001ed519=
a3ec007e76e639f72bd9560be70497d499acbf1a32ccf32dc4647d91 \
>> +    gomod://github.com/spf13/cast;version=3Dv1.3.0;mod=3D1;sha256sum=3D=
b98f2c1774e0b7c0c5747531a6a0c6c8c25a37cf397ff05f1971bbdd97d52fae \
>>       gomod://github.com/spf13/cobra;version=3Dv0.0.3;mod=3D1;sha256sum=
=3D41ec7f1a12f7934ac349ac6b87d99bc43a8ec4405ef968f3bf0bd0a32625d76a \
>>       gomod://github.com/spf13/pflag;version=3Dv1.0.3;mod=3D1;sha256sum=
=3Dc0119b5dfbbf3c0cb02b168ce0fcc19e7edefa73c9844c4609ebcb57f4394d14 \
>>       gomod://github.com/stretchr/objx;version=3Dv0.1.0;mod=3D1;sha256su=
m=3D1350354d52d2287a62336ecc0d56232d4c47699af9bba49c67c2b48254da98f1 \
>> --
>> 2.39.5
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#119182): https://lists.openembedded.org/g/openembedd=
ed-devel/message/119182
>> Mute This Topic: https://lists.openembedded.org/mt/115027108/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


