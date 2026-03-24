Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7750FC72DF
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 12:59:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18827.1774357193959691884
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 05:59:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XfqlssrA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7543866fef=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O3enSa1148564
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 12:59:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=FHxyyuu8kr0G4eqzpkMIASJP03tr79cxqH5tMKhdoJA=; b=XfqlssrAyT8/
	F3S/F/RaoXTPsVEnrJrH6JNDaX/cpP2c6KU9p0x2wperKHiDLgf53eE2Ck3aZUCi
	QC7jXvfMWCvjXipKMT4uL8jFW7+7f7JL/E6emLfsBMzFZnoZMiifkwkTaRp9MfPh
	zJdFFodHtl1HSgOSBtHHhxVxAsLzl1As8pIYL47kPf1woz//8Yc4HcNAYp/o0D/W
	5wO4kA+8hPGajzmc/2jDNHHQlgwJTel6R/YiogC5lrRwwNfUFiHc9tumpCamoHFO
	PIwPIFsWDbIHMc2YBR0Z2IQwO/zjAdw0Mdx+8dHchMAWDSkyqG0hKgnsDy9+mfG/
	ecdC2cl2Hw==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011060.outbound.protection.outlook.com [40.93.194.60])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1gj83d84-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 12:59:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xm2rV/t4wXvNDyfLiD6uVSItF9ZgjejVQfOzApXivH5T2BKFbp5U/BefKi5H2Vg374BUHM6WCXUC14Dhyl/Qlbsh6UdTzki2yFVGIGEoYMyssf+YCff99981ec+20XMBrmnkhpPbUZKxXwWNNB4f6XbB6i/YWJXJOvOpwnaeMa0E3wXMQpmEhX567SiIsXx9+dj2QBVP7xpBXV3jeyzhYLMUh8ntKxz+lQJKiwm5IIti7b0JwlpUOD/s38Bz5JNYU5wyctxXfwKXvoJfPISEHUxjYJSLYoyL9UVlqo6F74TRtUlsT1MUwHl+B4Tsw/nHuGeMYPWGFKfhwrakY5EK1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FHxyyuu8kr0G4eqzpkMIASJP03tr79cxqH5tMKhdoJA=;
 b=PmrG3H3jUrrOlYDbd24r3NfgMCOSa5aefQKvWfw/AeW8rfZU3LmMpFQyN7s9KnUoXSZerdhqAzt8BMmpLzwBiCX5P0WlOog3FKhXbGpP7SnS/FMydsJpMEQnNpksTGOUax3UqCOUhHZIYfZ9WR97IvOLAda7pnf+LjQ3ZBBL/wdsFMPYJ3UgFr0chJTzlMgMMrKKoXmgwhHaaAk69gI5LRLkzlDCRUf18uRW4PjOVYTohnzD7ePgkhrXtBkhSARuo65v4wYmhkXNGOCAjsOZsYExFwU0m0ayRzNpqHtQRtRsBVreiBABmL0UlkMYU0fF+zHpp0pmJ1ReLOwmhjAYjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by CH3PR11MB7297.namprd11.prod.outlook.com (2603:10b6:610:140::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 12:59:51 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9745.007; Tue, 24 Mar 2026
 12:59:51 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH v2 07/15] xfce4-settings: upgrade 4.20.1 -> 4.21.1
