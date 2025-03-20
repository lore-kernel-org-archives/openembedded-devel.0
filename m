Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E75EFC35FFF
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 05:40:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1132.1742449233981917668
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Mar 2025 22:40:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=51749bd76b=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K5eUre009323
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 05:40:33 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2171.outbound.protection.outlook.com [104.47.73.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45d0h95g3x-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 05:40:33 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mlEOgNS4SrpxsWdcU3UUedXCRylV58tYpYE6TBZ4GOw/G2LLcfJ/Oo3JsxZTW9xHrX9xQ9Lz5HbgrwTwWNIPlgu4rY1Dviy2Bfy6yNGgaqWiMFhSTY7NAjWPixSsBlX+Cfp9h1UyErO0tNXrCmzHwfhR1+iNPFyyzYAr3uSJsLw1Ga1hvBMnDWyr3SFo/4F1StFVqzaddirO5cq+YB8BzzxZIpOlgarKb7tr4/Wic32Y1Hr9nosGWu8Y8OredbT52os1xDuSQssQoXmCqotWjLfHBD1NtA3ubeYIQ840xtP7SfUn0kNMLeXI13T5Fji1w6YeLPYUItvlPlyq53lffA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cXalZ/IB/825lIDPOHS0yaqf+6Pml+Cw2QNtz64SJi8=;
 b=V8ihKGcpm7hhIU/AJNRil6hEBYQ6NOe/uS5rqpVnYP+01IqlY+HfK0r1eIWh5GETmiO2xt97WAVhnyWcvYImRdXzZZ/YB8B/BQx3Qx4KYoixH9rMBkhpwJ5Ao2iAJhhspGDjG6CHGc89UEUyHU1XSZaaw966JuQxxqlAI5/22rznFOQZOO85qybGKmsW9ADg+Cko2YhZMQLewUgZ4Py5AOLt4zHqygW4LJSakU6kBW2KIsaksKghrFOOl5zckZL+w1GqohBNg6o4Lrry6HKbO/dXziwinSZRAGPqWoNLle6HKVY56g6JIGAPt0z1quN9Gsd0gp3wKyXkAqzRsc3FUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by SA3PR11MB7433.namprd11.prod.outlook.com (2603:10b6:806:31e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 05:40:31 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%4]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 05:40:31 +0000
From: haixiao.yan.cn@eng.windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded][kirkstone][PATCH 4/4] chrony: fix do_fetch error
Date: Thu, 20 Mar 2025 13:40:09 +0800
Message-Id: <20250320054009.838158-4-haixiao.yan.cn@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250320054009.838158-1-haixiao.yan.cn@eng.windriver.com>
References: <20250320054009.838158-1-haixiao.yan.cn@eng.windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0191.apcprd04.prod.outlook.com
 (2603:1096:4:14::29) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|SA3PR11MB7433:EE_
