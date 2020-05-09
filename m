Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.44])
 by mx.groups.io with SMTP id smtpd.web11.886.1589043979215916236
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 May 2020 10:06:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com header.s=selector2 header.b=HikIT+5G;
 spf=pass (domain: vaisala.com, ip: 40.107.8.44, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IxH+33FsmZ1B6VpbWj8pghuIhXrHpN8oatXQ441B4Liktgz8OJUyK14cmU6QuyOKr1CMKQ952kpR8dI0ilEdLIxF93b43wPjTK7IaKr6I+f3WhiLqGkymzjOJnMQ+zbXhlaQXJfuSnedZpkueta5xEWoO9Byd4bRGW7oKr3OIkW920WD2KuiPfHsmoJJIFsorb8JK7TlnVOpwMts+9qZT80rhZET465gNpYdKpk3urk8wkC7JOrS2LAMOuu92U39JzCyGMCL/sIK/Ej+Pa+xwnhSjmbdMfC9Xo1b5Y+TABEYVQwjG6zKQWOWOwamk/hfPCnQqM/8Ut0UuckVwYXysw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ASjFJ1arJFOLDFcBZ6VoZP2eMi7XUWkBDS3NCYDHrU=;
 b=PuhSOnzE6uS/KoaTAVakn3wrk918XsaC01yJtWBOA/Y7VkD+N5js/YgqIW7yKl7Q41C/1OPa+0HNfAb1yPnyKqhYo3BnKK07V6bFwZsL5YNzrAvUCydH1AkxF93fLOhq5pF2v0flr7M1hx5FgbQUt7XPp5wMDtNQlZ5eQl/IN9MP0GI7zDAvQvNdxVDeXVVSZIfQhlKxyD21FuhUjkMI7IRfcHbV/375kw+UPuPshJ/vWnRkwkYESMG0IsDa+5HzPqNiCttuEa/7L0+y8TJLWf4dEI/p9pivIsmD2g835dqxx9WbspacsbBE8sK70tGGdjJ6NQwl+f5hgc5vECYO9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ASjFJ1arJFOLDFcBZ6VoZP2eMi7XUWkBDS3NCYDHrU=;
 b=HikIT+5GgPK/JjXz8shY/kTka1S5Gr3a6duhVPxebKDR3DYVypwbI1PPDxVFI5uqEUj96HK1wQAgO3E96Cclxu8aji4g7slfi1kHyGTGkEPU9k42KVbRINPjPEoapKhQX0X48mvB1j+6QkPC4ufv//iq82LpVmY6HjE5LYojOCc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=vaisala.com;
Received: from AM6PR06MB6198.eurprd06.prod.outlook.com (2603:10a6:20b:ff::26)
 by AM6PR06MB4997.eurprd06.prod.outlook.com (2603:10a6:20b:68::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.29; Sat, 9 May
 2020 17:06:16 +0000
Received: from AM6PR06MB6198.eurprd06.prod.outlook.com
 ([fe80::a1db:6da:abd2:860d]) by AM6PR06MB6198.eurprd06.prod.outlook.com
 ([fe80::a1db:6da:abd2:860d%5]) with mapi id 15.20.2979.033; Sat, 9 May 2020
 17:06:16 +0000
From: "niko.mauno@vaisala.com" <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-python][PATCH 1/3] python3-setuptools-scm: Cosmetic improvement
Date: Sat,  9 May 2020 17:05:59 +0000
Message-ID: <20200509170601.99455-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.20.1
X-ClientProxiedBy: HE1PR02CA0086.eurprd02.prod.outlook.com
 (2603:10a6:7:29::15) To AM6PR06MB6198.eurprd06.prod.outlook.com
 (2603:10a6:20b:ff::26)
Return-Path: niko.mauno@vaisala.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hel-eptripper.corp.vaisala.com (193.143.230.131) by HE1PR02CA0086.eurprd02.prod.outlook.com (2603:10a6:7:29::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28 via Frontend Transport; Sat, 9 May 2020 17:06:15 +0000
X-Mailer: git-send-email 2.20.1
X-Originating-IP: [193.143.230.131]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4a3e3d1-27a3-4bf0-7204-08d7f43b48f3
X-MS-TrafficTypeDiagnostic: AM6PR06MB4997:|AM6PR06MB4997:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR06MB4997433AE8AFE2C679118CB481A30@AM6PR06MB4997.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-Forefront-PRVS: 03982FDC1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1tVbj/y78W97zlFgmDBinLEiUDyF5BwANabM2I/OswFYoS26lw3COFX6DJKKWM0nCeZRWrNEp5tIWVvq9Rivnz/EKIJQQKvHymiKBjEtRTXquGVrzmKtCXAd1WBKwUFKcHLI2cmd4NgX8qFXR4AadP3y/X3F61g1FNQBwV0OO6CBA1wuwZDz+KAWOGP/llkeb/feCkQlSwm61NiGfb5TflX++T8rY+iWJLHocG0/LlB7UnnJGo6bJPvgGnMN3P0xQGJdQwKd8SrAYobNw9izUNWPzIjra0ceZEjY4bk5vstUrEP8iS5EXX82hwukozm9mV45MlgnkHm1yEYzwxOxWiqDp52urL8wAwzilw25NFyeCjFXKDR6/7JNgTTvDMtMhfx1buS6NPBvx7+SMy0VqBC5MSLJykcZABuX1Q2adOKrpdXA7aLEvjGnvFtjcsgu2MX4bZtXJ81M2r+PNeq8HemXBfC+aBjO2o8tW3hnqFX3R/heY3b9RiYG+z3McE5srlU0H//sPEq7952huo+Wig==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR06MB6198.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(39850400004)(136003)(366004)(376002)(396003)(33430700001)(6916009)(316002)(16526019)(26005)(186003)(33440700001)(8676002)(4326008)(66946007)(6666004)(66556008)(66476007)(956004)(8936002)(86362001)(2616005)(1076003)(107886003)(5660300002)(2906002)(44832011)(52116002)(36756003)(7696005)(478600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	8MZdYEa1LrWrgxb4xFpTm4dCSMQ9sg++ZVLB6xpxyegsMyMBOMx4NerED36wigh4eiLujddkJFRQp+Q+fabkbnCmetiop4f0xU8f4qUR9wizkMiLGKDmb0O22eKk0WPCw/7582El5SUuEeRkw6NpaliTvSQG2Xtj8tB6uTgjtS8KVyQHEyXbMJQI1PeYgLRqBMhxvP+AkElF3grzSReU+Me8teopxraVczZIEKjp1u3G8Tz2cr4KCqtYnj5eN8t6ZJXX5Kk3T9bLgI8jROQcHFDYR6+XD+h3eiO2dAgYR0sklBM60dYUwPUUa9CkJnOX5onXXFyK/lQruG3zyHCGecaPr9r88hFf5ZRCpJ6f4QRSRN/JY0qL7Lb8kj0rBnhY21Q2heD0780i30iegPFfcbtfFxLqIgP2u8BySuhJErAbQ7GfvaiyD5poEgBlhIDXJuzGDCDgJVEtiBkNY2OJXY0elA/gVSW2NPdqvQX8CZirTqxmlX7BpqPxWmH/s7N6
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4a3e3d1-27a3-4bf0-7204-08d7f43b48f3
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2020 17:06:16.3584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U2a+NZOG1FVGWHEoVv1WOcOHDfcaYRv8hmzZ0tesc4oDn/NSbt2MkQSVNRfY879mf5PW1PkoRJbEvZje7iwrlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR06MB4997
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Split values of RDEPENDS variables to individual lines in alphabetic
order.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 .../python/python3-setuptools-scm_3.3.3.bb            | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-setuptools-scm_3.3=
.3.bb b/meta-python/recipes-devtools/python/python3-setuptools-scm_3.3.3.bb
index f8d28b33a..c061ea2e6 100644
--- a/meta-python/recipes-devtools/python/python3-setuptools-scm_3.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-setuptools-scm_3.3.3.bb
@@ -8,7 +8,14 @@ SRC_URI[sha256sum] =3D "bd25e1fb5e4d603dcf490f1fde40fb4c59=
5b357795674c3e5cb7f6217a
 PYPI_PACKAGE =3D "setuptools_scm"
 inherit pypi setuptools3
=20
-RDEPENDS_${PN}_class-target =3D "${PYTHON_PN}-py ${PYTHON_PN}-setuptools $=
{PYTHON_PN}-debugger ${PYTHON_PN}-json"
-RDEPENDS_${PN}_class-native =3D "${PYTHON_PN}-setuptools-native"
+RDEPENDS_${PN}_class-target =3D "\
+    ${PYTHON_PN}-debugger \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-py \
+    ${PYTHON_PN}-setuptools \
+"
+RDEPENDS_${PN}_class-native =3D "\
+    ${PYTHON_PN}-setuptools-native \
+"
=20
 BBCLASSEXTEND =3D "native"
--=20
2.20.1

