Return-Path: <christian.lindeberg@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA30CCA1005
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 14:30:38 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.58])
 by mx.groups.io with SMTP id smtpd.web10.78932.1756823435041513805
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Sep 2025 07:30:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=q7V40Nbk;
 spf=pass (domain: axis.com, ip: 52.101.65.58, mailfrom: christian.lindeberg@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f+/Unn5IWV2mOgdzye8pskN2/8iF7AFZipH/o2MYPYIN2w4wy73gU46QRjkSQeiTLLpYhiQix7NWglIr3idzqlGlxCw03x8hs+MERRsCi0LcYHBJl681YAJwa1MY3yylf6K6XqoWJdNSopiq9pxG0potiNabFM03HR0LBEIxi3dgR8jEAxz3HuyZqkRjGcVrC5yfkYDCzbKqwgnXtXL+0vlPIddQ9wWUykBHOyfDx7BjwVXdZBYs3tsnwOOeehaGgjHyyXBtFWvW6/W/7pi00r695ql1/Cui7aUxmPRV5WNe8dn3emrr8SCI6mhaYR3LLlSzn2CEIAuslSwYXozgrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OFthKb5PcFkL3fCKmHx9nYOkFzY/felmkpcb/waWhiw=;
 b=asLpn687gLRQezE5PMStdkij91xRN6VcY0dZEGZjX9Xfen1zQ+Hnn/EbuqS+AJp31QWLQKyGXvnlLm6FnkyxeDAv79C71ot1bZncbRgsSfEVbJS3c6tPOsO0CHVGdketLa657z8z5ZX9fZMlYm0prZBPhkPFEXCoNAthBRBUqnjLMH8ZmyoEOmgJYp+jWU9EpMzUlwecogCTWF08dDDfNTr04usy8czKI/I3LegcWsDjGovRyxgacviIRj/JuSUIfTZR4Ng4EqS8PHLFqIy0fBqTjArADJJWWF8KAK+7B5Lz9CHdNBipPYU+Hpa8hLnZQAYZs2t7f6H4rskth68Dzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OFthKb5PcFkL3fCKmHx9nYOkFzY/felmkpcb/waWhiw=;
 b=q7V40NbkOkMSOEM9LX6lIWd1RrnUkDHSgXMhCBHnmWh6dvrwRwPQB8pHeqWyeB9pCdDui0siEd06okw6vNEg+9FTcoHFStaHBgq0TUtDj1DGTw1roj0lBLE7T4cGK6TyVcku6vTrgPCwcdPhOoz37Fptv1v36nAMpOpEZuut9S4=
Received: from AM0PR10CA0046.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::26)
 by DBAPR02MB6455.eurprd02.prod.outlook.com (2603:10a6:10:19b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 14:30:32 +0000
Received: from AMS0EPF000001A7.eurprd05.prod.outlook.com
 (2603:10a6:20b:150:cafe::9) by AM0PR10CA0046.outlook.office365.com
 (2603:10a6:20b:150::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.16 via Frontend Transport; Tue,
 2 Sep 2025 14:30:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF000001A7.mail.protection.outlook.com (10.167.16.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Tue, 2 Sep 2025 14:30:31 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Tue, 2 Sep
 2025 16:30:30 +0200
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Tue, 2 Sep
 2025 16:30:30 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 2 Sep 2025 16:30:30 +0200
Received: from pc50740-2234.se.axis.com (pc50740-2234.se.axis.com [10.94.131.4])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 87EDBD7F
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Sep 2025 16:30:30 +0200 (CEST)
Received: by pc50740-2234.se.axis.com (Postfix, from userid 21184)
	id 80DD42426D0B; Tue,  2 Sep 2025 16:30:30 +0200 (CEST)
From: Christian Lindeberg <christli@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 1/4] crucible: Add spdx parameter to license URIs
Date: Tue, 2 Sep 2025 16:30:27 +0200
Message-ID: <20250902143030.139421-2-christli@axis.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250902143030.139421-1-christli@axis.com>
References: <20250902143030.139421-1-christli@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A7:EE_|DBAPR02MB6455:EE_
X-MS-Office365-Filtering-Correlation-Id: c0c1c5e4-090e-413b-e605-08ddea2d45b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+2H2mkIAoAL6crjQl10jh+YSZzfBfj4MgnWqlqhJi9LSF8WgQoHVJgauznZK?=
 =?us-ascii?Q?LtsZMT0Y7DcSuc5CgDkEkhi0H/+UgruaszI5ezIab7madH5yQBq59IpEJjjq?=
 =?us-ascii?Q?Ad7t95n2gHAPmCcw+0k2OcYnkexZn1BHy7fnfOpCxrhulUWFiNyY8JPY1USw?=
 =?us-ascii?Q?t+TWwDsjP13Rk2CJZhUswhAcVb1SZfFO+R8TuEopjgTgrl3G/eJCQWHQIxm6?=
 =?us-ascii?Q?uT69ym9op5ckdDETNvn4UjgF2eOzOgZLVoonKIyiNIHTzGCTGiWVrHTSw/A1?=
 =?us-ascii?Q?7pN3AVJVMa6U0ETQd2zSWhwZKxDFUOgPM6FVzW3hBpH6kSQCtDYjVHM1vETe?=
 =?us-ascii?Q?eWpb4PrhD2kBZS1Np0RtP+nV8fe5m8S2hE1UQjCpXCPhnnRDck+4EDSWLw7z?=
 =?us-ascii?Q?fYc1qenELDTf3+c0bjZjo+Jp1D9eUwzQOl60XgQxndmiTKQtQVLyScY4uzgb?=
 =?us-ascii?Q?AA0n8OIwYKC7ukn0t+/NjzLgI/8DyEA5dyIBgwPP/SLT1+ynIJ8X6ldopYz8?=
 =?us-ascii?Q?83vW6FekU4cnwpvD5yymREvSNxirK8DNSrCf64xSV3qdYY7fSyd6AGheYPxl?=
 =?us-ascii?Q?f5+toHtHyXmiMY8axS35drM1TeXInnQByI34AOQ/2X6nPZFDMd1GhhW3gvF0?=
 =?us-ascii?Q?523YL1ho2Cs4a46WcMEouwZGuFnNpfInuzy9rPl6uPz9Ns9Ov9G0b5DOAoRl?=
 =?us-ascii?Q?hGVy+3Jmhhelyg7zNiDVLsDnqcFyrLeL1A3IqLPRQ+1nL6zReIQW1my8EtbM?=
 =?us-ascii?Q?L3fu0Hg021goG2aBxqkoZyNJkmlnKfNBXrdkATGAeeqrflsQiZ6uvFBGD7YX?=
 =?us-ascii?Q?njqsstzSzHVw3JF272BmZxdlNU3Mlo1Ijzoul6RC73LiU0ua171fw6SOYtPd?=
 =?us-ascii?Q?z5nmcR7H2wKq+ztVb+N7keESA/RNLma4ahD1OvfP1CNckhtH/kuUqdm02rr4?=
 =?us-ascii?Q?/eYFPHQOCxJi0ckQS/SINL3Tg1wFL7dbrAgELRUj7pG/6m52tCWPRPGyhZFP?=
 =?us-ascii?Q?6njqJMOtr2b+5h5blAW5vdliFuzlI+mMyWfUCEkbbcYmzkQA3F0Y71CX6y7S?=
 =?us-ascii?Q?PMNEBZTQEwtro+iUfVMApTT9DQtcNDNWjwgkgZQ0jSmPlL4GAWTwFcoMjH2K?=
 =?us-ascii?Q?kgIPuU4dZ7nAyy9WRVCH6hIZ1svU0a9vN33+AmpSU4Ap0AXYe4dZyc/pQ4FO?=
 =?us-ascii?Q?k3IpomiDEzvJODewTLrxbVXN+G+FdzAf50j+yKU7hEvItwZBtHJhkTLrv53J?=
 =?us-ascii?Q?pMwgbvP1F3oy0Fbev7vCvFC/Lj1iQmCTy9tZq06eTdQ/kZGLtLOqLiUCLui1?=
 =?us-ascii?Q?l/prSoyF0ssndQZ/82CYprHX4jsWBIsd4CTCKYSzwr2gqrpc5FFke5euZgoB?=
 =?us-ascii?Q?Q7ySZ1kwXsGmY034oVoIVNqzrxNHAZmsBUOpCfFd27wtd7pciQWqmsjH2lsB?=
 =?us-ascii?Q?R6ZV79p1pgacD26O1vECV4vFFh2v/wRnMJUfzcLKzIq6z/ctwygNDbmsxeYk?=
 =?us-ascii?Q?NQNSeQ813DFMFqJ/EptKB3OxQXDvrbnunW0j?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 14:30:31.9736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c1c5e4-090e-413b-e605-08ddea2d45b0
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB6455
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Sep 2025 14:30:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119179

From: Christian Lindeberg <christian.lindeberg@axis.com>

Add an "spdx" parameter with the identified license name to the URIs in
LIC_FILES_CHECKSUM in crucible-licenses.inc.

Signed-off-by: Christian Lindeberg <christian.lindeberg@axis.com>
---
 .../crucible/crucible-licenses.inc            | 72 +++++++++----------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/meta-oe/recipes-support/crucible/crucible-licenses.inc b/meta-=
oe/recipes-support/crucible/crucible-licenses.inc
index bba9dbfc86..e4a2ca82df 100644
--- a/meta-oe/recipes-support/crucible/crucible-licenses.inc
+++ b/meta-oe/recipes-support/crucible/crucible-licenses.inc
@@ -1,40 +1,40 @@
 GO_MOD_LICENSES =3D "Apache-2.0 & BSD-3-Clause & MIT"
=20
 LIC_FILES_CHKSUM +=3D "\
-    file://pkg/mod/cloud.google.com/go/compute/metadata@v0.2.3/LICENSE;md5=
=3D3b83ef96387f14655fc854ddc3c6bd57 \
-    file://pkg/mod/cloud.google.com/go/iam@v1.1.5/LICENSE;md5=3D3b83ef9638=
7f14655fc854ddc3c6bd57 \
-    file://pkg/mod/cloud.google.com/go/kms@v1.15.6/LICENSE;md5=3D3b83ef963=
87f14655fc854ddc3c6bd57 \
-    file://pkg/mod/cloud.google.com/go/longrunning@v0.5.4/LICENSE;md5=3D3b=
83ef96387f14655fc854ddc3c6bd57 \
-    file://pkg/mod/cloud.google.com/go/security@v1.15.5/LICENSE;md5=3D3b83=
ef96387f14655fc854ddc3c6bd57 \
-    file://pkg/mod/github.com/felixge/httpsnoop@v1.0.4/LICENSE.txt;md5=3D6=
84da2bf3eed8fc8860e75ad84638225 \
-    file://pkg/mod/github.com/ghodss/yaml@v1.0.0/LICENSE;md5=3D0ceb9ff3b27=
d3a8cf451ca3785d73c71 \
-    file://pkg/mod/github.com/go-logr/logr@v1.4.1/LICENSE;md5=3De3fc50a88d=
0a364313df4b21ef20c29e \
-    file://pkg/mod/github.com/go-logr/stdr@v1.2.2/LICENSE;md5=3D86d3f3a95c=
324c9479bd8986968f4327 \
-    file://pkg/mod/github.com/golang/groupcache@v0.0.0-20210331224755-41bb=
18bfe9da/LICENSE;md5=3D19cbd64715b51267a47bf3750cc6a8a5 \
-    file://pkg/mod/github.com/golang/protobuf@v1.5.3/LICENSE;md5=3D939cce1=
ec101726fa754e698ac871622 \
-    file://pkg/mod/github.com/google/s2a-go@v0.1.7/LICENSE.md;md5=3D3b83ef=
96387f14655fc854ddc3c6bd57 \
-    file://pkg/mod/github.com/googleapis/enterprise-certificate-proxy@v0.3=
.2/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57 \
-    file://pkg/mod/github.com/googleapis/gax-go/v2@v2.12.0/LICENSE;md5=3D0=
dd48ae8103725bd7b401261520cdfbb \
-    file://pkg/mod/github.com/smallstep/pkcs7@v0.0.0-20231107075624-be1870=
d87d13/LICENSE;md5=3Da9b2952d51b44eae97b6090117f60792 \
-    file://pkg/mod/go.opencensus.io@v0.24.0/LICENSE;md5=3D175792518e4ac015=
ab6696d16c4f607e \
-    file://pkg/mod/go.opentelemetry.io/contrib/instrumentation/google.gola=
ng.org/grpc/otelgrpc@v0.47.0/LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4327=
 \
-    file://pkg/mod/go.opentelemetry.io/contrib/instrumentation/net/http/ot=
elhttp@v0.47.0/LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4327 \
-    file://pkg/mod/go.opentelemetry.io/otel/metric@v1.22.0/LICENSE;md5=3D8=
6d3f3a95c324c9479bd8986968f4327 \
-    file://pkg/mod/go.opentelemetry.io/otel/trace@v1.22.0/LICENSE;md5=3D86=
d3f3a95c324c9479bd8986968f4327 \
-    file://pkg/mod/go.opentelemetry.io/otel@v1.22.0/LICENSE;md5=3D86d3f3a9=
5c324c9479bd8986968f4327 \
-    file://pkg/mod/golang.org/x/crypto@v0.18.0/LICENSE;md5=3D5d4950ecb7b26=
d2c5e4e7b4e0dd74707 \
-    file://pkg/mod/golang.org/x/net@v0.20.0/LICENSE;md5=3D5d4950ecb7b26d2c=
5e4e7b4e0dd74707 \
-    file://pkg/mod/golang.org/x/oauth2@v0.16.0/LICENSE;md5=3D5d4950ecb7b26=
d2c5e4e7b4e0dd74707 \
-    file://pkg/mod/golang.org/x/sync@v0.6.0/LICENSE;md5=3D5d4950ecb7b26d2c=
5e4e7b4e0dd74707 \
-    file://pkg/mod/golang.org/x/sys@v0.16.0/LICENSE;md5=3D5d4950ecb7b26d2c=
5e4e7b4e0dd74707 \
-    file://pkg/mod/golang.org/x/text@v0.14.0/LICENSE;md5=3D5d4950ecb7b26d2=
c5e4e7b4e0dd74707 \
-    file://pkg/mod/golang.org/x/time@v0.5.0/LICENSE;md5=3D5d4950ecb7b26d2c=
5e4e7b4e0dd74707 \
-    file://pkg/mod/google.golang.org/api@v0.160.0/LICENSE;md5=3Da651bb3d8b=
1c412632e28823bb432b40 \
-    file://pkg/mod/google.golang.org/api@v0.160.0/internal/third_party/uri=
templates/LICENSE;md5=3D4ee4feb2b545c2231749e5c54ace343e \
-    file://pkg/mod/google.golang.org/genproto/googleapis/api@v0.0.0-202401=
25205218-1f4bbc51befe/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57 \
-    file://pkg/mod/google.golang.org/genproto/googleapis/rpc@v0.0.0-202401=
16215550-a9fa1716bcac/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57 \
-    file://pkg/mod/google.golang.org/genproto@v0.0.0-20240116215550-a9fa17=
16bcac/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57 \
-    file://pkg/mod/google.golang.org/grpc@v1.61.0/LICENSE;md5=3D3b83ef9638=
7f14655fc854ddc3c6bd57 \
-    file://pkg/mod/google.golang.org/protobuf@v1.32.0/LICENSE;md5=3D02d400=
2e9171d41a8fad93aa7faf3956 \
-    file://pkg/mod/gopkg.in/yaml.v2@v2.4.0/LICENSE;md5=3De3fc50a88d0a36431=
3df4b21ef20c29e \
+    file://pkg/mod/cloud.google.com/go/compute/metadata@v0.2.3/LICENSE;md5=
=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/cloud.google.com/go/iam@v1.1.5/LICENSE;md5=3D3b83ef9638=
7f14655fc854ddc3c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/cloud.google.com/go/kms@v1.15.6/LICENSE;md5=3D3b83ef963=
87f14655fc854ddc3c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/cloud.google.com/go/longrunning@v0.5.4/LICENSE;md5=3D3b=
83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/cloud.google.com/go/security@v1.15.5/LICENSE;md5=3D3b83=
ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/felixge/httpsnoop@v1.0.4/LICENSE.txt;md5=3D6=
84da2bf3eed8fc8860e75ad84638225;spdx=3DMIT \
+    file://pkg/mod/github.com/ghodss/yaml@v1.0.0/LICENSE;md5=3D0ceb9ff3b27=
d3a8cf451ca3785d73c71;spdx=3DMIT \
+    file://pkg/mod/github.com/go-logr/logr@v1.4.1/LICENSE;md5=3De3fc50a88d=
0a364313df4b21ef20c29e;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/go-logr/stdr@v1.2.2/LICENSE;md5=3D86d3f3a95c=
324c9479bd8986968f4327;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/golang/groupcache@v0.0.0-20210331224755-41bb=
18bfe9da/LICENSE;md5=3D19cbd64715b51267a47bf3750cc6a8a5;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/golang/protobuf@v1.5.3/LICENSE;md5=3D939cce1=
ec101726fa754e698ac871622;spdx=3DBSD-3-Clause \
+    file://pkg/mod/github.com/google/s2a-go@v0.1.7/LICENSE.md;md5=3D3b83ef=
96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/googleapis/enterprise-certificate-proxy@v0.3=
.2/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/googleapis/gax-go/v2@v2.12.0/LICENSE;md5=3D0=
dd48ae8103725bd7b401261520cdfbb;spdx=3DBSD-3-Clause \
+    file://pkg/mod/github.com/smallstep/pkcs7@v0.0.0-20231107075624-be1870=
d87d13/LICENSE;md5=3Da9b2952d51b44eae97b6090117f60792;spdx=3DMIT \
+    file://pkg/mod/go.opencensus.io@v0.24.0/LICENSE;md5=3D175792518e4ac015=
ab6696d16c4f607e;spdx=3DApache-2.0 \
+    file://pkg/mod/go.opentelemetry.io/contrib/instrumentation/google.gola=
ng.org/grpc/otelgrpc@v0.47.0/LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4327=
;spdx=3DApache-2.0 \
+    file://pkg/mod/go.opentelemetry.io/contrib/instrumentation/net/http/ot=
elhttp@v0.47.0/LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4327;spdx=3DApache=
-2.0 \
+    file://pkg/mod/go.opentelemetry.io/otel/metric@v1.22.0/LICENSE;md5=3D8=
6d3f3a95c324c9479bd8986968f4327;spdx=3DApache-2.0 \
+    file://pkg/mod/go.opentelemetry.io/otel/trace@v1.22.0/LICENSE;md5=3D86=
d3f3a95c324c9479bd8986968f4327;spdx=3DApache-2.0 \
+    file://pkg/mod/go.opentelemetry.io/otel@v1.22.0/LICENSE;md5=3D86d3f3a9=
5c324c9479bd8986968f4327;spdx=3DApache-2.0 \
+    file://pkg/mod/golang.org/x/crypto@v0.18.0/LICENSE;md5=3D5d4950ecb7b26=
d2c5e4e7b4e0dd74707;spdx=3DBSD-3-Clause \
+    file://pkg/mod/golang.org/x/net@v0.20.0/LICENSE;md5=3D5d4950ecb7b26d2c=
5e4e7b4e0dd74707;spdx=3DBSD-3-Clause \
+    file://pkg/mod/golang.org/x/oauth2@v0.16.0/LICENSE;md5=3D5d4950ecb7b26=
d2c5e4e7b4e0dd74707;spdx=3DBSD-3-Clause \
+    file://pkg/mod/golang.org/x/sync@v0.6.0/LICENSE;md5=3D5d4950ecb7b26d2c=
5e4e7b4e0dd74707;spdx=3DBSD-3-Clause \
+    file://pkg/mod/golang.org/x/sys@v0.16.0/LICENSE;md5=3D5d4950ecb7b26d2c=
5e4e7b4e0dd74707;spdx=3DBSD-3-Clause \
+    file://pkg/mod/golang.org/x/text@v0.14.0/LICENSE;md5=3D5d4950ecb7b26d2=
c5e4e7b4e0dd74707;spdx=3DBSD-3-Clause \
+    file://pkg/mod/golang.org/x/time@v0.5.0/LICENSE;md5=3D5d4950ecb7b26d2c=
5e4e7b4e0dd74707;spdx=3DBSD-3-Clause \
+    file://pkg/mod/google.golang.org/api@v0.160.0/LICENSE;md5=3Da651bb3d8b=
1c412632e28823bb432b40;spdx=3DBSD-3-Clause \
+    file://pkg/mod/google.golang.org/api@v0.160.0/internal/third_party/uri=
templates/LICENSE;md5=3D4ee4feb2b545c2231749e5c54ace343e;spdx=3DBSD-3-Claus=
e \
+    file://pkg/mod/google.golang.org/genproto/googleapis/api@v0.0.0-202401=
25205218-1f4bbc51befe/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=
=3DApache-2.0 \
+    file://pkg/mod/google.golang.org/genproto/googleapis/rpc@v0.0.0-202401=
16215550-a9fa1716bcac/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=
=3DApache-2.0 \
+    file://pkg/mod/google.golang.org/genproto@v0.0.0-20240116215550-a9fa17=
16bcac/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/google.golang.org/grpc@v1.61.0/LICENSE;md5=3D3b83ef9638=
7f14655fc854ddc3c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/google.golang.org/protobuf@v1.32.0/LICENSE;md5=3D02d400=
2e9171d41a8fad93aa7faf3956;spdx=3DBSD-3-Clause \
+    file://pkg/mod/gopkg.in/yaml.v2@v2.4.0/LICENSE;md5=3De3fc50a88d0a36431=
3df4b21ef20c29e;spdx=3DApache-2.0 \
 "
--=20
2.39.5


