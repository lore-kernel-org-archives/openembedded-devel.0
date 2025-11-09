Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B62FCD13D3
	for <webhook@archiver.kernel.org>; Sun,  9 Nov 2025 13:41:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24796.1762695659622277466
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Nov 2025 05:40:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Rvxv1Wnt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3408a6cb6d=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A9DZ3Tn1402375
	for <openembedded-devel@lists.openembedded.org>; Sun, 9 Nov 2025 13:40:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=WN3E7jcINLAVKw1/x6hPPEbsw/BIYsZzDkFUY38yuZ0=; b=Rvxv1Wntm58p
	NbCdxz9xBABauVps/Ar3RKQUrTmUyKd6xa+e4a17MS4rFqzQjrVNL6VR7KD/nlYt
	nQiwtjX6wpsvbg1UlgpwopWv8SuE5jEf06MRz4W1vtn+DVvycSZmXPud3ztsgGSW
	08jrUGiSlhMJTLWZjiGfRs6N372JJuvJa46XIZyiLdiJ76W67DxwF3/MyZtzrszQ
	aX8fmtktQeDN76gjBYQzNCdL+7u8pE3mZSgjAurJpyzTWgHFrMnmVZI0HY2yY9X+
	eZlY9LKofeOfvODI65ghs8x7K2mHyjRbccVLIik+ZM2m8SkkmWhxwVBoydLTtUKw
	YYGd1aXvcA==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012036.outbound.protection.outlook.com [52.101.48.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a9u2x12h9-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 13:40:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NSm4NC+u7GQ6eW+G5laC8jQiITqDDhUF5YrL+xti36SFhqzL+FCu0vzv/1DAEyt/uoc0lVgYK9POK/Z4hsIvUWVWU3YswT/ZIkKcoPGziXiD+W/ZrcfpsXfd5MseTqWsd59iTrDALU9IMUlqFYQVcqcbNXwz6pma+E3lMaF+3Rz98JF8jm1vvuYB10uZ1v5V/s7AnJc3KbjrlgRng8Enm7N0QN3dzHir+B2BUp/lfvwnuRmCq4IUwHuXB1rnb8HCekWYAbefAOLrh4fAbmzu/ZMLxZhpzkawoRohoE33BoLFj8M4vzOrLFuBvd66y00LmgMXBCnIVw5rRumSORk24Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WN3E7jcINLAVKw1/x6hPPEbsw/BIYsZzDkFUY38yuZ0=;
 b=Chqnu8VtfnCBzquSAvulsYmpJk36pGLVqNGbeKUXk7nctFTelFo5x+awPPUzry2fBmiYQBYTTJqaeHpQoms9938+W4m7xDdmCRpo8C8miXxsr0mTvE13vwctw9j1vr5BVPiLnlAHeK7F0flWHo58jUA+fHfCw2+KybL6DLkTCNF9J0pXlRr0LeCyz5ahItQiGJpc/TcRU2wi9NBSqrA5Bb8QyDREEkn6h3wVnNsmxp4VgbxMFUryglJUuf1z9FHSwwK+PWCZ8XB+w2gCQ0zaaUni4mFG/vag73dll4woFuCJUywoeY45aB9O+VFbL1M1egMdmAoeyf5d5/Z2WgXimg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 LV2PR11MB5999.namprd11.prod.outlook.com (2603:10b6:408:17d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.15; Sun, 9 Nov
 2025 13:40:55 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9298.015; Sun, 9 Nov 2025
 13:40:55 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 4/8] postfix: add UPSTREAM_CHECK_URI
Date: Sun,  9 Nov 2025 21:40:31 +0800
Message-Id: <20251109134035.2741548-4-yi.zhao@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 28eb6207-cb28-4f44-06e7-08de1f959b3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?SmVnkcKOlCPCR7LHHshlMoMXhKdVnCn31YfXgR0d7vyoDeUrUqW/nsL38HEZ?=
 =?us-ascii?Q?2InSSGZR4RTpGI5OgRuGYyMbX93ta4qBtIwaifrOT/qSnsKzBObiSyq/PvRX?=
 =?us-ascii?Q?eHYDGZ/1Rb0Ue/57EMIVqjZoBc1YZFw/eOQg7htJ+0FB/xt4W0FlFRBSeJ1g?=
 =?us-ascii?Q?O5r/VYgMUUC7DXWZhPs1ied9et0xzztu4AFxye/idCDx8Uuf13eLnB+COeUx?=
 =?us-ascii?Q?w9TVzf97w1JCAtgaTa4XrTJ/ANDaCeM9IowLDJMLGgNvEI4IkwyvuDZkeZFZ?=
 =?us-ascii?Q?rmx7TF9gjQErn+wh+t2RHPLTaL7wE+PahPBrDR/vP/bw4iNKItIq9+Co6O8u?=
 =?us-ascii?Q?1MvLuqmShshnmAQWcryoO2GV5VS3hM5MUbwN1RuTP7Onsz8NXdABQxdP6zjn?=
 =?us-ascii?Q?Ioett4AcuEMOvahPmuOOY1sjfqDBSeY/XW4XO609+2nxxMjZeHPqh+sk8BkJ?=
 =?us-ascii?Q?X4WyWUyeO90OArdpxrnVL/bPyt2FzwOBHw4FkcGo6e2fiu+Wa9aphjLfPFW5?=
 =?us-ascii?Q?Xewv8R69TBSZmvwiS+wu2kNlrymnwA2I3x5kDYSbdxb31ymDyoxEiCnq1KZz?=
 =?us-ascii?Q?uQELgMbIRI64NyYYAH3He2RRgeec9Zo9tms8j8Tm7V6C2l9i9M5CbaYPQU6q?=
 =?us-ascii?Q?swdiyZtKE64kPbf3EKiFaTAJf+8Oz9mJiYoLljdL+VUPd0g8OiGRDHIuS8of?=
 =?us-ascii?Q?5Pv7YLsibCrgU4bUEuVFAxWK+xF+++O+OlELsfNtMo+9k2mss0OJ0/sxkbIH?=
 =?us-ascii?Q?iXe7VNNaazWpB11Y24NtDRZTWsgRYoSUll+ScRW/mVz5S4481EvwVj1WtPlg?=
 =?us-ascii?Q?06103e93xHoh1BySgR3lsX60zClaFskip7zRDVCfRCuKWCn7MLL7B7TMkLyE?=
 =?us-ascii?Q?AGH/zdyCxL+5Yzc0VVGG4TKlQt+ip90ZIMvYQYbF7eIKniLMxg8i2MHvDAif?=
 =?us-ascii?Q?ATTAjPvDPDobMh0iZBjze/txuG6A4w1DLLT0LfZcLve23BinLvpEIR8QGTYg?=
 =?us-ascii?Q?Ya/5I4+aTMcpRXvbFi6xwMjxmWD4H3AsF2U9ID8YqzoXgto7lplKLQbVhiEs?=
 =?us-ascii?Q?D4sQaeSo4wihnTuCzjXiPRZ4IQpwiS3twB9B0jO8UV+pkuMygE1VkqHBhVj+?=
 =?us-ascii?Q?ARC0T1sPsLu5fI+oiFWfpKkGo2E/9ZlDZe2pKLJvttTUsJLkgVSxMVNNziNn?=
 =?us-ascii?Q?FtIJzuq5G7wpjrLXINUYxVxak2W2IKuC+cQhJvM8bglj/vqbBx94jRdPh9El?=
 =?us-ascii?Q?vfBqiPWOr2kEaE6Dm2ZBLkzkUGhL0EpccUkfLmthP+SVkfaYcH3C8fL3s/QP?=
 =?us-ascii?Q?RUpdoP5YsavF4qWM6cwjd/ZVhI1+5tchMV0Av9AfIDo8I71vZbhvKVvvN8Xs?=
 =?us-ascii?Q?66tsWChXn4qLWOY6zBLDO0sFu1xx1npc3fUlmc2u6JgsIaccX0VhikUiWcts?=
 =?us-ascii?Q?bfThXQ0hjEjmelf4J/KQXrTgJGo+QiZ7Y0BRRjlmgv6+lCRm1MfbZQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?drirBILOJpIIOfHCTjtdri1hLpyo1uPDWNzKAcn9G+JICKP2AHwQ0CB/nArJ?=
 =?us-ascii?Q?soMGVfUtpsdZGjsLTIzhMeNeCYjcd3r6gxvQZzOvxjXDNAiq/OnJo5h1k5yg?=
 =?us-ascii?Q?4hBer8/TtZz0fhLlvxZKaWt2BHtFDKQ8a/G9mpUoy+jkvIcchy1jHoutLtFi?=
 =?us-ascii?Q?7ca6Yjzt8k/l0K67dN1NDpnkPC9jzVv9diycHOwxDncC1pWUbew9qvh7dfS6?=
 =?us-ascii?Q?B2RqsXh5spffOyZQ9xrgmSlddIAmSXTk0OZ/DYuvbfOhXNWcUTlLFNUQ19Nr?=
 =?us-ascii?Q?kDIjQnCjJb19Yg4/4kilisExv5xzz+yQlFABYrTLRQsxl/J3CtE9OFuCJX6q?=
 =?us-ascii?Q?H0nr9QbTnOPfw5+CsgWKddQl0IM1F/SXXS9tWVrwztenZ2nHOZ8k/UU9fA24?=
 =?us-ascii?Q?ezUrAyzv7Cj/ic4wsBKpX3deLVTHn4kPBZV+raAWeEh+eT0YR1ZVh5yxJiBh?=
 =?us-ascii?Q?zWkxLEuEwT7Xi5JHJx8RxrdH8xiZGKe87g1DVDV0x3aLax0wu5lwuy1jvoOL?=
 =?us-ascii?Q?IBrtDej2npKnBxfyVbsjOXcBQJBnMVBW8A3v5ExuuMSmaSJTFU6QaFmU0y0T?=
 =?us-ascii?Q?c0Kxa7Tj454FUXpzuy6Iz+KlBzsKykli69B82chOMRBDdWUHJ6dUR3EOJa4k?=
 =?us-ascii?Q?2ak4nXEvDaVeaOyNs8bX1Pp1A9nQ4lVbKL4mF67Y6pk8n+RjDys77/S0haak?=
 =?us-ascii?Q?hkmBQ2sjhvX8n3+c/mcGryMeN+A4T3DDwXhgJyAJheNLXduojwVthZm2v4nz?=
 =?us-ascii?Q?gmFZmGe65GUI1sp9I4glTreF0WV42I9FfFLI9iPLFxKnn4JMRGmJVw9RKCDx?=
 =?us-ascii?Q?9AQfqwa2mZhNvuZJpFOan4r+40fRG+fSUbJP5I02QoEniyBe3pB2jeHB9WMF?=
 =?us-ascii?Q?99D6QXztpl4/7kCLdItDYaWYloMe6sD7amXJNg4rkoZiG79Wg+k6t3+WCaUl?=
 =?us-ascii?Q?nI1+7T0uLZJ9OOjBNHVWlNLqJ4mlznCtwBacRPYl41uAvQmCgXxF534saKoh?=
 =?us-ascii?Q?lDi8iriy1bSGLAQ9sUb0cY9Kr4QFHWzbXOzayDG8wBJvcC5iHlwqo+q4UHMX?=
 =?us-ascii?Q?VWPCbuwHWZg5xrqzId/Y4/iemCu3GceEzb5qBK3hIb6oBz0qORREXwG5+a5D?=
 =?us-ascii?Q?AU9raK8WWAe7+9qEUAtIz/5NeY/cT8l/AUdqfsNL9kSBJsuK7/KHtyV3ujL/?=
 =?us-ascii?Q?cI1PD2JnoV28yfLX614ciy2rKuJvOMxL8S69lHfJKfWH0bHJhGB7dukCLZg1?=
 =?us-ascii?Q?L98Gc/nfzjSwWZBJZso69STLQ7hXiaO4tqrybnMG8i60W/sOt2mvfngUjrS+?=
 =?us-ascii?Q?FQfkobTmTfzHddAF69fLiCh0tnw7avUcHKy7srLyaVm40qehM3CsN2dwcNkO?=
 =?us-ascii?Q?Io+GN2OQq7lOk5wUnL7x6K9cFCajpNY38z7lSL34Mga+Wyb6gDe1ckpmyA0F?=
 =?us-ascii?Q?FNdahDmkhlvTqWxaNINZItQOoYY68wf2JJcexNVwCU44fmsWnZlMPBCgH68Q?=
 =?us-ascii?Q?D4pHBsmipOkbW61bDpmiARQ9Eysnni2EGRHqATpc1K521Zd3+xOvHI+n8hv/?=
 =?us-ascii?Q?7O23cBVMeGCsjbKEhv+cu7LdX9/d0Bcdx8Pi7dnH?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28eb6207-cb28-4f44-06e7-08de1f959b3a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2025 13:40:55.1307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rmh23CoqmC+rexgO9m90sFySrc4Yf7Hg0jgliqrvUXC5R/oPfUbs8q1m9im3ygOARiHrBmuCdadIZ4sQhl+4rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5999
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA5MDEyMSBTYWx0ZWRfX3bmMIV+1aXb3
 zVvrqHoSe/bWp0yT+1EmnxX9SQEuXlEbz4mgiRaJO+7qSngm8dmCIutk+2QBReY0YoOtbN/plCC
 MsoNEbYpi5DMi3RXmrfp+z0VV4Z+jqPpTSuFUlgkQWkeYqbjJX5HdyV8rFCU/70w2HQZVLdhdwW
 Gdpd39hvE9TnnRjbNr+rSsAYJ+VPtsJEJoQNbvAdFrf4leURP+cPpKNoxoM5dZ/l68PY1yR5nFg
 qZbyE8hH/pQb2jdFf4vcRLOT6y9uMcRtMXTIA7CTTfeN9R6u+WjDxBqB164ctM1I8zRBWwl3+YI
 5Gu07qZKnpT+oXAV2acWekFTcZr3hYcmG+Z6/WskiCPRoQDEF8bdMrhJWFSfYjQ6mXyyEavZbGZ
 1tFtcYHWuks4QPzdK7KGZjBCBmQgjw==
X-Proofpoint-GUID: 087YMF_Qm03ccPkxO59OUTOFZSfNpPek
X-Authority-Analysis: v=2.4 cv=Uvpu9uwB c=1 sm=1 tr=0 ts=691099ea cx=c_pps
 a=FLJGh2IUmjoo+n/grE3sag==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e1GkridNAAAA:8 a=gmDo1nssAAAA:8 a=t7CeM3EgAAAA:8 a=SfuP00NKZhq4WDuMKhUA:9
 a=vPaJURsLdigA:10 a=LdKwl_GUR-EA:10 a=6ft9yNkZjdd813gQxDxM:22
 a=DmCNEmdWNTAeIjfGWauO:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 087YMF_Qm03ccPkxO59OUTOFZSfNpPek
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121410

Add UPSTREAM_CHECK_URI and UPSTREAM_CHECK_REGEX to check the correct
latest stable verison.

Before the patch:
$ devtool latest-version postfix
INFO: Current version: 3.10.5
INFO: Latest version:

After the patch:
$ devtool latest-version postfix
INFO: Current version: 3.10.5
INFO: Latest version: 3.10.5

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-daemons/postfix/postfix_3.10.5.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.10.5.bb b/meta-networking/recipes-daemons/postfix/postfix_3.10.5.bb
index edcdc1a8ca..8b3becda9f 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.10.5.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.10.5.bb
@@ -30,7 +30,8 @@ SRC_URI = "http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
 
 SRC_URI[sha256sum] = "6a926bf702173861b08e49bcb51fca3a2f269f9a337f72ef159bf46052087e35"
 
-UPSTREAM_CHECK_REGEX = "postfix\-(?P<pver>3\.10(\.\d+)+).tar.gz"
+UPSTREAM_CHECK_URI = "https://www.postfix.org/announcements.html"
+UPSTREAM_CHECK_REGEX = "postfix-(?P<pver>\d+(\.\d+)+)"
 
 S = "${UNPACKDIR}/postfix-${PV}"
 
-- 
2.34.1