Date: Tue, 24 Mar 2026 20:59:19 +0800
Message-Id: <20260324125927.1070644-8-peng.zhang1.cn@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: fe73cec4-79d3-4cc6-4f24-08de89a53c5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	bT/uBxzQ6mWti8ETWzhtb+YHfgmti1+/X/Hywghbgh6NAR8+wqAuI4iFnBxdrAXlY9T65NiC8z0T5jGiYhESooEdLH10ntp3UQ3XMJeTdVTjGnG35tJaN6z/gmrl/2mir6hZcc3un9JDjigYzv2mhmL0z4uws5aeASAiMlqYGLI5LD2b7b9BOho82p+MML6W55CsPTdCP4izXeBkLyCRxM/pG8ckvi+ZB+qI+s75LT7WoggBqh4GN3lwXsERtbYTgUWP5EVUrQTh1dQ+UjqwW8nZBbtiJpYDTPwuVACn6qIHVku6RyTpxkTE+pMcUaXjf2OssielA8qDnajlCY7mV2ZjfU+wLaWp10IYMd162qvm3bIW8/NvhN7wKE9z6LEKzKTdtci/FeYM7Q7anpUp+26Ev3/Nj29eNfBZRbLqdZx4tsB75B58hVRF/GYvC98ZuWhz15jxCAN+3NT2YU6f4AtJ3YPduZ2KMMyFxs2onPTBI296o3jtGBjMSECLIInnvdq2CE/rEB5WxxlVdns+/Dp/o0ANtNv94w9TAnb5GVl/7O5zpk+MVxqpe03DV+hiZ60SMFGhmX65zXJa9AQc5fPZ0qD6ozhQeGHfGSPA7TC7Yz8BlgPdJ8TyWlXZqX2wTJgocy/HkPeZuI9tiMFOI0V4+UNArtBsFxfsc9GbYRQY136OXhkDix76Ccswq/u8GnUhwJa6XmtDX8LcRjVRbwglR6uhE2jCZ8x8/Q2N2jyTyCOLrvdVWXEdUQoX0nSW
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QIgUpmehLEIwTwD74TroWkCdgl270TLJ/7l6nxjoK5qKWjc/kcGKcPZs1x+C?=
 =?us-ascii?Q?VaAiCtbBbF/uykxFncUUJixmCdp7NmUnqQBAUI5De7hEgx23tJzRzp+BZhN4?=
 =?us-ascii?Q?J3sePb2rWg/DtOwvc3pfES2yxqOq4Cbr1OGWB+OY/r2aNsCIxVAGDLQk6vQi?=
 =?us-ascii?Q?rzrm4XJ5XSuK9vT3OniAvTtmI/o8dTZxP607Cj8iKoBT06gtx6MpoFom/7Y4?=
 =?us-ascii?Q?jVpfj2dcXHyGwfJnvtouTyuZ+pqQV4qKWAYiaUOeaT0xnXmmhtwOdU12jL6a?=
 =?us-ascii?Q?7u4AwNU1S3BKigDpSy4jn+UisnJpXxare53nmYMzcDttME5RFmDMhSpsOIfH?=
 =?us-ascii?Q?jeT0sG7WMnZ3be7bERiQcD/PmpTjVjMj+v8oXsNPdonHBP2s6Ebwq9xlIkWv?=
 =?us-ascii?Q?ygOAE0x1dhZDUTQgfA0aRabldRFS/joPAGc/nc2uB05h70ivmet1ivnUuOmg?=
 =?us-ascii?Q?agqKIZmo5jBbujb4yb2YnFp9yrT6r+b/pvy9w6mXtgJr79spjL5c1dYYICUo?=
 =?us-ascii?Q?Pan9VVwnpRrQyRJWB3NCKLqjSjgAwwV0GDfaGdZ2Y9hDkbRVuEvxieap7gO4?=
 =?us-ascii?Q?v3QsTbVwtzssuW4JHZDuzZl6+Rwjd3ZI7WHSHWXyM/mvA+YWKMsLbuGC+qi4?=
 =?us-ascii?Q?mU8JFZG1c1acLWYx+KulHXKq9qholgW5H4b+ASDMmH6z6sMN6dvpl2haGkcL?=
 =?us-ascii?Q?aiExnUpW3v4iII12M05zQTrQzpuQu6J2T3onzVB4lMTDb714NGKJGK6Qpxi8?=
 =?us-ascii?Q?8cpdXeE00qUhib5Tra9BbcyOB5SedFrCUAYfCBYz92gmCyvVKQrVUWIg4mxF?=
 =?us-ascii?Q?8pXmoXZlL2dWjmZq05ACvIiV42fKPBy0HmHJ/hRveMXM/2IQgnfoPDtGdh/t?=
 =?us-ascii?Q?FdJ1ugh8HCC/Z4Eqh3/IEdgWvY8rGyGIzekBs+fNWusPqHq/EVVRBEyId7kK?=
 =?us-ascii?Q?dhzKKSm+Kt8RbWDByZEAgWj+/jVZVhaxpy/0PHtAlGO85TcMk1bNS7PeKSMx?=
 =?us-ascii?Q?HJxCgNLZbgvex4wx+ELOmZ4NMQVqNC/BYxTnZAQrJTOO1jjh8KEc/rnbvkQb?=
 =?us-ascii?Q?f/T0+QpKkeBPfpYhA5odKtmYDPSRd8+3WPdVAu7p0Kcd+/wc9Uj6bKhhxfAo?=
 =?us-ascii?Q?64UjCQtG4WUayFt4Y/VmmljjCZTO7WrOJ0K6o329D1P9DMwy1o23HbSDj7Cf?=
 =?us-ascii?Q?eDfIvYz9pZQqLOesHN7ng/rO3RPc9ZZvEKy5axk3TGxhVcqRntkvjyGr/EE7?=
 =?us-ascii?Q?u9WCe6600bzgpFOq+Fj6heHZ6BgE9yFtFHRInnIbzqf9rHDHGZ39LlA6SPN8?=
 =?us-ascii?Q?ONkkluCrORCEMzCs68WoVX+5v6qnPcndJOX6AetwcTmWpD4MrIw4mA65GpO/?=
 =?us-ascii?Q?LL/GruybVoujbRq34FsDOrEaurh4ViQrMtsZqgxtoaQvR9UK9eFQ7MQmJ+yW?=
 =?us-ascii?Q?kUmltKRArM0/5QtpfNkwJocy5yf4AKZolyJpOo2rYgwpPZKBiZu1pSf0cusT?=
 =?us-ascii?Q?2ckrCcnsWevhz/WD/4Rk+UvqrJnxrxlzWYSQXNqZ7F4Eoh11KZqYFZAx0rHt?=
 =?us-ascii?Q?iWEWu3cp3y4+Xeg45dC2dGVBkZDNlD779U9a4rYq8tGU4ORzjYi7Ad2ph2qY?=
 =?us-ascii?Q?uSnifQYDzkWZ3j/659tmHWs4QdG21Y2TXoZ9UZoqtU+rxEx9rkEZzolC8SqL?=
 =?us-ascii?Q?DQLeLj9lbdIki9uNlrWKfMTSBf6FXpoxFADvvQYA/0LU7lRqBSFj9jriLOFZ?=
 =?us-ascii?Q?o9gX4vcU+CYptlWBVRG+jQ1Kb/Px1Kk=3D?=
