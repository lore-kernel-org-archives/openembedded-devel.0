Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D035D0E6D9
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 09:41:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.42579.1729503672378237273
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Oct 2024 02:41:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=00243e086a=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49L5YLb6024583
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Oct 2024 02:41:12 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2047.outbound.protection.outlook.com [104.47.70.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42c823sngg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Oct 2024 02:41:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fXh6vhj1v/9JI6nqgZ3MgYjPr+Cf6lh8wbQwN+7Xrd0fUXPv9ppfwjUSg7okyhAIsV7UlG+AU6mXasxOyAw8Q565dVEFqHSPEIq0UzW+i1gL7YU6wL0dlZr5xud2MJe9b9Ijd6Oozy8GYCSmJxyPr/DSYkQxiwfufpHXg6yl6SkoeBQEzK+Ryge9XLeOR1vCEwVC4NkZjDKTWJZ5UCiaFNU8bJI7RcczFn2vlCdo4cOfvRVkrB35NA5rI1DcqSwAwF6+nYwSh+E3z3jC3xFTyDPxe6BsRYuAZxxR4fgJkZnBQvWczWEBycmmRwpYfZiJuTovbET/5lqdUdyzrTpWXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7acZjh9WG2v5vyAFpA6if0l7LCyz4Vi+KE0dF3I209M=;
 b=qumSmLjDQ2pUDIFHlFNIVDktOSLTWxmgnC97ygiaxw4pwvBsvl46UleE3fvbiLhcdLeKyqQuP2JGg9BvP2E5nUM3AuU9ZnKXFle1zaGnGqyX3PPIJBxXlcDqApjoB/GCSEHLTz5mWB57xNbDaJA0X4WsM/wkI9TiudYTq4bjvSxvBjy+6USO02WqUPrRaxSt0NY2ZqiXoOrfskt6E6XmFcLetChBLdaRsdbekl4a5pANJHJrVtlmMFkpWO4eaHE3ncbr4PTdatTNQuAH5RBeAmenSOZUlqgAbSb+bXxVsMWXgFVFAygB3oRmBrS7xPnNh55F7BwJXaQXLvZ9Cq//Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH8PR11MB6778.namprd11.prod.outlook.com (2603:10b6:510:1c9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.27; Mon, 21 Oct
 2024 09:41:09 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 09:41:09 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] netplan: upgrade 1.1 -> 1.1.1
