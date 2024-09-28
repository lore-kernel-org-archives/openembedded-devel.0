Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3444CF6495
	for <webhook@archiver.kernel.org>; Sat, 28 Sep 2024 09:40:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.10519.1727516419032299886
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Sep 2024 02:40:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=900161c346=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48S9YPJq002653
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Sep 2024 09:40:18 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2040.outbound.protection.outlook.com [104.47.55.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41x8s889rb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Sep 2024 09:40:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H3L9lSnJxp0u0lwmLfuvKvBvKZqgKcZDmbtsc3t4h/ukhoz0hnLgi0PodNH8llnw3Rqr2W+XHE454hTpRgPK9vE67by88b3EJDfDlmOr3ncYX499l0PXR2Mia4IW3hr8xAXXzmqnFd66mlLaXPxKOLTD584bnySEcVptqjMLEaXej75ePbDD3v40roFvIQL90XhbgsgByt24UOghe2kwGvBZ1DJF4YBNB4j4dcG2i/qWcJkg9A6MV1UTz3WquPQMAvXbnLdYzkEeFpJ9/FYOSAPFYoqUuZyvHOmeQizgiLmuGee9H6D8ydBUCRitRljgQ6faDdagq4a2k1ZIurlbWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zq3uaRj8VSU5MlIOnIW5rO/l79sieptIlZ8ZNhGQxmg=;
 b=pZyoZrr4sy9721JNRI5I3d+bjDv7eaGRiRycSJvHzLiPhN2SsNPy/ExxZ9MleEyNx8/vKYP3xKO/mU5JiN5HoNhBwbiyEvlJu8HH0ZWcba9DIHKzttiW16/ks7TtcrHaplLkKL+zk33cLad5QzPVo0KgDHBOcVAK7ix/+kWx853VT/+bmKqOZw50RvTnA5N04GpSJjIyaMGKwMNV5wMT9haUPc6Dyk1OrLrQho0oupb7KFMscCFuBBUX9YIMcURAoQ9eMskwjHrXF0iehQKEYIxej4z+L+QQvVpG+1Zd0Hz6rqOrUv+IILrKHvUptf7hG3FWYxPCM4+bw7b+Ee064A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ0PR11MB5069.namprd11.prod.outlook.com (2603:10b6:a03:2ad::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.28; Sat, 28 Sep 2024 09:40:14 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.7982.022; Sat, 28 Sep 2024
 09:40:14 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] lksctp-tools: upgrade 1.0.20 -> 1.0.21
Date: Sat, 28 Sep 2024 17:40:04 +0800
Message-Id: <20240928094004.3996088-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0372.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::20) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ0PR11MB5069:EE_
X-MS-Office365-Filtering-Correlation-Id: 060ff94b-290b-4592-fb5b-08dcdfa18dd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xiUth7hDa26DhUt+C2rL7sS9INkcGVfca5l1i+G4EYMf4HW5aPYl97SyzhBq?=
 =?us-ascii?Q?CPsP10io3U8OLy3JyJaIMYKCPDg7s3QbVNB7j6NMFICmBs9IOpKmHqQ/yXsZ?=
 =?us-ascii?Q?qrhx7aK1L3bqkjSv25dKr2LfGG18JACA7My8vJMtYEjkwy/9Q0b4FYEOE7mT?=
 =?us-ascii?Q?STMT4wau09DsGBTvyoM8Dk7k+/HaZ2mmnQldioYQcRRw0VRqPFpBsoYpiGbk?=
 =?us-ascii?Q?1h+GhABS3t8eJA5qFkIa9dN1gycLimdZDNIdX0XRBh53d8cKm/J1NCS/I08v?=
 =?us-ascii?Q?3yrPhTqQF9xu3I+kb4+x2HZCHacAGWy8J4zY5CCBsR7G3Vjp/F6tNaJQdJhE?=
 =?us-ascii?Q?aKq/JCVvFsyZOjgfF30DoazvGDNGXKPdLtBfgMdjSS7AKqqeXxeuM4nCio2o?=
 =?us-ascii?Q?Ozr+bYUu34h+LDLiNDMfkt/Dl11uTBPVEoQoCPKH7oqNhYaI4X6uSq5rUZPr?=
 =?us-ascii?Q?68rkt5xCPxavbTCWmlnB/SjM01QW9AM7BEdy1u7MAH+bnYgES4wf0N0DlHYA?=
 =?us-ascii?Q?Xfntmuqbe5zlLUeXVaYttDH/7VB9XtGs0b7bANDASs2aBkEbttAJICkWXYnd?=
 =?us-ascii?Q?QopetYtgNK8m8uWsqgK/q1jbZLqov8RAEsmJLhKzCwLZ7DQ7nG04Ni1Jw/6j?=
 =?us-ascii?Q?UxL78YUmImx+QaLGHFpDlV87qlxkdegYcDlmwtXStjuZ5WnzgvLU+SwbKDQQ?=
 =?us-ascii?Q?FfwZgokHTne0aQBLX4lbnhqMQjFRFLf0Fvc+/Jl/H2l4pY10p8tAA//4XynV?=
 =?us-ascii?Q?VM6FaGjwtOTt0uszthm4TcTEVcEEOdTMdnh7D/NjsTu3V02id3JEvxC4tb93?=
 =?us-ascii?Q?9KJ030iAJh2ru/CO+cWb9uTnlVsvBdhSBa8cT+GEHzt/e93FkvGQcK/qBVmx?=
 =?us-ascii?Q?vGxNrWPcjX6NdI8T94nhgm3dNUUMd1FouCSX6/npyWjXtLZpNmhkvZtdm39G?=
 =?us-ascii?Q?GuYTb+T3p5SQ0NNF4ZfDgIZ4yjrMxbRxgLSdmzmrBwNj+dFUgGCOe3dBen6q?=
 =?us-ascii?Q?1g0STV9M+XTbiP1ke2CdMZSG73+G74Kfh68n4eFcNuP8A3Op30g/iB8i254f?=
 =?us-ascii?Q?v6/7IOAavoKKZ6bmMFJqnSsOl5QBEwZT3AGN7fGaHHieBysUc/zAZrh+NHM7?=
 =?us-ascii?Q?N4sdBWZynNYTLfjpnGMcm7+c1tls2XySJLxBdCJAVE+gvs7Rt/GEcBrxMefU?=
 =?us-ascii?Q?ARv6EieHBac0OYTLM3qoseDD9LUhJRRpg4H3a4z6eYLQrM/BIUsxikW7Cqnc?=
 =?us-ascii?Q?4I02h2aHYeJQa8ekQWdy2Xjo4qiMZynsuwkxIuqhxZfbE4E1ALD/O8YcswM0?=
 =?us-ascii?Q?GmF8lv4RWVcmSyVlVy1x0O2CFJq+891Tm5Ud7Jpma1Ylug=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FSKYncSsbuiR4lutwz6mrTwnkeCQFYsdbokNtEqAxIHjw+djeZuUI/yCC1Y6?=
 =?us-ascii?Q?wmZsaPb1Tm+cOPpJmdc8OBotnEhkDL0iWs1r0OS3y9v9UZusyeT7AVY9BDsn?=
 =?us-ascii?Q?mn15Ow6gpI2DQmjm45BlKnYDkiPMaNd0ekn6vJhWrB04h2mKirnsK0r4AUPZ?=
 =?us-ascii?Q?7PQ1Xd/T1rKHovbw4pSs+h+/ip4oHDAk+8WuBy0BfGNxE13q+hpv2cpdDxRL?=
 =?us-ascii?Q?NSD4G4wpbc8M8S8DCZnIoA/HO3lWQc+/gmIfIbUHYF5cGcwJffp7cfnUrh58?=
 =?us-ascii?Q?XacyPs1zjtrGqTQKdfVowqH/MgTshYhUtL/NzAJs6W+rA/jPalAmDL2TpqDo?=
 =?us-ascii?Q?fqAXayrknoq3ziVb7nV7oW0FZkbaVpKR9WhjoYsvA86n9SDL+2qO4E9WHlrx?=
 =?us-ascii?Q?2UoqQM7+w5mQ0Nzan31uWHW2OCMTM9hsgQ9ysO8qRF7muw4H/5iOAOgd9pDX?=
 =?us-ascii?Q?G/mNQ3klOTe2UNuSVP3iDK9PBOLPaOIUNIF7Q26ZAf8dx8Z8/SVyLvbX5PiM?=
 =?us-ascii?Q?kag3g9mu1m5Wwh6u3H65qc+2AXAmlK7wZHBSVfwQT7kUE/G34iGOvRz4KNek?=
 =?us-ascii?Q?8Gh7XFGmaGyycYBU4R2AsPrWJjv6Nvh7AjS15CrBO1jUORCzqrFtmTbP8z+O?=
 =?us-ascii?Q?xBUosWf1j+wSvhH5H2lrvhQujF4R5PDapC1TzabIOBwYOSmBEBH/L3TqAo3q?=
 =?us-ascii?Q?d7pf8jz9inhJJbTDLyfvlvXXo6HhMICoXaLzs+/tCaWLupFh9gBx9/rYxIx0?=
 =?us-ascii?Q?kSDEMzoOGnFBUaH97E6PBUwcFt9Yx8KJuzur2vTYPQoFkjSpoe0PFb08HHmg?=
 =?us-ascii?Q?GeAWEV0vxZDr4no8k6pv7qZJRwWGYOD0J0d9J5N3MA5qVmE3SiMGvTxwoA/E?=
 =?us-ascii?Q?xJ3pVMNbCbUEzxiqOWmc/+6uu77X43aaNqcBK/s21Znup9s+9tCa6tvoydiD?=
 =?us-ascii?Q?uU5j+qA59XtM60CDy+Yivm0lPh1i4CY52xwvCgVot/bz3LFHjjHVgVa1FezU?=
 =?us-ascii?Q?lCxRN4j+sB+hkfz14xLydg/FOujoUBl2hNuf7yl1MN+4xeegILtYC2Gd2UMK?=
 =?us-ascii?Q?Rrht+IOdArHNWwUTpJmIcMqPsoWcIgZH5foG7MQpQ/2Y/uVGxbq1tHJvIDsJ?=
 =?us-ascii?Q?mwSVwhSWuXzswhG7iNnKDIqd4aMg6nWperGIdP9yQxAtSrwJmwLcPnxuaLu3?=
 =?us-ascii?Q?fCWfOVKOO3YRnERTwERr67C3uh35jRu4mikaAYoQJp7/xYg+uu8D/zxzaStn?=
 =?us-ascii?Q?h4EAtK/oE8vWF2ATj7LpaB1OxgmRDpUw84/02PJy+1yPYGWi4HMrCPhe8OMH?=
 =?us-ascii?Q?Q/dECbCj6Myd3YCgxu4U0r3mNRkwq4rkJGUN9PtVn4MwbHU5t7xHPRVPitJk?=
 =?us-ascii?Q?SS4wET6Xa9u7VjWbYJrXZuoHSQZ5dgrjFe+2TGUaLGuKFG77bd8DDLlZ4A/1?=
 =?us-ascii?Q?WfoeTMk4dVD+H38DPj6s80pLIKXD16K8OxO2iPPhCk2Pj1ZU/uAMxJH7+TgY?=
 =?us-ascii?Q?lo5cqWplEWGsuDodmkSnTiAQJ1Wg3IE2zKgBU9W3nga18Els0eSBeZVnCWR+?=
 =?us-ascii?Q?gPHctqIMPU0KbfFROz95qVm971uQvTRF8d+iOpxq?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 060ff94b-290b-4592-fb5b-08dcdfa18dd0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2024 09:40:14.4292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rxz+aONCVuXgrpR/rwm6LM/G192RPaq0ceFgfdM4a71u/ETQE/rm422eSHWBbTNAoleoeD2rAaOHfrkd3EcGLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5069
