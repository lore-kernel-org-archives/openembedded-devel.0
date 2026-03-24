Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7183F532D2
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 12:59:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18822.1774357185912331053
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 05:59:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Dn8GS23v;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7543866fef=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O4QQh81225806
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 12:59:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=lJPzXzvSBlqU61doT3R9fIzzjsdTAyZvTQSfxmeQx7A=; b=Dn8GS23vldS4
	bebfF6yv3ZQcyvxJ+8irqH3eIC4zcMuNapwuQeRieRX0Rz3ExmJwPkz0C/G7hR5c
	9izZ/H2vmuywgt90JRiggqPSO4dUItJU8mgBSiVZ8oGvaUHep/1ERUpdQBesMALX
	peW2LZtB2cxH6gDwcl4UfbfEarnRHf90QLM2FcjnQz5iNPh5xQUze15DTt0K/Nuh
	MlFhbbT6hbSbshQCiidctVVOuU9mekqbWBrLQ5OUgBss8+iC+/30FzUBNi95+IKr
	aZkEdeNCeobp7s/YteeXWZMVIUCTzPqlEiXqxra0hJeGyikNrwvsanIAWAUZ5dWx
	911iYVkBGw==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012011.outbound.protection.outlook.com [40.93.195.11])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1gj83d7r-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 12:59:44 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bd543ut8sgtfFb0VmqzOn/jP7319d4HS5l06LMRKpG5AabH2qmO+LycYBRDnv8v5Tx9ultgXhhFbgFH9S6TyRuCSJPu31NcNjguTa6roSxHv9s0H8B1S/BfRwjNxJWgogfV0uw9/ZVJAOwdyUZ54+l0ixmlSb8XQsrL8n1YSjxwVfRJYPq4Lw9QxG2PF1WqSS6cKOyCigFLEUcViNmV4uv4VuzkbyFb4IxdpLicLD6/7MNOS5Z3qBVH78URbqg6bJDOBdnIwZVNIWMeEQMWvrmT2bmA/T2mSFbNRh5/cqaIUqMB79WJlJGTneGohv8Qd4tlpzabazrqPoV3YQQoCMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lJPzXzvSBlqU61doT3R9fIzzjsdTAyZvTQSfxmeQx7A=;
 b=cAZZXUON58iG0U3uxYXj3n64EPpbtNTovzKfGeKg8tSpIinkZdfZb8RC960wh59fBRlkxAQONVlA5B0ruoQGdGM1BqRtYhO6qMAhcUbt0NXTUD0cuBCiiw34/SE/80YTl6NDsl/Gg94s7hgVo+B38NxnrfohzkROsE9p4zd5YaY7fUDQiv8lHFxlW/Ji2U+JL+SbvvnEvHBE+Scy2+7548BRW7m+W7QfuQPWXKdsDft0DYyxeQq8g9705E85jApyfBOSHoQ7vswphMAsTzqQebu9lerNr7gyRS9pzBtqMvlNXKIjura8IH8AYOOsXa/aajAz3jf84twkR9IuQhiheQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by DS7PR11MB6128.namprd11.prod.outlook.com (2603:10b6:8:9c::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Tue, 24 Mar 2026 12:59:42 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9745.007; Tue, 24 Mar 2026
 12:59:42 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH v2 01/15] libxfce4ui: upgrade 4.20.2 -> 4.21.7