Date: Mon, 21 Oct 2024 17:40:52 +0800
Message-Id: <20241021094052.3891613-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0164.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::32) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH8PR11MB6778:EE_
X-MS-Office365-Filtering-Correlation-Id: 425c9e63-b5b5-4fc4-5449-08dcf1b47ddd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?TdJ06QUwaOTKcEF5qu2nEJISnqLlxs6RHz8j0EifQL4IRrNZphBYyOnuRPNF?=
 =?us-ascii?Q?aCaSEU2o4CQlMsqqL0ds89l1KDw8/rTEjC5FKYuL73pMCNCyuRG4qrH8VrH1?=
 =?us-ascii?Q?xzaQriw4UbVQ7crEQFG+5R6WzbD8gwCmunWdQP/CmhvQmyfoLA4ynpOpaqku?=
 =?us-ascii?Q?s6EWq/ksxL94AfN4LjT5Jxdch1iAhmfGjLs8XgZqbUCmBpfhBETDhfAfDAC6?=
 =?us-ascii?Q?hPTATJ0yg5CcTioVHCarzF4/AoP91IMVnswDtOV0HA+Z3hLBLnclbopvl30h?=
 =?us-ascii?Q?9lQiCv7QqRFOpKyGJrMGkI4aaCN+usnY0FLnR/dmM3ZlhCxWaxpIsUAFJaHG?=
 =?us-ascii?Q?+LDQuzWoomroE/WTsNzOcjFbP45tWDcyuW7ZRXZxpPtMzmOHyY0PYr+gZMwP?=
 =?us-ascii?Q?OyhshsIeMppdN7hrUfXlRJo8ZBQrMYqn9GjUSm7umiCNTYabu8FCcinSbg4D?=
 =?us-ascii?Q?JhY935U/eA+bwsz+pgwqOkxeQhIUuaQvucOraYC3CO792Pn0Cyo9ixXMkRO0?=
 =?us-ascii?Q?QvAPy7Al6jQ4bvHGIo1Sge+a0PWIR5gQTZqMlFDkIdzUXNQlvMr0V8b9MZbn?=
 =?us-ascii?Q?SCfqUpIlDCzwojI3oyEvp0Pb+rGMC3Hp+AQQEQ/8bbbyVJcVGLb/McOwOAWk?=
 =?us-ascii?Q?P3r9fA5nvVMWQtPVbCB+FhMAwjt8Ih5/+87PZNcASEHoidVk7Rkc7Kee/f66?=
 =?us-ascii?Q?YRM05oUTz3Lh4ca/3kV/NEwIWjjIToEnlzWZuWOQrZX0b734VL14AQVbSGBY?=
 =?us-ascii?Q?vMq7EvOyhPjQM7pyUvJHzEeddAsgDec7DKY5Zx00hQzioyuNU3wsS+0423AI?=
 =?us-ascii?Q?SKgSWPn6enpNeehg7J6lC+2uGuls6zTk+wa/yHhpDhJGB6ovRwizmCGLHKZI?=
 =?us-ascii?Q?DHYN82MJJ2duapYeY22hm5x/az6QU8NlGMvkTUekP9T2iWniiSr4oIXDI+w4?=
 =?us-ascii?Q?/uJP5ruxlseI42mi6U6AYwkQZ747INoRORKijEctaAPwnCqefSv9BmdyiiIE?=
 =?us-ascii?Q?wypg6tMCxqX3lvpzS0vZNelDk8BwWTbUSLddIrEvWQ9yV0DR80U0ogcLMBP9?=
 =?us-ascii?Q?zQZlg/1l/45ykz8MnVnc/aBVNxYvAD/1nTlbk56KKVHuWFZ0PR8l8365b5tK?=
 =?us-ascii?Q?PhR+2nbNhkkNWGmBBHV156qCWKTNGpbNEiAQu5nqy1+xIkIEadidktcoz2xB?=
 =?us-ascii?Q?gvDj6C8Yc+ga49okeFCchEEJyttiZk+QsqUjsWe3vgOy1ok6WJehfGyAOACx?=
 =?us-ascii?Q?0DCIFk3vtiWblIbFloNbB2Ot3Z8fr3uO0OVz+PHl3hM+bHRng/iaBWFh89Y6?=
 =?us-ascii?Q?10bTaptG+neQtK//EMvmnaQMyjEQXxr1i4Z30LCc7pCgJsAmS6rrb3rVPITB?=
 =?us-ascii?Q?e2/7vDXvPQds0aQxZBYEI8Zs9lXY?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XaRCCmnRiHLPWfW2FU6mLoMTEt6IgBvLDln6J6iV8JZPQnTmP1AEhhz8Sn6d?=
 =?us-ascii?Q?3TBKlaMvsncchAEwsLwChGr0fIYLQ4xqfuyVl8+CJJHzIdW4KXq4G53JnLFq?=
 =?us-ascii?Q?Hw5VlMIgYSXF1ulNHQC/mNmX0hu4kRL2YzX1XvxRjGCWCZ6v5vaeubnxD/Ty?=
 =?us-ascii?Q?sHkRJDhXkBWbFiUCU2xxdogr9F9ku46eWXne7wOv7FP0B6/mwNgxcKBOnpup?=
 =?us-ascii?Q?8dH2lOX44S8VrMbYIHLiRJF7enL36d+lvcE2hU4aLhgVU12DK1puLaBePTiA?=
 =?us-ascii?Q?y5Qnq5ic+auD69U361PvfO//ZKJkQf8xDQ5MikaUM95FTnECYQY52Gabfd+L?=
 =?us-ascii?Q?PK1/dpCXaFn0KTQR48liI2CwGiGirNrXQJv9fXKh/UZB3PtRqfUMQV87U2nE?=
 =?us-ascii?Q?z9rzP0v03pdGEEHQcQreJ9DCY7biiQ/StiEOpHysO8k68b9XfFTAY1IRRlv6?=
 =?us-ascii?Q?TXAaoiu73cLTMvP65XH/Bjx9QbPJM5dsMm27LOU7+FVtCeE2RqYiN2ZMlAk2?=
 =?us-ascii?Q?wvhMt/3/rW/+lT52y/9diykjE+dZs/Zkre/PMuUhqmHvKoydTsmoUzRWQgUs?=
 =?us-ascii?Q?tcHF+huzd1LS3cLBx4OjlHpuly6RFy9+k0ihobdUdNb9qk5q/woRAQBiiRDK?=
 =?us-ascii?Q?xmwrtbHTZasVG5/BLZmyKpUliMGlLYPJC/6IsfFYAfANoD+vE73TSsl6JrcB?=
 =?us-ascii?Q?Wl+lqy0atVss7qUfl8ExUaXFcU5ALmVUH04WG57o+NdsKt6o2OnuVjfoJIm+?=
 =?us-ascii?Q?MV/PwC+0eKwkZqJBjMocrSTMxA5TgX8i4zXgpJwT1e87D7UjbShS8g7ks/Tu?=
 =?us-ascii?Q?TUxSb5G8IOflMC4n0uo4Txx7UxNbinG/uIjPlEc4uEpzhICY77nT/VIZFAA9?=
 =?us-ascii?Q?smwzRbuZzKkVaxM3O7Lp0gkSnHPVdTlwPWMY4TchUh/fb7rk4EUbUZVINLk1?=
 =?us-ascii?Q?I8cglFkHE0rd9vDoODx92abPPYswWlbc10Kk4/HYCBmLb6z6ugLx8Stp5wYD?=
 =?us-ascii?Q?XWwdxoWF8M3W2oSgIrHYgwXJqmxdA1yUSXBWajNSxgU0+e8bJzo5r5k7ibsm?=
 =?us-ascii?Q?RWknNHMHS4rn1bGPVN1ejGrnt99KLrWZJN8taw9U/79uGDFt+dtf+vasx1Lp?=
 =?us-ascii?Q?2zvLlYm2tlLaqrnxIEn0vczOstWZdnwPBTm9irkM/dgGvuY1xX0nJB7sVS/T?=
 =?us-ascii?Q?noUt27kj8SChx3EmWvk8Px6fo98IMdM2+/h2D6LAHjL03sGLuUdpu0uvOeRE?=
 =?us-ascii?Q?Mp+ZYzqkNtZwFLsYBcZ44QgK6MfG6BTbLubArZY0EiXrbWzbUy9q2XAzpFJ3?=
 =?us-ascii?Q?kjx8eVr3ol1H8UNp5CAiQmp6O+NU5/8xwephCRS3KzE2+Tpn11CNdHgWE9RQ?=
 =?us-ascii?Q?TdacGqvL1eilnjasfVH4m+udWsejSEyxOdWZqS0UBRy6UHfifuhgsthUWlP+?=
 =?us-ascii?Q?+RlqX+k8ef9VpXRdihUjLObkQPkrJQ6OtSTptPpxsaJ2oUXTYLVZW5ION6dd?=
 =?us-ascii?Q?A9F/gBOd9ud8/zp+tSsXpQGXHZMdGQzYitJ2xOHkZMpku3y6FQUfWPMdvk63?=
 =?us-ascii?Q?eICiujwUWrrgmbuchBOnKQJQxPaL+zMDIS6VpP6A?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 425c9e63-b5b5-4fc4-5449-08dcf1b47ddd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 09:41:08.9531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x8DRcVO7WZaJQLdf1NGbY7sWoWTHYqUrw905ky6YD+4QJ+xgh4e1MNvJ/6ZIF4qQaZfhBidhZgq0I5JYJqDDbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6778
