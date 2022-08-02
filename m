Return-Path: <julian.haller@philips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9704C00140
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 06:26:30 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.128])
 by mx.groups.io with SMTP id smtpd.web12.3110.1659421582154417266
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Aug 2022 23:26:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@philips.onmicrosoft.com
 header.s=selector2-philips-onmicrosoft-com header.b=PZb6TElh;
 spf=pass (domain: bbl.ms.philips.com, ip: 40.107.6.128,
 mailfrom: jhaller@bbl.ms.philips.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZUKUl1xiw43FXK8M7o3DjbYtdaYI7b/rtW+Y4L3JM1sfVh9xSL1EDa00iWJYw3thPKYFRTphRCnVHAPD+vHwjl3/997V7xI8ubXGs2zQq23JuXIS14qQYQn45+khzlwCxsvpITbhZcRgGi/15EhZmyGk127kv6PpRuBQ/5YdGQ3d/CvlsnnGtwuwiT8ZtWX2bsx4zRKGbEJ5Y6QoFIrBU+VNaRfjThjn18peWBB0B5Bmi09BTa9svgvsTRbuWBN5WDiMkifGY6ZGKoiB8j42GkG7d4Pf6Myd6YuM+Udn6wuRuN1cdZlCyQSbCffUUkDsHoGWLclCQSYMFg2okzvsow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VkgoQDNcSAoyMGOZBd1jpwFchkMEzlgCq5VZgVLe164=;
 b=GlwY8ZOp96WqGIVz3gKC7fn1EbReohzhY7d7GNrgY38aooxjrDkwf6XgYg89XyWntE+yatDARIhRaHit7Hm7sO51YHrUo2OhWD9oXV5Wj9CnX4+BzOR62/U9O7jvk6I7CUIVehjoo0PLwo1ZG9q4vniDcjSxdQANvCS00xcW/ekm9qrkI2vlhD46NPI9KjMHiMPecWU/1vzv4n3wf6kpo6jSVIA3x71E+zHWO2ziVvpqnzmH+1jFZ7TX98PRscALRTvjMIBfygiPzrvz9GqTMFEHvT0vAGkxsZpz4v3XFJEpDhbrmmpRWDSpayYq4LAIEJsfp0Z09Oqbehv4BLpGAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 212.159.232.72) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=bbl.ms.philips.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=bbl.ms.philips.com; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Philips.onmicrosoft.com; s=selector2-Philips-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VkgoQDNcSAoyMGOZBd1jpwFchkMEzlgCq5VZgVLe164=;
 b=PZb6TElhaZlzACkYBCTE+mfmfX6Wef0+WNci6Qbvlve6FylWFlwSBGyOj7pM1GS6Wp77DRbblyiwHC3+YIEZCWf6VT3kkLu1MFr6IxoJzdA5VBCBuN1YC7GgQo6d7FF0Ob5OwLVUdrfX/nWJJEYa70HkFszrR4T1lQz0JsAJLgE=
Received: from OS6P279CA0033.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:32::15)
 by DB5P122MB0070.EURP122.PROD.OUTLOOK.COM (2603:10a6:20:1e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Tue, 2 Aug
 2022 06:26:19 +0000
Received: from HE1EUR01FT078.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:e10:32:cafe::15) by OS6P279CA0033.outlook.office365.com
 (2603:10a6:e10:32::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.10 via Frontend
 Transport; Tue, 2 Aug 2022 06:26:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 212.159.232.72)
 smtp.mailfrom=bbl.ms.philips.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=bbl.ms.philips.com;
Received-SPF: Pass (protection.outlook.com: domain of bbl.ms.philips.com
 designates 212.159.232.72 as permitted sender)
 receiver=protection.outlook.com; client-ip=212.159.232.72;
 helo=ext-eur1.smtp.philips.com; pr=C
