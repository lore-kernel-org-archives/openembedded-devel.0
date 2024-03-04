Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6A30C54E4A
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 15:50:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.92303.1709532096528159454
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Mar 2024 22:01:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=SDWXPQVN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3793b29883=william.lyu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4245B9AS020564
	for <openembedded-devel@lists.openembedded.org>; Sun, 3 Mar 2024 22:01:36 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:from:to:cc:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=1QA3lwy55o4prBcveI9X/RDq5CZqLm49M1SNTOnr04s=; b=
	SDWXPQVNT0CQonJXIsz/Ct5cA/oUb5jIMvZc9Fr9TAn9Z9qmadYqQ36CtxeEw6g6
	cuKlf/3wbGChawU/Ghq1OO7jiFNmE0DRMqe494G563Zih51sWOctg4S/yYzYpqWu
	AGB/YeijyzFqa1SYUsj1emLfxqCO0v2jZmLgiQ+OQZcRqDDDqGpxZWVEHDWjsAvZ
	huAiVNjlPloDf87IfQXbD4/yXbf5hIgrEd8VMrxCjTdPivQQIdjZiWacg//p0k3I
	YYAGR9WOpUyAVYvX51HmJ6u45pbJSvck8IwW1jt8Is3Z4sT/TJP7mQJ3XjPLnyB7
	0trLIVql6x+wwut6REENgA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wm093s92q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 03 Mar 2024 22:01:35 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 42461YN3026039;
	Sun, 3 Mar 2024 22:01:34 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wm093s92p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 03 Mar 2024 22:01:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RYNlImsOoqOJoGdN4yBtgtjZthl4/bgYOnkKO0iLdpHWlRgUdBxZVTVq9mYX/t8rJvTgB3SkQZE5PJCi9dlN6vJa4u7SJgUJ4cw1hfRbhpbPpCDW+IpE8gQLw8GdUtEUZe04qy2MGK9knRqdpT/ru4Q4Xc8+xWggkCH63nb6cpTc2idvE+EwCZPKCW1jTbaT5pXr0N/pGFjpAwWDsK/cbrZDvD2bq7tzFmjzAPvZYPLYZza06R5XNiN2cy9ovrdcqBbbjF2ZzvKiEaExSxAbaYv/sdlzM1IsYHrS9xiZGB3yI4slHV6baZetTkBthjGkzUwWJ40KzfKttUZOsdynMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QA3lwy55o4prBcveI9X/RDq5CZqLm49M1SNTOnr04s=;
 b=hqbqol0m1lAQG+GSNPLXeGUFEMgMddmLxtlmlq9Hf+dtyeGhnp3jgeqDQOPN0nUNtdEPoyJXRN9ZfBwjGTR9lFI6ZSwbuqMysB2kvPN8crftYh11G0UP4FETFxDeAYkRjSwK1KehggZ8KcHTbd2CjHakD0EOdxLfP5pcHBrdpQ3BdTrxTvgTPOh6hAw5i8+MlWrvzMZdkVVBNQaV0NpmAsrbWTJLe92yEhA0IfsU3XlOGRKatc1gBwtqhIYjv2ZD8MBhoPS5/g2B3uZSsnNkOlYRS/ZJOJqJYBJ3ugCE1BtfeBTvgMUOoyh8mCiZ/X3J4b+qhJ+oadz545qWF8zNQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8767.namprd11.prod.outlook.com (2603:10b6:408:215::11)
 by CYYPR11MB8406.namprd11.prod.outlook.com (2603:10b6:930:ba::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.22; Mon, 4 Mar
 2024 06:01:31 +0000
Received: from LV3PR11MB8767.namprd11.prod.outlook.com
 ([fe80::6f05:dac:daa:e491]) by LV3PR11MB8767.namprd11.prod.outlook.com
 ([fe80::6f05:dac:daa:e491%7]) with mapi id 15.20.7362.019; Mon, 4 Mar 2024
 06:01:31 +0000
Message-ID: <3d1bd8f4-1e81-478e-96ad-f2956c065a50@windriver.com>
Date: Mon, 4 Mar 2024 01:01:27 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-filesystems][PATCH] e2tools: Add ptest
From: "Lyu, William" <william.lyu@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20240222134140.2367805-1-William.Lyu@windriver.com>
 <CAMKF1spgXkbYj446g_ujSO41hrR9kUx14SF-iyw1y33-4Y7x3g@mail.gmail.com>
 <LV3PR11MB8767C8BB2545D95BF7131C3FEE5E2@LV3PR11MB8767.namprd11.prod.outlook.com>
 <CAMKF1spywovBtYyEUOd5paR-4sSpe-aXLe8tY2jzg13mvSO03g@mail.gmail.com>
 <550e0375-89cc-4ec0-b16d-5a7882fd3a08@windriver.com>
