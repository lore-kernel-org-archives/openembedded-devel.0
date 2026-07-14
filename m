Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAD35C44507
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 09:40:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6140.1784022022233782369
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jul 2026 02:40:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=l8Oud67K;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1655cb98fb=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SHdw1318507
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jul 2026 09:40:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=s0Z+DcqIh
	ivknCcVCdWQLWwY/KwOsRP9KrIX7yanM8Q=; b=l8Oud67KziPESCG9ojwt/xpO8
	lJ5FwAwgQd9DlhixWtpWArt2ASyklvNe8wWAaIYX3yb8rqNKDdDIjnsVMC1YM+P1
	SMgJqaVZgHdxTl10nfe34AoYlOSuUl4tClIc8EO27/Y+fxRaQatNFGvV2NT17dSX
	3K3huvv3c40fnIL7mVKknRQ9a/qa1dWCIqFWEYnIEZwIzAt4zNmmk/VJWsgPdNJF
	W41+MTb2YtYAUBOnGeIdm+rzl4GV8n/gjLsXym2E7nUyKoUmdnT9SVL/W2injtJC
	Cbn4MA5amW0xFjphaKdzRaUxg4OaeCw2pa1VLp8aQ9Upu5inw7pz68/r9SU9A==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012032.outbound.protection.outlook.com [52.101.43.32])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fbct4kv9d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jul 2026 09:40:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oPOsSTi9y6+UBRF9FVS8xjhK9/Qmo/lUCsm37lYqptsT7qfqkA1/vGxD4hdMtSxjRrCYC8jUARP1+NNf1b92QkNrDpwoX75MHptCrPjugp7X6KR9SzC+f1DWrwCoQn38eiil3pcfagGSy8xbUF2iAjSEAREAc0nP/EVVTV5mgWYlrwaJTcuRFtMN+06842mSYXMqg+DPx315NcZQ233h9TqpyTdMIqjnsquWmifQuWMgBpXVFI4g0mvZP1RmZXybHTIDjNSmShLQcWYKijMwXMyROqgkekuMdTz0E4nV51rVxZbozPim6/uGtsqzZLbgcVf6L+aT3+I+YTZS8fSL2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s0Z+DcqIhivknCcVCdWQLWwY/KwOsRP9KrIX7yanM8Q=;
 b=dYNOBHICS4rXFRBk8PCXqCGspWlX3b+tbpvgwRsGnnvLpDPuDvd3mpQAQwYk6dNtaMPt4KN3O9eyeOFQi03XbSYsXiO3GwhaR9Y3kTLoabsF4B/nSn2nRUd9tNFQykAgQOjhrHtGSw1BslMQ4vn4Su4FhS5Vzp9Wcz68Ga0gnatUFLZOjl7LjsR05ue+FDfTO9FvHyjOrb9zNB+yGUFORnowgWWWnbg6XAXqG6jZ4Gkp88PcIZzpNl0xZV8Ciq2BCXixSN9za7sOCduzbotxwQYteGa4hss8U4d7aho++O8vhplqoMzCz8E+7rIVfzzhzg2bS8LyjpXbAsDk5ugkvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by SN7PR11MB7566.namprd11.prod.outlook.com (2603:10b6:806:34d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 09:40:17 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%4]) with mapi id 15.21.0181.019; Tue, 14 Jul 2026
 09:40:17 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-devel@lists.openembedded.org
