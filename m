Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F06B6C433EF
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 02:32:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.5801.1648780362735517848
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 19:32:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=NNFwCn1o;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=1090099bd9=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 2312WeN2013162
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 19:32:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=vKmDdsZXzDMAOKOdFvQoarv+jo3iVwZG6bFfn6gnrtQ=;
 b=NNFwCn1o+kDduZOY66HlfnF8/T1c5IDKyUXVgZ5hkSrWfGu8IJAFV9FhvKkeBpQHJn1Q
 n8L9ZUpPPEjNt/mnp7CHu0bpttYm0FqIvfPynlKCiEi+S5IspZYe2a09NfHN9iflmLGu
 zJj6b7nPaeNjaCa56MdOSf7k1p05W/XX832HQnAXLwDXIKMX0mMDCjKKIRFvggsbEZED
 5CZzErMVwR+5ZQMjwo+W9ycTkYRy4ywPJ+kJXc6RcqnF8Ck5UNXWmlZlu1dT/YlmE5Gq
 T32483JOSUOtxnHnzzF56o+yt1BMy2QpX0vyAJ09j9+y2Z7xbV/ZA4cr6ImaZlW7cg9m cw==
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2044.outbound.protection.outlook.com [104.47.56.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3f22bjd2jg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 19:32:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Luu8xY+QCV9WnH74JK39inngR64pxZTBGN5DJ7DgupbjSvjVtQKr5IpbB18OBVO6jMlX1dSAbRQWvJTiltS5eINpNh+6RSQZRf7d5LxfTZ3llIiNYn1r3bdS6Ou2xKo/qj/aJL9yyStdE8XAwguOESxo5uMAIeX4Iqz7HQr624D++PnZrqaHzR+lsAs37vjNWI/Q7qbKSpmCbnWdMTR+cXLWejVGjDeNeIzYJBqCvp/uXr8lGvOy+ZrFV5tdrl4JZoPP5j2eUgKccT9L6ma4R9OZT3PtuFNu7Pb1+XhlGxG6V2ilYu1UnOoT0M0Avi1EzCSzK6IJvwHZ++6BurJ6sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vKmDdsZXzDMAOKOdFvQoarv+jo3iVwZG6bFfn6gnrtQ=;
 b=nWrhP0KdZgVI6puHt+C9+NYqiI0pngWRw0qLwx2Tm0KXi50zXXb2fvWmbWogjwgVlGqpqonUTWAtWZWnmxyxtBcV8sGn1yD1dcYFXMTXR4NCyBLX4h+a87gW+86PqMRz0RscNpF9TSxQbOUpUiDQyRNZjv0tMlQTtZjaoQLjc2Cgeo2VF51khoO5owapiz31TBABRbZRobekvsWpPvbQwpYk5smjbTMCB7OO9GXvs4+rkKmgnshTCPs3of2i+66Ce+g/gQVfAP5NbN/YTHDwUqCNEYoP3foKGtO4RAAyFAlAb8cYSY55cTpwvcRClvI3w4C5pvggT/g43847Kzdzng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by SJ0PR11MB5918.namprd11.prod.outlook.com (2603:10b6:a03:42c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.23; Fri, 1 Apr
 2022 02:32:38 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8ec:d095:e49b:d875]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8ec:d095:e49b:d875%9]) with mapi id 15.20.5123.025; Fri, 1 Apr 2022
 02:32:38 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] libnetfilter-conntrack: upgrade 1.0.8 ->
 1.0.9
