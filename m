Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFC17106F302
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 08:34:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42894.1774514085842181062
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 01:34:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=i3qYXP5A;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7545fc33b6=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q4upDj2920548
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 01:34:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=9JheNDsYVng4eainAYtY
	hYD+rqOo7GrmGsMskrohtZw=; b=i3qYXP5AJPNuLon4NRlejhJyRVG2Y1RD0qrU
	9ZLwtBTji1SWVsJzahODWF6UX1nf3cpkosB5VJQXZPOlAFMsWJFp5DTYu0eX18+X
	NllNBLerOjEMhAg35qpr0wLKFZCBqG8M/5x5IHSvflUB9+1JKA+mDB83+BQAjKCP
	ZtD439mbJBQUJENs3/4vl8EnNscJvyxiIYa4v7fWu11T+Y7ALgqkT91d9HuRLgo2
	pNGZBfogA2zjuLlmgd0NycqTHdlEIzKURjLMNAaBXIx6tYj3A/QQE80tWcSEmlrT
	HaKmMP2JTkRLoMgkhVbiiLCseRsXQARixMkqlGsyPwjWInNJHw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010027.outbound.protection.outlook.com [52.101.85.27])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1pkye264-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 01:34:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m0ept3PAzk/5c8SHr8+KzbWzt3psXu4ADEKLmSN4pkF9tZdTV3d9gvV/K2TSIht2NmqBedxbdJW3R0pLj+eXF1gIVOlIDRxq+k2lW1hLphtNTlpaolR+bUZ7PEPJ9rO7dkV3IKp74YnSFyLV63xqtd9IDjoaJ+/UgDujBgA5Fto8RxLozIlASPPG5Lv8NfFuZa6dKXmbr7C1aJLfzEo4UVG39qM4j0b12gYWq1L2NMqULevXm/vXKht/NuDOTu2N6ogddg1O1ryCuDSDPNLVfQfFKkouAThwHgPeZCr0kZBOVLQuH6bQE2lp7Gxo9+OyRKjXzv8T5WNf7GeRnLOdrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9JheNDsYVng4eainAYtYhYD+rqOo7GrmGsMskrohtZw=;
 b=VokYkJoopyVWfW7A7rzPC6Ovb654KWXlsrPiOB7SjoNrY5M7jTfx4XCnApiFvA5D64Ny3rNZcy+asio8MIQgCzQ2p8dd+KjVKBGveu08W14qALSfO5219vBanoqpavt2U/j1aneBUZzz6ytbeXVI4aKrnZ2buGu0vfWMQGPfleTV0Ghuq621PylpvVOvMr+hTwXCnpEXyJXxstVSJKkqea+MH50rih7qEPZgKUYc+1KpnToofayVn+ekQjtV1/7b5VUiYL3jzas+Dq+bIB3PAb7GWP3IEiqrjr/Rb84UGRX4PGIg8GP7j5ORk4lQitRGvRDm0/NvDV9M/5skO3w8dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by CH8PR11MB9459.namprd11.prod.outlook.com (2603:10b6:610:2bb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.8; Thu, 26 Mar
 2026 08:34:43 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::7b99:70e4:edb2:30c2]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::7b99:70e4:edb2:30c2%6]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 08:34:36 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] openvpn: upgrade 2.6.17 -> 2.7.0
