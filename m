Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 584F310A3D9E
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 02:13:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.63664.1774577589949658782
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 19:13:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jjAcqaua;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75464f318a=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R0WVtt4026212
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Mar 2026 02:13:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=ccMI9kK6qtBlzLsABl2B
	xo/hW/yo83eafKPiuytOa/o=; b=jjAcqauagb9PXGkbVFrcLmDDZM1L6SB8PeVJ
	L5dE6/ZrKXqZzud3c1pt87KNK1J5/y5UDtJvEvxUXj29FBIDo3e8hKpWTli6vixv
	AUnv/urd6zNHIGpaZ3Xhsx/jNeaedJNgnMJqprH5pzVqK+V1dRErwRHSYjlpI6/M
	iI21sQ5//0LcTU+mg2RZ6tTjmHpB0FmJTkfciFSf8LmS7u/QeSEyjEgWKV3oRzhR
	GJ3DJ3cD7WC60I+GTvomNPt3AvshLu4cwZx0lipIkbF+rzU73iNiB1itZ/11g5kB
	PC1+BUWK6JipHxzgvqapPAAXZeSGbYPI7+Ux/r4Cbi5qtebteA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011068.outbound.protection.outlook.com [52.101.57.68])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1gj87ewe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Mar 2026 02:13:08 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L7T9v7F2zLXZ/aAedKQua95RtuiRq85U7LzHc4FTeTXh8Alx+EySYjvwcrkDBo4MmI/avoDiPBQPz98gkVQXSl7qgRkoR1Lm+zZxUmhOLoZQpKBKb7wBVtwerWGqAEdktaZwOCNYYhMWgzf05XaidSjsVpBN3P2L2A5AG6zo6zkJyn7azCFeKJI4pqFDZnnWWDs4zDD2V1uWC4Zu51rTe92PKk9HO9RXsW3qSPT/f0+a2tghOXg4uJvOZ9uBbp7IjKVfKS/umpkapyD3SzzDhnxiif9fcNGbeRFaiHE1wYqFuS7z5YL5htFkzG05lsePkG+F5qDSKXKwdufcp3KPmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ccMI9kK6qtBlzLsABl2Bxo/hW/yo83eafKPiuytOa/o=;
 b=iOPStmKO42Z01An+5sTMJrPaf084NL82HvKRYe6WtB1Dc++XHd7CfeJqSMifBYhE5BB3ewYU6LyHbVV5kOLQl16Pxv9kad+679XkmshVfft6EOosiONCsr/WIEwZgcsjQWGKH21iN3JnDAor88T5C+ArtLd/WCJoHVBal6qVC92Mnn+tV3L4Fq/JC/BMHOD7EQgH/PzvsucB6yQvyarWNr7pehEDb421mXXNJP32uXChgG56ppLgoBcSryi36erRn2Rmq2aTAqF+4WDbhbN+sgFGxoqOi4hafnQkCaOdpcldhbg82FhuOGdWQlaS8/YArWhhgNJ3HE30AOiRJhGl9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by SA1PR11MB8279.namprd11.prod.outlook.com (2603:10b6:806:25c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.6; Fri, 27 Mar
 2026 02:13:06 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::7b99:70e4:edb2:30c2]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::7b99:70e4:edb2:30c2%6]) with mapi id 15.20.9745.019; Fri, 27 Mar 2026
 02:13:00 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] openvpn: fix ptest