Date: Tue, 24 Mar 2026 20:59:13 +0800
Message-Id: <20260324125927.1070644-2-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260324125927.1070644-1-peng.zhang1.cn@windriver.com>
References: <20260324125927.1070644-1-peng.zhang1.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0114.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::18) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|DS7PR11MB6128:EE_
X-MS-Office365-Filtering-Correlation-Id: 24a34ff7-a194-433d-716b-08de89a53723
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	D8mnXQ6eONybuYHRvFVs5Sht5dVZldS80ZoJXDtwbQ7cQm6yQaNSgKWYl9/yBPKaKlQwKtfVJcr/IHvovXSZF2h44/Ui7TtiEIhefs6K0KFYh1rN0TQFumyOxFtv+MQtj2HHzP4ykD1Jn154ipelOeYO2/gnIyNFMdwC27uNHTZNpYwBFH8IbnUpQ2sNmJr/97YF/2x+HztHLTeM2EmK6kxV3R92HtJNMy0GrzsLpz6Yf5cbxXV5ahF1qgRWfMzO+2+QTK178YpqNIQ+hLGbPcaXVa5kH7apohJDnJSBqV39ayGSyKKPRW7/9LzhTbL2g0Vttp/T82A3cGBjJ6PpP7iu3W8fl4T9UF6UtdFP5A0TAzdBWjF1UhkgqcU6pp59q4UU9iOhxEy4oT9uG1D4XlsFmWt4k72Xnzs/FrK3ZiDkHoCe0G5D8tGF/DfW1fh4MzuwtG5TfJIKp3b96THbqB/PPu36KRW6fiEbXUckDfJr6XAexARpe4ONgcg14a4nIo6+IFKama/f/MP0XfICcdI+KP/0fQnl9kAPD/Xixvz+Wz4tW2Bp3/pMy/kGMimIJvXNyvlIroLWP77GJwW+NENBB3I9oFSkOuEAJgIjhsyj12iUcLBz9G3ghfh7cMeje2LnTb+eejwKO+H3pRdGrDP6TzEqMSSqwD0owJ72rB+JKdvlq1/hJ6irjP+kd4uFiNljWE4/+dNOyjBL9bcw9gstFpjNbm+8N1wuPOBGfgY4aV7Q9rhMZURTVp5AP9L7
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nFERzYaeUbMwkyLyiMkq680jd8LH5X3MVMJnW4gJ/hzfbOs7KzhNufgwz4E8?=
 =?us-ascii?Q?M9mKJLcU2u5at0YPWCz3qA/UVo6VI2hSNVqdbqISlzrjjHLUr6lKJILNDWiv?=
 =?us-ascii?Q?H3X9e9WZjptAnUrJCECl4FY2BtU5EUuDpYEHpNxjnduz2ke+TkDUipkvA0b3?=
 =?us-ascii?Q?sR290/TLDgg5CQ8FY7v8JdTjk2gN1VJ9GUtkbS66pR0a+CU86nFTVljzpRIA?=
 =?us-ascii?Q?HIYNTGFk8LUDy8To61pg1swzsvgey7sdLOQN6f7jR3EMY4K7SKXKlOOjeQI+?=
 =?us-ascii?Q?BDqQH5+Aybi7752bLysO7hx89L8lEHTuI9tKg7cXUHNs2VVQoL8ehlL7wgv7?=
 =?us-ascii?Q?F1kGO4/FXYzEZdYUVKJRVjZYRGrA9Ujylqb8IvHjTittxlM+ZyaSiQYBp+9v?=
 =?us-ascii?Q?68xq9ubw1gfW78FkR44jVxt7UCby/8s8s3MxqLaI5veAziDozpKx8cZM0vVF?=
 =?us-ascii?Q?VjyU2Q0N0epQ0VAzas95nIc06tqYDz8FYOEoVyXHuD+Do9AHIO/E79HTSFBv?=
 =?us-ascii?Q?VuEl+DDteg9qD7sv5xXvz3t/0jkrL3liG+6ENxkaaPN/TvS53iZzMmpXzwQa?=
 =?us-ascii?Q?oWnPrvbZdn+P6nFo6AGpjl24LFm3BLiXY/2atN6pKdVcpOqJBYNfDudpGy9w?=
 =?us-ascii?Q?zTMuDioESbfKsLS6h0cuMKbzULHh8K8uradSOjBaaXa5Wfw9V9TeMZ43rIW1?=
 =?us-ascii?Q?+iY8TYg3xKiBMoThIdEcYeKcaNatInCN94ucnAbXBM9VBdWmjyMyMCppkXWp?=
 =?us-ascii?Q?Jd6MMurQ5NJj9OCmVCfV1npFrHi2ivw1d1rS4CkBN+NIEUb+vE6KNA3pfXg1?=
 =?us-ascii?Q?eFNyHdejxB+qoXWcElsuDZ9G+zNV9puRbDnamTyqt08QHPRMwuH/U/Su7wiu?=
 =?us-ascii?Q?9FXqFCmsHLMhDZYVQzbbOuapUKkLHnuZihmUiWaIGmUsrJxQJBifQJUIOKgo?=
 =?us-ascii?Q?tE5EXRfcN08GCqVcXtb2eXtsNrBadhzHqjPiCiMmYsnN964v0hm+LYuVEV9Z?=
 =?us-ascii?Q?psIMA6jDVMmY5WmwXfXSgMVF7H6xR5afaM/v+nM43oeg3rp7uyq0eG6VbKSN?=
 =?us-ascii?Q?b/frZaEw8SjOH9hzOiRkdtwtHqZ1Acgok9/g7lRfrhVf5XxYhClWfce/tYcl?=
 =?us-ascii?Q?Qku1KBWFX4xwRt1KDLmKuNPeAWI7Fznlr9zR2KAkwL8v6sfS21lMxkL7wmWj?=
 =?us-ascii?Q?eotPSkgzIiDgEbs4dnz8KhrasUcrKayf+K7dfDATGvInSmsE8iSPSghEIngJ?=
 =?us-ascii?Q?tdN3oKCwVm+Tf4Eyb/M796TKBU13ILFSP4XJkAD0lw9QmJxWw+Hfks73F+v3?=
 =?us-ascii?Q?qY/mCuNOCfr0/2kPKiT6d/ikQiBmNF61BTpIP/cEbUspmkXivTMNVnWelJYt?=
 =?us-ascii?Q?XQr/i5s+yzzVXhv986q1fNoxHywQFx1XxZ+05HWcQ3AzRAQoknqg32CTqrnY?=
 =?us-ascii?Q?9zLSBxZgDq173zsMWCv8W0ljkAWvOHsZE/En2K4rJbAg3R+X0/Sqwwj8A0hq?=
 =?us-ascii?Q?hGGmkfGmCwnnNvUYPMBxFk13ThjE4tZDIzewwAKG6hKT0POVCmwAQkqaNPtc?=
 =?us-ascii?Q?Bz3NtqJkaMxzbVfSGQbvZfHvOmAaSGZZag1rcZdIS/XmT2EbEvM3KuSPhjZa?=
 =?us-ascii?Q?lBxlORGNhum7eUOuIk1I3kIrQ6EvdJVzOuTWqdq+eoNjJRoyWY29HgSKLS0a?=
 =?us-ascii?Q?O7Mw+7OS5gAhRxvQNbOmb9pdDGYQb57ZegIs0PpW2pAmv3a3QJ1g2kEn7A7j?=
 =?us-ascii?Q?dzpDgZgFveVuk6qya8jbhG1SfLwTaas=3D?=
