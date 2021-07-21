Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.693.1626909111511361116
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jul 2021 16:11:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=kHlVuf9K;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=28368f3232=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16LMkmSI009610
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jul 2021 16:11:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=sT7HGh0KhPzyilanNaIyRameAB5uJSPFiLWzFpn37vE=;
 b=kHlVuf9KTyGiU517CLblHnm9+QBMMid5l+d9PBfWgZ4bc5QjJfwgh1UKrLlsyJ9cbVaI
 cj8PjSrs9DjOsgRitBVK1Fa9qFQKPgM+1W09w+mlDjUW8YShcvWUDSnzHV0TF6QzPOel
 DH6wS+dU/JyiGgn9UgVW1BEvZD3gQMsX+Mr3+3bBj4SVO67i/luGWcDJliJ4ea9BKiZu
 /san3ZgE9mx1AlS3AfqEsQzCUJgpg2CdGhhir8l0XDfobUACkpyFG1TIYTef055tV/Mz
 VgzRxlrmYizZ/n4WtrMpOJPeLUNakpuCw4HEBahTreEHAaC9Wp8FxcrxHk0AX8MaNDCX Ng== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
	by mx0a-0064b401.pphosted.com with ESMTP id 39xb1h8rws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jul 2021 16:11:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SQuQHDfNAaSyzyYiSQvjvEmFxyqWoCQw/3MaassAte5z0B5XuwaB/W5Xs9eUAyZwrt+OxKcpBsQJJ+gB6D57utZdWegTIJgw8CCmhBM4CKobO+dxvokXgc8+3C4WdPD9jXjxUOluSok72EVOU5HG/Ga9/dTkAF2pNitxbhxQfF9FjbgeH6LRlQklH5izoRpknKyZyXidYl36TwJVV5YSKh9joxtaySTuAcadJCv7j2+Vc4cuitYg7QNW8uKlFS9nWv39oQjaAzPmkTh1YUIgHYO03IZ/PQIJKrT4oemIfN4c4dS4NI1sLQugWR4KxIU7catwcXiMfnxnmK1hHI370g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sT7HGh0KhPzyilanNaIyRameAB5uJSPFiLWzFpn37vE=;
 b=SykDyIECUnZFjYR5AraTbC4ldDGOQLYfkbyc4maL9kChkkEU8oABOupNME9P/VDb7cDXVg8RTjKVFOt6n+9CIoMpYRKRMn8ibRbkSbjCUCgsFT0mBv2xVHlawbLJw8xp9MrlzT7twgHMBSwSYXf9VDu7sJcUD8mAGhFa26DwK8NBxCJUk2SMR6VpbbNLitqR9mp+8YTlZ2Y9gK5b8xJBLoQNlGPevvKzcc6V+ux2tC81BLxFu/15cjtmk/hrbCIGqBJk6VogNDkOQTHusQYRgsV80KAa3sRpjjy5KWiiD9N9qGTLnTbTME9kPKNLK0PvjIvMeXRukHzZAxrz5YMQTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM5PR11MB1675.namprd11.prod.outlook.com (2603:10b6:4:d::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.26; Wed, 21 Jul 2021 23:11:49 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::c413:9f51:c32e:a579]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::c413:9f51:c32e:a579%6]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 23:11:49 +0000
Subject: Re: [hardknott][meta-python][PATCH 1/1] python3-pillow: Upgrade 8.2.0 -> 8.3.1
To: Joe Slater <joe.slater@windriver.com>,
        openembedded-devel@lists.openembedded.org
