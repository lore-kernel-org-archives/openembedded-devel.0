Return-Path: <trevor.gamblin@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD39DC433EF
	for <webhook@archiver.kernel.org>; Fri,  8 Oct 2021 15:35:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.11042.1633707323392304617
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Oct 2021 08:35:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=CFxKpqPY;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=5915c9eda2=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 198EYAql020351
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 8 Oct 2021 08:35:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=VibfOkqme2md7O2/+Mko+40RLEWAxrwMIBNmEfQTb7U=;
 b=CFxKpqPY08kKQ5clkE09UIDx9gQfWsFLQqPFsLfG28/s6G6/aFKWHyS9kBTcl+8KckVT
 QqzBuXnxYrTmJ5YXIEI2BYg0iuhpg9pfOi9o4582suKFUyaKfVuNQakzIbA0LLEGL2dy
 WWEtr7vCUx+ENUm1076bKudvfXTKZgcSx08Ymgke2l6sP9ANEM5lsGvAXHvYjINY76bR
 AgxSRk1EtFhPTO1+PKQDdkMyjEe86jyG5hNpQTbC2B7o3/0UoIjlKaVEpuA08R+SDZLX
 sh7WosYWc9z+Ud+0ZVnzRF7taTvEU7LMFWiOjsuAByj0CUlvJ317I3I0d12xROETz3NE aA==
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2048.outbound.protection.outlook.com [104.47.57.48])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bj8urrpr9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Oct 2021 08:35:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QJWES7PjweDk43JBZeGM+kNXfu+AnskuCWFPROwNn/f1qV0QS9jylESO37qnFjfYmb2u7uPpRxRLY2iqjb8dWWAszMwU9bhkqNaNslT96oxQxH16Xl5lsNZdjCFtYt9E3jzwzGoXWSCBWYvppBPqRe0zCe7zfpJUjSookCCdE4jC+gnpwrrMHmbQTPatKqD4jeUg7s2Iy0GuwCtdn3QxJWPMnLECoFDc7U2WWwA3zfmLzWzB6JY9SKXrvyItBO42LDTyXIXzDZlSnTRCsLmX5arZr1MCWmEMxfuJzzskTsp41DIDdAIMDckTsuELjzcFP86RciqAKf7W8BVZ0gLekw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VibfOkqme2md7O2/+Mko+40RLEWAxrwMIBNmEfQTb7U=;
 b=P8oC626ohOevrcJDl1GzZi4jCT3KBq9chbaYkIVNrJS/rEjRTNWbLge6/P7QZZxCFCLb3B9U+sQ9f4u+CDwHv4kI4hIirxgq49tgNciJtRjaORmmIjf6Bt6u16rcZHqo0ezj3+UBJy3yR3C0xJDv9aRgAiYrbj75CdpYDytdauqgKxatv90/GMIFSz1V2p4U7uKTy0/mPmKaJY4KIFT76UwwRkXoUQ5aSD6uMGeLHD5YrKgsTKHa+SXIXY08ng5CT2EC0TyLpSEfc3Y3SSu8/zrI1o0hs7f+AnXumcsvWZPaDWTo7dmm6KdXcg6Q7Rf4cP+6eqUXJ/kagR+v8FbVHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2920.namprd11.prod.outlook.com (2603:10b6:a03:82::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Fri, 8 Oct
 2021 15:35:16 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::ccb2:28ab:f000:8440]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::ccb2:28ab:f000:8440%3]) with mapi id 15.20.4587.019; Fri, 8 Oct 2021
 15:35:16 +0000
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-posix-ipc: Add recipe for version 1.0.5
Date: Fri,  8 Oct 2021 11:35:04 -0400
Message-Id: <20211008153504.893846-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT3PR01CA0072.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::35) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
Received: from yow-tgamblin-lx3.corp.ad.wrs.com (2607:fea8:c29d:d7c0::81de) by
 YT3PR01CA0072.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:84::35) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Fri, 8 Oct 2021 15:35:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e868fcf-25ec-4d27-71ac-08d98a713a26
