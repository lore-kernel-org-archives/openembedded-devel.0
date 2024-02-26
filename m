Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0EE6C5478C
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 08:23:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.16101.1708935801651132821
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Feb 2024 00:23:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=H+JwCy1A;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=27861fde02=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41Q5dYWA011400
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Feb 2024 08:23:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=LFp8NwuHfyADa2JD41JMeS+C96Ybudxhi6kXvEerABw=; b=
	H+JwCy1AFeoqgyFAdOQjAwi+/W+kXY3vx32OQiGxEg3VL3dljIxcyRUcn331FELK
	tyu/Kl9v9A1TqYG4uimBL+x5XewKVdLjicJdYS1i+QN6Wp+J+SpUIXMxuWTvdHTx
	FHlhkPTL+19Enp3Zn3Ie6bGmKGef9hv2x+4SQTsqgcpWawcHtlxt5H21Mejckbt+
	QSvExFSEQYRGFyfxjHtI7gCpOeW4P/qthlpr92VldnZcZmNkVyevgtP/lMhSF19p
	1B9ZgfVCekyCzOj064Q39GmS/0oYcs3RAzfsY6a1ObUmSYw+NeeTbsOtmVSEjgL+
	mhonyrib1XNDuJXGvZ+0nw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wf5nx1pdu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Feb 2024 08:23:20 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 41Q8NKlA012253;
	Mon, 26 Feb 2024 08:23:20 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wf5nx1pdt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 08:23:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NXsM3o+RdZ2KkuMQC2b3DYSp6UStYsjbj/2m97Q6CA1FwLnHxincs4qy0izAhgme7+jBayRsDU36LBUTdJjF9DR1QxuAeDCWVVuAOOb/GQk8ZWTmR5wnt3Kci/g7dxD0igDrisytUfwlC19z2yrHkDEXT4byF3Of90a/JgCDLTilSUMLucegYPp5bHXm4ytIldyG1xXDgtgU1kbtiTpk7W6g+xaimvnF0j81BKBWqkzaGdYZ9wQ68UkudT+ERLXHuSlBm2SQavQcFReIjnPzImjGWLcAGZfZ7CfEV83rGu19nL2cxMTODH4t7RRGPlmTXujdced+/9OUIkt7Phi3xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LFp8NwuHfyADa2JD41JMeS+C96Ybudxhi6kXvEerABw=;
 b=dlGX/xVsV7T0f26bHCfvtRenFaWYZHTQ85P7CDtftugfLf+5RMzAPJL+lK7r9NGoS2REiBpOYEbaegv1yfTdIBhDuET4xd7Om32ye2uhcRGJHTvadEMSf4hmNC9yGN7AIGVB42Gsc5z+jYV+mtWJ0BzBg+xXgYVRTcowXp58HmmK34AYGP6iPRVRjK2wlfTh24VUv0FTyA1VUVIPrOOb7+sbJ9nEu2mkEiHr3xRct89Az/PCO7EvfGZ4rA82Dv/U3yVP3aiQggJ2NzePx+HczulieQB892nU2bXPOlNw19lWDq9U9E1ovo4XBF2kDrixYWXe+ouJ+yrdp2NheZp+Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by SA3PR11MB7556.namprd11.prod.outlook.com (2603:10b6:806:31f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.23; Mon, 26 Feb
 2024 08:23:16 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b792:3207:f838:98a1]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b792:3207:f838:98a1%4]) with mapi id 15.20.7339.009; Mon, 26 Feb 2024
 08:23:16 +0000
Message-ID: <c07e2075-6784-41b9-a3de-f62b394af3b5@windriver.com>
Date: Mon, 26 Feb 2024 16:23:11 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] mariadb: Upgrade to 10.11.7
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20240222070315.346679-1-mingli.yu@windriver.com>
 <CAMKF1squeo+teS06KUSKaweeYQcVRYSQnCVEF8rV99JFJwRDyQ@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <CAMKF1squeo+teS06KUSKaweeYQcVRYSQnCVEF8rV99JFJwRDyQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCPR01CA0191.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::16) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|SA3PR11MB7556:EE_
