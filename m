Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15137.1793540909784890909
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Nov 2026 05:48:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@gomspace.com header.s=selector2 header.b=mRg8H79X;
 spf=pass (domain: gomspace.com, ip: 40.107.130.73, mailfrom: mns@gomspace.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gq782E4GEov7JBxwvh4mMGathbrUets/X0Q5FsCgOLXcFOFR04SoJWUmNeWUvSQhaQugxcOQaEDVb5mIs1gDfgfFLyFlc21g8SvI70dQ5xf9Nfh/810BtQ7Q4XRpW5HurwcvBYhIVwCUqwCKTJZ4dUVdz24BjyJ/zumXBau0Vt3rsfoDy3zGvLWe1UH4LGu8ZsLPT4s5hbar+EeuzsR1LxPb1MvSTQVKmqOyITfsuDDhpygCKQ2i0Gv+n2g2BXUq/0sI8o9P16Txkf0WZvZ+kU9sXHGMIxjhJVUO5af+GLS3T0YdHzcdXrW3B8jrliuGY0b8nQQpRPWXAUbOOK3pbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BOkGSSB46mEZd9M0U9bgExGEPglva4ll8dgOtEpSZCk=;
 b=Tf1ywHD0yGyOKxwQR8y+jcXSlPOKKT1uke3QJtjuQVNfHs45AmfczQkD43gQzKkRltGMpSx2MU1LRNfuG5nhaedwk2KZ6fkoOFxIqGWxuCq3smWqNxqAHnj53tZ4C/jp97T1J/Lr4Bh0HZeRZ/ERv01RHKEzEoy49d5gg2vFEJ+x7blytMNj3qHnwxo9ep+069JijpXy+PE4gW9ZPy+pCIYn4ct6wLfY2oFjjO5YCxaHscauBezz67KDDsAq9TkZbOh4/K9He5qWoYDPqledF2IbfydHJYHslmmnlQ+f/qBAXI5thjN92v1vi1wocn4EOE0994afnKmDFiu5Q1AbHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 77.233.245.163) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=gomspace.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=gomspace.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gomspace.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BOkGSSB46mEZd9M0U9bgExGEPglva4ll8dgOtEpSZCk=;
 b=mRg8H79XE/YhPvcSj4JL6SGeklfXd3cgKg64b7vAX3YiEYpsb3tufjaNIspGb9TbZ4Lv4UNuCL9Nd8x354XrV6by/ftXwsAzswq4iNirjdGb43Y79XtkpeduONa1TNicWTqtOxXACxjrHt4RflTBMIU72xKzDVj+orQOSdB27Ks=
