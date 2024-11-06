Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DAFBD44D46
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 10:36:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.42779.1730889391807399390
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Nov 2024 02:36:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1040f5e824=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A671IE2009542
	for <openembedded-devel@lists.openembedded.org>; Wed, 6 Nov 2024 02:36:31 -0800
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42nkkjm1ms-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 02:36:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oJr6T5qUJfJ4FwOJEulvqzbsXEP7mZFSvKQ2Zbf+YrH52CW9y11TV4n9JPE/ehy7gnbmgxzVqULVc7rOCzXEs/rYW8up7qadsfvtRFUD2YMVbrkfUIT2nxWjh+ACmlUY0+Lcoj1S0bKgT7nhMlXnHVIBZ82goO9JEMyPoI/efyUkIi4JFyRJAtRCgvXqltMH7AbFKMrD3I2UwwRLa3Siyv1DdBTzm8eUQ48FI3nuBk+LUJPMoKm7xJL535qSe1EBTrfqV2ZF1L3gsIXKcgHVnzGht6hZUxdFTUP8hRoqx7eN/WvFBQZlMdoEAkCm77wgx9iobSU5t84rGwbNXvnSmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O8zuCYzL7l30Mhhm3T7OfRM6guIFQqirTR3s8RE5AxM=;
 b=xbfNM0kte9KgQSAERWEHTwC5vAb75ZtwTT+LgFqnHh9XZ4IAWIj8Hp+1vH12TZht0UWirzbaKk3Q7J6tjCOlJL/lEB3+7qXDiS8d6q8Cd5AmZd+kzECkuOrEBdNqGNunkY/BSHzf83q977i+QqqdRugvDla8wkOvdS0kDufmwR4SwzMa2Fh/xgkq04X8LafnAjQYkRCJbLe6tkyqeThiE/NZANTw24E9epBu0PQJ50RXnZV2md3dXuZpxGNZgJX4dI0NodqWwrVDc2d/XKNWPmHdAu+t3lcQB2HABSWzBpyD7/MFjlFAi1+1EefKpyix9YFjsVHtV9wGnGG3gOipxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by PH7PR11MB8060.namprd11.prod.outlook.com (2603:10b6:510:24f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18; Wed, 6 Nov
 2024 10:36:25 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%4]) with mapi id 15.20.8114.028; Wed, 6 Nov 2024
 10:36:24 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] parallel: Add recipe for GUN Parallel
