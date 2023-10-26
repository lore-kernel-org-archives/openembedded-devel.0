Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7E6FC25B48
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 13:22:16 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.73])
 by mx.groups.io with SMTP id smtpd.web10.199951.1698326530461401786
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Oct 2023 06:22:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=G2c/j67B;
 spf=pass (domain: axis.com, ip: 40.107.20.73, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nBkrKBS24XUwIIiv9a8hvrAyJG0BwxJWRb7VWLXgMl8GwfnJ03OLbh0bu/wVIYi/TU2M1jhFVKp0juUNuaosZLcbpHCnOPadrDm2ENRNqHrOh036DNhzbLMXtDRU1pomUgYRqfEd6fPPCTs5toX8faG96ezCY6y+89Et78VJo2wM9kOdq4WNWUjFH7SoASWvlYSUgXH9X6XhvkSq9oK/7Oi/gZl6n1JEOojD6+CQ0Ty8oBSHlgJ8LKb7zj6UnICuKvmRsr/s80MXNrocvMfTCUgTTEG3J9ta6njVYz9oe5FKcLsp3gjID3VLoIv9NEKG2dIPv6P7ah2lo9DcrPdTbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c2VdonWSEjkc6xg4TMThu3i1MId6YTyaZH60Di4QDyQ=;
 b=MvKGI3ePvhzOiJNS9ID12bLDJkGI6nip45uuRDD5zUlx6fk2YBBRmSBwwpwIiXr++KohXKxSPBeFCNZNRLNGeHqGRJIAUjRuxzIydKKFf1DxxCHZ+ej4PwVy/Nm+I43Vrbs7P/w+q+FCj44+39rdmcB8TsrdTCTDX8sARkyW38HRHbNPCgeuknUK+GdtEKaa15fy4cTgHKt8K+qrCJOJhX79lYWpF62iijjl0BXHYSKv1sKHvAiK8i8feNOLpSOmFUKLO7ZOSmrWbQ3Q0OkCHCTGfp7gUDROEO1lipUww1Wnb4FtJVZ4w1tWrso6a3gH9hlBmlgE5Jrqjz0kmOu03g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c2VdonWSEjkc6xg4TMThu3i1MId6YTyaZH60Di4QDyQ=;
 b=G2c/j67BrhY7vHo05n8HJHMJxlHo+tlRUD6ndVgfrL3CCml3KSeCqy0OumnQYHQx7DKWgDpLR2JppqVWoLuw98GcYfaE6Tq/cFqrORZdjFOH4y7lU+0d1elaByyGbkm1dpHpsRnSEm2rdrED5SpBgiIR0rIXU8/IgvnJGnw7BqU=
Received: from AM7PR04CA0001.eurprd04.prod.outlook.com (2603:10a6:20b:110::11)
 by DB9PR02MB6796.eurprd02.prod.outlook.com (2603:10a6:10:1f9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.22; Thu, 26 Oct
 2023 13:22:07 +0000
Received: from AM2PEPF0001C716.eurprd05.prod.outlook.com
 (2603:10a6:20b:110:cafe::c3) by AM7PR04CA0001.outlook.office365.com
 (2603:10a6:20b:110::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19 via Frontend
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
 15.20.6933.15 via Frontend Transport; Thu, 26 Oct 2023 13:22:06 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 26 Oct
 2023 15:22:06 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 26 Oct
 2023 15:22:06 +0200
Received: from se-intmail02x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 26 Oct 2023 15:22:06 +0200
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 2840F1FC8
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 15:22:06 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 39QDM6ub3840024
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 15:22:06 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 39QDM5Va3840023
	for openembedded-devel@lists.openembedded.org; Thu, 26 Oct 2023 15:22:05 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/2] libwebsockets: Support building for native
Date: Thu, 26 Oct 2023 15:22:02 +0200
Message-ID: <20231026132203.3840009-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C716:EE_|DB9PR02MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: 2997d4d3-dc7c-4f2b-b6d6-08dbd6268d0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YbogpohqeTiqs69ii02Rxipvgdkw2tJJqrjnC0BeDK9/HeiEv6fVFo7+Ymm53C75Wfy8pwWMUamCNHyo7NvqD4LKfMMAh6tyL1yY1220pUyrqAYowV6D0s23J2XA6NhBEZfVA3V4qWEk99TVVgxkWqZBvy+ko/o9GV573ycRNFyXDocdjAqcPpqUWr5gUnuWnPUM55Aah2nFjpQg2NsJRjvAzXFgGqWYpVISCJprXAKV/mo2mISKZ+q9/R9V85YY5oRhLrHFT2xOuulTDq8R+0qyTTrGUJfEBvDRI/UPEhDIV8aS6++gQwtP+ffdmaGl3+50Kmf6CP0d6UL1IrM64lbpY68Rz/yQa28tj8n5+WXchgTn35xOvpzXKEIvTKA729E/0bWEYKMixO+dp0vpgtJlMmdPFx9zrkh6cWpxKcpFunJxWaZf7euNadvgEEG8GruYN7SVSZ/FOzZs9pmzehzCaTHoOms2GaVz5OOCe2qtVKzvTPE9o4XFBXdkfOZITcKUwzj1Wf2Gi3Gc96YmUfiTqFaqW6M1y56qxGucdlW4fHBx9WJrZEIDqM/RPkFdL40Zk6H0C4PiPBCCS/Lk0PBwix1462RVy1Tn0LdFQPM7X4M319qHv/T8piqdKvuQNYY+tV72+vTB2oZlz8kyuY47vZugbrHQcGMa1cXuLxnii1Pgo0fdiGlCjW7x5thoeRaxvuGoDs5O/w0y6AQxEcqicigYH9SZalV1cmcXcOvUFVKo/ib7bFvm3ua5lGGA+Rjx25w1qMHV3ZPzUbQFEw==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(376002)(136003)(39860400002)(230922051799003)(64100799003)(82310400011)(186009)(451199024)(1800799009)(40470700004)(36840700001)(46966006)(36756003)(40480700001)(2906002)(41300700001)(5660300002)(8676002)(8936002)(40460700003)(6666004)(26005)(478600001)(356005)(82740400003)(81166007)(336012)(426003)(1076003)(2616005)(42186006)(6916009)(316002)(36860700001)(47076005)(70206006)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 13:22:06.6176
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2997d4d3-dc7c-4f2b-b6d6-08dbd6268d0d
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C716.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB6796
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 13:22:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105748

This is needed to be able to build mosquitto-native.

The dependency on libcap when building for native is needed because
cmake will pick up the existence of libcap from the host, but then the
build fails if it is not available in the sysroot. Unfortunately, there
does not seem to be any way to explicitly tell cmake to not build with
libcap.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../recipes-connectivity/libwebsockets/libwebsockets_4.3.2.bb  | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.2=
.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.2.bb
index 5e6069fb8..b80c31a1e 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.2.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.2.bb
@@ -4,6 +4,7 @@ LICENSE =3D "MIT & Zlib & BSD-3-Clause & Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D382bfdf329e774859fd401eaf850d29=
b"
=20
 DEPENDS =3D "zlib"
+DEPENDS:append:class-native =3D " libcap"
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

