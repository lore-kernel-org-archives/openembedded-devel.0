Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.50])
 by mx.groups.io with SMTP id smtpd.web08.3661.1630158469877099771
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Aug 2021 06:47:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=yocfct9G;
 spf=pass (domain: vaisala.com, ip: 40.107.8.50, mailfrom: vesa.jaaskelainen@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cS1frCF4DmGASFsHHOqARsuaipIxG6edarGU7LfZYktsRs/sh6sMMP2UBEm7zmkxQBck4fSHs+GUSYQCt+nST/ciFPf9kRrki3qrwwEGctZB+C5zXkJZ17klBwzWgJ6QdUWVR/6yT/KYTaEAKN2q1zR7j1wQw1JscAmBfm6/1VpkHdDsiD8FouWuUrcKMlRbHWPz+STuTxg7g5zr5BCK+LU1I760izETbszV2vk2XABqdSxa87akdlqSjMQDzNM/9JYzMrfFj6VoZVPDE92jv5X5GS6V7ddebKpR0iG1Ih5SNrxQWQc6mLZwbtgUt03DXvn2+N5tfaXEt7j1sjXD9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AwkpZ0ed8odCGD2E3KCxouSKnkBDojRBXSLWIYzOvuU=;
 b=NZb/3H2kBP++Fw0xrcZiLQwXSHXeTqXco3WmG90rsAH3KeFi4dS+kdbRcKzxnNj5c/aSQy8iO62mA4bkJcd60p5FvA3On3h+Atnr5Suq2917lZcHvoXXa8q9yec4sJi1qv9h5o17eniIzUuNKx3BeJvz9cxhyqd0gJF8ZJlouLKIHaiN4intBK8pZG9uJtck/KnFR4ygEhlmo9uSIBx8JoDfrFr3CFbavsBbfRfMgpkz1Uz95myBU6Qp4q0W3kCfpdpaq6c3BX/3tFpm9hudDQB1PDn3EJ7hbYG/0mQxH4b3rWZQH8xdVLezzSICB29a7eGZE2NZ7q/ZXy2YEItIIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AwkpZ0ed8odCGD2E3KCxouSKnkBDojRBXSLWIYzOvuU=;
 b=yocfct9GgNVpJcgV6uSYXYFuEvzeWnnFecx/RuCi58+OxJlNvbHTZCcgc63j7+9DPTDshT/wVchJXePijL3BFFJVJT9HlcBO6BPztVhFgJP2SB9vmGNuTM/3DAZbl6CrcWsUuFL3gm/EuqIqTFUPpNpWRfmKLswPddNKUCgWeeCmqYbXQZQR7WyShg7iLTX1Ko8K9UCUMXTr+6lAlsy+3I5D6uVFecBXNdZPJKBOoy5StI/CO12h/9PM58uvHi/KgL47AhG50nwzO6Ghh50bqIr9f3iEWs9HXCawJD2l7Ez9jQASwv8xGFoVHfRsvJ9aD8YZ4Y3FL0BxJPEFYjW9qA==
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
Subject: [meta-python][PATCH 1/2] python3-cached-property: Add recipe for version 1.5.2
Date: Sat, 28 Aug 2021 16:47:26 +0300
Message-ID: <20210828134727.277771-2-vesa.jaaskelainen@vaisala.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210828134727.277771-1-vesa.jaaskelainen@vaisala.com>
References: <20210828134727.277771-1-vesa.jaaskelainen@vaisala.com>
X-ClientProxiedBy: HE1PR0402CA0051.eurprd04.prod.outlook.com
 (2603:10a6:7:7c::40) To HE1PR0602MB3241.eurprd06.prod.outlook.com
 (2603:10a6:7:17::28)
Return-Path: vesa.jaaskelainen@vaisala.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (87.92.181.210) by HE1PR0402CA0051.eurprd04.prod.outlook.com (2603:10a6:7:7c::40) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend Transport; Sat, 28 Aug 2021 13:47:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6de6ab74-79ff-4d61-932d-08d96a2a6a9f
X-MS-TrafficTypeDiagnostic: HE1PR0602MB2746:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<HE1PR0602MB274623068D429083E18B5651EDC99@HE1PR0602MB2746.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:568;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pQMlpMAgOEiLIc45U9O8BL//d/o0sdLOMRbPpW4IT7gg1LIO7hLkBdWJmckPSnZX2glXjZvmSOvnsxbgdbw/2cdsDdFMjvpj7pH0HUfLwCMFkctSTtO76EDiU7hQy3pnSCld19ImydfKYD4NmRPP4h//I/CGRtNmCXoWjk2o5cUcoT6H6GpP+jx//6ss4BZKm38FiXXJVIjveBg8dTN3R/gS5xC7uwCjUlmo8Cc243dBCteouvXdbM3SyzeQ2t9MtUHaALOLq+qmo2EOiKPUOxu9/oX6Z3+z1MU2L8+aqtjCGpMsK4CJqcZl5dy3IqTyIGaxKAAgclYqZt9gGRExjEx0syMRXIQ5t2XxYyVUIR/lvuj9lo8Z0oW+7SaBma7c8Kow2/JaFD+pGgOjasl8G89XDyMrx4l4mtXuUqWB8sNZtZuU9uWA177ipIVZ6m2K/g+hjn0akJyuSw1/MF4t54/wDl5y1jEMNi/SHjYBlDQIIrGX+OAimZB16PxHbLfrM2BfwiQTvfiz1HXqMuBvYZCCA5K710Tl+eRiHcWS3W4Kdzv1rZXJb1DdAIaGge8o7TGLvRkeUYKLgDLUnooGakknqsomqcv6IIhOPHgeSSQGKVeumdvdr94xQ4e4IYPdfHhhL5reK0pyyUR1Hq09dqtEseCMuMTfbniWSWV0IPEkTnH+QsB+DVzj4sWHaELDfTGQMVPe4SHRDjaFPo9QFd/XQx2d6jmU3iOweqvOPY/JggWPdIFTmL0XArVZTM+TM4CpMYNkSQMgpB3LjPN5N0gLSCfKTEpnrrwJU5ORc9Y=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0602MB3241.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(39850400004)(366004)(396003)(52116002)(66476007)(2906002)(66556008)(6916009)(478600001)(956004)(2616005)(6512007)(5660300002)(6666004)(86362001)(6486002)(66946007)(26005)(6506007)(8676002)(107886003)(4326008)(8936002)(38350700002)(38100700002)(1076003)(36756003)(316002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?D2Uxr32F95/nNYwT9GnW2bnSxA5IO+BsFOu6ye9TOXazyG0ib/kdBObINwj3?=
 =?us-ascii?Q?B/fbeO30dClwCf+hbDdfJEL/5JIu3TWssH8PRFAJhOCVgwNWlFa36j6gCoaX?=
 =?us-ascii?Q?76zpdhA3S5BYDUnshjxHyUQmCK5QQLIs5TT335J/QCYeeDHasWnBMb7C7z/J?=
 =?us-ascii?Q?9jMZH7/eODVwAFq5Plkitp3sVxaW/0OBuoOKQkvN2rCfDVpbt3kM2Yu4Avdi?=
 =?us-ascii?Q?es+4GAX2J1/LA5f/2VAlbIxQ4YkHuydMt43YFgjfvSOJxsljFRtXz+hudn1N?=
 =?us-ascii?Q?zRFBRkxdz6tLkHlkOCPlMESbUtO5fJfLxm2Tz+aCtu4KRnWrcy/ZhzHVAx8w?=
 =?us-ascii?Q?4ofBtD1oshX0Nl14AZRcb4WehlW1G+eU8FJr6BOfUy4Yp1Rr2gd3A2jiqz5o?=
 =?us-ascii?Q?X7qGrqSTSqdxB782csAZBN9HUDUiGBRDruG+bh7e2M9+Hats9KF0hS6k1wPq?=
 =?us-ascii?Q?9dOY6FKk11o1MnV18GAMTRgyKNTFUlIfcEq3RNa7DvElRtZKHm99AECaoXJx?=
 =?us-ascii?Q?qfeHDK3/ncCTMswKCSp7DbC1L94dLzDsTJPKs6fp+ig8CCqAVL86Qbv+CMSS?=
 =?us-ascii?Q?ex9hDoZqdiwuTGB0HicBYtXvY2ipRnPmXe3CBma2VPAp/PEpKxb6mjYnrpkl?=
 =?us-ascii?Q?rEL6pz6Guea0oxbzaGKgjKgu3wg4m6+JM8h/ucnWG+rr8WhhopskM4K8HIfe?=
 =?us-ascii?Q?oDLid+3DQVTSWaIQ6LnGpQ9XlClbmoekPHgCcCGAWpFyj9S38yo/6qsDebiJ?=
 =?us-ascii?Q?+WJ7B4X+cmmHWNBuizHwQQ19ysRri0HernTJMVC2VXBuzm5gt1EYRCWCOOhs?=
 =?us-ascii?Q?vC68upZzEb8EtIKWzrdEqH3BZfSFtkHKcfhmgo6ZYSgO9gavaeFjwwgIINjR?=
 =?us-ascii?Q?bi6FgBHqG5sYoDbYHKxfsrT/QSxM+ib53f9xizK9d5gVytZcf80JClYS8Op1?=
 =?us-ascii?Q?4skxC83utq942o5gOiFCJYS65peKmwuEVx7dz/X2PVbsASxGjGaM7xQ0kQYv?=
 =?us-ascii?Q?RsoF0cY97w37yEJ4uXPSnUZMzZunZNcRPmfasFt3QU7ocH+qMMaqlhhmT7/v?=
 =?us-ascii?Q?BTKG94EGeizvDhHk5kDkJ5156ri/rl2tSAdLOJ45eTzTIb0KDAINUFHVYZnL?=
 =?us-ascii?Q?Bz6ZPyZMkee0c4kMuxEhS5BYo5q/fVQJbExcceXxdbopG8i11M30+r1esP7E?=
 =?us-ascii?Q?MCGxKANfDuv3vrRaXLTNeJh9zryauYO2hkcRgyKVzySM1pBhNBDyyYOoW4+N?=
 =?us-ascii?Q?V1d3E97gXQmhH6VOxbPd2anz1/gPTAslkrbz6/hnO2hMVMuUGmRN8PNiV5mE?=
 =?us-ascii?Q?bVFgnhn22znoRk5wyMahEQuB?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6de6ab74-79ff-4d61-932d-08d96a2a6a9f
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0602MB3241.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2021 13:47:46.0728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9EzF1Qj4pWhRT3tSz+jsMlNq/7kgPonMK3Z/z+YciWnfnwhPpLEuabHNybuvhiRJWgo4g235jwMf2nqqhfvDhD4iaM4vjErsTU/sBSEl0Dw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0602MB2746
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

"A decorator for caching properties in classes."

Signed-off-by: Vesa J=C3=A4=C3=A4skel=C3=A4inen <vesa.jaaskelainen@vaisala.=
com>
---
 .../python/python3-cached-property_1.5.2.bb         | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-cached-prop=
erty_1.5.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-cached-property_1.=
5.2.bb b/meta-python/recipes-devtools/python/python3-cached-property_1.5.2.=
bb
new file mode 100644
index 000000000..6f9266325
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cached-property_1.5.2.bb
@@ -0,0 +1,13 @@
+SUMMARY =3D "A decorator for caching properties in classes."
+DESCRIPTION =3D "Makes caching of time or computational expensive properti=
es quick and easy."
+HOMEPAGE =3D "https://pypi.org/project/cached-property/"
+SECTION =3D "devel/python"
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddb7ff60c4e14f58534201242803d8ab=
c"
+
+SRC_URI[md5sum] =3D "3451c63f8733ea0756ca1dd2b0c04bb8"
+SRC_URI[sha256sum] =3D "9fa5755838eecbb2d234c3aa390bd80fbd3ac6b6869109bfc1=
b499f7bd89a130"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND =3D "native"
--=20
2.25.1