Received: from DUZPR01CA0263.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::11) by AS2PR08MB8312.eurprd08.prod.outlook.com
 (2603:10a6:20b:557::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Sun, 1 Nov
 2026 13:48:23 +0000
Received: from DU2PEPF00028CFD.eurprd03.prod.outlook.com
 (2603:10a6:10:4b9:cafe::6a) by DUZPR01CA0263.outlook.office365.com
 (2603:10a6:10:4b9::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Sun, 1
 Nov 2026 13:48:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 77.233.245.163) smtp.mailfrom=gomspace.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=gomspace.com;
Received-SPF: Pass (protection.outlook.com: domain of gomspace.com designates
 77.233.245.163 as permitted sender) receiver=protection.outlook.com;
 client-ip=77.233.245.163; helo=webmail.gomspace.com; pr=C
Received: from webmail.gomspace.com (77.233.245.163) by
 DU2PEPF00028CFD.mail.protection.outlook.com (10.167.242.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Sun, 1 Nov 2026 13:48:23 +0000
Received: from DK-AAL-EX03.gomspace.lan (10.0.1.61) by
 DK-AAL-EX03.gomspace.lan (10.0.1.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 1 Nov 2026 14:48:22 +0100
Received: from ThinkStation-P3.gomspace.lan (10.0.8.56) by
 DK-AAL-EX03.gomspace.lan (10.0.1.61) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Sun, 1 Nov 2026 14:48:22 +0100
From: Martin Siegumfeldt <mns@gomspace.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Martin Siegumfeldt <mns@gomspace.com>
Subject: [meta-oe][PATCH] spitools: upgrade 1.1.1 -> 1.2.0
Date: Sun, 1 Nov 2026 14:48:09 +0100
Message-ID: <20261101134809.1979507-1-mns@gomspace.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-Path: mns@gomspace.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028CFD:EE_|AS2PR08MB8312:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e645386-e9bf-4282-5f64-08df381ecbe4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|11063799006|56012099006|261009223027099003|261021121427099003|261021123027099003|10067099003|18002099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info: 9IF60ZflGHuPTlecXMVdSuhcru1TVEB6Gz8WbnMBDRHZUI2ihrbPSgiEwEi7C3rAKxZnfnKht6KhrswgziUfA8FVnM0QxDjeNXS8H2nZGnfxGADNUQ2YNHOrdn1eJzWVKuPIkb885qsvu1LdI+8McojqbYjpEX7GfKn0KWpRHlS5cgBvKuHwjvLNZWFTOxq0HPSjVRRdfESMLmX09R/wJ0Bp0vJR//qoSlYSphURspJeZIcNZVcqHYjOIxqjA5h9GVrw0j4cNuWpfMIPzzAt1vQQu93zbzqX2mkyjVr4ecR7Mix0wLoo7vevyOzq4JGnaF/5AxQYsQQXz/1uPGyi3tF8eg6n/4fhmxHyTWch6Xvs3/D++p8mAkjSO8QOzEhhGsLFJombGcY8dEkGQ+wS46NL1VtG/S3svnd+aMxSwUahjgJhDBuEfrpZy58tZ30+ogfTz6ozz/DXUJwbOCJ2xu+i3c7uTOD138nr/us+Sv1IWfjnOoCBpeCOWl05397Ise6fDH2+d3gnowa1CQOsaMw3izSJWyxwwy5/WCYuVmD4UBwataBlulEhEpLs+/+l7jaKGGRiH33/RfWDKS3KfXFJ9ItjNky2fY7PHopBSl6VR+M2vsVZqFKA4kh1oc3cW1QEjClZ//3Z5U/NDEmCucKopL8LMQrxSMSB2fb4hz1MptuRn4iqMLYgd8Sn8FPbFDOoCZ3art3XrQK/hgxbXw==
X-Forefront-Antispam-Report: CIP:77.233.245.163;CTRY:DK;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:webmail.gomspace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(261021123027099003)(10067099003)(18002099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: BcN8zVRKlNaNRvLdA0K3rj544lY6WTG2amgOVp3QJqyY7gZWqXFz5MuyqJShXQMZcDULF/wMkHBa8yB4qSzEs3ZkG+Jsihf7UYFyf+Rgt92DCMxaBpzEEKq7Vy3oR1XLFM+vKmgkbtm4Zvh9fvWiympTy8YYrJ3Th6XIm+RNYC8IFmuozP4Pud0+zpsds5DbLejNsAsDNKY70YW3jA6iNvC/jRB6QmlqxpqEejE1QICcK1r8JWx5nJ5M6Gzda32ZcZ4LcyoMdb4EnfiE0aJI3ld6Bz10Ftu6XkaNST9wGgWVY0mOxH6Ww8KbHqaUguv0H0evUGRqrR48U8Whg6bVUn6FplHXTDyIu62pQ2Qgb7TmGuiLSohRDQywSCM+o6DSETW5O4iHizXuaQrZGgGjQ7xPBpjwh3AdgBawSMy6svmcKgpdTCjEgOcjke/h7tY0
X-OriginatorOrg: gomspace.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2026 13:48:23.0245
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e645386-e9bf-4282-5f64-08df381ecbe4
X-MS-Exchange-CrossTenant-Id: 91ed1e54-6d8b-4599-84d8-65fe75fda3d1
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=91ed1e54-6d8b-4599-84d8-65fe75fda3d1;Ip=[77.233.245.163];Helo=[webmail.gomspace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028CFD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8312
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 01 Nov 2026 13:48:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131726
Content-Type: text/plain; charset="utf-8"

Signed-off-by: Martin Siegumfeldt <mns@gomspace.com>
---
 .../spitools/{spitools_1.1.1.bb =3D> spitools_1.2.0.bb}         | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-oe/recipes-support/spitools/{spitools_1.1.1.bb =3D> spitools_1=
.2.0.bb} (86%)

diff --git a/meta-oe/recipes-support/spitools/spitools_1.1.1.bb b/meta-oe/r=
ecipes-support/spitools/spitools_1.2.0.bb
similarity index 86%
rename from meta-oe/recipes-support/spitools/spitools_1.1.1.bb
rename to meta-oe/recipes-support/spitools/spitools_1.2.0.bb
index e2ab0a5d11..d14affa9fe 100644
--- a/meta-oe/recipes-support/spitools/spitools_1.1.1.bb
+++ b/meta-oe/recipes-support/spitools/spitools_1.2.0.bb
@@ -3,10 +3,8 @@ HOMEPAGE =3D "https://github.com/cpb-/spi-tools"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8c16666ae6c159876a0ba6309961438=
1"
=20
-SRCREV =3D "74ba65b19e0cf9d1eabd52d17d842200ef901d61"
-
+SRCREV =3D "57a950d2853aeac3e69c4f79873c0ab9930e4f7f"
=20
 SRC_URI =3D "git://github.com/cpb-/spi-tools.git;protocol=3Dhttps;branch=
=3Dmaster;tag=3D${PV}"
=20
-
 inherit autotools
--=20
2.55.0

