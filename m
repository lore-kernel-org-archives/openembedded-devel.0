Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2BF4C67861
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 02:24:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.126583.1712629469113490741
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Apr 2024 19:24:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4829c615fb=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4391UivJ016023
	for <openembedded-devel@lists.openembedded.org>; Tue, 9 Apr 2024 02:24:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xawc6j6wr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 09 Apr 2024 02:24:28 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4392ORn0020572;
	Tue, 9 Apr 2024 02:24:27 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xawc6j6wq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Apr 2024 02:24:27 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DC1WJUjQk8T4X5COf+mR25HKWTfHnrCWnP4JC9CsxDI96t53UFse7pYay6nPjNduwARKfOjl0Gl4Lp27g8ut5Sk5IEUTBxme5BEPkGpRh7Ro9AZHpKWQ47PqU45R2ShdnuNQp0iUWVWmQeJwkfVgDYJpECeE7eKrl9rI2j1JTy2mntHhALmIJc/njp/WUnfmG8D5nGgUZLWKCciOPDz1XFC5cK4Ro05/NLfD7zJWKFOB/n4lazOvd+a4EOLEwenAqPB7IXuRXyoVSCjoRuXat/2h571JBfb1+aU4U1G+xhoXdHuKkQwh7W2PbgTOmvpFVoLxx/NnkYjHYy7fc0SvZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Yo77y6WJ1lM3q30htg6LIXNBXsvFb39sYXeLrUSr8A=;
 b=lQT+Rmi0rKpT5bgZeeiPmeV9ADWSZcqfuj/vNCP/K0cWwD48/UOKHos4U767B5qMROByamHKvO9Qeus8fLPGk/af9mrYsDrRJDY6BYUhBJCUTbXd/z0bT3uetdbhHn4L13nRdY4ou8QuaPW3DYWZGkPer4nCf7K79XlrvgoY9S5171IRAZH8Edvu5aZqOkBRkopGhr55L/OPvvyH1GwvXCNeMVnJczQBbzNCOr16PoCEBhiD5xVj7ZeY5LEyUYqLV+egY+33qcKIyaxY3Zya+H0jv/Pfh44DBADdx35thz5pjhezgmLkE7wmDVNjfZxXi3x25gz54CrPqKGv51ZJnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by PH0PR11MB4949.namprd11.prod.outlook.com (2603:10b6:510:31::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Tue, 9 Apr
 2024 02:24:22 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::5dcc:ddee:208a:33b5]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::5dcc:ddee:208a:33b5%4]) with mapi id 15.20.7452.019; Tue, 9 Apr 2024
 02:24:21 +0000
Message-ID: <8527cf1b-bc40-4310-9d22-96daf37e3004@eng.windriver.com>
Date: Tue, 9 Apr 2024 10:24:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][PATCH] libgpiod: fix QA error in ptest RDEPENDS
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20240408092657.436963-1-xiangyu.chen@eng.windriver.com>
 <CAMKF1soVBNOQpqiZn-m-MeeEm6ERm-7t-FKWbKiY+MEGsE0+eg@mail.gmail.com>
