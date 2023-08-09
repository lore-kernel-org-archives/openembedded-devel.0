Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E28C5EB64DD
	for <webhook@archiver.kernel.org>; Wed,  9 Aug 2023 05:49:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.82259.1691560172672154501
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Aug 2023 22:49:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=B6y9ltS2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7585eec889=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37959sV2008095
	for <openembedded-devel@lists.openembedded.org>; Wed, 9 Aug 2023 05:49:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=53dDwTaSsTg8NNy6S+
	CC87S8WD+dxxSfls13ZeMsqU4=; b=B6y9ltS2R4xze5TeYwFEdqBcAGPGD81p5N
	KC/3nZan3hiwXRkV5GuPN33lcOnaSveUPhN+bHl8acdSdAA5JRvyVLnqNVCT3gm5
	3q9r6MuhUdzEMLSSPqXN8xhnijLy/QQHrZo9xAUQ1WVEB/TodsxijhiXegV0gM2h
	+SaxBze3EZnUpprO21r2t0jnRrWjsZv73DmIKDd5obNdPeEHMLqP9mJDraHAJk0W
	RHdsJ8JUxKknBfQKDWvRXxsMgKKM2mm/7od2uzYjNjrn+ISJ0AeQTNmrd1y7IMYg
	waxl4EywUFtX9VEQaZjNPF6ipz231If5L9s36+TSEEEZhDhQ7ZLA==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s9bmx3efe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 09 Aug 2023 05:49:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CErLNv7utVzlUEE4L8zEEpioSLp+6veJC8OcvbKIfLVTmXsHVlExX64mdOHFGCSmEWWyYiIoU3XAArNo5b5N7WMWbwyQqhrPI32Hj7CQ6RmBnp/3+kFihv3Q4DvSh/THwZjj+Y961oVcFpvq5eRmX6dkqWNzYcOKtIDm9iBp1zO0wzhAq1mEH7drRo9VYkVSZh4JWSVYYNT5HoHGREn3ewdHVBolmvCX9OhGnsxz3Mn+2lVm65uxCMZN59OtnMAW1MLfIZ55ci4DX/fomavPQH1Benu04W3CbDaN1xGoEKgRtytfJovOVW1ImIQRfF30J90ckHMSCWs+QF3+R2e56w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=53dDwTaSsTg8NNy6S+CC87S8WD+dxxSfls13ZeMsqU4=;
 b=Ck0BEs0O+Hirt02wAkPirNuysQIWSsnygz70ZJMDDBPPt62hdAHeSqpvlnkjq5gBplSk1UBfaGGsK30oUc8HFLFzg4yH7q+t/HvPRZg/Ze4xfqz8DF1L4sailuQs7UIiuU/F62FjO8yZYsfC68lG4b4FUA9UC0A545Kj58/5vMop4Dt+VFMev+mBeE8ZPi3XCKhUwhStJy+5sFzEaqWuN7CdQUTY/pzvFBGjW0/CoTodljaewDq9iZHpb0WUOnWS0OgGY4N6oDr5GZtbXN4iAKHv604C/seS+0bS2ehS2Vj9NhRR0v600jEblWozbhyR64QrB3vo2j9ghzkJLJFfag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA2PR11MB4889.namprd11.prod.outlook.com (2603:10b6:806:110::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Wed, 9 Aug
 2023 05:49:28 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::86dd:2ee6:ac66:812d]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::86dd:2ee6:ac66:812d%4]) with mapi id 15.20.6652.028; Wed, 9 Aug 2023
 05:49:27 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] grpc: fix CVE-2023-32732
Date: Wed,  9 Aug 2023 13:49:08 +0800
Message-Id: <20230809054908.3820887-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0194.apcprd04.prod.outlook.com
 (2603:1096:4:14::32) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA2PR11MB4889:EE_
