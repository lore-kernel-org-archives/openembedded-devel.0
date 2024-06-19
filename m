Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEF7BC27C53
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 09:47:42 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.41])
 by mx.groups.io with SMTP id smtpd.web11.16803.1718790455634619531
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Jun 2024 02:47:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@de.bosch.com header.s=selector2 header.b=Nvdtosz9;
 spf=pass (domain: de.bosch.com, ip: 40.107.8.41, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kUCyTvgq7gJb2M2+DXQvWmT4Ef4A3xGj/MMQhXc9DtFKcmLDLRRu9waK35qgfGPOVyblFxnyy+PQbVRmLF49yPVzn4rBA/JPlXid1NTRazcWB8WxV/QsXJRR5FcXXrTSX9f8DDdEWwOQENK77JhBRYy5bScKOoCyXbtjWyNDEkl7CeG0DGRZX4U1klc/KcOwpj/4c40538gxAOHkqRHDCZKk5ROtj1UEbxbX6dzd2hl63pJkgZuuTSGVwsymrPDQ6a4zPjhLyXWfQHBG8KVa5qpE9ZFKyiKId5KFPBHru8D+vnREFjaEw3KuZ+OplUEOyPZge6mYeKR2jE53Wo1bww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EvD1srpvQWwz5mpx7OedKpKOn5CjPqxaDyYWgLaY9E0=;
 b=KhUG/DY6yfze+P1LeeUCicCN1N/AaDYr/16sIXZ32vAl5XwPfye2CMmqEIXnintmx7u2iBf/LM/bJT8GJskQRho4eEorvUlZojXcQKgexFmgURDimgb1UqAwLLkTntFixHSbQthJsPhmY/cs4BvpfQ8sGPnORaEk65073Vmym5HZzwzsxCDCYtnmS0Cp3rLqqqO7fI4867DnVmhna3YonhWgRw6k0ofIgLZVXL77jK7azkV+/FNfrppQECoocoz2erGznUpCX2pi1gpr8mqJRkh9HNFDU9rHAjiLpCg3i9k6xHB2ZLBaZoBz7RTwacKXLB0R8aFTkh41PiqWeCssyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EvD1srpvQWwz5mpx7OedKpKOn5CjPqxaDyYWgLaY9E0=;
 b=Nvdtosz93Nkojk2arYi1RZrNdlxUWXEKnsyWKMy1zeATCY83QbzcbWAy2fpM5rEOjFlLaoNZgJbHZ8u6zx1j/l7aKyimMAOsbduL+trlN9y7O3Rp5GBP8swZLFM1kOliQxvF8L+0huz2c4vIib/RHIZFixTs1AVOinJwH8pdQFGrUG88p2HVEC65wd4BkxDaZd4jGoNz9Qe+j1ED21tDgUgctExmm8Zs3kxYVJlH2XjhAthw7ZnWYDgxClzooRZ/XjyTXpqR0DEXxxoNrpGVWFufCFxkYBGcLknf/PQ/wClMSEH+Wtxb/yaTAgo/vywO97ddVP2r6TOtQwiI/jSHLg==
Received: from AM0PR04CA0073.eurprd04.prod.outlook.com (2603:10a6:208:be::14)
 by DB8PR10MB3957.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:165::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Wed, 19 Jun
 2024 09:47:30 +0000
Received: from AM2PEPF0001C714.eurprd05.prod.outlook.com
 (2603:10a6:208:be:cafe::24) by AM0PR04CA0073.outlook.office365.com
 (2603:10a6:208:be::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.32 via Frontend
 Transport; Wed, 19 Jun 2024 09:47:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 AM2PEPF0001C714.mail.protection.outlook.com (10.167.16.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Wed, 19 Jun 2024 09:47:29 +0000
Received: from SI-EXCAS2001.de.bosch.com (10.139.217.202) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 19 Jun
 2024 11:47:18 +0200
Received: from GRB-C-0009M.ot.de.bosch.com (10.139.217.196) by
 SI-EXCAS2001.de.bosch.com (10.139.217.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 19 Jun 2024 11:47:18 +0200
From: <mark.jonas@de.bosch.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <raj.khem@gmail.com>, Ricardo Simoes <ricardo.simoes@pt.bosch.com>, "Mark
 Jonas" <mark.jonas@de.bosch.com>
Subject: [meta-oe][PATCH] magic-enum: add recipe
Date: Wed, 19 Jun 2024 11:45:46 +0200
Message-ID: <20240619094547.30863-1-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.139.217.196]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C714:EE_|DB8PR10MB3957:EE_
X-MS-Office365-Filtering-Correlation-Id: 5528d2e8-7ebf-477f-4700-08dc9044d5e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|1800799021|36860700010|82310400023|376011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ILeQmA0pVuw5iHU2SWqF3S/wc4MDgvBnNckEtfgfGQ+Mwz67OOI3Jrswrs83?=
 =?us-ascii?Q?gw/hBSRGwRbC7mr7Za6k37HBz483nmPypaSlcNLD+o1rLT2xebKgc1COp5IV?=
 =?us-ascii?Q?GE2m61wY1jneuX6ZMM6sxoC0aI2GYqxC+7Q6z0myYRnMJsB+kRXqkNu0fJ1y?=
 =?us-ascii?Q?zG6xxd9W4JlV/JoRggAY39uzZArkhPs8HSTSyTV76Rm1j7rAboV4GnjY2a/x?=
 =?us-ascii?Q?0tBEwdC6NkXM3446F+EeJ7c7d57QOa18ip6/bWHAdiTS6FhmUye5mb69MnpF?=
 =?us-ascii?Q?FJJj49SlsEdL6fnHv2mIaCvkSD09MoVVyGkZ+fBM/KYjcyL2bkKKnONdoZaF?=
 =?us-ascii?Q?rMqCjZs7znFUuODJ+SGZsfFXeCXQ2mwEiaOsZ4ko8Z7rcJPO01GpstSd3Z7j?=
 =?us-ascii?Q?hResbbJq0jBtdbnwMtG3UKr4qoZKC0w+M7yLQnbujzu+C7oFVHRKglZJf9zf?=
 =?us-ascii?Q?MPdN0G6+/mJef3keJHdImL50TdxCqDc9eFDWmqt8YsltzmOYdgUsnmQvD9OC?=
 =?us-ascii?Q?c/qXqcEKCL4T9yH660Ki8VNKXljYhxN52DqgV3GCkDxX5Uo8Zh8LU63KItyr?=
 =?us-ascii?Q?Y5oAaBqARfN1Vv5X0+lW9fXedg4XpPR8xYVTG1nHNklMvKM46+DZUha91cMi?=
 =?us-ascii?Q?/jC8HKqzoUFaJxgiWICkObLj8e/Shgcy9sEk2iGmiileu42k2lhFIc1Asd3V?=
 =?us-ascii?Q?6pRmHj6d1+QK06O/j423fXJ/N+GNRen/Zp60M8FPi0/kGHEaYYa5kf7J9Ia9?=
 =?us-ascii?Q?4UwX+i9hfqPNzobAJkR/YSvcgh0V9L1nxEw8slJIzXpQKGPT4lKYcFC1HcgI?=
 =?us-ascii?Q?XduZjmGn162cPre9JQ5AOJwIBTxymrWrrlbMSF4wO7C3xHE6CsZKfzBibgu7?=
 =?us-ascii?Q?XROwnFAObZnw67G087niPrVCo7zrjiAvPdmkx3ZtIMc84VT4vmgXKfvEsChE?=
 =?us-ascii?Q?15hBDBCRi/1cmA3XSVD+bCfei+Ugk85Rb7/up8WwwYoZvnZ9GMcxIPsqfndb?=
 =?us-ascii?Q?fa7WTKwhlQTYzVwSknk5kwqt0F+4okvVzHfrDqd/IDFeRq6s0jSAgyZW6p2v?=
 =?us-ascii?Q?dT7b24cHC/8SyI9BzieDMKQgtoUc3Yew2IzT/DoHwAwuMRJu7gmFucF+670T?=
 =?us-ascii?Q?OVSR2zMWkKEDWXj11sZsAkl4SQ5HpMDdCXk/Ey9zV80cZ7levo1b2Iy3mKqh?=
 =?us-ascii?Q?ldszJlh5fC/LeT5jPCW4hId5PnGSc5t7JeVHGOz/LTXbk0yZaycsGyPPEha4?=
 =?us-ascii?Q?wUb200sEvnd2HxktQoMeZmAn9WkxT1S8tDvOa7+YkQrgmQEbygKG18xlJ+/6?=
 =?us-ascii?Q?UkRXnrAEnnPe2MVwUFtpkFLKFfV19KF6veHY2LBh8238pxu5EAn2gdYEjcNW?=
 =?us-ascii?Q?Zz+xQOA=3D?=
X-Forefront-Antispam-Report: 
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230037)(1800799021)(36860700010)(82310400023)(376011);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 09:47:29.9628
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5528d2e8-7ebf-477f-4700-08dc9044d5e1
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C714.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3957
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Jun 2024 09:47:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110963

From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>

magic-enum is a header-only C++17 library provides static reflection
for enums, works with any enum type without any macro or boilerplate
code.

Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
---
 .../magic-enum/magic-enum/run-ptest           | 27 ++++++++++++
 .../magic-enum/magic-enum_0.9.5.bb            | 44 +++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 meta-oe/recipes-extended/magic-enum/magic-enum/run-ptes=
t
 create mode 100644 meta-oe/recipes-extended/magic-enum/magic-enum_0.9.5.bb

diff --git a/meta-oe/recipes-extended/magic-enum/magic-enum/run-ptest b/met=
a-oe/recipes-extended/magic-enum/magic-enum/run-ptest
new file mode 100644
index 000000000..865da9f69
--- /dev/null
+++ b/meta-oe/recipes-extended/magic-enum/magic-enum/run-ptest
@@ -0,0 +1,27 @@
+#!/bin/sh
+
+# SPDX-FileCopyrightText: 2024 Bosch Sicherheitssysteme GmbH
+#
+# SPDX-License-Identifier: MIT
+
+fail_count=3D0
+all_count=3D0
+
+for test_suite in tests/test_*
+do
+    if "./$test_suite"
+    then
+        echo "PASS: $test_suite"
+    else
+        echo "FAIL: $test_suite"
+        fail_count=3D$((fail_count + 1))
+    fi
+    all_count=3D$((all_count + 1))
+done
+
+if [ $fail_count -eq 0 ]
+then
+    echo "PASS: All $all_count tests passed"
+else
+    echo "FAIL: $fail_count of $all_count tests failed"
+fi
diff --git a/meta-oe/recipes-extended/magic-enum/magic-enum_0.9.5.bb b/meta=
-oe/recipes-extended/magic-enum/magic-enum_0.9.5.bb
new file mode 100644
index 000000000..096f869c3
--- /dev/null
+++ b/meta-oe/recipes-extended/magic-enum/magic-enum_0.9.5.bb
@@ -0,0 +1,44 @@
+# SPDX-FileCopyrightText: 2024 Bosch Sicherheitssysteme GmbH
+#
+# SPDX-License-Identifier: MIT
+
+SUMMARY =3D "Static reflection for enums"
+DESCRIPTION =3D "Header-only C++17 library provides static reflection for =
enums, works \
+with any enum type without any macro or boilerplate code."
+BUGTRACKER =3D "https://github.com/Neargye/magic_enum/issues"
+HOMEPAGE =3D "https://github.com/Neargye/magic_enum"
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db15f48588464ec8ef87d2b560aad2ca=
a"
+
+SRC_URI =3D " \
+    git://github.com/Neargye/magic_enum.git;protocol=3Dhttps;branch=3Dmast=
er \
+    file://run-ptest \
+"
+
+SRCREV =3D "e55b9b54d5cf61f8e117cafb17846d7d742dd3b4"
+S =3D "${WORKDIR}/git"
+
+inherit cmake ptest
+
+EXTRA_OECMAKE =3D "\
+    -DMAGIC_ENUM_OPT_BUILD_EXAMPLES=3DOFF \
+"
+
+do_install_ptest () {
+    install -d ${D}${PTEST_PATH}/tests
+    install -m 0755 ${B}/test/test_* ${D}${PTEST_PATH}/tests
+}
+
+# Add catkin and colcon (ROS build system) support
+FILES:${PN}-dev +=3D "\
+    ${datadir}/magic_enum/package.xml \
+"
+
+# Header-only library
+# ${PN} is empty so we need to tweak -dev and -dbg package dependencies
+RDEPENDS:${PN}-dev =3D ""
+RDEPENDS:${PN}-ptest =3D ""
+RRECOMMENDS:${PN}-dbg =3D "${PN}-dev (=3D ${EXTENDPKGV})"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


