Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08497C4332F
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 07:30:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.3651.1665387024238009406
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 00:30:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=V4YO/cgA;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=728262b6db=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id
 29A5tpUs021573
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 07:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=jEuZwXrKkrtmT7egrVwkZcwmumiKq6YublHXX+iY9o0=;
 b=V4YO/cgACTu3aPyD0YWH5aPSB7/STV3XME6mGryHVq5ctdTK1GwwMH6FR5PfxaxANff/
 PKsFTxQqf5bvwCjsfWzaKwtXJJaobzbQ3G+d9fsprc9wGFlPEPjFj1sAVdyMKKD3IoDx
 CpLKinpqoD3X0NU8WcX/l60JMUKIkx/7wR0qe6Q3UVwrL4zggDusdChw3k/46pOPCKrv
 0L/ccsgC5nOPuf5exx+678B+DnakveolfA5FB6bEU8cL5EQmZA9b0FU//3nyRkNIyEPJ
 EjvPlrZAgF4XmA+wiG2DZCwuaVeW7JsWVdQFBVtOFl99CrZ5KBUdKfKLIwTDumf+rrgn TQ==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k2ybs1ap8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 07:30:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cDlUN6Nc4IviCBlyJxgRoADKNn2T5sWV+C073gXRpAOWH0BzarD/WVLSb84nhcmOG7syosz6NeYW+wErV8FFvwyb3E95JzN3tkEAeD1EpaItkkhfHA1jN6qLu3AB1rfW1uP9Uw94u4wop+TNVPpR8rzpKx/eYghvN4V+xiSg7Syyn5SkyQIOIfE+wQuW5c4GogA5qlfizwISqNwOBerOqvxKEfi2KqOpZzPMliok3/cBcWSDQS3v5K/9EBCAoMBoN6KW2cV1PK/CWOxXRJOZE/H1wtmJbWjLWgdZ2uirU+pimamhYVrDqrlJsaEhSpE9qnOjCWaJNwzOaSIQd8HHoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jEuZwXrKkrtmT7egrVwkZcwmumiKq6YublHXX+iY9o0=;
 b=agWTk4ynGmtteA1Arh7gcw+JYt3NpM65M60NTPl+PvYmHf0eU1FBJmyxFyzSdBZRrqCaqJJwHfWrvEAWCVSUW06KcgY1oATBPxlXD7usRgvvJSSHhGmAeur9hgKtQsSCnn5tMmA3xsRAeXD+aPGGzPCx0iUFkLreGGNqAx8kiQspIjGhfhH9l6nhWmpqhTM5CAZs6K+dvWDSFaWqf/+lkZuF1KKQdqs5EIZ1da5O/KbYLoIk7fQ9Iru6W/hYyoi5xZm2VD+wz84Sjl3dee9W3kY5gVjWLCpXPHM1gi2gFkg/5m4AGKornpvLuSBEhq5UjGcUDzKQDJPacOjm93e0gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.32; Mon, 10 Oct
 2022 07:30:21 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::6ad2:95fb:73d5:35ae]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::6ad2:95fb:73d5:35ae%7]) with mapi id 15.20.5709.015; Mon, 10 Oct 2022
 07:30:21 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 1/2] open-vm-tools: Security fix
 CVE-2022-31676
Date: Mon, 10 Oct 2022 15:30:07 +0800
Message-Id: <20221010073008.192330-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0034.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::21)
 To CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|MW4PR11MB5824:EE_
