Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AF0BF54AA9
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 13:00:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18832.1774357203360359926
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 06:00:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cobG4dq/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7543866fef=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O9vu8l2436690
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 06:00:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=3tTT6CySgTzeWfGlj5RwhfOaHwGoiiCKDaCnXuIYufw=; b=cobG4dq/wBQ3
	8N1G+RpCKa07gEVYfcFWwunIzZzbfGnz2dpbu1jgq+Db1rqojF21De4j2nBqL0Cp
	h/zhtN0q7Ey8AG0VNenJLxHcf1e4icamOdc1jw3vVbKzq4eEXBoN7CZrmcGqOQJ3
	7ksPmBwLu6q5YUxFp+oXpuA4SJcChdzltsjyfa6NrJJFj3bJLwGYUx+pdr3UdgeI
	Rl2z5ihFzHA/PwK8b/osIcdVLaAg5uCk/RKXxAcNk2F12Au94MVKiebSa4SKP6UQ
	HYKAPVlUYbbAcsYBEHT6NaGCPIatLRJ5ZxS7hWqSaqMAXf3Ro2Mqn3T/J0X1ph+v
	WPFak2b7RA==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013026.outbound.protection.outlook.com [40.107.201.26])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1pkyb5qm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 06:00:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VNmkT+mf8pe7dfsOMGaWqDrmT1nvjdgd4P1/iCdYbIlFKvpBkwuLhkoi+57rVc0nSLouSF+rxDPNYMz3Klmqor5WvrrNkaNnhada6kGm8X7If7bkiH+0cNRWSkvHxeEkNVL2CHJWENcyhGQryyhtt/C5mPkPvQ/mvWjsQnowHSHsaNYGuoyXNaraE8JMcaeswpiko2GSOERKa/tOZzEjZyqOqSUfqmeEJOeBJs0wf/1MPG5O00qa6YUshB+74BR3RcBfImoqHXTeMRmP1sxCeb4r5h1jdDOCkOBLMtxqEtjKUu6z0rkEuAdQKKdxNUR3ABfBUZex49KBe8SCC2Zw+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3tTT6CySgTzeWfGlj5RwhfOaHwGoiiCKDaCnXuIYufw=;
 b=KM7Rmdh8uLjz2pXiEXD0UkxCTzwLKgkW6h8gnzI6O2r9Pd4CSrG992U80O13s46UIiFprGlzmt6afGQWn1zLtMDkshyX65WEHkgS1V/4Z8UO3WuFtXqLRyaVhi6OLNs7Vr9af8+UtPgfnNGrueCbZDj4pgJ0CVbMBZNLWRULZwj5stqzp47AVhfZRx4p27yN5ee/3U3zKNUJ4CSmei846qqSVXclLgOoDjP0GhCyg6qxebOlR6OqkLUmWijl9Kqs42uNTQFVVhfvwZj4RKRwiBtubHkeUYZohKvkajmiRd96IKO9w9PmvYQfAxKG6t6Z0AMP6K1h8htseqAex5rjiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by DS7PR11MB6128.namprd11.prod.outlook.com (2603:10b6:8:9c::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Tue, 24 Mar 2026 12:59:58 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9745.007; Tue, 24 Mar 2026
 12:59:58 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH v2 12/15] xfce4-datetime-plugin: fix build with xfce4-panel 4.21.x