X-MS-Office365-Filtering-Correlation-Id: a5785c62-59c6-4b9e-5730-08db989c6493
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8/ZIuyabITz9ydaJlJXPx7bVw+DVwzlC5t6oZjJLK5O4L/So8qBodKRxvjVFUcWPKMeCcsdtRDCh7NpNKiEn4N1FoOBXUxuuMyrpJNrq7J+Xaotww3bV46nOMamb2eVOSQsIiyr43zWWPHwhsaxgNK4tHrk5N7VbkLN4DjqycFXelUB9C1x0xOLJvCPVtJANgVPV2eDkY7NR8I+w1TCGs16XDz/PqmCrGJN6ao7/VWfX8A30hjEDfbVKGMp9PheHB30V1V4ePP/BPezLuZ4fhmbCFocgG8b/F5Au1DOibnZr7GbamhtxZynsD7ZdRbwHCTymuc0KVn95xSm6I6hB95vfrAwxtQAWf029+CLoRzX3/EPC7PtZ8DlJ+IoM/CBisD8Ha5oAbm7PRVkKq9oMOZsuUkZclQk+jvBWs8QT3A0uTUenNX9lnDLByKpbkQLbioTztmQXNpw7xtOcv0KUMqIJDmCVBf0Wqb5AHZmRWOo/e+IAub3HiHdIv34MxoX+DThbRq5BvWcXYb9j2Z+dIEb81YK9dRsFGyG1vdEmpP8tnjYOrmVCRRHhMjqmcaMJaiWpjy5/Vw4C5DucC/10IZH2nsPeuRJbUUpZflwYUJU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(366004)(136003)(39850400004)(396003)(451199021)(186006)(1800799006)(316002)(83380400001)(2616005)(2906002)(36756003)(6666004)(26005)(66476007)(38100700002)(38350700002)(6486002)(52116002)(5660300002)(41300700001)(66946007)(6916009)(6506007)(1076003)(66556008)(8936002)(478600001)(86362001)(9686003)(6512007)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JiSxXVpazQgC1v0J0IdmbymHSeN9OENrje50YXkwnT6oDOe5kjar+fDWsj2L?=
 =?us-ascii?Q?anN/1RhLX8Hkeg1K119zYAvsH11ZdS4hHZNJ/bez/WX0V0zsyzV/Veu/WnJZ?=
 =?us-ascii?Q?gwauMWOZxaMA2xkn4Kf5fR4aKz5Ws1I5CCnTZyjhvC7mgL8y+X5wKurzJ0MP?=
 =?us-ascii?Q?dLQMGU7TOb842HUxjArjhPdFlsv0qI9kfxIxa+nJPt94s/BHM/eilhlc3TtZ?=
 =?us-ascii?Q?c+KjVUgAUwFdqVW/fB+M8JF72ZD+pgjOthDKeoHvFWuhb8wGKNPjPH8S5Afc?=
 =?us-ascii?Q?0jLs5mi3iYJgzzmWuFhAvlCjBX455//Hn9V7l0WuOBX4ge0Vijh45lZ7+zL7?=
 =?us-ascii?Q?yR4V99gjwqSPSNSkmzJJY8dg0GCOxq3GfjIm/cmsRfPCN/+T1QpTTNbJ7pnR?=
 =?us-ascii?Q?Cq2FAROVyHkTB4sHaVA1RTzL+9E4De6bRf38357KK5srXmjS93H9W9TSCcOO?=
 =?us-ascii?Q?8443gteqkSbeVn73bu097mKakVz+FPubjBV0cOEVVa1RFl7xMNjNiPC8Q8sa?=
 =?us-ascii?Q?7B/KeWUhTTtes9xgE6Pc1/BNpR6w4X/BWbYV1m2M3JIMb8PWpWXu9Fu7swQ/?=
 =?us-ascii?Q?egC3+pPRrqu5pt7dPWyuT0MPpkC/pqxnz540jd+/Rs/PAAJ5zfBYIcCbi10g?=
 =?us-ascii?Q?T1uuicdiiN42lRdszhKqN/CjE8FjTd1plaNo3SQuVBBcvDDeIdpXozity3hP?=
 =?us-ascii?Q?4kU4FVGPzXkbXDhtBL/s7u6yj3lSwUjKN+uuCuLGMkGJAgdPN221PDYi/ttA?=
 =?us-ascii?Q?y5RJvwi5bIc4mblOZLW9rZYO0lOGN6OG071soMNoJY2VRm0Oqh8IGc8kaTbt?=
 =?us-ascii?Q?SOM1/mw42aooZE1tU5vnvcLyWEchTq2SzIooY+GD1g4ivKx+2IMmL6NpW+X8?=
 =?us-ascii?Q?NmkV1h56MRNu2JkC5unT/kuLsCmK9FkfnTodH2c3G5twzV8LCfmpLX7o6zPN?=
 =?us-ascii?Q?x+Hx771RAfkYtlRWAK7eqDenJCmoLQZpRNyb8VX2ZbQKCNbHw5f8tB6BnnA3?=
 =?us-ascii?Q?VnFd0DEzgpqbkZymPh+SJuWWvHFyhIMjJ4eM612hF8uxwfWZR1UyCTpRLTt9?=
 =?us-ascii?Q?daSKTdW7WepPLPvcL1r0bmBtLWKy8/lLQgx1AZ/AclBOBohiX/LCdp06W8r9?=
 =?us-ascii?Q?z+dKJakFojsuyRRWCMeOmuI0wLUV0KVv8S7tbSeLvQfQdgIejluY6BCCwtA7?=
 =?us-ascii?Q?N6I3lcwYGQnHxHgF3eyWcmpWNGJjs9y8SJjHVn6qM3u7NXDvHikDtxIpKWH2?=
 =?us-ascii?Q?rATqzwpBWiKKvqQY2+2g1Gn49yQCAGEXhlJCaMdCxLQQmAbvBMS9lffK1dkp?=
 =?us-ascii?Q?BrDSOPdj0kKCZfx5XXKWK9QCGvhhPGtu6rvYnbBt4Ys/I6ce/p5ce4vg07tQ?=
 =?us-ascii?Q?PWSnxjCCw5jd2FG0bFsRqgjCaB9tjCktRhiyK6eR91ZpLu6QZ9yV8jrHIk7f?=
 =?us-ascii?Q?iFDurqL+bQ672L0eknH7UcsT8JoHP9OyBF7KxGe5iaFlkVL9d9B6uOFrEg5l?=
 =?us-ascii?Q?+9cA1MKMl3zj3O9g4o/n1Oyo5kSyy0GLTkUmRYWu1LQ4sWaFu9de/ILwFvE/?=
 =?us-ascii?Q?KMoH8CcY2ubugdrqsiooUyG3hmVvVlIlz+F7jaUM?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5785c62-59c6-4b9e-5730-08db989c6493
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 05:49:27.5722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZBP75YOIOVssv31SfrAj1gqsCe29fLkz0ouElYKKS9qnazZLi6fA/UMm0QP2lEY/bb1lmKRivhqBwnpNfiH1Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4889
X-Proofpoint-ORIG-GUID: -MUrRQYg1y5d2livKl9TUiC3YOg51se0
X-Proofpoint-GUID: -MUrRQYg1y5d2livKl9TUiC3YOg51se0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-09_03,2023-08-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 bulkscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308090052
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Aug 2023 05:49:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104310

From: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../grpc/grpc/0001-fix-CVE-2023-32732.patch   | 81 +++++++++++++++++++
 meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb  |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-fix-CVE-2023-32732.patch

diff --git a/meta-oe/recipes-devtools/grpc/grpc/0001-fix-CVE-2023-32732.patch b/meta-oe/recipes-devtools/grpc/grpc/0001-fix-CVE-2023-32732.patch
new file mode 100644
index 000000000..ab46897b1
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
index 958992e1e..45bfcb857 100644
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


