Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAC89E9B36E
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 11:40:54 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.36])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.158589.1772451644800115352
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Mar 2026 03:40:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=hGg6PNQN;
 spf=pass (domain: axis.com, ip: 52.101.65.36, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cHz1ukfNEmt8OQ4UX9YV0g1jDIMI3doqaxZK0Mi6lJ/RqewRC4UniKroBVaM4DSPrlIqZL2j9E0P5cGowfETFQt6Y3ZIV9sF/zmsiw56M9+GxvagY2IR1nfP5L2+GWLEqR9ebuTZJrd5exg+adJAGeW7Z1Etrf+5iN5FSDAZ5UDJ8w29z9v3yVE9aHLqzlcSYaovIxz2sWZc/LCGzYpg1pkU8RQz5cmX1K/l4pigLUaaFvK+c0UPqs5FcQ07Z3ErJ5nJFYOqFSZDhnlF2sdsH8vJqiUY5Jx1t4B3EqX7Dcg/dL+xsB9h/t9Hj1aIBKdOLNpP1HUTLe3hYVkpTCmc7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ahYtWRxPtH05ldHb2oKzTJFoueVNAAexSF9rRLCIPtk=;
 b=Ba0jm0KAz3cdYJanfoYPfKZMzgq1uFet5h3DjD9cc0BSwuNS2WM1odJWKI9joMhVLaUFnB8/v3w9DX+YVkqs0HDjzfSFQCs6utKC1Is3Yrl6VDWZdKhG56Xp2r16tlhtahHunQ6g2HnFiNuKkL2fqCDYvg4k3A7cporC1fABS49Ssozi4NLwJcmeAw6AxF1Lv0KRo+YLMvrbUlVM5pd7hm/Sl39Bfb6OZP0BJxcvYSOGfNSEO0qQwk+sNAzztPW5LZoDkK93HyyEzNcKkrWL509D3W9wfzWiyPT3Q/hgcFla3lc8OC+6osZy1vDR2vO248FCI+Zk//PnJ5aGKBzRrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ahYtWRxPtH05ldHb2oKzTJFoueVNAAexSF9rRLCIPtk=;
 b=hGg6PNQN/2lncvAQU5N8OV9zYcFuD41EhVmKW3VVVsploNp9d8Ws6iajnjgpDQwY++FCiAcgysYOekHFeNBMH5PrBH/ftDMpv38Qw3zPA39/FyPfKJLcY3J1s0A41ThHOV+Q8NQHAZ/URvH4B9ZgbOuYacyQ5MBIlFny8SAjlzs=
Received: from DB8PR04CA0021.eurprd04.prod.outlook.com (2603:10a6:10:110::31)
 by OSKPR02MB11409.eurprd02.prod.outlook.com (2603:10a6:e10:96::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 11:40:40 +0000
Received: from DB1PEPF000509FA.eurprd03.prod.outlook.com
 (2603:10a6:10:110:cafe::9c) by DB8PR04CA0021.outlook.office365.com
 (2603:10a6:10:110::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.19 via Frontend Transport; Mon,
 2 Mar 2026 11:40:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509FA.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 2 Mar 2026 11:40:40 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Mon, 2 Mar
 2026 12:40:40 +0100
Received: from se-mail10w.axis.com (10.20.40.10) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Mon, 2 Mar
 2026 12:40:40 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Mon, 2 Mar 2026 12:40:40 +0100
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 0091DA97
	for <openembedded-devel@lists.openembedded.org>; Mon,  2 Mar 2026 12:40:40 +0100 (CET)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id EEE6512028D; Mon,  2 Mar 2026 12:40:39 +0100 (CET)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] ceres-solver: Don't fail if .git/hooks/commit-msg can't be touched
Date: Mon, 2 Mar 2026 12:40:37 +0100
Message-ID: <20260302114037.1197909-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FA:EE_|OSKPR02MB11409:EE_
X-MS-Office365-Filtering-Correlation-Id: b1635431-87cb-47b0-66ec-08de785087ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: 
	13p5164hcAKMQF9gwRXkqHx5+UdrD6HrSHcvUfUp8sk8xkLGeF+VKOpwivU89+KWk7J05LufT6BwlTNWQmjv5kxKBlvWPf302MnkzHKN7MAsQ8vYsiKwowvwTcbO1D/YWV+ffiTjThU/48CM9/IDbASd3aqKaeAGVLRk0st5oPtvd8ZXbEWbOljS6NMFWANcKzkz3tVVbvFWHCvnFZMHdyYf3YBVwv6XkbnYsKewUbiwC8OBWzJNaTftA6rL3dFy7rAAnc7xMAX8R8Ice+nVvZjSGiCPcA7Fem+u5OxOHA1ruEelLO9hSIOWDBIePQx+sOH+LjiOl0EBuh3bsBZnSOR8Jywg6MNBsBkwOAk1VA4raXLb0r77HUeUnUCSIWZpz0yZIxtKmlIYKI9RK6BuYPDGis4u0v6qm8g3wRZiKUpG0zvcuoQShwzu6h3QhL3u15Fy+8snk0A3fNi9foRLuoWTbwMDP5jxYeC0my3dYVOmP+9sbDyd4PfvKNYuPlnkASFCOhJBQvaKjcwHRH2aDpOthXcsHbv37j8lHNXWEgPopk8/vy/l4rAi/WoN5q0KwTDFaooXriTtgGMQtM6XlGGaeNz2skvUwEpiiVOUCPYzBmWKkN4FyJHxmYMyVCy6iqaMvU4RqFeMwqShkOZon/6Sq0OzxubrhyvZdp/ZkD65n4E2E/76zPJj4DBBzYfrjJyzAAaZUHM9g7j0cDtX5LVKkCQduWITyElHB1oqSW13iqqWjOCfEtF416IOq3sXhrDYnMTB4EOmbe8bH58JBw==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	vEvzD/F8/wHrfYmJ91K/tUpEi//JXQ7AQ5R5Hf1Yb0IXso3fjH6rS+irj7FHC1o88FQO1KBMmxfE8tcXu2BuKzxBsJYfdE79++qGGTj7Ch+K0AJIY8Ln2QRGSGzvYijdHnvpKjET9BVYpDy0BokPPwPAYnrylz5Os7CVmMCxCe0p0WQl5lrYL2r0jh2TuMBNK1JeEyimQpwbD+nDp8JG6GSKGib6C4tMUEId2FwmA/vVq7ceJ1pCm5RssdUfFZ7cTIx5IltqouPYJ4CmU0VLF+WzUX3EZZc/cEgICz7aQ5Z5JVBgQeKXLoEcnpdIB/zVY7S7NtthPKJT888Q/9AdIJ0IStpGxmxb4S6Q8dFXMl+4Ih1/dGvoIpEnSWMdiebBNWkZfFEWqwCiFyd19OoDmfgr0Aw4+S4ZGwmgA5x7qRX4dvfiA9cScuzGiBI5fn1T
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 11:40:40.5831
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1635431-87cb-47b0-66ec-08de785087ec
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR02MB11409
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Mar 2026 11:40:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124805

The .git/hooks/commit-msg Git hook may already exist and not be
writable. E.g., in our environment it is a symbolic link to a script in
/usr/share.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-support/ceres-solver/ceres-solver_2.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/ceres-solver/ceres-solver_2.2.0.bb b/m=
eta-oe/recipes-support/ceres-solver/ceres-solver_2.2.0.bb
index 63500def05..0a8f237180 100644
--- a/meta-oe/recipes-support/ceres-solver/ceres-solver_2.2.0.bb
+++ b/meta-oe/recipes-support/ceres-solver/ceres-solver_2.2.0.bb
@@ -16,7 +16,7 @@ do_configure:prepend() {
     # will try to fetch https://ceres-solver-review.googlesource.com/tools=
/hooks/commit-msg durind do_configure
     # which sometimes gets stuck (as there is no TIMEOUT set in DOWNLOAD)
     # and we really don't need Gerrit's Change-Id tags when just building =
this
-    touch ${S}/.git/hooks/commit-msg
+    touch ${S}/.git/hooks/commit-msg 2>/dev/null || :
 }
=20
 # We don't want path to eigen3 in ceres-solver RSS to be

