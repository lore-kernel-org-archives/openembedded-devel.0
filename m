Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DCEFC3DA64
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 00:59:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.83305.1722560351494680473
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Aug 2024 17:59:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8944593547=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4720sLIT007734
	for <openembedded-devel@lists.openembedded.org>; Fri, 2 Aug 2024 00:59:10 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40rjf2r41y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 02 Aug 2024 00:59:10 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yVaW/dJhSXw6uR2S07RNZqapNYb7N94CLA5KuVniYHgw/H2hjQjx9CpeH56hw4jzF1mV8fz1KL+CtZqBhs8vjSbwO5gIM3EKFdwc2NrzsIUVy3BLn/kGgcheCmDN8Mjalajk6Z9nmC58DV6dPjZfvYgedqL7WxJiFm8eEh4P1CG8T3/MQAarKO8bbHni6HDLNIxIbgMXgJuhg73nw0xMeDUf9cnR7N3oaU4d+o8cd/krksQxdsK++aWrFPOO1oQhSzO8PXr+zM9DP3Lv1tm76fY3m97f/9rn5mnnirluBrVl58E1qn6NgeBGkX3XvCmuHY9mwLCy1cv/377S5fzqzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AuFP8ZH24iibz11ihOpF2kJcSCXR5ZLLBKVA5DVf9MI=;
 b=Pk5fOloOVHW9OyrACyCzxx55jnfTucAhA/OApbpul2J1eeaT0r5XA9E/ijl4FmAn62uwujAM0/zeo8mnhnhyLtVyAgU7bT+TNQnem6YPwvmd11t5nkT2Xmg6RTXFzbMIDZqu5WdhZpiyvJN0CGNLllL2NCDy/yycdx6m0UPR971XoNwHlc0lqiCRGITGiQxqsGQXnEDFnpr7n8m7wtTB6Z+vYit7PhFtZBlFnyv9AQkiu1V2asmTgC3PDWSFLALfgqNCLfWJn7O3nPk9w8hhX/uLksZyrZkTuRMlEUOlcBK7EWCyoQ2V5UDp9F4EA/OjHXPpu6ayRHNzS+Fydqr0ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 IA1PR11MB7871.namprd11.prod.outlook.com (2603:10b6:208:3f5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Fri, 2 Aug
 2024 00:59:09 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.7807.026; Fri, 2 Aug 2024
 00:59:09 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] snort3: upgrade 3.3.1.0 -> 3.3.2.0
