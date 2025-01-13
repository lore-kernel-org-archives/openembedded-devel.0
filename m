Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B247AE7719E
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 03:40:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.9730.1736739600376999363
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jan 2025 19:40:00 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=31087dc864=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D3Qb2v010394
	for <openembedded-devel@lists.openembedded.org>; Sun, 12 Jan 2025 19:40:00 -0800
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2041.outbound.protection.outlook.com [104.47.58.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443s1ph2sy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 12 Jan 2025 19:39:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bVAhtxBCnEoKyWAlyMF7j2odZfPs2Tf5V2Bx0HrGB49/9txkEfv/1MrLlsFwD4jewrCoDnXNDpHCI0bv70vXte4jqffp5ZlNWRRiFSrVwGMDUefo3+JwOdvx169Y2i2E+Fl2LKvVrLNAosKAXhST70KYaUC+wLYxEU79Mao3t/fsPNQ6xmOxFeypSTdiFwZ/KK3mdqrRhmI7ZcQj/7PJ7iRdNVidb+cVKSzcj9DjFdlcqGSWkxq0lPJ1CG1Mf5/xGYCZyUKIMHAA8mfcFMwFT5zHb8nCTKTMdAdKSHyh6JGbu2WscknJ3VvR4hW49NN4i6165z7ZGRE2EQC2j+Gfjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yl8xqezrQh3LQgehCDqe+4j24ilnU75l+Ya2tmsSme4=;
 b=tnVhmUR8svWKP6WZu7yVfv8hhM+kyMDq6Ts0Q+UJNHOnw+HTih8nYBdhJjgvhkEarRs7+X9jaQLLe7GHvqi0IEy0ce+WzsWmymonvCPi70opxEoss4eAXPSfbbj0aTLMzntie8YGSHYnR2sf+kUKS22PNql6+FzINBuG3U21V/fZgnU0z5s0EC1TeljbFS/s3vsyXYTR4++ICn8jR/2nu/45XvxIJv6Jnuv9C0dFMwynqPa4degVb+n2bU4sqQ+j04YlI4IUDNoYVXGtZhXXTyz2u9tYZh4l34SOOCpjOwWRmg27/2Usn2o+bSTfBEtlfH5FrTsUZRvbjEfyjf7gXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH8PR11MB6928.namprd11.prod.outlook.com (2603:10b6:510:224::12)
 by DS7PR11MB7689.namprd11.prod.outlook.com (2603:10b6:8:e2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Mon, 13 Jan
 2025 03:39:57 +0000
Received: from PH8PR11MB6928.namprd11.prod.outlook.com
 ([fe80::4f5d:1d96:e74c:2840]) by PH8PR11MB6928.namprd11.prod.outlook.com
 ([fe80::4f5d:1d96:e74c:2840%2]) with mapi id 15.20.8335.015; Mon, 13 Jan 2025
 03:39:57 +0000
From: "Song, Jiaying (CN)" <Jiaying.Song.CN@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "Li, Changqing" <Changqing.Li@windriver.com>
Subject: RE: [oe] [meta-networking][scarthgap][PATCH] chrony: fix do_fetch
 error
Thread-Topic: [oe] [meta-networking][scarthgap][PATCH] chrony: fix do_fetch
 error
Thread-Index: AQHbXPtt2pUMvpPkpkKTcbTUaria87MUH4wA
Date: Mon, 13 Jan 2025 03:39:57 +0000
Message-ID: 
 <PH8PR11MB692874727841BDF38F8269F7B81F2@PH8PR11MB6928.namprd11.prod.outlook.com>
References: <1816D71B8D2D9887.21892@lists.openembedded.org>
In-Reply-To: <1816D71B8D2D9887.21892@lists.openembedded.org>
Accept-Language: en-AS, zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6928:EE_|DS7PR11MB7689:EE_
x-ms-office365-filtering-correlation-id: 67ab660d-6e64-450c-734c-08dd3383f3a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|7053199007|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?fMNZ0Wip+6Xrgw/EvPygVXMyFzHre9Q49k4Un/yZ/kL7jsMQdzxeCXQH+bn6?=
 =?us-ascii?Q?o6PfUu2MWlQwwuObcNS0FUzUuiH/TfZidqPY52pTVyt0fcuQmkFshmep+mXx?=
 =?us-ascii?Q?/yzongsD9EW9s3TGMW9Sb/v+cY1JgQOXqRJfEwNeDBmUZjrHYG4/emN/i561?=
 =?us-ascii?Q?nDNztkuhB2gT4sDJxSXEWx/5DsrqmahEcwxClboQLNn2I8Ctqwtx/zKJ8iEB?=
 =?us-ascii?Q?E9kjjl0k9+DiE1OV85ekcc7jVHc1NoFoCRZL3Nsb/J81C1sKe1Z5lLuvVzxR?=
 =?us-ascii?Q?hYDFFqq62s+vN1TtRclIY3mNHRWCUXrNrqARbzyWYXV7RZW2lFnXtHULE8Pz?=
 =?us-ascii?Q?7uD26wUTr3qq5Y66HgTHbpZ7vVcRjyRvulnVklX98byNap+/ZKILrBintWzj?=
 =?us-ascii?Q?hBaHCX8NSUd1VgCgFU/bkkKeKou0caLLhBWnzLCReWA1mdabfRjjzgsSZTrA?=
 =?us-ascii?Q?xx9ix2ZQlZaONItedF/0rWhww67goALFO1uc/n2h6YLBnpN0FLvqn5Ahlmdh?=
 =?us-ascii?Q?LUKhy4NeBe0ukxR2ElcTmTUkggoOJdy59SQat2hh2yiW6jLOT6h5SxQ6VWO5?=
 =?us-ascii?Q?zICyTVp40qVnSv0ZjDsu5y53v511wEq5JWhmxA0d5uiztgs2+JvuD6d0YAb4?=
 =?us-ascii?Q?2zdwrKvpTuaJHjzenUKdHboR8fd8ycS7Vw+xs+Nxf7dWzzovICmZBx54jKOF?=
 =?us-ascii?Q?8L0UvG37YW3cy8QjRjaleXaw1ZuFlZEfy3RJqaHd3kVUGc7ZwT3QZuC+uFxQ?=
 =?us-ascii?Q?VjANjsBRGpTydmzmrYQwzF5V490b0YzpxF2HTgrGXnGUd5wx1A7fwgCRQlsX?=
 =?us-ascii?Q?k6yH9gezcE63TAfFYywWihsD360qgsQYUJVPk1+C0vpcFDPW0u26h3GVD8ag?=
 =?us-ascii?Q?JhoAFGe+rqhPz0nNtS+x18SAbgThbfE2A2P1pF1q5Nia/HsrsMcAMXA7Le2J?=
 =?us-ascii?Q?+zD0NyBKHNRL6oA+I8KomfxIGqyWDfyzrxrB2JcfN39TTWnlUwTbuskwtaYV?=
 =?us-ascii?Q?Mq4Cx4MHuoIOSJ3lTDM83//ymzfZOKysVQKlR7BwJGFfQlNgEnK/C8aKhIPS?=
 =?us-ascii?Q?32Sysll6urlZ88GGRfKYtELVvzMSRfeTaIHRMhbwo37tkmObE3qT5ztIY+Cg?=
 =?us-ascii?Q?nTeUiEr6p+zB4G4S3wkGFlIzQqMB8V/4bNnFVrho6BtwM1LLZCdnrgcccXt4?=
 =?us-ascii?Q?UlRNbD2z1lXGt4nHsuonOkE1qUbUk1zj6MbK1gNo++T+OxPXF3hrBpHpyT9d?=
 =?us-ascii?Q?MYlTrA8Jb3+335TLwZ/eAaeETztZpfbRaD5bF2PVS1JNmH4hOMkiQgu3g7hO?=
 =?us-ascii?Q?snork0YxLAVJiFlR0U+CnaWltdcKOzT/9XDwLtskioqm61gJQvnCFUEUgYjT?=
 =?us-ascii?Q?X/r3OSWqVhOfeczI62tdUzE2gVcz?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6928.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?/RosTaBPRyZL1O7M61YKNKZKD60QdDaxq/wrb+9Sd8u/K8RWW71kSqcFvWjf?=
 =?us-ascii?Q?oGoU5JKvf5biLxnevNjoR8iEjC+hNwALyXBFPp72F4M9v7Q8mBr0gxYvhcFm?=
 =?us-ascii?Q?2VIuzsDjVthWccLcewfzwnJ4TDmBZe2sEJsP5WArMH7L0v+XsPDypi/M3rUH?=
 =?us-ascii?Q?+peQX72BYnFa1cxUFsKvhxgVrJRX8k84QQVRXkylUlRA3yvFz4diQzgLjyIK?=
 =?us-ascii?Q?Rvir9Swu3ApZceYmqR74ayK/ArMvg18FeVG5LFDhkL2M5z81KFqP/cTxosAT?=
 =?us-ascii?Q?+BKUVH1eTr0W3G3fXQ3KhI2v/AMWojkRHpsfjdTTYUvJqHuza959lYUwVzzw?=
 =?us-ascii?Q?ck92MF/3OUsq3Nxo1A4QIR86WZP7yd7OCfa284I4v2Dr5SvXXu/r+uTl3/AT?=
 =?us-ascii?Q?aLk6undeud5+4x20VXtnL67kkwt/gWapvgenlA899/kRVVpPotqaEP1SqN8l?=
 =?us-ascii?Q?vZaUYY1Vcb7qogQjr1cwb03/t57DQHVeSvuItwVlaPIxxej1/PPYU6EYl4QD?=
 =?us-ascii?Q?p64GdRak2RpGA1lsyAwREnY4+5NaxGX+2XIdD1w6e2iawxGDt7Va6HDmKL37?=
 =?us-ascii?Q?pmOa0CzSH83OrPghhqZd9/Qut1tMBbvy2ZMi32fVN1uYxZDrg44LYgeSE2fa?=
 =?us-ascii?Q?L5TkXVqO4KKzK00YMBMTrZPfE7abYR9IKpupSzZRD/pIfCa2VSKQwq9KSZHn?=
 =?us-ascii?Q?wLOXeC6uW3s9z7NLU0GtaEYNzVCKFn2+HDdXCC175ePBHagaJ+SlkmUZadLG?=
 =?us-ascii?Q?Vbl/nExy4DqKqu2jRlMr09tIZjZtx2MBhCCfi7vfI8CWAWIEeHf1yGccPKXu?=
 =?us-ascii?Q?tKHZWrK/Xqqv6b0aazKleZx+lzfq6UqrXjGOQi0PgmwKau9VHcF+Q9/50iiu?=
 =?us-ascii?Q?ZMgZZkcv32WGjREnsmsdJ8C9LJjdqzFkGThk8C1NorZ7oC+uyXMmPnNR9nNB?=
 =?us-ascii?Q?YrJJK6+BSZ9hH20PPCpurVGNK3FdGR1wAG6ugcbiX/fzrpolcjswcWYyfcUv?=
 =?us-ascii?Q?GMhTCmjnnW5MbVGR7n6nOJ6cJCW21fe2TkAJMCrMA87bZtaQFDk7vJV8FdN4?=
 =?us-ascii?Q?N1fVNS60pWQQvhqg9GltcTxYMVDPKYBl3Y1PZIk393rq8E5UuPEq7Y9VISrA?=
 =?us-ascii?Q?trX1v4XhgLfEDl95G7h+JXdA7ZTatlTyR1oP1IUHfLF8t5swxd80iYcrQduZ?=
 =?us-ascii?Q?JEnkwTebZpZRPOim014XLMt+/+3n5vaqOUernpKvq0K+GvSv+bK4NBbo3Ncz?=
 =?us-ascii?Q?2LOXXgkGs97Afr5kqLGHBGUwq0gHTjOAsb5cTflYxoki+5bp50ZAgpmUpz5k?=
 =?us-ascii?Q?rzqDiZ+iQt9JDL3bt+ZF/81z1951r1KcNqgtymVyVa0FNuynqALYZpU5/0T+?=
 =?us-ascii?Q?V9fR+r75jUuw363kfeZakOuG3mr98d1ewC405bkFlpHM8I4sBXmHOMfainZh?=
 =?us-ascii?Q?sSl8Z2+w3U75M43CPgsWv2CV+lc/3lSpOkUM1d9bowGlbVHgCV85iEs7IMe5?=
 =?us-ascii?Q?BDm7pX7lLIOAh8lEk8I/9/GEOheZAHzyooAxdwow+vYiZPiXuOXzZAQwIf30?=
 =?us-ascii?Q?jxXBV8JavzFI/O+i+30JhgPljZMBHd74VPNOJs8f/WNnyMOVyMjWVbH4z+qy?=
 =?us-ascii?Q?fA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6928.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67ab660d-6e64-450c-734c-08dd3383f3a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2025 03:39:57.7522
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1H5rXOyjAjZv2Xxgof8EIQHAkj5qPPUmfWjo8eA/H91ugDoAHpbcH1IPd0X8lnjKX5nUQ5RlswhuU92KoWPX/ErvG8FZIKWH2Ca/A4l3ojg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7689
X-Authority-Analysis: v=2.4 cv=DdLtqutW c=1 sm=1 tr=0 ts=67848b0f cx=c_pps a=OnljjeCONrlUuPUItWmgXA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10
 a=dIu3SnmMAAAA:8 a=wxZTIvLhAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=_jjmDxKo8mOuXr19brwA:9 a=CjuIK1q_8ugA:10 a=Ua9G7VpiFza3u12uuhVB:22 a=pEOY4cZjM94Q10G0-i-k:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Xu56GdfU9h_3LsrT2L75-kkD01IUvcGz
X-Proofpoint-ORIG-GUID: Xu56GdfU9h_3LsrT2L75-kkD01IUvcGz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-13_01,2025-01-10_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2501130029
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jan 2025 03:40:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114819

Kindly ping for scarthgap branch.
-----Original Message-----
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> On Behalf Of Song, Jiaying (CN) via lists.openembedded.org
Sent: Thursday, January 2, 2025 5:47 PM
To: openembedded-devel@lists.openembedded.org
Cc: Li, Changqing <Changqing.Li@windriver.com>
Subject: [oe] [meta-networking][scarthgap][PATCH] chrony: fix do_fetch erro=
r

From: Jiaying Song <jiaying.song.cn@windriver.com>

Change the SRC_URI to the correct value due to the following error:
WARNING: chrony-4.5-r0.wr2401 do_fetch: Failed to fetch URL https://downloa=
d.tuxfamily.org/chrony/chrony-4.5.tar.gz, attempting MIRRORS if available

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 meta-networking/recipes-support/chrony/chrony_4.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/chrony/chrony_4.5.bb b/meta-ne=
tworking/recipes-support/chrony/chrony_4.5.bb
index ed26e5987..ae46ef1fd 100644
--- a/meta-networking/recipes-support/chrony/chrony_4.5.bb
+++ b/meta-networking/recipes-support/chrony/chrony_4.5.bb
@@ -30,7 +30,7 @@ SECTION =3D "net"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882bb=
e"
=20
-SRC_URI =3D "https://download.tuxfamily.org/chrony/chrony-${PV}.tar.gz \
+SRC_URI =3D "https://chrony-project.org/releases/chrony-${PV}.tar.gz \
     file://chrony.conf \
     file://chronyd \
     file://arm_eabi.patch \
--=20
2.25.1


