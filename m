Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89550C433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 04:52:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.8340.1644987163609028003
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Feb 2022 20:52:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=F1H7QbIu;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=90469c3029=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 21G4fQ69003266
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Feb 2022 04:52:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=4IW9IENRGPeKU3tvx1k9fxtKI1IVMYdSDszUznHEXNI=;
 b=F1H7QbIumLwGT/R63q80uV5g0xscA50mIQWdDqIdJSvZqGaxsEpYDxruyunjsCsQMazl
 wBgilncufaMDA+NCU/3vabPk+jAp7zIWROgFGTm6e24P6EUC86XAy913PR9JLaHFTkLH
 nCLvo9XTuBTPOwH+ELTLmcPiH4G56F7bM9g8UfYpCrx8Gh1x64eMhbEHo/v+nuX0Xpbu
 OYnu+UK9T0GumwSaQQgd57/MnnR/YII4ZeO6EneO0d1x1znCfX0qX/D7saNSluQA8otg
 0szEZZS/RHD+5qFK6e5eViaIOmOCUXQT++q8K6Tf80vluG3STzgB4IFb7Lhvoe8w3VaD dQ==
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3e8nc3r630-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Feb 2022 04:52:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IYlXe9S0RR4/HMHi5hsIW3rufBe2kr6scQw1v/WBobVDp+PaJEeN7z1m0nbXkCxVdpw/4pGxSKdAuTopsBgE+Y2vi80w1uJ5HAQvlFrR+CpOvMcLLOS9D8y5KKQfTAuv5UrL+gLfyDoH0x0vyz2Wm1qvG45Wp6Ve5xogSk6NrI2YYtJc7IDfP2BWREHM4vHukqzAl9seHW3RxROxuBGWdaP2Pwj5mAN4aZa4/G2czNNtc0OPdGAt+EzSo1C6RvwPdenHsFAplyvoAX/Do8tzM3s3qyE0cSrsO1Yg1Wf+es6X1B2seYtohhvBLyYGo00JHAirELzpy6JdMorQyNfsPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4IW9IENRGPeKU3tvx1k9fxtKI1IVMYdSDszUznHEXNI=;
 b=m3KBkEH22e4u86UrpoQASE/Z155TIvWVadoIeyYkLti0R4nA8WLdnX9j2mulMh6HXsiJFMdXu2t7Ynt8+X/Vms8R876xwmuBBStduQVjeWVFBWluitiZRo4oMw0RKWNf0tjO5fmDAAtdLx7N4TmBmxI5wkM7HHwaXsgyTHRa6plK5l2GaV3QP6YH5A71EHPAuLKDrEzEc03qXpKd/4OLVv4cq8PJ38Fo3GkoKHnlA4BT4fPbtf0mtSeHcKFXXhkrgvFe509QYOO0WI7mg49FpE2NDORAEt4dFBtbD6eEqmOiUMDWquL3XuB7EcSjbWrncCoK6Htf4dFfUrySW16mjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by BN6PR11MB1329.namprd11.prod.outlook.com (2603:10b6:404:47::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Wed, 16 Feb
 2022 04:52:38 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::4590:4718:9f20:9d6c]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::4590:4718:9f20:9d6c%3]) with mapi id 15.20.4975.019; Wed, 16 Feb 2022
 04:52:38 +0000
Subject: Re: [oe] [meta-oe][PATCH] plymouth: Add the retain-splash option
To: Randy MacLeod <randy.macleod@windriver.com>,
        openembedded-devel@lists.openembedded.org
References: <20220215091659.37326-1-mingli.yu@windriver.com>
 <ecc34edf-da13-66e7-54d1-acf2e5d75408@windriver.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <57dd69be-9f7e-6830-e959-b565e27bcf17@windriver.com>
Date: Wed, 16 Feb 2022 12:52:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <ecc34edf-da13-66e7-54d1-acf2e5d75408@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-ClientProxiedBy: HK2PR02CA0216.apcprd02.prod.outlook.com
 (2603:1096:201:20::28) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 870af4db-ff7a-434c-ab07-08d9f10827c3
