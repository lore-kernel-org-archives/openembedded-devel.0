Return-Path: <radovan.scasny@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F1F6C43334
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 13:43:26 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.59])
 by mx.groups.io with SMTP id smtpd.web12.7854.1658497401867382269
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jul 2022 06:43:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com
 header.s=selector2 header.b=pFjF+Da7;
 spf=pass (domain: siemens.com, ip: 40.107.20.59,
 mailfrom: radovan.scasny@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BUcltqwLU5FAy/H4r86Qa+41OcXkNbDrGRb3ncSBknQXED0HKksyqh8iUfixs26Uv8mCDZg6WifL0zYlEbkqlNVPOvOailyQkgT8n8QzLC95IB+BBYuj3nYGQ/6tHOjCSt87aryCYmmnhAp0S9OAiCJ/5lTuh0lun/hTakjgtUO/i7iouq+8aFdEIELw9ZTFJlYLwboEyfHAPq6BhGYAkWA9w3MQRego0cCAEPFCVJefCN2oUYa8Gzq2gJlYdbLwFkPaORQ12HFIbH8BllFz0sARIPwqDYc2+zPNiPbC2xehEY7hlgpC5YR55msR7WIuU+RmlfurwinKSUjyCszKJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RrvWapUJoyMgM6IDGLLpcWTNpFdqOPXv2/C5UdoIXaE=;
 b=DDUrHPtUit0uUWORAednzkZI2qCpuI9yqjT8JUpIGGtxoybG1GrlvKdlRzU9niKbdZ9gRVSyYvmEvK39Caepv7htjP0uM96edFdfbvltVABUahONbkTb4DEYxLoxH3zSuHwutwQMBYGCYMy5usf5dlXmyc3ZlaIrodyyBKH5SecDzP6lGJPyFJRZVGY73wYwKnHdGGglLtDGtqvIs6ooe67NEsdWv4sK3XTuDXcw7A0TZvwiuKDPN60/jiBt7UBENRaDayu2h9is98+ixAmohDvlGQtl5iRHvAn8o3ji5DCeRkkCUICtNkmxWZ+Z0LPE4UkCxPXGY9A0wzw7OL99BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.71) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RrvWapUJoyMgM6IDGLLpcWTNpFdqOPXv2/C5UdoIXaE=;
 b=pFjF+Da7XNXi0jTCrTR/3N6e6GT5r1I88u/+C3s7Vjd2D9SxNe518j24pqKXum3zO8vwcOkjNpokQv0JraW7UL8G1RZycRRYrbElTpJrzT8dibp9Ao/e4TbpIs2MSp66DDnrcs65JWdB+PNrlwq1aKtJbfcD0U1HIQfxXJzJgxqoWTiA+LE+0Vor1bXu5WiZhXTMTAp7HP6JyjGkB0pZVveJVxaHJyfiRYeXzfKqQBXlRY98mJgveY7YYnEzr4uejDRj+unH+LDRreFhcFI2XfGXxXPsGyqwjKI13pxza0jGF5K8Ol8beFMyN+0wP2rXXP+7UimgBaxXBuMa+LgxQg==
Received: from FR3P281CA0087.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1f::9) by
 HE1PR1001MB1258.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:3:f4::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.19; Fri, 22 Jul 2022 13:43:18 +0000
