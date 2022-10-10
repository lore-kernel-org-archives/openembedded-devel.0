Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA5C9C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 14:12:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6843.1665411115730494889
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 07:11:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=PwtuNfqk;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=728262b6db=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id
 29ACwQaf025450
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 07:11:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=WB1EcoVgK7KCQcCsZtURONdyY7iRuwWisxeilL/xjSc=;
 b=PwtuNfqkK5hPdyxQaRQgq5sue3ozrmomBNENh+xsJD7qhtfZs0O4LRmMKUql755LU93e
 yTTJBFWs3PMJiY+OP8RI4tU2BJaM8Cf2gzP2jRTmJ9T1AEJIPhAzQ7IINvruGJCC5nfB
 +4uWcgZThho3f6clTy3m7K92atjeNJhN5PEx+YiZga2QMOm1MaGWWTBV5kn4qbmGu8ss
 phiHLlqLwVhk3hWFf9A3f5vbJb00W7pxafWPcLhs5LQaBfJRxGEkpuQS7adiIkc8C+gJ
 kk0jX2K9CYtbiUvABDt47Ff8nu1NjVXXD8GVXt31D7/BYzDKRMqJ7Wyi14geMLdlmROu 9Q==
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k34g29eyb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 07:11:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CWDt8M70zUR9JXKDaS6Mq+QDvgfBlFvwjwO8YlZRybnyCQJE0eBUINglGr/v9pvzGx0ioIkcG7FDM77SLtmaVRDM3TENEKVnv9pLDZwkXDbusUyA2qve7hwVKjx2Xd02IdSYRXnQAnB50UXZ9HwHf6ufKW07Th4p/7KDwpBclCoaStlylYbTLtbHdU7e7y4n9c+4Xrc6EL3Iz/IEikxzgmz8XqouIVVHGGtK/ESB5b6NWbmpbRfwJzbxSCH7oz5ixikC6XmtPW7W04ZUdCEjP7PhzaFX9c7ytC6HRkvNcuFaWQFHNM4Yn1FQOh96w/K2ECTsrP55LdgILHmuALCpiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WB1EcoVgK7KCQcCsZtURONdyY7iRuwWisxeilL/xjSc=;
 b=lt8aSsYmUJdnZKz6ddz81BbcjLuqkoScLLipWDXz7hXz5LJuyva/7P/DJ090P4/RB1bRuPy792O0aH0U5AiYHGyoxKQ6xiA+GUGT3zLEup8NAFe8pCZuFlC94JxpqVeG4FLMRJiQeL5NVa4Oy+3oWIeUTTQVHd7n3giK1CGV8G1vk8ENIMSXCZznpcWg7jWOwgj5EG/WNYyyOk/ado0QKgqhDFdpwbOv/j19XddysKGDroisKNXY8D2zlt+xgfUciTSHRWpJQ9YdVP1Fb6t+54adylITGWn5CLQsvY53UEddRtbnu8GutNEg7PAXCPNp/cwRMc68ey9inCxXWcPX2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by DS0PR11MB6518.namprd11.prod.outlook.com (2603:10b6:8:d2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Mon, 10 Oct
 2022 14:11:52 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::6ad2:95fb:73d5:35ae]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::6ad2:95fb:73d5:35ae%7]) with mapi id 15.20.5709.018; Mon, 10 Oct 2022
 14:11:52 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] open-vm-tools: upgrade 11.3.5 -> 12.1.0
Date: Mon, 10 Oct 2022 22:11:41 +0800
Message-Id: <20221010141141.376403-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0126.KORP216.PROD.OUTLOOK.COM (2603:1096:101::23)
 To CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|DS0PR11MB6518:EE_
