Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C95C32771
	for <webhook@archiver.kernel.org>; Sat, 24 Sep 2022 06:41:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.4299.1664001653109237058
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Sep 2022 23:40:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=r9f61ZAP;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=626698033d=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28O6ZGYN016131
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Sep 2022 23:40:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=LQgFH1xgLZC6JKbtQpGlVdd7bJgggbjLn7nOyGMqWE8=;
 b=r9f61ZAPjEy2EwECHpTaZsaCmTkkYyXYWGSEjAv89DUId74obCwiNrH1Yq1CoSngAlka
 4c6zLXxwmqFq4MJEXW5HVJa66tkdwLx6kfJpViZ1Rif4dUL+y6GsJJpCN2kThvgEE4dy
 XOy/ALsEBy0er/WIxsVbh3xf5za4x8DnXBcUqtAg94giOL+BoRmMoOuxpUXgpe873Bzf
 aiW57/hPsVJvBwoB1p0mmlUs0uEFm94Umb89KQmnAthQwCon8QQuYRQ8IiZRHmQ4VIfk
 LWXezmzMoxiX0DO8ZrRuQqjcfKOpY45ILm2tQGWn95ei+nJZ3NFfLE8h500Zvvf3Is9N Ig==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jn9h3wsvf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Sep 2022 23:40:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eMqUzoS3HmZLuePfMzzIBtVobGEsjdMtuYpJ/M4KG0HRayySVShP6vNXwpg4K/ZIIjllxngFUgnsUGAxxYlpyw2prJ1jHMkMa1/DapCOw+AAXI8UZeQcmuAuK5IK6F7AlfhiaEm1ksUczJ3q7u53rinIZ/Zj17YrSsMdaNEkvSUr57GK4nCRrS04lUSmM1+xfgqXHMI1PJjhgnPQ7cEwhXWs90sO/krdIwf/u6QUdU6hYfsXK3HqmcygYinSgI423nr7P0PEmqIPB9IjaTau0ZTf1wXAMBJWNKcKjbZpb27EiMVnnw6SiANhYywNMEvb6COL1+sXX37MIN1lCps3ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQgFH1xgLZC6JKbtQpGlVdd7bJgggbjLn7nOyGMqWE8=;
 b=oeIEdHiUK+IlhBxm2o4SsgVUVyCXYVNEXpnTQGmCQY1FqxUlewh8ASvHHcbxpV1k4CzbYJKyY+/N/KO+Qtz5lhpcgVKB7URqCmX3iC1MuXYjgz+HpFJWwPd1e/UScPQA1ZSrItTaYgmvGWliody+2fjhfGqeYpJyhSPQ2Q7NHJmAlH+T/zrCq/kJEsn914ixnO3f2mIjJItD6nvY13YnjTI2ax2iZD/34FiRQV+G/GChC9wqdlZkIUX7OJMNCAyQhNXOqN17R7wxvhnz8tn8lSSJQoD/NtEIHuQlp4YCkqzcC9Kr+DVAtLSKxYh0nJOHiGZ+ODTVSRHgvjbp1eJfeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MW3PR11MB4570.namprd11.prod.outlook.com (2603:10b6:303:5f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.22; Sat, 24 Sep
 2022 06:40:50 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8957:e965:a52:2366]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8957:e965:a52:2366%3]) with mapi id 15.20.5654.022; Sat, 24 Sep 2022
 06:40:50 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] frr: upgrade 8.2.2 -> 8.3.1
Date: Sat, 24 Sep 2022 14:40:35 +0800
Message-Id: <20220924064035.2217902-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0014.apcprd06.prod.outlook.com
 (2603:1096:4:186::11) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|MW3PR11MB4570:EE_
