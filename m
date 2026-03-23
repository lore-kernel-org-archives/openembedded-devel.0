Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0733EC01D3
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 11:42:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15356.1774266139700576408
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Mar 2026 04:42:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rahUQeF9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7542b98c32=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N54ZUP3827968
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 04:42:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=fUpuP0G9Z4nvTwTKdwRnJ1n7mks9+Wgwi8b/wT/Bc4Q=; b=rahUQeF9yAPL
	R511+Z0ltmgdfoEjIrsizSksoCoMZSJSIYcBGpvXv+9dwY8uE5TnYrdAApgDuJU7
	r6zR8mMniuOv8f35muyx0pQ2O+B+h+npOX+A998dPAHYucDnMgGKCxTkkAX+H4SQ
	1pFzhu3Lx548J7rpYlZRQMEfWuS0HTG+ftlwTB4iN2h5baOPcZ9t5Pxyks+hcriw
	TJgO1Kc1gTaiePclLPXwdeMkLf4OkO44QPXTAbYSlDIHi8zqKlLolVPdcIcCwxqx
	FddXm7ULFdzwxvJMw/p1a4yw1uBgFF6tEUAEhvwNchg8DAxfjU9FaF7L6gxOGT0f
	fB78UlwINw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010057.outbound.protection.outlook.com [52.101.193.57])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1tucseaa-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 04:42:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dgdK9qsJgCGReR6cKsJhOoLe0OmSvVQl/JBLUsfu1HPHDx0nkDzi6IVM3PqaXMo2NnNPxtEXlhUoZIg/cYsf2gIXcFXMhDda5Ejtoe9GYqKraVCuVW4ZjgRjMCIYfXYIHAXoh714tSQ3Oq6m0VloabPHDCKAd5pu3q9J8A13GVM7J+az/BdkLSybSoso1x2WCmBf0+dSdU6OmDjRBhnB2lKuNeJbrkgP9IE49RyevHCtYhGLCdqPj0x5PMc+s2Mhhz/BdKVw5UNhgSjWudUfvvYf1AX+jbeNOaCGJ/9D7ZzIXWVJFGwpYOiyXYU1n674WPpzlQERQ+ycH0zud6A2rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fUpuP0G9Z4nvTwTKdwRnJ1n7mks9+Wgwi8b/wT/Bc4Q=;
 b=U9O1DvFtDyfsq9clT/qvFmWARtxvcUCluqHQcM92RnyFAIoNpoV8uBV13xHLHkuS4CnfKRFAqHMXJ1NB9QEe/RT4QRFmYbhhzQfyE/QUQbSuBGbuEHbWvGuZBNeuNJJDwWY4Jya7aEjkAyn/rvnrE8u01w6xNNDuS02GGzvdEM5aN/bCGx19uvThS3rFo0FEZl+nAaQM1+dCk6uVX/VMtBoxcPro2YDFpZ65Kj9mE11ApkTxb3GHEzFzCoyctFrt2HCc902p0YdqTnzKFnZpu6YbTQkqpvfeA5uTf2rqqAhpvOzd5cgMosTBqRyZAjnxDW8JW6bpvRhXd9ZnZSw8tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by DS0PR11MB7441.namprd11.prod.outlook.com (2603:10b6:8:141::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Mon, 23 Mar
 2026 11:42:17 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9745.007; Mon, 23 Mar 2026
 11:42:17 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 11/15] xfdesktop: switch to meson build system
