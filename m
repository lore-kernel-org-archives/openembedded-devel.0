Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15529CCFA13
	for <webhook@archiver.kernel.org>; Sun,  9 Nov 2025 13:41:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24940.1762695658939645356
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Nov 2025 05:40:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XdlVKP7/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3408a6cb6d=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A9DZ3Tm1402375
	for <openembedded-devel@lists.openembedded.org>; Sun, 9 Nov 2025 13:40:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=M/7PVEYyOkIMNQFSRi7Ic6OSXbEq3sXlyDW26E8H/S8=; b=XdlVKP7/0Wav
	H9PS2iWkYbh1zmm5t0rXTQc5ud6xP5lnhUP2uAXVqW+izKff28szLZMbugLtesgX
	jCNy79MC1dj0Xum+71MPMqVyAcTC/OukSeKzqH4h/av5dSKKHw6egQB/pLH9nkVN
	75dCqjYuRcZwOure0a54IvCnpYij6eELn3neAg3IKCjVv8kyWY5t3zx65AauUZj0
	mPIE60yu7tcIIdIm+2nqHsJ38iie4PDsYfLfpx8B+dPqU4Ms1ZlXuBYQvcfo9A3Y
	5fZlV/vNyY6o9+YYN90+Cj60KsOGH+zICGhtFgPv4xK3wUstliZRCThUyC/gWO7G
	fZJ9unQZWw==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012036.outbound.protection.outlook.com [52.101.48.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a9u2x12h9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 13:40:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dbAlprI9QHjzr0PpbGGxLrUIRm4AlOgarQf7EWw2ERWqNxe30Mph8b0nesj2Tz5OhUWVTP/H50/Ny81iZ9vOEzRmJjqEQV8St+jBs3Z1IVVbxCNW8E5l+JaraaIuXPkj+qysZMwZgIiSHaUikBJe7zZ7QcNfUHv7VYnQYgevCYE2AZRf6qFQe3hG8WfmtdCSQvyAVlFwcQ76Al6vCSiaGhBh430VNVfCbImZ27zmJicOH0xIfJlhRal9HW3Ee2ARTXAsFZI6JNwYUgnHFvuXhmpLJpcceSK5ZfniyK4lEz8ys0kG+0ZupDJlSSuXpM1eR6oIbRYN1PYto3PUg+CgHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M/7PVEYyOkIMNQFSRi7Ic6OSXbEq3sXlyDW26E8H/S8=;
 b=RUHU0VwwkGIYgZRjlAlLGZ3DJrV5iblyG8LL/SsJlGM3M5Uq7oz2k3k6WSZ+64N6wN8At0Mk2KfW3jabFe/dUnYt+KWPpEsUNgqTPBc4AtZfO67cdgGCrkq4GJfIDCaDFUnhFywWdqqvXXj2CEoALHP9gY5B99cMyoAibA1Lr5ZpZMutWz2tNkB9bloFrGjY1kiHpJE2o2lZ2LznkDr30LUGfvYMkp6jQNAJ3lP/LknjMNLE98OxyXCCrmW3iRgZrhOYRnmSZ1zo9iWN4VgdTQecXG01Yry/XBPJaQG5QEw091uhoPBW4zf218eHo3D3W4ne90284ABXz6qEaYOXwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 LV2PR11MB5999.namprd11.prod.outlook.com (2603:10b6:408:17d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.15; Sun, 9 Nov
 2025 13:40:54 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9298.015; Sun, 9 Nov 2025
 13:40:53 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 3/8] openipmi: inherit sourceforge-releases class
Date: Sun,  9 Nov 2025 21:40:30 +0800
Message-Id: <20251109134035.2741548-3-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251109134035.2741548-1-yi.zhao@windriver.com>
References: <20251109134035.2741548-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0173.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::29) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|LV2PR11MB5999:EE_
X-MS-Office365-Filtering-Correlation-Id: f4a1c713-86b9-4e21-4db3-08de1f959a5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?cyTe2Z5UBQYJb90tRtFtP7bVm3ijCzo3qSbJXKZL/vOR63eN0oX+JlbddV2z?=
 =?us-ascii?Q?g8UsFkE6+f8Y5T62rVv9qr4wm7sak0VmX6HieZJinbYlRYsKAVYCh2Jd1LqZ?=
 =?us-ascii?Q?8tYAPNLBSon8paKvhqfMfY8HfXbO4ltnZsI2owc2j7rrPyRQiDiB4WQBAUa8?=
 =?us-ascii?Q?B6fTSuM6/1Iu9+d73JRzCrTR5UD66eB9ldAdrK/pYfnB7olMdXd1q5vwxdkL?=
 =?us-ascii?Q?9PhKGbDYH8I/B6EPK9ahWS4LxCBA5TBvnX7Mc1HHb6yciOlGDGuq+x/l2NhZ?=
 =?us-ascii?Q?awSf+2t6irvW2xWkJ3hvb65akmKaFTHOMPubKiWPrnht9nmDbjhfvfwd9wmQ?=
 =?us-ascii?Q?qcrxXfXsWHKxa9xY32uCZl+2d416McYJ8FJX3jcEweKY7oczSDAHk/4a2/BT?=
 =?us-ascii?Q?/oZTIxwMEECo9yJETP6mcu+hb0VjKL+pgk8OQQOeFu5QcqK7xgp7tm4iWRhS?=
 =?us-ascii?Q?QWipBnLf6Q78zDV/HWmKT0M0gobkFmujS3hZ4FEFogUYCJtL87e6IVANViAo?=
 =?us-ascii?Q?8txe4GE90hAUQnx9+3MWX12T7PCH6sdeV3/nVrulZjHkb867tpQRCd350+Rg?=
 =?us-ascii?Q?MDktJOF4QBpDP6m753VVs2vBbITCH+43PEFg3/jT8V0sKmPXNvJEl6vnYoRS?=
 =?us-ascii?Q?/oIpVemiNtuPmZOTjNj8jyy0Bjr6YDDsHk7dX75/YKfvF0WgAupN+Is2riPY?=
 =?us-ascii?Q?rggDPt5CGl5oE1aRuFnFbLmd9yG+161tqWGNCwnYSkrjZiDOL3DP/8SwdZlG?=
 =?us-ascii?Q?eqgh+W5eCMGvDcJdRSEJpAV+/BVV5ZGnQdPtJ2KUq+UbEa9Xe1JyfsAhV6mk?=
 =?us-ascii?Q?0p0Ate0yxE+3d+bRtx4lX59rWadEkkqMuEHQJcsnU65szdbSyJn6HAj0iFWm?=
 =?us-ascii?Q?hzxDZOhOJhTLYj3CokWzSo9GS7ZHoPOrXeUyyN/Wexrg5sMjHYgU0rKeo5+C?=
 =?us-ascii?Q?rFwpF9fNKqAskQucalx7CzxGDobGTz45uYGHD4AY4PgE2MyaHFZ4k8CTJCPj?=
 =?us-ascii?Q?6U+9ChhtQSa0yLRDeENQ2g6Zkl/rJU7uFTrZdnPriLJ4sUhRpsVfuspgwcw2?=
 =?us-ascii?Q?EhsNchn8ZMyWfwRfNowlzTPfwDjJmqSuWCqOtTX42BiLNpf9/su2a69G9ov7?=
 =?us-ascii?Q?OlH5rgz8/G3uU3OMAqMWeIIMVqQEAwZO9EYUF1BPX92TcKGR2QbOjahRpEno?=
 =?us-ascii?Q?B3ukzRRbeAiVIGz3nJSRmk67tM+5H156q/FuDV0gZ/bYXEpHeKc11LKRJ9GH?=
 =?us-ascii?Q?9tU0CWecqy4agQudU2SJpoCGeo4KHKZUAdOrQxHAvK12p5dMGU26Gug/sZIP?=
 =?us-ascii?Q?Jutko2AJHyYr2ahV+p1bpEEP/gFY4hDdbVrWLZ/wmPNOYalfX2NZaH4h7sip?=
 =?us-ascii?Q?4lFIy1LN5DfPmHE9bxpk7AX5z2nBGeK9bmyzaSodcysdA5FkCe5M0TCuPuaD?=
 =?us-ascii?Q?fo8YGaNe9cqB0TZDN431HyTq98pkN2dzdU5v5jE15UmMKx4+goaB+YBDr90/?=
 =?us-ascii?Q?DMVBLVPgWViFLyrXIBagKLMc56sLQyJD2i/n?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vUsW+ih8nqORxT72jHRpHltwCkG10PwjIQgM+Vys+6hXTOyKmz16zLVl8PEp?=
 =?us-ascii?Q?+4D5loqQi1VO2fIn8MidRlamBjKl76OhSvvTzZbolh7tLiH4NIzXCkpcc0bS?=
 =?us-ascii?Q?iaGIgaTfTNsxx6sAY2rlO0mevKUuY8Yei9k17v/K566FxTXpzzKfzS1MFsTJ?=
 =?us-ascii?Q?eWpPshZEuJZv2P2jWv+n87vnIDFMtBA9m/6sv6hvnEf1NxtaqPko1wbtXKjY?=
 =?us-ascii?Q?SCJGa3fzFvO09fFs+0txT7AiYriXyLDkLAr8/nzXTvT9rO6+GTpMtVvzI4eQ?=
 =?us-ascii?Q?PP1fvgQF6Mh3cYVhuI3+jD8cbLY0pNzpTNX/PPp/QVYi2n6j7tcaZzu4IYIT?=
 =?us-ascii?Q?VUN0t/8GZKnwt9xw3LMN5eCsnqemgWqW7zw4lSm4GXBw1fyDiOf9/czAGZ1U?=
 =?us-ascii?Q?LU1uW8rNLWpQIiTpHe8P6SOpTZD7lZO8228VzAF5ZfbLTrvZ0nDqqsX/Pdo0?=
 =?us-ascii?Q?zmnYYgcJLFdqiMy4duWuBQaS7A++RXRQzHBinemVULV2MmE+vLJjW+Qxxm93?=
 =?us-ascii?Q?olZTjlrqsFf1elsdcFqzY19UH62HQsw/Ioyl+ZLTuox+uAaViwAyeanI+7zC?=
 =?us-ascii?Q?AieSBlk9dFe3OVERLhGx4TDvg2lCZ6ELPbkQIH4KzwUGk1wJh39tjOIq+VSE?=
 =?us-ascii?Q?YomGscsMv/Eu3lUxsGrWb1atxts0wl5lpzlN+9VWGL53vpAjmljKDgY4BuUh?=
 =?us-ascii?Q?ut3kNF3qhX7rxuyZjCxVosvBO7UY1bsgbDuU9nXMI1iM49hS803HpZ4PR5RE?=
 =?us-ascii?Q?p3RoJJAZ2O5G1Qvrk5P8TTgaP2PrqY6nZifyRxeIidOdLxK8L7pEVcXtWdOk?=
 =?us-ascii?Q?ROukbt9af/q063MH3Ob6SGG8IHTMBpUgbaAgQm9YsJx2SY236GVGyYq27bbk?=
 =?us-ascii?Q?AoqSUTJN4XPa7Zk/XOuH9duHbOrMnAPKxlb3OaNqouYSaNMlyjThmGvSkqg9?=
 =?us-ascii?Q?ncGJx4o3IQ9oUkQpP896WII1JjRqbkqDa5WiRghj4iWwtda0hfMP5L3h1714?=
 =?us-ascii?Q?qCIUzFXgChWjKKPVdnW1neT6oE6bmGmY7dYPO1cXmzAmrSJWypVxzGLtxKM4?=
 =?us-ascii?Q?dkRFWHnpDoQsWp+l8bz3WrO6EH5dck2udHZXIhaNdgEHs8vuMDieNe9tZAAd?=
 =?us-ascii?Q?UuSZQ7TfpRThwu35kcvdbKdR8PGpOsFGSawcUZhL/V2lvQZ3NZjhwsNLZF6P?=
 =?us-ascii?Q?XKHOeddFF1aHUKGX4XaoLDQIqDpgIP+mZzWjgMhUI5d06Q5uw6SWEvX7zwIv?=
 =?us-ascii?Q?e4VhgaDWdONDmGLqNNNU+icfTuDymDu2QwqG3TUAwcCSWnRkYFy2o3FtTjts?=
 =?us-ascii?Q?Ch4tVYIUJ/EtTQiXPg0ILxK6J36LPxc2ZHj6WEWTTmEpBFIdfRZHfn4c6BTs?=
 =?us-ascii?Q?+pNo64Wj9KocuwH6RVbJVtsjtw6p817RMgsqsC4+1YINnVfzNgHCKLPpob5E?=
 =?us-ascii?Q?VsVm24ErPHxlKJu49zMwg88WUK88ndSuyv50j40GkHvo6+LXJ5dhRYxN1nFi?=
 =?us-ascii?Q?e5HJo4J7DMj6nek8WTJ6l3suNzYXkI3IQtT/7LKxLNlQaFH2+w2ANF7ACySy?=
 =?us-ascii?Q?wTVXq9jkSNnJ5Uth/AnlRznHVdhfyqjxHAS1ueCx?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4a1c713-86b9-4e21-4db3-08de1f959a5b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2025 13:40:53.6480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HB+o2p1oTwsdeViW34tUw92SE546kGzfs/ghMDzF1VW+x9QHBxsUnaucFcpo86lWqWN/56dVxzUztHSbhHgHVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5999
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA5MDEyMSBTYWx0ZWRfX00o6VC9cCT9a
 GoraJdjahNZCcKPwxueK1z0y/1f4iTw7WWLG+16ut7is8RVQZI46T8Mm4ojvm8ObKYJmSYcp5SC
 sRi22h61eB3OCAIoCPAYZ9FmJotAygOkNITZNt1zjjTL2FBvL+NmTCFtvuwPlOJD3ctynVf05zz
 hFQbl0g0Wm/Wc6eNyYHU7kWd9Bq3i6XhHCOr8uD+MKy/Y0C3xRGHZS484vA85X/g7BFI3ilJcZX
 Dxcvi/28L6HrXmcG2dUGIeXJKX1A7A4enmQ3CphgQm0FdfZ/1smLQ+xZdlX0xe6js/MdnB7U9Ao
 9x1eZSVxSfz9jP1q4X0ji993loHvu5KQHh3SOxj/CIt6Q9cTScIsVvyXC+huBoNTlP85mRXp1KE
 yNeKrV4e7gb/n1ZDMvDTQsae7Ha3Mw==
