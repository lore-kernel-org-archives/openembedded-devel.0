Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9504C109025C
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 17:10:03 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1296.1773940195747189260
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Mar 2026 10:09:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@de.bosch.com header.s=selector2 header.b=QDqY8Orn;
 spf=pass (domain: de.bosch.com, ip: 52.101.66.32, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M+kNUISN5uO2M0vemoNZdYISuF5wo0leNBjzluC4jT5ACGkM1oKyHHvr28fTqRDjCqRxtBObfNT0We5R26LrvaQQWQmYaxkvg5AyMNTJjz625A558PSTUM4nYOqCamqFigDojJJIb6qvqvSs9uRiA/7TL6kNGss0jPRAuQ/KJFYqMjIXpj5ijxIBWTl+87hMpcgjDWii3HO2r8mgus63PF63CBybrga+m8YRt3Lr0SF54glSMTa57KU+Uj+xfe1dgTDHGrvI8DaXaox51OW+ZoQqbZgwPNxMvt59goZrfUbjMpEYal6ETLo/f5hqbrDz00itIIjG0dRS9gW2Nu9txw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=21KWitCuHLraMNswK2e27KqKelq7obX4JIi68F53K48=;
 b=cTUxhCH7hNevBTxlTB+eMZ6fPKSTiz3fEIiAlBjWLG5OyslKlw2yqYQeQFAxCb1v8Op4279wP8UClwWGajSHxZParCcrJwhj8TMevpbhaRFZbdVSSqoKQVU3UM+XyAqXvxwe7lA9z/mv1ierN8i31deNNhp+vH1IbwdLHRfJ2Fk+wIyqqY1OxM4d4bC1wvQ6PGm+1w5oalPjJ0KpjHIlY3/f0Ul2ihUAAJJgVrvfC0GYIlssIfl8cuv1s7qOfr3TYPotY72UbdJilVaE4Pq8rKX2zofJF9f9QD2H1WrLe6kfXubBaqIPAWdGVqmZqN8kZ42dG8UGWXClYK3ZCaWU0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=21KWitCuHLraMNswK2e27KqKelq7obX4JIi68F53K48=;
 b=QDqY8Ornob0aaLThblQxZJR2NFi3zFzg28H9KVQbEAgvBmIuaeWM832waaQiScg08QKjCzcipDeEK87Kjft4uo0EmSbf5VeSI5s1BbBFvVkyhbPxSqlcCShRa4MM/LEnQ5BFOZ7+vkwsEtP9wrriiB4Vt+QU+07Yo3NM5uvvDN+dPrC1KEFAPYkkA17MIjJ+fSIYtqewjwyg5PdxRwD4xGnVLyI/k0DJmwtd2duzcl8RonRhZymGoUbiknMeXuPXT7p4EyPbn+ZDZAJEHnf1lCGMsZdPmrg1XQHjpopoDg+yYYciBbrrGr3HDomGgj9T3FZyWBBBpwmp2EIB1Wuqkw==
Received: from DU7P195CA0028.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::28)
 by AS8PR10MB7352.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:614::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.18; Thu, 19 Mar
 2026 17:09:51 +0000