Date: Thu, 26 Mar 2026 16:34:18 +0800
Message-Id: <20260326083418.195075-1-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0007.APCP153.PROD.OUTLOOK.COM (2603:1096::17) To
 CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|CH8PR11MB9459:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bdd5427-159d-4ccf-d32e-08de8b128382
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	/qOHyIj0SoRKyGYW/4P4Ea13nwSXiLxuLQxN7Ljg2MywMOj5TTjjimDd7n87pzsLKjOFbdWW7OURzzQLQxgxG7VXos4o8D8Lsf/f3IPF92FIWoCps63b+tZ/r6cEwNei/hqOdTNTLU0aD8DA7lDSQYkblAWWWa1Jv3q06JrqEObICVOr/nrwAgse1uijPOhpYQ6vtpRzdI4JIZ607HYrOZnu9c1wnERvoickxU2L25z6WzysmMjveICmc2VsYZHErVCLLXW9acrrsRQbXTzYSuFd47g6KsNMPD18wsZfQOIdRee3p3n3Lcr6aRU1Fkq58N5IQjW1AuHG2VVby8AuBrqHB2Kc/+3JrSZrMb9NzAPLJVWNQ69PRh9Tpw9IPs2Ue5arOqjxoyJWCPztOsr5oQ+KqRh6GPqFa8gAzQEKRvph6Slb/L4v/Y3co2MuhWPmI0SpPOWuC0jynqpFF6lWe+TNq8PqG+D8MaIdGN6bHse2Lg6vC08D/4avXn0Oa78v4k9gJxdx+K+QhHAIUWu+vao+qOPFR8OMfvD33JhduAp0eVTURXLIzM7K3q6CGmw6Crn3Fi2eKE8F47j3D0W0V+WMtUNA+HwRCaHz5Gvk3mexF8fBwJelAMNFeU9dxN062op0tDq8FOLfRFahKodyyP4HY7RbyvqukjFG2Cb8KHQiD683m3IHhrfQAxJN/8zhmHgQt0DjfVgGyYkVKD6aWWettA9q+tHckRoqAB+n1TI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zwWIpQ9plQr/p0Niq+z0snKYq79pNKxZH7O4TiAuf3kAEy+sQubmiJ7HsaTt?=
 =?us-ascii?Q?YGUcbriICNvcFTKCObzGOK6Q/uwuxWuzG7Go3j8xmi8iHvwS+MbyMovV1LS0?=
 =?us-ascii?Q?7v5Mzs5cdz8UEYw2HHoAnLaRC29PxuOz12utr3HkPqOxUQq9zIyK4sLqMH3b?=
 =?us-ascii?Q?fbZep9N9hSdyizwwc/P+au3flV3Ln2XKgP/lZX1RdQ6gAnlgVzvWdguG89xX?=
 =?us-ascii?Q?ZL79YOi670FBK4WlMmvRwrawnUbSHRWhBgXTYFOdKWF7vhA/PVHs9eoRxv1C?=
 =?us-ascii?Q?JAJS1DV2SusueuqWZrx3QgKm57B1sWHueeDvtXRlWNJ/JK9VYSoNkY/RohDH?=
 =?us-ascii?Q?Eudod6xx1KBx0XzOloCqTt960H9vrfUWZblu0+a1N3swt6Zd60V+b0k5JRu2?=
 =?us-ascii?Q?FfVWMWiDDoBkr1aHclX1jwmFguFGqYL91Mj4Waqj2iW0pSG4cZ338On/DgY8?=
 =?us-ascii?Q?QzRC9xF8sLozgv5PPQgzcfSU+MOl6GL/pClnFdaKnEPyn7H5FJbpxAHnRbCc?=
 =?us-ascii?Q?4EPb9g/q0FhdKhPNqAJ8nwV9Qjbizj90ZoiUUu0YJJywR205fiHviZHTRlFg?=
 =?us-ascii?Q?/8cXQM8YFzqGGCzQEybsN+ZN+Tf9ra+SfHn3D0QBoFe18v/2wPaNmvUkQUqL?=
 =?us-ascii?Q?zg3Xkk94uXUR2xdl8puRbI0VIa/4EOSegT4ENJvAFclEOfD1pzouIl84Gs5u?=
 =?us-ascii?Q?86diGUIC3GS6gwMhCkXLkxFuBtN5OUzmkXomaL90B8+67OCHd7dIJroiXqLB?=
 =?us-ascii?Q?AHAghUaS38lo3uFoGIEtQCkbFT/Ckhm6hubhIdNGS956OeKSLTKWOHC9LEVp?=
 =?us-ascii?Q?ugG0wxR15uXNPPvWiNGxJotL+RTj4xVK27dJ4MuB8WKGuBwsU3T6I1m4eayX?=
 =?us-ascii?Q?8OM1dwptMhs4FxVG1IZHrM8/K8pJmgWmu7nGtNvT/OYu4e+7VbXbH4RI9MsI?=
 =?us-ascii?Q?lWEJu1L0pCleVvQZksovmsZonUDcK3gxzcqQfDscj5eZGHcSANeq73QnBCy8?=
 =?us-ascii?Q?eGO1a0TqlLcIrg/gX9EmLeg7Widb3tLxvphgZTynXcZ7WXrK3sNxpDC7d7dN?=
 =?us-ascii?Q?oFPLHjXvXAWhOVrNWeLDd60fEDybn6llEMtcB6AjXdPP3wMkH3SQnnNKpaZC?=
 =?us-ascii?Q?ekJ0KQ1mdzFOSrzMZZby/ivIcYdpHPGAzUvfdj7+p5SlTzOsqabEvXZziVjZ?=
 =?us-ascii?Q?wloSzFaUYsag0EUmRZSpaJ24SqSUyifYpV5teKHjYWID/rr6xKS6/VI37dR1?=
 =?us-ascii?Q?x/juphu5EKBJyUIv7jE+HOMNbdXyU+8xTOAl7EVRVbg6inXg8xnfeNgJtNJZ?=
 =?us-ascii?Q?sD1iz8Y6HNhgNi24dWR/rzfyuEh18mQvkrYjEzr5792KjcQY3hOf8jGTDXdh?=
 =?us-ascii?Q?IU8P69FUJfa0pxW3TIHyXYKHzmWaca/VUqPmuR6ut04NI667bvefhrsgQSr5?=
 =?us-ascii?Q?gP1kXLar02N+L17o7tYv3JYWOrVU1jU49mdCD9uvzm+bo2zDV4w2IBLXSzDB?=
 =?us-ascii?Q?3Elx+tGcwUerKkQOEInxvE90KbC5qZzvJothYWTHz5ySK1Ume8myx7RszKnc?=
 =?us-ascii?Q?/R5Rn09aM7V/EnvBOLb+li/8N3lt9irFHQHG6kjYhXFfSrD9C7jP/6c6K8za?=
 =?us-ascii?Q?DYfCuWQjZVAg9066IHmHhATM/MPGTY96Lr7cTN1O0S4P9vXYXM3zZZtr9eUn?=
 =?us-ascii?Q?2rzhMbL6cKbkjlF8Lf2xbUaVI9TCUSnHN2EEs0XwA9vi1T5QPoqOqq5DqIzm?=
 =?us-ascii?Q?7VcW77nIDLDcPCZitEJ/UXSB2cSgFDg=3D?=