References: <20210721202801.27916-1-joe.slater@windriver.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <107cd529-e534-03fd-0e72-298327cf972b@windriver.com>
Date: Wed, 21 Jul 2021 19:11:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210721202801.27916-1-joe.slater@windriver.com>
X-ClientProxiedBy: SJ0PR05CA0059.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::34) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by SJ0PR05CA0059.namprd05.prod.outlook.com (2603:10b6:a03:33f::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.11 via Frontend Transport; Wed, 21 Jul 2021 23:11:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b79fd4ad-806e-4fdd-fcbc-08d94c9ceb1b
X-MS-TrafficTypeDiagnostic: DM5PR11MB1675:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB167510250A0E5F9C7EF9A43CF8E39@DM5PR11MB1675.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:568;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tsqAWsM3ycdkhHcla49FjpQojn10iuuk/Ewj+sHRbn9CdZWz8ZpydkZWsk5hmtaaUYC98+HRalv66d1WYKAvQLErKkDNbw99Ls5G5/2RUEl95pRLHLq+PdNdScC+l6PsyJDUcxazE9UCcXjotrKqANEp4IIoC5L0zGURYvtF/EVDR/c4qvhV9PPP8tlmi1k4R8DI8V5dffwMaR5LClXyhyoLUnvpMPjkkScfVHGvWKCZb5UmVzwa7tk1aKnJ7UvheePeztINIbTxFS2UEVDqSZ97sq0tLk6sxBxcFR0n44mN7z7BVLU+D8PgEySx6bM/7BA2NFJSP8TE8C/+UiI1ol1xX3v8tuZXhFjA5Dxnc7FnzpxtxD+QHC0rgrlZ+OgX5JZ+JzaV3PFbe0x6pL2n+Z1TujI8DRgYmytsLpEk8+Mr0jl/AXPgF0ZQr24Ezby2YbOu004bDeg+i3qBeSakHinpiCk3VXLTHU3mPa/tEnQWft9/1kaVRbxVnSfPUD4pyC0ifFIRXKoc7s6uFLj2ajHixiG72xTAYlW0TqJxnuA4P/2U/J0WOVgysvBIglFMpP0za6jctM5Fgm/VJMNq5YtmLjDy0ehI7kYEfZfvxm1EQMXnTmIT3SK7X8BJWpsHdIv8aYEZ7G3wOzEbkb+A5+2NV7F4qgvi+hY5gW2QhZhgwIohsralFgFKa7KuZN2YQiBQBheOUXfw3CcY7UC5iCsfsepI0ergVSdQ0vUxvHUsuGCyC15JBfrEYezOtcXWRq/Y22mckRrWwNqVbT+vmg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(346002)(39850400004)(376002)(31696002)(5660300002)(966005)(36756003)(2616005)(66556008)(66476007)(478600001)(2906002)(956004)(66946007)(53546011)(186003)(52116002)(38100700002)(38350700002)(316002)(16576012)(31686004)(86362001)(83380400001)(6486002)(8676002)(26005)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?czJOSkVCZndnSi9La2pqa0ZkL1lBN1B0SlkxMU1GN2NDYmw5aUR5SEkrMWtR?=
 =?utf-8?B?blZOU21VMFhFOG0rUzdMU0lNNUIwanNCVENwTVprS05MaG0vdjlIeHNBWnhJ?=
 =?utf-8?B?aDBPWXlFdWhNOGpwcnd4S2ZlYVBla1FLSUEvNmoxRDd3d0VpY2thL2NTL0R0?=
 =?utf-8?B?eDFDNGZ3aWZwRC93ZDJlNEJ0Y0lZV2tlYm5lYU9LamIzZU0zcERBQXlhcE9n?=
 =?utf-8?B?dzFkSS95S0QrRFUyb1lzcWR4V1JZYnpXT2JQZTlsQVhiVmduT1VGNS9mbWVs?=
 =?utf-8?B?TlVRNzd6dUMxZXlqa3lsZklJUTFlWWtXZTFMUDZRMUlFRlprbDl6aXA5RUJR?=
 =?utf-8?B?TE02NytvWCtSYnFmZWhnbHRzMUhjMjRJMjNPSHhXSGJyR0srcm41TTAzVGJj?=
 =?utf-8?B?VS9SL0kzVjcwL1l5UEpNSE5hY3BoazhBMXlxWWxBUGRialMvdEdzNjFKSmRT?=
 =?utf-8?B?Um9sSW1mWlhZRUhpSXNCeVRMNlJ3YUpsYkJBcTZTQjFlcjJQdjVLNG01Y1Np?=
 =?utf-8?B?QjhsQmJ6ZUQ3akZRaW4vaTZJOEVGNDB2WVd0bnlhOXY4TWt3cTY0UGZHOW0v?=
 =?utf-8?B?bTBsanZud0FCbzVHUDAvdGViMDE3QTFLOGRNVldxRS92S0Q0OFVJMkI1T205?=
 =?utf-8?B?OUdhSG5GRFI2YlFwaUp4STFDNkdDeHpXVkZ0RUdOTE5zMHU2OHpzYnAySlhz?=
 =?utf-8?B?VEViTG1IbmJBS3lNUkZBTnNwM0pFd3hlWlI0b0hUNis0TXhZY05wYXlpWjQz?=
 =?utf-8?B?dUdWYTMrNUVtMFYzR21qS0s0d1JLMFNrbFFMb2ROL051TEJnRDZaZmliVVJ5?=
 =?utf-8?B?M3VIL1RaYnRzdDN1Sm5mY0JaVDZUZDVBcnVwQSszWGpIaVpRSDRvaWdQMnl3?=
 =?utf-8?B?aFdxbWJyb3NLQVF5eldWZldlSW5WRFNQd0pZWXd1TGlLTzZWY0kvTzZzKzJI?=
 =?utf-8?B?SkZJNjc2YXUxeG9YWkpCbDRicVVERVdCWER5Uzh1REUwWmV3V3ljS0JnM04r?=
 =?utf-8?B?bVJOeWpWRmVCSk9DL05nZExKZDArTjE2SUVjb2pXVmxuNFgwN1ZpV2dMcXFp?=
 =?utf-8?B?ZGVva2RhR0o3TjE1ZSs3WjVHKzRtYnBpbGRhUGIxYkxDZVlmSkVKVDI0dm02?=
 =?utf-8?B?OHY5dWR6S3hhMkhRRmxyTmRRR3FvbWRjcXRESE5QVjhkaWZwbG95d1ZsSFZk?=
 =?utf-8?B?anpFSG8vOGpkaVFQUDFjekg4c0tkVmp4Z3lkanpvcXN4MHBEamFMMzNqelVy?=
 =?utf-8?B?NkJpV0VZZTlSa3c2SGZGejRDVXVQY0FhR2pMaUZjMW1jRVkwWlZyRUNDYWVO?=
 =?utf-8?B?QnZ2T2tqR2N1eXgrOXo2c01HcXpRVE15L3VNdEZVSHFuY25tYTVTTHRzWTRN?=
 =?utf-8?B?MFJPRmZSUi9ja05GRkE3R2dZSkxsYnpWUHU1T3V0TGlYcHYrVmo3TG9JSDF4?=
 =?utf-8?B?SmZybVN4V25tcUhKd1VnZnV5WXg5OEVvODhub2dTSmtjUXNVYlpXVmtocUVY?=
 =?utf-8?B?alhQdVlqVFozWC9lOVQzczlCRFJTV0xJUEtESHBVK3FDYmc1czZrUzlkTlBX?=
 =?utf-8?B?MGR1WWFIMldDNnpQVk9zaTBSeDJiM3NmaHNuSk84RzBxRDBCMnVVRXdYMDc3?=
 =?utf-8?B?NzFmSHhVeDRrZDlRV1F0Rk14Z0lnTUlkTFVSUW9VcDgra3VYcFgzaFIySDhz?=
 =?utf-8?B?bXhaazh2TGVEUEpyNGhiQjFRSGE3KzZ0QWdRVm1OZ0lwQUdsb3BiL0JmUVRL?=
 =?utf-8?Q?RG9DI/LMkMvYzBAGlBn+3KEb0V4lm9WAHaM4/d6?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b79fd4ad-806e-4fdd-fcbc-08d94c9ceb1b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 23:11:49.4943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5pOzb1E//UaQ37cIBmHzZ/PxMioKvfd7GATe6n4SgD2FAjMAfI0ztt7HfKAHruhv+Sdzl8l+c2wlA2a6n1Vt+BAt/pVol2R5oI20TGVQ0bs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1675
X-Proofpoint-ORIG-GUID: b-lDPzbB1b-EInLeRDEzHaZSYg8onY0u
X-Proofpoint-GUID: b-lDPzbB1b-EInLeRDEzHaZSYg8onY0u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-07-21_11,2021-07-21_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 spamscore=0 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107210139
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 2021-07-21 4:28 p.m., Joe Slater wrote:
> From: Leon Anavi <leon.anavi@konsulko.com>
> 
> Upgrade to release 8.3.1:

It looks like 8.3 has some API Changes:

https://pillow.readthedocs.io/en/stable/releasenotes/8.3.0.html

so it's likely not a go for hardknott but
I didn't clone and examine the src repo.


Was you goal to fix a CVE Joe or something else?

../Randy


> 
> - Catch OSError when checking if fp is sys.stdout
> - Handle removing orientation from alternate types of EXIF data
> - Make Image.__array__ take optional dtype argument
> 
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> 
> Fixes CVE-2021-34552.
> (cherry picked from commit a5fc60071f0a0a16096792c4e1970d31f5964539)
> 
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>   .../{python3-pillow_8.2.0.bb => python3-pillow_8.3.1.bb}      | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pillow_8.2.0.bb => python3-pillow_8.3.1.bb} (86%)
> 
> diff --git a/meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb b/meta-python/recipes-devtools/python/python3-pillow_8.3.1.bb
> similarity index 86%
> rename from meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb
> rename to meta-python/recipes-devtools/python/python3-pillow_8.3.1.bb
> index 3241230d1..045357a6a 100644
> --- a/meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pillow_8.3.1.bb
> @@ -5,11 +5,11 @@ HOMEPAGE = "https://pillow.readthedocs.io"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=0337b116233da4616ae9fdb130bf6f1a"
>   
> -SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=8.2.x \
> +SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=8.3.x \
>              file://0001-support-cross-compiling.patch \
>              file://0001-explicitly-set-compile-options.patch \
>   "
> -SRCREV ?= "e0e353c0ef7516979a9aedce3792596649ce4433"
> +SRCREV ?= "92933b86574b9c80764bf52c357ed29e1ef53382"
>   
>   inherit setuptools3
>   
> 


-- 
# Randy MacLeod
# Wind River Linux
