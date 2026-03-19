Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF0121075270
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 17:10:03 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1297.1773940198872045899
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Mar 2026 10:09:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@de.bosch.com header.s=selector2 header.b=AIjiVqsP;
 spf=pass (domain: de.bosch.com, ip: 52.101.69.51, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YP3PlWA4UIshCVUGKy/ugdSm48ztzAe5p/taur9GbsHGMnVDN4R1+muMZvwdObzFM8QVJHFUjIiDUDfGWjT4c8BV9tfs1XIZozzzMLthN4caru4hlyxHwG5u2PbxMOypVaXs6TLI19OSSF7g0RmHMFt6ezFN68pByhYAlquzwO9iMsyj9Dty/AAsv6418uByC6jY1qOrgSzHFi+f2ZKQ/iSMpwiDWWnDUyr2EzmasCNdQT8qm4ijRjmdG5kpjKyQqN8ZRV1oCCErhna1onHksyYHMoG+phf6u48Z0BoXDxEIh4TKeKnTPtKfLMjFV5Kof6+IRrU78+VbqEEwI5ja3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cYke+TuAQLMCZPGr+4OeklPJj5yuwWfQHif4lryzC2I=;
 b=UGBrd5wsTaZJI8ghiE5ejEoYiEaWOoZ1i85YoHxpj2/+n5+/qAqPJgKx2jYxSNBFx5wfpDPx2nU/a4/6dqmlOOOkPZQknNQA29YsAGLX3wejdhzzs0cx9SGU0+vJRW9o1iLTqcZ/L1YsEX3QbaJikHJmjkB5J+1bjaorJ8+EFRdgEp+2EgfWxjTdk9f3s9XwKd33rV40ePitioxehXkqV/cMf9AjcqV+VsKPnpYshX8DOAHakZ6fOwhbHcOEGEIbPZvePIe98RFXUG4MJrgZbKPngI9d+wHg6Yvam23HDFqONBYnn+f2n4iFpwjR/e6OIk1/mCTK8+h8GQqDo4iRzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cYke+TuAQLMCZPGr+4OeklPJj5yuwWfQHif4lryzC2I=;
 b=AIjiVqsP2H90UR3I+qywNiFiycA0kY/eDUUNsuCc+okJ1D+bBP9zuPVrGzdJJWsPTKHCwja3XmqebAF8i1wPZ7/SRRYIWnynb69tSiW4IEkpLGaRgP2oqjpNcbzIwcVLCVO6kKtMKyo05bX32Po0BO5k9yHH/YJuaY3PAzM7DElMb1hO0PXWFacA8rQDi7acYbn63ud1tZ3zxhoE0zyQ29qkwaPyOXuMUVe1+jpd2wfGcrl4OTvZHxcpzURg5OvKchXUoSYX43SptXbeAySLukLyPj4VFFlt5bcp8lc7AuHxcUlXOLU8BOeLe9TGItHkv1+ejXoZWW8flRTUHkzWbQ==
Received: from AM9P195CA0019.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::24)
 by DU0PR10MB5631.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:319::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 17:09:53 +0000
