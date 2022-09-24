Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA09CC07E9D
	for <webhook@archiver.kernel.org>; Sat, 24 Sep 2022 07:40:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.4610.1664005212072138814
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Sep 2022 00:40:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=LegHNWaQ;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=626698033d=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28O7UI24002524
	for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Sep 2022 00:40:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=A3xPgmqYBKSCQONCLI5LaTvsPSABUtriCsdyILUERXg=;
 b=LegHNWaQ0ZxX/1KtSmCezZ/xRnceLmB1Rqho3rG8jWm3UMcPDUA9IzKYeeaizbve4GAy
 60spFQS0IcRoBp2hVkFdVxqz9gpIDarnf3UZap/XFsdwABzLNhehgvjI2zSSoRUu5LnO
 XzTdVTQdMRYlbtL/C2a1XptwY94r7vDS0iVZCIXb+JzwVyb6I/6l6vqewtCYvKfaP2dp
 9758w5Yng9/Hm2yXTSpqOuvJjNIF8qT5kFDmElJRRCq6rdy96+7fPxyifr3I4SnJPHjW
 eESS+GTP7vTWBzVloRtCtrKbhucC5jlrCQXVnrC/If6d/zSQMyO++Cu/K73ETjqarJ3g +w==
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jndrknp9a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Sep 2022 00:40:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mc1D1P6vOOr5qIk+P42t51e2tEdbPsbrd3xO6KEwmfhgo6CKScCiFh4BQxzwvVFDLtiuzJfGZh8iWo1bLZpxCLU+jKEsjRBw8gTc2ssseDNo5KIEwEbfV2p4mPiDvDpFOzjWcvTHKCSteJnct4i4qn6ulhyMyt54NM152WLS3cY2GhMMo/n1EH1ZMxnC0T0L/SGhERyHjqFc0RFiVgnuu6SxCDem9dVL4Tq5ttqwXVhNM8dryHMqgzPkBOm0NeN+hFgfOjglNxnDtBHMFKlVDCxecHDNspqHRnPoJD9PoJq7F87+Sy1XEfovJgWijpeN93GzCW6PLzG7MeTBIPLhyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A3xPgmqYBKSCQONCLI5LaTvsPSABUtriCsdyILUERXg=;
 b=g0Z7XLsy7GINQQNet+lFFyUwpSPEnFmhRMHa9hhwT+f6UFoabmFPGZ0tgGm0FB8B7sWvMvlEGbLKGRl43tkBPxfvj3WtPYt0+JKS1fK13Sff0TtN2D255ufu5XHYJxAfNAgCZ2+VjxbXQAwpd1VcJgdnBErPQIqpAKeXKWW2Dk+ttn/Iu6wicHqNsdLy2oVG3Qgl6Yp0rZnVWQ/d9t17zM4kjEmRoQUaW8oYGEWTRe38ynUJb5Gh8zmU9QqM+DYLypnZKkCfugAw8tgM6dp3hzL/mAv/BNBfWBO5LOv640cQBQpSl/7FRmFSMV1rnUfnK9BqD5WlPRcOreBCw4Tj2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MW4PR11MB7054.namprd11.prod.outlook.com (2603:10b6:303:219::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.20; Sat, 24 Sep
 2022 07:40:09 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8957:e965:a52:2366]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8957:e965:a52:2366%3]) with mapi id 15.20.5654.022; Sat, 24 Sep 2022
 07:40:09 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH] frr: Security fix CVE-2022-37035
Date: Sat, 24 Sep 2022 15:39:57 +0800
Message-Id: <20220924073957.2244964-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::14)
 To CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|MW4PR11MB7054:EE_
