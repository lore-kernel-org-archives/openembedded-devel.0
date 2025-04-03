Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5EA8C3600C
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 08:20:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.8334.1743668433957893367
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Apr 2025 01:20:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6188a6bf9a=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5335o2Jo014662
	for <openembedded-devel@lists.openembedded.org>; Thu, 3 Apr 2025 01:20:33 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45sg0r8ejv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 03 Apr 2025 01:20:33 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5338JMTE004820
	for <openembedded-devel@lists.openembedded.org>; Thu, 3 Apr 2025 01:20:32 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2045.outbound.protection.outlook.com [104.47.55.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45sg0r8ejs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Apr 2025 01:20:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nAVTNKpCBx1ujJFjHWJj8owZbXsbI56AfLkUSbXuacute3oWgPmD62XcR7ZkFu2PZdCc7RG//nlVN+mBrvVo+nn39zRLb95VMQy3ACwm8LyZt+39YqVITyPvWHpYZiJEqKqYCIFGVfR7YlZ3nAIegvk/LTurRdSGv2efwUuKLY4whvfPBo/Eg1s0YNvODgmjLccz/VlletDk3xCJRaVIlV/FH1ND3275ynpKlC/TUmxBlh/1H49NKV7VOwS90dXO6R9Sgxm4Ct/I3L1tV1nDixuFbhGIe8m4FsF73VSELWaQDwRBNQP0Yzgbq0fpscR4L6LHkMWYeGjBzxtVE5NYQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KXZun8xzjsU2/GOgxiximn47FQgRDmI1x8S443ZToLo=;
 b=I8KQsC1mLws4a9DpsHTxZIJQkvc3kzTba3G2EaTHjE/2HNtGmJkuedQfbTZaVdKja+sISaPiztdlDKavV5oXEGUnajHypGDn/yI7+I12SguXZzCPKoy7srQD40wz/MkVXOa4JB35tJEv7uRc0xXd6HWdWO8gAqrivSR4ZQpbdoYarV6kw5Sz593SOSJjYoaDP74fB+W0doqmIPsn95hWayRa3uTL2jY2PUF62F2CQ9lQe+k/v3SEI/kkR5uFyiJagzhO8+/KeSBQBKNe7sJQLwNIR6NNbngsvM6R1buEMhaMryrFB8Dp6MiX2VOnuPOdu2AwV5i8J3OtmEWRWEWxqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MN0PR11MB6159.namprd11.prod.outlook.com (2603:10b6:208:3c9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 08:20:28 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%7]) with mapi id 15.20.8534.043; Thu, 3 Apr 2025
 08:20:28 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: "Chen, Qi" <Qi.Chen@windriver.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: Khem Raj <raj.khem@gmail.com>
Subject: RE: [oe][meta-oe][PATCH] version-check.conf: add mechanism for
 checking version mismatch
Thread-Topic: [oe][meta-oe][PATCH] version-check.conf: add mechanism for
 checking version mismatch
Thread-Index: AQHbpGx4JqE7ItAtIkunMJSYH1fXnrORlz0w
Date: Thu, 3 Apr 2025 08:20:28 +0000
Message-ID: 
 <CO6PR11MB5602496C703E33D72B4615CFEDAE2@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <1832BF4A94D70764.17459@lists.openembedded.org>
