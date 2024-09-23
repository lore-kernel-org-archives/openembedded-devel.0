Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1E99CF9C6F
	for <webhook@archiver.kernel.org>; Mon, 23 Sep 2024 05:27:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.29928.1727069244723420634
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Sep 2024 22:27:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=99961af2da=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48N53EGV029864
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Sep 2024 05:27:23 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41skc292ns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Sep 2024 05:27:23 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VB/vjR3p1H/5SFdaGmreBoLLQ/3dHPi3b3P5sL5YnNBsZors7QbW2oowta3aLBEkuAqgJZHKehRwEMbJRj1ubYbWCgj1lo/jMT73Si009kI4YvacpmDBiAFUvXCEgvMEIqHSjkGIOmn6pDvUikpiKs+xAVqaaTpTaNseDdTciEm6KhNuNHLF/25CuhRerW/vBMkFhJAf+uLjuVGzsXOB0JjlDVp2fKO91wVOpVAIJYm56W6xAikuPDU3hP1IDkhzt+q+Sy6xGjLbaMYEo5YFVpPHDviSir+e91TphYx7KulFnzjXyRq5cyuZ47sbndfiiuqW6ovMJRWTs4zeVfjNkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RkmhI0F0rwNsNUgE+P66czKpAiG1FQyRTwHx9MCQC/c=;
 b=VLIOHG4RJCn7mA3Va9eGkCoPUECzDeOOOxg48s66fUiP6vOUSxsmeROqXsHyhhz13towBCoggOPCMQOjnSvfXxDBTtmTUbxqRrX8HtbPG03XndrAGIyr9/GgV/m3IXgqcpBjydlcv0iwKoEvqZRHHsqtn7wDysxd42DYCNjGRvSoP3yZTvRRGlSXv6+AWzwS3b4k1g+9yxdXECQGtdqHyHq3Tbe1KL+pCnNEjcUnU0kNbCDxxhrU12nyrzjejuovK80m6/2wiBZgH1BW3oYoZoEq1MYY0K/vi8ZpZoUsSBUX3j5bahkv/Wuib2VECy56amw87ljJcaQwIjECJGl9Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH7PR11MB6054.namprd11.prod.outlook.com (2603:10b6:510:1d2::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.25; Mon, 23 Sep 2024 05:27:21 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 05:27:21 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] lksctp-tools: upgrade 1.0.19 -> 1.0.20