X-MS-Office365-Filtering-Correlation-Id: d848bcd6-a35d-42ab-326b-08dd6771b9fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ZkZsouqGEuMDU6MmVnSmHZ7ElgeGqRoEzQZqrvWJrBO7jwFZdSgdUUdwGVFY?=
 =?us-ascii?Q?vtuDQ0p8UggPK2Kslezv/IwcQ3lnV7wN4C65LmhpKBHyuAFSxKyXaq/gKQKM?=
 =?us-ascii?Q?OSVK19CWkA0AQ7LQR2qZAn7xaR1Xxno5Rt51d1jCXH6hmcUJDfCZERH3smRP?=
 =?us-ascii?Q?wrU3k+dHMUo+hxsVN++7u04mKIPIHA1u1QJgRj9QjIBQSyV1RUn12pGmXSWi?=
 =?us-ascii?Q?UQ3nPn0f1mm7wRZa5Rx9/RoUwakpKhtjoQBx82ZjtIefkEpnH8Iz35pH3kd7?=
 =?us-ascii?Q?pFa1gZlXGSrF45jeMRJxpehMQUxIOUxiLGCddoMucwwW7AD/+P5FUWL3D8q1?=
 =?us-ascii?Q?t6UxtP11WwohUGQxda2hjOHu98St7DPxRgpH86Kg53iDC9JWwUlhwuWGGQi7?=
 =?us-ascii?Q?5c08SJv1mxsnlBMLSQvj5nxw4ZQ62pPLPh92hREkDPiHYHZx6tlRJAlU1ou0?=
 =?us-ascii?Q?93V99ch6me9/18HlQ+hor5AVMtPRwjWNE9xLz5e62B5IKx0FqAYBdbh1emBZ?=
 =?us-ascii?Q?lmeL+OeCkWHV14tUAYkpmaZGbcFFBPwJLuXocPvoHdlinZc83r63JhLPE3bO?=
 =?us-ascii?Q?pNxOgZHWN1poikQ2XbUzYo1Yo2Q8PNZRXvh4iS5LVljEgJ71vB6b/Maa9CPK?=
 =?us-ascii?Q?TpplDtNrnqQpPzpCNPgzfDFES51UREknOooFA2z+/x2D1qLg5dT3Xd7ORaVQ?=
 =?us-ascii?Q?ZovGCG12E/QOTennp/mBVGQdYPBLxEyjgAhkXrtk+/j0+G5YFoaFDLC61wVN?=
 =?us-ascii?Q?V5wZMsx3Wo9B6zoRHUqrgTzyexEznWcc0jolBnmR23HkEBQPAARfIrDgUTBJ?=
 =?us-ascii?Q?um73lovLQQzA7wAswb5t9EhelNRgDCbiSjF27wbBqbeUnflqWVRkw/yTRhnX?=
 =?us-ascii?Q?rSsWnvZHS0YuYof3gB5rYmtNI0Ztp32yppALnINVarNRmwm1a2sP2PNeFkdk?=
 =?us-ascii?Q?QKDsUBh0DMuBCOUZqwGfzZ0iPq3XspAPeKQ+dXm9yPar6DrFrFU0xZNvM5Zq?=
 =?us-ascii?Q?+2jIKIRgQyiEmuWl3o4skkUnHVj3LFb+SIiTQV/776Qt+7iwiwgutbC6YggQ?=
 =?us-ascii?Q?OgcMPglonaX17mM8h8kdIfJwbe4nuEJXU4PZLE4acD8MFbwmH2370NglyiOj?=
 =?us-ascii?Q?isjvv/hNmC0ZA5ppgBBb5bbqSQRS/aQNN7FRF/YQr4QpGrQS3B6kSJlhN9XR?=
 =?us-ascii?Q?Jc/PrObjF7Y0y3EkD5Xx2NCiV96wGOOwsEEHG/GPFNNElytJWxfh424w1G8e?=
 =?us-ascii?Q?+Go0KfqI6WdlfJRNKzJ8sy9JiE4iScEBQWUznfChQjdsHg4+k1SAFh8MKkjm?=
 =?us-ascii?Q?/CXEnwzGWDgkABCjmNBYweijwG7FBuRcSLUco7ptRCOMlwHxnMryhwBfFBgt?=
 =?us-ascii?Q?eaW//MQo/pyZyoEvAkqHbTqnfUdC?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4JFijJAjl8hN/ic9dV0gouj7O8U+jzKD+S0w+HQdQ290DAFqz2rpqQ9V9yhM?=
 =?us-ascii?Q?5wFtyfrYJdMfn9WQfmrcOTIUlWyl+t4tmrEYuXMEiihhOrGXfAcRc1c5x6Vx?=
 =?us-ascii?Q?q/XaiOeSStCXNjsedIuwC7vMN5lnuf+Rhe/azbL4UtZ9MzOHFAJVYCn03WbO?=
 =?us-ascii?Q?Xi85+7U5QC2AGfzB90i9dZKXhVLdtg/CtezX4Gon7j//lhsbu2VmvKISQHEU?=
 =?us-ascii?Q?zQDrOdFnO7JK3cvwJUdLriLaeXhjKFg36padKgFw93dolWLWYDHEXnw1s+/W?=
 =?us-ascii?Q?3kyGErmNBb//PC6hy0N4xAmHxhmK/AWDbSZP9JYS+XCc3eRTi4T2MY8jN/Ft?=
 =?us-ascii?Q?pqqa02xcAoct8ffZFgWI+5+38F18dR9dRS+YVskUNlgqWYhC3FFnoYSVbNDK?=
 =?us-ascii?Q?WaLVWPt+usU6nGcYVxzNw8jy2NSSFZZBn5guW1VXDB3GM4sYv1MvUnW/ObYD?=
 =?us-ascii?Q?4VM2jWjbk8pcgKvlwEP+kX+T8sZZOBvRM9TdlHGAgkl933VdWkUVtlDyv/Rz?=
 =?us-ascii?Q?VSkvov78MtHYmiznJtmGVycyEMz6hHa3PlXAO0sjUQpNeyMqqeMmmuW3dsaT?=
 =?us-ascii?Q?+InZV2lYxo5PyS3mTo0dTI1MbLRPpLGcivvOGl++A2A1RZttd5D6l/hFjJks?=
 =?us-ascii?Q?yTYiEIfiHSAyRcBn98A9vkxroIhAa3k52VkTUwx1Ncup+Sx3MW0tb3TjC/RU?=
 =?us-ascii?Q?3YmDxiF5d27U/0HcrXzl7LIjwghDUbstD+F7uUEUhMalftlpxdZEVxwKkUU0?=
 =?us-ascii?Q?pzO/y3lph2BKhLETzCydVtBQX+3ySOWbG+QnwIjBMeV8ggxfRIqro9GSRiX0?=
 =?us-ascii?Q?lE+/3v2krdqvXS05+lrWtJOpntY8NSmwNU/ZfaHcYfDgcBqzReMhPMQu/sxG?=
 =?us-ascii?Q?h2bGyjww1fmoS8sBtYU3G17vcxiVU/0nyv+15akQgVjNu6J7SY7FRXEFCovA?=
 =?us-ascii?Q?zO5JqNua/DkcVa65EXzapezUL63e33ZSC8iZsFr7Gao87AFHEaG1CbebhzyB?=
 =?us-ascii?Q?SnJkLquJ+bY9E2H6dGcSiokJ6WzD4baVClMayCdQ00aEy1A2pLxLnRG464nC?=
 =?us-ascii?Q?548OG5cCFxSSitr6dZsF/O6E5X6nvlKmrG1CaoANFBUp6y8RyZfalcKqUX6m?=
 =?us-ascii?Q?qjXuN9rzi8jUlQWPYiMFlUORZ5aFqrQLnFLA5jvuoIdkgMn5ijnEsfCe7Qj9?=
 =?us-ascii?Q?ZSSXxkxRzt0oaUvoHthSC1WqyJETjRpJLcYCK5tEhq3V9cjHnOUf0ZW3k2fK?=
 =?us-ascii?Q?4F22WPnZSwheObc9tsZ5BuuW2j+XBhk4Bu4nNZvznMULCsdfodG/T/7YVHU8?=
 =?us-ascii?Q?S34cSpTl3K9H1pUnSVm9fY5ZzjRJvbECI7XHahz0FY7DyRW0dtXccU/42X4r?=
 =?us-ascii?Q?FrYmjCfOxCXOtNlBTwsU6GyIB4E5lYUzeu1rdxGqzhsSqfiFRuvrt+UvqOjq?=
 =?us-ascii?Q?Ujwpz7LoCVRaXyA+0ebEs7Lb2OI+MVSmxbv8dzjTMn2FaOtYWaeWT/yhG9PF?=
 =?us-ascii?Q?pZgPgwCptBEl8EKJvQGc8qDycMcuaXSNAmQm5YpQbQ2UCQJ6ZiuGSwy6WUbe?=
 =?us-ascii?Q?THVHC869ih7PpH7Mp9MDl6/cYTundESdChY/TDZ9Wr/aq8aQm9AzSryC8u2h?=
 =?us-ascii?Q?6Q=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d848bcd6-a35d-42ab-326b-08dd6771b9fb
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 05:40:30.9295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 93UUHn/zrrjV1FGCmqvQ/atBkPN9oVMJKJq6cfmUxe+SiApfLJ16GoRebwZS54wl6Ncajog9mOdLzwDzlAii410ThrzcJFFPhEeqYC6fjD4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7433
X-Proofpoint-ORIG-GUID: n4mJoAhbYxwMuJBzj4MRwWiaP3BuIMY4
X-Authority-Analysis: v=2.4 cv=ROOzH5i+ c=1 sm=1 tr=0 ts=67dbaa51 cx=c_pps a=n5+7iF7l5R/EKaY7dbRUPA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2MUAHTJp_KMA:10
 a=Vs1iUdzkB0EA:10 a=H5OGdu5hBBwA:10 a=dIu3SnmMAAAA:8 a=wxZTIvLhAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=G-axfLThCGkl4GXj2LMA:9 a=Ua9G7VpiFza3u12uuhVB:22 a=pEOY4cZjM94Q10G0-i-k:22 a=FdTzh2GWekK77mhwV6Dw:22 a=Omh45SbU8xzqK50xPoZQ:22
