Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5659CA0EFA
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 08:42:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.59981.1756197746187793482
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Aug 2025 01:42:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=EgipfpdS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=03334bb704=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57Q7lxCw1332211
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Aug 2025 08:42:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=NKvD3ESS8SVt0VDDgBXh
	rXw+Is3KtSPuYwUJNrz1WBE=; b=EgipfpdSer/K8Rqu88i74NByKtjoOMOCr3qg
	36aXO7H0FrlbUZhlD4+08WGythw2F/PJTQDAFgiw+BN32ONxs0xKav4/iBioMNiy
	2uLHQhOlySnDZrrU+Y5wMI/35F0EHHN63MnlN+hTfMxhdUJjRfAZsClG2y8NXQEv
	ioYd8ICkgr36YLr1tWhvJUKFGcFtkYNwnlchZYsUh1oBs21t45DU4zK3ZOLZr7t6
	1JJpXUBKfRoyCYy49YBgQGlhBGHchw6bXkMu2lnv9P2SwHTH/41aZ308iUzYuIcs
	BuQz8XVdFrOdRNkg94Hg7xSeXaNhHfGBPKo67dldADpF4Sok4g==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2041.outbound.protection.outlook.com [40.107.93.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48q2v1aw0q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Aug 2025 08:42:24 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ot+XZBJYQg4Q+tGCkUkX7r47T+nVNN21c93lNg3QtDOUozGjHEC27Aj1KGHxYkEGRuW2huEYes3DkLNDmPMHGc7Jswgdr5kM2M77yLAQ9Vv0QZAbO4CSDwD2Weu+7OYM3FeqN1/+t3ZSqkznmX+C70UU/2hfJd1+bhcKiZ78TUpN6DK6ks1vHNEYErQGP7JNqPJoJ+qWW4rpXtrhIXcbmvdrkcN5J9CRxqVIvJ6fTdE6TedpqDX1+NvIMGWCQxz+9dr1VUmjhMbcyPwYh3W846nU+bwh9CXqAea2DHM2LKQJGED1Lu+ubZ/5sPMbtS/a0iH7QVApuSYE0sk9qYd+gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NKvD3ESS8SVt0VDDgBXhrXw+Is3KtSPuYwUJNrz1WBE=;
 b=tZ261k2QhCrf5osZzvcl50wipt01uO/GH4D5tYcQ6OTuawMHI2FMs/e0xDvAWHo/2Z4X5BX6bsv5+6OG5rWWajP4UbLP9HEYNhEjn0z2UUxeYSW54BLP49MhzCfOo2s/5HGrpFmW1dbaV6sa0Dse8ujmt6Mo8eX5X8O259QX+m8mTdUfnqt8ghqNGo1aEv/VKJDnX1uNNp0T/wfmsdatfH7o8vcWXMLWT6qATPYL+GVbmREA9SQpw9RaQRyj/Kffhs5y3C51kBlfDTY9vno0ihBYELhR64iW7fCQiZMSLHyEUW55LpxVNAGp5BmtamIfqh3wwn0+919NM+TktR+DVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21)
 by DS7PR11MB6272.namprd11.prod.outlook.com (2603:10b6:8:94::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 08:42:21 +0000
Received: from CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86]) by CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86%7]) with mapi id 15.20.9052.014; Tue, 26 Aug 2025
 08:42:21 +0000
