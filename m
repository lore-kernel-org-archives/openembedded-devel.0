Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6EBBC3DA49
	for <webhook@archiver.kernel.org>; Thu, 25 Jul 2024 11:32:16 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.41])
 by mx.groups.io with SMTP id smtpd.web10.34089.1721907133539409582
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jul 2024 04:32:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@de.bosch.com header.s=selector2 header.b=q12NPp8M;
 spf=pass (domain: de.bosch.com, ip: 40.107.20.41, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AqeuhYrJxutHPViBoTylK0EEBXCQ4VINbi+wKdhvHDkroqEA7aasJAsA1PQ/Nri8WjoPAO5bmUVL2DNkHIXc6SB1ogJgGmoyR0tQkYjZjqL9ECkQ0fdKE4S7+Y13XWhxLfFtLHE5eW5qWcxTeTR5swynbmrF/ZL+XiXNoFQHPq+HQ3/hIdql1WV26ILb8mKBaXJXxhsfO5zozIQg+l15406pbAQ4sgntL1BEcc9WXRPMgShhfDntQ4POkwcSct+2n0Iddwwrpb2Uz4V/uRn+f3fxgWaDRpTp7kaLOfxohPf0+s247LI2b7Dw9e7wvKkd/eWhJDDBkOxAdwfByRW5UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0RZ0/4hQNuLvs0JOE0lxz8tuAASyqADgf/iqt1Z0AFs=;
 b=OIZNwW8n1GtH0XeNcp3uaKFOEiJB1JAxSEpaKM5cx8jyC6kNVmQiVPnKUL45SqBjWVlV36T46x3Gj9CDHXsy9vCjmkv/1wJLlpeF3kXlqo3Zp0d6cPpiI1hJXEGUg2zwdxR8XS/R18RStP1+WLPWk/4oF19l2KxTVAdFNloNhDrTPIaiOIbMv3W1UapiNJSWAEfFQ9YVZH5IsGgOkXx3bgqHa73SQ1+kkFwhoQbryyZdLGm2RZHwGgeKTlgcp3anhNftU3euLcO3xe4Lom1SEvKPMFSEtP6BS/rh0NnxjBMMRspQ9pmik/DZ8puKz/ytJz+m+bN4EZO/jhnrkpuftw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0RZ0/4hQNuLvs0JOE0lxz8tuAASyqADgf/iqt1Z0AFs=;
 b=q12NPp8MEMuOBZPuParc6c45tqBheO7UwAt9Oztot8NC3/QHdt2Qg/M+qqm3Aol8RTDxkUttabgBx1lqrN15cNjknbPGuDKTMS05hXGss/YcjgwmUCjbRaCYfmuFJOgfX1yCcSr6gupyZYPnjFYXz+V5nojrG/0LxQSFlEPK5hW62QDzqC2BsmdeNzZtljV2ntIamyDo5x9Bam/JEHVxIKp8P0ad6BaL6vLte7M3UDWfJOvVe7QsgQLgXTBvNaeKEZnBzbqggnUYuuyWtAEddH2Z65KwRuRX7ciYNRE0eexNvJzS8V0R++LHTTLSZqBP8XNxEw2OhncnDdrYzFlEeQ==
Received: from DB8PR09CA0031.eurprd09.prod.outlook.com (2603:10a6:10:a0::44)
 by AS8PR10MB7157.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:61f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28; Thu, 25 Jul
 2024 11:32:10 +0000
Received: from DU2PEPF00028D02.eurprd03.prod.outlook.com
 (2603:10a6:10:a0:cafe::36) by DB8PR09CA0031.outlook.office365.com
 (2603:10a6:10:a0::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20 via Frontend
 Transport; Thu, 25 Jul 2024 11:32:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 DU2PEPF00028D02.mail.protection.outlook.com (10.167.242.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Thu, 25 Jul 2024 11:32:08 +0000
Received: from FE-EXCAS2001.de.bosch.com (10.139.217.200) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 25 Jul
 2024 13:31:59 +0200
Received: from GRB-C-0009M.ot.de.bosch.com (10.139.217.196) by
 FE-EXCAS2001.de.bosch.com (10.139.217.200) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 25 Jul 2024 13:31:58 +0200
From: <mark.jonas@de.bosch.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <raj.khem@gmail.com>, <u.kleine-koenig@pengutronix.de>, Ricardo Simoes
	<ricardo.simoes@pt.bosch.com>, Mark Jonas <mark.jonas@de.bosch.com>
Subject: [meta-oe][PATCH] memtool: Add recipe
Date: Thu, 25 Jul 2024 13:31:35 +0200
Message-ID: <20240725113135.55806-1-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.139.217.196]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D02:EE_|AS8PR10MB7157:EE_
X-MS-Office365-Filtering-Correlation-Id: f3bf8828-1ddf-462b-7570-08dcac9d6adf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lU4VzXaHkVIVik0+xMGgaDgrhugUKmcRIaFkevnH2DavZwjAts1bIQ8UiEFJ?=
 =?us-ascii?Q?/CognhcG03t+bge6vto9o7TsBHvICWHXeHgpBR9eKgSFnoiDqai4eRUDdCXA?=
 =?us-ascii?Q?pAMvNup2gQ2QL/lJN0fTPRBbvq4A8Xttv8wt7gH3HvPq4K4gm3COdWu/NYCC?=
 =?us-ascii?Q?TQUFnOOAf0B98MuUd3kBsNx6eStUePrqgiq06+zgbhE1UMHz9gxsmsr1nreg?=
 =?us-ascii?Q?ULBWZ1LBaanUeT1Lm1vro1ZQYZXonEUMwTSkEmjsEsyml+PbbMMGwY1t5hoR?=
 =?us-ascii?Q?K9kIZqOPrCEQvueSch4oVjzKIpMCAyTRk+CAoPJOhJJ1CyJNopg6achvAMZr?=
 =?us-ascii?Q?wpAXNvq4Z/boX/PENs12fi400abL5X+dW+Y7gVeOAz7PLBkFT/IHiLJFbPPV?=
 =?us-ascii?Q?t2SSnNDiDz656bdztbO5Z2eRTQ64p+zlifRGIQyme5pNu2WbcS/Lp+nxiP+6?=
 =?us-ascii?Q?+4R+Cqf6l3E9LsaB0GuiaX/TFMPkM7MrKDE6xIzTFWTKLAp5uz6mOFkOfsRx?=
 =?us-ascii?Q?4gv07QR1KgL+tjabskDptIeTd5Rw0LY7ktcUkfINi/GsjrwcfHtO1biirshV?=
 =?us-ascii?Q?XDXFoj561961uRIks+9Lq3Qu/zkvm0VZB0uigfA+gSuBZoWygfMyJrV8XIc3?=
 =?us-ascii?Q?msvTmbSJ6Ol2ar0nN7KY1W89AAjRhszLq2y+W4TyICzt22ZW8d/GaDnlLpP+?=
 =?us-ascii?Q?bnN+JZtsMWJ8qCxNzvHbsB6jyFsM7uP3t6z7Z0zB87JyPsBqwvusAhm4z/fS?=
 =?us-ascii?Q?DUmyRWKYe5/SGFizHAekHmuVONj6zbCQcv558qbhC9mSZ8fTaAujPFa6H3sa?=
 =?us-ascii?Q?Xe7zgL7C7giXd2+BPkVNJsvY4RxOjixbEQ/N2hhKXhzo29vn5uforh81oUUt?=
 =?us-ascii?Q?yx3LSv6qmPhZI77+sWJ52KN49OWet+ibM+85UB+Q3Cy2Wdg6ieab1E0EI+P2?=
 =?us-ascii?Q?baXoP6DHeEuYk6F9+5GOzskac443zAOdFWiIb50XtZAAw0rs6qXXoAjqN9Pc?=
 =?us-ascii?Q?8AW8Jwf7QqL5JIj1nUTRzVsKqnHXAVGYshLZDMI6pd4h19nMPOgF1/HrtWQY?=
 =?us-ascii?Q?cEZRxwt78D+LJMVdqLRNds8ZLcF3v89KC76IHmGZ6UhI9/GH/JwGQSK2B16m?=
 =?us-ascii?Q?SRf/n6l2KuVofRqT86/hU7oKeGh0VBfIOgZrwJWwqpCNoow9tLlwBekvLx++?=
 =?us-ascii?Q?sAtlA8uvbS/wUFknzVEcnt5SecXwewAgNv3c4eE8vrXs2CwWqrGJGhzX/P58?=
 =?us-ascii?Q?LladNIyNHfvQQH/PnFhG0Rb8UYjU7oJYWM/WsE28lnPv51K8XRsPC13Nl4tB?=
 =?us-ascii?Q?nvDvqrwpdDFvvr4PmalDT/1YrRSbwtk1TJNFHun/TrIxomJrCFdQdm2S4niI?=
 =?us-ascii?Q?SUFONLroKmy3LGpHsK8gsSSJJ44aS2N9OjWf1DJZHMt/8rvFLQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 11:32:08.1702
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3bf8828-1ddf-462b-7570-08dcac9d6adf
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D02.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7157
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jul 2024 11:32:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111432

From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>

memtool is a program that allows to access memory mapped registers.
This is useful to inspect and modify registers from the command line.
memtool can also operate on plain files, and access PHY registers.

Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
---
 .../memtool/memtool/run-ptest                 | 27 ++++++++
 .../memtool/test_read_write_plainfiles.sh     | 69 +++++++++++++++++++
 .../memtool/memtool_2018.03.0.bb              | 31 +++++++++
 3 files changed, 127 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/memtool/memtool/run-ptest
 create mode 100644 meta-oe/recipes-devtools/memtool/memtool/test_read_writ=
e_plainfiles.sh
 create mode 100644 meta-oe/recipes-devtools/memtool/memtool_2018.03.0.bb

diff --git a/meta-oe/recipes-devtools/memtool/memtool/run-ptest b/meta-oe/r=
ecipes-devtools/memtool/memtool/run-ptest
new file mode 100644
index 000000000..865da9f69
--- /dev/null
+++ b/meta-oe/recipes-devtools/memtool/memtool/run-ptest
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
diff --git a/meta-oe/recipes-devtools/memtool/memtool/test_read_write_plain=
files.sh b/meta-oe/recipes-devtools/memtool/memtool/test_read_write_plainfi=
les.sh
new file mode 100644
index 000000000..a74975d39
--- /dev/null
+++ b/meta-oe/recipes-devtools/memtool/memtool/test_read_write_plainfiles.s=
h
@@ -0,0 +1,69 @@
+#!/bin/bash
+
+# SPDX-FileCopyrightText: 2024 Bosch Sicherheitssysteme GmbH
+#
+# SPDX-License-Identifier: MIT
+
+# This script verifies the behavior of memtool against plain files.
+
+readonly PLAIN_FILE=3D$(mktemp)
+FAIL_COUNT=3D0
+
+setup() {
+	echo "Hello World!" >"$PLAIN_FILE"
+}
+
+teardown() {
+	rm "$PLAIN_FILE"
+}
+
+verify() {
+	ACTUAL=3D$1
+	EXPECTED=3D$2
+	TEST_NAME=3D$3
+
+	if [ "$ACTUAL" =3D "$EXPECTED" ]; then
+		echo "pass: $TEST_NAME"
+	else
+		echo "FAIL: $TEST_NAME"
+		echo "  Expected: $EXPECTED"
+		echo "  Actual: $ACTUAL"
+		FAIL_COUNT=3D$((FAIL_COUNT + 1))
+	fi
+}
+
+# Test Case: Verifies that the expected string of bytes is read from a pla=
in file starting from
+# the offset 6 and reading 6 bytes.
+test_memtool_read() {
+	EXPECTED=3D"00000006: 57 6f 72 6c 64 21                                  =
World!"
+	ACTUAL=3D$(memtool md -s "$PLAIN_FILE" -b 0x6+6)
+	verify "$ACTUAL" "$EXPECTED" "memtool read from plain file"
+}
+
+# Test Case 2: Verifies that the expected string of bytes is written to a =
plain file starting from
+# and then read the result.
+test_memtool_write() {
+	# Usage of 'od' ensures correct endianess.
+	readonly replace_str_bytes=3D$(echo "Yocto!" | od -t d4 -A n)
+
+	# shellcheck disable=3DSC2086 # We want to pass the bytes as separate arg=
uments.
+	memtool mw -d "$PLAIN_FILE" 0x6+6 $replace_str_bytes
+
+	EXPECTED=3D"00000006: 59 6f 63 74 6f 21                                  =
Yocto!"
+	ACTUAL=3D$(memtool md -s "$PLAIN_FILE" -b 0x6+6)
+	verify "$ACTUAL" "$EXPECTED" "memtool write to plain file"
+}
+
+for test_case in $(declare -F | grep test_memtool_ | cut -f 3 -d ' '); do
+	setup
+	$test_case
+	teardown
+done
+
+if [ $FAIL_COUNT -eq 0 ]; then
+	echo "Test Passed: memtool plain file read/write functionality is correct=
."
+	exit 0
+else
+	echo "Test FAILED: memtool plain file read/write functionality is incorre=
ct. Check the logs."
+	exit 1
+fi
diff --git a/meta-oe/recipes-devtools/memtool/memtool_2018.03.0.bb b/meta-o=
e/recipes-devtools/memtool/memtool_2018.03.0.bb
new file mode 100644
index 000000000..1e2e93bcd
--- /dev/null
+++ b/meta-oe/recipes-devtools/memtool/memtool_2018.03.0.bb
@@ -0,0 +1,31 @@
+# SPDX-FileCopyrightText: 2024 Bosch Sicherheitssysteme GmbH
+#
+# SPDX-License-Identifier: MIT
+
+SUMMARY =3D "A tool to manipulate and read memory mapped registers"
+DESCRIPTION =3D "memtool is a program that allows to access memory mapped =
registers. This is useful \
+to inspect and modify registers from the command line. memtool can also op=
erate on plain files, \
+and access PHY registers."
+HOMEPAGE =3D "https://github.com/pengutronix/memtool"
+BUGTRACKER =3D "https://github.com/pengutronix/memtool/issues"
+SECTION =3D "devtool"
+
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a426=
3"
+
+SRC_URI =3D " \
+    http://www.pengutronix.de/software/memtool/downloads/memtool-${PV}.tar=
.xz \
+    file://run-ptest \
+    file://test_read_write_plainfiles.sh \
+"
+
+SRC_URI[sha256sum] =3D "87cb7175266ff3a00a9c1f541c4c6c93693ffbe8dcc0d97a60=
d13c45ff860900"
+
+inherit autotools ptest
+
+do_install_ptest () {
+    install -d ${D}${PTEST_PATH}/tests
+    install -m 0755 ${UNPACKDIR}/test_* ${D}${PTEST_PATH}/tests
+}
+
+RDEPENDS:${PN}-ptest +=3D "bash coreutils"
--=20
2.34.1


