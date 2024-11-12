Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 201D5D42BAE
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 16:51:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.91289.1731430283856712549
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Nov 2024 08:51:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1046b79d90=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACC0T82021814
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 Nov 2024 16:51:23 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42uwv48scp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 Nov 2024 16:51:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DKkyIWuuW2FPBoyOy+y4vUbLAyKbwm27AjEcqWukaPAk67MHQZRjbE/IQqO3JjroYKICs+AZSEZqIFwNcGYCoYh5udY18d1TgT/aeiCAOWS00fvIhhxmkgpfY/5rWaWV3j/jPQaJEUCQwBtQ1Ki6xzjisuY2+uyTh5sbZoPf2natLsuw6rUahmqIYQpsfbB/JNvL4g9YtdIUCkgB5vbQ70UKpaNLoYJtKBlfjgk3fXMtdBOxyWmGwwWjozTVbSPRkkrJnAshXAmUuy7xQ5V4ak5eNvhM2kZLTKjBPhGbIbPa6fzPup6L4rfJQuIPbwwb7AYN/ghuf0M12qDVN04U0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=he4iWJVCUAKhJWE7s7D9xtchcwsvVFZx1Pr0xOFMSek=;
 b=p36qwTk07l7zK41FdK+qGfjQ+cBgJctRu8LeKqNEEvvr1eP+xhZoWAIFv1vuu9DIT1EzixBbfhuGk04uEGnwt4AVuzkgeuGzX9kMHMW44nxWvKMbKVVUsMzYBUx9+Qb2heLrSc56d2Er3LPHoxLzXHOs1+wiUobZYwJX9JcM0DF7yQP580KrTA6HQpOMxVhNixK3J8t/aCVjE688H5LqvvsJ96IvLg4u1g2hWZVUpWtsPekjGzkgLrND2UGi+Ja9C7uuOeg/nK2SqvzHbSl7DFZxNRzPIX7zAqVJW9SVAIP8MjPsG8tQJCy/HkqnBQiuOwOsNbLR/iaMq7+f3rUZPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by CY5PR11MB6415.namprd11.prod.outlook.com (2603:10b6:930:35::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Tue, 12 Nov
 2024 16:51:18 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%4]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 16:51:18 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v5] parallel: Add recipe for GNU Parallel
Date: Wed, 13 Nov 2024 00:51:06 +0800
Message-Id: <20241112165106.2273168-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0200.apcprd06.prod.outlook.com (2603:1096:4:1::32)
 To CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|CY5PR11MB6415:EE_
