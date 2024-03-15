Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71926C54E66
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 05:01:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.13628.1710478883459683857
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Mar 2024 22:01:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=IOdTS9GK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3804134e78=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42F3qm3h015022
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Mar 2024 22:01:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:from:subject:to:cc:references
	:in-reply-to:mime-version; s=PPS06212021; bh=NyiTcpegc/4Ab9yUfL/
	tmprffiuzTrvRlobANKmzves=; b=IOdTS9GKUlwJRw2gpdDUj9vos/GtsPUMk9h
	cvljVDMlwxOwPcRkjAGo4wiXm1l4OQTQ59/BEBM93JJ+v8WtRM2ypxO0ieUxrycu
	p9v/Jq+JZ/ptQqoHNQwVMeMYi3gJ6SLR9BatcRZeVlk/We2aXgG4LNX6yQr/tjGb
	4tOulHjuj3exZiUX73c5J+IaSmpb131UHsEBF/Ddla2ADeUQaFBmrENZnTOfwoTA
	u5QPP2k1w7TJRntDgLR1mqmJsUxfZsn7Y7HSTrgeRHmkPDas2o7UId6Y9Y9PxP/L
	oW57yq1fQDS4NCkBZvTdxI/LYGGi+nuYzIOnLtcJMVaQ6Ynayew==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wva2wg7k0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Mar 2024 22:01:22 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 42F51MN7013314;
	Thu, 14 Mar 2024 22:01:22 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wva2wg7jy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Mar 2024 22:01:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f31LNSbkoh2GO8eE/bDwKjkUlt4h+8Gh5fxhSpEDWvmgVV8hLKHc8/0b2eJzZYZhisPSJ5lawk1VB0m8KZrJSBdTRs4TPerQ9MknBIP4TaSFjePc/I9afUyFI6rhdM5m0DHH7kDjUzAKTXFo5uNfR3NqwaRmHO2H6sEjw0avwReRTK/YSnlblfUkAY5aQdZhKuLhLg6QUEKV9unsnbBixwKPkwT4TWVYxyAkUz/aI0HBcQVAPhuzbKEUiPa0CIedsqx4MuxeesKk86DRjhopo7I15R9GpJNVJOq3l/o3x6DLRkYr3bKqOtzLxltTkE8WfMiT0mC6Xq/5oc4of8EUUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NyiTcpegc/4Ab9yUfL/tmprffiuzTrvRlobANKmzves=;
 b=ODd+Af/pEL0U7/Z9F7Ttcg6KG4bwTYqVOFKgVD5tBzM40e0x3uZMH71YpiCMU+hapU6jOAuwEhC/7Va3cmjtvbTVfgElfzsfMczjR7mh7itICX6LIST6kZyOM5LMNGJ/yoxthD2gQma2//+BAigciwICW3AeCOJSx+R/esVxTtwEsE+BIEHXggOErCUck7fWRFeV6+tjhBX78mK0Ox0btYcxQjztVtexWLkanJJvsUftRuoAxcJ5LBWmtgj0R9UAFKPBL5yjj47vdFJZDnKd5NitUtrGvfhZ/4x/DIluz7cIkgd/sqGrzNyDf4uDGAjUQUSgXg7qNZ/K1PnpY2kL0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by IA1PR11MB6124.namprd11.prod.outlook.com (2603:10b6:208:3ec::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.16; Fri, 15 Mar
 2024 05:01:18 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::d168:2e49:fb61:dc21]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::d168:2e49:fb61:dc21%7]) with mapi id 15.20.7386.017; Fri, 15 Mar 2024
 05:01:17 +0000
Content-Type: multipart/alternative;
 boundary="------------3yiTooYzmVKNty2up0kU9Mjm"
Message-ID: <b235f78f-1988-4ea3-b183-20cd9f2cc113@windriver.com>
Date: Fri, 15 Mar 2024 13:01:10 +0800
User-Agent: Mozilla Thunderbird
From: Changqing Li <changqing.li@windriver.com>
Subject: Re: [oe] [meta-oe][PATCH] postgresql: fix a runtime error
To: Khem Raj <raj.khem@gmail.com>,
        Changqing Li <changqing.li@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20240314072215.6854-1-changqing.li@windriver.com>
 <CAMKF1srgr=EqeoZXiYLjzvjiQ_fH6csQHDayCQXX2rcED8ZVyA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAMKF1srgr=EqeoZXiYLjzvjiQ_fH6csQHDayCQXX2rcED8ZVyA@mail.gmail.com>
