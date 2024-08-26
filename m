Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9361AC5321D
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 14:17:42 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.83])
 by mx.groups.io with SMTP id smtpd.web11.53214.1724681854707620418
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Aug 2024 07:17:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@de.bosch.com header.s=selector2 header.b=vSJvbp59;
 spf=pass (domain: de.bosch.com, ip: 40.107.105.83, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l8OZI5G5KRTIExIYRqjv04c5mNRcN4QUv1EtzRBHIQ01UtAbmD45xbIN/wDA5egRgmRemjBpvlhfigp6job3h/m3viv6rCf6aVR5K0BK/JrELWD+p9AGAz0yqY+dtbueMiMU9SYHuJt2hHr8V+F9pXhT6X2HDnYj65LR03E547R9+0ph4rwI1aBKL8+Q+q8hMukDOGbdfdPp+Hk8mxRct5URAnhlBwjIRvzGHGusRzIR0aJBoFgVzdrcwvM9f8E7PYRfrQ+/y/2Ga46RH4O1lqwZWVSvG2Qsbofz+lQG49LHP0fcKJ/VNkQXCTfI/vBr4NeooJYuTyxNtKSud9S8hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KegT4CpgMHitR+DutZo29AvB4gAzfUhg5NQX36xCMsA=;
 b=PUtFq1hxx5O0eA/sW5L3ybYEqH/87F7DQeliAeccgrKPFQ6zeMqNAU0IAiodbwYQ5rU9b3nSnbSNlS0y6w1NOtwCgx+RbTh0iTOZuyk+LU2FzKJ5zRV/cLQuyO/UZC/uzVSvMj1k92gIGQ7J9n3Qys+R/W9gOcXHNxeWMFXuT4iFKbaAUZkYj5U8fS5RDRR6Y8eZwrCro2Mhxpdl+dKJOdt3KrooVaV8mAv/3KV9EQpnAg4vZ8DXbtyywuF3w/m/Cm3WpO0PMeNKQ7koDrW6gsy57CA9tEIH4xhv3iC3blc7MMImnw6bxllTR761rDLvr8jZVc2Zm8Zrzpu8xmdTVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KegT4CpgMHitR+DutZo29AvB4gAzfUhg5NQX36xCMsA=;
 b=vSJvbp59gJAhjQeRV8cSATi6OuuwJHKuwseGZvyEXpsH+zzphUG7u4Fg3euzI0eVhoJFjeowDfo0cONG4ormhmgYgTsQTtq0Im1v2rH3AikircwHqTuO6UX4jL7hLZZ78l1xMP7Pgr8mVnk+/z5C45IhOowSJwNxjBgBnlMUcyUr617fN5N2FHO8jBiBA5r6tag8V27jcCDh7rnXL6KMgg/eQYxwClLv4DMl2Cc11PZlR6ukFFOori6bsO8db0G4lskt/cAwJq9RDCrw1aynwgqiFf8cHJcIPUQNRwGIaqBdrKmQP9cmQDiC9il4VplPMdMg8oa0QrqVaigDd1uxZw==
Received: from AS9PR05CA0172.eurprd05.prod.outlook.com (2603:10a6:20b:496::33)
 by DU0PR10MB5826.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3be::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Mon, 26 Aug
 2024 14:17:30 +0000
Received: from AM1PEPF000252DE.eurprd07.prod.outlook.com
 (2603:10a6:20b:496:cafe::2e) by AS9PR05CA0172.outlook.office365.com
 (2603:10a6:20b:496::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24 via Frontend
 Transport; Mon, 26 Aug 2024 14:17:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 AM1PEPF000252DE.mail.protection.outlook.com (10.167.16.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Mon, 26 Aug 2024 14:17:30 +0000
Received: from SI-EXCAS2000.de.bosch.com (10.139.217.201) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 26 Aug
 2024 16:17:21 +0200
Received: from GRB-C-0009M.ot.de.bosch.com (10.139.217.196) by
 SI-EXCAS2000.de.bosch.com (10.139.217.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 26 Aug 2024 16:17:21 +0200
From: <mark.jonas@de.bosch.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <raj.khem@gmail.com>, <ricardo.simoes@pt.bosch.com>, Mark Jonas
	<mark.jonas@de.bosch.com>
Subject: [meta-oe][PATCH 4/4] directfb: Fix C++17 build warning
Date: Mon, 26 Aug 2024 16:16:44 +0200
Message-ID: <20240826141644.78746-5-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240826141644.78746-1-mark.jonas@de.bosch.com>
References: <20240826141644.78746-1-mark.jonas@de.bosch.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.139.217.196]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252DE:EE_|DU0PR10MB5826:EE_
X-MS-Office365-Filtering-Correlation-Id: 85b167e1-cc7c-4810-f2eb-08dcc5d9d25c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7PT34cWOh0lOZMnHH8jMtQv3jTWYld33GPN1piyUIcqS26FGkZkOSg6Zi0Fp?=
 =?us-ascii?Q?dV91RHySHL1Y6Rggv81Vn3CcBafeC35UnFoN0A6hX5kYnINrQ0zvD/SB5mX3?=
 =?us-ascii?Q?7W9RwAJIPwCosdxlNu4daNl7qVxHSKqJn9PUwilYXQuI46IhiAJb3yLxn6Bi?=
 =?us-ascii?Q?e2iSrdY9jIwCwWeUPg7sMV5rkkNaPTD6EqLD+8RqW2AJdvZBiHKsFpbnTRCR?=
 =?us-ascii?Q?hO+rY/yPyXkDlGEc7Z6x7cTld3R5PPq8ngtyePxqs9uZoRnUN0FP2Cd4Hmym?=
 =?us-ascii?Q?EAqyK4Be4cirbv7plb0XxmRrEJq6LluGjU1yHS60DuAU0UT6kxuvfMiSk3LS?=
 =?us-ascii?Q?/x5Tr8/AGez994zP5i+2ev7VZfvmDk4/L51QZfpv66aVAlQlYF2gqlBn6K4t?=
 =?us-ascii?Q?JTYYctID67LyeYBnJf3zHPFu52GkoaR/pbaTFSqRyRfm4SnqvOU4KVmi9pJW?=
 =?us-ascii?Q?ZcUZoWl7zIYVOaoqldPDcd2EvtUttjytAfig4WYL3zjcthxIb76XLsZHTbGM?=
 =?us-ascii?Q?JBYpZyZMYKkrxZ7aG9+qowSgMCmdmrK3G/lRJPj249qZoPUdk0QJQsQIuXJr?=
 =?us-ascii?Q?2K2vab6FbuE9Xy5vNVt5x9S3HPhrCMfxHTiS/jRAMoAH2j8UT4Me1DoUW6oo?=
 =?us-ascii?Q?bCmMkptDvgGZmac16sjCU4Xncl0vuOcKrl9JnR2eIPUJz05SxB3mY/YuPwr+?=
 =?us-ascii?Q?yugrbVWC9fbFvv77tgM5SSF3AGPiessF56hIRxAa7o4hYwBlmxk9JLSgPum/?=
 =?us-ascii?Q?J0TYehjxP/XSbVo6zOt6+V1wYcbQFt/33ycqCygqEXCWTKy6VPA0+uFTrP+k?=
 =?us-ascii?Q?JHRvVY+GKjDhSF17zi4n7ICS3ugYGMkY9oU2JQcNUcN2GEMB4lliK5f6d68Z?=
 =?us-ascii?Q?r1XvdPxsR8vKEgR26Sjre69kbukwdVN74Z8PlSrOw0GzIlkmL291sUSkSv2q?=
 =?us-ascii?Q?Sxcr+V7lrf+FhJMnE2BniYW7AhVi/7rkDnAsHib0KSJG4u0UqhzemAr4iek6?=
 =?us-ascii?Q?6Lg4Um9V9ctt5mk7cz77S+voyvtd8jXTb0TNuBM51/7iTbu9a6YgnpJHZtox?=
 =?us-ascii?Q?3Ylo7NrfRhkMUUOc/RhgBeM30aCXIUfj/i/ctCVxM4CPG0GI7Th/s+9I92OH?=
 =?us-ascii?Q?peZmYUTK5AcvyA/ZhGI09aGEmKSgSHC+ztYQ4aOs1kyRz8d+2UTMQKvm5Zcw?=
 =?us-ascii?Q?KmnMKD5LkYbaAmAcxJbFyahszAZbWEngxotu5BWkdJz+fGPKHKd35W64wO4H?=
 =?us-ascii?Q?R4YBTAxD57diEjLPfvSIu9dimicj3mtTIiQWuXhhb/gqv5EAZ3kw7OmLGK80?=
 =?us-ascii?Q?JU6yPQuv1nx9N71spR7Ow2BSy3QULlVc/4Z9i+xYJsRDjb1DIjFoJ3cGlca7?=
 =?us-ascii?Q?/fnNRgr87Bbw+STb/NVnDhqQHmpb?=
X-Forefront-Antispam-Report: 
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 14:17:30.7024
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85b167e1-cc7c-4810-f2eb-08dcc5d9d25c
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252DE.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5826
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Aug 2024 14:17:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111965

From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>

DirectFB explicitly supports usage of C++. With C++17 and later the below
warning is given:

lib/direct/util.h:223:19:
warning: ISO C++17 does not allow 'register' storage class specifier [-Wreg=
ister]
  223 |      register int ret =3D 0;
      |                   ^~~

To address that, this commit brings in the patch proposed by PR which
removes the usage of the register keyword:

https://github.com/deniskropp/DirectFB/pull/25

Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
---
 .../recipes-graphics/directfb/directfb.inc    |  1 +
 ...irect-remove-use-of-keyword-register.patch | 44 +++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/directfb/directfb/0001-libdire=
ct-remove-use-of-keyword-register.patch

diff --git a/meta-oe/recipes-graphics/directfb/directfb.inc b/meta-oe/recip=
es-graphics/directfb/directfb.inc
index 313c9d16f..59796cc65 100644
--- a/meta-oe/recipes-graphics/directfb/directfb.inc
+++ b/meta-oe/recipes-graphics/directfb/directfb.inc
@@ -25,6 +25,7 @@ SRC_URI =3D "http://downloads.yoctoproject.org/mirror/sou=
rces/DirectFB-${PV}.tar.g
            file://0001-os-linux-Fix-build-when-__NR_futex-is-not-available=
.patch \
            file://0001-include-libgen.h-for-basename.patch \
            file://0001-inputdrivers-Correct-the-signature-of-bind-call-on-=
m.patch \
+           file://0001-libdirect-remove-use-of-keyword-register.patch \
            "
=20
 S =3D "${WORKDIR}/DirectFB-${PV}"
diff --git a/meta-oe/recipes-graphics/directfb/directfb/0001-libdirect-remo=
ve-use-of-keyword-register.patch b/meta-oe/recipes-graphics/directfb/direct=
fb/0001-libdirect-remove-use-of-keyword-register.patch
new file mode 100644
index 000000000..24d977f4d
--- /dev/null
+++ b/meta-oe/recipes-graphics/directfb/directfb/0001-libdirect-remove-use-=
of-keyword-register.patch
@@ -0,0 +1,44 @@
+From f6cdb9f1c3dbef8ef695703a2a5fb4e92b2dd8a0 Mon Sep 17 00:00:00 2001
+From: Simon Barth <simon.barth@gmx.de>
+Date: Mon, 5 Aug 2024 19:35:16 +0200
+Subject: [PATCH] libdirect: remove use of keyword 'register'
+
+The 'register' keyword was removed in C++17 and is now unused and
+reserved. When compiling code that uses DirecthFB with C++17,
+compilation fails.
+
+Since modern compilers likely don't produce different code whether the
+'register' keyword is used or not, there shouldn't be any performance
+impact introduced by this change.
+
+Signed-off-by: Simon Barth <simon.barth@gmx.de>
+
+Upstream-Status: Submitted [https://github.com/deniskropp/DirectFB/pull/25=
]
+---
+ lib/direct/util.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/direct/util.h b/lib/direct/util.h
+index 2109b6ca1..734645796 100644
+--- a/lib/direct/util.h
++++ b/lib/direct/util.h
+@@ -220,7 +220,7 @@ void DIRECT_API direct_md5_sum( void *dst, const void =
*src, const int len );
+ static __inline__ int
+ direct_util_count_bits( unsigned int mask )
+ {
+-     register int ret =3D 0;
++     int ret =3D 0;
+=20
+      while (mask) {
+           ret +=3D mask & 1;
+@@ -325,7 +325,7 @@ D_ICEIL(float f)
+ static __inline__ int
+ direct_log2( int val )
+ {
+-     register int ret =3D 0;
++     int ret =3D 0;
+=20
+      while (val >> ++ret);
+=20
+--=20
+2.25.1
--=20
2.34.1


