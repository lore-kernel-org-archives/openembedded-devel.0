Received: from EUR06-VI1-obe.outbound.protection.outlook.com (EUR06-VI1-obe.outbound.protection.outlook.com [40.92.17.62])
 by mx.groups.io with SMTP id smtpd.web11.3444.1590870576119726676
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 May 2020 13:29:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=KEDOGDoZ;
 spf=pass (domain: outlook.com, ip: 40.92.17.62, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eNdA4Ga8qNILEmaZRbaE+qXgrwEuaKJ9zH4Mky8VRtOhfRH0v21xOCry7rKYRXwkijpHTlntISgNzpr1x1u1GJlQQ4d3NvtG7BqKpLBXGYjojHfb+Ic+qKSI8sB4BxO1kPCRDuOKUNBgTlv21DL8/nnDZ/qEjXtv18Cyr4LuVtzLuWc/FBe9gGVELxNpeEhAU/4DwTDbn4mRZ7/iK6370v1yVhKc/AEwCAWeDNNL7YT5kXTbl5n4cjVEnxFVAOZyzhmAr8toFpc0YXdTh0rseTc+JkCShMeTttEjn0/mM8b6dHC58SA0fjhA38LwaZS2OG9Dn3v0KIV3G+in/vtAEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V0E/DgUNMVih2lIZYJTfER8tqZqEdJRKDcXONjScsak=;
 b=PKTwylzpD5zUs3AJFNUSQxnZOoGT0m0L+SXNtTiR4BUSDQXT84Nvv3UH0gmQFs6RaKWcXpDkjsKkBTREMaSHUwGKC8ydZho+Mm741uWL8QxTy484nEftRlgVJLakNyRqzh6Xa7elnibuZcY0LGf6ae1Mam2B4SW1IANeaFFkD6VV0DFff7fMRNbXR0p0/pN9yi3FSTFJuajBr76OWjGq0T1p3LDlLzyEOJs2odrSnnoVnZZSuF6vezMBtZDQNcuAwpJd1Skbhnn7+wxHsFE9YUplb0Tu9gylWFf5lfGjBdLIm+8ctc2nT7zk8f9e1gX3xTkP0x1Ty14SJwR+8ai/mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V0E/DgUNMVih2lIZYJTfER8tqZqEdJRKDcXONjScsak=;
 b=KEDOGDoZblR2YN7YcAfSXbZh3A2dUjuctNdUOiHpiPH0Qa2Kct56QikMpak6WZrEn8Nq94fdcCzQaacHracM2204kT5Fz51mUR8g9m09kYge2j9BzQlkEStNKardxgB371/KKaPXN3ex05Y0gZsQtTKC/xFZlSFn1yykGh7oEa1anYqyvIemkHMIV14O24F15LldNNMYbpI7N1WWkvAddY8sGdr4Y3OzV1gu3odR8dmmZtmRk6Zz7zdhuD8EOPf/ADtP46BnSFVBW+u0lbJn4DXCYsHqvOggfWCZCLmOyJ/n+ujJ2dRuGWzJ7hzdOpsOBLZzBZyMruV8I0Ks8ebQYg==
Received: from AM7EUR06FT008.eop-eur06.prod.protection.outlook.com
 (2a01:111:e400:fc36::47) by
 AM7EUR06HT043.eop-eur06.prod.protection.outlook.com (2a01:111:e400:fc36::102)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Sat, 30 May
 2020 20:29:33 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:fc36::4a) by AM7EUR06FT008.mail.protection.outlook.com
 (2a01:111:e400:fc36::498) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Sat, 30 May 2020 20:29:33 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:015B0DC6EA2C6FB5145B5A77ADD389E8A6672409465DFE5F0769F679B5126ACC;UpperCasedChecksum:0075CE7FD5B038376CC95A06E3E5884FDEE662C652836C9FA93AF4FD392A8618;SizeAsReceived:7445;Count:48
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%7]) with mapi id 15.20.3045.022; Sat, 30 May 2020
 20:29:33 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-devel@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [meta-filesystems][PATCH] physfs: fix typo for HOMEPAGE
