Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB978C54E66
	for <webhook@archiver.kernel.org>; Sun, 10 Mar 2024 14:01:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.15424.1709740806840994343
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 08:00:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=PRYMqJQT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=37956c3c62=william.lyu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 426BePFQ009237
	for <openembedded-devel@lists.openembedded.org>; Wed, 6 Mar 2024 16:00:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=PDTa/7nVP8OT4T5sGEvMfp0E15gGvfiDRCz1TRSs6cw=; b=
	PRYMqJQTrRpKI5w9ErkrkH+XGilYcVdsOpAUHzbLYgOhY5nhEyWaNydxQW4K2PxQ
	OTKu1nP4KWqqoE3tgLnSLf8qYxBUwi/ts5CsIfaRNSi1dDMzxYvPG5FcLLN+7CsS
	g+13qt0Gomn5d6PFaVHC3OAPFvO7DhPxj1FQsFv9jKx6uxb7cdeGboBEMPFAtSy/
	g0kS9ZjYOWaE4cKzo9s7lXACciqPEVIj7w27SlPvlQQaEjvTChGxymvWpoYfzq/l
	I/bJqgAo4ujpMdr/zaUt4lCcPZckvjOf/FucDDWeySLen71iN/Aaia9v2RkmrWfv
	T/CY5f6+ieg1cLN/+rYhLA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wksawv5ep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 16:00:05 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 426G054O019788;
	Wed, 6 Mar 2024 16:00:05 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wksawv5en-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Mar 2024 16:00:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kp5vh7AZ5E/c0KsjDPbRp3PPBaWgySQXE3+v2FLBEQ3I1P/mMZiHv0p/dtraKVU4Alu1vvn2YVTMc3vCd9sCWhDiJAK4XxUgf/E8HNkVnZI21dxZpJvH3iKJ107Y69rz6uCZH1lxSqQvZoCWF7heeGFX8NvzZFlEesBn6Ep2MWudeKOdx0mv9GS+UR3h7FG0gJHEpUXfrUibtUcGGET9OAZ4cMHgWK9KIBhFvMtKyKwn6OCFWD2nAxUapG3ugzlIK0p2ahv3gB8MOFBmwJfrfdKsF9o1P2anI9NeA4IV9ZR3vgj1iqadaphyU3CLzxmvB2sK2rJcbxSrD6Zf5ZH5PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PDTa/7nVP8OT4T5sGEvMfp0E15gGvfiDRCz1TRSs6cw=;
 b=jnxRb/qiFL+/DmnUpFkqCXKG60bpKGxsu7f4/aIykds7xt/nVi9trt3+dTLyOA831/p87+kQS/AE2doMpZPgJKox4QSSkv0L4dltC7i5r9GlLBf0bsdvuwYTrIiaZ2MoLPF5DmVb1xveX+MEQaG8wSKxGV47gXR6k7MkZrwNkw/ifzFzaNZ0GrQqPUI3JowbzOOzJylM3cYg/1x19BJKMYKHongTGbv0av6UmLYaToE8BXT16FG/yQIUrdnk0lcfvJh88JVrUHVUqKHZYK7Wkdjh2jf5q2MMgi7nt4LTqsynO1yy4ObqpJdTAWaFM3hB1G1jUvKzhTzhwg0CJnHD0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8767.namprd11.prod.outlook.com (2603:10b6:408:215::11)
 by DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Wed, 6 Mar
 2024 15:59:58 +0000
Received: from LV3PR11MB8767.namprd11.prod.outlook.com
 ([fe80::6730:81e2:544b:1379]) by LV3PR11MB8767.namprd11.prod.outlook.com
 ([fe80::6730:81e2:544b:1379%4]) with mapi id 15.20.7362.019; Wed, 6 Mar 2024
 15:59:58 +0000
