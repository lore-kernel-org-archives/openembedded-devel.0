Return-Path: <potin.lai@quantatw.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A3E1C433F5
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 02:49:20 +0000 (UTC)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (APC01-TYZ-obe.outbound.protection.outlook.com [40.107.117.126])
 by mx.groups.io with SMTP id smtpd.web11.2203.1648522157612197583
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 19:49:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quantacorp.onmicrosoft.com
 header.s=selector2-quantacorp-onmicrosoft-com header.b=h7VQAMbD;
 spf=pass (domain: quantatw.com, ip: 40.107.117.126,
 mailfrom: potin.lai@quantatw.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YqxMOk7wz1KG2E0H2UXcXOK+kB7IFnMCK+Bf/r+lvRAegwIKPba3e9SBii+qB07TM+DDEhbEM7SdjI3ysZ4JIcCKB+OFlz1reZ+B3DypxTbRIQJAvnZkZFSo5BfvuMUQA1zn+KjFTEyQz+6sdXyqylHduMcYyDFKNW6KWqRS1HsAf8gy2dHEDbOOeFiKszfO/9J1hN3axj15N4s4olVchUdviu3wzwy7iydTIWr3lGL61CXF4kSlE2HkP1SipH91wEWU9nRCNqy37gYpLfMrDUyX5/sKB28eTMLFKey/d/WpGsCPD/UQPC7Vd8FkbJo6Z2l6oVPYPviATiwpzj3i+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=akVZ8Tweyaur0/sGXr4NrL/eWk25+uNg0XdMzFnKpwc=;
 b=HwdHtOhjLkvZ1LkWtCFOKN2at0e76ALiNp3qdLfYAORWkLGbq1BSJvGCbRuIiAVqaBaIjcVzEHLZbRKmAb66B0yKf8aauMdprEbINOteS5pfh/iXGQc6KeKAGSejDvjIgPZ7nz2D6/Z269QC5u8duki7uMOeEhcnoPSbFP+sL1Uw5zK/oMvncnSWDQBmUvS6BTXa/hOak/oArYHolFKFQu6/VBFWJxGP7bdnCu/fexXg64T5WYmaqpjA1dxSXAnJbnr5Nx045G1KTZDHEWl9knRyoZX0N0k3mwAcK+oaBEd4nH4o0jTtvXebT2n2C8h/LSRPx8SlLjiHmTq3f1A16A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=akVZ8Tweyaur0/sGXr4NrL/eWk25+uNg0XdMzFnKpwc=;
 b=h7VQAMbDn412iVtNywaDMIAiBhoElNQGhxZ6T/69/UxKXWVtbsm69FIQW8PbTNvE7ATnsRajgfCyJRBkVfApWM8ZnjJVCh/kAPb/pZZh9SrH0B0U3DxQps2AcZ57Rz7+oD4lneAffdoZnLBQdxIlpvsa8jtK3B7adndPbtuoQic=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by SG2PR04MB2395.apcprd04.prod.outlook.com (2603:1096:4:6::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.22; Tue, 29 Mar 2022 02:49:14 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::7cfe:c9ba:7793:f42]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::7cfe:c9ba:7793:f42%7]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 02:49:14 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openembedded-devel@lists.openembedded.org
Cc: Potin Lai <potin.lai@quantatw.com>
Subject: [meta-oe][PATCH 1/3] libimobiledevice-glue: add recipe
Date: Tue, 29 Mar 2022 10:48:54 +0800
Message-Id: <20220329024856.27349-2-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220329024856.27349-1-potin.lai@quantatw.com>
References: <20220329024856.27349-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0136.apcprd02.prod.outlook.com
 (2603:1096:202:16::20) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8cf997ee-34c1-4b81-ded7-08da112eb559