X-MS-Office365-Filtering-Correlation-Id: f1622741-9191-4132-279a-08daaac96118
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NGTWJn8srSCySpNQ4qrkfu4ZSIptDiU89+Qf0Mc2RjhD1VeivRpmxUYlEebzcZrhgLoqMdXB5JphPVQjzfVFjUaZTpBAIkDqgA3D2ViyejvQqv4XM6WirWBhujwDHN0ISiNmeUanxFhO66Yky6v1GXmKGA8P+WcKwjMJWtrmMhSbeOcrHeh2kATQ/YeBdax5U9dhOPQHmR7WPwDb37mu16v5UMq402J4Y+EOuTPCWLOAfn/2rha3aH4NXaNcBr9FfUYpTDI9dpzoVlNRB8asITPPv/LOov4WJT5Sxvi8apqDWUOoNlacI94E7DHsv7oCpnsAqpZLjcyRX7cPywIND+oY/WWKljxtt81qKuRDPt6R6pgGwIlyhmrNLCCoj6cOgHyhMJ4jFP5uEngszheqIoktUg1k3dOPl/M1QrNDA5mg60ZjKt5EBrwgknYD/Kehj+Y7z+uTrJdQEjjsxnlN0R2Tojbc/gBXCvl3aWDjiCBg8Q/3loTS97KHt1Xdp+jK8lWjZ89jMB73fL996O6L8pIXTCWYUR551bVZp1MeNo1lo0OKpLURSbNRRY4VIDl2Gy/W7aBerLlLNFneSV84HVUgntmtHuizraxk/5m3no+4zemzmgrBxSTvNZJqTIcvN7C56yONPazUIN0h8Ck580OqFRJ/ezyX9cSUeEX21ASidNSW8BnNRax9cP3srxKplzG9trDVOWSQoH5DiEOOJQSXRq7kXkEQqpHAkazrGbE4Th2CXuoaDAOnv/2K+N9tv879d70ykhEOES53IZ4pxYon1y9bi77jn+EiiCVcJ7K4g+ej87nXqXteX5MwYbFM1UW5qTEdj9f+qc6rG8HABA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(366004)(39850400004)(396003)(451199015)(8936002)(30864003)(5660300002)(966005)(8676002)(2616005)(66476007)(6486002)(1076003)(186003)(83380400001)(66946007)(6666004)(41300700001)(66556008)(44832011)(52116002)(53546011)(6512007)(6506007)(36756003)(38100700002)(38350700002)(478600001)(86362001)(26005)(6916009)(316002)(2906002)(19627235002)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KmE7oVHE86/SJbFIPBoSpH9fRv62JsVJl9fDv7HVAAtygw0KXHPRGE0DHw3Q?=
 =?us-ascii?Q?XBWkxm0Q0BUOMTg2Bu4r4zBZ98WJ6/86tbWtEuJxxG3BR8HddHP9mBK50fm7?=
 =?us-ascii?Q?wCOxwlgqeKCks4eUWYiQ/CMJhgV/YGFk1K3RJRp4/5qor3QWPXf17SaV7GF3?=
 =?us-ascii?Q?9uwewr3V8aXBUxkD3mm6YzCiZgZdmKrqd7jwCKJHt5oLevc0dKLRcV1fyK7V?=
 =?us-ascii?Q?ncUlsTaHXJYq+22L2GQu+m1qNIcbfO7r9UHIA6I8JioeAzyTwZIKUHNeZxeY?=
 =?us-ascii?Q?xwgYlZ+hPFF4BuoBxwKqHkNfOPDVJhvQZqJpS7YgNvXY4K2PTWfG/JQDWQzm?=
 =?us-ascii?Q?C2MnSaz3z597kGYZCqY2XOFUwAB6wy6LqIuhXU48HRN6IQ8BGQBVGQQ9CV7t?=
 =?us-ascii?Q?Jt47BT5y1n2zjR7UQttv6XBTkEupcw9s9EVLxvFgzJC3USurNBUAJ//mit4U?=
 =?us-ascii?Q?9eE3qPjZT5AU92Qs8NAhodInyfV5MmC7Prncp7op2d8FTtU2ahNk/97t/akI?=
 =?us-ascii?Q?b1AJM3p8OyBOPlWy7xSGyHEffYfdEwdovhJ741rNGPe2XPyk/rmfHkISxsC+?=
 =?us-ascii?Q?scyfuOJXkwDaCmTB9pRagSyYb8RY70pygc6Bc4XK/RlRT73OZ4kHVCjb62SG?=
 =?us-ascii?Q?5VenHKmlh5FSXZBGEC6bf5zgZBY7BachBf2sKJ0EWaDSd3MSLVgGVnjWpL84?=
 =?us-ascii?Q?9BB8EcQ8b/LKYs8gLckiYCA3vaKcTGmFlnsqltSu+yV1Dw4AQWZrxmVWNHKY?=
 =?us-ascii?Q?RujXHMczW1+AUoxhQnLbWJrGLsSJit5xK4M8IFUoYNh8oYyPlzyaHRYlZC1c?=
 =?us-ascii?Q?zGBOWAHOuFQp+ycR3k7pST1lsig60QM+rnP1Q0QwnUJCfOc4YV7g8X9uIKDG?=
 =?us-ascii?Q?r6WNUiN6jHkOL8l13fpempJsh7XVUu6mpDpN5oKd+Xp5HaBNcYd7UgVSP3Lg?=
 =?us-ascii?Q?RMuDN6xq3nbXtQsVCh9mUh8D8Mofl9EzHp2eFewx1qHqWsbxhDytn9izaQ9u?=
 =?us-ascii?Q?rc2qKKu12K9XzjctpxsM5ik7UPzQK5GD9k0yOdP+G9mmHW0edhqhIW0N8xdC?=
 =?us-ascii?Q?BdTVLwvtopAucFyPwenm4a5iUItck6POiO4EItiXaI+QoaYbnS3oDAH3gIps?=
 =?us-ascii?Q?E6usAEslKFPRx+lpCZrQ8aOho9ThGgFn1zm179ARkv5GomwOu93KtVc4JcrL?=
 =?us-ascii?Q?wOtC1dH1BOhN7qsWtaHaRRTvgZkGdRI3PLjnL1FWKI46qvYv8hgDhwYacG82?=
 =?us-ascii?Q?z3w4dU8+PNSI1qPf1QYoztrFz3F4uYNP88JtVx8NQpRWSJQz2TNeRxSFF+ve?=
 =?us-ascii?Q?50KVxmq1Yfk9gPe7oiB+Qc+jKpEsZaoKSohQEjjP4XPaTntxs2nwcjniO2wI?=
 =?us-ascii?Q?HXppf1pOR4BlU1gBX3710nuaX8vgG05dO1CeKH1lv7BBb9IWmWDUGeFuw/Y0?=
 =?us-ascii?Q?Va7GnkSeIzEFSXK0B/xITB+ZzpFjSyOpo20+gwgSp1bTeT6IpGY+fYxYyxGN?=
 =?us-ascii?Q?wGksZDKEscEJpouHDa8SvLiw/Z1ejJ2tGYts4cya2uTTol5kofUgIC377Yn3?=
 =?us-ascii?Q?0WYssqnFSCTW4GIuHDxo6YfsEKNY/Wt4ss8lO7Kw?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f1622741-9191-4132-279a-08daaac96118
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2022 14:11:52.3448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 9tRH8CsDdvM2G/VFXF5m/CCTB9RW5RW2jp+Cx1Ndyeb173ROFDBvIGhKHjP9xqgtTdb/loTDRUKxcfy4Bf2Eeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6518
X-Proofpoint-ORIG-GUID: pZ5UFFyiZt5OwkQogQ1WEdCBwZ5N4ZMs
X-Proofpoint-GUID: pZ5UFFyiZt5OwkQogQ1WEdCBwZ5N4ZMs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-10_08,2022-10-10_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210100084
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Oct 2022 14:12:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99129

* Drop 0001-Make-HgfsConvertFromNtTimeNsec-aware-of-64-bit-time_.patch
  and 0013-misc-Do-not-print-NULL-string-into-logs.patch which have been
  merged upstream.
* Refresh patches.
* Do not build containerinfo plugin as it requries containerd.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...-Add-resolv_compat.h-for-musl-builds.patch | 10 ++-
 ...FromNtTimeNsec-aware-of-64-bit-time_.patch | 78 -------------------
 ...1-configure.ac-don-t-use-dnet-config.patch | 11 ++-
 ...-configure-test-for-struct-timespec.patch} | 11 ++-
 ...inition-of-ALLPERMS-and-ACCESSPERMS.patch} | 13 ++--
 ...test-for-feature-instead-of-platfor.patch} | 14 ++--
 ...nfigure-test-for-sys-stat.h-include.patch} |  7 +-
 ...-Fix-subdir-objects-configure-error.patch} |  8 +-
 ...nclude-poll.h-instead-of-sys-poll.h.patch} |  9 ++-
 ... => 0008-Rename-poll.h-to-vm_poll.h.patch} | 16 ++--
 ...trerror_r-unless-on-gnu-libc-system.patch} |  7 +-
 ...0-Use-uintmax_t-for-handling-rlim_t.patch} | 10 +--
 ...11-Use-off64_t-instead-of-__off64_t.patch} | 10 ++-
 ...x-Consider-64bit-time_t-possibility.patch} |  8 +-
 ...c-Do-not-print-NULL-string-into-logs.patch | 27 -------
 ...ols-Correct-include-path-for-poll.h.patch} |  4 +-
 ...ools_11.3.5.bb => open-vm-tools_12.1.0.bb} | 30 ++++---
 17 files changed, 97 insertions(+), 176 deletions(-)
 delete mode 100644 meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-Make-HgfsConvertFromNtTimeNsec-aware-of-64-bit-time_.patch
 rename meta-networking/recipes-support/open-vm-tools/open-vm-tools/{0003-Use-configure-test-for-struct-timespec.patch => 0002-Use-configure-test-for-struct-timespec.patch} (88%)
 rename meta-networking/recipes-support/open-vm-tools/open-vm-tools/{0004-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch => 0003-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch} (91%)
 rename meta-networking/recipes-support/open-vm-tools/open-vm-tools/{0005-Use-configure-to-test-for-feature-instead-of-platfor.patch => 0004-Use-configure-to-test-for-feature-instead-of-platfor.patch} (94%)
 rename meta-networking/recipes-support/open-vm-tools/open-vm-tools/{0006-Use-configure-test-for-sys-stat.h-include.patch => 0005-Use-configure-test-for-sys-stat.h-include.patch} (86%)
 rename meta-networking/recipes-support/open-vm-tools/open-vm-tools/{0007-Fix-subdir-objects-configure-error.patch => 0006-Fix-subdir-objects-configure-error.patch} (86%)
 rename meta-networking/recipes-support/open-vm-tools/open-vm-tools/{0008-include-poll.h-instead-of-sys-poll.h.patch => 0007-include-poll.h-instead-of-sys-poll.h.patch} (84%)
 rename meta-networking/recipes-support/open-vm-tools/open-vm-tools/{0009-Rename-poll.h-to-vm_poll.h.patch => 0008-Rename-poll.h-to-vm_poll.h.patch} (92%)
 rename meta-networking/recipes-support/open-vm-tools/open-vm-tools/{0010-use-posix-strerror_r-unless-on-gnu-libc-system.patch => 0009-use-posix-strerror_r-unless-on-gnu-libc-system.patch} (90%)
 rename meta-networking/recipes-support/open-vm-tools/open-vm-tools/{0011-Use-uintmax_t-for-handling-rlim_t.patch => 0010-Use-uintmax_t-for-handling-rlim_t.patch} (83%)
 rename meta-networking/recipes-support/open-vm-tools/open-vm-tools/{0012-Use-off64_t-instead-of-__off64_t.patch => 0011-Use-off64_t-instead-of-__off64_t.patch} (87%)
 rename meta-networking/recipes-support/open-vm-tools/open-vm-tools/{0002-hgfsServerLinux-Consider-64bit-time_t-possibility.patch => 0012-hgfsServerLinux-Consider-64bit-time_t-possibility.patch} (93%)
 delete mode 100644 meta-networking/recipes-support/open-vm-tools/open-vm-tools/0013-misc-Do-not-print-NULL-string-into-logs.patch
 rename meta-networking/recipes-support/open-vm-tools/open-vm-tools/{0001-open-vm-tools-Correct-include-path-for-poll.h.patch => 0013-open-vm-tools-Correct-include-path-for-poll.h.patch} (94%)
 rename meta-networking/recipes-support/open-vm-tools/{open-vm-tools_11.3.5.bb => open-vm-tools_12.1.0.bb} (80%)

diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-Add-resolv_compat.h-for-musl-builds.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-Add-resolv_compat.h-for-musl-builds.patch
index c09bc1252..4a97c2618 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-Add-resolv_compat.h-for-musl-builds.patch
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-Add-resolv_compat.h-for-musl-builds.patch
@@ -1,4 +1,4 @@
-From f93b680ec1a816ffe90d5f1bce609f8bf68a456e Mon Sep 17 00:00:00 2001
+From c1ee0b0a0a05379d0e6475dfceaaf41876192640 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <trevor.gamblin@windriver.com>
 Date: Wed, 14 Apr 2021 10:24:52 -0400
 Subject: [PATCH] Add resolv_compat.h for musl builds
@@ -10,7 +10,6 @@ https://gitweb.gentoo.org/proj/musl.git/tree/dev-qt/qtwebengine/files/qtwebengin
 Upstream-Status: Pending
 
 Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
-
 ---
  open-vm-tools/lib/nicInfo/nicInfoPosix.c  |  4 +++
  open-vm-tools/lib/nicInfo/resolv_compat.h | 30 +++++++++++++++++++++++
@@ -18,7 +17,7 @@ Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
  create mode 100644 open-vm-tools/lib/nicInfo/resolv_compat.h
 
 diff --git a/open-vm-tools/lib/nicInfo/nicInfoPosix.c b/open-vm-tools/lib/nicInfo/nicInfoPosix.c
-index c56b73cf..8ae3b2f7 100644
+index c56b73cfe..8ae3b2f74 100644
 --- a/open-vm-tools/lib/nicInfo/nicInfoPosix.c
 +++ b/open-vm-tools/lib/nicInfo/nicInfoPosix.c
 @@ -70,6 +70,10 @@
@@ -34,7 +33,7 @@ index c56b73cf..8ae3b2f7 100644
   *
 diff --git a/open-vm-tools/lib/nicInfo/resolv_compat.h b/open-vm-tools/lib/nicInfo/resolv_compat.h
 new file mode 100644
-index 00000000..d768464b
+index 000000000..d768464b9
 --- /dev/null
 +++ b/open-vm-tools/lib/nicInfo/resolv_compat.h
 @@ -0,0 +1,30 @@