X-Exchange-RoutingPolicyChecked: 
	GbMfnJQXo7CeruTk1+jSnuBu5tSHiFzx4hy49R6BrO1z0jsjPLHE6jOPyiW16l66G8gju9+PURaupn4mNxPsJ5k6EpJLIgEWy3CTpRBsU9mZkVKHYBNmoxkPe1of1HqLshxm1OpAmQekkn/Fy2kZQp0BDgqVTLY+4VPtmUiyq9EqE8Z5MEKJ8S4vmWq60RBEeDc8VKtT/csqjVxyAz439DxEMchikKKgTNLAukqf/YDCwL/EPz+D9kQMKCoBywRFyiu25BORByoyyJjVROwCghHd4qm6KTUtHXTCgbXqZIz4Bmi68Slq1gn35G2K5QAsVHr1W0PZe4FxO+6NII1AMw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe73cec4-79d3-4cc6-4f24-08de89a53c5e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 12:59:51.0722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gX1CeLve8qx+bl4VGxPfRxA7x7Vcrw0fsM2Ne2k7CuElT/JwWJ61pTj+Llr7qQhiKEPrSCLNknE0QIg2rR9ub/YtuhyWpNO4iPHHMZusWiM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7297
X-Proofpoint-ORIG-GUID: EVcoj4F4MsbKtVgijtTYw_DKPBTz8bzz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwMyBTYWx0ZWRfXzE4H2efyoBM8
 ukPFJPrDbSbfSXSL9JDFc4RLVdg8AZgY37uKH52RF6xsx9Dqokp52lwIdf5hcKlNTamJDIlQK4H
 ttT67l+68ItE1ZRBHHOUE7fJjQbeaiTd0zeUPZBGXEBg8YIRRsgUZwnJUSVJrkX2wfz4Vf+q9KW
 e5I9oTWvGoA80Jn9Y8sP3MAjh1O7XbaYk90PDEVop3BMhX4PJfmE0yoz5mN6IFUDgMrf7DSwuhw
 i9FnnN8bQ/asr2hsxQVI6Olww85pFi7JZyziMz+lZWV8/xunLl4RCni3aTnNrswJaXjGzridrwe
 crwbdwb3AMKit8aF5hP9oA4mJFnzkdiDbOm3pKyFCMEDKiK1mRqXFohW6P2khh3D8YxC9w9/orQ
 VKS8lK4pihmMZmqW7jOMPuNzSxXP5ChXVuuE5NSvGL03b0unRH9bVSZQzTxut2uZH1MTezfmA2Q
 BXd8MvDrGqEuRogH2Zw==
