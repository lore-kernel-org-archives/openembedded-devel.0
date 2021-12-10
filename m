Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7729AC433F5
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 17:32:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.10273.1639157544901290257
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Dec 2021 09:32:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=cki8BL/G;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=7978f41b8c=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BAHK0E3008822
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Dec 2021 09:32:24 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=a+gSzomB0l57tgJp9fC1BfBureuKHXBk4/sdcGTEzKE=;
 b=cki8BL/GcKZwO+BpF8bM3cOvKC8gFlwKBXjDyK8faG3J1PLoTUFO/6cAOP5sejwKyson
 +hC8GPzkYfD0v3IHwRAD0enVatAYwtO2M+w4WVUnUm2v1AkmCQ7E7f6qQ/KJh++kbzSV
 WIpuiUZuEy73/efIEp1lBxcY5r4Sn1mn1WdqrHyyzqS5kunJkoPC5IM7fxdTBimVtM6V
 71rc2j5hK55qwnus+z9Zp1UhuYULK6Ss+9Si2ZIwkZxgfiAql9aMcz41r7L49cNGvOfv
 R6HCnn6GA10Rgw0wU1ZCDFDqYoJ8lh5v36UvhwerU7JFjcoHfSQhB9jEMlQVUKSAtIZN Mw==
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cuu4artxq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Dec 2021 09:32:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l/dVCK86J7X5DlZqni4oJPafzSIpR3k02pzZV0kH7Ub/1smkOLbhQKHZTR5JxDWN2Ql6iDP2pgTHrncFbO0b8EOdP9w4v9ZyOTh1ZUNFmxVZZ1/ha45FtXkI9g9XOVo2hE6Lb7czFjL/MNiBr85psThrVW1aUSXyQGPGIFyhKR19rIVyqJgxCXrpTOVfaMG2an+DmScYrGBX5NuL74yj1hf4Ajdt8Xy15W1uwQYLRYm6+oTOeuEqP4Rg37qPa0FUiCTQ7t9jb33ZbwyVy21gv4YGejJN7JgskMWIyzPveME3uqHkTHb3OzJu8f87FZ4JxZngT1GNeXOC6zPnmNf4yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a+gSzomB0l57tgJp9fC1BfBureuKHXBk4/sdcGTEzKE=;
 b=nCCIhr8+PQ+CQkrM1ut5d+dzQlprBqJuzPyiw7CarNekwHPPK4R6CoT2JGB74gfqZ+xKyBz/yOCd2Fdr7PdDKcV6rPdXj+XG45m/nWXzI+qwSAslMmHkxtPFlhZq1CEU+yk1fbg/j7q3dESoaVOhVqEd1kwlGJEJDWM8pUPjLFbFUHgVI4GjBGqLlvyRHr/qzZaglAqSBre7HvpHV8peJvJoj6htaQbDinYLHz4xcyItLdVT9P/KDOfiEjcg+kVVFozRlPWDL3tRH1jEH8YpBNdgBIgFxSXF1mXRzDo1ufvUoSXKvvw2/IL/o44a9WlFJExOLTDPae9jUv26v1pdlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DM4PR11MB5295.namprd11.prod.outlook.com (2603:10b6:5:392::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.15; Fri, 10 Dec 2021 17:32:21 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::c558:b1bc:4847:ab6f]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::c558:b1bc:4847:ab6f%2]) with mapi id 15.20.4755.024; Fri, 10 Dec 2021
 17:32:21 +0000
Subject: Re: [oe] [meta-perl][PATCH] io-compress-lzma-perl: add recipe for
 version 2.096
To: openembedded-devel@lists.openembedded.org
References: <16BF74E7EBAE8000.32732@lists.openembedded.org>
From: Sakib Sajal <sakib.sajal@windriver.com>
Message-ID: <fa5caabb-6e59-bf39-015d-4b106eeb7ed8@windriver.com>
Date: Fri, 10 Dec 2021 12:32:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <16BF74E7EBAE8000.32732@lists.openembedded.org>
Content-Type: multipart/alternative;
 boundary="------------D5452D9E499BE8C7AA7EDC87"
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0055.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::24) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
Received: from [192.168.2.28] (142.112.186.203) by
 YT1PR01CA0055.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::24) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20 via Frontend
 Transport; Fri, 10 Dec 2021 17:32:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b11154f-d061-494a-a8ab-08d9bc030522
