Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78920C433EF
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 02:13:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.3972.1635819223351131587
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 19:13:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=BuzQFdiV;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=694066fcf6=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1A21mAXn010300
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 1 Nov 2021 19:13:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : from :
 to : cc : references : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=u107/L1m7EjBluhlfkV49ffW5X++vi230awdevGntNc=;
 b=BuzQFdiVKN2rkSxQCWqRt1e3gpmXNZ9d1sOgCFqexPShB7oUyqPfFoZxpL96ffzDSBhx
 r6KjcZVyCBjplaa9LeoCXxUyhGoIKGBPrSyxgnC6PRGCUhQgOE4Nu51cuOipWQKwWEQU
 U0qdqv0QDQRs9KQhtpNuDQHF2dferESM63xeglhTD6vNM83TkakEennZXU5JjDccUHzC
 yuC+3XgmeE1H/rKVHqM/J2iixh5dc8tF40WXQx1kwQLSa2r7cmmKy2/ONkt5UmhjNMsX
 71s9YScox6lGny5+Vo/70iqoeEtlcwqU9aAiF92gWoTIicdpT8MmyDhTru2MOkwkl9Yl nA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3c2u5y81a8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 19:13:42 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.16.1.2/8.16.1.2) with ESMTP id 1A22DgLn002035
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 1 Nov 2021 19:13:42 -0700
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2049.outbound.protection.outlook.com [104.47.57.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3c2u5y81a6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Nov 2021 19:13:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AHHvVQ936L3H5wQN10aKod4QdOG3cQWK1dqOXibav/M0k3VezGuoo7GpEM6Y2NQuIMDgPMEBX8kM7S/STAtoMilWCkUPAvPezSPu6a2qsjNctdwExfmMlRWgv3sHVCc0OnKNRHHr96ALUKwTEzdeycITPf++LMXdsxLP3okkVNt2KFLCgX55VU8e6onxRfUBGQU+1UsGzONej5C5wysjAd8DTxHkQdMcAU1SMomvTDosiNHIStzW+o15E0bcLGZP8kx486J1M0Vyv8VKB8UOiW+ZQqOy6SJkH0KXCRo8jaH38+wHaWcVkE9Vz+NgKitq2MCONNkiD6TVPpc82yZlvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u107/L1m7EjBluhlfkV49ffW5X++vi230awdevGntNc=;
 b=n0YqTfGtsGBnQMkKH7ZtHvQ4O1aMvobHFBd4p+xZNykoCSPlFrJGpMkSjOJyJ5hgofDsI8dZcHWc7O6a6wLfv6C1t1f2y7IO/n6BsTOBtZGnR4KG1UqLBzd6KGQpUBAEleT8FCjnD7BL2n2lT3oyts/IUXC9owa3bQbJnRFGqRuTfVTLtLqBEsrQB3kke3JEBDyirAri3vHj26O8ZTd+s7q/p6s4Njl+5r0AMChgVANEzTeW9H6Qor4C2hrRXsenGMteQwyKETGJiU8du0Zlpp2Oroq9mdmLPU/H/PIr4PnzF11RjmMeUaRCDJabMdiJTlBxuQo7PKIZGz8YJGIXYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SN6PR11MB3216.namprd11.prod.outlook.com (2603:10b6:805:c1::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.18; Tue, 2 Nov
 2021 02:13:39 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::a544:19b6:196b:f339]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::a544:19b6:196b:f339%5]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 02:13:38 +0000
Subject: Re: [oe] [meta-oe][PATCH] mozjs: fix powerpc compile failure
From: Changqing Li <changqing.li@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20211102005253.38996-1-changqing.li@windriver.com>
 <CAMKF1sp-ds+shTRHyeS3aeNFiwZyOwqWcq+q4ayxQ_jdZYg55w@mail.gmail.com>
 <16B3968C63382D57.22938@lists.openembedded.org>
Message-ID: <eb8c3f95-37f3-024f-8aa0-c0736a22ab82@windriver.com>
Date: Tue, 2 Nov 2021 10:13:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <16B3968C63382D57.22938@lists.openembedded.org>
Content-Type: multipart/alternative;
 boundary="------------2EDD3BFC62112EF3F68D8735"
Content-Language: en-US
X-ClientProxiedBy: HK2PR02CA0175.apcprd02.prod.outlook.com
 (2603:1096:201:21::11) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
MIME-Version: 1.0
Received: from [128.224.162.189] (60.247.85.82) by
 HK2PR02CA0175.apcprd02.prod.outlook.com (2603:1096:201:21::11) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14 via Frontend
 Transport; Tue, 2 Nov 2021 02:13:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f2da16d-18c5-4ccb-72e9-08d99da66162