X-Authority-Analysis: v=2.4 cv=LtqfC3dc c=1 sm=1 tr=0 ts=69c28ac8 cx=c_pps
 a=kwi3Ow37oS+QRMqxGNLpqg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=O24Aq5uEAAAA:8
 a=t7CeM3EgAAAA:8 a=_AMU3uBFKqmksvQhN9QA:9 a=SYBONWESK5muIIdMMRMZ:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: EVcoj4F4MsbKtVgijtTYw_DKPBTz8bzz
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
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 12:59:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125566

From: Zhang Peng <peng.zhang1.cn@windriver.com>

Changelog:
https://gitlab.xfce.org/xfce/xfce4-settings/-/blob/master/NEWS

Backport patch to avoid add full path in generated headers.

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 ...splay-full-path-in-generated-headers.patch | 36 +++++++++++++++++++
 ...ngs_4.20.1.bb => xfce4-settings_4.21.1.bb} | 17 +++++----
 2 files changed, 44 insertions(+), 9 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/xfce4-settings/files/0001-build-Do-not-display-full-path-in-generated-headers.patch
 rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.20.1.bb => xfce4-settings_4.21.1.bb} (67%)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/files/0001-build-Do-not-display-full-path-in-generated-headers.patch b/meta-xfce/recipes-xfce/xfce4-settings/files/0001-build-Do-not-display-full-path-in-generated-headers.patch
