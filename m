Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40076C369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 16:20:16 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.58])
 by mx.groups.io with SMTP id smtpd.web10.2093.1745511609523628897
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Apr 2025 09:20:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=rHwEEu0l;
 spf=pass (domain: axis.com, ip: 40.107.20.58, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hdAXg864pRekLS9w3HjPElcbVy8oSlIwbk4gcVHqGdvhSLl2xfsWB9KzyVN3Z//1UCbSny0804U3nqDfZGFaaGFuvCEY7+iUz1tNs0vPcalkvt2rwbIXfKqRAOk70r6CQZJFnytB4C0YrIi/eoTvtxBJybgMPXaX9Y6FRic6Z9OAFNSnQ7oOZ/3tI7YUWZk+qvKkRtMYqB+WVklEJrfSAXLxTp54MBPCVm1MOHKqRUWJABKA7sdiQ5w5OCqVKl8bw1ybV/Fw9tLj8aWUcFz0EYot7mUWjrf5FZfYECj/o/VMxZVLcdOlFNn005Dl0VB2zQDZMjWOoXuKLGpnJN9eAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yOV328eguMo75sidb6I9zNWF5c2xrERVWbvChCexHfU=;
 b=N7y82NnuA2ill+wdVvZU3Cp8XXyocJ8pdBk37PaLMs9QTcKqL+k6uLGAwovboy+Q0KoVYVZkJFXhjcHiVmPgt87hYpUQACRaTtfS75ojj5/qcqnN7HEWubDlPT1wCAFqNthVHQ2Iq6xtYV+LCmxhoRzlAUlwYlmucOTDKC5YqJDgxfsKjTNnoDx5sjDxa+Mtns80Mn+h8TptYsPnsd5kPrGa5dAsqX6rfEXuBZ4S3eQQXr7k7FyRg8kbaTGjNTgSho1hSGdbzENdswvI92+zjKS8q/jqcE4F3/cVAITgzatTAHFlWJ+uLaj90oenW6rCsLCWX8oetzeS1NgKgoGU9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOV328eguMo75sidb6I9zNWF5c2xrERVWbvChCexHfU=;
 b=rHwEEu0lhJzIl6SaAcamRCJh1E2s2+C0EPjxaElY154J8G4HKvwVUwENxPuvdytNqsKkXrVAwabTsuiODOoBjq4tPQ4P9uu2yODs+iF1B889n/RbBPhGE4zMjFOQd936EeZXdgy2WMromJGpMryk6jhdk3jfnJ0IJQsyRg7Vy98=
Received: from AM6P192CA0080.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::21)
 by AM9PR02MB6596.eurprd02.prod.outlook.com (2603:10a6:20b:2d2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.10; Thu, 24 Apr
 2025 16:20:05 +0000
Received: from AM2PEPF0001C70C.eurprd05.prod.outlook.com
 (2603:10a6:209:8d:cafe::6e) by AM6P192CA0080.outlook.office365.com
 (2603:10a6:209:8d::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Thu,
 24 Apr 2025 16:20:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM2PEPF0001C70C.mail.protection.outlook.com (10.167.16.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 24 Apr 2025 16:20:05 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 24 Apr
 2025 18:20:04 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Thu, 24 Apr 2025 18:20:04 +0200
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 402A0286
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Apr 2025 18:20:04 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 53OGK4071476577
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Apr 2025 18:20:04 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 53OGK3hK1476576
	for openembedded-devel@lists.openembedded.org; Thu, 24 Apr 2025 18:20:03 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] uutils-coreutils: Simplify configuration of selinux support
Date: Thu, 24 Apr 2025 18:19:59 +0200
Message-ID: <20250424161959.1476547-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C70C:EE_|AM9PR02MB6596:EE_
X-MS-Office365-Filtering-Correlation-Id: 13ff3ad3-e163-477f-2a6c-08dd834bdfd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?bx2KcYiFZsqnb57FPacM4CmPM6sf+Y/VvFBGcMf/qXtIp9yQlkTV5F3tT+Vt?=
 =?us-ascii?Q?J/QHr8Z3B4SHOKo7hCItZ45siS8qUdVXTiu1Wc+JwG7gOK1NSlfphgoE5xPU?=
 =?us-ascii?Q?QCpmu+NMZKQOccEyQwvAkbEAkljZEK0CZhIGOWma4BA2BRY5QklbYIdZ2Kte?=
 =?us-ascii?Q?Xt+BN5MU5qs0Z0S2eALU3hkArdHNtyrnf10xKxzwQoLNqzt0Ew0FQdWMfM7p?=
 =?us-ascii?Q?b0IIJIr1vNJUITRrJ/eZT8d4yeTu6lVA0fjbAgsYEax/MJaW7GNPeM5oL270?=
 =?us-ascii?Q?GLCc/WymFagajtA1ff+4Em0f5tlD1H9qwhRH9XarILoUP3t6PuOjcoxurxou?=
 =?us-ascii?Q?1R/YEFm9b5i/cjkhrPalm3ZgR83YEfBicQHnsFiWZLOeMF4b72HRaTadD+KX?=
 =?us-ascii?Q?Vg1xMWn9Uu3tK4z/OJWjrteDIB30Oew07w3eJUtsvZctl0LcDdoir1N4g0zX?=
 =?us-ascii?Q?oa+jtN0xuNKa7aeiD2TAkw+4gmWOUQ1ybFOdHyrS4CroQGgCU6lhIQtxvxX+?=
 =?us-ascii?Q?LDBXOUUUNqpBJ0hYIq7E3N2Pw5xPKySVQopu7gXm621FT8aQkMd4UDjOoUZH?=
 =?us-ascii?Q?NgQKo+1Cz+571WKWHyxxum/TlKbkEodZJzbrI8+r+oGobSnQEAi9GnC0XvDz?=
 =?us-ascii?Q?0xiuZC6rv/ZWy318QfQX4DhW46WIiJsrqBCcMRocookv8ErDq92x6cXjOT9b?=
 =?us-ascii?Q?vjo+1PkXEZmoQXx//aHKODKR3tAD+rXvdWMhOmXPjPUYS5OcGkIEeJuvz2gq?=
 =?us-ascii?Q?j+UncIz+Mx73Uc1wqMUOP3pyIuLRCTTI1z41ZDut1yqlO5h4H4P2YRgNjWl0?=
 =?us-ascii?Q?VtT6e0oKzouFvZAu19vF5jJApsux4CWc4fLes2VAyiZIQi25kYadi4bccqz4?=
 =?us-ascii?Q?Dgfha2ywR+qNhrhgRabxIErCxb81CrytkQA76mKXzSbwqO3H6BBAnlb5j1Im?=
 =?us-ascii?Q?tvvo5+GJYnaGgxSJJUAaH3amuY2DWPWkcUv/xolRWm67ES+jTVP09wV8mt8H?=
 =?us-ascii?Q?Yb6HvDjiW3fTjkyXqxt0Hox1yUUgdai46dZXxBIEvcVmSe6JdheDcAioYJuy?=
 =?us-ascii?Q?ItWWSAAGuAt1/xMzQPd+1wX8TvELA+u6n1wAJbaXynWw6uEI4pIAgftiG8Mh?=
 =?us-ascii?Q?z4soIUFSzM2jIHcmnI7lrXcHt/HHV4EjfxzUb7ca3yTOhza7UEV5rJwHf7mH?=
 =?us-ascii?Q?czruDsWtMgllcnMQYp3e5wYqW88s4TWug8pHqCtrVHdhtd1lsen5JXYN7iRn?=
 =?us-ascii?Q?q6vab+Mh+F6/lk9DD7RDgZKBh8I9+zDC1obze/7B0YjkASXBaFBxEh1GUYrQ?=
 =?us-ascii?Q?BrdLA+8tnlvpNAoDWbJvRhr/HVmfxdy60/3lxRGOTPwh1LLX6oiaY2Df5rG1?=
 =?us-ascii?Q?mp6SZCqNeVwLTs1pLrzxhhwSVdRuKYr8DciUykiokPw/flWgLp9yGVhsJmuS?=
 =?us-ascii?Q?rbTrEpCZiBxiubtulktgSH2p1PZLsBR572CZ5Bk9a/UrUmQMudSm8iJuw+dE?=
 =?us-ascii?Q?XqRq6FaMQSvYRobyAL19+vKDmBQ23oPQyg3d?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 16:20:05.6757
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13ff3ad3-e163-477f-2a6c-08dd834bdfd0
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C70C.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB6596
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Apr 2025 16:20:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117099

Also correct a comment.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../uutils-coreutils/uutils-coreutils_0.0.30.bb           | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.30.=
bb b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.30.bb
index cc4be305d1..f209ea1778 100644
--- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.30.bb
+++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.30.bb
@@ -23,17 +23,13 @@ PROVIDES =3D "coreutils"
 RPROVIDES:${PN} =3D "coreutils"
=20
 PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)}"
-
-PACKAGECONFIG[selinux] =3D ",,libselinux"
+PACKAGECONFIG[selinux] =3D "--features feat_selinux,,clang-native libselin=
ux-native libselinux"
=20
 CARGO_BUILD_FLAGS +=3D "--features unix"
-CARGO_BUILD_FLAGS +=3D "${@bb.utils.contains('PACKAGECONFIG', 'selinux', '=
--features feat_selinux', '', d)}"
-
-DEPENDS +=3D "${@bb.utils.contains('PACKAGECONFIG', 'selinux', 'clang-nati=
ve libselinux-native', '', d)}"
=20
 # The code which follows is strongly inspired from the GNU coreutils bitba=
ke recipe:
=20
-# [ df mktemp nice printenv base64 gets a special treatment and is not inc=
luded in this
+# df mktemp nice printenv base32 base64 get a special treatment and are no=
t included in this
 bindir_progs =3D "[ arch basename cksum comm csplit cut dir dircolors dirn=
ame du \
                 env expand expr factor fmt fold groups head hostid id inst=
all \
                 join link logname md5sum mkfifo nl nohup nproc od paste pa=
thchk \