X-MS-Office365-Filtering-Correlation-Id: 463b5316-112b-4dc4-934b-08da9df7b897
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	O+8eJVNNAfjMGdQyA1JeZvqs30CqK3UeXocmoTuIOFUQK51hQ3UOiwDGdceQW78EOvcj1nHSjwWtX9vZ1S2mGa9O5T6s5eQcqqLnApbF5xXJUqP5auY3Gp+xV6pQ/HFA0MLpQRM11kybJ7k4aMbNH6Y5kz14ZKZ04OSAqBcfImUVMZ7AnTG5TOBEsuVJmqyC2UhGzi+pP4++jXZ6q7Vt8X5S5+hFZk95LHelibiGPFqgbQ/mfOh9x45hcsq6yLfSPoo6DNLod5XF43pHmruf2WT87IDFk3+lZeMxdy5UZP/YyAC34gQUGt7fohCv+C0YHxOI+vG9pupVW7HMGhyNdIs8w4q44T8YZIYuUF4m0/c1R09aDWWQ/t1QTdpn5anCNViTHoKEOldDwLWgKyRBn7wVL4IQSZ/4kTsEbK5VNyq4y/LikWtmNhZ3qSs2V21BLyUTyRwFjOTbgD4NTyVrCOkjJxi0yzUooedz7ADRKUxCRAgCrDn881jEY6Cgpr9OjdBFMWKedu2kyW2wEAY+c3yjY2+SkZm7yyadryAdjOqkFvZK71gqq8ebDzxzpuFGujH7smhaSkqqEwEWQi12fsjZA1vCrTGAIVtSzOTdIcPBAt5hay1u6npcSgEiQjlv3V2bjbPoaUPeWpTKDLQ3Iet517yRWYB51S/xB95U7UMicewh9hWRg3NfH4ItnfCwaNL/VCkKvVw4ivQuQXt+GZW3qiuyjh1iWFiksPQ4KZQmPmI1mIJ47JabNDb4kNA95lTEUmlUW/w7wEEGk5uqxGLdCaSttA2Z9ouM8QT8NKydfjnbA061Zp0BRrg0O3q7jwl8P9PSUWHAgLt6XJ2Bqg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(376002)(39850400004)(136003)(346002)(451199015)(83380400001)(2616005)(1076003)(186003)(86362001)(38350700002)(38100700002)(44832011)(30864003)(5660300002)(8936002)(66476007)(66556008)(66946007)(41300700001)(2906002)(478600001)(6666004)(6506007)(52116002)(26005)(6512007)(316002)(6916009)(8676002)(6486002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FTj9Ip4PyA1y9Z8rIhHWoNs4ore6vJuGbp2VoPJ/jBD92a5usgGiCWm4Lr+o?=
 =?us-ascii?Q?z/2BTf2HR43FZiHvpQl/KaZ2dfHZe+5v2/CY5cqbUasdgoomnIxiV2raBocD?=
 =?us-ascii?Q?LIT7Q9goUf0mzZSuJqm7FDRwGh/Fc0sIxEtPEoj4tSlYslNq7Apc3Xx4RwCi?=
 =?us-ascii?Q?PTVSH3zaycl+z7N0etD/4VWb/CRcfZxiVIjXLbn1nguuNrD15ObOImmSWLVd?=
 =?us-ascii?Q?zgWP/EcskbUHWjdnmoP8qNLOs55ZTR9wJbJdZ7URSsj7/BMW8w/ECHDsEQdo?=
 =?us-ascii?Q?5d6j+Jnmigt5t04bTGDj+jmZ/dv3EX25RlPX5JKaePGmoEEg6V+xU7eqJYFB?=
 =?us-ascii?Q?7Q4/tqJb4YSraxACHJjxXzlChBJoubYkkI4BuLe0JsTMqxH6RsaS/pecfxI8?=
 =?us-ascii?Q?uPV+Zpe1XHeBz2Aof6/9w9h9GXZi9DYF3+MjJ2kH7zNhWNqoas/b3mfqG9sM?=
 =?us-ascii?Q?P+kKM4l/yAdZjeBeoiy48T4Jz5pqP8ZrTJ1Y2qBRwxvsECWBckQpHD6Vevas?=
 =?us-ascii?Q?joodABmK3FaveP5FvSiRJ5UjL/XYE9lmWzp/aOzDHtP+J3Z8trqTzWWbXyLf?=
 =?us-ascii?Q?N64rI4bYaECnjw4L4kSv5xoJj9aVIaH6jzCCeV+Xj8tqbYepfGoTlgwcRG+M?=
 =?us-ascii?Q?eMfW3q8PMDXkK20gW93S2e43fBi3DbebCj+4x8YfmLeoFUV+9D2SQLD3EOrs?=
 =?us-ascii?Q?vIMmqKm3+kZ4xhM6z3kJPy74WxIOVOxn8FxsdTYzj5FGEryXa2lIjJC1C0+3?=
 =?us-ascii?Q?q988Y5y8hg7BZ6pt6CZQOPBrMf87I0ve5fpQZ9z2ONOL4bN3ZLTsw1LcNcot?=
 =?us-ascii?Q?Bs6M53Ru2u2C1fe4cC8iG6zQgHQqzMyK0hl2kRINIIrKjNNkJB+uEommMoO8?=
 =?us-ascii?Q?GL03qsji1uDHIsurY1U7cxRAlEOslX6+VAhhTzpfyOUgpsWkIKiiKEfv7yER?=
 =?us-ascii?Q?+s3asIp+zrvmH0n87Da/QMgxHZkmV1JiJ/nHCoKjYP0xtNWGkALQTJPVFl06?=
 =?us-ascii?Q?lcMedQdvuWV64GVzvvcVG9R5IPY8zBR7NO79hUEmp9i2O6eoPQ+Xf0h+p8SQ?=
 =?us-ascii?Q?kwS9D3JRNseNLsn7Og7Cf7KDSeFQhL/4CKLiQKtWDjgP6pWlda97XKkm7YmP?=
 =?us-ascii?Q?K2ukmwUzcm8mwVPKDMbgKYrpH4eQQp5pZwQogPBRxfafhhLd6exkAwfSlA9Q?=
 =?us-ascii?Q?ZFlM88Hh+JTyXSD5zY3EcgvlI+TcMKELYwhhx+XCHxCpSu1bTIpNd1yuH2GX?=
 =?us-ascii?Q?gpIgIS+AjKaGp4/SeRkg7hmVk8UpXs5Xu+LPvrKAt60ltd+yZu0YwCV9/HP0?=
 =?us-ascii?Q?32fmKKLHcalnHBqcV9rmxMzBUKnsQyeOjkH6SNI4+vZnFP3JRwNC0tJNcyma?=
 =?us-ascii?Q?8UySKS9LayE9pKbhMiFowItitdE4zr2uHl4qzg4tjyOCiEmnObK0Imre1CM3?=
 =?us-ascii?Q?fohffB0nOJs6CiHfm/ie8HNifh1Hs+rda8cxuRjGAwjk+sNFjz+G51UIT+M/?=
 =?us-ascii?Q?jrod8kaQ0pr+hCCqORJHzqK9g6V1jQJFdlZEAdxgYA/XAa5rFcoDSpNl4PEJ?=
 =?us-ascii?Q?WfOdl5zFhrmcBDKKDdnuuJWjQnisUhDiHusQ/nH+?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 463b5316-112b-4dc4-934b-08da9df7b897
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2022 06:40:50.8752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 5YpVfeOm0OnjiedlWal3Fy73+0iKzwsfLJtAbCh/bzU2CC8Sp04rahYJTwLpeA1lctQkzLP9Xz/EfYv1zTCAkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4570
X-Proofpoint-GUID: sDhLIOLsJouht4DSlF7rFEyijx9RQEBU
X-Proofpoint-ORIG-GUID: sDhLIOLsJouht4DSlF7rFEyijx9RQEBU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-24_02,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1011
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209240044
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Sep 2022 06:41:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98944

Backport patches to fix build error with --disable-ospfapi and
CVE-2022-37035.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...fy-race-between-io-and-main-pthreads.patch | 151 ++++++++++++++++++
 ...for-readline-function-instead-of-mai.patch |   4 +-
 ...UPPORT_OSPF_API-define-in-ospf_spf.c.patch |  48 ++++++
 .../frr/{frr_8.2.2.bb => frr_8.3.1.bb}        |   6 +-
 4 files changed, 206 insertions(+), 3 deletions(-)
 create mode 100644 meta-networking/recipes-protocols/frr/frr/0001-bgpd-avoid-notify-race-between-io-and-main-pthreads.patch
 create mode 100644 meta-networking/recipes-protocols/frr/frr/0001-ospfd-Adding-SUPPORT_OSPF_API-define-in-ospf_spf.c.patch
 rename meta-networking/recipes-protocols/frr/{frr_8.2.2.bb => frr_8.3.1.bb} (95%)

diff --git a/meta-networking/recipes-protocols/frr/frr/0001-bgpd-avoid-notify-race-between-io-and-main-pthreads.patch b/meta-networking/recipes-protocols/frr/frr/0001-bgpd-avoid-notify-race-between-io-and-main-pthreads.patch
new file mode 100644
index 000000000..40284d6f4
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/0001-bgpd-avoid-notify-race-between-io-and-main-pthreads.patch
@@ -0,0 +1,151 @@
+From 71ca5b09bc71e8cbe38177cf41e83fe164e52eee Mon Sep 17 00:00:00 2001
+From: Mark Stapp <mstapp@nvidia.com>
+Date: Thu, 8 Sep 2022 16:14:36 -0400
+Subject: [PATCH] bgpd: avoid notify race between io and main pthreads
+
+The "bgp_notify_" apis in bgp_packet.c generate a notification
+to a peer, usually during error handling. The io pthread wants
+to send notifications in a couple of cases during early
+received-packet validation - but the existing api interacts
+with the peer struct itself, and that's not safe.
+
+Add a new api for use by the io pthread, and adjust the main
+notify api so that it can avoid touching the peer struct.
+
+Signed-off-by: Mark Stapp <mstapp@nvidia.com>
+
+CVE: CVE-2022-37035
+
+Upstream-Status: Backport
+[https://github.com/FRRouting/frr/commit/71ca5b09bc71e8cbe38177cf41e83fe164e52eee]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ bgpd/bgp_io.c     | 17 ++++++++---------
+ bgpd/bgp_packet.c | 32 ++++++++++++++++++++++++++++----
+ bgpd/bgp_packet.h |  2 ++
+ 3 files changed, 38 insertions(+), 13 deletions(-)
+
+diff --git a/bgpd/bgp_io.c b/bgpd/bgp_io.c
+index 7af1fae28..f9bb8d518 100644
+--- a/bgpd/bgp_io.c
++++ b/bgpd/bgp_io.c
+@@ -37,7 +37,7 @@
+ #include "bgpd/bgp_debug.h"	// for bgp_debug_neighbor_events, bgp_type_str
+ #include "bgpd/bgp_errors.h"	// for expanded error reference information
+ #include "bgpd/bgp_fsm.h"	// for BGP_EVENT_ADD, bgp_event
+-#include "bgpd/bgp_packet.h"	// for bgp_notify_send_with_data, bgp_notify...
++#include "bgpd/bgp_packet.h"	// for bgp_notify_io_invalid...
+ #include "bgpd/bgp_trace.h"	// for frrtraces
+ #include "bgpd/bgpd.h"		// for peer, BGP_MARKER_SIZE, bgp_master, bm
+ /* clang-format on */
+@@ -526,8 +526,8 @@ static bool validate_header(struct peer *peer)
+ 		return false;
+ 
+ 	if (memcmp(m_correct, m_rx, BGP_MARKER_SIZE) != 0) {
+-		bgp_notify_send(peer, BGP_NOTIFY_HEADER_ERR,
+-				BGP_NOTIFY_HEADER_NOT_SYNC);
++		bgp_notify_io_invalid(peer, BGP_NOTIFY_HEADER_ERR,
++				      BGP_NOTIFY_HEADER_NOT_SYNC, NULL, 0);
+ 		return false;
+ 	}
+ 
+@@ -547,9 +547,8 @@ static bool validate_header(struct peer *peer)
+ 			zlog_debug("%s unknown message type 0x%02x", peer->host,
+ 				   type);
+ 
+-		bgp_notify_send_with_data(peer, BGP_NOTIFY_HEADER_ERR,
+-					  BGP_NOTIFY_HEADER_BAD_MESTYPE, &type,
+-					  1);
++		bgp_notify_io_invalid(peer, BGP_NOTIFY_HEADER_ERR,
++				      BGP_NOTIFY_HEADER_BAD_MESTYPE, &type, 1);
+ 		return false;
+ 	}
+ 
+@@ -574,9 +573,9 @@ static bool validate_header(struct peer *peer)
+ 
+ 		uint16_t nsize = htons(size);
+ 
+-		bgp_notify_send_with_data(peer, BGP_NOTIFY_HEADER_ERR,
+-					  BGP_NOTIFY_HEADER_BAD_MESLEN,
+-					  (unsigned char *)&nsize, 2);
++		bgp_notify_io_invalid(peer, BGP_NOTIFY_HEADER_ERR,
++				      BGP_NOTIFY_HEADER_BAD_MESLEN,
++				      (unsigned char *)&nsize, 2);
+ 		return false;
+ 	}
+ 
+diff --git a/bgpd/bgp_packet.c b/bgpd/bgp_packet.c
+index 7daac4494..90695219a 100644
+--- a/bgpd/bgp_packet.c
++++ b/bgpd/bgp_packet.c
+@@ -871,8 +871,9 @@ bool bgp_notify_received_hard_reset(struct peer *peer, uint8_t code,
+  * @param data      Data portion
+  * @param datalen   length of data portion
+  */
+-void bgp_notify_send_with_data(struct peer *peer, uint8_t code,
+-			       uint8_t sub_code, uint8_t *data, size_t datalen)
++static void bgp_notify_send_internal(struct peer *peer, uint8_t code,
++				     uint8_t sub_code, uint8_t *data,
++				     size_t datalen, bool use_curr)
+ {
+ 	struct stream *s;
+ 	bool hard_reset = bgp_notify_send_hard_reset(peer, code, sub_code);
+@@ -917,8 +918,11 @@ void bgp_notify_send_with_data(struct peer *peer, uint8_t code,
+ 	 * If possible, store last packet for debugging purposes. This check is
+ 	 * in place because we are sometimes called with a doppelganger peer,
+ 	 * who tends to have a plethora of fields nulled out.
++	 *
++	 * Some callers should not attempt this - the io pthread for example
++	 * should not touch internals of the peer struct.
+ 	 */
+-	if (peer->curr) {
++	if (use_curr && peer->curr) {
+ 		size_t packetsize = stream_get_endp(peer->curr);
+ 		assert(packetsize <= peer->max_packet_size);
+ 		memcpy(peer->last_reset_cause, peer->curr->data, packetsize);
+@@ -1001,7 +1005,27 @@ void bgp_notify_send_with_data(struct peer *peer, uint8_t code,
+  */
+ void bgp_notify_send(struct peer *peer, uint8_t code, uint8_t sub_code)
+ {
+-	bgp_notify_send_with_data(peer, code, sub_code, NULL, 0);
++	bgp_notify_send_internal(peer, code, sub_code, NULL, 0, true);
++}
++
++/*
++ * Enqueue notification; called from the main pthread, peer object access is ok.
++ */
++void bgp_notify_send_with_data(struct peer *peer, uint8_t code,
++			       uint8_t sub_code, uint8_t *data, size_t datalen)
++{
++	bgp_notify_send_internal(peer, code, sub_code, data, datalen, true);
++}
++
++/*
++ * For use by the io pthread, queueing a notification but avoiding access to
++ * the peer object.
++ */
++void bgp_notify_io_invalid(struct peer *peer, uint8_t code, uint8_t sub_code,
++			   uint8_t *data, size_t datalen)
++{
++	/* Avoid touching the peer object */
++	bgp_notify_send_internal(peer, code, sub_code, data, datalen, false);
+ }
+ 
+ /*
+diff --git a/bgpd/bgp_packet.h b/bgpd/bgp_packet.h
+index a0eb579db..9f6d772bc 100644
+--- a/bgpd/bgp_packet.h
++++ b/bgpd/bgp_packet.h
+@@ -62,6 +62,8 @@ extern void bgp_open_send(struct peer *);
+ extern void bgp_notify_send(struct peer *, uint8_t, uint8_t);
+ extern void bgp_notify_send_with_data(struct peer *, uint8_t, uint8_t,
+ 				      uint8_t *, size_t);
++void bgp_notify_io_invalid(struct peer *peer, uint8_t code, uint8_t sub_code,
++			   uint8_t *data, size_t datalen);
+ extern void bgp_route_refresh_send(struct peer *peer, afi_t afi, safi_t safi,
+ 				   uint8_t orf_type, uint8_t when_to_refresh,
+ 				   int remove, uint8_t subtype);
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-protocols/frr/frr/0001-configure-Check-for-readline-function-instead-of-mai.patch b/meta-networking/recipes-protocols/frr/frr/0001-configure-Check-for-readline-function-instead-of-mai.patch
index 4b218a61e..20e847223 100644
--- a/meta-networking/recipes-protocols/frr/frr/0001-configure-Check-for-readline-function-instead-of-mai.patch
+++ b/meta-networking/recipes-protocols/frr/frr/0001-configure-Check-for-readline-function-instead-of-mai.patch
@@ -6,7 +6,9 @@ Subject: [PATCH] configure: Check for readline() function instead of main
 main is not a function found in libreadline, its better to check for a
 function thats provided by it.
 
-Upstream-Status: Submitted [https://github.com/FRRouting/frr/pull/11893]
+Upstream-Status: Backport
+[https://github.com/FRRouting/frr/commit/9399d58c13257849179d3c2b3698a2b43bc1b2a0]
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  configure.ac | 2 +-
diff --git a/meta-networking/recipes-protocols/frr/frr/0001-ospfd-Adding-SUPPORT_OSPF_API-define-in-ospf_spf.c.patch b/meta-networking/recipes-protocols/frr/frr/0001-ospfd-Adding-SUPPORT_OSPF_API-define-in-ospf_spf.c.patch
new file mode 100644
index 000000000..09988946b
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/0001-ospfd-Adding-SUPPORT_OSPF_API-define-in-ospf_spf.c.patch
@@ -0,0 +1,48 @@
+From ec3bb054c331f9d928ac21a1747e0f921b51dfbc Mon Sep 17 00:00:00 2001
+From: Michal Ruprich <michalruprich@gmail.com>
+Date: Tue, 6 Sep 2022 12:25:01 +0200
+Subject: [PATCH] ospfd: Adding SUPPORT_OSPF_API define in ospf_spf.c
+
+It is not possible to build ospf_spf.c file with --disable-ospfapi because
+ospf_apiserver.c has SUPPORT_OSPF_API around all function definitions and
+that results in an undefined reference to the ospf_apiserver_notify_reachable
+function error while building.
+
+Signed-off-by: Michal Ruprich <mruprich@redhat.com>
+
+Upstream-Status: Backport
+[https://github.com/FRRouting/frr/commit/ec3bb054c331f9d928ac21a1747e0f921b51dfbc]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ ospfd/ospf_spf.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/ospfd/ospf_spf.c b/ospfd/ospf_spf.c
+index 46492ff6b..4edc1de81 100644
+--- a/ospfd/ospf_spf.c
++++ b/ospfd/ospf_spf.c
+@@ -48,7 +48,10 @@
+ #include "ospfd/ospf_sr.h"
+ #include "ospfd/ospf_ti_lfa.h"
+ #include "ospfd/ospf_errors.h"
++
++#ifdef SUPPORT_OSPF_API
+ #include "ospfd/ospf_apiserver.h"
++#endif
+ 
+ /* Variables to ensure a SPF scheduled log message is printed only once */
+ 
+@@ -1895,7 +1898,9 @@ static void ospf_spf_calculate_schedule_worker(struct thread *thread)
+ 	/* Update all routers routing table */
+ 	ospf->oall_rtrs = ospf->all_rtrs;
+ 	ospf->all_rtrs = all_rtrs;
++#ifdef SUPPORT_OSPF_API
+ 	ospf_apiserver_notify_reachable(ospf->oall_rtrs, ospf->all_rtrs);
++#endif
+ 
+ 	/* Free old ABR/ASBR routing table */
+ 	if (ospf->old_rtrs)
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb b/meta-networking/recipes-protocols/frr/frr_8.3.1.bb
similarity index 95%
rename from meta-networking/recipes-protocols/frr/frr_8.2.2.bb
rename to meta-networking/recipes-protocols/frr/frr_8.3.1.bb
index 607ed8b9d..c69720e6f 100644
--- a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
+++ b/meta-networking/recipes-protocols/frr/frr_8.3.1.bb
@@ -9,12 +9,14 @@ LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING-LGPLv2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/8.2 \
+SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/8.3 \
            file://0001-configure-Check-for-readline-function-instead-of-mai.patch \
+           file://0001-ospfd-Adding-SUPPORT_OSPF_API-define-in-ospf_spf.c.patch \
+           file://0001-bgpd-avoid-notify-race-between-io-and-main-pthreads.patch \
            file://frr.pam \
 	      "
 
-SRCREV = "79188bf710e92acf42fb5b9b0a2e9593a5ee9b05"
+SRCREV = "a74f7a9ad9623e6f9654fe4a7177e5da0b194828"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


