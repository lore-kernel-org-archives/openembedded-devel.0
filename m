Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C69B8C5478C
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 15:50:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.92081.1709530875512810669
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Mar 2024 21:41:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=FhxGPn9E;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3793b29883=william.lyu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4245UXD9015179
	for <openembedded-devel@lists.openembedded.org>; Sun, 3 Mar 2024 21:41:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=xPgGsh4KlSfio5UGEaJu0zSLbW2ESl8z4aCGSsLnfZs=; b=
	FhxGPn9ECqIyfEccYlSH+FXxDz4F/9pOGTDmbWIfajyrEEIIvf5sr7IahOYPATye
	z3Ak/2tgWa+Vdew0/a54etMUKWHdzEZs79hsxfEABvshjk/TW4bBwbjoFgiMV7UL
	u3/O9uIRZQyR1ZLAHQYA78F78WrvEvoWcuToupiAj0wg/Xy6RybHsbt5CEl53KPN
	apM1FOjh+lttkxjnBldRxoZpGNc8lAx6BaxyxjGxQMMd38+MY72uOb/8iOxvK5VL
	CqFnGgHv+CZv2NWC/D1WPTKCqwyjA2xcXIWHOsKqVQsVLLxppVBMPrH+xTcoMpnX
	rFCWDDEbLnR+WYXKRi+Gwg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wm093s8pt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 03 Mar 2024 21:41:14 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 4245fE7C028981;
	Sun, 3 Mar 2024 21:41:14 -0800
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wm093s8ps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 03 Mar 2024 21:41:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lBAng60lppb6/aliLfB5nZ36bKQyHQCXxXDsLyxeYdyIvkq+yCHSBbIoQBlyzyiXLzae/k/WS7ynmbuBB0361axrBAPsRHvS0gS5uZbaHHV26X70GmEUP18tJ2t+me+tqHXF/rowROgqIgB8q0wg/1I33RMOIzSaInkjCj8VFybS5bQ8ZKDT9SD1MauCiIHKNmQN6AyWkKwqziF4MNL/7PxpkymrR1hYsYu5AKkq6FkPx+zV7HfE0kRhB2xlapR9Yicp55g3OsW5VnsAZFW9UkS8HOOwyIBiN9kpVUJyhOAfCRQNMCRgJ1cnz/LL/TENdHT1uLgEi/y35T8URhE5dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xPgGsh4KlSfio5UGEaJu0zSLbW2ESl8z4aCGSsLnfZs=;
 b=csbMenMbgIcmABHtEghpDhRFKqNJyklNgG3lF+dj14N8NxT25MtxoOuAZ7DuIcc3ifV51A+zk3RW7LyhIdt0FmOhJZOyGPaGqe4ZFEWNmzIJix+7Kh6IfN6qtjLZxpCWwUO8e+lJaGiGhurp16+qurrPCYhX0fyzOU03q6xsPkDELGSuYu+ojpyjoJ0G9+Plwl4UdV4BI1uCpnGGtqi7N6RKzzDvsFUEmxkHtPk1gGJ2XRZZFqPHVjfvXYIVKwi0NeaXKEKXuyq3EmLxOQTq0QpllpgZ1pAoxAIjhvTZmU5fA4mmmgjyt+9IroScImYPTfxrl3KVsngmTadcaa2hWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8767.namprd11.prod.outlook.com (2603:10b6:408:215::11)
 by MW3PR11MB4587.namprd11.prod.outlook.com (2603:10b6:303:58::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.22; Mon, 4 Mar
 2024 05:41:12 +0000
Received: from LV3PR11MB8767.namprd11.prod.outlook.com
 ([fe80::6f05:dac:daa:e491]) by LV3PR11MB8767.namprd11.prod.outlook.com
 ([fe80::6f05:dac:daa:e491%7]) with mapi id 15.20.7362.019; Mon, 4 Mar 2024
 05:41:11 +0000
Message-ID: <550e0375-89cc-4ec0-b16d-5a7882fd3a08@windriver.com>
Date: Mon, 4 Mar 2024 00:41:08 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-filesystems][PATCH] e2tools: Add ptest
To: Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20240222134140.2367805-1-William.Lyu@windriver.com>
 <CAMKF1spgXkbYj446g_ujSO41hrR9kUx14SF-iyw1y33-4Y7x3g@mail.gmail.com>
 <LV3PR11MB8767C8BB2545D95BF7131C3FEE5E2@LV3PR11MB8767.namprd11.prod.outlook.com>
 <CAMKF1spywovBtYyEUOd5paR-4sSpe-aXLe8tY2jzg13mvSO03g@mail.gmail.com>
