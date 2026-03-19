Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0532A1088E73
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 04:22:02 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3929.1773894118261712308
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Mar 2026 21:21:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=bdqXN3DS;
 spf=pass (domain: axis.com, ip: 40.107.130.70, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SKr0RH6CjRFZVXjf72xVii2gKzqQBQK8Oo4+u5GmZ+IIzr/wiPtU9FXVR02MBQXSNvGz1+67FklRHMtvET5yZD2tTk27+U4y3V51expFMsv/L6iuVN1AJijuSWstsCp3nVwO3AF+eTLI1wGqjh/U7r5PVfjh3WYXNFxCjoOnzQT2IYu1BY8Loiy4NsiM6TsMW/e0lF5/N0QThWeBDEeVXlvcjSR1Jvl4kd0Wl2UOAEUrWdozVAiQIcm8FJaTS/XSPuDhrPdqeYppQbIsqLMgnmvQZ3zqAmYrYAQwo1+0yDSgAMS+O07uSTm9eeHh94wIo06sEeqWktOrw56D8zV0QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4HovUrW/DfvjFkOvp0m+OXFJjo7MSJmV/NBtmU81Jos=;
 b=mv4bxp/ciu6ZA22OiQ19T10cLOP5+l5MU4UV+wPp6IaQ2OexYu/9KwcKomMl2FG4gaTpbAQ9fyX+VSQXQODrQhO07c130gFI5quG4G/2yJrqaUaHO9ZJNy13jWehrTaoiofA/PnkideADA2gOME4pe+Mkoqwwt0L4nNHyOJtiCPLM7Qv+WaDHozb9uPgOw4wRDdhDyekFHEAFvsadB1wzMzZeomY6hObHScLGa+c3Rc/rbaBEwM019AMn/FBnwqZNPGcy+641HQmCOhSNwR7mdbSeJ1+UCToR2m8Ez/Leaiu7upsu3MjfwiIj9OqFsZUivolqVCBhllOhU2wCEeIsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4HovUrW/DfvjFkOvp0m+OXFJjo7MSJmV/NBtmU81Jos=;
 b=bdqXN3DSKFaOa32PKiBsCjalXq03xHIgAn7uu90KuYzi2WxQgKjCCQDfkb791n+JxtcK4dlwlgbFq328YLeeiwPTjwdo/6NDDQT55zsV9YPqLuF+5Q5izuyle7TiVsA/dRvK7if9pPvpFVPHE3U6frHNdPU8wnpH71sBHEGV0zU=
Received: from AS4P195CA0006.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5e2::11)
 by DB9PR02MB8348.eurprd02.prod.outlook.com (2603:10a6:10:397::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Thu, 19 Mar
 2026 04:21:53 +0000
Received: from AMS1EPF00000043.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e2:cafe::7b) by AS4P195CA0006.outlook.office365.com
 (2603:10a6:20b:5e2::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Thu,
 19 Mar 2026 04:21:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF00000043.mail.protection.outlook.com (10.167.16.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 04:21:53 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Thu, 19 Mar
 2026 05:21:52 +0100
Received: from se-mail11w.axis.com (10.20.40.11) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Thu, 19 Mar
 2026 05:21:52 +0100
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Thu, 19 Mar 2026 05:21:52 +0100
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id AB0ED2665
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 05:21:52 +0100 (CET)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id A622612063C; Thu, 19 Mar 2026 05:21:52 +0100 (CET)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][whinlatter][PATCH] bpftrace: Update the runtime dependencies
Date: Thu, 19 Mar 2026 05:21:51 +0100
Message-ID: <20260319042151.1749449-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000043:EE_|DB9PR02MB8348:EE_
X-MS-Office365-Filtering-Correlation-Id: 97c90c81-0d7f-4118-772b-08de856f0c9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	+6uxwWVhUGijmUr4n7DXkZlhPYk9umV1LhHZaQlu7HCaCyoE3jF5lGankNfVWCOO4b0Tgu6IglgX3fjwY43eN+fjxjsEq21M/lytJkxec565WzD/hpeqNfZVMmj9RtF7GxTu9Y2q7jPRkejj9fSD+3SUE9ejIFuqOnfXKe04IXnS5Fu6GcbvZ5aRJDW4OYZQEpxKxHUz/NY58CKqs9FS+eKurFulo6lkaKhfH2hLHDXjiXPmt+rWk43AokPW3fgpvhW3g95Yke7XDV0H+7eMpOyKuAYhxkw8jhjehhx0FL0+pu7BXe5KpFAlGgg4POPcJPKmSVY4v4CUzC/bvGegfsC4cHk150vDaAhPi3fIyZwn4s6ibXD2pC3KK6rDXpMJ32tVtRrNBSbfgyvrTl0sha0HjLBFpZM31z4e7h5IATeqgldSqgFS/q9meZIAQzTTMPJWHZS3k1X5FLxWC+PW8Vjh65M5DXRcpvb4BjsOTcEiqHFu0odJroB3SE6ijX5q2h6oJykSSoH1BYO855L0crki09qPoKu4hs+8lyPACoCbqVFntv1jwKYlsFqgQnoX+vfWz0s/Izi+dgwKcv8WMMcYF20zj7RJIzMClLtAsmoGIZ8vwwmDoglf/1vwtnukwtbxHl5w2Nw6Z6TwwdDFFTDwcD4C8w0xswZeyBmHZ0cDGR8Zxe7gl7uB4S9xjfazA/aCz0TZmFB6OnqK6ew5+BM2J8+P5fK0kD9+SyC7SC3Jz4rJIAE5N+OlTWLUlL3PVud5EP0RRw33bG2zViKc1w==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	h24mRZMlUcW0AZpzDHsLlOTi7rdg8q17Ck/0kboUdmN0sx25cJKstSiPiFT3ormN/EkyM7kppWZlyv1f23IYulV6JvPfURPiWRi9eThtpFy26bViJZXhvrSGhsqRPAO+lsyOhjAEp345ZB1KsIS8KfbyROcLTQaYpIVgn0q+nQWRZvx28RFzVw2NFUvAdcJqbCN7A19t5rnJkXF+YhiVQzqYIDa7dXzwikDZK5xD7x0JmKBC7NmWL2s/v826qGNmesK1vwSYfPjUDKesksm7JrWKMEwTo/4o4mT64wHkPgcadaTXaHUZymjLyC62fFe4N/7tWofC8Z0L/5/t2VxU5dJZs8mxCvEiIN8GAvqlatkei7hwwcx8+xwzLk3bfzDsGIRszB/emk4PAs/4Khm0nBHVfr3rAOn1mzV94blnopSuQP0Je02kGqN6vLNgD5hu
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 04:21:53.2448
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97c90c81-0d7f-4118-772b-08de856f0c9f
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000043.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB8348
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 04:22:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125374

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

