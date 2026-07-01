Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 295F8C43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 21:17:57 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55953.1782940667879061503
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jul 2026 14:17:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=oWc38ML7;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=cSPgp9XD;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: a-christidis@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 661GppSo3884293;
	Wed, 1 Jul 2026 16:17:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=0VtVzTj75dA20
	wkgPg1FA5iMXCKJ/vesBPKzbszw1qU=; b=oWc38ML7FdlvVylpCS5UHJT5bIT7s
	GBfO/V/EUhH9oZ3I0pioE4nnxh3JMurZBHj6tujU1nba9G8CP/LwPmxOT07B/CE3
	Z6ZJk1EuhexujopBcblkIblhNejTCW1IiDG14JRHLOdzUAEitBrm6re5HTE6xXQO
	a52vdbSG5eG37pV7as1udMifyoRkyi0yjN+2Snd+DyLhPomheewvZnK9L6gyiS1i
	dzHGjvlTXdB5xlSmNT97PYLIT/lSWYihNCEpqBmr+DRJWTNxBEAQrjJ/hLdKmwgA
	9M9LC/I/qw73V4U4jTwmgRgfkX+8qsPwixYKuJ6UsIf8YRLbsqmG3Bl9w==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011026.outbound.protection.outlook.com [52.101.52.26])
	by m0384305.ppops.net (PPS) with ESMTPS id 4f5240upfq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 16:17:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xg+YFUWDh+RIrADCU/QNlRdH+JG3SYHrGJGHN09xAG4YbMJzvJ+6jvMxpH6Q1k+Z99SuT6eTO1H5vYKqeMbOu7Be/ShCpuF8R0Asccy+RAtFiymLlpQIQHGOqJ3T4HL2x6447gPN46t2N77fVzwfICY7xcN1QIc8qgiBRppHft+XD0I6JezEoBrYPgWul/8FzkPtlU8sbajMnMaYQjbzXHC5jpzfi7x3Zb41nr/KHNMkuTsBNc+J05zLmwKUuJiNK0N9t1lyf0ZgFprMZBTYJAW87tIKmfMdHtM1CqtGkGLeaSuit5hHRQx2u0CIsDBccEMOZNqEAAwHjzvADFL9Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0VtVzTj75dA20wkgPg1FA5iMXCKJ/vesBPKzbszw1qU=;
 b=kmBiTjP10mSNEDSZ+Cb4clVdNrZp62TT4NsjSaX9qPOyoySVnqvE3+c/DyZtCNJBOAWxzVNLDPwMlDx+0Y6YGni8GUlem+CTFVReEPClCmjFAZbpug1FxjO4Krnz4qgqPIAafUsmDsvtFBLzzbMQfvuiDTUDxPSgVcq56bJq7Q0raGGv+4VhlgHnAUDi/46TGGYP5m6xmLYxXAuWqZ2JR3DrbO7KeDNoKU6rdqNVquw62PVTV4xRT/o+p9XDLSLPlcSltCx7eSJhzbCEWnmK9/cmiZI1CmNrKTwGbY5N9+s3LF159OR9EiJaPirhenviw1dazdfpt6kpSiGlmcI1Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0VtVzTj75dA20wkgPg1FA5iMXCKJ/vesBPKzbszw1qU=;
 b=cSPgp9XDMJSilXTDqBJNJ+rfckmp8YsuRcAk7Va+ajWJNa8uhrBCnlqK1GXGhSWx/QSyOmRJCWf+gxdUe7smRdKTUt3x4O4NLmGRhCZAxGHmQ60t5nW1NWrtoSzByhJI0EU58VwZC5/YYe4kPJM2epSUvnBCC3DzVea3kI3etwI=
Received: from PH7P221CA0085.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:328::19)
 by SJ2PR10MB7559.namprd10.prod.outlook.com (2603:10b6:a03:546::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 21:17:36 +0000
Received: from CY4PEPF0000E9D2.namprd03.prod.outlook.com
 (2603:10b6:510:328:cafe::6f) by PH7P221CA0085.outlook.office365.com
 (2603:10b6:510:328::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.9 via Frontend Transport; Wed, 1
 Jul 2026 21:17:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000E9D2.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 1 Jul 2026 21:17:33 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 1 Jul
 2026 16:17:31 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 1 Jul
 2026 16:17:31 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 1 Jul 2026 16:17:31 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.75.243])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 661LHV6a2254933;
	Wed, 1 Jul 2026 16:17:31 -0500
