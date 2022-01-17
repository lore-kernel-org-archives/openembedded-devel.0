Return-Path: <zhe.he@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CC4AC433F5
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 03:30:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.6758.1642390247979481214
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Jan 2022 19:30:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=RtNiWk4A;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=80160cdeaa=zhe.he@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20H3UkPi012743
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jan 2022 03:30:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=VWj2WtkK1o0UuD6wkJFdcCPakIe1S8zeHG2hXleSMLk=;
 b=RtNiWk4A/3ZwoKNG1lUMyNiNe7T4jV0BxgB9aGWP6S+u7hBn5yGi4sA2xrj65GZsw3SW
 wkBrU/3/Vw+PieKXtKDXyvYltXwR6CnmIsKFve4Ur/A3pRdVV7NssZQ43pAZMRJx0utu
 JUbB6zD3LO8QhAAzEBTGlojldCRmkQeaC8Q133yNsGRVnF/Ytt/a0Dx0b9WRnRqAY5Nj
 6J3JGPCCEpnnXBhZJ76UffWbTYLKiLJTDfQ6RdNFHlyhFh254uxJ6HCuJSeDKEZ1IBbZ
 wPGLOHqTdhdeeU6Dnz5KnlEcaNzl1xniDa1WgGV4t63hEcUNZF/HmUUiEQuvFrckQbj3 iw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dkq7ts1kp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jan 2022 03:30:46 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20H3UjNt012735
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jan 2022 03:30:46 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dkq7ts1km-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jan 2022 03:30:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ekJW4EYesRFv2FmqZsAS0b39L55TWhqAwgZMdYOXi+t9/OC8B6/9GkSwLQlOqYdRLTwSSIFZkuB2GsRolhUb1DEBRZrHVHFBo3JwRn4qxaaf3qzXTaf9LgU1s5mrMT84f85SIjAoocjvu0Pawcv6Vbb4AwwRaJaWclJ73ch1i91xd4Opgcte4ro4eL10lbmXE2zoZOgmoZ7ZoQUKfUnFG9+av1tB37bcjcXYikVrGFZUdWyCjnkTMlKt2xslswGhReZWhvp0ENfWWyhN7D2g55/QGjZduwTi7wdNpf9KYRkfvNYASvsD19MRf8ItgbR/bBEMLYMNXqbVKJQpbARcEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VWj2WtkK1o0UuD6wkJFdcCPakIe1S8zeHG2hXleSMLk=;
 b=VqJvmxxj9CHFizcGaNWXYUg6rr4SeTwvjASj1FjYW5wg7l5N2dme0Lk/yJ6JTDTiiRChpTE+ZRrFonDrk6mLzhieHoe7uc9n7JCdQhbEbyDxbdqjlHv3+/Dc1q7dAs0d9VviGe3ya1PI04ABGq552qAtrtbjnWXrvA0Rv4lG29eaPjJobc8T/mRC2yLWEzd9c3Lbba44gC3zbjOIXNCriiuL6ek3qF3gZVG3W2k1tU7zZy1t5g1OYAvwk+qyjzB/aIL0wLq+CFlPNiOAqWRJjB84x/xlXPAzSQ1C8rqjGrpR0KQY6o0pVo9k1ti5Reqv4DzMJUcx9cbkrUdAaZ9AWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by SN6PR11MB3230.namprd11.prod.outlook.com (2603:10b6:805:b8::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.13; Mon, 17 Jan
 2022 03:30:44 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::a917:745f:993c:1e9d]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::a917:745f:993c:1e9d%6]) with mapi id 15.20.4888.013; Mon, 17 Jan 2022
 03:30:44 +0000
Subject: Re: [oe][meta-oe][hardknott][PATCH] protobuf: Fix static init fiasco
 on 3.15.2
To: akuster808 <akuster808@gmail.com>,
        openembedded-devel@lists.openembedded.org
References: <20220112081106.9277-1-zhe.he@windriver.com>
 <08998377-20d8-8f4f-b76e-f6d4f4ce3178@gmail.com>
From: He Zhe <zhe.he@windriver.com>
Message-ID: <e401831f-388b-92eb-2a0a-7f1c82a6ca86@windriver.com>
Date: Mon, 17 Jan 2022 11:30:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <08998377-20d8-8f4f-b76e-f6d4f4ce3178@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-ClientProxiedBy: SG2PR04CA0152.apcprd04.prod.outlook.com (2603:1096:4::14)
 To MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8deaa630-d407-4b9a-d29a-08d9d969be4d
