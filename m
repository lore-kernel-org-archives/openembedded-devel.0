Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7EAFC25B6B
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 13:22:16 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.72])
 by mx.groups.io with SMTP id smtpd.web11.70264.1698326531712443942
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Oct 2023 06:22:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=EIQMMxgJ;
 spf=pass (domain: axis.com, ip: 40.107.8.72, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QJ+ytgt1WiYxZTNFhk4ag5N3fgF43AXR0d7mE7G4X99PsIHJWo1xf+FtVBpVSmUwAPaEAKXVkm7aG3QtMbUTTyTD5SJznJKe7NNWonFyv6frbzS04IBAxNO5fLsGbvyz+mX1+NiHNFXDjkMCZ67q/M8s83kXMpioiglLyXz+J935elNdyDoKwo+BidqwMrqIM4C8wSZQcjZJ37rl1Qvh3eEIxkLdQ44Wm6TUM9iU106fU2f/gLND5TtzLEokhcEbr/c0/xcec5gWzwL8rXhB08XhvS1sqv0mdktML03dpo5s7PrgHKvBWhUnkwWesk0s0z4QUqsNuMEg9+gPjsOxMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+jPlJGIavrcr+/b9Q6fUDgpqetoGb7F2z5fVouQ6hoQ=;
 b=k4KvL8eNKyp3Cym4hPv/UFwu/0tXgcvyYpw8JAssr3grPXA3cG0QZNobI2bGUmVyh0+kuWS3wgxKMrFRA6PNtbdCpPWexFdSlnUA7npDEFWDbJJpb38o4rD/W4lSjJthYtl/Zyk72uEnSrMPpH9sRhgA+RdNt1yXh2M7ViJjhEQzFEddZ7EEN2hUY+32nM3gtZaBAHGY91fMlkzOrjR5RDIItnoj7ctIL3Irz0cvQayd1iyRBIHpPVl/AVn6TskqSchJcsnt7KESURkJOVihIx7zWt8DUe9P0NOPOlXU/Cka0YLicGq56E0ICW3RzoXaALEBLLJCmOwUTvlIA6rLmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+jPlJGIavrcr+/b9Q6fUDgpqetoGb7F2z5fVouQ6hoQ=;
 b=EIQMMxgJ5TgPkJFEExwEa7d92FgNBs+1eWBl2zhs7uFNyrB+QgS75MHaoJTfHTriEhnMcAiBd5DqNH6tj27GeX391XSjZEtfItb8bZd+SlbvQ6eHpiHByPn9il9mM5tH2Iw8Kw+LqdVrR0pTo0n80LLx//8g98UWeFFFHQ9anoQ=
Received: from AM7PR04CA0011.eurprd04.prod.outlook.com (2603:10a6:20b:110::21)
 by DU0PR02MB9100.eurprd02.prod.outlook.com (2603:10a6:10:464::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Thu, 26 Oct
 2023 13:22:07 +0000
Received: from AM2PEPF0001C716.eurprd05.prod.outlook.com
 (2603:10a6:20b:110:cafe::3) by AM7PR04CA0011.outlook.office365.com
 (2603:10a6:20b:110::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.35 via Frontend
 Transport; Thu, 26 Oct 2023 13:22:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AM2PEPF0001C716.mail.protection.outlook.com (10.167.16.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.15 via Frontend Transport; Thu, 26 Oct 2023 13:22:07 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 26 Oct
 2023 15:22:06 +0200
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 26 Oct 2023 15:22:06 +0200
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 3C0DE2666
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 15:22:06 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 39QDM6gT3840028
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 15:22:06 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 39QDM6uN3840027
	for openembedded-devel@lists.openembedded.org; Thu, 26 Oct 2023 15:22:06 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH 2/2] mosquitto: Support building for native again
Date: Thu, 26 Oct 2023 15:22:03 +0200
Message-ID: <20231026132203.3840009-2-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231026132203.3840009-1-pkj@axis.com>
References: <20231026132203.3840009-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C716:EE_|DU0PR02MB9100:EE_
X-MS-Office365-Filtering-Correlation-Id: a18d5c70-7ffb-46d4-d875-08dbd6268d90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	F3vRlEt7pNlraK5ttC44kFTaohJPh6jG0lJOd0Y5fu4Py0Dmq5Gjg7mgXiC5cipMY2OCJ6rSro9+JAWaqjdF8yoWcFH8e6uKe/Dls5LLQtlNzrjfyAiPDmqMfLALkZClapuhikClexkiD2tiW1ugzxgglEQihVL+Y1q9posRGDeBW+BKbPhHr30C9ngpcPQXlKZCbYOMh8puGIijeO94lXFOBEAayJ4odgAkSNwILbne1O59o5yDekw7IcsL3r/rA8dFRcYJdrVSs2nwqmhnV/hDGGSJC69OzyeimANetlUKha5tSnsnAkgeLLWY9xLulZAAamJX+xYFPjKUpYPu03FJN5jbxQQ2617dvgr3ev/OkBqAcyCgzSe/iui0wUw5Y7O/u6uJuu7oiazBcJnN1uLhzL4hht0glAHsgADDgmPUJukpYYjg7tIvYfFzq6MkTL90IrfF9MoWRl//S4NU5GaScUnbUVrXqhNt/YYkONvTNksuRGNL/HV41glKUTVbJmiAjqBCxOieukE542uOZqhQeSAAQhUgwhO9gLiR7t9ixnuNNM/7/5L19yljOZxD1tJGEdW6gfnmuEOs9NijES8+DGZRX4zJB5+cieH+KfUmfb2373u3+26m4avefiMGyRChQZTZ3WMb6YTTKMnnqams1kxcisxwB8u0rbCi670WFk4BuotXf+byXYSEns3Xk4dptcmvEoozc9RGhLeYzt1f4vG64OcHwlSe3psoKCc3wybbUp9uNo2tVqOsvxyWcaNlzwQvsLLFNKB4IFhD8A==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(136003)(346002)(396003)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(82310400011)(36840700001)(40470700004)(46966006)(478600001)(70206006)(6916009)(316002)(42186006)(70586007)(8936002)(8676002)(5660300002)(40480700001)(36860700001)(356005)(82740400003)(81166007)(41300700001)(47076005)(2906002)(426003)(26005)(336012)(6666004)(40460700003)(2616005)(4744005)(36756003)(1076003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 13:22:07.4925
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a18d5c70-7ffb-46d4-d875-08dbd6268d90
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C716.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB9100
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 13:22:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105749

Support for building from native was removed in commit e1b332f2e
(meta-networking: Drop broken BBCLASSEXTEND variants), most likely due
to no support for building libwebsockets-native. That support has now
been added, so it is now possible to build mosquitto-native again.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
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

