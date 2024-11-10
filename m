Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8C41D12D44
	for <webhook@archiver.kernel.org>; Sun, 10 Nov 2024 15:25:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.37786.1731252305156489793
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Nov 2024 07:25:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1044baacb2=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AAFLIbd001709
	for <openembedded-devel@lists.openembedded.org>; Sun, 10 Nov 2024 07:25:04 -0800
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42t84prrq7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 10 Nov 2024 07:25:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dst/JdzXHKngEN1NqqT/NnT/leQTOjnMcpDogDnTZQVRVmVQsPvdZQNsmpJs5vbI4oaJeYFSnbqxM4q/swc/p4aiUD523GlkdzxDyPWxSHgY0hoKEPYj4rnn8XsbZP2nSYJ04hUK33LODJ0oD8ZhX4ufSQ75/RVkv0x+k7Vl87JM82TH1Sza46RMT29SIj6We6YKJf1FZcO3BON0noFJK1i5kulUZsx05iVZZoNEl7s7LnIK5TUnRzh0yodILiw2SkNDDykhsX7AOkR3cMl3Eo5uZha9JjUaDveQERLRrG2+hK1mT9m0/2xbxa++WKkgG1ZriJSCiALWHmfvvDu5yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y98NN0HrImYI4BH2RzBCSPqaa+wbo3jbJbW/S8s8Wbk=;
 b=FV88yAUSXLppDaNxWJ0ljvXlAhSBtRbVzFbx6cMKnT1kBpGg7FFjUSfijo72ReuF76IcVUwcYOTUIKfgAFwGwleQ2CSW1i7O+Ou861jsYLQjjId9sRxRdkumCAWDss9VdEUqJZSRTbM3e8hYJRooKP3MyuSfqKKZWIQrhkG/u7xeX4QuFRjB77yFEBqW71L1DAhYQmDXpnma79WbqXvB7no3qMvmtc7FwOuvYP7u/QKvoMjhx+rErj4GELjShXxznhkUgWDPjtMLxp31HX2TSwj+JfChlryzBerK846VLlF5nECQSu8U7Hk/GMOpG/+y27aMPYzwlIn9eRD96sKNvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by MW3PR11MB4601.namprd11.prod.outlook.com (2603:10b6:303:59::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27; Sun, 10 Nov
 2024 15:25:00 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%4]) with mapi id 15.20.8137.027; Sun, 10 Nov 2024
 15:25:00 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v4] parallel: Add recipe for GNU Parallel
Date: Sun, 10 Nov 2024 23:24:48 +0800
Message-Id: <20241110152448.2504014-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0031.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::18)
 To CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|MW3PR11MB4601:EE_
