Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 945DBC3ABCC
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 10:23:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.98658.1747218183413029065
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 May 2025 03:23:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7229a12099=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E5wJuS024875
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 May 2025 10:23:02 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46mbcjrvmk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 May 2025 10:23:02 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RjoP5Z2vLZxaXmjpE3Y2moe0oYrj5xtkEUEQyQIMIJFcx5JEOqcPEbcUBz2ZoRo1hDmlI1rt5NtbVP5JPBGRBrDnTKBFNSRe2q+bzlb9AaDEKFWi6IpAj8m1lH9E7qC2DfBODROymyyvi0jFsbV+aXomR4ONa0BdzJId0ez+BJdt2evT5lbT9DndDp1rgg94Kr3kld0qv5mD0eMX5N9T59r75zoW8eAKSqgOFurrF/7JMCoyKMah6qOMxtBx0Q++2jnBfXKima7SF6UoDyvfISixgJoqHTLHjlNkWaSMMuvqdqiUTKGA5v2WomyA+h/5hPuIRD9EvmHanHdZHi7X8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H7CHjvZTnA3+FmSeHU2EPdEjL2GTI/Jc45jdsKiAxJ4=;
 b=x6VYRuBmKyA5zP0oE4X/zcFZGlcYT69h8PIWQIMtzrJX75tGBD9fkYsi4vh5oPzbCZzHfI+1AMwrNIg9GSJYlsnpTLfypK9bhwKb8Q2rA8Bz12nCRPP0Gui2SJI0DpEhlOf7xJkaMU+aqed8xmPQvVnykF+d3bvPxsA2Uh23J6t6QQUsvHKI+Zi96lnKxVPkoUCvtcIEeZcMzwCYJpxnLA3p+0PSXOq6H5DFS8zdEy/EJCh82ahc3SY747OnGVaUevUb4HREY7KWTThYjFTJ1zTm3yVoxBjjitCaaA+aD1E9igc64jHk0HnG3rLP1bHiBH4tzgGfJ0xb8O62wO3XYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by MN0PR11MB6277.namprd11.prod.outlook.com (2603:10b6:208:3c3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Wed, 14 May
 2025 10:22:59 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%7]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 10:22:59 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] iperf3: upgrade 3.16 -> 3.18
