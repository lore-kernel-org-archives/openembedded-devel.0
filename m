Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE3BECD1283
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 09:27:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.33661.1711963621241021575
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 02:27:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=fgY83s37;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4821fd9b1d=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4316sZvH003671
	for <openembedded-devel@lists.openembedded.org>; Mon, 1 Apr 2024 02:27:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=HAz3QLXO+24s6toQegCJwdIM2uVXFkgjiAh9E/gyR18=; b=
	fgY83s37UETlDEYaLMiP6viVjKSbkGbZjvD5lpurQ0PA3cL4bh1hdJ/dObWo/Tc8
	o4gwd4qEKtJ5AFZWJ0i/4t+kZ1zE7cEuSp+P9qszdSjBMDIOOdB4v4Np4FtlJyRd
	K0jhi7O+65dSCm3Zey5MBeSuroZo+RzUvfO6GGg+6h+FNvJFwja2SXI6YWAZmYoQ
	imi4PRbeuIbllx9MHL9znHeIAVDr5oWRaKi8lUnuRykcQnEBRq6jK1j9IE5Ptki2
	XQA3zz6n50kZ2jZKNhyrHxqs55SoZ1iIoCKFvZuCse6eK6q2mvamPjoMLnejUihi
	1gTAucX96Su9w+hAexCnbg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x6e10hjs3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 02:27:00 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4319MQDs007526
	for <openembedded-devel@lists.openembedded.org>; Mon, 1 Apr 2024 02:27:00 -0700
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x6e10hjs1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Apr 2024 02:27:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D09CNE60dUZHdV2RzNHDXVF1N6FGkNx39zr+ZAaIZDFk/4bfrVaGFYKh1W8/kiABDFKbNqgxPczgOaA5/uZiQVRIvdnszGu5XcfNwUvya9DrpSaAGfwiD87Uxztyc+b3a2MgnjXeL7qtX3AEu4966YWNcAoy/4BKH+YOywMHEW7YRRKnso4lP1yrutkS8gBQvK3vjiIlpK3uymL/yTgrkK766Sp0kr/6uYg21vg71tNrj4FUlKwaNktTIBIQgLBpZegowNXLFgsEzV+S2KLQZpkSrFh3G6UJaAtYYYz7YYLip5zZQCdArtbnI1JQ8Nprqkf3yxkU8Xw2SD2EmLpnCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HAz3QLXO+24s6toQegCJwdIM2uVXFkgjiAh9E/gyR18=;
 b=fN7vp0TGfrE2G4cTgMnMkWbHQjZjJij2mesSCMGWhCboaixwDPmaYp2Xsf99YfLUMPlMsEpQLpBbjYgRsIagzIcq+Bec3nwqNs54q5bIVqaN7ZbeHs86EnuUHfWTv0JTbbE8XhrJcDnOn1LXUE+8Mwu0h/tfGCdu6I3lEFaQneobwbRD/Ic4450WGI6I+rFvt5da4NxOEPA3CFELmp/bwC2AvDjPAhNKiuQ68IaVpmusKgoc4IopEtMePUmiW0T27o0cDz9dxJ8AoBLFE8qeb/vDcK3USCYvwQmWbmkZqeFDXu0t9HynofmhhAHYtU28cn+DNK7CNu1+oy+540QSuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by PH0PR11MB5829.namprd11.prod.outlook.com (2603:10b6:510:140::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.24; Mon, 1 Apr
 2024 09:26:55 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::2ef2:65b1:77e:899b]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::2ef2:65b1:77e:899b%6]) with mapi id 15.20.7452.019; Mon, 1 Apr 2024
 09:26:55 +0000
Message-ID: <3a0221e7-f23f-4e24-9d0e-fde8df4cfa92@windriver.com>
Date: Mon, 1 Apr 2024 17:26:47 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][PATCH] freeradius: upgrade 3.0.21 ->
 3.0.26 --> Should we update to 3.2.x?