Date: Fri,  2 Aug 2024 08:58:56 +0800
Message-Id: <20240802005856.1717959-3-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240802005856.1717959-1-yi.zhao@windriver.com>
References: <20240802005856.1717959-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:404:56::29) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|IA1PR11MB7871:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c6a857d-3e9e-429d-ac55-08dcb28e5097
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?cxicZgx5y1RtQ+7vtqsytUXeL9laAlYOqEQYsQpNyStOQwZeJJWzXwO+nhlo?=
 =?us-ascii?Q?ZBq0SIZQ+zaWmQeI2b5XbPh9USZztmQVVoT7qmBXliIl1p/VkvHLxR79MceX?=
 =?us-ascii?Q?UXcQc4Q/rIKk1Y60uXnZspTUPxmySz2OQlFtth0grAg5S7yQMQIxEInP8UkD?=
 =?us-ascii?Q?KnARaznUaqK2heHp8sHNwi9zkCZTzZac3lZZw4ZbOfZxwBSUEaMViskbLALV?=
 =?us-ascii?Q?Km5goVS6IpJRtk6e4TM9iR9BHyjQY/2b9lcgaQUhuzlS2u6gQgdPeq70V63j?=
 =?us-ascii?Q?uPoakDu4FiDek/0zCiKlpRpJeX7qQFGUn3Ms0eiVwlZxLR/SD6u/2CF8qLmi?=
 =?us-ascii?Q?z5jXh0yGAV3pR/O/c0glROcYlAdKEoDZMT4pRuA6saAgwkS2+I2a+TcmdXmh?=
 =?us-ascii?Q?9q1g+OtozXzJ9E3GDwFUB1CynnPcY8urSc6LDPG/czez7WaD/l/O6cXvbauG?=
 =?us-ascii?Q?/iMvO8U0qFpWXxB/XGvkzEoewgR6INR0nsDR0q7W5rTv9/ZHbAolvgnSLbKv?=
 =?us-ascii?Q?ZafIV8LY4mVgD7za4yWlYkLQLubsoCH5w3BMfe46GUGOVY6SkDuI2cP7R0Z+?=
 =?us-ascii?Q?WeaSnFfuDOb97mRiDoCkMr7f8OsCqTfb9zCwDb/7rhlEPl/RCPYumGTGoOjh?=
 =?us-ascii?Q?o2pJFDiNfH1RT3lbqpvgFEJvQLmxnRNGJAuK7nmgcdUp/n+f3rbRm98eQovH?=
 =?us-ascii?Q?EaAom2gTrr2xWW+AUeVcnNyX//twBjQ22IyJOtq9vWxKfydXZjXtS+dplIZy?=
 =?us-ascii?Q?tQkK0XQvhODvmn4zNEEtgsYfgbGFwJNoJTCLevr77KwOeO2QLnC+M6JPNU2B?=
 =?us-ascii?Q?rQsn8sSRT2K2WpsOvqOYjyTn8W9r2OI5yx7ptlER3Q2gTMLwKb/y7L3lgBZb?=
 =?us-ascii?Q?cuNXzrk5wk3LARDe6TltafBZp+FP9AAChWbYaLYKez+kJUChL+VN2GYgToCu?=
 =?us-ascii?Q?FkkEUemHAYhTMUMIFcAfZs2Kdux10rUjL+ozE7MiygrSGQoJB6MrdpBP9RQG?=
 =?us-ascii?Q?EmVYpyZiNGHUa19Lq+pcnV8ZR/rkwHULrcM4r+erWKJbfhjdjy5FzrJ/q3R/?=
 =?us-ascii?Q?9tRMI+PQKACojXp1aByCvYMpLL8urC5E4Yiq5fy7qx6jQopl88DLIkGjhiDK?=
 =?us-ascii?Q?tVQOOsTL4+gMk1yCru+tuAMtObOmWvLfkLAvzvRWqb22razAGD+jsb1OuSfz?=
 =?us-ascii?Q?6ft33C4yPdYqSqdYuDoz9gW7GVCJsgkncVu6vGMNQhtczN3KXiAdMoiqiTQa?=
 =?us-ascii?Q?BLXuuRt5Gsdayu8Qyh0laQoenNGhEQGONuVyHhHv/A5DQPlnurU3wqG7LkXc?=
 =?us-ascii?Q?reu374Of+BFpcPNaLpMcUvByjY9AmWMs350jHkXvRhPwlWl8WiuKaP8jtYjJ?=
 =?us-ascii?Q?s0QnBEM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iPJegdaLVlO6CU5DzVacrqDFecomv1HhsLciwUsLSkJVQi3B6K6n3iDM8IJS?=
 =?us-ascii?Q?vkDgxMxFE0adbmg3IpvxYZ3N1wJ3bp0R/Ehxyqjdip8ZoYCTD+zB5Etjxr/0?=
 =?us-ascii?Q?OFt5tXMtZ1xx/WEfUv5RKe0GAR+qHsUuBEM7barJurH38xRbX4RQ2OfvnA8o?=
 =?us-ascii?Q?u2RynvrKVnbWG9mi2uxUp8ynbLhAlYxMgZIQQ+LCnzah6W9yBEHOsqlaB8ON?=
 =?us-ascii?Q?BjweIWG8XECynyOdnIKq3G4EzIRKOGA8lHoH8n1RvQQ5N+SHlw/54eTZBTjV?=
 =?us-ascii?Q?eyyFPcksr9iz/OTeeHdl9D0FrJuYpx/xe7zODTpn0uw9yKchJz6d+8Rlp3sG?=
 =?us-ascii?Q?a4hDDOpBTJ9RYjnw8gNZhaJ/gxXEStEMbYI8ICDKNbEntTh83AY4Niqnc28C?=
 =?us-ascii?Q?rR1f3wPp7CEhL/KHA7spPjywkVUe4NDgSpzlioanPFxUuCpEd6L3X7XJcfjC?=
 =?us-ascii?Q?aU4A5eWC2UNUJrHcMvJvA6W3wxpeVaa2BeiglpYzQSPb+EgTofTv7Mj/tRdb?=
 =?us-ascii?Q?t8BEdcyfX8pkJ5vhwql7o9uGhh17nCIGxCoLWedbMu/V99dl775xax6SD3Oz?=
 =?us-ascii?Q?Ugi8r2KHyU1znWKlmqUSazsVLbo2zbtGuo3ukhsaXEd9lEUPW9CdloQz6WRn?=
 =?us-ascii?Q?tz1+GYonl8b6xl/hiPBQqjm/JnM1FNBTYiY45+ysLIx3zK22x+1qSegdBPNV?=
 =?us-ascii?Q?X79QIfXBap0T/P7UNM+NdJSs5YABJpD8g+fnS2HdnPgne2wpT35DrJ0h9+NC?=
 =?us-ascii?Q?AhybqPLBxBkNnLzFuKm+XlIIg3lSkaUAr0Mumw6TDWY7olohDA7fifA99l3J?=
 =?us-ascii?Q?8Qs091CmeCKwL4OgQ3qwHYB68Rl7xR0Bn9NHHDGbXHMGt4yZXO2HDUUL2Hoa?=
 =?us-ascii?Q?UQ/W6sHVcq4/VqEQZFlR5XVjzev47BY7esOR6Pztbli05YFHSHnOOt/a8cuq?=
 =?us-ascii?Q?0uc4ewODIrrOWqJWGvinuYLMWUXNID23qF0Ud66IYt86QPs2Dq+nydvPGD4S?=
 =?us-ascii?Q?WDnLA0GTqNK0GGd7bWUO1Sh7fNsay1kOMMqSKb9uVg/8nkhJznGeCs/XJhEd?=
 =?us-ascii?Q?cplDbKA+03iXhddsTVKnc0+RoXrDBmbecFbwhEBSfvffyUznVXGLKyIC8EUq?=
 =?us-ascii?Q?gGXszhAkUjfsjX1AUMAa7xL2mCQup+aoobYN4gXNhmJlNjKxMfpRWyFmeON7?=
 =?us-ascii?Q?rmzwjGEw3fGRyWGa3bS/g9HqYp9NjCYWaCLE8RQsfNY03MCI014Z+Ib/zcmt?=
 =?us-ascii?Q?mEZpg8xD5KnbXmF7cMwyXgCGXSUjq21Kdi1rTMd94cYWoyjQEbgmvsXHjjCI?=
 =?us-ascii?Q?54G7f6YUVFVy/nXdYWBFk4roYjPU6JwCv1MMuAozTv51kAof47KliVul0wy1?=
 =?us-ascii?Q?Aco30dpLgYSPo0S+R0SBIiv9bM+op+lpIIiiIH0+AK4PN2nG+zyImEDRzBht?=
 =?us-ascii?Q?YyaKZVxMR7l0GpDIwELinNOAVX8VQUlAycKaduelHDmLgVFtEcu8A7NjmCMd?=
 =?us-ascii?Q?D+do/89kCsAfurIlruj8S7QZTqWOTKnlWKW1Czo7AVkpTfkkG3rzYEvd6Ah6?=
 =?us-ascii?Q?prWINbh5wWNcljmDDd24lnTp3ewHEYVEFQr5bMU8?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c6a857d-3e9e-429d-ac55-08dcb28e5097
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 00:59:08.9507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sKPKE7w0JPznog8NQF2LN/Q8xN8+WMslwYAJ+1AmbkeP5pmcU1ilYMYQeQ9erEvDZeEP3/dsvyRUE7QBJuLT0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7871
X-Proofpoint-ORIG-GUID: 0CfnL-lDkZmpY3Amb4lXffNnNu_qVxXG
X-Proofpoint-GUID: 0CfnL-lDkZmpY3Amb4lXffNnNu_qVxXG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_23,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 adultscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.21.0-2407110000
 definitions=main-2408020005
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Aug 2024 00:59:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111496

ChangeLog:
https://github.com/snort3/snort3/releases/tag/3.3.2.0

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../snort/{snort3_3.3.1.0.bb => snort3_3.3.2.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/snort/{snort3_3.3.1.0.bb => snort3_3.3.2.0.bb} (95%)

diff --git a/meta-networking/recipes-connectivity/snort/snort3_3.3.1.0.bb b/meta-networking/recipes-connectivity/snort/snort3_3.3.2.0.bb
similarity index 95%
rename from meta-networking/recipes-connectivity/snort/snort3_3.3.1.0.bb
rename to meta-networking/recipes-connectivity/snort/snort3_3.3.2.0.bb
index a3de086b4..3f66a6b57 100644
--- a/meta-networking/recipes-connectivity/snort/snort3_3.3.1.0.bb
+++ b/meta-networking/recipes-connectivity/snort/snort3_3.3.2.0.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://github.com/snort3/snort3.git;protocol=https;branch=master \
            file://0001-cmake-Check-for-HP-libunwind.patch \
            file://0001-cmake-Pass-noline-flag-to-flex.patch"
 
-SRCREV = "9533e17796220b599145a0e2eba555af3f31e773"
+SRCREV = "1c574793564fd1256c08be1177b2e595d3592547"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


