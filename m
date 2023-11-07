Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C25B3C4167B
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 07:13:11 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.69])
 by mx.groups.io with SMTP id smtpd.web11.5146.1699341185710409413
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Nov 2023 23:13:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=otUjprP8;
 spf=pass (domain: axis.com, ip: 40.107.22.69, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YgmOO72AJTHHv3LtnIOuU5tZjXB9Phiu7axLJbyf1S5vtfwiBRKTQ5wdSm/VbhvywJ6dZnIGiczXa2FbeuIWY8FtxOHbsO+3HyBqItY7V50EYrILdFi+HOlaGqeulCobWHnVYNM63Uwe1xT/cyog1TlQXXcvQLKVHdEZxWwe+9PwWGJho2Omz7jKHRzUKrbYGtSsfO/fNp88hO1gmPVUQ29fAW+KbGAjKQxzdWWJEQ8J7ZNCSVW/RkTW+14cX+/+G/EzdAFbMGqUX8Z29z0BbyOImjcGeVB334In22fKvtp0nt1cxvdG9wfFLL3bcknJ8T/Zo2oZvVmYCRj7DX9vkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sSOJFsIvrh16bU4bDrsGXSjs6ZFOB1ZjnmSQSRgifDE=;
 b=oGNc0zwe7hEf69VTeGzAY5BLVjuDj3E8GczI28vukoEXNi4cfj4BAynwML6uUh3DrIhi2P6NT78AJTexvgRzEv2ZtYVX8KacWjfoMR/OjivjOdz2sYHEmr2mRjY3sKP/cGlI1+LM0ym1LZISDSjmqwMXtrnioHH1pnijkQvFVHlBp7GujYt3k6huNO14aLcWe0Mwi/vol4pYhu5oHjL9vyBki9vjvYCVDTqbR4+UWzsnp6tAS/ifqwxtASOJTS/0NdGa81SvqKjRpsaoa47KUwh+WAaO3T6I6qgFKd0XlQA/7lO0i3hURNfxTVKKesEX0O3hCs0oN47Kot37nSh7oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sSOJFsIvrh16bU4bDrsGXSjs6ZFOB1ZjnmSQSRgifDE=;
 b=otUjprP8GOVHwUWKIvuuYrVV82VtKUQsDJvuHdQdbc5F+NPFJFx8p0WZJr2XPgluO9DRdciE76CtPXTQ6ni8NkOe9TeGZIidMVLqMureflkCwk8t7A4SjBg0ZKX8Y8jDRpehUaCIMMS5l3RfnVqRhqG2hW1sHcDAeVpJF7BfbHg=
Received: from AS9PR06CA0714.eurprd06.prod.outlook.com (2603:10a6:20b:49f::21)
 by PAVPR02MB9062.eurprd02.prod.outlook.com (2603:10a6:102:2fe::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 07:13:03 +0000
Received: from AM4PEPF00027A64.eurprd04.prod.outlook.com
 (2603:10a6:20b:49f:cafe::2d) by AS9PR06CA0714.outlook.office365.com
 (2603:10a6:20b:49f::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29 via Frontend
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
 15.20.6977.16 via Frontend Transport; Tue, 7 Nov 2023 07:13:02 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Nov
 2023 08:12:50 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 7 Nov 2023 08:12:50 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 213446D3C
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Nov 2023 08:12:50 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 3A77CoP11519730
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 7 Nov 2023 08:12:50 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 3A77Cohp1519729
	for openembedded-devel@lists.openembedded.org; Tue, 7 Nov 2023 08:12:50 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-multimedia][PATCH 09/16] libuvc: Specify the version in the recipe file name
Date: Tue, 7 Nov 2023 08:12:33 +0100
Message-ID: <20231107071240.1519631-9-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231107071240.1519631-1-pkj@axis.com>
References: <20231107071240.1519631-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A64:EE_|PAVPR02MB9062:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e8efa33-5189-4d4d-6d3f-08dbdf60fb60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	M7SHmM7Mck0K1vDGPgix/cfKBDaeo2SWEZHyLx7E2D8LkeFshd7idvP2DRmROdl+Gpn2UjA0lE21FWaRDcyuOO3rJRst7YZWq/035Ua/qyBKvETdWFEhViiVXCONWoVp76zBTB4HiBm76NApwc8KlW+TDPC7/rbPM6B/azWJ7wS6xofDBJ9KPdrPs752zo17I+eC3s8SCRXFC2TmqCG8BzoI4T7cgFi7HegL3xjEUPCmtwZpJxEah9ysA4q1vuY3PPYGKmuYND9tjp+Yw8fge29260Qc+TGD9x7Iu5edfEQlnb6FwIl8OqEY2YPZN+F6yzIpIenGr6QbLW73QAfzL8y4ej+ubjh4ObDhJumIg4zdiHibRk9MRYhIB7eY8uc/4wLR+1CHHtY+9NU51efz+o6mag83ynD2Ca7WIdPOFoRxrzcABQrlr2kFqsTb/dkjq+3VE1hXOvGzuBQhctl6H2vJIIcGbC+PdEa0IqdSK6oLy8SYciCVD09HdzK+ZkIsZOvMqTRAX4KlE4Tt/KLUBDbip/u1p7QjblM2n+ySN0z8MtPNuJAHp9jUqh0uYxP7CvxiS1ewpHq7ifqe2rWgWY6UBTgTkvj0tIgVz22Y3lb+Y9bc10SuljYy7pp/kGvZwwhDmbetV6IBlThi85zYKnndeNEvBoSnml9ZAdxIJkhph6AG3PDcZe7YD6WaHhW55waR4P2GLbbxdZrbgAqh4D7SEX5U20eDAFDTxabp0Zi8YiZuZ/KKS4f1aTJZDOSPj2dblFRnT4O4Crx44XLiFA==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(136003)(396003)(39860400002)(230922051799003)(64100799003)(1800799009)(186009)(82310400011)(451199024)(40470700004)(46966006)(36840700001)(6916009)(316002)(70586007)(70206006)(42186006)(478600001)(6666004)(41300700001)(8676002)(8936002)(1076003)(2616005)(5660300002)(426003)(2906002)(336012)(40460700003)(83380400001)(47076005)(40480700001)(82740400003)(356005)(26005)(81166007)(36860700001)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 07:13:02.9999
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e8efa33-5189-4d4d-6d3f-08dbdf60fb60
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A64.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB9062
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 07:13:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106432

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../recipes-multimedia/libuvc/{libuvc.bb =3D> libuvc_0.0.7.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/libuvc/{libuvc.bb =3D> libuvc_0.=
0.7.bb} (97%)

diff --git a/meta-multimedia/recipes-multimedia/libuvc/libuvc.bb b/meta-mul=
timedia/recipes-multimedia/libuvc/libuvc_0.0.7.bb
similarity index 97%
rename from meta-multimedia/recipes-multimedia/libuvc/libuvc.bb
rename to meta-multimedia/recipes-multimedia/libuvc/libuvc_0.0.7.bb
index dacb57c79..b1572b32a 100644
--- a/meta-multimedia/recipes-multimedia/libuvc/libuvc.bb
+++ b/meta-multimedia/recipes-multimedia/libuvc/libuvc_0.0.7.bb
@@ -3,11 +3,11 @@ HOMEPAGE =3D "https://github.com/libuvc/libuvc.git"
 SECTION =3D "libs"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D2f1963e0bb88c93463af750daf9=
ba0c2"
+
 DEPENDS =3D "libusb jpeg"
=20
 SRC_URI =3D "git://github.com/libuvc/libuvc.git;branch=3Dmaster;protocol=
=3Dhttps"
 SRCREV =3D "68d07a00e11d1944e27b7295ee69673239c00b4b"
-PV =3D "0.0.7"
=20
 S =3D "${WORKDIR}/git"
=20

