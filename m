Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.47])
 by mx.groups.io with SMTP id smtpd.web08.1547.1609894997392302353
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Jan 2021 17:03:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=XCyk76ZR;
 spf=pass (domain: windriver.com, ip: 40.107.92.47, mailfrom: yi.zhao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GFNSa07sWf5cCb31bIbUDo4ouMXCaC9Bv7mrs8uHW7avVGgiPLr/1TJTNQn1KM4fUsvqcLfKWq9JcxcRBiAucb3pjM+2H4csnLjBv1oDVnhgdkKTjVOafiFU2QZaQxiLS3KDTOoiWaQ6L9mUrK35WnnTAMeQyG853RGw9Fm+8n9TWAUvh10OTnX7l0RaRjFS1uTYA3ruVkESPSbPoFkBBq6cpVbqWdTf/I8qaZ1iyr4jPqAJnZ7IH/YP37l7XIu9l+hcsbvF0rkkYfBf+uKh7fxn9JcHu3f11a1SNzmy7z0sm3O+kkvAoXz7Yo+Z80tS8l4/7ctdFA+8zo8iuyBn/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSqkToo0AnV7cxBdTwjdYhAih6W+qoNB8olxT0mrIbs=;
 b=a/6deuHfiLyMv47PrafKUQnnitYMuBlNXMwv9Y5RzQnHH4jEmhgBMnsItpk29QuKfgojZqkxA1uRrGiXTQZVJZVomgTNaF/RZNZEGTjJKzS6i0CjrFhB90dS/cM/tekfo6nvyd2faRrGZsU/Eo4Tc+ZtmDeJ9mFVpZhMySniIUTXmLivx5h64dXXfDe9bxaukPGha3G+KQuf4SjReEXaeKk5PEwceuGcFKSA3mQ/tLJLtNihbD58y7pAWAZdJMrS/DQ3leG5+ObEmJjtz7ou2Ki7pN7EB1xUEC3ag6lqR3Bvrk0FQdlusrGCXt3LsGLyEwCb7UVWzXjjQL2wrQpsRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSqkToo0AnV7cxBdTwjdYhAih6W+qoNB8olxT0mrIbs=;
 b=XCyk76ZRS2E2L4FMiLFUHbc3v4MxEmEpYUoYk26eRmuctGy07r4eX7I4AYfyOO4Kh5xGHBn/4t3mDEVLOQpEcjU74nYjn4U7YbGlJWKSACINhlsD9z98doSz/A7kjsKRCMZXrdme8V/Ig19DtZTZefBu0Bzb+RrkKDEJbNG8pcg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MW3PR11MB4540.namprd11.prod.outlook.com (2603:10b6:303:56::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Wed, 6 Jan
 2021 01:03:14 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::21b9:29b6:fd3:bca5]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::21b9:29b6:fd3:bca5%7]) with mapi id 15.20.3721.024; Wed, 6 Jan 2021
 01:03:14 +0000
Subject: Re: [oe] [meta-networking][PATCH 2/3] etbales: remove upstream ebtables-legacy-save
To: Khem Raj <raj.khem@gmail.com>, Jose Quaresma <quaresma.jose@gmail.com>
CC: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20201231090331.223784-1-yi.zhao@windriver.com>
 <20201231090331.223784-2-yi.zhao@windriver.com>
 <CANPvuRm7giL_om_Pdhus8Qe5teOSKmJgDxcEu8qoyGusqX55uA@mail.gmail.com>
 <2a98d116-830e-e479-e75d-b2aa285f1743@gmail.com>
From: "Yi Zhao" <yi.zhao@windriver.com>
Message-ID: <967b10c8-6de1-1b6b-dfce-791007fd2a7a@windriver.com>
Date: Wed, 6 Jan 2021 09:03:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <2a98d116-830e-e479-e75d-b2aa285f1743@gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0302CA0020.apcprd03.prod.outlook.com
 (2603:1096:202::30) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