Cc: Deepesh.Varatharajan@windriver.com
Subject: [meta-oe][PATCH 1/2] librust-cxx: upgrade 1.0.194 -> 1.0.197
Date: Tue, 14 Jul 2026 02:40:05 -0700
Message-ID: <20260714094006.1519710-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0019.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::35) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|SN7PR11MB7566:EE_
X-MS-Office365-Filtering-Correlation-Id: 64ebd4ba-06e0-40b7-13d0-08dee18be9f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|52116014|38350700014|5023799004|11063799006|56012099006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	GbVowFXXP+BsZjeon4EhkkB3ityONJbCIiZ3546ywpstws15dnxdHtZST5gvxibER2ZK2VN0ju3+pdnaLbEvaSupNQUdnnyDW989RAQlGp9gxpz0wxcIbzF+1DDFEWnUt28lGLAQvbO2M/Pn4XIDkuEfHvgTOdYMNvCImpli/J1NOcq9kmFwqjvIkt58ieowu5n97agh0qgTQkNL4uDx/Bcp4Do7b18UhYh+31hPodMgqFDxkpju1Dw7R535vmdG9zbropiKpzcyq24jeuG3Bx38jfA6EjohqjHXj/BnoHR56rZlj6ZNH3z3VC9xwEowUKnAG/K992+ChKIjDpZsDkoBhAvVYtnmH2Kgvd330TGHPVr81nLhu+hd9B7DItztm/O7OiGJ179D0odE2N1YD7yFJaHoHjMZNiQDa6gnhzbqUeanHGK5W7STNbebYuifGn2bCiG4qWpll4reTlWJqkXZZtsLuav3HycL1B694x0GTAUlMm0yypNZGbI1Iq7SbpBJ1mPAVaQBHBfU5JXncBQTV1fmPSeyVoOKfkGp5a+TfsffT5gCDC2IGRyXh7dcuW16Ye5DuMF+ztu5j1rgTJrsJTh11z8SutvVSgmJDCA55NcNzunCLKsQptTmXYx8tPLAEwtRwF0KWrDe5fSLzMQmqCNqc8k0nE06apBknAZobpoxl7+OY/8iFv0VgFlBSeorRQoK2wO5yjanSm4ET6WeRcSbmIQPddkirfdTwRA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(52116014)(38350700014)(5023799004)(11063799006)(56012099006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LAemynSMOptBJqrkwyi+tZufNdpG0vRBq7hz1gRfyF+SJ3bc+MCoin09M4nk?=
 =?us-ascii?Q?82qGEaCSyRISEhG+x4pQgc07ajRhR8WGBDr+gKaXIUe51QycZIUXQQFmzvJa?=
 =?us-ascii?Q?/+Z6kJh0VP75ANIlWODvBt/jV1Q01yXhd/FAVFNDTP4lcep88BVMA535epQW?=
 =?us-ascii?Q?wsic/oMER50b/1tdWACIMXPl940+S7wzB6uI7rlBDZiA/FI8RAK3me+PvkRU?=
 =?us-ascii?Q?u1ehg8u8rAwCYUSLqfbl8DusehQxaN2rIFNKR7T55TwrYvnXIm0TgmL4BMII?=
 =?us-ascii?Q?8I/b2D15oCLmnzkwwYWi6lnhzOLKg92iglqgq1v/t+6fcKyMyocJWMD3cnW/?=
 =?us-ascii?Q?q6lQpBNx+8w4gWeMnS350RYXoB3/IbiwvrhgKGfeES1F0n/6M9HfGjnB9/lt?=
 =?us-ascii?Q?4WZuXYNadh4/yLQrlGSIzKo1J22XJRaDg0T44UrgFBhfhg7sfNpvfjO9TWh8?=
 =?us-ascii?Q?dO+DF+UQBCJBlY6niavkvb1tL29EPvuUYaxO3Yt4Py6HOXnps4D5eZTm4Tvr?=
 =?us-ascii?Q?yDUJ4rSq7AFhAqjG0I/saMmG7cZUxOYBn1+pXBj60APxX2RRkXCtFV/qgAUv?=
 =?us-ascii?Q?xDxB41AiDPmIGlMWG3AztleCuBApNZM6SyR3tj8gHo7//wvcC6VuCVsSzva9?=
 =?us-ascii?Q?AoPMswbRAZc2dJZsTxKTz7WCyd4jCzfnhBm6QnhgLxctLjXYe+SZAg9TeLd6?=
 =?us-ascii?Q?bybRigrIz6wYX4Bx2xBp8yu9J1nKY1ipJNikrQKxuXcd6Gubzv0ZzQpHFHti?=
 =?us-ascii?Q?7DzFxA4cntoElr1jYm22eMGXDRbfsjDZ5WB07clWr3dQYm8actJco+luatm+?=
 =?us-ascii?Q?SGsApmiE0F9zP2RRA0c0ypu24ZeYZnCj9wHc7V4u1oTrKxvNIYKcaZSY68xM?=
 =?us-ascii?Q?AW3x8pRpYWqVtBteRlsQveUbMvtybH0I+Jr1TBClZA6YavpIj7b/XnU6Z9PA?=
 =?us-ascii?Q?8jmzIt28ZtgqOBkm03wi6KHVMNRzQHNO6RmMRVXrj8V1ryM8Ypi/yyqeh29u?=
 =?us-ascii?Q?zpi1O/DK0r9Pj6O5imDJZcc8Vyi6vlhR5D+/u+d7UJpMbvvv1D8OnsItH0Hp?=
 =?us-ascii?Q?Pgpg7xCeuM7g101JiBtqTgnnrWIVA6r2biRwnBuSOR569lx/OMXC5jdjX4pH?=
 =?us-ascii?Q?H+CgRSKyVmnwHTVvIISdhSJVzvbAQOdDRwtooMPf5Pc3/K9gBhO9yHttjZ/s?=
 =?us-ascii?Q?QhZ+Br8Eq/lSH6GfHq4dmQUB9fQ8MzAa6W37MEIHvpr9RvvZMXHcdCJ3Jf28?=
 =?us-ascii?Q?KRohGvDPUSdW86L4jGvJrEHrZgLD13nKQucjM833HHoAXYn7ta3nGSow+7es?=
 =?us-ascii?Q?rU51jvpiPv9nGoGLZj79nXHwXIfGd7R5o+3dSPAAAClwGS20CuhtJ9hPzgB9?=
 =?us-ascii?Q?6qNaW3JR8jHfphdAryPEJB2kZjXxmFcBSwoTZ8ev15B643kg8tvDYxUHoG8E?=
 =?us-ascii?Q?42hgZlNGAxPWDQpVjxyD6NlmWNW3lbNaNU468MKDWHr2/61wUPlM4B0YftpI?=
 =?us-ascii?Q?c1MAcAkkLRG+bb/r8qYMI4IybH5+D+eBtY6h9vpXm6wPwBzMgYQykFX5lcKz?=
 =?us-ascii?Q?TXn951wDrGUs5NIbbKzhsK0bsp7l47EzmEgEz7xmPlsUBdjh5EOWZlCjUNU6?=
 =?us-ascii?Q?7n+r1FfKgn3ALcyltYeQrxaTb2WbaovTOeA15Cb/UphmFlbU80i7SCtVWkZE?=
 =?us-ascii?Q?h66YqPwaD46igOZ889Xmrtbb/2wx7tmpO2t4JmIw09Pxi0l8GqRJEmm6YEoh?=
 =?us-ascii?Q?/wZqGnSw1pD+J2Jn4TdfTrEsOn1HCIT8zry6wqecqK09kcp4g5oq?=
X-Exchange-RoutingPolicyChecked: 
	hEgiBD0KCEYFdLcZeIuQZjasySuB8ZX+99Kc/SbkmMxPNxS89Bx9VUbDTqk+JMfOJ52ot4WA6n+Tb8Jjfj9tFdDd0SHvGSEQ4ErCBxoiRlw7cc/hzKayavjxmARqSyuoHtYF6wc8ezE9kLqanM/cbHjNyk5HT7mIpU34RXURk7FNL2IGfilafOZ+iBiFNmyp9SEyxig3lFDje/X1WyK2N/aukqBdFYUIM45ij+jsBfF6/1a4o+r3g2vbDhQqjscSHfuiGJ4VEvSOOiU2EBoiqlLcmBYf2VdOwFXqsXgnrbVGYw6usz0NYx7rdgfqkSwzazCe+yAYsHP53BfMVVCQtQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64ebd4ba-06e0-40b7-13d0-08dee18be9f6
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 09:40:17.6251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2N9RcoNohWiqHZ1SXC1BfIp3y21dVVeCGJVnwBnwfFeqgyz42Qj+JnEKi6oP6wZUctc/QhG721QrSGcZpRkFi1kylr+L+0iYMF8ZF+tBFuljPPHx5Tvf2v4qbDqXjXvn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7566
X-Authority-Analysis: v=2.4 cv=J9CaKgnS c=1 sm=1 tr=0 ts=6a560404 cx=c_pps
 a=KOMCkPMYLpCa0saNKAKAdQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=vdLMWLd9Xw40n4w7ix0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEwMCBTYWx0ZWRfX5NuPzxvn50lm
 G7Z3id2vE1e9L7EfE6p0WgKbjuq16SJTd331HN/ABhBJ4Wgkk67psiIzWaYD1tr0ymD/ML+9o2d
 gOvjgQ1PkSHjemItu6icKz/tW9UkXlgN43heTRXeXQToAgP8yx6Q
X-Proofpoint-ORIG-GUID: joznWKkvD79U6kaWN156FY3tyMVFGj3p
X-Proofpoint-GUID: joznWKkvD79U6kaWN156FY3tyMVFGj3p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEwMCBTYWx0ZWRfX1npZFEEfZxDf
 4XFVv/uEa1jRHqb6wnYmbZ8LEK/H/exbCIg5HfhwSzQcH/luMvYn8+q6jH7C5t6C+L8U2HMGfnA
 jGxmES5oyVWdekofjh21nq1qCmZBpbODW3lHxEUawGG7G5G0G6fUhSx8DDLrUxOT35hBovBFSXf
 nZ3pSOfwGzZClo7seGS/ZTU1LASvDVRnGdy/Wxa3OqtVWeD7U9meAqOCAJP0yxdGWCE6xbmlu+A
 NK3AZnwq5KIgB7psPkIvP8T4EEgyH3sfzU0wtRvdy0s9Ei1UF4G+reiLg1hByd8aFECfBrHKsdm
 MG3yFyG9wtcgRlQtxmbTYLhidLrpxN+Hbrh4YF9SxXjNiwPPNdAsg75YLWiteY01x/W/Ist9GVY
 +zJJubVirBUR7wLU4JGrFt+T9qPTEUQ9SOxG2ua/ecs7Yu0QOy5c0muzVN9M3NUMxsu1+VLxj+o
 qE5DIl/3GAIgLS2XDGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1011 malwarescore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140100
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jul 2026 09:40:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128164

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Update cxx crate from 1.0.194 to 1.0.197.

Changes in this update:

v1.0.195:
- Fix use of uninitialized value in let_cxx_string! on panic
  inside initialization expression

v1.0.196:
- Migrate to Rust 2024 edition

v1.0.197:
- Restore RefUnwindSafe for let_cxx_string in async contexts
- Use link_deps in Cargo bazel metadata

Assisted-by: Kiro CLI 2.12.0 (AI assistant)
Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../librust-cxx/librust-cxx-crates.inc        | 165 +++++++++---------
 ...-cxx_1.0.194.bb => librust-cxx_1.0.197.bb} |   2 +-
 2 files changed, 81 insertions(+), 86 deletions(-)
 rename meta-oe/recipes-devtools/librust-cxx/{librust-cxx_1.0.194.bb => librust-cxx_1.0.197.bb} (93%)