Received: from AMS1EPF00000040.eurprd04.prod.outlook.com
 (2603:10a6:20b:21f:cafe::b9) by AM9P195CA0019.outlook.office365.com
 (2603:10a6:20b:21f::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Thu,
 19 Mar 2026 17:09:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 AMS1EPF00000040.mail.protection.outlook.com (10.167.16.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 17:09:53 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 19 Mar
 2026 18:09:50 +0100
Received: from GRB-C-0009M.ot.de.bosch.com (10.22.70.204) by
 smtp.app.bosch.com (10.124.11.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 19 Mar 2026 18:09:50 +0100
From: <mark.jonas@de.bosch.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Khem Raj <raj.khem@gmail.com>, <mark.jonas@de.bosch.com>,
	<ricardo.simoes@pt.bosch.com>
Subject: [meta-networking][PATCH 1/2] phytool: Refactor recipe
Date: Thu, 19 Mar 2026 18:09:02 +0100
Message-ID: <20260319170903.1447-2-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260319170903.1447-1-mark.jonas@de.bosch.com>
References: <20260319170903.1447-1-mark.jonas@de.bosch.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.22.70.204]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000040:EE_|DU0PR10MB5631:EE_
X-MS-Office365-Filtering-Correlation-Id: a58e6869-71e7-4dd6-1b36-08de85da5690
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|56012099003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	l9rQAvw4hI/6VGoFZeYrqL7iO98tVK9YuVrO4WFgd0ynBxPYKHtHpFFvAUltsJXDDG7mJzmkaCzoBF9I9XMgjpcMfkqI2vj2suTrfc/BTVlb+fbma0iLrfZyUVCR04cnyp1dygPfWJMWSUM2rYHzJM8KU7m7j4nRdRY8vrFkxv9SALhISovpZz2nkM70gTVOR0KUQwFrZYSUb1Mv2u6OyVERLuDxO/Ld7SacbIQdj5WbmwP1+15ZZMIgcsBl0ipYBwGSWHTqooRsorXW1GLwd4riAG76jUvvOOuPVzNf8iiSJ9oE4N9ZR0LWmMI7sCAwqe9Qv4+/5hHyHXM9zj703Kqi2nrYXcrHy4DuGy7att4Rl2Qa4yFbwOMEDPQcY4Zit99Ib2vi0mH9Bxich6128OWDRDQi39o/7xNLfEPCK4ZlrSYf2LANwlSpWLO1lk0pnL2S4lNA103YHqEwSel4nyLHjwaFPB2UFRqPRbNdrDTlz6BXFO3zYXhTc5ni3wUnYlgO9TUbONz4XsHtz/xuFxFTyI/83JKxFBa8OpoVNnThsJGEtHkKFffB4oeI47HlTuHi0aOiw4LpM1CJYpzlj5K++W+46jBkPGbWnkLiaiMNMegxe9aMKFEKgYHNPlIKvTIkSJERA9GMUBl/amE7Sc3p/pFrj8a+IxsAB2XTETP6mVOPgD0Wnn7TNJZecuzQDewqXLEAKMsLsship7rP11BpQrah4ZhMGX2teRU+KP4=
X-Forefront-Antispam-Report: 
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	n/XDShbiQGaObSdjdQwGhgdVvkQCnIBuf0E/8c7yrLDeCT9u7wZBXVmeRRcAdUgqAvzRyajth5e5iQ9VfPzKQVZpQ4LzOWj7ABnqELaXmfux1YwkZUuYjJ80ZL8pxJSlA7fA4vQGgYg3gbPju2UfsJpOqdfcga5bsVDpnXZ5cLRhL85lMBAcvnTi9QgnMu5NWkCWiNEoqyNmtCRulAzBaCV34+nengm16DqMkWgwav2zM9zq0pKcU5DKBI5FvVQsWiEpkfXe0ztL0i6r7Z6NgnXqbORiqwel/TxNe6Tcw7UjrLlIeAdwf5mF2LOG1zHSlp34xGE9OQWOeILQbzSdvi6HcnU0g3xDjsi7hxELv6xjlxu2w8FtIk/t4jSX7nFLle7WVmy2yHPhgOxAId8bVpMkGIoTBNxQeYTu0YVQsZqrV6G/2HdKE2bE5uAmTqs/
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 17:09:53.4025
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a58e6869-71e7-4dd6-1b36-08de85da5690
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5631
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 17:10:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125409

From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>

This commit fixes a few issues with the phytool recipe:
- Missing "_git" suffix in the recipe name, as required by [1];
- Missing description, homepage, and bugtracker metadata [2]';
- Missing section metadata, which is improved package management [3];
- As defined by [4], the SRCREV should be defined after the SRC_URI.

[1] https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html=
#recipe-naming-conventions
[2] https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html=
#required-variables
[3] https://docs.yoctoproject.org/ref-manual/variables.html#term-SECTION
[4] https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html=
#recipe-ordering

Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
---
 .../phytool/{phytool.bb =3D> phytool_git.bb}                | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/phytool/{phytool.bb =3D> phytool_gi=
t.bb} (71%)

diff --git a/meta-networking/recipes-support/phytool/phytool.bb b/meta-netw=
orking/recipes-support/phytool/phytool_git.bb
similarity index 71%
rename from meta-networking/recipes-support/phytool/phytool.bb
rename to meta-networking/recipes-support/phytool/phytool_git.bb
index 6471f46c28..8a141358e7 100644
--- a/meta-networking/recipes-support/phytool/phytool.bb
+++ b/meta-networking/recipes-support/phytool/phytool_git.bb
@@ -1,11 +1,15 @@
 SUMMARY =3D "PHY interface tool for Linux"
+DESCRIPTION =3D "A tool to read and write PHY registers on Linux."
+HOMEPAGE =3D "https://github.com/wkz/phytool"
+BUGTRACKER =3D "https://github.com/wkz/phytool/issues"
+SECTION =3D "console/network"
+
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D39bba7d2cf0ba1036f2a6e2be52fe3f=
0"
=20
 PV =3D "2+git"
-SRCREV =3D "8882328c08ba2efb13c049812098f1d0cb8adf0c"
 SRC_URI =3D "git://github.com/wkz/phytool.git;branch=3Dmaster;protocol=3Dh=
ttps"
-
+SRCREV =3D "8882328c08ba2efb13c049812098f1d0cb8adf0c"
=20
 # The Makefile has "$PREFIX/bin" hardcoded into it, hence not using $bindi=
r here
 do_install() {
--=20
2.34.1