Date: Wed, 14 May 2025 18:22:48 +0800
Message-Id: <20250514102248.3233144-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::13) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|MN0PR11MB6277:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fb750ad-94e4-45a9-8ad9-08dd92d14cb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?uMW49unTKNZt1cR2yKqQ0DZldYvmddm4Uw2u9qpIAO3+41jbhKyRug1sujCH?=
 =?us-ascii?Q?mzfKYlUkZgPoBVqXeSIEgyGhJb7svCmsVnKTHkFWjkIZLe5f4AY+HUoj6cr9?=
 =?us-ascii?Q?7m8d7bRNagUbPbvFAORFN/w4nTv/bLLhKbXDgtT+wxQRohomdRFc4VJV9OkO?=
 =?us-ascii?Q?3yuNNGMA9/ym4tB4Gf1ZTk1D1HzJt6B/eQS0xAemxYrcGT1uFQW3eJwpaKaE?=
 =?us-ascii?Q?6Vf/GWOze4Mv25uo3kiFEBBPWPLNg4SDgy/S4cluVTIv2apoH6bwlRkQiOZ8?=
 =?us-ascii?Q?rjvYWi3Wcdn1FAb7UG7LZyshM8gUf7/peEacwNEzIOcouP6goPFFB0qXfPnM?=
 =?us-ascii?Q?P0IGshjF0BC0Eu9VmwQQGFe3siVfsrlkB70ln6o7nofLqzX4rST49gOFaO41?=
 =?us-ascii?Q?sBG8p9Md92fWNYpT123QWvPsHL/SEHdOYnbaIQ3r8o20QZn0NfUAEPE82JB7?=
 =?us-ascii?Q?0JujKwyB+TBWoA5hqH6l1yaYIVSQ/aQ3VocY4CngWcKbj4D2fY03I43biAkb?=
 =?us-ascii?Q?wyH+FOsSr5Gf5qqcJuTuEF9q8BHEFER+oQ+222E8xBxIPjzq+ic8W7CrI1Vf?=
 =?us-ascii?Q?XihG2FNhD8wdPQuwuvLDQy74NQJJVW65rU5PI+bH5253WM2gf5GQeTxZTYCC?=
 =?us-ascii?Q?VAouB5yqiG4u3IeV7VB7sHBw2Q/MFnjzyvU+AVT/mDS23YnRvGgaJsYyaIQH?=
 =?us-ascii?Q?jWHYto81jmc2HGwTEcvHPsNtQqoN+P77uJ3Hf/ahiD28UsnLfYjGzN2YwLjm?=
 =?us-ascii?Q?WfV4B0r0JoKtNmGpkQpZzZctSkhzA1zohrjAxyfKjd33GuQtR5WR8y0OmzGL?=
 =?us-ascii?Q?PhlQV1soQEUmO3LnAtcFvLyu/cleMcyd/ie5C2alvpvJ2IZ4QAv0MFFtDanf?=
 =?us-ascii?Q?vQceQfvinHcMithkpmZHDmOAM1uDHZwVEFGLeCatUYL4hBPB6gA3FfjlEunb?=
 =?us-ascii?Q?SFWqNut+1cPBgktlgWsZ8kx0Z4h5XmT7lfJRAXm6AxZ/Af5cv4HFEunc1ZEG?=
 =?us-ascii?Q?gBIyFKkWarrz4YBeeG6GQ0oFikWWK1ncWs46KSVEcc0CLxA3asAia5XQrKWT?=
 =?us-ascii?Q?QhMQF8c8uWM6S94ADYOfvtXrTjMl7/gL+2Y961Qq7J6dGH0YTKD+ljdbRcbV?=
 =?us-ascii?Q?sTD7PvgCE0sGRfGu/oi4Enguwf4yD9AdPOzYiuNZ2Kx8jwci4xap1C13+af+?=
 =?us-ascii?Q?BS7bgF3eP8mMdgczm5Vw1RnL0Xy+6NJpmS+6qfUQEyGjgXjlNrZ8x6sQuXsL?=
 =?us-ascii?Q?0RMVDaAiB1Z6Vnb4vCE5MhoWpBC4DqDyAPY8n1hV+yXEfl8TpJWVsLmuddLe?=
 =?us-ascii?Q?bYJ1pO+koL6c7F3TiUSX12eqv83jXZutLPluzR3SBvYXOz/EES9DgwhvA1da?=
 =?us-ascii?Q?cThXSckFNGpwTtoY7+GdoG/m4zg6o9MLVx2q3Ba9Q3GFMJGhvislM9ejX+dR?=
 =?us-ascii?Q?YQN0oLDjbFMsgxLhWFZq1DGK0cv0Qa4ae4emcDThMGpRxAmn6OPMKIhuwZ1u?=
 =?us-ascii?Q?gY7Ow+jT8Eme/jw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NK0qZNaHoJuU5TVBPRNX4hqXpN1H00SVSi3WjBDLyZekFNfCGWktLkkKcmvD?=
 =?us-ascii?Q?epyQcxHObvR1JsKcj4eMWj1KroMX5wJprnuZhgCD7algRvB9uAViihoYnKRa?=
 =?us-ascii?Q?3n/O23ul2FJ7utyRWX9qttMg2tTxrQcMrpThEFDnxiyv66/FJmwus8AE8Ey4?=
 =?us-ascii?Q?g7XryxhOW3Wqbqo00eMjB9PJA/Wfxi3yPeZU+UzD+4ENVbPKjO/XMcWGMxSL?=
 =?us-ascii?Q?UilTgX81Gn/CXUmdgxnsUeN/JMu4FO/Dgb9ARnlHxyjOJcZNCD7LHEGJJtrs?=
 =?us-ascii?Q?XW76gNNHbyct0jR4/x85W6+3aSuBGOIBWUGuKl1DTSQHxh/mXLQBXIsr1Hh6?=
 =?us-ascii?Q?0Yr4wM893u7CKyhJ1pTPMj3kkzEoAi6Gkii8bQ6m6YPKkmkkia/1GFtsvu6A?=
 =?us-ascii?Q?kLvo9+hKuSlKGLwlmJrxUwh0sSqMPBOkOpBOH9q86Jk0ucIEoN87WvbpCQOr?=
 =?us-ascii?Q?CDIZH3nsWTnlqtU9iKfdYoy29JRA7yqWhYIleKBaQRavdjTsQcyWg5E1VWpN?=
 =?us-ascii?Q?FXy4vj8l8GCAZaHND0bO5eUmLDInXbJkVfcC4mqU4QRzwpCN6b8JBOCJd+AB?=
 =?us-ascii?Q?JFApDVBl5ZO/ISF8Nj9uQe9J2vNArizHdinlXFqYUiYwV2QdbYtwuN7mSOgb?=
 =?us-ascii?Q?d2NoH0Sl5zGnXWY7ZeQ8aU4VjOZY8+O4QnIidQoQlu+K+Q7w52YSCazyt4CR?=
 =?us-ascii?Q?IZlBbdMgBmqf5eq3f9cfspJddIiM4ZHjIEuYCDeqGM1MyfueGJgiIlm39ug5?=
 =?us-ascii?Q?w9Q8aVDXJQ+HtiehSDo/0+YgaT0LzlhjZvb8wK/i2nLX9q77wvJMAVup76aH?=
 =?us-ascii?Q?hEdgqvN8jGjBB2RI06Oln3LpIkR1/zmgz7ZdlDOj8TL9ub70hH8QGmlOd9qr?=
 =?us-ascii?Q?K73OiI/ik8TGJO969FEmtgfisHhzHimDg1QX254ma/9hCmacBxy22iA1LCZW?=
 =?us-ascii?Q?plP2LzD1vVsNJsa3j4Gcd2h9qDn4N3er7iPyzA+bMx+NaaCPTmw1M5hP7cku?=
 =?us-ascii?Q?7Xm+rvdlTC8ncnNHuCYGlYfK1hzkXDHGQqJs6eRC4u12bfkeJzA+fGJjXH4S?=
 =?us-ascii?Q?KobtmzIafBW4zgEKb65pPBVv1UM1FNM2SJDosfD38y3ZhZmYgiUNdi/0uYVw?=
 =?us-ascii?Q?H1DSUwDKAc5uXRJEDNuI+hhf+z/iJD6qbFdsD1YcGuwMIt+u882duSmHP34n?=
 =?us-ascii?Q?khcdHgs41cHwqhGf6K7ZjrBbQ88uI9Jh79oGub/0LVIPS75M1MpT7E8Oz4VV?=
 =?us-ascii?Q?EiiMBXKQbLxmryVFdLKnh7H/8PiS7R172Im27uOOLmQnxNEMj514PeRzW54R?=
 =?us-ascii?Q?z9HDHzxjc/fcKhCpJEyMaBYUcK5prq2IqE5oXxVsj6JNIXA4zsl6q2a44GJN?=
 =?us-ascii?Q?3b/rQqI6kjDHCXgBorFRW2JPLMgwMNQ5kEN87VRa1oHfGsuP/RsS8rgksiJb?=
 =?us-ascii?Q?1ti7CshM5kMTaagHrOBDlBH9oMPgtfzmwabDlBMu7qHueB/AAZoY+GYTCcAm?=
 =?us-ascii?Q?BpxbJzMe5tAMnWPgEsl/IhkVxW1+4IaCBOzIEmpFRpykYl1hhOsg0pReiqaV?=
 =?us-ascii?Q?NS/Dg9348OyRyIR8wFNQr70/f6WfYLh/OoQMihVsUKnaTfX7WIdx5acdHYap?=
 =?us-ascii?Q?Cw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fb750ad-94e4-45a9-8ad9-08dd92d14cb8
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 10:22:59.1416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZCByIFvvOWFz8tZnWVTEyoixuTBKKV/B0y1gnwakKrFQHRrpnCJ2SBK+xOTVCbONJK8BsAnLEUXSC02Kzc062+aJsxploRx6EkTbmHsIetk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6277
X-Proofpoint-GUID: S15DLIlQxsB0Ujyzlr3EyZmcJq6lm8rx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDA5MCBTYWx0ZWRfX00O45Crufxwx FDwaluVi2hNQ9zYRMJ316Uqe/1bxjstE1GQ6Ga/p9lJlSClI/iV+44/ThDpm6jJac01AQTnoQUV NPz2TiPStpGcEKUkFzUEFcTQgWYkZbvBjBk4+BTVzGTQ4TpQaRRBcNWgjGyAC6SQdaUsbXW73iG
 +D0ypW5NPsY1YddkcFNKGf6Ahj92sA2zG/C7+DIC5CZR0d9Mc4SIGv95Vh9DEvjUNszLNCeStaE X094yThAuzloySFD/UKGivzS1b2h0503xPhmMcwvIUvTro/RLQfwm+8DOlmV/e2LuSTCDEbHROy 9ZGBZ44Ggyp6tdo2HAGBAnYs01wIwqNFSOdXlmH0J/cFBYr918jwcfmcwLKO26XJxk83nr2EO5A
 0bwqUth7ytqgZ9NWYaqPaEyPEd5wJ9cGdgk5bXbECJeqC8iUJEiyLAPMkE11Fe8v2HW+1Zg6
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=68246f06 cx=c_pps a=nskeBUqQUen4dZUz4TdP1w==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=rqkH-l8o8OXepUT4UIwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: S15DLIlQxsB0Ujyzlr3EyZmcJq6lm8rx
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_03,2025-05-14_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 clxscore=1015 mlxscore=0 spamscore=0 phishscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505070000
 definitions=main-2505140090
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 May 2025 10:23:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117415

