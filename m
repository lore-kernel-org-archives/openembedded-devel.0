Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C76EBC54E58
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 13:03:30 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.86])
 by mx.groups.io with SMTP id smtpd.web11.62334.1710162210344475386
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Mar 2024 06:03:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Uw9WvSXz;
 spf=pass (domain: axis.com, ip: 40.107.105.86, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FJ387TtBtjUKlUgGfPgSwUNszkgw7FOAdpnFmwU9mXB/pdJSsgUcPNbuaG+rwAp7Myrgknzxt4SlBM4V9MVjGacJMNRNQs3VJe2/m7P7mS/TCpINRJL/nLJxqeXOmzrjQD4YIQ8bZoZ9IPSrUDHTfFsVoiqMEUM5mS3PwDZjh06+MPBfC6WECvbLhXnNwxoP9HajTixD4Bq4sL3LrXK/wP01PPvVChhlcWsIFQjTPeRlt8eZhJYMLlgi90bq6/NunDw2jpOYw4Kj+fzyJYFdxiEIkMPLbvZu/NGnMI1efY/FLZ12xugcyoPqrKMi1FXk6Og6g91YiP+rtovhLY3ljw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1mHTuRnM7pAIa3cB80Lyc2YahsLzYclFEJwUb7jyM3g=;
 b=cZvEFRkOiteVlxReBoPWAhHNzt/so/w4TZF2ZxpW/DPc7aZ0uG50fzMuk4tk8VkmHKmBjV1JWbkOWqE/Tu5eqe+EyZY3tDzztbKEE/5OaguWiv6vDShekLRuWnR6EpDnfzee+OBlKTKm/fw6wCZdNRF1oz5afjzwUhwtVmIm33qIaHpAEDqr0rf+rZKKlSTFdw1Dz/IfzxeW4SHL6QmpsiXkuDlBxxLVgHJ7Hfgz1YFRJud37oWe2UrWt/2f1TL1YEqhfTx88C0zdy7ODrKsrUb6pa+6wMakd6Vrmt6LI1/6YfuMqqgdcvBAn6V2c/2vwhYs0pLKv9fYj1httqvsvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1mHTuRnM7pAIa3cB80Lyc2YahsLzYclFEJwUb7jyM3g=;
 b=Uw9WvSXz8XmBa626nIJnocv4DbiDIyHDpagplH5LOlEs/yBVeuY8ZSFppPBkrkLYQqkaDXE+sYB/lJT6nTJ4to2W5dFC5iCJgYUorqKqi/bYVehwujBUfl6otMINqXIbI9rxS4I1KdI/SUn4SAfbSP2koEWOLLkbYYMKeIMRyAI=
Received: from AM0PR03CA0064.eurprd03.prod.outlook.com (2603:10a6:208::41) by
 VI1PR02MB5903.eurprd02.prod.outlook.com (2603:10a6:803:13d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35; Mon, 11 Mar
 2024 13:03:26 +0000
Received: from AM3PEPF0000A78F.eurprd04.prod.outlook.com
 (2603:10a6:208:0:cafe::5f) by AM0PR03CA0064.outlook.office365.com
 (2603:10a6:208::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35 via Frontend
 Transport; Mon, 11 Mar 2024 13:03:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF0000A78F.mail.protection.outlook.com (10.167.16.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7386.12 via Frontend Transport; Mon, 11 Mar 2024 13:03:25 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 11 Mar
 2024 14:03:25 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 11 Mar 2024 14:03:25 +0100
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 6B4E7161AA
	for <openembedded-devel@lists.openembedded.org>; Mon, 11 Mar 2024 14:03:25 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.17.1/8.15.2) with ESMTPS id 42BD3PDP1867719
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 11 Mar 2024 14:03:25 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 42BD3PQR1867718
	for openembedded-devel@lists.openembedded.org; Mon, 11 Mar 2024 14:03:25 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/2] abseil-cpp: A little clean-up
Date: Mon, 11 Mar 2024 14:03:21 +0100
Message-ID: <20240311130322.1867704-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A78F:EE_|VI1PR02MB5903:EE_
X-MS-Office365-Filtering-Correlation-Id: 7065de5d-3af8-454b-0e28-08dc41cba3b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Kk1fOV7hetrpQY4zjRKcpBlCtGDABhBwYF7DzAsnCDF7m2tMQFhrVDbFSRvH/saAhow5/EU3+To2+jS2RcXRgi9RgihYoTlzdVogORnOSRAHfyf0PaKhcoBJZ/zkSROtbJJU3qfhovcLRKgU/HYFlAzsy13gLMq7kzD5akAniJiuuPqhizlXWwkaaJYeQgRBFkyL5ylpaQZTLP9ms60cG2CuVsrB4J1uNtSFW3ZqpfkZeJBg87Lum4XK6lsQSEZ19inp/v6Ewp+tYp9a2E4cWmOFWq3A+uErOw/Rw8yZ498ea+rXopx1vbYwbvDrURS+TBAMO3G3OBuzRdjp5H4DWvcysaib7r6V05c/k0wVDWAEJtjwGBtbUMxDz2L10HqDTD/tuPos0ZmKqlRgWryEIYo5zWSpePtzITmjD47pbOF+ntwPjcchwnfxXrWAm5+FKo6oNTq9tteGOHFodA0Z79Gwg4gpj04qB9PjZn6Rpzu8P5G6xCWFXN2way8cAS9DJKhCnwNRo9t51WYLe3n+7QQJ/IrV6snN6d71xzCUkL6qR1hY/8oSpFdnyyyuIlI8zwTfP8g1Ohspre4if8RTF1tx0keAeBSyOsocecGOlZSXze5ySV9q18pXaWnp6bo78uSCQiI+H0pjbJqSZUeDemh83tYlzdR3AV4PxyW/cGC9k6IZFBYfGrYWlLkiarq0xjXRqo0B9ujIG3O82PYkUQ==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(376005)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 13:03:25.9951
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7065de5d-3af8-454b-0e28-08dc41cba3b4
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A78F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB5903
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Mar 2024 13:03:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109270

* Remove ASNEEDED:class-native and ASNEEDED:class-nativesdk as they make
  no difference since ${ASNEEDED} is only added to TARGET_LDFLAGS.
* Remove additions to FILES:${PN}-dev since the added paths are already
  added by default.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

This restores the two commits that were (presumably) acidentally
reverted in commit 903c8e58ed2240f7214261c9005a38f15d782c29.

 .../recipes-devtools/abseil-cpp/abseil-cpp_20240116.1.bb | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.1.bb b=
/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.1.bb
index 82b2d20e0..9cb325870 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.1.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.1.bb
@@ -1,7 +1,7 @@
 SUMMARY =3D "Abseil is a cpp library like STL"
 DESCRIPTION =3D "Abseil provides pieces missing from the C++ standard. Con=
tains \
 additional useful libraries like algorithm, container, debugging, hash, me=
mory, \
-meta, numeric, strings, synchronization, time, types and utility"
+meta, numeric, strings, synchronization, time, types and utility."
 HOMEPAGE =3D "https://abseil.io/"
 SECTION =3D "libs"
 LICENSE =3D "Apache-2.0"
@@ -18,9 +18,6 @@ SRC_URI =3D "git://github.com/abseil/abseil-cpp;branch=3D=
${BRANCH};protocol=3Dhttps \
=20
 S =3D "${WORKDIR}/git"
=20
-ASNEEDED:class-native =3D ""
-ASNEEDED:class-nativesdk =3D ""
-
 inherit cmake
=20
 EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON \
@@ -28,8 +25,6 @@ EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON \
                  -DABSL_ENABLE_INSTALL=3DON \
                 "
=20
-BBCLASSEXTEND =3D "native nativesdk"
-
 SYSROOT_DIRS:append:class-nativesdk:mingw32 =3D " ${bindir}"
=20
-FILES:${PN}-dev +=3D "${includedir} ${libdir}/cmake ${libdir}/pkgconfig"
+BBCLASSEXTEND =3D "native nativesdk"

