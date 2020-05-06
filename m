Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.96])
 by mx.groups.io with SMTP id smtpd.web12.666.1588807168165371299
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 May 2020 16:19:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=YIqJrQZR;
 spf=pass (domain: prevas.dk, ip: 40.107.21.96, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F1XRw0/9o0ZMcA/D2uWlzvLkgLtC/jWlhpeqcMqJKz3k1hGDb2TURMaPGVgNtAKerYKSe5uV+qruI2viJ+I75rVMgDMIoDWLCGi7nHGo6yLuCo4IWLe9QKH/oCsX92h7ELkWTeKDyFNFyxODFx/A1S1iN+Uzxw4m97ja1s5B1sGTeWxXb8mfsVkGRgGI8mWwA2DqFP6ck+PIvPS0UaDwpQgtbVnH64ENGAomLVzJQJ+RwIhs97us+SouV178EZZIRwAvt/7dOv1NvU+BHpH/tGsWEFHz/umrgzFjKqEvQTNG6ddgM0lGVB/luePo6kdR7PTpkFAeX3+FI9q3W+q14Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KPztbHqXZz9Uxmpgn55kncIzkGuKBpaJLOqwgmnMwhU=;
 b=Q+csoTbmacfYg+US8107TmXsuUOQm1uTAvaPKOThndn3TPGrICnaG8L3E6JgnsU9CbRuOK/xjVk8DVKJVXj7VKrRWtPzgnZRoPgVMIiMvS15pJOdY7AV5S2+KBFrrC/hYYfZvGIT7O2zL4g868TkymwtzCtvnMcB+xcfIySsCsLZEtlbyTXXtMWJoJ3Vh5pqz8OfjKgbmOrwuqphEWc7iXwHyGcCRhlt1iUAUs/5ZFDw0iM8BfX8hP54JZ3ORY6ZlVTTLgOrqGpyX8FfQ77uhG8ADaj+rtitzjmkFgFP2e3fING7nlFQEBcdI2LlhPdut8UJCgK5wkv7lnjvfnnMRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KPztbHqXZz9Uxmpgn55kncIzkGuKBpaJLOqwgmnMwhU=;
 b=YIqJrQZRdI+cCiMNkQzaZwxukYLu2x+4O1TOwwMJ8aoIPFYShyfaD2D2XcZXQpasymsY8Rz/hbYlA5neSzg66B3pevYqZQWcnf+AKAmIPF3xbhZLZ/IbNA0d4h1+GQmxgeXK98TyKr5zkVn8/EG864spNiKzkVHJdp3nC5rHgsA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=prevas.dk;
Received: from VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:e1::21)
 by VI1PR10MB2415.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:8a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.29; Wed, 6 May
 2020 23:19:24 +0000
Received: from VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f0ac:4e97:2536:faa]) by VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f0ac:4e97:2536:faa%7]) with mapi id 15.20.2958.033; Wed, 6 May 2020
 23:19:24 +0000
From: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>
To: openembedded-devel@lists.openembedded.org
CC: bgolaszewski@baylibre.com,
	Khem Raj <raj.khem@gmail.com>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [meta-oe][PATCH] libgpiod: split c++ library to its own package
Date: Thu,  7 May 2020 01:19:09 +0200
Message-ID: <20200506231909.13049-1-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.23.0
X-ClientProxiedBy: BEXP281CA0009.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10::19)
 To VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:e1::21)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prevas-ravi.prevas.se (5.186.116.45) by BEXP281CA0009.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27 via Frontend Transport; Wed, 6 May 2020 23:19:23 +0000
