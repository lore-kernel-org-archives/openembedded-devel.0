Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB649C25B48
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 18:43:48 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.65])
 by mx.groups.io with SMTP id smtpd.web11.79224.1698345823993673335
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Oct 2023 11:43:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=WYo+VWtE;
 spf=pass (domain: axis.com, ip: 40.107.6.65, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ccntXf5LNxaq8vgznRCxrPl43qKoMJMWgoDBmthMdXoGXbvgscCqKUDkI27XTQVJA6wXNnAs5FTZRlOeo3v0I91pV+oMdluxAr4rZN895QQSNmg5mwTlEzAg+q6TrVow43jE0TFFEyRpOcQlagl5N8IMGRdmDF2tNElSq7pXijT1/8SfYWVzm51trEVVsK1gTnLSClgaUpQfNqgVphXaZ/odDeoO8A3lXGhRZdInpdoevP3LN8gCRfScFdNxW5vHErUyx8c4/kc9cvXHHKLSQou6quIz+vMiXBpCdF8mSgEGxpohKcNCtkrOB6DkHConA8YR3N3djegeb/G9rt7SJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ADn6voUvRcrBPuQm7/GHwaO+fTA/EAIponbjyehnzHM=;
 b=W2lyvV5qBHYHxUXbwi9jsXH9YODCvWa1GHfrNDMKFP5rVV9h0EmlUFZsf+hlefOoz6Y0HLKCVt5drv87iiwUyMsF23FPYpg72DimyqwELL9V0neZv0PFBW7aKHNELnAMMI9F6VF5o8Dti0fEGJA3v48nvPlV+dHTWZAzSxvSAgpTyFMuHKi1q3JcQXkI5s7ueBgOzaXo7sgo1rEwJrd6RkenjltcWc0gqCF4K/Q0V8KEpaF9EBAGL2nkz7JjkRoylyK98Ci8j3NDh9wjNTPMpzL0wL1eMLpNerBh4h1GCduEGg6um9phO6WqYO0qJtr1ohytHyrGtRduTdJEXcr9UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ADn6voUvRcrBPuQm7/GHwaO+fTA/EAIponbjyehnzHM=;
 b=WYo+VWtEFvg2C15X4hMOPQ5wO6GtqKK9FMOzfXRSQFqFIbeZMj7QOcpWe/Afv2WpLQ4Io/T469GyWbtir33sS3WEhGMJtXofrVFLXVQ6+wOHzfgjA/Kjst3NGJIk077wjIzQ40oHJkF7z93bYw3Rf1wLYh1oOXKCI4p2wrGmL3E=
Received: from DB9PR02CA0011.eurprd02.prod.outlook.com (2603:10a6:10:1d9::16)
 by DB8PR02MB5867.eurprd02.prod.outlook.com (2603:10a6:10:119::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.22; Thu, 26 Oct
 2023 18:43:39 +0000
Received: from DU6PEPF0000B61C.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9:cafe::6c) by DB9PR02CA0011.outlook.office365.com
 (2603:10a6:10:1d9::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19 via Frontend
 Transport; Thu, 26 Oct 2023 18:43:39 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 DU6PEPF0000B61C.mail.protection.outlook.com (10.167.8.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.15 via Frontend Transport; Thu, 26 Oct 2023 18:43:39 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 26 Oct
 2023 20:43:38 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 26 Oct
 2023 20:43:38 +0200
Received: from se-intmail02x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 26 Oct 2023 20:43:38 +0200
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 9131828EE
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 20:43:38 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 39QIhc0d3918324
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 20:43:38 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 39QIhcKf3918323
	for openembedded-devel@lists.openembedded.org; Thu, 26 Oct 2023 20:43:38 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCHv2 1/2] libwebsockets: Support building for native
Date: Thu, 26 Oct 2023 20:43:35 +0200
Message-ID: <20231026184336.3918308-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61C:EE_|DB8PR02MB5867:EE_
X-MS-Office365-Filtering-Correlation-Id: 8601222d-060c-4f9a-5ad0-08dbd6537862
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	F070F5R3kbxLc51GTpQByWdElL0P8oln/tHmc69ptAKayEk9GVvCzy5AJDzj3FAGECaSJXKklZWj8OtMdpRuNOUIyJo3pCq+2HhW0qXb9cjIeF+HCi22Kwp4UTGazb6Ila7TZKUN5kg08ujgG4LMYK1+FWNh7UXlxXiIgVFKh/IxbNLDdqHEFu8Gtj1bElsJy02ORAbOn9vfI8GFfAwKya6iLpM65QCwJNEeuPZXeH7kqLzOCYRrgukgXR9v2HDz08q6ezW13WlE/IlxJWSmnAs2QQBA2Sy21QGXyIQhb13tfAf0Ez/f2N7WsAL5UWMBJmgs/Ho+J1FoUh4dx0S6Um24sFBB3p7ScxdWqBfCmX6vVsdf/zOYUvg1TJKHNgATV18FDc7wssg40c2NYektiG6eEMRN3TmgKUaJo9Z7m95/mjtzI+/k0UDRFTU/0nesMm64uzThwdEAesyXO4l5JBypYIwCUz7hKzdbb6fDA7m9n0oKYBGqiK6kcHtbLb5FqJAzYDcH3A3hEI5zB++uh8Sdn0GmR9+nMxASfifBrHB4dvO1TIxOhFF7n7iImPXQQIhKUvi0AqP8mBDotLlRbDYtXFjLiGfk2Mo0q9MQpA7am/E5Y+8AapUEYG103b+KeC5uLrbIEuCX5IoGj7PbS2FGVm8awdz2/4lDRwhRDRCH8CwnaIQT6spD5r0+FTKGgNP/euhDI9SrPd+tZ3PezvzPzitPzSoL9MZmoOZhLy4C6eJR1As29lZkLAwMk8oSjX8umzC7hjjG08pRR6QN5Q==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(136003)(39860400002)(376002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(82310400011)(46966006)(36840700001)(40470700004)(336012)(356005)(426003)(1076003)(2616005)(47076005)(478600001)(26005)(81166007)(6666004)(82740400003)(70206006)(70586007)(36860700001)(316002)(6916009)(42186006)(8676002)(8936002)(5660300002)(41300700001)(2906002)(40460700003)(36756003)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 18:43:39.2617
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8601222d-060c-4f9a-5ad0-08dbd6537862
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5867
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 18:43:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105761

This is needed to be able to build mosquitto-native.

The dependency on libcap when building for native is needed because
cmake will pick up the existence of libcap from the host, but then the
build fails if it is not available in the sysroot. Unfortunately, there
does not seem to be any way to explicitly tell cmake to not build with
libcap.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: Depend on libcap-native instead of libcap.

 .../recipes-connectivity/libwebsockets/libwebsockets_4.3.2.bb  | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.2=
.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.2.bb
index 5e6069fb8..95c2854fa 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.2.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.2.bb
@@ -4,6 +4,7 @@ LICENSE =3D "MIT & Zlib & BSD-3-Clause & Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D382bfdf329e774859fd401eaf850d29=
b"
=20
 DEPENDS =3D "zlib"
+DEPENDS:append:class-native =3D " libcap-native"
=20
 S =3D "${WORKDIR}/git"
 SRCREV =3D "b0a749c8e7a8294b68581ce4feac0e55045eb00b"
@@ -61,3 +62,5 @@ RDEPENDS:${PN}-dev +=3D " ${@bb.utils.contains('PACKAGECO=
NFIG', 'static', '${PN}-s
=20
 # Avoid absolute paths to end up in the sysroot.
 SSTATE_SCAN_FILES +=3D "*.cmake"
+
+BBCLASSEXTEND =3D "native"