Date: Fri, 27 Mar 2026 10:12:43 +0800
Message-Id: <20260327021243.2363493-1-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0056.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:115::7) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|SA1PR11MB8279:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b66596b-7cb4-4f52-bfff-08de8ba65e71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	4wOxDJS0FHbS0FnOE5jlVmgf7yPv+Tmah9OBu1fZNZf4apBpDM24VGTGHaqBZe6q8eumsHPzcvro+1JojDwE9JXQ5fWWR/ErCZL27LMPmTRDAf+LBmP7XrrL7x+aRM5Qvi72SYszU7CCsSaFYbC3i4bZhyF/zXh25PmcYqkHnHlCLJ/YRHnCMoR6Ye1huH0J02Iyu+cPQs26MGwhnLwcvfnhFRheTruFF0wSspIxEKnDztp+1H+G/QhH8isLiT1Wk26ns0XyTO8Bd4JomF14kNyHnp9h6up8yXRsoPh7sZqSDT0VEC05qm2hsoCcbk3po7f9RIO14ASfmseyBJWbfW/UeNRFFAlzNaVQjS6+HrkfgCLbpDfj738lPWK9uKRrvn9E16Vy/tAkYZbYF3GveK023tzNH1jNhsAgGD7txolVWgMRHYrOTuEkM95MkIJUJ2RAEJwFW7jHzfhhqSzvSwOlLAhnBj2URdFVTSi61iFB8QeSebFYc0/jL4y92RJekWFa1/EPZ37QdEkf4LVv3BXYBZJ6SAC8iQT8pL2+AboHT7od4jKB3tkXD8W5jTDl4ypJjLMwAMyH8LHHMj0GOa2XTXT3Vb/+S3QLO/7I1MQW7H7j6hXUjaej1DaUAd0fp5v/1nTPfRTxdYmsEolSZ7AmdMtOOy2N4tM9xFhb2j5slEkNhxu1qFUHXAD9ylOTf6IbC9omz4xYvu3jQ215tjwJkF3gqaRr+fbUwzwHR2Elh2d2kYv/7L9zZl+ft7S+
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7xQ4WgwU3zjDgS7pTz4Z9Ta8fO+sIZwcC7i2Qo8T042xy8lfISzgIEnn7qBg?=
 =?us-ascii?Q?XuNPSUKByywQ2R9V0k8NkgcHWA6Rbgzcx005T8m5WuZc/pCdAwRIr7ykJGPM?=
 =?us-ascii?Q?g58Q6BX3WFP2iSBtaOH2WJytXhdcfyCkTYeJ39Fp9uDjUZF1lmmoSDGF/xz6?=
 =?us-ascii?Q?9NEX3/2yGHGFdZYIl/KlsUFBC7BwJ3KyL2DswbyXCxgMKwr2EBOZgGm3TqNW?=
 =?us-ascii?Q?aoSPJgW8sPmPdt+5QBgk4tULP4QU1X/9R0tO0oa2ynX9j12XuW5/D1fOiL4b?=
 =?us-ascii?Q?hAdvNah1UQ8/DPWXbD0DHdAJ2rYoYE9h53SFTCLUHeeF9QfuXo47ZjAH+XeX?=
 =?us-ascii?Q?rB35gM8sUiRNsOZZGJIzL75rqLFTDVl9qMntyq2fwTUZkfRMMyHNACd4whdf?=
 =?us-ascii?Q?k6YMFYg6Mj64BEE4CZyvAS0jF9oXm+FEphR4PmNIuZQcJrc9Jl3WtPBBtfkj?=
 =?us-ascii?Q?aJar7TKkxSRWCqu2Zq9jsaUoXyIGto753z58TbnB9aWIZeXZR+GH2TkVjHSd?=
 =?us-ascii?Q?vHs+mI339Ph7X7D/K/TnONFUZDtpTPUw+g57iosXbyuJgE165SykpmEJMlDM?=
 =?us-ascii?Q?lKaOAsziwoAMiuH48IouKMjphi9KjADAQ7GxFSgC0wEtfZKpIkvySmC4Q/Hr?=
 =?us-ascii?Q?2a6dgSiqI6cU4E5faAFQ+T+c8PC/OX9qST+KdseGSovfewhNsqs9Tuj1zWYy?=
 =?us-ascii?Q?+Zoqtlnxm5GmoirprR9VJbaNUl6FYh7kZphM0YcMBB45TIKp3iVnfxvQz/ke?=
 =?us-ascii?Q?bzyW6tB0WIc5bFZTfrKRmYvKieUG7PiN3Nkj2YOm3AncjLSSgmT+ENeX0dAh?=
 =?us-ascii?Q?RnC+hRmAUVq0gSUhpzalOPEDiHTjnqWvNXuldZFZPeUgqFIZDl/GLik+SoZR?=
 =?us-ascii?Q?kZUm2gO1iZLKQoqgqF/pIoC7LTVt8LRnVzbwwOYNa6eBElOYh1hg+8N7/Yzl?=
 =?us-ascii?Q?0cgUCppbz8wVz4jQx+/aD/+jbXa2e1+C2JbbvVfsU95n8p+kx4fBjpW/Sm4y?=
 =?us-ascii?Q?rT7otqdYa609CWoo1YhiJ2wOs+AnlZEOWwTGnrQPoxDLyJNMnq4NAx5P3YEp?=
 =?us-ascii?Q?YXjGqKv0nWHyLBXzEFnkgQODMxrOUe7A+aNXUmUVZ1onxTn2K43x1+vV0R/5?=
 =?us-ascii?Q?lAok2Y+/sNkhPlHpV80c9i7noxQsbu3TvrI8zwQHBvfvL/QzZZb2HCUhPqG7?=
 =?us-ascii?Q?HURh54Lu1oAKnwkHw+6n9R+KQpsX5c0ZTD+xPBtMdoIzqv2zP/4agFwQBaKX?=
 =?us-ascii?Q?U5s4SagaYud6wjJQdc3fZ/gj9o2VohvxhGgBoHTjBLcHMkXB6c0qCwjlBF5N?=
 =?us-ascii?Q?W3BDhQtIiM2+VoUivWjC6QbKEIwiSJBt4ycZto/8SxdxoiBKdKVtUjm8Zq6Z?=
 =?us-ascii?Q?sl9CbDR3sHsC8KjvnZkXc0lhQp7vKxp5hj2OJ4CJ9WosAFZgQOa3rbmRaTkr?=
 =?us-ascii?Q?KuscQs00X67x9Fm3RHVcqzlN+RhVaf0egjXbyLYdftDTpGeRTG0bbXDtztCe?=
 =?us-ascii?Q?1RGpI/MQ8aI5P8m9DvkmbITzhxCfqJadtHDJLu8fQHBrSRopvnOirW7PJtxx?=
 =?us-ascii?Q?PBpPZeuMVCUHlzSMUVP8zrBSsIJYH2KDCYMQkcZmDfjLi+RlGukPGp2zQBHb?=
 =?us-ascii?Q?+poLOIPlGTSxCBEUsFo2KM9q78F8hx+vWT3EBIPx1Ka2A7onBNZz81+4u7n+?=
 =?us-ascii?Q?9ilzBcVKeb1UvDaKXviBaant4Prqlh/nF++mr0D9FuP3vy2zEEXkPpZ0bz+k?=
 =?us-ascii?Q?zUcx4rczJCqFu/HJCY+gqHiatSpE+Uk=3D?=
