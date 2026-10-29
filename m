Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.97])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8781.1793269923975124638
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2026 03:32:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@gomspace.com header.s=selector2 header.b=NbkKIUrC;
 spf=pass (domain: gomspace.com, ip: 52.101.70.97, mailfrom: mns@gomspace.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H0ifM/GenQkHTvHX707JvsuX++I2/5IzCJLm7YkAM2uFgK80MQfeRuPYYAw1jzQZHtjy2kjug5MhpYOCWZis5khu2c0NVCqG6Hy79ntNt8ZsasI0C6RHyx96XmYkpuviWnTH8tZBLS6/7M3kOu8JrUY/VC8IRStE/7gQdgQvioz2FaGoWBQ+y8lvVeWFC5mG16zl9XPZf1U9pyDqK+3XGNilQixObQhSpLVuU4EsHbepiI7EyM6XRKV6wrEqQ6o1EkE8nJGtWq7AOmpjVwMloEmViKfP0ZWrAUxYYlfnZNQbUzu49fyz5C9gSko80AKljOEO2TpfNwL8z7PhFeVnDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RpOQqBD6FFeZzadoF2slMyZQfQgOqTunULlqmmG36FM=;
 b=lu40lo5xcq3W6NEpNUZ9eD5njhuYagUeYkCW6vF2KZwjAftPizWunXJG1iKdk4UfYz0O8Aqk5z7z/5PIYtUeRFa5cgA0923defo/hsTAxHqzbtECv9zF3j2hPwXhzgeOvUL1QA9IBwNZiYJtYjpxlj2IO8Ft7/FHgb3R91l4dMFaopfU0C4+Ls5cs5MBr7LkmqYnmIAvHFlQTamLXPn6Kh3cRSa7jBTSd/SDILTmlzK9b8cVH8kIwu2HFGSSLgK4TnDLvQxQXBu3kFnfVmq7QHUSwNZ+dDkuhlmq1IEWIupFlFj3aA2BPhd9GSsMnK0NiyiWaUbGBDBBvKQVKRTb9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 77.233.245.163) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=gomspace.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=gomspace.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gomspace.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RpOQqBD6FFeZzadoF2slMyZQfQgOqTunULlqmmG36FM=;
 b=NbkKIUrCo0d8+sgH3vRvsIPL5sDFfP+R5xAWuMICLdLwtG9CB1yOdm3244YUC+BUm3ascV10FGSwh6omaxbLb2Rm0LC2CpebKNOXakOUfhO3zX9Yvw6bvP0tDnGIzcDejLZDsEZkqZO3Kt2Rw2YmpY8ApGCxCX0ioBy9rtc0wAU=