X-MS-TrafficTypeDiagnostic: BN6PR11MB1329:EE_
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1329596C3F49645EF21B4517F1359@BN6PR11MB1329.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	S8CmWtbkT0BrC5xEKujFvL/Iljo9xB5YPxQuwtTmglx11KGJU/g/ggeJJE0QrdQcZtItIhd+WtwInYVbiWm1k5omPi1vaNvukVDoyyGHBBjux0jDWEyrXDzVQitceievRZhc2WKP5Q47jxOd9yn79Cs0C5/T+A3ZuFdKniqUEMfmCBiIZqkYkU0PJn6OSjhfbQCJi3lf75wzg481zauGYWXm3ZNHOaIKPymJiAhvIHZD+FQpOu0ndaxsf4mNnSGzRp5VLAjgw1nupJQ81uJ4h3mDCIsVmYafM7zxX2gjmfl+AGMWuFspnj16d9SMTJH08cOozeLyx3y6Mg8umBtlB53NyYTCjFMqMyrvMPki4esqMQ5bMwZuoMzV55StohE5xxwgF76KLDT/7VDxlZLtzpXvBCGmJLjP6dr18xlcrC+A3F60S1+u3vu6x8LKxqDp0rgy5nllm/DUTXe6CrjvWhIp7LsVHxmzjdS9KEVN3XytfB/3baUVlYhh3r72is/rDK5SGkd9nEvD5WD9cOqJpDgfy15X99TDDFYRUAGS9gTdhA4GzP5bWHbbMDN8wGGIbwI8h/5uKcrmdb64otJOAVi9F5CSMP6PjexSPSL+OlJQUm8sRoB55eSVhyJcZruP89e2kS/4a6advwKXEd2V62p2ak/wYyjn+iyEiZYZjwFhL9GkWVtWWmdOdSNMKK57Kenxm5+XewLunwUDj1gXcE+wUQ/kYJYUVnErIMFJB+B/fJ1QgTK3WDkrJFiT2SN4FjFAHeWPIySCdx1of4yqf4Kk672YCseoL1MURtg8D1BwYYzq+SptAvNrfdmFBNEo6wt2yNQbumW6aZbfojaSDow2n+r6jnGO4dKg9IK2th6Re1rvNcsKYizF4Gctupbdbe4EErM/4vPMpPp1quc1+g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(31686004)(5660300002)(38350700002)(2906002)(66476007)(66556008)(38100700002)(8676002)(66946007)(316002)(53546011)(6506007)(6486002)(6512007)(36756003)(31696002)(86362001)(186003)(26005)(2616005)(6666004)(508600001)(83380400001)(52116002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NGZTenFUc2hkeEdRZzd1QmFVR3lrVzlFd202b2o1MktULytyTVZURGVjVUFm?=
 =?utf-8?B?OTVXMVZWNzVmUUd3eUNlT0hRUTZwSkszZE9JT3lHRGpVREwvVElDN2ZDV2w5?=
 =?utf-8?B?T0R5OU56azBoTURxU2ZQWmo4THdZQWtWYnJjRlRqWG12NmNJWHJBem1Bb3dy?=
 =?utf-8?B?bXFoNC83VVlLM3NNR2d3N2F2Q0ZFUjR1dXBsS2luWXJxR0ZrT2svN29sa3Jw?=
 =?utf-8?B?eTJjSk1EUldraXI0S3dSblhkU2lBVlJqVmExY1llUEtnR1FIaWxOYlFYK1Z1?=
 =?utf-8?B?cXBBZFZ4VmpYSjJ3dVAwOGR3Q3J0MVpVeXZ0Y1d0enllWWMvTys4bDk2dWxB?=
 =?utf-8?B?eFFOMzVyMTZ4UUJnMVArWmtFVlNVTkNnaXFpMTVqZEh1NEdWNlRCaEgxejBO?=
 =?utf-8?B?WUFnNTIwVWdUdVVaZ0xnSlZvOEpEbitHNXJWclVKUUt6bS8vVzRxbTVIWDBD?=
 =?utf-8?B?amZxc04rTU1RTTlqMnhJK0l3UWNRNHcwcHZvcitJRFZrM3hiTzk1bzQ4cjZv?=
 =?utf-8?B?NWlsMHVrMFE1TkpaWmVTT1hYM2ZNYmNJZGp4UU1iZk1IekRnb29wR0FJbDdZ?=
 =?utf-8?B?WUxka0RoRlVIV25icHRkL2xNNDZjY0VvdllxNlRjL29XTUNJQ0doNGxLcE9J?=
 =?utf-8?B?NGR3YmNvcVdtbTZlRU9hOVVDYmJtaWJqazRuNENQWWJsem5jOWdoYnVUVHVp?=
 =?utf-8?B?V2ptdTVZUGRBNnMrZEgxbk5Md3R4b2NNcElVQUVOdndvd05QdkJYZjJHT3lh?=
 =?utf-8?B?TXBFMXAzUGd1QkFLN3BjT2NYZVpIWkpOYUxMb3c2ZVdkSEcyOGlzQVJrOFZl?=
 =?utf-8?B?NWR5S2RneVI3aFRjdkNNS3RvcU83T2VsKzAvVTRKZS9vMGpiQXBUWG9JQkJK?=
 =?utf-8?B?OGFGMmVkcGF4eXhwa0JVT0JVbHZrcEpYeFlhWUFGZjF4bDlKcm41V2JrMnJz?=
 =?utf-8?B?Q0hvL0dyNVplejhWQVk5ditoS3N6cEUyZllUU0M1ZGhQaFFzanpCRlVrd2dy?=
 =?utf-8?B?eW5paVNjRTdDaldpRlN4U1BTM1lyWUpaYTE5bjc5bXQwUFpHbjM0bnhtTytz?=
 =?utf-8?B?ZzFsNzhPaEhRUG8vSzFZb3Y5NFVJalJiOUI2bStBay9SNVJYTEZudkVYaUl5?=
 =?utf-8?B?UVhYSGhZS3laQXhpZmgySzk5Uk5wMlowR1R0NFo1bDZjZ1V3U3NvWUZmZDhR?=
 =?utf-8?B?WUtIQ0hKRVVFQitmZktwZEpvUjgyd2QrZzRtNkJoKzBZbUQwRDA0YUhvWGlM?=
 =?utf-8?B?WGMzN2RaREdhOE9UVUpsaWJISFpINnhUZkhsNW1SZzc5YzY2bzhOVnFrQVM3?=
 =?utf-8?B?blRNRlJpMk9YMzdHRmtERWZ6M2RxaXY1MGtyTHJpN3FLOE8wSXd4YnBJK0l2?=
 =?utf-8?B?TGFZUEs2MlF3NWV4RDhUcG50VmF1RTBZank5VWNhV3lsVEJDV09LcVFsVGZm?=
 =?utf-8?B?VDlTUGpUajV4WWpwT3J2Mk9PYjRtQlY4emcxbXhtSjQ1alF1TWIraG1relRl?=
 =?utf-8?B?NmRSY0ZtVXBMamFwNHRFU2tYVUJTdm9mS0tYMG5xdzJ0SytxNmxjSzJ4eTR3?=
 =?utf-8?B?NlNIVnkzOGk0L093VUZlbEFXTWY0YUZLUTNyelptZzJnSlRGTmtNNU9HbjF0?=
 =?utf-8?B?eWVYQXhJc2hwS08vWnRPSkR4Qm9pNUg3cUhkUUxmODExQTRKN2cwWEVIdWlI?=
 =?utf-8?B?SUpjSTZCeURRdXpySHFTK3R3RGx5bDlmVWUvd2hFUGVveFRGL0FCUldJL3g2?=
 =?utf-8?B?L2xjUVRMOTZCTHBHRGhNd0sxdDJkdGdVclBIb1QrLzVwUHRzWGFkQTZ5QzFU?=
 =?utf-8?B?bjJhbU51dGdtd1JuTko2SmNYQTB1MFNpd1R5T00rRCswTVhVK3dXWWpWOHAr?=
 =?utf-8?B?UEJpYU1naDh2OS9QbE0xajFDaEdHSTF6QU9yUjdPQWY0V2dmQ2tYeHlhQTF1?=
 =?utf-8?B?a1NsTnRxcW9lWDJzN1ZVdnQ5RjE1R2drVVhBVXB2NzZMK1lGUjV6T3ZVNUdj?=
 =?utf-8?B?SDFGUmZaMUJqWUY3Nm8zNDBEYkxsZ1hFQTd0Y2U0Zlc4dEdYc3NiNFpuUGI1?=
 =?utf-8?B?WUc0SlFhc1kzY3ZBVHJSemFqU2lha3Uwc3RvUmhQVDFCaDZnZVhGdjVEbUhR?=
 =?utf-8?B?SHpTN0xoSklWOW9CNWJDMG1NczJZQ3dqZHRIRFhrdy9SNlN6aTNoV1JWak9U?=
 =?utf-8?Q?QhynDB9T0kDEpLtYf8BltOc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 870af4db-ff7a-434c-ab07-08d9f10827c3
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 04:52:38.1301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 oZIjCXdmYCWk9KbWMefJxvk/pRaN5cO+8mSeFt05HmXFGuCkk/sshNibdz34XDttpA1qnGkUoMKB+ezXDSqdaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1329
X-Proofpoint-ORIG-GUID: TTd48_Zri92-Wyqt8l9EsOzqD5IQtDwq
X-Proofpoint-GUID: TTd48_Zri92-Wyqt8l9EsOzqD5IQtDwq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-16_01,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1011 priorityscore=1501 malwarescore=0
 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202160024
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 21G4fQ69003266
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Feb 2022 04:52:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95328



On 2/16/22 7:26 AM, Randy MacLeod wrote:
> On 2022-02-15 04:16, Yu, Mingli wrote:
>> From: Mingli Yu<mingli.yu@windriver.com>
>>
>> Adding the "retain-splash=E2=80=9D option to tell plymouth to keep the=
 boot
>> splash=E2=80=99s contents on screen even after plymouth exits to make =
the
>> splash screen show more friendly on the system which boots so fast.
>>
>> Signed-off-by: Mingli Yu<mingli.yu@windriver.com>
>> ---
>>   ...lymouth-Add-the-retain-splash-option.patch | 35 +++++++++++++++++=
++
>>   .../recipes-core/plymouth/plymouth_0.9.5.bb   |  1 +
>>   2 files changed, 36 insertions(+)
>>   create mode 100644 meta-oe/recipes-core/plymouth/files/0001-plymouth=
-Add-the-retain-splash-option.patch
>>
>> diff --git a/meta-oe/recipes-core/plymouth/files/0001-plymouth-Add-the=
-retain-splash-option.patch b/meta-oe/recipes-core/plymouth/files/0001-pl=
ymouth-Add-the-retain-splash-option.patch
>> new file mode 100644
>> index 000000000..09876d781
>> --- /dev/null
>> +++ b/meta-oe/recipes-core/plymouth/files/0001-plymouth-Add-the-retain=
-splash-option.patch
>> @@ -0,0 +1,35 @@
>> +From f270f80d4c36a22a0f7b8de8fb6b1abef6f7b183 Mon Sep 17 00:00:00 200=
1
>> +From: Mingli Yu<mingli.yu@windriver.com>
>> +Date: Tue, 15 Feb 2022 16:23:10 +0800
>> +Subject: [PATCH] plymouth : Add the retain-splash option
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=3DUTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +Adding the "retain-splash=E2=80=9D option to tell plymouth to keep th=
e boot
>> +splash=E2=80=99s contents on screen even after plymouth exits to make=
 the
>> +splash screen show more friendly on the system which boots so fast.
>> +
>> +Upstream-Status: Submitted [https://gitlab.freedesktop.org/plymouth/p=
lymouth/-/merge_requests/157]
>=20
>=20
> It was rejected upstream:
>=20
> "this isn't right, plymouth-quit gets used for instance when switching=20
> to a getty or something that isn't graphical. Normally the display=20
> manager (e.g. GDM, or whatever) would |Conflicts=3Dplymouth-quit| so it=
=20
> never gets run and then it would call |plymouth deactivate| and=20
> |plymouth quit| on its own after its started the display"
>=20
> I'm not sure what the alternative is...

I think this patch is helpful for embed system which boots up so fast=20
though the plymouth upstream doesn't like it otherwise the splash screen=20
show time is too short during boot as the embed system usually boots up=20
in 10 seconds.

Thanks,
Grace

>=20
> ../Randy
>=20
>> +
>> +Signed-off-by: Mingli Yu<mingli.yu@windriver.com>
>> +---
>> + systemd-units/plymouth-quit.service.in | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/systemd-units/plymouth-quit.service.in b/systemd-units/p=
lymouth-quit.service.in
>> +index ed9f9b9..147e9ee 100644
>> +--- a/systemd-units/plymouth-quit.service.in
>> ++++ b/systemd-units/plymouth-quit.service.in
>> +@@ -3,7 +3,7 @@ Description=3DTerminate Plymouth Boot Screen
>> + After=3Drc-local.service plymouth-start.service systemd-user-session=
s.service
>> +
>> + [Service]
>> +-ExecStart=3D-@PLYMOUTH_CLIENT_DIR@/plymouth quit
>> ++ExecStart=3D-@PLYMOUTH_CLIENT_DIR@/plymouth quit --retain-splash
>> + Type=3Doneshot
>> + RemainAfterExit=3Dyes
>> + TimeoutSec=3D20
>> +--
>> +2.17.1
>> +
>> diff --git a/meta-oe/recipes-core/plymouth/plymouth_0.9.5.bb b/meta-oe=
/recipes-core/plymouth/plymouth_0.9.5.bb
>> index 8f9997e96..7d76ab76f 100644
>> --- a/meta-oe/recipes-core/plymouth/plymouth_0.9.5.bb
>> +++ b/meta-oe/recipes-core/plymouth/plymouth_0.9.5.bb
>> @@ -22,6 +22,7 @@ SRC_URI =3D " \
>>       file://0001-Make-full-path-to-systemd-tty-ask-password-agent-con=
.patch  \
>>       file://0001-systemd-switch-to-KillMode-mixed.patch  \
>>       file://0001-plymouth-start-service-in-add-related-kernel-paramet=
.patch  \
>> +file://0001-plymouth-Add-the-retain-splash-option.patch  \
>>           "
>>  =20
>>   SRC_URI[md5sum] =3D "8a25d23f3ae732af300a56fa33cacff2"
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#95315):https://lists.openembedded.org/g/openembedd=
ed-devel/message/95315
>> Mute This Topic:https://lists.openembedded.org/mt/89157208/3616765
>> Group Owner:openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub =
 [randy.macleod@windriver.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>=20
> --=20
> # Randy MacLeod
> # Wind River Linux
>=20

