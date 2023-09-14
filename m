Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFB2CCA0ECD
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 04:00:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4607.1694664051363333475
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Sep 2023 21:00:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=RDrZwdY9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7621361dbf=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38E3Fdog005382
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Sep 2023 04:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=l4PbTp7sXFR3sCU02N
	KLwghoxyKzQDV8Y8EYpnqY7uE=; b=RDrZwdY9OMmgrRoPrwZxwQ4zWqVY9GA5LA
	FZCpXG/9eV4aUGLV6IoHM5V9n1gZ95VhgD5QOv05/lU6ZWSpt4W7puosRHAnyNZn
	qjTSaK6f7lxgZGuz77e0h7iAvuEVEUl4/3F6UOyxlpFDQITWgMq7kRkj+4S43+LN
	idTTsXIzl6iAcba0VSS9Sn/Rer5FG6HjduzA4LWrD2PtahvzYUpqEKymu5U0gSUG
	PFL+3FWewxp0tPuMse9BOG+1uDldx/PXKkc/8/OyNAZw0Jw22r5gt+3nBcugtr9M
	ZhcoyS3T2JAZVlb/BWJhMOMOzSzjhkUncboz5YqFSyFlMBYLvL/g==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t2y8msctb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Sep 2023 04:00:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ye8710kndEt9Yr7WhyCgBIEFgqv1LLdHKkI/F7vGpmOvbDqM5vAbCnkNbNLpBgmM81ML2c2AuXTM4HIE3cBTNZiKF2Qc5hoUyols2OHfYvI9Nf8pODnTpuUHRF2wMUVNLiMIVtvSjsmViRYjNJPo/9Xm95mQCeh45Ckyj8TVFJrcBiOIYOtulV2fnU5Z+n6X3p0u1/rwR+ZeQs+dDBZeGWaCJOaeF5QrxD+kii9BWMJMhmuhQkummeNH4J2DKJlKWRUU7XC2WYfJ2NsmkIEfWPea2KfFb/WddU7CR5mzVxD0a+8CEGZK430k4+gIsjibuQ3K4JD6GK22oq3hZZwSJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l4PbTp7sXFR3sCU02NKLwghoxyKzQDV8Y8EYpnqY7uE=;
 b=IOqpo+rrOgRxgCDwdwmpiemdF1b0KwyWcW3xhtNMHQTTtt+tfHfOx0VjtFuuAsWYMfe2urzk5NWaYxXYsFPmRJQE6Sen9SOTsyhFrOscgz8/lXp5LxB9npfRRFYj685MhlPHciLGKZn0jWSwTGSnHM7aJiofS7OQODnMJ+Ils0n2Hy2d1yeWwD7FgNH1qNGP9rFmc6qb4sU8/8xw4+tx8ZToVeEcgHZFyaiRJNyNbcHaozeJ10AtCzSxSGeEbd45OIi9iKJ0R2i313vJ2ard/01L6dJsHePsNPjuvGo5wfp1+nQxyscv2u6NC+wdrr2Ad5fdJKi3fucVJpj+bTIpDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by BN9PR11MB5436.namprd11.prod.outlook.com (2603:10b6:408:101::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Thu, 14 Sep
 2023 04:00:48 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::da88:58a3:bc6b:2e3d]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::da88:58a3:bc6b:2e3d%6]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 04:00:48 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][mickledore][PATCH 1/2] grpc: fix CVE-2023-32732
Date: Thu, 14 Sep 2023 12:00:25 +0800
Message-Id: <20230914040026.539698-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0012.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::24)
 To CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|BN9PR11MB5436:EE_