new file mode 100644
index 0000000000..50006b1710
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfce4-settings/files/0001-build-Do-not-display-full-path-in-generated-headers.patch
@@ -0,0 +1,36 @@
+From 93fa2ed9a987c0f03c9f5aa0f31cb770d1cc5f17 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ga=C3=ABl=20Bonithon?= <gael@xfce.org>
+Date: Mon, 16 Mar 2026 16:44:43 +0100
+Subject: [PATCH] build: Do not display full path in generated headers
+
+Upstream-Status: Backport [https://gitlab.xfce.org/xfce/xfce4-settings/-/commit/93fa2ed9a987c0f03c9f5aa0f31cb770d1cc5f17]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ dialogs/mime-settings/meson.build | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/dialogs/mime-settings/meson.build b/dialogs/mime-settings/meson.build
+index b7ca8dc7..5ac9a936 100644
+--- a/dialogs/mime-settings/meson.build
++++ b/dialogs/mime-settings/meson.build
+@@ -30,7 +30,7 @@ enums += gnome.mkenums(
+   install_header: false,
+   sources: 'xfce-mime-helper.h',
+   fhead: '#ifndef __XFCE_MIME_HELPER_ENUM_TYPES_H__\n#define __XFCE_MIME_HELPER_ENUM_TYPES_H__\n#include <libxfce4ui/libxfce4ui.h>\nG_BEGIN_DECLS\n',
+-  fprod: '/* enumerations from "@filename@" */\n',
++  fprod: '/* enumerations from "@basename@" */\n',
+   vhead: 'GType @enum_name@_get_type (void) G_GNUC_CONST;\n#define XFCE_MIME_TYPE_@ENUMSHORT@ (@enum_name@_get_type())\n',
+   ftail: 'G_END_DECLS\n\n#endif /* !__XFCE_MIME_HELPER_ENUM_TYPES_H__ */',
+ )
+@@ -39,7 +39,7 @@ enums += gnome.mkenums(
+   install_header: false,
+   sources: 'xfce-mime-helper.h',
+   fhead: '#undef GTK_DISABLE_DEPRECATED\n#define GTK_ENABLE_BROKEN\n#include "xfce-mime-helper.h"\n\n#include "xfce-mime-helper-enum-types.h"',
+-  fprod: '\n/* enumerations from "@filename@" */',
++  fprod: '\n/* enumerations from "@basename@" */',
+   vhead: 'GType\n@enum_name@_get_type (void)\n{\n\tstatic GType type = 0;\n\tif (type == 0) {\n\tstatic const G@Type@Value values[] = {',
+   vprod: '\t{ @VALUENAME@, "@VALUENAME@", "@valuenick@" },',
+   vtail: '\t{ 0, NULL, NULL }\n\t};\n\ttype = g_@type@_register_static ("@EnumName@", values);\n  }\n\treturn type;\n}\n',
+--
+2.51.2
diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.20.1.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.21.1.bb
similarity index 67%
rename from meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.20.1.bb
rename to meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.21.1.bb
index 1330206a8a..16b90840c7 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.20.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.21.1.bb
@@ -5,25 +5,24 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "exo garcon libxi virtual/libx11 xrandr libxcursor libxklavier upower"
 
+XFCE_COMPRESS_TYPE = "xz"
+XFCEBASEBUILDCLASS = "meson"
+
 inherit xfce features_check mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[sha256sum] = "fd0d602853ea75d94024e5baae2d2bf5ca8f8aa4dad7bfd5d08f9ff8afee77b2"
-
-EXTRA_OECONF += " \
-    GDBUS_CODEGEN=${STAGING_BINDIR_NATIVE}/gdbus-codegen \
-    --enable-maintainer-mode --disable-debug \
-"
+SRC_URI += "file://0001-build-Do-not-display-full-path-in-generated-headers.patch"
+SRC_URI[sha256sum] = "e57a33d0bb9d63d0ef6f469c2d42cbf66e37d9127cc204de411b7385274e26d0"
 
 PACKAGECONFIG ??= " \
     notify \
     ${@bb.utils.contains('DISTRO_FEATURES','alsa','sound-setter', bb.utils.contains('DISTRO_FEATURES','pulseaudio','sound-setter','',d),d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)} \
 "
-PACKAGECONFIG[notify] = "--enable-libnotify,--disable-libnotify,libnotify"
-PACKAGECONFIG[sound-setter] = "--enable-sound-settings, --disable-sound-settings, libcanberra, libcanberra sound-theme-freedesktop"
-PACKAGECONFIG[wayland] = "--enable-wayland, --disable-wayland, wayland-native"
+PACKAGECONFIG[notify] = "-Dlibnotify=enabled,-Dlibnotify=disabled,libnotify"
+PACKAGECONFIG[sound-setter] = "-Dsound-settings=true,-Dsound-settings=false,libcanberra,libcanberra sound-theme-freedesktop"
+PACKAGECONFIG[wayland] = "-Dwayland=enabled,-Dwayland=disabled,wayland-native"
 
 FILES:${PN} += " \
     ${libdir}/xfce4 \
-- 
2.34.1