X-MS-TrafficTypeDiagnostic: SN6PR11MB3230:EE_
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB3230E26841B371900DA556D28F579@SN6PR11MB3230.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	m7U96K+Xx1boRnmBoZy2S8GBJO3V9+lztiCG13qio3hItN+moKsccpFRjHFL657DpICRRDKEcIrTiILXiGHUna0q8RvjseaP2VYzbFbAvENkuWGyr3b8QCwbDE48gSX1oRHLI2wqkFRqWKkAS4oVyc0hmQHYZv407nFx6/5LhcVnSAEhwV0cgNCON62Vl5hSLTkrCzafh5EVYF5M05vckNi3iaHcnC0BpzOZ/2LIxqzBKkPug5jCngY2YJufKrrUbxyLPqn57TAvOu+bx0NPbz/PnmqStXXQQfFkIXPdR9dabU4LX4d5jsED1By/+3dapgxcjGHkT334CPhyh6PI2Z49DBygtsk2q6SovBRkQBJZV3XWvBkg/BvZEJc4vsJr9GSZRVksiVJ2O5DEWIB/dHAafesBOISWzkT1igBPWbgJ7S+FNb+JTgOujcXrFbn2sWYxwifDvlLz929vClUDxM50MTo6aIxWrCxDkEVIDtJMAkTiNunt96qJ8HzieErWkPNE5sb+Vv0aWnrepKT7lXpf4qwLQr/kKTyjji+NGg2RQsdDwnvRJnUy2yjpj/nH4cgOzn63GsHRBxkUIHSE9HD/8ORbi1HybEF7Jqk53KDReOiq+WnSHSFiL+0IlKcc+aQ0IqDVxMgMwUxGJc7EAi6FokkI2tfKt9JgkYDxUdyhtu7t4CBeLBUtAQWEbhShoFl2u/5F/Ttoq3cB8On1xucqhcTPMDGdPYytjUwLT4BRt/44Ew/xC7iAo2XNPtSlSqbdGJZL2FBrYFn8fbnOV/vaykC1xRWrSaY4IxK6Y4683B/D5ZYglFG51QbdsAxcmKycUILEe/G1be+dsv06fu4HPvI1ZFbk0b6N8crl5caAyoL43zBrWRQ9ochVQh2d59DI/2jFQMItk3bT/tFLfw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1358.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(52116002)(8936002)(8676002)(36756003)(186003)(6506007)(966005)(38350700002)(38100700002)(53546011)(2616005)(26005)(6486002)(316002)(66556008)(83380400001)(66476007)(508600001)(31696002)(31686004)(86362001)(6512007)(66574015)(5660300002)(66946007)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cGpSaGgyem9KK3lxbjdsZy9HNDZseXdMS3BIc20rWWJaVERSdTZrT0xIYXIz?=
 =?utf-8?B?UVNUWVhzZUZHeXBHdDNLNEl5aEZMSVZKa3IxYXVRNm83MzFmUkNScDNSQmo2?=
 =?utf-8?B?d3FkTmNqWU1oUHg3VkRPR2tacHoxL3lxS0p6TTVzMjhZVm54Q29FRFliL0Jm?=
 =?utf-8?B?OW9KV3JraTAzOG4reFFuOGdqeGtHMzRYNXFLSDVGREMwMGRZcVl0SlRQQW9z?=
 =?utf-8?B?WFZhbGwxditlSE43WXhSWjUwREVxQ0pjbE1Ed1ZoN1VpVU84QVZUVnpsRkU5?=
 =?utf-8?B?UXNMTVJieWhFOEpzMEwySFFUNDlCU1FVU0wwNkd5VFFpaFVWemlIRXNzSms2?=
 =?utf-8?B?bmF2Z3M2aFBBTU9qaDUvRlRtMDFpRDliYisvazBXWE1JbThuZUVUcnRXVXE1?=
 =?utf-8?B?TXRNN0FtTkxwdjM2TGxKdDd5OWIrbjVjd0tBeXNEMjlaSTlMNWtiN1RWOEtj?=
 =?utf-8?B?VHVyNzZ0aldMYzdHdjVHL0FRRDdrNjRtbkU2Z21PeFc4RUplQk1IN2NTWW5t?=
 =?utf-8?B?aDhxYlN0UTVwQ3pZSm9TRVY1U2QwbzdhQUpnL1hGcVpWamNMS1czNTJoMS9j?=
 =?utf-8?B?Qm0xZEUwaUJmYVhBMVZWenhueUkrd3ZrOHlZdGZjSXppcytCaFBEUU5yLzVa?=
 =?utf-8?B?d0d4S01FUmlqMmYzUWE3clVQeHJyczJoOFZRS2huWDJXU1Fid1ZaMHZ1NzJm?=
 =?utf-8?B?QVZ6OHV6dDZkc2FpTTVDaGxUT0hnSndQeW5pNWlnbWVNeVJucFlZdlRpYzJO?=
 =?utf-8?B?Q2U2dCs5d28xdUt5NFB2SDMyclhSQXUrNTZCNXh5RGxBa3E3TFZYN0pPTlhY?=
 =?utf-8?B?bDIzSVNIUzhEVm92NkN3Y2IxN2N2bFdZSXloZlNNY0NKNnJ3NzRtTXl5Mjk1?=
 =?utf-8?B?SG1HL0ZQcytrQnhFM3FrZjJpblYwd0NSL3Y0TVdnbGJ2SHkxVjFwTlVzTDFI?=
 =?utf-8?B?bEtTY0ZiNVNhaDQ3WTU5aXlvekJnSkhSWXJCOUNIUWlsR1hYdXJOd1hFN1BV?=
 =?utf-8?B?VkpoSUt0MzZBRUdxTzBVcEswT1ZDSVNnQVpEd0VvZTdwWnJId1cvTE9YTlBX?=
 =?utf-8?B?SnNyMGJVSFRpQ1pjUFJmdHJSbzJ2cGRONlI5YnliM2RQV053VzBObDlSaWtr?=
 =?utf-8?B?cGVJZ0t3b1lWMXAwQStPbW0xbVJQWm5SU1dsNkVLb0NHaTVCaVBOcVRSWHdX?=
 =?utf-8?B?VzZXNlJ0UEQvQ1FYWENabEg2Q3JNUWlKWXRteXd2SDdLTGFTNm45cWkyR0FO?=
 =?utf-8?B?dXJrMmlCS2VYZUxMZFlYV1laZjFZZWZSbU8yUWFha25qYmUzWGVPMnJ0akVq?=
 =?utf-8?B?dkhhWEh3RTVnVTFiRWs1ZnFsNU1Xb0Jwb1BRVEtZY3lmV1NLdXVsbVpMdUE4?=
 =?utf-8?B?RjdGSHZReGRic1dRTzljSzFkd3ZSR0svN3NFa2pLaExoVzluMWFsWmlua0ND?=
 =?utf-8?B?cTdoTitjQklSeUNFenBhaVN2UWxOR2ZvVHlkS092U2ZCek93UnZmL2NDNk9s?=
 =?utf-8?B?QXkxd09HOE9xRGJ3SUY1NkRKT1lwRHMyMUJxelJjVnZVWnNaeSt3NFhjV2x5?=
 =?utf-8?B?Rnp5S25UaVVwL2cvRGZUWG8xWm5VNWpWbWRHeEErZm5vYzU2aEd5S213VWxL?=
 =?utf-8?B?Rm9sMkxJdjBoTGNPTk5qZFR4N3MyUFd0YnRyelJRaXNQTHE0S2I2bllLRnNt?=
 =?utf-8?B?NEp4M1RtMHhRWlVGMHNQczBVS045R2F5UkRnOWRrUG9WaVkzMXR3aHNhcFZ6?=
 =?utf-8?B?bjI0NnFpaGFKY29uNUlwK3VkVlIvUmRYVWVER0ZLdVFpSGhhbU15NVgxc014?=
 =?utf-8?B?dElndHJMbXJvWHE4a0tVLzVOdHQrcXRjd3lpRDk2bWJaTXJhZGEybnBnMDg1?=
 =?utf-8?B?akdRdS9ZaVV1VEIwakZpdEdqT0d3bzlnN1JUMmZsSEtRdVFoTzJyVkNnaWVu?=
 =?utf-8?B?QUlBUFUwZVpGUVI3bk56YXlsdlJjcEZGU3FYWTBJRDFXWlVvTklnWmdTMGlt?=
 =?utf-8?B?aUd0QmdsZkVxTkh3YmJGM0Jwa2t2czlpc1RWTWRVRHZwcVUvVFpLdXg0V0VT?=
 =?utf-8?B?OWZGK2JlZE9MMVMva2VoWWlkZndTdlhrZjhLRjFQd0t3TjNBRUUrbndCSFhD?=
 =?utf-8?B?eVVlbzBFalB5K0VMWUhwRzM2MCtzWVVqd3dSb3BSWG82c1Y1ZXpiMUUwQS9V?=
 =?utf-8?Q?G7UH6p4UFjEnPvhBIAFdCqc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8deaa630-d407-4b9a-d29a-08d9d969be4d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 03:30:43.8762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 AbtR9q5raWOdyy+PlxGhdUbKRbNBdcL3m6KJCHOXF8S4lDPgg8LI5x3fohSfBHYxO8tWlhk1d5LHAVf0l9YBsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3230