X-MS-TrafficTypeDiagnostic: BYAPR11MB2920:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB29204D512E08F82EA4D4C15A9FB29@BYAPR11MB2920.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gdZJv/pe5liaAV3B3GP27d3vJEESZ1vJLKkB6/+ttzIMBQ24JBzhUgbOtY0zzGIBQqJtT7KX4zp/pvtG1Xj33m7dvMhGI+vRq9MYz+zrEEEzumf2SnCrom06m0fW6cl4Nw+mG1UCZuHszJv6k6by1KiZOX95XGcfQc8QjzVwTSxQFgcxtW4RmsmsPdgODoyWxV8PGRY6mdT1am/Bivr9VLKSKZZkHU1VtkSdmAd9FB+XU+rxAA2ay2yPtWeG3TTEYyhr7UVxm/lGn1tJUhpkjM2ZSJsyEHWx7zxSAe4qzruWvsWjU0g6evO2I//iV4RXDW2gMxEdOpkkufSop6Y+5IBnEgS/YyRfwq20wE5jP9YIoi1VXq+qf8XsHWv19f4XscuSScs3wh1ZvOcysmAcGc+Kdv8lliWMQDz99NOoF20sNB738uol+lsH7CyNWGomN+UdW/RKQYeC4ZbIslxRnD0uFKMxVuFzcPMO9pnMBiF2LXiwUZM/nsKAhWn3WhBPlsd5ezzeKhsFW0QT1YxDHgmkdx3hS15LH8VlRxsomrNmq/xAooylnKD9Kq5yWZq0n+ikNWr4KMCTXnymFmybOJ8oHIbXVKjY1/SOv6FwERvSWI64UhliJ32+55Fe2nMPZHqHxtns0MfjTUxf7iuwjjT2UQQU0i4THLrWzH0A/RBpN2TXjkOa1nqRULXVOrMyZ1szrRzu7k2QIEQqQgmXv9zGO0Ak6GcVMgs7/37I8co=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52116002)(6916009)(38100700002)(6486002)(1076003)(83380400001)(6506007)(8676002)(44832011)(66556008)(66946007)(66476007)(316002)(6666004)(2616005)(5660300002)(8936002)(86362001)(186003)(2906002)(36756003)(966005)(508600001)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?g/3c0EJGI37aG0xLqaAUjNGnf6SF9e3oQs8EVsxI8o0HsfXD+2mz24sFkVeg?=
 =?us-ascii?Q?wjBq4y/eJHbSJzWwVcm3FUS0CMf7bCaQb0J/M7wtpywctUdDpJLhqvfaViTy?=
 =?us-ascii?Q?Ex7xAmGgXbhROFlBwtFu5c11mDnbPrnc2d9g5sJ9ZrFCtm6Qd0KTa+pE2SG0?=
 =?us-ascii?Q?zgWQ0muTqgtU03t08AmiYXL3hD6KkXt4BsHfPunOWAuutVUUf1EQ95ftUOG5?=
 =?us-ascii?Q?bporoS0lEw0HPpoUyuJWlY9DK8akIUv6fRc51x3KhnXy+yR6UQLVsmR2F390?=
 =?us-ascii?Q?5QzHvGT9HY8f+bm5Ixg6e8XmSPERhZR6Hlfs6/GQHuDURPuNtNOx9ixSWMun?=
 =?us-ascii?Q?5tHkQ35pf38A6VSKcl7gwTKC6EKISjP6BbP2vHCPX7hisE6aVPsdH61jM0Sk?=
 =?us-ascii?Q?Dic0zjKH7EUWcusiC5a1MTdbcVfLeBPRV1PtrjWuxIupKtjHLTqgBIEAcCuJ?=
 =?us-ascii?Q?gaRQvO0wRg5PLCENDQFmY8foqU6qHws9Ff7MrNu9ySCjfKGMIUnIlkq7J5uK?=
 =?us-ascii?Q?2cFVIsLpthqILCAfiuK7ly0HUDT5Hfwq8SyTSN1ezoHbJp8yktdi3jjVX9Af?=
 =?us-ascii?Q?p3fooHzlxBsGZEEepSor5C1DnrMx6NjQl+1nE9EJ+pTCT2MEQMR8XzFqfHqk?=
 =?us-ascii?Q?83UQD4IZ602Zo6+EYAH7t5QMi4cp9kc6RPQPCpmJfbRiXjrcTlBako4U0IVZ?=
 =?us-ascii?Q?/fQHxsli816V3CdTOS1FozIqVgCxpzrvd3JQui6Hxj4Pswdk36+uSJfJQWdq?=
 =?us-ascii?Q?OhCnkQtXDRfFROVJUmvMo/i3yyWAmPB4J16dL8oJaxxb6B1VILhjdpPzCkCh?=
 =?us-ascii?Q?Y3hZ8Frm1diNG2x5bRN3QdWbcGo8L5FPDWRHm2MOlbgSQxWmeAjR+rRda0pG?=
 =?us-ascii?Q?xii9b8IdOqOpPR35vpPSErOMg6WXvmWU7LAR57oVbi2Sp44PyRZ5pthp9/8s?=
 =?us-ascii?Q?h4S5ucAAhR8x4AnbBI8dTjS9QQ4Pod/PCbW4X4MoP+9W5aC6tOcwLXxOH66I?=
 =?us-ascii?Q?vQ2iLMVS87sLWNHIKriaveBKKPQJBc56VLBo8OMJR7hRVxTmxLx8j2hfvYEb?=
 =?us-ascii?Q?60ZwL6Vs4fyB7emnRt/9yG6ROX+h46dIIB8BN4+zUP9Biwdb688n/bTqV4zA?=
 =?us-ascii?Q?rTe2HBCXOcpqpnx14+Cxd9WN+hJNYrtDvRPnaYB4H5LY+ECvkq/B5dmFMKW4?=
 =?us-ascii?Q?FVEKUj/x9lq5/KuOoxotES1UA9rknKsMHk1L0/wmv5Kka33OfmGxkIIUyIzZ?=
 =?us-ascii?Q?EZvtRRXbXNbmcrZc2xqcXbjeNkgJM4qpDHRXPvnVN4g/zn/OMuxUHQCo55UL?=
 =?us-ascii?Q?u7vlsRuyQ8GKpKGZv+XRawrsbcqbjLK51SZePM++OeXcdYTY+SAwLtHLLY5o?=
 =?us-ascii?Q?OCNgju0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4e868fcf-25ec-4d27-71ac-08d98a713a26
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 15:35:16.3140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 MMNwCVVMbiwvtPR4oGdRTDY/r4i9onNHn8Pr7vz+yuk63eNZE7qLjOCdA4XYeAe4CIyepNpjR6pHNDjdRBIhKgo1kM+vps1e35zWDfv8fTo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2920
X-Proofpoint-GUID: zcHyX7wU9JYKJUM72qNNI-mr-U2GHEBs
X-Proofpoint-ORIG-GUID: zcHyX7wU9JYKJUM72qNNI-mr-U2GHEBs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-08_04,2021-10-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=4 clxscore=1015
 malwarescore=0 mlxlogscore=999 bulkscore=0 impostorscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110080091
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Oct 2021 15:35:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93207