X-MS-TrafficTypeDiagnostic: DM4PR11MB5295:EE_
X-Microsoft-Antispam-PRVS: 
	<DM4PR11MB529500E2C7D66ECEA26A7F09F2719@DM4PR11MB5295.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Epa4LysT0EF4/QxAs4p46mjoPnnA97WjvvCzLV545wCCyNxvOe/K8Ugy7YxPDZOak37X94RqZUWsT1IQwnAps661B8FHzvKkoMNdjBNiajrRNvnenxxzbd/WbeOCUXHjlzyvVZsiA/o/Ciftvnt4PiRMYe7cz+n1vx3UF7xgsSz4Gi00Cagj5moYk5OuwSj5anl2BTVietaRH5Enjl84KEbARkUK8NLmsjsad5j81iilD4sDOc/q9vCaDOjYgXOywmvFdxUOjtdclOnqMyJlSR9SQ2yaPgUpbgTtcVomXFkX9vF88gHrNHSyKJnl3OVS0AabTKSJ+bKGtwTOv4rp1pNemUwsqzu76IuXIC4UL2YFps8avCoD8GvLyJHyJm5UgnwVH7mrjwqRtmh4Zx8yZ0wD4jaB6DePiVs7gDvPQlZ/4oA5/SUlT0wGbmupyXAuj//5TIh1dirgQedU+BG5gG9EcNG4+NmhCI8q47o1S3OWTJCWTsHI819T0wvA0SUa7zRy2Ng2aLDeFMH2qKTi1ludhu5FaXKS/G/6sYn6ca/LE34s5JArnG80/DELcdryWhSQFf2+zqKLOKkpGNHQkAUst2cb3Mcy2JKCrO4SPeSsBN/rxnZ9R42JQzLO7SF6rwr4Ww8dMiQgi48015Og/YaNZn2IEsGFUbjG9uRush03IWhnLLMeSWhod3ArpXmwM5uBr6lwGzRfRRclGG9bwl8cXluGweJ7WFuWDGaefhPG1KTWYkFi7piQC4MhwtimQ48QpZhI3ue7+OXIj1Jf9jZ4ppt4zE3Tn7jjmmw06LDHX8BRX8RcqM1FQjnvyJhaCbGAFmDdfxLTy438QdO74xNPRQ/VNHoFmA+3arsmstKI3o5RF2Bt+0peGi+6q+ev0Ub/kW1kD1lOH6Ybegnu1g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(2616005)(16576012)(508600001)(36756003)(31686004)(6916009)(956004)(166002)(2906002)(8936002)(83380400001)(30864003)(66556008)(31696002)(66946007)(26005)(66476007)(52116002)(5660300002)(33964004)(38100700002)(53546011)(6486002)(4001150100001)(6666004)(44832011)(966005)(86362001)(8676002)(186003)(38350700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dHJDRFI2bE1kaTl4emxQRFlQeDVUbHFlZUFEditKODlmemE5RG15b2pKYmJ2?=
 =?utf-8?B?dTZocm0yZGpON0h5U2ttem5QRXZSNThodG1HMzhtZkI5NUFKaUxzRGJqUTda?=
 =?utf-8?B?T0VDQmd1bHZGeE9wUTdvUXNYbEsxbnluK1VQWnlHSU5uUWdvTkI3WVg1dytK?=
 =?utf-8?B?NHhhTWRZZUtHazhFVTZDazZmbVZQY0RKRkc3NUpsNGcrd0NjaXE1YWVmRVFn?=
 =?utf-8?B?RnhwRC9vdFF3bk91elVMckxVbGNheHdRSTYxMHUrVXhNeTRWeXdnekZ3R3hu?=
 =?utf-8?B?ZGJHMHNtSU52U0ZLYW45Sjd1cVE3SEsyU25reVhlQzNCTFZ3RG85Y0h4RklC?=
 =?utf-8?B?V2l1V1BGSFBLSnpWSlYxTzlzckVnRU1VMzVMUkt2NkpXNDZzc0IyUjlxN0F1?=
 =?utf-8?B?eWpDR0xHYUMxQzRQLzRodEZOaW1Tc09SaFlYK3pDSHdiU3R4OTgwTFZOcEVL?=
 =?utf-8?B?TnlETUVOUWJhSmpidjRDSlMwMGJjVDJmSC9aWE5VTGs0bld0Q1pNTE5lRGdQ?=
 =?utf-8?B?L1BGUE5kRkNYUkhCRHBWTlcxSW1LMDUzeEtvc2NSWlk0ZE9KcVpRTVFBSEYx?=
 =?utf-8?B?SWR5d1BvRm5ZQUhKMXlaeHovenp0cmlxV1dUVThaUDkvMVJleEZNVUM5VVov?=
 =?utf-8?B?RlJjREVPVk95dm9BSDdRWWp4d1U4MXBLYmQ1Z0RmMk50VFhwRElxTG1VU2Qv?=
 =?utf-8?B?ZEdvYU85S1o4MTdVSHhwMm1Hdy9CYXVqZ2dnRTM1T2ZIWDBhMmVnY255OXJG?=
 =?utf-8?B?NnpGVTZvZjZmRmMxRW1pSXNqWWl2U1dEQ2pHS3NBUHhqaEhsVFNGb2g2VmhW?=
 =?utf-8?B?VWFrY0NMNVR5S3VzT1FKbnNiVThxZTVQVWUvRG5Dbng0NUQ3VkgyaEMvV2cw?=
 =?utf-8?B?dkpCb0ROSkI1TUY3aVB2RWNRZjZpS0cwbkFRVXZ2WlJraDk2RkN6RVYvdVdm?=
 =?utf-8?B?T2pzQkYwTi9jM2tBV1NBaXBqUmx4Y01DNzh3SmsxWmdtQ0NMOFp3MXFOZ2tK?=
 =?utf-8?B?bGFOWTNlbGl4UG1zOThnWjdkQTNMTEwwS1g1eStOeHd2Q2NSQXA3N2EzSSs0?=
 =?utf-8?B?bkIwTVo2OEtKYWVqL3haUDEzTzJXTjFiUi9nc0xtdDdmK1lZYWFOZGtIWmxk?=
 =?utf-8?B?K3BCTW9KTTdONmdnN2pmelh5R2VRMjJndXdvN2J3OFdiUWNJallZRFgwaHlN?=
 =?utf-8?B?WmNQbTMza3NpS0grSnN5T2o5ZXA3aW1VZE1HK0RyUjRZRXlEaWYwNVJkeHBD?=
 =?utf-8?B?dFRrZk5IajUrODA0eWFGV3VEcy9iMGlkNEhBZHY1YjNCYnd1eHo1aFV3Umdz?=
 =?utf-8?B?THljU2dBbGJ5S2dIbC81M1c1Z09QSGI1NVB3d3pWNXlQa1dGYWhUR3l5cnY2?=
 =?utf-8?B?ejlUMTZYY0g3L3RUTVpLazZYdHZESWhIQnJsVDlFOUdBdEN5RHhOM1l6VjRu?=
 =?utf-8?B?OFc5MTRxbDY5MnFoczRZL2Q4L0hyOVZhdlVWWk9zVFYrR05QaWNoZ2xXckVJ?=
 =?utf-8?B?UVAzK1dTZWowd0k5VkU1Wi9maHAwSHZuOU93QXZva1phS1hQTy9qNkhvOFdX?=
 =?utf-8?B?aEVkUzFuaFhxZDFzK3lhdUpPOFhkcllFaWd1a25qK3B0VU9vSUdKQmp3c2E3?=
 =?utf-8?B?RlZyb3krM2o2ak1TMjlKaXFZQ1JkcE5ybnhwUyttS2FTWFpoSmtTNjBqMkRS?=
 =?utf-8?B?bmpRT2dNV0NsYW5iQi8vWE9MVjRlamRYQ1lmbUFvVThaRjJpZGdYaklDRWtP?=
 =?utf-8?B?c1BrNTlqS3k4ZDB5WTliS2QwTGRNM0VtejNuNFRMeGNHTnVqbUUyVStyR3BV?=
 =?utf-8?B?UUtSMnJzODVpbURwcm9reU9jYytQYlJmV1hjeEpkWnoxVmpNaERVU3pKOTUx?=
 =?utf-8?B?MmF4NEwzWEcraFlvZW1OSjBLczBqNnZBK251UTRyZmFFQ1hvRXp0dzRlVUxI?=
 =?utf-8?B?RURUOFNyVXRaMGI3bkFlZTA1M3h1ZjFCZDRQc1VMaHd5V0pKK3d3SmNBWGY1?=
 =?utf-8?B?Tnd0cW9WemxwYW9iRitmUlkrZ0NKejR1a01CK3ZYeVg5UFhHRlhCdjNiYkZI?=
 =?utf-8?B?T2RjU0lUQzRYNjUweUN1Tlg3dUpraXJKQXU1a2ZGakcwZCtnMTRhMkR2S1BC?=
 =?utf-8?B?ZXhWSTZtbHRwM1VkaDlWYjVESmI2MFJ1Z0hGdmhPa1B5Nm5hMUV6czF0Qkk2?=
 =?utf-8?B?RVBRR1J0dGNSb2JFZElJWkcxaC9HTkRsWnlZTWpzcEFEOVJKaWZsSnFoQTZH?=
 =?utf-8?Q?x+uu6EeJW4811hLYvNjLLtI7kLw2HjGGCbP0/3ZJfs=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5b11154f-d061-494a-a8ab-08d9bc030522
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 17:32:20.8266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Fh0as88CX0O8LykdcCQ2dl0yjzJVEmInjTgevjOUnxtNubbdB3pZ7OeuYLfS4QmHw3GNOj2Fb65Ovb3Da4KIwKBxrl9qjV/e9CKHLbJGF3k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5295
X-Proofpoint-ORIG-GUID: 4NEk1asvcq28-sF38oV3bMwDQHfdcl6f
X-Proofpoint-GUID: 4NEk1asvcq28-sF38oV3bMwDQHfdcl6f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-10_06,2021-12-10_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 spamscore=0 clxscore=1011 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 phishscore=0 mlxscore=0
 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112100098
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Dec 2021 17:32:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94275

