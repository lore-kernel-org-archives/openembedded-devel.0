Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0297C41535
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 07:13:11 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.52])
 by mx.groups.io with SMTP id smtpd.web10.5516.1699341186047242654
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Nov 2023 23:13:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=QbSd7Qe+;
 spf=pass (domain: axis.com, ip: 40.107.249.52, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RhSqFBo05S9LAeUiGao7GwCZI4P3aU/QOWcBlYVvhLw9NpjsPelnjumaMGvlPmj7Tg71QoYhIjqmdkK1NCc5d+FbtZDGJ1dyZyFo3SGe50xD+IVA86jNCxU2Y1JQNq6Th1Cle3hXx29dr869mrpo5apQBu+iUudz/CKCMlyQopLL/qw6edulRUPlKqEzSwvoRBWAJV4eAh8Q/iyFuNALOqgbZEh2WGC6zklIsEqeFeS1Y5yyxD/0JoOPvk8KNrMcHJkHam7NOdTv0P2hUdaDivdn562ZmKMHY3WCAwygdcUbAagHizts7Sz+kEp0wf7gAEsk26csY5q4CatGNlOFwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CL3kmt2dneDuGFMWW+REso9Iaj2QKbJr6SOzksT2k1o=;
 b=dJLdfm9mWkhNHQ17mzdL59X0GggHBgh7YGSbzHEH11Gn3t/8a8sthT/8E35P2CcSfbScyzw3HPt8QFFGA44dcz2ZqblNko6CpVYl3Px74Xn2ZG1AXNawbGlQL4ssIFyLfuBzDS2ypdACv/i6U8ppIE6vV0j0YPIW7hSgLHuNs1Jfo+OhT9S47/9JGlhR64Wi9qW0nWyyiNoxcl/w8PT66iMBCWbewQY0MiGIBAFvYDUvBGnXwdSo1GUQuyOWwDE9JsOyA36LI+en9sxAkgZ4c5TJVYIBagImYb/negGNQ82c3+V51phiwSgBo5P6VmcR5gsRVEhI529Yha8sjQ3jyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CL3kmt2dneDuGFMWW+REso9Iaj2QKbJr6SOzksT2k1o=;
 b=QbSd7Qe+wvBj7THQk6olAj2Q3FWqetezL4j30JqnUUjPkCninjwLiQjWj6Q3G2RYhOhSnaj7udb1Vp2OE7Aq8eWsAZXppjYwW1YAwXO3Ul8zP/gg3AVRtWjVYbGF0M1bKKlsdzP+L1ACGWRcqJl36Lc9Pa4Za38q/VY0sGICZRU=
Received: from AS9PR06CA0692.eurprd06.prod.outlook.com (2603:10a6:20b:49f::22)
 by DB9PR02MB7211.eurprd02.prod.outlook.com (2603:10a6:10:241::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Tue, 7 Nov
 2023 07:13:03 +0000
Received: from AM4PEPF00027A64.eurprd04.prod.outlook.com
 (2603:10a6:20b:49f:cafe::fb) by AS9PR06CA0692.outlook.office365.com
 (2603:10a6:20b:49f::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28 via Frontend
 Transport; Tue, 7 Nov 2023 07:13:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AM4PEPF00027A64.mail.protection.outlook.com (10.167.16.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Tue, 7 Nov 2023 07:13:03 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Nov
 2023 08:12:50 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Nov
 2023 08:12:50 +0100
Received: from se-intmail02x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 7 Nov 2023 08:12:50 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id AB8EF2974
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Nov 2023 08:12:50 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 3A77Coki1519748
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 7 Nov 2023 08:12:50 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 3A77CojK1519747
	for openembedded-devel@lists.openembedded.org; Tue, 7 Nov 2023 08:12:50 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH 13/16] python3-kivy: Move a comment so it makes more sense
Date: Tue, 7 Nov 2023 08:12:37 +0100
Message-ID: <20231107071240.1519631-13-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231107071240.1519631-1-pkj@axis.com>
References: <20231107071240.1519631-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A64:EE_|DB9PR02MB7211:EE_
X-MS-Office365-Filtering-Correlation-Id: b9939dc2-c63a-48ea-06f0-08dbdf60fbbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QSfth/zeLP/2WIDba7dDqdSOhi/FXdghDqIaJk2nI0PH+Uk2jb2R280oaqESUzyyJ731WDTUF6oPKK2lPyOLS5mAL3WS/3doV1x5tXNt+ruuEjAF4h7+i1CAORZ5bH/xms61A3rT63e0Y9ys9VXy/cgN/avmq/PWYlAC4XiTud8KL8ErWB68o7htNk0evUyMEr9bU780/PgxRxQI5PKI4patJFeg+QMvOkGns514s7ySPIhDp+uvONfiy6q3JKeTT5vQz5U2fI0S0rMZ9SBk83cFbTh3aiKUNXzgeSbJi7tTQPeUlyHxvtegRq9GVszzUb+NgnprvAELBJYLQd6JzDEB+1pds7W8j8AD4/hS04fJyo1xVqCAZUO0QIX8q8PEEN+ILZl7AboWYo0Bf5abUlvTCR6Vjr7g3GRCZYlLKmtX3q4+7mcIR80GECdAOnEq3Gb+MnaZzwHe5c9S+4y/g3ZkYcTzatNdN6vo+VBFhOyR9n8alSdv+nVzHw7hUpzqHf0sr52CNa95WsolOv20BsptxaS5yFO4GNsQ5tR/z4eOf/SWU/AKqDOmZUgvJ44PJNR7b1Dz23HDFGRPKPcmf+0F/Qv3kP0YUVo+XZsSTOCRJ+JfV/aEcxufr6SLeE8hRSN1YbrM5YZYCyKNNFAX1+23oBFwZZDcvFT9JtQHrbGyxZHpI7ib0yg3WxwAZ92mgm+Zq6XOxKwF9wWLD3x8NbdmRnQZrWK6UUQgtQcdBceH1OhtpI83J0PFReEoZZICdPnGK1XPUlbiE9huQMwbBA==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(346002)(396003)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(82310400011)(40470700004)(36840700001)(46966006)(40480700001)(40460700003)(478600001)(47076005)(36756003)(82740400003)(81166007)(356005)(36860700001)(83380400001)(2616005)(41300700001)(1076003)(70206006)(70586007)(6666004)(26005)(426003)(336012)(42186006)(5660300002)(6916009)(8936002)(316002)(8676002)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 07:13:03.5937
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9939dc2-c63a-48ea-06f0-08dbdf60fbbb
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A64.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB7211
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 07:13:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106433

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-python/recipes-devtools/python/python3-kivy_2.2.1.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-kivy_2.2.1.bb b/me=
ta-python/recipes-devtools/python/python3-kivy_2.2.1.bb
index 67ab9a017..a72ee14f6 100644
--- a/meta-python/recipes-devtools/python/python3-kivy_2.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-kivy_2.2.1.bb
@@ -7,14 +7,14 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ded5cd0f2cfda42=
852c332e3b88c85fea"
 inherit setuptools3 pkgconfig features_check
 PIP_INSTALL_PACKAGE =3D "Kivy"
=20
+# Kivy's setup files only look for GLES libraries for Android, iOS, RPi,
+# and mali-based OS's. We need to patch the setup file to tell Kivy setup
+# that our machine has GLES libaries installed as well
+# Also, if using SDL2 as backend, SDL2 needs to be configured with gles
 SRC_URI =3D "git://github.com/kivy/kivy.git;protocol=3Dhttps;branch=3Dstab=
le \
            file://0001-add-support-for-glesv2.patch \
            "
=20
-# Kivy's setup files only look for GLES libraries for Android, iOS, RPi,
-# and mali-based OS's. We need to patch the setup file to tell Kivy setup
-# that our machine has GLES libaries installed as well
-# Also, if using SDL2 as backend, SDL2 needs to be configured wth gles
 SRCREV =3D "344768bfefd2e8f5302cc9dfb8ca41991ce6f7e7"
=20
 S =3D "${WORKDIR}/git"