To: Khem Raj <raj.khem@gmail.com>, Randy MacLeod <randy.macleod@windriver.com>
Cc: yi.zhao@eng.windriver.com, openembedded-devel@lists.openembedded.org
References: <20230109152538.896240-1-yi.zhao@windriver.com>
 <1ae2a64e-1796-4989-9157-a6b9ece677d3@windriver.com>
 <CAMKF1sp4hVLRx8qwsOC3H564DtyqrtxptUSY4=SC=Y3mtDF7aQ@mail.gmail.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <CAMKF1sp4hVLRx8qwsOC3H564DtyqrtxptUSY4=SC=Y3mtDF7aQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2PR03CA0113.apcprd03.prod.outlook.com
 (2603:1096:4:91::17) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|PH0PR11MB5829:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dUD4CtXl2OHhRAnO8PvNXE6HzeZ+3ADSuSa/nHHDvHOau+cIiUerkpzCmXPjyEOHdhXzmlbxRHZUDrPMw3cNUcuVszjQJWQb0iMstfaPuTHRpXedFK1A+gugJlH2OrAp1ixF2lJgXlPxmcPsNZpIaE7FmLnpUdBxiE5iIluAhbnphgMAshoOUxpIKpo/PmAEfUpAebCdPqOAo4aTardzO11lba2M4TpIE2ViCQe+sDsJbibgX0cGRpUO43+V2A2YivLXLlWqxbKdOUJhPmLrb6UmH/HxOl4yBp3hTp4dbqJ+l0VkEk6AsX2LYwiSnMgRqdoThbvCz7nN+ZS+E1O1cQSadOqdUWucUHK9SgZFFHV6SjvESrsXHByDXkKPrgblsfDQgJ3egaWBC1LHkIKLNquQ5JXh3PfKawqwyv0V7sdMOLBy8aw6E7/18uIaCFzo/CAsmAx9DOL6dhkEPf3L+hyzIwWj3peNVvQCbPtg01L8CigejROEFj/Gg/99vEjbAHW04MruwSzbbVXtzwNLRuzwWHkC6+CDad64hWopXvZtgn29mmWoWgYrUaXE89C+k2nnOEsScV5U5MXNyyuRokR8a/mJT7D4AH0SJ8qgJUY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?azBKckZnZXA2dEZJL1lUUHRGdzAwd2gweUx0MEFSbUwyNzRqRCt2S09pUmpn?=
 =?utf-8?B?elM0WDlGZjVzM0l6VlRMYk9jZk5ubVZ6VnlBWGkyWDZJMmpucXp3V3FSTHJI?=
 =?utf-8?B?NENOaThuMW9CVGl4am5yek15cXNpbVpIaVYwTFcvenYxdEw1T09CbWJ4VmpU?=
 =?utf-8?B?MkU4ZlY0UTRJKy9GZ2JsZFFCSS8vQlVTUTlsbDNWRTE2N2pYOHlRcWJkY09h?=
 =?utf-8?B?TiticEF1YlUyRnBUeWg3cE53azQydkExNjJiVjJoNTZ1Qmo4cm9nVzB1bFNh?=
 =?utf-8?B?OTE1bHZKOUtuZUU3UmNUNXNRWG1BbXBGeHl5UndIVEhPeDlMejY4K0c2S05h?=
 =?utf-8?B?VGFXRkh4SlFXb05zT0x2c1hNemdvZjJJVzZWcnROU1pBR29vdVVDSU5xb0FH?=
 =?utf-8?B?N3VLWUJ4ZkZ0Q3BUZmdRUzlIcUlIeHpBME9EbU8vQnFvbUpuR1NHUk5STUxK?=
 =?utf-8?B?Q1pzWTdPZno0TzRUREUrRVRZMUhGVy94Z01IMTJLVkozZWxxS1piTloyMHBa?=
 =?utf-8?B?VHBpTU1sVjAzVzlqSXdmV2NYc1hmVU1kRGZSU2ttTXNWaGdNeWdJcVlXMzdw?=
 =?utf-8?B?eWU1REZCdHcwMU51MFJQS3YyQ2JTYnpGK1RBSW1sTE1aV016ek41SmdWYlZR?=
 =?utf-8?B?YVlDVUdaTm1aeU9aQWVzNHNoWFJabkhCQ1poNjVqejNGNGthT2h6RUZvQXhD?=
 =?utf-8?B?N1dNbVcvZVdlQ05RendhQWw5aUcwNE5NS1gzM05wejhuZGVLTE9tRlR1NFV5?=
 =?utf-8?B?QnpUZWYzTFIvdUt1WGw5T1djRWgwUStkclBjVG9oWEVnWkNJNTVLK2pEcThk?=
 =?utf-8?B?T0FxbEw4TE9WYnZhWXlNTFAxZFpDbS9kbUYrVG1zaGJSVXdDZExIc2dYZkRH?=
 =?utf-8?B?Y2xyYXd6RVE1Q3hvNEp4ZlBCWjkwY2hrUWw1Q3VtRDBSbWtJVG9NeGVrdU1J?=
 =?utf-8?B?UG9TZFNSenpYTVB2VHhLQTBtU2NXRDJPU3BIN3Eyb010dUY3eEd4ZGhmakdR?=
 =?utf-8?B?R2dHQ3Z1VWdQZ21Uc2w1QmptTzdETmo1WlFIN3NXdnAyMkE3WVBZRHVLeUtZ?=
 =?utf-8?B?Yk5haUJBZ3RrSERrb3d4aFNQQ0UyUXd3QUtWSzZ0ZmE1SVBHalNiYkY2Sml6?=
 =?utf-8?B?RTRBVjhTbElLb0lOUC9heUVOZGNOdFVMdHN6UWdGenM5bktkMkFQaHY2K29u?=
 =?utf-8?B?c0dyc0w3bnk2RWNiRzFBWEU3Z0VJSlpjRTdPQTdkQUFpbnAvUlA3UkhySlNj?=
 =?utf-8?B?VklaYXgvS2pUeVdFMEdCbSs3Yklvc2tOaGJyUmxydmcxU1pIT0FpYXZsenk2?=
 =?utf-8?B?Wm14aTVkbUw3dlJ0SGpwNWl4aXdJQ1p4WFA3MDhJanNhNE9NdUs3WE41cjgr?=
 =?utf-8?B?ZzZHaUtTVDRhUGxMVDZtY290SXROL09iOFpMc01uZGZhcEdFYkVVbmc1NGMy?=
 =?utf-8?B?Z1FmdU00SFBTTUtIZXhVVU5CRWN2QnlkSjBzcm10MUhZRHI5KzlzcTJDSlBI?=
 =?utf-8?B?R0RDcHBtcGduZGdtK1F4MTVaTTYvQ3NUTldPZHRhb1B2MEJWbHIzRGdScS9D?=
 =?utf-8?B?VkNOa1B4WThxUStuNStJbWl2M0NhZlpWNFBYQ1Q5WUZBdW8vNzNxRDlndjgx?=
 =?utf-8?B?RS9DSWJuTXp5QjE3YUp5ek9xN3k0eks3WUxKdHJHWmhEUUVPWVdWS28xTEZ4?=
 =?utf-8?B?WDZ0aTlmaitjSkQ5SG5sMDdMcGR5UGJmL0lYYlBGNG96anErMXQ5RFMyZndq?=
 =?utf-8?B?MjlqMDYyVWM0RFdkME1PTFNsYWsrdFFNM2EySlU5NlpqTTFyUG9Cc0duaUVK?=
 =?utf-8?B?ZVAvVGE0K1gzbmFZa0M0Sy9ZREJjajl4dUpqODlJWFJYMlJ6ZHVwMGJkZ3BZ?=
 =?utf-8?B?REVTVGx3QURZdGlDKzVkZExaOWdUOG1TcVJER2VSUVMrTmwyNnBtQ3dDdzFF?=
 =?utf-8?B?T2tQLzhJTXFNR1UwWmNqekcwcUQwcENlZG5ZQm9IOER6ODBwaXd3eUZGRDc0?=
 =?utf-8?B?R0MyV0F6czM1cDlFMW12RHUzNnQ1U2ZMWjBNeUtIbDFqTWh3WlZBUWdoRE93?=
 =?utf-8?B?RStNZHI4UVN4OS9Ib0VJWkdmVG5KaUdXRUdUQTd4Uktrblp6ZWRSbHBNeEx6?=
 =?utf-8?B?Vk56L0hQWnN4OXFnNnpQSXM5bWprYi8xQ3c0Vkt3dkVVOHZUK3A4ellJQTBq?=
 =?utf-8?B?VGc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed7f0c48-e926-4dfd-4d88-08dc522ddf4a
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 09:26:55.3839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /cOtFhtA+hh59TXym+snaZXw6+yNvZvSyfJnQX2fdjBBxBuBaj2QiVV5un2vJrFMj2rrxxPlBCqZg/O3d8mkEdVcQzhdKGhfIgC6HXX8TsE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5829
X-Proofpoint-ORIG-GUID: dzHeYzxwlKB42qAn1YUkUyDBflJiEmCA
X-Proofpoint-GUID: 9KQRIaaDP-rstnsbj8DUlyCc-LreUiAD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-01_06,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2404010067
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4316sZvH003671
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 09:27:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109698



