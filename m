Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4481.1793994736510778926
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Nov 2026 11:52:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ObOVph9w;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=577071825f=saisireesha.t@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6HruGB2674281
	for <openembedded-devel@lists.openembedded.org>; Fri, 6 Nov 2026 11:52:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=QLJGZ90t2
	qSe03cTjs41h2D8ZO73V9yR79ujtl7/V1M=; b=ObOVph9w38TxvOjLnxDgDPI16
	LAxBEhV1pfgLgScgvuIb/rYy4WHBozLQsFleY4Fmr42ms1s09gmNUuV14B+VsWxA
	cRnDqXiynO8HD170nYmRzkNkg/j5ccNc8PkYcjxPrUDkll6Y5REdF3eJUhZ+XOcL
	wGL6IsJWOB+rhLkAX0aMbBTPPej3hf4c2gz6HpfsdJeUUFJEONcYScxpfoDV13vF
	zSvZ8P4ZMGbc/WF9Bd/nG/sG02Qgp9w+zl6eHkXoxuDO6DdfMvqnG11yqd+ys8Ez
	zpI43zZvMVY5HSN++yCDxWMMt36qsL8J6gv+8yLnDZvB34yKJyHsz+qKpjUdg==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020073.outbound.protection.outlook.com [52.101.61.73])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hs3prhmyc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 06 Nov 2026 11:52:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SDpzqfWbRXdHEEj5BGOmhjxOUsLeHY4AGhEp2JjPm+hUA6bpk6cH5V28X44B/Bjd49C6ogg104EUNbxPxtW0FwYbnhljct3CDrWJSwZOkZUsE0aK0csy+wOIyqZyb4uZxHWFSwtylIQq2ji9QH/8VZtZ5+V6574ANcBKr1o/kKgXMyeF9jvZ0tbQFUO8bAHgEz/M5mUJ9+aegM4xMHJeyAT3sWpqHd6FSQN/3VRTDF/nU+IPDviyVwFIADu/Jq+c3jRNn7JtlczCLPPjFDW55noKO/tk9NoPnR1M0MiskqVcJMkF/OQy8jZAf6oBhgyKzejlNYWzPvSl3MiebrXfOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QLJGZ90t2qSe03cTjs41h2D8ZO73V9yR79ujtl7/V1M=;
 b=uXp1asdm+WyqKvwW9u/u/71Rge9iVRjwtWejBOjmmPs/SJNpSL2PrcoZoEQ+yz1wBA8jWdBqzrHkgdNHZZGjHlcVCGZ5d/Uqu/RiKR7OquhUo2j0RyWbppmCO0nDHQq1wKDgih6eFOPSpuL8C/77RM5qHAcbzG/V9e75JgCTHNmrjqkpBnro2MB56cMnBOOlop5fb4PjxPow/6uyCJ41ugkv1DgFQlJLE8ORMFlOgbA9x6GAAGNykunfsVO/GeNdPAsfjXglJi+1su65OM2i4xAGFZ1wY5UhiYdlsxg/MpgcKm5jQVE2GpMPNk0JZyfJuw+fMM9PFqR7ak+tiXN22Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from SA7PR11MB9594.namprd11.prod.outlook.com (2603:10b6:806:4cf::24)
 by MN2PR11MB4696.namprd11.prod.outlook.com (2603:10b6:208:26d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 19:51:36 +0000
Received: from SA7PR11MB9594.namprd11.prod.outlook.com
 ([fe80::8471:23b1:c4ab:7102]) by SA7PR11MB9594.namprd11.prod.outlook.com
 ([fe80::8471:23b1:c4ab:7102%3]) with mapi id 15.21.0592.007; Fri, 6 Nov 2026
 19:51:36 +0000
From: SaiSireesha T <saisireesha.t@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, sumanth.gavini@windriver.com
Subject: [meta-oe][wrynose][PATCH] libsoup-2.4: fix CVE-2026-0719
Date: Fri,  6 Nov 2026 13:51:25 -0600
Message-ID: <20261106195125.102739-1-saisireesha.t@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8P220CA0026.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:348::12) To SA7PR11MB9594.namprd11.prod.outlook.com
 (2603:10b6:806:4cf::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA7PR11MB9594:EE_|MN2PR11MB4696:EE_
X-MS-Office365-Filtering-Correlation-Id: fcd24163-d6d6-42ae-6665-08df3c3f5e09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|1800799024|23010399003|10070799003|366016|260925021311599003|260925021911599003|260925022911599003|11063799006|56012099006|261021121427099003|261021123027099003|261022105027099003|261009223027099003|261022075727099003|261028144727099003|261102123227099003|261026140227099003|10067099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: F3pSCoELZQ76j6NG2ffpvhX3uGi82ZwsupAECCyg6mABUe1kPvTOF+vogTYWgu0ahzN2qscGtEEIiOqE6KV86GufbYXdxadH6JLdSRwyT4t49Zzf+NfU5z+m4FfhRhi/YiXgbwMNSLvCMWylq443hdE60VLTfi0dpJMSq5ijgSvE4SdRFcw76aOKag1t2XgTarEIexPYK3XINlTInBswZl0tWv93Nfm9oQW7FC4c9QvOAZTTGHQXYX0bLO0Gsw6KCvpeSzr7eh9rERBmCbuyg+P/5XOMibxZ8Li5s77usaCkN+laENkTt0B3HWCNsjq29e9uQxqZts8tA9VTW0/d+/0D32mr6IrSAlXlCqY1gayZ3IUkb+ghxwD2dgRclhEmtb72A45tgehsoZpCHFPzYZXYUbIWRUohO3aRHYKy2QNM06Ff+D3we7z5y+voCXFLyoDs0S+0l5JsanFALAxB4Ig62PLqMBo1bmqWe4tNowk0iiHKKR5nA9Gqf1l3xux4EGIzfkent2w11nY+tXU8vC44kJd42WowSELZcc/3LE5uf9OlOLHAFU3c8XOMscwvGXmTcg9xjYv3lDSQ9942sdipMXX+yK1gwrzk4AL+n6GyiEqPxySJlCCO6GNxtKD9
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA7PR11MB9594.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(23010399003)(10070799003)(366016)(260925021311599003)(260925021911599003)(260925022911599003)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261022105027099003)(261009223027099003)(261022075727099003)(261028144727099003)(261102123227099003)(261026140227099003)(10067099003)(18002099003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LIMPXZlTHri/5bLUVfy5DNy5N5wom281EscRU312tvBVgf5+4qSlY4BtqpXS?=
 =?us-ascii?Q?P7bxwDfBwwPCNF8xkbizgqdygwHTXSB24QNf5hDq5P94Q/LtjEWzcaW7OjhH?=
 =?us-ascii?Q?xp27Kw4uwgE3Jspz5i7eFN6ehHU+3ZOLbhmeLswSTag6ZUMGGgDqUTBO1KLp?=
 =?us-ascii?Q?Q23qNF8Uyxl2Eem38BlfK3OPAdrDjkdlCmnY4+8rREN/bdSqsYKgVGz0hNCP?=
 =?us-ascii?Q?nkmqOa/fGa5E7uPW0th960XaC4SEBXWUIqeKOfwPrLNUzlkqL288hcisM0pL?=
 =?us-ascii?Q?0PaPTys42wZCYGwXNgZ7c6T8l1dCiybt+AyGq2eJogp5wxX6zXjCyt7Ic6Y0?=
 =?us-ascii?Q?us/vgW6Tvs93n/w9JodkUAm1wJLlkJRRn8JOr/dNqUqpwouqfVHaOb40ofbE?=
 =?us-ascii?Q?BSSkr7PeElgyuvJw9wUpF9ECWw9TAfJ0cPnvH2BcJl+pxxzk+I6hMei/zHlQ?=
 =?us-ascii?Q?LYPZieiSkq2oeT8Lc+4YPemgr/pHBZXMnt1zkwQ0o8G515iFITjTNbchxWc+?=
 =?us-ascii?Q?fAezD4wTV/D0sDJ+HPmYROaub7Ypz+8CDjqoJKrvkzHavxMbMzcFBI8bLYT3?=
 =?us-ascii?Q?CumlISXHN0sQVsu8trKfX75sfOzlYRZGZueP1Tg3xN9bggwkE2AE2UWIEB1b?=
 =?us-ascii?Q?IzszhFnSJVlfmOhEOxvvPBIkM0JsDGYTk5+fWASu3eIKuuzYl03ru8Qqel+d?=
 =?us-ascii?Q?PH9ySis5MzJCrKRvUD91iEgt1Nqt9xWfUhh7as6iU3COzSnhRUz3wL+ibnhx?=
 =?us-ascii?Q?AvmGpefF/zQOFrRlXBg4/Dy/lC4zzJ3Sz9SXnYdieqhEr4ZLNdIrKvf6ToZO?=
 =?us-ascii?Q?QypvTRqAW2/FPI4Xa2orVpKizM8kYkAdzA/PWXjFZ5LWl2U8ESdUfc5pFhtK?=
 =?us-ascii?Q?OdiTDhdZwe7cMIMR9G3Y/+VNsdZvAHysaJOQIKw1FHQdDqLFxOwUsBCc2JO2?=
 =?us-ascii?Q?xZGsurZcQutavJgqEmekWrBbsDmCQXlGfn7uYDKpQ87FU/pglbRaZyVSiBuL?=
 =?us-ascii?Q?2oUERZ4H3REosxqFtr5iqRzJ1hTgtdTn+IksiTSucMwCdbCyVsHunMHOSbD6?=
 =?us-ascii?Q?6x/qP4Q4xqI7FGvOzWTL3ePa84d0PXmK48AQsbOYNDfX7zxvVazvDZWkKS2S?=
 =?us-ascii?Q?vpaXKDfWbAMt0FZqFg4QMnald3RiCaMd0W8SfZQvBpsulA1+toey0xWalo5n?=
 =?us-ascii?Q?MWIgfPWVf/eDqQ0edlXD7ENptWANLe3sTpGaz+qd5o9ioapUTWY6MbgS9Cq1?=
 =?us-ascii?Q?3GMZ7OJDhJrWqclaDnHAREZu01/fo1GiUbUcuu20tkpb22WtI7vZXq+0d7ku?=
 =?us-ascii?Q?aVvhixLuuoQd/HKW5jfBVo/usdmRyDVmyqxF416/EWdMUabq7vngK3m8SALM?=
 =?us-ascii?Q?RIGGzXqwq1w240YKMMlZl8xKTAEcSlBz+w1p0S8Aef2YSgdNDiGTrNE0zziB?=
 =?us-ascii?Q?pHgblici6xyIWDgHTx7X+2JKoIueOcxZr2YlJAsuA4XPXEfT++HpG6/9aOeC?=
 =?us-ascii?Q?LMml/n2oxAiDeY90vk/7Judfw4qap8ULa45yGdh8s79nWvnzPbR3e64Gv3c6?=
 =?us-ascii?Q?BED9hSMKVRRJhGt6zlEgQSH/7o9gFJNnlcmzPgqv1fpUDV/fpFUiSKySx0KW?=
 =?us-ascii?Q?DBJr1DsSRqnEfGKyLSODOK0RYJvbDwy6NGMJPnjNA3/rDTY2aXa0Gbp3C4Jc?=
 =?us-ascii?Q?s3G+oarm1N+t165LnvCFceskBk9/9IRbVbaNER4C119rqI9tHgIvatiGBBG/?=
 =?us-ascii?Q?7NGoEL/44JwAkNRIHtXV7NAV4iEqYC1jnI7gLabDarJiJk9rXy0NjqCOMGs6?=
X-MS-Exchange-AntiSpam-MessageData-1: g3lP3yDx/9phR9o66dZ0T1i1ffAAk70P8oo=
X-Exchange-RoutingPolicyChecked: rwHgB9+8QtjycSVGylNuP4cZgtSWpJemhE7WSz7omAF0tpBE98ft+WFetI+XaVQlYu/f58W5gH9E0YK+g0CTEc4rcNzJCdTzYD2b/YCOwCp8qVwmNyICAyupQyi/69PC9Bl3t7t5AX7vrmwHOUiOhnjudgqPBAdUrL8jxpO16SZ/rfLq+fLubJ0yBlk90er/yPuyVoiONef6yqRNi//MAlDCXeyheLAo6SUC6yB0aCGRr5koX9rX0XRyzDzg3lBGx44OIgPGhu0SAS5qdKeYxhUgtVLKKayl3f5jQG+wX9/ctK9wAKZ507ubS3GBieAHemtLpIeSAQDadXGH0IYlTw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcd24163-d6d6-42ae-6665-08df3c3f5e09
X-MS-Exchange-CrossTenant-AuthSource: SA7PR11MB9594.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 19:51:36.8793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gvedwUDsXki8akEtP2znF3wFWvDmuD1KrLCsAb+t5SmMnqtfbBINB+wmK6KLqV+f4qR/3IxJnQCCNYRdmB/0cWZJTsrtNzFlBvFIpzxrklc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4696
X-Proofpoint-ORIG-GUID: El6i31DqPk6TsAKmBUCK2Pju1NmcEVvm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA3OSBTYWx0ZWRfX4fl/w9LoTrv0
 PNjRKnXRf3cojzMXnFEP88Xiym+W0xEdtEQtXcJtdXPIVj+x2LVsJRlX00PXsfl8aHt1cy4/mrc
 lJkBNccG9imY8OceRGvkFqTmp1/WMh4eiy6cBXvZ3UbpDZKpDo8p
X-Proofpoint-GUID: El6i31DqPk6TsAKmBUCK2Pju1NmcEVvm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA3OSBTYWx0ZWRfX/gyFLKg1AzRM
 FOcOeNbkPOQsMYDVyJrTTO2Pc1MYquUBWzwW5w/zZJQbAC/TiUG0AHt523pTi6erXYlcajWGs6J
 FBF6NCA4Li1y+0PtiHwX1Vn3Kc2DNmujdNHzwbsFF3KiS2mkR7+2CHX4bv/3fFkO8ly6tYzRl2y
 HJotaulmzx7X6tg5RMR2/GTkSLi5DcBTl5Ezngys0HExxiud17w/qeKZeil94FKv7N57O15yJrY
 kHNIan04orJB4zYmvquqKW9sUcGZAhkDdl+HigprSv+nxibywAWrW/eK4HHWrArmJHtCRWjs+gR
 AGbyX2BSRePWKVrn08I5uXhjOsSuPyPvDZX6jUm3r/ITAae1AeZiaIp1oIGGcGg1rczEfI/7+r1
 DfPhdEZbJtXj8ihvk3fBvCbzlyWtO3BdCqzluwQPpKPFAsfXI9bTrn7Wq6YNuGrHD/v5jeQrh97
 0ZJf53nekwmvEH+qChA==
X-Authority-Analysis: v=2.4 cv=T/kZ3PKQ c=1 sm=1 tr=0 ts=6aee2fef cx=c_pps
 a=Tzn6lXVVKCRcblYJXTGjtw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=tPKL13dFswZmBVcNKmoA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1011 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060079
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 06 Nov 2026 19:52:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131973
Content-Type: text/plain; charset="utf-8"

Stack-based buffer overflow in the NTLM authentication module when
handling excessively long passwords.

Backport from [1].
[1] https://github.com/GNOME/libsoup/commit/1972635264f1d9ab1823c8b6becf921b4125b513

Signed-off-by: SaiSireesha T <saisireesha.t@windriver.com>
---
 .../libsoup/libsoup-2.4/CVE-2026-0719.patch   | 57 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-0719.patch

diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-0719.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-0719.patch
new file mode 100644
index 0000000000..48f45c176b
--- /dev/null
+++ b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-0719.patch
@@ -0,0 +1,57 @@
+From 77a41e98300bdfeb5eb66742f6e790aa1e906de9 Mon Sep 17 00:00:00 2001
+From: SaiSireesha T <saisireesha.t@windriver.com>
+Date: Fri, 6 Nov 2026 16:23:05 +0000
+Subject: [PATCH] soup-auth-ntlm: Reject excessively long passwords
+
+CVE: CVE-2026-0719
+
+Upstream-Status: Backport [https://github.com/GNOME/libsoup/commit/1972635264f1d9ab1823c8b6becf921b4125b513]
+
+Signed-off-by: SaiSireesha T <saisireesha.t@windriver.com>
+---
+ libsoup/soup-auth-ntlm.c | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/libsoup/soup-auth-ntlm.c b/libsoup/soup-auth-ntlm.c
+index 2d078461..214ffcf7 100644
+--- a/libsoup/soup-auth-ntlm.c
++++ b/libsoup/soup-auth-ntlm.c
+@@ -594,7 +594,7 @@ soup_auth_ntlm_class_init (SoupAuthNTLMClass *auth_ntlm_class)
+ }
+ 
+ static void md4sum                (const unsigned char *in, 
+-				   int                  nbytes, 
++				   size_t               nbytes, 
+ 				   unsigned char        digest[16]);
+ 
+ typedef guint32 DES_KS[16][2]; /* Single-key DES key schedule */
+@@ -640,6 +640,11 @@ soup_ntlm_nt_hash (const char *password, guchar hash[21])
+ {
+ 	unsigned char *buf, *p;
+ 
++	if (strlen (password) >= 256) {
++		memset (hash, 0, 21);
++		return;
++	}
++
+ 	p = buf = g_malloc (strlen (password) * 2);
+ 
+ 	while (*password) {
+@@ -1079,11 +1084,12 @@ calc_response (const guchar *key, const guchar *plaintext, guchar *results)
+ #define ROT(val, n) ( ((val) << (n)) | ((val) >> (32 - (n))) )
+ 
+ static void
+-md4sum (const unsigned char *in, int nbytes, unsigned char digest[16])
++md4sum (const unsigned char *in, size_t nbytes, unsigned char digest[16])
+ {
+ 	unsigned char *M;
+ 	guint32 A, B, C, D, AA, BB, CC, DD, X[16];
+-	int pbytes, nbits = nbytes * 8, i, j;
++	size_t pbytes, nbits = nbytes * 8;
++	int i, j;
+ 
+ 	/* There is *always* padding of at least one bit. */
+ 	pbytes = ((119 - (nbytes % 64)) % 64) + 1;
+-- 
+2.54.0
+
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index e588e60cd5..13261d8418 100644
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -50,6 +50,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2026-2369.patch \
            file://CVE-2026-1760.patch \
            file://CVE-2026-1467.patch \
+           file://CVE-2026-0719.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.43.0

