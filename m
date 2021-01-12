Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.77])
 by mx.groups.io with SMTP id smtpd.web12.4331.1610421928488220642
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jan 2021 19:25:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Y0e4/RWo;
 spf=pass (domain: windriver.com, ip: 40.107.244.77, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IT69cgnbPMDV4auNUPGFkl6X8mzc2Q+7GjFAmh5aQ3zYG8E9u8I3cO3koA9lh5KSacZslgfGB66jwcL1OfKMCneKup2jQcHWrEf4AWscpVS+XbKsUXvLlZkeAYm4Qu9e3lxTOzek+DZYdO28iT8yRILsGXaKJ1Ta11g2/ZBgeKeZQ2a2dtSoWx4shwHXSU0qhkflDsM4rKMiQ3RLTOmRjxLFl6BRoVeUCjv8R8e9Ll3Rk1f18xCwiFCgc8snkyFjoqIpb4B4cDlFVhB5EwbtswhevK0xO7AtV7Z6uZzuhmVmZ5oC0p0NooDLKucLE3Y2m6MXvVvZcNziOPeciDdZlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0fm2GsvwOwAKOB1l+f66k1BwiGfD1pgBQfxqrGGMWE=;
 b=UXpyO4vLdIBkBcF/DduQNcCnJdPbOz2yWXgGJ8XSoF6g6rPJxsRlC9rIbQnkIWTDYjL6o/v2tjysVN8KRA0DpDKvxB9bK4bgiETIJxNydEVUYpXp/U60QTrfUiVxFy+Uzbetav9R24gKkZvBTIdHRfH6AtjOZCKdOcGtxm0GoiBMJ8KiWRkVLBVQeWtrWGYMfOEB2D17HZmcACbSaypXcEO7nDcb/9/4PV/WVV3BPfKfQDMuKCCc0ys0X2TVeoKeKPGiCyCiggoDZjJg+LLj8eyZqDRpJbMc5xZKRsHA6VrVGWZqxdDiCV7yaMxCgw4h7QWo2wVZiR6wPtR3hdEZnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0fm2GsvwOwAKOB1l+f66k1BwiGfD1pgBQfxqrGGMWE=;
 b=Y0e4/RWokA8Rtsdne+aQkf1xvktDJwuBxqciJ0elZlovKarJKcFfT3aKzjBEoZ3TV3tPzn7ecExGQJ74ElfQ/lGQPkM6S5FEGF6332oNgTFleu4sYedvfsY5d+hT16ezuacxctaWgZMdMXkdXTk6OZFsBbHHpqIqhywGUDYBmOU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from PH0PR11MB5014.namprd11.prod.outlook.com (2603:10b6:510:31::17)
 by PH0PR11MB4886.namprd11.prod.outlook.com (2603:10b6:510:33::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 03:25:26 +0000
Received: from PH0PR11MB5014.namprd11.prod.outlook.com
 ([fe80::587f:54db:8f1e:5e2f]) by PH0PR11MB5014.namprd11.prod.outlook.com
 ([fe80::587f:54db:8f1e:5e2f%6]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 03:25:26 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] mcelog: fix the pfa test hang
Date: Tue, 12 Jan 2021 11:25:05 +0800
Message-ID: <20210112032505.28926-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR03CA0109.apcprd03.prod.outlook.com
 (2603:1096:203:b0::25) To PH0PR11MB5014.namprd11.prod.outlook.com
 (2603:10b6:510:31::17)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HK0PR03CA0109.apcprd03.prod.outlook.com (2603:1096:203:b0::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 03:25:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d74ef15c-0d17-440d-049c-08d8b6a9b41f
X-MS-TrafficTypeDiagnostic: PH0PR11MB4886:
X-Microsoft-Antispam-PRVS: 
	<PH0PR11MB4886A1D7F5B05B9CEA57E71DF1AA0@PH0PR11MB4886.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xna4ry3JUSulZnlMStsxHZUwHf18sUzrbwz6/f1h5ZPZjg8awzKvFypgpRa0EuQtnLO3Xk+YFGLQaVbL1qqSo4cNuYwxS50ksX7n5bYllY4kIYEmrJTsmy/kG10udkydneLXxvUFOnaJyVg0YBDJ6CSuvuk8iG2dDfHCJh956CWzRykNNGF6zV/BdfAL2y8hRVl5QfqmNw3vjnvIczoUqfEkFbaiOCnf2PXEceNUqCB1EgFS+ILYzKl0tkReI+Iep+bVs4in2y2TBzF1WJ/5PepbUTA935h58fsn5YPDYfdkju1y4xUyHNw2tww0Z2GINzyyraUzBpYXH0OAxklDUVXgq8Xuuy52Pxb3DknNRdui8CYIn6BPy8ZV6t8PQ9KpQT+H4NIS31zVyWhIr+z/yx1XjuOU0BVtJKwPZolIVlc4DN58c+B0RDq6X9EH2GEtBVQQfmJZ0DCuY4w4akUbUQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5014.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(366004)(396003)(39850400004)(316002)(956004)(66556008)(6506007)(66946007)(6486002)(66476007)(1076003)(6916009)(86362001)(8936002)(2616005)(26005)(9686003)(186003)(6512007)(5660300002)(36756003)(52116002)(478600001)(6666004)(8676002)(2906002)(966005)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?qMWYQFqa//xgsAQBlZHKHt2uYjbCAUIETMXxbPyG+qE6W/K0vat85q4+qZ8j?=
 =?us-ascii?Q?LI0VtDK4ReIkFeelRO0Sh9qctxVWd6KDKmzDwXx/YenBxJmrruBNOsHFuErp?=
 =?us-ascii?Q?aoXlp6GMfnpR/lFhwWXzKkpjaQR+Pw5lXxvr09ilYVG1bDVkTJNA7Dx6fWTo?=
 =?us-ascii?Q?MVHygYXNlYwZ+NGpms+3zYbDmdaXdPGnvakRkc5BcuBc1pzLmVfSyru+pVn5?=
 =?us-ascii?Q?EcB2YgNl+q6TjvpCu+jyrx7YqYSR9Gl+O5ZfdWIYYoIVVlziGOkBVPjvBAWu?=
 =?us-ascii?Q?qFLwPhqt/9zwttTZf0Oc9UAbDdXMDYgsSdeum9i13gTRAoBbbQEHvxtHf6eb?=
 =?us-ascii?Q?mbgT/AGCJLnblth9Jip/w0oYP3WUVGmkSxWQJx/5XXDgRy245DSpO0g2FeQu?=
 =?us-ascii?Q?v/6J7m/IfzRZYwEor0ZNwX7+CzqwAiSCTMXjtFob4w+vrajSzbt0ixFTKbse?=
 =?us-ascii?Q?mHU/w3VAmA7WpEmkW+HzEO+ICTAyY7iS5JM0ooMxOgOmTyQpqbctKCLTb5Qz?=
 =?us-ascii?Q?6olE3+9FE98vuCxpFuvkRIXbIZh15hU9d0fuWSLrC4QzK4cc+v7WgxBIyX8s?=
 =?us-ascii?Q?Vx9jhQrDJkefU8ErtWtd/Z2RSOU4zx9/uBjQgxBr+NWDvr+bsAsIkAn17k88?=
 =?us-ascii?Q?M2UYGMxruFAlhJbXDvTIy5LAgKhjYtKaro/R6Naamu+c8CbqX0ehD/Ly2KYq?=
 =?us-ascii?Q?n2uC+a5LIxVIvpMZhQiT7tmh0+Xdh5Q+uSUyopcgLLy0G3ANCSrCRxRI3qut?=
 =?us-ascii?Q?Ppb9LKWomndofcKdukxX5OcBFIGz1a51z7iM42US21gTvOv496CBuTOfa4h6?=
 =?us-ascii?Q?W2TdalKSE40gWFLlCaTrwRmJGnwypAB727oBTfCawM4F1GaGMhquSWoW906L?=
 =?us-ascii?Q?rXg3yBYAd6VRU9rPp6Fi7NO1aGiudy3i5KDXFz3haVlDXfMDnkGQYlrYFMaS?=
 =?us-ascii?Q?wJX/qliK1PaHOjkJrIkMq3EHI6TZg7lOt2mEHwBnHnFUNnRSmGWZ00UpConB?=
 =?us-ascii?Q?L1a2?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 03:25:25.9609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: d74ef15c-0d17-440d-049c-08d8b6a9b41f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E7fdOnBgxONQbKgrP249EzT9FWXizdbnorLtS78XN6W2REdnRDMiwAn+soeFvJZdGNlcMd9XHWQPf4h2GKHOWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4886
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Per [1], the pfa test needs to install page-types and the pfa test
will hang forever if there is no page-types installed.

Improve the test script to avoid the pfa test hang.

[1] https://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git/tree/tests/pfa/=
PFA_test_howto?id=3D7b776a8c005b60572f49797e81287540f99fff1f

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../0001-test-avoid-the-pfa-test-hang.patch   | 36 +++++++++++++++++++
 meta-oe/recipes-support/mcelog/mcelog_170.bb  |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-support/mcelog/mcelog/0001-test-avoid-t=
he-pfa-test-hang.patch

diff --git a/meta-oe/recipes-support/mcelog/mcelog/0001-test-avoid-the-pfa-=
test-hang.patch b/meta-oe/recipes-support/mcelog/mcelog/0001-test-avoid-the=
-pfa-test-hang.patch
new file mode 100644
index 000000000..83c29a651
--- /dev/null
+++ b/meta-oe/recipes-support/mcelog/mcelog/0001-test-avoid-the-pfa-test-ha=
ng.patch
@@ -0,0 +1,36 @@
+From 139177715a2d66ccd3e099be5d9d4dc86db30055 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Tue, 12 Jan 2021 03:05:38 +0000
+Subject: [PATCH] test: avoid the pfa test hang
+
+Per [1], the pfa test needs to install page-types and the pfa test
+will hang forever if there is no page-types installed.
+
+Improve the test script to avoid the pfa test hang.
+
+[1] https://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git/tree/tests/pfa=
/PFA_test_howto?id=3D7b776a8c005b60572f49797e81287540f99fff1f
+
+Upstream-Status: Submitted [https://github.com/andikleen/mcelog/pull/87]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ tests/test | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/tests/test b/tests/test
+index 9623f4a..7c552a9 100755
+--- a/tests/test
++++ b/tests/test
+@@ -45,6 +45,9 @@ for conf in `ls *.conf`
+ do
+ 	log=3D`echo $conf | sed "s/conf/log/g"`
+ 	./inject $conf
++	if [ "$1" =3D "pfa" ] ; then
++		which page-types > /dev/null 2>&1 || continue
++	fi
+ 	$D ../../mcelog --foreground --daemon --debug-numerrors --config $conf -=
-logfile $log >> result
+=20
+ 	# let triggers finish
+--=20
+2.29.2
+
diff --git a/meta-oe/recipes-support/mcelog/mcelog_170.bb b/meta-oe/recipes=
-support/mcelog/mcelog_170.bb
index bdb080f41..f3e018d4a 100644
--- a/meta-oe/recipes-support/mcelog/mcelog_170.bb
+++ b/meta-oe/recipes-support/mcelog/mcelog_170.bb
@@ -6,6 +6,7 @@ HOMEPAGE =3D "http://mcelog.org/"
 SECTION =3D "System Environment/Base"
=20
 SRC_URI =3D "git://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git;protoco=
l=3Dhttp; \
+    file://0001-test-avoid-the-pfa-test-hang.patch \
     file://run-ptest \
 "
=20
--=20
2.29.2