On 3/31/24 1:03 AM, Khem Raj wrote:
> last three point releases of 3.2.x series has been stability releases,
> and I think it will become next stable following the release pattern,
> so I am fine with upgrading to 3.2.3, please rebase the patch on top
> of master-next and send here please.

Thanks Khem and Randy, I've sent the patch based on master-next to the ma=
iling=20
list just now:

freeradius: 3.0.26 -> 3.2.3

A lot of lines are changed:

=20
.../recipes-connectivity/freeradius/files/0003-configure.ac-allow-cross-c=
ompilation.patch=20
|  32 ++--
  .../recipes-connectivity/freeradius/files/0006-Avoid-searching-host-dir=
s.patch=20
            | 331 +++++++++++++++++----------------
  .../freeradius/files/0007-rlm_python-add-PY_INC_DIR-in-search-dir.patch=
=20
            |  19 +-
=20
.../freeradius/files/0011-rlm_mschap-Use-includedir-instead-of-hardcoding=
-usr-.patch=20
      |  21 +--
  .../freeradius/files/0017-Add-acinclude.m4-to-include-required-macros.p=
atch=20
            |  61 +++++++
  .../freeradius/files/0017-add-python.m4-for-detecting-python-3.10.patch=
=20
            | 427 -------------------------------------------
  .../recipes-connectivity/freeradius/{freeradius_3.0.26.bb =3D>=20
freeradius_3.2.3.bb}         |   9 +-
  7 files changed, 278 insertions(+), 622 deletions(-)