In-Reply-To: <550e0375-89cc-4ec0-b16d-5a7882fd3a08@windriver.com>
X-ClientProxiedBy: PH7P220CA0091.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::10) To LV3PR11MB8767.namprd11.prod.outlook.com
 (2603:10b6:408:215::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8767:EE_|CYYPR11MB8406:EE_
X-MS-Office365-Filtering-Correlation-Id: ccf2165b-cb07-4153-c999-08dc3c1089dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3ma553vN2qPxAer0Lokk5MHaSpsieAEMdqjL6FjzhP31JoDVr9g/NSCV58dXdHQZCe0zEbCXEdrcw9tqtPf+1qGJ3kZBDYlVgzS6gFQo8lnM1ZwLHCjqc/qXumyjrJZS7xqrvJ81ZNM1nJqmLq6mIfimv+QDWTMA49ckHB4EshR+AMqu3Bmp6I2btZXGdAUIdTet77wkl7/obZu8jHuGmq4cgw/OAmKbULuOfIF9UGIUUmB4ZO+AgrJr9RRyGbph7+gMQltj/sCTpDtYiMInmPFPgFTcruvUB48fUm7XZsdhVt/eS8Sri4JjMKNhJG/2Oma2K6HKptfHFZ8U24VCTFgOmpMXVe2BI62+lzURlFjzA8khuKEoAc6kqW3IU1UfaZXEOToNgdQvMYYLSCnjO/hX62/NLPMS6/FqP/j2wa3RcWsybqtkO2SD0nWqQ0Mo/8oIQfoS4GzpuvChYR7oJmYvBTT7AQuBa1OmRIf6xrisRfagoHxN4JT6azM+ah8lt9t6AhfbGuKsLfD9Fv1T/LJqv9Rxz2ZwLTmdrmWkPu9BMHNfUmsU8Tyu0FpzPtFlYqN0FF6zfaqDM3BFJR5skzhSiMA8CINOYsp+KY7lKaqOS8jgX3EKtpfIHPUm8dRg
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8767.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S09aYXlFQjJmYk82NkxaQlY5Qlc3blRtTUdSVXlEYVNPREFGeTd3WjlEbitO?=
 =?utf-8?B?WVJaK3ZNMFJVblV0RVhmRVN1SEJWNzI3d0plZEpmYk9Gbyt5Q0Y2OVcvQkhX?=
 =?utf-8?B?UXI0cVZHOUZhcC9uVzVyck9mNUNRTHd3cXNmZDFmN0ZCRE5mUnQ3RkdXM1o3?=
 =?utf-8?B?aHE5UnI5Tk5WbmlQZnUxNFM4aUcxdEdPOFBkZ0J1SktOMlV4cmJ3MFRXcmp6?=
 =?utf-8?B?d29XUWlsRmJZaDd2SXVsS28vS3JsclVxdENFdGRIRFBGVjlUT3pnMkV5aGtC?=
 =?utf-8?B?UGRrQk1RMk9uQzdYRCtyQ2YrbjZmOVd6UG5paHRjVnZYd2hLbGZPVUo1MGdm?=
 =?utf-8?B?ZWRDYlc5WHlONEFuZWU0L3VzeVJ0OVNIOE5TV241cDRBNzBwNEdyR3JlaUZE?=
 =?utf-8?B?SXZiZWJRbzdzODNxU1B6b3Y3QVdReUJON0JrenVxTi9WWVhtQWdoRjl3dkpr?=
 =?utf-8?B?L0R3Y1pTUlZhNFdvV0lDR1MzZUZVNmM5TjBodDhtbXFsdU9ZOUpIMnJzODFG?=
 =?utf-8?B?N0MwNmUwbVprTTk5R01lVUZYSFVrWnZ0Um16NXFQME8yTEtnVmtiOGZZVFZ6?=
 =?utf-8?B?bHNVTDVleVA5VGZwZjZUSUp5RmMwZ1o2V1BIN2VTV1ZWUE1MZ3B1MVBHcFpz?=
 =?utf-8?B?ZDJMZitCRVdTZUpmcFFFbHdxMTRNUGh6WUx1RUU4Yld1QmMrREFtZ1llUmV5?=
 =?utf-8?B?dENlOU1WWE5LaFpPaWJqS1p5NXdkZWhoS1dpc3JZTTlWMENRYWN2R0s1OG16?=
 =?utf-8?B?OUNZQXE2MG8rcUVzRVduMmR6YmdIVTlNMkRob3k3Y2swRThvTjl3T0NmbzJu?=
 =?utf-8?B?QXpSV2xtOG55aDlET1B3bmlwQU9GMkh6NlVPTHRiQWFsOHcrcjAwMWpHY1ZK?=
 =?utf-8?B?Z2ZZSm5QR0I3dTJXRFhIOGk3TUJHMFpzbWE0U3grb0JHa3lXbG5IakhVU3Ex?=
 =?utf-8?B?Z0hQTUV0Z3VwRVRJRGduNGpNbEFNME5zcmZIWEhLVnhIbTd2aGZETDhpc0N4?=
 =?utf-8?B?bDdpbGJmNzhZZmphQ2QxTGJaM0lhNmppUUxjSWRhdDYrZkhGbmV3aU9sMTlo?=
 =?utf-8?B?SG5oRWhhOWJSdmgrLzVLKzJFSEdEYnhDcWhTRjRlVUxIREk5cERjR0RsREQ1?=
 =?utf-8?B?YTV1b29PRGtxRWNvWXFDYW4vQkZHa0c5THJjd1VWdGsvN2tadFlBaVg3dTho?=
 =?utf-8?B?TDRxY0pIRUdxWWpIQWxqbGk1NGZiMkRvSjdtK3h2RHR4UVJpWFd6TXc1Q2dO?=
 =?utf-8?B?Q05IK0k0aUxmazJaOE9VYVVTM1hjb09XR0hhVnBRMXgwVmh5SDZWalFPeXBq?=
 =?utf-8?B?aG1uVzFBemJMNmF5RFRHZE0zcFVqRVNXek8wSTdmMENRQjF0aVg0RUZ6aHo0?=
 =?utf-8?B?aUZkTjB5N0lDZDYvN2FYWGVER3N6bStIQm05eE9zKzF3TFRoUUFmTzJpR0gy?=
 =?utf-8?B?ZlRqVGNIZ0NGczFVSlRvbnMxTVZ0MXBSOVpTZVlRZ2cvRDB2Z1d5UDVCZG0y?=
 =?utf-8?B?a1hZMXFzcnEvVjQrMVB2czNBMERtNHk4Z2pZcnVGOWQ4NUlhckNUZWVoRlFR?=
 =?utf-8?B?S1U3WkJrN3NNRTlDTnkvZ1BBU21BSUMveDBJTkUwYXlGaGFzbE1ZNDgrSUUv?=
 =?utf-8?B?NXZJSW15Uzc1RHJ0MlpDVEJWSlB6bUVLK3FWSStCeE85MkVuc09manRjSlcr?=
 =?utf-8?B?c2QyWnZxY2JPR3Y2UUF4dkNrczN2VXpoeWxLVmJRVDFGcFYwai9IM1JtUnZQ?=
 =?utf-8?B?QURjaG5sZFhWdTBjWTZKdlJKM2d4bGtiWnBtVVQ0VkFoczlBYmZZVSticDgv?=
 =?utf-8?B?djk5Z1oraCtIdHlzZTd3R0NrSnZRdlFjaVJsMUpwcmFLYXFWQ3NjczhKNklM?=
 =?utf-8?B?NXZNOFVzMVMzdDhYSUNlVXIvMGJxRTI1Wmc0UTRHYWs4QUtxay9EM0JDQzkx?=
 =?utf-8?B?OE1obE1IbDBSbEZ2WHorRzdZQU03RnhaRWRuOUVDVVEyVElKSkpLbnlHYmF4?=
 =?utf-8?B?MUtnUnh6a2tnelZSN0JrcjVBQ243THF6TmVvSW1xS2VSTHV3UzdNL3FYbEV1?=
 =?utf-8?B?YXFzbklETWlYZ295Q21HZWVoc3BCeWVYbFBXbEtxeWQwRUV0bE5jTHlRUC9B?=
 =?utf-8?B?TzV4R2ZSdDlPK2k1VUkycUpXdlFjbkVMdGpUMFdnSm13Rm1aOW91NHR1OERa?=
 =?utf-8?B?WXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccf2165b-cb07-4153-c999-08dc3c1089dc
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8767.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 06:01:31.1543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fd3P6c6s8kKWrqlBe6Ey4zXS4obAPEMHc333hkJyZt9tn0R/wkspQCAYRfVREyRVw/ftAfS2WSeegR1qstes20lUk45Tfouo9pqzpn0NRj0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8406
X-Proofpoint-GUID: MDd-9Rk9C_-PL4inywOPLd4zubW0AQ18
X-Proofpoint-ORIG-GUID: dDH_XQvqtiO6xvdVsuhbDcWYgWpP99Ru
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-04_02,2024-03-01_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 adultscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403040043
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4245B9AS020564
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Mar 2024 15:50:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109100

On 3/4/2024 12:41 AM, Lyu, William wrote:
> On 3/1/2024 4:52 PM, Khem Raj wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender=
=20
>> and know the content is safe.
>>
>> On Fri, Mar 1, 2024 at 12:20=E2=80=AFPM Lyu, William=20
>> <William.Lyu@windriver.com> wrote:
>>>
>>>> I am running into this error on some builders on AB
>>>>
>>>> stdio: ERROR: Task
>>>> (/home/pokybuild/yocto-worker/meta-oe/build/meta/recipes-support/libex=
if/libexif_0.6.24.bb:do_package_qa)
>>>> failed with exit code '1'
>>>> stdio: ERROR: e2tools-0.1.0+git-r0 do_package_qa: QA Issue:
>>>> /usr/lib/e2tools/ptest/git/.git/hooks/update.sample contained in
>>>> package e2tools-ptest requires /usr/bin/sh, but no providers found in
>>>> RDEPENDS:e2tools-ptest? [file-rdeps]
>>>
>>> File "update.sample" is from ".git" directory. I do not actually need=
=20
>>> this
>>> file or anything from ".git" directory. I only need the source tree=20
>>> for ptest
>>> to run.
>>>
>>> However, I am a bit confused about this QA issue because:
>>> -=C2=A0=C2=A0 I do not see any file that has "#!/usr/bin/sh". Even=20
>>> "update.sample" has
>>> =C2=A0=C2=A0=C2=A0=C2=A0 "#!/bin/sh" as the first line. There are files=
 in the source=20
>>> tree (not
>>> =C2=A0=C2=A0=C2=A0=C2=A0 under ".git" directory) that have "#!/bin/sh" =
as the first line.
>>> -=C2=A0=C2=A0 "/bin/sh" is referring to the default POSIX shell, and th=
e "bash"=20
>>> in the
>>> =C2=A0=C2=A0=C2=A0=C2=A0 RDEPENDS:e2tools-ptest should already fulfill =
this runtime=20
>>> dependency,
>>> -=C2=A0=C2=A0 I am not yet able to reproduce this issue using poky. I a=
ssume=20
>>> this is
>>> =C2=A0=C2=A0=C2=A0=C2=A0 because the QA Issue checker "file-rdeps" in p=
oky do not check=20
>>> "sh" by
>>> =C2=A0=C2=A0=C2=A0=C2=A0 default (excerpt taken from "meta/classes-glob=
al/insane.bbclass"):
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0 if "file-rdeps" not in skip:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ignored_file_rdeps =3D=
 set(['/bin/sh', '/usr/bin/env',=20
>>> 'rtld(GNU_HASH)'])
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if bb.utils.contains('=
DISTRO_FEATURES', 'usrmerge', True,=20
>>> False, d):
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ignored_file_rdeps |=3D set(['/usr/bin/sh'])
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if bb.data.inherits_cl=
ass('nativesdk', d):
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ignored_file_rdeps |=3D set(['/bin/bash', '/usr/bin/perl',=20
>>> 'perl'])
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if bb.utils.contains('DISTRO_FEATURES', 'usrmerge',=20
>>> True, False, d):
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ignored_file_rdeps |=3D set(['/usr/bin/bash'])
>>>
>>> William
>>
>> what distro features do you have enabled ? perhaps try it with and
>> without usermerge in DISTRO_FEATURES
>> and rebuild this package after doing cleansstate to ensure its being
>> rebuilt in both cases.
>=20
> I have not been able to reproduce this "QA Issue" error yet. Is it=20
> possible that the [file-rdeps] checker on the autobuilder (AB) where you=
=20
> saw this issue is defined differently than the default poky? The=20
> following are the details regarding my previous and new builds.
>=20
> For my previous builds, there are no specified DISTRO_FEATURES. In=20
> conf/local.conf, I only added the following line. The build command I=20
> used was "bitbake core-image-minimal".
>=20
> IMAGE_INSTALL:append =3D " libexif e2tools e2tools-ptest"
>=20
> I tried a new build with the following line added to conf/local.conf.
>=20
> DISTRO_FEATURES:append =3D " usermerge"
>=20
> I also did "bitbake -c cleansstate e2tools" and "bitbake -c cleansstate=
=20
> core-image-minimal" before each build.
>=20
> William

Just in case the [file-rdeps] checker is somehow not working, I removed=20
"bash" from "RDEPENDS:${PN}-ptest". I indeed get the following error=20
message as expected when building "bitbake core-image-minimal":

ERROR: QA Issue: /usr/lib/e2tools/ptest/build/config.status contained in=20
package e2tools-ptest requires /bin/bash, but no providers found in=20
RDEPENDS:e2tools-ptest? [file-rdeps]

William

>=20
>>
>>>
>>>> stdio: ERROR: e2tools-0.1.0+git-r0 do_package_qa: Fatal QA errors were
>>>> found, failing task.
>>>> stdio: ERROR: Logfile of failure stored in:
>>>> /home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-pok=
y-linux/e2tools/0.1.0+git/temp/log.do_package_qa.3114961
>>>>
>>>> On Thu, Feb 22, 2024 at 5:56=E2=80=AFAM Lyu, William via
>>>> lists.openembedded.org
>>>> <william.lyu=3Dwindriver.com@lists.openembedded.org> wrote:
>>>>>
>>>>> From: William Lyu <William.Lyu@windriver.com>
>>>>>
>>>>> Signed-off-by: William Lyu <William.Lyu@windriver.com>
>>>>> ---
>>>>> =C2=A0 .../recipes-utils/e2tools/e2tools_git.bb=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 51=20
>>>>> ++++++++++++++++++-
>>>>> =C2=A0 .../recipes-utils/e2tools/files/run-ptest=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 5 ++
>>>>> =C2=A0 2 files changed, 54 insertions(+), 2 deletions(-)
>>>>> =C2=A0 create mode 100644=20
>>>>> meta-filesystems/recipes-utils/e2tools/files/run-ptest
>>>>>
>>>>> diff --git a/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb=20
>>>>> b/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb
>>>>> index caf0025c8..a80b6f598 100644
>>>>> --- a/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb
>>>>> +++ b/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb
>>>>> @@ -9,17 +9,64 @@ SECTION =3D "base"
>>>>> =C2=A0 LICENSE =3D "GPL-2.0-only"
>>>>> =C2=A0 LIC_FILES_CHKSUM =3D=20
>>>>> "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
>>>>>
>>>>> -DEPENDS +=3D "e2fsprogs"
>>>>> +DEPENDS +=3D "coreutils e2fsprogs"
>>>>>
>>>>> =C2=A0 PV =3D "0.1.0+git"
>>>>>
>>>>> =C2=A0 SRC_URI =3D " \
>>>>>             =20
>>>>> git://github.com/e2tools/e2tools;protocol=3Dhttps;branch=3Dmaster \
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://=
run-ptest \
>>>>> =C2=A0 "
>>>>> +
>>>>> =C2=A0 SRCREV =3D "fd092754a6b65c3a769f74f888668c066f09c36d"
>>>>>
>>>>> =C2=A0 S =3D "${WORKDIR}/git"
>>>>>
>>>>> -inherit autotools pkgconfig
>>>>> +inherit autotools pkgconfig ptest
>>>>> +
>>>>> +do_configure:prepend() {
>>>>> +=C2=A0=C2=A0=C2=A0 git -C "${WORKDIR}/git" reset --hard HEAD
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 # To install ptest for this package, special conf=
iguration=20
>>>>> needs to be
>>>>> +=C2=A0=C2=A0=C2=A0 # done before do_configure(). So, do_configure_pt=
est() which=20
>>>>> is scheduled
>>>>> +=C2=A0=C2=A0=C2=A0 # after do_configure() cannot be used.
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 # We only do special configuration if we are inst=
alling ptest=20
>>>>> for this
>>>>> +=C2=A0=C2=A0=C2=A0 # package.
>>>>> +=C2=A0=C2=A0=C2=A0 if [ "${@d.getVar('PTEST_ENABLED')}" -eq "1" ]; t=
hen
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Since we guarantee run-=
time dependency when installing=20
>>>>> the ptest for
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # this package, we do not=
 need the check macros under=20
>>>>> section "checks
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # for programs" in "confi=
gure.ac". Plus, these check=20
>>>>> macros set the
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # ouput variables to inco=
rrect values as these checks are=20
>>>>> performed on
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # the host environment. S=
till, we need these variables=20
>>>>> outputted from
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # these check macros. So,=
 we insert the following lines to=20
>>>>> manually
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # set these output variab=
les to the correct value in=20
>>>>> "configure.ac".
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Note that HAVE_DD_COMMA=
ND and HAVE_MKE2FS_COMMAND are=20
>>>>> only ever used
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # in tests/Makefile-files=
 which determines whether to=20
>>>>> include the test
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # cases. As for output va=
riables CHMOD, DD, and MKE2FS,=20
>>>>> they only
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # point to the programs w=
hich test cases need to run.=20
>>>>> Since these
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # commands are guaranteed=
 to be present due to RDEPENDS=20
>>>>> and are
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # guaranteed to be access=
ible under PATH environment=20
>>>>> variable on the
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # target, we only need to=
 specify the name of these programs.
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perl -i -0777 -pe 's/(^dn=
l\s*=3D+\s*^dnl\s*Checks for=20
>>>>> compiler flags\s*^dnl\s*=3D+)/
>>>>> +AC_SUBST([CHMOD], 'chmod')
>>>>> +AC_SUBST([DD], 'dd')
>>>>> +AC_SUBST([MKE2FS], 'mke2fs')
>>>>> +AM_CONDITIONAL([HAVE_DD_COMMAND], [true])
>>>>> +AM_CONDITIONAL([HAVE_MKE2FS_COMMAND], [true])
>>>>> +\1/ms' "${WORKDIR}/git/configure.ac"
>>>>> +=C2=A0=C2=A0=C2=A0 fi
>>>>> +}
>>>>> +
>>>>> +do_install_ptest() {
>>>>> +=C2=A0=C2=A0=C2=A0 rm -rf "${D}${PTEST_PATH}/*"
>>>>> +=C2=A0=C2=A0=C2=A0 cp -r ../build "${D}${PTEST_PATH}"
>>>>> +=C2=A0=C2=A0=C2=A0 cp -r "${S}/build-aux" "${D}${PTEST_PATH}/build"
>>>>> +=C2=A0=C2=A0=C2=A0 cp -r "${S}" "${D}${PTEST_PATH}"
>>>>> +}
>>>>> +
>>>>> +RDEPENDS:${PN}-ptest +=3D "bash coreutils e2fsprogs e2tools gawk=20
>>>>> make perl"
>>>>>
>>>>> =C2=A0 BBCLASSEXTEND =3D "native"
>>>>> diff --git a/meta-filesystems/recipes-utils/e2tools/files/run-ptest=
=20
>>>>> b/meta-filesystems/recipes-utils/e2tools/files/run-ptest
>>>>> new file mode 100644
>>>>> index 000000000..3d4dd9cf3
>>>>> --- /dev/null
>>>>> +++ b/meta-filesystems/recipes-utils/e2tools/files/run-ptest
>>>>> @@ -0,0 +1,5 @@
>>>>> +#!/bin/sh
>>>>> +
>>>>> +set -e
>>>>> +
>>>>> +make -C build check
>>>>> --=20
>>>>> 2.43.0
>>>>>
>>>>>
>>>>>=20

