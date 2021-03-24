Received: from NAM02-CY1-obe.outbound.protection.outlook.com (NAM02-CY1-obe.outbound.protection.outlook.com [40.107.76.43])
 by mx.groups.io with SMTP id smtpd.web10.2790.1616574200030316793
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Mar 2021 01:23:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=OW1LWdS2;
 spf=pass (domain: windriver.com, ip: 40.107.76.43, mailfrom: yi.zhao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FlNR6bxx6fnQOOfe5RWycWln7Jlbqrszf+bE2AQE6vmh9yEQonEizm9gIK0xOPoPHlExLgyR/02kdkhZgFoO9XSxcvEhI08NjNI/dU/tswLS+TECOeZXCBioXqmEirp2cp2ZP/lfLySqn0JaVc5Yvp3Gr71gXDGWsZo8ciOWEMvdBIAaEglzGOl2vySQh+mrbnPS41bC8wJ2uNJXUhpkSmHI0WqZp5khd2JokreGVAhSzkTAnPvYx9dk7lxUuX1lA84WGAG9u+0+hVMSM2RTVbBEboijP9w4HUSZ6u5eoWw7mX31Vx/tT0cS0ABSYnzOkrG60X33Qgnjq8Or6eAqeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=upYbLm9NnMEolO2O9bqkcFAujfaoRzG97xXYatgvH3Q=;
 b=S7lsPWKfep2ec4dLfbYluxrv1OS2+GhO0MfZPq6z8iem0+J2u8PisGiADkf9C3JV9mrunfDsL5A3TS12uOmP4Ua6OyVcQqzSeXfXHEhNJ8ekauOQ35UMYWpDQ3iIDEfzxB1wFfKMn5Jy474e8AI/WR+f2vjTCrtzb9zGBsp7xO5QoQwxqWMxTRvzcqdFrsexBwDpAklaDYGvIiHPtTBt1SpNU5T1yIqnA0iDVNAjf7u71ZRkVPC3R4fQu2jctitZQm4SbBDmr+Adago5hYTYOgwrwxHrfc/zJFfvsxLKzRYyvAiAmV0MmQ2Wu4QVSBVQaSooHJvnjz8KS3E/L3Cvbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=upYbLm9NnMEolO2O9bqkcFAujfaoRzG97xXYatgvH3Q=;
 b=OW1LWdS2aAMSfJ/OG4AdrH8ZcqZ4f9sDho3AV24+bVIEEWsY6K5eizyxNFXKZpy0geG0T8sa9H3gKye47NfDajwkEqwAGoZh7BMfxqszoiAgzc86+WFVIIHrGQG7At5R7FgbkqCvWWbOIoD2GyaiVkQQjGwdpAETmRct7KUmGGs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR1101MB2109.namprd11.prod.outlook.com (2603:10b6:301:53::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Wed, 24 Mar
 2021 08:23:18 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::b954:4302:820c:ca28]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::b954:4302:820c:ca28%4]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 08:23:18 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] tclap: add pkg-config file
