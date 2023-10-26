Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD7AEC25B6E
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 18:43:48 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.70])
 by mx.groups.io with SMTP id smtpd.web10.208729.1698345824739262350
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Oct 2023 11:43:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=e9q3ubpA;
 spf=pass (domain: axis.com, ip: 40.107.21.70, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hCCgn6t/H8tpGFC2D0aq8NZkqFFGisIqw45vaSXIuSRIbApukvIaIblVbu2CPtGim8AOK7PdWvb5hz+4dTv5RuOW+0XtJOmK8xva9uP9UzOHBAK/seCka+1yzAa0/4VWndTmcfcZG/4VvtP47pujCtaJ0X3SUxpvkufg8kF5gmr4RMDnZDeQhsBnpYruAP8EP2S7pf8jYm05oTwUHHEU6855S9JfWEy4u8r5tjrXaPQ0/SERuY0yuXV88O8S0ppRvhB27CFow4jVQ56ptT6JVMopF5PgGh1e2Iv0rCfBukJz/glSVJWZOBZ6WUDsUT35LGXVNDDyIIbiivUEGyErMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+SxuYSft3fsXm6ETllguNPFeydEq2L/b1EaynI6iyxw=;
 b=ES0CpM5gImH13dcLImGRQIz1Jg9vk+GUZPyB9XPqeJW9gTfIO3qCCIZczfDgJGMukQJ7Fu8U9KQrqqwi7CAt6sCpjNbk1iVFVSQE7n9eQThJ4DIUZodToAXIAGtAUkcg7XsZ6jnS/iROKLMH/9DZoBFknua942t1Wdbx86kx2eLjtssFdu2d20i9wAmodKAQVNAJXySY95EycJvRBg2YEGu86Q0AhdYA92eiFOHhxHSR5Ik66j58/eSkjDOT/GNLzer0tcHm+npxOYpmfEJN8eUN4iYF+0HHC13dZO1N50b82fIxMr83G6OzvZwjNiKIGBIcEzCNJ12UwArNNsOWAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+SxuYSft3fsXm6ETllguNPFeydEq2L/b1EaynI6iyxw=;
 b=e9q3ubpAaq8c1F3E+bfGCOHM0T/MHYECdDo1FEHEgNDrwdiy541E8BNTlHi2EKW3uAwJjTcX3nI99c2IiwzUSxLln4E2vanLmexcLsdgOSNmJ7XUyIwt+rDImLzSo/drmjQWGNr4b0a56hNBpVHfMqwvijFCDhDnzxZBTiPhT40=
Received: from DB7PR02CA0023.eurprd02.prod.outlook.com (2603:10a6:10:52::36)
 by VI1PR02MB5838.eurprd02.prod.outlook.com (2603:10a6:803:130::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Thu, 26 Oct
 2023 18:43:40 +0000
Received: from DU6PEPF0000A7DD.eurprd02.prod.outlook.com
 (2603:10a6:10:52:cafe::5c) by DB7PR02CA0023.outlook.office365.com
 (2603:10a6:10:52::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.35 via Frontend
 Transport; Thu, 26 Oct 2023 18:43:40 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 DU6PEPF0000A7DD.mail.protection.outlook.com (10.167.8.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.15 via Frontend Transport; Thu, 26 Oct 2023 18:43:39 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 26 Oct
 2023 20:43:39 +0200
Received: from se-intmail02x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 26 Oct 2023 20:43:39 +0200
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 636E728EE
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 20:43:39 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 39QIhdwZ3918328
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 20:43:39 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 39QIhdFE3918327
	for openembedded-devel@lists.openembedded.org; Thu, 26 Oct 2023 20:43:39 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCHv2 2/2] mosquitto: Support building for native again
Date: Thu, 26 Oct 2023 20:43:36 +0200
Message-ID: <20231026184336.3918308-2-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231026184336.3918308-1-pkj@axis.com>
References: <20231026184336.3918308-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7DD:EE_|VI1PR02MB5838:EE_
X-MS-Office365-Filtering-Correlation-Id: c539f8ee-498d-4935-7a03-08dbd65378c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2yJN6fPz3kbEgU11NTeflgWd3UjMXq+1tLwJzmnIeF4JJiZVKSLFtkaOKIaPfQ749oJP87JW4+a8ruAlM5ox+JD0XcN5yJymhS/H8Wdn5RbxQJLxO1BLVBasEN1AwrZFRxIP6LUk7c9M0AcnJtBvAhm6pRDazbSoxifEE82jZVLcrf/ElW2pEEd3RXUP5GIjz22lw7oICx2d6AQpM4M1NPcK56emqhmZkfdRdwnJcuumlFIbB09NSSpkR5b48Jj1Hs+WnaU44izXhJvs6PXx4/r78a3Vt611xt9aEXitjfWHJnvXV2VHeJqVlPzuASconyFKsMU5PPPoIcdVxNBPPwTwO6EzZiAHdN37JIooT2TJWdXLx1/vbrPLFguky8vmI6uEhnpU0ZXf/hLZoHUiK2AFaR9WNLQSYDcPLrLW9sVz4isYOXeGYOexQhbeY6PCPBavIrd98TbNIensu8ktSwnJzuEWw4FVKDnKIezvlx2hOpdlf41QI+q52oSaJ2iSZwbDe0Ly7SilBbqUzo4AXI9OfUD47vuo4rnRBv+5zgc/9u3He0GO2wKqo6bha4Pl7rb9MNHBjBXBDQOUvj/QcESI4Gfik6zd7OazT8cbFFsPu36hp2MgmrjlUotTAg/o50J4W1CuJkqw+vWzEaDfTlFi66ruAv9k2Z0JJ3z1IdwbwCnkValAguU31SitLpTkQYfCmTe6xEIhMuI2a3Tb+6qEDG9CNstJJvrKmb4VJzhUZc5lEYd5KHWGRfU7yWMK0D4jA/Za/TM2d6O21TDusA==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(39850400004)(136003)(396003)(346002)(230922051799003)(186009)(82310400011)(64100799003)(451199024)(1800799009)(46966006)(36840700001)(40470700004)(5660300002)(2906002)(4744005)(41300700001)(8676002)(8936002)(40480700001)(40460700003)(82740400003)(81166007)(47076005)(70586007)(6916009)(316002)(42186006)(70206006)(356005)(1076003)(6666004)(478600001)(336012)(426003)(2616005)(36860700001)(36756003)(26005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 18:43:39.8785
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c539f8ee-498d-4935-7a03-08dbd65378c0
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7DD.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB5838
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 18:43:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105762

Support for building from native was removed in commit e1b332f2e
(meta-networking: Drop broken BBCLASSEXTEND variants), most likely due
to no support for building libwebsockets-native. That support has now
been added, so it is now possible to build mosquitto-native again.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: No changes.

 .../recipes-connectivity/mosquitto/mosquitto_2.0.18.bb          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.1=
8.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.18.bb
index 7685cc928..ea9eb4857 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.18.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.18.bb
@@ -88,3 +88,5 @@ INITSCRIPT_PARAMS =3D "defaults 30"
 USERADD_PACKAGES =3D "${PN}"
 USERADD_PARAM:${PN} =3D "--system --no-create-home --shell /bin/false \
                        --user-group mosquitto"
+
+BBCLASSEXTEND =3D "native"