X-Exchange-RoutingPolicyChecked: 
	K8GcsoTcYWRFJcLRZ0hXbPBPgvYlPFSEcjZc+VVrw3WfjqqR9zn7tr9nddrX+TmyEo42ZVu0g7hMPdJX8mFzm/lweojZmwGxTVGQN4WFMHJH8R6iZ5u/+7MHVw2P1FValPCoFTR4VqmG0HhIEnOgzuFhuHp1mF3U4IRPmevmJ1Q7/01ergxlowrT+nV/DRDf5ONPZJurhVewDY11uU/XFRC2C3fgvEW8p8/W63yVUhrwzOTSNAQ6fVtd8HsC+pvfegSynW8meDoFaUJPGXWd3Ptrcu+48Ucv6JGRdsHtQFLkrT3HnDDY6wN4xMnCrD0XeEhcosc3vzD/JKay8aj9BQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bdd5427-159d-4ccf-d32e-08de8b128382
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 08:34:36.7409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 19DS22XLqqupi/meH5O81c6RzDFYCQXwj88N+iCEifuwZIhSLfF/RSHVu7kwlEQNhhPw54rILC3uKKeg8Ft4cz7iruJscFRJN8pm0+PGMY0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB9459
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA2MSBTYWx0ZWRfX6nnZcP7ZoohI
 cPd0p++e4V7V3hdr5k3s/I9RB8TVGxY7ieGtQZFkD9klVzOZ0azeCliEkKrYw2oEdDU94nVSEeg
 NOEEvpS9SrkCKeZcq7fx08u9QUvvNG981TyoQ8bcqrKpXCIA8QDR9kNMK6VTBqNYHtUE6ENysXd
 Cpy9CWIsjvmxEZlaslxFVTn29sMCJPLMIPCFjWYzEqatAMMIYvqy0ivP8LE3W823D6hHgjb42qR
 72tws5xwIEDjhK+zLYFw4cyVKuvjCJjqXtIhqjCEHzxGlMIis8RDBFZBUZ6jG8aOaiqUc/tdavk
 erWXoE0ZkG1+spvQY4ua51BrKNwPaeqzocU3aJ2luXwHVRcjzwk6kuofyR7A3GfzJbjmtkYRF0y
 BM9Hey+MOMGfqE2iQ/iIKIDvWx3kZoDmD3WPkvrlUJlD2hc3lSxTfD6EsAzmnRSvtgmBZ+ldCpS
 nlvRlY78wLlWUpjtjzQ==