Date: Fri,  1 Apr 2022 10:32:25 +0800
Message-Id: <20220401023225.2226925-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR06CA0011.apcprd06.prod.outlook.com
 (2603:1096:202:2e::23) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a023087-ec0d-4091-344d-08da1387e38b
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5918:EE_
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB5918D5C5293709D4DCA19619F9E09@SJ0PR11MB5918.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0kJFZ8VZ9TiBx/H04ttoDcBqZEssB9qUZUPAWCYN6jL2JBlFIBi3bPiNKiCbdT1noMHQ5ET0dhywToeMln2yyBYLNG3b2m4eKBGdL80GMRjtFpNLeOXbdE2Wme6364+o2TNrjUY6Q2PeMUErcMko/ycl/9UzNeZo/zbHH0V8+5FaMhD2xT9v1sJkj1GIijtM4h5LfTAXnXl1C+zAvYTxPTf8zsZrmmu0OJj+9yFJZMwOUQE7X3o4bgvHCEMSxRZiXFF6329FfhT7rk/7BZ0ZdTHi2wuPtOO85dPqEcokpwFXweiC5SLOPIXT0K5vKsFOy1i3AIOd2FQidlNu1izXrEaup4706gYdsouqD4CAE7/jNQyTbjsgPNWcBnBFJ3PkIWYyy+xkbTS6f7Ov/c8xo316grKquOyZpKBH+3umjWm65os7SQhKcbf57ikBKjyAAWdDWDuRir5s96Zu+X9PNi2gfLZKmg6LOGBZ8leCrfgSpYWravGsWI3DwU+ynmnK+Qu9jqles1SoEcTXW0X6YjipwyLolzPCpmYC4u2YBa5cNtI0xMsOhH1esfZYXJG6KZVHIO6UB9rC8GqrGmoYnWdLGx3oYoavHIBZ2MlPHF6MQrTzOjTQymlnR2/vts9rLlG+GrUZdz8oMYVBXw4/IONsJAUqjH/yMkKARBLdzb/bXB+/jm793k9B7MBkXBrBmUp3/HAzJKsrLTCYMI7rgG+QZBbD4b6cc976wgrRzYQmVK6+lugPXlH5lIQuVQ//8GTUoMlpxkwJXH9oljXd5N6iih4I8jdUqrrz+g5ehdKsakl2qi7qeh76IV9R4GP4bMotxBxGkasAgIWyBTwttg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6916009)(38100700002)(6666004)(38350700002)(66946007)(36756003)(26005)(186003)(83380400001)(66556008)(1076003)(66476007)(8676002)(8936002)(2906002)(316002)(508600001)(6506007)(86362001)(2616005)(5660300002)(6486002)(44832011)(52116002)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?o+1ahxsO0lLWRfZ6ID9NSjfblRYybNcp+1PJ48EKJfn15I9ZtEZEJi2xZK6a?=
 =?us-ascii?Q?FhJKdBLRHI/tV/By6TzLcyC4UDxRjN6RUIrXj65IH50a774bZE0FYU4/8c20?=
 =?us-ascii?Q?Y9fsez8V25RnKsy/NW/0nvXH8VOUecg4Q+cmt6QVSrk09knFjI0XjFIWA86e?=
 =?us-ascii?Q?Vtts3r/C7FSRx4iLZhPclLRIpATAzUJxgV2v9zGtj14hl3sR0FlZua566tjJ?=
 =?us-ascii?Q?MDOwRK1ZdpZQnCkURb+DHTPUct/Zo1HONl9R2BlJBjEOsjYbhET+OhCH340W?=
 =?us-ascii?Q?9EUlzev0BKzYBTsR/BujNIhv/XMsyd2r+Ui0pZyswsS3PYM/xQbut646M1ep?=
 =?us-ascii?Q?2KlO2VtbdxG5tMXYnejvkpSLjV9T5HmHqsKTKXIcmQGEG5j97N3nGyeb+72s?=
 =?us-ascii?Q?vRBeTK4c1GvRQFGeB5IgegHFHgaYoflWGvtu6D0ziwRBXOEk7X1EYu48bgE2?=
 =?us-ascii?Q?pASKQmmqkHm//la3xH7ISO2y2qSSNdr5sx5j7u/CWlowaEgJcPUjm5LQrvQx?=
 =?us-ascii?Q?6yHUpSKKJe8WEhVPbnid8Qgwlcg0Qk9BP3VKzleODBv+WHbjs8eGxdYAhYwR?=
 =?us-ascii?Q?u+UKMUdkNLn60rR3YGwaEBmYdwGXQw9iz/PVtclvXuIe3DDXsQtir+i8LVLp?=
 =?us-ascii?Q?oX6K8JPN3PmbmIUjD5TiY/HwZsRs8scv+8UzHoYVV0OgMevFX+hsI+08WJdy?=
 =?us-ascii?Q?XQi5/9kPauC7fPkq5U2Zv2EhQl4q/QJxqzN3CKJEQtZdewx5gzDLuaz1x580?=
 =?us-ascii?Q?jpxG+jdwTOJ00MZlLoObf2eg1GkjJEGklFSqq/KXwfaRvz7atONODyqDXTzR?=
 =?us-ascii?Q?eILagWuw/eI5dHtqvXM+0+puHDn9iJ5vP/UBfBPdMeVObknIkMNNat4JES/K?=
 =?us-ascii?Q?pHedmyU14aV6FNjbpJXr+p3DDxdT1KU2DPcoN9NNC0UHv3VURBey+vjS60Y0?=
 =?us-ascii?Q?ZBye3K7/azWH60eTIedJIVjvT84nNRe4Gj0DYAknXxEQcDvk53VUNrproO9Y?=
 =?us-ascii?Q?F1tc1hr1DuLS9Bqj2LaferDW6qTciAGhbBpk4BdJrJPhFNPGBlrVyPf306Oc?=
 =?us-ascii?Q?0O22I0b3iJiUVN8CKiHpL9wKR8X7l+gmYFmo+Ewujp/WrKFE8HBe0byxCgHu?=
 =?us-ascii?Q?ZxivKvXjseknX/6hhendqZ9WorXpv3vt4XOc2aO2jCvk4lQ95i8mznTrTIT2?=
 =?us-ascii?Q?QWC+FOYzAuLFQ/jy3+1NMXBJIkT8fcSZWtv6+j0xt6s7yPhx0821h91AgZjl?=
 =?us-ascii?Q?lLP6TNNo9BJy7SjAGdd3pRRdKxbH7RIKtRs5q+/PMW9Mc/wWZ4xgtZ1atc/h?=
 =?us-ascii?Q?Px61ABH/EmSdxh/OpycnT+WC+gZFbf7FaWwKtorc7xNP1Mr50WQVz5pCcxgm?=
 =?us-ascii?Q?fZ1AT/ECpibgZ5OjdtHHGc7RePBMHMC6sfm6Cmk5ZJ3bF+9iUDYI8y17Q87H?=
 =?us-ascii?Q?1DlbM35O/U6cGuB8CxyMqcja6cFPV0TFq8by3Y0zdll6euGb/pxuGIBAlDNs?=
 =?us-ascii?Q?dJjRHpxuMr0/jYqhmfkecJNlQv1qH19T/YPR6ZnQ7jOSYpHbX+VlzKQvEHte?=
 =?us-ascii?Q?g0Y3QNA7iLswZpW0KFiRixt9q4XgHMhS8jalTnzObr5gBqEmU3aQHeOH6FGh?=
 =?us-ascii?Q?Xb7IbD0YnYGT2WSJH3t0/ekeAZ6dUARWbND9ApDjAPxL4UsAyFTKMq5Z1x3G?=
 =?us-ascii?Q?VepeuZkUL5LhCHBvaKtE6Z24TaseVov7XRn5TSX7IBgp3JdQpUo3O9B6kOq8?=
 =?us-ascii?Q?mddqmPjG+w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9a023087-ec0d-4091-344d-08da1387e38b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 02:32:38.6191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 i7Wo2sFVvso08g/PyoG+2HD9FqC2SpVkOrbjWOqqbYmqN4+KHxkSWuXrsezp64FVRf8tbmeQNB7O5NjGHXx+dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5918