From: "Lyu, William" <william.lyu@windriver.com>
In-Reply-To: <CAMKF1spywovBtYyEUOd5paR-4sSpe-aXLe8tY2jzg13mvSO03g@mail.gmail.com>
X-ClientProxiedBy: BYAPR07CA0032.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::45) To LV3PR11MB8767.namprd11.prod.outlook.com
 (2603:10b6:408:215::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8767:EE_|MW3PR11MB4587:EE_
X-MS-Office365-Filtering-Correlation-Id: 85028107-4c1b-4557-96e6-08dc3c0db30f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	h+lj8uyAN+TTKUokUpflwikhs+922I8T439i7WHP/l81IlyuvdtM2nFyQXcy/fbtrseY4QALGXJr0ybPp5K/CFxv9jxYhlgbGkcpNOt1N8YTmSixvRpWTKL1MxYaWyJfmrbERkl89+zHTnBIqKNOwBIZPtLqL+T1+93cXM3MdD8qobP1Ad/w4P95ngGtrbqNbFXlqsddapQSQ0DpSGEQsMNQA/k3yBmfW85ehd+QJmKvweXl1bTzdraYYfAIopfLDluUS0Yu4PZQqABGa7dqyOD5nENQM3zFBYdDvGSRCxYKRmGqalcdVYTu4TObJ4oUEAx4k7vzPsjrMEUlOGq5LOZsG8AEiHLO0MI4F/m3YmeZChZEHJAwzmsyGuiIP6xJpz1mfCxEwm895zhvlgcnb/Bgk0Dp3JGXygKm4qOdamMneXONxSG6yUBPTQrdnMZ5OlFsjk04AsIGCWF+MKzfmt6pLRvGouw5aRLv/I/qfad7bpb/Q0TZeM1OhTESfHhDRjTa5/5HNhxdlg6Mb+BfO18/rs796lfpKibna8fcrv97yi3bBNLz2PtNdh0SUxjEqkFNdrAUPYOyb3FGD4h9bT2p4E5n0uaWP15BFZIMRBcC9fNDuK80dfnociVAPbWz
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8767.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RDc3QTRnUnk3ODZzUzlpc0c4dXhubUFZQm1ObjdpMzdDTTFxOGlUTkpteldO?=
 =?utf-8?B?MHd2VWV3WFFwK2tGa3AwWFJrYjJFVWhZYmJZMlFRc0xNNkE0UElYYUtZcjBx?=
 =?utf-8?B?WUxQSEtSZDQ1Y2VnK2FBUnF6aS96ZSswVk1lL2o4a0NlQk9iSGhLT0prdHJ0?=
 =?utf-8?B?bkdKelBBNzVjTkVsTTRKQ0w0T1RtMUhnelJjSWVGSlZjZzBJRDVIUFE1Tklj?=
 =?utf-8?B?b0NFSWtsOS91U2l6Q1JYS3RkYmVvZkpNUS9RQkR2MzB2UnA2L0RaQkphWU9a?=
 =?utf-8?B?RXRCeEhLWW9KK2Q5djRqc0ZTSDBobTFDdzBqdGt3blJTSklTVjdmM0JaTXBx?=
 =?utf-8?B?RE9jdjNjSTJNbWdHNDR2MmlhM202cWtzZUU2bGdUSTFmSGpsKy80N2NnVXZS?=
 =?utf-8?B?bnFvYzlVWnM3YUI4T05FRHVRamFJTVIvU1plRU1SbjJyUlBwb3cyam9OZFA0?=
 =?utf-8?B?UzVvV2p3YlNXTDBRL2lMeGkvN1h2RlRSa3ZnL1g5RERoT0ZpazgvcVZFbVg4?=
 =?utf-8?B?ZnErQW5LUytST2djRkY2SkdLRnlWbnZuMnVDU0NOTExDUk81U0RQTXViQmMx?=
 =?utf-8?B?TWl4UEVjOXVUejNTV2l6Syt0ZVBKZGhIblA4SHlDQWdiSWt0MjhlVFJXTkxq?=
 =?utf-8?B?L3BIK3ptR282RHhUbDYvU1FEb0t4UXorclpWNFBNZ2ViUEV6WnNISGFURkNT?=
 =?utf-8?B?bnZHaE5GNmVuQ1F1VzI2MmVsQ0R2ZVgvcTlTV3NjQkI4d09lcDlLeTgwZjB2?=
 =?utf-8?B?MVd3Y3dUV2x6UzNXY09BSTIyOHMxcTBpSzh2MEJuL28xUi9lWHNZWjhpNmx5?=
 =?utf-8?B?czRETytCZUE2dHdUb215NmRLelIzaXFpNWR2U0xEUnR1bVY0STJJRkZhckFt?=
 =?utf-8?B?TFFDTHF3Zno0QXNrZlhyR25VcDNQWm9XYzBweWdITWgvcERnSzgwVkIvRlhX?=
 =?utf-8?B?S20wZDVIMGx3SzZRcUVNM2NZdlV5VnBuWm8vdi9JVUlrWU9XV3I0NW5mdENM?=
 =?utf-8?B?WXp2MWp3T3Fqb2kwalhDcEpDTy9XRUsrNU0xMnFrRTJGM08yeFlMSGlVV3d1?=
 =?utf-8?B?RnRycDR0c0dTaDVzZFlMWWdmV05ESUlzVXMxTnRxTkZKKzNBOGRTN21vQ2tN?=
 =?utf-8?B?S1BVL2NNNFZXekI4UHFLZ013Q3doVXozMktYSG1PRElKYlNSWWdkRGpNMVo4?=
 =?utf-8?B?emliQTE1V1UyUEVHU0ZCYmNoQm15T3hFaGNEaHNKVUtnOTNERFhXcTl1NEFH?=
 =?utf-8?B?alorcW8vNCtOSVVNU05nN3BOZ2ZBTjhGZjlpNkl5WnUwc0gzazFTSFpuSEVQ?=
 =?utf-8?B?MHBBRlV0QzVpMytLbUtxRDB1bXo4VlB2S2c0TUgzZWxJWldSTS9USjQ2c1BF?=
 =?utf-8?B?a3Q3T0orOS9PSGRBMVI4VVBzTVNwR3prdmJZMkZTdnllQjcyT2MzUEliakxm?=
 =?utf-8?B?Sm1PTGE3Z2ZEUzFwcTVUalQ0NGRVS0s4TG5iODMxRHdLZmtGVVVQSVo5b0Uz?=
 =?utf-8?B?ZjVreVN3QUxrM2wwRVgweG1mZWRHWW1xSmkzVTQvdmQrMm1iQWRnL2tCM3Jh?=
 =?utf-8?B?ZzlFMHhTaGpERjkvbkxrSE5xUFNiaFZ1eUNaU3ZvWlYrVGN4TVlHUzhzQ2Z6?=
 =?utf-8?B?bEVGelY5eXJxM1oyZ2g3OGZXNFE4MVFyU1Vxanl0dlZvdk9YR1RFT3RrN1N3?=
 =?utf-8?B?eUxJU1QzelpZbmRtMVY4MUY1b3FETS9aT2pkQ01mTi9xbVVtWHpNOVJvK2th?=
 =?utf-8?B?WVBMM1pPdzdqWVJoZktqdnNWTTFyY2VkZFRlVlo0Z25QQTNVUHo2KzFmMXhK?=
 =?utf-8?B?OG9jV1NUUWtZd2JIbTFnNUNXZ2tlTlFka3QwUWJKajg0b2UxSlcwTVBQUGtL?=
 =?utf-8?B?eE05Nm45M0pySFREUENReXJZYWNRbGEyeGY1S1Y4UVcybVlxRWpyN0ZRNWt0?=
 =?utf-8?B?UjhDVElubVpHa1JQYVdUdmxTSlQ0R0VFNzdZdTR2VGtNOEEyQkx4dWY2ZEhE?=
 =?utf-8?B?SC91LzhnZmV6TnRReGZzaXVGb1BvRnVEeGZpVHY1c1hxZ1RUeXFEcmI1YUZk?=
 =?utf-8?B?dzIzRGs1MHI1OEp6cEljRzFmOUxqN0NZZTR2MUFNVFhTcmkyYWhiTURqdmtG?=
 =?utf-8?B?RzFSWmtmZW9VTUVrbVhaUXhVeUZsMWpQZzdxNk9rbzFTakExM2dma3UyZWxw?=
 =?utf-8?B?NHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85028107-4c1b-4557-96e6-08dc3c0db30f
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8767.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 05:41:11.7796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dcYqqpCalZ9l7xzm/V+f/X6hW6+7h9aftRGzKev3swDoq6QC7ZNKR8/w6L8a+PnWyoH9QflAqNSl/E31cI/wOMphkF6Chr2KbzwBZ4JRdKk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4587
X-Proofpoint-GUID: 03OcteVunoWut0oiCyaiB99L19p6A2w9
X-Proofpoint-ORIG-GUID: NDYcNMWxhPmxuQmBiqCqIXdXDdnh9mp6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-04_02,2024-03-01_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 adultscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403040039
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4245UXD9015179
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Mar 2024 15:50:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109099

On 3/1/2024 4:52 PM, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.
>=20
> On Fri, Mar 1, 2024 at 12:20=E2=80=AFPM Lyu, William <William.Lyu@windriv=
er.com> wrote:
>>
>>> I am running into this error on some builders on AB
>>>
>>> stdio: ERROR: Task
>>> (/home/pokybuild/yocto-worker/meta-oe/build/meta/recipes-support/libexi=
f/libexif_0.6.24.bb:do_package_qa)
>>> failed with exit code '1'
>>> stdio: ERROR: e2tools-0.1.0+git-r0 do_package_qa: QA Issue:
>>> /usr/lib/e2tools/ptest/git/.git/hooks/update.sample contained in
>>> package e2tools-ptest requires /usr/bin/sh, but no providers found in
>>> RDEPENDS:e2tools-ptest? [file-rdeps]
>>
>> File "update.sample" is from ".git" directory. I do not actually need th=
is
>> file or anything from ".git" directory. I only need the source tree for =
ptest
>> to run.
>>
>> However, I am a bit confused about this QA issue because:
>> -   I do not see any file that has "#!/usr/bin/sh". Even "update.sample"=
 has
>>      "#!/bin/sh" as the first line. There are files in the source tree (=
not
>>      under ".git" directory) that have "#!/bin/sh" as the first line.
>> -   "/bin/sh" is referring to the default POSIX shell, and the "bash" in=
 the
>>      RDEPENDS:e2tools-ptest should already fulfill this runtime dependen=
cy,
>> -   I am not yet able to reproduce this issue using poky. I assume this =
is
>>      because the QA Issue checker "file-rdeps" in poky do not check "sh"=
 by
>>      default (excerpt taken from "meta/classes-global/insane.bbclass"):
>>
>>      if "file-rdeps" not in skip:
>>          ignored_file_rdeps =3D set(['/bin/sh', '/usr/bin/env', 'rtld(GN=
U_HASH)'])
>>          if bb.utils.contains('DISTRO_FEATURES', 'usrmerge', True, False=
, d):
>>              ignored_file_rdeps |=3D set(['/usr/bin/sh'])
>>          if bb.data.inherits_class('nativesdk', d):
>>              ignored_file_rdeps |=3D set(['/bin/bash', '/usr/bin/perl', =
'perl'])
>>              if bb.utils.contains('DISTRO_FEATURES', 'usrmerge', True, F=
alse, d):
>>                  ignored_file_rdeps |=3D set(['/usr/bin/bash'])
>>
>> William
>=20
> what distro features do you have enabled ? perhaps try it with and
> without usermerge in DISTRO_FEATURES
> and rebuild this package after doing cleansstate to ensure its being
> rebuilt in both cases.

I have not been able to reproduce this "QA Issue" error yet. Is it=20
possible that the [file-rdeps] checker on the autobuilder (AB) where you=20
saw this issue is defined differently than the default poky? The=20
following are the details regarding my previous and new builds.

For my previous builds, there are no specified DISTRO_FEATURES. In=20
conf/local.conf, I only added the following line. The build command I=20
used was "bitbake core-image-minimal".

IMAGE_INSTALL:append =3D " libexif e2tools e2tools-ptest"

I tried a new build with the following line added to conf/local.conf.

DISTRO_FEATURES:append =3D " usermerge"

I also did "bitbake -c cleansstate e2tools" and "bitbake -c cleansstate=20
core-image-minimal" before each build.

William

>=20
>>
>>> stdio: ERROR: e2tools-0.1.0+git-r0 do_package_qa: Fatal QA errors were
>>> found, failing task.
>>> stdio: ERROR: Logfile of failure stored in:
>>> /home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky=
-linux/e2tools/0.1.0+git/temp/log.do_package_qa.3114961
>>>
>>> On Thu, Feb 22, 2024 at 5:56=E2=80=AFAM Lyu, William via
>>> lists.openembedded.org
>>> <william.lyu=3Dwindriver.com@lists.openembedded.org> wrote:
>>>>
>>>> From: William Lyu <William.Lyu@windriver.com>
>>>>
>>>> Signed-off-by: William Lyu <William.Lyu@windriver.com>
>>>> ---
>>>>   .../recipes-utils/e2tools/e2tools_git.bb      | 51 +++++++++++++++++=
+-
>>>>   .../recipes-utils/e2tools/files/run-ptest     |  5 ++
>>>>   2 files changed, 54 insertions(+), 2 deletions(-)
>>>>   create mode 100644 meta-filesystems/recipes-utils/e2tools/files/run-=
ptest
>>>>
>>>> diff --git a/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb b/m=
eta-filesystems/recipes-utils/e2tools/e2tools_git.bb
>>>> index caf0025c8..a80b6f598 100644
>>>> --- a/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb
>>>> +++ b/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb
>>>> @@ -9,17 +9,64 @@ SECTION =3D "base"
>>>>   LICENSE =3D "GPL-2.0-only"
>>>>   LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fda=
f4a4263"
>>>>
>>>> -DEPENDS +=3D "e2fsprogs"
>>>> +DEPENDS +=3D "coreutils e2fsprogs"
>>>>
>>>>   PV =3D "0.1.0+git"
>>>>
>>>>   SRC_URI =3D " \
>>>>              git://github.com/e2tools/e2tools;protocol=3Dhttps;branch=
=3Dmaster \
>>>> +           file://run-ptest \
>>>>   "
>>>> +
>>>>   SRCREV =3D "fd092754a6b65c3a769f74f888668c066f09c36d"
>>>>
>>>>   S =3D "${WORKDIR}/git"
>>>>
>>>> -inherit autotools pkgconfig
>>>> +inherit autotools pkgconfig ptest
>>>> +
>>>> +do_configure:prepend() {
>>>> +    git -C "${WORKDIR}/git" reset --hard HEAD
>>>> +
>>>> +    # To install ptest for this package, special configuration needs =
to be
>>>> +    # done before do_configure(). So, do_configure_ptest() which is s=
cheduled
>>>> +    # after do_configure() cannot be used.
>>>> +
>>>> +    # We only do special configuration if we are installing ptest for=
 this
>>>> +    # package.
>>>> +    if [ "${@d.getVar('PTEST_ENABLED')}" -eq "1" ]; then
>>>> +        # Since we guarantee run-time dependency when installing the =
ptest for
>>>> +        # this package, we do not need the check macros under section=
 "checks
>>>> +        # for programs" in "configure.ac". Plus, these check macros s=
et the
>>>> +        # ouput variables to incorrect values as these checks are per=
formed on
>>>> +        # the host environment. Still, we need these variables output=
ted from
>>>> +        # these check macros. So, we insert the following lines to ma=
nually
>>>> +        # set these output variables to the correct value in "configu=
re.ac".
>>>> +
>>>> +        # Note that HAVE_DD_COMMAND and HAVE_MKE2FS_COMMAND are only =
ever used
>>>> +        # in tests/Makefile-files which determines whether to include=
 the test
>>>> +        # cases. As for output variables CHMOD, DD, and MKE2FS, they =
only
>>>> +        # point to the programs which test cases need to run. Since t=
hese
>>>> +        # commands are guaranteed to be present due to RDEPENDS and a=
re
>>>> +        # guaranteed to be accessible under PATH environment variable=
 on the
>>>> +        # target, we only need to specify the name of these programs.
>>>> +
>>>> +        perl -i -0777 -pe 's/(^dnl\s*=3D+\s*^dnl\s*Checks for compile=
r flags\s*^dnl\s*=3D+)/
>>>> +AC_SUBST([CHMOD], 'chmod')
>>>> +AC_SUBST([DD], 'dd')
>>>> +AC_SUBST([MKE2FS], 'mke2fs')
>>>> +AM_CONDITIONAL([HAVE_DD_COMMAND], [true])
>>>> +AM_CONDITIONAL([HAVE_MKE2FS_COMMAND], [true])
>>>> +\1/ms' "${WORKDIR}/git/configure.ac"
>>>> +    fi
>>>> +}
>>>> +
>>>> +do_install_ptest() {
>>>> +    rm -rf "${D}${PTEST_PATH}/*"
>>>> +    cp -r ../build "${D}${PTEST_PATH}"
>>>> +    cp -r "${S}/build-aux" "${D}${PTEST_PATH}/build"
>>>> +    cp -r "${S}" "${D}${PTEST_PATH}"
>>>> +}
>>>> +
>>>> +RDEPENDS:${PN}-ptest +=3D "bash coreutils e2fsprogs e2tools gawk make=
 perl"
>>>>
>>>>   BBCLASSEXTEND =3D "native"
>>>> diff --git a/meta-filesystems/recipes-utils/e2tools/files/run-ptest b/=
meta-filesystems/recipes-utils/e2tools/files/run-ptest
>>>> new file mode 100644
>>>> index 000000000..3d4dd9cf3
>>>> --- /dev/null
>>>> +++ b/meta-filesystems/recipes-utils/e2tools/files/run-ptest
>>>> @@ -0,0 +1,5 @@
>>>> +#!/bin/sh
>>>> +
>>>> +set -e
>>>> +
>>>> +make -C build check
>>>> --
>>>> 2.43.0
>>>>
>>>>
>>>>=20