Content-Language: en-US
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
In-Reply-To: <CAMKF1soVBNOQpqiZn-m-MeeEm6ERm-7t-FKWbKiY+MEGsE0+eg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TY2PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:404:a6::34) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|PH0PR11MB4949:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JfBw0zbIogZ8VkAvLeoUAENOul2cUQBH7ZKDFY252bs5oiupCNDU9ioruFpfIQ7QAp89B/S1CTIGXfGF9fHKgMbln4MIc1F+iuUgZVMndxpE3roY8m5BWNjGk8D39T7KfNqsI8YIJQBjS+hAso8I9LHBrhW21YOVSivNrDY5IGqElZBPsmdaJE/camB4Da0x7CYJsgS54+ZKHZ3LnMNXYtntmBVUCKnsN6opa77hV+/I1uriIUdetyv+csq2ND9A3sGy/aVDe/p0Fgy0ScAtSM02ZjViUsAI8v1DgQqwFXVa8IDyeZr3sQ9t3oNN80YJQDVGqeVc7ZMfHMiQMIcILobda/s9vpyfTAQlBNYSt5pJ9EVwAksQId5JBqhMWpO+AW9FB/u4+WvuHir3bDd7SdpV0yf74KqOl2O3kViAkG6zi1si2LBKFE7LjT7ajKBsy7dETXgEEiOlg7nnwH39CbViwD8WUCtZkfayv6Z/JANAW15inCBdKVnTf9TMoXEmBe+s5cxiSvMXzopAw1seOav+BLo1pc9+hvnbcBom2cqoqknNZGOsG4AuqU86Zt9E+MKX+BW7XZvI7KV7Hf8fdnf/Um2mC3pLdhIiQZvQ+0mh6AvQSYwM/SiF2okk5OzY
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?V3VLb1NCT2dicUI2VGpEd1Ura1FhajBxWTl1eXNyUGRWSWpWRnRQVkhJK2Q3?=
 =?utf-8?B?a0ZJUkYwQ3ZhM2hlNzZ2d0hybEU3bUNKb3lvZ2F3aHkweVU2ZkM0bDFjWFZR?=
 =?utf-8?B?bFh1ZS84d05nZCtaUklYaFZzNFBWeTN1aUoyMHNzMFZjeHJSbEcxaGdjRGNw?=
 =?utf-8?B?d3NkZG53OXczZzBNajVhTy9sNWE2ZXRRazU4ZVY3cFdwVVppWmtFTm0zcEg1?=
 =?utf-8?B?dW5Fem5uU1daOXlyUmRGM1N5ZHQ2QWlhYjFGTklVbUFBR3I2RXJFS2pNS2lV?=
 =?utf-8?B?TXM0R3NSdFRiWlVCNXR6MUJWd2hsaEs4cjB2MGh0U2kwbThiZzd2R1N3MStK?=
 =?utf-8?B?NFRzZE85bWY2aGp1ek5KcFhvRDhGMUh0d0REUWl6Zi9LMkgvbjlZWVlqTDFz?=
 =?utf-8?B?TU9hRlVBZ2w2eFF2SFFIQlF4dzNYbURHcGh5ckRQckFBWG5ETEZ1dStoYVRV?=
 =?utf-8?B?VGpDRU1jbjBIYVZ2b2R0NGp5RG81b09mc0ZRc0NGeWNJb29pOHV5V3pjU2tH?=
 =?utf-8?B?SzFINjJVQ2Y2VE5vZmVqUWVWS1ZkN3JrQ1plc3E3R0xWa016aFFlMnF4bEFC?=
 =?utf-8?B?bEN0Wld0WjAzMEVWbVNnL3lxNEhTQ21KWnlqQ0l3cTNXVW5uZFFOT1pSVHQ2?=
 =?utf-8?B?TmJnK1lUNnpFVFR4T3hwNW1raDFSN1M0czhzRDBNbXY2cWJvNm9LR3N5VjF5?=
 =?utf-8?B?YW9SZTBWSGZ5S1JGME0rZmpFUVQ4bmlxclJadEF0d3BuUDlvcytoMDZnRmtJ?=
 =?utf-8?B?VHVtUlRVOTZSUWVZZVZjaUJDNDZsb0tNeC9hNXM5S1ZYWEVGNm9hcmhvZVRC?=
 =?utf-8?B?TUVYSkJUSnBua1F2Ui9vbDNpOWFlVnpoYmJQVTMybGUrTHlYSGNvc3BJK2Ns?=
 =?utf-8?B?QzlIRGlEYVNPRnk5SHJNay9odlJXRlFmMzN3Q1RuSTEyS3RaNFVuazJEazFN?=
 =?utf-8?B?T1psTzYwNk9jb2ZiYjJQU3cyWTZGK2pHbGFnUmlYU0VybkVSblY1MmRPc2cw?=
 =?utf-8?B?c24zNkRucFI4cHIwdG9iRGtNWHN5Mml1TEMxQzc0VXFQaHgwVWFTRmovWHZr?=
 =?utf-8?B?TFRXbUFGVDdSVUVzQ0s0OTFmL0JJb3VmdGV5WXlNOGs0WEdPM0JrQWxJdTBI?=
 =?utf-8?B?QkYvVFhMUmdLSDFpUE4wTzA5bjRLV0RwOFRhUFcvcW9JdjRWaGhNL3JjRHFG?=
 =?utf-8?B?aWFLcG16VG14Q0ZOOENzUTczdVJ2MlpGWkNBWVhIeTBBSHhCZUJ3d2cwQy85?=
 =?utf-8?B?YTE1WXBRaDQ0SkpBT1NsWHd4VDRDVVh0MEFFNlYvNGlGdjlPcGxGOWo1R3Fj?=
 =?utf-8?B?VXNGQ2x3OFNjZ0UwYkVWZ2NuNzBDSWhMTTc0ODJEck92RGJvQ09nMTVuVXdn?=
 =?utf-8?B?cWJFcjJ1b29tT3RHaW5pUXdldzNsMS9nNHgyVWdQVkxEOTJSM2dIcjgwUW5N?=
 =?utf-8?B?Uk91UCtUaDhoSnhreGlNZDJrUkM0WU9WWHB2RTdCYjJTcXFpMndpTDJ3dWpQ?=
 =?utf-8?B?T2pzS0wxbFFSRTVHUXFPQkhLWGw0Y0VyaGROUVMxYUFhRmE1aTNnTUVjRlc2?=
 =?utf-8?B?Tzc1SW1WUGQ1VDVzTU9aekpOKzZ5RncwaWd0QUhhTS9wTUxnOU0veW04ajAv?=
 =?utf-8?B?aWhnQUdBR3h6a1N0NkxSNGU0MVY1Skh5bW9LWjkzTWdpNUdINDRneEpQRVRR?=
 =?utf-8?B?eVE0ekY4TTJZL1lzb1ZtL2NHZGlRQWNCZS9yeThQWmptVjdOZVBuU29RcVNI?=
 =?utf-8?B?NXlYMjFlbEd2UUlBdnJDMW8vY0xISGRLM3F0ZGFUaFBCaFg0MDNhdkQ5Q2or?=
 =?utf-8?B?SzJGQkFFWXRLVnVUSkI4V0RVdUxnbjBtNUJQZVdWTStSK21rN0wxS1JwbVly?=
 =?utf-8?B?MTVyUlZ6OTA5YXV6VHl3M0d2ckVVNStaUERjbFk1T2JOZTk2VkUvUGhKYm4r?=
 =?utf-8?B?S2Y4Y0N5UUkrSFVPb1dqTlRzRUk4cnVsWEtwT1FvWGs1K0h5blErVHVFWmlS?=
 =?utf-8?B?SVBrZDdCZndDMEY1RUgvQVNxeFljYmZxeC9adjJ0R0lOK1pKNzc2M0l1OW9v?=
 =?utf-8?B?ZWkwK2VQRWE3WHg2dzF4YzV2UlJOQXpWckR3NHorcStDNXl6R3U3SDE2VmtP?=
 =?utf-8?B?MVBVM3ExTVQvelpGQmdYMnluMFdPZUVQSzBGZlNna28xaXFXY290QTFZTVRR?=
 =?utf-8?B?bnc9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3790527f-1ce7-4571-1914-08dc583c2ab5
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 02:24:21.9161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UqMJnTB+d7/bfksq2R+rjclUgCLm4m3iAzWmoOcwB6eBmV2tMFvZ4XyHidd2LSwxouoj/Sbty/cAxOo8AUXfxbW9/yo3V2l/ND252Dml8kI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4949
X-Proofpoint-GUID: QAnaUrwENblWTj1GjGMOWYzOAmZusD_h
X-Proofpoint-ORIG-GUID: 0Y5fthfpCKfKpdPnJKDXXh-nnSV5Jryd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-08_19,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 impostorscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404090012
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4391UivJ016023
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Apr 2024 02:24:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109875