I've tested it on both qemux86-64/qemuarm64 + glibc/musl, all the builds =
are OK.

// Robert

>=20
> On Sat, Mar 30, 2024 at 8:05=E2=80=AFAM Randy MacLeod
> <randy.macleod@windriver.com> wrote:
>>
>> Robert and I had an internal discussion about whether we should update
>> freeradius to the 3.2.x branch. See below. If there's no objection,
>> Robert please send you local update to the list so that it makes it in=
to 5.0.
>>
>>
>> Robert said:
>>
>> I've updated it to 3.2.3 in my local repo, but 3.2.x are 'Features' re=
lease,
>> and 3.0.x are 'Stable' release:
>>
>> https://freeradius.org/releases/
>>
>> I think that keep it as 3.0.x is better than 3.2.x for LTS24 (YP-5.0)?
>>
>>
>> I think it's a judgment call.
>>
>> You are right that there are new features being introduced:
>>     https://freeradius.org/release_notes/?br=3D3.2.x
>> but there is also a dedciated branch for 3.2.x:
>>     https://github.com/FreeRADIUS/freeradius-server/tree/v3.2.x
>>
>> separate from the master branch and there's talk of a major update hap=
pening for the 4.0 release:
>>     https://freeradius.org/4.0/alpha.html
>>
>> If you look around at what other distros are carrying, the more recent=
ly updated/released
>> distros (Fedora 39, Debian 12) have 3.2.x:
>>     https://pkgs.org/download/freeradius
>> and ubuntu-24.04, will ship 3.2:
>>     https://repology.org/project/freeradius/versions
>>
>>
>> I wasn't able to find a document about FR's release schedule or EOL da=
tes
>>
>> but it seems to me that we should add 3.2.x.
>>
>>
>> ../Randy

