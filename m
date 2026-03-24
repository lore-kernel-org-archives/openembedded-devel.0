Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01B64F54AA6
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 13:00:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18830.1774357199493847614
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 05:59:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PoamVCOe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7543866fef=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O4kRSH1260154
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 12:59:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=fUpuP0G9Z4nvTwTKdwRnJ1n7mks9+Wgwi8b/wT/Bc4Q=; b=PoamVCOeT10c
	N7tbgVUQ1r/CQzEE8X52MK1rO5gLLErgco3cLuQpUlg3QTj2iGk9XjuxH5zkX3fM
	C1bJMpt1qU95KoHk6Opgt4yObajGeX7DwnfEhdIxEmdCMPX/nglJCexPHbIAKve6
	vaM0pVbqVdqHlfEez5K2WHtgzBj9ya8v6p6ry2v2154p/7PmcNw5phbq6fGY9C1R
	+KiSh4AyOA163/iBpa7YHHk+iS2b5L6KzyW8JAnTbEUizMlZNaue70qNAePo1MEF
	nyrvP+QhKsIrkYt+jT3ZpJYbs6JJoALtHK4nfaizWNhF1FDu7iGW7YlXnslFvW2V
	+ynrA5TUXg==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011022.outbound.protection.outlook.com [40.93.194.22])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1gj83d8g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 12:59:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nX69+Ae7R4TI7R+Z9eqpC1dZs6VnHoV66VtDkqSgOhAVEInC5kR6KvH7RQlTsPOJc2TxgrNJ2oLP8oz8Uxro3Z0rMylqwRJi2QqZpxJ13Z+tci2RRSl0L6DQPk/zif1nypKd2DLcmC1Rby7RYrWjdG2U4SXnea4iSccEfOyC0vqwvSTZ9oYPgDVLsDakMHlfplv5q4Hbm5UO5FUTaA9cKIc0QDCPsg4nIlv5Ir33jnBU/Bwq5np1bDkGmsBXlCoM/XwPu0b/3dWbrUJI6ZxxpeF16ssgbalmgnLyO0+LN4xw4xAzITyhSZtf7z9ZsXKkLgHZar2TPXYK+2wSDZrdxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fUpuP0G9Z4nvTwTKdwRnJ1n7mks9+Wgwi8b/wT/Bc4Q=;
 b=B7tFrXfhRysnVT+dEbOA6wTEqIbg0nZh7Zut9jveUH4zQEy4PWdjmjTGkUSB10OxbHjVNfltF4y3IMPlMZ9YSauIxx5E6IZCCSIbhyLz6gwuQmJ6WCCV6ZQWGC5FOMBet/qA0bn9yZVKssFp7oVpcLZ6IV+0U+J9peX/HYy/tTtf3QLM0fiGZLDiC22t3Fjzk8fOpbm0snEm6C9zlxnZY1WdLga+tWfFc0WQdm0PnCEuoGTHiJpdedW07QHhopbbQ8CyCkhfnZFqa1ljx9rKyYa1Maz53xi93pEEj9NB9kmh0HayMuZlpqBJrrRTbgWkQvIobz4WdK9WX+KAvm1jyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by CH3PR11MB7297.namprd11.prod.outlook.com (2603:10b6:610:140::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 12:59:57 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9745.007; Tue, 24 Mar 2026
 12:59:57 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH v2 11/15] xfdesktop: switch to meson build system