X-MS-Office365-Filtering-Correlation-Id: fd663713-406c-4a2e-68d6-08dd019bd726
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?oOBOLdbBFmOhg1L8Hlp5Pex/pERnh+gQg4QotiWOy+fCV464ejMtmVl4KCAH?=
 =?us-ascii?Q?bgLa14qkm8mLnOxngRMoNcoCr7q6hNN4+iEfAk60yspGtTkGUO0kUkuZAS5z?=
 =?us-ascii?Q?t3p3MnQ5GQkPZdq//c6DPbsJE5zmb44Cpj85NLiqOfQGQc8y1tb3Y+x05hjC?=
 =?us-ascii?Q?3E7rxJYLYOkCsv4See+NDguFw5BOqYqgwkAmIvD3TwgEobNNvdiDCtM1ot2w?=
 =?us-ascii?Q?vV+K88lWiXdy4O9QWyDnTlZAjIEF3lKo6BwdADccQHTBSbgcnvC74tOB5qf0?=
 =?us-ascii?Q?uGP4VfhNdBbILCQ4PsFDruIrsho66KOCCQEKTrMYrZc+UY3mGT8m78jzIQGB?=
 =?us-ascii?Q?5X/ImRgNSfdAI3BkeAxW774Y1dSzrdWhHBS2hflaBIUSwedq9bGGr+H0N0Zi?=
 =?us-ascii?Q?CM/ox8ml9wH8kVXof4RpBZs/vLdwuzrQyXraP5j4/XaKlCcbH/lk+Rp04zH8?=
 =?us-ascii?Q?JWlCxx9pg4EHZEcHzwCFIYU4yxpr8KJaORb91WsOSvYLxO9a8yRVpRbggZn/?=
 =?us-ascii?Q?9yUD+iSoKCW6Mtm/qfKo+os1A1G14CYvxRtRhVi8Hs8d7j9pVEwx9jxgAEi0?=
 =?us-ascii?Q?GoRK3ZLx8ck+eIuMc4U9yEYeKaafJ1354B/IBhu9DIoAkdBh60970ivsT/pH?=
 =?us-ascii?Q?ACXBJOD/j1jT6gmP31NCCfEApZXpuC6Zr6GcrtfZdQDVQrQugQ023AFU/2H0?=
 =?us-ascii?Q?MXVTzb50esBma6fKZKFIS/pKHP7tYlH7/5sXAWPXOu+21RpB5yifjzJwinuE?=
 =?us-ascii?Q?Nnh8yjAZp/v6o4cthHcpGbPtnOp4yJqrD81MQYiz6tlXYzijS4AweeF9DKUs?=
 =?us-ascii?Q?3gSgfGBNQXNSGGDlv7mS9kJyVGCvQbY0ijei6Mg6AxPGG9uSNAGuZ+rtCwL0?=
 =?us-ascii?Q?xkXhPx6y5z9FK5B+tI2l6CY5eJPHvHrrSReOnX7fkw9c9xoN6R1yNhgXNmrb?=
 =?us-ascii?Q?iY33bFK7vnyPJcXrxg9jW2YawziwFAPOSKZuv8nXU43leiGCCpQECjoMmkd8?=
 =?us-ascii?Q?Jr7R8cdVkvn25I4GChQ8HY3uH+v2g3Oowx7RWalCNFFnCpsGvIB+de+S2FWb?=
 =?us-ascii?Q?xYBilIbsh0heAah6Kh/QAssOwiTs8yHV73HBAZTEx5LIS6e07uLoSgADszbw?=
 =?us-ascii?Q?6NFRyjeBr8PG1JpQsXXL9PkQDDF9PWyOheWtYQm+g1eRPXbAVtM7ZENa8xKZ?=
 =?us-ascii?Q?nGMcTXzvE6gXX9Ir1UFsJjvdRx9MhNWm7YcaMarsrecA2PyLNZUPkBpGpk0A?=
 =?us-ascii?Q?9J+sXGdlxbCgoj/GRufRxs5Ckphm84eNKjGP9lfF3FVatT0SQUzIqpuHpZRX?=
 =?us-ascii?Q?Bj9+x3ZDKXKY5P30kcOQu3aimFB7AD9xOPm9f7FgQFviwp5EBG0+F4OvjFz+?=
 =?us-ascii?Q?uZLbNZE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dWDHyNEDZL9YmedzMf8Xg/+xTY9HYKy+2xpb3TZJnYAz9d1FP7oxUgCkymDl?=
 =?us-ascii?Q?W5X6MUHKc2h+yrtZYUWsAD/9f7TNvXkPeY85F7ak6AHBnjOIZ3Jc30VLWtL1?=
 =?us-ascii?Q?/1Fhvqx7uqWwWpc2RLby6vx3MdVjgSOQj5sHtVoMQb7gnW0HPDhKr38VQeqN?=
 =?us-ascii?Q?QSrqzogSEL2u/b5OsV875mn7mdPRlB610vUQA1kT43EUn0BuEWw80w9JGG89?=
 =?us-ascii?Q?EzkpdotNv0oT8asrt9qbOvMQk0ScgReWkjgw5NfxGT4bURQmm9NLnBk0GNFs?=
 =?us-ascii?Q?IUPjRq88ZRpD5NZYB/52oiSIzJnEFu+lVg+s9IcjIDH4jV53Xh9KFQxLRDA/?=
 =?us-ascii?Q?+ElHfOPFRufjFSHadKvHoq5eYV8sARbkutQ+WRFHpGqsRrpONyvF9AvJHgfF?=
 =?us-ascii?Q?LjOF8YxyYZrZF3M1Rgadg6Go9an0tIvVMfiHxl+F9a6Lp+otL8lM2zTLgZF/?=
 =?us-ascii?Q?oBvjoBurXpFL3oMdHrVDgsEMb9butbTLFR4vQ5q+FM7Pb5lkSLGuPGZfWsFR?=
 =?us-ascii?Q?aA8Nzz5BZcpwqEtUB5s7Asm5/BkrAsCdYFczNq0GMobs0UzjAfff9Q+3FJnR?=
 =?us-ascii?Q?CRtrp1mngPGzi64CnsuSTs2SlJru95Sui0c6Uv9z3vS8SFHwpVNjdqFDNpF3?=
 =?us-ascii?Q?Uu4IU9tPmt3b8oOEuciH8SZK/+4MIx4Sxi01ynVBZGPElIkYuqBB07WRET3X?=
 =?us-ascii?Q?oyniN+3VLT3GQQMPJAoKOOCa5Twr4KMWFdinIZFd37OWzhnljWlhhWICjRQE?=
 =?us-ascii?Q?NNl2+B1g32fBFsLL5tcpGv5zrrcWPMp6HDMWq/iIuF6mdsp3Yu27udq4VM1p?=
 =?us-ascii?Q?eWIRf3WSqqETT86cX4QjjRsq2OLBn0y7d4AfuOtkxM2sFcNj10UYZdG96hkI?=
 =?us-ascii?Q?GN2DNX6/+NVL0oDDMl6Fv4CdUeBJwkb8zYZF/zzhoY5RXNkoGFA6oFK7evRW?=
 =?us-ascii?Q?6azl+r9QM6Qw8nvJHdSBT/nVsvOm/4cUQl7wrPoHP3H0O7UxOpOj48vGX76g?=
 =?us-ascii?Q?ck9rjXU9j3R1pE8pKFDFJ5wisPq/I9kp0WMxAxsCrQ5RmyFuLbwQb4usFc0e?=
 =?us-ascii?Q?seZEVw8tqF063L7sKDyPArAZBq+LSiBa9T7/S1e2qOy/Osc3wZba6VrH9EJz?=
 =?us-ascii?Q?Gqp9zDuxtehhh47wba+wDX3U3LFNT3F/hFJvqjg05hSx3wx0AXosbq+cpkqJ?=
 =?us-ascii?Q?5+sDwbNLXwe5Ilct+pZ74unGJMZL6HbcNxSEt72WdNUARJI48MKFlM2yoXy+?=
 =?us-ascii?Q?3GpqU+SDEpQf1vYM/TuZ6+IlKlJSn8afoWrSwvilJCAhmbA8ss8ySZjcoRmI?=
 =?us-ascii?Q?Xd6g2bQT7J0dQ0XlQvwH//S5EM43Gtkwn7KNeSg63uwXSERSUdIK+dmJ7HVG?=
 =?us-ascii?Q?bNENucNi9rDL75F0Ow7mtzAC1FWNMusgR+daWh9SSyipaYss7U3HLhCdiI7D?=
 =?us-ascii?Q?5dZtoNH9MWiimo9MBC43wTdc1/rhx91gL5VTdUIE+lHQnAZCGzymz4ObL+AZ?=
 =?us-ascii?Q?+cyaHo7Gw52TiQt9j6Av3wUiBPCZgoDdTODF7j9Q7htsgPTaX8TMOpCX4j5h?=
 =?us-ascii?Q?hCa4xWpUFT5PedhCOgAcQBXFIa7FeKHb5Zy5VmM63Xdsw1TgaGbNTMTGhMAW?=
 =?us-ascii?Q?ew=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd663713-406c-4a2e-68d6-08dd019bd726
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2024 15:24:59.9353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZdxW0jLQ2zY7E1tEDG0IGu1JKBXPFUX6GOY/IRB2PvbbLXnXk+W18Jaevcz9L/p9J2u6xeHyG8I0fEXsvpoNMV1SmIRkT1U7d9PqTDTObxw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4601
X-Authority-Analysis: v=2.4 cv=IrVMc6/g c=1 sm=1 tr=0 ts=6730d050 cx=c_pps a=v3ez6FdVe4RSF1xj2bRqRw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=mDV3o1hIAAAA:8 a=IJXTklQ-Eef5ha3fy0sA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: xjDPhPa4nPz5Cc_xqKLTNYejBq0KziKS
X-Proofpoint-GUID: xjDPhPa4nPz5Cc_xqKLTNYejBq0KziKS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-10_12,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 mlxscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411100137
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 10 Nov 2024 15:25:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113776