X-MS-TrafficTypeDiagnostic: SG2PR04MB2395:EE_
X-Microsoft-Antispam-PRVS: 
	<SG2PR04MB2395F2FCC8E52401263625C58E1E9@SG2PR04MB2395.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	e7KhXsibkOZ3sd6o0xRjbMkPdHDptHluI2Z1CNzVrhifsu4S5aTUlOjk/OttYXeRZCm4uK8nkROC2Bz4MSc34j1xAUa//MLRCtlfWwXG/V3dDVaI6obw64EanXKRq7XxtZMkFqVAIHT1NA91uZm5LWzVZ+FY5HsahpuQwRu4LPTC6R/ZsIE+A+wqBdnBNu5tEKEiucw71irC9ZCTLy3l38nl2eottTQJ2IE2TCcFzxFmWPoDvVci5DGHh15gLz6G+unbqKiPTKzf4cQpaQN8tUl3FY+5Uu/bfhs6Mv2XZQ5KXeToP38NovoKcbvXLv6scGU1NpLf8lLoUZ9pLAP/iY1EJL2JU1o2gll6W8OooiWvacLjFwfZeE7w7zAhTReX0wuK6QSvnyd/v0FvwHuuZCoATjAy2TQy9ileP7QicUP/SRiEpmikiYUprc6ZjnIYpPXpeZ5eZG2PUmmoPuk+jb8cEedTLpVX8l9yau0XRImTH77H8FV7Eb9Nbzwz033mpBtMU6c2x6VKDtkgXyDEPoO8lCFxy8JMtEinKn27hYBQ033SkR7PmpsKCigQ7oVn1FFEvaLT4efBoztcLc6WpZhNC+WcdDvVPa6BDWh/1jUX9yAMtAK4sZyVAvmdLNIvfHvpPzsENcVKKSAzgC+x35dbCdWjjNuyVBAvyzrRMWLdWnx4e9opxYxnky1uNi3m27DcVnX3L5IrMNPFxtTNMXAI7uE1JJPhWkm1OdIj9BwDI6q4tnQyWtpUbnvGSTaYUBVeBkpGMDYT3lHT+sGeFAi43mE8SaogVfxhYX2CDgk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR04MB3282.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6916009)(66556008)(316002)(186003)(508600001)(26005)(66946007)(107886003)(52116002)(66476007)(2906002)(8936002)(86362001)(6486002)(5660300002)(1076003)(44832011)(2616005)(38350700002)(36756003)(38100700002)(6666004)(4326008)(6506007)(6512007)(8676002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oQ8guJHittBscrXWJLS58Dfw50ZkofoPeaYiWCC756K6abEXwfoPD5mwM/KT?=
 =?us-ascii?Q?XLD8jKtNv3lle7Bn+WyjWupCZYnGyLEZU6PeTEOluQ11NU1iLEIEGGjsGu6i?=
 =?us-ascii?Q?LrwPFBuCSN6nO52xKI7x5ZJ4zLexodpc70AbHUk3ZNeW+4DQXAECqDdLv1qu?=
 =?us-ascii?Q?3BV9/yA5z7Ls7zQeKqjyiTzqAOyz/X45iSzHYqkP4yLoNNAlIsg7/AC3E9Wt?=
 =?us-ascii?Q?fA+ed1l0Uiu//98Gjudb4Hf+gR8/WFFiU2fUkNCBlGtekAU3XrOGNUAxgNT6?=
 =?us-ascii?Q?FZztw3LaKb34/RTUuUttEVrIXK3Hryq4H711QoyPJ+l/bxFKoXZsoo/lGDBw?=
 =?us-ascii?Q?TxDVR5/ex+rDBCROPEHCF4fEuJxvAi5bLJ4lC8ZB7ODS7kVl8JDsvufLxSyz?=
 =?us-ascii?Q?CmTI/1wrnqFDqlU+LPDPZrmPh38ZglKDChOi5WyYLl37NC7edBQssdz8/3f0?=
 =?us-ascii?Q?lhzC/2yMM7wINCZyzmAzUhALpoUcutVuFt5mQcdXLdhbnhceP/Od136Chbq6?=
 =?us-ascii?Q?bgCxQbP6DsRBotYx1KSWphee1xfdQzkwyfcAgUHkoLwMeR2NU3ms0kIgaijP?=
 =?us-ascii?Q?OXsXoEp+77nCNvvXUX2sP2a2nRxJAT8AdPBdR5ONpdO+l5D6fB7hvaSH+ZrR?=
 =?us-ascii?Q?7TXnKV7Oa2jp2el8WpRKcMWXLpFF3tJOy6+LBrt8/CAcdUDc7jAoTPzI8TCo?=
 =?us-ascii?Q?poXW2fE4w1+HMLGwMXTgDgN8Qw97robvZtNF/OLCmBuHGZRHSRHGYSzoqvsJ?=
 =?us-ascii?Q?d5/vu6DOijho2OCqNCYxQHzYpcgltkOCpdELMEsMWVlqoMdsym3ePxkRtJhE?=
 =?us-ascii?Q?lNiqwlDoHk3XyT5ekKUx0FhlaNKGbm0cBJG/TRfpCs0sSIST4IXBi4MKwX7n?=
 =?us-ascii?Q?cZfhUi1QCwtng/nauDyNZbcUDvCSMW/TbGk2OrmirU1V/bIAeXwHOuCJWFm/?=
 =?us-ascii?Q?otcqbYCBIINSLUncjlspJgiqYQzl5XS7ptu1Uk1+jdoeQTlsQOJi8KZX62LZ?=
 =?us-ascii?Q?eFW4L/Lps/8j+quY+djJ/CJRRD5MrL2KhGB8eHejnAa2QQKyVNVsltPC4kuR?=
 =?us-ascii?Q?vS/F2nRhUpVHzwamUyOF1ELFcd93B3XcCq8eDRIUve/qy3tIxX9aEnhtOkhX?=
 =?us-ascii?Q?72qgQTGA7yjazbUzygsOa/SqnIFVTtfKB5+yendmkQhsHmvH2JBXk71GtSz3?=
 =?us-ascii?Q?b3X5aUipzrRCQz9eyiR7hI9TkRb4UVbI6ZmZ7xI9PeVuxoS3KBiRQL6yxxgj?=
 =?us-ascii?Q?bJkzcOLqCMO22eYGoJxke/G2PpNBP+5IjFn3j+GC+L8TpNNZ4rgsyDKr6XB/?=
 =?us-ascii?Q?1Lmsoj+zL59212sLsqxJfPusHHHmCM2HXQxFMgy4MjsxQcetRhKMDKu5OO22?=
 =?us-ascii?Q?/sTcFv685ZDN6Q9pXXgpdBEK/zKtF0HQVfmMUYJkxFcAbmbyD0NY6VUW0qM+?=
 =?us-ascii?Q?eDUiYqbJWeUACqeTDlMyz/mGhvJAtdb0flXJul6oKqWRlL6xvwnVxkqt96WG?=
 =?us-ascii?Q?PvoNXDlsH+vNzZB42VmPuDMgzRG+leL7XYDxH8xQj1SNhUJNcSwGnZyyh8oP?=
 =?us-ascii?Q?1ksVsi9uvHbasCurKtbOzz1Y3Ju9xNKfJc1LH4c33SNw58NPY093B5NRtphr?=
 =?us-ascii?Q?pkucHSrHq+YxXjSnNQKnv2BRoJxvGvprr1zcbFBK5IZI3h+s2RixnTqTtvWZ?=
 =?us-ascii?Q?iCxnSiFdrIsmpwJAB4ZOHPjRrvld1cxH88QDz4R6qsjEpIjUwBwtdsT/Eg7B?=
 =?us-ascii?Q?GE7TNJN4vptv7UTiTBbI27VDJAw0J8s=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8cf997ee-34c1-4b81-ded7-08da112eb559
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 02:49:13.6173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 YnMGZJMfeyP6uqvez6AXX9F8s7zGyBsHaZOei7U5ILVG/1sEGgGdpoHX23CtM04TrTzeT60aNEZvNZU7p/FlNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB2395
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Mar 2022 02:49:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96248

libimobiledevice-glue is the library with common code used by the
libraries and tools around the libimobiledevice project.

Signed-off-by: Potin Lai <potin.lai@quantatw.com>
---
 .../libimobiledevice-glue_git.bb                  | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_git.bb

diff --git a/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_git.bb b/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_git.bb
new file mode 100644
index 000000000..28303d082
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_git.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Library with common code used by the libraries and tools around the libimobiledevice project"
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "\
+    file://COPYING;md5=6ab17b41640564434dda85c06b7124f7 \
+"
+
+HOMEPAGE = "http://www.libimobiledevice.org/"
+
+DEPENDS = "libplist"
+
+SRCREV = "ecb0996fd2a3b0539153dd3ef901d137bf498ffe"
+SRC_URI = "git://github.com/libimobiledevice/libimobiledevice-glue;protocol=https;branch=master"
+
+S = "${WORKDIR}/git"
+inherit autotools pkgconfig
-- 
2.17.1