diff --git a/meta-oe/recipes-devtools/librust-cxx/librust-cxx-crates.inc b/meta-oe/recipes-devtools/librust-cxx/librust-cxx-crates.inc
index ea21ea5..c66fac7 100644
--- a/meta-oe/recipes-devtools/librust-cxx/librust-cxx-crates.inc
+++ b/meta-oe/recipes-devtools/librust-cxx/librust-cxx-crates.inc
@@ -2,129 +2,124 @@
 
 # from Cargo.lock
 SRC_URI += " \
-    crate://crates.io/anstyle/1.0.13 \
-    crate://crates.io/bitflags/2.10.0 \
-    crate://crates.io/cc/1.2.53 \
+    crate://crates.io/anstyle/1.0.14 \
+    crate://crates.io/bitflags/2.13.0 \
+    crate://crates.io/cc/1.2.66 \
     crate://crates.io/cfg-if/1.0.4 \
-    crate://crates.io/clap/4.5.54 \
-    crate://crates.io/clap_builder/4.5.54 \
-    crate://crates.io/clap_lex/0.7.7 \
+    crate://crates.io/clap/4.6.1 \
+    crate://crates.io/clap_builder/4.6.0 \
+    crate://crates.io/clap_lex/1.1.0 \
     crate://crates.io/codespan-reporting/0.13.1 \
-    crate://crates.io/cxx-build/1.0.194 \
-    crate://crates.io/cxx-gen/0.7.194 \
+    crate://crates.io/cxx-build/1.0.197 \
+    crate://crates.io/cxx-gen/0.7.197 \
     crate://crates.io/cxx-test-suite/0.0.1 \
-    crate://crates.io/cxxbridge-cmd/1.0.194 \
-    crate://crates.io/cxxbridge-flags/1.0.194 \
-    crate://crates.io/cxxbridge-macro/1.0.194 \
-    crate://crates.io/dissimilar/1.0.10 \
+    crate://crates.io/cxxbridge-cmd/1.0.197 \
+    crate://crates.io/cxxbridge-flags/1.0.197 \
+    crate://crates.io/cxxbridge-macro/1.0.197 \
+    crate://crates.io/dissimilar/1.0.11 \
     crate://crates.io/equivalent/1.0.2 \
     crate://crates.io/errno/0.3.14 \
-    crate://crates.io/fastrand/2.3.0 \
-    crate://crates.io/find-msvc-tools/0.1.8 \
+    crate://crates.io/fastrand/2.4.1 \
+    crate://crates.io/find-msvc-tools/0.1.9 \
     crate://crates.io/foldhash/0.2.0 \
-    crate://crates.io/getrandom/0.3.4 \
+    crate://crates.io/getrandom/0.4.3 \
     crate://crates.io/glob/0.3.3 \
-    crate://crates.io/hashbrown/0.16.1 \
-    crate://crates.io/indexmap/2.13.0 \
+    crate://crates.io/hashbrown/0.17.1 \
+    crate://crates.io/indexmap/2.14.0 \
     crate://crates.io/indoc/2.0.7 \
-    crate://crates.io/itoa/1.0.17 \
-    crate://crates.io/libc/0.2.180 \
+    crate://crates.io/itoa/1.0.18 \
+    crate://crates.io/libc/0.2.186 \
     crate://crates.io/link-cplusplus/1.0.12 \
-    crate://crates.io/linux-raw-sys/0.11.0 \
-    crate://crates.io/memchr/2.7.6 \
-    crate://crates.io/once_cell/1.21.3 \
-    crate://crates.io/proc-macro2/1.0.105 \
-    crate://crates.io/quote/1.0.43 \
-    crate://crates.io/r-efi/5.3.0 \
-    crate://crates.io/rustix/1.1.3 \
-    crate://crates.io/rustversion/1.0.22 \
+    crate://crates.io/linux-raw-sys/0.12.1 \
+    crate://crates.io/memchr/2.8.2 \
+    crate://crates.io/once_cell/1.21.4 \
+    crate://crates.io/proc-macro2/1.0.106 \
+    crate://crates.io/quote/1.0.46 \
+    crate://crates.io/r-efi/6.0.0 \
+    crate://crates.io/rustix/1.1.4 \
+    crate://crates.io/rustversion/1.0.23 \
     crate://crates.io/scratch/1.0.9 \
     crate://crates.io/serde/1.0.228 \
     crate://crates.io/serde_core/1.0.228 \
     crate://crates.io/serde_derive/1.0.228 \
-    crate://crates.io/serde_json/1.0.149 \
-    crate://crates.io/serde_spanned/1.0.4 \
-    crate://crates.io/shlex/1.3.0 \
+    crate://crates.io/serde_json/1.0.150 \
+    crate://crates.io/serde_spanned/1.1.1 \
+    crate://crates.io/shlex/2.0.1 \
     crate://crates.io/strsim/0.11.1 \
-    crate://crates.io/syn/2.0.114 \
+    crate://crates.io/syn/2.0.118 \
     crate://crates.io/target-triple/1.0.0 \
-    crate://crates.io/tempfile/3.24.0 \
+    crate://crates.io/tempfile/3.27.0 \
     crate://crates.io/termcolor/1.4.1 \
-    crate://crates.io/toml/0.9.11+spec-1.1.0 \
-    crate://crates.io/toml_datetime/0.7.5+spec-1.1.0 \
-    crate://crates.io/toml_parser/1.0.6+spec-1.1.0 \
-    crate://crates.io/toml_writer/1.0.6+spec-1.1.0 \
-    crate://crates.io/trybuild/1.0.114 \
-    crate://crates.io/unicode-ident/1.0.22 \
+    crate://crates.io/toml/1.1.2+spec-1.1.0 \
+    crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 \
+    crate://crates.io/toml_parser/1.1.2+spec-1.1.0 \
+    crate://crates.io/toml_writer/1.1.1+spec-1.1.0 \
+    crate://crates.io/trybuild/1.0.117 \
+    crate://crates.io/unicode-ident/1.0.24 \
     crate://crates.io/unicode-width/0.2.2 \
-    crate://crates.io/wasip2/1.0.2+wasi-0.2.9 \
     crate://crates.io/winapi-util/0.1.11 \
     crate://crates.io/windows-link/0.2.1 \
     crate://crates.io/windows-sys/0.61.2 \
-    crate://crates.io/winnow/0.7.14 \
-    crate://crates.io/wit-bindgen/0.51.0 \
-    crate://crates.io/zmij/1.0.16 \
+    crate://crates.io/winnow/1.0.3 \
+    crate://crates.io/zmij/1.0.21 \
 "
