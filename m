Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53271C433F5
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 17:32:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.10279.1639157561646212472
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Dec 2021 09:32:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Fguw9O+l;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=7978f41b8c=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BADSiBN024595
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Dec 2021 17:32:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=oR2ssd45PdeVE5YKsYCP1IcCDo+03OMrh4W8hMHzYaE=;
 b=Fguw9O+lDxWFl5a9W1dSbHDScCj7g8owg3Q9ZRSYWptKv8BpJt+o9cTVH/HDje9WLJsJ
 Kzv0NVJdFtcQEU5gFI0P42ucSmaE3tA1bibFMTArbvDW8QISFEYEPIeKhKBCu2LKbBK8
 kTuKUi3iDWFQGg1BSFVwv+eGdNtp/vZexuf0hLk8zF7NxsrI1nwL6BhAdg2C8QHUbYvN
 HPTtRN+8Bqxz8PdP4jd/xNnbnZyC618x21qlCpyYHomNpuQFTI3bSuMvgfjOAhahOdHu
 kwpnsKYA2U0tZnAViEOmsn1+R9wSKvHxAUcPrny2oV7QyI+78o3RTQu7jR7Ys3dXGRIg tQ==
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cukc3set1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Dec 2021 17:32:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T0lbEHLaqablIlUce+VL3nv/phBpOhuKAgruH7jvTzqP/mL9MNHV/sIZhiXalo1nXkayJ6TkG9dRnIaVr2WCZbb2xbwwsEQfl5ubGCjbBf3aNl4SglcP4iLqsuiWb8CUM63Pg9mCpPT+rXK3YKKAzJJVYnDmy7QvwFGyuiAlhalhTp9gtrJ6sFSqlBYtXS7QHrIPJsdNQp9OJmMOj95zcN/erSQe8ssIUrPPPx+caryf1SgzMaF1K79KXFdbLqnmUuV5n7JqNt639YZ40toIAl4nx8Q9Rl6qScYErTqLn7+cjWMYhcfwGcAzke406Y8dfNq4nswpGhuyuuAUng88/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oR2ssd45PdeVE5YKsYCP1IcCDo+03OMrh4W8hMHzYaE=;
 b=B0heWzcQfkb2Rq2MGtbVKnsuKGQMioE64eLlrJALuvimc9O0jeLms65wiuUDytLM9bGeQhHp7VqHS0avR4dTO2um54z/sQJA6/zxi35KZzLC74WXB+ITX/N3AfmZnA6GBoqcxWjE6fYq89PtVEN1NLhDTrkkffvfvIn5wc1d0lE4gYH8NW+286d9dRByHTVl2DSTv9g0BoJHBD2OBvVhkWkMOZfIiLripzTBEyJdYstG80hfwAd/IUJDr1He21rL7nlH2YEZbC0US5pbPc+lfDQK5cpYrmsQ63PsRbKgpjUbnfvm8GtasiS1ydsKlyzYcAWmFyHOrwfogq7kwhAZHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DM4PR11MB5295.namprd11.prod.outlook.com (2603:10b6:5:392::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.15; Fri, 10 Dec 2021 17:32:39 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::c558:b1bc:4847:ab6f]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::c558:b1bc:4847:ab6f%2]) with mapi id 15.20.4755.024; Fri, 10 Dec 2021
 17:32:39 +0000
Subject: Re: [oe] [meta-perl][PATCH] io-compress-lzma-perl: add recipe for
 version 2.096
To: openembedded-devel@lists.openembedded.org
References: <16BF74E848E22B86.32732@lists.openembedded.org>
From: Sakib Sajal <sakib.sajal@windriver.com>
Message-ID: <933c4df6-8663-38fa-40b4-b22df020e624@windriver.com>
Date: Fri, 10 Dec 2021 12:32:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <16BF74E848E22B86.32732@lists.openembedded.org>
Content-Type: multipart/alternative;
 boundary="------------A248BDF79A70DF5B11BF7D83"
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0039.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::8) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
Received: from [192.168.2.28] (142.112.186.203) by
 YT1PR01CA0039.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Fri, 10 Dec 2021 17:32:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0eb9c24f-035f-4e1c-1233-08d9bc03102f