X-MS-Office365-Filtering-Correlation-Id: 43728113-d5cd-401a-428b-08dbb4d72dc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5sBoPHZ8sOo1uMml9R81NFYj5FK4iaP3Ye7+fYTDW3XdIGB41yxYPlU7W80Mg1f35u2dckMj2qJzkpaE03aEwHBSFF9wMJk8ncJnkNq9NMFsvKZhBO6iv3PBVfImI6hCLjlOuYGwF09M/Tme62nJMrb2gRz/qXQKNBaIwNv4+CSG4HLq7IugtcUzWckVUa/NhJ3t/xGyn/sI16XhsWM1uKiN2mimMRleQpgboo7ZhrQniiO0Yg/0/xuEzVQ7z4LUBznUVa7JscpyK2JcVeIjJGzLNBhEVxWq6TbVw+XupvmAiEOSYWqwHbiRJvVWZtvI2cnxX+aWC7koOg2+rpoFm5tckuPSMaYrAY0khY9jBL1tlhVKpqALD8zOZeidmO5b1o6dBSUMAnK5O8QBfJQgCo4nim7yb5bZkKxQkIr6d6CHIjh/AP3YJOpdI1AKEZnst+ptpXAO/4SXwvnEJfp2O4lJ4RUlKOp78D7E7xFJnAxW6eLcWtf55RNLF7WRr4HkrKJ8sFjJmsCxXsg6f7EIA+jIsXjCYWKjcagL4pUrCOH4+UZF4YvDCg3xIxCriYSGf/Z+kjIvaF5MTfgLuLNnqXbe8T0KaWxNb+n05gQoZ60=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(366004)(39850400004)(346002)(451199024)(186009)(1800799009)(8676002)(86362001)(8936002)(5660300002)(2906002)(38100700002)(83380400001)(38350700002)(52116002)(6486002)(6506007)(6512007)(9686003)(6666004)(26005)(6916009)(36756003)(316002)(66946007)(2616005)(1076003)(66556008)(66476007)(41300700001)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tRIqWEj81gkKLz8r1+KaQsQ17dSudeHPpmw3qg6T11CKFy/2Quu2rfRlyoXi?=
 =?us-ascii?Q?c+fP8RyhpIHF003Yy0HMOGdubLgrk0kHtR1F9SqQ+uPbWdN/rtKT+Y5gb1F5?=
 =?us-ascii?Q?q2Y7oU+a5RweyQiadCMFfxTDn4VIEiplBhkoijGHb9pgQXDUM6QKWwsdWiqF?=
 =?us-ascii?Q?hvUB+GwLREXceRiQduGHclc6+6QZm3CxmM3H7S6rFA9tbKLwn+N6IKzz4F+8?=
 =?us-ascii?Q?PBjfGWf0VeOCg0gecIy++pXCZwUkp+flQOw07RhSd/FmQZCPPT8p1DPiGse5?=
 =?us-ascii?Q?wFB9ahjE8GDM9ZcxagNKY3+cqE+aKCCttRTe2lEMRdQucwE8Ah+AxIw1szEx?=
 =?us-ascii?Q?uPsp7z/WeTWSak7bGcVfc4pBoOGy0Czoh+h8dYjvuYLsCEqfjHEiSCgMBL3a?=
 =?us-ascii?Q?ZSHtop5xvlUZHboB/+znKShBnij4ugOjkcCsN1fXRASZDyIqX4bmqD6OvChc?=
 =?us-ascii?Q?9Gj05V1NXFZfvdxwhYvUNbJBW/2IzwXxTj7KjIh1ea593ZbK6eVb4CqTRvC5?=
 =?us-ascii?Q?r8mVLV6EnpTiB1Wo5bjMcjTr0UQvvoh/g5F8zrzIIiCtDYUc9NWlaz9QtzXx?=
 =?us-ascii?Q?3ov6McZGqdudGzdOHEqs2n12Oht0CpC+7fx4DA2zdAFCEHWe7jhnF6PeZDmO?=
 =?us-ascii?Q?UlmyAOTnp2E/LFTnxxUDtnRTusOpqEl46PYNaNwlqb0vQrioa9SncPuzjihT?=
 =?us-ascii?Q?T6mnTm9S31ZynneuwRdEB/uSGO8xYT/cJQq+MUpapx0zj4OTie6VEyMdaL+j?=
 =?us-ascii?Q?Dlp5Q3bSYAHIY953ASIh6L4Y+Ka5OSMYrxEEDJZOr59b2PdXpRWsiPdAj1gk?=
 =?us-ascii?Q?bhgq6hVQzRC6jR872OZJOqMp0lvgwktDYYJEOi0BggdbqevkLbdqDmnCtPX1?=
 =?us-ascii?Q?frLBVUiHOD7XfHLj0GdLmC9i/i5+t2AQ2s2x/WiCzQCgLt9uyDSEupdxZEiC?=
 =?us-ascii?Q?mgNqSSmf2IijClhSd7v94kNyCqifznt3wSwsAvUdPXAuFj5mg2GtaGX37+Zq?=
 =?us-ascii?Q?/mMdZZZHV8FIqiiFR1xcKkNU4faYooHOGS2L+xVoH8d2y60bqPKrD2UbEUAd?=
 =?us-ascii?Q?X1lwh3Z0vZ6q0Tt6GuOj8pwCo/gqh8DlEb5PIAHGZxVbR2CO3x4vzcLdqJtX?=
 =?us-ascii?Q?b+PV5aN6T9TUNy9+s3+RjeLCTccky1tln4drNHO3HtbL2yoZz2oni9VvbiLv?=
 =?us-ascii?Q?9KVP2Wf2b2yP8jiMKy0f+RFaLy/IeBGk9VDo7tzgFmAaKd3RqErX2uHSVT8l?=
 =?us-ascii?Q?rt9KUMdcIcolq0Uq2F6Fw6WhbJpi2gYeD8B0Ii7M70zk0480S0qLhPk/176D?=
 =?us-ascii?Q?2D6EyItSF95Z12UblbLA5m++FCcfj4wSoax78uKZovu2RLHY2TUscnFxJ0VF?=
 =?us-ascii?Q?vu1DZfB+CkOdg29E13/Vr+mTBmdVOz6W6v4uF53xOdkvI6A0Otwxm2AAybwN?=
 =?us-ascii?Q?W3rSQIzAPswy79vRfoeGpWUZKXEZftB1DoQDzhCELxAvhxKMnCKuCJ1XwdYD?=
 =?us-ascii?Q?x2c0dg6LAJwKGQ71ywDVV5P7XmOwSHuuQ++uBZbpYFHJlyh5BbDaczAl47wR?=
 =?us-ascii?Q?yOOo0GW1Hh/NmfXHKeKadMbA4H+6KnKbq2fxfz0o?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43728113-d5cd-401a-428b-08dbb4d72dc9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 04:00:48.4227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VqgP14DMAYntHL9uAFsgqeS+l0hZ1gq2A6gVRjP9aKxi/segohOxkUmsvbRzg5PWmhNWDvfbzmo5szIm1FtEAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5436