-
-SRC_URI[anstyle-1.0.13.sha256sum] = "5192cca8006f1fd4f7237516f40fa183bb07f8fbdfedaa0036de5ea9b0b45e78"
-SRC_URI[bitflags-2.10.0.sha256sum] = "812e12b5285cc515a9c72a5c1d3b6d46a19dac5acfef5265968c166106e31dd3"
-SRC_URI[cc-1.2.53.sha256sum] = "755d2fce177175ffca841e9a06afdb2c4ab0f593d53b4dee48147dfaade85932"
+SRC_URI[anstyle-1.0.14.sha256sum] = "940b3a0ca603d1eade50a4846a2afffd5ef57a9feac2c0e2ec2e14f9ead76000"
+SRC_URI[bitflags-2.13.0.sha256sum] = "b4388bee8683e3d04af747c73422af53102d2bd24d9eadb6cbc100baef4b43f8"
+SRC_URI[cc-1.2.66.sha256sum] = "f5d6cac793997bd970000024b2934968efe83b382de4fdcf4fcb46b6ee4ad996"
 SRC_URI[cfg-if-1.0.4.sha256sum] = "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
-SRC_URI[clap-4.5.54.sha256sum] = "c6e6ff9dcd79cff5cd969a17a545d79e84ab086e444102a591e288a8aa3ce394"
-SRC_URI[clap_builder-4.5.54.sha256sum] = "fa42cf4d2b7a41bc8f663a7cab4031ebafa1bf3875705bfaf8466dc60ab52c00"
-SRC_URI[clap_lex-0.7.7.sha256sum] = "c3e64b0cc0439b12df2fa678eae89a1c56a529fd067a9115f7827f1fffd22b32"
+SRC_URI[clap-4.6.1.sha256sum] = "1ddb117e43bbf7dacf0a4190fef4d345b9bad68dfc649cb349e7d17d28428e51"
+SRC_URI[clap_builder-4.6.0.sha256sum] = "714a53001bf66416adb0e2ef5ac857140e7dc3a0c48fb28b2f10762fc4b5069f"
+SRC_URI[clap_lex-1.1.0.sha256sum] = "c8d4a3bb8b1e0c1050499d1815f5ab16d04f0959b233085fb31653fbfc9d98f9"
 SRC_URI[codespan-reporting-0.13.1.sha256sum] = "af491d569909a7e4dee0ad7db7f5341fef5c614d5b8ec8cf765732aba3cff681"
