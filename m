Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17FE0C4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 08:08:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.31300.1702454908511753400
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Dec 2023 00:08:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=R+Q2qIIR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0711f2c48f=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BD6pVev017615
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 08:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=ywg46+e9LTCuBEt0M9ss17//hCHut8tddPO8GnsJE98=; b=
	R+Q2qIIRGL2KvSs6WQMdeX91UgJ6WhRwcqmNm3KlNRLlG5aI0yOdgt/3VkYcXOxf
	DyxEc8ni3410Xp7DTn1r7R9WR3Xt0rerPvd1imslb4Rqi+FhKhtqDAg00G1ULT0n
	P2BCBOIar0ExBLClg/fbZrZ5G7bvVGESbwsq98yKUT9gBHQEmrqTAzYbTs4o3YKx
	DHaGPWifC72paH6tkg3QXeoQPC3kAmSZIXOrbN4tgcy0TAC0LLBixs59Qrd5T8zj
	Jdv+9V4aVjwcsqd4Peq3W3RFKxKhPxHNTsOcYAjPS4IliIrCsKZJ4qcpY90eoNH4
	UMnDgy/7dutG8ZjhUKLsow==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uvdexuwyf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 08:08:27 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3BD87X2Y009593
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 08:08:27 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uvdexuwye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Dec 2023 08:08:27 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=edNKmnna6SWxwtM1rhiccKcQwfw4yU8j+jxdpDss2AAwvYZ6gypryGyN0jj3UoonluVz8wdCqoppWQ22Bl6ileQMpzesXizep/E4y2SUbXEgjISdgTpFfMitEGzoeEf0N2L3+dJzUTYkRelVgxxCpwhLaQuZvFh2VdVEMOFoeey7dlRvCXLQ3cLgYBBLI7N/n0NgcCQZZjqhajyLyiao0swW4ouGXg6yB3337k60OlrkHMoRWBvUOmnZTBJrJ+NTisKi/o2x8AToSYvag07DIH13n2920q4beQJD/09Klm0pz41pgTD6oR1t4e332VbGMIQeT8LxneqhVaIUQK5ewg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ywg46+e9LTCuBEt0M9ss17//hCHut8tddPO8GnsJE98=;
 b=kqo/BVdboN04mTa/DTGO7n+4XLUIcwCvHlUvIeuR3uuBWsJ6/8GyQ/HutKgCKUjFd4DwkKxmcSQq8AU68urpT+nSPi7tN71TLWi+rXmRTZ9Fyflj+FyQb1btLZbYa1CMuHy5uZA4apw2SX7e7Cu0nQFNC9OzZJVS67chrDiC08NGh+lazMdn9Zhe3BrkoRMXcmWoW/bLZKQ6Z78+ZHmeQevij+0Z7CRVHNrN+L44/o7Qf5eBiIE4meVDhKFvl3eVjjzHCF4DcMLJ11N523ufDgEdmE1QoS8yEeSOO3TJTax12iMW6yoyC9epPJW52+iqwTGLbeHkXu8eKyrSH1DP5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) by
 BN9PR11MB5227.namprd11.prod.outlook.com (2603:10b6:408:134::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.26; Wed, 13 Dec 2023 08:08:22 +0000
Received: from DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::dca9:26e2:b46:2372]) by DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::dca9:26e2:b46:2372%3]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 08:08:22 +0000
Message-ID: <645b1d96-e4f3-b6dd-8032-4b4cf4509d81@windriver.com>
Date: Wed, 13 Dec 2023 16:08:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-pyudev: provide native
Content-Language: en-US
To: Yoann Congal <yoann.congal@smile.fr>, Khem Raj <raj.khem@gmail.com>,
        openembedded-devel@lists.openembedded.org
References: <20231205145032.1116030-1-kai.kang@windriver.com>
 <170245123409.133993.13195774594233702101.b4-ty@gmail.com>
 <3b8923cb-f65b-41c7-bbf7-e2f377e85669@smile.fr>