Received: from ext-eur1.smtp.philips.com (212.159.232.72) by
 HE1EUR01FT078.mail.protection.outlook.com (10.152.0.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.10 via Frontend Transport; Tue, 2 Aug 2022 06:26:18 +0000
Received: from smtprelay-eur1.philips.com ([130.144.57.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by ext-eur1.smtp.philips.com with ESMTP
	id Ik63o5hHal9ZiIlMAodH7s; Tue, 02 Aug 2022 08:26:18 +0200
Received: from mail.bbl.ms.philips.com ([130.143.87.230])
	by smtprelay-eur1.philips.com with ESMTP
	id IlMAoPXLQbpSaIlMAonDIx; Tue, 02 Aug 2022 08:26:18 +0200
Received: from bbl2xr12.bbl.ms.philips.com (bbl2xr12.bbl.ms.philips.com
 [130.143.222.238])
	by mail.bbl.ms.philips.com (Postfix) with ESMTP id 7AD6D183496;
	Tue,  2 Aug 2022 08:26:18 +0200 (CEST)
Received: by bbl2xr12.bbl.ms.philips.com (Postfix, from userid 1876)
	id 781612A15AE; Tue,  2 Aug 2022 08:26:18 +0200 (CEST)
From: Julian Haller <julian.haller@bbl.ms.philips.com>
To: openembedded-devel@lists.openembedded.org
CC: julian.haller@philips.com
Subject: [meta-oe][PATCH 2/2] ccid: upgrade 1.4.33 -> 1.5.0
Date: Tue,  2 Aug 2022 08:25:49 +0200
Message-ID: <20220802062549.2984568-2-julian.haller@bbl.ms.philips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220802062549.2984568-1-julian.haller@bbl.ms.philips.com>
References: <20220802062549.2984568-1-julian.haller@bbl.ms.philips.com>
Reply-To: Julian Haller <julian.haller@philips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 37f85653-bf0d-43ca-db4c-08da744fe91a
X-MS-TrafficTypeDiagnostic: DB5P122MB0070:EE_
X-MS-Exchange-AtpMessageProperties: SA|SL
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rOKgpYQ957LKeNMf0OZy7bXCRJ65aM7sNlPMftsttzQD7d2wmUGDNdoPzaSwFP/u1mrDiBSogj5AJasR4JNIEQD6w4D2o7pMbou/gkwUue2siGBhMdy0Wwfb8VVKPR4WOY8wurKMBOLbTXhKtW8yl1+0J7b0kSWlNRCjUU+Ug9cCivPBNRuigAlrxzz8bB92ST1Ixbwi7I8/exqI04hN0/JWxTQrO2anLKqOcNuDA9nP9j4S1m4LiqGUc738mgmHcJXrVjd4VOIXWOQ1+3/CDR7nC712ErMM8ESdMOf1yEfrSyvV9vtewBXrRKF9tGwN7/Gt90K8/drQ+wKwMzbFt1HG3nQFq1wyuZuNu6kvSC79q9hUeu1ct9Cz8lACFg7aLzfBTUjTjgLHMMVECAUpsx3ip8IRsrDOvgA/xkLrhtT0B4VobDslR1ul3a5vCG0e2l+SvrAuGQl8+c+D4NnfhJ/w/2FNfmYi7eUq6mdHhIYSyLdvBmr73TLxevEUXwzPfY6L8Aldj+iypOB9ZKPXEfIVcbg+/Om3DFWLxmkpKKgQL2SSZGMg5wHfeeUSUkwby9cFyK7RA24/vbrgjPdJd/YYq4DwZG5JqdyISFadwFOUIKkm3yJZsMEl3eeE0kVbD58vdwVBotYG5NlYLzw4vIKTXVmdvvPdKbvTDWakw7Otz7+7QG+3voCBjzRiYrsJOjC1ea9p6kO8fWiN7w3X9UM/gpPfTqJKlXC8bQXih/YNRc26XtLLkqbUWBtUolMIr5V2rTdUfakMfXcuwDWELLoSSV7+LeiV3OnuaDlFtFmFpE0G3Rdo8g+7H7zFBox9lwos9pPrNuiA9VDEUqV9kA==
X-Forefront-Antispam-Report: 
	CIP:212.159.232.72;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:ext-eur1.smtp.philips.com;PTR:ext-eur1.smtp.philips.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(376002)(396003)(39860400002)(36840700001)(46966006)(40470700004)(36860700001)(6266002)(26005)(82960400001)(82740400003)(356005)(7596003)(7636003)(82310400005)(186003)(1076003)(83380400001)(40460700003)(44832011)(47076005)(478600001)(426003)(120186005)(336012)(2616005)(70206006)(8676002)(4326008)(70586007)(40480700001)(42186006)(41300700001)(5660300002)(8936002)(107886003)(6666004)(6916009)(316002)(2906002);DIR:OUT;SFP:1102;
X-OriginatorOrg: ms.philips.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 06:26:18.7502
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 37f85653-bf0d-43ca-db4c-08da744fe91a
X-MS-Exchange-CrossTenant-Id: 1a407a2d-7675-4d17-8692-b3ac285306e4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=1a407a2d-7675-4d17-8692-b3ac285306e4;Ip=[212.159.232.72];Helo=[ext-eur1.smtp.philips.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR01FT078.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5P122MB0070
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Aug 2022 06:26:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98078

From: Julian Haller <julian.haller@philips.com>

Signed-off-by: Julian Haller <julian.haller@philips.com>
---
 .../recipes-support/ccid/{ccid_1.4.33.bb =3D> ccid_1.5.0.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/ccid/{ccid_1.4.33.bb =3D> ccid_1.5.0.bb} (6=
9%)

diff --git a/meta-oe/recipes-support/ccid/ccid_1.4.33.bb b/meta-oe/recipes-=
support/ccid/ccid_1.5.0.bb
similarity index 69%
rename from meta-oe/recipes-support/ccid/ccid_1.4.33.bb
rename to meta-oe/recipes-support/ccid/ccid_1.5.0.bb
index 7b260f177b..9775d82fae 100644
--- a/meta-oe/recipes-support/ccid/ccid_1.4.33.bb
+++ b/meta-oe/recipes-support/ccid/ccid_1.5.0.bb
@@ -3,15 +3,15 @@ HOMEPAGE =3D "https://ccid.apdu.fr/"
 LICENSE =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d5025d4aa3495befef8f17206a5b0a=
1"
=20
-DEPENDS =3D "virtual/libusb0 pcsc-lite"
+DEPENDS =3D "autoconf-archive-native virtual/libusb0 pcsc-lite"
 RDEPENDS:${PN} =3D "pcsc-lite"
=20
 SRC_URI =3D "https://ccid.apdu.fr/files/ccid-${PV}.tar.bz2 \
     file://0001-Add-build-rule-for-README.patch \
 "
=20
-SRC_URI[md5sum] =3D "b11907894ce2d345439635e2b967e7e5"
-SRC_URI[sha256sum] =3D "5256da939711deb42b74d05d2bd6bd0c73c4d564feb0c1a502=
12609eb680e424"
+SRC_URI[md5sum] =3D "f246d6601856775310c86b841b616de5"
+SRC_URI[sha256sum] =3D "81549b3422469d503996d03a3aed2ef1375b359167f10d66be=
9e3844e729322e"
=20
 inherit autotools pkgconfig
=20
--=20
2.25.1