-SRC_URI[cxx-build-1.0.194.sha256sum] = "b0f4697d190a142477b16aef7da8a99bfdc41e7e8b1687583c0d23a79c7afc1e"
-SRC_URI[cxx-gen-0.7.194.sha256sum] = "035b6c61a944483e8a4b2ad4fb8b13830d63491bd004943716ad16d85dcc64bc"
+SRC_URI[cxx-build-1.0.197.sha256sum] = "43e05269dbed4dab7072ae0f04ef31799ad189d52ce2ac12710c2997b754f86a"
+SRC_URI[cxx-gen-0.7.197.sha256sum] = "1fe60274ac750caecda11504eec75de8ff73c8dfdfeb50eedb485e291b2c4018"
 SRC_URI[cxx-test-suite-0.0.1.sha256sum] = "2a0a413bcefc6b37668d9eae784f5fe11232343e11101f1d1834163a509610e7"
-SRC_URI[cxxbridge-cmd-1.0.194.sha256sum] = "d0956799fa8678d4c50eed028f2de1c0552ae183c76e976cf7ca8c4e36a7c328"
-SRC_URI[cxxbridge-flags-1.0.194.sha256sum] = "23384a836ab4f0ad98ace7e3955ad2de39de42378ab487dc28d3990392cb283a"
-SRC_URI[cxxbridge-macro-1.0.194.sha256sum] = "e6acc6b5822b9526adfb4fc377b67128fdd60aac757cc4a741a6278603f763cf"
-SRC_URI[dissimilar-1.0.10.sha256sum] = "8975ffdaa0ef3661bfe02dbdcc06c9f829dfafe6a3c474de366a8d5e44276921"
+SRC_URI[cxxbridge-cmd-1.0.197.sha256sum] = "e2f017b07e0da7f425642339faff0edc9f0de6459a18180183d086d1f3381e89"
+SRC_URI[cxxbridge-flags-1.0.197.sha256sum] = "293d267f43a5778bf3b89fff2a658f081166e7f152d9640e2ee3d917d065a5fc"
+SRC_URI[cxxbridge-macro-1.0.197.sha256sum] = "72dd233dc128223fe85d2afa5c617c79743c0f47fb495b69234b5da680d4986a"
+SRC_URI[dissimilar-1.0.11.sha256sum] = "aeda16ab4059c5fd2a83f2b9c9e9c981327b18aa8e3b313f7e6563799d4f093e"
 SRC_URI[equivalent-1.0.2.sha256sum] = "877a4ace8713b0bcf2a4e7eec82529c029f1d0619886d18145fea96c3ffe5c0f"
 SRC_URI[errno-0.3.14.sha256sum] = "39cab71617ae0d63f51a36d69f866391735b51691dbda63cf6f96d042b63efeb"
