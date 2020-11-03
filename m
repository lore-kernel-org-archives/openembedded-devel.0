Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.56])
 by mx.groups.io with SMTP id smtpd.web12.1462.1604427186496111922
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2020 10:13:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=T3EeGDD9;
 spf=pass (domain: windriver.com, ip: 40.107.92.56, mailfrom: sakib.sajal@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IcPI3/MbPRt63VRC+OtYr3oLaK4Ju/7H/VhSjyC/hTXlDA27EW/dzgGg18LIFpxC2pue16IUgZ89o1kwmwL3zZp48NwpJT819zD32JqKdURNLi5z60w0zexC/Q6i6TL78+WVjYhEdsXiUs+oHORbcRGVF+91a+cG5O8rATPuAnOectW07RyAMcMEpvow339XZChQULGXXLTD5Y+VDS9jQoHolLZbu7gkjDzWuadedU0N1fJtFc7i1KxEBHvqT+qAdDNo+HMAtWpBfeR/V7pMVAtzwLckcAUnJidhtRYojJ5QGJ84nP9Rj6dYBNvLSAp0xPT7AYng3FRLqrM/htMezw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2FWVG0EY4uZ7LaoBK85M8/0T6WA+Rs1xG58NoXNsxGk=;
 b=ogO7K4bW5eUW7J2GDlBjS50Q3LBL6brnQyVTzLGNfFQeTsVE07O4jXBD+adnVZFwkGHj23lYB4z/5nC85dHFXsusdl4DovYjAtstfHT42HJ99Ewf8xRubbf67dhU/1hairKb3o9vX04JqwonYVlGccA+4pEjaE8gxdc5/OtrWpl/2VJgsh1M+VoDw11hoy3eFEwEoZvZGn01GTRo34Ay/B6nfDrQWNF+TIXfracl+loQsVtYGjQK5rePd7VsE5Lt+/a5yA1cCfMx2wsjBEMeygowE8RLkdC/b1FONJAwuVEsXAmXnKduuEpj6YB81nbdBWQfLvZSQuAgOIFkqrag9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2FWVG0EY4uZ7LaoBK85M8/0T6WA+Rs1xG58NoXNsxGk=;
 b=T3EeGDD95JlIaFMcV7oenA4zqPRsnigKwmjvZbsjcxmybXfblkrcOHLQlqeXUQ3R7DsgzmQNvWJtcvXc5OF0c1aeHwRVvHTpap4L137rerqvWJXxXLwvlZBYFRhzuq6/6Mqjl3+wBcUHQ2Zn+iXUBKbGG58FeW1uJPMT2CDxGRk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DM6PR11MB2859.namprd11.prod.outlook.com (2603:10b6:5:c9::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.27; Tue, 3 Nov 2020 18:13:05 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::7126:4988:387b:a741]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::7126:4988:387b:a741%2]) with mapi id 15.20.3499.030; Tue, 3 Nov 2020
 18:13:04 +0000
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libssh2: fix ptest
Date: Tue,  3 Nov 2020 13:12:44 -0500
Message-ID: <20201103181244.5882-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.27.0
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: YT1PR01CA0031.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::44)
 To DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20)