X-MS-Office365-Filtering-Correlation-Id: e28b1c65-0321-42a0-59fa-08daaa9149a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+0hakpa771lgOPKeb1HM91+4h5JxPXqgXogGd6b8MqNrN3p+Gj7fhOquQVCWtuJYgKziGMAgkuL9vnLBCpH9oI/84TKv/vcLwESBGt2IZbxS5FRXUjgSFabk8OSnA61t/naWJJPMJMcdWiKhEeJjnOWbIGHbAYPemXs4a0J4wlTjqHWeHkT/uZFjn1G+jFNl1Y8ybfAW4mOMIql0BYfuD9aMc3ISbdZV41T+3vBlBpDM99LDe4NOz8gFldEU4pVHIpB2M7C/aH705Ynawwuu7q/IHsUHG43jFTvqb+NssGXEm9qSsZQduIcPAk9OQik1iuZVCP+B7pInG6Bv8NKFkeo8wYtXgWe4DROwVgt+4QRPMB1qgI64Bf1tbsilvo9QolJgJMQ+J1SVJpS0RDi8KPVFIRMTO7sBlwlAZ/YvUmnF2hVxoNwJXJLc/ANDmrclK5swrh+DLa4Y/HKiY3zU41v3g/9dbkap/FHtSGrTJ6LwmG1FEySaVpQBHSD2BcSQTG8W2sWCAjJ3PArZhEwhIyFcezB+zFH9HOPuYVp6PqG2Do+Vs/h+wA6snBKUriudYLBxhhYFYKY2AHAN52kjyCyDK/JdxEveD2RfAZ2XIn8xHbuWIdlGDponUi618DR6dNrhaWb0RpLSgzb3InfaealLDIhgQayiJBXj9DPUtXzLbmjvYfa+/2xsFj5oFPXJ7NjgxN8j6QeG/+k1GSi1vecx7o66zdrHlfstERwv1XecGEcTkpopcnNUO9Gh9FlSBNejx2lBp5DCWuJJDghiSrIIklR+nvPqTFaf2XBSB42pDpzyob12O3oulKOiZhvv9xhwHX4Lr1iVIfZ8sg5yLoKg1UIBkf8XCCY1jFQlJUE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39850400004)(136003)(366004)(346002)(376002)(451199015)(83380400001)(8676002)(66556008)(66476007)(8936002)(26005)(2906002)(36756003)(6666004)(66946007)(6916009)(2616005)(6512007)(41300700001)(478600001)(186003)(1076003)(44832011)(6506007)(6486002)(86362001)(38350700002)(38100700002)(316002)(52116002)(5660300002)(966005)(2004002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ImZQZLGCP2Ri2110z0voveZm2VR2C7YJllEmt1NYy76B6gczoqlzQebHhG/d?=
 =?us-ascii?Q?2qQn8+ojbJvfGQnypNF4mvUSkekLhXl1su82sxTc+f1xrWuLcDfweeuDvbHC?=
 =?us-ascii?Q?3qSg9OvRhW5yZ4/xWd2NPLHMv/k3FQjSA6YIvNxUhiJ7WxVtmsUikyQf2xSG?=
 =?us-ascii?Q?m0SqPTo+QdcsGhOXPQEuxrKob2ZD2zFvNQjql+xXqZ1VyxacdeVW5N0I6Ktb?=
 =?us-ascii?Q?Tzf5mnSLULUdOZS4vv6ZTj5MKHVJP4GDolD9JVxc8wkC/wn6cyfwIYk+NG5l?=
 =?us-ascii?Q?yc0l8b6za+AZlTRpTEtw4szqApxnsYK93E9s2kltOc+epTR3xKA/MKhTapbr?=
 =?us-ascii?Q?X1rQ1EysUmCHks4ar9Y86YUxVIfocEbirG34Icw+VZsw4flnZmXr5PDUyf+t?=
 =?us-ascii?Q?y2Wq9qfpBizNXfhDcIpY0p8zL9O1nqAGw8KZnWsxXM6+mI253l5w935HiOoJ?=
 =?us-ascii?Q?CLfhngBFgDMJ0nYDeqUkPSfJfMe40RDZk7H4/JDYHkNw17LmQEPeDJ4GoeVT?=
 =?us-ascii?Q?pgv/SmKhKXW6WWQVI7QsSev1RPpMYO8laTl8uqesCoB1S+y2LWpos+juXJxl?=
 =?us-ascii?Q?uYCvBuRJ0+IV5m9Olhy2VyPkjmucaw10rJWl8Hg77QX7vCiz9ZW6P2iza4tA?=
 =?us-ascii?Q?V59I+hdVg9v5Ca80t41PgPRA695xsQdUz/J3qXg3i/BoLgOkDnjtE0XYjtpu?=
 =?us-ascii?Q?NXmOy4qM1SrJi2kmZZ+IIo61QXEFyAJ+XxrJO8K2Zt4ayJ1z0sm3OwPx/Wlh?=
 =?us-ascii?Q?phjkIb4zt8T0TUQrPe/+XpScld88UO0HPBzC7GnCKSMYv6quPAfoOAOeuypr?=
 =?us-ascii?Q?gCRsl7Po9AxukQ70GH2biw6JvofxGPPsrQUNXA7m5tUuzpcToXqiGrXzo9NE?=
 =?us-ascii?Q?dY2KRh9Y8QlT0ImAqbjLw4TW4BitT9vq+HBXlL2Ycfuwf8+oVEIWV9Ne3QAz?=
 =?us-ascii?Q?9P1A8w6hX+ktrzw4ZvQuMoMzoUwmRuHG0HIGFZ2tHd8k5Y+QNm9+xSyPRlhX?=
 =?us-ascii?Q?0/yTm61fTHKTNzx52BLOr8/twPCbdp43vk1QXA4EUCo/UVLvI8YGuuX5P+VM?=
 =?us-ascii?Q?ECxImJEhWmSjY1xgQV1vx+ZEjiETnccDQaitx5V64OQZJbwLZ55DKg8zA3oW?=
 =?us-ascii?Q?l0CrhKGNpUJfpCjFYyGaUkBxlKesqqcn89CG/EZKtfgxd4unfmvSjZy8msMW?=
 =?us-ascii?Q?ZSi7Gv5B/1VMrDJRIm8P8RY6tgL3QK5Pi1qR2PAA5KQ/cnLOQnjlDY6VcarH?=
 =?us-ascii?Q?2th6fY3U/qwcsF/2YeXQ7HetDuKeaL+Z7mc1qq1ri2CrjUu6sOqzQKx1stLa?=
 =?us-ascii?Q?micHFmfuoIM6b5QyTpN/xZXQWlNHndY/rBHb6LkEX9pblainMZcmb6fxcY2A?=
 =?us-ascii?Q?npIzBVrlX5CSutzxQLHAgCvQ4oy5yiU5t391W81GffHMvCed0kDKt7p2AasQ?=
 =?us-ascii?Q?xRUhWDsGLI0ljey+rr92hnXCc+FeDi+7GFAgMrAeaxNfKQPm+sdjm+d+D7in?=
 =?us-ascii?Q?AGJfaBavLeZeOB2REOwJFyN5rYHiHrCtVBgz3QBwYhyYnqM6M9PrPgOL7qZn?=
 =?us-ascii?Q?0qa7Gmi3tcRQdGKka9uAt1syHvH5tlj24c1ebrJ4?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e28b1c65-0321-42a0-59fa-08daaa9149a1
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2022 07:30:21.0355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ikvL7PvOzbuTFI3t4LrACIslAs63cg4u4obw1iD9VS98Kxp1qlD2F5ZB7qNaKXZX02TjcQE6AKC86aXiU4Ug1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5824
X-Proofpoint-ORIG-GUID: 3inZeAzhC58ckht3s4KI3zMZUPnopikR
X-Proofpoint-GUID: 3inZeAzhC58ckht3s4KI3zMZUPnopikR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-07_04,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210100045
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Oct 2022 07:30:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99116

CVE-2022-31676:
VMware Tools (12.0.0, 11.x.y and 10.x.y) contains a local privilege
escalation vulnerability. A malicious actor with local
non-administrative access to the Guest OS can escalate privileges as a
root user in the virtual machine.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2022-31676

Patch from:
https://github.com/vmware/open-vm-tools/commit/70a74758bfe0042c27f15ce590fb21a2bc54d745

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...uthorization-on-incoming-guestOps-re.patch | 43 +++++++++++++++++++
 .../open-vm-tools/open-vm-tools_11.3.5.bb     |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-Properly-check-authorization-on-incoming-guestOps-re.patch

diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-Properly-check-authorization-on-incoming-guestOps-re.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-Properly-check-authorization-on-incoming-guestOps-re.patch
new file mode 100644
index 000000000..4140c46d0
--- /dev/null
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-Properly-check-authorization-on-incoming-guestOps-re.patch
@@ -0,0 +1,43 @@
+From 70a74758bfe0042c27f15ce590fb21a2bc54d745 Mon Sep 17 00:00:00 2001
+From: John Wolfe <jwolfe@vmware.com>
+Date: Sun, 21 Aug 2022 07:56:49 -0700
+Subject: [PATCH] Properly check authorization on incoming guestOps requests.
+
+Fix public pipe request checks.  Only a SessionRequest type should
+be accepted on the public pipe.
+
+CVE: CVE-2022-31676
+
+Upstream-Status: Backport
+[https://github.com/vmware/open-vm-tools/commit/70a74758bfe0042c27f15ce590fb21a2bc54d745]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ open-vm-tools/vgauth/serviceImpl/proto.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/open-vm-tools/vgauth/serviceImpl/proto.c b/open-vm-tools/vgauth/serviceImpl/proto.c
+index db7159ee..6c672601 100644
+--- a/open-vm-tools/vgauth/serviceImpl/proto.c
++++ b/open-vm-tools/vgauth/serviceImpl/proto.c
+@@ -1,5 +1,5 @@
+ /*********************************************************
+- * Copyright (C) 2011-2016,2019-2021 VMware, Inc. All rights reserved.
++ * Copyright (C) 2011-2016,2019-2022 VMware, Inc. All rights reserved.
+  *
+  * This program is free software; you can redistribute it and/or modify it
+  * under the terms of the GNU Lesser General Public License as published
+@@ -1201,6 +1201,10 @@ Proto_SecurityCheckRequest(ServiceConnection *conn,
+    VGAuthError err;
+    gboolean isSecure = ServiceNetworkIsConnectionPrivateSuperUser(conn);
+ 
++   if (conn->isPublic && req->reqType != PROTO_REQUEST_SESSION_REQ) {
++      return VGAUTH_E_PERMISSION_DENIED;
++   }
++
+    switch (req->reqType) {
+       /*
+        * This comes over the public connection; alwsys let it through.
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb
index 1c3545f96..4670a85a6 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb
@@ -44,6 +44,7 @@ SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https;branch=maste
            file://0001-Make-HgfsConvertFromNtTimeNsec-aware-of-64-bit-time_.patch;patchdir=.. \
            file://0002-hgfsServerLinux-Consider-64bit-time_t-possibility.patch;patchdir=.. \
            file://0001-open-vm-tools-Correct-include-path-for-poll.h.patch;patchdir=.. \
+           file://0001-Properly-check-authorization-on-incoming-guestOps-re.patch;patchdir=.. \
            "
 
 UPSTREAM_CHECK_GITTAGREGEX = "stable-(?P<pver>\d+(\.\d+)+)"
-- 
2.25.1