X-Proofpoint-ORIG-GUID: Hb4M-30FTATenqvs0ZFnJswM_a_glrZU
X-Authority-Analysis: v=2.4 cv=Scr6t/Ru c=1 sm=1 tr=0 ts=69c4efa5 cx=c_pps
 a=3isWwmYGSdluMw1j68YAZQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=uDo-SIiEAAAA:8
 a=9dNbsytUAAAA:8 a=t7CeM3EgAAAA:8 a=ZplHSuSNFuhjgwjJjvMA:9
 a=Rkhf4GTZPwEC63LfVcCP:22 a=gPpeecpFUKP6j8iU7U-x:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Hb4M-30FTATenqvs0ZFnJswM_a_glrZU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260061
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 08:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125638

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

Fix ptest:
The openvpn 2.7.0 upgrade refactored
tests/unit_tests/openvpn/Makefile.am, changing how test_binaries is
defined. This caused autoreconf to generate Makefiles where
buildtest-TESTS and runtest-TESTS no longer have rule bodies, breaking
the existing ptest recipe which relied on these targets for compilation
and execution. The fix replaces these internal automake targets with
stable interfaces: check-am for compilation and direct binary execution
on target.

Release notes:
https://community.openvpn.net/ReleaseHistory#openvpn-270-released-11-february-2026

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 ...-test-execution-when-cross-compiling.patch | 34 ++++++++++++++++++
 .../recipes-support/openvpn/openvpn/run-ptest | 16 +++++++--
 .../{openvpn_2.6.17.bb => openvpn_2.7.0.bb}   | 35 +++++++++++--------
 3 files changed, 68 insertions(+), 17 deletions(-)
 create mode 100644 meta-networking/recipes-support/openvpn/openvpn/0001-tests-skip-test-execution-when-cross-compiling.patch
 rename meta-networking/recipes-support/openvpn/{openvpn_2.6.17.bb => openvpn_2.7.0.bb} (80%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn/0001-tests-skip-test-execution-when-cross-compiling.patch b/meta-networking/recipes-support/openvpn/openvpn/0001-tests-skip-test-execution-when-cross-compiling.patch
new file mode 100644
index 000000000000..f8f2d2907f2c
--- /dev/null
+++ b/meta-networking/recipes-support/openvpn/openvpn/0001-tests-skip-test-execution-when-cross-compiling.patch
@@ -0,0 +1,34 @@
+From 93f7f6ca0c916427d28610d3e263fa556587532d Mon Sep 17 00:00:00 2001
+From: Haixiao Yan <haixiao.yan.cn@windriver.com>
+Date: Thu, 26 Mar 2026 13:43:50 +0800
+Subject: [PATCH] tests: skip test execution when cross-compiling
+
+The auth-pam unit test Makefile.am unconditionally assigns the TESTS variable,
+causing test execution to fail during cross-compilation because the target
+binaries are not executable on the build host.
+
+Upstream-Status: Pending
+
+Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
+---
+ tests/unit_tests/plugins/auth-pam/Makefile.am | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tests/unit_tests/plugins/auth-pam/Makefile.am b/tests/unit_tests/plugins/auth-pam/Makefile.am
+index ba32013ac920..7da299ccde92 100644
+--- a/tests/unit_tests/plugins/auth-pam/Makefile.am
++++ b/tests/unit_tests/plugins/auth-pam/Makefile.am
+@@ -4,8 +4,10 @@ AM_TESTSUITE_SUMMARY_HEADER = ' for $(PACKAGE_STRING) auth_pam Plugin Unit-Tests
+ 
+ if ENABLE_PLUGIN_AUTH_PAM
+ check_PROGRAMS = auth_pam_testdriver
++if !CROSS_COMPILING
+ TESTS = $(check_PROGRAMS)
+ endif
++endif
+ 
+ auth_pam_testdriver_SOURCES = test_search_and_replace.c  $(top_srcdir)/src/plugins/auth-pam/utils.h $(top_srcdir)/src/plugins/auth-pam/utils.c
+ auth_pam_testdriver_CFLAGS  = @TEST_CFLAGS@ -I$(top_srcdir)/src/plugins/auth-pam
+-- 
+2.43.0
+
diff --git a/meta-networking/recipes-support/openvpn/openvpn/run-ptest b/meta-networking/recipes-support/openvpn/openvpn/run-ptest
index 19f66b5c565e..b0f5699e57dd 100644
--- a/meta-networking/recipes-support/openvpn/openvpn/run-ptest
+++ b/meta-networking/recipes-support/openvpn/openvpn/run-ptest
@@ -1,8 +1,20 @@
 #!/bin/sh
 
-find ./ -name Makefile | while read -r x; do
-    make -C "$(dirname "${x}")" -k runtest-TESTS | sed \
+# Run unit tests directly
+find ./ -name "*testdriver" -type f -executable | while read -r t; do
+    dir=$(dirname "${t}")
+    srcdir="${dir}" "${t}" 2>&1 | sed \
         -e 's/^\(\[       OK \].*\)$/PASS: \1/' \
         -e 's/^\(\[  FAILED  \].*\)$/FAIL: \1/' \
         -e 's/^\(\[  SKIPPED \].*\)$/SKIP: \1/'
 done
+
+# Run crypto loopback integration test
+if [ -f ./t_lpback.sh ]; then
+    sh ./t_lpback.sh 2>&1
+    if [ $? -eq 0 ]; then
+        echo "PASS: t_lpback"
+    else
+        echo "FAIL: t_lpback"
+    fi
+fi
diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.6.17.bb b/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
similarity index 80%
rename from meta-networking/recipes-support/openvpn/openvpn_2.6.17.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
index c454a9327647..0cbe4641cd6c 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.6.17.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
@@ -2,20 +2,21 @@ SUMMARY = "A full-featured SSL VPN solution via tun device."
 HOMEPAGE = "https://openvpn.net/"
 SECTION = "net"
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=89196bacc47ed37a5b242a535661a049"
+LIC_FILES_CHKSUM = "file://COPYING;md5=924af2c382c415a0a68d0d9e7b483d23"
 DEPENDS = "lzo lz4 openssl libcap-ng ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} ${@bb.utils.contains('PTEST_ENABLED', '1', 'cmocka', '', d)} "
 
 inherit autotools systemd update-rc.d pkgconfig ptest
 
 SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
            file://0001-configure.ac-eliminate-build-path-from-openvpn-versi.patch \
+           file://0001-tests-skip-test-execution-when-cross-compiling.patch \
            file://openvpn \
            file://run-ptest \
           "
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 
-SRC_URI[sha256sum] = "4cc8e63f710d3001493b13d8a32cf22a214d5e4f71dd37d93831e2fd3208b370"
+SRC_URI[sha256sum] = "2f0e10eb272be61e8fb25fe1cfa20875ff30ac857ef1418000c02290bd6dfa45"
 
 CVE_STATUS[CVE-2020-27569] = "not-applicable-config: Applies only Aviatrix OpenVPN client, not openvpn"
 
@@ -46,7 +47,8 @@ PACKAGECONFIG[iproute2] = "--enable-iproute2,,iproute2,iproute2-ip"
 PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
 
-RDEPENDS:${PN}-ptest:append = " make bash"
+RDEPENDS:${PN}:append = " bash"
+RDEPENDS:${PN}-ptest:append = " bash"
 
 do_install:append() {
     install -d ${D}/${sysconfdir}/init.d
@@ -70,21 +72,21 @@ do_install:append() {
 }
 
 do_compile_ptest () {
-    for x in `find ${B}/tests/unit_tests -name Makefile -exec grep -l buildtest-TESTS {} \;`; do
+    for x in `find ${B}/tests/unit_tests -name Makefile -exec grep -l check_PROGRAMS {} \;`; do
         dir=`dirname ${x}`
         case $dir in
             *example*)   
                 echo "Skipping directory: $dir"
                 ;;
             *)           
-                oe_runmake -C ${dir} buildtest-TESTS
+                oe_runmake -C ${dir} check-am
                 ;;
         esac
     done
 }
 
 do_install_ptest() {
-    for x in $(find ${B}/tests/unit_tests -name Makefile -exec grep -l buildtest-TESTS {} \;); do
+    for x in $(find ${B}/tests/unit_tests -name Makefile -exec grep -l check_PROGRAMS {} \;); do
         dir=$(dirname ${x})
 
         if [[ "$dir" == *example* ]]; then
@@ -93,21 +95,23 @@ do_install_ptest() {
 
         target_dir="${D}/${PTEST_PATH}/unit_tests/$(basename ${dir})"
         mkdir -p ${target_dir}
-        cp -f ${dir}/Makefile ${target_dir}/        
-        sed -i "s/^Makefile:/MM:/g" ${target_dir}/Makefile
-        sed -i 's/^#TESTS = $(am__EXEEXT_4)/TESTS = $(am__EXEEXT_4)/' ${target_dir}/Makefile
 
-        for testfile in $(find ${dir} -name "*testdriver"); do
+        for testfile in $(find ${dir} -name "*testdriver" -type f -executable); do
             cp -rf ${testfile} ${target_dir}/
         done
     done
-    sed -i 's|find ./|find ${PTEST_PATH}|g' ${D}${PTEST_PATH}/run-ptest
+
+    # Install test input data files needed by user_pass and misc tests
+    cp -rf ${S}/tests/unit_tests/openvpn/input ${D}/${PTEST_PATH}/unit_tests/openvpn/
+
+    # Install COPYRIGHT.GPL needed by test_list
+    # test_list references srcdir/../../../COPYRIGHT.GPL
+    # srcdir=./unit_tests/openvpn -> resolves to ../COPYRIGHT.GPL from ptest cwd
+    # which is ${libdir}/openvpn/COPYRIGHT.GPL
+    cp -f ${S}/COPYRIGHT.GPL ${D}/${libdir}/openvpn/
+
     sed -i 's|${top_builddir}/src/openvpn|${sbindir}|g' ${S}/tests/t_lpback.sh
     cp -f ${S}/tests/t_lpback.sh ${D}/${PTEST_PATH}
-    cp -f ${B}/tests/Makefile ${D}/${PTEST_PATH}
-    sed -i "s/^Makefile:/MM:/g" ${D}/${PTEST_PATH}/Makefile
-    sed -i "s/^test_scripts = t_client.sh t_lpback.sh t_cltsrv.sh/test_scripts = t_lpback.sh/g" ${D}/${PTEST_PATH}/Makefile
-    
 }
 
 PACKAGES =+ " ${PN}-sample "
@@ -115,6 +119,7 @@ PACKAGES =+ " ${PN}-sample "
 RRECOMMENDS:${PN} = "kernel-module-tun"
 
 FILES:${PN}-dbg += "${libdir}/openvpn/plugins/.debug"
+FILES:${PN}-ptest += "${libdir}/openvpn/COPYRIGHT.GPL"
 FILES:${PN} += "${systemd_system_unitdir}/openvpn-server@.service \
                 ${systemd_system_unitdir}/openvpn-client@.service \
                 ${nonarch_libdir}/tmpfiles.d \
-- 
2.25.1


