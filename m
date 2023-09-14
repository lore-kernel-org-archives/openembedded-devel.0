Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB943CA0EF3
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 04:00:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4549.1694664052990620717
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Sep 2023 21:00:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=EM1gl9nb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7621361dbf=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38E3nKoR029995
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 Sep 2023 21:00:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=2f2fC6Z7TqfqyOOSCSdkHArcsShLDL1w53laeaCbmiE=; b=
	EM1gl9nbRc6A8Bm1m6spewM32VvIJz1kxV7htJ0DooQI/1VAyNQePEBzUciU3YOw
	3a8omI92odhGtQv1ERjHaQk7pyRDdVN8Vb7r2l0B8V1mgUQy2Q1L9jECJd5blzPa
	TjTUcc2F/wJ2q2wgAULWS9PPU+VSwRSgJg8avgRBWHHFXpjJGIetaebBAZQyxTol
	Qk69O5+6WkzbNWZ8J9d6tDFvG0ImvVZVqd9H8VLAM8yf0l+qY1lWSg6NPYnIV95E
	/HzrNq2XmP615uySbIZsBUbzfG0kaIAXsCqmzG8CcJ0WNtM0FBQOa/vyVAfnn4pX
	RiscoBADopZd8Gd+2dAOaA==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t2y829cdx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 Sep 2023 21:00:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RHxyutvUwLgLhCkRdK22okACxjTEYAFdMgAu80jUpSu3TUyoWVoLp05EmyyGxA8M1EYQGZNEgayRM4thKXXiSmGkWdKUYXKhMEoMWGkR/2M01bev61MwoZnoiqKUBUbmSj5elHGJNwAQOIhG2+PL68jeEP5Ey45ux3Lw6eUZiid+enZnkCnKbdq7kDDEsF7Xi3qFSI4D0HBcRIOyJ2xJg9r1SVEs1/+v1LDyEQbI7Bmvd+yj2WpnT7IDzUMRXboHPPufswsIZs4SLx6BDlnYLZmt0gTLW00yMis7w6QI/sRiTUbDEU+hvqtCnIJT6yCl1+UZc47JZrptUlfWY/H7Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2f2fC6Z7TqfqyOOSCSdkHArcsShLDL1w53laeaCbmiE=;
 b=kiZdAh9DHqBvnxrf49p1HlmzrpyhrDa0eBl/nyTOqktJ55BTlQJrZvlaYQlwWTbafIAT9EiJyqbMwOnbhac61Wyf9bctXhZTi8veiZ/SW9S4bJF80YkQ4pefCwIb3u/wCLehuYmRygLtVtXX9/SkT3THe+jmtU3A2et5Y4mIgZgbkmWxbKjCUYv1+2NJcSEEqiQ2qRmbsz8CvVnDL+j/AEOXqXQsNDvNC9KkpowVXh4bmWwVrd8F0xhEJVA/7hHJdHI3t4ircQRLYwmCArbOhNfnrPglO8TOsgVaeWi8kGlCX8Zv1zdQxmvFPBxDbU3IqsOociXhmZ0NP7r9cT3zOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by BN9PR11MB5436.namprd11.prod.outlook.com (2603:10b6:408:101::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Thu, 14 Sep
 2023 04:00:49 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::da88:58a3:bc6b:2e3d]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::da88:58a3:bc6b:2e3d%6]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 04:00:49 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][mickledore][PATCH 2/2] grpc: fix CVE-2023-33953
Date: Thu, 14 Sep 2023 12:00:26 +0800
Message-Id: <20230914040026.539698-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230914040026.539698-1-Qi.Chen@windriver.com>
References: <20230914040026.539698-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0012.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::24)
 To CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|BN9PR11MB5436:EE_