X-ClientProxiedBy: SG2PR04CA0178.apcprd04.prod.outlook.com
 (2603:1096:4:14::16) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|IA1PR11MB6124:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b77ce9d-f86d-4f8c-827a-08dc44acf27e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gSDqO1PHnp02sVJc2mBWd88Sf9o7B5qJZjfWN7HwVVloVShbZJ7sLcZBgPlKEdjnR1IEcsyQ++aKoYsL1rRe+26rzBwBVxZKrdHxilJgaUP6dJYuDxbciney8DYHshVN9h60n3UJmECJ5rH3KDp1d+O3wXHKr2tBSbLBfDDVGqCT5XXYST6pJAxHEy3F2Q8hLBesBKWbZXTDflnNBckH3jKAfAouha+xUEpWzwCyLb4v3u6yPuyOrVaXnG7mYk1KNc5OecZLilXuQxzd/DwC5ADJOLPY3WhWkbDdVMpzcrHQzA9Z6VByx78zTgtO/Otnk45zNxmmLd3rERrp6whEUoVKgx26JHEXuouZ2UPvRLuLR1sdP8xAUssK7pV4OOdXdwTj0VY0uFX7YUSrRDvYvZ5CZVwqgc7+J3/msLHPIFWvxwj0gq/bO2pAuIC+/d57Cbg14+UY2Yg0nYOdeuU7RBRk3Wiwp/c9W/CFA+PiFnFNWCXxr+aIdO429e7O5J22wedo2v1P2Hsr8ExHUx0s/lLvjfbk6oCHLEmRBfbM1FZ81mTv1dwNB/uQ3mZlCwGgiwWsD5qqCNFe9EK7CAfk07yekXJ7iTkhpphehi7cMnmfaCb0TmbafxD8BpvwbfaO
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MFBZbTVJakp5SGFoQUdMOVFPSFRjOUhnSmFaMEFqVFc0T0ZZTEdzQ3JwcXBW?=
 =?utf-8?B?RWROZUZiOUpxLzBOU3BjNEhBZnZNT2wwcmpmRmw2UE90UkFlbWpnMVlFZWlW?=
 =?utf-8?B?K3lKMWFZMlhPUjBJeERSa0x1RHpBOFJoY0NubXRtTGR6R3VtdkdMREtWR3Q3?=
 =?utf-8?B?amw0eXNhbmtJUlJwMTRhYSt3c2h6MHZiSGJxbzVJSnFUaXFIeVc2M1Boc2Jo?=
 =?utf-8?B?c3BPL3hmWklEWHNINGNrV3dteVc5aEFUVEF1SVR2WUZwMWNiOGlyZXdwNDBz?=
 =?utf-8?B?VEFEMEdrZ0l2OGRaRzZEc1dzUTh2dEI1MTVFR0lYN2k4UFBaYTBFV1RJV0d3?=
 =?utf-8?B?dUJTV2dYcXJ6T2YrUHhud1p3eXYrcHhmMVVFaE1FMVc3UDRGc0t6OHdISGVY?=
 =?utf-8?B?MlhGQTZoTGlxYVkzQkZYQml3RGRKZnFuR1RWUTYvVjRLc1lKa1c2ZGhoWWxr?=
 =?utf-8?B?Z3FBNzYyZDVGWFFJSWJhYnpJRnp6TnFMNG43TGtvQVN6eG41TFR3a3NpejU2?=
 =?utf-8?B?UkJOWHZZdWFGVExnN0hTVkZmNVpQd2RNeExaZmd6OXVha05tY2w5eUVvWkMx?=
 =?utf-8?B?REt5dGtYOEM2NWlKNEZVeFVVaTE5bFdjVDlRRElEOUpnOVp1UWx6amU4UWh3?=
 =?utf-8?B?eVNybVQ0QUNPMWk0VGtLWk1CdUFpUG5zV3hpRGpvcFJzUWhURTB0QXJmSWM1?=
 =?utf-8?B?V1ZrYlBrcGpqTWxsSVRHdjJoQTBJeDZ2VGIrRTFJM1p6M0M5aUp2TkVFckxU?=
 =?utf-8?B?K1ovbXc5VSs1Nm93dExGT2kxSUZwYWpYVzBNR29RQlNmbDBTQzhVeVlSbEEv?=
 =?utf-8?B?ZG5BNUZPMm9nQVViOGp1WGp4YlJNU3Y3Rk5oTTYrek9qWmUxY0FlWkQ0WnFn?=
 =?utf-8?B?YWUwbjZaL1BSYmVZMXhkQW84Wk41cnhKQitHUDFMTWJVS2hIbGxTYUZYSEdt?=
 =?utf-8?B?YmlHT29BZXg1Z2hBV2ZIbHpuUXFFSXpZUHBjQXozYy9McWhPaGJvL0RKNGpF?=
 =?utf-8?B?MVhFZThUR2FPYlRDUUhyMTREMk1xYjhuMmZRTndzbzkwZmYvZ05JMkJFb25W?=
 =?utf-8?B?SjBqSUZJbzhMNTJqM0t4UExPNHNSOUo4dUxJUktYNFQ1WXR0N0VsSnhHOHpP?=
 =?utf-8?B?TkFvU24vWVQxRkxCT1JiS1ZrM2ZQVzY1UFZzYkVGOVFyT0JpOGN5aHMrZSs4?=
 =?utf-8?B?TE1PNTFrc3czN1piSDJZay9ZUWNBWmpGQXB1UDJSdCtrQ1dzaFkwRnpHZytS?=
 =?utf-8?B?YldGd24zUzlCNHV3b2ZRQmQ4LzJSV3laSnVSRmE5NlM5bjdXMWNzLzhuYmFk?=
 =?utf-8?B?dVhTWUYrajdaM0pCSGlabVd1YVBNMzdick9FQnFFblBEcFhqTUlNenN6ekxr?=
 =?utf-8?B?MDB2ZWNLWUV2MHJzbnJoSk5GTjVZUnVOZUNxSDhTNEFJOVFiYm84QVpMRVB4?=
 =?utf-8?B?Ky9Gd1dacHFLSUZFcnR1L0JTOVJENjFZQ3EycDRzZExrVnd2Uk5yZm5EQlZ3?=
 =?utf-8?B?UE5oZHAzSDZmKzBwY0Q3YTZ3eDdpMDM3MEdtUDBrM0ZMM3Q3aDFDZzlWbjVM?=
 =?utf-8?B?dElGU0Y1aHN5NXhKSDhtZ0ljUFcxNDBRZUtXaWppaEpQWk1xSyt3NVlxQS85?=
 =?utf-8?B?STFiQkVrMldNeXNZamhUSGJaQXhxclhKWTZETXNyTjJRUTdiR3VUMDVPTEFX?=
 =?utf-8?B?Y3RzaTZURDVZQnNudHI5aHVuMEM1VFk2ZFJpc0ptYVZPTGp5R2t1ZjZiSVBI?=
 =?utf-8?B?czNxNDdNT3JnZWtpY25YR1FLQ3phbWtHSUlNN3A5d1RTaXZ3ZE5SMGFUSXFX?=
 =?utf-8?B?alpIRHZvS3BhNktqOWMxMlZOa3ZqOFRpS1BIb2phL2VaVkxTWnRhWmt3NlNl?=
 =?utf-8?B?VkhkMzNiVzFwZ2dSRXJxTlBmVWpDQXFmVkgwTW9mVFJXallmbEhXUnpHY2Fi?=
 =?utf-8?B?WGc2bE1hVWczTUFScElxZDE3UGFWQXptMW9KbHNwZ3k5KytXREZnODcvWHVE?=
 =?utf-8?B?SFAvcVNmWmt0SU1mUGd3VGRqak1SaHNodGxmYWx5RVJlcjlSVUpNTjFTZ2x2?=
 =?utf-8?B?NVdnN2dMWVNjM01FemZ6SlUzZXZCSG1BUVZtNlNoYmVTL1VDZjdjRllteXl4?=
 =?utf-8?B?SCs2N2JLWHN6dUhickZiOXlsY3FvbUpNckhQKy9QL1hnMkVCVmpMZjl4RUhC?=
 =?utf-8?B?Qmc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b77ce9d-f86d-4f8c-827a-08dc44acf27e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 05:01:17.6796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AQxzS2KIXOhIggzWUgvG9wrMGVSXSOIoZ527q32djSz9JoXfc4lsWwp43J2RpE37Fxke91FdbeZGu+tS4czZOlIfKAxjtQwp78IBiJvetbE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6124