X-Exchange-RoutingPolicyChecked: 
	O0bEAMxROUdPOmsweoKJmGapHw5lOOfTDJFQH5ycjFp3/YebwxVoYLW2pIH6XU24XvB9qbolXHfO/Ozp+J/AovAda8KRDbSUy4G8uztcEzm8xi7ZVJF4qozidqg+N4Gg7aruALcbNO7of4QitqBgB4qBt4x6BGyIbEhXOFIMgjxsM1bryVhdOEiMDQS4bTTRCf5F9hrbKDmZGPik+PKrA27qC1+9wET+u6oTxygD+tjrwpSwI6/iMJTvFfTiwSH8Y+K3SpjxdOoo5c0bjNDr0/FPkuHKe/SBKJ8jQJ8GUKPgs67S0TTB8upUN13vxFdIx4MWuthxendUVrU1cRRC0Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24a34ff7-a194-433d-716b-08de89a53723
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 12:59:42.2782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JyXcEJy2qcVw/lnvsYLxcELBkml8eAVZHkDSTmK0WIdh9uSBAR/GJJA3gAYL8UdxlS7iIeNYgXeCpypI33xqQjydgLczz5hGbrTlOsl43A0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6128
X-Proofpoint-ORIG-GUID: p9RMKQu08Q6kPJdGLAkXcPLqcvx7HTnE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwMyBTYWx0ZWRfXxp5oZpEikT/u
 B6j7AVIuhciNuSp20RS0yMFeZJAekW3qpkGVvATq00pyBY+ELFCV1FrV0OlMMaP9R42fhirE7D9
 E+kbA50nI2CvbzJ3tLvIxQkTtORSgs2Cv21bGMuRZ2gWUJt3nurF5zJuoh5patd7UsK+/RlEctZ
 iMKpIzk1zr9T/0PzMbHO9Tq0uNtkr3p/Dhy5N7lC7s3126wdB2PbQZUwRnbWwIPdyBc1rA1R0Ku
 o6Lwiaoi8l4LWJgEawLPlErMUGCH42SbCNhxb2j2hb+UJlgcZpXu7JnSU0hR/h21so9AygjqpFW
 L5QBCdQwokv2ZEK2u0ywGx9QB7iO/0mN4SGyV0bnJL2gy+ni8hJEvJCxjX+sOsdNC61pfu31x6P
 dTALh8choeM2Iuqi7EtfTWn4zjY0WAv8BQK8TlDpFj1VwkWfIL1/If04t3mFJn/257LbEzRcYI4
 hUfePtlI8d5FIjtprFg==