In-Reply-To: <1832BF4A94D70764.17459@lists.openembedded.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|MN0PR11MB6159:EE_
x-ms-office365-filtering-correlation-id: 699a1732-d2a0-48bd-570e-08dd7288647b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018|7053199007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?3vOOTu7YRwcKsUNlYCq1Eh7f5NJqNdkoPeFRH1Y+2jTWxcqucQcOOXwoOu4U?=
 =?us-ascii?Q?d6BOxXw1zckJCCSPr8BjH6K7MOefbTe0aRHiadWHyaeJwjTv3NHB8/XBROoA?=
 =?us-ascii?Q?ciC5nICSqkVCgt2wCiTCZgghKta7bdOeX0GxtDCht6+9q5Qe38aiOfeZqbvN?=
 =?us-ascii?Q?NZwjlCnPniIbmv1E+VLHqvMaOf8bSUvvAKTz7nIcyhqbYIHkfakWzUegN684?=
 =?us-ascii?Q?BKjnFmR4+KkksTxnI4HK5ADrkGHr4dJ9YN7jhSu2dE+GGi56uzfgLbsce/QB?=
 =?us-ascii?Q?A+FfwiIBVsagbVEJvoGgCfUauBsvFfcKK+tr+T+UlR8KfC1mPpAHQ1+IGmtB?=
 =?us-ascii?Q?wmaA/O72SYomFPUeJvGM/NPbIZqXXzhyUYDKwvWVdCq1qT/3H0b/JjvdhieG?=
 =?us-ascii?Q?4Nuf9nGQJvRS3zAGtHG63QhKqKhhWJLj6RQaYMIbm+LtSg9UqZD5AQX00ahi?=
 =?us-ascii?Q?34qEcgWW5f8GA8kYaDy+fKlIg58BjXWh3psoHG7PwoV8IVPMFQtidWytrRPU?=
 =?us-ascii?Q?ELN0COBIOF8BT2Ziusk8H8T/O/1yIjgHtgGOI1VQEOu/+PFsfUdEZK70AapY?=
 =?us-ascii?Q?DYngSzZXd6jzRXuMZAeDf0asmt6rjoUUvT5GkLA8i8k72pEm08YITx8Zk+pD?=
 =?us-ascii?Q?UE2CJGuKv6mObxznP74rVGVgVIgQ6D3lhq5/URs/4AZQp2lVfV170f/z9R6J?=
 =?us-ascii?Q?qY0Jy9fcMG1UFXf2VCNfL//gOjNzX77JWIj6K3H8wQWzT+PTmfCnEL2kjTsA?=
 =?us-ascii?Q?rHhcfGjQ8QPCEqTlUOn5sS3iFjvRsQmshCInjuWtPM1YrKYoPatofVG1FNlv?=
 =?us-ascii?Q?nuABqwK8LFF5uYm71Zmk7dEJAj4FYGu5ztudmDCqzOfPwZhpOMJyHfwusNb7?=
 =?us-ascii?Q?Cr18iYMaSZ/z4RGYHs+xsDzwRoFn5DxLP+flIBgtqAZAmmUDfbV1m23PtRNB?=
 =?us-ascii?Q?uK6j/Gvayi7kb3bZJ+GW7NcW3Q6JNVp37zNSogheT8nhZxiaXf49GaMPaycI?=
 =?us-ascii?Q?Epwd6Pqfgf3/ijBxxn2oN0xLTbAAwiIeKz4BdWLVtjKO+Ne9AMoRmc1QU36U?=
 =?us-ascii?Q?QKBenXhbZQDTUYvDRSSBukVrLk51bKS3qAzP3iM9bJpyQXWcru064dkhIIQ0?=
 =?us-ascii?Q?N7IZwb3YzeG5MZJXhMGF6FjRb5Yo64wFCDjFXQBlIkAj4gPVl9yPnmMudW4u?=
 =?us-ascii?Q?yQxyI3qqFjg3H6SsqtfbJec0Kq9VJDMmAD9V5M3zNXR9IyfU1GiMsaWIbEY3?=
 =?us-ascii?Q?+zMXHKTzTthGbWs+tnQuy/ifgtbHVaEmKCeQXoLSN5ULp7vrUAiNW7DbPBSD?=
 =?us-ascii?Q?gifaI8mCtqhVuQkdGG9n1ns5fBGpCMvsWazfYPKEGYDphd8v7vnEIBVpNIp4?=
 =?us-ascii?Q?A7VYZXEmwWEDAw3WFXKQKfceCchR6eLG2ooLXm+yCqR3axz7kRhkc4ADA1Pv?=
 =?us-ascii?Q?Mxw753J/cfjiYGVbh4XqrMXuceZAlYCz?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?ZnIT2fdgvDwYS8i3kNW1HH3R10MZvErZikzjCWpSmhma3EdL8hkt+XEQGTkY?=
 =?us-ascii?Q?CvHgkITZelthdCPsK/EWLAoZA2DnwNfPdyEIdkDUosQZBxMDsB52ManBkcKw?=
 =?us-ascii?Q?tuVtYj3z0QoLq9G+3kXuG9HEvcb8uZBXzHYcsaPs8aGMLKy67UjyPVMLRGdv?=
 =?us-ascii?Q?vIHECSAcrusKAsYj//Q4QpXlLmy0qWqFbXfo31ubE589eBoBKfilojEoH2NW?=
 =?us-ascii?Q?7yZRMNphI+8CIacB/YagPhL1dSDuTQ6OZCk/KFH9MJ0w/v3gQDuwJkhe9fot?=
 =?us-ascii?Q?ILbKp9QrQxR0hYAaWSvRvVxALvgfqozmHZirtMk9WKncldi5sgWK2dGlJ0Sj?=
 =?us-ascii?Q?ReKWVAptue4R9UiEF65LrXQZx9+M0avxPdY3vAp/W65DKCd3YoZWyuCxmGao?=
 =?us-ascii?Q?Euzx6rtoaoF8oorlX/fZoqNHSNmkfnX1q1vLpUkgQ3EKjCR5aaEsuBheXJNu?=
 =?us-ascii?Q?MyqNa3/VrCOZrpVgXdsiEZrVA6u/9YTsPA4shDBvGt9iLl63ykLJaBYDRMO2?=
 =?us-ascii?Q?qnqRA9GLa4f7MHu4LRmZE3UT8q0ZnOBBCHUG0uplJUM3DvkWXYuTuF1aVrZk?=
 =?us-ascii?Q?+CI7iYjF6wvxxIieRcEjKUnSZ0n5jeZyjEAyY/omVQ0uastQAaZTwethRc2a?=
 =?us-ascii?Q?m/c7slGqeVBTanUAGm4l2VsseBywzMEcjODFot4Q3NcwjyvQm//FHdYSiiK8?=
 =?us-ascii?Q?yjDsZSumnG4k++OMLp4Goj43b5/Ed87MZdJ1PVY4m++QHQQhuiZhosCYbhze?=
 =?us-ascii?Q?Ir4BZ7dmMEx25PVNoDYFxBS+gXxSZJmrQCajHbwEECiiq8NKN048Sa511N0M?=
 =?us-ascii?Q?oEjtR8DxVmUfeyqGIxMWtuOEaLMf3qZBUsKiMFy1FAYCjgtiGyB6UO+yutM9?=
 =?us-ascii?Q?EuA4/qFye3LLf2pkd9+dMxHBnGBvQHiXiS1cy6WKwMtBpfGk89+A3XjCSfGY?=
 =?us-ascii?Q?27QdaVWOUOU2StQJI4SXtRZ7KyVJekZNp11n1VzYEp7IVlB+BvHJGLxr9d7T?=
 =?us-ascii?Q?zO7e3Ji5uAICSZSpbwqaZFldfaIZD4SgJyrtRgCM1dGCE5nLrjWhuu24aQ5U?=
 =?us-ascii?Q?hL30F9luxT77HU4Q3OjhTqyHOcEJIq038TPOwf+I0I4n1EwlK3miwL9MpPhZ?=
 =?us-ascii?Q?BYRMie+5zs8OWofYiCOMeMnWou2tsL51UBx8pNxm5OmfsHA+2AxOJ1NwvgmC?=
 =?us-ascii?Q?OjisBooKuc8zYP+pJZtTUAZ9nsxBdrEHJCP4oNTO21Dy8fVC9Zn7XrdMfa2W?=
 =?us-ascii?Q?vU6GMiQRKxv+hXIeGt1/MHJTJw1Hke1Dh8yFWYxbqxBsOlzn/OJN+VgW2zlV?=
 =?us-ascii?Q?EPhBTu2lD9rOsmNwuK6kkXzSXXa1PwTkBU+ky7boMrrLjd/yOxbwkjEAm+Cf?=
 =?us-ascii?Q?n+/Q0DlzqMNBe4BuX/ooi9c2ryzq8Nb8qC8HrACIS7x0gHMC18BSNlNhQv9X?=
 =?us-ascii?Q?X9e9zUJYvvZYxxY/AdV5gl6GhIK6DJA2uPWQwvxf+iq8q7ZyY2GcO3E5nl80?=
 =?us-ascii?Q?n36xQpsMKuOyef74bUU2VIHVB3wAtsRYkgM8Vf5CSw2bwSqGBTt09w30lZvI?=
 =?us-ascii?Q?h8K6peuciyOlrRxRUlPJr4pHiCDuLvt39e0e04M4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 699a1732-d2a0-48bd-570e-08dd7288647b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2025 08:20:28.3368
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6eLPC77zY+br0a4dhHoO/vQ44E/+fD8yo+MNVLENoOJjCTpf+5hiOqZWnPM3HLfOKZhxdNptO6BjaUgiDKo/Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6159
X-Authority-Analysis: v=2.4 cv=HoF2G1TS c=1 sm=1 tr=0 ts=67ee44d1 cx=c_pps a=R19XVbJ/69TrMGWtO/A4Aw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=_l4L4QwWLC34CJB--uAA:9 a=CjuIK1q_8ugA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 91kb6aNXSz9-Aqv5hu4mUwV8NRz_RRo0
X-Proofpoint-GUID: wV2Cqi7mVEa8UE3R3eJ5aQqZkhhQhLsu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_03,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504030033
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Apr 2025 08:20:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116533