X-Mailer: git-send-email 2.23.0
X-Originating-IP: [5.186.116.45]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c439771-ee32-4eb7-cae5-08d7f213e9fa
X-MS-TrafficTypeDiagnostic: VI1PR10MB2415:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR10MB24153B01B18AE36BB4C87CEF93A40@VI1PR10MB2415.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 03950F25EC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wM6QwuDfXZauqJ8WzJRsYsbwX1LvadCsnNmAELXbnDij3x3LnBx1AYZKdLtRbAEg+guCYbZGAHQ/I9os1rsXOF3f4GUb66UKKvOLyxoyttRq04fxYVz7RLESdsXNZFog2wYt3obuKCCOdmXEFcSvg2kBDrBPab5pXpSMmx+wdvNCbrYTCFZfdqEarPoT0fy128Nat7QdtuOKC0n52HRtihmhkjC2nCMGfDAy4mZtMAeR3EMsXV8jIOwPoP1IdqISPFXrI3ZkHSX01qu9+uFLHT/XPwPoqh4xte2SLl4sLq0vomXlsl5+0f1S3nzgI9Kp4GbAchLoA4ZsubTdaDwJlncHrPu6BdtBcb9m8HLQzoth3IR00dlfUkt1aHcmWMMy81G4kELsgiK2t6WaK6XzA0A1FAgkknvzcVNXiaL3+QmhaLsS3oNmn8cWIvLfxoAVWH4Q1PrQ0hTlUWGcEBRaSOriSuw4w7McgpJo/z2jW7TH9QRdqkBcuv03B1TV9AdRtiZKByNB4ECxY6Rh5df8vA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(39840400004)(366004)(346002)(396003)(136003)(376002)(33430700001)(1076003)(2906002)(8936002)(66946007)(4326008)(8976002)(16526019)(66556008)(66476007)(6666004)(6512007)(8676002)(107886003)(186003)(6486002)(5660300002)(6916009)(6506007)(36756003)(26005)(52116002)(44832011)(4744005)(956004)(2616005)(316002)(33440700001)(54906003)(86362001)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	KMTOdE+91eHL3/Np7x11VJsCR+pdPJjVz+bvoGtYhlw4NqXkk3vCMeQ2Kz03RtgUqBtpL7aDlk76wWcC/J9tKfkEhzza/s+0/vAJqwLKFkLj+TbHzNbMVUFStcKghDLT8Wqz0JJg/ahPf51gSfJ50PsiM3Wkm6O9VLilPCoeBYhIMWYS/03k0p75w9LX8jbcqn3waNBA3OdHCPNA8/kclPf6kvn0+nUFLlBx9L66IswPpsk4HiJo75AnSqw+pLBS+hQE/ZHKR53SaQlfRPBJ82PAYt8AaEFCvzAtCaLZ6jLbJIJLlqYH+zg8wHmb/4dLzqsa52RoCvfOSmJ+fL5ZqzVps/Dsbo8qWL1WDGaLDiVsPkaJMOylt4xZCXnVSeE5+eTSInQufa8Z+Oig++xfCBoXP+vP1RXGL+Ct4jAh5RBKeL6BnxrU/X0nykjRWA2BmOM3YRWdoiz2dNe81JKZfIywKp3Y12VP3iA1/EogJwkwfF15iEIgs9vcAENlEdOSIbO1hmJWbhGI00gTEr0sHWdhkXP2E/L+ZMdtE/oX0sEMWs/q+dHPfVQbA8kGAhHXlzXnfeEcUxxytkcL2UgWqEAsUE8qKwnC53xt5AtVZfU7L/NOm6jEBITIno9SqSny7hKv+z4Q4fOzSXWOI7PNJkAysL5WdRXQlnKeOExEfVRa+IR/1EArlw505PxLFu84215luBm5gu4KsisL61tnpKvXud1/ICbqOCTbysSSSHhqovs3TuLbD+03JiVcaDneuiH8lfN+y807iCaTVBr+LMe0I8y8sUy4oiYKNZTppgI=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c439771-ee32-4eb7-cae5-08d7f213e9fa
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2020 23:19:24.2310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rizB65Bz3qbh9c8WlV7cRSH00aJ0zGLvnlil2615QP/OEtVSw5EBOuGUw+T36iXr6a1ZCq6pkoZdk/PR7JweOg4VPhSonKfKZwPUnDXbsKA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB2415
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

I need (some of) the gpiod tools in my initramfs. That, of course,
pulls in the workhorse in the form of the libgpiod C library. But it
also pulls in the C++ library which is cobundled with libgpiod, which
in turn means that libstdc++ gets pulled in, adding about 2.5MB to the
initramfs.

Fix that by splitting the C++ library to its own package.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 meta-oe/recipes-support/libgpiod/libgpiod.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod.inc b/meta-oe/recipe=
s-support/libgpiod/libgpiod.inc
index 07ce35a7f..cae3145dd 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod.inc
+++ b/meta-oe/recipes-support/libgpiod/libgpiod.inc
@@ -14,3 +14,6 @@ EXTRA_OECONF =3D "--enable-tools"
 PACKAGES =3D+ " ${PN}-tools"
=20
 FILES_${PN}-tools =3D "${bindir}/*"
+
+PACKAGES =3D+ "libgpiodcxx"
+FILES_libgpiodcxx =3D "${libdir}/libgpiodcxx.so.*"
--=20
2.23.0