X-Authority-Analysis: v=2.4 cv=LtqfC3dc c=1 sm=1 tr=0 ts=69c28ac0 cx=c_pps
 a=ekzRQQX7ZilozLPATeYkEg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=O24Aq5uEAAAA:8
 a=t7CeM3EgAAAA:8 a=VITeBODsRHNFMWYxSvsA:9 a=SYBONWESK5muIIdMMRMZ:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: p9RMKQu08Q6kPJdGLAkXcPLqcvx7HTnE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240103
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 12:59:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125560

From: Zhang Peng <peng.zhang1.cn@windriver.com>

ChangeLog:
https://gitlab.xfce.org/xfce/libxfce4ui/-/tags/libxfce4ui-4.21.7
https://gitlab.xfce.org/xfce/libxfce4ui/-/tags/libxfce4ui-4.21.6
https://gitlab.xfce.org/xfce/libxfce4ui/-/tags/libxfce4ui-4.21.5
https://gitlab.xfce.org/xfce/libxfce4ui/-/tags/libxfce4ui-4.21.4
https://gitlab.xfce.org/xfce/libxfce4ui/-/tags/libxfce4ui-4.21.3
https://gitlab.xfce.org/xfce/libxfce4ui/-/tags/libxfce4ui-4.21.2
https://gitlab.xfce.org/xfce/libxfce4ui/-/tags/libxfce4ui-4.21.1
https://gitlab.xfce.org/xfce/libxfce4ui/-/tags/libxfce4ui-4.21.0

Backport upstream patch to fix full buildpath in headers issues.

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 ...splay-full-path-in-generated-headers.patch | 38 +++++++++++++++++++
 ...xfce4ui_4.20.2.bb => libxfce4ui_4.21.7.bb} | 25 ++++++------
 2 files changed, 50 insertions(+), 13 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui/0001-build-Do-not-display-full-path-in-generated-headers.patch
 rename meta-xfce/recipes-xfce/libxfce4ui/{libxfce4ui_4.20.2.bb => libxfce4ui_4.21.7.bb} (61%)

diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui/0001-build-Do-not-display-full-path-in-generated-headers.patch b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui/0001-build-Do-not-display-full-path-in-generated-headers.patch
new file mode 100644
index 0000000000..c7ea1e6fe9
--- /dev/null
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui/0001-build-Do-not-display-full-path-in-generated-headers.patch
@@ -0,0 +1,38 @@
+From b8bf147d621739a1b8a4d1cc8398d1c90288e9d6 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ga=C3=ABl=20Bonithon?= <gael@xfce.org>
+Date: Mon, 16 Mar 2026 16:21:51 +0100
+Subject: [PATCH] build: Do not display full path in generated headers
+
+Fixes: #144
+
+Upstream-Status: Backport [https://gitlab.xfce.org/xfce/libxfce4ui/-/commit/b8bf147d621739a1b8a4d1cc8398d1c90288e9d6]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ libxfce4ui/meson.build | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libxfce4ui/meson.build b/libxfce4ui/meson.build
+index 8cac84eb..ca5ac927 100644
+--- a/libxfce4ui/meson.build
++++ b/libxfce4ui/meson.build
+@@ -102,7 +102,7 @@ libxfce4ui_enums += gnome.mkenums(
+   install_dir: libxfce4ui_install_dir,
+   sources: libxfce4ui_enum_headers,
+   fhead: '#if !defined(_LIBXFCE4UI_INSIDE_LIBXFCE4UI_H) && !defined(LIBXFCE4UI_COMPILATION)\n#error "Only <libxfce4ui/libxfce4ui.h> can be included directly, this file is not part of the public API."\n#endif\n\n#ifndef __LIBXFCE4UI_ENUM_TYPES_H__\n#define __LIBXFCE4UI_ENUM_TYPES_H__\n#include <glib-object.h>\n\nG_BEGIN_DECLS\n\n',
+-  fprod: '/* enumerations from "@filename@" */\n\n',
++  fprod: '/* enumerations from "@basename@" */\n\n',
+   vhead: 'GType @enum_name@_get_type(void) G_GNUC_CONST;\n#define XFCE_TYPE_@ENUMSHORT@ (@enum_name@_get_type())\n\n',
+   ftail: 'G_END_DECLS\n\n#endif /* !__LIBXFCE4UI_ENUM_TYPES_H__ */',
+ )
+@@ -111,7 +111,7 @@ libxfce4ui_enums += gnome.mkenums(
+   install_header: false,
+   sources: libxfce4ui_enum_headers,
+   fhead: '#include "libxfce4ui-enums.h"\n#include "xfce-gtk-extensions.h"\n#include "libxfce4ui-enum-types.h"\n#include "libxfce4ui-visibility.h"\n\n',
+-  fprod: '/* enumerations from "@filename@" */\n\n',
++  fprod: '/* enumerations from "@basename@" */\n\n',
+   vhead: 'GType\n@enum_name@_get_type(void)\n{\n    static GType type = 0;\n\n    if(!type) {\n        static const G@Type@Value values[] = {',
+   vprod: '            { @VALUENAME@, "@VALUENAME@", "@valuenick@" },',
+   vtail: '            { 0, NULL, NULL }\n\t};\n\ttype = g_@type@_register_static("@EnumName@", values);\n    }\n\n    return type;\n}\n\n',
+--
+2.34.1
diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.20.2.bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.21.7.bb
similarity index 61%
rename from meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.20.2.bb
rename to meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.21.7.bb
index a0be1f6067..e672eae540 100644
--- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.20.2.bb
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.21.7.bb
@@ -5,29 +5,28 @@ LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4cf66a4984120007c9881cc871cf49db"
 DEPENDS = "intltool-native perl-native gtk+3 libxfce4util xfce4-dev-tools xfconf"
 
+XFCE_COMPRESS_TYPE = "xz"
+XFCEBASEBUILDCLASS = "meson"
+
 inherit xfce gtk-doc gobject-introspection features_check
 
+# libxfce4ui uses 'gtk-doc' instead of 'docs' for meson option
+GTKDOC_MESON_OPTION = "gtk-doc"
+
 # xfce4 depends on libwnck3. gtk+3 and libepoxy need to be built with x11 PACKAGECONFIG.
 # cairo would at least needed to be built with xlib.
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'x11','opengl', "", d)}"
 
 # TODO: Check if 0001-... can go
-SRC_URI += "file://0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch"
-SRC_URI[sha256sum] = "5d3d67b1244a10cee0e89b045766c05fe1035f7938f0410ac6a3d8222b5df907"
+SRC_URI += "file://0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch \
+            file://0001-build-Do-not-display-full-path-in-generated-headers.patch \
+            "
+SRC_URI[sha256sum] = "a72a7af39cf183819bcfb61b1747d425261e966ccb172b2fc28f1494f524bd17"
 
-EXTRA_OECONF += "--with-vendor-info=${DISTRO}"
-EXTRA_OECONF += "--disable-vala"
+EXTRA_OEMESON = "-Dvala=disabled -Dvendor-info=${DISTRO}"
 
 PACKAGECONFIG ??= " \
        ${@bb.utils.contains('DISTRO_FEATURES', 'x11','x11', "", d)} \
 "
-PACKAGECONFIG[gladeui2] = "--enable-gladeui2,--disable-gladeui2,glade"
-PACKAGECONFIG[x11] = "--enable-startup-notification,--disable-startup-notification,libepoxy libice libsm startup-notification"
-
-
-PACKAGES += "${PN}-glade"
-FILES:${PN}-glade = " \
-    ${libdir}/glade \
-    ${datadir}/glade \
-"
+PACKAGECONFIG[x11] = "-Dstartup-notification=enabled,-Dstartup-notification=disabled,libepoxy libice libsm startup-notification"
-- 
2.34.1


