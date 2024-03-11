Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9950C54E60
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 13:03:30 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.59])
 by mx.groups.io with SMTP id smtpd.web10.62124.1710162209524887594
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Mar 2024 06:03:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=rGvewLKv;
 spf=pass (domain: axis.com, ip: 40.107.7.59, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kNAmCA+vwgqLeSg3i8ODziWwZGqVlB4LBu4CobA3KnqA/MH6P8wm+hb9+/fnYUZesaA0WgOV7OnVco8A2YkuSwXKPnB5xHQGnos2y8s2UcywmmQeXPQWFXJ9R3ydgyveNcn1cV8qHNzzZqSPqkJkW94lQNdNtvQS/enhEGQRp8JTHRgVXdl+lh6lMAfxLfINZfj4znVdsm+/VtsddY550kbTbdxeVUCCNJS2VczYIg62lS6xT6QnFP2d9h1vV+sjqfp5du4TTRbvcnmZiERbOIkMBD98pp1NKngv7qbyfxV1uR9J6w3LudFS0ZgKbyIi6ggPHlylJd7MiVU+0pV46w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8IcX/TMz+WY4L3ZA5qvq/PI1dy6Ozv9WKypyMfz0ckw=;
 b=El2eFQsdtN89pt/v0EldZt9/eYOaK0wYiA3o67bKBDo9F1Ixw4MHlqTfUI/B8GOBLrxAoduNdr+oQLFL8i7XOFu4Y/nF20N6P/BQJcM8EGf+ujNU1JtsoHjYBlRL3lB4LoS8Jov/G8GcwtwJEHxZ5qEAWCgx5t4PR0fqGs3GkRrnOIph19lbQm2wOgCuT7HMDvaLJWOR55NRCex7ZPkTQxPEjKbbwNV17ILGleX++WAr8+cq10w5F3n/jdjZNnBnwTumZJnZa7XksouMKMCKYWxZ+S3f1rXkRNQ+oUY5TKFwWjTB0Hs0JVBwF32kvPXo61OSsBmkJ0yY0L0oct9KFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8IcX/TMz+WY4L3ZA5qvq/PI1dy6Ozv9WKypyMfz0ckw=;
 b=rGvewLKv/J/R1unb9QfsXtitUyq3VtXnSHk5LsXPFIOfJsnTZgBbya1gIHXcEUYmUIRcUjLp3p6iY4KrByCRT4b3cwzdXcYlhQnijKsUOMv6D/6525wp794C7KsAYdZ1m957mgHypc27PKryK69MCVMjHshk43X1a9g+/hvVhyc=
Received: from DBBPR09CA0023.eurprd09.prod.outlook.com (2603:10a6:10:c0::35)
 by DBBPR02MB10771.eurprd02.prod.outlook.com (2603:10a6:10:53a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.33; Mon, 11 Mar
 2024 13:03:26 +0000
Received: from DU6PEPF0000A7E0.eurprd02.prod.outlook.com
 (2603:10a6:10:c0:cafe::2a) by DBBPR09CA0023.outlook.office365.com
 (2603:10a6:10:c0::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35 via Frontend
 Transport; Mon, 11 Mar 2024 13:03:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 DU6PEPF0000A7E0.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7386.12 via Frontend Transport; Mon, 11 Mar 2024 13:03:26 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 11 Mar
 2024 14:03:25 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 11 Mar 2024 14:03:25 +0100
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 8A538161AD
	for <openembedded-devel@lists.openembedded.org>; Mon, 11 Mar 2024 14:03:25 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.17.1/8.15.2) with ESMTPS id 42BD3PsZ1867723
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 11 Mar 2024 14:03:25 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 42BD3P2p1867722
	for openembedded-devel@lists.openembedded.org; Mon, 11 Mar 2024 14:03:25 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 2/2] abseil-cpp: Split so-files into separate packages
Date: Mon, 11 Mar 2024 14:03:22 +0100
Message-ID: <20240311130322.1867704-2-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240311130322.1867704-1-pkj@axis.com>
References: <20240311130322.1867704-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E0:EE_|DBBPR02MB10771:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a395314-59a1-4882-c7c0-08dc41cba3de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BlG+9wBrhoTc4HYPjVn/Opg80BJ7h3EVG0y2JE3i7BJzsyh+55pzWyJ2Il7Mwd+73YTYet3+KzPYJFhlZXfQ2IQjDU0aoqIj09PKJF8nOhosUsJm+KEWBGj+uMR90QpzS/OJIlLfPfhogiGJ+wFflOVVBhuP6DhZhBI9aX8IO7RAtW+5xXUGia/r6RKVBXGQ8XxgMV4J9qZni6yzNVj1tzoKZ0RBs1Qb/wahdwzTjdY6y1eNhNcbMx2o7YHCit2Opj/V5Gx/2TWzk5baH0qDO73kghgh51wrmgap0T1zKQjvZf/ywlUhrICPsDBdh3LGy3rT8Ke4ju3bGxDkjtLrXf5bFE9jDHi4V9H9/dM5F7J4EPP4YeRyQ0+Bw/jxg12YXZYK+A13H7srF1Khvg3FS66zvsq6I+0OzrqxgBXqImWAc+MEX+OZdN9rbBh8nMFsmF4SlgKvCFeqizxcRHO9ocyJc67hrIbFu/FKLq+Lcidxd9UVOx6GoyVWmRqycWbNnw2KTy9CkQKiUKzE7zXPxrLgDCQ+TaFn02WjOp9TCLten7+BX+ZBiyvcVTsliCWn7o6i/IKQhskoanXsu4FiTQbDWerKImu1xYR1E4m3COThXiV8vMA6tj/efaJ7W17Yd8PqnWF4RJyc4Afs4/gfIXJugpX5lqO60YdQBfIGSjK9TWSd+fgPw7QhW+D351x6TFV9c0qk5qZnTrDOVlo6QGsKi/wlSqgtpYW4ob4U5qt9gKh5YRZ2jXttBiM1TzW7
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(1800799015)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 13:03:26.2439
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a395314-59a1-4882-c7c0-08dc41cba3de
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7E0.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR02MB10771
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Mar 2024 13:03:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109269

From: Ola x Nilsson <olani@axis.com>

Use PACKAGES_DYNAMIC and PACKAGESPLITFUNCS to put each shared object
into its own package named libabsl-*.
The shared objects depend on each other which means you still get a
lot of them if you link against a single one.

The main package abseil-cpp RDEPENDS on all of the libabsl-* packages.

Signed-off-by: Ola x Nilsson <olani@axis.com>
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../abseil-cpp/abseil-cpp_20240116.1.bb       | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.1.bb b=
/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.1.bb
index 9cb325870..e6c65d306 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.1.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.1.bb
@@ -27,4 +27,27 @@ EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON \
=20
 SYSROOT_DIRS:append:class-nativesdk:mingw32 =3D " ${bindir}"
=20
+PACKAGES_DYNAMIC =3D "^libabsl-*"
+PACKAGES_DYNAMIC:class-native =3D ""
+
+PACKAGESPLITFUNCS =3D+ "split_dynamic_packages"
+
+python split_dynamic_packages() {
+    libdir =3D d.getVar('libdir')
+
+    libpackages =3D do_split_packages(
+        d,
+        root=3Dlibdir,
+        file_regex=3Dr'^libabsl_(.*)\.so\..*$',
+        output_pattern=3D'libabsl-%s',
+        description=3D"abseil shared library %s",
+        prepend=3DTrue,
+        extra_depends=3D'',
+    )
+    if libpackages:
+        d.appendVar('RDEPENDS:' + d.getVar('PN'), ' ' + ' '.join(libpackag=
es))
+}
+
+ALLOW_EMPTY:${PN} =3D "1"
+
 BBCLASSEXTEND =3D "native nativesdk"

