Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5BEBF53D86
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 18:33:10 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.58074.1773685982006795961
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Mar 2026 11:33:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Owt3v1ic;
 spf=pass (domain: axis.com, ip: 52.101.66.7, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jsd9uqWzDqrHLPKk5gXfehhmtFc68vvPcryKGqVTm/EjzStB1fk9KFZZ5le8B6vousSo/vr26OU1a32/jqMGbz2Kwq87wGjg5T+SdU9EruGFSd9Y/Bn7sa2molQ4V/HINu883ojhWFQ8t89wTFD/YTu30z9zCflN9cq/cZEizThvv/dJbbukoN3oa5hxJtTdqaO16V6PbxI92krsXC5OQEHdBzAtIUxmaXvIh5Iv/VtFtf8rGibbkgEhEjiB+5CKkNbG2E9M7ugOGVz/cdELrX/MMwc0TerVwdNJjONkJyDPX2wXv7hLufHr24AacmGVL9u+s6ngvSNXgv0p2vd5Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4HovUrW/DfvjFkOvp0m+OXFJjo7MSJmV/NBtmU81Jos=;
 b=J7SsRDA7DWBVXXa/lYiHUOxMc/XDYq0rH/oksacno0FWnF9ZgmsvK7UyGH0vhU7eKMAjrrRoxLAdJl7d/6I5p4JK/hBvZrxF3NaNrdVFJ1+myWSrm5L/3NHexVfCWhx0d+jLnxWZtDIuTCO9zE2CbGgQlZMQ3Pn5ynKAJJr8BJHcCyn8HFBW4fBJF1ygnU5Slpk3aTTI8Hr8qDIT0i8erIIaRTovMvnGUXiE7ME0czQ8V3kzxLATEyY3uw1ooBUMfdLIeV3jbY826h/+e7td2R2HH/uDq9k2oHFrSSjHNKGYQXuaxarVrjd11INip2znrA8VcFvlXHdkflAU4HiPdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4HovUrW/DfvjFkOvp0m+OXFJjo7MSJmV/NBtmU81Jos=;
 b=Owt3v1icbP7NJdCp8C5zkbSy7oUI1KDTN6VCxc8jskNewLER/4LeKICLkg7hAs0w8pzGiin5xaOu7UjN9l76ZkT2b4sPwBu7zH4mriPfxnIINXHoIu4lTQkQ72dxHit1VQPoKox5fOkSjNuqnfM0gHGt6lK02BAi7IyBPub4FdE=
Received: from AS9PR05CA0209.eurprd05.prod.outlook.com (2603:10a6:20b:495::18)
 by DB9PR02MB6715.eurprd02.prod.outlook.com (2603:10a6:10:21b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 18:32:55 +0000
Received: from AM3PEPF0000A798.eurprd04.prod.outlook.com
 (2603:10a6:20b:495:cafe::69) by AS9PR05CA0209.outlook.office365.com
 (2603:10a6:20b:495::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.22 via Frontend Transport; Mon,
 16 Mar 2026 18:32:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF0000A798.mail.protection.outlook.com (10.167.16.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Mon, 16 Mar 2026 18:32:54 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Mon, 16 Mar
 2026 19:32:54 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Mon, 16 Mar 2026 19:32:54 +0100
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 5A62F288B
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 19:32:54 +0100 (CET)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 591BE120537; Mon, 16 Mar 2026 19:32:54 +0100 (CET)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] bpftrace: Update the runtime dependencies
Date: Mon, 16 Mar 2026 19:32:51 +0100
Message-ID: <20260316183251.3117288-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A798:EE_|DB9PR02MB6715:EE_
X-MS-Office365-Filtering-Correlation-Id: 621c778e-0934-449c-3a2a-08de838a706e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	G/VbzrIfcBDescohg9JHsDQUJW/7xKNHl+Y++yAWwUTIPTdbD7HA9crZ7I3ZqnEkknNzToQuSnc+ZzEdDiBuyxw7WWFpLXogB0feruo04NF7POPlWTEpKzEvrIbs4hsyEVXidvpg1/caJjridxMSbhzhwYuqATqgpL0/AsL6TTFDmxBPunYBp7bZTOFgx6g+t/Yys9cqinLc547GKUKklDTKdaNp0ChXfWL+neJtMZvmpjA/v10810PBvgFUnJtwTFskJ0LAggYy6FTGwhyZykUBnRLxIkTi5Iyb7Oy+bbREI1CT+a3Zj64zgRRrF5ajrm6ckawFIIGtg6iBSKGaZZiDQTix5auP0QsHVH4GMqnnBQeANiGjX9HDDOUsvHooor6wryVepjYpRbGG0KMTTgUClehcsbJ+KNZOv3DIzDivO1mJnc0i/Q9EVDyr43dS1L9CnHSxkW7a62vPCggd1jkI3XjyDquMpbEYD2xjLbWqUrg9CQWE0k1Q1H+fDhOU1o4qG2HXOXVfobDCdrBG2WUftDcgapVbJPR59Iwwuz0n6Rmc7vp/I+ckygZNPmzULy0ykuaQkAn+9kV2GCN0AYuozQFA0RoAh8v5GG4+JOXLGYjqgfQBv863x6ohd0nPCpYt4zS4LSWVJH1cr1b9uwsKzjqWLu4bXyF8eC/o0eqwLVwtyVGxPqbt1j3fugOWljA5Q9xBLuw1BxSKMegKUmcq7jvwYGy4tOMD4Y8Q/0IHkROHN2gA2BTQorOgfR3Ph8zsKoafNc/Bx1WxMmUkRQ==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	JA7yCT0P/cu5yVdZZshDXQlTCQQENckD2GnPKIjouxn5hQV+V2T2dwIhBKT+ZNB6/s+/Y6z8gKxDHhFyVBgufeU/2P0RbgIMFldo+K6/i+tzWD1YVIHmb+qkOdAeuYwVpW8EZoIZU3/Rg25eyJB8RZYg8VEtF6qu87KbQ9Es7ppb4M4dPA5oMr1elRDoXHv4CQb1ACZSt9PDN6ImGSJ3nhBxdRU4Brv9n8dpW/SMNG7e+mI12sfT7ZQdyIP1hocOY2XEUTQ1/TIKZmkVh8akI3gtyZZDr/ys+LceWVqDLFNsurkDXCQtvv0xqsAPFmsPb/iSCXmxh+Re81+EgEx7driJTGIL5FhP45Tv9G8BN57aWaf1hRE2wYkwv3yKc9dSXxraGlug7Pn0F2gLubew9aqWWXw1hLkmTbVOgikQvAdRcAQtFDbb4pK9IDgd3SEu
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 18:32:54.7796
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 621c778e-0934-449c-3a2a-08de838a706e
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A798.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB6715
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 18:33:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125282

* bash and python3 are only needed by the ptest package.
* xz appears to not be needed at all.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../recipes-devtools/bpftrace/bpftrace_0.24.1.bb      | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/b=
pftrace_0.24.1.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpf=
trace/bpftrace_0.24.1.bb
index add2ff01a8..33de2f4054 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace=
_0.24.1.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace=
_0.24.1.bb
@@ -15,9 +15,6 @@ DEPENDS +=3D "bison-native \
             "
 DEPENDS +=3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'pahole-native ll=
vm-native', '', d)}"
=20
-RDEPENDS:${PN} +=3D "bash python3 xz"
-RDEPENDS:${PN}-ptest +=3D "bpftool"
-
 SRC_URI =3D "git://github.com/iovisor/bpftrace;branch=3Drelease/0.24.x;pro=
tocol=3Dhttps;tag=3Dv${PV} \
            file://run-ptest \
            file://0002-CMakeLists.txt-allow-to-set-BISON_FLAGS-like-l.patc=
h \
@@ -41,9 +38,9 @@ do_install_ptest() {
         cp -rf ${B}/tests/test* ${D}${PTEST_PATH}/tests
     fi
     for f in testlibs/cmake_install.cmake \
-    testprogs/cmake_install.cmake \
-    testlibs/CTestTestfile.cmake \
-    testprogs/CTestTestfile.cmake
+             testprogs/cmake_install.cmake \
+             testlibs/CTestTestfile.cmake \
+             testprogs/CTestTestfile.cmake
     do
         sed -i -e 's|${STAGING_BINDIR_TOOLCHAIN}/||' ${D}${libdir}/bpftrac=
e/ptest/tests/$f
         sed -i -e 's|${S}/||' ${D}${libdir}/bpftrace/ptest/tests/$f
@@ -59,6 +56,8 @@ EXTRA_OECMAKE =3D " \
     -DBISON_FLAGS=3D'--file-prefix-map=3D${WORKDIR}=3D' \
 "
=20
+RDEPENDS:${PN}-ptest +=3D "bash bpftool python3"
+
 COMPATIBLE_HOST =3D "(x86_64.*|aarch64.*|powerpc64.*|riscv64.*)-linux"
=20
 INHIBIT_PACKAGE_STRIP_FILES +=3D "\

