Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 338C3F532E9
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 07:16:56 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14293.1774336606706343961
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 00:16:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UP0+cXVr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7543dbf287=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O4JtO21856584
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 00:16:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=Phgr6JDeriFKSPkUef2d
	7g2DHJWCAEpfRhPlE9uYooQ=; b=UP0+cXVry4JxyWUw6d3WZHos5bE4vLuGZkol
	X+D1E54/XQkD8wwN2OYEyt+qm0m54o/Ht9nf0aIO1FvWP9yVud9TOUBO4SDUC59t
	BcB4DrWl56TYzKr7a5k81WtFobhwZYkqg4fz0n8/2Bk4mdxv1e7rDg8HaHiHrcom
	6l15O08kWCwWon0LPohJ8NZFX56LEv9k2MLQ83ojxBrnWteKWWyEDL8KBGQe7i1H
	BDGPr386u6lYCihUKB8RS8ZXvub9n3Pzd9BPdadlA6tc5AD7cdmNDvPagn7Ynh7U
	i1JCak6Kl+837fvUpEqqW/CDmzQb22Jxxv+XkN0E6Wvk2j3Qhw==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013014.outbound.protection.outlook.com [40.107.201.14])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1pkyau25-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 00:16:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AOwy3pdBjfyV5sCAmFuxcLTTLUQloIP1hpYr+oDFiKAxS/j+SDADOYF1GoBFCI10PuAYOaTFD+KidGy9hDAypDhMGLhplC8QYQNxXm5oCKkFnHXHom40zCpKKFaZ4X8EF9ew+9ZzKZz6qrtz0pXCdWK3ZRfj0ME4aRVvTeSQHz3yUUJ6pKu1gs5nldL6GoZvlSMJtYO9mBONhIL1mDMocyD8H/+evIywUjS3Rd84EUEmEQ1JCkFBQ8J6+CiTa8Y2Qy/c2P21GnSMm8oTO+EMT57+Cn/2ODUAU4g/NyFvv2YM8AzNbuFjYjVxibN0ByXQvAg4N53uUj5X2pv6ETYgwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Phgr6JDeriFKSPkUef2d7g2DHJWCAEpfRhPlE9uYooQ=;
 b=due6qrTLPcaOTTWHtIf3VgFfpehTqpswKnHjLBplUpSkS6A3D3bVmBECpZuoNbxNLoLB6FztHMt0J4yr3aHWU4HlKFN6FXQdcj01FYhQDI/AbIKMuYZfiVp3a3J/fxCPOX/VRdMbS1IJkMYJbThBilE/BDWQdW8MV/bipvxgd3f2FmO5l3OuOTJhGpAVD2vx0sst7ZuQxnJHoqnvexKrSJke9wJdE98ewlfuGPMhaUyG5IlcSHN2d5sK11yup4YI10DUv+uFC+0MRtg8MutJzVfZj7FDpyMshZn1Ppzwej6VjEnq7hQj+FjGA2U+sDWlyoaaPzn83DdlwMPkM/0UTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21)
 by IA0PR11MB7696.namprd11.prod.outlook.com (2603:10b6:208:403::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 07:16:43 +0000
Received: from CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::89ea:ecfa:c345:3fc6]) by CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::89ea:ecfa:c345:3fc6%4]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 07:16:43 +0000
From: guocai.he.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] postgresql: add ptest support
Date: Tue, 24 Mar 2026 15:16:21 +0800
Message-Id: <20260324071621.3104812-1-guocai.he.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0039.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::16) To CO6PR11MB5586.namprd11.prod.outlook.com
 (2603:10b6:5:35d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5586:EE_|IA0PR11MB7696:EE_
X-MS-Office365-Filtering-Correlation-Id: e24455e3-3fe0-4e80-d9f0-08de89754d1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	a8/xst8YzmU/1Ta3uF/QQA8VTiXk6t5xbDgH9//32m3QXVtkHW1t4+oqSizfdtnh+x1rkhoK9EEkhWfBmqUknJPdW9O5nTZjkQYZEOpEzVOolwf0P6psrZoFcpTyBkb3TmWXdM2ESAOw9dIKuCU0M7MozM7iVnbxxus7ongCUbTb0+hsW5FeOI0ADhAxQDIKyYULSDrr4vtQ6O4BpD8WQYd/hMdhmgrf3QanIZyZlb/Y7mMuA1vdwVIfPE0OQ+bQ44zt/TGJtxmyu7JwpfG0tfQBZ8ZgXrv6ZAmfTcHI/RlN7ZMG1DfoN7BhZdzVNDI/5abmtgdDapDN5YrvfaOhMOmIh7+6vMeQODYido6R/J/Q0rYRbdPdnq7yK6iILx11gq9G+HSKzgQCw0lSf9SXMIgO0aYFMe50ZLR4cIerp7gRCtsvbMEIxkYuBT1hXOiioy0/6KF5VNPrVXuSSI2jbuW3LFdcfEmbvlX6waGMREj88jJ8phJ7EAY72JZNakVaELtNBa+vuwv5qnVHpUW9klhhhvn4rxR2BbwAJpaEq4/hLZUW/2wQETz7UARhFzsUMS2/P7ZRNohmy1y/8bZkAODM88/KBjy0qz4bYFK5vykgO2CfH67+dwoYcMHxVmcqW+yNhEr6zPcqc2LFsciHN8tgWtW904R0uzLc0mjw47YL1cj8+E+YmICeB1/1mrZKEkHmWyajfVx0UfnWv6HuoDmABKzg2hiU7MGs1DBFSBlFKNvwRUzYrt9TGUwPguuqOXAz11LzWMzS7tiMk5xUrDONv4zWkk68Ez3fZdk3aM8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/SlHC+t0hoPmYbBGHxZiOnslE2kOChsl73UVWX4Nh1mUaj6KJSr7GDySAXh7?=
 =?us-ascii?Q?Zg/+Y5EDfh/TEOu38mFr0vsI9HB2aQTA2ApQvrfVUZDnrhZZHoeWJr68zQAp?=
 =?us-ascii?Q?R0O1UAwyQsXtAhtxs/jT1hbGp45qP2JclS5yxaVoSmo/ft94R5KPbV3mx1Cr?=
 =?us-ascii?Q?ZF42D2k/3lhEze+OXHfp0m7bQfQ46A5Ml7RvkkRRog+QQvGg51St4OcNOJLe?=
 =?us-ascii?Q?2Dzsj3TKcXHfL1FGqAxr8wJGRMk/Xs8G6UsFAakqxUlpfmhBaU8pMJh1Xel/?=
 =?us-ascii?Q?4V5QEMVMBlSPuQ/ipN1sVKF8ThBcRLFeGLLLaapo0IQOJUIqMLHfPCs4VGjz?=
 =?us-ascii?Q?8mHtawCDT6QoFayfQC1yiJAbYmsmF6yTgy671KcMHjYgDk+Q4AzX5zUV2HLV?=
 =?us-ascii?Q?kTVckM6zMIFlKPuU7RFlEeYD2bEa5WnQTHNVG1fy4ZN8eDgLUx7xhGn9PJAI?=
 =?us-ascii?Q?dPoTEnu38Jn4ZK5bp+Rz1V10T/yaMtDExXLbDbXWIiqEmMGNb3Azrys8Lu5q?=
 =?us-ascii?Q?8JA7zesfwVZPLFPm+suIreaV+xDj3bHPec9wz7Qv6ZJZqLy18HIEcWCE/ctx?=
 =?us-ascii?Q?Jjs/I9p4BHgWR0LroldtqFneHvBNyvMIRXrRdL7Jk+D9BeKrTf0OOF/mwMoh?=
 =?us-ascii?Q?J2NxgxuLftiD8upGbFD9naRLVB/d1cWdc5axg8wa5cwaHepp5mFRJ9zZ+RbY?=
 =?us-ascii?Q?w0DOt48hnWNX76z/KGteZjnwuzaxbCHrqXiawsytszkwMWlZTf4LYCZXbfHP?=
 =?us-ascii?Q?2c3Qhq6fta3Y8fNlID0HA8FIXtN/QfUJpFeGDwUxnwfmX3WQHYMRHWCm3gPo?=
 =?us-ascii?Q?vuSZe/2pUYakfwPHDuqBB1Rw4z9A8g/QDVYyZeqmlhimfIE8FydYJu7cAGWs?=
 =?us-ascii?Q?6wEYWaLyPVL7OuDkHzSfVQudNryJrkUEcNBXusmu013PxodyhiMBU23nMs0n?=
 =?us-ascii?Q?1CfaYWoRWTossXeJOzwXiqaARl9MlzOY80VVFph4Jy9HdtS+UG9tVbtCdmlK?=
 =?us-ascii?Q?X2W9vyDMHnImrqUaQrK8dujgM3JBOBkphIe29/a8f0mbEYgsIiC/Y1VlXG8O?=
 =?us-ascii?Q?JpixnVBIrHhFgPw6acHTWoVR9RieFmxlZL7mfu8xjB4CKX7O6JE+KSCh7v5J?=
 =?us-ascii?Q?P0zHOW1HoI8fJBhOOnwMgRXDf/yx6xTaTra2Xbg67eZQeImAgtibNOTDHCP7?=
 =?us-ascii?Q?5K4fTYHVqfRB0n22LAS3Lye7Cin0TyA/nHi9ZjKxnmcv3wifl4x9yCeXj+L5?=
 =?us-ascii?Q?CVZvhHvd8w11+vYR4WfOU8v6ozjpF1IfCgubU/EIZP0bArO7ZEh2mI08Z0g5?=
 =?us-ascii?Q?vnvV9ZfwobCyTAVG4ogGCTkUu4R1RAm1JLIjadJDpW6HWb2fCZhtJRkHj60C?=
 =?us-ascii?Q?dGj/GWYH5yjjAgSEm7k2722vt5z6iCI+B1Vog410lRzuTFS9BPk0U3I2MjgB?=
 =?us-ascii?Q?P0kLyNkH+Nz03/wopu2z/gpGnsVN/K9hQpz1fO5lZLBTFA02va+udg2DN0i4?=
 =?us-ascii?Q?j4RD4nw5lyD8iaKH2B0VuUBQXVjofLaJSJn4wE+gI3NKlXEDFoKweoEvs9ev?=
 =?us-ascii?Q?GPJIkePRCcV058tC+G2GFbfXnlx+g/6XOg1FQ/FAl0W8WQPXOEzFMHjEGRdU?=
 =?us-ascii?Q?yH2UTIBrI/z+rVgz/nNNHVgORBNbGfE1nGFgrsVJ1rdEkWpm6w8JU+ljbQb0?=
 =?us-ascii?Q?HonxsCJhr7vR4HOkwro7RVHBlZ0ZvzFKsZxMC4pRCJs3+s7Dvbn1bzKV2uxr?=
 =?us-ascii?Q?XuocPvM6UcX4ed5hOYkTuwo84W54u2U=3D?=
X-Exchange-RoutingPolicyChecked: 
	IS482vhPc+2J+NtSakG86XyaSuHrJOQ4CiYO8bZAQCu12e21tQOMb6RcGibPB9e+v4syWINWnZXUvqIMsbJLk6WnIz/fRMLDi5HZeE4KQJ85ZTrzTGkZbZ03zYln8EdXLz6ViUd+JWNM5+Y3m43U0iYrQD1mzI4dFLmJ9ZZumWW+rYMCdoGWtnRaJD47Uv36rmHeDkxShE9LMfTdXQufovW8ut4zV5OCbOOC0LmVxSV8QToq/XN9C4fzxXWrP2O1RooMRsBbmdhEift6BCe24cS9xIbs0W+09Lsuc6R/WsgKAdmnEkWHRNCL0KsL7+SuzjxPxON2JjNqUp0Ir8Rtqg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e24455e3-3fe0-4e80-d9f0-08de89754d1a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 07:16:43.5822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8OIrlYg07JG4180SKDDmaQeBMRQl02IYdJT+m3dbAvxw/POyVUgro2rRMcQ/537b+GkCfVhf7A3liLSRJ2S0QxxeLCDHu590UB5rh7lp9wE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7696
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA1OCBTYWx0ZWRfXzk4YWqxnL9XV
 6v7+iHN5zw/J94IChMGPLIYKRJItZ/saB9mdPmijAhOWw0HF2/zX/gqkVU7CS/C9DVlCHw+foPZ
 /2jSdKqIeLMLqGxHV+kIJfXTOv1uhgPThz+HpCIPP9G/QsA/7j3Za2CT+ArqwV/xkABPVRH4ZDw
 daO6y48t9ZGQ5ljsZ+unblqtB/FOkkGOtHIPHVc9bdJImSuG9mRxXPuZUN7NokLQesLfcLeKsis
 q6l9Jgz4cK57K4JQcBLhO1cDvX7ADbqEuo+qwH++Xt0/6ObZ9kLh6tVL+jfD5zw1K8dYED1Ct6j
 HemjeWHDU+kyNKH1EIhWVViM85wEKaDVTZchp53IZ+M25rzdfJYe2w+Z9qbbmrmXiZQZ23Ui9fv
 0Gwckki7nQoe+lRNFsguBcdzUM+Mqvh1AVknCY5NK/dqHSIHGLYHLh24YJ9pNFSM6cJtGqu34T0
 mPqvlPanVlhPa4Zkp5g==
X-Proofpoint-ORIG-GUID: CBDbfkDeoJ2r1SH_E6I3QnwrnWvYYF-V
X-Authority-Analysis: v=2.4 cv=Scr6t/Ru c=1 sm=1 tr=0 ts=69c23a5e cx=c_pps
 a=qO1H+kaF9sbjJIkK6g+tnw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=epTmVMiNAAAA:8
 a=t7CeM3EgAAAA:8 a=0TgTIn0VeoOxeoTOSFsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: CBDbfkDeoJ2r1SH_E6I3QnwrnWvYYF-V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240058
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 07:16:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125542

From: Guocai He <guocai.he.cn@windriver.com>

Add ptest infrastructure to run the PostgreSQL standard regression test
suite (pg_regress) on the target system.

Test logs:
root@qemux86-64:~# ptest-runner postgresql
START: ptest-runner
2026-03-24T02:42
BEGIN: /usr/lib64/postgresql/ptest
......
......
All 224 tests passed.
waiting for server to shut down.... done
server stopped
DURATION: 853
END: /usr/lib64/postgresql/ptest
2026-03-24T02:56
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
---
 .../include/ptest-packagelists-meta-oe.inc    |  1 +
 .../recipes-dbs/postgresql/files/run-ptest    | 53 +++++++++++++++++++
 meta-oe/recipes-dbs/postgresql/postgresql.inc | 42 ++++++++++++++-
 3 files changed, 95 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-dbs/postgresql/files/run-ptest

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index 4de602ac1c..0e395db48a 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -76,6 +76,7 @@ PTESTS_SLOW_META_OE = "\
     fftw \
     libusb-compat \
     mariadb \
+    postgresql \
     re2 \
     rocksdb \
 "
diff --git a/meta-oe/recipes-dbs/postgresql/files/run-ptest b/meta-oe/recipes-dbs/postgresql/files/run-ptest
new file mode 100644
index 0000000000..004cf2ba87
--- /dev/null
+++ b/meta-oe/recipes-dbs/postgresql/files/run-ptest
@@ -0,0 +1,53 @@
+#!/bin/sh
+#
+# PostgreSQL regression test runner for ptest
+#
+# This script initializes a temporary PostgreSQL database cluster,
+# starts a server instance, and executes the standard regression test
+# suite via pg_regress against the installed PostgreSQL binaries.
+#
+
+set -e
+
+PGDATA=/tmp/ptest_pgdata
+PTEST_PATH=$(dirname "$(readlink -f "$0")")
+TESTDIR="${PTEST_PATH}/test"
+PGBIN=$(pg_config --bindir)
+PKGLIBDIR=$(pg_config --pkglibdir)
+
+cleanup() {
+    su - postgres -c "pg_ctl -D ${PGDATA} stop -m immediate" 2>/dev/null || true
+    rm -rf "${PGDATA}"
+}
+trap cleanup EXIT
+
+# Initialize the database cluster
+rm -rf "${PGDATA}"
+su - postgres -c "${PGBIN}/initdb -D ${PGDATA} --no-locale" || exit 1
+
+# Start the server
+su - postgres -c "pg_ctl -D ${PGDATA} -l ${PGDATA}/logfile start -w -t 120" || exit 1
+
+# Ensure the test directory is writable by the postgres user for
+# regression output files (regression.out, regression.diffs, results/).
+chown -R postgres:postgres "${TESTDIR}"
+
+# Prepare the tablespace test directory
+mkdir -p "${TESTDIR}/testtablespace"
+chmod 0700 "${TESTDIR}/testtablespace"
+chown postgres:postgres "${TESTDIR}/testtablespace"
+
+# Run the regression tests.
+# --dlpath points to the standard PostgreSQL package library directory
+# where regress.so and contrib modules (autoinc.so, refint.so, etc.)
+# are installed, so that CREATE FUNCTION ... AS tests can locate them.
+su - postgres -c "cd ${TESTDIR} && \
+    ${TESTDIR}/pg_regress \
+        --inputdir=. \
+        --bindir=${PGBIN} \
+        --dlpath=${PKGLIBDIR} \
+        --max-concurrent-tests=20 \
+        --schedule=parallel_schedule"
+RESULT=$?
+
+exit ${RESULT}
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
index 040b3d5e34..dfc624f07e 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
+++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
@@ -29,6 +29,7 @@ SRC_URI = "https://ftp.postgresql.org/pub/source/v${PV}/${BP}.tar.bz2 \
     file://postgresql.pam \
     file://postgresql-setup \
     file://postgresql.service \
+    file://run-ptest \
 "
 
 LEAD_SONAME = "libpq.so"
@@ -37,7 +38,7 @@ LEAD_SONAME = "libpq.so"
 export LDFLAGS_SL = "${LDFLAGS}"
 export LDFLAGS_EX_BE = "-Wl,--export-dynamic"
 
-inherit autotools pkgconfig perlnative python3native python3targetconfig useradd update-rc.d systemd gettext perl-version multilib_header
+inherit autotools pkgconfig perlnative python3native python3targetconfig useradd update-rc.d systemd gettext perl-version multilib_header ptest
 
 CFLAGS += "-I${STAGING_INCDIR}/${PYTHON_DIR}"
 
@@ -184,6 +185,45 @@ do_compile:append() {
     done
 }
 
+do_compile_ptest() {
+    oe_runmake -C src/test/regress all
+}
+
+do_install_ptest() {
+    mkdir -p ${D}${PTEST_PATH}/test
+
+    # Install pg_regress binary
+    install -m 0755 ${B}/src/test/regress/pg_regress ${D}${PTEST_PATH}/test/
+
+    # Install test schedules and resultmap
+    for f in parallel_schedule serial_schedule resultmap; do
+        [ -f ${S}/src/test/regress/$f ] && install -m 0644 ${S}/src/test/regress/$f ${D}${PTEST_PATH}/test/
+    done
+
+    # Install SQL, expected, input, output, and data files
+    for d in sql expected input output data; do
+        if [ -d ${S}/src/test/regress/$d ]; then
+            cp -r ${S}/src/test/regress/$d ${D}${PTEST_PATH}/test/
+        fi
+    done
+
+    # Install the regress test shared library into the standard PostgreSQL
+    # package library directory (PKGLIBDIR) alongside contrib modules such
+    # as autoinc.so and refint.so. This allows pg_regress --dlpath to
+    # resolve all required shared libraries from a single location.
+    install -d ${D}${libdir}/${BPN}
+    install -m 0755 ${B}/src/test/regress/regress.so ${D}${libdir}/${BPN}/
+
+    # Install run-ptest
+    install -m 0755 ${UNPACKDIR}/run-ptest ${D}${PTEST_PATH}/
+
+    # Set ownership to postgres user for running tests
+    chown -R postgres:postgres ${D}${PTEST_PATH}
+}
+
+RDEPENDS:${PN}-ptest += "${PN} ${PN}-client ${PN}-contrib perl"
+FILES:${PN}-ptest += "${libdir}/${BPN}/regress.so"
+
 # server needs to configure user and group
 usernum = "28"
 groupnum = "28"
-- 
2.34.1