Received: from VE1EUR01FT012.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:d10:1f:cafe::53) by FR3P281CA0087.outlook.office365.com
 (2603:10a6:d10:1f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.1 via Frontend
 Transport; Fri, 22 Jul 2022 13:43:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.71)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.71 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.71; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.71) by
 VE1EUR01FT012.mail.protection.outlook.com (10.152.2.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.17 via Frontend Transport; Fri, 22 Jul 2022 13:43:18 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SKA.ad011.siemens.net (194.138.21.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.9; Fri, 22 Jul 2022 15:43:17 +0200
Received: from dev.localdomain (163.242.52.226) by
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.9; Fri, 22 Jul 2022 15:43:17 +0200
From: Radovan Scasny <radovan.scasny@siemens.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Radovan Scasny <radovan.scasny@siemens.com>
Subject: [meta-oe][PATCH] libwebsockets: update to version 4.3.2
Date: Fri, 22 Jul 2022 15:43:05 +0200
Message-ID: <20220722134305.3700-1-radovan.scasny@siemens.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [163.242.52.226]
X-ClientProxiedBy: DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--11.045500-8.000000
X-TMASE-MatchedRID: w2v9Jv7BWPdDh46X2zKVIA3KvrUy7pE6Qv1bdJD/UhqLeoWRUsfdQOvc
	TjVWUqx9b3fekrYOSQ8IHKB/zIEcKc3fQ/yES45pLLhn1z+tk45/SIXlNk8872gws6g0ewz2BGv
	INcfHqhed8WUQUstiNA7oYcfGGBkPoRuvpUfhO5mbKItl61J/yZ+inTK0bC9eKrauXd3MZDWXf5
	sC39gVVAInmkISBl56NO89EYKy/g/LwFiSAZpk4Iy8uUSM9e1TWClYJu9r4yY=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.045500-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: 
 EDA9990295B7ABB9654DE249C985E43BB36EAE35B3352D4B5E77944C1A5E8AB92000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0fab3488-53e6-4e78-99af-08da6be8227e
X-MS-TrafficTypeDiagnostic: HE1PR1001MB1258:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kqIrolh2ffeaX9QbhK4/y1hAIFH8Kfpm3muOoEMom2d+aNsC2KsVVnEApgSP2NMlio/ZrzUSeVI62kIjjjtNGnRjU17Luvn5rksRxz3d8l2LrIe4UN8K7onZwo7groncD/+xldZaclFx2kin2dgDj6b3z5ZmM2sePcqi3++0rgUUP05i7qoE3f3AW3UeWjbcT4OtCbpo4UhN3TAt0Kn250/LgxUnwgOLsO9M6twXbbf1jxd9OQMHgeApv2UCuc9eDRPN9YGkOx1YRhr7v+BeFJ+l42wV4Mgv8c8w7N5z60oIJKT5fOatoUESKBk17kqrV7cTH9kfnmkEwQFFYlHinsQUSasrqARIgXpW3BxuUUZ58EB3TEo4T8FHskIuGUXCXFvV7DWtIgC34ilNM6vOypM3IfRC4aYPdF+PaBh2oFXFjW6tElOTsV/P4xVcaPPDd5PIzoO5ju8oaGA1rWIc7Trbh/PUqjgSO8pqIW5BYxZ65JFLlmDwOEtJXib6o8nO0akUFQOUbgyteVsEkoTFdGT4BXGUS7qlnVDB8sXTketxoo+Mz803pRX3IyEQN+0mJ4mbkqHlRhpTVk4USs2RB4clY0HXWHt6GAkF91up8Kfd+c4h54j0frNhwKkqbT7l3GSltm1YmA/YQoJHJjHlyl9hjt39jxFVVGiQE3xF05WVysfomQ/K43mre6ZzEpQxB0v6L7qMDDyKFR0IH6TSltkf0AZbOjgd/vsiniVB4KeCYuwf/iKU+j2h+eNbAvLPtQiYtL/4r8vSCHcG7hDaBWBqaqhhvzHoR8JqiPZjM7/N+MO6VWTTBxUBQCtjYIBSYHP2m7GqbtkVI3AdU+webZsBfmNWBm+LVZTgNcWs7zygg3dWVWrbGclfwkd8Aq8H
X-Forefront-Antispam-Report: 
	CIP:194.138.21.71;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(39860400002)(396003)(346002)(46966006)(40470700004)(36840700001)(478600001)(70586007)(316002)(82960400001)(36756003)(82310400005)(336012)(86362001)(186003)(26005)(70206006)(82740400003)(83380400001)(8936002)(8676002)(81166007)(6916009)(5660300002)(44832011)(4326008)(1076003)(41300700001)(36860700001)(6666004)(956004)(40460700003)(2906002)(40480700001)(356005)(47076005)(107886003)(16526019)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2022 13:43:18.1114
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0fab3488-53e6-4e78-99af-08da6be8227e
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.71];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT012.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR1001MB1258
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Jul 2022 13:43:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97947

Signed-off-by: Radovan Scasny <radovan.scasny@siemens.com>
---
 .../{libwebsockets_4.2.2.bb =3D> libwebsockets_4.3.2.bb}      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-connectivity/libwebsockets/{libwebsockets_4.2.2.bb =
=3D> libwebsockets_4.3.2.bb} (93%)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.2=
.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.2.bb
similarity index 93%
rename from meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.2.=
bb
rename to meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.2.bb
index 2a3a4ebd06..21297f2c4e 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.2.bb
@@ -1,13 +1,13 @@
 SUMMARY =3D "Canonical libwebsockets.org websocket library"
 HOMEPAGE =3D "https://libwebsockets.org/"
 LICENSE =3D "MIT & Zlib & BSD-3-Clause & Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc8bea43a2eb5d713c338819a0be0779=
7"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D382bfdf329e774859fd401eaf850d29=
b"
=20
 DEPENDS =3D "zlib"
=20
 S =3D "${WORKDIR}/git"
-SRCREV =3D "8d605f0649ed1ab6d27a443c7688598ea21fdb75"
-SRC_URI =3D "git://github.com/warmcat/libwebsockets.git;protocol=3Dhttps;b=
ranch=3Dv4.2-stable"
+SRCREV =3D "b0a749c8e7a8294b68581ce4feac0e55045eb00b"
+SRC_URI =3D "git://github.com/warmcat/libwebsockets.git;protocol=3Dhttps;b=
ranch=3Dv4.3-stable"
=20
 UPSTREAM_CHECK_URI =3D "https://github.com/warmcat/${BPN}/releases"
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
--=20
2.20.1