@@ -68,3 +67,6 @@ index 00000000..d768464b
 +}
 +#endif
 +
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-Make-HgfsConvertFromNtTimeNsec-aware-of-64-bit-time_.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-Make-HgfsConvertFromNtTimeNsec-aware-of-64-bit-time_.patch
deleted file mode 100644
index 61a681f17..000000000
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-Make-HgfsConvertFromNtTimeNsec-aware-of-64-bit-time_.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From caf80e220b055dbce259078be96e899dc78ec1d2 Mon Sep 17 00:00:00 2001
-From: Bartosz Brachaczek <b.brachaczek@gmail.com>
-Date: Tue, 12 Nov 2019 14:31:08 +0100
-Subject: [PATCH] Make HgfsConvertFromNtTimeNsec aware of 64-bit time_t on i386
-
-I verified that this function behaves as expected on x86_64, i386 with
-32-bit time_t, and i386 with 64-bit time_t for the following values of
-ntTtime:
-
-UNIX_EPOCH-1, UNIX_EPOCH, UNIX_EPOCH+1, UNIX_S32_MAX-1, UNIX_S32_MAX,
-UNIX_S32_MAX+1, UNIX_S32_MAX*2+1
-
-I did not verify whether the use of Div643264 is optimal, performance
-wise.
-
-Upstream-Status: Submitted [https://github.com/vmware/open-vm-tools/pull/387]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- open-vm-tools/lib/hgfs/hgfsUtil.c | 34 +++++++++++++++++--------------
- 1 file changed, 19 insertions(+), 15 deletions(-)
-
-diff --git a/open-vm-tools/lib/hgfs/hgfsUtil.c b/open-vm-tools/lib/hgfs/hgfsUtil.c
-index cc580ab8..49b10040 100644
---- a/open-vm-tools/lib/hgfs/hgfsUtil.c
-+++ b/open-vm-tools/lib/hgfs/hgfsUtil.c
-@@ -110,23 +110,21 @@ HgfsConvertFromNtTimeNsec(struct timespec *unixTime, // OUT: Time in UNIX format
- 			  uint64 ntTime) // IN: Time in Windows NT format
- {
- #ifdef __i386__
--   uint32 sec;
--   uint32 nsec;
-+   uint64 sec64;
-+   uint32 sec32, nsec;
-+#endif
- 
-    ASSERT(unixTime);
--   /* We assume that time_t is 32bit */
--   ASSERT_ON_COMPILE(sizeof (unixTime->tv_sec) == 4);
- 
--   /* Cap NT time values that are outside of Unix time's range */
-+   if (sizeof (unixTime->tv_sec) == 4) {
-+      /* Cap NT time values that are outside of Unix time's range */
- 
--   if (ntTime >= UNIX_S32_MAX) {
--      unixTime->tv_sec = 0x7FFFFFFF;
--      unixTime->tv_nsec = 0;
--      return 1;
-+      if (ntTime >= UNIX_S32_MAX) {
-+         unixTime->tv_sec = 0x7FFFFFFF;
-+         unixTime->tv_nsec = 0;
-+         return 1;
-+      }
-    }
--#else
--   ASSERT(unixTime);
--#endif
- 
-    if (ntTime < UNIX_EPOCH) {
-       unixTime->tv_sec = 0;
-@@ -135,9 +133,15 @@ HgfsConvertFromNtTimeNsec(struct timespec *unixTime, // OUT: Time in UNIX format
-    }
- 
- #ifdef __i386__
--   Div643232(ntTime - UNIX_EPOCH, 10000000, &sec, &nsec);
--   unixTime->tv_sec = sec;
--   unixTime->tv_nsec = nsec * 100;
-+   if (sizeof (unixTime->tv_sec) == 4) {
-+      Div643232(ntTime - UNIX_EPOCH, 10000000, &sec32, &nsec);
-+      unixTime->tv_sec = sec32;
-+      unixTime->tv_nsec = nsec * 100;
-+   } else {
-+      Div643264(ntTime - UNIX_EPOCH, 10000000, &sec64, &nsec);
-+      unixTime->tv_sec = sec64;
-+      unixTime->tv_nsec = nsec * 100;
-+   }
- #else
-    unixTime->tv_sec = (ntTime - UNIX_EPOCH) / 10000000;
-    unixTime->tv_nsec = ((ntTime - UNIX_EPOCH) % 10000000) * 100;
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-configure.ac-don-t-use-dnet-config.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-configure.ac-don-t-use-dnet-config.patch
index a711f5e5d..3aa21e3ec 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-configure.ac-don-t-use-dnet-config.patch
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-configure.ac-don-t-use-dnet-config.patch
@@ -1,4 +1,4 @@
-From fc9bf1ce9f1a21150b10736a1c968d4ca6d4eaa3 Mon Sep 17 00:00:00 2001
+From c953564b9f029b31381a2c630b47133ffe6a33e7 Mon Sep 17 00:00:00 2001
 From: Martin Kelly <mkelly@xevo.com>
 Date: Fri, 7 Apr 2017 15:20:30 -0700
 Subject: [PATCH] configure.ac: don't use dnet-config
@@ -14,9 +14,11 @@ Signed-off-by: Martin Kelly <mkelly@xevo.com>
  open-vm-tools/configure.ac | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
+diff --git a/open-vm-tools/configure.ac b/open-vm-tools/configure.ac
+index 3c058135a..124781f99 100644
 --- a/open-vm-tools/configure.ac
 +++ b/open-vm-tools/configure.ac
-@@ -937,7 +937,7 @@ if test "$with_dnet" = "yes"; then
+@@ -1227,7 +1227,7 @@ if test "$with_dnet" = "yes"; then
        AC_VMW_CHECK_LIB([dnet],
                         [DNET],
                         [],
@@ -25,7 +27,7 @@ Signed-off-by: Martin Kelly <mkelly@xevo.com>
                         [],
                         [dnet.h],
                         [intf_open],
-@@ -947,7 +947,7 @@ if test "$with_dnet" = "yes"; then
+@@ -1237,7 +1237,7 @@ if test "$with_dnet" = "yes"; then
  
     if test $have_dnet = "no"; then
  		AC_MSG_ERROR(
@@ -34,3 +36,6 @@ Signed-off-by: Martin Kelly <mkelly@xevo.com>
     fi
  fi
  
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0003-Use-configure-test-for-struct-timespec.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0002-Use-configure-test-for-struct-timespec.patch
similarity index 88%
rename from meta-networking/recipes-support/open-vm-tools/open-vm-tools/0003-Use-configure-test-for-struct-timespec.patch
rename to meta-networking/recipes-support/open-vm-tools/open-vm-tools/0002-Use-configure-test-for-struct-timespec.patch
index 6d2e49814..aa5ffde41 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0003-Use-configure-test-for-struct-timespec.patch
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0002-Use-configure-test-for-struct-timespec.patch
@@ -1,4 +1,4 @@
-From bf9292ff9bd25467a014d6c2070805d163daa4c9 Mon Sep 17 00:00:00 2001
+From 6384b37cdef4ea868c3cee27bb627e4cfbab7b50 Mon Sep 17 00:00:00 2001
 From: Natanael Copa <ncopa@alpinelinux.org>
 Date: Wed, 18 Nov 2015 09:03:00 +0000
 Subject: [PATCH] Use configure test for struct timespec
@@ -13,10 +13,10 @@ Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
  2 files changed, 2 insertions(+), 7 deletions(-)
 
 diff --git a/open-vm-tools/configure.ac b/open-vm-tools/configure.ac
-index 713ea683..48ff1ef3 100644
+index 124781f99..05f37f275 100644
 --- a/open-vm-tools/configure.ac
 +++ b/open-vm-tools/configure.ac
-@@ -1208,6 +1208,7 @@ AC_TYPE_OFF_T
+@@ -1441,6 +1441,7 @@ AC_TYPE_OFF_T
  AC_TYPE_PID_T
  AC_TYPE_SIZE_T
  AC_CHECK_MEMBERS([struct stat.st_rdev])
@@ -25,7 +25,7 @@ index 713ea683..48ff1ef3 100644
  AC_STRUCT_TM
  AC_C_VOLATILE
 diff --git a/open-vm-tools/lib/include/hgfsUtil.h b/open-vm-tools/lib/include/hgfsUtil.h
-index 609f4c00..a3a022d4 100644
+index 609f4c000..a3a022d42 100644
 --- a/open-vm-tools/lib/include/hgfsUtil.h
 +++ b/open-vm-tools/lib/include/hgfsUtil.h
 @@ -53,13 +53,7 @@
@@ -43,3 +43,6 @@ index 609f4c00..a3a022d4 100644
  struct timespec {
     time_t tv_sec;
     long   tv_nsec;
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0004-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0003-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch
similarity index 91%
rename from meta-networking/recipes-support/open-vm-tools/open-vm-tools/0004-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch
rename to meta-networking/recipes-support/open-vm-tools/open-vm-tools/0003-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch
index e107ecf23..24279e34a 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0004-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0003-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch
@@ -1,4 +1,4 @@
-From 5a795b234c617150915a607776c76377948870a6 Mon Sep 17 00:00:00 2001
+From 6be6cda5aea42b951212ec5f8a72778b1ef9c2da Mon Sep 17 00:00:00 2001
 From: Natanael Copa <ncopa@alpinelinux.org>
 Date: Wed, 18 Nov 2015 09:10:14 +0000
 Subject: [PATCH] Fix definition of ALLPERMS and ACCESSPERMS
@@ -15,7 +15,7 @@ Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
  2 files changed, 6 insertions(+), 5 deletions(-)
 
 diff --git a/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c b/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c
-index f2b7ce67..0e6351a9 100644
+index 63c4e65f0..87d419a7b 100644
 --- a/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c
 +++ b/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c
 @@ -105,11 +105,13 @@ typedef struct DirectoryEntry {
@@ -36,10 +36,10 @@ index f2b7ce67..0e6351a9 100644
  #endif
  
 diff --git a/open-vm-tools/services/plugins/dndcp/dnd/dndLinux.c b/open-vm-tools/services/plugins/dndcp/dnd/dndLinux.c
-index 89133652..7e9c3a91 100644
+index 219065f74..b5b7e6203 100644
 --- a/open-vm-tools/services/plugins/dndcp/dnd/dndLinux.c
 +++ b/open-vm-tools/services/plugins/dndcp/dnd/dndLinux.c
-@@ -52,7 +52,7 @@
+@@ -53,7 +53,7 @@
  
  #define DND_ROOTDIR_PERMS     (S_IRWXU | S_IRWXG | S_IRWXO)
  #define DND_STAGINGDIR_PERMS  (S_IRWXU | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH)
@@ -48,7 +48,7 @@ index 89133652..7e9c3a91 100644
  #define ACCESSPERMS           (S_IRWXU | S_IRWXG | S_IRWXO)
  #endif
  #ifdef __ANDROID__
-@@ -61,7 +61,6 @@
+@@ -62,7 +62,6 @@
   */
  #define NO_SETMNTENT
  #define NO_ENDMNTENT
@@ -56,3 +56,6 @@ index 89133652..7e9c3a91 100644
  #endif
  
  
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0005-Use-configure-to-test-for-feature-instead-of-platfor.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0004-Use-configure-to-test-for-feature-instead-of-platfor.patch
similarity index 94%
rename from meta-networking/recipes-support/open-vm-tools/open-vm-tools/0005-Use-configure-to-test-for-feature-instead-of-platfor.patch
rename to meta-networking/recipes-support/open-vm-tools/open-vm-tools/0004-Use-configure-to-test-for-feature-instead-of-platfor.patch
index 34d4ce4a9..613bba212 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0005-Use-configure-to-test-for-feature-instead-of-platfor.patch
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0004-Use-configure-to-test-for-feature-instead-of-platfor.patch
@@ -1,4 +1,4 @@
-From b653a81da70c44af002dcbc7489ad9f4588ed11d Mon Sep 17 00:00:00 2001
+From 9d22fba096cd77101fc45420c918ec748d2cc31b Mon Sep 17 00:00:00 2001
 From: Natanael Copa <ncopa@alpinelinux.org>
 Date: Wed, 18 Nov 2015 10:05:07 +0000
 Subject: [PATCH] Use configure to test for feature instead of platform
@@ -29,10 +29,10 @@ Signed-off-by: Randy MacLeod <randy.macleod@windriver.com>
  3 files changed, 23 insertions(+), 17 deletions(-)
 
 diff --git a/open-vm-tools/configure.ac b/open-vm-tools/configure.ac
-index 27f3717f..6baab9e3 100644
+index 05f37f275..9a0c63cf6 100644
 --- a/open-vm-tools/configure.ac
 +++ b/open-vm-tools/configure.ac
-@@ -923,6 +923,7 @@ AC_CHECK_FUNCS(
+@@ -1169,6 +1169,7 @@ AC_CHECK_FUNCS(
  
  AC_CHECK_FUNCS([ecvt])
  AC_CHECK_FUNCS([fcvt])
@@ -40,7 +40,7 @@ index 27f3717f..6baab9e3 100644
  
  AC_CHECK_FUNC([mkdtemp], [have_mkdtemp=yes])
  
-@@ -1132,10 +1133,13 @@ fi
+@@ -1378,10 +1379,13 @@ fi
  ###
  
  AC_CHECK_HEADERS([crypt.h])
@@ -55,7 +55,7 @@ index 27f3717f..6baab9e3 100644
  AC_CHECK_HEADERS([sys/io.h])
  AC_CHECK_HEADERS([sys/param.h]) # Required to make the sys/user.h check work correctly on FreeBSD
 diff --git a/open-vm-tools/lib/misc/idLinux.c b/open-vm-tools/lib/misc/idLinux.c
-index 1bb86f48..41c670cf 100644
+index 1bb86f483..41c670cfc 100644
 --- a/open-vm-tools/lib/misc/idLinux.c
 +++ b/open-vm-tools/lib/misc/idLinux.c
 @@ -27,12 +27,9 @@
@@ -118,7 +118,7 @@ index 1bb86f48..41c670cf 100644
  }
  #endif
 diff --git a/open-vm-tools/lib/nicInfo/nicInfoPosix.c b/open-vm-tools/lib/nicInfo/nicInfoPosix.c
-index cc5fa281..8710c542 100644
+index de57a4a90..c56b73cfe 100644
 --- a/open-vm-tools/lib/nicInfo/nicInfoPosix.c
 +++ b/open-vm-tools/lib/nicInfo/nicInfoPosix.c
 @@ -35,9 +35,13 @@
@@ -137,5 +137,5 @@ index cc5fa281..8710c542 100644
  #endif
  #ifndef NO_DNET
 -- 
-2.27.0
+2.25.1
 
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0006-Use-configure-test-for-sys-stat.h-include.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0005-Use-configure-test-for-sys-stat.h-include.patch
similarity index 86%
rename from meta-networking/recipes-support/open-vm-tools/open-vm-tools/0006-Use-configure-test-for-sys-stat.h-include.patch
rename to meta-networking/recipes-support/open-vm-tools/open-vm-tools/0005-Use-configure-test-for-sys-stat.h-include.patch
index 9a227f9ec..b52f24248 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0006-Use-configure-test-for-sys-stat.h-include.patch
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0005-Use-configure-test-for-sys-stat.h-include.patch
@@ -1,4 +1,4 @@
-From 11adcf43a1e7aa39ee4d82fa567f37e5b0c6ca81 Mon Sep 17 00:00:00 2001
+From 2bc09bc7d933bc3d91c687e1cc2befdaa38d2c86 Mon Sep 17 00:00:00 2001
 From: Natanael Copa <ncopa@alpinelinux.org>
 Date: Wed, 18 Nov 2015 10:41:01 +0000
 Subject: [PATCH] Use configure test for sys/stat.h include
@@ -11,7 +11,7 @@ Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/open-vm-tools/services/plugins/vix/vixTools.c b/open-vm-tools/services/plugins/vix/vixTools.c
-index e5273786..cabc4137 100644
+index 34f3125d2..cebf4dd8d 100644
 --- a/open-vm-tools/services/plugins/vix/vixTools.c
 +++ b/open-vm-tools/services/plugins/vix/vixTools.c
 @@ -66,7 +66,7 @@
@@ -23,3 +23,6 @@ index e5273786..cabc4137 100644
  #include <sys/stat.h>
  #endif
  
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0007-Fix-subdir-objects-configure-error.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0006-Fix-subdir-objects-configure-error.patch
similarity index 86%
rename from meta-networking/recipes-support/open-vm-tools/open-vm-tools/0007-Fix-subdir-objects-configure-error.patch
rename to meta-networking/recipes-support/open-vm-tools/open-vm-tools/0006-Fix-subdir-objects-configure-error.patch
index fd7ebce05..cb30966af 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0007-Fix-subdir-objects-configure-error.patch
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0006-Fix-subdir-objects-configure-error.patch
@@ -1,4 +1,4 @@
-From 294a3f14b74f2020a5cf3ccc2b6adabbcfce4151 Mon Sep 17 00:00:00 2001
+From dbe0943011c24d48de3df5a95f4e4606be0ef250 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 13 Jun 2018 23:48:04 -0700
 Subject: [PATCH] Fix subdir objects configure error
@@ -6,13 +6,12 @@ Subject: [PATCH] Fix subdir objects configure error
 Fix build on musl while here
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  open-vm-tools/configure.ac | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/open-vm-tools/configure.ac b/open-vm-tools/configure.ac
-index 005814ef..edf1f21a 100644
+index 9a0c63cf6..5845490f6 100644
 --- a/open-vm-tools/configure.ac
 +++ b/open-vm-tools/configure.ac
 @@ -326,7 +326,6 @@ AC_ARG_ENABLE(
@@ -32,3 +31,6 @@ index 005814ef..edf1f21a 100644
  
  ###
  ### Constants
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0008-include-poll.h-instead-of-sys-poll.h.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0007-include-poll.h-instead-of-sys-poll.h.patch
similarity index 84%
rename from meta-networking/recipes-support/open-vm-tools/open-vm-tools/0008-include-poll.h-instead-of-sys-poll.h.patch
rename to meta-networking/recipes-support/open-vm-tools/open-vm-tools/0007-include-poll.h-instead-of-sys-poll.h.patch
index 814b9e3b2..ff5fee6d4 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0008-include-poll.h-instead-of-sys-poll.h.patch
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0007-include-poll.h-instead-of-sys-poll.h.patch
@@ -1,4 +1,4 @@
-From e4f0b99d90e26b15106f634caad1c3dea9e09cb8 Mon Sep 17 00:00:00 2001
+From 8c7f5895ed1f98bfc4101f8cfb93af3d13fd6bce Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 13 Jun 2018 23:02:50 -0700
 Subject: [PATCH] include poll.h instead of sys/poll.h
@@ -11,10 +11,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/open-vm-tools/lib/asyncsocket/asyncsocket.c b/open-vm-tools/lib/asyncsocket/asyncsocket.c
-index 65b07109..b41aa29d 100644
+index 2bf97b549..b285c59c6 100644
 --- a/open-vm-tools/lib/asyncsocket/asyncsocket.c
 +++ b/open-vm-tools/lib/asyncsocket/asyncsocket.c
-@@ -69,8 +69,8 @@
+@@ -70,8 +70,8 @@
  #else
  #include <stddef.h>
  #include <ctype.h>
@@ -24,3 +24,6 @@ index 65b07109..b41aa29d 100644
  #include <sys/socket.h>
  #include <sys/un.h>
  #include <netdb.h>
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0009-Rename-poll.h-to-vm_poll.h.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0008-Rename-poll.h-to-vm_poll.h.patch
similarity index 92%
rename from meta-networking/recipes-support/open-vm-tools/open-vm-tools/0009-Rename-poll.h-to-vm_poll.h.patch
rename to meta-networking/recipes-support/open-vm-tools/open-vm-tools/0008-Rename-poll.h-to-vm_poll.h.patch
index 214dac471..b3906e827 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0009-Rename-poll.h-to-vm_poll.h.patch
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0008-Rename-poll.h-to-vm_poll.h.patch
@@ -1,4 +1,4 @@
-From 7a5db1cf47e70e72d78a42468912c276e57f865e Mon Sep 17 00:00:00 2001
+From 0c695d910b3e136e116cdbe0bfc6231dfac255a1 Mon Sep 17 00:00:00 2001
 From: Randy MacLeod <Randy.MacLeod@windriver.com>
 Date: Wed, 24 Mar 2021 16:21:35 -0400
 Subject: [PATCH] Rename poll.h to vm_poll.h
@@ -27,7 +27,7 @@ Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
  rename open-vm-tools/lib/include/{poll.h => vm_poll.h} (99%)
 
 diff --git a/open-vm-tools/lib/asyncsocket/asyncsocket.c b/open-vm-tools/lib/asyncsocket/asyncsocket.c
-index 9914ffc5..89679f7a 100644
+index b285c59c6..5c528820d 100644
 --- a/open-vm-tools/lib/asyncsocket/asyncsocket.c
 +++ b/open-vm-tools/lib/asyncsocket/asyncsocket.c
 @@ -87,7 +87,7 @@
@@ -40,7 +40,7 @@ index 9914ffc5..89679f7a 100644
  #include "err.h"
  #include "hostinfo.h"
 diff --git a/open-vm-tools/lib/hgfsServer/hgfsServer.c b/open-vm-tools/lib/hgfsServer/hgfsServer.c
-index 3a18a7e1..acdda54d 100644
+index 98f5b3f06..b436f0c7e 100644
 --- a/open-vm-tools/lib/hgfsServer/hgfsServer.c
 +++ b/open-vm-tools/lib/hgfsServer/hgfsServer.c
 @@ -51,7 +51,7 @@
@@ -53,7 +53,7 @@ index 3a18a7e1..acdda54d 100644
  #include "vm_basic_asm.h"
  #include "unicodeOperations.h"
 diff --git a/open-vm-tools/lib/include/asyncsocket.h b/open-vm-tools/lib/include/asyncsocket.h
-index 746dd78b..82c22f46 100644
+index dad848093..b61a2561f 100644
 --- a/open-vm-tools/lib/include/asyncsocket.h
 +++ b/open-vm-tools/lib/include/asyncsocket.h
 @@ -171,7 +171,7 @@ typedef struct AsyncSocket AsyncSocket;
@@ -66,7 +66,7 @@ index 746dd78b..82c22f46 100644
  typedef struct AsyncSocketPollParams {
     int flags;               /* Default 0, only POLL_FLAG_NO_BULL is valid */
 diff --git a/open-vm-tools/lib/include/pollImpl.h b/open-vm-tools/lib/include/pollImpl.h
-index 46442e55..8bc66997 100644
+index 46442e556..8bc669970 100644
 --- a/open-vm-tools/lib/include/pollImpl.h
 +++ b/open-vm-tools/lib/include/pollImpl.h
 @@ -44,7 +44,7 @@
@@ -82,7 +82,7 @@ diff --git a/open-vm-tools/lib/include/poll.h b/open-vm-tools/lib/include/vm_pol
 similarity index 99%
 rename from open-vm-tools/lib/include/poll.h
 rename to open-vm-tools/lib/include/vm_poll.h
-index c90f5dcd..73a56204 100644
+index ade356b9f..8759fb960 100644
 --- a/open-vm-tools/lib/include/poll.h
 +++ b/open-vm-tools/lib/include/vm_poll.h
 @@ -60,7 +60,7 @@ extern "C" {
@@ -95,7 +95,7 @@ index c90f5dcd..73a56204 100644
  #endif
  #ifdef __ANDROID__
 diff --git a/open-vm-tools/lib/rpcIn/rpcin.c b/open-vm-tools/lib/rpcIn/rpcin.c
-index 8b1fe759..f22fcd40 100644
+index 8b1fe759d..f22fcd402 100644
 --- a/open-vm-tools/lib/rpcIn/rpcin.c
 +++ b/open-vm-tools/lib/rpcIn/rpcin.c
 @@ -57,7 +57,7 @@
@@ -108,5 +108,5 @@ index 8b1fe759..f22fcd40 100644
  #  include "vmci_defs.h"
  #include "dataMap.h"
 -- 
-2.27.0
+2.25.1
 
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0010-use-posix-strerror_r-unless-on-gnu-libc-system.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0009-use-posix-strerror_r-unless-on-gnu-libc-system.patch
similarity index 90%
rename from meta-networking/recipes-support/open-vm-tools/open-vm-tools/0010-use-posix-strerror_r-unless-on-gnu-libc-system.patch
rename to meta-networking/recipes-support/open-vm-tools/open-vm-tools/0009-use-posix-strerror_r-unless-on-gnu-libc-system.patch
index 784b4fc6c..9ae1a8e6b 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0010-use-posix-strerror_r-unless-on-gnu-libc-system.patch
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0009-use-posix-strerror_r-unless-on-gnu-libc-system.patch
@@ -1,4 +1,4 @@
-From e86a259e1ce19c70ecfdece69ab53a07c63a34e1 Mon Sep 17 00:00:00 2001
+From 921621a098f242953117747f5852d7e3136ae6c4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 13 Jun 2018 23:16:53 -0700
 Subject: [PATCH] use posix strerror_r unless on gnu libc system
@@ -9,7 +9,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 6 insertions(+), 3 deletions(-)
 
 diff --git a/open-vm-tools/lib/err/errPosix.c b/open-vm-tools/lib/err/errPosix.c
-index c81b4c13..7a403640 100644
+index c81b4c13f..7a4036402 100644
 --- a/open-vm-tools/lib/err/errPosix.c
 +++ b/open-vm-tools/lib/err/errPosix.c
 @@ -31,6 +31,7 @@
@@ -37,3 +37,6 @@ index c81b4c13..7a403640 100644
     ASSERT(p != NULL);
     return p;
  }
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0011-Use-uintmax_t-for-handling-rlim_t.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0010-Use-uintmax_t-for-handling-rlim_t.patch
similarity index 83%
rename from meta-networking/recipes-support/open-vm-tools/open-vm-tools/0011-Use-uintmax_t-for-handling-rlim_t.patch
rename to meta-networking/recipes-support/open-vm-tools/open-vm-tools/0010-Use-uintmax_t-for-handling-rlim_t.patch
index 144b5837c..36d0c641a 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0011-Use-uintmax_t-for-handling-rlim_t.patch
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0010-Use-uintmax_t-for-handling-rlim_t.patch
@@ -1,7 +1,7 @@
-From 4b69d8fd78bf6edbc8b4ace58e621d46071fd8dc Mon Sep 17 00:00:00 2001
+From b44d1d4e4ba77f1d9cf7de73a3bd210d02b5ff36 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 24 Mar 2021 17:26:53 -0400
-Subject: [PATCH 2/2] Use uintmax_t for handling rlim_t
+Subject: [PATCH] Use uintmax_t for handling rlim_t
 
 rlimit types are not representable with long or long long
 formats, therefore use uintmax_t to typecast rlim_t types
@@ -17,10 +17,10 @@ Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c b/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c
-index ba2e5624..889f730a 100644
+index 87d419a7b..f5cc80b76 100644
 --- a/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c
 +++ b/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c
-@@ -5292,8 +5292,8 @@ HgfsWriteCheckIORange(off_t offset,         // IN:
+@@ -5301,8 +5301,8 @@ HgfsWriteCheckIORange(off_t offset,         // IN:
        goto exit;
     }
  
@@ -32,5 +32,5 @@ index ba2e5624..889f730a 100644
     /*
      * Check the offset is within the file size range.
 -- 
-2.30.2
+2.25.1
 
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0012-Use-off64_t-instead-of-__off64_t.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0011-Use-off64_t-instead-of-__off64_t.patch
similarity index 87%
rename from meta-networking/recipes-support/open-vm-tools/open-vm-tools/0012-Use-off64_t-instead-of-__off64_t.patch
rename to meta-networking/recipes-support/open-vm-tools/open-vm-tools/0011-Use-off64_t-instead-of-__off64_t.patch
index 5e37d7617..98eecebcf 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0012-Use-off64_t-instead-of-__off64_t.patch
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0011-Use-off64_t-instead-of-__off64_t.patch
@@ -1,4 +1,4 @@
-From 80b1c4236549b0194d1f0d6e9be887e3a5850843 Mon Sep 17 00:00:00 2001
+From 39a59ab7efe98c880c783b2ccf43e5a137d2b222 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 27 Aug 2018 23:22:21 -0700
 Subject: [PATCH] Use off64_t instead of __off64_t
@@ -8,16 +8,15 @@ unknown type name '__off64_t'
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  open-vm-tools/lib/file/fileIOPosix.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/open-vm-tools/lib/file/fileIOPosix.c b/open-vm-tools/lib/file/fileIOPosix.c
-index 82c0aa18..e9154541 100644
+index 492a4bf4a..a80a884cd 100644
 --- a/open-vm-tools/lib/file/fileIOPosix.c
 +++ b/open-vm-tools/lib/file/fileIOPosix.c
-@@ -206,10 +206,10 @@ static AlignedPool alignedPool;
+@@ -211,10 +211,10 @@ static AlignedPool alignedPool;
         * the symbols (and anyone building XOPEN<700 gets nothing).
         */
        extern ssize_t preadv64(int fd, const struct iovec *iov, int iovcnt,
@@ -30,3 +29,6 @@ index 82c0aa18..e9154541 100644
     #else
        #error "Large file support is unavailable."
     #endif
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0002-hgfsServerLinux-Consider-64bit-time_t-possibility.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0012-hgfsServerLinux-Consider-64bit-time_t-possibility.patch
similarity index 93%
rename from meta-networking/recipes-support/open-vm-tools/open-vm-tools/0002-hgfsServerLinux-Consider-64bit-time_t-possibility.patch
rename to meta-networking/recipes-support/open-vm-tools/open-vm-tools/0012-hgfsServerLinux-Consider-64bit-time_t-possibility.patch
index 97a4136ca..c7e62da7e 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0002-hgfsServerLinux-Consider-64bit-time_t-possibility.patch
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0012-hgfsServerLinux-Consider-64bit-time_t-possibility.patch
@@ -1,4 +1,4 @@
-From c6836386549fb8f017761ce17a237fa42901434c Mon Sep 17 00:00:00 2001
+From 859c21b9a21c53d936301b05044d0c649d6cf32b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 24 Mar 2021 17:36:26 -0400
 Subject: [PATCH] hgfsServerLinux: Consider 64bit time_t possibility
@@ -10,13 +10,12 @@ Refit for open-vm-tools-11.2.5.
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
 Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
-
 ---
  open-vm-tools/lib/hgfsServer/hgfsServerLinux.c | 14 --------------
  1 file changed, 14 deletions(-)
 
 diff --git a/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c b/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c
-index f5cc80b7..5a79d645 100644
+index f5cc80b76..5a79d6451 100644
 --- a/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c
 +++ b/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c
 @@ -2566,20 +2566,6 @@ HgfsStatToFileAttr(struct stat *stats,       // IN: stat information
@@ -40,3 +39,6 @@ index f5cc80b7..5a79d645 100644
  
     attr->userId = stats->st_uid;
     attr->groupId = stats->st_gid;
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0013-misc-Do-not-print-NULL-string-into-logs.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0013-misc-Do-not-print-NULL-string-into-logs.patch
deleted file mode 100644
index 3e4753b2a..000000000
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0013-misc-Do-not-print-NULL-string-into-logs.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From cfc6839362bd96bf2f42954160f16a60bf1de377 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 22 Dec 2018 19:59:02 -0800
-Subject: [PATCH] misc: Do not print NULL string into logs
-
-string format %s is getting a NULL pointer for 'expand'
-parameter always since the check for chunks[i] == NULL will ensure that
-its always null when the Log() API is called
-
-Upstream-Status: Submitted [https://github.com/vmware/open-vm-tools/pull/312]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- open-vm-tools/lib/misc/util_misc.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
---- a/open-vm-tools/lib/misc/util_misc.c
-+++ b/open-vm-tools/lib/misc/util_misc.c
-@@ -719,7 +719,7 @@ Util_ExpandString(const char *fileName)
-       ASSERT(!freeChunk[i]);
-       chunks[i] = expand;
-       if (chunks[i] == NULL) {
--	 Log("%s: Cannot allocate memory to expand $ in \"%s\".\n",
-+	 Log("%s: Cannot allocate memory to expand in \"%s\".\n",
-              __FUNCTION__, fileName);
- 	 goto out;
-       }
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-open-vm-tools-Correct-include-path-for-poll.h.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0013-open-vm-tools-Correct-include-path-for-poll.h.patch
similarity index 94%
rename from meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-open-vm-tools-Correct-include-path-for-poll.h.patch
rename to meta-networking/recipes-support/open-vm-tools/open-vm-tools/0013-open-vm-tools-Correct-include-path-for-poll.h.patch
index d9823bdd5..83687460b 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-open-vm-tools-Correct-include-path-for-poll.h.patch
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0013-open-vm-tools-Correct-include-path-for-poll.h.patch
@@ -1,4 +1,4 @@
-From 2cefed441753b012c385e2d3ea5374b4d67e5696 Mon Sep 17 00:00:00 2001
+From 7f7e00ce582d72013cb54278548d3320e032b0dc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Feb 2022 13:32:32 -0800
 Subject: [PATCH] open-vm-tools: Correct include path for poll.h
@@ -32,5 +32,5 @@ index 2bba2937e..025339595 100644
  #endif
  
 -- 
-2.35.1
+2.25.1
 
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.1.0.bb
similarity index 80%
rename from meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb
rename to meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.1.0.bb
index 1c3545f96..19e4ee11e 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.1.0.bb
@@ -30,20 +30,18 @@ SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https;branch=maste
            file://vmtoolsd.service \
            file://vmtoolsd.init \
            file://0001-configure.ac-don-t-use-dnet-config.patch;patchdir=.. \
-           file://0003-Use-configure-test-for-struct-timespec.patch;patchdir=.. \
-           file://0004-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch;patchdir=.. \
-           file://0005-Use-configure-to-test-for-feature-instead-of-platfor.patch;patchdir=.. \
-           file://0006-Use-configure-test-for-sys-stat.h-include.patch;patchdir=.. \
-           file://0007-Fix-subdir-objects-configure-error.patch;patchdir=.. \
-           file://0008-include-poll.h-instead-of-sys-poll.h.patch;patchdir=.. \
-           file://0009-Rename-poll.h-to-vm_poll.h.patch;patchdir=.. \
-           file://0010-use-posix-strerror_r-unless-on-gnu-libc-system.patch;patchdir=.. \
-           file://0011-Use-uintmax_t-for-handling-rlim_t.patch;patchdir=.. \
-           file://0012-Use-off64_t-instead-of-__off64_t.patch;patchdir=.. \
-           file://0013-misc-Do-not-print-NULL-string-into-logs.patch;patchdir=.. \
-           file://0001-Make-HgfsConvertFromNtTimeNsec-aware-of-64-bit-time_.patch;patchdir=.. \
-           file://0002-hgfsServerLinux-Consider-64bit-time_t-possibility.patch;patchdir=.. \
-           file://0001-open-vm-tools-Correct-include-path-for-poll.h.patch;patchdir=.. \
+           file://0002-Use-configure-test-for-struct-timespec.patch;patchdir=.. \
+           file://0003-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch;patchdir=.. \
+           file://0004-Use-configure-to-test-for-feature-instead-of-platfor.patch;patchdir=.. \
+           file://0005-Use-configure-test-for-sys-stat.h-include.patch;patchdir=.. \
+           file://0006-Fix-subdir-objects-configure-error.patch;patchdir=.. \
+           file://0007-include-poll.h-instead-of-sys-poll.h.patch;patchdir=.. \
+           file://0008-Rename-poll.h-to-vm_poll.h.patch;patchdir=.. \
+           file://0009-use-posix-strerror_r-unless-on-gnu-libc-system.patch;patchdir=.. \
+           file://0010-Use-uintmax_t-for-handling-rlim_t.patch;patchdir=.. \
+           file://0011-Use-off64_t-instead-of-__off64_t.patch;patchdir=.. \
+           file://0012-hgfsServerLinux-Consider-64bit-time_t-possibility.patch;patchdir=.. \
+           file://0013-open-vm-tools-Correct-include-path-for-poll.h.patch;patchdir=.. \
            "
 
 UPSTREAM_CHECK_GITTAGREGEX = "stable-(?P<pver>\d+(\.\d+)+)"
@@ -51,7 +49,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "stable-(?P<pver>\d+(\.\d+)+)"
 SRC_URI:append:libc-musl = " file://0001-Add-resolv_compat.h-for-musl-builds.patch;patchdir=.. \
 "
 
-SRCREV = "87abba1ce2356fc860eb9d0777d8e9de47427358"
+SRCREV = "6f5e4b13647b40a45c196dad76b1cb39cc6690b9"
 
 S = "${WORKDIR}/git/open-vm-tools"
 
@@ -66,7 +64,7 @@ SYSTEMD_SERVICE:${PN} = "vmtoolsd.service"
 
 EXTRA_OECONF = "--without-icu --disable-multimon --disable-docs \
          --disable-tests --without-gtkmm --without-xerces --without-pam \
-         --disable-vgauth --disable-deploypkg \
+         --disable-vgauth --disable-deploypkg --disable-containerinfo \
          --without-root-privileges --without-kernel-modules --with-tirpc \
          --with-udev-rules-dir=${nonarch_base_libdir}/udev/rules.d"
 
-- 
2.25.1


