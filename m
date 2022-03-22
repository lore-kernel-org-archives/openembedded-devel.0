Return-Path: <trevor.gamblin@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EEB0C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 16:17:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.12060.1647965861969889241
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 09:17:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ad2uDRpc;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=0080b8e7e1=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22MGCTSd015139
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 09:17:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=H+aI3MslKGDC/BKtJ7NDbgKrpBVw8Gi+F8q77Q19suw=;
 b=ad2uDRpcy5NqSobe68ybAFwlnClkYlW4cc1vFpnAZFxeJ9dYUp9PzhsiNuBBz+kYPioe
 WD2rEqlkhdq4G40JkPGZTpZ0yEJOFcyeSwqe8aukFf9dIgT45TnUYM5JTmHtFJIjT6kl
 twkStALCAWW93hZa+a9x9AFJWKS+NHvEFcJfAic2D4kQ4iCgBrKvBUM0CbJIultHAu6T
 1ynfdiZIigkzKUSUYBiJ680B0mALNOEYTL2WBcjCaicqa25Ckf/0mkhQXDOWsWdCSCeG
 3d2qacUxeWlHLTpIy9N9wl49YlkEbZ5WfU/tQZQz0LNx/cxjDeXsgQzVS7E7xW8eIVYI 1Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ewaf3tgs9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 09:17:41 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 22MGHfU8022020
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 09:17:41 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ewaf3tgs8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Mar 2022 09:17:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nLjIEafkVCJEyfm7OjO2c4xBrWG0On2Wdex99HMPw1susCQ8M8v/wB4cp7LMnp/gAg2Vh6MCxgHCNLXGYCQ4RrMwieZl7bvvAOoBN9N/N0iHZfYwQOWLxsmn4T6+2SzGmfSfz8HTruVV/EN7rzEseLUvGjK4LytHQp/RA3DfBwzzo4yEAn0lN85EjbvpVjz8kDja1wfg7Y9hzWh5Tx/zUur+U0IZC3MECy1DwNx654W4GN0Kd5TjPA3S//o8G0nSkCqMDaqshhEc6rDc8V3EGxDtHCTTPKK3xkG1iz77vFVvcPuXE73DJ5zP8ISFJSKsLb00DcbkzhXLQRGxnSJSAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H+aI3MslKGDC/BKtJ7NDbgKrpBVw8Gi+F8q77Q19suw=;
 b=N+JVrbolqa0VpdcADS0dMy6FMO+a1a4dMAviWJ2WcBD2EVlbmijA62JcXaxOE0zHOWee+i5HTW1UUnSBJNPb9Zy7P62Z3NOdU02lybQB0HTEzk5XffcBTk1chPzFg3AEZtyUYGkabB+nxS8+W7z0yNjaCXCknhgcXMkcZ9+A/uG8iLGPlY3csgC9WM19zy6zq8X9MFZfU/BEPAo/HPoGVkqZe9Wp4+kM8cXaQ53zikuavV16IVYdilxF1xMNFXdQYANHyCvaTPPHsP+0IES+x+dGasNi9hPpMSoYBT5p9K20eSknyV2gdyN5gr2mBE55+C4RSO1NNAVDiNYclZOOKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3816.namprd11.prod.outlook.com (2603:10b6:a03:f8::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Tue, 22 Mar
 2022 16:17:36 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::c1c7:209:c28f:67dc]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::c1c7:209:c28f:67dc%3]) with mapi id 15.20.5081.023; Tue, 22 Mar 2022
 16:17:36 +0000
Message-ID: <cd1c2e2f-6fe8-cdee-d137-f4fa5ec4a3b6@windriver.com>
Date: Tue, 22 Mar 2022 12:17:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [oe] [meta-networking][PATCH] nftables: upgrade v1.0.0 -> v1.0.2
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20220322150010.32030-1-trevor.gamblin@windriver.com>
 <CAMKF1srgf2hhxLMV0jcg+hQc4uypWf5fyGAxJSFzFcR=aEOAtw@mail.gmail.com>