From: guocai.he.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][kirkstone][PATCH] libnet: backport patch to remove configure time SOCK_PACKET check
Date: Tue, 26 Aug 2025 16:42:02 +0800
Message-Id: <20250826084202.4188308-1-guocai.he.cn@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=yes
X-ClientProxiedBy: SI2PR06CA0002.apcprd06.prod.outlook.com
 (2603:1096:4:186::10) To CO6PR11MB5586.namprd11.prod.outlook.com
 (2603:10b6:5:35d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5586:EE_|DS7PR11MB6272:EE_
X-MS-Office365-Filtering-Correlation-Id: ac351cf3-278e-4255-6eb2-08dde47c78d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JB6UJLq4E7Kc/nfrr1cJ3Dg0dcKsd3MdLbR1r+X/NYALJH6wqdv1vrAcTn7g?=
 =?us-ascii?Q?qg1ZTMxf+xILwxPwIs2ECcHQrUapBvcVHP+ScqokTBcN762BS67otlC7nwMR?=
 =?us-ascii?Q?tdJCQNKuZFLl8nkhp9L504Ji64+H4xpXPafa/Pdl1fS6XC7YJnw2Cek3qczu?=
 =?us-ascii?Q?GS60bemzIkdKO95+XCaNrdp2dDSVz87TdpwVguF35mOgpP8Xl2j/PHCwSRn4?=
 =?us-ascii?Q?gDwQGevSsZ7taB6Rx1+SuMlV8TDkahGhyu+xsR+8i8N+mUu5dCgdZX6qT6Zk?=
 =?us-ascii?Q?O7fCba1acH77NQBviY41cdm/SRzdR47jInCR/hX/K3vXaJ4pZA3uJj30Y9pH?=
 =?us-ascii?Q?qrxTs6aenfiGMMgGcPR5ivt8ZRSbIXLufmh4yLVWBHyqb5dbz5PYVguUVBV8?=
 =?us-ascii?Q?CUcKSDw8uwfYJK5szgHoJwSxe3pjRijpeOpW+9Bn1Nxs2k2A+uanLncPPHaN?=
 =?us-ascii?Q?M3q/B1OI0OvSF39VEb/njDDWhClMdgdZpyZ/se5PoJ+VZ4Cn6U01YrxoGFDU?=
 =?us-ascii?Q?+JUw6CFSsohvsDTtnwAf+BWMhMxuF6QdCzvAqzifA53TVoR45zfHBTGh3ldp?=
 =?us-ascii?Q?m9fuLuFoujL0WlcVsJAGF0M5vRwX5NZHto2ulCBwaq3pQJ0vGl+/r+3UWjKM?=
 =?us-ascii?Q?E2vjYMG52Ro4ok9EYgSr7EnNnshFnpeMfDECZrewlnJYstqnVM7Tvf/XkY2C?=
 =?us-ascii?Q?Ey9GaA4Xq55Bjj7/iyfdgTVbjuiGFchigjUDOIVPBthUQknof4CCsTkLOBEJ?=
 =?us-ascii?Q?Fm7j39kso//oqytXiP1VlspHZT5nY2w9CZVMxOp4xWlA62cO/oRnuq0Vsq11?=
 =?us-ascii?Q?OqJvaU2JfV0aAVxbbZaPE4Y8j7EXJind/e1YJuapV+CBANYGD56PyMP73vzw?=
 =?us-ascii?Q?OZDyICd+DJk3jDxClEXjuWHO1NvSeYdY8B7m4PZJy4Cgvvb3xkm0HY78/8gY?=
 =?us-ascii?Q?Irwg2hwouwfXGXfZRtfktLTQF6utrFdWHXUOJb6D3d2msGAoJsiBhf32MGwY?=
 =?us-ascii?Q?BW9kXnoaUBFapVwTX0TOS8z3SOOeZsed0/0N/GVed5bR6UyOubOgQW88HNny?=
 =?us-ascii?Q?1AqMi4mD6ZQth+bVeq93D5qSpidNxa183O8rWbdwsRf27YJYHQIplrz74CuX?=
 =?us-ascii?Q?s8nHd6BALJZCNV6IeH1qJ4kVIacQ3dqDN8Dk/Vyv2+a8aXQFmx8nM4N2p4qH?=
 =?us-ascii?Q?cq4gz/GyrkidlPR9H/c0KmQj1E/KKzgTCZegLb1+tOTEOijEMAN/tD4dX53j?=
 =?us-ascii?Q?U+UuFtBbyn7Rv3BdNNnXva1jdJqUBLWLv838rP3Zl+mdWYFUmUV/+a501WAf?=
 =?us-ascii?Q?08EWpBs1zm0bNBTyECt86GuuHoW0jh80rxbUtxHz79RXJ9eFSnf0ycA9SXAn?=
 =?us-ascii?Q?7t6EuPOEqHKgbSi4JyhQZ6vxa9ypWapNNQ7no+t0wSA265R0sOlUbglimGxw?=
 =?us-ascii?Q?QQokcda/q5I=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UWV+oJT+lAPHQzlXbm7mN4jB69V6DSu0zV878QbBx9OW9j7nX81DOfgEq76K?=
 =?us-ascii?Q?MsKeX/UFEPSkWrakafXPmxzWFTfGXinEV/VomZwjPW2uryh5eG4DAT3b2lTh?=
 =?us-ascii?Q?5auh0FjUj+fA442XV4nK1s4jYa2ft53PZO565TnZQT5Y+KVhVzH62srtl/Z+?=
 =?us-ascii?Q?CS411g82imEYcQh9gu5dMwZ5Mn+M+8gNKk+FEW70mTgjNOL35qHuGhACCqz6?=
 =?us-ascii?Q?K4f0tVBJdnzxzzZxCtYkOr2ls7h9jophNq98xtW1Zx594ieZgSMc2xdDkeK1?=
 =?us-ascii?Q?ZOtR3VE6Z94yOTHGexogNAZtl5H5eOf8tQXni1jA5o2VJojgPurv6fmCo5qL?=
 =?us-ascii?Q?LZ5ZsuBr06hHEQpeDTJ1YGuQZJRP7QZrgBPs+ZQLqAaZOBUNup6tlStlbBuj?=
 =?us-ascii?Q?V2qpeoF0Wi/LZtRvtYyXvylGljGKKEgGD7k2AFLApr1c1GXe71aOyXIpYe+J?=
 =?us-ascii?Q?F4JywrYO0J43fkMIgvMZIRntLiJzHDYy8iegj27DcIO/TRmgy5m5aEvlmGdj?=
 =?us-ascii?Q?wrBC5ecDecUSV57lncxLozEeHXmrMZ7zFuXbISqAQxVHuCIQDXvhn3vI+6w8?=
 =?us-ascii?Q?vkfNGIZ+tOh7X1W51IMq+GPPu72XoCKvWaUFDZm8A1/cB8HDB0Vt+GHKKhjI?=
 =?us-ascii?Q?8ACLeomehG/9Eduo1ReofPHHF8rZq2s8ob0kjysfuzcLiGLa1XXq+ZImFdBV?=
 =?us-ascii?Q?2lE1oVt3FOJGySOV2ZHYU35DsQsx+Q+H6OUMdaEdzjDSBykB4hlYw8GF9mop?=
 =?us-ascii?Q?olauC7vkXbUxdCD+pHAJu2tzA8mymhZhbMA/bqM8YnekhHjOBrtqTezO/7x9?=
 =?us-ascii?Q?VVJt42Xk8rkPIgBXBJhPoSOJvTds+n/DwHdWxcO5z2mGSt9BzmPwcNk/zZlc?=
 =?us-ascii?Q?5NESWRT0ClQw2Loid9QaRv86LyXxzglhrTDsblwQGCsixdeXp4JxQiKeFFsw?=
 =?us-ascii?Q?JNPIaAQEps/XW7QMKPADQA1QZEBOzsog92T/U5mvv1DabBZc2sWQph1edrU8?=
 =?us-ascii?Q?8T/dl9jai/fSQpDm+of2MNQuYZauuDtWp2NfSpDsUJ2HaE8HohH7VZ1+XkJg?=
 =?us-ascii?Q?IjfvZxgnvaEvlUSAHpyjD5Flw5AFxGLFJaUcCyBHqVQdOph+Nltf7e37zCzu?=
 =?us-ascii?Q?4dz7oRuB3FvIN8J93Z+111FP+OHB9V4UiPonnRQyOKEIfa36tpuvezCXSjW4?=
 =?us-ascii?Q?LqgQZvBMBDRzGBgUR1um+QkML4SP79A6gexwF8NOgHvGiA4qX8910Wg1KSJA?=
 =?us-ascii?Q?AejKhOKiviKHSO9IpAmmqMKhVNUT0H6Td3U1atyGu8slPS7gDsohesUbacFl?=
 =?us-ascii?Q?Aqoart7oNdAPwqMzqbFB6VFt8roiUKjqnEYs8ewvvbRgYNlQCdaQSjGKAoCI?=
 =?us-ascii?Q?YwK3R+QNifzcVmx4ge3IweD/9x5Ip/NxBeX/JcucBdf8Vpgob6EPaXCHrbBs?=
 =?us-ascii?Q?Q/TaR9ay7RntvOQhs0bYUI8TX/thyr9weFRQSXsngYilYEbIQ78z7eXXz7E/?=
 =?us-ascii?Q?s7d4HkSamkGZjFEFZa9M4CT5wGYJf37InSDDQPu/+3e1sjRu0QCPI8dPX36q?=
 =?us-ascii?Q?JSdg2sxrtNyJWB9erBnC4IZ6Kq2i1caJC3Z4cWFMSJXyrK43G4dv3BMPM4hl?=
 =?us-ascii?Q?eg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac351cf3-278e-4255-6eb2-08dde47c78d3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 08:42:21.3649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2IhOmFqr7ZFupQXfT1g0GQK0RJRzoDdaMAEs1lMx82dTyzCeak7M+bjd9i9y+ql9tVzxgXTr6Fg/yLvDugTpQVKO2NXKQHmbxSzebVgVySQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6272
X-Proofpoint-ORIG-GUID: 0A735BMW-sCrbv81eOezZzWYwqt7RMsA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDA3NiBTYWx0ZWRfX5aTmH/QEQeVD
 sEh1dkMHG7pLSpuVGzeR5yJx5pSptOD2nKek4voynG4HmVh46yyFMGyzK7FoReCrNLZRpenlE/N
 OnjZlsFesxL3fKFOVaDrNAKLpTA8DfB86icBe6mKkJEx6flmZU/VPiche7hfCbA0gPviaCypqZz
 nbe6q5Xkdl9crQYwicieKtqW/mAJChHn8d7hooZDFToGd+v6ZqkS4EjRmWcnQT8tcaLBKRbAFEJ
 ffCAu+n+vQI4xuNSgoKszKT1m1/dqCSOMGqwLLoVkG9aLDmsjhEEoAwg7IiLphmDUeHL6vyreEY
 OixeV1x6jcEymHfpsC2Uu+iIOTn3OD2Fbcf7IzbqAJY3UdsT2VYrD9cfCxWSkI=
X-Authority-Analysis: v=2.4 cv=T5GMT+KQ c=1 sm=1 tr=0 ts=68ad7370 cx=c_pps
 a=SqOJu+fA6qNg895n5GWYNQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=WN52PlUurRMA:10 a=2OwXVqhp2XgA:10 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=WQhEN21ruoYlkoZ7464A:9 a=3ZKOabzyN94A:10 a=xE34mhsjmDcA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 0A735BMW-sCrbv81eOezZzWYwqt7RMsA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 57Q7lxCw1332211
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Aug 2025 08:42:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119113

From: Guocai He <guocai.he.cn@windriver.com>

Backport [1] to fix the do_configure error like below:

  checking for packet socket (PF_PACKET)... ./pf_packet-test:
  /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.34' not found

[1] https://github.com/libnet/libnet/commit/19979c4541ddcc817c64ea911a309=
ee71a8cc250

Signed-off-by: Qi Chen <Qi.Chen@windriver.com>
Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
---
 ...move-support-for-SOCK_PACKET-sockets.patch | 251 ++++++++++++++++++
 .../libnet/libnet_1.2-rc3.bb                  |   1 +
 2 files changed, 252 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libnet/libnet/0001-Remov=
e-support-for-SOCK_PACKET-sockets.patch

diff --git a/meta-oe/recipes-connectivity/libnet/libnet/0001-Remove-suppo=
rt-for-SOCK_PACKET-sockets.patch b/meta-oe/recipes-connectivity/libnet/li=
bnet/0001-Remove-support-for-SOCK_PACKET-sockets.patch
new file mode 100644
index 0000000000..2fc7ecd180
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libnet/libnet/0001-Remove-support-for-=
SOCK_PACKET-sockets.patch
@@ -0,0 +1,251 @@
+From dd77c43a9773edb895bfe9074315e83a19cac471 Mon Sep 17 00:00:00 2001
+From: Guocai He <guocai.he.cn@windriver.com>
+Date: Tue, 26 Aug 2025 06:15:41 +0000
+Subject: [PATCH] Remove support for SOCK_PACKET sockets
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+The current code has a build-time check to verify that PF_PACKET sockets
+are supported on Linux systems and if not, fallback on SOCK_PACKET socke=
ts.
+
+The test implementation relies on FTM (Feature Test Macros) to detect
+glibc and its version to include correct headers.
+But, some libc such as the musl libc do not have such macros, making the
+test program compilation fail and libnet fallback on SOCK_PACKET.
+
+Since PF_PACKET support is present in kernel for more than 20 years now,
+the simplest solution and safe choice is to just drop support for
+SOCK_PACKET and assume PF_PACKET is always available on any Linux system.
+
+Signed-off-by: Herv=C3=A9 Boisse <admin@netgeek.ovh>
+
+Upstream-Status: Backport [19979c4541ddcc817c64ea911a309ee71a8cc250]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
+---
+ acinclude.m4            | 87 -----------------------------------------
+ configure.ac            |  3 --
+ src/libnet_link_linux.c | 19 +--------
+ win32/config.h          |  1 -
+ 4 files changed, 1 insertion(+), 109 deletions(-)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index 064b582..f8ab967 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -25,93 +25,6 @@ AC_DEFUN([AC_LIBNET_LINUX_PROCFS],
+                   [Define if you have the Linux /proc filesystem.])
+     fi])
+=20
+-dnl
+-dnl Checks to see if this linux kernel has a working PF_PACKET
+-dnl
+-dnl usage:
+-dnl
+-dnl     AC_LIBNET_CHECK_PF_PACKET
+-dnl
+-dnl results:
+-dnl
+-dnl     HAVE_PACKET_SOCKET (DEFINED)
+-dnl
+-
+-AC_DEFUN([AC_LIBNET_CHECK_PF_PACKET],
+-[
+-    AC_MSG_CHECKING(for packet socket (PF_PACKET))
+-    AC_CACHE_VAL(libnet_cv_have_packet_socket,
+-
+-        [
+-    cat > pf_packet-test.c << EOF
+-#include <stdio.h>
+-#include <errno.h>
+-#include <stdlib.h>
+-#include <netinet/in.h>
+-#include <sys/socket.h>
+-#include <features.h>    /* for the glibc version number */
+-#if __GLIBC__ >=3D 2 && __GLIBC_MINOR >=3D 1
+-#include <netpacket/packet.h>
+-#include <net/ethernet.h>     /* the L2 protocols */
+-#else
+-#include <asm/types.h>
+-#include <linux/if_packet.h>
+-#include <linux/if_ether.h>   /* The L2 protocols */
+-#endif
+-=20
+-#ifndef SOL_PACKET
+-#define SOL_PACKET 263
+-#endif  /* SOL_PACKET */
+-=20
+-int
+-main(int argc, char **argv)
+-{
+-    int fd;
+-=20
+-    fd =3D socket(PF_PACKET, SOCK_RAW, htons(ETH_P_ALL));
+-    if (fd =3D=3D -1)
+-    {
+-        if (errno =3D=3D EPERM)
+-        {
+-            /* user's UID !=3D 0 */
+-            printf("probably");
+-            exit (EXIT_FAILURE);
+-        }
+-        printf("no");
+-        exit (EXIT_FAILURE);
+-    }
+-    printf("yes");
+-    exit (EXIT_SUCCESS);
+-}
+-EOF
+-    ${CC-cc} -o pf_packet-test $CFLAGS pf_packet-test.c >/dev/null 2>&1
+-
+-    # Oopz 4.3 BSD doesn't have this.  Sorry.
+-    if test ! -x ./pf_packet-test ; then
+-        libnet_cv_have_packet_socket=3Dchoked
+-    else
+-        libnet_cv_have_packet_socket=3D`./pf_packet-test`;
+-    fi
+-    if test $libnet_cv_have_packet_socket =3D choked; then
+-        AC_MSG_RESULT(test program compile choked... assuming no)
+-    elif test $libnet_cv_have_packet_socket =3D yes; then
+-        AC_MSG_RESULT(yes)
+-    elif test $libnet_cv_have_packet_socket =3D probably; then
+-        AC_MSG_RESULT(test program got EPERM... assuming yes)
+-    elif test $libnet_cv_have_packet_socket =3D no; then
+-        AC_MSG_RESULT(no)
+-    fi
+-
+-    rm -f pf_packet-test* core core.pf_packet-test
+-
+-    ])
+-
+-    if test $libnet_cv_have_packet_socket =3D yes -o $libnet_cv_have_pa=
cket_socket =3D probably; then
+-        AC_DEFINE(HAVE_PACKET_SOCKET, 1,
+-          [Define if we're running on a Linux system with PF_PACKET soc=
kets.])
+-    fi
+-])
+-
+ dnl
+ dnl Looks for a previous libnet version and attempts to determine which=
 verion