Hi Khem,

Is it suitable for meta-oe to take this patch?

I did a world build for oe-core + meta-openembedded, there are about 80 mis=
matches in meta-openembedded layers. And most of them are valid.
e.g.
"""
usbmuxd:FINAL RESULT: MISMATCH (['1.1.1-48'] v.s. 0.0-547-g01c94c7)
vpnc:FINAL RESULT: MISMATCH (['0.5.4'] v.s. 0.5.3r550-2jnpr1)
wipe:FINAL RESULT: MISMATCH (['0.23'] v.s. 0.24)
wireguard-tools:FINAL RESULT: MISMATCH (['1.0.20210914-dirty'] v.s. 1.0.202=
10914)
zlog:FINAL RESULT: MISMATCH (['1.2.12'] v.s. 1.2.16)
"""
Use the above usbmuxd mismatch as an example. It comes from the following s=
etting in usbmuxd_git.bb:
PKGV =3D "${GITPKGVTAG}"
Such setting is quite weird. I suspect it's something we need to fix.=20

PKGV defaults to PV and may be set differently for special recipes such as =
perf, and it's PKGV that gets into the final package's metadata. So check-v=
ersion-mismatch.bbclass checks PKGV, thus detecting this mismatch.
As a comparison, usbmuxd on Ubuntu22 is of version 1.1.1.