Message-ID: <c5f6672d-9173-46c5-b455-06cb48fed3da@windriver.com>
Date: Wed, 6 Mar 2024 10:59:55 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-filesystems][PATCH] e2tools: Add ptest
To: Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20240222134140.2367805-1-William.Lyu@windriver.com>
 <CAMKF1spgXkbYj446g_ujSO41hrR9kUx14SF-iyw1y33-4Y7x3g@mail.gmail.com>
 <LV3PR11MB8767C8BB2545D95BF7131C3FEE5E2@LV3PR11MB8767.namprd11.prod.outlook.com>
 <CAMKF1spywovBtYyEUOd5paR-4sSpe-aXLe8tY2jzg13mvSO03g@mail.gmail.com>
 <550e0375-89cc-4ec0-b16d-5a7882fd3a08@windriver.com>
 <3d1bd8f4-1e81-478e-96ad-f2956c065a50@windriver.com>
 <CAMKF1spUjLnzLuOh=doaMRx++MVEjVoXbz7p4Z5NV=FqbdPAxA@mail.gmail.com>
From: "Lyu, William" <william.lyu@windriver.com>
In-Reply-To: <CAMKF1spUjLnzLuOh=doaMRx++MVEjVoXbz7p4Z5NV=FqbdPAxA@mail.gmail.com>
X-ClientProxiedBy: SJ0PR05CA0176.namprd05.prod.outlook.com
 (2603:10b6:a03:339::31) To LV3PR11MB8767.namprd11.prod.outlook.com
 (2603:10b6:408:215::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8767:EE_|DS0PR11MB7484:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e30684c-8280-4ba6-0695-08dc3df6791e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bPOCch9KsDp/oLuvAI9qHxugnnOdLYlAMeAN6EeJ4eKZcZklaA3uyc9xFVRuOsCqZQ+6dJXMnJMB3tP/0AC/PqM+LflDQskCgm9SmOfuDJWKr76rNTO6mPHj+8Rfqi1MBOroiH9qYbKqa88c4j9i7pSa+dwvWMpzqcXB8OOZv/AKvl2aLyvHdT1RFYERx2ERZ4pyQ7Qlk3+6/se3QzcX360XpuLMMNkafsdz7na/xjyp0+oz4j9dqeC3P3XmTpqxWUFD/27iS7VybXVEmXBIY711x40dlmkiHic88YLUGGQ//nRn7gatnoZb1+mVoTXF12zTyPtqz0qSSTrfa1LTSY3QgrHtBAi0+6SvCvyu956fqstWcRYTVlhPWjFW5Ko8IOm4y6H8myGuNPTxjU9FPROneX62mbrascxRa9FR8mmsjsGPbc0DbdBi96LMXeyrzLLJsmiA07bFLXzPygDSl+F6UYz01AO/2PpnzjFiFXtYM1J3Z3lJXqLmEOGGqpVVKqJZqLuoc5sGTvnbXZOxGcU3B3JzY1MZwxh4pO9glAnU8zAbu6Mubvf1QPGJfiV3XYUITlGOA6BBQuVGU72PRyga6z4m0KpanEV2rVcAyuKJPBRvaodpIYEFRQ3mXmyJ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8767.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RlRsMWJBWld2TjdwZTlINlBMQVRwc2tvQXVFNnZPNTNyRFN1MlRabEczdjRV?=
 =?utf-8?B?Q0QzUm9od294R0VQZCthZ3l5VjZ2bDFZQWRReDR6U3hXY21WRVphZmI3U0xC?=
 =?utf-8?B?UENwZ2E2UEl2QmU5SkZtbHFrYTBYMDRPSDByWUZaVHhOU2h5dVNUUXdpUzVr?=
 =?utf-8?B?LzU0MCtpdU9kaGQwbXFhSjZwdE5BZkNpMlg3dlBrWnJmY1VCUUFRQVJ2Skw2?=
 =?utf-8?B?TDJxb04wUk9FY1ZYZUJ6YWdDU2kwUUJsV0pIK3BuNlZBeVEwU0JreUw5dmJ6?=
 =?utf-8?B?UkJHVUU2MkpKekFsOWlSdmlyZnpzME1pQ0ZUTFNwVzljZ3NJMng1UkJNb3Zz?=
 =?utf-8?B?TUlUU0swUWlwcXltQmhoV2ZzZktBa1cweUJDZHVvVytRVGFDZFYvY09OYXNL?=
 =?utf-8?B?OTBLbVo4TEE1ZDlIdGhYc1R5VlJzdWNMSjBmRWVMVjdXL0VZQkZtZFNQTXJJ?=
 =?utf-8?B?ZGJwZmlqa1lSaXFUakdTK2NaZzdjbXNwYnY5ZG12WUZGY2QxOGpDVDM5bFFP?=
 =?utf-8?B?dGJ4cUVZcEk3eHRCSnpWYmY3Q0g3QlNXNU5mUWdySTNxOVFBeUJOd3h3MWxy?=
 =?utf-8?B?Z1ZIQ0JBVWtkS216MXZhcUViTnY4VnplU01VUjk0TGRkOXhaVU8weVR1THdG?=
 =?utf-8?B?M1ZlVVhWWGo4ZEcyLzJTUFJNUVdBNFV2akFtRGs1dWpMZTN0YTluUC9ENVhC?=
 =?utf-8?B?TDh3QVkxU2NlRzhGT3ZEb29NUjJrd3ZReFVKNm9ndkVMbHRXWCsvUnY3Rkcx?=
 =?utf-8?B?NE5jVmZablVwTFFLdWN4RGk4V3RmcXpmeHNpUkpsV1B6S2tmaWRHdk0rUFJE?=
 =?utf-8?B?RjVaOGRieFBoQ1A1Wk5OZ2F2SFlXcVlTOUpaa1Y4ODZGMnYrZG5JTEhEVHZr?=
 =?utf-8?B?aVJhbDMzOVNsR25OVUtWVGI4N2xUQ2tzaTVldEN3RlZhRzF2aDF1TFFrSG1K?=
 =?utf-8?B?dzNYTHRyYUlSZlVRWGJQVkpPNUpseUZtZUlVMlQzMklJOWtyc1RrTGZENXNV?=
 =?utf-8?B?K0JZdTRZTUZVb2VXcWdVRER2M3AyOFVhRi8rU1dIbHpUUFlPeW84RldEcmk2?=
 =?utf-8?B?UWc3cFVSZ1ZDTDdWeGhWUlFGNkFqbGFVSFdtMXdpU0RJL2FzaGhDL1N0S3g1?=
 =?utf-8?B?S1NBNWFjVTBlRHFWeWlpVzY4OGg5TVZGREFHM3MrSUZMOHE5TUlWamtxMy9E?=
 =?utf-8?B?akZKVXJwQWRaMHVhREJGTnAyMFpKVzlLWWtKeERVR1YwSk1OcnFrMUNPWU11?=
 =?utf-8?B?dVBwZk5Eb3dNZ0RIK2hCUElaMkR4K0dBWXVKZVBnRUxIRjRUU3BRbGpEazJw?=
 =?utf-8?B?QjdrK2JjTmxidG5KeHNTR0ZYZ3gzamRUaEJCT0VmZnNldHQ0R3pYbGpCYUlv?=
 =?utf-8?B?TnV1eTdpWmt1Tm5BZVJpQ0hqVHQyVXkxd1ZXVVl3aGxmSDQycXp1L3kzMHJG?=
 =?utf-8?B?L1diSDBRTEl3LzMwWGg0Z3ZlcUtrVm9HUUNlNmt1MTBRVThVUUJwamJFOUJO?=
 =?utf-8?B?S040VUZDcmI4QkIrSUMrcVRqZEVsTkZTMXJzY2gzd014U0NqNnQ4UVBGcHk2?=
 =?utf-8?B?dTVEY2VORnRHZTdsUEx2WmlyTzJaazlGRWpacDF3VFdPWGRidS9pbUc3b09V?=
 =?utf-8?B?V3FXZnp2WU92YWF0RElqcUZubThjb1RkQmVWU1dSZVVBUklJK1ZqRStmeUF3?=
 =?utf-8?B?YkpsYWhZSEptRW1PbGxpSlFNT0lraDVYY3RmYWlES0U4K3dxdVp1bUtzdHhH?=
 =?utf-8?B?UEZQQktyc1U5NnErOWJLVTZGaEF6WXRqWFlTaFo0UW9uMkEreUVsUEJKTXdE?=
 =?utf-8?B?NEt0dkZXRDhiZ3VZN1JsYzIzUVlLdWJQNDJmTW9mcHYwcjUvSUU0RnE0T2E5?=
 =?utf-8?B?bWFFMmZVd1E3cVNCMnUxMG5vWWZTbXJ5K3VTUVJaOXZITkZnbm9oMnp2TEZy?=
 =?utf-8?B?K1I1K1BvelFvd0R5L2xZY3RPVzhJckJLUFY5Y0lSK0xWcTd4NkgrdlR3Wmxu?=
 =?utf-8?B?MWQ0aktWUmxXeC9YemRtUnN3c2RnVEIrZTY0ZUJsQVd2K2dEKzJ0YVhsY0Iv?=
 =?utf-8?B?M3J4NWhKaXNzU2lWdkJMY1Uyd0pFL25jWXExQzIvTUF6TDlTQ2liR1JwSWI2?=
 =?utf-8?B?Mnpkd0JCMlUrTXR6WXhFM3JLLzJpUnFuZnAzdnpkYU1YZVRkdVhaQUFBbmRE?=
 =?utf-8?B?UUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e30684c-8280-4ba6-0695-08dc3df6791e
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8767.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 15:59:58.4683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 34GIJ7NX/Up7K0H/AI/uZd6LgRFzvnUaKnF29thD31VreA3a8zbmAAJyXiT+QmMRENeD+sg1tVXHGLfRxs2cvrErEaDYcERQmdZRWGr6D08=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7484
X-Proofpoint-ORIG-GUID: LbLgJ5QN7XUwbk8plvHVrm-fe3A5xudC
X-Proofpoint-GUID: EvyNYFoOxUBKlbeBJ8PwD0LyCod3NZD7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-06_10,2024-03-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403060129
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 426BePFQ009237
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 10 Mar 2024 14:01:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109257

I see that you pushed a commit that adds command removing unnecessary=20
files and host paths in the e2tools recipe.

https://github.com/openembedded/meta-openembedded/commit/92b6825a870fde291b=
1244193dba8d7c1051c53f

I have tested this latest e2tools recipe locally using the latest poky.=20
I built an image using "bitbake core-image-minimal" with e2tools and its=20
ptest package. The build was successful (still no QA errors) and the=20
ptest for e2tools ran without any issue.

Are you still seeing the [file-rdeps] QA issues on the Yocto Autobuilder?

Thank you for removing the unnecessary files and improving the e2tools=20
recipe.

On 3/4/2024 1:34 AM, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.
>=20
> its happening quite consistently now on all kinds of AB workers, see
> recent 4-5 failures on
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88
>=20
> On Sun, Mar 3, 2024 at 10:01=E2=80=AFPM Lyu, William <William.Lyu@windriv=
er.com> wrote:
>>
>> On 3/4/2024 12:41 AM, Lyu, William wrote:
>>> On 3/1/2024 4:52 PM, Khem Raj wrote:
>>>> CAUTION: This email comes from a non Wind River email account!
>>>> Do not click links or open attachments unless you recognize the sender
>>>> and know the content is safe.
>>>>
>>>> On Fri, Mar 1, 2024 at 12:20=E2=80=AFPM Lyu, William
>>>> <William.Lyu@windriver.com> wrote:
>>>>>
>>>>>> I am running into this error on some builders on AB
>>>>>>
>>>>>> stdio: ERROR: Task
>>>>>> (/home/pokybuild/yocto-worker/meta-oe/build/meta/recipes-support/lib=
exif/libexif_0.6.24.bb:do_package_qa)
>>>>>> failed with exit code '1'
>>>>>> stdio: ERROR: e2tools-0.1.0+git-r0 do_package_qa: QA Issue:
>>>>>> /usr/lib/e2tools/ptest/git/.git/hooks/update.sample contained in
>>>>>> package e2tools-ptest requires /usr/bin/sh, but no providers found i=
n
>>>>>> RDEPENDS:e2tools-ptest? [file-rdeps]
>>>>>
>>>>> File "update.sample" is from ".git" directory. I do not actually need
>>>>> this
>>>>> file or anything from ".git" directory. I only need the source tree
>>>>> for ptest
>>>>> to run.
>>>>>
>>>>> However, I am a bit confused about this QA issue because:
>>>>> -   I do not see any file that has "#!/usr/bin/sh". Even
>>>>> "update.sample" has
>>>>>       "#!/bin/sh" as the first line. There are files in the source
>>>>> tree (not
>>>>>       under ".git" directory) that have "#!/bin/sh" as the first line=
.
>>>>> -   "/bin/sh" is referring to the default POSIX shell, and the "bash"
>>>>> in the
>>>>>       RDEPENDS:e2tools-ptest should already fulfill this runtime
>>>>> dependency,
>>>>> -   I am not yet able to reproduce this issue using poky. I assume
>>>>> this is
>>>>>       because the QA Issue checker "file-rdeps" in poky do not check
>>>>> "sh" by
>>>>>       default (excerpt taken from "meta/classes-global/insane.bbclass=
"):
>>>>>
>>>>>       if "file-rdeps" not in skip:
>>>>>           ignored_file_rdeps =3D set(['/bin/sh', '/usr/bin/env',
>>>>> 'rtld(GNU_HASH)'])
>>>>>           if bb.utils.contains('DISTRO_FEATURES', 'usrmerge', True,
>>>>> False, d):
>>>>>               ignored_file_rdeps |=3D set(['/usr/bin/sh'])
>>>>>           if bb.data.inherits_class('nativesdk', d):
>>>>>               ignored_file_rdeps |=3D set(['/bin/bash', '/usr/bin/per=
l',
>>>>> 'perl'])
>>>>>               if bb.utils.contains('DISTRO_FEATURES', 'usrmerge',
>>>>> True, False, d):
>>>>>                   ignored_file_rdeps |=3D set(['/usr/bin/bash'])
>>>>>
>>>>> William
>>>>
>>>> what distro features do you have enabled ? perhaps try it with and
>>>> without usermerge in DISTRO_FEATURES

For the sake of documentation and preventing confusion for anyone=20
stumbling upon this email thread, I would like to confirm if "usermerge"=20
here is a typo. Is it correct that you meant "usrmerge"?

William

>>>> and rebuild this package after doing cleansstate to ensure its being
>>>> rebuilt in both cases.
>>>
>>> I have not been able to reproduce this "QA Issue" error yet. Is it
>>> possible that the [file-rdeps] checker on the autobuilder (AB) where yo=
u
>>> saw this issue is defined differently than the default poky? The
>>> following are the details regarding my previous and new builds.
>>>
>>> For my previous builds, there are no specified DISTRO_FEATURES. In
>>> conf/local.conf, I only added the following line. The build command I
>>> used was "bitbake core-image-minimal".
>>>
>>> IMAGE_INSTALL:append =3D " libexif e2tools e2tools-ptest"
>>>
>>> I tried a new build with the following line added to conf/local.conf.
>>>
>>> DISTRO_FEATURES:append =3D " usermerge"
>>>
>>> I also did "bitbake -c cleansstate e2tools" and "bitbake -c cleansstate
>>> core-image-minimal" before each build.
>>>
>>> William
>>
>> Just in case the [file-rdeps] checker is somehow not working, I removed
>> "bash" from "RDEPENDS:${PN}-ptest". I indeed get the following error
>> message as expected when building "bitbake core-image-minimal":
>>
>> ERROR: QA Issue: /usr/lib/e2tools/ptest/build/config.status contained in
>> package e2tools-ptest requires /bin/bash, but no providers found in
>> RDEPENDS:e2tools-ptest? [file-rdeps]
>>
>> William
>>
>>>
>>>>
>>>>>
>>>>>> stdio: ERROR: e2tools-0.1.0+git-r0 do_package_qa: Fatal QA errors we=
re
>>>>>> found, failing task.
>>>>>> stdio: ERROR: Logfile of failure stored in:
>>>>>> /home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-p=
oky-linux/e2tools/0.1.0+git/temp/log.do_package_qa.3114961
>>>>>>
>>>>>> On Thu, Feb 22, 2024 at 5:56=E2=80=AFAM Lyu, William via
>>>>>> lists.openembedded.org
>>>>>> <william.lyu=3Dwindriver.com@lists.openembedded.org> wrote:
>>>>>>>
>>>>>>> From: William Lyu <William.Lyu@windriver.com>
>>>>>>>
>>>>>>> Signed-off-by: William Lyu <William.Lyu@windriver.com>
>>>>>>> ---
>>>>>>>    .../recipes-utils/e2tools/e2tools_git.bb      | 51
>>>>>>> ++++++++++++++++++-
>>>>>>>    .../recipes-utils/e2tools/files/run-ptest     |  5 ++
>>>>>>>    2 files changed, 54 insertions(+), 2 deletions(-)
>>>>>>>    create mode 100644
>>>>>>> meta-filesystems/recipes-utils/e2tools/files/run-ptest
>>>>>>>
>>>>>>> diff --git a/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb
>>>>>>> b/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb
>>>>>>> index caf0025c8..a80b6f598 100644
>>>>>>> --- a/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb
>>>>>>> +++ b/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb
>>>>>>> @@ -9,17 +9,64 @@ SECTION =3D "base"
>>>>>>>    LICENSE =3D "GPL-2.0-only"
>>>>>>>    LIC_FILES_CHKSUM =3D
>>>>>>> "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
>>>>>>>
>>>>>>> -DEPENDS +=3D "e2fsprogs"
>>>>>>> +DEPENDS +=3D "coreutils e2fsprogs"
>>>>>>>
>>>>>>>    PV =3D "0.1.0+git"
>>>>>>>
>>>>>>>    SRC_URI =3D " \
>>>>>>>
>>>>>>> git://github.com/e2tools/e2tools;protocol=3Dhttps;branch=3Dmaster \
>>>>>>> +           file://run-ptest \
>>>>>>>    "
>>>>>>> +
>>>>>>>    SRCREV =3D "fd092754a6b65c3a769f74f888668c066f09c36d"
>>>>>>>
>>>>>>>    S =3D "${WORKDIR}/git"
>>>>>>>
>>>>>>> -inherit autotools pkgconfig
>>>>>>> +inherit autotools pkgconfig ptest
>>>>>>> +
>>>>>>> +do_configure:prepend() {
>>>>>>> +    git -C "${WORKDIR}/git" reset --hard HEAD
>>>>>>> +
>>>>>>> +    # To install ptest for this package, special configuration
>>>>>>> needs to be
>>>>>>> +    # done before do_configure(). So, do_configure_ptest() which
>>>>>>> is scheduled
>>>>>>> +    # after do_configure() cannot be used.
>>>>>>> +
>>>>>>> +    # We only do special configuration if we are installing ptest
>>>>>>> for this
>>>>>>> +    # package.
>>>>>>> +    if [ "${@d.getVar('PTEST_ENABLED')}" -eq "1" ]; then
>>>>>>> +        # Since we guarantee run-time dependency when installing
>>>>>>> the ptest for
>>>>>>> +        # this package, we do not need the check macros under
>>>>>>> section "checks
>>>>>>> +        # for programs" in "configure.ac". Plus, these check
>>>>>>> macros set the
>>>>>>> +        # ouput variables to incorrect values as these checks are
>>>>>>> performed on
>>>>>>> +        # the host environment. Still, we need these variables
>>>>>>> outputted from
>>>>>>> +        # these check macros. So, we insert the following lines to
>>>>>>> manually
>>>>>>> +        # set these output variables to the correct value in
>>>>>>> "configure.ac".
>>>>>>> +
>>>>>>> +        # Note that HAVE_DD_COMMAND and HAVE_MKE2FS_COMMAND are
>>>>>>> only ever used
>>>>>>> +        # in tests/Makefile-files which determines whether to
>>>>>>> include the test
>>>>>>> +        # cases. As for output variables CHMOD, DD, and MKE2FS,
>>>>>>> they only
>>>>>>> +        # point to the programs which test cases need to run.
>>>>>>> Since these
>>>>>>> +        # commands are guaranteed to be present due to RDEPENDS
>>>>>>> and are
>>>>>>> +        # guaranteed to be accessible under PATH environment
>>>>>>> variable on the
>>>>>>> +        # target, we only need to specify the name of these progra=
ms.
>>>>>>> +
>>>>>>> +        perl -i -0777 -pe 's/(^dnl\s*=3D+\s*^dnl\s*Checks for
>>>>>>> compiler flags\s*^dnl\s*=3D+)/
>>>>>>> +AC_SUBST([CHMOD], 'chmod')
>>>>>>> +AC_SUBST([DD], 'dd')
>>>>>>> +AC_SUBST([MKE2FS], 'mke2fs')
>>>>>>> +AM_CONDITIONAL([HAVE_DD_COMMAND], [true])
>>>>>>> +AM_CONDITIONAL([HAVE_MKE2FS_COMMAND], [true])
>>>>>>> +\1/ms' "${WORKDIR}/git/configure.ac"
>>>>>>> +    fi
>>>>>>> +}
>>>>>>> +
>>>>>>> +do_install_ptest() {
>>>>>>> +    rm -rf "${D}${PTEST_PATH}/*"
>>>>>>> +    cp -r ../build "${D}${PTEST_PATH}"
>>>>>>> +    cp -r "${S}/build-aux" "${D}${PTEST_PATH}/build"
>>>>>>> +    cp -r "${S}" "${D}${PTEST_PATH}"
>>>>>>> +}
>>>>>>> +
>>>>>>> +RDEPENDS:${PN}-ptest +=3D "bash coreutils e2fsprogs e2tools gawk
>>>>>>> make perl"
>>>>>>>
>>>>>>>    BBCLASSEXTEND =3D "native"
>>>>>>> diff --git a/meta-filesystems/recipes-utils/e2tools/files/run-ptest
>>>>>>> b/meta-filesystems/recipes-utils/e2tools/files/run-ptest
>>>>>>> new file mode 100644
>>>>>>> index 000000000..3d4dd9cf3
>>>>>>> --- /dev/null
>>>>>>> +++ b/meta-filesystems/recipes-utils/e2tools/files/run-ptest
>>>>>>> @@ -0,0 +1,5 @@
>>>>>>> +#!/bin/sh
>>>>>>> +
>>>>>>> +set -e
>>>>>>> +
>>>>>>> +make -C build check
>>>>>>> --
>>>>>>> 2.43.0
>>>>>>>
>>>>>>>
>>>>>>>=20