Date: Mon, 23 Sep 2024 13:27:10 +0800
Message-Id: <20240923052710.220521-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0051.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::6) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH7PR11MB6054:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a652503-3c43-4840-1619-08dcdb9065db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?B+slyf/g+/DDKcWoWiabs7NMBbrJGs/5miyVdI+BKWGx5orfVC2oIVxXLzP8?=
 =?us-ascii?Q?ZEASMRcaFtl52HpDNh0AEas8a6mAZuuPm1rd8da1LcSZkPon52bTXAF0yWtM?=
 =?us-ascii?Q?0yDUmjBzk7VyNPcmzI8JOT13ZL70z99m5D2PqecKJowyHSj4CmJpoq/EoJCh?=
 =?us-ascii?Q?R4+QS5Zbn+Gc8udPie5H/rNi9lu2y5S3fo/ZQw3UtbMI5Gz4BMxjkzJIwl9b?=
 =?us-ascii?Q?E8Dv83KgKXQBj82nYmuODVAeQ6Txd/oGtdX74mPv+A6gdRQQ9iuTTDG3cbRm?=
 =?us-ascii?Q?kq19qM/4UO8KK6zEp27URWHIXCckCd9spy0PSlAA8wtE5z+cz6Aw7HIKdN4V?=
 =?us-ascii?Q?cYan/zY7hYFrPbyemxCQmJ/M36QjYfJQSP0D08k2UpJ5RfBZUnUlcnMXJIV/?=
 =?us-ascii?Q?vewqu42AbSMHuDDyBhZNNmzPGdxUnQdBGb8A1N3pvm4vIpttkwzyv63N0LDO?=
 =?us-ascii?Q?08QftIvOkZj2SSaivDTfgqkdzJ/JFK0mJpZcWKnpxt65qOYiXKUQTvobArew?=
 =?us-ascii?Q?yQtJFywnxAdpcMWKlZYwnj+ZeE4jjjgeLIaGPup0JbieUR5xQ79ucq3da9kA?=
 =?us-ascii?Q?zJGKcbXhfxaoji+4ei7aBlxVctZtUFJLOdUZI/HGOJxAFX3hFTEEw5JNqUhX?=
 =?us-ascii?Q?LzWk4jaPeyLa96Peh3+yWYPdU0m90XbDammSpj3aMPBA1FtX5xr+0PY1M+lM?=
 =?us-ascii?Q?ZGSWrwphfZ28alysV9msRPbIx/0MxxX33XWRZIozTwA3gTZsX+tK7PnPz+54?=
 =?us-ascii?Q?qoSuwu01LzMArFnKdYPFj3H57x5RHH3OKnmf5KTy65PWUyrJeTGVW6HqF9sh?=
 =?us-ascii?Q?ySp13I9tqP1UK+o0cApaQEXrKTWIraMAjhjmA9ANKsq7/uYKGvVeHpaF+BLE?=
 =?us-ascii?Q?luXVHIkXEm4+3dKKW9sfG5LzPUgAtxBgGTTTOEbS4ChjUplPPRozHQ34lSZb?=
 =?us-ascii?Q?e7UXRvZl3V0CGPUdvUBkKhFIGX6Mabm6IeMuEAWYEsLuwZ+DG6SjScB+lhxP?=
 =?us-ascii?Q?tmJ5lag/J9i+qMNYYTo/lJZuwrmUstJFjjgcF8vvLGN/Z9FKShddiKwKy7GF?=
 =?us-ascii?Q?2P2tueB0WJcNZKNUphvHHAZtHmrXgxqnN/PzEyOQVz6LQX0/22uUSlxgxBQ2?=
 =?us-ascii?Q?CLIGpIa8WcgGHT7tJDKLFmid/9b+nlwdgyt2MqdmxWP0DJ9f17Rm6U7VhSpH?=
 =?us-ascii?Q?0YE5XdB06zbK5gWsXgV0mijHa742f+uqKP01ePuDGbyKf1e93CKViMZB6tUp?=
 =?us-ascii?Q?3cgm3he/0c37NaA7feOXOiqcp0dgsCao6R6JUvV52L0r0yq1kpx69/3phTYM?=
 =?us-ascii?Q?qZbroc2g6r3K6+RIkKRZXL7wPG39kiWkHLlXuk3pE8eg/8Sqiq0RlaKLTzId?=
 =?us-ascii?Q?5t2UBNW7VjddVjGfEulJQFmTI8uDL6Nd+Yg8OHPE1uFGz07JOw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?knfz+62zSVolJUxX8/iWSbe2un3dwBot3vldZtkvEkhBgAxse8qfXQpUrfyj?=
 =?us-ascii?Q?5hcMrYuvThMCTcV2oKvHpSQc0C6NuqRFdGAF4Z49xM3DIiS01giN4P0aPdXP?=
 =?us-ascii?Q?xdAW/80OTa6e++0w/jRKzUqs0VRjoRe7mkQUwQf7UWd5ijxSNPKNiFWdVTTM?=
 =?us-ascii?Q?NrI05Zi4TevJnJsz3MbTYF2g64rd1U3wP76k3qnwiqVNfSkZ28QmbzGbGch9?=
 =?us-ascii?Q?ZCBeaSqRNHBEZBioXgFIsJ8aHhfhdmbwbwKuDHHuB5CVmwhbyYUteHmuaz4f?=
 =?us-ascii?Q?y8YoTsTmkcoZBxn3dvQFUc+95pZ4jUm1DPq1AffuL5m+p9dfqxfzd3o+uvNe?=
 =?us-ascii?Q?A0JBCW+ET3PBH4lRRfzzPWaPMKUD9Btlt5Cv2B7neFv9JkYJTlTZGLGnMVIU?=
 =?us-ascii?Q?VjV3yTwc/upR7E+c9N93Y0sbcjJS2JPO3InX6Js+y34GrciVFtxwyRcdOgtF?=
 =?us-ascii?Q?lpcjxUDgkW0dBJ1vVr634DO3ZUmMwTl1Gr1GmvJX37SNMPaHUqX3T8ncVi4J?=
 =?us-ascii?Q?3W0O4XKTmwzdNy4EL6X4p3lr6MEFTW+EuppPmuPgLs3Cqf6b5IE2jsk65w+K?=
 =?us-ascii?Q?nFSihNycHmyJu9gnEkmL5mChBOUL38wNiA6sh7qSPfTi74f8WrGcb9Cwa0qg?=
 =?us-ascii?Q?5hbFIZnqoMjKa9snMy7q1ypKUFWe5skSKD0KDCkB2edbTvi4M8RhN88EVA9F?=
 =?us-ascii?Q?MQY35hTtXA3haBXeiu5FKXDOxBrJkviryJaCT2vBMyACCgnct3aTmtuQcLAY?=
 =?us-ascii?Q?EXexjsQDS5KjeWGnBYEEhw7atcgiFEU1pWSDUdRqTW4GV6wKa7W2P36gt3lQ?=
 =?us-ascii?Q?fsJZ/C/wRDyni/e68Ku+QqCDK/EzEzaRBNsoV/+jQOm6QEFm6LbvOANNNGyQ?=
 =?us-ascii?Q?7xUIeEQAhenh31pqRdqRp67u6RBiSK+LLQs1KqbKAA6Ox0nVHeLtU7/oMyHk?=
 =?us-ascii?Q?Fj/LC8e1UbQEXM/9Mis7xfOucd8sWUxnTF8d/nONnYm3CQd6awoZzY8cfib/?=
 =?us-ascii?Q?Ossu9JjUlZ64rdb6pM1xtpljR4325dkTVqBYDp/IibAPg3xxlcIMW3HpGleb?=
 =?us-ascii?Q?C3kP5qBam4bfI14E9+LmwgSp3EJI/kdhOypVj2Qatk1SZfI2vEHP+Dcgx6i4?=
 =?us-ascii?Q?IOk9j4qSmzpFdyGfPtCiM78pHQfAM1f+SG7tQW3/PWYD+KOwwWl+lZrbHAg4?=
 =?us-ascii?Q?4U8kXD5/kq/22RNyP7sOVboS/SYlCYBysEFASMCL25PH8YUwanawUDqPlu+r?=
 =?us-ascii?Q?gvN/2/DNR62cmA6/EM8ZBaPW1tq/MaB7npOmdVFaELIcSTBwHIhZstwxMddB?=
 =?us-ascii?Q?x7DAWb6ossFdspvpn563aSa+5yaXS5Wcce3ZSThqJebCYl47g3jIC4GlKbML?=
 =?us-ascii?Q?QcweT6vr/zfchiLaYupVnGk/cysdLyWUK5lLyPM4bwgJgizmrmDJkb3VPvHW?=
 =?us-ascii?Q?ZEjMTA3e9CepRORzVWMNMX4XQBnJDJs2rxeAu6t2jSM0aUitswa6CaGmuy7Z?=
 =?us-ascii?Q?/p8Zw86qvZ3fGFoiBGl19JSnkGTcmjnWB5LAnH68eL3bjhTl8GR6LUEQfyfX?=
 =?us-ascii?Q?LGC65y2cC4u7slyferYH+sekExKaeLCl5Vv24d5S?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a652503-3c43-4840-1619-08dcdb9065db
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 05:27:21.1853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Q0biQtHz4yQOJ/C7fnKYMeamNu7ZE5TqKHTouXQDS0wNBEp78qpt1I+svquT0eCoU8HsOE37cvB6P6l5AN+CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6054
X-Authority-Analysis: v=2.4 cv=M9ofKDws c=1 sm=1 tr=0 ts=66f0fc3b cx=c_pps a=FmV7mXqD6UovpQmy5PTGeA==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=VII2UiIRoGcRIc-wVGkA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: ebsitVKqAjqAp7qT-gvLyTiIBytnEq9M
X-Proofpoint-GUID: ebsitVKqAjqAp7qT-gvLyTiIBytnEq9M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-23_02,2024-09-19_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015 suspectscore=0
 spamscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2408220000 definitions=main-2409230038
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Sep 2024 05:27:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112453