"""
$ rpm -qi tmp/deploy/rpm/core2_64/usbmuxd-0.0+547+g01c94c7-r0.core2_64.rpm
Name        : usbmuxd
Version     : 0.0+547+g01c94c7
...
"""

Regards,
Qi

-----Original Message-----
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> On Behalf Of Chen Qi via lists.openembedded.org
Sent: Thursday, April 3, 2025 3:45 PM
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] version-check.conf: add mechanism for checkin=
g version mismatch

From: Chen Qi <Qi.Chen@windriver.com>

Add a mechanism to check mismatch between runtime version and build time ve=
rsion.

To use, add the following line to local.conf:

  include conf/version-check.conf

Ideally, layers will have their own conf/version-check.conf to establish so=
me baseline, so that any future warning indicates some error. In such case,=
 users can use include_all:

  include_all conf/version-check.conf

The basic idea is to use qemu to run executables at build time, extract pos=
sible versions, and check if there's a mismatch found.

Python meta data and .pc files are also checked for quick match. This is be=
cause such info are also easy to be checked by users.

check-version-mismatch.bbclass is the class that does the actual work.
A new variable, CHECK_VERSION_PV, is introduced. It defaults to ${PKGV}, bu=
t also allows override. This allows us to handle special cases in each laye=
r.

version-check.conf is the configuration file that makes this functionality =
easier to use and draws some baseline. It contains some override settings f=
or some recipes. With these overrides, all recipes in oe-core are handled w=
ell. All warnings are valid warnings.

Note that 'ps' is added to HOSTTOOLS in version-check.conf. This is because=
 we need 'ps' to find stale processes and then clean them.

The warnings are like below:

  WARNING: time-1.9-r0 do_package_check_version_mismatch: Possible runtime =
versions ['UNKNOWN'] do not match recipe version 1.9
  WARNING: python3-unittest-automake-output-0.2-r0 do_package_check_version=
_mismatch: Possible runtime versions ['0.1'] do not match recipe version 0.=
2
  WARNING: pinentry-1.3.1-r0 do_package_check_version_mismatch: Possible ru=
ntime versions ['1.3.1-unknown'] do not match recipe version 1.3.1
  ...

There will be a data directory containing all details: tmp/check-version-mi=
smatch.
This directory contains detailed data for each recipe that is built.
If users don't want it, they can set DEBUG_VERSION_MISMATCH_CHECK to 0.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../classes/check-version-mismatch.bbclass    | 399 ++++++++++++++++++
 meta-oe/conf/version-check.conf               |  22 +
 2 files changed, 421 insertions(+)
 create mode 100644 meta-oe/classes/check-version-mismatch.bbclass
 create mode 100644 meta-oe/conf/version-check.conf

diff --git a/meta-oe/classes/check-version-mismatch.bbclass b/meta-oe/class=
es/check-version-mismatch.bbclass
new file mode 100644
index 0000000000..7b46151b03
--- /dev/null
+++ b/meta-oe/classes/check-version-mismatch.bbclass
@@ -0,0 +1,399 @@
+inherit qemu
+
+ENABLE_VERSION_MISMATCH_CHECK ?=3D "${@'1' if bb.utils.contains('MACHINE_F=
EATURES', 'qemu-usermode', True, False, d) else '0'}"
+DEBUG_VERSION_MISMATCH_CHECK ?=3D "1"
+CHECK_VERSION_PV ?=3D ""
+
+DEPENDS:append:class-target =3D "${@' qemu-native' if bb.utils.to_boolean(=
d.getVar('ENABLE_VERSION_MISMATCH_CHECK')) else ''}"
+
+QEMU_EXEC ?=3D "${@qemu_wrapper_cmdline(d, '${STAGING_DIR_HOST}', ['${STAG=
ING_DIR_HOST}${libdir}','${STAGING_DIR_HOST}${base_libdir}', '${PKGD}${libd=
ir}', '${PKGD}${base_libdir}'])}"
+
+python do_package_check_version_mismatch() {
+    import re
+    import subprocess
+    import shutil
+    import signal
+
+    classes_skip =3D ["nopackage", "image", "native", "cross", "crosssdk",=
 "cross-canadian"]
+    for cs in classes_skip:
+        if bb.data.inherits_class(cs, d):
+            bb.note(f"Skip do_package_check_version_mismatch as {cs} is in=
herited.")
+            return
+
+    if not bb.utils.to_boolean(d.getVar('ENABLE_VERSION_MISMATCH_CHECK')):
+        bb.note("Skip do_package_check_version_mismatch as ENABLE_VERSION_=
MISMATCH_CHECK is disabled.")
+        return
+
+    __regexp_version_broad_match__ =3D re.compile(r"(?:\s|^|-|_|/|=3D| go|=
\()" +
+                                                r"(?P<version>v?[0-9][0-9.=
][0-9+.\-_~\(\)]*?|UNKNOWN)" +
+                                                r"(?:[+\-]release.*|[+\-]s=
table.*|)" +
+                                                r"(?P<extra>[+\-]unknown|[=
+\-]dirty|[+\-]rc?\d{1,3}|\+cargo-[0-9.]+|" +
+                                                r"[a-z]|-?[pP][0-9]{1,3}|-=
?beta[^\s]*|-?alpha[^\s]*|)" +
+                                                r"(?P<extra2>[+\-]dev|[+\-=
]devel|)" +
+                                                r"(?:,|:|\.|\)|-[0-9a-g]{6=
,42}|)" +
+                                                r"(?=3D\s|$)"
+                                                )
+    __regexp_exclude_year__ =3D re.compile(r"^(19|20)[0-9]{2}$")
+    __regexp_single_number_ending_with_dot__ =3D re.compile(r"^\d\.$")
+
+    def is_shared_library(filepath):
+        return re.match(r'.*\.so(\.\d+)*$', filepath) is not None
+
+    def get_possible_versions(output_contents, full_cmd=3DNone, max_lines=
=3DNone):
+        #
+        # Algorithm:
+        #   1. Check version line by line.
+        #   2. Skip some lines which we know that do not contain version i=
nformation, e.g., License, Copyright.
+        #   3. Do broad match, finding all possible versions.
+        #   4. If there's a version found by any match, do exclude match (=
e.g., exclude years)
+        #   5. If there's a valid version, do stripping and converting and=
 then add to possible_versions.