X-MS-Office365-Filtering-Correlation-Id: 65ed61a0-2f0a-49bb-1925-08dc36a42e65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SdHyXD/KfaE+7VISkQjoeykMRteEy8dP62c+kPy/cqz75VgLPb1/N2mBNLDt50h7jt2AK8hM5IXdZNQMVQXJ9haYRNBPz5VMMPdX3dyWzTqI4qtTF8t9goGsO6tDETZ1/mBcz9l8pOpFv4Fki9e8zN7c+TOQJwlkQD8VB0EkC9nMiXNDk7kQLK8cRQPD1HhqkgTEEXbjqZ2TcXbnvQnzShx8EB/IUhl2mW0z4AU7hSu4m73wYWOSDx6O+GQvcr+79ir7Ce5KWd6tcJhBbgT89fodVMFhq5DSyJ4SGejVdXkNYxipQJykVihcm1c2ZAyQbvReHDtGEiOd6KHP3AFdMUsN6Vo/DY+KJQfHnm7VpbNC10BPLyKJEg2Gv6J5GbYHFhBpVzhvQlhqik5Xy3dfDqNIc+X3tlOECWc6uQu1aNaJqAgBnqfJpD+dOQwHPBXWipEQgnOTVq8VMfEAJFmY3xala7KKZKyM+0NLbqmKDXCHYesBj7CUhpiS1zAZkBBevUXrTcWVxkm91Jvw3r1eX5JdsnKO03bBi0GEKA3I8EcTee/PwR3mUGYuPt0l4OtB/IHx7L2P45CkHEPLRwNU7QpZg5iHjafzhUUKKQFLWs5gMkT12CmpA3z2PabAeRpvOm5M4oE25x2GvCcW/1foyA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(230273577357003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Zm9JQm1BODUrdEJnRGpIamI3ZHNLeGlEYVU1OTVBMzhpU3UrQTJqRStoNk9l?=
 =?utf-8?B?TGh2V0ZOTW9URFBrOXFYRmtRb1hYaE91azQ3dGVZUHY2TWs3dzRLUnR3dXZT?=
 =?utf-8?B?Q3BDdk9TUU9mUVNRaDJKd2t5b3JQRkw2K1JCcnphTU13MTBMVldGZndndXZN?=
 =?utf-8?B?TFBKaXBDdzlQUURNdXVvYUJHUFJoa01YT3gyTW9aSjVmN2d3T3dhRFpGTkJQ?=
 =?utf-8?B?MEFyL21kTE1zV0lmMnB3VFJjbXZzNTB2bUdkaVRIQW4ydG1MYy84RmwrZmVl?=
 =?utf-8?B?alVSUk1uWHJQNW55M25HcS95c0xmOEswZ3NySHlSeEU2T3pLaW9ZTlJtUG0w?=
 =?utf-8?B?cjJmeEdHbnlYZVRONGJuQUF5Y0luMTZrTWcvdXM3bjRMaUgzcHM4azRtKytx?=
 =?utf-8?B?UCtHMnNtOVk4ejIxZ1ZTUTd1NVlMTmRBaVQyRWozbzd2bkJZdTNPNlJTOGor?=
 =?utf-8?B?ajB1UEZOa25YbzVlRUE1R3I5YXNLcDdncmVYVkVQRHFveFlhb1MwaGJSYkVT?=
 =?utf-8?B?MGRGSmhINTRLeE42ZkFIMklDNVY2VzQ0OFVpc3IzeHdDaFJuSjFwTWE5MG5v?=
 =?utf-8?B?Y1FsSlNnKzU2REFENUNtM0UrQnpsU0JpMDQ5WHBBbnhJRHpKUVdFYWREK0U5?=
 =?utf-8?B?Uk1kdCszRmhPMFRNcitMaGlHdFJDa3BKYmVZZURhaGhhem1DWWtyeElxNzJR?=
 =?utf-8?B?MmdQQXZ2eXIyNFF3YlFXRGk3ckJ4QlJMSGZGc0ZBMEtQQjRHdW40eHY5d3Na?=
 =?utf-8?B?eEdzaktiVFNKSjFkUWE0MS9vcXBFTVlZd3Q4VW5FbXBLdEk4U0EzMU5LczhQ?=
 =?utf-8?B?QThhbkM5VjE3U0pSM0lqMlhsVTFEbXZ3a2VzNCtQUkt1bit4QVlRakJCS0l0?=
 =?utf-8?B?SVpGVnhzMTRsS3NQc0JzZ01nNmpiWjBlbWZBQ0RhaHRSbWMrREVMakFBRW1x?=
 =?utf-8?B?Q21zZUFnTVY4Ujc5VVZzVzd1SjJNcVN5S2dqZUpuUlUyVjBCUjFPbzB6ZTlu?=
 =?utf-8?B?Zy9aOWxmdFRlSnQ5VEhySXF4ZW9MbTd2SWkzZjdXQ2wxNUx5MkYyT0l3Zkk5?=
 =?utf-8?B?R2g4Mm8wKy9vMktiSTh5dTJYa1I1YjZlQVdzK2NPblZybFp4Qkd3Ym5Fc0dB?=
 =?utf-8?B?OUpxLytyU3BmcHpEWTJHb1d6RlN1SnBBR0Q3Mk5SWHNiRjZIVDg1R0ErczRP?=
 =?utf-8?B?aDBEbFhEQ2lJa3A0UjA2dDZsT3o3S09VQTcrNFRQNWIxWDhQZ2FhMjNTYUFi?=
 =?utf-8?B?enBFamNwSTZyZzAxaUY2aFRRMG10QWFSTGdYcHp0TWh5NDJlYjZOdVJoQmlp?=
 =?utf-8?B?NXBXRDRGVm1xcVdpQzcxYjhDRkl4NjNTOUZ3VGVTT1pPcndBY1Bpb0UyTWdm?=
 =?utf-8?B?VVh2NTRoNmFrMUxjU3UySlZrK25WdWM2bGR0STk3YzlRU0J2cGo0K2xJY1Iv?=
 =?utf-8?B?VmZCeHlpUm9CcnlJSlRpVlo0bkc2RzlGQlZNQWE3Tm42SDFuUXdUdkJLQWFY?=
 =?utf-8?B?cTNVVzJlSjZTNUtyc0swVG1wTjYzYm1SZkJ4WjBobSt3NEtiSjNZeXpweWN0?=
 =?utf-8?B?c0djWVQwSUVKUm9JZlNNQTlSQzVwUENxV1djWFBsVjFFclEySVlOekRtRW5Q?=
 =?utf-8?B?MVc3T0RZVCtFMy9XMUxIcnNFemg0Z1FZb09PYXpHaWkzNkFPYUZWQnQ4UDA5?=
 =?utf-8?B?TldPZXFzM1NSbm1YV3ZtajhPZUdYRUpxWHljQkluaytBWUI4TCsxSjVJNCs5?=
 =?utf-8?B?dzZzb0pGQ3BRQ0dIWi85L2VudjZQakk0V3IxYm1vU09Ydk9NaXhFdmczY3g1?=
 =?utf-8?B?RFZaYU5Mc3ZtUkdxK1ZYY1F2b1pEazV5ZnlwajlWYkxSNG5jTXlKekt2dEFJ?=
 =?utf-8?B?MVExL3dDcGJESzlkdkhTckM4a2h1Q2g2U2dsbWdSZ1VQWFZjejAreGVDeHlM?=
 =?utf-8?B?WllqUVNaWld4ZWx3eXR5cnloUDJaZXpsdWVOd0FMaGFCdXZ3MSsxU2pHT0ZU?=
 =?utf-8?B?UFFHMnVBV04xUFpVRDYzYTZBazNFOW9aWm55S2NRMU1MSkljcHZCQ3BBWnZs?=
 =?utf-8?B?K3lwYkRJM1piNVVKUTlIZTUxSlprdytVTW9JYXdKbFdjeVRlcjFEMFRLK0U3?=
 =?utf-8?Q?AD053Bh/uLKg4Tda6U+cxUyG+?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65ed61a0-2f0a-49bb-1925-08dc36a42e65
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 08:23:16.2534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1YNuuy+RbMhtwXR3DAlvm63FBo003IAXSjfOL+OmqP6vCVnCOFWsZrhD0CMRIqg6CNmZO2AHTTbDWdgHwUQh4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7556
X-Proofpoint-GUID: AF3OMuKg5J7ig28rEUFPBbkgcht8HZll
X-Proofpoint-ORIG-GUID: FZPnA285RCFk8ognmoQtlv9NKqYrO6rb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_05,2024-02-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402260062
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 41Q5dYWA011400
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Feb 2024 08:23:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109029



On 2/22/24 23:18, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>=20
> fails build on arm
> https://errors.yoctoproject.org/Errors/Details/754269/

V2 is incoming.

Thanks,

>=20
> On Wed, Feb 21, 2024 at 11:03=E2=80=AFPM Yu, Mingli <mingli.yu@eng.wind=
river.com> wrote:
>>
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> As the change [1] introduced in 10.11.7, there comes below configure f=
ailure:
>>   | -- Performing Test HAVE_SYSTEM_LIBFMT
>>   | CMake Error: try_run() invoked in cross-compiling mode, please set=
 the following cache variables appropriately:
>>   |    HAVE_SYSTEM_LIBFMT_EXITCODE (advanced)
>>   | For details see /build/tmp-glibc/work/core2-64-wrs-linux/mariadb/1=
0.11.7/build/TryRunResults.cmake
>>   | -- Performing Test HAVE_SYSTEM_LIBFMT - Failed
>>   [snip]
>>
>> Considering [1] is mainly used to test fmt 10.0.0 failure and we use l=
ibfmt
>> 10.2.1 now, so define "-DHAVE_SYSTEM_LIBFMT_EXITCODE=3D0" as workaroun=
d [2] to
>> fix the above configure error.
>>
>> [1] https://github.com/MariaDB/server/commit/b5c367cd88e37091ab5f8dab0=
396c01c97d037e2
>> [2] https://jira.mariadb.org/browse/MDEV-30694
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>   .../{mariadb-native_10.11.6.bb =3D> mariadb-native_10.11.7.bb}   | 0
>>   meta-oe/recipes-dbs/mysql/mariadb.inc                          | 3 +=
+-
>>   .../mysql/{mariadb_10.11.6.bb =3D> mariadb_10.11.7.bb}           | 0
>>   3 files changed, 2 insertions(+), 1 deletion(-)
>>   rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.11.6.bb =3D> mar=
iadb-native_10.11.7.bb} (100%)
>>   rename meta-oe/recipes-dbs/mysql/{mariadb_10.11.6.bb =3D> mariadb_10=
.11.7.bb} (100%)
>>
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.6.bb b/met=
a-oe/recipes-dbs/mysql/mariadb-native_10.11.7.bb
>> similarity index 100%
>> rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.11.6.bb
>> rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.11.7.bb
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-d=
bs/mysql/mariadb.inc
>> index 25dc15b46..9be8ef3eb 100644
>> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
>> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
>> @@ -25,7 +25,7 @@ SRC_URI =3D "https://archive.mariadb.org/${BP}/sourc=
e/${BP}.tar.gz \
>>              file://0001-Add-missing-includes-cstdint-and-cstdio.patch=
 \