X-Proofpoint-ORIG-GUID: SvI-wnEu-SDcN_50euIyLgzdsqCUGvso
X-Proofpoint-GUID: BiYSWOAiqRDKASN0ms4Mbxta_q5sFd-g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-17_01,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 adultscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201170022
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 20H3UkPi012743
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Jan 2022 03:30:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94894



On 1/15/22 10:22 PM, akuster808 wrote:
>
> On 1/12/22 12:11 AM, He Zhe wrote:
>> The protobuf 3.15.2 suffers from the C++ "Static Initialization Fiasco=
"
>> issue. This patches makes the extension attributes have a higher
>> priority than the attributes, so there's no possibility of random
>> initialization orders.
>>
>> Signed-off-by: Jani Nurminen <jani.nurminen@windriver.com>
>>
>> Upstream-Status: Pending
> Since this indicates "Pending", does this issue need to be fixed in
> Master too?

Thanks for reminding. Just sent one for master.

Zhe

>
> -armin
>> Signed-off-by: He Zhe <zhe.he@windriver.com>
>> ---
>>  ...r-init-prio-for-extension-attributes.patch | 81 ++++++++++++++++++=
+
>>  .../protobuf/protobuf_3.15.2.bb               |  1 +
>>  2 files changed, 82 insertions(+)
>>  create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf/0001-Lo=
wer-init-prio-for-extension-attributes.patch
>>
>> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Lower-ini=
t-prio-for-extension-attributes.patch b/meta-oe/recipes-devtools/protobuf=
/protobuf/0001-Lower-init-prio-for-extension-attributes.patch
>> new file mode 100644
>> index 0000000000..9f4fd71796
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Lower-init-prio-=
for-extension-attributes.patch
>> @@ -0,0 +1,81 @@
>> +From 00362d12edf1b7fde723b041a4569dc659e65ad1 Mon Sep 17 00:00:00 200=
1
>> +From: Jani Nurminen <jani.nurminen@windriver.com>
>> +Date: Fri, 24 Sep 2021 09:56:11 +0200
>> +Subject: Lower init prio for extension attributes
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=3DUTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +Added PROTOBUF_EXTENSION_ATTRIBUTE_INIT_PRIORITY in
>> +code generation for extension attributes.
>> +It has lower prio than PROTOBUF_ATTRIBUTE_INIT_PRIORITY to
>> +ensure that extension attributes are initialized after
>> +other attribute.
>> +This is needed in some applications to avoid segmentation fault.
>> +
>> +Reported by Karl-Herman N=C3=A4slund.
>> +
>> +Signed-off-by: Jani Nurminen <jani.nurminen@windriver.com>
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: He Zhe <zhe.he@windriver.com>
>> +---
>> + src/google/protobuf/compiler/cpp/cpp_extension.cc | 2 +-
>> + src/google/protobuf/port_def.inc                  | 7 +++++++
>> + src/google/protobuf/port_undef.inc                | 1 +
>> + 3 files changed, 9 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/src/google/protobuf/compiler/cpp/cpp_extension.cc b/src/=
google/protobuf/compiler/cpp/cpp_extension.cc
>> +index 3792db81a..cbec19d30 100644
>> +--- a/src/google/protobuf/compiler/cpp/cpp_extension.cc
>> ++++ b/src/google/protobuf/compiler/cpp/cpp_extension.cc
>> +@@ -174,7 +174,7 @@ void ExtensionGenerator::GenerateDefinition(io::P=
rinter* printer) {
>> +   }
>> +=20
>> +   format(
>> +-      "PROTOBUF_ATTRIBUTE_INIT_PRIORITY "
>> ++      "PROTOBUF_EXTENSION_ATTRIBUTE_INIT_PRIORITY "
>> +       "::$proto_ns$::internal::ExtensionIdentifier< $extendee$,\n"
>> +       "    ::$proto_ns$::internal::$type_traits$, $field_type$, $pac=
ked$ >\n"
>> +       "  $scoped_name$($constant_name$, $1$);\n",
>> +diff --git a/src/google/protobuf/port_def.inc b/src/google/protobuf/p=
ort_def.inc
>> +index ae9fef425..f1d203707 100644
>> +--- a/src/google/protobuf/port_def.inc
>> ++++ b/src/google/protobuf/port_def.inc
>> +@@ -154,6 +154,9 @@
>> + #ifdef PROTOBUF_ATTRIBUTE_INIT_PRIORITY
>> + #error PROTOBUF_ATTRIBUTE_INIT_PRIORITY was previously defined
>> + #endif
>> ++#ifdef PROTOBUF_EXTENSION_ATTRIBUTE_INIT_PRIORITY
>> ++#error PROTOBUF_EXTENSION_ATTRIBUTE_INIT_PRIORITY was previously def=
ined
>> ++#endif
>> + #ifdef PROTOBUF_PRAGMA_INIT_SEG
>> + #error PROTOBUF_PRAGMA_INIT_SEG was previously defined
>> + #endif
>> +@@ -596,6 +599,10 @@
>> + // Highest priority is 101. We use 102 to allow code that really wan=
ts to
>> + // higher priority to still beat us.
>> + #define PROTOBUF_ATTRIBUTE_INIT_PRIORITY __attribute__((init_priorit=
y((102))))
>> ++// Some embedded systems get a segmentation fault if extension attri=
butes are
>> ++// initialized with higher or equal priority as other attributes. Th=
is gives
>> ++// extension attributes high priority, but lower than other attribut=
es.
>> ++#define PROTOBUF_EXTENSION_ATTRIBUTE_INIT_PRIORITY __attribute__((in=
it_priority((103))))
>> + #else
>> + #define PROTOBUF_ATTRIBUTE_INIT_PRIORITY
>> + #endif
>> +diff --git a/src/google/protobuf/port_undef.inc b/src/google/protobuf=
/port_undef.inc
>> +index daef09bc4..d0c613b55 100644
>> +--- a/src/google/protobuf/port_undef.inc
>> ++++ b/src/google/protobuf/port_undef.inc
>> +@@ -77,6 +77,7 @@
>> + #undef PROTOBUF_ATTRIBUTE_WEAK
>> + #undef PROTOBUF_ATTRIBUTE_NO_DESTROY
>> + #undef PROTOBUF_ATTRIBUTE_INIT_PRIORITY
>> ++#undef PROTOBUF_EXTENSION_ATTRIBUTE_INIT_PRIORITY
>> + #undef PROTOBUF_PRAGMA_INIT_SEG
>> +=20
>> + // Restore macro that may have been #undef'd in port_def.inc.
>> +--=20
>> +2.17.1
>> +
>> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.15.2.bb b/me=
ta-oe/recipes-devtools/protobuf/protobuf_3.15.2.bb
>> index 62c6ee0159..ac4e1ad84b 100644
>> --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.15.2.bb
>> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.15.2.bb
>> @@ -17,6 +17,7 @@ SRC_URI =3D "git://github.com/protocolbuffers/protob=
uf.git;branch=3Dmaster;protocol=3D
>>             file://0001-protobuf-fix-configure-error.patch \
>>             file://0001-Makefile.am-include-descriptor.cc-when-buildin=
g-libp.patch \
>>             file://0001-examples-Makefile-respect-CXX-LDFLAGS-variable=
s-fix-.patch \
>> +           file://0001-Lower-init-prio-for-extension-attributes.patch=
 \
>>  "
>>  S =3D "${WORKDIR}/git"
>> =20
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#94779): https://lists.openembedded.org/g/openembed=
ded-devel/message/94779
>> Mute This Topic: https://lists.openembedded.org/mt/88369203/3616698
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [akuster808@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