+        #   6. Return possible_versions
+        #
+        possible_versions =3D []
+        content_lines =3D output_contents.split("\n")
+        if max_lines:
+            content_lines =3D content_lines[0:max_lines]
+        if full_cmd:
+            base_cmd =3D os.path.basename(full_cmd)
+        __regex_help_format__ =3D re.compile(r"-[^\s].*")
+        for line in content_lines:
+            line =3D line.strip()
+            # skip help lines
+            if __regex_help_format__.match(line):
+                continue
+            # avoid command itself affecting output
+            if full_cmd:
+                if line.startswith(base_cmd):
+                    line =3D line[len(base_cmd):]
+                elif line.startswith(full_cmd):
+                    line =3D line[len(full_cmd):]
+            # skip specific lines
+            skip_keywords_start =3D ["copyright", "license", "compiled", "=
build", "built"]
+            skip_line =3D False
+            for sks in skip_keywords_start:
+                if line.lower().startswith(sks):
+                    skip_line =3D True
+                    break
+            if skip_line:
+                continue
+
+            # try broad match
+            for match in __regexp_version_broad_match__.finditer(line):
+                version =3D match.group("version")
+                #print(f"version =3D {version}")
+                # do exclude match
+                exclude_match =3D __regexp_exclude_year__.match(version)
+                if exclude_match:
+                    continue
+                exclude_match =3D __regexp_single_number_ending_with_dot__=
.match(version)
+                if exclude_match:
+                    continue
+                # do some stripping and converting
+                if version.startswith("("):
+                    version =3D version[1:-1]
+                if version.startswith("v"):
+                    version =3D version[1:]
+                if version.endswith(")") and "(" not in version:
+                    version =3D version[:-1]
+                # handle extra version info
+                version =3D version + match.group("extra") + match.group("=
extra2")
+                possible_versions.append(version)
+        return possible_versions
+
+    def is_version_mismatch(rvs, pv):
+        got_match =3D False
+        if pv.startswith("git"):
+            return False
+        if "-pre" in pv:
+            pv =3D pv.split("-pre")[0]
+        if pv.startswith("v"):
+            pv =3D pv[1:]
+        for rv in rvs:
+            if rv =3D=3D pv:
+                got_match =3D True
+                break
+            pv =3D pv.split("+git")[0]
+            # handle % character in pv which means matching any chars
+            if '%' in pv:
+                escaped_pv =3D re.escape(pv)
+                regex_pattern =3D escaped_pv.replace('%', '.*')
+                regex_pattern =3D f'^{regex_pattern}$'
+                if re.fullmatch(regex_pattern, rv):
+                    got_match =3D True
+                    break
+                else:
+                    continue
+            # handle cases such as 2.36.0-r0 v.s. 2.36.0
+            if "-r" in rv:
+                rv =3D rv.split("-r")[0]
+            chars_to_replace =3D ["-", "+", "_", "~"]
+            # convert to use "." as the version seperator
+            for cr in chars_to_replace:
+                rv =3D rv.replace(cr, ".")
+                pv =3D pv.replace(cr, ".")
+            if rv =3D=3D pv:
+                got_match =3D True
+                break
+            # handle case such as 5.2.37(1) v.s. 5.2.37
+            if "(" in rv:
+                rv =3D rv.split("(")[0]
+                if rv =3D=3D pv:
+                    got_match =3D True
+                    break
+            # handle case such as 4.4.3p1
+            if "p" in pv and "p" in rv.lower():
+                pv =3D pv.lower().replace(".p", "p")
+                rv =3D rv.lower().replace(".p", "p")
+                if pv =3D=3D rv:
+                    got_match =3D True
+                    break
+            # handle cases such as 6.00 v.s. 6.0
+            if rv.startswith(pv):
+                if rv =3D=3D pv + "0" or rv =3D=3D pv + ".0":
+                    got_match =3D True
+                    break
+            elif pv.startswith(rv):
+                if pv =3D=3D rv + "0" or pv =3D=3D rv + ".0":
+                    got_match =3D True
+                    break
+            # handle cases such as 21306 v.s. 2.13.6
+            if "." in pv and not "." in rv:
+                pv_components =3D pv.split(".")
+                if rv.startswith(pv_components[0]):
+                    pv_num =3D 0
+                    for i in range(0, len(pv_components)):
+                        pv_num =3D pv_num * 100 + int(pv_components[i])
+                    if pv_num =3D=3D int(rv):
+                        got_match =3D True
+                        break
+        if got_match:
+            return False
+        else:
+            return True
+
+    # helper function to get PKGV, useful for recipes such as perf
+    def get_pkgv(pn):
+        pkgdestwork =3D d.getVar("PKGDESTWORK")
+        recipe_data_fn =3D pkgdestwork + "/" + pn
+        pn_data =3D oe.packagedata.read_pkgdatafile(recipe_data_fn)
+        if not "PACKAGES" in pn_data:
+            return d.getVar("PV")
+        packages =3D pn_data["PACKAGES"].split()
+        for pkg in packages:
+            pkg_fn =3D pkgdestwork + "/runtime/" + pkg
+            pkg_data =3D oe.packagedata.read_pkgdatafile(pkg_fn)
+            if "PKGV" in pkg_data:
+                return pkg_data["PKGV"]
+
+    #
+    # traverse PKGD, find executables and run them to get runtime version =
information and compare it with recipe version information
+    #
+    enable_debug =3D bb.utils.to_boolean(d.getVar("DEBUG_VERSION_MISMATCH_=
CHECK"))
+    pkgd =3D d.getVar("PKGD")
+    pn =3D d.getVar("PN")
+    pv =3D d.getVar("CHECK_VERSION_PV")
+    if not pv:
+        pv =3D get_pkgv(pn)
+    qemu_exec =3D d.getVar("QEMU_EXEC").strip()
+    executables =3D []
+    possible_versions_all =3D []
+    data_lines =3D []
+
+    if enable_debug:
+        debug_directory =3D d.getVar("TMPDIR") + "/check-version-mismatch"
+        debug_data_file =3D debug_directory + "/" + pn
+        os.makedirs(debug_directory, exist_ok=3DTrue)
+        data_lines.append("pv: %s\n" % pv)
+
+    got_quick_match_result =3D False
+    # handle python3-xxx recipes quickly
+    __regex_python_module_version__ =3D re.compile(r"(?:^|.*:)Version: (?P=
<version>.*)$")
+    if "python3-" in pn:
+        version_check_cmd =3D "find %s -name 'METADATA' | xargs grep '^Ver=
sion: '" % pkgd
+        try:
+            output =3D subprocess.check_output(version_check_cmd, shell=3D=
True).decode("utf-8")
+            data_lines.append("version_check_cmd: %s\n" % version_check_cm=
d)
+            data_lines.append("output:\n'''\n%s'''\n" % output)
+            possible_versions =3D []
+            for line in output.split("\n"):
+                match =3D __regex_python_module_version__.match(line)
+                if match:
+                    possible_versions.append(match.group("version"))
+            possible_versions =3D sorted(set(possible_versions))
+            data_lines.append("possible versions: %s\n" % possible_version=
s)
+            if is_version_mismatch(possible_versions, pv):
+                data_lines.append("FINAL RESULT: MISMATCH (%s v.s. %s)\n\n=
" % (possible_versions, pv))
+                bb.warn("Possible runtime versions %s do not match recipe =
version %s" % (possible_versions, pv))
+            else:
+                data_lines.append("FINAL RESULT: MATCH (%s v.s. %s)\n\n" %=
 (possible_versions, pv))
+            got_quick_match_result =3D True
+        except:
+            data_lines.append("version_check_cmd: %s\n" % version_check_cm=
d)
+            data_lines.append("result: RUN_FAILED\n\n")
+    if got_quick_match_result:
+        if enable_debug:
+            with open(debug_data_file, "w") as f:
+                f.writelines(data_lines)
+        return
+
+    # handle .pc files
+    version_check_cmd =3D "find %s -name '*.pc' | xargs grep -i version" %=
 pkgd
+    try:
+        output =3D subprocess.check_output(version_check_cmd, shell=3DTrue=
).decode("utf-8")
+        data_lines.append("version_check_cmd: %s\n" % version_check_cmd)
+        data_lines.append("output:\n'''\n%s'''\n" % output)
+        possible_versions =3D get_possible_versions(output)
+        possible_versions =3D sorted(set(possible_versions))
+        data_lines.append("possible versions: %s\n" % possible_versions)
+        if is_version_mismatch(possible_versions, pv):
+            if pn.startswith("lib"):
+                data_lines.append("FINAL RESULT: MISMATCH (%s v.s. %s)\n\n=
" % (possible_versions, pv))
+                bb.warn("Possible runtime versions %s do not match recipe =
version %s" % (possible_versions, pv))
+                got_quick_match_result =3D True
+            else:
+                data_lines.append("result: MISMATCH (%s v.s. %s)\n\n" % (p=
ossible_versions, pv))
+        else:
+            data_lines.append("FINAL RESULT: MATCH (%s v.s. %s)\n\n" % (po=
ssible_versions, pv))
+            got_quick_match_result =3D True
+    except:
+        data_lines.append("version_check_cmd: %s\n" % version_check_cmd)
+        data_lines.append("result: RUN_FAILED\n\n")
+    if got_quick_match_result:
+        if enable_debug:
+            with open(debug_data_file, "w") as f:
+                f.writelines(data_lines)
+        return
+
+    skipped_directories =3D [".debug", "ptest", "installed-tests", "tests"=
, "test", "__pycache__", "testcases"]
+    pkgd_libdir =3D pkgd + d.getVar("libdir")
+    pkgd_base_libdir =3D pkgd + d.getVar("base_libdir")
+    extra_exec_libdirs =3D []
+    for root, dirs, files in os.walk(pkgd):
+        for dname in dirs:
+            fdir =3D os.path.join(root, dname)
+            if os.path.isdir(fdir) and fdir !=3D pkgd_libdir and fdir !=3D=
 pkgd_base_libdir:
+                if fdir.startswith(pkgd_libdir) or fdir.startswith(pkgd_ba=
se_libdir):
+                    for sd in skipped_directories:
+                        if fdir.endswith("/" + sd) or ("/" + sd + "/") in =
fdir:
+                            break
+                    else:
+                        extra_exec_libdirs.append(fdir)
+        for fname in files:
+            fpath =3D os.path.join(root, fname)
+            if os.path.isfile(fpath) and os.access(fpath, os.X_OK):
+                for sd in skipped_directories:
+                    if ("/" + sd + "/") in fpath:
+                        break
+                else:
+                    if is_shared_library(fpath):
+                        # we don't check shared libraries
+                        continue
+                    else:
+                        executables.append(fpath)
+    if enable_debug:
+        data_lines.append("executables: %s\n" % executables)
+
+    found_match =3D False
+    some_cmd_succeed =3D False
+    if not executables:
+        bb.debug(1, "No executable found for %s" % pn)
+        data_lines.append("FINAL RESULT: NO_EXECUTABLE_FOUND\n\n")
+    else:
+        # first we extend qemu_exec to include library path if needed
+        if extra_exec_libdirs:
+            qemu_exec +=3D ":" + ":".join(extra_exec_libdirs)
+        for fexec in executables:
+            for version_option in ["--version", "-V", "-v", "--help"]:
+                version_check_cmd_full =3D "%s %s %s" % (qemu_exec, fexec,=
 version_option)
+                version_check_cmd =3D version_check_cmd_full
+                #version_check_cmd =3D "%s %s" % (os.path.relpath(fexec,=20
+ pkgd), version_option)
+               =20
+                try:
+                    cwd_temp =3D d.getVar("TMPDIR") + "/check-version-mism=
atch/cwd-temp/" + pn
+                    os.makedirs(cwd_temp, exist_ok=3DTrue)
+                    # avoid pseudo to manage any file we create
+                    sp_env =3D os.environ.copy()
+                    sp_env["PSEUDO_UNLOAD"] =3D "1"
+                    output =3D subprocess.check_output(version_check_cmd_f=
ull,
+                                                     shell=3DTrue,
+                                                     stderr=3Dsubprocess.S=
TDOUT,
+                                                     cwd=3Dcwd_temp,
+                                                     timeout=3D10,
+                                                     env=3Dsp_env).decode(=
"utf-8")
+                    some_cmd_succeed =3D True
+                    data_lines.append("version_check_cmd: %s\n" % version_=
check_cmd)
+                    data_lines.append("output:\n'''\n%s'''\n" % output)
+                    if version_option =3D=3D "--help":
+                        max_lines =3D 5
+                    else:
+                        max_lines =3D None
+                    possible_versions =3D get_possible_versions(output, fu=
ll_cmd=3Dfexec, max_lines=3Dmax_lines)
+                    if "." in pv:
+                        possible_versions =3D [item for item in possible_v=
ersions if "." in item or item =3D=3D "UNKNOWN"]
+                    data_lines.append("possible versions: %s\n" % possible=
_versions)
+                    if not possible_versions:
+                        data_lines.append("result: NO_RUNTIME_VERSION_FOUN=
D\n\n")
+                        continue
+                    possible_versions_all.extend(possible_versions)
+                    possible_versions_all =3D sorted(set(possible_versions=
_all))
+                    if is_version_mismatch(possible_versions, pv):
+                        data_lines.append("result: MISMATCH (%s v.s. %s)\n=
\n" % (possible_versions, pv))
+                    else:
+                        found_match =3D True
+                        data_lines.append("result: MATCH (%s v.s. %s)\n\n"=
 % (possible_versions, pv))
+                        break
+                except:
+                    data_lines.append("version_check_cmd: %s\n" % version_=
check_cmd)
+                    data_lines.append("result: RUN_FAILED\n\n")
+                finally:
+                    shutil.rmtree(cwd_temp)
+            if found_match:
+                break
+    if executables:
+        if found_match:
+            data_lines.append("FINAL RESULT: MATCH (%s v.s. %s)\n" % (poss=
ible_versions_all, pv))
+        elif len(possible_versions_all) =3D=3D 0:
+            if some_cmd_succeed:
+                bb.debug(1, "No valid runtime version found")
+                data_lines.append("FINAL RESULT: NO_VALID_RUNTIME_VERSION_=
FOUND\n")
+            else:
+                bb.debug(1, "All version check command failed")
+                data_lines.append("FINAL RESULT: RUN_FAILED\n")
+        else:
+            bb.warn("Possible runtime versions %s do not match recipe vers=
ion %s" % (possible_versions_all, pv))
+            data_lines.append("FINAL RESULT: MISMATCH (%s v.s. %s)\n" %=20
+ (possible_versions_all, pv))
+
+    if enable_debug:
+        with open(debug_data_file, "w") as f:
+            f.writelines(data_lines)
+
+    # clean up stale processes
+    process_name_common_prefix =3D "%s %s" % (' '.join(qemu_exec.split()[1=
:]), pkgd)
+    find_stale_process_cmd =3D "ps -e -o pid,args | grep -v grep | grep -F=
 '%s'" % process_name_common_prefix
+    try:
+        stale_process_output =3D subprocess.check_output(find_stale_proces=
s_cmd, shell=3DTrue).decode("utf-8")
+        stale_process_pids =3D []
+        for line in stale_process_output.split("\n"):
+            line =3D line.strip()
+            if not line:
+                continue
+            pid =3D line.split()[0]
+            stale_process_pids.append(pid)
+        for pid in stale_process_pids:
+            os.kill(int(pid), signal.SIGKILL)
+    except Exception as e:
+        bb.debug(1, "No stale process") }
+
+addtask do_package_check_version_mismatch after do_package before=20
+do_build
+
+do_build[rdeptask] +=3D "do_package_check_version_mismatch"
+do_rootfs[recrdeptask] +=3D "do_package_check_version_mismatch"
+
+SSTATETASKS +=3D "do_package_check_version_mismatch"
+do_package_check_version_mismatch[sstate-inputdirs] =3D ""
+do_package_check_version_mismatch[sstate-outputdirs] =3D ""
+python do_package_check_version_mismatch_setscene () {
+    sstate_setscene(d)
+}
+addtask do_package_check_version_mismatch_setscene
diff --git a/meta-oe/conf/version-check.conf b/meta-oe/conf/version-check.c=
onf new file mode 100644 index 0000000000..c41df0d496
--- /dev/null
+++ b/meta-oe/conf/version-check.conf
@@ -0,0 +1,22 @@
+INHERIT +=3D "check-version-mismatch"
+# we need ps command to clean stale processes HOSTTOOLS +=3D "ps"
+
+# Special cases that need to be handled.
+# % has the same meaning as in bbappend files, that is, match any chars.
+
+# oe-core
+CHECK_VERSION_PV:pn-rust-llvm =3D "${LLVM_RELEASE}"
+CHECK_VERSION_PV:pn-igt-gpu-tools =3D "${PV}-${PV}"
+CHECK_VERSION_PV:pn-vim =3D "${@'.'.join(d.getVar('PV').split('.')[:-1])}"
+CHECK_VERSION_PV:pn-vim-tiny =3D "${@'.'.join(d.getVar('PV').split('.')[:-=
1])}"
+CHECK_VERSION_PV:pn-ncurses =3D "${PV}.%"
+CHECK_VERSION_PV:pn-alsa-tools =3D "%"
+CHECK_VERSION_PV:pn-gst-examples =3D "%"
+CHECK_VERSION_PV:pn-libedit =3D "${@d.getVar('PV').split('-')[1]}"
+
+# meta-oe
+CHECK_VERSION_PV:pn-iozone3 =3D "3.${PV}"
+CHECK_VERSION_PV:pn-can-utils =3D "%"
+CHECK_VERSION_PV:pn-luajit =3D "${PV}.%"
+CHECK_VERSION_PV:pn-sg3-utils =3D "%"
--
2.49.0