From: Zhang Peng <peng.zhang1.cn@windriver.com>

This recipe adds the parallel package, a shell tool for executing jobs
in parallel using one or more computers.

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../parallel/parallel_20241022.bb             | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-extended/parallel/parallel_20241022.bb

diff --git a/meta-oe/recipes-extended/parallel/parallel_20241022.bb b/meta-oe/recipes-extended/parallel/parallel_20241022.bb
new file mode 100644
index 000000000..36e72df7e
--- /dev/null
+++ b/meta-oe/recipes-extended/parallel/parallel_20241022.bb
@@ -0,0 +1,33 @@
+SUMMARY = "GNU Parallel - A shell tool for executing jobs in parallel using one or more computers"
+DESCRIPTION = "GNU Parallel is a command-line tool for executing jobs in parallel on one or more computers. \
+It allows users to run multiple commands simultaneously, making it easier to process large batches of tasks."
+
+HOMEPAGE = "https://www.gnu.org/software/parallel/"
+LICENSE = "CC-BY-SA-4.0 & GFDL-1.3-or-later & GPL-3.0-or-later"
+
+LIC_FILES_CHKSUM = " \
+    file://LICENSES/CC-BY-SA-4.0.txt;md5=7130783469368ceb248a4f03e89ea4b8 \
+    file://LICENSES/GFDL-1.3-or-later.txt;md5=e0771ae6a62dc8a2e50b1d450fea66b7 \
+    file://LICENSES/GPL-3.0-or-later.txt;md5=8da5784ab1c72e63ac74971f88658166 \
+"
+
+SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.bz2"
+SRC_URI[sha256sum] = "6de22bf1c67f7f316670d21ed1a2a32f1214dfbd3e420939ba937925c0a57a12"
+
+inherit autotools bash-completion
+
+PACKAGES += "${PN}-zsh-completion"
+FILES:${PN}-zsh-completion = "${datadir}/zsh"
+
+DEPENDS += "perl"
+
+RDEPENDS:${PN} += " \
+    perl \
+    perl-module-ipc-open3 \
+    perl-module-getopt-long \
+    perl-module-file-temp \
+    perl-module-filehandle \
+    perl-module-file-glob \
+"
+
+BBCLASSEXTEND = "native"
-- 
2.34.1