+ dnl it is.  Version 0.8 was the first version that actually knew intern=
ally
+diff --git a/configure.ac b/configure.ac
+index 4751f62..ad002b9 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -51,7 +51,6 @@ AC_LIBNET_ENDIAN_CHECK
+ dnl AC_LBL_LIBRARY_NET
+=20
+ AC_SUBST(ENDIANESS)
+-AC_SUBST(HAVE_PACKET_SOCKET)
+ AC_SUBST(ADDITIONAL_LIBS)
+ AC_SUBST(LIBNET_CONFIG_DEFINES)
+ AC_SUBST(LIBNET_CONFIG_LIBS)
+@@ -87,7 +86,6 @@ if test -n "${with_link_layer}"; then
+         snoop) AC_LIBOBJ([libnet_link_snoop]) ;;
+         dlpi)  AC_LIBOBJ([libnet_link_dlpi]) ;;
+         linux) AC_LIBOBJ([libnet_link_linux])
+-	       AC_LIBNET_CHECK_PF_PACKET
+ 	       AC_LIBNET_LINUX_PROCFS ;;
+         none) AC_LIBOBJ([libnet_link_none]) ;;
+         *) AC_MSG_ERROR([Invalid link type "${with_link_layer}"]) ;;
+@@ -115,7 +113,6 @@ elif test "${ac_cv_header_sys_dlpi_h}" =3D "yes" ; t=
hen
+ elif test "${ac_cv_header_linux_socket_h}" =3D "yes" ; then
+     AC_LIBOBJ([libnet_link_linux])
+     AC_MSG_RESULT(found link layer linux)
+-    AC_LIBNET_CHECK_PF_PACKET
+     AC_LIBNET_LINUX_PROCFS
+ elif test "${cross_compiling}" !=3D "yes" -a -c /dev/bpf0 ; then       =
    # check again in case not readable