Date: Tue, 24 Mar 2026 20:59:23 +0800
Message-Id: <20260324125927.1070644-12-peng.zhang1.cn@windriver.com>
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
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|CH3PR11MB7297:EE_
X-MS-Office365-Filtering-Correlation-Id: c3750d71-14e5-4cb9-28a5-08de89a53fd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	5AYpfCRA/SAcCYWQHdVHuonLL1IT8vfnE7hqZRKmIevGIUsWdb+8jTDCUvQGiIfv/p2AMx6FL5eBRBKmMfOOuxXyRfwwbUn0YDMt5U4E9tq3v9outi5dVzmoUuFey41q4+H1Yu3nJW6IUDCVHQ+xDCIstbrPPlonQmPRvCE8XIB19ISYUuBsmErlrSXmxMrSks00em8i2v7LG4qanamNuoAgFZlmbvvBB9Kx1ZbIZZ8NTHFK5bUO0UT5h81dkQWJc2sg2lm7BGmPJf3CjhKnNCZj5AtwDxrUcSEUGd5fIA5Mbj9D0i7Lv2tJ/9x2UdiNc2YuPYVgLXRP+y6W8pow+uB4don87d1u8UuDUQHfuGmKS9CtbrbSvhS8Wurz80fXTCqiIDNjF4dLAth7I/mmOga6rmiH0kPyPsK+1FbcqPwdIs0UEfYbYrZTE6Qw6akxrgikFyR0bqFCF9ajI3NHppoZUkjVtxRJ1I/fExRZBQ8IrMcYZXSL1hl0SHP2qBHn9RxoGmf/NfW61fKaXbrctAbVH+J2ycmgk7GQMzvvLz/zlcAIu19C5L3ZWHHkSvb/zPADEcTEBl8lwVRi4/M0LofHrf20yfo4bU28DRcvMp9Z/VvI2zDkj9VYf9r9h1Ur1TZbTKNzUqvA475Ls5atkpcTwK5RSvIy1oWEScfZfts+dbpySh6qoyfLLJpAsXuI+5QDT3jFdDPtyxwBvU9GqNnOeRMWMKUuf4JRfX6KboHOiHod8/xEvufqE2O6ne7KQN87ANherEMAT5jLWiXLzlX4K4HngJUizlqxzASgqic=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?j8+gSXbTtwLKKvIFX7XTHOxoRKRJ6l+BIKmfLFJUzN5OivUnYfm3QtDj9G8K?=
 =?us-ascii?Q?dRPw1eO35ghkYTOzEbSg59UtS4yIyeUl2seivLVVKnOEphO1CEBrxe0n1XVB?=
 =?us-ascii?Q?YgSkFgOQbTsIGbNMSiZiuEMmrZKQjjDRF1mPj5BHHw9Zx0PTFyTrIt9gCJBT?=
 =?us-ascii?Q?h29a7l7iTJcSwIxHC96JG86ClQXxuXFed53rmWtIoSBcyFlbE89zMTOSit12?=
 =?us-ascii?Q?3wKfpap2gAaoHKzLiJODh9edSVg2Po4Z/9taoJmsZIFdNrnv5vf/vJREdLdi?=
 =?us-ascii?Q?VB5rhNYH/1oZhWPfJ+YYxGNZE0V9ETF+SxXvRYaiYofw3HgXmJRJrWzLzSXr?=
 =?us-ascii?Q?5WKifET22DJtny7MFovYyQ72SPEQSTM1OBs5dPi8UrClEmAYJb6q0QL/8e7k?=
 =?us-ascii?Q?0fxlR9V3vUsq1u3FkP27Cv0PSmZMLFwN3JPxFtBa2n5J8JCIq6fJHVhWWUcO?=
 =?us-ascii?Q?gLx8Rlx4tvD8fHQK3CWQQuNN3zUi2lSTDw9uNyJwcrW2QgqS6oRUUzFKV3Zw?=
 =?us-ascii?Q?1A9TDA5oDHKGS0Ac0vTh5zsMJva1dg2Z7tgSi+VjQRCN9HLA33556YYXlul2?=
 =?us-ascii?Q?L6EoTxBOJjnOH6Q0eiHA/kKZV7CA+gaau5dTrRo9EwY9xWFbnK6YjKXAlTav?=
 =?us-ascii?Q?kxNHKgnF021i/2gjEep0AsNaMddalkbsf/LyFlR1NtBaEDLcbIPHnI+zuRLD?=
 =?us-ascii?Q?nk3nk9cuVS6cXDh76wl9Yea/m7yhQs6e20YG1qzFy7G+mkNz0qyn6iV2D2aF?=
 =?us-ascii?Q?AY11pw2ny7E0qMzBLI6emn9TlCrWGlXFacBfteEi59rOQdcxdzCBGFMDvJod?=
 =?us-ascii?Q?4AoXaiHyg22jiMoJrlnJmDdKttMY9AX9edSHHcomAsCWLVCoanBf7t92Bw0K?=
 =?us-ascii?Q?fL/Wvq72SQs17QdfenyVUn4iZ7E0KHgq6aU1sv0+KiYt6s3GZ37OlILiALUB?=
 =?us-ascii?Q?j4501tdMOVAvHVL0a5h4CrrvwI+EeX6wd6zonkGIbm12jH7IWHYocTiI5cnx?=
 =?us-ascii?Q?hPlndRe+y93mcXATXMPz8l7kgsTb7frG6UC6J3H00cYZTG8PfCYpDm8T0Hmc?=
 =?us-ascii?Q?5FgtcSOPzGT1dHt4tGLCghq4tXN5gc1KUgZ58HSLFvs341mlkRk26KPNWraE?=
 =?us-ascii?Q?DXARmf82Vm0Q3Bk49VjTgIu5vftgjQG5wrgT5cCVAn7s7k1NJgvdvWmQEWX7?=
 =?us-ascii?Q?aSX7wY055lHCtoxsT9Ky2Zi/PuSc538h96MSeWpZo8roam9cJ6oXlEH/1cHe?=
 =?us-ascii?Q?x9c9JSYVpJZ57Fd1qzGcp/tWx6fH0bKx9cqArXKo5ivhJ8W7TntOjkhHC/0Y?=
 =?us-ascii?Q?tgupM+1Efom6j0bIMijKDZ0C3Yi40ugWDmpCkzMnEF9MoakYTO0dXRzL6Bqt?=
 =?us-ascii?Q?/NPepz8iJrJD6BDaRtL3RI/UkvMAhS9qVGltms1dEJxFKm7Y6qy6On+d9JSf?=
 =?us-ascii?Q?YKsZ9E/ia/AFiKE277o5Plqi+pYEuW+SbTWeeSVMj10dlqw9PvFTYgcuIxS4?=
 =?us-ascii?Q?96yGtKvJ5W+nZPFPfbgdteyBCjoQAk/YqrQFZLt3fTTvL2nt1wVgXJT6igjO?=
 =?us-ascii?Q?38V9hT927N1QSFZsTsZdFkEKUc7AQMiYd3Px21ZqlwaVpXlpmD/6DSEFGtRE?=
 =?us-ascii?Q?tfk34AoC3Q2+loSgkgUi+lNmCXvJv3izn6+eA13DuI6XfVAm9zwf7dvc40V0?=
 =?us-ascii?Q?qkDwHJ1oSpfYjoP/Ydob9gsav+ZoSCUy5aRxQWXXB8HnJisiVov292HGmEiQ?=
 =?us-ascii?Q?FMabt6/uwh1AoruLCpLNDU/8vc0gPTI=3D?=