X-Exchange-RoutingPolicyChecked: 
	fStqLlaXSspeEK2/bejZR9E+lT/+qrOjB1OOH5SEUSvb5zKBXgRzdQPpeY0ctjNsP1sl78iW/cG5VPOquQjVHkyNlXlpRzIBSl/hyCwivKAqShdN3Hos42Qe4qqyE7YT+OGeAvzqgK2+D1zn/swfLPVJdvCRRedFjzHpgCpsUhOp2MAtVzxgxM3s7OiGvN4HG7UTZ7EoGrPpAr4mzd+oiXvAuSeqzSSdZ+RBgdhahA3f3hU6XpMbxzSv5OR54CtHiG326aGosoaT/nNEeFSSZFTyeXCHYrwIPTkQjSeANdtWLI9a3KQ6nYIgqTIM7BuS/sv4CfBiepm5WBDCFrjJtg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b66596b-7cb4-4f52-bfff-08de8ba65e71
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 02:13:00.0873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aoxnNXgYKSR6rb9w+HDDfg1KSBHQZUBFWjPE9K5dpELViVMQI3fEt6cK6bHKIRxMIuXLtntqOR1zQAneWCmaZO6uF4CiaWKxmL10nfuaqrM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8279
X-Proofpoint-ORIG-GUID: HNG5c5m5w51T0j8K0o-lUnGOFJUGMlsQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDAxNSBTYWx0ZWRfXxd8UHQ9WXrUi
 1p8GquOfd8sTWgRBQA7YVhLH9PeEqbATvKsFzfHTdrNyZmpKpin4unym5IlBkxUnja5D+JINqdU
 HP+M4LDdwWX91QPQPmJ18vFjr8x8XIqU3Vl+5mPemxXVZiBD979XiZPsD4A96STOF/6lxuReFof
 B+2NxZA6M34grwjIF+CGqBFFYEkdP9O4UM7GPdbRJRvH8gstwXguOgrLqbDB6th1clpIiePsrVR
 hBhkTJL0YWATxxJI877p+9plqVnTrOiE9RWXNQam10qY/llplb9YjOeDbZNhRTGDeYYXFIxvvIm
 4rtjPx3QgDetpMcEKvkY5wz+9SJ9O4l49u7H/FIY0dHDlx5g8Yms4xbRmmhd+BTu+n1xAGTQ0GS
 duSCnfvVk1AXD/dFkb6PxB/9K4vcB8DXM4LzPww32pxbxobqinf0IOAoI1/CEsczQsgfla/Mgbm
 WfaKGnOXOYQ/Qh/Z4Xw==