>>             "
>>   SRC_URI:append:libc-musl =3D " file://ppc-remove-glibc-dep.patch"
>> -SRC_URI[sha256sum] =3D "1c0163463e98d71f4780741611a40981eee2bc44d3926=
01ca49bbf948d04dd67"
>> +SRC_URI[sha256sum] =3D "5239a245ed90517e96396605cd01ccd8f73cd7442d1b3=
076b6ffe258110e5157"
>>
>>   UPSTREAM_CHECK_URI =3D "https://github.com/MariaDB/server/releases"
>>
>> @@ -96,6 +96,7 @@ EXTRA_OECMAKE =3D "-DWITH_EMBEDDED_SERVER=3DON \
>>                    -DMYSQL_DATADIR:PATH=3D/var/mysql \
>>                    -DCAT_EXECUTABLE=3D`which cat` \
>>                    -DSTACK_DIRECTION=3D1 \
>> +                 -DHAVE_SYSTEM_LIBFMT_EXITCODE=3D0 \
>>                    -DCMAKE_AR:FILEPATH=3D${AR}"
>>
>>
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.11.6.bb b/meta-oe/re=
cipes-dbs/mysql/mariadb_10.11.7.bb
>> similarity index 100%
>> rename from meta-oe/recipes-dbs/mysql/mariadb_10.11.6.bb
>> rename to meta-oe/recipes-dbs/mysql/mariadb_10.11.7.bb
>> --
>> 2.25.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#108982): https://lists.openembedded.org/g/openembe=
dded-devel/message/108982
>> Mute This Topic: https://lists.openembedded.org/mt/104504689/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