X-MS-Office365-Filtering-Correlation-Id: 83167425-5a91-44e9-2efe-08dbb4d72e83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	inhVxuqxFQVCh17BGuvx/zA168m8ENXYmh3Xqu5vQdQevdR4yQqVePi0bMEWTfCmJXciNNWRc60V8V2cn2lzrVgxWguIhVnpZY938veqg1/1PnrWdXBR+QwZRv/E+zNbbhywGjuHQseah2QwnpZqff55gsH2zPDJqaV+9oKadyOpVsszGFHWKPuGvXZSbTAtW6y/exVtrVu4ZhY3KnTzDwstBnEb4/ay4/EMMUnkrllgg/KkEwhX99x97eIseIzOQHkbmd0VqgJfnO+B/rjaSOlFlPEocOejXRhEa8CzqpePfNrzzbA9uh98zS+L+G0xFPRT9QBihpED7uTkcC7SvAbAWeVuLFMKagMPelZTSxP920MOZcm8DxP+h2vVfTvB8ixw+Gsd+NnqJxfaeRB+mzE0/OwEYZ+rX0yrFIq54MthzWqb8AblyfGS593KnfQ8H5z+seSDbNtOUcoYI8nUks+EZFNev69IPAeA7kqH4dApztBbr2j5pa9nasFGBiNE39ZiYmmID4bPE0zq7/TlUGm5tboCLCq1THmDGaJILaGCdHwG4XtX6qgbjurCgISsMJABtm5rCMXAgbNK5OeCvEAKhZ0eEFe7tcpMmi1HUjQlvPbCbjrqbsk/DfUeMS4g
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(366004)(39850400004)(346002)(451199024)(186009)(1800799009)(8676002)(86362001)(8936002)(5660300002)(30864003)(2906002)(38100700002)(83380400001)(38350700002)(52116002)(6486002)(6506007)(6512007)(9686003)(6666004)(26005)(6916009)(36756003)(316002)(66946007)(2616005)(1076003)(66556008)(66476007)(41300700001)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NxguxwZyfPUNuJaEzvlggo/SXc5nMVX23cUJOGfSui/tDq+sAOh6s5U7yTo1?=
 =?us-ascii?Q?HBEcbp9mnxVjuyuM/x5bPRa0F5/ylTuH24btuRyVpRQwETyWiK3vb8GWfOQi?=
 =?us-ascii?Q?mlrZtlR1ys8qbPfvUMmBsp/NLfSkOiqvusdS8DGayDOz9Y2EGuPqNoGfql8r?=
 =?us-ascii?Q?+cQbQ4/FgXFNCocXIBWnZO/iYMU4dfs0hE8ewH98elKE2CLiSWQi4DR76mCX?=
 =?us-ascii?Q?GNi0ADoj9usFghi87ywwwTB3LxmjshsduvX2QOBQ1Izvfud0v55eiYArYq19?=
 =?us-ascii?Q?i30qPNXALe+zLkovtsql3cqfOOHGfjOhLERfMdrXDlg2xb0AimdAAEhOO0NT?=
 =?us-ascii?Q?eZfNZ61Q3kxwHlPc79xO7t26/XNhPvPlhNVfjnAcgld2YC+OTQqQ8M4A0qGn?=
 =?us-ascii?Q?L1XCKlU64552LvqXmjgXTsWPOEZrCl3Vx3DKrVKfqW6o4b9eXCeey38J5rhS?=
 =?us-ascii?Q?kGGYOq91KHwgcNLU2uL2xFJ8oCIu7+GKY44EG7IhlDbH7Yj6vH5AEEEgSZPH?=
 =?us-ascii?Q?wGsSFMfG754L+n2spzOaupew0Vg9Y7XcSdf32t3j3Qops9/5LcVNYfABAuRR?=
 =?us-ascii?Q?O55+t9j+IwMjYciRgMJaFAbWmMLKpxSsJE+TgTFsjpjhFxaSuVp6kImn9vMd?=
 =?us-ascii?Q?6Gth0zjw1y6KMvQI1ongmCHw32XI+8QE4VVON2k6UrW6uIpfBQ3jWjLJNx8u?=
 =?us-ascii?Q?Fo08bl8TUpMJKZdF5mwZoJRwxVZg6FpC8KtfJOeSif6kNWm4MDe60pYhnFkD?=
 =?us-ascii?Q?l0UoFNP59z3vMENBs8lQSa1hi9dP0jbwpt55K/H1QN7KRmr37/LsPK3pBAME?=
 =?us-ascii?Q?ilzrQHSaDnTePOoKBlXZNLzoZq3t2H5FHcSaFym1dvRDbFFevWe9J3m87ICU?=
 =?us-ascii?Q?C5lst4COWIrVhNi68voHUPkFCHmZQXUYH0eZkAwJNzHPmuj776hcFDk2uplc?=
 =?us-ascii?Q?vsD/ldIA3v3Zt886vfsGjcTEE5LPWT5bDxgx26KCt/VjpsXv7qiwC1CiMteG?=
 =?us-ascii?Q?vf3YcQzF8acPqbAjVGWjvCSmW+WJ14O8PIYznxMmtv7p6O4Ep/kme/ym4STZ?=
 =?us-ascii?Q?raQdCYdemXxEcWuXzerq/DOWWGgXmOgX7RySrJ4pd07EhQU6IXi67qYfLN+0?=
 =?us-ascii?Q?yg+H8jqSqjyz+npnQ3WRu0XF108/ne2Yazpw1IbF1YYx65WEhqmgRAPMNXH/?=
 =?us-ascii?Q?R3c7m7sRKke38694I8f6qZ/U8I8m4A4yDzm674aebQ+E47LENGS2PcF8d8Bt?=
 =?us-ascii?Q?0bvv7CiYS5Pp5yN2K+wvLT67StQUWFjtJHm8IvVZ7FZIvmNomuwHGZX8dgLA?=
 =?us-ascii?Q?0GdybtwJIYEfwNNPdUkC8aRSxYjb77agLFnVXlGfHg9pD8gYDRrRup5kdNkM?=
 =?us-ascii?Q?6ecXvROuZGK33PDE9TUmyVK1SSJDidde2OZRUgKZdpvCeapXDg/dOhydUKQj?=
 =?us-ascii?Q?/xmyLUdXi1BuYsav8IzAwPDc2u5gJKaVnNW2Wikw5Wbxp1Q7pSMM08pl65Hs?=
 =?us-ascii?Q?sJuTF0RrQH7+sssyfrjx8ifmJ8Svqd/XByxHaACUjAtzd/J4GMvsZydc9tZq?=
 =?us-ascii?Q?DOW06Tb6f0sYS2nEi4fVpfssv26gTWkJp6MlTDRc?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83167425-5a91-44e9-2efe-08dbb4d72e83
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 04:00:49.7878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MuxsXOzC2bNvcOHXGWfgx6tTrBuvX6R5DiZqiVz3ZPkAUFd8qBzlgobNJmJQWcGNY8EcTdOetfTots3IOShbCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5436
X-Proofpoint-GUID: V1jqDNp9FnrFqxoiGxaKC3mGRPamNPt7
X-Proofpoint-ORIG-GUID: V1jqDNp9FnrFqxoiGxaKC3mGRPamNPt7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-14_01,2023-09-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2308100000
 definitions=main-2309140033
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Sep 2023 04:00:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104865