-SRC_URI[fastrand-2.3.0.sha256sum] = "37909eebbb50d72f9059c3b6d82c0463f2ff062c9e95845c43a6c9c0355411be"
-SRC_URI[find-msvc-tools-0.1.8.sha256sum] = "8591b0bcc8a98a64310a2fae1bb3e9b8564dd10e381e6e28010fde8e8e8568db"
+SRC_URI[fastrand-2.4.1.sha256sum] = "9f1f227452a390804cdb637b74a86990f2a7d7ba4b7d5693aac9b4dd6defd8d6"
+SRC_URI[find-msvc-tools-0.1.9.sha256sum] = "5baebc0774151f905a1a2cc41989300b1e6fbb29aff0ceffa1064fdd3088d582"
 SRC_URI[foldhash-0.2.0.sha256sum] = "77ce24cb58228fbb8aa041425bb1050850ac19177686ea6e0f41a70416f56fdb"
-SRC_URI[getrandom-0.3.4.sha256sum] = "899def5c37c4fd7b2664648c28120ecec138e4d395b459e5ca34f9cce2dd77fd"
+SRC_URI[getrandom-0.4.3.sha256sum] = "300e883d756b2e4ec94e02791f39b04b522276138852cfc41d9fb7e904106099"
 SRC_URI[glob-0.3.3.sha256sum] = "0cc23270f6e1808e30a928bdc84dea0b9b4136a8bc82338574f23baf47bbd280"
-SRC_URI[hashbrown-0.16.1.sha256sum] = "841d1cc9bed7f9236f321df977030373f4a4163ae1a7dbfe1a51a2c1a51d9100"
-SRC_URI[indexmap-2.13.0.sha256sum] = "7714e70437a7dc3ac8eb7e6f8df75fd8eb422675fc7678aff7364301092b1017"
+SRC_URI[hashbrown-0.17.1.sha256sum] = "ed5909b6e89a2db4456e54cd5f673791d7eca6732202bbf2a9cc504fe2f9b84a"
+SRC_URI[indexmap-2.14.0.sha256sum] = "d466e9454f08e4a911e14806c24e16fba1b4c121d1ea474396f396069cf949d9"
 SRC_URI[indoc-2.0.7.sha256sum] = "79cf5c93f93228cf8efb3ba362535fb11199ac548a09ce117c9b1adc3030d706"
-SRC_URI[itoa-1.0.17.sha256sum] = "92ecc6618181def0457392ccd0ee51198e065e016d1d527a7ac1b6dc7c1f09d2"
-SRC_URI[libc-0.2.180.sha256sum] = "bcc35a38544a891a5f7c865aca548a982ccb3b8650a5b06d0fd33a10283c56fc"
+SRC_URI[itoa-1.0.18.sha256sum] = "8f42a60cbdf9a97f5d2305f08a87dc4e09308d1276d28c869c684d7777685682"
+SRC_URI[libc-0.2.186.sha256sum] = "68ab91017fe16c622486840e4c83c9a37afeff978bd239b5293d61ece587de66"
 SRC_URI[link-cplusplus-1.0.12.sha256sum] = "7f78c730aaa7d0b9336a299029ea49f9ee53b0ed06e9202e8cb7db9bae7b8c82"
