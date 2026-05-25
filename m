Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64827CD5BBF
	for <webhook@archiver.kernel.org>; Mon, 25 May 2026 07:42:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11303.1779694947712451242
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 May 2026 00:42:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=EmInVLN3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9605e0153c=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P6P4MX1717810
	for <openembedded-devel@lists.openembedded.org>; Mon, 25 May 2026 00:42:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=3B75LiLzeB7EzL5MDQzL
	xJSCjUcgJpnsU4eIhpirs9s=; b=EmInVLN3lXd12ZaxV3HEovcQM3zh+m2gOIHN
	91NWrXzLzV5Fjz+7sc4mmE7qEAqMzCSWm72WlmXaS2gMP0du842dIUB6xprH/Dsc
	nYrqWL88oJO/PHY9gip3i3JIBT9HjGV5MOjQfOaF2iTTgrAzIkoHG5p95EhGTDhV
	/RbzDqfzeTDa2kOxcAnXg/QXkJ3/hsDmarlspUbjEwwDyq0ZHzSHlQ7y5Xq9Kp+T
	LpG887ytnlW2u3OU+rs3VK6IwzstkmwQaN/hNMZplyz1iVHsaRVurCR7gIlU2uM+
	yQSEcqr7MylM27y5hr5Pqrib7YWMqCoXmb4O1x5uux+Jr7wGzA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011013.outbound.protection.outlook.com [52.101.57.13])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ebbrehyj2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 25 May 2026 00:42:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=frm5iWtT3SzNVfSVgBEKCtPamFojpb+KiqQBdlCNUDdmNNinRlrApbkf5xPqMrR36OUDFq/VUH22S3Cb5On9hlnqDYCjzA7fvMMvS03bEcL5jBnCnpjP184VBSpZxH6NCfybZn+tbbXbul6T6KZ2huVPq4898GkwsWZwsF+XjcTU7++nXSY1Q3W5Ng+lUZcdsilYXj2Awyby6LQssA8iHZc/slcCM3noppb0y7sZlzi8VMYDGFKptMjqObhQDYisQkez2J8LRhuwFzUt9aF7YEEfhOLX9KUYJu4MVcfZF5OEjidfe3PObj28Fgs1/+wxFBfp84e2MSAT+hLiEcNpMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3B75LiLzeB7EzL5MDQzLxJSCjUcgJpnsU4eIhpirs9s=;
 b=kasVQhofnx7Sldpz/+I2v4vuvK4KC7F3f0NEmZ/HUPvWfZm3+QTJiyciDsFuHMlHol6TwEkWOCNC/hM0Xi3PXdH9pCYKrJD+KYye3SNRyIP7SnHxwx8Badzfga28tcSyUJokHuB/Jg2NOpw2E+eheRret1BrD43o/Wt3GEcwMe5P6fpZhifcsIhvrV8nvZ8EZLRJSt9VmfJz0bDkBRbYzgUQXMoLT0AFcisNQP8ld/noJsvZbNdVBaBtB4WtIrjUmBvsAmatDXVx1cRuy0x17ozuu2bqBvvPnAOL4qgRlgBMm1f6ITFkmaj3BaSpatx3d+LsoqKkQ8FhAlipFCtaMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21)
 by SJ1PR11MB6251.namprd11.prod.outlook.com (2603:10b6:a03:458::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 07:42:23 +0000
Received: from CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::89ea:ecfa:c345:3fc6]) by CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::89ea:ecfa:c345:3fc6%4]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 07:42:23 +0000
From: guocai.he.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH 1/1] postgresql: fix CVE-2026-6479
Date: Mon, 25 May 2026 15:42:06 +0800
Message-Id: <20260525074206.2008168-1-guocai.he.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0001.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b4::16) To CO6PR11MB5586.namprd11.prod.outlook.com
 (2603:10b6:5:35d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5586:EE_|SJ1PR11MB6251:EE_
X-MS-Office365-Filtering-Correlation-Id: c376248d-351b-4e6d-44f5-08deba31282f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|18002099003|56012099003|38350700014|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	w09/iILDxxe1Z+hV1k5ZFbZtrJ6zk0zuIkTaPdkVI0QcZmyPv0Md3o2LeO3nWP91eg8B1bvDGi5BWCAzi9v/1UTJ2s+3QGtULClZuYdqR+wQe3/oKt8mnN5+Rix1jGaNN0PHLv0x4UVLjBKyr3TLHcUHKPeRuOzTBZOJ5b+5K59av+ptRJ+KOPSST0dACFFt7ziyI/Ddx3MsSgjhuYINxJSnihebw3ny3rl1RHRfXJwVXc2Lt1bhARaLbcAaSC6sJ8Q+EofIYs1RHFruMXeZnvTimukf6YUiTGWidwklqFPHL0xcV1yvTZd8GKN8WTGCJqyqvEqkPQgYgp0bTT1xwZAPaoh4m1ZE7tBXk+zYvxcyFuyy2Z1++Uxqx3N5mprOdp7ay2bdPCk9GdIil1Lbv+W2cCbBRByJhJO6OuVOcZSdXcH2YsUU6s4zbrZ1xPYREiHK0Ld50IiFaLwATakR+C4lQsVfX5Bcwr9vVwlOiDZBF/jP5dsRtpRc9xLP4deBOpyLrIMcIs85UNoPGBn6JxK1ImZxYRGOBARb1mxCv7Md5ChdAy9Dihz16Bw3G5bofne5CcprpqO7/bgJGVK9C5wHcSMMc7ast98chZtTCc9XaZ2T37nmikHpM3CDuKVr1a4GwN2u/H3iir9+WF1uAqUrCMsYYOCATmK9DfaOGygcAzpRRnCQC4p+VJlYmPVa3vvq5ekhWyxoypz1x6UKrnFhZ6QNtLZ7qLT7F/1kJRl+AxPdaX7cB4j6uzQbOFnT
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(18002099003)(56012099003)(38350700014)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Eggg3kPhgAC4wYcZWRK/OxwBkyB/2l3nNAssy7VVb9QBCpFBEHKfE5cnaP3t?=
 =?us-ascii?Q?MusnDmVWplSvXCOE050sxdkErczMtVJqq9/M5uvSveCRRpYma4Drfawr17lp?=
 =?us-ascii?Q?nhFcoC9kZujjr++It1bPX9pJaY0wQfNXc/gSFzRUl8VMpvICcKFSPXQspi9C?=
 =?us-ascii?Q?vvO1SUKOma2BM6c2VFp/jtIaU756YSL8zxigoPV3zrg5vt3LbQbP9TpJQpUc?=
 =?us-ascii?Q?wbvws/nQZD1OWGrDaqcqPBeoBy2agZO08zfqoEfJ390zJItusIWqRcMmXT0i?=
 =?us-ascii?Q?2Tr9u2n7sbUiYRtkvYTNAW38X98363UcuvtntRJARNar5zfixY8Q5T8QVfOF?=
 =?us-ascii?Q?vHR/pELyxCK6G30iuRjvPH4VGr72v71AvVoQy+X9Qzs0G8dytb6K8Qxza9yv?=
 =?us-ascii?Q?u4qMgFBSJrB4o+AWqtWRl56hZWEU3KSSp97BZry0/EatetbSnyZ2AEMyKvff?=
 =?us-ascii?Q?zhXrk9Ns5X7Qk5ChXfGBoi489zCgu9nvvgCBnaYeiTUy1/IFpzIa8rEK5CKO?=
 =?us-ascii?Q?Pb5NQJEAfrktBHol+zaimAHPz+pzG2nDySVUnPDeO+iIQFDeDpM/AY5e5Uk0?=
 =?us-ascii?Q?UxCTjxthV15NV0083AlZN4cHBKt/4ugS3N8KkkhnxowsWANeUG3I/PtHAa2Q?=
 =?us-ascii?Q?ENzq0/p6fPopbDJCjZd4rDoS++aoeJG0el9VvP8ebvCu9aUPegmwnQ174jUr?=
 =?us-ascii?Q?6XCJSxjRRgc0prm5qY4pvSjRDVfltz+iyjvhTvpfDm3KPnNULxXE8szwTuxh?=
 =?us-ascii?Q?5lwK5/J/pSvCo4KtBDOCZ3yDeRX0NcrT6oysYz5nRAtt0gL8iOfmm0yjexGA?=
 =?us-ascii?Q?bLwwSZFFDhk4kXqVggEp6ua3uY5kNeTrmWsSZysZFOJYYnUn09jtrkRTZnst?=
 =?us-ascii?Q?1jzSjLNANo6faV2EpUNNfuFkNmj2gT2N4MBfeCWIJsg/CcuS/Ag+3FZpAxjB?=
 =?us-ascii?Q?DmRsaZoOC/IUR9tQH6lloWsRoGPxvEQf7UJDmr8a/NkkSemymffAbfnTuZiv?=
 =?us-ascii?Q?OrRR2AWCLtQ+dQalyy9vZ1s6atW2sZFeAS3EVIgI6Y6xcDkN9k6lInlymt9Y?=
 =?us-ascii?Q?Q5UaaDSuBjXz4sGcE38MrSlokKjhgLG4ejW7uwQPf/EFiFdN/DE9tAZ1iBeD?=
 =?us-ascii?Q?QL8eLDruiEvSE8zLNZoDgChNND5JycT1Opxz62fej3bSJi5F092fz3/JABrj?=
 =?us-ascii?Q?F2n+Zr34SdhaoYqZzlTcO1GO04EH2W+o3plnXjy6hX6NdNJbDoMklVLzeP3e?=
 =?us-ascii?Q?CL5wTd36waJ3hXp3C8pEIIOE09vi2NBm+Vdqog93x2qKGH+7BDeEqITpIQc1?=
 =?us-ascii?Q?1PGLhTKp5cte+BhBazU7DgC5FcunE4zB8UWiffLJglIRvhok/0BOb46q9fq5?=
 =?us-ascii?Q?UZ8dcNfXLlNv6rQD6BbkcTE3buzPJbIKWHrlGg+pPCwK5T4jK2Es+G2RTa0Q?=
 =?us-ascii?Q?5ukQMLaD69OQoQuN+6xjNy4ba5H14wK0dNmNYRiY6R06VP0Gs2nMFs+Ihrsa?=
 =?us-ascii?Q?UGjbX+Su2YaKe5YRwFaqIBtfSTtV0U/uwEURv9nLashJlIMgFT/3A5/LPSd/?=
 =?us-ascii?Q?sMtLKHEIKSwHg9S/zWdvsVTZZT8HmS7IsXAkzOqwgZYqZ6DpsFYSKFZrFMWC?=
 =?us-ascii?Q?22q+8VppYZk6pmASkB35gmUIqF89t8uDmND52WdThkntlwhXO8HyvQCC1y/L?=
 =?us-ascii?Q?2lYddGVQUW2uxM3XSiHfcX6aoCEq1mfy5Hp/B283a1lCqICFQfj8h7lx6DoU?=
 =?us-ascii?Q?sg3GE8id8IktTWyfDyOOHsKyqeU6Jr8=3D?=
X-Exchange-RoutingPolicyChecked: 
	Mkp20eTX4qv7tYgC3HvXE7PZAwuAxoIwuLkgIIv4qCsam/2aX/yyuFqYdvqBv/DJiQ/OdP6mnTw+kDm8cMn0xrEj73diaDCZrlMvWZiVL0CoUOo2idWptmS5J4PG5SnlJZHCBokPfYouqz4QkgfT8I1amVJZGQcwEMcMau34zVvVFe2Y3DGQTcqKMDUGw/rX7X3+xmBwup2vhGgIOoNoDHOLGrc5KG8/JfXkG8F/CopCHx0ryXlfDrMGkgTT+CR21RoO8n8OfrFMX9X5IuzBlWNJK35ALxMC7db0vgfSMXzPwWtQ2413UH2/EwDnZTVSvHxCK+Gtk6ztqUXVWJhALg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c376248d-351b-4e6d-44f5-08deba31282f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 07:42:23.2687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: id1o67YkqcV073lP2uMJSxJo5bYyGBXMNVi2mH2cwptbmqxMvVNdTLetG4twtLe2BjBrsk2P+6asiVf/Pt20wUlB+YpDkxdJbloQwk8z91g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6251
X-Proofpoint-GUID: k_DTET2YTLpmFYcLeA1HaUURPPZVYRqq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA3NiBTYWx0ZWRfX5GQqt2yedB3q
 uDcZkCT3E29zo9tttdFcug7fo+Ndm+Rux1BlIzb5mgYPF6PDTrWViCEVTnVusL/hiGMIUoc5QET
 wmUzJYHbbVnnaFMeo8AAVymCgqeMkVr9ajKn2OXDmNrXcEzV8m4Cp1xOATtcObK6xOD3LInOFWN
 3r34tgTWnglIlCkaIqWeJVijnRrSxJ2o0hJNdRQo/UVEK86bxapPg0gSbJxI0wt1YekjzAoL6MA
 CbGj8k20IZONC0Ruysh/2QhEmAUpiDZskmE/h4LZcI63HCXNyaW0wnEqsG5mCzYwruyhwRxPRJn
 BrTafMrehlBvY1eBTHA6VWgfFQm7qkl0lHO8vYzw/19Y+1MTwKjeyQAJm8EOGg3N0S1UzAZsqi3
 DaYJN4X/zHIgMDVnr5RBiWIeuicGbtO6j1zKKPBhqM+ix7WvuRqeACvmll7PZBK6kePJmp7rEe4
 ZICSBaHMEriy/98oD2A==
X-Authority-Analysis: v=2.4 cv=IMUyzAvG c=1 sm=1 tr=0 ts=6a13fd63 cx=c_pps
 a=g4bHFsidlxN+L/prI/sWbA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=xNf9USuDAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=HvnWhiLzAAAA:8 a=ko7oljPNR-Lg79zsjF0A:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=YT91KPC6OSPBWssVLg7J:22
X-Proofpoint-ORIG-GUID: k_DTET2YTLpmFYcLeA1HaUURPPZVYRqq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250076
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 May 2026 07:42:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127197

From: Guocai He <guocai.he.cn@windriver.com>

CVE-2026-6479 was partially fixed by the 17.8 -> 17.10 version upgrade,
but an additional patch is needed to completely fix the issue.

Add missing include of IO::Socket::INET in Cluster.pm test module.
The postmaster test 004_negotiate.pl could fail due to IO::Socket::INET
gone missing, in environments that cannot use Unix sockets.

Reference:
https://security-tracker.debian.org/tracker/CVE-2026-6479
https://github.com/postgres/postgres/commit/eb5559b7df98581bd9a5142433122d1ba076d568

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
---
 ...01-Add-missing-include-in-Cluster.pm.patch | 38 +++++++++++++++++++
 .../postgresql/postgresql_17.10.bb            |  3 +-
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-dbs/postgresql/files/0001-Add-missing-include-in-Cluster.pm.patch

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-Add-missing-include-in-Cluster.pm.patch b/meta-oe/recipes-dbs/postgresql/files/0001-Add-missing-include-in-Cluster.pm.patch
new file mode 100644
index 0000000000..d4e6273e6d
--- /dev/null
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-Add-missing-include-in-Cluster.pm.patch
@@ -0,0 +1,38 @@
+From eb5559b7df98581bd9a5142433122d1ba076d568 Mon Sep 17 00:00:00 2001
+From: Michael Paquier <michael@paquier.xyz>
+Date: Tue, 12 May 2026 16:44:28 +0900
+Subject: [PATCH] Add missing include in Cluster.pm
+
+The postmaster test 004_negotiate.pl could fail due to IO::Socket::INET
+gone missing, in environments that cannot use Unix sockets.
+
+Oversight in the backport done in 6dffaeb8e54c, so like the other commit
+this is applied across the v14~17 range.  Per buildfarm member drongo.
+
+Security: CVE-2026-6479
+Backpatch-through: 14
+
+CVE: CVE-2026-6479
+
+Upstream-Status: Backport [https://github.com/postgres/postgres/commit/eb5559b7df]
+
+Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
+---
+ src/test/perl/PostgreSQL/Test/Cluster.pm | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/test/perl/PostgreSQL/Test/Cluster.pm b/src/test/perl/PostgreSQL/Test/Cluster.pm
+index a8635f4e6ad..4c2428a9247 100644
+--- a/src/test/perl/PostgreSQL/Test/Cluster.pm
++++ b/src/test/perl/PostgreSQL/Test/Cluster.pm
+@@ -104,6 +104,7 @@ use File::Path qw(rmtree mkpath);
+ use File::Spec;
+ use File::stat qw(stat);
+ use File::Temp ();
++use IO::Socket::INET;
+ use IPC::Run;
+ use PostgreSQL::Version;
+ use PostgreSQL::Test::RecursiveCopy;
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_17.10.bb b/meta-oe/recipes-dbs/postgresql/postgresql_17.10.bb
index 98b8d4891a..7afd8b4dbf 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_17.10.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_17.10.bb
@@ -10,7 +10,8 @@ SRC_URI += "\
    file://0004-config_info.c-not-expose-build-info.patch \
    file://0005-postgresql-fix-ptest-failure-of-sysviews.patch \
    file://0001-tcl.m4-Recognize-tclsh9.patch \
-"
+   file://0001-Add-missing-include-in-Cluster.pm.patch \
+   "
 
 SRC_URI[sha256sum] = "078a03516dcdbdb705fecaf415ea3d13a956c589e46f09fed68a06fb00598c90"
 
-- 
2.34.1