Received: from PR3P193CA0040.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:51::15)
 by DB4PR08MB9312.eurprd08.prod.outlook.com (2603:10a6:10:3f4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 10:31:58 +0000
Received: from ZR1PEPF0000E6B8.eurprd07.prod.outlook.com
 (2603:10a6:102:51:cafe::7c) by PR3P193CA0040.outlook.office365.com
 (2603:10a6:102:51::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.8 via Frontend Transport; Thu, 29
 Oct 2026 10:31:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 77.233.245.163) smtp.mailfrom=gomspace.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=gomspace.com;
Received-SPF: Pass (protection.outlook.com: domain of gomspace.com designates
 77.233.245.163 as permitted sender) receiver=protection.outlook.com;
 client-ip=77.233.245.163; helo=webmail.gomspace.com; pr=C
Received: from webmail.gomspace.com (77.233.245.163) by
 ZR1PEPF0000E6B8.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 10:31:57 +0000
Received: from DK-AAL-EX03.gomspace.lan (10.0.1.61) by
 DK-AAL-EX03.gomspace.lan (10.0.1.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 11:31:56 +0100
Received: from ThinkStation-P3.gomspace.lan (10.0.8.56) by
 DK-AAL-EX03.gomspace.lan (10.0.1.61) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 11:31:56 +0100
From: Martin Siegumfeldt <mns@gomspace.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Martin Siegumfeldt <mns@gomspace.com>
Subject: [meta-oe][PATCH] luaunit: initial recipe
Date: Thu, 29 Oct 2026 11:31:38 +0100
Message-ID: <20261029103139.3887962-1-mns@gomspace.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-Path: mns@gomspace.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR1PEPF0000E6B8:EE_|DB4PR08MB9312:EE_
X-MS-Office365-Filtering-Correlation-Id: 0daf8235-5e98-48d0-9f54-08df35a7dc1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|260925022911599003|260925021911599003|260925021311599003|11063799006|261026121527099003|56012099006|261009223027099003|10067099003|261021121427099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: WI1moAVU4A4Yb0lT9KnyE8UBmzBptEPq+NSj6xS6T1xTMgYeysHc2TJN+TqY33OfRxThdG6JUvaWb9FtCxg9zyj1XBsbCl7/ehRdskCRzg5eHsOUn2C0yyghwuLcOJbVpIGoG1XA5rvBsw+nH6xADKZ3w8W/x6tlH1kX0paYRods6ABuEk/+1NYgKRaPOHGl+e0oqy8ptSP20KCZGWXW3BZWLgRaMPLoPDX9s7gi/AD4N0RU01HKxfW1s/AfqYEdGIlzpsib6Ehj+gageGZMp9yZB+W3mka2HoOtnxPqmKk9kBeprsVBbPSo8XsVqhYrPrNipiXzpTzXVtrWhIfs9W7x5HDqHM65BpE1Ph9ztt3GkXX7k9TaJyNQ///unSDOqvcEB/gPVt5VBP8M0qkbmcwgd4sE90Jva49IZaubnenPBoU2JxTMc71DlFQKSkPg1tw+pID2f3EWyuVdLod3OmFZ0lPudQbtqBTjWWi7nYjFmimPuMrOI0cr71AyRrCIgyIEhUXm9kTgoJMF+WKO3XnKjvHCV2+Vp/n8xHhX/+fyXDDhxZtLt2TDJzqkFIVlKOxS4AiTiP2oHA8NO6cWi9nMFpVfSTy7NV0hSwmhH3iZNM60RSXTpw10TJJwkSPL8qzPWQbeAiH+LvdYJpdHbAJPGIjuRG/jpNGwR2/BjQjz7qFQKGSzFavdUcBS/R4rybO7KQC2FiJmO1Qkgythvw==
X-Forefront-Antispam-Report: CIP:77.233.245.163;CTRY:DK;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:webmail.gomspace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(260925022911599003)(260925021911599003)(260925021311599003)(11063799006)(261026121527099003)(56012099006)(261009223027099003)(10067099003)(261021121427099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Gj5GelJ5du/Q+tQfQz95ThppuKHWY1qOAdqYQp/D8ej4SdtfOmr+IGND5yEuOGM4U0hfzqE2IG/qfTbJpYNmSNrvOaG4Gb+X6K8uOQ97DD5HZGFllE8wVPr42AsLHLy7i7YhGul1GwW7aGMTDxAtkwmhZmNR3oc0hL4OChsClSZI6AN24k1XQJE5SGrqLc5cCdBXURkbZO6QlzmcTsB1RrIM2+ov4BScLMGNA/JhrWT0pnk8uQj32YA8l7tfzONS4zWHqxsfCYNfT/0QVzVfrZ7pvrytYdB6la6q+pzfYA9rgebziIdUCkv35egT4tUK8aliWZyt2ec/MktBmuXLQjW8z1qfcpvhYz2h8OaAQGwWPwNh8OCjkbnWGzKvjvLdLh6kOL+V4eBuac0azbyHZc21iNepWtWGYAMYRcnSNefv/Yot/ZkOCotHRjNMS9pS
X-OriginatorOrg: gomspace.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 10:31:57.8080
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0daf8235-5e98-48d0-9f54-08df35a7dc1d
X-MS-Exchange-CrossTenant-Id: 91ed1e54-6d8b-4599-84d8-65fe75fda3d1
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=91ed1e54-6d8b-4599-84d8-65fe75fda3d1;Ip=[77.233.245.163];Helo=[webmail.gomspace.com]
X-MS-Exchange-CrossTenant-AuthSource: ZR1PEPF0000E6B8.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9312
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 10:32:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131658
Content-Type: text/plain; charset="utf-8"

heavily inspired from version in meta-microblx

Signed-off-by: Martin Siegumfeldt <mns@gomspace.com>
---
 meta-oe/recipes-devtools/luaunit/luaunit_3.5.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/luaunit/luaunit_3.5.bb

diff --git a/meta-oe/recipes-devtools/luaunit/luaunit_3.5.bb b/meta-oe/reci=
pes-devtools/luaunit/luaunit_3.5.bb
new file mode 100644
index 0000000000..5d6d6100df
--- /dev/null
+++ b/meta-oe/recipes-devtools/luaunit/luaunit_3.5.bb
@@ -0,0 +1,17 @@
+SUMMARY =3D "Unit testing framework for Lua"
+HOMEPAGE =3D "https://github.com/bluebird75/luaunit"
+LICENSE =3D "BSD-2-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D3cbaf542c6e9a9dcad6c372227a=
c49a1"
+
+SRC_URI =3D "git://github.com/bluebird75/luaunit.git;protocol=3Dhttps;nobr=
anch=3D1;tag=3DLUAUNIT_V3_5"
+SRCREV =3D "9678c933e71cb26adcdfa6cf1baceb926398eb48"
+
+RDEPENDS:${PN} =3D "lua"
+
+LUA_VERSION =3D "5.5"
+
+do_install() {
+    install -D ${S}/luaunit.lua ${D}${datadir}/lua/${LUA_VERSION}/luaunit.=
lua
+}
+
+FILES:${PN} =3D "${datadir}/lua/${LUA_VERSION}/luaunit.lua"
--=20
2.55.0