-SRC_URI[linux-raw-sys-0.11.0.sha256sum] = "df1d3c3b53da64cf5760482273a98e575c651a67eec7f77df96b5b642de8f039"
-SRC_URI[memchr-2.7.6.sha256sum] = "f52b00d39961fc5b2736ea853c9cc86238e165017a493d1d5c8eac6bdc4cc273"
-SRC_URI[once_cell-1.21.3.sha256sum] = "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
-SRC_URI[proc-macro2-1.0.105.sha256sum] = "535d180e0ecab6268a3e718bb9fd44db66bbbc256257165fc699dadf70d16fe7"
-SRC_URI[quote-1.0.43.sha256sum] = "dc74d9a594b72ae6656596548f56f667211f8a97b3d4c3d467150794690dc40a"
-SRC_URI[r-efi-5.3.0.sha256sum] = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
-SRC_URI[rustix-1.1.3.sha256sum] = "146c9e247ccc180c1f61615433868c99f3de3ae256a30a43b49f67c2d9171f34"
-SRC_URI[rustversion-1.0.22.sha256sum] = "b39cdef0fa800fc44525c84ccb54a029961a8215f9619753635a9c0d2538d46d"
+SRC_URI[linux-raw-sys-0.12.1.sha256sum] = "32a66949e030da00e8c7d4434b251670a91556f4144941d37452769c25d58a53"
+SRC_URI[memchr-2.8.2.sha256sum] = "88904434abc2901f197fe8cc55f0445e7ded921dba5911dad2e2b39b48e663c4"
+SRC_URI[once_cell-1.21.4.sha256sum] = "9f7c3e4beb33f85d45ae3e3a1792185706c8e16d043238c593331cc7cd313b50"
+SRC_URI[proc-macro2-1.0.106.sha256sum] = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
+SRC_URI[quote-1.0.46.sha256sum] = "dfbc457d0c7a0759a614551b11a6409e5951f6c7537be1f1b7682b9ae9230368"
+SRC_URI[r-efi-6.0.0.sha256sum] = "f8dcc9c7d52a811697d2151c701e0d08956f92b0e24136cf4cf27b57a6a0d9bf"
+SRC_URI[rustix-1.1.4.sha256sum] = "b6fe4565b9518b83ef4f91bb47ce29620ca828bd32cb7e408f0062e9930ba190"
+SRC_URI[rustversion-1.0.23.sha256sum] = "cf54715a573b99ac80df0bc206da022bcd442c974952c7b9720069370852e21f"
 SRC_URI[scratch-1.0.9.sha256sum] = "d68f2ec51b097e4c1a75b681a8bec621909b5e91f15bb7b840c4f2f7b01148b2"
 SRC_URI[serde-1.0.228.sha256sum] = "9a8e94ea7f378bd32cbbd37198a4a91436180c5bb472411e48b5ec2e2124ae9e"
 SRC_URI[serde_core-1.0.228.sha256sum] = "41d385c7d4ca58e59fc732af25c3983b67ac852c1a25000afe1175de458b67ad"
 SRC_URI[serde_derive-1.0.228.sha256sum] = "d540f220d3187173da220f885ab66608367b6574e925011a9353e4badda91d79"
-SRC_URI[serde_json-1.0.149.sha256sum] = "83fc039473c5595ace860d8c4fafa220ff474b3fc6bfdb4293327f1a37e94d86"
-SRC_URI[serde_spanned-1.0.4.sha256sum] = "f8bbf91e5a4d6315eee45e704372590b30e260ee83af6639d64557f51b067776"
-SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
+SRC_URI[serde_json-1.0.150.sha256sum] = "e8014e44b4736ed0538adeecded0fce2a272f22dc9578a7eb6b2d9993c74cfb9"
+SRC_URI[serde_spanned-1.1.1.sha256sum] = "6662b5879511e06e8999a8a235d848113e942c9124f211511b16466ee2995f26"
+SRC_URI[shlex-2.0.1.sha256sum] = "f8fadd59c855ef2080decdef8ff161eb6661b86933c9d82e5ba29dc602a55aba"
 SRC_URI[strsim-0.11.1.sha256sum] = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
-SRC_URI[syn-2.0.114.sha256sum] = "d4d107df263a3013ef9b1879b0df87d706ff80f65a86ea879bd9c31f9b307c2a"
+SRC_URI[syn-2.0.118.sha256sum] = "1b9ae57f904213ebb649ce6895b8a66c66f0203b9319718f69a5612a065b1422"
 SRC_URI[target-triple-1.0.0.sha256sum] = "591ef38edfb78ca4771ee32cf494cb8771944bee237a9b91fc9c1424ac4b777b"
-SRC_URI[tempfile-3.24.0.sha256sum] = "655da9c7eb6305c55742045d5a8d2037996d61d8de95806335c7c86ce0f82e9c"
+SRC_URI[tempfile-3.27.0.sha256sum] = "32497e9a4c7b38532efcdebeef879707aa9f794296a4f0244f6f69e9bc8574bd"
 SRC_URI[termcolor-1.4.1.sha256sum] = "06794f8f6c5c898b3275aebefa6b8a1cb24cd2c6c79397ab15774837a0bc5755"
