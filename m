Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.43])
 by mx.groups.io with SMTP id smtpd.web12.1407.1602698501797703070
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2020 11:01:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=bBCtRrgW;
 spf=pass (domain: windriver.com, ip: 40.107.223.43, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nTjTK6z2pTMUX3PVmoFTLrmPvx6AoTzWm0YVUzKvGKli35ANMpQBzlgzKhZrNqPicxIUVBjNpcalZV9Jj4tesbPf9dqNrnluuOuatCTI4y/O7COxYzpYXtpHe9tjxoW44KBjod+R1qQARHB1DCIBYJhZOB8Y7QdTVb7DmWBmzU5a2v/AxIg3skeARCNbJn357i42Zp73pwlpu6yk4NRqGQt9T7PaDN5M4+gDkmA8R1zKGqjZv3fgP8LsgcbFMhKJdkdQBRd0A5sMcxIa6ZQV5GYxJZ/B+vcndoCNV6PBM3A4jaDxTO/ziJvDoebesXZoj8YD/tSAfpVADD78y72rvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5mGxPwt8IfxpjWNXytFL/ZrJzZ7uFH5hMenb1XxkNFQ=;
 b=kyLHi0MmC6ocmFQttq9mIEQYpq4ncR0HiOLGjP3nCBrcFWCafpkhJ9L2eN78NvgjGIBa9SHKmxYCGK/EiIrD52jpdM1AAGj69X6aZs9nkdtF4r87CnpL4mPhdVQeSUFix3by3xi0bszyP/tsXzoJkxlwVvkqi83AR5N2ebmHjKyS0vTP54cayFlbYdjqMrK9Mz7W4UX0yQ3eMT2LGDnEGDR37STifNQiUg4d/5/WR3dqp7y56KvcafRIiAZCTMIZOwdQkMeXdVPuHcPrDhIqjV8Kyh7XQps8OI9HZdP3XDukmmxo8IFl2qWagCwJCrmzd5mRzxyaua21GUmLpIIyIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5mGxPwt8IfxpjWNXytFL/ZrJzZ7uFH5hMenb1XxkNFQ=;
 b=bBCtRrgWltTTjq905V5i53F+pFg9a9WRTpuUTHlQRdUYLXTmldYW33FEuCnnpBrcJsQ0BeD4WXrTTB9yZoNn6TpKV00AwGdyC5Ye98a4m4koBUkGkUZvR2uphnNDkujzn2OOYJr7kYaQv3sogcgzVJgccpNWbK0paNacM1G2Jiw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2951.namprd11.prod.outlook.com (2603:10b6:a03:90::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.27; Wed, 14 Oct
 2020 18:01:40 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3455.030; Wed, 14 Oct 2020
 18:01:39 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
CC: raj.khem@gmail.com,
	siyuan@cisco.com
Subject: [meta-python][PATCH v2] python3-paramiko: fixing runtime dependencies
Date: Wed, 14 Oct 2020 14:01:19 -0400
Message-ID: <20201014180119.2618840-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: YTXPR0101CA0036.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::49) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-tgamblin-fedora2.wrs.com (128.224.252.2) by YTXPR0101CA0036.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20 via Frontend Transport; Wed, 14 Oct 2020 18:01:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 094e86da-bbc0-4132-8299-08d8706b32d0
X-MS-TrafficTypeDiagnostic: BYAPR11MB2951:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2951711DD98682B7273F4D339F050@BYAPR11MB2951.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:813;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	K7ahegpdg5J8HxzQ8cy00N/cT8p942AWywQN+6MbgBtD57knyl1Ra4aCAL/WmpLw/NMv2TbiM+9nqcgyud6XWp26cwa0D1hP1TrcRNjDwt5Ar4O4Sbexg0VMPCMV/+lpQWjZ9CsOwWpNeNOpILBZRuy7kwJ4QdvcfSNockwmUmB+ghs5//i+97T/S3M5yg0/p1JMZmM2rKkk5pYowlAanrW1uwmY4L6C8CWlsPfus74LnDkcvf+qSsehGr6R9xtl3/woyBIAmp17DYLhSjGPBEykp82J35QTzbatzeTXq34unY27jCwrYOB91aHPPhjwqmlWjiEBHucJGoLfWo8Udw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(346002)(396003)(39850400004)(4326008)(66556008)(6512007)(6916009)(2906002)(83380400001)(6486002)(478600001)(316002)(1076003)(5660300002)(6506007)(26005)(186003)(16526019)(6666004)(4744005)(2616005)(36756003)(66476007)(956004)(66946007)(8676002)(52116002)(44832011)(86362001)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	fXzfHzQBQd4wDg/P1xhpxH2Rtpv1ph0AME7g44nnEzxKpd8WllAiapNhm0JouFO10J0M8j7uAsuflLeHFc/Q6pCKIhUz1YALG6jCgTPIBCVW7AyS3hxSgBMa0iZvpaWKdZQdUklp1V4uH+sHpptsR5BTyItLUZWFxM7grr1u9PAfVlJRXqaJOPQ4i9MjN9UJdKOISD0ubNpfoIldGekrlfODkQbyVo8U2uvE+rO9FGnn1BeHe/bzKMowwHYbsNQpfMxZGMfXDC5d9yVzpyNS/T43vIJafZDC8jpwwJ4pzolTfgEn8xp+5FQmJGnT9C4QpsKMoIuUvcBoSnu+nrJaaSHyvXX2u+Hv7uvxlFckA78TjXiXE69JyO2rqhIpDBvypdUoB3ZYXOBaHO/jCw/8GxAbmP1mnxt8Wp+7PtOyuuesIJZ4ivsKOL+ARTFE9vcI3r54NsrcDSpfH2BwQn4mFOaBRxZg8Xzc3SsseMK/JoV++0tToY6oImbvj1iywAyGrfN12v4OUuiBaGlvRV/OKjTafjJ0NHGViJRhs7TJEwgxD+O1vx002z5EwoZN+nbuQiktYxIw6cChVCHEfL7LjEQgPkssbXrdDn7yzW9HQOV12F1NyqHAPOeOvzl9vWf2ys7vAKnHTlQcH73z5dP1dA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 094e86da-bbc0-4132-8299-08d8706b32d0
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2020 18:01:39.8057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Th6u0k806TGxbuVeFyTDffDrW9Hsgibma/uDUtbJrAsFpE2QI16qlqlb/47zvNFogeqab2WpozVdVhLfxtIzTIJf5SCxO3v6Xm8TPCkGeZ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2951
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Siming Yuan <siyuan@cisco.com>

added bcrypt, cryptography, pynacl, unixadmin as required by the
actual python package.

Signed-off-by: Siming Yuan <siyuan@cisco.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../recipes-devtools/python/python3-paramiko_2.7.2.bb       | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-paramiko_2.7.2.bb =
b/meta-python/recipes-devtools/python/python3-paramiko_2.7.2.bb
index 324847c31..eb7ce62b8 100644
--- a/meta-python/recipes-devtools/python/python3-paramiko_2.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-paramiko_2.7.2.bb
@@ -12,3 +12,9 @@ inherit pypi setuptools3
=20
 CLEANBROKEN =3D "1"
=20
+RDEPENDS_${PN} +=3D "\
+    ${PYTHON_PN}-bcrypt \
+    ${PYTHON_PN}-cryptography \
+    ${PYTHON_PN}-pynacl \
+    ${PYTHON_PN}-unixadmin \
+"
--=20
2.26.2