X-Proofpoint-GUID: RPv2p2HWb8DhUoWjF37KKjeHL6GpY_rS
X-Authority-Analysis: v=2.4 cv=Uvpu9uwB c=1 sm=1 tr=0 ts=691099ea cx=c_pps
 a=FLJGh2IUmjoo+n/grE3sag==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=-NHEl25y0MUwK33j7aYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: RPv2p2HWb8DhUoWjF37KKjeHL6GpY_rS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-09_06,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511090121
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 13:41:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121409

Inherit sourceforge-releases class to check the correct latest stable
verison.

Before the patch:
$ devtool latest-version openipmi
INFO: Current version: 2.0.36
INFO: Latest version:

After the patch:
$ devtool latest-version openipmi
INFO: Current version: 2.0.36
INFO: Latest version: 2.0.37

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-support/openipmi/openipmi_2.0.36.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/openipmi/openipmi_2.0.36.bb b/meta-networking/recipes-support/openipmi/openipmi_2.0.36.bb
index 86b24c1795..a4308aba77 100644
--- a/meta-networking/recipes-support/openipmi/openipmi_2.0.36.bb
+++ b/meta-networking/recipes-support/openipmi/openipmi_2.0.36.bb
@@ -36,7 +36,7 @@ S = "${UNPACKDIR}/OpenIPMI-${PV}"
 
 SRC_URI[sha256sum] = "a0403148fa5f7bed930c958a4d1c558047e273763a408b3a0368edc137cc55d9"
 
-inherit autotools-brokensep pkgconfig perlnative update-rc.d systemd cpan-base python3targetconfig
+inherit autotools-brokensep pkgconfig perlnative update-rc.d systemd cpan-base python3targetconfig sourceforge-releases
 
 CFLAGS += "-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
 
-- 
2.34.1