Date: Wed, 24 Mar 2021 16:23:07 +0800
Message-ID: <20210324082307.89617-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: SJ0PR03CA0125.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::10) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
Return-Path: yi.zhao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by SJ0PR03CA0125.namprd03.prod.outlook.com (2603:10b6:a03:33c::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24 via Frontend Transport; Wed, 24 Mar 2021 08:23:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 674bb46a-39df-412f-6d43-08d8ee9e1401
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2109:
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB21096666A94AF8AD498D5E18F9639@MWHPR1101MB2109.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3yzzMMMQGCBuK/sEjnsxRZu5j52pNvjREdzoMTY7LBMG1+pwY/go/oZxvjDT/p33Kkcy1SHe1nGFaB2zLkfQYYAgGM0WTQJmBAYohqv6J7job81iVmX92ljYJlYfXIY6J/Sxm+LqszxkFW51tE0hfORrwSqouzYeONadiXCehYr2ZvX632Gi6R23mUslAitbxhKOX2TDv5/fA8WxMRvEZX1qcs5MonMufao+a8KX61qZufoBFN9MwuGK+4QmTDSqjxu8Tccey+t87UAoHXBSNs/R8hrc/KV0XirqGnqoSITpJRHiY/+KgcU6Dv1rIGwDqpGB/4wEhjDvn7+vTjzknY9krzudmuip6UFK7w9ipYwV8da1ug/9EavYsdTF33OCuAj7RtKMsdazDUAqwub3f5w0PbU10CxsrrTA0Sx4ZRwj4OMPTqt1FmaB5Le6KwKFzqLXG/CCyaOspQePdaq9c6z9o/nSRNNtWmxohH74IYpqBJA5Xe3EAeLiKkK5CgceJv3m09C01/6VS2Is1O/Ya6m7xurra8ncb+l6OQNtc7BVdTfOnU3HdseitMClyvMEeplUScSawjze0bPKRZtA1mDJIGsTsv2pngcjEWpcEaOKe0AyxIFjz41mcEBz4HLVeR6qWWNUQTOwRhNo2+UKaqrLT4i7L2v/LcZaKGwQKHk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(136003)(346002)(376002)(366004)(2616005)(956004)(316002)(8676002)(36756003)(26005)(5660300002)(6916009)(16526019)(478600001)(6506007)(8936002)(86362001)(186003)(2906002)(6512007)(1076003)(66476007)(66556008)(66946007)(52116002)(44832011)(38100700001)(6666004)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?9J7SbOMTHLBSxRTNfT66TJQP5BgnRAMy9LOoDoNQzLtkxLjiyIWgqbDnKbPT?=
 =?us-ascii?Q?kLrkArajDqql0wOeM1z8+atePHi8bhrIQNvbjYt2UPAAvllePH+uoUr+xEoi?=
 =?us-ascii?Q?BlMdBwVmJIVGb5DRBOl6q79Zy9O2TAEzDCF209ygNBciFOsk2u1Sxx7qlTdg?=
 =?us-ascii?Q?0V7z+bbVEzMg86GDauGbRIeqC3k5fQE2TdQJW2U7ynEAtIN7jtl6n2SkaWMl?=
 =?us-ascii?Q?nXVfLOS8tnHoTD5FvAhbulobTYswDcpiR2ll6oFsj5Uxsc8Nae8RMis0v/wz?=
 =?us-ascii?Q?rRe3/c3B/RsEnFtfNPRBy5uLwFy87llb57eF/BcpWzWmWtvyXdU0TnocoNjQ?=
 =?us-ascii?Q?kc5WNmpY1HN6b6OGZ1burIvd9MBvAW5d4ZGdytGWx1iHeoXEuQKeiF2pErpq?=
 =?us-ascii?Q?+uSiE5lCr4RsjSUBzMF9Y+Eu48Qx2GEqiJSZ8JOtE5II/re/78SMCmkRHgPC?=
 =?us-ascii?Q?7WqGvV/sNcpw7Sp6maCC06/XZdbCp7LlMDruM62V6ug+FS/O6EFptTncrOIV?=
 =?us-ascii?Q?FRQhfS0RZOZGP+RaXeIYRL96RC2yELNTgzO5MNN+Uh/N7jpLdHIiQYA2R2cy?=
 =?us-ascii?Q?H1ucG5nqj03yJdkEF6r0NRXKMR5JQd3iPXsW8hXmC2Pjnc07D+jbcX9Bfiab?=
 =?us-ascii?Q?Y0bWji5rwBAfMytsisQX47ZKRrBFcMKja+7PGmQUY5xfvRcx9EwzlVaMW5Rh?=
 =?us-ascii?Q?xLk+DshZEJLkVuYuQmuEgDLwX+FZqtoxzLQay2aMlbQ8MLpBsglA7kUyu8oc?=
 =?us-ascii?Q?/r1WWiJTd9W6bWaLlewZgUeYm4MazizenWoGY5hDja4yVGcIzlCswTst1kkw?=
 =?us-ascii?Q?pRjZ8uiGnhk0rO0l4L2VWu6NjrJQSof8SGIxzWMGWqkxlH/NLwZdV46XLtnl?=
 =?us-ascii?Q?9VncEyQ8rmXFbnWlpP+9F+olTYJFQJWRaDN+BLe+OWSEIC1SLSBi5plpVIuA?=
 =?us-ascii?Q?/Njju1j/64gP81tjwekF/KPWeqCk3BQH9vXD97cQAp6LWOv/sXQqkJFQWLip?=
 =?us-ascii?Q?xQF5WZizFeu2a8dsIXVl9/DqRju8fppsSqCe4cMRequ1HFO5qTuNSu7wJpG9?=
 =?us-ascii?Q?tmUt+xAoZHHx5NFQDifXI39SRUTSbRQEUXPL2ZvyAtCLlpKYZWRQkpTge4gx?=
 =?us-ascii?Q?j2ZVKwNoZ5KepD4aEjD9NeacqIVEqu2J6dVghxCFCNa3j/aE2vyM95HxZBxq?=
 =?us-ascii?Q?rW07fXfYpZV84q3cC9UbL541HpEdueOBh74piko8lSysLXloox1+dWVaI8dU?=
 =?us-ascii?Q?6EqHVVstIkzVEi2NVwNh3tABe4mn5LdtN/gMj6yiYQGBenAiTuIQwawNod+S?=
 =?us-ascii?Q?9rLh77P5O6WAy0JmcRzKO22j?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 674bb46a-39df-412f-6d43-08d8ee9e1401
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 08:23:18.4161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VZCrN1Zsj3NGPr+a45LouaVbieFlXQeXlAYYJSUzGP01NflJQSuKQcASxWMI9EbzCyd2xvxD8aCdxRhwBchW2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2109
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

The tclap switched from autotools to CMake in 1.4.0 and drop the
pkg-config file tclap.pc. Some projects (e.g. ima-inspect) still
require it. So add it back.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../0001-tclap-add-pkg-config-file.patch      | 50 +++++++++++++++++++
 meta-oe/recipes-devtools/tclap/tclap_1.4.0.bb |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/tclap/files/0001-tclap-add-pkg=
-config-file.patch

diff --git a/meta-oe/recipes-devtools/tclap/files/0001-tclap-add-pkg-config=
-file.patch b/meta-oe/recipes-devtools/tclap/files/0001-tclap-add-pkg-confi=
g-file.patch
new file mode 100644
index 000000000..58c9aec08
--- /dev/null
+++ b/meta-oe/recipes-devtools/tclap/files/0001-tclap-add-pkg-config-file.p=
atch
@@ -0,0 +1,50 @@
+From 9d47d2fd45c455339759dbfe9a0d6fd24b0a0fa1 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Wed, 24 Mar 2021 15:39:36 +0800
+Subject: [PATCH] tclap: add pkg-config file
+
+The tclap switched from autotools to CMake in 1.4.0 and drop the
+pkg-config file tclap.pc. Some projects (e.g. ima-inspect) still require
+it. So add it back.
+
+Upstream-Status: Pending
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ CMakeLists.txt | 5 +++++
+ tclap.pc.in    | 7 +++++++
+ 2 files changed, 12 insertions(+)
+ create mode 100644 tclap.pc.in
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index c2c9a26..b56eac7 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -25,6 +25,11 @@ install(FILES "${PROJECT_BINARY_DIR}/tclap/TCLAPConfig.=
h"
+   DESTINATION include/tclap
+   )
+=20
++configure_file(${CMAKE_CURRENT_SOURCE_DIR}/tclap.pc.in
++  ${CMAKE_CURRENT_BINARY_DIR}/tclap.pc @ONLY)
++install(FILES ${CMAKE_CURRENT_BINARY_DIR}/tclap.pc
++  DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig)
++
+ add_subdirectory(docs)
+ add_subdirectory(examples)
+ add_subdirectory(tests)
+diff --git a/tclap.pc.in b/tclap.pc.in
+new file mode 100644
+index 0000000..ef51c94
+--- /dev/null
++++ b/tclap.pc.in
+@@ -0,0 +1,7 @@
++prefix=3D@CMAKE_INSTALL_PREFIX@
++includedir=3D${prefix}/@CMAKE_INSTALL_INCLUDEDIR@
++
++Name: tclap
++Description: Templatized C++ Command Line Parser
++Version: @PROJECT_VERSION@
++Cflags: -I${includedir}
+--=20
+2.17.1
+
diff --git a/meta-oe/recipes-devtools/tclap/tclap_1.4.0.bb b/meta-oe/recipe=
s-devtools/tclap/tclap_1.4.0.bb
index 13f66e47d..7c8224b57 100644
--- a/meta-oe/recipes-devtools/tclap/tclap_1.4.0.bb
+++ b/meta-oe/recipes-devtools/tclap/tclap_1.4.0.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5c64b2e8cc5091=
7b2744a90950faa7cd"
=20
 SRCREV =3D "799a8b1f99818e39fee19d0601030770af1221e1"
 SRC_URI =3D "git://git.code.sf.net/p/tclap/code;branch=3D1.4 \
+           file://0001-tclap-add-pkg-config-file.patch \
 "
=20
 S =3D "${WORKDIR}/git"
--=20
2.25.1