X-MS-Office365-Filtering-Correlation-Id: 7189d161-417a-4cbc-8a0f-08da9e00019e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0osD68F7ToZEJNVLWgMfHlpWpVQurv9dcUsmE8fGBhAuIqqGgT4W+luhE8aaRLrFQJHViMtkTxLphCW5EBo9CuUgUc7irCKnbKWGaP6R4kBU8gptdxmJm8JvZXDCEg1uHEzct21JvtE1hvGZFDKnwm78BdpQWYGpwMHEjz4doATbyT7r73kX/17G1Y2Ex+zj3iz1JfTUpMlUgXmcnFhmxC8CA5Vf3Dlugup3N4Ax2h45FOM4JubeO/VYdRkQM8kRqkIFWj+x77gGRy2KisnVfN7aLvXvQ4VIOrVxr4CLjYG6Ub2064y3BRxSf/K9OC+UUF5NtFJ5s+L+m1FTsp+rPRO4Ce/DoMCjjKpFv3XYf9YZykL6eNrlUJuq2kgTEMezRiFgf8FdFEC2bNCsa3u9ADoDshd+ilZ6zDpg2ogIftREy5Q9ouubiO9jaAXS19qrbgOSegLOf3PZTdlDx7brzXE5kkX8cnR9y6/pHIaH2b31jpcVWbLjBglaHviWIDPhD8IHl6k7moRq8CC/wqzVWXoMPgoAWsXg7KQ8uYh8gzYb5Z2PubKAaicOafcTicXi874wsCn1Ed6rAb6+dhTvysRpDCuCgF1xQQnP7saPTqKWumdL72/opUtRkSWpmTgMrTC7pyuzdCpuDB0op3WgfAMFhCC0YsbruAcMVVaHPBROr0TbIhHbzAbRyCvfOpK1vba1ueK7pZ2YQRhe4py9ugEaDd1ZDmmnWqree2GqWMV91a6hBfU8Y5Ts/YjTgNCvUu6ztMwjZopzuqFX8PZIow0s4msDCbFpqFNkpZjk0j1H1XbNFcXdcUfqRzHpE/gflJ0He76ahcqPxUSNYlc61A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(39850400004)(136003)(376002)(396003)(451199015)(316002)(1076003)(186003)(6916009)(83380400001)(966005)(66946007)(8936002)(38350700002)(52116002)(44832011)(6506007)(86362001)(6512007)(26005)(38100700002)(478600001)(2616005)(6486002)(6666004)(2906002)(41300700001)(36756003)(8676002)(15650500001)(5660300002)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+OKWfSm8FUq97+TQBBab5+vRVw6ZrdoWhq8Ma5FT5R7Pgx8TKnMPfeX2zcyi?=
 =?us-ascii?Q?/OJcdXS+p4fpNBS6znqmI1MCvvYxwgL4RAcuMEN4wyGX+V4oEROxtRbYpLq5?=
 =?us-ascii?Q?QDDWMHrEn7C+Amvu/zFS2AZ9GN+TK2AQOgZuvvEdvHOHmwab3c8BfAS/tP4D?=
 =?us-ascii?Q?osSMW4snVvaWl6j7K5TUQY0gYm/noxL6/65gtIK8xbPfoQQf8nyV4zvGSMId?=
 =?us-ascii?Q?7XYEwPKTDwqIFEbUG9RS0USuVa7szBPuPDjgjzOYBTn6CKsrfxeQaBd+Z2uk?=
 =?us-ascii?Q?IUW0X44MIF1OPeTyJyRYFchzLqTbFR/n49oE5A/Jf85+D29qxL2s99tO8WzN?=
 =?us-ascii?Q?b8ySObeQBfXlRuOL2B+GhMIOkhmuaFAN0DP/vqyKFTnUOG2zKaZBX5grqjQR?=
 =?us-ascii?Q?1RL7i9ASoqxUWO5M29bVT9qOyCF6ISmyiprsCVzQfc1nIBjX2t/h4V3Actbw?=
 =?us-ascii?Q?gAsEjP0Xndsgo1sRczL3/8BJGe8qe5pIXCoiDEsP7oBUzEfxq9bIKxf/nNxD?=
 =?us-ascii?Q?kugFypuzEc+3F67BHJgkW6usnghG09GGR5yyAqEW61M4TOAO3kcoYOS8OKil?=
 =?us-ascii?Q?cLKxaq5JwqXMw2Qdt/sgpcSVMYUpBcIhZEawoeAi1WAALJB4CRkY/6tb9vXL?=
 =?us-ascii?Q?x8+84BSHxJ4MQWf3FQsNYAWsNcbj3Kt5AT66U0uFeUqsr8TbPsWFOolEdh2t?=
 =?us-ascii?Q?3bINnL009rYtDG3TmkuWWi05/3eK/V8BH2TrUdMxpKDkV/sBxGBWa9VY8LVf?=
 =?us-ascii?Q?j3zXJhaKOkHRJt9VXAYZJtV/5lX2g8XNPkTFQT4KOzbHCTVIpaetSGrMMAhS?=
 =?us-ascii?Q?EK+bhU/IfSMa+9eoQx5ZzZyVHVWQzJBYqJKcqlBcaDuVwQQedWI1fjdTN5ez?=
 =?us-ascii?Q?xoQyyjNlnZ7c1TwE8i6L/aWNnnbUsqwseKb86pMnKEGsBajn9N/5TZp1y6FX?=
 =?us-ascii?Q?qeVLZWSsqQQSndtJ1AN8dkWuSy1odR328qUYbQJpgn+bejFEblyNxmXTpwyO?=
 =?us-ascii?Q?s+q7NICNYsS5ob1c62GyJgXUYvZO8e2EVJLG+zNRw+NNVdH3BmsSLeikm8g+?=
 =?us-ascii?Q?nC50tcafZcMKpXYVAFi1q9T32TtHNyFipAyUxwaZbPe2yguNYRTqv/rfagfe?=
 =?us-ascii?Q?knpEzCJHN3IwGKXuc5w5ElDuL7qqA/s9OMLsBVcbrq44srkC/rr6FlXDehmp?=
 =?us-ascii?Q?8OVv3LmHKx0MbZQ2NzQRkw7kkZnQZzskcgfvhM5PHZG37j74kfm4bL4mCTe/?=
 =?us-ascii?Q?Eda0j0xFS7MF0YPx6yV/d753yvTygDTxvHyEQFVzsy9V/MMqxzu/BISIkdG5?=
 =?us-ascii?Q?rr26jCc1dh/XThee6cFhYI1JuZqoW6izrpSmIMMB+lS4VQektRm5QBd9NP+W?=
 =?us-ascii?Q?uBx4stINoQNWsOhSKuukyxxyTbDSAmCwIS0mOc9P4+8eUWKJUEzEPfcqDILc?=
 =?us-ascii?Q?fV2CARlBq1I9bekVdFJTj11rAra6shXTL0HTW5QzQOi1bqTi9Sm+Vwk4VZCS?=
 =?us-ascii?Q?6UQhagyBQIG5PyLemZpsGVe6AwJWf43S3DEo5wsRIfK3kYai7r8qzqb4taAp?=
 =?us-ascii?Q?o5f9At83Aubxhr9aMoz99tRkXQuR1C9YoE3JU4vl?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7189d161-417a-4cbc-8a0f-08da9e00019e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2022 07:40:09.2576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Pkw3pld1zdNgMtJit7KzYaMyiKRalAQMyVlyorVkNO/p6xyWYsv1X77JKywo5/0VGPAc280ak05SV5DdA9oxog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7054