Date: Wed,  6 Nov 2024 18:36:14 +0800
Message-Id: <20241106103614.281919-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0051.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::15) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|PH7PR11MB8060:EE_
X-MS-Office365-Filtering-Correlation-Id: 070e945f-ae13-4b54-129d-08dcfe4edce7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YUwZue3kuU3yuNXe/O1t7UETBkpuXwoehWOWw1qWP/0kSX5G+6OhAb427QJZ?=
 =?us-ascii?Q?poGRS1gH+Dz0VaSTBf4GAiM7qzD+n3WYf2DxUgYiS3m5Zr4hrZwvNOhHJz73?=
 =?us-ascii?Q?Qvccj3JJuNOWl9NeTPDmbzzu72k+jLRDcakKaavFE7uPOcdsXNARWik3XNCd?=
 =?us-ascii?Q?7V65qm8yHK6/EJsEbHdW/lIGxyCKwwHngSMIwIMlfkyBtdzwqkpEoAxeXa4r?=
 =?us-ascii?Q?EgQEaeGWCgl097VkfXFmkEQlPXkfeAL7hwvc9j6KkpR6K6D/j3WXsu2M6xdw?=
 =?us-ascii?Q?K7H48dDair/yYR3EmWDJxmUOoTYmJ5yYX09gIhsdX8RGhK03GH1gfzrU6gbf?=
 =?us-ascii?Q?jqGaWHYiqOmhCSoyKifxfy/ZsZ3dDzqKKdCdpsmEJZjQZfIDziPQSJQGwH1X?=
 =?us-ascii?Q?t9SJkV3pPtkJjuQ5k2YA3K+/JDZwoEY3PiQq91amHygnB05W59GRd5tMaDmD?=
 =?us-ascii?Q?/qZXyODnu/jfK01cK+3L6WRO2K7A9Rq35feJorXznJI15yAqP4RGCvXSaF77?=
 =?us-ascii?Q?qu7Xx4dV34TTlOg+nRxfU9tx8kwrX/O9E7LXaVpQG/6TMz/UfNRWyIdroLz+?=
 =?us-ascii?Q?PWQbDnN9sNkLxqe3JHpISoavp6ZMO/BFSvQlw/C3dbJT1WYKYwlDATp89lAu?=
 =?us-ascii?Q?moGb7SyYLZif3XrsEW/0tomYUw7GRdMn9bQuyHeV4yMdqGbwb9vRJLyqg0HT?=
 =?us-ascii?Q?OpMxzs33AuORhZetcuyZxXbk43m+4VTgHWAtNaHlQ9UeACu0YPjgdzNsNOfN?=
 =?us-ascii?Q?XmPEx97CfU3dXTwxi4yMTJFVbua/RpRwJoyHsKHgthSETFeEKb0aMQ0Pr5RQ?=
 =?us-ascii?Q?fjlBNVJ8eWB9rBZoajv+GyNb67HV6kf7gNq1SEerj5yZsMhyLD2lT9K4MLh8?=
 =?us-ascii?Q?KssE/kGvObFBvMYYDEGgn7iEy5guaI3GXR7pDxdUVHAcufaR0sVyRjoxSDfB?=
 =?us-ascii?Q?mWD/bhqNn6X8vTgnj7Jb0JKwQOZF68rwCN/Yt1L1zV3wwUTCpfPo+4Tisojg?=
 =?us-ascii?Q?bztPW/9xVM5o65/hLB/sCUGSLMDwTnBhuiCe0RevC+GSfNzpDLD1PtJb36yi?=
 =?us-ascii?Q?B0DmrIdxz8w/ska572wkxuLfhXfK533cAhPseO9CknGOhcX1SZeN9sgXB+DQ?=
 =?us-ascii?Q?sZy9epbFHRMtKdNDE8IhmCj4P4Vpp0xwOTlc4+EXld9PjziBuR4G4VpRbeOh?=
 =?us-ascii?Q?+9oIJthetKityLBWkSASi+1G2pdwRbj+uUAr9N3Y+H4sAEgvQsm+wcUIwTab?=
 =?us-ascii?Q?EDvDZLq3M1gu8KX9ELAW6ldjwyuxg1yN3fySR3Gde1WZt5+WAvSIikAzzvI9?=
 =?us-ascii?Q?X54Lgap9ZZlYjLPi3258ByrJCteNtpkhLCRaH4EEncks0iq5qYRP19s00Ze6?=
 =?us-ascii?Q?rWTEZhVA2QP+XDXEWtAfdz7rrRZ5?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Dq5dmsN1QHOobUW4k4SQxE92AGeDLtPNizHmoWrDJuDatU6qfdTAC2GeOyM0?=
 =?us-ascii?Q?iSF/IEO+rtAIRcO39r16dxjKwcO8SklX8EL/eKxbudNEqFyPMtEd1NNMWxom?=
 =?us-ascii?Q?e/H0BPagoo1uT23txc6v/7/Iy/gupf68v5DI2K2QcF884BWZY03aaB/X1tvp?=
 =?us-ascii?Q?M87HXcZqheNwfpC6urTaPIT/5TfqGOrMrrezv35dzaorhm1EREZ4/TdixxbS?=
 =?us-ascii?Q?MA7h/OX05NYxocnRaniL3kYbsNfQfPXJ87Tw+JXQLOLfKxsoHe58Mz/2iX9m?=
 =?us-ascii?Q?LWwiEHqpqKK1o4etg/LthoD37SscYCMJDJoV+S/yq6C6t/wKzrcKFfE8OCk7?=
 =?us-ascii?Q?ChcEre7Kd1Q8+rLWW6waB2D5Q56TSaNkONywcwkx/6/MhnpYwPU0jWJ9j1UX?=
 =?us-ascii?Q?bmgEp6HTtyhLRffO70SaEB3KNeU+mREysSu8rZrCdRpplTpVtoFeAEDumTWc?=
 =?us-ascii?Q?70lmtav91nJSp3YOBWuX4vfDQRRho/A3Yn5L1k3U3/reDhg6fchVdecwA2fc?=
 =?us-ascii?Q?Uz7QYH/BhOTGYdvOiVVPxbCK8KLs0lIhU7mx/Jo26LeF8/zc6Kuk+aaX8YJs?=
 =?us-ascii?Q?dY+/dbskUKs1IXlxrrJuuRop5rOGIxVay7B9OesgHKk2vJP9a5e/YuQQ2J5W?=
 =?us-ascii?Q?q7kEO+RtG5vpcLrb2n3G42e8KlPPS38zyAjtNELd3aFuhpM3T3TMT1hAkH7q?=
 =?us-ascii?Q?qksW51mXBN70wIxX+9nMl/4EKp94z7xU3IN53GUT9A24d3Z1BrTTsbvUBDy0?=
 =?us-ascii?Q?BvWE8Ku4npbeThcHe6kzG6yT+4GatxqbErXQspRaAU+rLla5lrEQOtrDtj3W?=
 =?us-ascii?Q?PJ3t7z8+qj+3OdPHryn0FItGxwAi/+LInSSkj6kednpbU2RaQY5AKfnIm3KR?=
 =?us-ascii?Q?qU28PibnAjqkOaGkd+F9kg21qX0UCBbUE54eKzeJbx71cxLkqudwEkJPpoT5?=
 =?us-ascii?Q?6Slo4awRjOVL3rZVlmezYDxVGGKdSfYsdF99C8V7z/mKFB1PlftkPX3vXK1J?=
 =?us-ascii?Q?BrKHyBlZYAV7M3aO4034oBybu0jKYqBzfRYELRTH4LKPmgcCHN0maFdZR+Ej?=
 =?us-ascii?Q?CyzKWOqNJYFMrJRTEUBhTcK/OQ76ZQiDpTZS4zmNBv9sgiDgZYj4bkKXCh6V?=
 =?us-ascii?Q?w7NyeEVW0P+ZsFpdqc17wlXsPu5LeRc98Pu33z7CL2F3rgvdY5AQATpl/ynH?=
 =?us-ascii?Q?or6ut2IE9QacvToQ9c+/okPGm1mlAiJ3pqBxcOHWEv9AzF3Nil7MmNuDvtcm?=
 =?us-ascii?Q?BCmWTRTEubNtnevSA41cY2Wqi1wyZeEOrD5ROqlq5+9UdJjtYNCT+4ceoEE0?=
 =?us-ascii?Q?94j8S+4e9DZxXIxQ7WhCc2W4/LcbdplVlAR8+0YZLckD7migs5l4UuVFB1rz?=
 =?us-ascii?Q?y6yHaiPYpawb7LJh+KkCTYy+zjIySrOc2yMpxUdATTwRl/XekJ8l9Cdp1OGy?=
 =?us-ascii?Q?WU9njCBg68Jn19YY2W6lYcprO0v1qZjRjHnMrZLzccg1UvsBEKg8z/AcFssx?=
 =?us-ascii?Q?mnaF07xOXBlOUiUG4s3Kw/RvA+xujKfnO5ovMG7Gaj+q0ttB2JGT7J0wPQDr?=
 =?us-ascii?Q?F6SgGuccRFlMPVLsX81/uaSSw2J423dPfbwOUsfRcrJwK4znvVKyM7rH9B7e?=
 =?us-ascii?Q?kA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 070e945f-ae13-4b54-129d-08dcfe4edce7
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 10:36:24.8640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8kwsiVvRdvwUy8TikJ5KIeAq/HZiQ8CdgN3DTKE7Zd+MFI8wkd2oVUvvfUGZ98qY+IlP479Ab+uH0rxkxbssyJjjGG0pOOds2myC7qGV0nU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8060
X-Proofpoint-GUID: nGuSP2RgnDq6V7VqmiGBKQP0i-iatQqo
X-Authority-Analysis: v=2.4 cv=YvBdRJYX c=1 sm=1 tr=0 ts=672b46af cx=c_pps a=clyc6YhGvfCRRXf4btgSWw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=mDV3o1hIAAAA:8 a=IJXTklQ-Eef5ha3fy0sA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: nGuSP2RgnDq6V7VqmiGBKQP0i-iatQqo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-06_05,2024-11-05_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxscore=0 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411060086
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 10:36:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113735