From: <a-christidis@ti.com>
To: <khem.raj@oss.qualcomm.com>
CC: <reatmon@ti.com>, <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][master][PATCH] opencl-cts: Suppress -Wfree-nonheap-object compiler warning
Date: Wed, 1 Jul 2026 16:17:31 -0500
Message-ID: <20260701211731.1620462-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D2:EE_|SJ2PR10MB7559:EE_
X-MS-Office365-Filtering-Correlation-Id: aa48e28f-bc31-4644-06a8-08ded7b62ac2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|82310400026|376014|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	JapYzZmTdfH1VY0Mxr3jn/P2kqk7CBz7cGWpcFzOhgqImlkstRf/sKzaS/6Bd5vBTGmWob0S0VLefWhyZSgH91eahgDcE2gbpZIj1+ssIJV34/OiAQKNGjdNtGV/KOTF1+8lPMhOvzDz4PLRvEo42JYPRligsUnEG5HSYVc/RBK7wsnwvRxbF9efWyEH1/1Tm/nEvNuD+iPVfQ9fSJ4vrDXTFXMSP9FDmu6IVLCJBnzQYjOFF1O+tMrf2u7ZFtn4sYQID8XdVtXS5fwbHAwfUHV7s9ZuUqNv+j4aQYO6d9WpxgNj3tx//FWyKSYoHQ0McHixiqmG0Y6kAdR5PVINQMLV8VJlZag1Fl2E5v4YtYcuOhxXANOCs3oGle/gtqFB8K+c3dAdPOTbsqMnmeIx55XsSmjWO0j+AZCgCRrmY9AX81E2AWYGjMGTxSgs43wy9z95D2KBZlbs3fAcYTUTkdM4j1Q0MqerN469AuAuMUQGSsRM6ixKsLzSewR+29Q0VGUJfX5oWXTeqUwVOpzzJcrSNzi04eI7KgBzEF8UzDbzfNzN5mqBJNSr2wdlidq2EvT6tFLQ3NkssadycQLal9Hs7RnjsIFQ1KjQG81/es8RJj8CKDf+yZOKyD7HleqHg8YjvfCvaecppwmtwlf6vIlZ+DGS1oOU8f4QbJ/fgZbOKrWoYCJEKazXNvwfdcrgqYObygyzSCWS/l0ssazGJw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(82310400026)(376014)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	KvSHqyIYBlBp1kJocT0yMVoEiXeP/vmdynXRn+zKVqJtEyBK2RXXrFhTLmr6p9EbdmAJNwtLrt1BoSqmYO5Keg+ZHxZDkPpPRunh9GMqbQVAER7JsG7ylxpCp/lqQRQ0I9p7Rzhej5cDQPXsDW8Use84beESG7Lq8aIOihAtJHUhsADU0M6k5K52xivd2Ut/6GHqZu4eY5LIiaQLSHuO21ZCGSlmR5w7W8itoL064mOT+19Xyi+JUV87uJuD/+ttK4md5nyJg0u4x2H7HJq1h3jXQYmPYJe/wDHMdioRyPMy12aUPRGQRw+5uP7FASMJGbGV8YLwWdzAZpniEWYkKxHyNez+T5naIgnuQTDuSKXPBpoSkhpKhU+sH7nRg0bk9dBW37+Zap8GC3fBRHT8iHMLLtbNBs3XhF4kBJRQlX5/NIhXagSV/24D0N1GEAa3
X-Exchange-RoutingPolicyChecked: 
	ZVgv66pd1DSZd9P4P/gaMWRlqbCWyQ1loIDok0EoNC/2nfbMC2KsMjhcTDXicZNqCmTsO2YIDmKV/HpJJFhKe8eIcJGW/VHIerj499kRtA5NtnZpTJMCnAutoYyQEM451cl4Xs2ZdqQOICy3nqPvFow1rTevRtGm0G8swDBh9wxJ8flInK5upue1h58AknwDFtZ4JRj39m1hWK1+WX+wttvdLkZQU76fLFS6Nszym4job8NqmbHFVYM5/+S+4TSi06/DlgHLPxHzuBgFxkpclxTJFs5NfQqNBXP4jO2ZdKulkEqecKT+Kc8db5tC15bmVfkkFLv+8VYy/XZVn2D1lA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 21:17:33.3722
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa48e28f-bc31-4644-06a8-08ded7b62ac2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9D2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7559
X-Proofpoint-GUID: ZRP08VRzpwlAgdIGUfmPsSqQKVJ3_90f
X-Proofpoint-ORIG-GUID: ZRP08VRzpwlAgdIGUfmPsSqQKVJ3_90f
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDIyNyBTYWx0ZWRfX6PMH+4D0UkNj
 yMP/IFanSScgiOI7Wr/ZSE/XvFMcTxI+GWIxR2bO66f2QNjF7DYIxgGdVSW4ItUsO7QC5faRW3D
 +epNBc+J5F36v3nwDYv4OTSrgpfiKXo=