X-Exchange-RoutingPolicyChecked: 
	CQfEhMCsDbfFaJfuKOCoyKQXDpfxqDKmYWa+vX9iI9XOVmAm1qKjP549QVOGktYaWu8l83DuEQ+ISRXAn4PnduLc7Ms7MBEbSiwvkZo5JrPcI5/wZOX9LjOvuTiJ3XrFFEoL1aAc9OIcKG1MO1SyQLhCOnu2H5tQ/uDArmV62LVGbu9j+PGfTUUJg8xrOuZn46xqI/L6nXy6GrvDaug8fhnohFKXEZWt6lrJ1Jcs012Vq+ssdh8b+e361B++2ktHcF98v0hdup3kM8vOVYWJi7oSuuZzDEOA/FrzWxSqU9hxVWJDnBQ6cFAJwXoXBhk2LyY0f4eD9ZxZZhDhvX5FZQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3750d71-14e5-4cb9-28a5-08de89a53fd0
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 12:59:56.9446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KKw+NmAWpFPXl6TZw/GQuhusAEvDKDsrN93ufOIH9Ggl/pnIw2+dpSCwSDTkpFBUPG9fDt1E9NrhKVFtXsJaClUjpG1P6Sy/SjSKQLCxYkE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7297
X-Proofpoint-ORIG-GUID: WumZ1YAvZ-H4BAOb9mF2HfQF-uECds6E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwMyBTYWx0ZWRfX4H4ECE6zkFeE
 DvbVBtRUwJ5IRF6XvnnJzGUJMzGeuNud0aK5aiGDAuBKBgoZVrlKDfAUQPRYQAv/kAAU9/OpWSd
 b4j4Gem5xTVLqzRV/FAUAdxoiGC3cvFagJOktdglnMVeKG+3jmjxmNUumWhxJe+TXwginaOzYVp
 iUwEgKP/VQfaj3xumHdmpliNigzG45+Tlvon/IeL/t6qqDiVBU3tnkdIAMe0GhYZmbr94CKxqgl
 IsEoI+6HrUR+ML+kgdoSvItnGOLKgwnotAe8pQyx8lyJO8kTuZ607614Cb+WcFONPGvQllt0Lrl
 8s7b9Fwid6ucmjw98V/n58YV0Bl2GGlx6NDiYrvg8xYX5czxacE9VdS4odnEu28GQAs60CKhvV3
 JkIwLScqnp20Hyfn+YRNaFKr9G69gwmx6PCwe1cuiMnv9eThTV5xBcMW/CtCig7Qww+nqVeWWP/
 TrlWvChYuHcpUWXvL4w==