X-Authority-Analysis: v=2.4 cv=VaulP0p9 c=1 sm=1 tr=0 ts=66f7cf02 cx=c_pps a=OemXRkCljtmPz/OzEC+nkg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=05k9mtwWuvkotHxMy5gA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: XlVKeWqXutk1JT_-pERIteZhvPSOr3Xe
X-Proofpoint-ORIG-GUID: XlVKeWqXutk1JT_-pERIteZhvPSOr3Xe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-28_04,2024-09-27_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409280071
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Sep 2024 09:40:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112540

ChangeLog:
https://github.com/sctp/lksctp-tools/blob/v1.0.21/ChangeLog

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../{lksctp-tools_1.0.20.bb => lksctp-tools_1.0.21.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/lksctp-tools/{lksctp-tools_1.0.20.bb => lksctp-tools_1.0.21.bb} (96%)

diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.20.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.21.bb
similarity index 96%
rename from meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.20.bb
rename to meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.21.bb
index a5f9c5543..1300fc658 100644
--- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.20.bb
+++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.21.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = " \
     file://COPYING;md5=0c56db0143f4f80c369ee3af7425af6e \
 "
 
-SRCREV = "311fcdeb5cb41612d4be66b16f0f2ad6675a6af8"
+SRCREV = "37d5f1225573b91d706a5e547d081f79963a9deb"
 
 SRC_URI = " \
     git://github.com/sctp/lksctp-tools.git;branch=master;protocol=https \
-- 
2.25.1