Date: Tue, 24 Mar 2026 20:59:24 +0800
Message-Id: <20260324125927.1070644-13-peng.zhang1.cn@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: b0a0b098-3df9-413e-04c7-08de89a540c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	qCt1iJUMue12vZ8TohGOHlbPZM03udvFz73T4j1dydvXT2vdR5YKlRJk/3deKVp31V0HbcFa2rC0XV8cyxoVi7wwbCVxWfB4ZEUdZi0I10fnpfVA9bhksSg8zV96cE3f1v0hd+/lCTtr5loslOMug57sTXH+PCeRL1dODjMtGXTswvRfNJ3hsp+rudfpRn9cngO/VlAYRGWeZmUsO1G0ZISpBuxCsJD1MR4fcJdTqwwutbqtRP9gnatmzzx15+3FPnGJQQz6BECPhn5E3d1ldaDbBlZ3BSFHM+baYZIQ49CNK7vwuFhBms/sdCxcaC5aqkvEv6MBCG25nQiwUxE3egQ9M/H4rrxlzqli0K84uW4BsiIthPsm0dvQeeiGnrNGCWxRpkG0cCMkMQyo8iSi9d204ve0MWyk/i8exkyaJT198o9L5ehgcDZqukbASn+yD9/+Um2Ausc/nqL07t26TyQPkv8SyPO2uOzYCbVL4g+lzSMLSr02OkFNQLsRehFJMeihzvUyuWY+ZtIhyUvFuggo4t81PobsFDNSEiMFW4JMxT6cLBVGYW/L3uLSTcHTSr1X1CmsIE8erhJfEuHSkN6HD2Xw5ViulkQ2euOLIFTvj2Ny4D6PMkoo7jvozGewG2ARfN1rGJ4PjaIXnNqVp97+KuN+0JkKkcw1Y8OS+rzvohd6kSH0kp+Tyl7heF5rOoOiUH5jRM8Cpv7zqt0IO9G7CDFWLxg08h7lTLHFk314d55gbdmDXTOtgc+FaIe2wCmuO+GO4PkhzYs2zmC+cwpSHOKmQ1bXx2GrM/4nxw0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lF8XwRG8FOvkTlpPr2v0x/5AaISswJTCBU10LIRkICQyU04NFVa42/hS/U3r?=
 =?us-ascii?Q?cz9AHLUVqBk+1BeiWWMZrmMeSgoUhkxUbGuj7CCBS2dJH59bamW7gWzn7ynf?=
 =?us-ascii?Q?OWvZe1l1zNNA86qpXn3gCWKtxucnJsBtuDaTG+GbFZXANaRU0CO3lODI0Gdr?=
 =?us-ascii?Q?bG+FvPrNgmqW07fpVH23AyTgXci+17Keqcz7tYsHcSwFclVJQvVwQC1XOI9+?=
 =?us-ascii?Q?V6VBvAssZCRhho5+JwCavXTl6U69GyaD36aJcGowTisdgdqM1XAgIBEMvAbG?=
 =?us-ascii?Q?ob94W2J9fZJ0EhYkoR75SI2ks0YQG5SECL6cevFVZuPtSz99Y9we0Blro4dM?=
 =?us-ascii?Q?OTkQdIlkELDXGNEibSVVFSfnxrFi1f5FIdzw+Dipue7S0gd8MxDyGS5oxZdt?=
 =?us-ascii?Q?qfjImN43awo6k5XDLKbRjhibhD6Z4/9zuQ5d+tq6YQ4kn0wX3gM81Fd1dNOY?=
 =?us-ascii?Q?ocCGYho3kn6pAUVzD3cFqpPwjazO6fjeHREesFjWQ0TWld4AZRZ8FQFVj1/E?=
 =?us-ascii?Q?wdst/4lahF3TUUKbF/F1wsb9G5EC9K/mQLfJmVQLF+oy1CegRrPIcV6At4w7?=
 =?us-ascii?Q?y/qfloTBZT/3x8o4PnOFB0OHc1PfduOwtj7B4RDdNHhKqgoug0vpRhdqzzkl?=
 =?us-ascii?Q?CwOLk5M3f55lNkVAlEpmQKrtRGiL4YaVMgvFEMS4Nr8OOhzTqyKlRDiCfjVG?=
 =?us-ascii?Q?jG8J1L3H+mX/Ehr+wvMEirdphWJkgR68ynURrALW/NenUoXnaXitRbkb6fXu?=
 =?us-ascii?Q?QPLoS1bTVvoeW5+OaLv2rcWyAmNlwWoxgJUSnuyqCcd9+SNvUHjFejtCSPgl?=
 =?us-ascii?Q?RLj+mp4ikb1Cm3dHKikp6MjYcEXNaSusvbcX18Cyq6Q8zSmXdetT7wBiuVm9?=
 =?us-ascii?Q?h/65U4jfkpSoOiHQy9FkdGJ1mdMHSNCPP8ff3QWVMoWnfMSccXfssLfZa/yA?=
 =?us-ascii?Q?Xi6fxgVoLb+3rGPXY/awFwdUDxGcIMhAF6sHS9R+vbkHPLeCNwLjETdarluk?=
 =?us-ascii?Q?LnKkgXcWw+/TkMInBcPVFpV6Ipnwu/M8N1AxfSCNti3XiJg9UiX7t2y5OABy?=
 =?us-ascii?Q?W4LSbxfnuRTVu2ORXu1HxxHouTPCstSgynVoF7F41gSc2hmD/ysw50CjAXTj?=
 =?us-ascii?Q?UmcKFZrHBjqHZnW+WYhQUqfoADwgKDpK0N+TI2KXhCnwn906to0meJYQqrzg?=
 =?us-ascii?Q?22ezkB8n+Km/1IcoSHB5iYnP7PuaFl+xToyNbpyBgkJYs7fF0hwzfRXUY4qQ?=
 =?us-ascii?Q?Je9KXkh932vgjvaxRFQKmEPy5Bnt7curPsGlDUXgncOdbgPgZ4+LVexbyqBL?=
 =?us-ascii?Q?PZcQa+6jUO+y2895tnCdNmhru/qG81ZeonyfWOqdDSfCK+whzBSXVIDra6VZ?=
 =?us-ascii?Q?6JcOKH3H7cIN584dOdwx3tWOcvCemjgbAYz+kkqOgn0a1rjCQhn/wzCLUiPi?=
 =?us-ascii?Q?lKbFbi+QbhzW8uov3A/Q2ExpoDgvvq/aYmllcTdhrtTdiCENIJfoPstdDNvk?=
 =?us-ascii?Q?6W6EKOPrUPkJEQbPE6SD90gbKTbQ2hKlYymcuR46X1bL7MuxtOduvXIqYL0E?=
 =?us-ascii?Q?3PFXWqibRAxALktFYULJBb8yFPa51LKWDQd5YpVXObRxnG+5dv/sDjIUvgml?=
 =?us-ascii?Q?zyg9XRMDJCn8GGjlXwmg+iKzkul9OO10DMRpRcZ/ZF4fYXma9nJ8Sjr4s5Wd?=
 =?us-ascii?Q?97JX5qOiYyegXpE4ABG6Yx9q/r8G3aJqrSZjyXhuZBScin2gJYZmSjk1UlMP?=
 =?us-ascii?Q?gk5lyvcET4bLuCa2xfvYxWT+l5GVUnA=3D?=