X-Authority-Analysis: v=2.4 cv=LtqfC3dc c=1 sm=1 tr=0 ts=69c28ace cx=c_pps
 a=nhquEFRPp8Cuo1IKRjcF3Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=sFRP0tRT-b3VAi9iXC0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: WumZ1YAvZ-H4BAOb9mF2HfQF-uECds6E
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
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 13:00:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125568

From: Zhang Peng <peng.zhang1.cn@windriver.com>

Switch from autotools to meson build system. The upstream 4.20.1 source
already ships a meson.build.

libxfce4ui 4.21.7 moved libxfce4util-1.0 from Requires to
Requires.private in its pkg-config file, so pkg-config --libs
libxfce4ui-2 no longer emits -lxfce4util. This causes DSO missing
link errors for autotools consumers that use libxfce4util symbols
but rely on libxfce4ui to pull in the link dependency. The meson
build correctly declares libxfce4util in its own dependencies,
avoiding this issue.

Add PACKAGECONFIG[tests] (disabled by default)

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.20.1.bb | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.20.1.bb b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.20.1.bb
index a24ed76d53..d16a9e6446 100644
--- a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.20.1.bb
+++ b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.20.1.bb
@@ -9,7 +9,6 @@ DEPENDS = " \
     garcon \
     glib-2.0 \
     gtk+3 \
-    intltool \
     libwnck3 \
     libxfce4ui \
     libxfce4util \
@@ -18,6 +17,8 @@ DEPENDS = " \
     xfconf \
 "
 
+XFCEBASEBUILDCLASS = "meson"
+
 inherit xfce features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
@@ -25,12 +26,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI[sha256sum] = "acccde849265bbf4093925ba847977b7abf70bb2977e4f78216570e887c157b8"
 
 PACKAGECONFIG ??= "notify"
-PACKAGECONFIG[notify] = "--enable-notifications,--disable-notifications,libnotify"
-
-EXTRA_OECONF = "GDBUS_CODEGEN=${STAGING_BINDIR_NATIVE}/gdbus-codegen \
-                GLIB_COMPILE_RESOURCES=${STAGING_BINDIR_NATIVE}/glib-compile-resources \
-                GLIB_GENMARSHAL=${STAGING_BINDIR_NATIVE}/glib-genmarshal \
-                GLIB_MKENUMS=${STAGING_BINDIR_NATIVE}/glib-mkenums \
-                "
+PACKAGECONFIG[notify] = "-Dnotifications=enabled,-Dnotifications=disabled,libnotify"
+PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false,"
 
 FILES:${PN} += "${datadir}/backgrounds"
-- 
2.34.1


