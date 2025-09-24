Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94378CAC5AC
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 02:04:02 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.42])
 by mx.groups.io with SMTP id smtpd.web11.2428.1758679439775528603
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 19:04:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=pHNYSBbY;
 spf=pass (domain: axis.com, ip: 52.101.84.42, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bl0tBkpiH/9pFh94MGxJnBB0hDkNXOGW1YrchIVBoq1Vak9p2m5YUcFR+dxz8lWybrc6ioJAHQl4aZGhmLzxuSLbpvTHFuOFernvPRRXpyJ2iTNyE1YRZCf9pmyCGmcE/hBk+VL8aVNZvBD45kapnYOLZ4M4yp01dgWbus2JW7VjJ6fbl9j1dY0XEf454I3b+ERybkk2iaxfYd0NRK5zS9NMgeTBSofXbaQpIiFEgfVG7kJuAsG5+Jo2ARpCBF6vPa+juLFuE1KsVn8LwDYXm6cF1ZsCNvuGELctGNdvx+0D5WbhU8n+MCj8Cspr9up8sX96VQqtvM7Jffz+vy7F0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SB99f8xmOG+54VPCUCgHviYYTKtvn7ZbVsT9aWXJWOw=;
 b=On9C8jT6kmrGWoW5IKaC3JZ9dx293TDRMxEMfcZwkWh5fUbrvfxASqU8i++F5gQF0S7FYSV3fDBE5YTrLTngLZAI9CsOwurn1e1c5sJANMKCL+gD1FhAaFLsDFPoUi3DUQcpqkM3eUpSCZqFtrWfaVQvufuqX5VCQia7mWGTfBKaYZ4LrEMrCwVFPoHhGZPjxMkn2ZYEKneky91hB76XFfH1qmJJZkLLYi7pgxgEE6Ikiz2Lco//KOJlDAwNIWr1QFb9+ri1rHiRmWZ1aXBMof2IXwSMyRukfkJdKGhwAC9aATQ+oOS9v4ljGOcliUFeyJhQnaNS9lQbOVK2OjzrjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SB99f8xmOG+54VPCUCgHviYYTKtvn7ZbVsT9aWXJWOw=;
 b=pHNYSBbYoi4f8otBYB+eRewBeTGgJRIi+3RelPEKUA+AfpfEVjeF/GOPtNc98wqdvvUqYzYxheHwIv7L/MduPrCOIKWtOaoryZefz6RXXqyYiAghBXJjp26hpPN1F4DMZ/ktul9WMOH24TVMQY0VqKpMGF2Njn8bZluBP7NpHLA=
Received: from DUZPR01CA0291.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::9) by OSKPR02MB11266.eurprd02.prod.outlook.com
 (2603:10a6:e10:9d::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Wed, 24 Sep
 2025 02:03:56 +0000
Received: from DU2PEPF00028D0E.eurprd03.prod.outlook.com
 (2603:10a6:10:4b7:cafe::13) by DUZPR01CA0291.outlook.office365.com
 (2603:10a6:10:4b7::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.21 via Frontend Transport; Wed,
 24 Sep 2025 02:04:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D0E.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9137.12 via Frontend Transport; Wed, 24 Sep 2025 02:03:55 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Wed, 24 Sep
 2025 04:03:55 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 24 Sep 2025 04:03:54 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id E8E62773
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 04:03:54 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 1A3101204A3; Wed, 24 Sep 2025 04:03:54 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] opencv: Backport a patch to rename BlocksCompensator::feed()
Date: Wed, 24 Sep 2025 04:03:51 +0200
Message-ID: <20250924020351.1444491-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0E:EE_|OSKPR02MB11266:EE_
X-MS-Office365-Filtering-Correlation-Id: bfab0450-1e1a-42cb-68a2-08ddfb0e9df4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?AZOQ8YGEpEeOPuhuZpKcbM8ZiSa339balZmROGABrLSZQmXraS3VyCGKWJYZ?=
 =?us-ascii?Q?AS65QdiRWlH+2I9p7gsd914/EKVLVYiJIJAzzz7ehY1xztfMFJ/kWmpULIaH?=
 =?us-ascii?Q?UbN/g+/FN2NX4bpfkfsA3rEczm/2h+euVpLwynqSsRe/fNItuhAteL0WzpHk?=
 =?us-ascii?Q?KEYk1ZudLyXJUNhwzIfswks5yB1+ntlqWbybliDtl5Gk08BI4742AMMiGwmU?=
 =?us-ascii?Q?pUdezCSYsn4cx1FI9HK4TQhD3RhXAhFMv35Gv78t159N6Lt9pHSJc+yeVtkf?=
 =?us-ascii?Q?OReZPbwRboeunNL8jcABCOUtHMmMpY1aXcPEzIo58kjQJnB1c/dTj8Tb0bNi?=
 =?us-ascii?Q?3I1bM2iuYrygtvo0PWfkD+Yz3aBeEtc3qv3/9sSDYN/fIACke2Wa5GkazQ1p?=
 =?us-ascii?Q?WchypZht5wzVLYDW71mKs1xYwVP2uig7QyNpsZ5m0k8r//ceCBGObZEmZuHF?=
 =?us-ascii?Q?YK1xXpcQnbXk2Onk8J8+1HxLwWIcB+dWDRsgM5ZN1JEOKNExP5Uhjjx6V1pU?=
 =?us-ascii?Q?jy+/+aM/UoYfRBsmSWXti+rcaXLLcuFSYTltuf9x91vkxNZKE9h35r16kME1?=
 =?us-ascii?Q?/vloi0gfwmOfIzRB4mj6TCs/WNppkHUwtlDVW2BA89mJaHt90j9MtVcGTfAa?=
 =?us-ascii?Q?vuuCJOMEeiHu3qX6NgQynfNAWkx+zArU82U0n572Fk1p6gZTtjgohiRS85tu?=
 =?us-ascii?Q?cawUHzzxxW5VOmTrZ4bYTX5zuF91pFVFjKc5TefHa11B5AgCfgugDBJMC/U/?=
 =?us-ascii?Q?+/Ts9poMPwOxIhVBZ+7FRyLL6pOiFfbyQx4Dlw+amCzYxG+mQ4ZRkilfIzHN?=
 =?us-ascii?Q?pkNNaxmhYFJaPNSSDdjjw5OcGh/lEhj07V2Ivy+JDjU+M471Xo+4r/pJV4Fn?=
 =?us-ascii?Q?UCh68I9UI7XXHuGunZLnJiwKgnk8RG6mG+ahhu6rjfOzOcIJp/6NfyyZnzd1?=
 =?us-ascii?Q?97a1m44Qr5binvTldOh3H/gekODGjZuQpr73BguWBc0p7NN2ePCDISE/ZfHL?=
 =?us-ascii?Q?RUJ6O5cSI0Zpf4qwJ7ttO3vEKsvzo/UmRizhSrnWYJG+LwEW3K+6fcZqCKq6?=
 =?us-ascii?Q?f2RrJlJIc7APYNHwtU3vUfznsx1jvH5E0DgeLyXVpqg9zEdGZrQIsTn3qSVg?=
 =?us-ascii?Q?AnspLTiw3JsB5me2B95VbBK28lzvdPPPfUY5SYWCAPIsZQWOIjOdpuY6G7Wz?=
 =?us-ascii?Q?flPbhBwvBs/esPIgZgvs+dCaJVKFEWALjpW/ELGhNKcWdyc/F14kDgFyk0x0?=
 =?us-ascii?Q?0yCP4vbzFe8yYlIX7gZoJVc18eeHAyy24B+JNwRYW/avWcQyOW3EwaFRWy1/?=
 =?us-ascii?Q?IqhLWqa8HQpc336yEyBOY+4uwDaTf4F2vIsTw+RBbTbR41CXvtF0l9BRnkI8?=
 =?us-ascii?Q?at3eE3q+XdnMjzmyySQXEq5zu3iXpM4Q7n3KncwPOFpXrc9Hbea+Q1pOGI/g?=
 =?us-ascii?Q?VvwtrFJCaXRrK+5/Z1YHdbEIsXV5+RjAel+slLz4HEFrBPXHgj8ImRgs2Tdh?=
 =?us-ascii?Q?R1wjT/fclzeyrFkLjeBnK17v0n7ocxMOYeL7?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 02:03:55.4117
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfab0450-1e1a-42cb-68a2-08ddfb0e9df4
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D0E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR02MB11266
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 02:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119740

This avoids a clash with the base class' pure virtual method with the
same name.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 ...d-BlocksCompensator-feed-method-to-e.patch | 55 +++++++++++++++++++
 .../recipes-support/opencv/opencv_4.12.0.bb   |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/0001-Renamed-temp=
lated-BlocksCompensator-feed-method-to-e.patch

diff --git a/meta-oe/recipes-support/opencv/opencv/0001-Renamed-templated-B=
locksCompensator-feed-method-to-e.patch b/meta-oe/recipes-support/opencv/op=
encv/0001-Renamed-templated-BlocksCompensator-feed-method-to-e.patch
new file mode 100644
index 0000000000..ec2bb2d100
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/0001-Renamed-templated-BlocksCo=
mpensator-feed-method-to-e.patch
@@ -0,0 +1,55 @@
+From b28d9bef1d96d10e9a47d55a63d9f1443e6e3d2b Mon Sep 17 00:00:00 2001
+From: Alexander Smorkalov <alexander.smorkalov@xperience.ai>
+Date: Mon, 8 Sep 2025 14:52:58 +0300
+Subject: [PATCH] Renamed templated BlocksCompensator::feed method to exclu=
de
+ claches with base class pure virtual method.
+
+Upstream-Status: Backport [https://github.com/opencv/opencv/commit/b28d9be=
f1d96d10e9a47d55a63d9f1443e6e3d2b]
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+---
+ .../opencv2/stitching/detail/exposure_compensate.hpp        | 2 +-
+ modules/stitching/src/exposure_compensate.cpp               | 6 +++---
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/modules/stitching/include/opencv2/stitching/detail/exposure_c=
ompensate.hpp b/modules/stitching/include/opencv2/stitching/detail/exposure=
_compensate.hpp
+index dea76c957b..2954f32ca3 100644
+--- a/modules/stitching/include/opencv2/stitching/detail/exposure_compensa=
te.hpp
++++ b/modules/stitching/include/opencv2/stitching/detail/exposure_compensa=
te.hpp
+@@ -187,7 +187,7 @@ public:
+=20
+ protected:
+     template<class Compensator>
+-    void feed(const std::vector<Point> &corners, const std::vector<UMat> =
&images,
++    void feedWithStrategy(const std::vector<Point> &corners, const std::v=
ector<UMat> &images,
+               const std::vector<std::pair<UMat,uchar> > &masks);
+=20
+ private:
+diff --git a/modules/stitching/src/exposure_compensate.cpp b/modules/stitc=
hing/src/exposure_compensate.cpp
+index 59542d95ba..f7c33fa4ef 100644
+--- a/modules/stitching/src/exposure_compensate.cpp
++++ b/modules/stitching/src/exposure_compensate.cpp
+@@ -460,7 +460,7 @@ void ChannelsCompensator::setMatGains(std::vector<Mat>=
& umv)
+=20
+=20
+ template<class Compensator>
+-void BlocksCompensator::feed(const std::vector<Point> &corners, const std=
::vector<UMat> &images,
++void BlocksCompensator::feedWithStrategy(const std::vector<Point> &corner=
s, const std::vector<UMat> &images,
+                              const std::vector<std::pair<UMat,uchar> > &m=
asks)
+ {
+     CV_Assert(corners.size() =3D=3D images.size() && images.size() =3D=3D=
 masks.size());
+@@ -605,13 +605,13 @@ void BlocksCompensator::setMatGains(std::vector<Mat>=
& umv)
+ void BlocksGainCompensator::feed(const std::vector<Point> &corners, const=
 std::vector<UMat> &images,
+                                  const std::vector<std::pair<UMat,uchar> =
> &masks)
+ {
+-    BlocksCompensator::feed<GainCompensator>(corners, images, masks);
++    BlocksCompensator::feedWithStrategy<GainCompensator>(corners, images,=
 masks);
+ }
+=20
+ void BlocksChannelsCompensator::feed(const std::vector<Point> &corners, c=
onst std::vector<UMat> &images,
+                                      const std::vector<std::pair<UMat,uch=
ar> > &masks)
+ {
+-    BlocksCompensator::feed<ChannelsCompensator>(corners, images, masks);
++    BlocksCompensator::feedWithStrategy<ChannelsCompensator>(corners, ima=
ges, masks);
+ }
+=20
+=20
diff --git a/meta-oe/recipes-support/opencv/opencv_4.12.0.bb b/meta-oe/reci=
pes-support/opencv/opencv_4.12.0.bb
index c9482741e7..d1ab87b06f 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
@@ -34,6 +34,7 @@ SRC_URI =3D "git://github.com/opencv/opencv.git;name=3Dop=
encv;branch=3D4.x;protocol=3Dht
            file://0001-Make-ts-module-external.patch \
            file://0008-Do-not-embed-build-directory-in-binaries.patch \
            file://27691.patch \
+	   file://0001-Renamed-templated-BlocksCompensator-feed-method-to-e.patch=
 \
            "
 SRC_URI:append:riscv64 =3D " file://0001-Use-Os-to-compile-tinyxml2.cpp.pa=
tch;patchdir=3Dcontrib"
=20

