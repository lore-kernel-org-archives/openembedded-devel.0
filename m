Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29CA9CA5FA5
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 13:14:47 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.59])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7538.1790687684106302926
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Sep 2026 06:14:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@de.bosch.com header.s=selector2 header.b=qMQ/ILn3;
 spf=pass (domain: de.bosch.com, ip: 52.101.66.59, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rEZQnHp7KRxPh6hZKhCuR93lR009RcazRezKSc23ESQFCtJQI1hXqwQVRN/o5EowvAKWXgRlw9s/oMsKMmAhBROXbbX0pJdpV0zvgsBEn26Mw69PeepouWH03DwHAWbXws7yIK6TC9A+gdzFjbcJ18RUZhrtGsuEgsx098j/aTFL0g89O7ojEwuBqTK7klew8xV1Hhtf+5DgGe7glDqt4RfkFMOw6us+5qYvNlDhyvUlr7W5FHprQCkywL4y6V6Eg5HzFHf6fwKzPccQNfAL56GRakemQduswbf6Q1m2Jw9udoYfwBl48Sjd0f8JLTccmGGrTt41cfvh2uzMzRikFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DV6i7cY1cfMszDGhoYbN09rj0yeS9mMoEgM+oq183do=;
 b=cSNkJjupVbfjpJevxMQ8u6vEOXBhhD6cAQyRtZkuyaJwffwoTOvSVQagWX3PTEWKyiDzM5w+5ssyAIxc1xumRExxab8xu8OlG40g7zdRIsxxnIp8KElCrBKtFxKqez2uwUXS1IWkstfPXnIeLAe52ugujAqMnhZQBCcdtXA8ebLvwxBr66KsfqbOz+K1NcDopQJJUN9GU9dDVgf2AfE3wm8kh/o/hnpW6DVlwjcdhpwLOcP8rXq8UQXdm4HTGDGeUmgBRPzCNE0ndmVDDq6iFI3aXcjH0pU1qnbBYKFsjcBoNpi9M+kBAzXyq5NlY+XBMtLUrzmryFnc1MJLKHmxbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DV6i7cY1cfMszDGhoYbN09rj0yeS9mMoEgM+oq183do=;
 b=qMQ/ILn3GUw2m8vRKE51F5nwyOn/ZJwj2giwogLdjzkmi3dxpVHmBBRZ5jgEH7PR0p2SuuBwKDbACTxYfAzU9Gpeb/b51DNZIUTFq9kKY+9zFFxF7dpB8RHr5rnbG31QjrgLaxtPiZacyF6hcKYG861UJ6f/QUrg3pz6f9Y/gN1MHZC8Tb3BPdKaXnSk5uqlBW+OqutPvNsjbVph0fvmMvBM9MGl2s8eeI2BaMq932b0Bll/PwkxQC0CZQ0YTNp1TCBGITCPaSLdvz4Q5iT0ckZtuOzEzdp6dfnxa+Y+WkDjJMYJHm4bBoIf2S3LBG7XeUxdFg7sOxCtCF77SLUIeQ==
Received: from OS6P279CA0071.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:3f::19)
 by MMZPR10MB510724.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:190:33::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 13:14:40 +0000