X-MS-TrafficTypeDiagnostic: DM4PR11MB5295:EE_
X-Microsoft-Antispam-PRVS: 
	<DM4PR11MB5295E6649A7864F2D9688BBBF2719@DM4PR11MB5295.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dHzE4zMPxcJW+AhGqXGPDnBc6wkuucASysN96eLbqWuKyoHuDI/P7Zq14enwB6dNR9SxLDvksgihfaLJe1E6BtwKonFp1/iPtxLp0APqu/H3Zg2mErF/yxcWcp++Ttwh80Eg0BK977jfsxHeMDYKlmwz4V/7Rvim6wNzE9fCcNnKUXqZiXgyrb0pAOR2zEnjXEOqgJ5EQ6hg0E/XEf+27YKqAxbxxCEVw31AgrQUr9NJVYDGncexbbIbJ4rtPepowCEMAx42cNCIhyq5IBn+FwXvPlxaqHg/SUYDHMGeM1eMui8w50cVxfWUTsTVPYjFpIJnFf6AxxSVz9BCj4uvLp/Upq4F6aF6T/CVbP3M6D3PLuIckchS4SeaMlZiKidEolhM1DfU7WdD1In2KAFu0vXjcJ+TOJIoOlLkjI2lyw0RGDvH7zkilxt1eWlun4vrbT9Dd4zAo0sxAytItIYs+rlnijTOXWwXcRlGQTLFtRboHLhJ03oGhW/9dHmnAgRK02MPtf86R6i7T1Tzl/KWnnrQocae946WSPg5Z6i/NWaSOVUvTeN2bi4iI3k+rnobbZVBLZZiyPvcAMnCVaOFPa2S/8Ihix8BWy70rFELxex+VeR6y9kArHF4+hlcvvdO3GGw9KbXHPzmhcl7/ZFZiQn5k6whr66ofxCXmcQj1YZ0PbmhzzxQBfW80mHM6lTdQMC6+bbvtNbddNuiWXPAEvv94crCBi7bk6CxCPbOPxlwpsVPNxcesTx9NH0idwZ4U0BPgs62PlvwqbE4DSm4rRVSnfw//eQcFmfjwHRYFfAk1A4FtN87hx23jWgU3stsOIk1HHXj1dEkyTiVim+4yzuMyvh+sex6r7BsTNieX8S2ctIHBxhFcg2gvSrxYrtShGwcwwTatam+q+AWLJD9SA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(2616005)(16576012)(508600001)(36756003)(31686004)(6916009)(956004)(166002)(2906002)(8936002)(83380400001)(30864003)(66556008)(31696002)(66946007)(26005)(66476007)(52116002)(5660300002)(33964004)(38100700002)(53546011)(6486002)(4001150100001)(6666004)(44832011)(966005)(86362001)(8676002)(186003)(38350700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UFFDbTN4VUZ5K3d6MS9FbVZLRTJBRE5TUGo0VVBCM0hYL3VUdzFxYlVkY25E?=
 =?utf-8?B?eURYZ3hoSXBZVnhablgweGhwd29oMnRmZy9BTTczMzZRV1ZkYzNTNzZSVm54?=
 =?utf-8?B?dzYwVHpEaU1OT2NSYytaNVFvYTV3RkpBMnF2N1BOVTNsTDhtK2NLem1EMlFq?=
 =?utf-8?B?T1dEcU4wMFlnNkVzZUNYc3NNZUhKVSszNklDbGN4MUFMY2NxNStOV0RQY1NZ?=
 =?utf-8?B?MEtieHZnU3FIZ1hZcFRvZnNSK2YwQ1hxMHdrUDAySjVBNU5PT0ZoMjQ5QWpB?=
 =?utf-8?B?Z3BQaUI2Z3ZGL0lwNnB3Mndwc24zYTQwSGc3UVhIamI1T29KZTBucHNKbVdp?=
 =?utf-8?B?bEJQK0xKejlCZXZlM2F5NTI5b29HSGRZZXl3WldZR0poalhOdzBIMmQxVmxJ?=
 =?utf-8?B?bm5HNEhSVm9jOGRKdVhJQTNZTDVrTGpUNlQ3WHZvTFI3ODZwRFkxaWUvSW8z?=
 =?utf-8?B?NFhhRjJuSldrUVN6M2V6TjVqVFdZRkxybTV3ZDVYREtKZU9YbUxNbVRSenBu?=
 =?utf-8?B?elVFamhuY2QycE9FY2EzTXkzM0ExRDl5RVdEWFJlNVZ2SE9neUhzc1htTHpn?=
 =?utf-8?B?U3hLOEpQSnBXZ1cyaXpKSmZ6WFdvdDRFbUxqNDVTL0FocWpQU0IzR091V3VE?=
 =?utf-8?B?ZjZ1YnF6UStZWnZKbXdiYmJianluYnp5c0ZObFBiWEVkY2RYSEkxdEdBQ2Vy?=
 =?utf-8?B?QlJIUWRqT0gxODl6SWIyQ3o5K0RTbmhPQnFPNHBLSUNwejk4dVZXNUlheXYw?=
 =?utf-8?B?NHI4SHlMc2dVRHN2aTNzNEpQTTlTMjlVeUxHVXlEM1VNSExLOU9NZC9ha0FC?=
 =?utf-8?B?bE9VbUI4dFc1Vzd6TEN4Q09oVlJXVVdHMDBldzFMQlIzWndOZEtIQzR1RXlV?=
 =?utf-8?B?a3V2NUFBdGhmNHN1V0M1UEE1SFdaVVNYdlMzSWliN09YTUdhTjZQNDN5cWdC?=
 =?utf-8?B?aEJKRDAzU2p4aFdadVV2d1FpYmduUUhGNE1aN2RWejJWZHJTd3BFQ3hodTNI?=
 =?utf-8?B?a2RGcW9taFhtTnpzZkROSTJsU0NXcGtFZ2lGYmFxZ1VFd3gyR0pIYVFySGlJ?=
 =?utf-8?B?cVdoYjE5V2FDckV0QWJNalBmZlhaS0R1T3U5T3ZKMC9haVdqMGlFVlQwS3pr?=
 =?utf-8?B?WEhENTdBZlNuUW80TXJ1eVZVOGhFQXF1OW5oWUtERUpjQk9MeFE5WFRtS1Jx?=
 =?utf-8?B?dnRORVl0ZlZkYno2Z04zYjVMQTN1SzFPOWF4MFZUR2IybkFLcnkvNUptYjhj?=
 =?utf-8?B?Z2pxYXVFcG5wOGtuMjAxRkJHUHJ1TUxWeEhjY244VUVCRTIwOWJNYUllYUFN?=
 =?utf-8?B?VWVHNlF0MElYbXpzVnVEQzJHRkZYMXB2ZmMvSG43L3I1emQ1TWtOMXVYOGZG?=
 =?utf-8?B?M1d2RTVpOW5jRWVJcFFVaHZ6SlJjWTQ2STdjWE1ReVVTSm1LNEdTODVicnRy?=
 =?utf-8?B?dVlVNytYVmtHNXYvUGxIMFA2NUttbFhRckhIdGc1d1J0SVRZZFBQTWsyRXdU?=
 =?utf-8?B?cTEyTkp2Q05qNEQ3WmY3RE84RStnYUZ2RytUMVV0ejhKOGZUcFhhVDhFTGNi?=
 =?utf-8?B?ZGtMVXJxWWxWS1d5NDgrazIyWkRYMU5BdS9DYWhUMTY3TngxdG1rVlF3M0ND?=
 =?utf-8?B?Rkk1QmVIU2hRenM4Q3hEc1ZmL1BPYTV3c0JxOUUveXdzR2JhYTQ5TlZUVloz?=
 =?utf-8?B?U09xRFFsWXlYa0lzblJRVWF0SkFRcTFsWDFkY1YwMUNqc2NpN3plVm1ob2FL?=
 =?utf-8?B?eTB0M2F6eEtVY2J6a3NPT1V5bUs2VFFYM2RYbHJOajhWbi9DdzNTM1R3VTNY?=
 =?utf-8?B?OHREbmxoMFBWVGZVdXBmb0pvSS9YWi8rZDVsM2Z3WVh1YmVaR09Jc1g5aTdu?=
 =?utf-8?B?cUxEdk10aGlnSW5OZUcyUUk1TVBUTjNvMWVhWnZBcFNJc1JjY0hQQXFuOGND?=
 =?utf-8?B?Yjg2b0pvbXlxZTZlVWRkcW4yamNOTWJUbHZWQ1daNTV4YVVOMWpSajJpVGlk?=
 =?utf-8?B?TzROT3A4WWs4OURVZlQxSzIxb3R4QytBNEhQRU5sSERhQjVPTk5meUxlcjNn?=
 =?utf-8?B?MC9ENnBYbitZaTVDKzdCcWNab2VtYTYrbmJlOWUwdFFDT09xY25DMWdFSmt4?=
 =?utf-8?B?c2JEUVhOUmh5MHcwWE9HMnZRY050V09Ta3lxWFhmVVI3eVlVYkU1dk1ycm5a?=
 =?utf-8?B?RFBLMzdndUo4WVpOTTA5cjhiWDBCRGhRZm96MUtkK0NJT2pneTByQlVIMHFr?=
 =?utf-8?Q?jEqOQdF90UsW8tPlsKRL00CcXEFLLuLigNuDLEP6Mo=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0eb9c24f-035f-4e1c-1233-08d9bc03102f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 17:32:39.3189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 /mCsBb8dBQhc8OSwn9BtVnYaDaX4kS3XG72Sipyj0PHKRS250hZhr/oCFFjJiCXZF6Xc+e4bwggC2vuYe1Q0faqH3eNKgH2j3d+96AgfZ8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5295
X-Proofpoint-ORIG-GUID: isTAA1uRw9aOKbesVPz7AQ9MAKpDSlJ8
X-Proofpoint-GUID: isTAA1uRw9aOKbesVPz7AQ9MAKpDSlJ8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-10_06,2021-12-10_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112100098
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Dec 2021 17:32:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94276

--------------A248BDF79A70DF5B11BF7D83
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
> View/Reply Online (#94274): https://lists.openembedded.org/g/openembedded-devel/message/94274
> Mute This Topic: https://lists.openembedded.org/mt/87641040/4422444
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [sakib.sajal@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

--------------A248BDF79A70DF5B11BF7D83
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
    <blockquote type="cite" cite="mid:16BF74E848E22B86.32732@lists.openembedded.org">
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
View/Reply Online (#94274): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/94274">https://lists.openembedded.org/g/openembedded-devel/message/94274</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/87641040/4422444">https://lists.openembedded.org/mt/87641040/4422444</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:sakib.sajal@windriver.com">sakib.sajal@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------A248BDF79A70DF5B11BF7D83--