Date: Mon, 23 Mar 2026 19:41:48 +0800
Message-Id: <20260323114152.4178269-12-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260323114152.4178269-1-peng.zhang1.cn@windriver.com>
References: <20260323114152.4178269-1-peng.zhang1.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0108.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::14) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|DS0PR11MB7441:EE_
X-MS-Office365-Filtering-Correlation-Id: b77da6d8-dff5-4952-8c8b-08de88d13c1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|56012099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	UijrbS1JhhNGY//kRoli7/ZMqy+RHHy9coMObZsSevvfRPgZ1f6dg3O0yZvgLjJo3bqL1GTQ4yQ85spRnW+YqsEVl8Xn9NYi0+/HSuHs08PP6UuxsyITVdpGY6gfNd6wnUAI50l9GEmhDM0IwMvay8J9qtm6KkIT6Vwg8g71RMsGsSAnXpgr/3Ks7RxxvxqxPFq0M8MX+aUhgap280i3kE4L+eS0ZEeM9A3tJj5p34h1i37Re73HQDo+zu+1HJmWbGbiRs7nJOZ5ipXsn3w7qQ0x1KCKmyASA3krXb8Kx+USh7svAP/135UHrUc6PmrXaMaDc36bQDVVsItfosRv2fFws98BIcWlSGEJz/JDImv9I3j8Qq7Ij7pa1dM6YUpWS2IGRnVACAU0mgxPg/eHmLLli7gn3W6n7sPY6QDRFhTjdyAZUFb2Rbi91R7Vyym2BoFNQ4GchDjY0cfbwlaYpMNKdlcX2TnQL5pBBA/9XRFEUH0o7OliIlHg7lQoykQVDFLwCNR3DRzSpcvEj/xACG08guuYDDk5rDbik4kP9qK676fZXTpdikZ2gOLqSZDqa5DPU3hymnRmzv/yJgATLm9is7bBV7YQ8ZPwFcPyBEWXrn5W7TOEjh3H1BJ2GKyexpe7x1yLq1NjMELW9RGYPt8WrE4Anc2d++l5kfEUdo3OlNR0hMEHRinTlw9JDOeGvlxAZllL2EowSKdRKoJbQ7qZwJkgmqQgubWMFUqLiWvLEP1gIt0aVdj56f+xldpevpjiVGswbic4PXthr/teB3KGfeR6HTieIuXllsGs4PA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(56012099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?etE88WytVakTO2qhwLt+VHJECaTF5OU0fenzzKXvVtGa8+k1TMJeQ5wqh9Yg?=
 =?us-ascii?Q?ZyvR7EtCKgOZJr11VmUMiQgIagF1dgPrOT6UtbMgAtFO/v52rhL0yrAIo6xD?=
 =?us-ascii?Q?NS2V1eluhC0HxqUWJOND7Ztc/uj/ndUx8fF2C+8QCiSAWS1mRMC9croDFtnT?=
 =?us-ascii?Q?5yu64Ql49NlR0eUiaBKDInqpLE3LSh6BR7EqQsNvYA2qc+tg8b3hHZyZXCkR?=
 =?us-ascii?Q?KJFZb7jEe4RMzBrRUQI7J/LiOUs6YT3Ha6+LhAqyaC371E0mcfgKMvEtz8bT?=
 =?us-ascii?Q?bsS/wZmFzwv/B659E2J0fnrwOsosrxmR33vGM/pXO/LbEs1c9/Z9CtWnks9x?=
 =?us-ascii?Q?lz5KFZZmFB0vxUcXNSLqFGztYslbbYozg7qCDTjM/rlNPPDkbcH3VLquWeln?=
 =?us-ascii?Q?oPb3G0R5mXhgsGOR9J3/3xJkiuXztAnpy1zH+egLpS48osios1DSfjZqTCEe?=
 =?us-ascii?Q?hlMPxPcAKlrldez//xNbraVfgBXl1eV2dAVAX3Flun/u5VI5499OCkotUc2b?=
 =?us-ascii?Q?ZCkogIcQqD0QauKww45HX+WbJMemTk+fLSdaFzB42ERwREQ2D2SBN0NBz2IL?=
 =?us-ascii?Q?yVRg1c+WR+atfntSymEIImekWkz+QPSHGHAQLom9PNc9CH1S7QebF7rQBDzz?=
 =?us-ascii?Q?24DzEPdEZamZz5qHJl4qd7XHtma/MOR5YUzzUwEjlNk2nRQNDoL1nh3StCFs?=
 =?us-ascii?Q?4pn2lpIVbJZ2BkhLkHwrI5ZQ+Y6wA79WOOJMdC5NyySllGtLPKF3dTrNhbUd?=
 =?us-ascii?Q?jboWV1OlKawN/5vsIWQQx3Ju1ZY5XeSIXFjr6Ie2085/pKXc1aF6mJNipd6r?=
 =?us-ascii?Q?RpVppXP60UWYMy/XOBMKKF5uAvvTb897dk3A6H4hOg3FZm5rSybNa5Ofn6Rc?=
 =?us-ascii?Q?pghFXv8aj6HGM7qC0Z3WcBOJTwI7PUcUNDAiuVIXhMYZvS9Vwqez+uSTrSMP?=
 =?us-ascii?Q?zkOYwaG8Iyl2AUL87tXDX11SdNWTqZNv6xy3kAh0rIT+FbGKdkcBelrBqRs9?=
 =?us-ascii?Q?wIfwO0gBszKkgHRoQwAqYVzrOwkSx/LeITp4GZdU/cYnL/HcGwVUhn/wdguJ?=
 =?us-ascii?Q?4aeXGidnjH8kOeBVNqWBr9L7vIbsr/LSIqdmn3I7hnYdvoDpmXhamLsuATAA?=
 =?us-ascii?Q?wfgBMhW8Is1q7WQsGoHCcQsLF3IC36EFk2X5hLzHGoafGWHe2lxk0dJx+oXy?=
 =?us-ascii?Q?imPESKy9+dQI23Cbn7AwjWZadCCvjCg97TdHqNszg59WL2rDAWJ8L0q5xiqG?=
 =?us-ascii?Q?q9y+aNYMLKvXzO/UpvNyxsvmwOZu2DtxKb3/iABxl1LH8Yivn2sI/Lx6IUrR?=
 =?us-ascii?Q?FjBoDX6G4H/PZd/gYhu4SgEMcFK4rZY0BTgYr/q/I1w8TAIPYP6xUygnh6Ro?=
 =?us-ascii?Q?vebuaNBnysAX2YZP9aAdgSYEUYbRv4oqmJPPg6mE80hTIVHpcqye1ZbQFP5M?=
 =?us-ascii?Q?oWYZoip1cWCtC/Uzz9xklhrBi41pC7CxyQdc0zar9PRdt71M0EX6XqRM79Kr?=
 =?us-ascii?Q?Hyy/Paz6/ZztR+XGkYZGN6VxtbraG8LWgWg7diRIibgIc4YjAGkJ/BficjRL?=
 =?us-ascii?Q?ty+B8YoH4IoExQ+1Rjf0IP5r0k0dQg0u/K8ja1YIsEe7tdxjbeMkO60iYcOy?=
 =?us-ascii?Q?M7nWkEU8KwNFMTWQUz2t/UCqnopNfjFPjxIoz27InOwJrPmH5WHjO3/9mw5V?=
 =?us-ascii?Q?hnZJMr1+WP5lZxFDeP4jBb2lnVEX63KOwpI5KsHAsyEtTS1uAYUTXrZ5jUl7?=
 =?us-ascii?Q?zdvcGeUTO9pJ5aR5CZL93eudDd8sIG0=3D?=