Return-Path: sakib.sajal@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by YT1PR01CA0031.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::44) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend Transport; Tue, 3 Nov 2020 18:13:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52e8faf5-8c26-4a23-4c21-08d880241b19
X-MS-TrafficTypeDiagnostic: DM6PR11MB2859:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB2859C43F23D9C112B43F0FF6F2110@DM6PR11MB2859.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ByXkUF0p4/hPiDjpp9LZd+z7zSSbKEeu+Pa/afZboc0HgANCOUbCWvio04fyEiEmBDOgaRjlYRcHLFGQct5EwtgruysFqmIBmZ+++n8/WDpK/bhnHop5be9q/2U1uPVDbODov7aAaryDI3p9lXnJk5F3tj3sOeC/rh276QTMTdlebcGBckslWnUynNEq43s9Q0u6LKIJEv0m65+qjTjEIm7vFsRdfRNoTgNz0R/+1qj0pcpR1D/T7uuFVGvSKPcbKIaRbORo9+5fVsklKWWL3TI4VwSb18TV59j/sWngl9CQZTkZJHuu8oHHal70cvxl
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(39850400004)(346002)(366004)(478600001)(16526019)(5660300002)(316002)(26005)(1076003)(66556008)(6506007)(6916009)(6512007)(186003)(6486002)(86362001)(44832011)(2616005)(956004)(36756003)(8936002)(8676002)(83380400001)(66946007)(66476007)(2906002)(52116002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	R61Ova7x1rwX+qPA0Sh/eZC5vNneEqN+43924SOWeiuMVMzsAO9zA1hEeroClXsTAielM4viICrAV8q9WY4FUCNZ5xRwK0PiNEt4qDjMXUZdJ4ZaBkKTouxFWTbVOUJFTFne19RAYvlAUFXENfB76rQhpdcbDrIDPZONpg4pHIoWQlT8CHqF5n2FyDddpXdcesftvVFKSm7oF5B3D3AvWja6RX2qF0hdggkQnNPOsvvTke9j69WZpJ2ClCOYzms25f1Eb7kNDT0BQuH/oNsHxhDe0kDu/zn3wQ7nSbHvurGR8cvrlm8IdLoMdcd+nRG6fmcaTnh+3UZqkec5hwrAbEf2yRYRxnKjqNvacVN+mx2lkMgqH81xrq/v9916N7y8D1OnP2591+eO9eFU2Wab9SroOhYBRG3n5834wWaKDjo8ImOey/VEQQj2GOWONw3gvCrNtm8w4aR6VdSngdIZf5t7J51Htf7kCeQc6GlxRog+DuIaO6hV84TmTHWSeeNmqdfGOxTNBc30142iwWRp1uJyRM0etiFkbkWr6rfkzMlD/c0gZfxmFmZjgh0pXs1zhbdSPGLFYH6f8LCkUZBmLxFA/6F1bmxWhND3mGcPonjuWKBVOcfcV4i3MG/kkniGLmdgxKhYevcV4IIProktQg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52e8faf5-8c26-4a23-4c21-08d880241b19
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2020 18:13:04.7088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 30nmP4WGFoT1UfbQUNIH7rTTvTXAwx1Ai3Nbhw6hq6REiKJ+CUXsGENBnqIQqp3iqsCpr+k51+6QKu38uHltqQkJOzo0/Qv2Lci7VHjQDUs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2859
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

One of the ptest was failing as it was missing an RDEPENDS
for its test on documentation.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta-oe/recipes-support/libssh2/files/run-ptest  | 5 +++--
 meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb | 6 +++++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/libssh2/files/run-ptest b/meta-oe/reci=
pes-support/libssh2/files/run-ptest
index 2a7922f1a..c213b32e5 100644
--- a/meta-oe/recipes-support/libssh2/files/run-ptest
+++ b/meta-oe/recipes-support/libssh2/files/run-ptest
@@ -1,7 +1,8 @@
 #!/bin/sh
=20
 ptestdir=3D$(dirname "$(readlink -f "$0")")
-for test in $(ls $ptestdir/tests)
+cd tests
+for test in $(ls)
 do
-	./test-driver --test-name $test --log-file $test.log --trs-file $test.trs=
 --color-tests no --enable-hard-errors yes --expect-failure no -- ./tests/$=
test
+	./../test-driver --test-name $test --log-file ../$test.log --trs-file ../=
$test.trs --color-tests no --enable-hard-errors yes --expect-failure no -- =
./$test
 done
diff --git a/meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb b/meta-oe/rec=
ipes-support/libssh2/libssh2_1.9.0.bb
index a1d85617a..38f162693 100644
--- a/meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb
+++ b/meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb
@@ -28,7 +28,9 @@ PACKAGECONFIG[gcrypt] =3D "--with-crypto=3Dlibgcrypt --wi=
th-libgcrypt-prefix=3D${STAGI
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
-RDEPENDS_${PN}-ptest =3D "bash"
+# required for ptest on documentation
+RDEPENDS_${PN}-ptest =3D "man-db"
+RDEPENDS_${PN}-ptest_append_libc-glibc =3D " locale-base-en-us"
=20
 do_compile_ptest() {
 	sed -i "/\$(MAKE) \$(AM_MAKEFLAGS) check-TESTS/d" tests/Makefile
@@ -40,4 +42,6 @@ do_install_ptest() {
 	install -m 0755 ${B}/tests/.libs/simple ${D}${PTEST_PATH}/tests/
 	install -m 0755 ${S}/tests/mansyntax.sh ${D}${PTEST_PATH}/tests/
 	install -m 0755 ${S}/test-driver ${D}${PTEST_PATH}/
+	mkdir -p ${D}${PTEST_PATH}/docs
+	cp -r ${S}/docs/* ${D}${PTEST_PATH}/docs/
 }
--=20
2.27.0