From: Zhang Peng <peng.zhang1.cn@windriver.com>

License-Update: Copyright year updated to 2024.
Include security update: CVE-2024-26306 and CVE-2024-53580
drop backported patch: do-not-listen-to-old-udp-prot-listener.patch

ChangeLog:
https://github.com/esnet/iperf/releases/tag/3.18
https://github.com/esnet/iperf/releases/tag/3.17.1
https://github.com/esnet/iperf/releases/tag/3.17

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 ...-not-listen-to-old-udp-prot-listener.patch | 30 -------------------
 .../iperf3/{iperf3_3.16.bb => iperf3_3.18.bb} |  7 ++---
 2 files changed, 3 insertions(+), 34 deletions(-)
 delete mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/do-not-listen-to-old-udp-prot-listener.patch
 rename meta-oe/recipes-benchmark/iperf3/{iperf3_3.16.bb => iperf3_3.18.bb} (82%)

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3/do-not-listen-to-old-udp-prot-listener.patch b/meta-oe/recipes-benchmark/iperf3/iperf3/do-not-listen-to-old-udp-prot-listener.patch
deleted file mode 100644
index da1664ddcf..0000000000
--- a/meta-oe/recipes-benchmark/iperf3/iperf3/do-not-listen-to-old-udp-prot-listener.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From ac6b9f7fd335ddebc5212eed40083ef4cd3cb86d Mon Sep 17 00:00:00 2001
-From: David Bar-On <david.cdb004@gmail.com>
-Date: Sun, 2 Jun 2024 11:52:03 +0300
-Subject: [PATCH] Do not listen to old pro_listener
-
-Clear old UDP prot_listener from read_set, as currently the server's select()
-always return when data (that is relevant only to the worker thread) is
-received. This makes the main thread consume a lot of unnecessary CPU, which
-reduces the total throughput - especially when only one stream is used.
-
-In my single machine environment, with the this fix the throughput is
-increased by about 40% for one stream test.
----
-Upstream-Status: Backport [3.18]
-
- src/iperf_udp.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/iperf_udp.c b/src/iperf_udp.c
-index a603236df..40f2b1ca7 100644
---- a/src/iperf_udp.c
-+++ b/src/iperf_udp.c
-@@ -446,6 +446,7 @@ iperf_udp_accept(struct iperf_test *test)
-     /*
-      * Create a new "listening" socket to replace the one we were using before.
-      */
-+    FD_CLR(test->prot_listener, &test->read_set); // No control messages from old listener
-     test->prot_listener = netannounce(test->settings->domain, Pudp, test->bind_address, test->bind_dev, test->server_port);
-     if (test->prot_listener < 0) {
-         i_errno = IESTREAMLISTEN;
diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.16.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
similarity index 82%
rename from meta-oe/recipes-benchmark/iperf3/iperf3_3.16.bb
rename to meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
index a2cb903562..d3bfc93fe1 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.16.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
@@ -10,15 +10,14 @@ SECTION = "console/network"
 BUGTRACKER = "https://github.com/esnet/iperf/issues"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=dc6301c8256ceb8f71c9e3c2ae9096b9"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f9873a72f714e240530e759e103ac7b2"
 
 SRC_URI = "git://github.com/esnet/iperf.git;branch=master;protocol=https \
            file://0002-Remove-pg-from-profile_CFLAGS.patch \
            file://0001-configure.ac-check-for-CPP-prog.patch \
-           file://do-not-listen-to-old-udp-prot-listener.patch \
-           "
+          "
 
-SRCREV = "f9481e1cd35159929458513692e4a8f9fdd1bd6f"
+SRCREV = "2a2984488d6de8f7a2d1f5938e03ca7be57e227c"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