-SRC_URI[toml-0.9.11+spec-1.1.0.sha256sum] = "f3afc9a848309fe1aaffaed6e1546a7a14de1f935dc9d89d32afd9a44bab7c46"
-SRC_URI[toml_datetime-0.7.5+spec-1.1.0.sha256sum] = "92e1cfed4a3038bc5a127e35a2d360f145e1f4b971b551a2ba5fd7aedf7e1347"
-SRC_URI[toml_parser-1.0.6+spec-1.1.0.sha256sum] = "a3198b4b0a8e11f09dd03e133c0280504d0801269e9afa46362ffde1cbeebf44"
-SRC_URI[toml_writer-1.0.6+spec-1.1.0.sha256sum] = "ab16f14aed21ee8bfd8ec22513f7287cd4a91aa92e44edfe2c17ddd004e92607"
-SRC_URI[trybuild-1.0.114.sha256sum] = "3e17e807bff86d2a06b52bca4276746584a78375055b6e45843925ce2802b335"
-SRC_URI[unicode-ident-1.0.22.sha256sum] = "9312f7c4f6ff9069b165498234ce8be658059c6728633667c526e27dc2cf1df5"
+SRC_URI[toml-1.1.2+spec-1.1.0.sha256sum] = "81f3d15e84cbcd896376e6730314d59fb5a87f31e4b038454184435cd57defee"
+SRC_URI[toml_datetime-1.1.1+spec-1.1.0.sha256sum] = "3165f65f62e28e0115a00b2ebdd37eb6f3b641855f9d636d3cd4103767159ad7"
+SRC_URI[toml_parser-1.1.2+spec-1.1.0.sha256sum] = "a2abe9b86193656635d2411dc43050282ca48aa31c2451210f4202550afb7526"
+SRC_URI[toml_writer-1.1.1+spec-1.1.0.sha256sum] = "756daf9b1013ebe47a8776667b466417e2d4c5679d441c26230efd9ef78692db"
+SRC_URI[trybuild-1.0.117.sha256sum] = "0710d4dfbeae4f9c390baa784c49858a7468fa433f3fe5d0ec5ebef651cf59f9"
+SRC_URI[unicode-ident-1.0.24.sha256sum] = "e6e4313cd5fcd3dad5cafa179702e2b244f760991f45397d14d4ebf38247da75"
 SRC_URI[unicode-width-0.2.2.sha256sum] = "b4ac048d71ede7ee76d585517add45da530660ef4390e49b098733c6e897f254"
-SRC_URI[wasip2-1.0.2+wasi-0.2.9.sha256sum] = "9517f9239f02c069db75e65f174b3da828fe5f5b945c4dd26bd25d89c03ebcf5"
 SRC_URI[winapi-util-0.1.11.sha256sum] = "c2a7b1c03c876122aa43f3020e6c3c3ee5c05081c9a00739faf7503aeba10d22"
 SRC_URI[windows-link-0.2.1.sha256sum] = "f0805222e57f7521d6a62e36fa9163bc891acd422f971defe97d64e70d0a4fe5"
 SRC_URI[windows-sys-0.61.2.sha256sum] = "ae137229bcbd6cdf0f7b80a31df61766145077ddf49416a728b02cb3921ff3fc"
-SRC_URI[winnow-0.7.14.sha256sum] = "5a5364e9d77fcdeeaa6062ced926ee3381faa2ee02d3eb83a5c27a8825540829"
-SRC_URI[wit-bindgen-0.51.0.sha256sum] = "d7249219f66ced02969388cf2bb044a09756a083d0fab1e566056b04d9fbcaa5"
-SRC_URI[zmij-1.0.16.sha256sum] = "dfcd145825aace48cff44a8844de64bf75feec3080e0aa5cdbde72961ae51a65"
+SRC_URI[winnow-1.0.3.sha256sum] = "0592e1c9d151f854e6fd382574c3a0855250e1d9b2f99d9281c6e6391af352f1"
+SRC_URI[zmij-1.0.21.sha256sum] = "b8848ee67ecc8aedbaf3e4122217aff892639231befc6a1b58d29fff4c2cabaa"
diff --git a/meta-oe/recipes-devtools/librust-cxx/librust-cxx_1.0.194.bb b/meta-oe/recipes-devtools/librust-cxx/librust-cxx_1.0.197.bb
similarity index 93%
rename from meta-oe/recipes-devtools/librust-cxx/librust-cxx_1.0.194.bb
rename to meta-oe/recipes-devtools/librust-cxx/librust-cxx_1.0.197.bb
index b0d0477..a8c8480 100644
--- a/meta-oe/recipes-devtools/librust-cxx/librust-cxx_1.0.194.bb
+++ b/meta-oe/recipes-devtools/librust-cxx/librust-cxx_1.0.197.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = "crate://crates.io/cxx/${PV};name=cxx"
-SRC_URI[cxx.sha256sum] = "747d8437319e3a2f43d93b341c137927ca70c0f5dabeea7a005a73665e247c7e"
+SRC_URI[cxx.sha256sum] = "00424da159cc5adcb4eeea7e7b5cb1d96df41f5fa695ec596922181bdc36232a"
 
 S = "${CARGO_VENDORING_DIRECTORY}/cxx-${PV}"
 
-- 
2.49.0