X-MS-TrafficTypeDiagnostic: SN6PR11MB3216:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB321658896D7FF9FB24AA3416828B9@SN6PR11MB3216.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	46RyYi02MxeHcDqtonc3772P8vpp4dhQVOqnR+571fKhxsmfGXKCEYsimA+LAfwY17VPEihX6kH9QgeDgAd9J4M+NFBG6WJBG9cptx3JlY2BjVadJ6mBSkde9n2lttnssd2vcERTXZ3LNoKAPoHs8EMpI+YJckFb9It6c8YnoYXbkPbBiNWGrkh3fRClBlPKa0MOknfcbFIUgIigJUJttQlkauOj5u6zeyqBwEZ5Lq1pa00F7yBMPYCOGUR9wnSPEz3NcV3zNgOatp/jX5Hm7OKwSJv5i2wjMO78I2DsHoM+LQB7hPGWkSnO1LZnkokRLuybD+WKNnmEoiq2/qDI1Z0+ZB00CmRTI2IFqDZLzLHQpCh1aM7vFTXdpzPyBtWJgXfi1VZHEFmxVKhHWhFHS3glGLwagwXiArjp1b+Zm8LzIzNo8+5rudr4O+t0JWk5ygdl7NFuTs5P6+qFLEnOUfMLcnmxTWPa2lhvqYCYYMNCXENZgI7M764R3qlqEKh9Ht6ybk5ocgYWuNdEUIL5+dghCbh9xGfeBZbMYRZZEhJJRHgzjj0aczmEc8BAGIpyMLi66tk+/KMmWR21Cd32BHevgtGUmdhGSGYVdhN9mm6wX2nfOgJnp/dr5bEmb7X7OwiY9pVRfgm8dn+3Sd5jCUSdyktUpulgeRI4X1AfKNQWHH8WmPX7JfwjQrzFlzX1Yq61RwPD9b7YPKFwABe1l31v+g2mS3HTrn9SYXqEYKzjU0GMQB1FK5vLZp8k3MerQz/L4kppCL8xSfytupoOtAEr3a6ZsaC4gmDg9bbVcflG0kRbpyyaFgkIQfbVBZ3dn5P/5OMFWoI4Hgbu+o5UKKq6MUEZY77elQ+1j52Jk/VO1OAJjRxSBYvCvEYN0GjRhioGnbBK0tx1Kxf50no1HWhAvxsCK782JOsgXbvud2g=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(2906002)(316002)(4326008)(8936002)(66556008)(36756003)(6486002)(66476007)(186003)(2616005)(66946007)(44832011)(6666004)(31696002)(16576012)(8676002)(956004)(38350700002)(53546011)(5660300002)(26005)(38100700002)(6916009)(83380400001)(6706004)(52116002)(33964004)(966005)(31686004)(508600001)(166002)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?emRqbk4xRDgrei8zN0MrbGZlNHRaMStjd3NYT1FDUkUvWHNnUHFMZXJWaGRi?=
 =?utf-8?B?OGZESUVra2dOdVhMQXRWaWJiY2I3RVJKa2gvRVIyeFVJdjZuVXpwOTkwVmZ5?=
 =?utf-8?B?dFdhamM1bVIxODRSZ2hrU2Y0ZHRiNEYxQmdIcFZKVGdyR1lHejJCd1VwZHJY?=
 =?utf-8?B?TEhBV29KelBHbXRvU0Rnd2RpMU8vL0JhQU04MEFYcU5pTjIrUzZIUzVvcTdK?=
 =?utf-8?B?QU5RamZhUTkveFd0UUh1VFdXZk5QUVpLeHhOZXNHKzAwa1JwaFVVU2tydDNH?=
 =?utf-8?B?RW82R1hLYnowTFY4a29pYktXcy96YzVhdm1ReTBYSE9qMG1jY3BDNi9NeExJ?=
 =?utf-8?B?WmI1WUtkOHJteVNRTGoxelVVMStUZS9ZUzZyZEttWi93N2s4bVZiNGxrajZm?=
 =?utf-8?B?VTRSQXBJazQzMGNhZldzbzZCWEJUODNtNVpkNC9MTU04UWs2aWFKRVoyTEdO?=
 =?utf-8?B?Nk1vUXFscVFPYUZFTTd1T1JCVjdxVktuZ2Y5VExuSU42UGpXQW4ybUFZZlA5?=
 =?utf-8?B?T01zRExJM3F0ais3Y2VUVjUzTk9wQXd5L1dPU0c0Qmw2Q1F2UGJKT0g4MFZI?=
 =?utf-8?B?aWhTQ1IwL3ZSaVE0YzhvUW04eUUyaXlRY3c5Y1VkYVMxTTczcmFTS0dtVTlS?=
 =?utf-8?B?a29QTjVyM2pWWjlVa25KcFI4SzlRaVdqMnJCRWdsbm9PZGYvb1ZwbXZjMlBB?=
 =?utf-8?B?Y1QwdFYwcWNPSVY1eDBkUFVsR29ubW1SQjZ3MUtYQ2JFQjVYSkNJL0d1dFkz?=
 =?utf-8?B?SC92RFY1OGRnSDZucXNJdW00dUpaa1E1c1JsWVZNOGhud04vQkNFMllyUGFp?=
 =?utf-8?B?b1RzYmMwazdBakEyc2F4RGNKNk5SYXpJM09vRG9nSUM0aC9aL2VkTU5uY3RF?=
 =?utf-8?B?QkE3UWFIVEtMdkdwTUVvUWZ3WVJrd1NLdndzM2tKTk1GVnRsMW9UM2l5NWZn?=
 =?utf-8?B?ay8yZjUvSGE0dmg0aFRvdFRVUmZPVVhCcUVDU2o1SWR2Z0FVeWorbGVWZlMy?=
 =?utf-8?B?UExZQlFXckFGSUxkdnhqZ2VibkxtMzA3NHNkeThkbnVCdTI1cjB4TnBWWDVV?=
 =?utf-8?B?MHhwcmtkRmxZRUJTN2d6WGhnYkpyRFNHbXZROFJTMTRubnFuVUlDb1c1QWdD?=
 =?utf-8?B?Zjd5S2VMRzNQdW1QMmhWczQ0SVl0dC9pSjZQMGdtWWFBR0EySkdOdzJFcXp0?=
 =?utf-8?B?OHlEenZGN1dwWVcrZkFHdi9PSTU5MUxlVkRraEkwZFFDUnpuTDBSa0pnZFNU?=
 =?utf-8?B?UGdEQUEwMWU2Y080eG5JRENwVmg5UnA3VmZKOWFqTi9TdmVxK3huMCtPVEhJ?=
 =?utf-8?B?eXExa2h2Q0cxWU5xRWk0UVZYd2ZPUVQ4NUluT1c2aVJLU1ErWGpuYkNXUEF5?=
 =?utf-8?B?UDlWZk5sK1l3ejRRa1RGbXcrTUtCR25ENHBnUTBCVXl4WlkxK2gxR0hNNE1t?=
 =?utf-8?B?ZnViS1dJRTNtMjZqWlJDNW9ldnJ5M0xJenVLSk93RzNCMEg4TmVEdWU4WnJl?=
 =?utf-8?B?MUdMWFRPejVSMXFpRGh4QzNvZkkxUWIwSXIrSXlLWHZ5M2NsdkhjbHZGOTQ2?=
 =?utf-8?B?QlRPSUlnTzh1V1JxQTAvaExCeVp5YmNiQVBoWGo3TUYzVzVkQVhVTzRJa1Fw?=
 =?utf-8?B?TElxNTJ0RVFkMSt5eVM0cGpZUWMxQTkrME1tdzVGdUt6RnQ3bnZXN3h0a3E0?=
 =?utf-8?B?RDRQeFNxaHUwWC8zaVh1OFIvblBQTXhqTkt5WkZWQXZYNU1DV3FVVUpGczRY?=
 =?utf-8?B?czd6VXdqbUwyQjdJeTVUWUg0anhnakVUampEeGtFL2R2ZFNFeGZVWDZxQ0h6?=
 =?utf-8?B?VktRNG5YUjd6UHNTQUlObDE5ZlJIcTFCUjExYjczdHlBOGhaOE5hVk9xbFVj?=
 =?utf-8?B?cTcyamwyQWVjaWlnWW5EdEQ3YzdlRGdkcEJIK1VaODYvangrU2pHY2N2Q3Ix?=
 =?utf-8?B?dUFKMTJ4Ny9yRUY3aGoxblhwSFRhazJYSzdsS3pKeERMVkpobFFQU1BITWx2?=
 =?utf-8?B?U3NoNWs0ZlpKeEgzSTNVanVhT3NKRjNONzZucU0yblJ2TDBUZXM3S1VyT3lO?=
 =?utf-8?B?RWluR0pkditQbnk3U2U1RkZWV1BOaVJzSURONUFGR2U4R2VWbEcrQjZRVWY1?=
 =?utf-8?B?T1dyZkZwMUZGMXN3TkZaNlpXNEtCaVdZWGc0Q3FmNiszZGRwczBWYlNGdXUr?=
 =?utf-8?B?NjZldWlDdGR3NS92WE15MUNkNzZPSmdhV2JOVlY5SVJTT1BzVEwwZmpvRVg5?=
 =?utf-8?B?YkVnT3BUeWZNOE1qS0NZWGRmN2RnPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6f2da16d-18c5-4ccb-72e9-08d99da66162
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 02:13:38.6352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 7ydRUUFCoMnDSmkgL7tEwUZoIEOinBuce3GddwiSEhJvngGqHiFqEOfaiBESMMWHuezQm8D9bAajATPFRQTUBa0oH49ihKMS20fXRRnf7xk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3216
X-Proofpoint-ORIG-GUID: QdAG77aCn5KKxeGPlXRla9gNS8dNQ_-b
X-Proofpoint-GUID: uZ4N8eJT9ckWVDdIllFGa7mSoRcu5wi3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-01_08,2021-11-01_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 adultscore=0 mlxlogscore=844 spamscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111020009
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Nov 2021 02:13:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93764