Received: from CPH1EPF00000530.eurprd05.prod.outlook.com
 (2603:10a6:e10:3f:cafe::71) by OS6P279CA0071.outlook.office365.com
 (2603:10a6:e10:3f::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Tue,
 29 Sep 2026 13:14:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.205) smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 CPH1EPF00000530.mail.protection.outlook.com (10.167.241.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 13:14:40 +0000
Received: from RNGMBX3002.de.bosch.com (10.124.11.207) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 29 Sep
 2026 15:14:37 +0200
Received: from GRB-C-0009M.ot.de.bosch.com (10.141.135.27) by
 smtp.app.bosch.com (10.124.11.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 29 Sep 2026 15:14:37 +0200
From: <mark.jonas@de.bosch.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <bartosz.golaszewski@oss.qualcomm.com>, <khem.raj@oss.qualcomm.com>, "Khem
 Raj" <raj.khem@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, "Ricardo
 Simoes" <ricardo.simoes@pt.bosch.com>
Subject: [meta-oe][PATCH v4 0/2] libgpiod: detail package licensing
Date: Tue, 29 Sep 2026 15:13:44 +0200
Message-ID: <20260929131346.1894-1-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.141.135.27]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPH1EPF00000530:EE_|MMZPR10MB510724:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ff60c96-5db4-4766-8b21-08df1e2b9ee2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|11063799006|6133799003|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	FB9M/ll9nFX72kKdLc5I33/Q7OAKb8Dexym4Zxc857r/14q0Ii0WE2OZMpKlnDQ17IBgMbS+FZePCDHGmXr6Z9t5eZnjg8qfBMiiqrMiVmdqQoq3j4BRF3Zc+dpcgRLxVh2JjofCDgAgDcD6y2dDLuNSTlhPxwCvWwOD+2udC4Y5mcW89vLqTRAH808hYkpZ9yixS7C7OI20BO3CZj5HeXrj25bdmxfIka96AtbIe1Cgya9HHsSKK4LWMmuuPP9oF+es7EvWreBKRuEgFv+D5KRA4RuUxanf7bC+8Q6JM5IJpRt+8rutPTBgfIs99/A63+Jj7nNsE9bIqO9biorOyP8hL2o3vzNDjbdXmKsO2JcOCD0zSPe/zbZd+usWA+ZeMrdXVMxVZ/x9GK58j2cjSSfjfBR9FKJfIs8M5tyCa3iFaGMJ6sSEJ/VqkpTK3ZOow3oBAMpheHtkNupL5R/7nivf/qpJcpomQIbsdsW8QMdG3reYmMrjXZ2jV62DZfkUBOEwtxKLgHSspZIbly4S4f65Y1syYi1ZWI9XwsQc03JdHXNCFoYd14BWT1U+4sVXMmL2Cxq5QL9Kp8n46Jk9rq+j1Zr8bkyVhrhP1Xt6gtQ25giIhl0NVaCfvBcIanX/YYyiKuzsO8sPBJM4hJjUN6gMXeVYaNeej/czZ5n6LJ0MTxDZeJsxenqJJsxdiJrMLdV7bak80+2MEE2Q5iEMuw==
X-Forefront-Antispam-Report: 
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(11063799006)(6133799003)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	2Pb0x933KyL+desG2GB6tEszOxkcYt6a+kR3yVkd9SmfttjnJqVkIXOImYLIAiSIf+Db/rjy8q7CZ90aKAVgoxUORji+R9PZrdjvpWxfPpt77x3JpFxV17NF7HL7l+xuFRK5cNm9is/G5NCuVEvAWDJHWIKGjXtD3Wnvjcr3SLKl0uxwPWJPTReAnSgn+XtPVdVV0zUuEvr8bnSx3awygtB00IThSEZKPgKrTIFipt2GEbM84lqgwExn/ybzOk5Bjr3CJXkhZ8tujQQJ4sgsV7nHCHJO6tT7RomHqqk/ZvkrN2xLI0o2lp11YjpDb/seuARe4p9Cx2+Ca4c9ZJtK3sp6obavNsWvn25YPHsGyN7aZ/VkVC+mlQ+LB2+PsYS7ag7fJ1/oC8dCgPjNZz+UAcvyzxWL0uDbQEM9pMfNxkEYgUFv7JfGqvjhNfLg6y0Y
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 13:14:40.7135
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ff60c96-5db4-4766-8b21-08df1e2b9ee2
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CPH1EPF00000530.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR10MB510724
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 13:14:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130477

From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>

This series corrects the licensing metadata:

  - Patch 1 backports a patch which fixes the libgpiodbus license

  - Patch 2 splits the recipe-wide LICENSE into per-package assignments,
    so each package reports its own license (e.g. the library as
    LGPL-2.1-or-later, the CLI tools as GPL-2.0-or-later).

Changes since v3:
- Fixed libgpiodbus backport patch commit message
- Fixed checksum of CC0-1.0 license file

Changes since v2:
- Inversed the order of the commits.

Changes since v1:
- Squashed addition of missing CC0-1.0 license into setting of
  per-package license assignements.
- Backported the license change of libgpiodbus from GPL-2.0-or-later to
  LGPL-2.1-or-later.

Ricardo Simoes (2):
  libgpiod: update libgpiodbus license
  libgpiod: set per-package license assignments

 .../libgpiod-2.x/fix_gpiodbus_license.patch   | 26 +++++++++++++++++++
 .../libgpiod/libgpiod_2.3.1.bb                | 15 ++++++++++-
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-2.x/fix_gpiod=
bus_license.patch

--
2.43.0