X-Proofpoint-GUID: -sTYpm6oA3OMMiy71AoTJCBMNF-PiaIx
X-Proofpoint-ORIG-GUID: -sTYpm6oA3OMMiy71AoTJCBMNF-PiaIx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-24_03,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 mlxlogscore=755 priorityscore=1501 adultscore=0 spamscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209240053
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Sep 2022 07:40:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98945

CVE-2022-37035:
An issue was discovered in bgpd in FRRouting (FRR) 8.3. In
bgp_notify_send_with_data() and bgp_process_packet() in bgp_packet.c,
there is a possible use-after-free due to a race condition. This could
lead to Remote Code Execution or Information Disclosure by sending
crafted BGP packets. User interaction is not needed for exploitation.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2022-37035

Patch from:
https://github.com/FRRouting/frr/commit/71ca5b09bc71e8cbe38177cf41e83fe164e52eee

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../frr/frr/CVE-2022-37035.patch              | 151 ++++++++++++++++++
 .../recipes-protocols/frr/frr_8.2.2.bb        |   1 +
 2 files changed, 152 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2022-37035.patch

diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2022-37035.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2022-37035.patch
new file mode 100644
index 000000000..3d18d0b90
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/CVE-2022-37035.patch
@@ -0,0 +1,151 @@
+From db24300d56ad5831d9f6e4545ff2999b99e71bac Mon Sep 17 00:00:00 2001
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
+index 9b5a31f28..c736d02db 100644
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
+index 7c92a8d9e..a5ce5a527 100644
+--- a/bgpd/bgp_packet.c
++++ b/bgpd/bgp_packet.c
+@@ -736,8 +736,9 @@ static void bgp_write_notify(struct peer *peer)
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
+ 
+@@ -769,8 +770,11 @@ void bgp_notify_send_with_data(struct peer *peer, uint8_t code,
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
+@@ -853,7 +857,27 @@ void bgp_notify_send_with_data(struct peer *peer, uint8_t code,
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
+index 280d3ec17..898f88ff5 100644
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
diff --git a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
index 96be49b53..62f548f84 100644
--- a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
+++ b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING-LGPLv2.1;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/8.2 \
+           file://CVE-2022-37035.patch \
            file://frr.pam \
 	      "
 
-- 
2.25.1