X-Exchange-RoutingPolicyChecked: 
	OgIjTT9BxVkWK+yDLiiQ0QAgjQqcRC9LikdRqDcerx02WcKzUQjtwIcSFxrg4cjxSTjOGJrLgs/YQqG5Ba1kUIkIy7e03OUnQjNJEdcg3HAoSs6YScLIu9lhsnxtCN8irj0HHZvkkGbtcurf8Y/ky7TS1bsBoL/Rwf+AH95/QIVqh0LdpQP6sBOOCnxTwCGPNeNavdHyPTwiqftjwXwzQNOf7rNPRVJAmB9mbs9oLAvNEzRriNOmpZK2v0oPLBmPtADMFm+MTgkvNn2YiwAAdOlZkVpCxZAFv/AP9XKZ/PHw+jy2w8miMxxkCHw48pBmmEOsVof4VHLB4iigR8hl3w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b77da6d8-dff5-4952-8c8b-08de88d13c1a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 11:42:17.4276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v1iq4slSWL4ngdAK19s7Av/5xi70Z6l4Q9EayamKmcFIPXcG9Xn6HdboA/z4UoCdWjiT0zVOjx6Jd4eCndSN5mrbsbxn65XiDfrWUDrff3c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7441
X-Proofpoint-GUID: L53y96ikIkjYza0dTvRPXHe6QnvWoIyV
X-Proofpoint-ORIG-GUID: L53y96ikIkjYza0dTvRPXHe6QnvWoIyV
X-Authority-Analysis: v=2.4 cv=deCNHHXe c=1 sm=1 tr=0 ts=69c1271b cx=c_pps
 a=0nW3/h2Bs9e5w/EoXaYwaQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=sFRP0tRT-b3VAi9iXC0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5MSBTYWx0ZWRfX++rgLbL/6gp+
 f6054xb0CEdAcFVue0F8gvt414AJcBSBnF9OtbHW4rLBOvqxw/uYqFcvBZpXbvbp0gHGydavDmW
 deixy2/KmawYhAsqnDRSHzTIcLyXFBSp7q+yNT/fCH1zilmaYdnBBPC2VuoKPuwAh5jBWq4s/jA
 gplHYo8rRB9C7GIHzkEtyO8nJQhJbANM7BV9/9j3kCtfw3TJ8uP8k9UMMyQRsGOHbmLYf8WMfFJ
 Sc5Ykki56WnZHT5h5fd8XCapaj6ivF1tUbFIwAC8dzxc03eBBswxJvCEW+O4Odmmz0+QIsHC0Fy
 ibNix3z5hD77oZSaXBjoZ5qxqBYB1/BfQUG8bIJljLvBsX14wISuHhmqT55lzdXMGgCySRBSNbF
 Tl+OwvF9X+irjgmbLoI7caCIeoXQW1B5kZIRh0htQSjWoUfJIFtdW7qRxst6qlN2U84DDv9w1oH
 8qiW77DLnMnOQLLzgbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230091
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 11:42:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125514

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


