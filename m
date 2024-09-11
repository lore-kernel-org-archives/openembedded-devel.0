Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F79EEE0217
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 08:11:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.16824.1726042293614518459
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Sep 2024 01:11:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=99845107e5=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48B6gQiE020490
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Sep 2024 01:11:33 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41gj44c2g8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Sep 2024 01:11:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OamXl9EfK0Nok0t19M9xhwwHT5QCPPqp6xomuuIwO2Cg3dPciLGR6xw/0OkF0BeFTqxbclFzcQlfngS1+5aaGGytu+ZOqHqmC4jWIxhErEvV6gW4AjE0ehph/lGpErBc176sXbsPuu+BNkXwZhx2qRCfZUCvDsSnzvOqC5uvXIIdch/pIGZeay8sLTusd6hckwC5I0pYwIU50lq4zLtRgYrq66if7vzORVhgV7fOP/AHkHfkCUEA7wUFbItovZYWXOvcSfJ6K42l79eCyUW5YrZFYJiHsLCLm6tW9MvMrJMhc0wwA7CbQtdcoWNlbwWTgliOKEkharOhzqNJRn93mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Gd+d0crFijG057FCW2151vrAxKpCG1BL3KJoMzGZo8=;
 b=M9oDDj+iVKSc6WePHH5MyQ+JIpgOcAwgF3zT1yW+OQBNUxkiapo9MHZ4tFq1SBcxmcw2yr7tOfUCh5fbZ7rCEUqaSFR5q0jt7JSdrh84CpXftYxKIXQcLmQcdtXMNwIcCN6JubXuQIGC7vZonFx34g6t0lqjoTngB+gfwWmXezZKicksSzBrDpGYxjKRrAlIa5zXopbA78QabgCgGfa1iVVokvcMDb3+Yjtl3FOJ3TxENyICtaTkLVEL5IAmZd0HtA4j2TmEbvyMuHi33TkrUlijX4vb9tPYoNu4z6cb85Fds71p2Bi3eSpFva1zunxcGcDZTSlI53ht30SIt/LaLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA1PR11MB6396.namprd11.prod.outlook.com (2603:10b6:208:3ab::10)
 by IA1PR11MB6196.namprd11.prod.outlook.com (2603:10b6:208:3e8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Wed, 11 Sep
 2024 08:11:32 +0000
Received: from IA1PR11MB6396.namprd11.prod.outlook.com
 ([fe80::79e6:58f0:788d:b45]) by IA1PR11MB6396.namprd11.prod.outlook.com
 ([fe80::79e6:58f0:788d:b45%7]) with mapi id 15.20.7939.022; Wed, 11 Sep 2024
 08:11:32 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/2] mbedtls: upgrade 2.28.8 -> 2.28.9