Received: from DB3PEPF0000885D.eurprd02.prod.outlook.com
 (2603:10a6:10:54d:cafe::7a) by DU7P195CA0028.outlook.office365.com
 (2603:10a6:10:54d::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Thu,
 19 Mar 2026 17:09:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 DB3PEPF0000885D.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 17:09:51 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
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
Subject: [meta-networking][PATCH 2/2] phytool: Update to latest
Date: Thu, 19 Mar 2026 18:09:03 +0100
Message-ID: <20260319170903.1447-3-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260319170903.1447-1-mark.jonas@de.bosch.com>
References: <20260319170903.1447-1-mark.jonas@de.bosch.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.22.70.204]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885D:EE_|AS8PR10MB7352:EE_
X-MS-Office365-Filtering-Correlation-Id: 90caa953-da9b-45e8-62d1-08de85da557d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	rRR3a4f1R6b9m3n6i09U5DrURtY9oFvfx4h7CaN/t2aXHjaedLR2xafBjQRuFjxCG6W71fLOC3iJOcIhyS+a8td9e2Pes2QwqQR3TfsAVQvdo2ZOBQgyV2MZdtP6qqpMBBCs7WAtMY7D/2vP75KBu22gvE+Y5p05eNjqaNpCZGUs/zi4Bq+XjzfUCv7uCGKI3XmBytUGFmz+nZ8BGL0IskYgdxl3jdQfRUWsa+8V1FKRBdymOhFfrvD+H03hZApdVl30ctiMRirNPJ7SK5AhKFiCsXTY7Wx23+YPIiO5CUtcLp5WBDQy7OywxZlxPRpZ3nE6aQX9nppEbK8Lo2clN/W83yNgE2nweDHhIINNvJvXIyZ8yrviBDZkss0OcLNZKKAlWVxbiEugct9gz08NADC7L547IdBmSLZGqi2So+U0R5wMs/3xYRyf8TxEgBHXPKGS2w1j7E08QerGZj0LZXUIV5Ak3qls0vx7G5QSV0qYVpogvF4oU5bV8c798nZOKyZH1i0T+nYTmIvEDMyEl/deREdgtPE7/esxy8IML2RN+D3GTIm/GE+fJfl7VRkLKywwpn/TN/6JAidXnao3QWoPZJzH0OPua87ANojvmu9e4JOJLRkCO29+kAyYCOaipUEQGhKiLIBxvn5GJzR6yasRAxK0HVhCr0+Bnr69MytqPHDyzBjfEX44xVzmKXBw6M2VacjRLIDTmo/bmE/ZXcDKEmRWJ71lpzw1dXF0Nw52nScwXdLgk0TLIKqJEE9GCZOzv3nDKTLt/wWemYltUA==
X-Forefront-Antispam-Report: 
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Dk8WxzRVMNLYO1qVB9mzKuT/c7v3aPuIBYDMDne+h2FTr4JoqRm+pqXnRCvbE3Hx4R8qKxGwaKKjrPsfyq8z8WdV/2iChKnu1jbQlXUHkA39wA7qj99UKC/94WvmZooAsOLWRvPbdsL0spMXnge0K5qPiToxyYZviMgx51wVZkGaHEv4dZkj07Aafp1d40+UK8MEwge1Cs9psyBGY31BJc1JApS0n21ZFWvBEs+u5GDA32wU1HMsG6e6yca/4kEAta68MMbdASDI3gXIUQlQE4et2DSqovXgrKCZyA1aWW+vssOs2sPIRmhUyExfGDuq8UZKTumwcSKWKxV9drJc1FY4HmsDTk8uAQWuNeapQoPhtrAw6LwEuzo56gH68CVoRkR3WRRlxfiOgepM1ICq39asoMRswRxI8gSapUMpFcXevzR9IxdWISucZn3RIb8Z
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 17:09:51.5828
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90caa953-da9b-45e8-62d1-08de85da557d
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF0000885D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7352
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 17:10:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125407

From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>

Changelog:
- Add man pages and adjust Makefile for man pages
- Avoid %#x printf pattern

Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
---
 meta-networking/recipes-support/phytool/phytool_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/phytool/phytool_git.bb b/meta-=
networking/recipes-support/phytool/phytool_git.bb
index 8a141358e7..35d11f8516 100644
--- a/meta-networking/recipes-support/phytool/phytool_git.bb
+++ b/meta-networking/recipes-support/phytool/phytool_git.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D39bba7d2cf0ba103=
6f2a6e2be52fe3f0"
=20
 PV =3D "2+git"
 SRC_URI =3D "git://github.com/wkz/phytool.git;branch=3Dmaster;protocol=3Dh=
ttps"
-SRCREV =3D "8882328c08ba2efb13c049812098f1d0cb8adf0c"
+SRCREV =3D "bcf23b0261aa9f352ee4b944e30e3482158640a4"
=20
 # The Makefile has "$PREFIX/bin" hardcoded into it, hence not using $bindi=
r here
 do_install() {
--=20
2.34.1