X-Proofpoint-GUID: wzXUWAjsywrnnhv5A6vhCJUxn2-n-6hv
X-Proofpoint-ORIG-GUID: i9LFoc5Jf52DQ1GIuGYUEzyuQT8Y7E-M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-14_13,2024-03-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 mlxscore=0 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403140001
 definitions=main-2403150038
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Mar 2024 05:01:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109326

--------------3yiTooYzmVKNty2up0kU9Mjm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 42F3qm3h015022


On 3/15/24 01:12, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Thu, Mar 14, 2024 at 12:22=E2=80=AFAM Changqing Li
> <changqing.li@eng.windriver.com>  wrote:
>> From: Changqing Li<changqing.li@windriver.com>
>>
>> initdb on target will fail with below error:
>> 2024-03-13 08:40:23.253 UTC [4410] FATAL:  could not load library "/us=
r/lib64/postgresql/dict_snowball.so": /usr/lib64/postgresql/dict_snowball=
.so: undefined symbol: CurrentMemoryContext
>>
>> Refer [1][2], for cross compile, --export-dynamic is assumed as not
>> supported, and cause above error. For oe, both gcc and clang support
>> --export-dynamic, fixed by set LDFLAGS_EX_BE directly
>>
>> [1]https://www.postgresql.org/message-id/79e63515-0f5e-30f4-136d-96e23=
b1a817d%40posteo.de
>> [2]https://github.com/postgres/postgres/commit/9db49fc5bfdc0126be03f4b=
8986013e59d93b91d#diff-49473dca262eeab3b4a43002adb08b4db31020d190caaad159=
4b47f1d5daa810
>>
>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ---
>>   meta-oe/recipes-dbs/postgresql/postgresql.inc | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/r=
ecipes-dbs/postgresql/postgresql.inc
>> index 868a2e443..e29a5bef7 100644
>> --- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
>> +++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
>> @@ -35,6 +35,7 @@ LEAD_SONAME =3D "libpq.so"
>>
>>   # LDFLAGS for shared libraries
>>   export LDFLAGS_SL =3D "${LDFLAGS}"
>> +export LDFLAGS_EX_BE =3D "-Wl,--export-dynamic"
> this will add all the symbols into dynamic symbol table which may not
> be best scenario, can we just export the ones needed ?
> perhaps look into using --dynamic-list.