From: Trevor Gamblin <trevor.gamblin@windriver.com>
In-Reply-To: 
 <CAMKF1srgf2hhxLMV0jcg+hQc4uypWf5fyGAxJSFzFcR=aEOAtw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0112.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::12) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 027785c3-3be9-4b78-a066-08da0c1f7a3b
X-MS-TrafficTypeDiagnostic: BYAPR11MB3816:EE_
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB381694A72697251A651E097D9F179@BYAPR11MB3816.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cIyjXb996Qb8hrQ8FBL8ayI81X8wKIfgnOoeWlZUXJd4VbjDuhDZCZhNSNsoibAXMLQU+6jbNwFsBmIh9o/9f6UO+RUz7eMmtpo3KorC5ZxrFtof8DuHi46HQ9kVz/Iu88bfR0fO3dlRB/uqKAd65ltdnYjuc5TzCynMNoIbyOrxJxNnR1mozzePz58cI71rtzcPuKzaxIPJpyPZvpxuG4ANqJT+3QGt+NcH5DZcxbXavKQSsxvqknLC5dMEARgA8nY4aykQmauWBqaDBwJ1vCJo+1pY6jwBwbzQl574dxFXXlvqZcIIYRZKbi5bXbl8i+docBVuIWHEuCiXVcseTjWyuPr2jFkXQzTs2I4ZZKY19YrYziBeo73uowgtmvEh0Kk/4slE/CKPsZB9y33rr0LD/AxBSqFo1VLjCpt0dhumdBIJSn4C0GSQE/fGk16/0uhPPGvRcbKElsBR5EVWdlgWpe1zZBSb9p0MLsgvYJMCNvrdmqJ0fDqSSrkqKRn+XOGD4bEDHTRj8GtNM6OfsEI0grYx25IBl4fZ8WPmJw1ypJw/CVPxfgeiMTpX8VV4FLthsHA54xE56l4GxqGP3cX9T7357P4c+XORExvgVcmK52DdBxuG2eeHrkiV9lXY1g3uPvdqyxM4jxqeMvQrA2jSXtpZFsNsSVPU8oRAentXXSDjPucogBvA8DcFXSyVrS7BZVUd6TkkkLBXxvOPgcJ4xAnoF9YUtKtHA9tRBn5X7h3zUuU2r7WEpwO4mew9s4cdp+QlQ/V4uZe6WvOIO0AKKpL2TecBp/eu6wOfdBC8bDwAuDcafZC/worUDmHr1X/W09fKLjq03UqCDbIj0GxyweAStFr9EDyiJRHhpd0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(4326008)(66476007)(66556008)(53546011)(66946007)(38100700002)(6506007)(44832011)(316002)(966005)(2616005)(86362001)(8936002)(6666004)(31696002)(5660300002)(6512007)(6916009)(36756003)(6486002)(31686004)(2906002)(83380400001)(186003)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Uk9zTndWS25aYklpRDJGV1J3c1EvZWNPUCs1eVIzNHhXOFRiSU1VWG04ckU5?=
 =?utf-8?B?bmJldTZSTnplSHJtc1VrVXdHcldCRCtDT1gzMlN4b0EzS2ZUZUp3YUdaN3Vk?=
 =?utf-8?B?M2tZVkJ0Ti9KTUdJNXJ3RjdmZzBQYTVNYi9yOXlvSHdFN3hSWXZlZ3lYUkoy?=
 =?utf-8?B?c040a2xRTnNobDJudUxic2QwdTF5aVVCQllIems0T1UycFIvK080Ym44WmMr?=
 =?utf-8?B?SDM2cjhLRUlmQktuRC9zbnUxeEN4RG9RV0d5eEJzQVNjK1BlaUNQVHN2SFg4?=
 =?utf-8?B?NDN6eGxIcTQ5NXQ2c1pmTDc1aElxenUzZXZaMGxoRmhmRE5wV2cyY3J1bnRx?=
 =?utf-8?B?bnBJczMrZ1MvclEzTDROUEc4VzlDUnBWT2NEcUZTbmRUNzdMOU9WZjVtb1RE?=
 =?utf-8?B?a3VvRGNqOGp0TW1kc3FYOHVkUHRpczFUZEo1YlhyK2d1MkxZVHZpRW9yRE1l?=
 =?utf-8?B?OUlYTitLMFNQNGpWTUtHQlA4ZitEZkhRM1BYK2l3cFBJczBUdGYwZkZTdlJu?=
 =?utf-8?B?NHFickZpMzNsL2hmN29kWGpBV0RFZ1BXY3ZPb0gzMUV1NzNzK092Y3RBTGdR?=
 =?utf-8?B?TnZUWnlRUy9yMmxyTDZaTnR4K3ludzRSaXNkcnhUNzlhOEIyRE1adnNTTEh3?=
 =?utf-8?B?dlpqc2ozaE11Ukt0eW1haHRsVC9BaHh3eSt2d2I3U0Mrd3YzMUpSYXgxK243?=
 =?utf-8?B?TGV5NWgvSXZRMUVaRG0xZ3F3bWhVcjBONmx4MTk1NjI1MUlWSDVBRTJBdUpX?=
 =?utf-8?B?OUpTRnlud2FPVGcrdjRobStKc3JnNDVBMXlGbFRLVmRmQ3NVQTdrTmZUV0Fy?=
 =?utf-8?B?czJBVWJxM1hDSVgyM1EwalF6UFMwMzlLYlUwNnoxMVlOUDJna2xZSkFHaUJz?=
 =?utf-8?B?WlZ6YlBRVzJUbkdIRVNxRW0wc2tFS2o2Q1hoVFFNb0dpMkN0c1BuVlozVE5O?=
 =?utf-8?B?Q3dMOWhVb2ZZMForY3hKbkVndzlGTVRBNXhoYmgvc253Q1k2SXpUZkJkWHpG?=
 =?utf-8?B?VWlMOGFPS2plYytpOURpaVh2N2taaXNsOWtFQnArVGk5NHB2eGhZdE1PZ2V4?=
 =?utf-8?B?SndHbHBNbDVieFBpb2t3UjkxS0pCT0VtUDg0akpWOWpJUFNkNHQ0bXRlamw2?=
 =?utf-8?B?U1RqYUxqNTE5NUZtRm9sdnVrR2UyMUtCd3k3RnNjY2hxWm5DR0tMdXh4Q2Jw?=
 =?utf-8?B?b2s4QzNNTU9pUERHaURYa2tsQ2lJUzh5VHN4aDRGYklyOXg3V0NOU2h5SE1Q?=
 =?utf-8?B?ck5STXV0eTlQQ1JabGdxUW9HTENYTEVRTWYvRklqUHNvRnFORDVaRFN1T1Z2?=
 =?utf-8?B?K1hhUmVMREdYYTVyQzBUZkpSUWVrZGw0eFVFdzRUbzhFOENGTU1BRi9OU01r?=
 =?utf-8?B?aW05V3pVeUZieEhKZTQyb3FHV3cwelBGUDRTdjRwSVBnZ1czVDNTU3FjQnN5?=
 =?utf-8?B?TkpadWV2QlVhRzcrdERvVHNUMTR6Ymx2c3NSdy9ieXVKYnV5Nm8vQkV6WnIr?=
 =?utf-8?B?L1pTTEFib2hTT0FMVWtFbWErRXpKUVNMcWhMQ0M2WmdsanJyV0hzMzYvUnhz?=
 =?utf-8?B?aVc0akgxY2hST0phbUpGZVNYVHRjczNLd28rRlBjRm05aXl3S2tvSlFUSWFr?=
 =?utf-8?B?eThSN2wrZXczMVZOUmQxVGVvUktwS3phM0ZVWTdGOTVMSjg5SThOeXJ5WmVv?=
 =?utf-8?B?c3o2aFc4WUk5dTFBRFB0Q3hHb2MyTEhSMlJHejVSTlBKMHFBQUtpNmFUK2VX?=
 =?utf-8?B?MTBsd0d5eVFsajQ2QWZxY2NNVVhhRzlmcGVDK0pHeTBOVkFmRitmV0FrS1g1?=
 =?utf-8?B?ZFVGNFBhWS9DSVVPS0NxemNiVHpnNkNEWDF6MWRDZ1g4K1lwSmo5WnFkUzBG?=
 =?utf-8?B?OUxvMnBlT2tvN2I1cnQ4akRxVDE4R0lOdmpqWDJISTdvLzZkbWpoUUV3VDkr?=
 =?utf-8?B?QjJOTHJyeEJKellHZ1kzem43NFVQeDVDK1ZISFlLZGU4S3pZT3BDYS8wb1BR?=
 =?utf-8?B?MEVseTZXVTBnWnhXM3loR2UyTitFUTZtUnE0dEdBeTRvQUhPcVFuVHlnSTFq?=
 =?utf-8?B?QnpSMG5CbUkzLzhoN3FHY1lyRXVQbE80U3ZqWWI1bWtIR0dxWk9IeVlVTThJ?=
 =?utf-8?Q?B7t4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 027785c3-3be9-4b78-a066-08da0c1f7a3b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 16:17:36.3562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 u0fUDqlBxvrgnNy0pKX1lY7xvdGx/h1h3KFtRl/75K7AK0F0/ang8N/a7e7s3x7ayRPZdjtDtb8vvTm74/CYQchfHOU/kVadRjkRzUVFdak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3816