X-Exchange-RoutingPolicyChecked: 
	GrgffSXkxdl3aNyG2amImyDqGUdRDa3pULC+BYyZ2MfWoA9JEvdrxNqATV4XvGG2d9723/aOBGeytHXCUZOAsFkqbBvdxomNmib+pexhuIofsRhRbg8lm3ifQ6Qb0Rjj+ernCMgXPDRweiYusPNzz+PLpKkXHKfG6Br6tnrrKD2RM7Eq8a1a0KTd1bxOAd94AeXHqj1j8EWHMw9Gra4h+09kmVwl/Lr7r0qy4v8rzCL8QBQcorBZaMdFlgCpRkwrjFpfmMdvXztNjsw73rkFeypsQ1NV3ElxkcPiN8Gl2hFo134JByEZwui6FLtDb8vB8Kf1NtaBnI/2hhxZ6Xi2xw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0a0b098-3df9-413e-04c7-08de89a540c1
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 12:59:58.5787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EybwROSgczyZX7ReTdW0Gs7ElWTs064dARL5Ea1eYKK6qGENMloBlvQleT+CjKwScLas2FbumotuJif67gJYxZkaxIBxbvsc3EQIVOWbwm8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6128
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwMyBTYWx0ZWRfX33NoRM42kuuU
 EI+0LRE3wTc0UyWQE7p8V1WLGpKpjNlg6NI5dRRcpyvoWmqhlhkISELkrpbo5Op6fd+2v3L+gYn
 XhIxcqtURPsuZJ/iooy/anBoTsj2rKRmn/RoqPdxuzKyAFxyqwXAl+lt1bxndeh/dhrCWtwUFYx
 LwEGJsznkBlKrW6l0G8NRvfVN296SzRfUjvmkAFdLErMiUlwe6J2Uh7LCr7Ufhp4543wDZ4vjgq
 jQeJ8CYvYtXdd+byS/oTl6nP63bcmXOr9Wz8F8T406fyhrOGUEcIdQ8AfHBl5HaQeI/679fZQU5
 0QKk+HoEDY9WtSb5YTQ4BTvAy104e6Xl09oeOQz1CKVBBhNT295PJsE+Yuy43amH5CtFeHTXa8p
 AtFQqS2SFe6uEKrBkaCVCu7mcxz2LwctCniYWC65gKpJyvDXfNiB8xbwPGXbLM0e10EdM2/C+r/
 Xn1pAsQAUznd7Kna9HA==
X-Proofpoint-ORIG-GUID: uqNX9O_4lxm12_kykf6s3vBvAfjGTx8i
X-Authority-Analysis: v=2.4 cv=Scr6t/Ru c=1 sm=1 tr=0 ts=69c28ad2 cx=c_pps
 a=PAMLMQMbhvWzs0jC4PJDBg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=0qAXH5u53RZfBey-n6YA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: uqNX9O_4lxm12_kykf6s3vBvAfjGTx8i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240103
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 13:00:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125571

From: Zhang Peng <peng.zhang1.cn@windriver.com>

xfce4-panel 4.21.x added include guards to libxfce4panel sub-headers,
requiring consumers to include <libxfce4panel/libxfce4panel.h> instead
of individual headers like <libxfce4panel/xfce-panel-plugin.h>.

Since there is no new upstream release with this fix, add
-DLIBXFCE4PANEL_COMPILATION to CFLAGS as a workaround to bypass the
include guard check.

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../datetime/xfce4-datetime-plugin_0.8.3.bb                     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.8.3.bb b/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.8.3.bb
index f025edd4c5..b5837f9e51 100644
--- a/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.8.3.bb
+++ b/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.8.3.bb
@@ -5,4 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 inherit xfce-panel-plugin
 
+CFLAGS += "-DLIBXFCE4PANEL_COMPILATION"
+
 SRC_URI[sha256sum] = "6b2eeb79fb586868737426cbd2a4cd43c7f8c58507d8a2f578e0150187cc00b0"
-- 
2.34.1