Port the recipe from meta-openstack and do an uprev to 1.0.5.

Original recipe is here:

http://git.yoctoproject.org/cgit/cgit.cgi/meta-cloud-services/tree/meta-openstack/recipes-devtools/python/python3-posix-ipc_1.0.4.bb

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../python/python3-posix-ipc_1.0.5.bb         | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-posix-ipc_1.0.5.bb

diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc_1.0.5.bb b/meta-python/recipes-devtools/python/python3-posix-ipc_1.0.5.bb
new file mode 100644
index 000000000..a449ef829
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-posix-ipc_1.0.5.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "POSIX IPC primitives (semaphores, shared memory and message queues) for Python"
+HOMEPAGE = "http://semanchuk.com/philip/posix_ipc/"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=dc089fb2f37e90799a54c19a20c9880f"
+
+PYPI_PACKAGE = "posix_ipc"
+
+# Archived version so we need to overwrite what the pypi class will derive
+PYPI_SRC_URI = "https://pypi.python.org/packages/source/p/${PYPI_PACKAGE}/${PYPI_PACKAGE}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "8c9443859492ecf3aae9182aa6b5c78c"
+SRC_URI[sha256sum] = "6cddb1ce2cf4aae383f2a0079c26c69bee257fe2720f372201ef047f8ceb8b97"
+
+inherit setuptools3 pypi
+
+# DEPENDS_default: python-pip
+
+DEPENDS += " \
+        ${PYTHON_PN}-pip \
+        "
+
+# RDEPENDS:default: 
+RDEPENDS:${PN} += " \
+        "
-- 
2.31.1