From: Kai <kai.kang@windriver.com>
In-Reply-To: <3b8923cb-f65b-41c7-bbf7-e2f377e85669@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2PR01CA0153.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::33) To DS7PR11MB6064.namprd11.prod.outlook.com
 (2603:10b6:8:77::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6064:EE_|BN9PR11MB5227:EE_
X-MS-Office365-Filtering-Correlation-Id: c49f4c4a-1fda-4849-4aa8-08dbfbb2ac49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IpvfWqAM9qyjEO4zJmQco051SLfMsslfZKeAeXd9ycjNvtAkvVsVjK7cibrTYwErcY14UA3dgjy4RVAnX7lSPFo2axQbeEr2znEcitkenLRmL+xqL42ZT+bue5SxlYW/tQDOvMpcgB4cOvbufmO30ZFE+xrSQygyHFun9LlkzyvqTkh07uuEem3yeCNPCLBn2PWnfm25U5mLLgJz/k7Nd9AwJERVsxwUntFl8C0AFVtow7kxbETFj6nHlCRlMN/2foYFsVjzp6d+k4vOK8Zjq05YfDwoawiNnHaBoHElgJoZYQ7GQ3cFus1wWkHn1ET7KViNZO6HSFaw4BTVNUnAfAorBqs0+qwhYUjcnXYzcnpRmMpei1T/yVwrGoQ+rnY3IRtCOam9Szqia5ur+wsA+Cn2y+HdJeApFRiqsSEB6yxn/0lfuhvADxmuKHLdrenU9UqRUwDkNOa1CxufE20ytKfpirVD3H+D2hXM7PqsfMaMnbxw57dePdqzRYO4T9BgAaNtpKUD+7hkXh4oZ1on5cbcLRhQ98nhJLgpeGyJ+NKLH04unPcIkwOaqQchGa8qsli3ByTPgx+qN9+5Ml/6C3AmppKL9vpUsfl2spjshyChLeerZhRjVRbrJ6EAdkW+0gCOfaVXCYUHRYhyh54loT1Q3yW/psrynZ8c5d7eP65SLiZ4Q4+YdRYLaUTD7rwc
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6064.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(376002)(396003)(346002)(39850400004)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(26005)(83380400001)(6512007)(6506007)(53546011)(2616005)(5660300002)(8676002)(8936002)(41300700001)(2906002)(966005)(6486002)(6666004)(478600001)(316002)(66556008)(66476007)(66946007)(110136005)(36756003)(31696002)(86362001)(38100700002)(31686004)(66899024)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N0dMYmRyeDZXNmpXOVl6aXhTVkllc2Q4SFR2WmZPRnBMTGVINW1oZ0UzUGRM?=
 =?utf-8?B?UkcwNm1vQkUzNUxXU0JQdDBkV3lXcEt6aFFRL0ZMZklpMUV6dnpQVmdOVFJt?=
 =?utf-8?B?b2hTc04yTlA1T3AvK2VBNXAwV1E2Q2ZUR0grUkFRRlVyUkl4ZVRnYXlUbGYr?=
 =?utf-8?B?ZG0yN1Q5TklzanJLZTVLcVYyZDZ3c3NsNFU1T3cycXJnSk85S09ENjk5dzdG?=
 =?utf-8?B?c3ErMjlPcHdnSmZGZWhTOWJjVmQ4ZjFwaDM1MXZYazBaV3lUcklxQ3V5KzRI?=
 =?utf-8?B?RGp4TmpLTXgxTTFrWjlIMzh2SjEva1BETVBuMnhlMWNHVWljZWZ0QnVsSHMy?=
 =?utf-8?B?T1JYTUJjYng5SmdFNnVDWjJLb2pQc3VmcXRQaFBQREVrekxhK0Z0MEhlQ0dk?=
 =?utf-8?B?NzBWODQwRjg3Sk80MkZBc1Jrb1NhQXRkdTJtblZ4WmdQUmFsVWhtSzY4Snlt?=
 =?utf-8?B?aFlybHFUdHBCNDFWSnFMT09EUVcrNWFkdDFBTm1VckcrRlpkZlRSWDNCNkQv?=
 =?utf-8?B?eVYySVRGMzJjTWt4ZExoTU53ZWUvOEVkeWd6V1pWWE5nTU5nYllSSkdNcVR1?=
 =?utf-8?B?WGFIODlaT0Q2UVp4VzFuc1RNT0dhSVRQVTd6Uk1FYnNUR0dKVThWNnlqRUNO?=
 =?utf-8?B?SEtQVXpFNDZ2L0pVV2RiYWlRUkwrRDhzUlg5dDNraXFQUmEwVDJFVXFiUkw2?=
 =?utf-8?B?Z0hlWEZXTkNuaUtuNVlwOFNLTGtXWHo2ZG9wbHNSckdwRmVmeFdKQ3paTlJL?=
 =?utf-8?B?b1VTRVFBZHVaWjNOend1dlJLSmh5SE1Bb0NlUlhEbDhCMFV5THg5bFp2QkRD?=
 =?utf-8?B?ZkxpcHNrcHRqUy93N25RdUpQZ1VjcDcrUlBYMHNhbVc0L0hYakQ4K20zV1Bh?=
 =?utf-8?B?aHIwYUZaRjl4OHRhUTdGVlErQjJSUFY3M2RSUll2MGMzSm00Y016cDhTS1Fx?=
 =?utf-8?B?UC9nVHFWaE8zSjVhVnhPcThiQ29EaDM4bFROSzFoSVdETVczTE42c0FSOGp2?=
 =?utf-8?B?cER5akMzdTF6S1BHQjVLSm9JK01qcTR6YnB4STNiS0YrRmlPNnA3NndlMllJ?=
 =?utf-8?B?OVRnamtiQ0pUU1VEbnlTQ1JtcGNKWWFWS2RUNXBrWFRPeHhlL0R3T2NRRHhZ?=
 =?utf-8?B?WHZENTF0Q1loOVl4NU9HVVNiTzNPQSs0NzdTMHVWY3ptSVhia3V0ekFQbVlP?=
 =?utf-8?B?Sm80bi9xMDFwRzlIbkU4TUwxL2UvenFVYkNNZDZGaHJSOGZoRnRKQzBCOEFH?=
 =?utf-8?B?alliTTQxYzAzWEFWTHhueEYxQ0dKK3lSdFVMdVpGTzM0VHNzQ0ZhS29tKzNk?=
 =?utf-8?B?S1NwOHlqSTdwNjRQdzJKWFZqK0dFd2dOOXpLYi9HeHpYQjJGd2w5R0NGVlRZ?=
 =?utf-8?B?djdQM3VUQlpRWElBaXZSa29jL1h5N2pDaExMZmg0TzRiNWdSTldkMDZIdmwx?=
 =?utf-8?B?MTdIR01iU29mOTVMV3NQR0lWeXVJOXorZEVQVkdCY1Q3cVJaNExMZlZkcmtQ?=
 =?utf-8?B?YndieGtNWEY2b2ZZSWJISXZyTHFhNDhqV2l2bE5yT1lsOG9wT3NLVTZwc2JL?=
 =?utf-8?B?QldwL2xyYVBVdEpFd2lScVYyQ04rTzlPZHQreVN2TXhHWStXOWZza2hLRjNH?=
 =?utf-8?B?MFlNSndBZHkxcnNsQUVPVVNzS0VBYVo5M3dQNHBJVzRnS3hsRjdLWFg1NEdq?=
 =?utf-8?B?aCtBRFVTMW41THY1dHh2WTdwSnpkcll6Z2g0b1dhN1JHSHZGWnRVV1dxZ2ti?=
 =?utf-8?B?TEpxRkQ3R0NYRVhoNzZJVTJwMS9WTmNmOGx6SFhybktOdVEveXRSL3ZPMG1P?=
 =?utf-8?B?U2lUL2p2Tzc5K2lBUEEwV1IvUUU2VkRCeVdBWGRkNVdMM01hYU9lQSs0N1hp?=
 =?utf-8?B?RzJxTmhXUkQrNHV1U21vODI0M3Rnajh4RzRuL2F0UWwrbm53OHRCY29HU1A3?=
 =?utf-8?B?SG5mck1zcUpneVRUSjRkNWNNSytMQm1PL2diakR3UXlWbG5yVlRhNHczQ0I5?=
 =?utf-8?B?Qm0yb0xBemxUS2hpa2cyUGNDQzZuWHRXZTNlZWxyQ1dCOGxScDlxR2czaUpZ?=
 =?utf-8?B?aXZaVkRiMmRuRWdzTXpSc2cvV0F6NnRZRVdWUDJocTBvcmpEbS95OStDVXRs?=
 =?utf-8?Q?F0WDwDHeqSG+jUPpN4pzdcpca?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c49f4c4a-1fda-4849-4aa8-08dbfbb2ac49
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 08:08:21.9692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v+EhOgIkevPfXthfrnE6pGFm4UosT1xS0JAbxOF16gzTGU6ynEVA/1kgVHUp3bHsU3aXkw+nD6kmf50kq0aS/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5227
X-Proofpoint-ORIG-GUID: V8OEFytXbch-GLHBv6RmpEqDV_zZJpCE
X-Proofpoint-GUID: BxdKIaqtRqO6OpHluE98ntL5dMbyIH0Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=737 priorityscore=1501 impostorscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312130057
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3BD6pVev017615
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 08:08:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107389

On 12/13/23 15:58, Yoann Congal wrote:
> Hi,
>
> Le 13/12/2023 =C3=A0 08:07, Khem Raj a =C3=A9crit=C2=A0:
>> On Tue, 05 Dec 2023 22:50:31 +0800, kai.kang@windriver.com wrote:
>>> Add 'native' to BBCLASSEXTEND to provides python3-pyudev-native which=
 is
>>> required by lvm2 when package config 'dbus' is enabled.
>>>
>>>
>> Applied, thanks!
>>
>> [1/2] python3-pyudev: provide native
>>        (no commit info)
>> [2/2] lvm2: 2.03.16 -> 2.03.22
>>        commit: 02f460c5e379b3b0980374b3f89d55bc195d03d3
> I just check on the git repo, this means that only the lvm2 patch was a=
pplied (but not the pyudev one)
>
> Maybe this case (partial application of a patch series) could be made m=
ore explicit in your template answer?

The v2 thread is also replied. I suppose it may be need to skip the=20
revision thread before final version.

Regards,
Kai

>
> Thanks!
>
>> Best regards,
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#107351): https://lists.openembedded.org/g/openembe=
dded-devel/message/107351
>> Mute This Topic: https://lists.openembedded.org/mt/102992734/4316185
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [yoann.congal@smile.fr]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
Kai Kang
Wind River Linux