X-Proofpoint-GUID: n4mJoAhbYxwMuJBzj4MRwWiaP3BuIMY4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_01,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=917 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503200033
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 05:40:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116119

From: Jiaying Song <jiaying.song.cn@windriver.com>

Change the SRC_URI to the correct value due to the following error:
WARNING: chrony-4.5-r0.wr2401 do_fetch: Failed to fetch URL https://download.tuxfamily.org/chrony/chrony-4.5.tar.gz, attempting MIRRORS if available

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8ffe8112f733c6812732b0fcfa8db7d3849914d0)
Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 meta-networking/recipes-support/chrony/chrony_4.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/chrony/chrony_4.2.bb b/meta-networking/recipes-support/chrony/chrony_4.2.bb
index b7d21b7e91a6..afcc0a3b2008 100644
--- a/meta-networking/recipes-support/chrony/chrony_4.2.bb
+++ b/meta-networking/recipes-support/chrony/chrony_4.2.bb
@@ -30,7 +30,7 @@ SECTION = "net"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "https://download.tuxfamily.org/chrony/chrony-${PV}.tar.gz \
+SRC_URI = "https://chrony-project.org/releases/chrony-${PV}.tar.gz \
     file://chrony.conf \
     file://chronyd \
     file://arm_eabi.patch \
-- 
2.34.1


