Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.89])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1910.1794212298828325958
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2026 00:18:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topic.nl header.s=selector2 header.b=W2nf6y7N;
 spf=pass (domain: topic.nl, ip: 40.107.130.89, mailfrom: mike.looijmans@topic.nl)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L1Do88Z5+2xk5/2WNuQg9aPSS2OGbek93cFiZ0z/VJ/E6DiJrF3weTY25FQCGMRqLcPcq2O9M9Gt7xIIdY9Bon/imq4HvmaP+xpWTwdIGi9PAnuoRQ59ryPmxX1/ZOMiv02Xxx6UsBR1nRl+qQOITkVpola0VhLCBPjDveb/ylVf6gudZFfWyjMg4DTjlG7VtMnF8vua30lkzBVyOXDTD/vw7aBYQya1SZ0pvSB0+9QxCHsQWpKv0lFXVXZs+a/DhZa0+HEs+OwOwCpICjqSJBRnS14PuZog+64ouSikTT+kf0gMvrT+3wYGSIwOusR0YCf5xKL4dJqxe+ZsiKfSOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nxtPuc2v4/29ghP3qrwPO+YlLn4VZX7pQvCEyvB8Eg0=;
 b=iwkzi+ivnbkpdVpi3ZPtxGwWHtSPAe1Sj+lk81ibDe6xD3nkgeUww9IkePUZgxMMyWEe5bx6fJzcPNTft1i6+6cKv48YEJUvSj5rqkspr6vKMBRPWaSK5/X5+uRBMF9qgKgUgW9PNrZeXMDfW5RoXrNUmCC8TAFCD0qvThXi+uNaX/9ZhlcjrUWzp3kyaD+esN+AvgX3OJ1bKgTsi3VkBtWUJQMDVHTRF7FWFsmhmGzIteWpMiCTe6Mwli5KQqRCu+7wfTo0gqSrI95WsOCRC7WuKGXEu21icfiNXUp/1/8L40dCg9UmRf3GxOes8m6gGpdzZryxEpOKMaffhvxKMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=topic.nl; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=topic.nl; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nxtPuc2v4/29ghP3qrwPO+YlLn4VZX7pQvCEyvB8Eg0=;
 b=W2nf6y7N5k+gpizxTh1E3gK6QPzh9xSUvtFC+Do0oNN6xyyUQtXROpWJ9iXrQa5Z9DwgiaNn+xobJTJvdSbZdnsh2phlA3EjT4wV2N1RpFX9Fq0rDM+hTn/OW/zJ8OImFWhzfKnhZVgC6GxI8EQ39aXYog4cOEWI451qQRTZ25AclmHC1OnxZzNfOca+3nsIvjC2lY1Mc9vF3irbhFc8QNMlYOiRYNsuAyU1Tg7o6+ylKnE38gEPdwg1S0crwB/gxvo0+TC9fhP/A///MgItY82TEfYJKenlDQBa+ADrSJ+if5wmyco55hd1u/YOZu80Y+IVfOjc7VAu20DsysDXnQ==
