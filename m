Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.50])
 by mx.groups.io with SMTP id smtpd.web08.3661.1630158469877099771
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Aug 2021 06:47:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=qpOPCCo+;
 spf=pass (domain: vaisala.com, ip: 40.107.8.50, mailfrom: vesa.jaaskelainen@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CKn8q29n2im2/OvMI0RiZjeZiDiAIcTgf5NaWqOIR/3+cqG6qRZK3bYZoMAHeYoM4MUSlK/jbZz6GZKksN/C6LvsuSQTsiQb0YN5cga1LPCsYZ5ip2YjQU1paocFMUlfJ+tO/0mzsKqOE3QpD0+jkOsq25Mg4yBPIBJCTXxjDYvURC0BJqvvxVLZZ4i767E1dyLu+GDxl0mS1ec2uSnwu8oZv9a6XDZiAagZH57AyBbKGAMIjy1oRhf8q3uPwq+Itj2t+FFYeYjFF5ZTv+Wg6xEohwRqxDT6E6xSJyVzetpPCoqM/DwhegbtQ2+o4n8SA0ytv/3Ev3RaF+ts2Esw1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oTOyotbBMWutp1Su7aCzE+7u+Cfsf+76S23ecrjgDtU=;
 b=NDpOAYughwScu8ax6fzSpGBcLnlFdS7/7casrrTv2OKzELrbzkRxst7/GTxrEWA9w19MzXOdc7IUWhSgoGpLQzd8E6TETwrqyaanJPaPVwe7Y4kwIRR3SHjWDHEfn1BYiP+4VmtZNPJJBTYcs8VRt/KMxDyOHlwIyJ5BuFpxZpDvZgbcFeLjs/mwncmMShk2ufzbBWPFFHB76nYy9sfzvopzCROGbMPDfLWCBfrbO01KkXq88PfAqZA2WhreT9gb3+SKBkniekKgr3kblz9vpTbqIyiOb4cGsbsb4aiwqKK4zmJX6UKJuXfbPf9lwjr/Z9CG3tJPLLWUXbh8Bl65Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oTOyotbBMWutp1Su7aCzE+7u+Cfsf+76S23ecrjgDtU=;
 b=qpOPCCo+zBIFAz5rWylKsb6OXtYentpeFjztawNCcEKs6jIYwmkZjs+uG2K89NSf9dEO34C5mUjzqxEV68ROzbzCeRqblz3urGW66C59DEpiaqnPaOsWxJTwKAkYYwDJ7iQ2gugf/W1Xt+Esfe5/k+pFF6E+n/YqkCyA7WKN9zaTDPJqKy7lKHugp0I3wW2Uhpc6KIgJdhukiuy3hUd74hfaLte/QV0gJGpulfiNdp3pRpaYbadWcITkOcwx1s6h+N6nt2dd4k4iwGlI1CSmA2OkCdoOhlC15W6kD/OFMNt+fPswdMU5/jtgWRIwcmf5UylkACoYDvnDyLu8A0oMzQ==
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=vaisala.com;
Received: from HE1PR0602MB3241.eurprd06.prod.outlook.com (2603:10a6:7:17::28)
 by HE1PR0602MB2746.eurprd06.prod.outlook.com (2603:10a6:3:d7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Sat, 28 Aug
 2021 13:47:46 +0000
Received: from HE1PR0602MB3241.eurprd06.prod.outlook.com
 ([fe80::213c:5e2f:60ab:ecf4]) by HE1PR0602MB3241.eurprd06.prod.outlook.com
 ([fe80::213c:5e2f:60ab:ecf4%3]) with mapi id 15.20.4436.019; Sat, 28 Aug 2021
 13:47:46 +0000
From: =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <vesa.jaaskelainen@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?Vesa=20J=C3=A4=C3=A4skel=C3=A4inen?= <vesa.jaaskelainen@vaisala.com>
Subject: [meta-python][PATCH 2/2] python3-pkcs11: Add recipe for version 0.7.0
Date: Sat, 28 Aug 2021 16:47:27 +0300
Message-ID: <20210828134727.277771-3-vesa.jaaskelainen@vaisala.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210828134727.277771-1-vesa.jaaskelainen@vaisala.com>
References: <20210828134727.277771-1-vesa.jaaskelainen@vaisala.com>
X-ClientProxiedBy: HE1PR0402CA0051.eurprd04.prod.outlook.com
 (2603:10a6:7:7c::40) To HE1PR0602MB3241.eurprd06.prod.outlook.com
 (2603:10a6:7:17::28)
Return-Path: vesa.jaaskelainen@vaisala.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (87.92.181.210) by HE1PR0402CA0051.eurprd04.prod.outlook.com (2603:10a6:7:7c::40) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend Transport; Sat, 28 Aug 2021 13:47:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a219e33a-0d51-4cc7-09c3-08d96a2a6acb
X-MS-TrafficTypeDiagnostic: HE1PR0602MB2746:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<HE1PR0602MB27468475F5B205C84EA451FBEDC99@HE1PR0602MB2746.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wPUCcXJq0hCIcPuGbTPxogJSc6eF6aFMqA5vp8H0iutcuuT/JJiI5afs1BREw9IDc9Wux/dLb7gO8J4NHCuee7Wf6Rar8vGaW+XseDyfCdH7mfl3HYfRtqAPf/UC2wVgMF1oCKXt3CAlAXdPyoxAKmmJkU1XLl+gj2b6/g8yOTF/K6xJnq8XX35XpGTNoJYc4/WIVRx27MnVTUyyo1y6hDV2Ysv4KpI489WI4z2U0sr8SBOjX8lLVy+DMQyjKraTdanlw8PVgexieC87ADeUz5jSqhURO1cFrevEiysJulmZKEZQ11YwKqc5FCjal7jm/NRWYIO3fcLo1m8X5h95aZhnAA20qP56dXElCuM8ow4sKiB1K6Th2tr7SjrarxV8pQkyDhS8VFmyTV7VAbaVM7pWhJRO1sCnN/MmpCu/MfArTFpwoPnfz63HG9FjNW7q9kIF6dWWf4w3fUaIoh+BI+L2mY6KG8GR86LYXCobhAko5H4+kBmYQMN2DvI9WrOdZwn45CnQ44oQXV/afc3tec2Rp/mqwYF6/80OXHewSxeU6Ax+Y+bH2kb2O7ICJ3Wbe79YQeCHfjPoM+Rm56BEPB7K+EIY3umNxoqtRmIx+x+u2mHpeFeZa2fFbSMwkgqn/qLQ2ephkQrltTiZK4uH0E7GkcqR5Nic2yRz8i/lAi4M4/gRvDpAm7xq+z6Dh0eTnefzW9YRskzwPWtRWU1CWYrEbZhsI1Pu4PJIbVPl4O21LXv74cj51hm7nRIhQGCxFgy6jyJK/B2aX1uqEmURIF6Y/Rh0wt9C0JLt4rKvB6M=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0602MB3241.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(39850400004)(366004)(396003)(52116002)(66476007)(2906002)(66556008)(6916009)(478600001)(956004)(2616005)(6512007)(5660300002)(6666004)(86362001)(6486002)(66946007)(26005)(6506007)(8676002)(107886003)(4326008)(8936002)(38350700002)(38100700002)(1076003)(36756003)(316002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?y+CKtCaqmIqyALtxR4Ih0pr5kH1kXxZqHbVzsqECp41qINIkhRbj3jUYsTtE?=
 =?us-ascii?Q?S7M/OFtq/7gWyvOtJCr8FC79sz/Uki+Hi2M6CTqrZ8IHnOuxTLoeA/X5yDBZ?=
 =?us-ascii?Q?ZlJw9sQ/vCxt1eKNeiRqt+yHA6/bbFUD1mDUdjxdgOgMbxjTmz505oGkz9FD?=
 =?us-ascii?Q?/AIq+hARTvTt/ri+xbdi07YAhzf4+yRNM7UuC69A0sEbB9brZEukVSDi2Xff?=
 =?us-ascii?Q?ZBH+Y+vEehFuywFfb2n1TPcyY19Kc40mSaf0DHr7N9pU0VTnQaiCXSGfW3kD?=
 =?us-ascii?Q?ZR7Z4+DwNzaWeMOM6n6Ypxn5NXyngepWDt1k0qvVueptrHtP4oslbdV/0hXa?=
 =?us-ascii?Q?0/z5RRc/7chOe2eyzrocnwvuFwFSJGya+6rjqXbkvhd5/ckPs/CvY7JBKd8W?=
 =?us-ascii?Q?HHFyvRjb2dpOwOwZKuVy5he3BHHJmbnyGocklJLYrJqUnOSptJcvCZaTAhK5?=
 =?us-ascii?Q?47do+CsV3ag122pINX2EMX1LpcOs6uXGPCMbaef9OChpCXBINWL7wHW9xE8p?=
 =?us-ascii?Q?J2Z0Iey1rkAuAuETEEkAt76QvNoSq2td8Q0Q4+MaVmMvPQAIVzAeiPvCrjgP?=
 =?us-ascii?Q?RHUrKLhQPkCHqDkTwTgzGC+IL/3x/zSzFF2WW1ewsKCizF4v780tBfQjEXol?=
 =?us-ascii?Q?K60eH32MTOoS2/m9GHa54BdbKLqmkHUA7Q4RDQJBwCcYR867yxKxhwvds/dq?=
 =?us-ascii?Q?mZHbrdQm9S0ANez6YAww7jAlzXkbxr6WCJwMv0/pv83RGo4JSVKwJQQNz8h7?=
 =?us-ascii?Q?Y/AoXW5S29wJdzBX+gXnvECGqDLQSsfxuYNU97/Gyv7Yrcfpoj69+1nRivcd?=
 =?us-ascii?Q?A/cMjb2OJPhvKHl1A2clX+OQNsshZzljouNhO8xEnFoD3kNQN/MXdZ/4CmpA?=
 =?us-ascii?Q?/HqUfp2Hd8QO8UDY7/2QwSZ4geq0zZ+hGp11g2ncSzL3ChiOVorjLsR9TWje?=
 =?us-ascii?Q?ui2sLzn/TWo7C5LK4zHbc/qpzqyI7FOh53e8OJmx4x9y1ExcmOEUoBDZTlyt?=
 =?us-ascii?Q?3pVBQK9m02XOc/7jBuUHyhfIOJ0rMSS3A2EjwNebm9A+tBtVqdGz/81fZ8dE?=
 =?us-ascii?Q?Dn9Gk+YoEGxD+a6OvrItJvNaAjkoMy2Dx5ZgDwMqAt23IfHvBp+FTavn0CcX?=
 =?us-ascii?Q?DnSbFhCAxbjGyaqDDCfiwE1KZiM95PWiB3mygAs4N6pxlRm1ni7bkV+8WTxh?=
 =?us-ascii?Q?JjBkHv59QR76FuDyQPoqr2z85TXq6LCl/0lbYx4NAWTRLqppZtylKxu0Ui3T?=
 =?us-ascii?Q?ppTLppKlKwOrDJJXLmTP33As0Keb9EWAeDaFYaXph/TPWuh28lFSz5swWz+S?=
 =?us-ascii?Q?Jpi2WH6Jl9Kb4AkSvdiaGU57?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a219e33a-0d51-4cc7-09c3-08d96a2a6acb
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0602MB3241.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2021 13:47:46.3767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SyWASj4qFhpW41zOVV88wn4fs7aUHlifiJw+XBa/imLFnICskIFKxFkD8C06QuUJxTrFsW0CMYjQZiXRT6vM9ZTtUpJGvWiIii9cECndUMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0602MB2746
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

"A high level, =E2=80=9Cmore Pythonic=E2=80=9D interface to the PKCS#11 (Cr=
yptoki)
standard to support HSM and Smartcard devices in Python."

Signed-off-by: Vesa J=C3=A4=C3=A4skel=C3=A4inen <vesa.jaaskelainen@vaisala.=
com>
---
 .../python/python3-pkcs11_0.7.0.bb            | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pkcs11_0.7.=
0.bb

diff --git a/meta-python/recipes-devtools/python/python3-pkcs11_0.7.0.bb b/=
meta-python/recipes-devtools/python/python3-pkcs11_0.7.0.bb
new file mode 100644
index 000000000..8fe31c9f1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pkcs11_0.7.0.bb
@@ -0,0 +1,26 @@
+SUMMARY =3D "PKCS#11 (Cryptoki) support for Python"
+DESCRIPTION =3D "A high level, =E2=80=9Cmore Pythonic=E2=80=9D interface t=
o the PKCS#11 (Cryptoki) standard to support HSM and Smartcard devices in P=
ython."
+HOMEPAGE =3D "https://pypi.org/project/python-pkcs11/"
+SECTION =3D "devel/python"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://README.rst;beginline=3D337;endline=3D358;md5=
=3Df68bda54505b4002e6ec86e08125ef79"
+
+SRC_URI[md5sum] =3D "4998d6f038d2997958f2004f482580da"
+SRC_URI[sha256sum] =3D "9737e0c24cabb8bc9d48bf8c57c3df2a70f8cdd96b70c50290=
803286f9e46bf7"
+
+PYPI_PACKAGE =3D "python-pkcs11"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND =3D "native"
+
+DEPENDS +=3D " \
+    python3-cython-native \
+    python3-setuptools-scm-native \
+    python3 \
+"
+
+RDEPENDS:${PN} +=3D " \
+    python3-asn1crypto \
+    python3-cached-property \
+"
--=20
2.25.1