X-Proofpoint-ORIG-GUID: M75KVTZmnh5IenWeiMfYTS6CV1C1DK9v
X-Proofpoint-GUID: M75KVTZmnh5IenWeiMfYTS6CV1C1DK9v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-31_06,2022-03-31_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 mlxlogscore=568 bulkscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204010007
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Apr 2022 02:32:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96311

Backport a patch to fix musl build.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...-fix-build-with-kernel-5.15-and-musl.patch | 61 +++++++++++++++++++
 ...0.8.bb => libnetfilter-conntrack_1.0.9.bb} |  9 ++-
 2 files changed, 67 insertions(+), 3 deletions(-)
 create mode 100644 meta-networking/recipes-filter/libnetfilter/files/0001-conntrack-fix-build-with-kernel-5.15-and-musl.patch
 rename meta-networking/recipes-filter/libnetfilter/{libnetfilter-conntrack_1.0.8.bb => libnetfilter-conntrack_1.0.9.bb} (66%)

diff --git a/meta-networking/recipes-filter/libnetfilter/files/0001-conntrack-fix-build-with-kernel-5.15-and-musl.patch b/meta-networking/recipes-filter/libnetfilter/files/0001-conntrack-fix-build-with-kernel-5.15-and-musl.patch
new file mode 100644
index 000000000..a02940af3
--- /dev/null
+++ b/meta-networking/recipes-filter/libnetfilter/files/0001-conntrack-fix-build-with-kernel-5.15-and-musl.patch
@@ -0,0 +1,61 @@
+From 21ee35dde73aec5eba35290587d479218c6dd824 Mon Sep 17 00:00:00 2001
+From: Robert Marko <robimarko@gmail.com>
+Date: Thu, 24 Feb 2022 15:01:11 +0100
+Subject: [PATCH] conntrack: fix build with kernel 5.15 and musl
+
+Currently, with kernel 5.15 headers and musl building is failing with
+redefinition errors due to a conflict between the kernel and musl headers.
+
+Musl is able to suppres the conflicting kernel header definitions if they
+are included after the standard libc ones, however since ICMP definitions
+were moved into a separate internal header to avoid duplication this has
+stopped working and is breaking the builds.
+
+It seems that the issue is that <netinet/in.h> which contains the UAPI
+suppression defines is included in the internal.h header and not in the
+proto.h which actually includes the kernel ICMP headers and thus UAPI
+supression defines are not present.
+
+Solve this by moving the <netinet/in.h> include before the ICMP kernel
+includes in the proto.h
+
+Fixes: bc1cb4b11403 ("conntrack: Move icmp request>reply type mapping to common file")
+Signed-off-by: Robert Marko <robimarko@gmail.com>
+Signed-off-by: Florian Westphal <fw@strlen.de>
+
+Upstream-Status: Backport
+[https://git.netfilter.org/libnetfilter_conntrack/commit/?id=21ee35dde73aec5eba35290587d479218c6dd824]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ include/internal/internal.h | 1 -
+ include/internal/proto.h    | 1 +
+ 2 files changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/internal/internal.h b/include/internal/internal.h
+index 2ef8a90..7cd7c44 100644
+--- a/include/internal/internal.h
++++ b/include/internal/internal.h
+@@ -14,7 +14,6 @@
+ #include <arpa/inet.h>
+ #include <time.h>
+ #include <errno.h>
+-#include <netinet/in.h>
+ 
+ #include <libnfnetlink/libnfnetlink.h>
+ #include <libnetfilter_conntrack/libnetfilter_conntrack.h>
+diff --git a/include/internal/proto.h b/include/internal/proto.h
+index 40e7bfe..60a5f4e 100644
+--- a/include/internal/proto.h
++++ b/include/internal/proto.h
+@@ -2,6 +2,7 @@
+ #define _NFCT_PROTO_H_
+ 
+ #include <stdint.h>
++#include <netinet/in.h>
+ #include <linux/icmp.h>
+ #include <linux/icmpv6.h>
+ 
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.8.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.9.bb
similarity index 66%
rename from meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.8.bb
rename to meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.9.bb
index 180f07603..abec84b25 100644
--- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.8.bb
+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.9.bb
@@ -6,9 +6,12 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 DEPENDS = "libnfnetlink libmnl"
 
-SRC_URI = "https://www.netfilter.org/projects/libnetfilter_conntrack/files/libnetfilter_conntrack-${PV}.tar.bz2"
-SRC_URI[md5sum] = "3121b55acf97322db830da75d8407cba"
-SRC_URI[sha256sum] = "0cd13be008923528687af6c6b860f35392d49251c04ee0648282d36b1faec1cf"
+SRC_URI = "https://www.netfilter.org/projects/libnetfilter_conntrack/files/libnetfilter_conntrack-${PV}.tar.bz2 \
+           file://0001-conntrack-fix-build-with-kernel-5.15-and-musl.patch \
+          "
+
+SRC_URI[md5sum] = "596c722733cdf30f24d4418f34f999d9"
+SRC_URI[sha256sum] = "67bd9df49fe34e8b82144f6dfb93b320f384a8ea59727e92ff8d18b5f4b579a8"
 
 S = "${WORKDIR}/libnetfilter_conntrack-${PV}"
 
-- 
2.25.1


