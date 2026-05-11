Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87589CD37BE
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 14:22:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.51430.1778509323073066445
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 May 2026 07:22:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=I/WuNg00;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=95919e6e32=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B4RAe81047920
	for <openembedded-devel@lists.openembedded.org>; Mon, 11 May 2026 07:22:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=fF+FqqAy4deOqC8pXq0D
	4UEgQV2wLugWIzhOgncMHug=; b=I/WuNg00iKRJfq3V+v4OFYicGzi91uUh01cz
	N7GYN2H2FvP3TBifO+cm6hY8Q9U+t2URf5lRe+h9Z5EuT5PO7kb5opelLcxnzbmL
	Ox77n7b8bGP6m2ikFuXovcbHZMEi1HRqyzft1BP7wOJsJzkRDcyM1/aKl3dStMFO
	WPo9y1KWIF9gs89L82ObHkaKz0qjqg0C91tzxAkxny3CPzIz307tpcoKanbuCrKj
	yRnt518KPuzCyPfgodiMt2Esev2KCFQBcs9CCn6VIKgLgX0/hGwha/TVEX6gkrcV
	9Sb3iIjhcH2rf+JWQimgzz9McadM9xLOWPP0YkkiojVjtcLJEA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011054.outbound.protection.outlook.com [52.101.57.54])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e24ee9s2m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 11 May 2026 07:22:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RnOQM5aZQqmlVN/kQ1iz47sLlhL8YHBLp1TkRn2uNZnv55PEAJFb6XOMrfCZjbCBY2hxOFFBQpdaET+PBvQwzllBJ0ZgCV+HY2PGYI2DCY4weWPtPEukGiQD2rFCf7pHjazStJ2JCIFxlGi9li4XTopmeEX84ViG9E2R1uRKZP7vVqVh0XBvmJ2RYfO80zBf95y5XThG1hrt4t2ppvqsEQrGAvm/fgvV7y3nwV3OmrTRurhIvjrZ15o1K0YsOgA7bFMoHVYHkg2QGZePXHuXKsBULeR439yR/NQhlyALxTyuG+0/cbG2XvE/GrvZQKAQQNOU79eKMysQm4Pm1R9TOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fF+FqqAy4deOqC8pXq0D4UEgQV2wLugWIzhOgncMHug=;
 b=Uu10WDtaG4CA+1chrzbhdJDgeEhpT1aNnlFdszqTo9xlOu4pZ05nIQKESxp7lcLJYX9Huji7vEqHwJXXjtRdWCoZ6s5KY6LBLICa3FrqLQfeuibNdxCKSBBSo5bjidRmZ0/RTCRjgOCe/SmmpVdYsGWTW0/aYk3PFSn9bhaOTWfCePCK6bg1IC+d8rscWTSMT6ZG4MCZnQhKrIZwz6qwlZy6MpPM+USApt280/b6uj2AdaFtaglx7ZtZkWAQ+t4wD/huIdysqqpeC+fW9WaMdPzc7SLvnLzuHvT2se6YdqrC5reyD8fv6oQzFZsT7X2xRm4GzZ1ElLtOLJYdQ/1hQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA1PR11MB6396.namprd11.prod.outlook.com (2603:10b6:208:3ab::10)
 by SA1PR11MB6566.namprd11.prod.outlook.com (2603:10b6:806:251::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 14:21:59 +0000
Received: from IA1PR11MB6396.namprd11.prod.outlook.com
 ([fe80::73cc:6f62:3c66:cef4]) by IA1PR11MB6396.namprd11.prod.outlook.com
 ([fe80::73cc:6f62:3c66:cef4%6]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 14:21:59 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] nftables: improve reproducibility
Date: Mon, 11 May 2026 22:21:42 +0800
Message-Id: <20260511142142.3620917-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::19) To IA1PR11MB6396.namprd11.prod.outlook.com
 (2603:10b6:208:3ab::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6396:EE_|SA1PR11MB6566:EE_
X-MS-Office365-Filtering-Correlation-Id: 333762dc-5575-48e7-bf32-08deaf68a98c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014|3023799003|11063799003|56012099003|12006099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	bVWXUMyecRhaB1Gnrn/ZwoaGtJbTKmsX/VOH2oi5lIMaWyS5HJVjW3bZQwGLrQVR9TJH/mb7d8CBKAzn3Hb/D34/0l2Unocb1xnFg8/LUCF8ilkB/z3b4XBKMFIn0RT67O+gWoVASs7TCQoaRy7hndVF06epaOKnZFBGzEDUx1P1luSDZT8fLUBO1NQj8TEYpmVZSjfFtyds0fq+1Qo+xbR6Ut6rTdYvSWo4cX7Xd5lu8LQsJHW4Gv4vaF72o72+ahg+5gYx5gZ9vllD30sUG/Uok/x1dkfVHZTeqsoqMEk/fiJ3WnZqUpfh1OJd19leqguxQEcIHQg78CJXbxBbhw6j+Wd9PPUuUK7s2NkOF9CX9RJn3Xk0X0p0/70268Lgw47uFRU3j8RavwnQhG0s/uNhQSj4PGFuQTGZFZlykDNXK9Sz0Czaej5lehEkzT6m79Mq6mSkwnd8V1kYcRpsB/KYLfn17/YZhTefWOYm4jVsLissHFZjMyixbzqp2LpMPc5egzaPkw6LdVXba84ZqnCUZD8UyaO97EQ+WwUOqD6uas6dkU2zkQ5JodZ7gerq3R3pLe634Cff1Wuz+qbLgd5Yz1q+yF8SjJsSc8OTZgn4fiAatWwfmsopj+imNtUPh81NGfNj1apX/Q9oII4/tBFbemWTcx/FbagGabkf4CcgNZmg1Bjf97fqYscSzOIK8cXYLLVboO+Z7Ign+Dfpig==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6396.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014)(3023799003)(11063799003)(56012099003)(12006099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8ao2/2zbgDSpmTSCQGY2kRcvfyChTheEaW4tfIzq46L2V7Lw+y/wRcHkugE+?=
 =?us-ascii?Q?og9uMA60iUbjmvyTWIwMeP9Vf64Z0rSWsStTBR0sp+rTTXJe4ZBOTBdX7W2T?=
 =?us-ascii?Q?aL7f8xpmSikqSfWjLbtp4/0CbOzZy+P+3KQeDbnznaqCHlsoNMaY7g7at5hv?=
 =?us-ascii?Q?tDLFBNk7QcA5eAv8DpNUA+GcIWuQx4L1KNUx1ofz1SUjQGkooeQZfCy9Y8JD?=
 =?us-ascii?Q?O4VuBd9PdVdnpgFy78B+F79m+tZ32UlOykWsQ7g/xIrFNqB2un0uBxuU4hqe?=
 =?us-ascii?Q?RuRWKa82TsKPgY0ixdf64kfsrbOQ1NBcTqJ+ZLN5yBSpFCg4jL3/Vsj1oRbX?=
 =?us-ascii?Q?sfK48EN//nHl3U57kpK5r3b5r8pt7HiZp0ny3RWHf3kirI1iWdMjLXo/63DS?=
 =?us-ascii?Q?az6L8y4y6VIDNYioqyEm6U5Jrx+D0Qv7FSLyq3RmZzUmcrBrfnRBED6FQ2e2?=
 =?us-ascii?Q?E2hL6ZZcWh94Sr/65BJK6wSG3jswPTRqTOt199jyf95V/EOVbjUno8TfLEPr?=
 =?us-ascii?Q?OHTgP05MH9te0w0b+WTXNWSYfjxQ4bRW+rCpfxtKyqtgA0LV6IrTMekI40BB?=
 =?us-ascii?Q?Rzw2D5LYFwEFeOOVqn6mg7hZ9gzdFpeAHIiOmKLs10GbqklyZD0qmVYS2cfq?=
 =?us-ascii?Q?r1ypxThaFJQsuQDdOHO7TiRmF8nB6JgHLM57arrs3nVXJnRZIoKJLACOIplo?=
 =?us-ascii?Q?edrljTTr6Y0cQy/AC8F7yjJN3DV4qLOZ8c8pkmDY3Z7CVe1ocW1ANMFvY4du?=
 =?us-ascii?Q?w+SA93mk30PrthXyLXpRam9YH3eEVhpCaT6pd0wJwDepcziT4j0gMMWkRqw3?=
 =?us-ascii?Q?N8IFRkbjwdxLhGIFjHtt6uN7B0Rp5rEReuzSvh9CgeNEeKp6nPauD+9+zmlv?=
 =?us-ascii?Q?oJwEkf3K30eZBVRcK+eKnRGluwpXJlMZBw22Tpaz3HImK/oeUBhuThJ10w7i?=
 =?us-ascii?Q?96WQgeUc/uUfCPmHDzHZbcSLocNbyxSjNJNO9QLx14AfNPj8wTYl22lWKvVA?=
 =?us-ascii?Q?tNmAxst/nAfOZp29ptWtw+WU7aeUdYeOXGej5kr7MfzXzGROcmhH0Ml+TGHR?=
 =?us-ascii?Q?6QjsoIolMRL/QajgMVR2pmrunIn6NIXh05zex2BW5AMeE2pu1J10WwbJI+li?=
 =?us-ascii?Q?0UbCrEh9DkrbfplroMm0cbMN1v+6EV8hEpxnYwz4bcJr/7h+AygdDLDZTd1G?=
 =?us-ascii?Q?a8Qx21L7yzda4aU9JlRbw/8t1lbm1vg8t/+LSb9XWTdMZ42jP4PED0Fe1qg3?=
 =?us-ascii?Q?sq6Ob3ksRdXC6YCCaFKEL47+0NSHdHyIM3Dq/8yADjW93WUc4WadjAbcp1vZ?=
 =?us-ascii?Q?T8+c7RTTca+RVlQP8TRf19RLrN7wuVxQadNH96HDjMkzGITgIQ30tJ6PZQPM?=
 =?us-ascii?Q?1KIzGwCTKJy2Rnwcsi2T1eF2Y8eUQmdLZ/1wCIe5YijIFNxNUDU/uW0k7rui?=
 =?us-ascii?Q?jNa8MobAyThdabKqsHVTAOJu9DsO273ycGNEbR/Lv/BkN7B6jSAiSuckBdqg?=
 =?us-ascii?Q?l6urdfJn3jG8iEEHUsmFbR0hOi/IJ/9kHe2pceZt58G7nJsWCOzSh/Ls9dz2?=
 =?us-ascii?Q?+5FfdHmLNKEqQ80p58oI42c28TZRkOPFmE/sTlkHfiwr/tzssd+m7k6WyQRH?=
 =?us-ascii?Q?qKW5ca2FDITCy8+G5jxlI/Nckj3v2+r33yf0jfmPpTy+TLxX5vp+et/Df9R9?=
 =?us-ascii?Q?sMSBczA87nEOr0BYDkLjBVdAzcrrbdbcFwfZ2AxcJtnjbRJxeUPJ2AGLUtOy?=
 =?us-ascii?Q?5OLS5ZYzgw=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	CJl7sj8qWKi3QpNPn7f/4fe/+o8aUWT7W1HXKhsEesjYviya5sKDTMtsSLLSEZBAZXm4QosNWD8b1LX/JwV3b6AJfRETQCGDOc+PHe/2v6MwE5LJHOHZT6F5FwwOsAHFR3MzON97PoVIJ9eIrkAw0CZ/dj+UoWMQqEvDmgePQlmABnYaaL5bzAqYSO4VwcnhzlWguPaQ7nS3Qro4L67LtGLeOzTWQA76uh34anaXKZZ86glPWSUFJ7Bgu1Sux48+lyAOgTQBpPESvBGEgekHQr/eZs6PFjE7+ZDGPYEoZSKGs+elY4Zn0rjr5WOjOluxZl1WiozVg8F++4S3FrUNzw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 333762dc-5575-48e7-bf32-08deaf68a98c
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6396.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 14:21:59.1731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2/zMsJYQubgmbm9+atDAW2/6BrdgqUKaA2LQa9WyzXred9Zwz8Ve3CyHQM0IhLsqwGUUZBGbXTVhYRKvgZt6pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6566
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE1OSBTYWx0ZWRfX8i1ei5DcSBLL
 c1WWGav5tk1LDHRO7jC7mTCz8ugCIZB6Ilmbw+cm1e30BpXSpsHjpt9Rs2ENlHagpqy3SfMe/VP
 rTFRvSeKTsShA1zl8Ouf+9xdxN4XEcUIifidGRxOGazBFHDDyo5vt72gQm/C7dXgrgbaPurCwDI
 MUAH19pj6hnT1EMUZALEjv708MpAypOM1O9CsSMCVywV1C5oT87NMJI55o0rLoWN1BSIikqbVDw
 TvEOqxfNnZ7qsMH1ijvFQe8I/rm1sLfFfRD05yUovp7u/OjqKMLzkRsZXChW26LnDrLCHAieiBO
 19vXcP8YAJsTLQwNeDwZEuAxbhtIcGRBRbwK2SyhoNmiEnm0bnazQxuoGDh+bUwza2lnGS+o2Yc
 WzbuKUIYaOIQzDuginmnYQYuQf+OskmNC55UPyYIhtgU3RYTx0bFcEv8jj1kE2R79ncRVgWroX+
 fO8AKqYUcEEStoiDTwQ==
X-Authority-Analysis: v=2.4 cv=H/TrBeYi c=1 sm=1 tr=0 ts=6a01e60a cx=c_pps
 a=F7X/6K5kN+zqVHn88SdM/A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=3HDBlxybAAAA:8
 a=t7CeM3EgAAAA:8 a=wiZxmMvrDVwaU2Wp8JcA:9 a=laEoCiVfU_Unz3mSdgXN:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: IV1DGg1rLtK0-O234Ros-ztX-CRdhaDI
X-Proofpoint-ORIG-GUID: IV1DGg1rLtK0-O234Ros-ztX-CRdhaDI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_04,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110159
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 May 2026 14:22:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126850

Use SOURCE_DATE_EPOCH to set MAKE_STAMP instead of using the current
time, thereby improving reproducibility.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...-set-MAKE_STAMP-to-SOURCE_DATE_EPOCH.patch | 34 +++++++++++++++++++
 .../recipes-filter/nftables/nftables_1.1.6.bb |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-networking/recipes-filter/nftables/nftables/0001-configure.ac-set-MAKE_STAMP-to-SOURCE_DATE_EPOCH.patch

diff --git a/meta-networking/recipes-filter/nftables/nftables/0001-configure.ac-set-MAKE_STAMP-to-SOURCE_DATE_EPOCH.patch b/meta-networking/recipes-filter/nftables/nftables/0001-configure.ac-set-MAKE_STAMP-to-SOURCE_DATE_EPOCH.patch
new file mode 100644
index 0000000000..7d2f9c0dfe
--- /dev/null
+++ b/meta-networking/recipes-filter/nftables/nftables/0001-configure.ac-set-MAKE_STAMP-to-SOURCE_DATE_EPOCH.patch
@@ -0,0 +1,34 @@
+From 77de073b1cc7413b1d230995851338345d56a8f8 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Mon, 11 May 2026 15:52:29 +0800
+Subject: [PATCH] configure.ac: set MAKE_STAMP to SOURCE_DATE_EPOCH
+
+If SOURCE_DATE_EPOCH is set, use it to set MAKE_STAMP instead of the
+current time.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ configure.ac | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 6825474..2b147af 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -165,7 +165,10 @@ AC_CONFIG_COMMANDS([nftversion.h], [
+ ])
+ # Current date should be fetched exactly once per build,
+ # so have 'make' call date and pass the value to every 'gcc' call
+-AC_SUBST([MAKE_STAMP], ["\$(shell date +%s)"])
++AS_IF([test -n "$SOURCE_DATE_EPOCH"],
++	[MAKE_STAMP="$SOURCE_DATE_EPOCH"],
++	[MAKE_STAMP='$(shell date +%s)'])
++AC_SUBST([MAKE_STAMP])
+ 
+ AC_ARG_ENABLE([distcheck],
+ 	      AS_HELP_STRING([--enable-distcheck], [Build for distcheck]),
+-- 
+2.34.1
+
diff --git a/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb b/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
index d27e60a18d..5ab31f9b0c 100644
--- a/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
@@ -12,6 +12,7 @@ DEPENDS = "libmnl libnftnl bison-native \
            ${@bb.utils.contains('PACKAGECONFIG', 'mini-gmp', '', 'gmp', d)}"
 
 SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.xz \
+           file://0001-configure.ac-set-MAKE_STAMP-to-SOURCE_DATE_EPOCH.patch \
            file://run-ptest \
           "
 SRC_URI[sha256sum] = "372931bda8556b310636a2f9020adc710f9bab66f47efe0ce90bff800ac2530c"
-- 
2.34.1