Date: Sat, 30 May 2020 22:29:20 +0200
Message-ID: <AM7PR05MB68817C9A5CE23B1A919D0162A88C0@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
X-ClientProxiedBy: AM6PR04CA0019.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::32) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200530202920.12156-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.150.43.214) by AM6PR04CA0019.eurprd04.prod.outlook.com (2603:10a6:20b:92::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19 via Frontend Transport; Sat, 30 May 2020 20:29:33 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200530202920.12156-1-kweihmann@outlook.com>
X-TMN: [YBIljXHNxD/KKlxFS6My5Dzi10gU8csB]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 075103c9-2605-4391-c634-08d804d829c4
X-MS-Exchange-SLBlob-MailProps: 
	ISIDp/2nRg0LbhmRkG+SGJ+bq9IBJ0s0Oy8A7ee7HVg5LDmDH1rArQYysrTJozJ/j0u0PoOeiIxe988NbL21+gg8i64VaCX4i6nCapLp/kQvqeWiCheFyr6O5MVh+UtqHPwEaeMNN3VY2HVYD5jiB2yY7uCQHdaB5I7v+I0K1HrDpzl9TxUEJX1en4W0bS2n9aFXSUQvSBYCmEv1abjSj+0zLtlYECTS72hURIHaeklSKqQhkKlDe2SJ+n/RP7QD5me9M3iq4nclc0nqJaoZNgo6T+h9fo+TvPp4iy4xcFsYfmKnOefjFWuHfYVKRgI4Zjwjb15ICatCDa2KdIO9sN5Aac/QGGQTq+gtWZDRA1IEqC2g6EOtG7q6/etItfECPwixb+zDQpc9O/Pcu1fop3GZfmOPS+9rr36ipqz41Uv/cVUk353UBjFvBjBTSkQiVCKU+ij+0Zb+CdfNPvVSpzER6OATlnoAZ7Um6jmt3bSTchSwID6xDix5mvCBvW8c6svViaEkOKFjGQUoUjOaonVFLe5UniZIEYmYUiCUUabj1wWZJTgWn65cB6wKkbsRHEoaarzfdIoqEb1A3JYIr4+ip84C0rVSlKGXBlZLYlp4MBRtYmSAkBckoplcwO9ExiIVEoQbAegtwRQ2Y0CU31WRa6tTsIFIn2xeOsponuAiRTZY6NZ1KO9P5FRg1SyH7112OZqHvsPAJZEnuCCv/FA35y3waaVNN9PUrWdQ8cgCb4TWVJBWSYxq1oBSb7PpIqDNOct0Kfg1YCOADSBsKaAJlUdgt1LZi2DCv9twXVMZu6DdAHyWI7KXTQ/KxXooaMJu8S3gNG8TnwQQFWejg7LPibgXrqE6299Zn0ideZLM1daat3tgo91d8vth+PZnBft7MkKL6sg=
X-MS-TrafficTypeDiagnostic: AM7EUR06HT043:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PlETiGQtO2d7DKl2Dwy5RilWsKIfxQxuAY/eAxtU1DaLgJ80FnTiOcYUzXhAITbaB2CmQE/RdeI5IIJxRHXa+gAe6evB0EMCRLfEriQxZehTOZ4AfykxxsQjsqzpt4OpbZVYlBt5WDhoZxZ5uHMgXM/b/i+Xa7iIITdAAvarZSwL+d4QK65gUAqUjBA+vH/dfQDI7Cl+6FDvjBMpTsTs2lgV7sIUz3NJzN3oLOqUlSAhLeonsK5zNKw6T2fKNPeE
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	lXzPDCrlc2Lnqok0oNPgBsEx4xf/tcczjtTqQO0JE6bMlhDX82ULEVjswhzr8mX71yLpyu5e07N8z0FhZIvWwb5w1ZZL8BiUgHjPc0NzSxIfE3F5mJnyRYwawDYxSi2xUb6Pg7ZU0pBDkT+RhuBDBA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 075103c9-2605-4391-c634-08d804d829c4
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2020 20:29:33.5463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7EUR06HT043
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta-filesystems/recipes-support/physfs/physfs_3.0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-support/physfs/physfs_3.0.2.bb b/meta=
-filesystems/recipes-support/physfs/physfs_3.0.2.bb
index a0033fab5..57cfdcdf8 100644
--- a/meta-filesystems/recipes-support/physfs/physfs_3.0.2.bb
+++ b/meta-filesystems/recipes-support/physfs/physfs_3.0.2.bb
@@ -1,5 +1,5 @@
 SUMMARY =3D "PhysicsFS is a library to provide abstract access to various =
archives"
-HOMEAPAGE =3D "http://icculus.org/physfs"
+HOMEPAGE =3D "http://icculus.org/physfs"
 LICENSE =3D "Zlib"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D96801882d1120239dcafbf888e8=
21a6e"
 DEPENDS =3D "readline zlib"
--=20
2.20.1