Received: from PAYP264CA0010.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:11e::15)
 by VI0PR04MB888289.eurprd04.prod.outlook.com (2603:10a6:800:366::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 08:18:13 +0000
Received: from ZR1PEPF0000E6B2.eurprd05.prod.outlook.com
 (2603:10a6:102:11e:cafe::10) by PAYP264CA0010.outlook.office365.com
 (2603:10a6:102:11e::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.12 via Frontend Transport; Mon, 9
 Nov 2026 08:18:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 20.93.157.195) smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 ZR1PEPF0000E6B2.mail.protection.outlook.com (10.167.241.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 9 Nov 2026 08:18:11 +0000
Received: from DB6PR07CU003.outbound.protection.outlook.com (40.93.64.94) by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Mon, 09 Nov 2026 08:18:10 +0000
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from VI0PR04MB12030.eurprd04.prod.outlook.com
 (2603:10a6:800:316::24) by DB9PR04MB11658.eurprd04.prod.outlook.com
 (2603:10a6:10:608::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 08:18:08 +0000
Received: from VI0PR04MB12030.eurprd04.prod.outlook.com
 ([fe80::e428:3105:17ec:8224]) by VI0PR04MB12030.eurprd04.prod.outlook.com
 ([fe80::e428:3105:17ec:8224%4]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 08:18:08 +0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-devel@lists.openembedded.org
CC: Gyorgy Sarvari <skandigraun@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>,
	Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH 3/4] mongodb: upgrade 4.4.29 -> 4.4.30
Date: Mon, 9 Nov 2026 09:17:52 +0100
Message-ID: <20261109081800.69803-4-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109081800.69803-1-mike.looijmans@topic.nl>
References: <20261109081800.69803-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.f9094234-951b-4310-bc36-a26b13f25d60@emailsignatures365.codetwo.com>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4PR10CA0006.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dc::6) To VI0PR04MB12030.eurprd04.prod.outlook.com
 (2603:10a6:800:316::24)
Return-Path: mike.looijmans@topic.nl
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR04MB12030:EE_|DB9PR04MB11658:EE_|ZR1PEPF0000E6B2:EE_|VI0PR04MB888289:EE_
X-MS-Office365-Filtering-Correlation-Id: eb08c541-8a6c-4c0a-18be-08df3e39fed6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|38350700014|10067099003|56012099006|261021135927099003|261021133027099003|261021130227099003|261021123027099003|261021121427099003|261022113327099003|261022105027099003|261022075727099003|261022115727099003|261026130827099003|261009223027099003|261026140227099003|261026135527099003|261026121527099003|261028144727099003|261102123227099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info-Original: 2n2gy9Ql8YMk18p3k2IUaJJQS3Y2fhbhiTXIv7/KzeowIwLT4s+smPMjc0E0TL40SzlAKb2Cu1imi3y+SPq8m9mj4QeF3LQUfkSm31P0OzLpLu11YAEYmFA8r0lITxSmwrvTjI/FuJpGcMnILuqsHfS/iCaY5DQKXCulsIgPyoCKtN0QAuXrxkqXzLXGiY4weiQy4oJiytmfGOKAb6TlPT+XL2ZcPW3mJr0xKWIB3YWHi3zzMIqYWu91Dvm4O+LNHn4mP+JCjR4t54uRcD/UOXyYAKmkRNQHjrv9/1jLiHu+Z/vN2HjGY4wMfDrCOb9mymRImvCSzIHWfWUayDUvN6e26F87A/WsWfIDJDqiVmw9RanP3nDgurEb+oLdWOz+Y0UBCIkNnW5X8r8xYPldwbAWbHaiV+rmThzjxs57v3pb47SKRsHc8wcXzLwkBLanJu6dmZz8zMIICJirdIHqQ3hmzAYNDLunTkjsGwXiE34xMk0AMcWmdn3ifIyWc1zGIB25TFm5i064sCijm6uIHEItkHfitPyByqAoJ7bCraO6aCSb59RoT9yK2cSH2nBZNXem0V8fcgsybs7WSeStwvNOj77iLOJIPfMyVKOAY4eOIsk+oTlBEj5NNRVE/EQwTlsCphMiYMTgPNl3KlIbJ90x3eCdjAdes/XbWLKwNm05phTRvzMWZOudba0enKNm8J5rkLQGj3rHul7cwzHf1twgzNDF1I1pTG93l/MfYXU=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12030.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(38350700014)(10067099003)(56012099006)(261021135927099003)(261021133027099003)(261021130227099003)(261021123027099003)(261021121427099003)(261022113327099003)(261022105027099003)(261022075727099003)(261022115727099003)(261026130827099003)(261009223027099003)(261026140227099003)(261026135527099003)(261026121527099003)(261028144727099003)(261102123227099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: MYhpgCBqUj2RwKu7t3F7Ut6a5/KWUOfG9X6EbB/+FgvOpiyBTFbxvuSQH3nfy9X9+xjYflIFyARzVGk1vGj1DYNRrbSD/5RKRzchCTTncGuS/pc//LaZcFGFPZQXqgYEMU67EZRI9gmkjH2KUG1A0MroGUwKxv1v+u3fqS/gI+hva+DHkkzEW8PEF0Gp9xdcfTlY8A5ZS+oWc12Gh25SmbSLWKXcacGSF20Laf/F/E+6s2+/LjIDFodqOrN6NpfHYNyC4/tyqeLq+GpEjexK1LsIgotY6YncCOQY9pjt6ofBIlsofpdJ5QR2xMDWXIgQlcprqzo2yxU7AEcJxVvisg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11658
X-CodeTwo-MessageID: a000dfdf-a05a-4811-b574-cab488af08f8.20261109081810@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: ZR1PEPF0000E6B2.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 72682687-80ef-4cc9-d70d-08df3e39fcbe
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|82310400026|14060799003|376014|1800799024|35042699022|22082099003|18002099003|3023799007|4143699003|56012099006|10067099003|261028144727099003|261026121527099003|261102123227099003|261022115727099003|261022075727099003|261022105027099003|261022113327099003|261021123027099003|261021133027099003|261021135927099003|261021130227099003|261021121427099003|261026135527099003|261026140227099003|261026130827099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: Vxlb6vaEtUCqcwBHexe2R3vg5z+LBhmQgs6Ylhe4t8xhjy5Rih/pnYi2Zj8fhJNWukUZFK4hqB6XMYKy9jsRBfS09xNL07VrgZiIt+j4OuPzetCaLQNcLrJgAhdmh0WOb4Zkp78usPwIduPWBoFgky6K9YMKzBlOqGD7060+f3ECWb5j7F3qivaQ1KhXloGInU1NUYhrU7PPNHKOZCWnwyGKS82e+Q9hs1ya3s+/YqyhiJ9USbxTYZVbS2xibEDdhLX7WaOzV2iVTHbdrOewIUQEAp80vCmzDJ2rTe7b90/kfwEjvSKuI8swfI+VKxs1y+DlB9GngtLSEiaTmClUHgyYLRoUTKHHxtfvXuxRntlsW9JlKywNMWeASLbkQkUPKWGqg3WZVeFFX/cqE7RRN0RG5iE1Rybi4QOkPdsUWCKQIC68m+V3vfraVeWVHpCkm2DgEfpMWFZqJOqBRZ3ZJ6+i5hUCeQQfEyEiMNm32TIuf/E/VcQkuWBpDK6wBDbkKlvaIEfPOmdfDHPWWZtheMH6gKY8XTHdNQ5UgeQbnSvOTVMTjWPEt7wx6vuZVD6WywJZ8RgdgqiXGY0BISVHdh5IPedz4oePxiM2J3pS0F8NOoagGPmxulPOMeeYsSDJEbdASwuKi2Qq5G1P6PTKqQ==
X-Forefront-Antispam-Report: CIP:20.93.157.195;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu11-emailsignatures-cloud.codetwo.com;PTR:westeu11-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(14060799003)(376014)(1800799024)(35042699022)(22082099003)(18002099003)(3023799007)(4143699003)(56012099006)(10067099003)(261028144727099003)(261026121527099003)(261102123227099003)(261022115727099003)(261022075727099003)(261022105027099003)(261022113327099003)(261021123027099003)(261021133027099003)(261021135927099003)(261021130227099003)(261021121427099003)(261026135527099003)(261026140227099003)(261026130827099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 2pp8/EoT4mVUMEyBTn2yQnsENDWhk9wG9ZeK8XquaGb4v5vFFwijEH5Q61dpExw5W95ZJ416tXRmoK58y/k+CY1byFPUYqZlUc3VR/5yrsbHRLpPdhtR5Z9JHq7FXogAjCovs/LUWKomPpi6zkXB/TuBVfIhet8Y/plOVd9G3ShzuML1QuPfPdbMHlP7ThOoSJxiXtLkFDTkTnPQ3SGrQQfpN+ACo/sb2qbS9rEF/MKP9nDN5c+chOFUS4g0HiryeAfU65FRzKEmndLc/ro0kItRSvOUWKI7kqPWtxZ+kNhm21H9e0ZZubGHphmtn5cQbC1dq70QYiZhyKLy40MGNuJqa7BsDsQdYpmwLK8zFzdan60JRouyGCHDs2j78WxTMqbBELVHua5W6Emfvw8kXc1a0JKgcZUkeI7xBlqHbt4AtNPojYDyv4mBLajCUmE7
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 08:18:11.8716
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb08c541-8a6c-4c0a-18be-08df3e39fed6
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[20.93.157.195];Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: ZR1PEPF0000E6B2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB888289
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 08:18:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132051
Content-Type: text/plain; charset="utf-8"

From: Gyorgy Sarvari <skandigraun@gmail.com>

This is a security release to fix CVE-2025-14847:
https://nvd.nist.gov/vuln/detail/CVE-2025-14847

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---

 .../meta-python/recipes-dbs/mongodb/mongodb_git.bb          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb=
_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_gi=
t.bb
index 339bb38a2b..720ddef416 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -11,9 +11,9 @@ DEPENDS =3D "openssl libpcap zlib boost curl python3 \
=20
 inherit scons dos2unix siteinfo python3native systemd useradd
=20
-PV =3D "4.4.29"
-#v4.4.29
-SRCREV =3D "89d6ffe6fc67b36fd47aff6425087003966588e3"
+PV =3D "4.4.30"
+#v4.4.30
+SRCREV =3D "1ae4c9990dbc5711f3500748f0c3f8b5d375d8c0"
 SRC_URI =3D "git://github.com/mongodb/mongo.git;branch=3Dv4.4;protocol=3Dh=
ttps \
            file://0001-Tell-scons-to-use-build-settings-from-environment-v=
a.patch \
            file://0001-Use-long-long-instead-of-int64_t.patch \
--=20
2.43.0


Met vriendelijke groet / kind regards,=0A=
=0A=
Mike Looijmans=0A=
System Expert=0A=
=0A=
=0A=
TOPIC Embedded Products B.V.=0A=
Materiaalweg 4, 5681 RJ Best=0A=
The Netherlands=0A=
=0A=
T: +31 (0) 499 33 69 69=0A=
E: mike.looijmans@topic.nl=0A=
W: www.topic.nl=0A=
=0A=
Please consider the environment before printing this e-mail=0A=