X-MS-Office365-Filtering-Correlation-Id: 914dbdd2-888b-45bc-f902-08dd033a3a9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?tSWbNRh1RfyEnBgsCvayIGYBwRvSGqHPvYtDlkW1vuQadC1dFbGXnEiwKjjd?=
 =?us-ascii?Q?dabK+21xwkqy60DFwQdD1N71SOC25ZRm6uPHHQiYq/aN221OQu3OhrQwRIOa?=
 =?us-ascii?Q?FVbzpnYyZVQEr/ocjdOS6AhWXY5yeiRIg9xr2V67gn1P5Key6NaEBpLbQOUm?=
 =?us-ascii?Q?+WU7ri4krU+oNDOadwlvNMpuJbqaOy6IaIVMMnUaaqtcBUoTfUxqN/4f9EQS?=
 =?us-ascii?Q?uPmpmyFmz+Mv2gR0Td5nGyIREiqG67hoLB57pnOGUAHTorAN0ysOS+flIbOO?=
 =?us-ascii?Q?bsQ308vo7BfR6k15RTeYwxL7Unsv9dlnWTQhtAmk3vDGa1/xblCFmGiU5ceY?=
 =?us-ascii?Q?DToHSe/r8bKDl3FfWyaKGAAtn7Tvjb9mZh5XlzBXWZb+F2Se6pFxeJGynrCE?=
 =?us-ascii?Q?lVye7/jwYxfD16mBD0DYG2/aII+aJ/OwlYEa9m5sGPdSegyvt5bp8AieqRsQ?=
 =?us-ascii?Q?x9j6mnVOptPL9qzNmOBq5qIJiZ9Lbv6DdJEKoGqTNRlAkL08sS0F8pj+JY1C?=
 =?us-ascii?Q?/9/qv949moWlQemmwhdl+It+0t6oFL8Y5kWRJNoBS1CdVwew380z0TfAFnzv?=
 =?us-ascii?Q?5h4Ojfiev8v5mmsZ+GszuTG+hbMz6GbDjuVz8HmhsH+xXh/gD3WLVbj0A2Sg?=
 =?us-ascii?Q?6Y33WcKhENpRdbSI2RN0wxVhioymhPyIFbPUyx/uzc2clGTFfpdH68brpA0X?=
 =?us-ascii?Q?0jEvKX4cJnBbJbFevfrLaomGon7MfBVFomzUhJtL2FwlYhHQ7ABMbh2QkfPd?=
 =?us-ascii?Q?kybhX3kv935epAVlRwrHH8Y1ujJ+u//WeSwwszbMnHpdvgq8FG6PFV7ZXOnG?=
 =?us-ascii?Q?55HvZoQvkU6m5d5FpfwvW+9JMm/7qjXEwyuP7cFrw1qe8dZxnu+/wro45V70?=
 =?us-ascii?Q?xSOrkV4MJC8HVlAGzbWtOoInKfa8uwXWajAsXKoYHp3XvE4+r9LkIY7ENSEH?=
 =?us-ascii?Q?2poCUnleTVnSTvCPbCZJnV61G01wIb92PhweofNchKmpqOO1drGFTdFGkhVQ?=
 =?us-ascii?Q?wUsm8d3xXGsnfwfJ6DHF2O8keB/bDW/u8jor6RqMSKbdgOI+nn292EQ0Ep9U?=
 =?us-ascii?Q?rDPD4Bagxz3dQx8AYUq/sVRDlOheG3ZSk1FfSO2eVN65FBBTc/bEAVOVzPPA?=
 =?us-ascii?Q?DxYZhb79Bod9sh7T5+XVeO3ze0p9fa3ifU0N84jBDAwqdahiZEh7mhfdjXGJ?=
 =?us-ascii?Q?l/UkUJplJ+etQ0L2HyFtJkwRVRQnudgr3B+wtJGiVgKAAaB2YKr9Tm2SYjS5?=
 =?us-ascii?Q?YzAlsEAWxE8kgcMu4cHdZfsA09z/TZgoIya9JX0yQdD3YkkFqPuO7He/EO09?=
 =?us-ascii?Q?FufFNEEHfT9uWi0hBH9x6ou1yxw0A1TYRSVsjKIJGh8P1qSVK7zDnwh/ShJV?=
 =?us-ascii?Q?TkrT9j2VuK7/2BKbmdC4HYOH0O6O?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JwEo51CbSkwL4JmQ6lqmE0eD4s/qE7dlC2Wk8eBHQ0T5MheFsSPxWzPparDF?=
 =?us-ascii?Q?Pin/HcpPUvJMPhZ56xAIx5KVbQ8agaAL+CWmZNHoFVwK0XUTV9RT6nBYXN8J?=
 =?us-ascii?Q?3qPFVttAchd6fX0ItOxg7DJIKpwGgiUdthj/UxxF9WVj/RcGoGjjp0X0BXe+?=
 =?us-ascii?Q?ZhxQ5DKASwjSTumNnTB75QYNYWalUK2d7vqYs0qQZrBWXZwsowz7BWkiUZPX?=
 =?us-ascii?Q?s7L/nVaFyj8SI1Rlqtzh9yryMRocM24Mtb2onwDcWVIjySxKZ09h5VnyzSTL?=
 =?us-ascii?Q?mEu0Np2eCH2I1f7Em9Bgg0aQNOKhZIdcjTsO94vf9TOSklEFbXedpOdwH3vG?=
 =?us-ascii?Q?/HNk9idvYd6pCIhLVNfODYkdPARO0jYf29KXBh7pdZYvZQPdY5oa7FVkFrTA?=
 =?us-ascii?Q?tWR3A8/4de7N4K6XBGSejAFGQ5vMeYKj2+jRM+ZZgG+vECepDzzyEWRQ2QkA?=
 =?us-ascii?Q?es1sYouSRDWLFnZ710pSu6uTYDA1swZoqJnmdj7TnafAk1m+L1gHXAGvXrOJ?=
 =?us-ascii?Q?N6aEFhP3P/+g76bHqEtm/lg27NbANRuJrkHjokJ6IjqQJpoSGe1mS2bAhnfH?=
 =?us-ascii?Q?GvAro66tNdIBXoUU+LMtbX6QBc0fsGwZqueAF4anRULzNusSGojQXRWigdux?=
 =?us-ascii?Q?/UbQkZ7iDdUW/tFymjf/W47v+9NxOjTqJPU2tRATW4h5D3dGb7oCqrPKbzFL?=
 =?us-ascii?Q?qodjCzZdUk49sH7TROBiTZypnXt0CoyofojfqFBt8CkePBE5+T9WZIMR/QTj?=
 =?us-ascii?Q?+n/AKOmjGrnqbdx5lTToD6FbH3RbhlkAiMujQ+5PjLu7yRrMRRqzYLEmboWs?=
 =?us-ascii?Q?/6v4P/VEbPIeuXUJLA8j22LDqJfa8TyDgUHCU5TZaFcivlOq6haJtNNgXoR1?=
 =?us-ascii?Q?NSLvid2evmut0cwoJCsZ+1dKiiX2xmcG0W6Ao2/xaV5UvbMB6LBQBPWdvT7r?=
 =?us-ascii?Q?WZc/Gn/JTdslI1ImDESjcsN/lGy/fViheQ7DMEFDBEODi84pHiUTpXXfMWw2?=
 =?us-ascii?Q?KELue93zmPC+PFaJFd+BJ4JhpYyV9TA5NjUNoqO910JHr/zPv1GtE4iwzst9?=
 =?us-ascii?Q?9GFgLI1NFCnxau6NuBE7iTLMqLGkk0thJfaW7fL/NXB+7Jqfh9y9eiDO8s7q?=
 =?us-ascii?Q?QR9E0sAAK1Lm7UJYbYLkGX98s9rZ0nqHY/EPeNdb28SAwdCbaJFAlil8VG2H?=
 =?us-ascii?Q?qpIu6/DWqWtw5yCP5Z5YkK7t7DE7YAodibr5Q60lfheFZeHovFp2+4/bRhCQ?=
 =?us-ascii?Q?2DPMuzA9o3uSeg84qpb/udt9uoM+TRlu67/hIbsDYo+xMQA29TVfeVAMwGYg?=
 =?us-ascii?Q?LJP/8ioxEhVhPj1xNrR79fuxKRufEIIWokqD9esLIpk4NEN+JdhRms7Xpp9i?=
 =?us-ascii?Q?3Hg4QO7BgTfmsW6wBXZO93Lv3Q2+Q56GDsyte9BkTSVoXrTeqC7KxKwt0eIc?=
 =?us-ascii?Q?M/XFFxZlT6AJilhfCkgFoVYbWp4ne1+rj2NNIhgX9Vy3tVyKUzORMqSZqu4O?=
 =?us-ascii?Q?NgabrZUVmPFUa1PcsfFRZy40PtAyzkx8uGKLnoCp6Q6kvOPeRDtCav4E2+lA?=
 =?us-ascii?Q?4Rnebe2eco+eHE6e2S3fPtyWufq84JFEQWGFtsPWWV5BgaVqpIql7+uVU+kD?=
 =?us-ascii?Q?Iw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 914dbdd2-888b-45bc-f902-08dd033a3a9b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 16:51:18.4824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DwERU11TOpipMHJr0AYo/NTPSwnZqTSvwIt5qvByWLU1C1kdtYNeMWrYyD0ugBRR/fe1Y3kVfawh/lpL5izHvz7fy9p29INa8yEzkF4Prmc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6415