X-Proofpoint-GUID: gmQ33k3K2jqX78gkbpkh9qjr7eZxR8pv
X-Proofpoint-ORIG-GUID: gmQ33k3K2jqX78gkbpkh9qjr7eZxR8pv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-14_01,2023-09-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309140033
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Sep 2023 04:00:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104864

From: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../grpc/grpc/0001-fix-CVE-2023-32732.patch   | 81 +++++++++++++++++++
 meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb  |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-fix-CVE-2023-32732.patch

diff --git a/meta-oe/recipes-devtools/grpc/grpc/0001-fix-CVE-2023-32732.patch b/meta-oe/recipes-devtools/grpc/grpc/0001-fix-CVE-2023-32732.patch
new file mode 100644
index 0000000000..ab46897b12
--- /dev/null
+++ b/meta-oe/recipes-devtools/grpc/grpc/0001-fix-CVE-2023-32732.patch
@@ -0,0 +1,81 @@
+From d39489045b5aa73e27713e3cbacb8832c1140ec8 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Wed, 9 Aug 2023 13:33:45 +0800
+Subject: [PATCH] fix CVE-2023-32732
+
+CVE: CVE-2023-32732
+
+Upstream-Status: Backport [https://github.com/grpc/grpc/pull/32309/commits/6a7850ef4f042ac26559854266dddc79bfbc75b2]
+The original patch is adjusted to fit the current 1.50.1 version.
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ .../ext/transport/chttp2/transport/hpack_parser.cc     | 10 +++++++---
+ src/core/ext/transport/chttp2/transport/internal.h     |  2 --
+ src/core/ext/transport/chttp2/transport/parsing.cc     |  6 ++----
+ 3 files changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/src/core/ext/transport/chttp2/transport/hpack_parser.cc b/src/core/ext/transport/chttp2/transport/hpack_parser.cc
+index f2e49022dc3..cd459d15238 100644
+--- a/src/core/ext/transport/chttp2/transport/hpack_parser.cc
++++ b/src/core/ext/transport/chttp2/transport/hpack_parser.cc
+@@ -1211,12 +1211,16 @@ class HPackParser::Parser {
+             "). GRPC_ARG_MAX_METADATA_SIZE can be set to increase this limit.",
+             *frame_length_, metadata_size_limit_);
+     if (metadata_buffer_ != nullptr) metadata_buffer_->Clear();
++    // StreamId is used as a signal to skip this stream but keep the connection
++    // alive
+     return input_->MaybeSetErrorAndReturn(
+         [] {
+           return grpc_error_set_int(
+-              GRPC_ERROR_CREATE_FROM_STATIC_STRING(
+-                  "received initial metadata size exceeds limit"),
+-              GRPC_ERROR_INT_GRPC_STATUS, GRPC_STATUS_RESOURCE_EXHAUSTED);
++	      grpc_error_set_int(
++                  GRPC_ERROR_CREATE_FROM_STATIC_STRING(
++                      "received initial metadata size exceeds limit"),
++                  GRPC_ERROR_INT_GRPC_STATUS, GRPC_STATUS_RESOURCE_EXHAUSTED),
++	      GRPC_ERROR_INT_STREAM_ID, 0);
+         },
+         false);
+   }
+diff --git a/src/core/ext/transport/chttp2/transport/internal.h b/src/core/ext/transport/chttp2/transport/internal.h
+index 4a2f4261d83..f8b544d9583 100644
+--- a/src/core/ext/transport/chttp2/transport/internal.h
++++ b/src/core/ext/transport/chttp2/transport/internal.h
+@@ -542,8 +542,6 @@ struct grpc_chttp2_stream {
+ 
+   grpc_core::Timestamp deadline = grpc_core::Timestamp::InfFuture();
+ 
+-  /** saw some stream level error */
+-  grpc_error_handle forced_close_error = GRPC_ERROR_NONE;
+   /** how many header frames have we received? */
+   uint8_t header_frames_received = 0;
+   /** number of bytes received - reset at end of parse thread execution */
+diff --git a/src/core/ext/transport/chttp2/transport/parsing.cc b/src/core/ext/transport/chttp2/transport/parsing.cc
+index 980f13543f6..afe6da190b6 100644
+--- a/src/core/ext/transport/chttp2/transport/parsing.cc
++++ b/src/core/ext/transport/chttp2/transport/parsing.cc
+@@ -22,6 +22,7 @@
+ #include <string.h>
+ 
+ #include <string>
++#include <utility>
+ 
+ #include "absl/base/attributes.h"
+ #include "absl/status/status.h"
+@@ -719,10 +720,7 @@ static grpc_error_handle parse_frame_slice(grpc_chttp2_transport* t,
+     }
+     grpc_chttp2_parsing_become_skip_parser(t);
+     if (s) {
+-      s->forced_close_error = err;
+-      grpc_chttp2_add_rst_stream_to_next_write(t, t->incoming_stream_id,
+-                                               GRPC_HTTP2_PROTOCOL_ERROR,
+-                                               &s->stats.outgoing);
++      grpc_chttp2_cancel_stream(t, s, std::exchange(err, absl::OkStatus()));
+     } else {
+       GRPC_ERROR_UNREF(err);
+     }
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb b/meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb
index 7b8a25c277..b3956ce40c 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb
@@ -26,6 +26,7 @@ SRC_URI = "gitsm://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BR
            file://0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch \
            file://0001-cmake-add-separate-export-for-plugin-targets.patch \
            file://0001-cmake-Link-with-libatomic-on-rv32-rv64.patch \
+           file://0001-fix-CVE-2023-32732.patch \
            "
 # Fixes build with older compilers 4.8 especially on ubuntu 14.04
 CXXFLAGS:append:class-native = " -Wl,--no-as-needed"
-- 
2.34.1