--------------D5452D9E499BE8C7AA7EDC87
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

PLEASE DISREGARD

On 2021-12-10 12:28 p.m., Sakib Sajal wrote:
> Add recipe for io-compress-lzma-perl and all the dependencies.
>
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>   .../libio/compress-raw-bzip2-perl_2.096.bb    | 32 +++++++++++++++++++
>   .../libio/compress-raw-lzma-perl_2.096.bb     | 32 +++++++++++++++++++
>   .../libio/compress-raw-zlib-perl_2.096.bb     | 31 ++++++++++++++++++
>   .../libio/io-compress-lzma-perl_2.096.bb      | 24 ++++++++++++++
>   .../libio/io-compress-perl_2.096.bb           | 24 ++++++++++++++
>   5 files changed, 143 insertions(+)
>   create mode 100644 meta-perl/recipes-perl/libio/compress-raw-bzip2-perl_2.096.bb
>   create mode 100644 meta-perl/recipes-perl/libio/compress-raw-lzma-perl_2.096.bb
>   create mode 100644 meta-perl/recipes-perl/libio/compress-raw-zlib-perl_2.096.bb
>   create mode 100644 meta-perl/recipes-perl/libio/io-compress-lzma-perl_2.096.bb
>   create mode 100644 meta-perl/recipes-perl/libio/io-compress-perl_2.096.bb
>
> diff --git a/meta-perl/recipes-perl/libio/compress-raw-bzip2-perl_2.096.bb b/meta-perl/recipes-perl/libio/compress-raw-bzip2-perl_2.096.bb
> new file mode 100644
> index 000000000..272f7c5f3
> --- /dev/null
> +++ b/meta-perl/recipes-perl/libio/compress-raw-bzip2-perl_2.096.bb
> @@ -0,0 +1,32 @@
> +DESCRIPTION = ""Compress::Raw::Bzip2" provides an interface to the in-memory \
> +compression/uncompression functions from the bzip2 compression library."
> +
> +SECTION = "libs"
> +LICENSE = "Artisticv1 | GPLv1+"
> +
> +MAINTAINER=	"Poky <poky@yoctoproject.org>"
> +HOMEPAGE=	"https://metacpan.org/release/Compress-Raw-Bzip2"
> +
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
> +file://${COMMON_LICENSE_DIR}/GPL-1.0-only;md5=e9e36a9de734199567a4d769498f743d"
> +
> +SRC_URI = "https://cpan.metacpan.org/authors/id/P/PM/PMQS/Compress-Raw-Bzip2-2.096.tar.gz"
> +
> +SRC_URI[md5sum] = "4fdb7ea5071e4b774c52c37331386355"
> +SRC_URI[sha256sum] = "a564e7634eca7740c5487d01effe1461e9e51b8909e69b3d8f5be98997958cbe"
> +
> +DEPENDS += "bzip2"
> +
> +S = "${WORKDIR}/Compress-Raw-Bzip2-${PV}"
> +
> +inherit cpan
> +
> +export BUILD_BZIP2="0"
> +export BZIP2_INCLUDE="-I${STAGING_DIR_HOST}${includedir}"
> +
> +do_compile() {
> +	export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')"
> +	cpan_do_compile
> +}
> +
> +BBCLASSEXTEND = "native"
> diff --git a/meta-perl/recipes-perl/libio/compress-raw-lzma-perl_2.096.bb b/meta-perl/recipes-perl/libio/compress-raw-lzma-perl_2.096.bb
> new file mode 100644
> index 000000000..38655892a
> --- /dev/null
> +++ b/meta-perl/recipes-perl/libio/compress-raw-lzma-perl_2.096.bb
> @@ -0,0 +1,32 @@
> +DESCRIPTION = ""Compress::Raw::Lzma" provides an interface to the in-memory \
> +compression/uncompression functions from the lzma compression library."
> +
> +SECTION = "libs"
> +LICENSE = "Artisticv1 | GPLv1+"
> +
> +MAINTAINER=	"Poky <poky@yoctoproject.org>"
> +HOMEPAGE=	"https://metacpan.org/release/Compress-Raw-Lzma"
> +
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
> +file://${COMMON_LICENSE_DIR}/GPL-1.0-only;md5=e9e36a9de734199567a4d769498f743d"
> +
> +SRC_URI = "https://cpan.metacpan.org/authors/id/P/PM/PMQS/Compress-Raw-Lzma-2.096.tar.gz"
> +
> +SRC_URI[md5sum] = "b5079bb43712fcd1e74b80777fa376ed"
> +SRC_URI[sha256sum] = "f3afb267b1303b0f125976e9e4a70c6a4a205e35e7c99b408911f5e5c6578217"
> +
> +DEPENDS += "xz"
> +
> +S = "${WORKDIR}/Compress-Raw-Lzma-${PV}"
> +
> +inherit cpan
> +
> +export LIBLZMA_INCLUDE="-I${STAGING_DIR_HOST}${includedir}"
> +export LIBLZMA_LIB="-I${STAGING_DIR_HOST}${libdir}"
> +
> +do_compile() {
> +	export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')"
> +	cpan_do_compile
> +}
> +
> +BBCLASSEXTEND = "native"
> diff --git a/meta-perl/recipes-perl/libio/compress-raw-zlib-perl_2.096.bb b/meta-perl/recipes-perl/libio/compress-raw-zlib-perl_2.096.bb
> new file mode 100644
> index 000000000..8b2ab1459
> --- /dev/null
> +++ b/meta-perl/recipes-perl/libio/compress-raw-zlib-perl_2.096.bb
> @@ -0,0 +1,31 @@
> +DESCRIPTION = "The *Compress::Raw::Zlib* module provides a Perl interface to the *zlib* \
> +compression library (see "AUTHOR" for details about where to get *zlib*)."
> +
> +SECTION = "libs"
> +LICENSE = "Artisticv1 | GPLv1+"
> +
> +MAINTAINER=	"Poky <poky@yoctoproject.org>"
> +HOMEPAGE=	"https://metacpan.org/release/Compress-Raw-Zlib"
> +
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
> +file://${COMMON_LICENSE_DIR}/GPL-1.0-only;md5=e9e36a9de734199567a4d769498f743d"
> +
> +SRC_URI = "https://cpan.metacpan.org/authors/id/P/PM/PMQS/Compress-Raw-Zlib-2.096.tar.gz"
> +
> +SRC_URI[md5sum] = "4144ecdd901231553447998cf8035e4a"
> +SRC_URI[sha256sum] = "cd4cba20c159a7748b8bc91278524a7da70573d9531fde62298609a5f1c65912"
> +
> +DEPENDS += "zlib"
> +
> +S = "${WORKDIR}/Compress-Raw-Zlib-${PV}"
> +
> +inherit cpan
> +
> +export BUILD_ZLIB="0"
> +
> +do_compile() {
> +	export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')"
> +	cpan_do_compile
> +}
> +
> +BBCLASSEXTEND = "native"
> diff --git a/meta-perl/recipes-perl/libio/io-compress-lzma-perl_2.096.bb b/meta-perl/recipes-perl/libio/io-compress-lzma-perl_2.096.bb
> new file mode 100644
> index 000000000..a5c773551
> --- /dev/null
> +++ b/meta-perl/recipes-perl/libio/io-compress-lzma-perl_2.096.bb
> @@ -0,0 +1,24 @@
> +DESCRIPTION = "This module provides a Perl interface that allows writing lzma compressed \
> +data to files or buffer."
> +
> +SECTION = "libs"
> +LICENSE = "Artisticv1 | GPLv1+"
> +
> +MAINTAINER=	"Poky <poky@yoctoproject.org>"
> +HOMEPAGE=	"https://metacpan.org/release/IO-Compress-Lzma"
> +
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
> +file://${COMMON_LICENSE_DIR}/GPL-1.0-only;md5=e9e36a9de734199567a4d769498f743d"
> +
> +SRC_URI = "https://cpan.metacpan.org/authors/id/P/PM/PMQS/IO-Compress-Lzma-2.096.tar.gz"
> +
> +SRC_URI[md5sum] = "6c1b70740605b8073e4fbb5ba1e7bbdb"
> +SRC_URI[sha256sum] = "2f29125f19bb41d29c4b5a2467e3560b7bce5d428176a046b7c8a51609dce6e8"
> +RDEPENDS:${PN} += "compress-raw-lzma-perl"
> +RDEPENDS:${PN} += "io-compress-perl"
> +
> +S = "${WORKDIR}/IO-Compress-Lzma-${PV}"
> +
> +inherit cpan allarch
> +
> +BBCLASSEXTEND = "native"
> diff --git a/meta-perl/recipes-perl/libio/io-compress-perl_2.096.bb b/meta-perl/recipes-perl/libio/io-compress-perl_2.096.bb
> new file mode 100644
> index 000000000..01580db03
> --- /dev/null
> +++ b/meta-perl/recipes-perl/libio/io-compress-perl_2.096.bb
> @@ -0,0 +1,24 @@
> +DESCRIPTION = "This module is not intended for direct use in application code. Its sole \
> +purpose is to be sub-classed by IO::Compress modules."
> +
> +SECTION = "libs"
> +LICENSE = "Artisticv1 | GPLv1+"
> +
> +MAINTAINER=	"Poky <poky@yoctoproject.org>"
> +HOMEPAGE=	"https://metacpan.org/release/IO-Compress"
> +
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
> +file://${COMMON_LICENSE_DIR}/GPL-1.0-only;md5=e9e36a9de734199567a4d769498f743d"
> +
> +SRC_URI = "https://cpan.metacpan.org/authors/id/P/PM/PMQS/IO-Compress-2.096.tar.gz"
> +
> +SRC_URI[md5sum] = "18ad197cad5ca87bc3a7d2538998e017"
> +SRC_URI[sha256sum] = "9d219fd5df4b490b5d2f847921e3cb1c3392758fa0bae9b05a8992b3620ba572"
> +RDEPENDS:${PN} += "compress-raw-bzip2-perl"
> +RDEPENDS:${PN} += "compress-raw-zlib-perl"
> +
> +S = "${WORKDIR}/IO-Compress-${PV}"
> +
> +inherit cpan allarch
> +
> +BBCLASSEXTEND = "native"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94273): https://lists.openembedded.org/g/openembedded-devel/message/94273
> Mute This Topic: https://lists.openembedded.org/mt/87641040/4422444
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [sakib.sajal@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

--------------D5452D9E499BE8C7AA7EDC87
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>PLEASE DISREGARD<br>
    </p>
    <div class="moz-cite-prefix">On 2021-12-10 12:28 p.m., Sakib Sajal
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:16BF74E7EBAE8000.32732@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">Add recipe for io-compress-lzma-perl and all the dependencies.

Signed-off-by: Sakib Sajal <a class="moz-txt-link-rfc2396E" href="mailto:sakib.sajal@windriver.com">&lt;sakib.sajal@windriver.com&gt;</a>
---
 .../libio/compress-raw-bzip2-perl_2.096.bb    | 32 +++++++++++++++++++
 .../libio/compress-raw-lzma-perl_2.096.bb     | 32 +++++++++++++++++++
 .../libio/compress-raw-zlib-perl_2.096.bb     | 31 ++++++++++++++++++
 .../libio/io-compress-lzma-perl_2.096.bb      | 24 ++++++++++++++
 .../libio/io-compress-perl_2.096.bb           | 24 ++++++++++++++
 5 files changed, 143 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libio/compress-raw-bzip2-perl_2.096.bb
 create mode 100644 meta-perl/recipes-perl/libio/compress-raw-lzma-perl_2.096.bb
 create mode 100644 meta-perl/recipes-perl/libio/compress-raw-zlib-perl_2.096.bb
 create mode 100644 meta-perl/recipes-perl/libio/io-compress-lzma-perl_2.096.bb
 create mode 100644 meta-perl/recipes-perl/libio/io-compress-perl_2.096.bb

diff --git a/meta-perl/recipes-perl/libio/compress-raw-bzip2-perl_2.096.bb b/meta-perl/recipes-perl/libio/compress-raw-bzip2-perl_2.096.bb
new file mode 100644
index 000000000..272f7c5f3
--- /dev/null
+++ b/meta-perl/recipes-perl/libio/compress-raw-bzip2-perl_2.096.bb
@@ -0,0 +1,32 @@
+DESCRIPTION = &quot;&quot;Compress::Raw::Bzip2&quot; provides an interface to the in-memory \
+compression/uncompression functions from the bzip2 compression library.&quot;
+
+SECTION = &quot;libs&quot;
+LICENSE = &quot;Artisticv1 | GPLv1+&quot;
+
+MAINTAINER=	&quot;Poky <a class="moz-txt-link-rfc2396E" href="mailto:poky@yoctoproject.org">&lt;poky@yoctoproject.org&gt;</a>&quot;
+HOMEPAGE=	<a class="moz-txt-link-rfc2396E" href="https://metacpan.org/release/Compress-Raw-Bzip2">&quot;https://metacpan.org/release/Compress-Raw-Bzip2&quot;</a>
+
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798\+file://${COMMON_LICENSE_DIR}/GPL-1.0-only;md5=e9e36a9de734199567a4d769498f743d">&quot;file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
+file://${COMMON_LICENSE_DIR}/GPL-1.0-only;md5=e9e36a9de734199567a4d769498f743d&quot;</a>
+
+SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://cpan.metacpan.org/authors/id/P/PM/PMQS/Compress-Raw-Bzip2-2.096.tar.gz">&quot;https://cpan.metacpan.org/authors/id/P/PM/PMQS/Compress-Raw-Bzip2-2.096.tar.gz&quot;</a>
+
+SRC_URI[md5sum] = &quot;4fdb7ea5071e4b774c52c37331386355&quot;
+SRC_URI[sha256sum] = &quot;a564e7634eca7740c5487d01effe1461e9e51b8909e69b3d8f5be98997958cbe&quot;
+
+DEPENDS += &quot;bzip2&quot;
+
+S = &quot;${WORKDIR}/Compress-Raw-Bzip2-${PV}&quot;
+
+inherit cpan
+
+export BUILD_BZIP2=&quot;0&quot;
+export BZIP2_INCLUDE=&quot;-I${STAGING_DIR_HOST}${includedir}&quot;
+
+do_compile() {
+	export LIBC=&quot;$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')&quot;
+	cpan_do_compile
+}
+
+BBCLASSEXTEND = &quot;native&quot;
diff --git a/meta-perl/recipes-perl/libio/compress-raw-lzma-perl_2.096.bb b/meta-perl/recipes-perl/libio/compress-raw-lzma-perl_2.096.bb
new file mode 100644
index 000000000..38655892a
--- /dev/null
+++ b/meta-perl/recipes-perl/libio/compress-raw-lzma-perl_2.096.bb
@@ -0,0 +1,32 @@
+DESCRIPTION = &quot;&quot;Compress::Raw::Lzma&quot; provides an interface to the in-memory \
+compression/uncompression functions from the lzma compression library.&quot;
+
+SECTION = &quot;libs&quot;
+LICENSE = &quot;Artisticv1 | GPLv1+&quot;
+
+MAINTAINER=	&quot;Poky <a class="moz-txt-link-rfc2396E" href="mailto:poky@yoctoproject.org">&lt;poky@yoctoproject.org&gt;</a>&quot;
+HOMEPAGE=	<a class="moz-txt-link-rfc2396E" href="https://metacpan.org/release/Compress-Raw-Lzma">&quot;https://metacpan.org/release/Compress-Raw-Lzma&quot;</a>
+
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798\+file://${COMMON_LICENSE_DIR}/GPL-1.0-only;md5=e9e36a9de734199567a4d769498f743d">&quot;file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
+file://${COMMON_LICENSE_DIR}/GPL-1.0-only;md5=e9e36a9de734199567a4d769498f743d&quot;</a>
+
+SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://cpan.metacpan.org/authors/id/P/PM/PMQS/Compress-Raw-Lzma-2.096.tar.gz">&quot;https://cpan.metacpan.org/authors/id/P/PM/PMQS/Compress-Raw-Lzma-2.096.tar.gz&quot;</a>
+
+SRC_URI[md5sum] = &quot;b5079bb43712fcd1e74b80777fa376ed&quot;
+SRC_URI[sha256sum] = &quot;f3afb267b1303b0f125976e9e4a70c6a4a205e35e7c99b408911f5e5c6578217&quot;
+
+DEPENDS += &quot;xz&quot;
+
+S = &quot;${WORKDIR}/Compress-Raw-Lzma-${PV}&quot;
+
+inherit cpan
+
+export LIBLZMA_INCLUDE=&quot;-I${STAGING_DIR_HOST}${includedir}&quot;
+export LIBLZMA_LIB=&quot;-I${STAGING_DIR_HOST}${libdir}&quot;
+
+do_compile() {
+	export LIBC=&quot;$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')&quot;
+	cpan_do_compile
+}
+
+BBCLASSEXTEND = &quot;native&quot;
diff --git a/meta-perl/recipes-perl/libio/compress-raw-zlib-perl_2.096.bb b/meta-perl/recipes-perl/libio/compress-raw-zlib-perl_2.096.bb
new file mode 100644
index 000000000..8b2ab1459
--- /dev/null
+++ b/meta-perl/recipes-perl/libio/compress-raw-zlib-perl_2.096.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = &quot;The *Compress::Raw::Zlib* module provides a Perl interface to the *zlib* \
+compression library (see &quot;AUTHOR&quot; for details about where to get *zlib*).&quot;
+
+SECTION = &quot;libs&quot;
+LICENSE = &quot;Artisticv1 | GPLv1+&quot;
+
+MAINTAINER=	&quot;Poky <a class="moz-txt-link-rfc2396E" href="mailto:poky@yoctoproject.org">&lt;poky@yoctoproject.org&gt;</a>&quot;
+HOMEPAGE=	<a class="moz-txt-link-rfc2396E" href="https://metacpan.org/release/Compress-Raw-Zlib">&quot;https://metacpan.org/release/Compress-Raw-Zlib&quot;</a>
+
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798\+file://${COMMON_LICENSE_DIR}/GPL-1.0-only;md5=e9e36a9de734199567a4d769498f743d">&quot;file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
+file://${COMMON_LICENSE_DIR}/GPL-1.0-only;md5=e9e36a9de734199567a4d769498f743d&quot;</a>
+
+SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://cpan.metacpan.org/authors/id/P/PM/PMQS/Compress-Raw-Zlib-2.096.tar.gz">&quot;https://cpan.metacpan.org/authors/id/P/PM/PMQS/Compress-Raw-Zlib-2.096.tar.gz&quot;</a>
+
+SRC_URI[md5sum] = &quot;4144ecdd901231553447998cf8035e4a&quot;
+SRC_URI[sha256sum] = &quot;cd4cba20c159a7748b8bc91278524a7da70573d9531fde62298609a5f1c65912&quot;
+
+DEPENDS += &quot;zlib&quot;
+
+S = &quot;${WORKDIR}/Compress-Raw-Zlib-${PV}&quot;
+
+inherit cpan
+
+export BUILD_ZLIB=&quot;0&quot;
+
+do_compile() {
+	export LIBC=&quot;$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')&quot;
+	cpan_do_compile
+}
+
+BBCLASSEXTEND = &quot;native&quot;
diff --git a/meta-perl/recipes-perl/libio/io-compress-lzma-perl_2.096.bb b/meta-perl/recipes-perl/libio/io-compress-lzma-perl_2.096.bb
new file mode 100644
index 000000000..a5c773551
--- /dev/null
+++ b/meta-perl/recipes-perl/libio/io-compress-lzma-perl_2.096.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = &quot;This module provides a Perl interface that allows writing lzma compressed \
+data to files or buffer.&quot;
+
+SECTION = &quot;libs&quot;
+LICENSE = &quot;Artisticv1 | GPLv1+&quot;
+
+MAINTAINER=	&quot;Poky <a class="moz-txt-link-rfc2396E" href="mailto:poky@yoctoproject.org">&lt;poky@yoctoproject.org&gt;</a>&quot;
+HOMEPAGE=	<a class="moz-txt-link-rfc2396E" href="https://metacpan.org/release/IO-Compress-Lzma">&quot;https://metacpan.org/release/IO-Compress-Lzma&quot;</a>
+
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798\+file://${COMMON_LICENSE_DIR}/GPL-1.0-only;md5=e9e36a9de734199567a4d769498f743d">&quot;file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
+file://${COMMON_LICENSE_DIR}/GPL-1.0-only;md5=e9e36a9de734199567a4d769498f743d&quot;</a>
+
+SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://cpan.metacpan.org/authors/id/P/PM/PMQS/IO-Compress-Lzma-2.096.tar.gz">&quot;https://cpan.metacpan.org/authors/id/P/PM/PMQS/IO-Compress-Lzma-2.096.tar.gz&quot;</a>
+
+SRC_URI[md5sum] = &quot;6c1b70740605b8073e4fbb5ba1e7bbdb&quot;
+SRC_URI[sha256sum] = &quot;2f29125f19bb41d29c4b5a2467e3560b7bce5d428176a046b7c8a51609dce6e8&quot;
+RDEPENDS:${PN} += &quot;compress-raw-lzma-perl&quot;
+RDEPENDS:${PN} += &quot;io-compress-perl&quot;
+
+S = &quot;${WORKDIR}/IO-Compress-Lzma-${PV}&quot;
+
+inherit cpan allarch
+
+BBCLASSEXTEND = &quot;native&quot;
diff --git a/meta-perl/recipes-perl/libio/io-compress-perl_2.096.bb b/meta-perl/recipes-perl/libio/io-compress-perl_2.096.bb
new file mode 100644
index 000000000..01580db03
--- /dev/null
+++ b/meta-perl/recipes-perl/libio/io-compress-perl_2.096.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = &quot;This module is not intended for direct use in application code. Its sole \
+purpose is to be sub-classed by IO::Compress modules.&quot;
+
+SECTION = &quot;libs&quot;
+LICENSE = &quot;Artisticv1 | GPLv1+&quot;
+
+MAINTAINER=	&quot;Poky <a class="moz-txt-link-rfc2396E" href="mailto:poky@yoctoproject.org">&lt;poky@yoctoproject.org&gt;</a>&quot;
+HOMEPAGE=	<a class="moz-txt-link-rfc2396E" href="https://metacpan.org/release/IO-Compress">&quot;https://metacpan.org/release/IO-Compress&quot;</a>
+
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798\+file://${COMMON_LICENSE_DIR}/GPL-1.0-only;md5=e9e36a9de734199567a4d769498f743d">&quot;file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
+file://${COMMON_LICENSE_DIR}/GPL-1.0-only;md5=e9e36a9de734199567a4d769498f743d&quot;</a>
+
+SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://cpan.metacpan.org/authors/id/P/PM/PMQS/IO-Compress-2.096.tar.gz">&quot;https://cpan.metacpan.org/authors/id/P/PM/PMQS/IO-Compress-2.096.tar.gz&quot;</a>
+
+SRC_URI[md5sum] = &quot;18ad197cad5ca87bc3a7d2538998e017&quot;
+SRC_URI[sha256sum] = &quot;9d219fd5df4b490b5d2f847921e3cb1c3392758fa0bae9b05a8992b3620ba572&quot;
+RDEPENDS:${PN} += &quot;compress-raw-bzip2-perl&quot;
+RDEPENDS:${PN} += &quot;compress-raw-zlib-perl&quot;
+
+S = &quot;${WORKDIR}/IO-Compress-${PV}&quot;
+
+inherit cpan allarch
+
+BBCLASSEXTEND = &quot;native&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#94273): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/94273">https://lists.openembedded.org/g/openembedded-devel/message/94273</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/87641040/4422444">https://lists.openembedded.org/mt/87641040/4422444</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:sakib.sajal@windriver.com">sakib.sajal@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------D5452D9E499BE8C7AA7EDC87--

