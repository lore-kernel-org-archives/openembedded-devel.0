Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25F43C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 09:49:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.18532.1702547369869757520
 for <Openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 01:49:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=f7LsErAQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0712f56345=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BE9O8Gw010169
	for <Openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 01:49:29 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=VX3/iDMg9pW/PZ+R963s1Ui3gZD3XJU2ircLrih+i3w=; b=
	f7LsErAQzh7BWB5QrtaXYPKrZZY4Vo9TaoeGzkKAO+QYgTjyhJSnKd9saLA9Cjtj
	FR1aCifJo+97MIwLMeAHEJyu5iL2M5jO4tjnp2KHvXCVHnAcMHUBvshzK15x2YtI
	x6fMZo56/EI0Y3X9HbJnH3BdkaI/pgRMuOxQab1DFjp+woe2TlCvmWux4IA4Sh+J
	eEI3gRDiovpP67jImfHH9+FYtth6cCPFeefcVhHKrOFhTk68FGuRmJfXIYO02zWT
	RbbajfohlIrOVvP6iGQEclwaelrfrY4l9B7P0ct3z9PQjdrbm0pChnEk1wbvbea+
	kwbzc5OiIDncUVFq97r/mA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uyr7dga85-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <Openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 01:49:29 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3BE9f4tA029670
	for <Openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 01:49:29 -0800
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uyr7dga83-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 01:49:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JnBvjVOFGZpETNiPmwIaoi0GfYnDtZcL7NCER2yLD16IpL3mEH3iCxjyYa7g2cj3wAMkEWJ9rZ/P7y2aGwFj4bZHH3JfiAE1vrNCpI/Ft7thjA4F4SuToeuBJbQv3SNeLfGlWVehkp2Mxia93udd0/kEG9Lg+iolKncJlXKOmwYzHI9/a3j/ow0ZVZ/42782qjuhDEsZ7Mg1uAGwxiviPnIm1iH+qBlxUqVWvdrNZUdi4+kUYnsZxNKf7MLfnSrpmj6WgGfq8LUntLBMUUw4/Yl90vSaOi1ihQdwmGh4KpKQx0q7Y4x2GerCW9ZhEZqqdmifE3vFPZWL9BcrCttxrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VX3/iDMg9pW/PZ+R963s1Ui3gZD3XJU2ircLrih+i3w=;
 b=SvdU+bqV0Lt7rTFTSn98wKehCB/mlhDndbXSLBep6+IaPL9E3iE2OMXqvlOnWnohULsuOuLa2vRcmdzaVFffFEmjbNoehUcHguM7bvNgZSt5WjB2Nj9/6BMQ6+dbtlrnwJOAjQv3YVej7ivUFasYFEMhYt50keHlX6eLPMwHtisKyRvlopGlq84GiLT+1CfDYE9ltLq8GuV/ey1C3U81CSbHeKO/orYvDMl0tF/b/SwQ1BWqYjLeIX17zEOOhpmghROg+3odgCKVobGLgMsCzHdZ9oFfaJesrAVW0LdkOMeAuw19uSk94Nx6sNN46ihwNfMwGMysExh8+AGCNbxpsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB2789.namprd11.prod.outlook.com (2603:10b6:a02:cc::11)
 by CO1PR11MB4948.namprd11.prod.outlook.com (2603:10b6:303:9b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 09:49:25 +0000
Received: from BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::5d43:ce18:14be:b2f7]) by BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::5d43:ce18:14be:b2f7%7]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 09:49:25 +0000
Message-ID: <6a55ff8b-c7e8-48a7-9109-8069f1050cf3@windriver.com>
Date: Thu, 14 Dec 2023 17:49:15 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe] [PATCH] minifi-cpp: Fix do_configure error builder
 aarch64
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, Ross Burton <ross.burton@arm.com>
Cc: openembedded-devel <Openembedded-devel@lists.openembedded.org>
References: <20231212093804.1012506-1-liezhi.yang@windriver.com>
 <170245126382.133993.15578168101766633828.b4-ty@gmail.com>
 <45C353E1-7C45-4BC4-A5A4-1697BA14E6E4@arm.com>
 <CAMKF1sr=8nggCC00K7_5KnHLy40zp+Zebr92WRxVDV9S09v95g@mail.gmail.com>
 <CAMKF1sqNpgCAruQ_bXy4JOSgbTm0DxB_d7VCXio4L8M_1JfG2g@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <CAMKF1sqNpgCAruQ_bXy4JOSgbTm0DxB_d7VCXio4L8M_1JfG2g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI2PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:194::17) To BYAPR11MB2789.namprd11.prod.outlook.com
 (2603:10b6:a02:cc::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2789:EE_|CO1PR11MB4948:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dc22c4a-79d3-4c6a-b1be-08dbfc89f481
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dLQfZVa0TvKNyIC81un3HZvaIos4IAHraA5F84xOYWBNJSPEAw8SQ8y1KVFpUBdbEnM+dbZoJBnlIJK6PFuMIvpjQmwWufWJZIE+8CjiLiBXsN8U3ldL9lHNR71AOexWQimgY/2tcbTgFm/HP1oGj9RnFzk0T59jarEM7YeOvQAJsOezv6+N+eLJCfdFDZKWPs1/HWs+oJSWxdLPkd2kFRkL+/mC3F3soh1ax0BeAEEkcVAVTvkwv6oRJ6uB4/v/f1Rhb7khLLrZOzg6mLCM/wmfjuRC4lHjo7bK0wXui5iWVJDP9WaD1Frj9k6G1wIRHpevShW8+ROxuDmNt4zdD1fMODe769tR6mXtP+jIeZDFMztXkhuwq51Yl0kyInNsnhLR4eW+U/znWiQ2erHLhWruCzedmVEox2VmIOgi6XRFa4JNOfxb/WQ0KCMxgcQGI8POdONwPjhFxy/jysx8eslkAY2ZIyMS2ChPlHAgTPocEa8c5Yr6fsF2a1zK6RuWyH+CP4lKKc1s2zPP9Gk0xHuBXjnQz5ja/JbCgvkSDf7s/0FcCi+ocVa4zFCp47RDdzse3YO5En4OTBndrJMtL8MRDv55eo25mZ/ZiLRgaPACv9fXjOjtbQAs7j5B7P1NQOBP1SjsTED27x/Iv1BdsA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2789.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(346002)(396003)(136003)(376002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(2906002)(31696002)(6486002)(478600001)(41300700001)(31686004)(86362001)(5660300002)(4326008)(2616005)(110136005)(66476007)(66556008)(66946007)(316002)(83380400001)(26005)(53546011)(6506007)(6512007)(6666004)(8936002)(8676002)(36756003)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eHVCMzVoNkpQdUJacmoyRW9hTXhMdFp1STVaZFpocjIwNklDbDV0bk1XeGJr?=
 =?utf-8?B?NkN3a0R2U3d3eWVzVmpOaUVneU56a2JHZC84WXhhYkdaeXpEODlIRVp3MWN5?=
 =?utf-8?B?MCs3ek5sTTA3YnlqeVl0dHVRZnlxeml4cXZ5d2JLc0kyc0ZLZzBFZjhBd0Fl?=
 =?utf-8?B?Zms4VGZ3ei9RWERDN3ZQQmVtWFFhZU5yQU94TDRjNE4xS1h4U01JWmZkYzJB?=
 =?utf-8?B?a0FGaVd0NGZCV3VzVGNTS3RnVDlCbWRrZ2lZRjdpVmZ1dFN0aUttUlFwalZn?=
 =?utf-8?B?QzlFMDNoSGVHb3dOSE95RnYySlJlM0lRUFZEcnpMZ1IvTU9QYmpFamFMRzNY?=
 =?utf-8?B?UitIRDZUL0xzL3E0ZmxDQnhteU9lM0EyZU5US29rZ3FuL2tnMzZRbHE0NWsx?=
 =?utf-8?B?Y0RsVEJEdlN2Mmhla09UVmd1NEt6NFZYYWhYc2wwdkQ0RC91d2krNmJjOGow?=
 =?utf-8?B?bFV1aHJNVEtKbWplQnMzVGZHZk9qczM5S3BtRkFUb3V5QTA4OXBLSmhqZkhk?=
 =?utf-8?B?VU9TaFF1eEpHU0ZnY1VUb2VKVmg1QytzRHp6VUgvUUt0b241QjEzcHJBR0ND?=
 =?utf-8?B?VDR2TXZkQTV2bVlzZWFzQ09taXFza21rdDA5WWFoYmF0N1QrcEdpZlJld3VG?=
 =?utf-8?B?R2hXRk1LazBobjRpcVdQVUZJcVBrWTRxMyt3Y0xGYWxYWGIrM0JUSDVNRUts?=
 =?utf-8?B?ZVJvbFpqN0FHM0g5VUd6WnRTMmpBckljc0lyUU16Q2s5MDN0QzVYdnpTdEdZ?=
 =?utf-8?B?TWR1ZkNkdllneGVxNUk5azNra091ODdZZGI3RDQ1b3hJQVoyWCtyNXVTdWZw?=
 =?utf-8?B?eExVRFRzUlIyalpkaHdwR0dLcGkxOFN2MWRTYVQzV1VMZFJ4UXZJVkk1OFY0?=
 =?utf-8?B?clREdW5hcGYza0ZyK1Q5aTZNVnkwMVUxTFBLTTVVbjB2Ylp4UW1NY2ZlcjZH?=
 =?utf-8?B?dVZNc1ZDV2x2bUMvUWdicEdWeENJaThCZ0M0b2xIcWlqT05PUkZYQ08reUZL?=
 =?utf-8?B?UTdlQnI2d2ovNUFsN1l6NE5YK1VaTDNzcUF2Ukk0WDAzc1FWOVFPMVB2Z3hC?=
 =?utf-8?B?NVhhTSttRGhIaWtEamdUandteCt3ZlhSeTJGVEN5L3VRUkpxODFhK1Jya0pl?=
 =?utf-8?B?dFYzSlFnU2lmejQ0NEMyZ1RJSkRJdUNUaDA1ZEpTcEZuKzBxQnVKQWFLQ05L?=
 =?utf-8?B?cUU3U09CeW50WjlndEMrR0hRUDhnbW9tZm5kMC9EK3dxbnhBaXR0SzhSc09q?=
 =?utf-8?B?c3YzbXFDY2JCbkkwWkZJNGZZUGJtaDM3NS9CRXVmZkhWdmc2MkZDVEp5RS83?=
 =?utf-8?B?MndaMUdSZU53Zms1N3J6Zjcwb3hURmRaN2dJS25QcDUvaG51QW1oWGpTaCtZ?=
 =?utf-8?B?SGFmT2VJNHQ4SEFBWW1wWWNaWWtGQkcvQnBFUm85UUJoYzFFN24vczA3Qk5q?=
 =?utf-8?B?emp6cDY2THRVYk9IS1BGZnE1Si9La0p4eGtxTmdHSjlRYXFISzNIakg3NzJI?=
 =?utf-8?B?Q0JmQ1hkdnBVVkt1MWYrZnd2Vk5nZGtab0VJMTFRaFNsNlNPQnZCRkd4dUZR?=
 =?utf-8?B?L3RGSjZJQXZjTWcyaEJ0N3JKbEdSSEFoQnNReXc5dzRwazN6cy8ySVh5NGJB?=
 =?utf-8?B?cFRXK0hQVFl0eW93ZDdWbU1FZXIxN3VBcjFrTzd4cFQyMUl1UkhlS1lnd1FT?=
 =?utf-8?B?VlpvM1dNUUtrMWU0WkRGbzRuWGtzZUxKak50R0I3QzBPcW4vUThKWlNBMUlM?=
 =?utf-8?B?ZzVhdWpZbjhLalA4eEUrUTNnWVc1anRLeldRSnhkMEQwSEl6aXJUM3BHVklV?=
 =?utf-8?B?Y0pFOGliVVJoUURCSFdpMUlCTzVFdnUxKzdvS3FNUVZuaGZIcUgzS1RNTGpT?=
 =?utf-8?B?TW16UjRPQkJ4cmV0ZEtERUlyNENnVFc5RWJoelhhUkZjRXBnZ0dvMTcyV3Fi?=
 =?utf-8?B?SGNPWmF3OFZyQ20xbVh3YjhKMXgzWWlkc3dsaHk3R3VHSGZ6MWFVZ1BrZEJD?=
 =?utf-8?B?c2ZlZ2FCSVBVUWtSanloLzBXc1BFQ1dxZUhyRy9zOU4wbngySkNHZUdRZ0Y3?=
 =?utf-8?B?dkpsMkFHbERlbTRxbHBGbHE4dE9FSmxQWGo0b1NjVnZoZnN3bm1URk9ON2ph?=
 =?utf-8?B?d3hPZjJoR0RzdGZsZTVQUTE1RnhONjYyeWR6UkU5M2c5OUxONFZ5dGFJRkxR?=
 =?utf-8?B?OVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dc22c4a-79d3-4c6a-b1be-08dbfc89f481
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2789.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 09:49:24.9908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: phb+QkD0z7TU4mDT05gF4L+Dcu4c+cCEGbh8a41RzMWagwAt/qibzWT76jL9/Ztz3Lfubnrt4tT1zCVddvm17v9hAkOyKyqCgOMgvHcF420=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4948
X-Proofpoint-ORIG-GUID: veE6xEb_sHjE4JiokEQ73FDFHtCnPHg8
X-Proofpoint-GUID: MDfjKJFlRhy7CNUh95tRiEV-We50HVZh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=810
 impostorscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 mlxscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312140065
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3BE9O8Gw010169
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 09:49:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107449

Hi Khem and Ross,

On 12/14/23 07:42, Khem Raj wrote:
> Robert, can you test and send improvements that Ross is suggesting here.

I'm working on upgrade minifi-cpp from 0.7.0 to 0.15.0, I think that the =
patch
is not needed after upgrade, but the upgrade is not easy.

// Robert.

>=20
> On Wed, Dec 13, 2023 at 7:55=E2=80=AFAM Khem Raj <raj.khem@gmail.com> w=
rote:
>>
>>
>>
>> On Wed, Dec 13, 2023 at 3:31=E2=80=AFAM Ross Burton <Ross.Burton@arm.c=
om> wrote:
>>>
>>> On 13 Dec 2023, at 07:07, Khem Raj via lists.openembedded.org <raj.kh=
em=3Dgmail.com@lists.openembedded.org> wrote:
>>>>
>>>>
>>>> On Tue, 12 Dec 2023 17:38:04 +0800, liezhi.yang@windriver.com wrote:
>>>>> Fixed do_configure error when build on aarch64 host:
>>>>> error: cannot guess build type; you must specify one
>>>>>
>>>>>
>>>>
>>>> Applied, thanks!
>>>>
>>>> [1/1] minifi-cpp: Fix do_configure error builder aarch64
>>>>       commit: adecc463a3c090e5a9c54875a42047a427384f71
>>>
>>> I stand by my comment that patching the config.guess is the wrong thi=
ng when we explicitly have a command whose job is to install updated conf=
ig.guess files.
>>
>>
>> This is vendored code but I think overwriting config.guess might be be=
tter way still.
>>
>>>
>>>
>>> Ross