--------------2EDD3BFC62112EF3F68D8735
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 1A21mAXn010300


On 11/2/21 9:30 AM, Changqing Li wrote:
> On 11/2/21 9:01 AM, Khem Raj wrote:
>>
>> **[Please note: This e-mail is from an EXTERNAL e-mail address]
>>
>> Can you rebase it on top of master-next and resend please
> OK

Sorry,=C2=A0 just find that master-next already have a patch for ppc buil=
d=20
failure and can cover this condition.

so this patch is not needed any more.

Thanks

Changqing

>>
>> On Mon, Nov 1, 2021 at 5:54 PM Changqing Li=20
>> <changqing.li@windriver.com <mailto:changqing.li@windriver.com>> wrote=
:
>>
>>     From: Changqing Li <changqing.li@windriver.com
>>     <mailto:changqing.li@windriver.com>>
>>
>>     powerpc disable jit by default and also have compile failure:
>>     WasmFrame.cpp:57:76: error: static assertion failed: Aligned
>>     after pushing DebugFrame
>>
>>     Signed-off-by: Changqing Li <changqing.li@windriver.com
>>     <mailto:changqing.li@windriver.com>>
>>     ---
>>     =C2=A0.../recipes-extended/mozjs/mozjs/nojit-32bit-arch-fix.patch=C2=
=A0 =C2=A0
>>     =C2=A0| 2 +-
>>     =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>>
>>     diff --git
>>     a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/=
nojit-32bit-arch-fix.patch
>>     b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/=
nojit-32bit-arch-fix.patch
>>     index f308b4863..cc2673e74 100644
>>     ---
>>     a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/=
nojit-32bit-arch-fix.patch
>>     +++
>>     b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/=
nojit-32bit-arch-fix.patch
>>     @@ -15,7 +15,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com
>>     <mailto:raj.khem@gmail.com>>
>>     =C2=A0 =C2=A0protected:
>>     =C2=A0 #if defined(JS_CODEGEN_MIPS32) || defined(JS_CODEGEN_ARM) |=
| \
>>     =C2=A0+=C2=A0 =C2=A0 (defined(JS_CODEGEN_NONE) && \
>>     -+=C2=A0 =C2=A0 =C2=A0(defined(__riscv) && __riscv_xlen =3D=3D 32)=
 ||
>>     defined(__mips__)) || \
>>     ++=C2=A0 =C2=A0 =C2=A0(defined(__riscv) && __riscv_xlen =3D=3D 32)=
 ||
