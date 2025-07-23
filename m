Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E37C83F27
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 02:15:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4954.1753236925180775173
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Jul 2025 19:15:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9299de1fec=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56N1SiD91249756
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Jul 2025 02:15:24 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02on2065.outbound.protection.outlook.com [40.107.212.65])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 481vqmsm0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Jul 2025 02:15:24 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DyFa+tQmG4FI5+nPxwn8UeqLB/5tDHVp6MIjOAempl8aGJZMsbXp7mtdbvkUvdBETes2BeRuYOsZ1/JCMkurWEzNoGVtx+coR8BcAtdND6Z1lQnogRgVCLRJev1jMSWIFLb4Neb1hSIyf3ISX0VKdfwRmLXn3HE1hW8i44QOMOsKlPuuqurTRPX0iJT84xfnq1+SJuEwwQWbPwUTKT6bshEGKERc2BO6UBbpBpmzY1bqcg9kKYCWXLzwD6yjDBZczY8FIi9Ik6s/oe65pXeTv8Un0P80CGLh8t1ct+E8SSyMm8j0oLsU7igkufPMDXuYq786t3ui/tFRQZ1J/lNcLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fg3RCkciJEDPXpe9fVnOfKhEILA9tPHN/MC4D+eJO1g=;
 b=gjRVRkI8SUDff7P8oidyAataXZ3WyJyXqBN9jYcc9Tfq+BmOFemSXbfK5Wj4S5mctqLBUJuf0gi+XmCrHNkep7EugZW7QJwbTb7RyTa8FBZ/AbiDEGGpeO9dSC2rlhuQyYLo0Ikeu3jONLf7Hb8TudQxGtH1Usc3uaE3xYbbYaeq01e1B2N4VUqpVo6bBRYohwvzKhC2CIaHO+P5bfQdb9/dnHAzoVhf5A+x0R0CXh2Cqsup454gXoHz+WInrDaEibaxHrFKwsKrjUih4KBFtD5xuijNDd8IvDKZXX+2IMy8cG6ZO+q55J/apvjluV3WQq12Jp7KXxghiwad/gfmPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21)
 by CY8PR11MB7058.namprd11.prod.outlook.com (2603:10b6:930:52::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 23 Jul
 2025 02:15:19 +0000
Received: from CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86]) by CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86%4]) with mapi id 15.20.8964.019; Wed, 23 Jul 2025
 02:15:19 +0000
From: "He, Guocai (CN)" <Guocai.He.CN@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-openembedded][meta-oe][scarthgap][PATCH] mariadb: File
 conflicts for multilib
Thread-Topic: [meta-openembedded][meta-oe][scarthgap][PATCH] mariadb: File
 conflicts for multilib
Thread-Index: AQHb+rlwaLBxAm6dc0WMkBLPftDCxbQ++X3j
Date: Wed, 23 Jul 2025 02:15:19 +0000
Message-ID: 
 <CO6PR11MB558698743323B97FB4F2B0AFCD5FA@CO6PR11MB5586.namprd11.prod.outlook.com>