From: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...ventEngine-Improve-server-handling-o.patch | 224 ++++++++++++++++++
 meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb  |   1 +
 2 files changed, 225 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-backport-iomgr-EventEngine-Improve-server-handling-o.patch

diff --git a/meta-oe/recipes-devtools/grpc/grpc/0001-backport-iomgr-EventEngine-Improve-server-handling-o.patch b/meta-oe/recipes-devtools/grpc/grpc/0001-backport-iomgr-EventEngine-Improve-server-handling-o.patch
new file mode 100644
index 0000000000..4488df172f
--- /dev/null
+++ b/meta-oe/recipes-devtools/grpc/grpc/0001-backport-iomgr-EventEngine-Improve-server-handling-o.patch
@@ -0,0 +1,224 @@
+From b3c105c59dfb7d932b36b0d9ac7ab62875ab23e8 Mon Sep 17 00:00:00 2001
+From: AJ Heller <hork@google.com>
+Date: Wed, 12 Jul 2023 18:42:09 -0700
+Subject: [PATCH] [backport][iomgr][EventEngine] Improve server handling of
+ file descriptor exhaustion (#33672)
+
+Backport of #33656
+
+CVE: CVE-2023-33953
+
+Upstream-Status: Backport [1e86ca5834b94cae7d5e6d219056c0fc895cf95d]
+The patch is backported with tweaks to fit 1.50.1.
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ .../event_engine/posix_engine/posix_engine.h  |  1 +
+ src/core/lib/iomgr/tcp_server_posix.cc        | 51 ++++++++++++++-----
+ src/core/lib/iomgr/tcp_server_utils_posix.h   | 14 ++++-
+ .../iomgr/tcp_server_utils_posix_common.cc    | 22 ++++++++
+ 4 files changed, 73 insertions(+), 15 deletions(-)
+
+diff --git a/src/core/lib/event_engine/posix_engine/posix_engine.h b/src/core/lib/event_engine/posix_engine/posix_engine.h
+index eac6dfb4c5..866c04bcfa 100644
+--- a/src/core/lib/event_engine/posix_engine/posix_engine.h
++++ b/src/core/lib/event_engine/posix_engine/posix_engine.h
+@@ -97,6 +97,7 @@ class PosixEventEngine final : public EventEngine {
+       const DNSResolver::ResolverOptions& options) override;
+   void Run(Closure* closure) override;
+   void Run(absl::AnyInvocable<void()> closure) override;
++  // Caution!! The timer implementation cannot create any fds. See #20418.
+   TaskHandle RunAfter(Duration when, Closure* closure) override;
+   TaskHandle RunAfter(Duration when,
+                       absl::AnyInvocable<void()> closure) override;
+diff --git a/src/core/lib/iomgr/tcp_server_posix.cc b/src/core/lib/iomgr/tcp_server_posix.cc
+index d43113fb03..32be997cff 100644
+--- a/src/core/lib/iomgr/tcp_server_posix.cc
++++ b/src/core/lib/iomgr/tcp_server_posix.cc
+@@ -16,13 +16,17 @@
+  *
+  */
+ 
+-/* FIXME: "posix" files shouldn't be depending on _GNU_SOURCE */
++#include <grpc/support/port_platform.h>
++
++#include <utility>
++
++#include <grpc/support/atm.h>
++
++// FIXME: "posix" files shouldn't be depending on _GNU_SOURCE
+ #ifndef _GNU_SOURCE
+ #define _GNU_SOURCE
+ #endif
+ 
+-#include <grpc/support/port_platform.h>
+-
+ #include "src/core/lib/iomgr/port.h"
+ 
+ #ifdef GRPC_POSIX_SOCKET_TCP_SERVER
+@@ -44,6 +48,7 @@
+ #include "absl/strings/str_format.h"
+ 
+ #include <grpc/event_engine/endpoint_config.h>
++#include <grpc/event_engine/event_engine.h>
+ #include <grpc/support/alloc.h>
+ #include <grpc/support/log.h>
+ #include <grpc/support/sync.h>
+@@ -63,6 +68,8 @@
+ #include "src/core/lib/resource_quota/api.h"
+ 
+ static std::atomic<int64_t> num_dropped_connections{0};
++static constexpr grpc_core::Duration kRetryAcceptWaitTime{
++    grpc_core::Duration::Seconds(1)};
+ 
+ using ::grpc_event_engine::experimental::EndpointConfig;
+ 
+@@ -195,21 +202,35 @@ static void on_read(void* arg, grpc_error_handle err) {
+     if (fd < 0) {
+       if (errno == EINTR) {
+         continue;
+-      } else if (errno == EAGAIN || errno == ECONNABORTED ||
+-                 errno == EWOULDBLOCK) {
++      }
++      // When the process runs out of fds, accept4() returns EMFILE. When this
++      // happens, the connection is left in the accept queue until either a
++      // read event triggers the on_read callback, or time has passed and the
++      // accept should be re-tried regardless. This callback is not cancelled,
++      // so a spurious wakeup may occur even when there's nothing to accept.
++      // This is not a performant code path, but if an fd limit has been
++      // reached, the system is likely in an unhappy state regardless.
++      if (errno == EMFILE) {
+         grpc_fd_notify_on_read(sp->emfd, &sp->read_closure);
++        if (gpr_atm_full_xchg(&sp->retry_timer_armed, true)) return;
++        grpc_timer_init(&sp->retry_timer,
++                        grpc_core::Timestamp::Now() + kRetryAcceptWaitTime,
++                        &sp->retry_closure);
+         return;
++      }
++      if (errno == EAGAIN || errno == ECONNABORTED || errno == EWOULDBLOCK) {
++        grpc_fd_notify_on_read(sp->emfd, &sp->read_closure);
++        return;
++      }
++      gpr_mu_lock(&sp->server->mu);
++      if (!sp->server->shutdown_listeners) {
++        gpr_log(GPR_ERROR, "Failed accept4: %s", strerror(errno));
+       } else {
+-        gpr_mu_lock(&sp->server->mu);
+-        if (!sp->server->shutdown_listeners) {
+-          gpr_log(GPR_ERROR, "Failed accept4: %s", strerror(errno));
+-        } else {
+-          /* if we have shutdown listeners, accept4 could fail, and we
+-             needn't notify users */
+-        }
+-        gpr_mu_unlock(&sp->server->mu);
+-        goto error;
++        // if we have shutdown listeners, accept4 could fail, and we
++        // needn't notify users
+       }
++      gpr_mu_unlock(&sp->server->mu);
++      goto error;
+     }
+ 
+     if (sp->server->memory_quota->IsMemoryPressureHigh()) {
+@@ -403,6 +424,7 @@ static grpc_error_handle clone_port(grpc_tcp_listener* listener,
+     sp->port_index = listener->port_index;
+     sp->fd_index = listener->fd_index + count - i;
+     GPR_ASSERT(sp->emfd);
++    grpc_tcp_server_listener_initialize_retry_timer(sp);
+     while (listener->server->tail->next != nullptr) {
+       listener->server->tail = listener->server->tail->next;
+     }
+@@ -575,6 +597,7 @@ static void tcp_server_shutdown_listeners(grpc_tcp_server* s) {
+   if (s->active_ports) {
+     grpc_tcp_listener* sp;
+     for (sp = s->head; sp; sp = sp->next) {
++      grpc_timer_cancel(&sp->retry_timer);
+       grpc_fd_shutdown(sp->emfd,
+                        GRPC_ERROR_CREATE_FROM_STATIC_STRING("Server shutdown"));
+     }
+diff --git a/src/core/lib/iomgr/tcp_server_utils_posix.h b/src/core/lib/iomgr/tcp_server_utils_posix.h
+index 94faa2c17e..2e78ce555f 100644
+--- a/src/core/lib/iomgr/tcp_server_utils_posix.h
++++ b/src/core/lib/iomgr/tcp_server_utils_posix.h
+@@ -25,6 +25,7 @@
+ #include "src/core/lib/iomgr/resolve_address.h"
+ #include "src/core/lib/iomgr/socket_utils_posix.h"
+ #include "src/core/lib/iomgr/tcp_server.h"
++#include "src/core/lib/iomgr/timer.h"
+ #include "src/core/lib/resource_quota/memory_quota.h"
+ 
+ /* one listening port */
+@@ -47,6 +48,11 @@ typedef struct grpc_tcp_listener {
+      identified while iterating through 'next'. */
+   struct grpc_tcp_listener* sibling;
+   int is_sibling;
++  // If an accept4() call fails, a timer is started to drain the accept queue in
++  // case no further connection attempts reach the gRPC server.
++  grpc_closure retry_closure;
++  grpc_timer retry_timer;
++  gpr_atm retry_timer_armed;
+ } grpc_tcp_listener;
+ 
+ /* the overall server */
+@@ -126,4 +132,10 @@ grpc_error_handle grpc_tcp_server_prepare_socket(
+ /* Ruturn true if the platform supports ifaddrs */
+ bool grpc_tcp_server_have_ifaddrs(void);
+ 
+-#endif /* GRPC_CORE_LIB_IOMGR_TCP_SERVER_UTILS_POSIX_H */
++// Initialize (but don't start) the timer and callback to retry accept4() on a
++// listening socket after file descriptors have been exhausted. This must be
++// called when creating a new listener.
++void grpc_tcp_server_listener_initialize_retry_timer(
++    grpc_tcp_listener* listener);
++
++#endif  // GRPC_SRC_CORE_LIB_IOMGR_TCP_SERVER_UTILS_POSIX_H
+diff --git a/src/core/lib/iomgr/tcp_server_utils_posix_common.cc b/src/core/lib/iomgr/tcp_server_utils_posix_common.cc
+index 73a6b943ec..0e671c6485 100644
+--- a/src/core/lib/iomgr/tcp_server_utils_posix_common.cc
++++ b/src/core/lib/iomgr/tcp_server_utils_posix_common.cc
+@@ -18,6 +18,8 @@
+ 
+ #include <grpc/support/port_platform.h>
+ 
++#include <grpc/support/atm.h>
++
+ #include "src/core/lib/iomgr/port.h"
+ 
+ #ifdef GRPC_POSIX_SOCKET_TCP_SERVER_UTILS_COMMON
+@@ -80,6 +82,24 @@ static int get_max_accept_queue_size(void) {
+   return s_max_accept_queue_size;
+ }
+ 
++static void listener_retry_timer_cb(void* arg, grpc_error_handle err) {
++  // Do nothing if cancelled.
++  if (!err.ok()) return;
++  grpc_tcp_listener* listener = static_cast<grpc_tcp_listener*>(arg);
++  gpr_atm_no_barrier_store(&listener->retry_timer_armed, false);
++  if (!grpc_fd_is_shutdown(listener->emfd)) {
++    grpc_fd_set_readable(listener->emfd);
++  }
++}
++
++void grpc_tcp_server_listener_initialize_retry_timer(
++    grpc_tcp_listener* listener) {
++  gpr_atm_no_barrier_store(&listener->retry_timer_armed, false);
++  grpc_timer_init_unset(&listener->retry_timer);
++  GRPC_CLOSURE_INIT(&listener->retry_closure, listener_retry_timer_cb, listener,
++                    grpc_schedule_on_exec_ctx);
++}
++
+ static grpc_error_handle add_socket_to_server(grpc_tcp_server* s, int fd,
+                                               const grpc_resolved_address* addr,
+                                               unsigned port_index,
+@@ -112,6 +132,8 @@ static grpc_error_handle add_socket_to_server(grpc_tcp_server* s, int fd,
+   sp->server = s;
+   sp->fd = fd;
+   sp->emfd = grpc_fd_create(fd, name.c_str(), true);
++  grpc_tcp_server_listener_initialize_retry_timer(sp);
++
+   memcpy(&sp->addr, addr, sizeof(grpc_resolved_address));
+   sp->port = port;
+   sp->port_index = port_index;
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb b/meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb
index b3956ce40c..3cfd0210db 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb
@@ -27,6 +27,7 @@ SRC_URI = "gitsm://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BR
            file://0001-cmake-add-separate-export-for-plugin-targets.patch \
            file://0001-cmake-Link-with-libatomic-on-rv32-rv64.patch \
            file://0001-fix-CVE-2023-32732.patch \
+           file://0001-backport-iomgr-EventEngine-Improve-server-handling-o.patch \
            "
 # Fixes build with older compilers 4.8 especially on ubuntu 14.04
 CXXFLAGS:append:class-native = " -Wl,--no-as-needed"
-- 
2.34.1