>>     defined(__mips__) || defined(__powerpc__)) || \
>>     =C2=A0 =C2=A0 =C2=A0 defined(JS_CODEGEN_X86) || defined(__wasi__)
>>     =C2=A0 =C2=A0 // See alignmentStaticAsserts().=C2=A0 For MIPS32, A=
RM32 and X86
>>     DebugFrame is only
>>     =C2=A0 =C2=A0 // 4-byte aligned, so we add another word to get up =
to 8-byte
>>     --=20
>>     2.17.1
>>
>>
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93763): https://lists.openembedded.org/g/openembedd=
ed-devel/message/93763
> Mute This Topic: https://lists.openembedded.org/mt/86756698/3616873
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[changqing.li@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--------------2EDD3BFC62112EF3F68D8735
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/2/21 9:30 AM, Changqing Li wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:16B3968C63382D57.22938@lists.openembedded.org">
      
      <div class="moz-cite-prefix">On 11/2/21 9:01 AM, Khem Raj wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:CAMKF1sp-ds+shTRHyeS3aeNFiwZyOwqWcq+q4ayxQ_jdZYg55w@mail.gmail.com">
        <div style="border:solid #9C6500 1.0pt;padding:2.0pt 2.0pt 2.0pt
          2.0pt">
          <p class="MsoNormal" style="line-height:12.0pt;background:#FFEB9C"><b><span style="font-size:10.0pt;color:#9C6500"></span></b><span style="font-size:10.0pt;color:red">[Please note: This
              e-mail is from an EXTERNAL e-mail address]<o:p></o:p></span></p>
        </div>
        <div>
          <div dir="auto">Can you rebase it on top of master-next and
            resend please <br>
          </div>
        </div>
      </blockquote>
      OK<br>
    </blockquote>
    <p>Sorry,&nbsp; just find that master-next already have a patch for ppc
      build failure and can cover this condition.</p>
    <p>so this patch is not needed any more.</p>
    <p>Thanks</p>
    <p>Changqing<br>
    </p>
    <blockquote type="cite" cite="mid:16B3968C63382D57.22938@lists.openembedded.org">
      <blockquote type="cite" cite="mid:CAMKF1sp-ds+shTRHyeS3aeNFiwZyOwqWcq+q4ayxQ_jdZYg55w@mail.gmail.com">
        <div>
          <div><br>
            <div class="gmail_quote">
              <div dir="ltr" class="gmail_attr">On Mon, Nov 1, 2021 at
                5:54 PM Changqing Li &lt;<a href="mailto:changqing.li@windriver.com" moz-do-not-send="true">changqing.li@windriver.com</a>&gt;
                wrote:<br>
              </div>
              <blockquote class="gmail_quote" style="margin:0 0 0
                .8ex;border-left:1px #ccc solid;padding-left:1ex"> From:
                Changqing Li &lt;<a href="mailto:changqing.li@windriver.com" target="_blank" moz-do-not-send="true">changqing.li@windriver.com</a>&gt;<br>
                <br>
                powerpc disable jit by default and also have compile
                failure:<br>
                WasmFrame.cpp:57:76: error: static assertion failed:
                Aligned after pushing DebugFrame<br>
                <br>
                Signed-off-by: Changqing Li &lt;<a href="mailto:changqing.li@windriver.com" target="_blank" moz-do-not-send="true">changqing.li@windriver.com</a>&gt;<br>
                ---<br>
&nbsp;.../recipes-extended/mozjs/mozjs/nojit-32bit-arch-fix.patch&nbsp; &nbsp; &nbsp;| 2 +-<br>
                &nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
                <br>
                diff --git
a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/nojit-32bit-arch-fix.patch
b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/nojit-32bit-arch-fix.patch<br>
                index f308b4863..cc2673e74 100644<br>
                ---
a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/nojit-32bit-arch-fix.patch<br>
                +++
b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/nojit-32bit-arch-fix.patch<br>
                @@ -15,7 +15,7 @@ Signed-off-by: Khem Raj &lt;<a href="mailto:raj.khem@gmail.com" target="_blank" moz-do-not-send="true">raj.khem@gmail.com</a>&gt;<br>
                &nbsp; &nbsp;protected:<br>
                &nbsp; #if defined(JS_CODEGEN_MIPS32) ||
                defined(JS_CODEGEN_ARM) || \<br>
                &nbsp;+&nbsp; &nbsp; (defined(JS_CODEGEN_NONE) &amp;&amp; \<br>
                -+&nbsp; &nbsp; &nbsp;(defined(__riscv) &amp;&amp; __riscv_xlen == 32)
                || defined(__mips__)) || \<br>
                ++&nbsp; &nbsp; &nbsp;(defined(__riscv) &amp;&amp; __riscv_xlen == 32)
                || defined(__mips__) || defined(__powerpc__)) || \<br>
                &nbsp; &nbsp; &nbsp; defined(JS_CODEGEN_X86) || defined(__wasi__)<br>
                &nbsp; &nbsp; // See alignmentStaticAsserts().&nbsp; For MIPS32, ARM32
                and X86 DebugFrame is only<br>
                &nbsp; &nbsp; // 4-byte aligned, so we add another word to get up
                to 8-byte<br>
                -- <br>
                2.17.1<br>
                <br>
                <br>
                <br>
                <br>
              </blockquote>
            </div>
          </div>
        </div>
      </blockquote>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#93763): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/93763">https://lists.openembedded.org/g/openembedded-devel/message/93763</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/86756698/3616873">https://lists.openembedded.org/mt/86756698/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------2EDD3BFC62112EF3F68D8735--