X-Proofpoint-GUID: DOReQV4sik7S5MatGoYAttrmqEQGlzXS
X-Authority-Analysis: v=2.4 cv=Ke6AshYD c=1 sm=1 tr=0 ts=6733878a cx=c_pps a=ztkV8ooph0rfw1Th5QLTnw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=mDV3o1hIAAAA:8 a=i1tBKHXAEGXFtROu0FwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: DOReQV4sik7S5MatGoYAttrmqEQGlzXS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-12_07,2024-11-12_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 spamscore=0 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 mlxscore=0 impostorscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411120135
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Nov 2024 16:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113795

From: Zhang Peng <peng.zhang1.cn@windriver.com>

This recipe adds the parallel package, a shell tool for executing jobs
in parallel using one or more computers.

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../parallel/parallel_20241022.bb             | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-extended/parallel/parallel_20241022.bb

diff --git a/meta-oe/recipes-extended/parallel/parallel_20241022.bb b/meta-oe/recipes-extended/parallel/parallel_20241022.bb
new file mode 100644
index 000000000..30ff9182e
--- /dev/null
+++ b/meta-oe/recipes-extended/parallel/parallel_20241022.bb
@@ -0,0 +1,39 @@
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
+RDEPENDS:${PN} = " \
+    perl \
+    perl-module-file-basename \
+    perl-module-file-glob \
+    perl-module-file-path \
+    perl-module-file-temp \
+    perl-module-filehandle \
+    perl-module-getopt-long \
+    perl-module-io-select \
+    perl-module-ipc-open3 \
+    perl-module-posix \
+    perl-module-symbol \
+    perl-module-thread-queue \
+    perl-module-threads \
+    perl-module-threads-shared \
+"
+
+BBCLASSEXTEND = "native"
-- 
2.34.1


