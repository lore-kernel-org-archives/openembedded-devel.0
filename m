Return-Path: <mike.petersen@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B2ECC04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 18:19:42 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
 [148.163.158.57])
 by mx.groups.io with SMTP id smtpd.web11.23253.1658945980060511768
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 11:19:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=Cqk3BTQL;
 spf=pass (domain: ni.com, ip: 148.163.158.57,
 mailfrom: prvs=42079771a9=mike.petersen@ni.com)
Received: from pps.filterd (m0098779.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 26R8pVGE009490
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 13:19:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS11062020;
 bh=0liSddi6juV/tPDrhlFJMIIZt70BGIqxJ13PC/x2/qg=;
 b=Cqk3BTQL+yrU50mGsJyoT3yBajJi4DqjB4Nf3DDZxFyWhTWuXQRotrnkQQEiF3N9uria
 H84IldYHnmK2SAEc7cnKicZI1zJWu3cluLbc8vXm00Cvku227ejObo3IMh2IxJOnHeTi
 JtHuAKbq7f5ZqtpQILN1A7aY6IU/PWuaGXrPkbZ1WauF5cq5entGPLjdUPJaHnoCyxkE
 mv0WQLUgeIQB+5Xle+nTZTUIqkWG6RkOqu5hG7xZQPRjhLrMJ32+p0jAEEJGd+xIF51h
 nB+ewDXwXJdsL8Ho98TDr/1YmId+lEHoJGtuN3QjsLC9yC1HcatFIjyDNHaXPFIs618D Tg==
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0b-00010702.pphosted.com (PPS) with ESMTPS id 3hget6f0w7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 13:19:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QcnwiECYEZvB3p4iZALqI1mYKSzVDyibTry0xjmwE2Ju7ipoHn5ACqw0og06mhjeZIitjrtZgOStyqHG0RX9WkidS/7uBnorDyFaErkc47AuNua8BcfAXmOa9yKy6DeK+BRKKtIjNjrRDQJqJcW2y4a82iH6CXyo2t36oBs+0zeNhGH5TjHAS7njLZ7AEkh6Fb2Rm/BEzX5aXPhuF03+g+WBqtLVbh6NC7VAU+Z9VbdX3LgLCbOWWZ2aHKwgf+7TQT/SNZejUJaeNlvpcQt/inbyGnEKZq+lGvohfyxstfPgpSVJkAU8qbURv4pJHFYyiFmZAEzlNrdHIdPy1UZk5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0liSddi6juV/tPDrhlFJMIIZt70BGIqxJ13PC/x2/qg=;
 b=mai6gp+zNp3ncseGu4qZpI8nkurm6E73LH0PUeGcUGg4hlk9ACu3Lh/8Er18CmMVBRh1JXTpbgc6YvhBwpZkx4OcxLKffPftQjdTJ1H9IA9xHYg2kJnbhb0f2o5q6HwO1wUwIkSC1QTm3xmUWBYs+g+9kCuP5Bd9Dt+9Q8ODH/wW+j5ixoESUkjLOjNODVjOAk9/zk/ZJOic0fAUB6/QYkS/2dqQtXg2/LZpMr3PEQaNK1YJHLCTiPC5nnwsCFnfE2WyJl8o43RjnIOcc+t8lScBk55C5PI07Qaf8XL7q/ew25wmMBXpt0ZFQ15nk9OfYFxhNXaaZGYUkiK9TNsWVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0liSddi6juV/tPDrhlFJMIIZt70BGIqxJ13PC/x2/qg=;
 b=oSCnAj1hA7TKxPRYnm4GKFMqcWsKf6b4dH6DDLU9jv/56C62y+avk1ccoRoFI3OyWKlY7Kdq8RpdK6zSFGQ4G5J9uwZVNWVRF3lDtbZvs0VW2y34ecWSkb4pISH/M1GA6lqxFWM41cpmtt0o63aknleBGxaThdSVPbFjQy0PaPs=
Received: from DM6PR04MB5420.namprd04.prod.outlook.com (2603:10b6:5:105::30)
 by PH0PR04MB7704.namprd04.prod.outlook.com (2603:10b6:510:4c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Wed, 27 Jul
 2022 18:19:37 +0000
Received: from DM6PR04MB5420.namprd04.prod.outlook.com
 ([fe80::fda0:b935:cbdd:4d93]) by DM6PR04MB5420.namprd04.prod.outlook.com
 ([fe80::fda0:b935:cbdd:4d93%3]) with mapi id 15.20.5458.024; Wed, 27 Jul 2022
 18:19:37 +0000
From: Mike Petersen <mike.petersen@ni.com>
To: openembedded-devel@lists.openembedded.org
Cc: Mike Petersen <mike.petersen@ni.com>
Subject: [meta-networking][PATCH] sshpass: add recipe
Date: Wed, 27 Jul 2022 13:19:28 -0500
Message-Id: <20220727181928.34114-1-mike.petersen@ni.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR10CA0003.namprd10.prod.outlook.com
 (2603:10b6:806:a7::8) To DM6PR04MB5420.namprd04.prod.outlook.com
 (2603:10b6:5:105::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5dd6ace-d8ba-4627-5916-08da6ffc907f
X-MS-TrafficTypeDiagnostic: PH0PR04MB7704:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	A5aijb3lf3vrOiK0XyQUjqtN5SPFFD8aJAJppiBal135AKCc9l1drx/z+XLjPlAbMaIMNH7qlhVU1TpNszwaFjlqr9ismlAFKKzDMpkKE0p5vQk/vxbiJnu/LDsStowkZGMbfGd202XJaLshiRMRxvuubYChU6uNUMUOlGJnec8YGNovtOJo2DJh/7flF2UBJ0TXwLQBecEVRy6CY68CTtR0jc6yPSVGBCks70D1J62G1hdlwiEK1Xgr37w3iTJIMhxBRnk91Fbrq61LLxvqiWvHG4dymMnYo9JQaQkPpZaUour8ACML6OJMoLj/aJ4hLNjHMd1IFP0ej2kLpAO2VbkgB9+wrnREMQ3A2IC1CEbBoou3jPJapqLR/8lwSckulTLJ5TthhgukqL/F/AUA7f90v70s48Ma7FdZNCJdTKczAN4C6cssXP2sQ44b7L3ghSG2gf3UIeFbHpbxlngk2mjtMQajc634qJHHRMXC7IKJbOEOmz22HWMdb73VphEePjq4iV7CXzIcNq1pGYf9aNzeGrJIoQ2eA8HYjvTnMQrvYAKjBbPUNezb6B8b1v33tuJCaCxM5gRkYi3X972F/tbf8rumeIDCJhYHlP4J0O0eCRj4UFF/qKwZIuQqSM9AEQ2H4eOTzZVXmdE7RR9/zxY0wrq1oahS/Wv1SiC64SeZQkOH3yvdiTC7X9+DVsSik2PJYYgDRyuQMI4jbxu0T01QA1d6xOqndnC011XZqvnn8+9NG1ywGgxrTITQpU/dlh91UE9FW5cCQbYd7HERYSijMGZ5lziD3qvEzJeRnjfd2Fl3EK4AKtsOhOKpOZTp
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB5420.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(346002)(136003)(39860400002)(376002)(4326008)(6506007)(66476007)(2906002)(8676002)(5660300002)(26005)(66556008)(478600001)(6666004)(6512007)(86362001)(41300700001)(6486002)(2616005)(44832011)(8936002)(83380400001)(1076003)(316002)(66946007)(36756003)(186003)(6916009)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?F8Byh2Ezya9+7YERyPmr3XGcTdSrI9NJQvTWu6ohT4m9u9MXs90bZpAusJ7N?=
 =?us-ascii?Q?rm2V6coS0Al0S3i1Px9RNIYj7lfPayrMuYjn80o6EKgRaDuifuOzlGs+iyHj?=
 =?us-ascii?Q?K2d2MQmkmw/5V8oxbfl3JVyWxwnOuzV1F4yURIS03U1CQmBZltacH941/ENO?=
 =?us-ascii?Q?gmBYY60GgfVKUwGABrP1hvch933muVqtZZcG0DYlrkBzTX03s27BNq3x28ex?=
 =?us-ascii?Q?i90qi7bfTPpKM+sUjyzjVGr/m9WFy5VjBDBVrqnM2tWz8hGCWMrOt5z7yWWu?=
 =?us-ascii?Q?uoH9h7lxcHOWpfw0yyLSAy3Jv/AZsz/Ku0Pa1Z3P4r7eSwRNhl5IUKQYoWWz?=
 =?us-ascii?Q?YhnQwUQOkqALcwc6QDpuuwxrkXvFhq2r3eZV2nk4bC6yLF7xvgPF+sVQXQA5?=
 =?us-ascii?Q?DDLc9MQHadeGSYv3eEJ5cz2xXRXxvB4pHZkfPJelbutqYidKNyr7dBErBteC?=
 =?us-ascii?Q?RcdJ5IQJwV59O0RJmaLNHr2Gx3FJCdqlstUgLkC8fvpkDdBsOrrIDLrbSAxs?=
 =?us-ascii?Q?ro6SFvBU0P5PeQzU09lYqkwaA29wulwoldQYo271P/8QDHFlFw18toU7uuxZ?=
 =?us-ascii?Q?MLXcsRIK61yDJZ4Y7ABLbv5PdeqfJhKbN6jo7OsSeOccPXoY9iGv1b1c3Rao?=
 =?us-ascii?Q?ee2D6ze+cQZ28N5G/8n28Fsbd+p/fnFl9HCL3FDx38nwXI+AmJ6U9bznHvpV?=
 =?us-ascii?Q?YnqlxQ9hmLIjugTeW8uO0nngBbl4pqjgKjBst8eYvj/fF193N4uo9izT8qxJ?=
 =?us-ascii?Q?l8g5RpumzRe6RUbLoeNkUsTWv9nMNp2j8gRP2HqR6fiOPGlYiVRHJNKJfeyz?=
 =?us-ascii?Q?vAZIObDQOBZ36M5FPC+rG3zx31UHMEPCBsrtggV1SGLQ2nuTDlCsM/zaTrb4?=
 =?us-ascii?Q?mis+kumnuDnPtxs7kSlHgMs3poRMTzvVdLXQStXX1YQyIlK32yqCUa3DQrnk?=
 =?us-ascii?Q?fcjT0QGOgYxSVBs35VtXXYOIIhoXl0/IGrJnokOV2sXvy7LiLPvJ4Nl6DQR9?=
 =?us-ascii?Q?SllWj41wTPUQsXX1i++n99uUy4Nl0Py117zgu3PSS7lsSOx8OppwElBy5rAl?=
 =?us-ascii?Q?BqL0GS4rXcJa2kgKgSM1EfjchcaCKBBdZipoCXnC4f7ANTw21Pns/lEvcKGA?=
 =?us-ascii?Q?YvNv07eySGTiv9PbFcH9KWCT9ACC0s8ovCrQLbi39wDlMJ053nYIrbS2cAfe?=
 =?us-ascii?Q?kMJsMF0QPKA8xFZVkTJ6D7j9ytySUWRVb9WCJzz+9ESAh1bUTXTRuDSQTphC?=
 =?us-ascii?Q?MmxARoT0p7TnqsE8RTUXhSXod7CMDTC9EgS8TZaH2XhG96qsOsHpVBd/pG0v?=
 =?us-ascii?Q?aFRocug54ui4H9ylVnVu0piubKCsJIJF4lpssbsqYel8rLzoQfazfyHkUXws?=
 =?us-ascii?Q?cZuvSYhL/iEmQy8vluu8BO/fuPWXnbqcxa5FCO5t7OsbJ8S9RCRFQzvG0pwB?=
 =?us-ascii?Q?BnrcL91ebztRk+nuUmOykrduuMnMRXzBTC2akuy1HVDDKNy2VekDMebq2/zA?=
 =?us-ascii?Q?iy83V5O8j7KcTMRMskJvPBGczFsK59nh3Cjs+Dkrt+9JmCFhq1gluJ6hEkab?=
 =?us-ascii?Q?m+VUFl6qRJ5yLf5hReAyljQ5V/wO8ycGZcNr6BQB?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e5dd6ace-d8ba-4627-5916-08da6ffc907f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB5420.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 18:19:37.3834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 JeqxDfxXR/In572eNILb0MOdFEnUXrdCJ+vmLXrBiFgmhv4QHuBbcmjPQrsg2Ef03a6iAsAVcI+R5Z5Qqf6okQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR04MB7704
X-Proofpoint-GUID: uolwTN7-5kPqw2DxqPxcqW-xaEmiqUhb
X-Proofpoint-ORIG-GUID: uolwTN7-5kPqw2DxqPxcqW-xaEmiqUhb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-27_07,2022-07-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
 score=30
 mlxlogscore=775 mlxscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 adultscore=0 malwarescore=0 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2207270078
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Jul 2022 18:19:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98018

From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>

Needed for automating ssh logins, used in auto-tests.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Signed-off-by: Mike Petersen <mike.petersen@ni.com>
---
 .../recipes-connectivity/sshpass/sshpass.inc           | 10 ++++++++++
 .../recipes-connectivity/sshpass/sshpass_1.05.bb       |  8 ++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/sshpass/sshpass.inc
 create mode 100644 meta-networking/recipes-connectivity/sshpass/sshpass_1.05.bb

diff --git a/meta-networking/recipes-connectivity/sshpass/sshpass.inc b/meta-networking/recipes-connectivity/sshpass/sshpass.inc
new file mode 100644
index 000000000..b19ae4313
--- /dev/null
+++ b/meta-networking/recipes-connectivity/sshpass/sshpass.inc
@@ -0,0 +1,10 @@
+DESCRIPTION = "Non-interactive ssh password auth"
+HOMEPAGE = "http://sshpass.sourceforge.net/"
+SECTION = "console/network"
+LICENSE = "GPLv2"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/sshpass/sshpass-${PV}.tar.gz"
+
+INC_PR = "r0"
+
+inherit autotools
diff --git a/meta-networking/recipes-connectivity/sshpass/sshpass_1.05.bb b/meta-networking/recipes-connectivity/sshpass/sshpass_1.05.bb
new file mode 100644
index 000000000..a345dbd95
--- /dev/null
+++ b/meta-networking/recipes-connectivity/sshpass/sshpass_1.05.bb
@@ -0,0 +1,8 @@
+PR = "${INC_PR}.0"
+
+require sshpass.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+SRC_URI[md5sum] = "c52d65fdee0712af6f77eb2b60974ac7"
+SRC_URI[sha256sum] = "c3f78752a68a0c3f62efb3332cceea0c8a1f04f7cf6b46e00ec0c3000bc8483e"
-- 
2.37.1