References: <20250722033332.3579660-1-guocai.he.cn@windriver.com>
In-Reply-To: <20250722033332.3579660-1-guocai.he.cn@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-07-23T02:14:58.579Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5586:EE_|CY8PR11MB7058:EE_
x-ms-office365-filtering-correlation-id: 5bff39eb-6c26-49f5-5d22-08ddc98ec59b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|7053199007|8096899003|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?c+0yUzJ2EAMwJpJvs0YpU1MQCUaqMJmL9I7+LDviWQFV2IQS0+iHPAgH+Zoh?=
 =?us-ascii?Q?ktDyBtJjEpr2EkHkEwscVvAjdrpF/EoODBrTLG8o2Ds7lxXVI8lMCQKLalB0?=
 =?us-ascii?Q?Xcqaip1A3X+V7GuIoTi0TY0cNAoY7xkRQWfPHZH3s3SLtXop91VB04M8QkDX?=
 =?us-ascii?Q?uhX6lAV63oMgz3BnoD9e1Vm5F/9HMHXImH9Nb30eeoyEHww1W9EmVfvXuq3O?=
 =?us-ascii?Q?2Qpk2GAYVSxaP3vDNAUNsG3TEg8uNjlq/lArZ78wSs7538UDvlqTAVe45tdU?=
 =?us-ascii?Q?oyjp+tKrf0D8AqvC8MQBE3q1VnguLJbzYn8491gQLd6LtF5/RMYWb3oz8N4M?=
 =?us-ascii?Q?jcVba0HM5wcMV4G/nhylaATuzUoDZC16HWSB07fL2iYoxuixhOSmCkPSit8Z?=
 =?us-ascii?Q?nsLTgV5BvsXwbu+uPwYQNJy9lcU/CMhENjBLqIP0/j+sNrzAYHKChJJiDyes?=
 =?us-ascii?Q?GbBrOfsOsW+oBQfDj2fFwtaA8QKcWvhqmj154UPoLbce/Udeb07zLW8rHx8s?=
 =?us-ascii?Q?YjxSat5qsMJAtThHsWv2H5QaaiHRMvbjsmQxVp6lxrQa1PpzU04bGoqYWmUb?=
 =?us-ascii?Q?EoVFhSGWyjkfClstERS9lbGpbmgMvGeiRYyXaOuQecJQHhZ6utyQ7ch4Kqba?=
 =?us-ascii?Q?xz9S0oTIjAbG+I8m8EcAjGbuLO1FqoPjGay9ze4FRMVCIv1gbO+oC85io0ix?=
 =?us-ascii?Q?jAcQOtTD4B3Q9T5GForTPGc3Vb62oPwo7i/x4/lzwMd8mWefoIJjXnwFlfkw?=
 =?us-ascii?Q?3Qe4kjfyw0tqOq2C4tdESubCbX2DtKythbd/6jZ4R5HduLTQnZvm+40vFIZ4?=
 =?us-ascii?Q?clo7UPreo5O9KbAwAgdF9nFEs3UvaPat8WrOMi4LmIlkZBC5SSuF+O+2EFS6?=
 =?us-ascii?Q?DPYGtD/JM84Mab/Cu4TvehN0wQRcL0DaFNBjYiGu5nroxA/BxFBR8Fwu5Dzf?=
 =?us-ascii?Q?JnvUV/MXGqMzQZ9qf/UJOwoNyiheSoJPb6Br6zIcW6NPW+PPOGFFWYWVzMAS?=
 =?us-ascii?Q?is7ju8kUisT6U9oBcmj3Fm9jR4pzMztShIJdqv5+YLC07eiLLrRxM2NS70+J?=
 =?us-ascii?Q?PVtf/iJQm9kinAQ+ZKzl++P6Bf4zMpSbt6RYRGD6LU4FBZ6zofJE7lNKLLe8?=
 =?us-ascii?Q?MbB9twGPRhHDgZ8SRxcvfgTDB0H1o86Wgk9Wn8sq6Dnzic//s3zMCDomi0vt?=
 =?us-ascii?Q?98bFevWB/V3g7n9YfgHRPRCV9Nr5Zh0C3NHVMr4m+f2K6krKvFXNaxBGKAZE?=
 =?us-ascii?Q?gznIeOJ42qFQo6cv43AneOO848R9IU40dOZfTvPHvEgKQ/gqHgILpozt5q1t?=
 =?us-ascii?Q?zACTVz5lUoO9JjTTEwe2BMqlTwNUzIxkCDeHBKIz86a/reI9H3TxtqgVfohx?=
 =?us-ascii?Q?1ALA6XtLTGMcr/sHzOalJ60NUM1NoGmtp0WvVm6HpKzQdHixL21R496U+zyd?=
 =?us-ascii?Q?GYWH0/njDFwMosSQOofN4NQSPZwf7ddGDvNYnLHZcWoDNGlp9TpdHA=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(8096899003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?qQ6Yv5A3UMvwNCek0tDntYx40jUfwRnvOmKdxKCvHKUe23gdk9dydMDnT9dM?=
 =?us-ascii?Q?woucd53GBo5pYCdvWp0rJI+einy/F1ArnRqKOmaTv4F+/sWuSuaXvooKWdAp?=
 =?us-ascii?Q?U+7L3rDuxeN9giq7eOWH/5ns2BU9wBt1N2NFu7Kliqgi+LsvBMxmvinkTFek?=
 =?us-ascii?Q?ldXyFARB/7UeUe3fo+NpOWIPynpe9evZDkjpGLy+ouBZEJbWP1Pn2w0v2KID?=
 =?us-ascii?Q?ZY5KgpIUxNS4I5rk4Qk/anR8quviMXLppq/jEQyWkB5tY+dyD97LW43PVuay?=
 =?us-ascii?Q?+0S6Uh9IoMNhI9qAPp2NMPyUdumC/tCK5Cfk49wBcnzvu9VH29EMV6U71+nw?=
 =?us-ascii?Q?+7wasLqApQqZeNsLBIrgr95jap3uWPJzICp2aRcm1PB3H/9T4RM0VGFFKT4b?=
 =?us-ascii?Q?+fBI2T06kl2VpugUSaunoU6Dr/u4/zV/4jEM9tMmWuRlqldZY7zZwbL0yemX?=
 =?us-ascii?Q?iLBYtaPHlHhMJdJ/lIKsLitUx1SalSSohgWg37IOWUKb15F5+juqRyvPBxIZ?=
 =?us-ascii?Q?KlZMRf8U7cZioXShotZZm8UX5I4L0DEoWQHP1Ub+PBtD35Vaa6j5QeFukawa?=
 =?us-ascii?Q?wwApHOmClxZiVQ7uEWNZWt440TcQw6VlS6GQ1sixAQsjUn59354vL9e18j53?=
 =?us-ascii?Q?UR7ktfZU9cHdEAfQ2iNpzxqbI5eAE39xmVoVLlxNJzJmywzLR71Jkf08fFI0?=
 =?us-ascii?Q?xqNtLwBm8vUKYlYrq0OFxWv3P0afyn6lgFqhfFl8sPod96nNHvbLYKuJJ8Ah?=
 =?us-ascii?Q?NLvoafc1lzV5ptsphUwFan9NAlaGjP6866b3FuI1/4YyJILhKYWYs+dtJZVi?=
 =?us-ascii?Q?fKMnczuV7TmX/HBrjDOm17VNSUJv+exD+S/rk07mfLqz7uOupz4hwJG+Tpx/?=
 =?us-ascii?Q?+/rtUI/D/cPu7tTroEo5S83QrVYZZQiGZNU7p79bobb+d76RE7/edBH6aVDo?=
 =?us-ascii?Q?nzKJ4BCap2zC5Bsd3Z2srtNJYacaTSWd9w66oZTZWrFTjb/6YThrejL4Qzqd?=
 =?us-ascii?Q?JL754GU3oUDTZaclkJ2MsGKABdPXz/wHX8w3ICSZ0kgM2UDd4u2pQGf3KUYT?=
 =?us-ascii?Q?cFH0KvreB9Bu2JhDRrqSfUDmo/sidUNhlDd8AVOHgTCDdGb+m9rM7AGBaRl6?=
 =?us-ascii?Q?/FMcoRL2+CL9V5jU+mnVOjOvWaxQJSeABQYYQ7qkN96QKltUYNYugiDrKeJG?=
 =?us-ascii?Q?TFfa7nBq5ppCYbiZAB7/Ht788E0pzlnQJop91rUzf1HglspKogk4jgkQVaqH?=
 =?us-ascii?Q?B4Y9AW7YPbZ9m+DfgwPzhU08DNvaEfp8DdEeoSulXG6lyrKzqDTwLZb6H0S8?=
 =?us-ascii?Q?lGVKKE29J1mwJk7zIz5ORqO3aTybM7NwBG47Id3dxJPfYWqT4LVDwCfCKByw?=
 =?us-ascii?Q?JlmzEIbK991fVuu5+V+eAsTNPq3feviw7D/zh8rcAVhAdnqrciPCj0jamCRB?=
 =?us-ascii?Q?TvkHONpQUvHvg2/OLqaWC8Lj19IVt1shca4Go4DOQMVxWnXBUHCk7p6IakK/?=
 =?us-ascii?Q?4il7tv1Bth/Yi1eHIZKteESpV32YPlQUr0yqlSJ0rw5Kx7Y79RUTnwqMHVsk?=
 =?us-ascii?Q?p7B0WFcvY4imN9dYiPH2wrY/IFhWnaCaTi3n6QrV?=
Content-Type: multipart/alternative;
	boundary="_000_CO6PR11MB558698743323B97FB4F2B0AFCD5FACO6PR11MB5586namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bff39eb-6c26-49f5-5d22-08ddc98ec59b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2025 02:15:19.4181
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s5hRiMHAH5YfkxkMSu/jl1GLDzeTgfppghuMJsCtpAom1AuMeRNCCWHL3R5PI0SidYcQ8HmsxKWPvc1qKg2y6udc3/IEz3LS6PcXF4DDwQM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7058
X-Proofpoint-ORIG-GUID: tFdvh_agsnwAyQ-MRdfc3tt603gKYaMP
X-Proofpoint-GUID: tFdvh_agsnwAyQ-MRdfc3tt603gKYaMP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDAxNyBTYWx0ZWRfX/WRDli02keRK
 LCwqFPn7AZ7kE0GkbYsMOpIBi0bpiVTZTWA0fZSx4jFYnLgp5I/CWXKtQnbHHsy4j24Gnqx+ye/
 Ec5XVwxInzUSySehmFMhjtW/ft1imDsSV2XrLXRhukisTxl3e7z+ETskg+jX98pRuP1JHpwaAuC
 t2CxjBIb42o2xMVzdlDzt0UEv2gilvbeEgN1lB9wOFRcO4JTG5FYPIOrUlyHzz7qxZyH75P4hY7
 0z2Tnf3QMQnkKxHfj7FjTTFLgD77FJdFZPbO7l7uGQkb0RVCibIenFlKBN4Z4oa86C9vfFK1iAl
 d1wqvGzjVRqDIBqNmkolZVuItP/fzIkZm28jKBCenu9IPTS7IOxzJJC1yjTvd7zHLf5REmN/tZc
 P26dfEmN
X-Authority-Analysis: v=2.4 cv=BbrY0qt2 c=1 sm=1 tr=0 ts=688045bc cx=c_pps
 a=zGATrNSX/tQ3ThVYaNLL7w==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=Um4z8P8mbPEqFpxDQRsA:9 a=CjuIK1q_8ugA:10
 a=s0UjQqRc4egehh9P1mMA:9 a=Gygpg9l401Ep7aqE:21 a=frz4AuCg-hUA:10
 a=_W_S_7VecoQA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_04,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507210183
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Jul 2025 02:15:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118708

--_000_CO6PR11MB558698743323B97FB4F2B0AFCD5FACO6PR11MB5586namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please skip this email.
I will update the commit info then re-sent the email.
________________________________
From: He, Guocai (CN)
Sent: Tuesday, July 22, 2025 11:33 AM
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Subject: [meta-openembedded][meta-oe][scarthgap][PATCH] mariadb: File confl=
icts for multilib

From: Guocai He <guocai.he.cn@windriver.com>

File conflicts between attempted installs of mariadb and lib32-mariadb

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ddd322323eba44542b6b631d455e3298c50c4535)
igned-off-by: Guocai He <guocai.he.cn@windriver.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/my=
sql/mariadb.inc
index f52947f359..abcf0b3cda 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -33,10 +33,12 @@ S =3D "${WORKDIR}/mariadb-${PV}"

 BINCONFIG_GLOB =3D "mysql_config"

