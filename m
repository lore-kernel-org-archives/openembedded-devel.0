Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28B5DF55132
	for <webhook@archiver.kernel.org>; Sun,  8 Mar 2026 05:55:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24309.1772949298714883260
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Mar 2026 21:55:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=izlt5VuA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7527cf9310=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6285ZrcP1673061
	for <openembedded-devel@lists.openembedded.org>; Sun, 8 Mar 2026 05:54:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=es5Jvx2pX
	SX8MxCTkmFoMlYe2PST86DXGLU6bIUNBGc=; b=izlt5VuAETBTxZpF64d2UCkiA
	VIw0XLJeLpiHO2MLx2U85S1I14AHmObEqiezWYSUTE9kFcIaT0F9VZnC9/vYL+iM
	0dkyepfQNzHB+OJexC378b0cPfRjhqG1hkg9pDdy8SQvrYePsUUvTMchlOYH3LZV
	NMhGbc81UavxBnqDK243LdYsnuTAtLHj7oik15ySzJWDzX5nL2arLob+EP23Nt02
	I5Wyl09tZ0WjEtvfgXR8zoc+S/KPOwd/Vwz/5pEws99KbPxZeCdZyuu43mxM+wZt
	q/ne83bKH9pDRgERbOiG8qTdmlK/O5dN4B3UsPPs1NWuyTuN3u/mP+R6PG6DQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012018.outbound.protection.outlook.com [52.101.48.18])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4crb080t4p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 08 Mar 2026 05:54:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MZifAiUq0w86FPhbUCuIdxcEL/8/Vu9/ZKWT9ZW2Qw3DjJ1yczPySl98uK5K4yxOiZToOA/fUo1I94T8XCWREp07Mx/Lo+RxI5gWGnqoPKPV4zHV84mt4iZCLvnFA2FFW2ZMK//XKrmPtRn0mwLMo/LTk2jCgcgZ0QRZwGktHvRr/rrBKLYiaw352qpYsofw1P4q89/cg7p2kFMH9FERq+RT3aOGaSqLT/9eT0PAJ8Uala5CGpn2Uh18DYQGW81yThdAqIPOVxEo0afMbb0BJHt5NEcQRED1SEsg16xAE+zDmhqiiMguG+OFr5HiaA+CTcJctbH4DSwhgznq4h3h4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=es5Jvx2pXSX8MxCTkmFoMlYe2PST86DXGLU6bIUNBGc=;
 b=tFf36qlZ1ftUn5ztY7MuvC58zd5frcK/vwJHw58m89bxPGDFj7VEXvm+22PnjjbmzIufXmgT5BZd83vCgh/wk0QpnKo5gVINkS356oUhL4S05aDUKBybOkQnV3ObJB7CbZgzeOHNbzdXR+ZvBBtClrM9pzGPQJdaQkjGbXaimpsm8lAPgSDo1hIacYx329Sq7pJXkkzc7+mh0Puzo2EAL37UCCAa6o64QrnjspS9ZQb5ei+0ORiQ7s0fNo2ZFYtbiV4Lv+M4ADc2AAoRYxEqi7QGCUXEFfL8BzUMa/AXl9sN9rQ2Z8fIRKPhXkVjnq4RRXmu5Y+ZAN5Lc8Brk2L2WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DS4PPF7CFF9C87C.namprd11.prod.outlook.com (2603:10b6:f:fc02::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.7; Sun, 8 Mar
 2026 05:54:55 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9700.006; Sun, 8 Mar 2026
 05:54:54 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-devel@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [meta-oe][PATCH 1/3] bcc: Add ARM64 syscall prefix detection in C++ API
Date: Sat,  7 Mar 2026 21:54:10 -0800
Message-ID: <20260308055412.2450108-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0020.namprd07.prod.outlook.com
 (2603:10b6:a03:505::19) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DS4PPF7CFF9C87C:EE_
X-MS-Office365-Filtering-Correlation-Id: d08be18d-8827-4531-2771-08de7cd738e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	x0xDaW4M8b+dEcgTaNxZcM9/YjT4SQ+KqBXx4PgvUlS4821a5fwpgqI03NJM16h6IyYpgPzxdWuy5bZ4tqtLU4p4FGMj+rIBmBYue1QDa2iLC6jeVKtQffbdETX1ORrE3ARsKyVjcuIjsBXwVZKcB+t1B0nQHln6yV+TnAli2TtIuRhQPNECAvBUKSxyjqkGdtOmdmlywgQ9HqgMUlxLknW0oJFAUv3SrrAN2oUhxlEF1GY6EAIPR6N4qBrYwRrXzlt3KUAG77Sv6RBuKERNWqX6AvRHt3ETaovJ3femv84hsaTONoejquFYWDLgtPK8f4vSRLe9rjXIWDI2swkWnEg7dRRm5XjMZWFFLYHN490n8RZPug5F8edrhn9Bml/q+9UAMFc3PG8Fo6nVFJCT8WYWDw71ODr5QRKbVrbPZufHLoF8EES02EzxKoeS7mKZABIsvLl36zRmSZUYKx7+EBOnuR+qHG3jsSoJxoKnIKTF4pH+7jpE9/Vs3AkBKr5zKqZon89/Rr+qu0tFg+MQAwoavpPRLiL6oZzZb37iKz2kKFxir9U9LXH8dSdxScHNwA5vdLA27DRzTsqADBZrNM3unUNdAn53Fs16b3vCRdng4v0fPw1M5C1/Q+/wzh8nuQXIWyrMpJuj6oqQAr2TOso1cZtFHaETnpNzt0daO+T23XDredewfesBBBhIPIkOb9FXu7I+3Gn5DT83tvyIyNaCwrWDyOiCaiSqc9ehZKwAMQm/52TVqy/hoxMWr8yO
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9Z3/LanuiRoeP4tlhkl+xWR+TryiS3v8V3/qxy4FNMCfohySF3ie++J5QUnR?=
 =?us-ascii?Q?mwX5tGgSVAOAx8y/cE3n7PB8erk5FlQSvykTp1GtrgEcEVOvlm4z6qPHsVEE?=
 =?us-ascii?Q?i/lREkUDKkWELPJFOEmJYuFBa61lw8Wq9F+3LSfv4VnMBe57SesBIveXtEYO?=
 =?us-ascii?Q?mVJEYsRfGulcb8F7ZxRKSlIsowqUfUXR7fVudYHeSv4bCQ5i1IZyp4VCak75?=
 =?us-ascii?Q?jxojdyC8LMc9GpdYcliNC4qruxzaolQI4P9P1EZDhqx0Oo+wnqLFkiL5X0dW?=
 =?us-ascii?Q?I/l5bGG8TdENY1M0rjvYmIgqo7GkIKXxt7wBwHLCZEPkYfgSYHVvJRPyBzot?=
 =?us-ascii?Q?iVpqQcLfJTSQsDPg+FngkjmPrwGJAhZb0qVxMoX5HoCLXrah7Nq4JS+L6lpY?=
 =?us-ascii?Q?mAuoUhh0y8mxH5xqlZfI3AHvu0bCsnMOcB12qowAJpDtO40/5CyK4P1eNpDs?=
 =?us-ascii?Q?ybBUWIKZZA9RzfXpP5TaxuvYYSvXUeK6LdyyMlyUdhysFWbrQ/yatZeKfnu3?=
 =?us-ascii?Q?wDcZM70zBCkTK18pKKFkHF+aOtqaoNzJ+Q3HmsylrQuJqhv1bgVMXvv07r+K?=
 =?us-ascii?Q?mMQBuRN5pCltMMUu6HZzJDDoXevlKbzVhaZXJ1w8GvDWLcbYUEoA1kaoYc+k?=
 =?us-ascii?Q?1xzxbxL3tcYCMVPGO97+xlKv2VSq92TQU6Sno1H4O5dxIm0AN8TYhjTtdkLp?=
 =?us-ascii?Q?YzS6b20OlmpoXxt0GQ5CH6g8LPWszV9BBRKGTZPT9CzE+maBNKqMCth5h9As?=
 =?us-ascii?Q?E67pFQkt9MioDyU5r9SVI9597ngn0HiKwNxXfzxua1Pf8eYkOMC/CBJhXkyW?=
 =?us-ascii?Q?pU1qZQ3BQGF/sL+wN/hXlrPNuEFp1wEmbnQtp4Lw8jWnXhv/gxegY2Tz3bMr?=
 =?us-ascii?Q?Dx0+EsLJasglo/mcU1FoDNJyWYlfN1UAdNPmQXlvVl5aMe53onQnD/4FEYPo?=
 =?us-ascii?Q?xmp+QIlAwqgjfpF4tgGFb5iBdIZDUnBQrTmUwnDZ/JSWZZYj3IkRVmbwEqfg?=
 =?us-ascii?Q?u9POVxtar9dmS+lQrf05t0QxVRdmYeUOpLkMnYhE0hSlW6JEJ9c1jAHECtk0?=
 =?us-ascii?Q?Az0q9QT4F3p+Uj3AiRG0+BD7oJzQH40iOh88Q15obCJGhQY4K3tHbe10cCVt?=
 =?us-ascii?Q?xHK7mK2QNJ0iCtIhhdp+RMMffdr3ORtDA29Sp08PojazlrLoesAx9eYsg/01?=
 =?us-ascii?Q?APiblNnF2vLHtp4H7b2i1REEVTw4AvDHZpvYt8+iyqkKPgCxS4j7cKU+vowg?=
 =?us-ascii?Q?1VCkeouOnZSL9QLFcFoLIO/BafP6wbPTi9CLIlOlF1Oblkb2k3eYoqQiztuv?=
 =?us-ascii?Q?llJ90Y/TtipuxNvPd7yxnVMesV1Dd9jbhDZLw5q3YKgLttOoM82ns+h9FFry?=
 =?us-ascii?Q?FGmb63CpC6YIDXd1Cp3ptRMFccNCvOuYjecCWy7Oe+NbDOOi7geEprkcFjV+?=
 =?us-ascii?Q?up+YwxRH2jrPT3IibogGnr5OmsgN0P6z/FgJvFdXJSkFdszRc5eS/6J+Vvmn?=
 =?us-ascii?Q?HNKsCxVLjkR6nVcXnQAhnT4720YQrx1WXqOOVh87XFTX0sSTLkR0KFC0nYMd?=
 =?us-ascii?Q?IQgdWeAssraNTMoYmhb7EVb5S+cMCz1JrHpiGYkZKvXb5iaHDJT/KUCFg/6m?=
 =?us-ascii?Q?qZzECkTaqBs9sAxUwYE8a2PWV/CzMQ+FicXAPLJu0SdTPwxQqatORWTCSO2O?=
 =?us-ascii?Q?tYrQ0BC6OsWAmPmgVNLSzaQdw3KETHD/d7ezDnCrnuggJUl2MDTcdfYwqbVu?=
 =?us-ascii?Q?BBEYRlgW5IpL4dtiHbNmjS3Jdci0a34=3D?=
X-Exchange-RoutingPolicyChecked: 
	JVcM0kndDyPQc7vZzfcVN4ZMQSgNP8aNizjXW4gUVIepcMf+mkxFn9FQrKe+48CF/o1sSCXc2Ter5R8JxpkO05HdQzJ8iDlGYio9mPdgsEZ1RfQRmZ8tuTXoOM28VPrQNcSCLUA6Z1FUCuRCFS1gm6IovPjk/wTDHlTPmIszw+GD0T+NaLG5MFe2mIpZ1nWJOLFVDp3q0SCyRwHPmA1uJ9PBhp+AG/wj59OvUZ5spk21XIPrHvjczMQBgn73LW4fqC89Uih6u5nuW9lTnDeLYjkNuLLhKk0op061B5FohAB0kv6fA4qUY5jIwP39s4FuxHuhyTVrHUP4z84fR1ctYA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d08be18d-8827-4531-2771-08de7cd738e2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2026 05:54:54.9445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NCtAh4Hbvi3h7sNQmATGsTMHAUCbBZXDS8YcRiqWLlrnfjzBxFyhoeuhKXPZfNU8XXLOBgDRtrh9eTAPRtKzwJwZnHEQtz+Ra5VMJ+MPEYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF7CFF9C87C
X-Proofpoint-GUID: aAU2YdOeRJ2xsPjn_mNvHmBvCZKjQoYL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDA1MSBTYWx0ZWRfX0j3Kh8+bmuHr
 X07attlV7tpnlakyq+Z9tmr8MB9OaJa2UwBPes3i+WG/ZV1m9QnsqDmx82XQKLe/QlqVHB80w5/
 6p6bCDhvDieTXUX7ifIUVq4kzTt24KRkpuo8murvVF5tlGRjCwtTxlSWNckDqlTIs/uyiYeMerE
 jwVXwXKXNpb0X8qU16DoZtkuzq+3hMg22ZCEWgYcGrI3fkfWagRh86+QgzeBuVLo2x6LckeVIM1
 a/3XNBs5iPdFRAOdgNu8/1nPWSphi/TUM7ecTF+Jh92o5T75i82ZdX/zVYX6Y/SJ7uDvruqeKE1
 sd2jaA+bQzWnVOtt9d7FG3bzDxN42o8wcka01OW52tNPpJjej5gb1ANPyjHGbKK/Q1tyageNbFD
 XjUgbNoe10moNLeKvQB+FGl8HJ++i05rMPBHsQ/yj0Sqh6oUuEYPk+3FTv/0+oHqOWQWrXrTwCX
 xyJl8VRec51CPN7TaOg==
X-Proofpoint-ORIG-GUID: aAU2YdOeRJ2xsPjn_mNvHmBvCZKjQoYL
X-Authority-Analysis: v=2.4 cv=UahciaSN c=1 sm=1 tr=0 ts=69ad0f31 cx=c_pps
 a=HLJbjerEQdjma44f6ZsklA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=qqbGpxH11M4NzJFm8ikA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 clxscore=1011 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080051
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Mar 2026 05:55:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124935

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Fixes issue where bpf.get_syscall_fnname() on ARM64 returns bare syscall name
instead of the prefixed _arm64_sys variant, causing kprobe attachment failures.
Now detects ARM64 prefix alongside x64 (x64_sys) and generic (sys) prefixes.

Upstream-Status: Submitted [https://github.com/iovisor/bcc/pull/5489]

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 ...64-syscall-prefix-detection-in-C-API.patch | 35 +++++++++++++++++++
 .../recipes-devtools/bcc/bcc_0.35.0.bb        |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0001-Add-ARM64-syscall-prefix-detection-in-C-API.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0001-Add-ARM64-syscall-prefix-detection-in-C-API.patch b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0001-Add-ARM64-syscall-prefix-detection-in-C-API.patch
new file mode 100644
index 0000000000..d6b52438c4
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0001-Add-ARM64-syscall-prefix-detection-in-C-API.patch
@@ -0,0 +1,35 @@
+From b901fb0088a7605eec00af7b644e25987995d693 Mon Sep 17 00:00:00 2001
+From: Harish Sadineni <Harish.Sadineni@windriver.com>
+Date: Sat, 7 Mar 2026 07:18:43 -0800
+Subject: [PATCH] Add ARM64 syscall prefix detection in C++ API
+
+Fixes issue where bpf.get_syscall_fnname() on ARM64 returns bare
+syscall name instead of the prefixed __arm64_sys_ variant, causing
+kprobe attachment failures. Now detects ARM64 prefix alongside x64
+(__x64_sys_) and generic (sys_) prefixes.
+
+Fixes: #5350
+
+Upstream-Status: Submitted [https://github.com/iovisor/bcc/pull/5489]
+
+Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
+---
+ src/cc/api/BPF.cc | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/cc/api/BPF.cc b/src/cc/api/BPF.cc
+index 2a77c2c9..11c6c542 100644
+--- a/src/cc/api/BPF.cc
++++ b/src/cc/api/BPF.cc
+@@ -780,6 +780,8 @@ std::string BPF::get_syscall_fnname(const std::string& name) {
+       syscall_prefix_.reset(new std::string("sys_"));
+     else if (ksym.resolve_name(nullptr, "__x64_sys_bpf", &addr))
+       syscall_prefix_.reset(new std::string("__x64_sys_"));
++    else if (ksym.resolve_name(nullptr, "__arm64_sys_bpf", &addr))
++      syscall_prefix_.reset(new std::string("__arm64_sys_"));
+     else
+       syscall_prefix_.reset(new std::string());
+   }
+-- 
+2.49.0
+
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.35.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.35.0.bb
index 8c6e44edbc..25528e1b10 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.35.0.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.35.0.bb
@@ -22,6 +22,7 @@ SRC_URI = "gitsm://github.com/iovisor/bcc;branch=master;protocol=https;tag=v${PV
            file://0001-CMakeLists.txt-override-the-PY_CMD_ESCAPED.patch \
            file://0001-Vendor-just-enough-extra-headers-to-allow-libbpf-to-.patch \
            file://0001-Fix-a-build-failure-with-clang21-5369.patch \
+           file://0001-Add-ARM64-syscall-prefix-detection-in-C-API.patch \
            file://run-ptest \
            file://ptest_wrapper.sh \
            file://fix_for_memleak.patch \
-- 
2.49.0