From: Zhang Peng <peng.zhang1.cn@windriver.com>

This recipe adds the parallel package, a shell tool for executing jobs
in parallel using one or more computers.

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../parallel/parallel_20241022.bb             | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-extended/parallel/parallel_20241022.bb

diff --git a/meta-oe/recipes-extended/parallel/parallel_20241022.bb b/meta-oe/recipes-extended/parallel/parallel_20241022.bb
new file mode 100644
index 000000000..e3cf0a6a7
--- /dev/null
+++ b/meta-oe/recipes-extended/parallel/parallel_20241022.bb
@@ -0,0 +1,29 @@
+SUMMARY = "GNU Parallel - A shell tool for executing jobs in parallel using one or more computers"
+DESCRIPTION = "GNU Parallel is a command-line tool for executing jobs in parallel on one or more computers. \
+It allows users to run multiple commands simultaneously, making it easier to process large batches of tasks."
+
+HOMEPAGE = "https://www.gnu.org/software/parallel/"
+LICENSE = "CC-BY-SA-4.0 & GFDL-1.3-or-later & GPL-3.0-or-later"
+
+LIC_FILES_CHKSUM = "file://LICENSES/GPL-3.0-or-later.txt;md5=8da5784ab1c72e63ac74971f88658166 \
+    file://LICENSES/CC-BY-SA-4.0.txt;md5=7130783469368ceb248a4f03e89ea4b8\
+    file://LICENSES/GFDL-1.3-or-later.txt;md5=e0771ae6a62dc8a2e50b1d450fea66b7\
+"
+
+SRC_URI = "https://ftp.gnu.org/gnu/parallel/parallel-${PV}.tar.bz2"
+SRC_URI[sha256sum] = "6de22bf1c67f7f316670d21ed1a2a32f1214dfbd3e420939ba937925c0a57a12"
+
+inherit autotools bash-completion
+
+DEPENDS += "perl"
+
+RDEPENDS:${PN} += "perl \
+        perl-module-ipc-open3 \
+        perl-module-getopt-long \
+        perl-module-file-temp \
+        perl-module-filehandle \
+        perl-module-file-glob \
+"
+do_install:append() {
+    rm -rf ${D}${datadir}/zsh
+}
-- 
2.34.1