On 4/9/24 00:12, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Mon, Apr 8, 2024 at 1:47=E2=80=AFAM Xiangyu Chen
> <xiangyu.chen@eng.windriver.com> wrote:
>> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>>
>> The bash in ptest RDEPENDS would cause following QA error:
>>
>>     ERROR: QA Issue: lib32-libgpiod package lib32-libgpiod-ptest-dev -
>>     suspicious values 'bash-dev' in RRECOMMENDS [multilib]
>>
>> Add a ptest enable dependency to avoid this QA error happens.
>>
>> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
>> ---
>>   meta-oe/recipes-support/libgpiod/libgpiod_2.1.1.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.1.1.bb b/meta=
-oe/recipes-support/libgpiod/libgpiod_2.1.1.bb
>> index c62c9a3567..4a568b4fbe 100644
>> --- a/meta-oe/recipes-support/libgpiod/libgpiod_2.1.1.bb
>> +++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.1.1.bb
>> @@ -21,7 +21,7 @@ FILES:${PN}-ptest +=3D "${libdir}/libgpiosim.so.*"
>>   FILES:${PN}-ptest-dev +=3D "${includedir}/gpiosim.h"
>>
>>   RDEPENDS:${PN}-ptest +=3D " \
>> -    bash \
>> +    ${@bb.utils.contains('PTEST_ENABLED', '1', 'bash', '', d)} \
> This check is already available below, so just add it next to shunit2

Thanks for your suggestion, a v2 patch has been sent to maillist, could=20
you revert current patch on yoe/mut?

https://git.openembedded.org/meta-openembedded-contrib/commit/?h=3Dyoe/mu=
t&id=3Dd3a20f5d7ea5a85c1d0fb298a6f3fc93dff0e828

thanks!


>
>>       ${@bb.utils.contains('PTEST_ENABLED', '1', 'shunit2', '', d)} \
>>   "
>>   RRECOMMENDS:${PN}-ptest +=3D "kernel-module-gpio-sim kernel-module-c=
onfigfs"
>> --
>> 2.35.5
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#109861): https://lists.openembedded.org/g/openembe=
dded-devel/message/109861
>> Mute This Topic: https://lists.openembedded.org/mt/105397634/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