ChangeLog:
https://github.com/sctp/lksctp-tools/blob/v1.0.20/ChangeLog

Drop redundant variables LK_REL, SOLIBVERSION and SOLIBMAJORVERSION in
recipe.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...sctp-tools_1.0.19.bb => lksctp-tools_1.0.20.bb} | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)
 rename meta-networking/recipes-support/lksctp-tools/{lksctp-tools_1.0.19.bb => lksctp-tools_1.0.20.bb} (79%)

diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.19.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.20.bb
similarity index 79%
rename from meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.19.bb
rename to meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.20.bb
index 0243f2a1d..a5f9c5543 100644
--- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.19.bb
+++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.20.bb
@@ -8,10 +8,7 @@ LIC_FILES_CHKSUM = " \
     file://COPYING;md5=0c56db0143f4f80c369ee3af7425af6e \
 "
 
-SRCREV = "05b50d379ff0037de4957bb2a1befcce88b70225"
-
-PV .= "+git"
-LK_REL = "1.0.19"
+SRCREV = "311fcdeb5cb41612d4be66b16f0f2ad6675a6af8"
 
 SRC_URI = " \
     git://github.com/sctp/lksctp-tools.git;branch=master;protocol=https \
@@ -34,19 +31,14 @@ do_install_ptest () {
     done
 }
 
-SOLIBVERSION="${LK_REL}"
-SOLIBMAJORVERSION="1"
-
 PACKAGES =+ "${PN}-withsctp ${PN}-utils"
 
 FILES:${PN} = " \
-    ${libdir}/libsctp.so.${SOLIBVERSION} \
-    ${libdir}/libsctp.so.${SOLIBMAJORVERSION} \
+    ${libdir}/libsctp.so.* \
 "
 
 FILES:${PN}-withsctp = " \
-    ${libdir}/lksctp-tools/libwithsctp.so.${SOLIBVERSION} \
-    ${libdir}/lksctp-tools/libwithsctp.so.${SOLIBMAJORVERSION} \
+    ${libdir}/lksctp-tools/libwithsctp.so.* \
 "
 
 FILES:${PN}-dev += " \
-- 
2.25.1


