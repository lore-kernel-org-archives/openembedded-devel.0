Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2FCA1090257
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 17:10:03 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.8])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1273.1773940195962648320
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Mar 2026 10:09:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@de.bosch.com header.s=selector2 header.b=o0AVxos3;
 spf=pass (domain: de.bosch.com, ip: 40.107.159.8, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xzEikYhwlTiN3ODzH+QlAGLlWw4RGXH3LkXpDJw5FyzgEHCQ9A1Tf++kQdEEdbZQA2WOPuXXpUYK87kgwlkUaJZ7xwxrJtQhheFXqPDv8XJUXfPZGnjDfckZlZUJChuW2haPI9v3cjym03la3yVxa/e4wyXpFi+3Gr917+iXXEEvRAPxKhSur6eCHUPTIsn2s39az7n7ZeFk9xT2jSOAdl5iMv/6NxyXJchQUjbofAA0Yf87AOsE8bl72SmrEZOTnIR94o++vJ4T2ZwBWDCHGvxbDWgeT8mZynb/VAhy7tMjF+VMrNFwI5eotNcZ7hrpNkO7l6CPuXcBKS3h5NSjyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IP2UMbeW7Q/A2KsuVNz0eCbXJoXXrbU75nLPTZPIGdY=;
 b=r6zr93bfwt00cG2xZTDRXwJWTZhLOfcMj1lh8aFYBdTIrG4ARSmn9yg8GX1/5OY92vHV4fM2LJxgw816PEPIOQri21GVMpEkxFYIumwme3aWMhuJhFYYZK04+0MMr6XT67LAmwXwoHQyyy+s/kUKLfZZMjzqNgC1CCNdZIvUW7EW1faNhg2FEFdhY7/a+LsTPgex/IBjg/gmN+RgtBMi+qfSWYJL/iXeXDdc8HhAZZlQo6K8Va5J3FH3djFi00uDn1Kx46Vt1TMr9eRFBgoY9CCyeKUp02kfri/un3KSglJC9pst5ML2LuEKjAchIFNqrwUCsRf/piLA5EjVmNJEMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IP2UMbeW7Q/A2KsuVNz0eCbXJoXXrbU75nLPTZPIGdY=;
 b=o0AVxos3UzPAIlWqUO7g4AOL3kMJ5Sx+DS7bjMV5s36AZdDn/1PW/YFMYUL5Uje7PaVBIzgMYmd1607LqJl8fM8h5CK0szn133NaUBUFYc5rOxQTLjjQXH0Fpu+jCb19EhGqv22tj7Z/Mf0hBOtrjRFF3mMCgMYF6YykY0zmgR2nMo+rhNpC5X9FokPwh9Pb5vuTPjgzzDjFlSsW35VMG2d8pD/2txJn0yjehOh0WqPcAeXwMrzqP3pesnPXJZMSW8zcB8zDt4ExztTsdin2g9IGRmR8eqVma/HAGxYLomLLaJ2PituP5Ei3linvFdz9lzz3/X1htvGiyh39kdzJbQ==
Received: from DU7P195CA0008.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::35)
 by VE1PR10MB3888.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:164::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 17:09:51 +0000
Received: from DB3PEPF0000885D.eurprd02.prod.outlook.com
 (2603:10a6:10:54d:cafe::2) by DU7P195CA0008.outlook.office365.com
 (2603:10a6:10:54d::35) with Microsoft SMTP Server (version=TLS1_3,
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
 15.2.2562.37; Thu, 19 Mar 2026 18:09:49 +0100
From: <mark.jonas@de.bosch.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Khem Raj <raj.khem@gmail.com>, <mark.jonas@de.bosch.com>,
	<ricardo.simoes@pt.bosch.com>
Subject: [meta-networking][PATCH 0/2] phytool: Update version and refactor
Date: Thu, 19 Mar 2026 18:09:01 +0100
Message-ID: <20260319170903.1447-1-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.22.70.204]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885D:EE_|VE1PR10MB3888:EE_
X-MS-Office365-Filtering-Correlation-Id: 343e9fdc-b1fb-41fa-dbfb-08de85da552e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	O5fOgbU0DDMuvfec04t3Bks1OOS8Mfe732ct4u19LWwze2tEUdXVof8Mh98+2Dx3Yv+hzbDBxnHbcyOWSnEtKxNWo9TbvOEjPxN3Kn2tAmZratUvGSsUHchKec/oFHB7usXWbdoKLzcglCJZHK1mVzePTLFgFaBBvsR3Kzz5MgATL/4bw0Lged+Q/erh15cmS1WzeJob26K45tw+TfIlxxIU58FYLLStgxHCxqrjCh4wkRd8n/OxTMb0hGfb91kH/EmmhXXECXftbkcUtsz1c4pdmrKjeK4gHkBukHBwRDvII9zreOn32bJKnZbrS/riK2BFltPm1eg9saFslL9hDn1yYqZ996S2/3iy06r+CvkwVAuxkUlzQEcgoLzhHmlZ3CH2u53t51V/nuGO9NfVCqKFfrb2Jpv6/MNO0lSCzt1+tgdCgEuRLo/8SYs02LSld8GigKudUCov2BrMbrCvuJZjJeH335+HGN97v03HX6BrQY8rqt7PeVoYydcfoyi/br1iTS44k1CVar5K3Pu4GWApeKZPKQiDI3dJIRnSldwBgH1JXLZv6xcfHbC+tsnBsStm52qO8y0RDqXPeikuJ/mz3OgoOHyss8ZbTWI0/vN9D9i7m6zNDn1YSp8HNZ4zmt0FNt/hrG9KXJAr4T1cZcFoqsu14cKPImQJUhxNJcoEXd2uVURw6R2W5saHtlNxWIbeiVgxbG4h3Ihjw3IJ5FX5aNOYv7xGiuBEPzcZTyOjZMvr0MwMbx1TlU8w5Pk+KZWkEgZQhQa9V1Lni6qp3A==
X-Forefront-Antispam-Report: 
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	W1F6OnTEetuJR3gBnmdQH+hxqwIvZh1o74bKQXSnLwV2QKJVyZmfsWGs5i6VcTmcbr3RXniPQAJQ+5VqPziTFZ2o67p8Zom2VFTNUWhTnr4xml5LCfLgS9n4t+RcoCthk3lKafSuR2xazhmY9zpvCOT3CT5VdpjigMUGcH2qJIIAhvz5kmYfuvAk8dzKgpe5YvOYACjMk0OU4vPH9txu9314W3hrajbghHbNscm1d5nsjRg27XVb5jRpm70toRdI9EVAidVXRbyXw32Vx1aQUIDc3bzugYXlMyw61UaYsiW5Xj49BUrlfxIrdHRyPM3GBZArK7/bxm5vQlrXrUa5qLzDPwOcrP+gDDB4cNTqgRLeJ8xLC9BB9f3Cf1m5jb1Tblu6fxuInJyp0FR21U8LjqbnZzMq496yMW57qt/HiCSOWaJmIX5IRR1TpOOM7KSS
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 17:09:51.0581
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 343e9fdc-b1fb-41fa-dbfb-08de85da552e
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF0000885D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3888
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 17:10:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125408

From: Mark Jonas <mark.jonas@de.bosch.com>

This patchset refactors the phytool recipe to use the git version and
updates it to the latest commit.

Ricardo Simoes (2):
  phytool: Refactor recipe
  phytool: Update to latest

 .../phytool/{phytool.bb =3D> phytool_git.bb}                | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/phytool/{phytool.bb =3D> phytool_gi=
t.bb} (63%)

--=20
2.34.1