-inherit cmake gettext binconfig update-rc.d systemd multilib_script pkgcon=
fig
+inherit cmake gettext binconfig update-rc.d systemd multilib_script multil=
ib_header pkgconfig

 MULTILIB_SCRIPTS =3D "${PN}-server:${bindir}/mariadbd-safe \
-                    ${PN}-setupdb:${bindir}/mariadb-install-db"
+                    ${PN}-setupdb:${bindir}/mariadb-install-db \
+                    libmysqlclient-dev:${bindir}/mysql_config \
+                    "

 INITSCRIPT_PACKAGES =3D "${PN}-server ${PN}-setupdb"
 INITSCRIPT_NAME:${PN}-server =3D "mysqld"
@@ -159,6 +161,7 @@ mariadb_sysroot_preprocess () {

 do_install() {
     oe_runmake 'DESTDIR=3D${D}' install
+    oe_multilib_header mysql/mariadb_version.h mysql/server/my_config.h my=
sql/server/private/config.h

     install -d ${D}/${sysconfdir}/init.d
     install -m 0644 ${WORKDIR}/my.cnf ${D}/${sysconfdir}/
--
2.34.1


--_000_CO6PR11MB558698743323B97FB4F2B0AFCD5FACO6PR11MB5586namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Please skip this email.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
I will update the commit info then re-sent the email.</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> He, Guocai (CN)<br>
<b>Sent:</b> Tuesday, July 22, 2025 11:33 AM<br>
<b>To:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;<br>
<b>Subject:</b> [meta-openembedded][meta-oe][scarthgap][PATCH] mariadb: Fil=
e conflicts for multilib</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Guocai He &lt;guocai.he.cn@windriver.com&gt;=
<br>
<br>
File conflicts between attempted installs of mariadb and lib32-mariadb<br>
<br>
Signed-off-by: Guocai He &lt;guocai.he.cn@windriver.com&gt;<br>
Signed-off-by: Khem Raj &lt;raj.khem@gmail.com&gt;<br>
(cherry picked from commit ddd322323eba44542b6b631d455e3298c50c4535)<br>
igned-off-by: Guocai He &lt;guocai.he.cn@windriver.com&gt;<br>
---<br>
&nbsp;meta-oe/recipes-dbs/mysql/mariadb.inc | 7 +++++--<br>
&nbsp;1 file changed, 5 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/my=
sql/mariadb.inc<br>
index f52947f359..abcf0b3cda 100644<br>
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc<br>
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc<br>
@@ -33,10 +33,12 @@ S =3D &quot;${WORKDIR}/mariadb-${PV}&quot;<br>
&nbsp;<br>
&nbsp;BINCONFIG_GLOB =3D &quot;mysql_config&quot;<br>
&nbsp;<br>
-inherit cmake gettext binconfig update-rc.d systemd multilib_script pkgcon=
fig<br>
+inherit cmake gettext binconfig update-rc.d systemd multilib_script multil=
ib_header pkgconfig<br>
&nbsp;<br>
&nbsp;MULTILIB_SCRIPTS =3D &quot;${PN}-server:${bindir}/mariadbd-safe \<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${PN}-setupdb:${bindir}/mariadb-in=
stall-db&quot;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${PN}-setupdb:${bindir}/mariadb-in=
stall-db \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; libmysqlclient-dev:${bindir}/mysql=
_config \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
&nbsp;<br>
&nbsp;INITSCRIPT_PACKAGES =3D &quot;${PN}-server ${PN}-setupdb&quot;<br>
&nbsp;INITSCRIPT_NAME:${PN}-server =3D &quot;mysqld&quot;<br>
@@ -159,6 +161,7 @@ mariadb_sysroot_preprocess () {<br>
&nbsp;<br>
&nbsp;do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; oe_runmake 'DESTDIR=3D${D}' install<br>
+&nbsp;&nbsp;&nbsp; oe_multilib_header mysql/mariadb_version.h mysql/server=
/my_config.h mysql/server/private/config.h<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; install -d ${D}/${sysconfdir}/init.d<br>
&nbsp;&nbsp;&nbsp;&nbsp; install -m 0644 ${WORKDIR}/my.cnf ${D}/${sysconfdi=
r}/<br>
-- <br>
2.34.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_CO6PR11MB558698743323B97FB4F2B0AFCD5FACO6PR11MB5586namp_--

