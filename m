Return-Path: <nicolas.marguet@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14DFBC3DA61
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 17:04:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.184.1692291854166431533
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Aug 2023 10:04:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Oz4HcHmX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75933f71e7=nicolas.marguet@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37H6rZ2D018901
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 10:04:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=3L1bAwAjgCv3eX55BWBzgFpPNW7Mw/uUn/jTzaRDLvQ=; b=
	Oz4HcHmX8N1hYPc7OvDY7Pf5hY1j3DY9IFJlRIXoLOY8wZsOLERm/xrXfFvIB7a/
	GKwIOvMNfqDEQByj8bVQnK8zy7y1+RMxgdCBAkJtt4RW0PjXI0NKvE8XPJeRvVNP
	v7jqkVkVtCCYLHj/MWgr7bEtoRH0ZwFteowZSnTzpcrSJLu1wpu3tfRtZWXYelAz
	VRwjlff5rq/Q8TbCkRWCD4tI08QJwph0m1MPax/O5p90Qfm5+/2rWJmZ/DcsyGBr
	wShhsB/d9ypSp8UQK1f5ajy6yjFRVbAhwdP1SA6jxEczZhse3mnH4cCFAkTNR7Aw
	L5TrUZERs6iMVF10X5TC/g==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sg0rrjuh6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 10:04:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nOeoselh6GusHjfV5MhrgvoL7b30qBnOkebzTOpFX9Dh95J0dOyWKrh4j3jWAaiPZy+1F2w3kSoTj5HuFkW5SyxhGcWNJnuPJVhy+tgOe9pnivQVcjEXKb6wn0gQMFXsUrzGSilJ31DqhBFAbowlzmZSVaV+luGFSVwz/Jh/yCRMd3Us/wHEglWCBQ5q29UjgnJzZrXmD2OU7QWTNU4MS+teBY84k3mCj82/dQ/HOvF5XmIxm1XUmq08NxaGL/Wx7MCGUFAeRpI2F/H0pD1oRaXirMLHst2bC6K15Tztoiik5ltgwBkeVR2WbqkXBqTut7IyhS7HMCKTPZeOB5iRMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3L1bAwAjgCv3eX55BWBzgFpPNW7Mw/uUn/jTzaRDLvQ=;
 b=iORbPq2LC+JtuDqGB6XRLNFIGBUxxoWWJXT0gDO8FC4cLDi/E/S2E8NY0WET9MDEl8tCM1FVbppLpzO+bj60U0EE4nrgqs2J2MH+poOkgodENYEQNLdwnXB21u3Zj/GWBn1k/izoJsjF4dPjM2YSZWx43uiVnTgVjDB2wMmAV/udGkhpi+p+8NQ79yEmfS5PVgsjQaj/J6pzW7NeSZVZDYoiF1bYydgGKFBViwGxsG3pUvMCnY1366f6ytUECSQekBs+xLHkVrmxYbZFq17LEpGYCiJV71pdXAI27iZzU7AkEBJz+ZNlsz2/yshKO3REu58VgAjy+L2cFw4TS5+lJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6701.namprd11.prod.outlook.com (2603:10b6:806:26b::11)
 by LV3PR11MB8460.namprd11.prod.outlook.com (2603:10b6:408:1b4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Thu, 17 Aug
 2023 17:04:11 +0000
Received: from SN7PR11MB6701.namprd11.prod.outlook.com
 ([fe80::6a71:c066:db13:7c91]) by SN7PR11MB6701.namprd11.prod.outlook.com
 ([fe80::6a71:c066:db13:7c91%7]) with mapi id 15.20.6678.025; Thu, 17 Aug 2023
 17:04:11 +0000
From: nicolas.marguet@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] librelp: Fix function prototypes in tests
Date: Thu, 17 Aug 2023 10:03:43 -0700
Message-Id: <20230817170343.3597778-2-nicolas.marguet@windriver.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230817170343.3597778-1-nicolas.marguet@windriver.com>
References: <20230817170343.3597778-1-nicolas.marguet@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR13CA0017.namprd13.prod.outlook.com
 (2603:10b6:a03:180::30) To SN7PR11MB6701.namprd11.prod.outlook.com
 (2603:10b6:806:26b::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6701:EE_|LV3PR11MB8460:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ea0673e-75b3-43b8-8747-08db9f43fa72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IuPMSGEUkvjrxwyBLe0jLLjjbrz7vnnfMEUXi9QzlWiyTfHLsjD2KotjvkiUj3uzUxT2CqjSK8m8Z+kE8woaqDSBpW862tqcmL2WjU+a4jne5vCHVZn0fbYs/MYK0ivMTz06wBtCG6LxfrAK/emWixTyifJVGtyjqkR3PhBTO1u9s0h9us7KuM0NM5nweXJw4tkEgXIgOXvOceuRTG0NKg6HMVzk/ME2ScZ55B/M7QISduXUnu9VsBY12ooRe0wkaIItgp/SJuHZX/iOv786HCyOzoaa6nRCmEwEn+hOm/K5dWhRI3tNc3YopaeFiDCjfeSnrpSywBD//vwQi4vRTw8WJvoQXZlf3CooXvWEXbBBOS0xuBIH98yEzLRqBTaR6jU+2DSiAoeku2pZ6QeZTNX4YVICvcNRJqmciN2EP2BP68kGhj8GtEb58ouxa0VYLpxI4LqLxKgAXqnl4TYwnBAZLlkyDoD/mVsXGVDlnkuUt8tY/mL6eelu+oqrAuWNs/M5ABIZTP3A2mfN+7XxIrami0HcazpoQwy3M2W33RRQMJkwBVGm39GU6t4dw2GEUyuEMDRTpAxB/6Wq3IV4FJatDD0sWpwBI+ZMBAu/79A=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6701.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(376002)(136003)(366004)(39850400004)(451199024)(186009)(1800799009)(316002)(66946007)(66476007)(66556008)(6916009)(5660300002)(41300700001)(38100700002)(38350700002)(8676002)(8936002)(26005)(2906002)(83380400001)(478600001)(86362001)(9686003)(6512007)(52116002)(6666004)(36756003)(6506007)(1076003)(6486002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZtjFSvwxsVGZ/CkgL0pQ+ODmwSMV2Y1Qswa4vukl6pzKz1DFRK2x73bqO5gg?=
 =?us-ascii?Q?1CjPdq0NabsR2Kt6m85Lo+exjg+NJuk2Y8qak5s6shsuFYphNzmQwAca62XC?=
 =?us-ascii?Q?RJWxUJW0B9lbDBsC5ipBQDW8xmlYd7MIHgjeMdrcDa/ZrBb4dByaV9kNKamw?=
 =?us-ascii?Q?Iz8aLAGmg6UhnIeWNIjcReAfgt/18AYvWhTdYpEDsIVoYimVYSQJ30T729BV?=
 =?us-ascii?Q?D4NPMVataoU3XM09qQyKD9RZomZW5RHPYOMD43GfPD5b1v0AR5FzSYbKNWyq?=
 =?us-ascii?Q?d0RMagpLqoRQpQ0aYw7PT4g65O+1FCtrdsYfXISFFRs02HkLcvuLflEkuMm0?=
 =?us-ascii?Q?dVZ4RH0If5zWa587mDtK29HYodcZLqWB8ihtI4r/L9nzaGlyVdTrLlIdyMu2?=
 =?us-ascii?Q?qeQYISRxpovEHRbbR6mzHdYXjsu8XwfaOjuhUR1bHASvojtah3P1VXGk2VMm?=
 =?us-ascii?Q?b/OwxrPPrZgArueQRB6Eme/1HUwSdmZPb/pGG3qAd4ggHbf96B2WI7/mBDr8?=
 =?us-ascii?Q?X/ftNTrF2k6hZkpLptoDtf4K0MS9co53tda8NCju4fnrJsKvOqfpKupgK/BL?=
 =?us-ascii?Q?MiOma+XlNdCDZPt68TE3QNgrXf0AMPHlBfBadT+V7fGnNVpMJPdU9U1I4hVF?=
 =?us-ascii?Q?PxR8Y+uLwwm9ruDJCW7+PoXkLDABtFjclCeVnKL3wiek47q9Bikl4gtTfo2p?=
 =?us-ascii?Q?0pnjFe6LSTMayGb7wXYq4Fvh32Qg6B7XXBib94UEu2zpCRoZNcaj9jJBXNuk?=
 =?us-ascii?Q?VUByjhDGMpf/FYQ1jMjyelxVzmFvGqHU6VLFUJhFMjzaskCqyfYjr7E9LIkR?=
 =?us-ascii?Q?qFNRi2NQHiGad0hLW09dIdFIza97XVrfNrWe/cEzjVYOLmC9Tl+kPsHx4JFt?=
 =?us-ascii?Q?tWFnVaMEmt6iz5uFv9vuaWb1HIpRah70mOHit9R892yx0Q3ZMQKHTKrhpsNG?=
 =?us-ascii?Q?yVsnSO0damCZ3X9ib02o4hhvUtKT4uFzRVKZM/mISif3V8q6muyJUalF6SL4?=
 =?us-ascii?Q?E8RBJ5HLWjfyIOCq7VETaNmJF5wDNJbl6isoIXHcGb36hzx10lFThDAp1f5A?=
 =?us-ascii?Q?DUWwXu0PIZE5aJzh3ZHwMYs8g285bo/UbDipr5lIL4SpwFfVZ09XWbuDzIVA?=
 =?us-ascii?Q?VL7bdL/cM0YrUGTihvUmYBF6UTinBkbYmL5E0+Dp+phEKZZUAhDK38LiSMWq?=
 =?us-ascii?Q?Locntrzw+JoYD53GANc5lGMyLe71IzMNQkpx3YQowAnGdvozbOMPXmD2N8qj?=
 =?us-ascii?Q?I3ds8rsSWB4Z9daAn2Jv8txJKBmxKmRoofF/8e5PNQ0Rv6+/9SHDyldzg/vJ?=
 =?us-ascii?Q?7pO0KfqCe9tgn2jUR/moeePHKtCsaRF3rr3zfZPh/juMayNKdRbsPME9uZlw?=
 =?us-ascii?Q?tGGVQe5divndBTeNp6lMIAHbHF3yMWMMhc3vOKcbiC8Ay4YVuVQIGQfNyqsB?=
 =?us-ascii?Q?yFRE/SolcH0goI0c4V4L0OyHXZ8CPc8ZhobaQxqNu1MQI8QFIOZHugD5mCuu?=
 =?us-ascii?Q?VKKErLCy0lcHkVt7f8gemLlruc0h29IbDmA6AWLzFPfPyzP0V3927r5gz5I4?=
 =?us-ascii?Q?qmtAY74OafmeRQUJjROSdRgrkWncxE7MHHN6/x+RERrShZvLBnXSx+09K0VS?=
 =?us-ascii?Q?hFZCgpkdXXymAwVV6Js5uOI=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ea0673e-75b3-43b8-8747-08db9f43fa72
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6701.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 17:04:11.7778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LT38jdgMrXWC1RxwDywXS/gQ2bQSchxbjeaA/rLdlxRUSLyJ4bPoOkTjfsVzpU8C736uzRe8kOhhAxZ9YQAt1yb/jgJN5N9WIeRIVxmzWDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8460
X-Proofpoint-ORIG-GUID: Nz-e_ZiUQcO0kM_k0b0Hck1pN2ZiylQp
X-Proofpoint-GUID: Nz-e_ZiUQcO0kM_k0b0Hck1pN2ZiylQp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-17_12,2023-08-17_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308170153
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 17:04:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104474

From: Khem Raj <raj.khem@gmail.com>

Helps fix issues found with clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Nicolas Marguet <nicolas.marguet@windriver.com>
---
 .../0001-tests-Fix-callback-prototype.patch   | 49 +++++++++++++++++++
 .../rsyslog/librelp_1.11.0.bb                 |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta-oe/recipes-extended/rsyslog/librelp/0001-tests-Fix-callback-prototype.patch

diff --git a/meta-oe/recipes-extended/rsyslog/librelp/0001-tests-Fix-callback-prototype.patch b/meta-oe/recipes-extended/rsyslog/librelp/0001-tests-Fix-callback-prototype.patch
new file mode 100644
index 000000000..ba081926e
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/librelp/0001-tests-Fix-callback-prototype.patch
@@ -0,0 +1,49 @@
+From 2a7e26510cf9276b7e640ca8282cc1c5e46075d0 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 15 Aug 2023 11:59:40 -0700
+Subject: [PATCH] tests: Fix callback prototype
+
+clang errors about it
+
+| ../../git/tests/receive.c:71:34: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
+|    71 | hdlr_enable(int sig, void (*hdlr)())
+|       |                                  ^
+|       |                                   void
+| 1 error generated.
+
+Upstream-Status: Submitted [https://github.com/rsyslog/librelp/pull/260]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/receive.c | 2 +-
+ tests/send.c    | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tests/receive.c b/tests/receive.c
+index f376cb4..c12e911 100644
+--- a/tests/receive.c
++++ b/tests/receive.c
+@@ -68,7 +68,7 @@ doSleep(int iSeconds, const int iuSeconds)
+ }
+ 
+ static void
+-hdlr_enable(int sig, void (*hdlr)())
++hdlr_enable(int sig, void (*hdlr)(const int))
+ {
+ 	struct sigaction sigAct;
+ 	memset(&sigAct, 0, sizeof (sigAct));
+diff --git a/tests/send.c b/tests/send.c
+index d7e90f0..1b1df4f 100644
+--- a/tests/send.c
++++ b/tests/send.c
+@@ -57,7 +57,7 @@ struct usrdata { /* used for testing user pointer pass-back */
+ struct usrdata *userdata = NULL;
+ 
+ static void
+-hdlr_enable(int sig, void (*hdlr)())
++hdlr_enable(int sig, void (*hdlr)(const int))
+ {
+ 	struct sigaction sigAct;
+ 	memset(&sigAct, 0, sizeof (sigAct));
+-- 
+2.41.0
+
diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb b/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
index cbbc31b7d..eebfece3f 100644
--- a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
@@ -8,6 +8,7 @@ DEPENDS = "gmp nettle libidn zlib gnutls openssl"
 
 SRC_URI = "git://github.com/rsyslog/librelp.git;protocol=https;branch=stable \
            file://0001-Fix-function-inline-errors-in-debug-optimization-Og.patch \
+           file://0001-tests-Fix-callback-prototype.patch \
            file://run-ptest \
 "
 
-- 
2.39.0