Date: Wed, 11 Sep 2024 16:11:18 +0800
Message-Id: <20240911081118.2972187-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240911081118.2972187-1-yi.zhao@windriver.com>
References: <20240911081118.2972187-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0167.apcprd04.prod.outlook.com (2603:1096:4::29)
 To IA1PR11MB6396.namprd11.prod.outlook.com (2603:10b6:208:3ab::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6396:EE_|IA1PR11MB6196:EE_
X-MS-Office365-Filtering-Correlation-Id: a3904233-f1e8-4818-b99d-08dcd2395866
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8gHt4rx7QQ4WVaAx5LvXX+PNpqeZup1k6jZSQeUnXRY/6kQ95RSwnbH9Be3W?=
 =?us-ascii?Q?ETfvnLYciRGfcOIRXTuI7kFzFgR5PlRMtP9nzoFgssOrq4+odJRlEWO2J97R?=
 =?us-ascii?Q?9ioSmlwM+uXGuzWSkWz+bkcaqh3LEgaswWPRAbEW9xVyNXV0z6/WNl42UhLi?=
 =?us-ascii?Q?Bs3NryjjbRgBQnxF7VQedTWL0rnfA4s/15hcyn57gwaj9TlnzGyoXiswscJP?=
 =?us-ascii?Q?aIo3b6szd6dpI1rAcazcHPbz5mCDC5V8flTz4DdH8VkwyThN1Xc6Nt/V059y?=
 =?us-ascii?Q?EVRGQRIKv7eCeKf6KqIy6G7i6+7cqNYYb0O77ZRln1HyKJ+HRFfo+llpvesw?=
 =?us-ascii?Q?NxBkeijHC0WGUQyvUyH86CV7K9WO6RndrSw47zCCPKjgdfy8C+NsE01SJHbu?=
 =?us-ascii?Q?2d/2Xzvh8HTUT2L7LfqQC3wY93l+88ggLXD7wCfP4MvyoLzfBsGnn5pwJLoq?=
 =?us-ascii?Q?f6kdRAVsbYi0fza9taiC8oice74NvrjkemaHZDg2jw4LDGyhAees4BZ2uToM?=
 =?us-ascii?Q?ROEXtwheSSQdow8S2qV5iVrB1gj/1sFT8Ul5oBxqPapZL3j6BcwLF38b+FrK?=
 =?us-ascii?Q?es2PXjeHHkDAWDYWmdoSLf9Lgp/vWaW3g3aPYTsFxiJn/90CZvzbQjmlmPM/?=
 =?us-ascii?Q?Y4nfoUNr1HfxYZsVl0HF2yIAwJaaxDsXYRwWaqsvOxmvv/JH3gXNAs1GIaER?=
 =?us-ascii?Q?emuvAvpeInX3x9M/OD/rGbzGYzN6khAhqo1JVP/fjRknaS6oJ8g+edyH6h8P?=
 =?us-ascii?Q?0r6spDBUEqR+rn+0fxUKJzrr0f/V3SCUYnbO7VsUxldpBB3yzZkTy1+cpkNy?=
 =?us-ascii?Q?eWiaLlHmvDFmGhFAao9Cifw4arvUQ2+hzcha9F1qYCk4HgPHHTdgWh9b81MG?=
 =?us-ascii?Q?IAE83wTRI2HhNVSRLPZ70u1HsrFNkIw1iChBrbJ81XCUIu8zbYSAdjB9mCj9?=
 =?us-ascii?Q?W/cn6Wh37q3nvtl6zeKLmZyAxqSJGQPLNvOk01MM4D4pXIIZt2PLNFIBZfH4?=
 =?us-ascii?Q?rP9gMmcdyUY9L9ZHTfBWrjtt7v9NO3GyEpeltjoX7Hy3U9Lp7lZBiMzTP3i/?=
 =?us-ascii?Q?vrTKx0D5YsCYLbq+t+eeTVrhopGAp9uLPoFwr/ER4856IQCg7R+8OS1r9ETQ?=
 =?us-ascii?Q?eYnGviONrwGdo2O+ZU1An9+V+kxstpi+wxjjqFPm3+Tg5dlPBoxVilORnyAN?=
 =?us-ascii?Q?Jmpbp3G9ZWvTKEAn/2AD/A69EHA3kpt7LXGyhDXXsmkMGaTM5PHgg2UqAS3W?=
 =?us-ascii?Q?3nhd5yEKUlRgweB/MmabXJjWBIhQ9L5DgYHium2mSUmXLXwK/1dVmSqXZwAa?=
 =?us-ascii?Q?Z61iA8+pPdsJk/XkO3s/PCNWM7ElTc2I88Z3G6Zdpo1GzlQETwAQD3WtkSUn?=
 =?us-ascii?Q?ZIknOVs9hgTT/32O/Cyxejmb0O79P4naBgFh+CFzDdBLdSskEw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6396.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0AysQn12DHLaWYJmN25LxoZGOoPJtVCD3KNLKPzmSl/8FvPb/v2e7MMJQKRs?=
 =?us-ascii?Q?VBsrfHtiXw6pWz4DKVR07+TF2dqVGx4hhe9X8BJoI23RGnxaHPrAuBgFVIK6?=
 =?us-ascii?Q?OVmDHxqs1Bh2KGA5dkLImLBExQdUrkSgEjWWGvT8zJgD34/Jga9k5m3Rmtpg?=
 =?us-ascii?Q?NtM/mBZoL/G51+PGJ7LOdfBYS4ZHBZbeoIxcZAswkYs8szusU6lojc6fMTTh?=
 =?us-ascii?Q?8w7TxZVuSTOvAp6NOJERjHST71KffjemTzdp9fEyoTTI3K9wkCrNL76Zy0+h?=
 =?us-ascii?Q?CPZlWZ0WFnTZw2zspo2uBfB7Ci6WOeRVifybd0TNQd08Wt/9PC2rm/eC1ogS?=
 =?us-ascii?Q?oZVsfajk/NqL28yRCKCMhLJ2IViIx0+1rYNK0nLbu5oLtDObkBdaqTCxCJGu?=
 =?us-ascii?Q?v4D5UjYY2sADlqbaLFBfBupIFOKDHZ3WK6xfvCACIIsG4kQdf4/S42rd3Vjj?=
 =?us-ascii?Q?RDmETRbb4IyorkMbRmu+ON5PZ6Yg+1ipsYtMuR2PQQngIXKyKJtwWHMrqKDe?=
 =?us-ascii?Q?o9laZns0y7o1hshxbpJANMy0X3To94J0FJph1O5j4errEmDSo78blwy+0zsU?=
 =?us-ascii?Q?oS2Kauo1WJb4eD2BoM0lNwsNLbNwWR0PrQw3qSOUXfxW7Jlt+JOpzZFQV8/5?=
 =?us-ascii?Q?z1kKkQaC0Hgk0icBmelu46z3bks4l9WN3nbHNgIoA7ZjJphos6tDSTgypF+h?=
 =?us-ascii?Q?gjsPTlWBF1lLuQIAMRPGuzxFz3hOktLwfKBX/LvbnmK1TXdoDnY6m9gSaVlz?=
 =?us-ascii?Q?fYOQEEyNk77zyczcu1KUZrTYz81JCdmLeUokvMcv6S+wDKBAxr0IIqZaq+aW?=
 =?us-ascii?Q?unBwEr5YEhdk+7yy7woUhqqhU8NRyNp0xi+bLK2vTPLi4VjbT2q8BToPSa98?=
 =?us-ascii?Q?y+DhE0oYvEX395CJ+8/Zae25lWYSSaVr61bCgIh2kMvhH+t8A2kbMWfCRjj0?=
 =?us-ascii?Q?uPsexD1lLUGpB3QY7PyFedYzW3S5koA1rueBH/DC6rxD6DlazA0PdJ3OPbD0?=
 =?us-ascii?Q?rDhKDdQdwfMPgtDyo+MaYjp9b1Lc8HNR/XIlHE2DKLEfdOhpCUb9/vokv+41?=
 =?us-ascii?Q?edGtk8/5sizgU3ZA5sgvloP9uh+U0spgXQ8d5LaG+hMkbqCeJ0+oqX83g3RY?=
 =?us-ascii?Q?Gek/z8cpOYbnCi3PeGoi7kNwfGkSXRxUWpAqeMwh1LePDqKKNZYt17CWkInl?=
 =?us-ascii?Q?yF4hEKUbhE7yhhCa7Vyg3PMBKaWI1EVt6eEX4bUgEKDZgZUj9bXAPkfOmFB1?=
 =?us-ascii?Q?qBx/3QwWI5p2GKLUz3g5d0Ixk0d4BQyjYBGNCu0/hQMXcZA66+qpBgCJLBBz?=
 =?us-ascii?Q?dqrWhGtnBxwH68fK+Q4K6p8MepWvG7MhpUw+gvU7lFCbWCCSReGI4IFUsEGI?=
 =?us-ascii?Q?tYFnsj403WipcUbu1V/tGuId7HCcMXvEYlyCfFMMDZNsxZdlS6atIrxXChRV?=
 =?us-ascii?Q?mmCrcR3Lie3w9Uma+qeqgQduXLQwwtEDqo5FtdkRTVC0nYehfPBKS3tThedX?=
 =?us-ascii?Q?EqxnqlylvCGyigyyROgU3/IOnu+RQzXwiVS2c090Je6kMgqe4+0/KLvRdSCJ?=
 =?us-ascii?Q?6L4UprqWCqyxJHSX8Mubc9f68yL7v1o4HcEukLYa?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3904233-f1e8-4818-b99d-08dcd2395866
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6396.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 08:11:32.1167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RLIhokY2Bok33VDwKDuW0Yhrj5ZXIflmDPMINh/Qpj6cbPHFyEb9iVNG8IQSBPSHzVmDSm8yLX66IjRorKhCvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6196
X-Proofpoint-GUID: _FmJsydpmFbck9DEGPQUSeSbzAcN9cW3
X-Authority-Analysis: v=2.4 cv=DZxFqetW c=1 sm=1 tr=0 ts=66e150b5 cx=c_pps a=1OKfMEbEQU8cdntNuaz5dg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=luwuiPvviD7z1530dmYA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: _FmJsydpmFbck9DEGPQUSeSbzAcN9cW3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-10_12,2024-09-09_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409110061
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Sep 2024 08:11:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112240

ChangeLog
https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-2.28.9

Security fix:
CVE-2024-45157

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../mbedtls/{mbedtls_2.28.8.bb => mbedtls_2.28.9.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.28.8.bb => mbedtls_2.28.9.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.8.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.9.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.8.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.9.bb
index db79241f2..abb5ad244 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.8.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.9.bb
@@ -23,7 +23,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"
 SECTION = "libs"
 
 S = "${WORKDIR}/git"
-SRCREV = "5a764e5555c64337ed17444410269ff21cb617b1"
+SRCREV = "5e146adef63b326b04282252639bebc2730939c6"
 SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls-2.28 \
            file://run-ptest \
           "
-- 
2.25.1


