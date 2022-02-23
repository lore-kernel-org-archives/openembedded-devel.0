Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B13A3C433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 02:14:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2607.1645582458446452089
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 18:14:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Yskumke6;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=9053248646=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 21N2BclP018494
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 02:14:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=XsSG7wgDKQbla+Sb4H+/PMlnSWpm+yzPEAxXA7urhF4=;
 b=Yskumke6/b46mJBKNAwwKaaipTod8TB0YDppRLVRz97et0EhkjbYtyR2bfLa42rlPdEO
 WnQl+MMQGhEXNPtPrS0g6vKwqHp/QB7pNFGMudA0pRBNTKR0rOnXZhjxqfNu0cYU3DJl
 NP/EdBvMxl1o9Ry4JWLaH/6nMLQvq+/OLu47fggSfBihEQ5wz5LX9opS4Qh0EXZe2OHv
 vwAiQwSvcouOCDjQNog6v29mcdypdUkbJy5EcF+F/0ncK9IZhSDsryejb5g9J1jPMg4B
 vfzKULainI1dpJR8J79TJXE4VQfgplf78jeDyarPfP33BrZPVkVU0pl0bKORQuj15AcI Cg==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ec6r31q4q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 02:14:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yi4XydeCR1vKDsVEjnEaSoWCcniHbGAbDSqcmPNJrmHr0mrv3hkVQfskZwDvOb7Az0UErxlRnzstlgO3YHfWjYeKqqH8s5oa1BNQfAI9h5BYxvSclOlqSG0fMsX1YlEGej9v45bJBP6wYCVCmueNIFSwka4e/g52IDetZwWrUiSMoMhcmSfFf3lXJ1+GxgMp4vUVmOa0Ki/Coourx1sUUOSzg9g/CB4sfJWJzgQnIXMsSKTvdAVsOlzu6/WMzbRpgIt/oUJvGPINxAuvxjrVYQor8c+cLVheL0U1ebDXNl+6+MzUV2Q/DH4+VCKo7HRZ7fPzMiIgMq+Ec51UBMiSqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XsSG7wgDKQbla+Sb4H+/PMlnSWpm+yzPEAxXA7urhF4=;
 b=IBMXKBdJ4id67WGtMQ2WTZdyUwuzztwLRcAKvJHkGQH1AkTx/fVD+iL6slZyVdsavbdXG3Ryyh+s6tsya9S7QPr4zptSDil9UuQAgjMGqSNkHFEsjhL1FIrZkiHtbIA5+hCwR0IXfOT+ZjBZqZXp0tt/5Jghivt2RwQ72NLv7YgTYkNpQMiZLBxHPt6PmyWb7E65z0TtTyI3mfVtkQsV3YP7800izMLYLEFz8BXCt9aoqE0IOu23I2L2+q5GmFmXiC+Eo7l324aAh9X7HWiABYtVTcVFK1sO4pXLoMhBx0cVhlyeVBTeZs+N9JvssAhHuiYVU04QLuGHkk6dlSOABQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4851.namprd11.prod.outlook.com (2603:10b6:303:9b::13)
 by BYAPR11MB3478.namprd11.prod.outlook.com (2603:10b6:a03:7b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17; Wed, 23 Feb
 2022 02:14:13 +0000
Received: from CO1PR11MB4851.namprd11.prod.outlook.com
 ([fe80::5d2f:3638:aae8:1f80]) by CO1PR11MB4851.namprd11.prod.outlook.com
 ([fe80::5d2f:3638:aae8:1f80%5]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 02:14:13 +0000
Subject: Re: [oe] [hardknott][meta-oe][PATCH] openjpeg: fix CVE-2021-29338
To: openembedded-devel@lists.openembedded.org
References: <16D3F9FE9FB73594.20212@lists.openembedded.org>
From: Kai <kai.kang@windriver.com>
Message-ID: <b082d4b5-7979-2d66-920f-8ba14e73af80@windriver.com>
Date: Wed, 23 Feb 2022 10:14:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <16D3F9FE9FB73594.20212@lists.openembedded.org>
Content-Type: multipart/alternative;
 boundary="------------E9198192FE2E3D2A5023B822"
Content-Language: en-US
X-ClientProxiedBy: BY3PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:a03:254::23) To CO1PR11MB4851.namprd11.prod.outlook.com
 (2603:10b6:303:9b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32cafd9c-b9bc-4eff-3a4c-08d9f6722f11
X-MS-TrafficTypeDiagnostic: BYAPR11MB3478:EE_
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3478F664650C600E3905B23B953C9@BYAPR11MB3478.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3XRKIP3L/wY8PMpWpIdArhLaGZJEJ5cGSY+UTUaQc+FHq/JeVsDzJwg8pDE0eFZoTbbftOpNI/kpdlty4IVMLri2xp4jvbxgdQLZDEnJBTGmWkmrtFEl2nt0eU1xO1siprOexG2FUlhYZXq03VvtCxZttzP4FQXR4MN8LjNckUoAnNEqHNNprmuWuFLuVNssPqa66rcEgdeBSlK7bUMT46IwGKsb0JkptAdMv11JaA+gjVa/M5+4sBpk6fK6YzCYmM8zJ7ArVtbmEh/8GIgB8DQKkPa0tArrF/rPh5Ox3Vz0rUw/LjRYfJwS03FwL9WV0KGKlSPPlnJVd8ZxmRcqrVlBfRhAvt921shWzSXx5QGVyelC6uDvhK2In9kXfgzWLLT1eiPa6uB/FCm8AF297H3UVaAGij2/DiTtTl9IANrTRpEgyKTOaKAWgrnY3Reak6dnX33Mm7IPdtV7JJCd/mv3RCluYHmmwaND4CO3LkHO8cK1gn1FAhHfIJksblIHhGYj5Y8XQu9f3cpHT35adxNsr+GhtmeM7VZVQC9lyiyUY5BOkXUUfi8PMJZpiQQvtwCMY0qAswooIdZLtzhNQGtwhJQv2DbU0e6vQpwAV+z93KFFGSFwMtMdy2Fsl8y6NIeZuYhmm/7J8j1czeSbKL8Ec9n1ZlXPeByK8hjC1JBU2HMuX+eBnF5IeBXIpSlZzS8NTd/agHnn/eXQgMexZqS/WXqcxphwqGkzr9h/yzcz/v+UYmyuoKTXWEdmXMUonAHB4BOxcMuvzrcdwT+TBnepU0Z4BUl0Z6iykfzg5iuFw99LZCd+XQr828vAhk7qqeLgYpjkdIv7pgtm6+3WFn7wfe+LctXaqTesSGaFJQzioZhxl4CpUMlJtzC9zxE1
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4851.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(966005)(66946007)(66556008)(8676002)(6916009)(508600001)(316002)(6512007)(31696002)(83380400001)(8936002)(5660300002)(66476007)(2616005)(166002)(6666004)(36756003)(86362001)(6506007)(38350700002)(38100700002)(33964004)(26005)(31686004)(186003)(2906002)(53546011)(52116002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WU1ZME5IV2M0QlpiVm4xNHZMYlR1Um9FblBONHJPR3c0RHlleS9hTzluSXhq?=
 =?utf-8?B?eGN2Zkc2TUdWUkJQeEtLTEhSeFpkbjdXK3JCV2hiRlFVOXBmMU1pYUhTbURQ?=
 =?utf-8?B?UnBuUVFTMCtZQkFuTjNqWGVhdDFneHcrRTUxeWVkcVR3MUpPM2pmNHR6ZFVI?=
 =?utf-8?B?UmNCWXR3UnV5cTNTYzNsUGhITzJjc1B0bmFrUGU2YmZLYzJRRHZrWnZianpU?=
 =?utf-8?B?TEg5TE96eUZVMmR4OTFRNHNzQmNCRnp2dVo5aldOb1MraWlmZVpkQTNjcmxI?=
 =?utf-8?B?V2EzTlZ1QlA1U2dqYkhwSXAvMTRjbG4rMEN6c0IxVkNuS0RTL0FiVnlSeWov?=
 =?utf-8?B?bGlmRkt6MFhuQko1NzhCUnRic2o0TlRVWjBuWUJSOTl3QnJKR1VmT1ZDNWx4?=
 =?utf-8?B?VUtpckE4TkZuYkhGYXduNFNWcFZSL3dQMVdyUzI1OU5xTlJpRjZIcTdLeHBI?=
 =?utf-8?B?cm00N1dIV0twYVJRQVhld3NOMEtpQkRWRVhkL0ljZzZQSVIyOGg4dGdBNXl5?=
 =?utf-8?B?ZW1IZk1NQSt0WFg5bThXNTZwZ0NwZEZ0aFEzN3N5bFNoT2x2S0trektPeE1K?=
 =?utf-8?B?N0lKaWFLS0tnblROMDhBSWxqYlNyeWFwZ2tDNUVrL2w5ck5LaFI1UFUvT0dz?=
 =?utf-8?B?NzBqdlJOTUtmdFhESGd1bFF1ZVd5ejFyeGhZVzBqN3dTVWNJN2k1SS9vYm9O?=
 =?utf-8?B?ajlwamdrdDVsTCtWdlVJaXh1Z3crQytrc01leXh4VzB4V0UwejdTSUc3Nkpq?=
 =?utf-8?B?cWdDTzh4dEhtYjBNVmp2OVo5L2R5Mjh2TklBd2M0L0ZtS3hPbmZKMjZhMVZs?=
 =?utf-8?B?L1BxRTVzLzVDQ043RnYwbEU5MHJlaHgraGxmMlFpTU5xUG1weFczRHE1RFhU?=
 =?utf-8?B?OHZCVERhN0hOMHBlYXNxR3d0MjUrenlXQndHSXdPOW55R25yeSt3cXJQUE1i?=
 =?utf-8?B?SkJRYnBPZkF4aE15QmE2VVZrdGY1QUVCNTJlN3ZsUmlsMkNJU2tOWkFjNkxI?=
 =?utf-8?B?bEF2azFlSHI2VUZOL3c4T2VWeEhuSWhJVVNBc1lrUEw5R2hyK2pBeEUzWU9y?=
 =?utf-8?B?Z0ZqZkZ4Qks4WG00eVg4T28wYUh5aVNzUVJGNE0zanhQdlJnNVBHcW5idVo5?=
 =?utf-8?B?UHgrR0U2QUNBOEhLa0pVMml4OTIzMHZDKytSZng1SHhLVENuRHFOU2l1SlhL?=
 =?utf-8?B?M1pQaitOMEQ2OVVKVTIxSk51amtlVnhNTGxoYVU2SThxbC9EOWM2VzdybjY5?=
 =?utf-8?B?VkxJbDg4M3hmTGRFNk5qMDNKTWRtQjJ1ZGxudzljaWpvamw1eVJ5Wnppdnpo?=
 =?utf-8?B?T2Q0dU1qRnpTVWFhV0U4YTl0Y0w3QUdIQmRsc0RURjdSS1JNOVRkWGYzYWpV?=
 =?utf-8?B?a3FMVHNvZU44WmkzaHcxaTNnYld3MW93cUJSQzBrR3MrZWY4L2gzSjRFVXZ4?=
 =?utf-8?B?elg2VktqNUlRV0MzS3J1SzQ5cVVscWJ2U1IxM0ZoQU9QNlRlSk40cHJwd1NF?=
 =?utf-8?B?OEdGcWtNUWt6THVSa09Ec2R5SVhnNnBkanJTWWFhTUQwdEppY2VuNGdiT3Bn?=
 =?utf-8?B?aXZRbFcxT1NFOWU5dTZlRTVaaHpOUXBoelUyNlo2S0JkWWRRRGlIZ2Erb1dq?=
 =?utf-8?B?QmxXakcwSk9FYnpiWm1ESEFNK0FKbER5Vy9ZNXJtVG85Y0h4TXFaaHh1Wk9p?=
 =?utf-8?B?VENZNVpiU3M5RzFhYlJVek5DK2J4cVVPZkRUTmlOMm92V1laMWNwK1JReGJt?=
 =?utf-8?B?MFh1YkNhcnlHTVd6YmtYOHVmczkvRnRPVUpvRjQ0M3V4V281R2J0dkk0YVZB?=
 =?utf-8?B?Smcyc2F6ekVyWmlNdm5MbjFjdjFhTVY3eHBWM1hmR3ljRzBmSU95RE1QbnY5?=
 =?utf-8?B?TXBSeUpjMmZkOHRGcVc4aWdnSit0dXZNbkVoQ0t2WjZYY3dyZXpWd21hNFVU?=
 =?utf-8?B?Z1J6WFpBM3RCT2U5bCtoUEdQZHpUTWxKL2J1LzVJQzFlMk9LSHdTT0lLWDZ2?=
 =?utf-8?B?RUIrdk84Y2c1emRYallNQmZhNzd3V3lhWngrYjZWb3VzZHBCbnV1RFFzRFRO?=
 =?utf-8?B?Wk1nZlRtLzAxNkUvWWJId0FBSjBQWHJGWk5Xd2dZYk45YnBuaUJ0Smh6eDVq?=
 =?utf-8?B?UlhHRTJiRXovN0FzdHpub3BYSlRwc2xvbDgveGhDOWFvTVhPbXlLRnQ5NkdC?=
 =?utf-8?Q?NgCCBEPzgJsM+1/69Dln7Wk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 32cafd9c-b9bc-4eff-3a4c-08d9f6722f11
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4851.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 02:14:13.0684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ThepVKtjnoEofbx3DxmSVwSIGP8TTeO6mbpsgY/cwxnL6E/IcFp+8+/5sr8sTsA8IP8xgxDdaZOdWOoDVfnVWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3478
X-Proofpoint-GUID: UWDWgSf9ulXh4KUtOrC_VKh9qYmNY0g1
X-Proofpoint-ORIG-GUID: UWDWgSf9ulXh4KUtOrC_VKh9qYmNY0g1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-22_08,2022-02-21_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1011 mlxscore=0 lowpriorityscore=0 mlxlogscore=664
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202230010
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Feb 2022 02:14:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95458

--------------E9198192FE2E3D2A5023B822
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/15/22 9:52 PM, kai wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> CVE: CVE-2021-29338
>
> Ref:
> * https://github.com/uclouvain/openjpeg/issues/1338

Ping.

Kai

>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   .../openjpeg/openjpeg/CVE-2021-29338.patch    | 78 +++++++++++++++++++
>   .../openjpeg/openjpeg_2.4.0.bb                |  1 +
>   2 files changed, 79 insertions(+)
>   create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2021-29338.patch
>
> diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2021-29338.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2021-29338.patch
> new file mode 100644
> index 000000000..a7c2bb4f3
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2021-29338.patch
> @@ -0,0 +1,78 @@
> +Upstream-Status: Backport [https://github.com/uclouvain/openjpeg/pull/1395/commits/f0727df]
> +CVE: CVE-2021-29338
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +
> +From f0727df07c4d944d7d1c5002451cfbc9545d3288 Mon Sep 17 00:00:00 2001
> +From: Brad Parham <brad.a.parham@intel.com>
> +Date: Wed, 12 Jan 2022 12:20:28 +0100
> +Subject: [PATCH] Fix integer overflow in num_images
> +
> +Includes the fix for CVE-2021-29338
> +Credit to @kaniini based on #1346
> +Fixes #1338
> +---
> + src/bin/jp2/opj_compress.c   | 4 ++--
> + src/bin/jp2/opj_decompress.c | 5 ++---
> + src/bin/jp2/opj_dump.c       | 7 ++++---
> + 3 files changed, 8 insertions(+), 8 deletions(-)
> +
> +diff --git a/src/bin/jp2/opj_compress.c b/src/bin/jp2/opj_compress.c
> +index 8c71d4536..1399d5277 100644
> +--- a/src/bin/jp2/opj_compress.c
> ++++ b/src/bin/jp2/opj_compress.c
> +@@ -1959,9 +1959,9 @@ int main(int argc, char **argv)
> +         num_images = get_num_images(img_fol.imgdirpath);
> +         dirptr = (dircnt_t*)malloc(sizeof(dircnt_t));
> +         if (dirptr) {
> +-            dirptr->filename_buf = (char*)malloc(num_images * OPJ_PATH_LEN * sizeof(
> ++            dirptr->filename_buf = (char*)calloc(num_images, OPJ_PATH_LEN * sizeof(
> +                     char)); /* Stores at max 10 image file names*/
> +-            dirptr->filename = (char**) malloc(num_images * sizeof(char*));
> ++            dirptr->filename = (char**) calloc(num_images, sizeof(char*));
> +             if (!dirptr->filename_buf) {
> +                 ret = 0;
> +                 goto fin;
> +diff --git a/src/bin/jp2/opj_decompress.c b/src/bin/jp2/opj_decompress.c
> +index fc0012b63..e1217f891 100644
> +--- a/src/bin/jp2/opj_decompress.c
> ++++ b/src/bin/jp2/opj_decompress.c
> +@@ -1374,14 +1374,13 @@ int main(int argc, char **argv)
> +             return EXIT_FAILURE;
> +         }
> +         /* Stores at max 10 image file names */
> +-        dirptr->filename_buf = (char*)malloc(sizeof(char) *
> +-                                             (size_t)num_images * OPJ_PATH_LEN);
> ++        dirptr->filename_buf = calloc((size_t) num_images, sizeof(char) * OPJ_PATH_LEN);
> +         if (!dirptr->filename_buf) {
> +             failed = 1;
> +             goto fin;
> +         }
> +
> +-        dirptr->filename = (char**) malloc((size_t)num_images * sizeof(char*));
> ++        dirptr->filename = (char**) calloc((size_t) num_images, sizeof(char*));
> +
> +         if (!dirptr->filename) {
> +             failed = 1;
> +diff --git a/src/bin/jp2/opj_dump.c b/src/bin/jp2/opj_dump.c
> +index 6111d2ab6..d2646f10e 100644
> +--- a/src/bin/jp2/opj_dump.c
> ++++ b/src/bin/jp2/opj_dump.c
> +@@ -515,13 +515,14 @@ int main(int argc, char *argv[])
> +         if (!dirptr) {
> +             return EXIT_FAILURE;
> +         }
> +-        dirptr->filename_buf = (char*)malloc((size_t)num_images * OPJ_PATH_LEN * sizeof(
> +-                char)); /* Stores at max 10 image file names*/
> ++        /* Stores at max 10 image file names*/
> ++        dirptr->filename_buf = (char*) calloc((size_t) num_images,
> ++                                              OPJ_PATH_LEN * sizeof(char));
> +         if (!dirptr->filename_buf) {
> +             free(dirptr);
> +             return EXIT_FAILURE;
> +         }
> +-        dirptr->filename = (char**) malloc((size_t)num_images * sizeof(char*));
> ++        dirptr->filename = (char**) calloc((size_t) num_images, sizeof(char*));
> +
> +         if (!dirptr->filename) {
> +             goto fails;
> diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb
> index 5a0cf21ef..43e1dd76a 100644
> --- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb
> +++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb
> @@ -9,6 +9,7 @@ SRC_URI = " \
>       git://github.com/uclouvain/openjpeg.git;branch=master;protocol=https \
>       file://0002-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch \
>       file://0001-This-patch-fixed-include-dir-to-usr-include-.-Obviou.patch \
> +    file://CVE-2021-29338.patch \
>   "
>   SRCREV = "37ac30ceff6640bbab502388c5e0fa0bff23f505"
>   S = "${WORKDIR}/git"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95317): https://lists.openembedded.org/g/openembedded-devel/message/95317
> Mute This Topic: https://lists.openembedded.org/mt/89160625/3616933
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [kai.kang@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
Kai Kang
Wind River Linux


--------------E9198192FE2E3D2A5023B822
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2/15/22 9:52 PM, kai wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:16D3F9FE9FB73594.20212@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>

CVE: CVE-2021-29338

Ref:
* <a class="moz-txt-link-freetext" href="https://github.com/uclouvain/openjpeg/issues/1338">https://github.com/uclouvain/openjpeg/issues/1338</a></pre>
    </blockquote>
    <p>Ping.</p>
    <p>Kai<br>
    </p>
    <blockquote type="cite" cite="mid:16D3F9FE9FB73594.20212@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">

Signed-off-by: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>
---
 .../openjpeg/openjpeg/CVE-2021-29338.patch    | 78 +++++++++++++++++++
 .../openjpeg/openjpeg_2.4.0.bb                |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2021-29338.patch

diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2021-29338.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2021-29338.patch
new file mode 100644
index 000000000..a7c2bb4f3
--- /dev/null
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2021-29338.patch
@@ -0,0 +1,78 @@
+Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://github.com/uclouvain/openjpeg/pull/1395/commits/f0727df">https://github.com/uclouvain/openjpeg/pull/1395/commits/f0727df</a>]
+CVE: CVE-2021-29338
+
+Signed-off-by: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>
+
+From f0727df07c4d944d7d1c5002451cfbc9545d3288 Mon Sep 17 00:00:00 2001
+From: Brad Parham <a class="moz-txt-link-rfc2396E" href="mailto:brad.a.parham@intel.com">&lt;brad.a.parham@intel.com&gt;</a>
+Date: Wed, 12 Jan 2022 12:20:28 +0100
+Subject: [PATCH] Fix integer overflow in num_images
+
+Includes the fix for CVE-2021-29338
+Credit to @kaniini based on #1346
+Fixes #1338
+---
+ src/bin/jp2/opj_compress.c   | 4 ++--
+ src/bin/jp2/opj_decompress.c | 5 ++---
+ src/bin/jp2/opj_dump.c       | 7 ++++---
+ 3 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/src/bin/jp2/opj_compress.c b/src/bin/jp2/opj_compress.c
+index 8c71d4536..1399d5277 100644
+--- a/src/bin/jp2/opj_compress.c
++++ b/src/bin/jp2/opj_compress.c
+@@ -1959,9 +1959,9 @@ int main(int argc, char **argv)
+         num_images = get_num_images(img_fol.imgdirpath);
+         dirptr = (dircnt_t*)malloc(sizeof(dircnt_t));
+         if (dirptr) {
+-            dirptr-&gt;filename_buf = (char*)malloc(num_images * OPJ_PATH_LEN * sizeof(
++            dirptr-&gt;filename_buf = (char*)calloc(num_images, OPJ_PATH_LEN * sizeof(
+                     char)); /* Stores at max 10 image file names*/
+-            dirptr-&gt;filename = (char**) malloc(num_images * sizeof(char*));
++            dirptr-&gt;filename = (char**) calloc(num_images, sizeof(char*));
+             if (!dirptr-&gt;filename_buf) {
+                 ret = 0;
+                 goto fin;
+diff --git a/src/bin/jp2/opj_decompress.c b/src/bin/jp2/opj_decompress.c
+index fc0012b63..e1217f891 100644
+--- a/src/bin/jp2/opj_decompress.c
++++ b/src/bin/jp2/opj_decompress.c
+@@ -1374,14 +1374,13 @@ int main(int argc, char **argv)
+             return EXIT_FAILURE;
+         }
+         /* Stores at max 10 image file names */
+-        dirptr-&gt;filename_buf = (char*)malloc(sizeof(char) *
+-                                             (size_t)num_images * OPJ_PATH_LEN);
++        dirptr-&gt;filename_buf = calloc((size_t) num_images, sizeof(char) * OPJ_PATH_LEN);
+         if (!dirptr-&gt;filename_buf) {
+             failed = 1;
+             goto fin;
+         }
+ 
+-        dirptr-&gt;filename = (char**) malloc((size_t)num_images * sizeof(char*));
++        dirptr-&gt;filename = (char**) calloc((size_t) num_images, sizeof(char*));
+ 
+         if (!dirptr-&gt;filename) {
+             failed = 1;
+diff --git a/src/bin/jp2/opj_dump.c b/src/bin/jp2/opj_dump.c
+index 6111d2ab6..d2646f10e 100644
+--- a/src/bin/jp2/opj_dump.c
++++ b/src/bin/jp2/opj_dump.c
+@@ -515,13 +515,14 @@ int main(int argc, char *argv[])
+         if (!dirptr) {
+             return EXIT_FAILURE;
+         }
+-        dirptr-&gt;filename_buf = (char*)malloc((size_t)num_images * OPJ_PATH_LEN * sizeof(
+-                char)); /* Stores at max 10 image file names*/
++        /* Stores at max 10 image file names*/
++        dirptr-&gt;filename_buf = (char*) calloc((size_t) num_images,
++                                              OPJ_PATH_LEN * sizeof(char));
+         if (!dirptr-&gt;filename_buf) {
+             free(dirptr);
+             return EXIT_FAILURE;
+         }
+-        dirptr-&gt;filename = (char**) malloc((size_t)num_images * sizeof(char*));
++        dirptr-&gt;filename = (char**) calloc((size_t) num_images, sizeof(char*));
+ 
+         if (!dirptr-&gt;filename) {
+             goto fails;
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb
index 5a0cf21ef..43e1dd76a 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb
@@ -9,6 +9,7 @@ SRC_URI = &quot; \
     git://github.com/uclouvain/openjpeg.git;branch=master;protocol=https \
     <a class="moz-txt-link-freetext" href="file://0002-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch">file://0002-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch</a> \
     <a class="moz-txt-link-freetext" href="file://0001-This-patch-fixed-include-dir-to-usr-include-.-Obviou.patch">file://0001-This-patch-fixed-include-dir-to-usr-include-.-Obviou.patch</a> \
+    <a class="moz-txt-link-freetext" href="file://CVE-2021-29338.patch">file://CVE-2021-29338.patch</a> \
 &quot;
 SRCREV = &quot;37ac30ceff6640bbab502388c5e0fa0bff23f505&quot;
 S = &quot;${WORKDIR}/git&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#95317): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/95317">https://lists.openembedded.org/g/openembedded-devel/message/95317</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/89160625/3616933">https://lists.openembedded.org/mt/89160625/3616933</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:kai.kang@windriver.com">kai.kang@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Kai Kang
Wind River Linux</pre>
  </body>
</html>

--------------E9198192FE2E3D2A5023B822--