X-Proofpoint-ORIG-GUID: HuTrDVStxJ_hNcv_99qZQzsdvMnnHBet
X-Proofpoint-GUID: gyuXDxUAK2A0u9oqIS61qJ13-1SMNcIg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-22_07,2022-03-22_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203220091
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Mar 2022 16:17:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96144


On 2022-03-22 11:38, Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> There is a prior patch doing this upgrade slightly differently
>
> https://patchwork.yoctoproject.org/project/oe/patch/20220322044616.867009-1-yi.zhao@windriver.com/
>
> and since it fixes the extramples/ build with a backport, I think
> thats better tha disabling the build.
Works for me, hadn't noticed that patch.
>
> This patch adds explicit rdeps on libmnl and libnftnl, is there a
> reason to do so ? is shlibs code failing to detect
> the dependencies?
I put it in as an attempt to make sure the above error wouldn't happen, 
but it looks like it's not the right approach. Let's keep ther existing 
patch.
>
> On Tue, Mar 22, 2022 at 8:00 AM Trevor Gamblin
> <trevor.gamblin@windriver.com> wrote:
>> Add libmnl and libnftnl to the RDEPENDS for the recipe. Also add a
>> patch to remove the "example" directory from the list of build
>> subdirs in Makefile.am, since this was added in v1.0.2 but it is
>> breaking the build for content that we don't need in the image.
>>
>> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
>> ---
>>   ...e.am-do-not-build-examples-directory.patch | 34 +++++++++++++++++++
>>   .../{nftables_1.0.1.bb => nftables_1.0.2.bb}  |  8 +++--
>>   2 files changed, 40 insertions(+), 2 deletions(-)
>>   create mode 100644 meta-networking/recipes-filter/nftables/nftables/0001-Makefile.am-do-not-build-examples-directory.patch
>>   rename meta-networking/recipes-filter/nftables/{nftables_1.0.1.bb => nftables_1.0.2.bb} (85%)
>>
>> diff --git a/meta-networking/recipes-filter/nftables/nftables/0001-Makefile.am-do-not-build-examples-directory.patch b/meta-networking/recipes-filter/nftables/nftables/0001-Makefile.am-do-not-build-examples-directory.patch
>> new file mode 100644
>> index 000000000..da568900c
>> --- /dev/null
>> +++ b/meta-networking/recipes-filter/nftables/nftables/0001-Makefile.am-do-not-build-examples-directory.patch
>> @@ -0,0 +1,34 @@
>> +From 4a0a013647054994e089a024b07d76b25af6ab76 Mon Sep 17 00:00:00 2001
>> +From: Trevor Gamblin <trevor.gamblin@windriver.com>
>> +Date: Tue, 22 Mar 2022 10:11:10 -0400
>> +Subject: [PATCH] Makefile.am: do not build examples directory
>> +
>> +v1.0.2 added the "examples" subdir in Makefile.am, but the contents of
>> +this directory do "#include <nftables/libnftables.h>", which is breaking
>> +the build. Since we don't need the content in that directory, patch it
>> +locally to prevent it from being built.
>> +
>> +Upstream-Status: Inappropriate (embedded-specific)
>> +
>> +Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
>> +---
>> + Makefile.am | 3 +--
>> + 1 file changed, 1 insertion(+), 2 deletions(-)
>> +
>> +diff --git a/Makefile.am b/Makefile.am
>> +index 72fb4e88..4a17424d 100644
>> +--- a/Makefile.am
>> ++++ b/Makefile.am
>> +@@ -3,8 +3,7 @@ ACLOCAL_AMFLAGS        = -I m4
>> + SUBDIRS =     src     \
>> +               include \
>> +               files   \
>> +-              doc     \
>> +-              examples
>> ++              doc
>> + if HAVE_PYTHON
>> + SUBDIRS += py
>> + endif
>> +--
>> +2.35.1
>> +
>> diff --git a/meta-networking/recipes-filter/nftables/nftables_1.0.1.bb b/meta-networking/recipes-filter/nftables/nftables_1.0.2.bb
>> similarity index 85%
>> rename from meta-networking/recipes-filter/nftables/nftables_1.0.1.bb
>> rename to meta-networking/recipes-filter/nftables/nftables_1.0.2.bb
>> index 2c378e8fd..1556b217f 100644
>> --- a/meta-networking/recipes-filter/nftables/nftables_1.0.1.bb
>> +++ b/meta-networking/recipes-filter/nftables/nftables_1.0.2.bb
>> @@ -6,11 +6,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d1a78fdd879a263a5e0b42d1fc565e79"
>>   DEPENDS = "libmnl libnftnl bison-native \
>>              ${@bb.utils.contains('PACKAGECONFIG', 'mini-gmp', '', 'gmp', d)}"
>>
>> +RDEPENDS:${PN} = "libmnl libnftnl"
>> +
>>   # Ensure we reject the 0.099 version by matching at least two dots
>>   UPSTREAM_CHECK_REGEX = "nftables-(?P<pver>\d+(\.\d+){2,}).tar.bz2"
>>
>> -SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.bz2"
>> -SRC_URI[sha256sum] = "3ceeba625818e81a0be293e9dd486c3ef799ebd92165270f1e57e9a201efa423"
>> +SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.bz2 \
>> +           file://0001-Makefile.am-do-not-build-examples-directory.patch \
>> +          "
>> +SRC_URI[sha256sum] = "0b28a36ffcf4567b841de7bd3f37918b1fed27859eb48bdec51e1f7a83954c02"
>>
>>   inherit autotools manpages pkgconfig
>>
>> --
>> 2.33.0
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#96141): https://lists.openembedded.org/g/openembedded-devel/message/96141
>> Mute This Topic: https://lists.openembedded.org/mt/89953861/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