Return-Path: yi.zhao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.174] (60.247.85.82) by HK2PR0302CA0020.apcprd03.prod.outlook.com (2603:1096:202::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.2 via Frontend Transport; Wed, 6 Jan 2021 01:03:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7cd2c5c2-c981-45fe-3898-08d8b1ded86c
X-MS-TrafficTypeDiagnostic: MW3PR11MB4540:
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB4540812419CCD094F8DAC3A4F9D00@MW3PR11MB4540.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:235;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WO0F2ukv8LNFSunYqx3bHDdPtoHEMqcKchtgUEJiccQH1xd7PQPVI9XaakxJifkAgIG1gM/w0oXRIoaV0vEAybhXLCHlmBavNSXn1K6mDTyIBdKHg1bcleO/AQaOPh6eXH62rUS6Ei9q0iOvD2wrErpj8kOjkauTKi+BB3x/0HnFMThmd0jGEOz57Ow9d/mDxDXYszHrhe4jLrERAu5m59JAzxJ9dpQ1aLKLM1oEJEJj+oi34auvs6Fo6jHSJftPUfW2ZfpNLh4phO4Yyt4RFUDaVZjWhUYpDwq/AO/D1NprI0U9Nq9hwqRDCWS5yKV5Cwf4lvor4ERrhurtErCJrTFWT6yNYHgK+HV2JhGxa0ka4poa97vtlsx3Y93RAO/x4yJy2tRZgEf2zOBFnCVntDAa50tgGUiEixj0w+y3eKga4NdWOVFOmL1BuDh0BuslF0OxD0ajyvZxRslRD6EvIQ+A5Vs4ywXCPosQJWC9MR+R2qJ5TpVET8f1cwYgna9on+ZeRPZKwjxfvo4upPSuubJ6LZG1f/5P1zvdHRT1NTWnJd5otfyowc/3QbKtr7knP7qKc1AM46ro4NV6lB8e3A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(396003)(136003)(376002)(346002)(366004)(26005)(186003)(6486002)(83380400001)(16576012)(16526019)(6706004)(110136005)(53546011)(36756003)(316002)(4326008)(966005)(8936002)(52116002)(44832011)(6666004)(31686004)(86362001)(31696002)(2906002)(2616005)(66946007)(956004)(66556008)(66476007)(8676002)(478600001)(5660300002)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?O+JXiv9N4ptwPWTIM0y2iyUXIHOhZI9/E4S7QTNUi9U42/JRH8GMW9PSItbU?=
 =?us-ascii?Q?wG42CEEUMcPY1zdenJ/sJlMScfMcjH8jOcD4pzqqg+osj59VJVp4pRyj0lqe?=
 =?us-ascii?Q?AdW0ISFL3kR7FYSQCRFI83MOtFIsy8sxNHgY7SSfxQDPQWgaKuBFvfOH8zIM?=
 =?us-ascii?Q?z540m9h4b12vK1G1wUBedbRM1IfqfVYWL6R5E0vuI3mK5UJSfz8/cOxF79gi?=
 =?us-ascii?Q?0JXqmU1Tn5juqaatfn47a5DdZmM9dM63rXXFVm4Vj94KUOvj+3uFlBJhnkTw?=
 =?us-ascii?Q?yUJegp2KXhmc+3qAjljHjT+/6upg+/NDdSooFYrNCV085++co0sz8SClgfk3?=
 =?us-ascii?Q?hBnFYxPb/Bt3dTqEAU1mlVeXQJnZTfv9TsZpMCHHEsjxVIh/izAvWDkSM6vn?=
 =?us-ascii?Q?WsHLwGcGQECfYOL6Fjs4rqskGv8T5cKG90J5izbW4EhDg6uoSkTTgJ9psjRY?=
 =?us-ascii?Q?wpqS+LCYVeN63cqN6K3djHeDIg5qo+BgVrOErfQycNUy2VuE8nTsCD/y/xcO?=
 =?us-ascii?Q?AiqmEgIjYXDeSgtCoKyARLAewLUAO7eeLVeHWOTAfB0ZO13GV6EvGY3daWY4?=
 =?us-ascii?Q?JBZHp+ff+iI2lcVI/u/OveAI10Vou1DFjq/CUIv3pEmDT1MSr211VYXT6tme?=
 =?us-ascii?Q?q0/ZoDdAML1ZJXmHglo8FfmdEshACCASfXUfl/El8adyq/3H8UnTqzzM/lbE?=
 =?us-ascii?Q?9zvEq4CHaheF/eBZYhkNq3WrnOBYJpnXAMe0r9Jnso/AQgiocn2QU8ifBpcm?=
 =?us-ascii?Q?F69Sjzx9m8JI6sRvZaCJOWoawEqLK0PaPaxTNTCI20ZAJc6x/IfUsqEUQxdO?=
 =?us-ascii?Q?VIQ5S/20oBu1NpvojV/rKAVGa9wLXdESASfyZnbFgkETqB6wr7T9Utgp7m9X?=
 =?us-ascii?Q?jG63BJF8Az0JNp3+mm/dEon4661ybfLg5iZJ7lQcejhJDDrLt3RWwXJZ9mDA?=
 =?us-ascii?Q?aWJVA4ZoNHVm3u/+7BULrx/pZ7fdIPtpOkAsohwiVus=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2021 01:03:14.4204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cd2c5c2-c981-45fe-3898-08d8b1ded86c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u+W4XvtIgp6ckrAQkHD269J31mGG6nYXKFf981KzbZGqxI1/Hd+ULEUVuIvBhpQoDRmMHNWKIBqpST5zTii/vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4540
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


On 1/6/21 1:17 AM, Khem Raj wrote:
>
>
> On 1/5/21 2:58 AM, Jose Quaresma wrote:
>> Hi,
>>
>> Fix typo in commit message:
>>
>> -[oe] [meta-networking][PATCH 2/3] etbales: remove upstream=20
>> ebtables-legacy-save
>> +[oe] [meta-networking][PATCH 2/3] ebtables: remove upstream=20
>> ebtables-legacy-save
>
> I gave edited in master-next


Thanks, Jose and Khem.


//Yi


>
>>
>>
>> Yi Zhao <yi.zhao@windriver.com <mailto:yi.zhao@windriver.com>>=20
>> escreveu no dia quinta, 31/12/2020 =C3=A0(s) 09:03:
>>
>> =C2=A0=C2=A0=C2=A0 Remove the upstream ebtables-legacy-save before we i=
nstall the local
>> =C2=A0=C2=A0=C2=A0 ones. And install it to ${sbindir} rather than ${bas=
e_sbindir}.
>>
>> =C2=A0=C2=A0=C2=A0 Signed-off-by: Yi Zhao <yi.zhao@windriver.com
>> =C2=A0=C2=A0=C2=A0 <mailto:yi.zhao@windriver.com>>
>> =C2=A0=C2=A0=C2=A0 ---
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0.../ebtables/ebtables-2.0.11/ebtables-le=
gacy-save =C2=A0| 2 +-
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0meta-networking/recipes-filter/ebtables/=
ebtables_2.0.11.bb
>> =C2=A0=C2=A0=C2=A0 <http://ebtables_2.0.11.bb>=C2=A0 | 6 +++---
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A02 files changed, 4 insertions(+), 4 dele=
tions(-)
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0mode change 100755 =3D> 100644
>> meta-networking/recipes-filter/ebtables/ebtables-2.0.11/ebtables-legacy=
-save
>>
>> =C2=A0=C2=A0=C2=A0 diff --git
>> a/meta-networking/recipes-filter/ebtables/ebtables-2.0.11/ebtables-lega=
cy-save
>> b/meta-networking/recipes-filter/ebtables/ebtables-2.0.11/ebtables-lega=
cy-save
>> =C2=A0=C2=A0=C2=A0 old mode 100755
>> =C2=A0=C2=A0=C2=A0 new mode 100644
>> =C2=A0=C2=A0=C2=A0 index 2d7fc4ed7..2133600f7
>> =C2=A0=C2=A0=C2=A0 ---
>> a/meta-networking/recipes-filter/ebtables/ebtables-2.0.11/ebtables-lega=
cy-save
>> =C2=A0=C2=A0=C2=A0 +++
>> b/meta-networking/recipes-filter/ebtables/ebtables-2.0.11/ebtables-lega=
cy-save
>> =C2=A0=C2=A0=C2=A0 @@ -1,6 +1,6 @@
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0#!/bin/bash
>>
>> =C2=A0=C2=A0=C2=A0 -EBTABLES=3D"/sbin/ebtables"
>> =C2=A0=C2=A0=C2=A0 +EBTABLES=3D"/usr/sbin/ebtables-legacy"
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0[ -x "$EBTABLES" ] || exit 1
>>
>> =C2=A0=C2=A0=C2=A0 diff --git
>> =C2=A0=C2=A0=C2=A0 a/meta-networking/recipes-filter/ebtables/ebtables_2=
.0.11.bb
>> =C2=A0=C2=A0=C2=A0 <http://ebtables_2.0.11.bb>
>> =C2=A0=C2=A0=C2=A0 b/meta-networking/recipes-filter/ebtables/ebtables_2=
.0.11.bb
>> =C2=A0=C2=A0=C2=A0 <http://ebtables_2.0.11.bb>
>> =C2=A0=C2=A0=C2=A0 index 08d4d661d..be21c372d 100644
>> =C2=A0=C2=A0=C2=A0 --- a/meta-networking/recipes-filter/ebtables/ebtabl=
es_2.0.11.bb
>> =C2=A0=C2=A0=C2=A0 <http://ebtables_2.0.11.bb>
>> =C2=A0=C2=A0=C2=A0 +++ b/meta-networking/recipes-filter/ebtables/ebtabl=
es_2.0.11.bb
>> =C2=A0=C2=A0=C2=A0 <http://ebtables_2.0.11.bb>
>> =C2=A0=C2=A0=C2=A0 @@ -28,11 +28,11 @@ do_install_append () {
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #This file has bee=
n provided by netbase
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f ${D}${syscon=
fdir}/ethertypes
>>
>> =C2=A0=C2=A0=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${base_sb=
indir}
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Replace upstream=
 ebtables-save perl script with Fedora
>> =C2=A0=C2=A0=C2=A0 bash based rewrite
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #
>> http://pkgs.fedoraproject.org/cgit/rpms/ebtables.git/tree/ebtables-save
>> <http://pkgs.fedoraproject.org/cgit/rpms/ebtables.git/tree/ebtables-sav=
e>
>> =C2=A0=C2=A0=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 ${WORKDI=
R}/ebtables-legacy-save
>> =C2=A0=C2=A0=C2=A0 ${D}${base_sbindir}/ebtables-legacy-save
>> =C2=A0=C2=A0=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i 's!/sbin/!${base_=
sbindir}/!g'
>> =C2=A0=C2=A0=C2=A0 ${D}${base_sbindir}/ebtables-legacy-save
>> =C2=A0=C2=A0=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}${sbindir}/ebt=
ables-legacy-save
>> =C2=A0=C2=A0=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 ${WORKDI=
R}/ebtables-legacy-save
>> =C2=A0=C2=A0=C2=A0 ${D}${sbindir}/ebtables-legacy-save
>> =C2=A0=C2=A0=C2=A0 +
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Install systemd =
service files
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ${@bb.utils.con=
tains('DISTRO_FEATURES', 'systemd',
>> =C2=A0=C2=A0=C2=A0 'true', 'false', d)}; then
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 install -d ${D}${systemd_unitdir}/system
>> =C2=A0=C2=A0=C2=A0 -- =C2=A0=C2=A0=C2=A0 2.25.1
>>
>>
>>
>>
>>
>>
>> --=20
>> best regards,
>> Jos=C3=A9 Quaresma
>>
>>
>>=20
>>