+     AC_LIBOBJ([libnet_link_bpf])
+diff --git a/src/libnet_link_linux.c b/src/libnet_link_linux.c
+index 3c6df3c..1dd2a42 100644
+--- a/src/libnet_link_linux.c
++++ b/src/libnet_link_linux.c
+@@ -33,13 +33,11 @@
+ #include <netinet/if_ether.h>
+ #include <net/if_arp.h>
+=20
+-#if (HAVE_PACKET_SOCKET)
+ #ifndef SOL_PACKET
+ #define SOL_PACKET 263
+ #endif  /* SOL_PACKET */
+ #include <netpacket/packet.h>
+ #include <net/ethernet.h>     /* the L2 protocols */
+-#endif  /* HAVE_PACKET_SOCKET */
+=20
+ #include "../include/libnet.h"
+=20
+@@ -69,11 +67,8 @@ libnet_open_link(libnet_t *l)
+         return (-1);
+     }=20
+=20
+-#if (HAVE_PACKET_SOCKET)
+     l->fd =3D socket(PF_PACKET, SOCK_RAW, htons(ETH_P_ALL));
+-#else
+-    l->fd =3D socket(PF_INET, SOCK_PACKET, htons(ETH_P_ALL));
+-#endif
++   =20
+     if (l->fd =3D=3D -1)
+     {
+         if (errno =3D=3D EPERM) {
+@@ -177,7 +172,6 @@ libnet_close_link(libnet_t *l)
+ }
+=20
+=20
+-#if (HAVE_PACKET_SOCKET)
+ static int
+ get_iface_index(int fd, const char *device)
+ {
+@@ -194,18 +188,12 @@ get_iface_index(int fd, const char *device)
+ =20
+     return ifr.ifr_ifindex;
+ }
+-#endif
+-
+=20
+ int
+ libnet_write_link(libnet_t *l, const uint8_t *packet, uint32_t size)
+ {
+     int c;
+-#if (HAVE_PACKET_SOCKET)
+     struct sockaddr_ll sa;
+-#else
+-    struct sockaddr sa;
+-#endif
+=20
+     if (l =3D=3D NULL)
+     {=20
+@@ -213,7 +201,6 @@ libnet_write_link(libnet_t *l, const uint8_t *packet=
, uint32_t size)
+     }
+=20
+     memset(&sa, 0, sizeof (sa));
+-#if (HAVE_PACKET_SOCKET)
+     sa.sll_family    =3D AF_PACKET;
+     sa.sll_ifindex   =3D get_iface_index(l->fd, l->device);
+     if (sa.sll_ifindex =3D=3D -1)
+@@ -221,10 +208,6 @@ libnet_write_link(libnet_t *l, const uint8_t *packe=
t, uint32_t size)
+         return (-1);
+     }
+     sa.sll_protocol  =3D htons(ETH_P_ALL);
+-#else
+-	strncpy(sa.sa_data, l->device, sizeof (sa.sa_data) - 1);
+-    sa.sa_data[sizeof (sa.sa_data) - 1] =3D 0;
+-#endif
+=20
+     c =3D sendto(l->fd, packet, size, 0,
+             (struct sockaddr *)&sa, sizeof (sa));
+diff --git a/win32/config.h b/win32/config.h
+index 926f12f..12e1ee7 100644
+--- a/win32/config.h
++++ b/win32/config.h
+@@ -11,7 +11,6 @@
+ #undef HAVE_HPUX11
+ #undef HAVE_SOCKADDR_SA_LEN
+ #undef HAVE_DLPI
+-#undef HAVE_PACKET_SOCKET
+ #undef HAVE_STRUCT_IP_CSUM
+ #undef HAVE_LIB_PCAP
+ #undef STUPID_SOLARIS_CHECKSUM_BUG
+--=20
+2.35.5
+
diff --git a/meta-oe/recipes-connectivity/libnet/libnet_1.2-rc3.bb b/meta=
-oe/recipes-connectivity/libnet/libnet_1.2-rc3.bb
index 785abf66d6..5e35fc3391 100644
--- a/meta-oe/recipes-connectivity/libnet/libnet_1.2-rc3.bb
+++ b/meta-oe/recipes-connectivity/libnet/libnet_1.2-rc3.bb
@@ -10,6 +10,7 @@ PROVIDES =3D "libnet-1.2rc2"
=20
 SRC_URI =3D "${SOURCEFORGE_MIRROR}/libnet-dev/${BPN}-${PV}.tar.gz \
            file://0001-Support-musl-libc-remove-support-for-glibc-2.1.pa=
tch \
+           file://0001-Remove-support-for-SOCK_PACKET-sockets.patch \
           "
=20
 SRC_URI[md5sum] =3D "f051e6e5bdecddb90f77c701c2ca1804"
--=20
2.25.1