X-Authority-Analysis: v=2.4 cv=UrgxNPwB c=1 sm=1 tr=0 ts=671621b7 cx=c_pps a=l9lnEPKonMfu/vbXsUzXcw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=uOQA5XJkvANoyNeuNKIA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: l_DBBGKuBg4G6vjoFFSEzFGeGx8RcGke
X-Proofpoint-GUID: l_DBBGKuBg4G6vjoFFSEzFGeGx8RcGke
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-21_06,2024-10-17_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410210069
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Oct 2024 09:41:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113074

ChangeLog:
https://github.com/canonical/netplan/releases/tag/1.1.1

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../netplan/{netplan_1.1.bb => netplan_1.1.1.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/{netplan_1.1.bb => netplan_1.1.1.bb} (92%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.1.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.1.1.bb
similarity index 92%
rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.1.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.1.1.bb
index 40d72caa0..96a3cdbfd 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.1.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.1.1.bb
@@ -14,13 +14,13 @@ inherit meson pkgconfig systemd python3targetconfig features_check
 
 REQUIRED_DISTRO_FEATURES = "systemd"
 
-SRC_URI = "git://github.com/CanonicalLtd/netplan.git;branch=main;protocol=https \
+SRC_URI = "git://github.com/CanonicalLtd/netplan.git;branch=stable/1.1;protocol=https \
            file://0001-meson.build-do-not-use-Werror.patch \
           "
 
 SRC_URI:append:libc-musl = " file://0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch"
 
-SRCREV = "d27f32305f7f06de449b32239a89969e6ff2be31"
+SRCREV = "731d3c9e7e88d3f27ed6cf77edba7a2f5890a778"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