X-Authority-Analysis: v=2.4 cv=cfPiaHDM c=1 sm=1 tr=0 ts=6a4583fb cx=c_pps
 a=hWS9KTtKglmM4LJ/Q12dcg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=_1WiUjqA1ILcwL79l7kA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDIyNyBTYWx0ZWRfX9i2mPqMi2egO
 u2UIeXFqTC1XF2AlyV17Gc602uMTsM/SEzX1GzgPwXoT7vVhQOI2Nz2qipkGJy15ZagDcCHFkkS
 hVa86ggmk3ZqIc3gxeVXAkFNLcrRZRdAovBNc9ooIyl0r9OaoAl4UTg29a4QPdsTo9bRYNoirnj
 aNp0K/kYQTRflwXicnjtBkk46Ib8la0qn/B8plbtySHhq5LOlASJwtZG0zPSlW/0Fb+DAKELhOe
 +8Iuy4CCLqoYrMVrrpozCTFFPA+SbB6+Q05XKwugkTmE9AO1/FEze2VunDijN3mvhB63r+Umkm+
 tGzC5ODpxAEh9HYG9WxA+pCh2NT7je/zwPGnftO+7EEdeqTl0LYLc5B9Sfp3Wmk/0ntn5pS8vQD
 7ymz1qKAMiA4kVjLg/lR7KEsSoRxESMOoY2l2kJHUQptFK0UtPE0aucI0/91KjVhzE5SiI9R0kc
 WALiTEpZhHIIM42etSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010227
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Jul 2026 21:17:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127997

From: Antonios Christidis <a-christidis@ti.com>

Suppress warnings from -Wfree-nonheap-object check. The warning occurs during
std::vector cleanup when deallocating memory with offset pointers for
test "compare_pointers" only on 32 bit platforms.

/recipe-sysroot/usr/include/c++/16.1.0/bits/new_allocator.h:183:66: error: 'void operator delete(void*, std::size_t)' called on pointer '__result' with nonzero offset 24 [-Werror=free-nonheap-object]
  183 |         _GLIBCXX_OPERATOR_DELETE(_GLIBCXX_SIZED_DEALLOC(__p, __n));
      |                                                                  ^
/test_conformance/generic_address_space/basic_tests.cpp: In function 'int test_compare_pointers(cl_device_id, cl_context, cl_command_queue, int)':
/test_common/harness/testHarness.h:151:9: note: declared here
  151 |     int test_##name(cl_device_id device, cl_context context,                   \
      |         ^~~~~
/test_common/harness/testHarness.h:154:29: note: in expansion of macro 'REGISTER_TEST_VERSION'
  154 | #define REGISTER_TEST(name) REGISTER_TEST_VERSION(name, Version(1, 2))
      |                             ^~~~~~~~~~~~~~~~~~~~~
/test_conformance/generic_address_space/basic_tests.cpp:776:1: note: in expansion of macro 'REGISTER_TEST'
  776 | REGISTER_TEST(compare_pointers)
      | ^~~~~~~~~~~~~

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 meta-oe/recipes-core/opencl/opencl-cts_2026.06.18.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-core/opencl/opencl-cts_2026.06.18.bb b/meta-oe/recipes-core/opencl/opencl-cts_2026.06.18.bb
index 17480d62ef..e0db6a1314 100644
--- a/meta-oe/recipes-core/opencl/opencl-cts_2026.06.18.bb
+++ b/meta-oe/recipes-core/opencl/opencl-cts_2026.06.18.bb
@@ -22,6 +22,8 @@ SRCREV = "8d8f3d272dbd3f0a84156be7890835c4b6deff8e"
 
 EXTRA_OECMAKE:append = " -DSPIRV_INCLUDE_DIR=${STAGING_EXECPREFIXDIR} -DCL_INCLUDE_DIR=${STAGING_INCDIR} -DCL_LIB_DIR=${STAGING_LIBDIR} -DOPENCL_LIBRARIES=OpenCL"
 
+SECURITY_STRINGFORMAT:append:arm = " -Wno-free-nonheap-object"
+
 PACKAGECONFIG = " \
 	${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl gles', '', d)} \
 	${@bb.utils.filter('DISTRO_FEATURES', 'vulkan', d)} \
-- 
2.34.1