Hi, Khem

I tried to use --dynamic-list as you recommended and test command=20
"postgresql_setup initdb",

after I added all the symbols in dict_snowball.so, it will report=20
undefined symbolsfor another lib. I know I can try to

add all the symbols for all the libs. but there are nearly 80+ libs=20
generated by postgresql. There will be many symbols.

And I also worried that, we may missing some symbols since I may cannot=20
cover all the runtime cases.

 From [2], we can know that postgresql use "-Wl,--export-dynamic" before.

So maybe it is better to still use "-Wl,--export-dynamic" like before?=20
what is your opinion?

Thanks

Changqing

>>   inherit autotools pkgconfig perlnative python3native python3targetco=
nfig useradd update-rc.d systemd gettext cpan-base multilib_header
>>
>> --
>> 2.25.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#109311):https://lists.openembedded.org/g/openembed=
ded-devel/message/109311
>> Mute This Topic:https://lists.openembedded.org/mt/104922226/1997914
>> Group Owner:openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub =
 [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
--------------3yiTooYzmVKNty2up0kU9Mjm
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 42F3qm3h015022

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 3/15/24 01:12, Khem Raj wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1srgr=3DEqeoZXiYLjzvjiQ_fH=
6csQHDayCQXX2rcED8ZVyA@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On Thu, Mar 14, 2024 at 12:22=E2=80=AFAM Changqing Li
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:changqing.li@eng.windri=
ver.com">&lt;changqing.li@eng.windriver.com&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">From: Changqing Li <a clas=
s=3D"moz-txt-link-rfc2396E" href=3D"mailto:changqing.li@windriver.com">&l=
t;changqing.li@windriver.com&gt;</a>

initdb on target will fail with below error:
2024-03-13 08:40:23.253 UTC [4410] FATAL:  could not load library &quot;/=
usr/lib64/postgresql/dict_snowball.so&quot;: /usr/lib64/postgresql/dict_s=
nowball.so: undefined symbol: CurrentMemoryContext

Refer [1][2], for cross compile, --export-dynamic is assumed as not
supported, and cause above error. For oe, both gcc and clang support
--export-dynamic, fixed by set LDFLAGS_EX_BE directly

[1] <a class=3D"moz-txt-link-freetext" href=3D"https://www.postgresql.org=
/message-id/79e63515-0f5e-30f4-136d-96e23b1a817d%40posteo.de">https://www=
.postgresql.org/message-id/79e63515-0f5e-30f4-136d-96e23b1a817d%40posteo.=
de</a>
[2] <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/postgre=
s/postgres/commit/9db49fc5bfdc0126be03f4b8986013e59d93b91d#diff-49473dca2=
62eeab3b4a43002adb08b4db31020d190caaad1594b47f1d5daa810">https://github.c=
om/postgres/postgres/commit/9db49fc5bfdc0126be03f4b8986013e59d93b91d#diff=
-49473dca262eeab3b4a43002adb08b4db31020d190caaad1594b47f1d5daa810</a>

Signed-off-by: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 meta-oe/recipes-dbs/postgresql/postgresql.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/reci=
pes-dbs/postgresql/postgresql.inc
index 868a2e443..e29a5bef7 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
+++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
@@ -35,6 +35,7 @@ LEAD_SONAME =3D &quot;libpq.so&quot;

 # LDFLAGS for shared libraries
 export LDFLAGS_SL =3D &quot;${LDFLAGS}&quot;
+export LDFLAGS_EX_BE =3D &quot;-Wl,--export-dynamic&quot;
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">this will add all the symbol=
s into dynamic symbol table which may not
be best scenario, can we just export the ones needed ?
perhaps look into using --dynamic-list.</pre>
    </blockquote>
    <p>Hi, Khem</p>
    <p>I tried to use <span style=3D"white-space: pre-wrap">--dynamic-lis=
t as you recommended and test command &quot;postgresql_setup initdb&quot;=
, </span></p>
    <p><span style=3D"white-space: pre-wrap">after I added all the symbol=
s in dict_snowball.so, it will report undefined </span><span style=3D"whi=
te-space: pre-wrap">symbols</span><span style=3D"white-space: pre-wrap"> =
for another lib. I know I  can try to</span></p>
    <p><span style=3D"white-space: pre-wrap">add all the </span><span sty=
le=3D"white-space: pre-wrap">symbols for all the libs. but there are near=
ly 80+ libs generated by postgresql.  There will be many </span><span sty=
le=3D"white-space: pre-wrap">symbols.</span></p>
    <p><span style=3D"white-space: pre-wrap">And I also worried that,  we=
 may missing some </span><span style=3D"white-space: pre-wrap">symbols si=
nce I may cannot cover all the runtime cases.</span></p>
    <p><span style=3D"white-space: pre-wrap">From [2],  we can know  that=
 postgresql use &quot;</span><span style=3D"white-space: pre-wrap">-Wl,--=
export-dynamic&quot; before.  </span></p>
    <p><span style=3D"white-space: pre-wrap">So maybe it is better to sti=
ll use </span><span style=3D"white-space: pre-wrap">&quot;</span><span st=
yle=3D"white-space: pre-wrap">-Wl,--export-dynamic&quot; like before?  wh=
at is your opinion? </span></p>
    <p><span style=3D"white-space: pre-wrap">Thanks</span></p>
    <p><span style=3D"white-space: pre-wrap">Changqing=20
</span></p>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1srgr=3DEqeoZXiYLjzvjiQ_fH=
6csQHDayCQXX2rcED8ZVyA@mail.gmail.com">
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D""> inherit autotools pkgconf=
ig perlnative python3native python3targetconfig useradd update-rc.d syste=
md gettext cpan-base multilib_header

--
2.25.1


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#109311): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-devel/message/109311">https:=
//lists.openembedded.org/g/openembedded-devel/message/109311</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/104922226/1997914">https://lists.openembedded.org/mt=
/104922226/1997914</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated moz-txt-link-freetext" =
href=3D"mailto:openembedded-devel+owner@lists.openembedded.org">openembed=
ded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/=
g/openembedded-devel/unsub</a> [<a class=3D"moz-txt-link-abbreviated moz-=
txt-link-freetext" href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com<=
/a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------3yiTooYzmVKNty2up0kU9Mjm--