X-Authority-Analysis: v=2.4 cv=LtqfC3dc c=1 sm=1 tr=0 ts=69c5e7b4 cx=c_pps
 a=lgH93Z6fMBj3OFKE3BLqTA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=9dNbsytUAAAA:8
 a=t7CeM3EgAAAA:8 a=Cd3AInuVlhojgRMxLRMA:9 a=gPpeecpFUKP6j8iU7U-x:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: HNG5c5m5w51T0j8K0o-lUnGOFJUGMlsQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270015
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Mar 2026 02:13:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125776

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

The openvpn 2.7.0 upgrade refactored
tests/unit_tests/openvpn/Makefile.am, changing how test_binaries is
defined. This caused autoreconf to generate Makefiles where
buildtest-TESTS and runtest-TESTS no longer have rule bodies, breaking
the existing ptest recipe which relied on these targets for compilation
and execution. The fix replaces these internal automake targets with
stable interfaces: check-am for compilation and direct binary execution
on target.

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 ...-test-execution-when-cross-compiling.patch | 34 +++++++++++++++++++
 .../recipes-support/openvpn/openvpn/run-ptest | 16 +++++++--
 .../recipes-support/openvpn/openvpn_2.7.0.bb  | 30 +++++++++-------
 3 files changed, 65 insertions(+), 15 deletions(-)
 create mode 100644 meta-networking/recipes-support/openvpn/openvpn/0001-tests-skip-test-execution-when-cross-compiling.patch

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
diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb b/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
index 256774712156..0cbe4641cd6c 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
@@ -9,6 +9,7 @@ inherit autotools systemd update-rc.d pkgconfig ptest
 
 SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
            file://0001-configure.ac-eliminate-build-path-from-openvpn-versi.patch \
+           file://0001-tests-skip-test-execution-when-cross-compiling.patch \
            file://openvpn \
            file://run-ptest \
           "
@@ -47,7 +48,7 @@ PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
 
 RDEPENDS:${PN}:append = " bash"
-RDEPENDS:${PN}-ptest:append = " make bash"
+RDEPENDS:${PN}-ptest:append = " bash"
 
 do_install:append() {
     install -d ${D}/${sysconfdir}/init.d
@@ -71,21 +72,21 @@ do_install:append() {
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
@@ -94,21 +95,23 @@ do_install_ptest() {
 
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
@@ -116,6 +119,7 @@ PACKAGES =+ " ${PN}-sample "
 RRECOMMENDS:${PN} = "kernel-module-tun"
 
 FILES:${PN}-dbg += "${libdir}/openvpn/plugins/.debug"
+FILES:${PN}-ptest += "${libdir}/openvpn/COPYRIGHT.GPL"
 FILES:${PN} += "${systemd_system_unitdir}/openvpn-server@.service \
                 ${systemd_system_unitdir}/openvpn-client@.service \
                 ${nonarch_libdir}/tmpfiles.d \
-- 
2.25.1


