Return-Path: <j-sahu@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A87CFCD6E4A
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 12:39:33 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10421.1780576765042075351
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Jun 2026 05:39:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=MgBUvBkU;
 spf=pass (domain: ti.com, ip: 40.93.195.53, mailfrom: j-sahu@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xihwM9NKvvFAHQyI0aFhJ2IBc2oK0a+y7Ot15h28RVF07VFsL1EfVXYasSRusdYea8Tnu6NIG4R5MbMXhh19apENq+wvmQidkzDHmVnRzvQJK6iGMWKXELBCQIbWQ4x8HW7jEENY8HGH1HWwCsE5I/CVHB3jon/ApopdsdV82xUl+ZHUioITyUBbYSnkAi2Nps+wIBsj+EDobDJ9mYgV/p/8l+/yDZ8DSEOtAbT+vToztxpmVUbgK9SFQ3ksFANflNCVW29PzF7imEudss4wQWWWlygmumxAj+XfMtBAJ7LSPdpmMRNxSWlIfkXTzEYlstLaVv4xK/ArXyGRc/ySRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=882x/zOH96aFvAUstGQ6yaohKOOZ5U1JDkPvMWyAQeM=;
 b=O/yObUyz+VSow/+BqFcvEHvuJpJa6nLaJqpSZT+yMkzIJS1b3+UTI4fSqX1Hah8qA+upBlXOCWD7NXDo2Mic+OxASRbU/eXhzxsWKkG35BjZEJqCtj00FnxFtnE86i1suqz/n/Xwh0cC90F3FIbfCp9SChFws67mNv1TvjvQ0hkJM5yTQTrYVPV1aeVNRZatLg9Lk+NFSP9IcpHATFhV50HhsQ0Uh2JGu9il49y9jJyYkMQnWhCcwI67+pdhFDh7omVPjx7t9G2mrq3C7xYaSm3q0gHzTVdhyjUbYnzHukXxMSfYMunq+g+NpsGS5UAC/67ytFoQcUlAQQHL/+NocA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=882x/zOH96aFvAUstGQ6yaohKOOZ5U1JDkPvMWyAQeM=;
 b=MgBUvBkUGykDeo2GJszc5MBtS8Hs+WylXFGRkFvMcxKe9Q1pWuox0mUW7g2E5cpRgRzUzwlLFG77pUBvL1x0e90s2jgtW1RqdOAKQaWcxCd6STES96BE1kKoC2J8aejPk/I3L9IfkW9bUtndGvi7rn9irM9kzQWn9uydvJDm8fc=
Received: from SA0PR13CA0012.namprd13.prod.outlook.com (2603:10b6:806:130::17)
 by IA4PR10MB8610.namprd10.prod.outlook.com (2603:10b6:208:55f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 12:39:21 +0000
Received: from SN1PEPF0002636A.namprd02.prod.outlook.com
 (2603:10b6:806:130:cafe::28) by SA0PR13CA0012.outlook.office365.com
 (2603:10b6:806:130::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Thu, 4
 Jun 2026 12:39:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF0002636A.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Thu, 4 Jun 2026 12:39:20 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 4 Jun
 2026 07:39:20 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 4 Jun
 2026 07:39:20 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 4 Jun 2026 07:39:20 -0500
Received: from jeevan-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (jeevan-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [172.24.233.81])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 654CdIdS3378960;
	Thu, 4 Jun 2026 07:39:18 -0500
From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <s-sundararaju@ti.com>, Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
Subject: [meta-oe][master/wrynose][PATCH 1/2] kernel-selftest: add libcap to build and runtime dependencies
Date: Thu, 4 Jun 2026 18:09:06 +0530
Message-ID: <20260604123907.3597697-1-j-sahu@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636A:EE_|IA4PR10MB8610:EE_
X-MS-Office365-Filtering-Correlation-Id: caea224c-15ae-4332-aba0-08dec2364ce5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|18002099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	03/P/9we1vFGm9Fxqi6R6S1uyvwT43RSzEPOxvtIP0WUSct1VsoYLaE4B+zRLg4OjUaAwG0x21ec5Z2Xk30sRV6YoRFK+loVyziLN5Eq3RGSOV90jDgFnFHYB9dzbsuWeMQoMKbonGSGJnjODsvvDM1BLjOw4WU71UDnIY4LFhat1EnrMROYsBH6tFHO369nf9JgmqYTa6HDk2s3R+J5LbOIzEkGHRlNooX4rOi0Debn6Tfe0emx9wdcCy0uVuYWvb0/YjKNQNR69M3j6/aSc3twMQh5O8Eeg+YYYr/f3jU7JH8hnIcP9VZKamZAZ+Wgstdnb6F+R3MHITxCVfLKppxbQ0EyKi67zIdFl962Ddcp9x1JFZ1ZEK2yBc8F2wiuhvGBJtXR5PkK/Ba6yyoRT8h+eq8yNvD1QYV3j2N/ygH/gGtmjFlHru1J+fyq7Pf37A/7/rxafwRDhukmeHCjxvrr+SMy8xVM+IMIU6C8KKOaTdfGBq+mrLM0msjR06R7ADcJCjAwLGOaM1ycpihMVv/u3CCfGYmY1qdtZJDjIf3fG7QrPAdrlm/TQDhakLLeCKP8aBYjCTUU7iaG7eOT7hcXPi8FnuSIXZCCrT0+8jwjKOn9xJjh35JntM4xcJdYqOAE8NWmZWJOvXLYoCLdpzVd3EtfRBqWtQbVWVI/49xqBj4tbd4LkOVF4rLclyUKZ0mJSiavohve2PBDPcJvhnWNlHb9d4Tw4Wi8O9BVaSs=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(18002099003)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	zDoVadTHEl7RLq8VTHbVKm2esTqW69LfUdQNtlDMb5TzeqEQvN5RbBJ60cZB3WcMU8/MppBP9KNlPujWDpfv++ESx0aARJF0EXgTlvIcDiK4k10xbUlt/wBP0/K8MUpNFwZtynAa17n5ZaB3/BuqeNVTHM3h7VcWVL43JkL+9HVPguls8Ym4hcaw4Ni2bFqUcZdqQjRGm+RckLSnzGM1z3BeHfuWoCzkTnWmjwbrnsS6KrQXEr7h+1ntxhdV3u38fJRDmYjzfNWxV75scTK76noW5K7cVnWdHerZjxzlli1lOAiYsFYS4ZD9yeT79F1seNZ497tyK3RhtSFcVXJ+jqwENe+gcSmzS+cicqPQALNW3CjQrRFlQbrTC4ehmScNNJMJOkS47KV1RZ4d3BJTCLvD4KmXMJ60vQCRF82XFlWFR+d+SZBBWVxUxlz1ZszW
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 12:39:20.6672
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: caea224c-15ae-4332-aba0-08dec2364ce5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002636A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8610
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Jun 2026 12:39:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127396

libcap is needed unconditionally for capability-aware tests such as
breakpoints, cgroup, clone3, futex, ptrace, and seccomp.  Add it to
DEPENDS so it is always available at build time and to RDEPENDS so the
installed tests can call cap_get_proc() and friends at runtime.

bash and libgcc are also added to RDEPENDS: bash is required by several
test shell scripts, and libgcc provides libgcc_s.so needed by tests
that use GCC-emitted unwinding stubs.

Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
---
 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/me=
ta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 5c001696d0..ab544859d8 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -4,7 +4,7 @@ LICENSE =3D "GPL-2.0-only"
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b881=
4"
=20
-DEPENDS =3D "rsync-native llvm-native"
+DEPENDS =3D "rsync-native llvm-native libcap"
=20
 S =3D "${UNPACKDIR}"
=20
@@ -161,7 +161,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
 FILES:${PN} +=3D "/usr/kernel-selftest"
=20
-RDEPENDS:${PN} +=3D "python3 perl perl-module-io-handle"
+RDEPENDS:${PN} +=3D "python3 perl perl-module-io-handle bash libcap libgcc=
"
=20
 INSANE_SKIP:${PN} +=3D "libdir"
=20
--=20
2.34.1


