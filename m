Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0570CF6495
	for <webhook@archiver.kernel.org>; Sun, 29 Sep 2024 12:15:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.31247.1727612144528128739
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Sep 2024 05:15:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0002136fa6=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48TC022P007377
	for <openembedded-devel@lists.openembedded.org>; Sun, 29 Sep 2024 12:15:43 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41x710h9da-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 29 Sep 2024 12:15:43 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cghoRSGr8B8Z8n0Yn6NpsSJtr7P9DDJfSXVck/FO8TfdTmWZfV3b27Cw2a3XzTeEOCks8RtEETDKX+GFckdxWkUOWtB1dGHw8C+kZ54kNzeAnBOJYc+zeaHoOqan5hGGJ/V2c0h0mm+RDwkr/uWfqy3VXCuZ3CQoFe22suyOnEOBi41j2wBkxor1sERACwxIHsLh48gS/PM6yMQKCQwLV3gpQfYk38+lp7Gqtfqab+q1qv9QTa2jt232nGM4cUscoANIcf8zvigNexDXRr55bsESx5yFmnwYgCIyGOqNOdCoNA08MIlBAH4AZSu8Nnwk4LSaFgGHyRV/Cx6SJ8isiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0jGS/y6n1R3PWherrEtjsgQm46H7eRIPRhjGGK6Yjsg=;
 b=wC3lkI7QXwszsIvwmjIsQe21MYEfaIzxfPP20FK76/pwajsVBTcIsNU/ktQ0mTishumQOLnwU28DsazX1Db8+qhcPEFTiBhl6hJgZYJ963o4549kGU9CV8OOEJQYPqDQGdZNtT7Nd6C9U7RHi3MoOAT3+QWyYBVcEyLyODYC5d8ssChcbmFN+ljCMg7xgL/Xu3duWPDURiA6CiFKIMa2W2jI6jJR4wVv4F1hPcQoGMAssocJ7XP3fcnnMLq6PStiW+X1MqwrNW7+1M9JmxxWDSWzD2vovsr7zGSCkFzxM4iUI+Qah+QO4BYV2Fybc/h8zcdAMJx8zyc8PI66BsMQ7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 MW5PR11MB5859.namprd11.prod.outlook.com (2603:10b6:303:19e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8005.24; Sun, 29 Sep 2024 12:15:41 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8005.024; Sun, 29 Sep 2024
 12:15:41 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] tk: upgrade 8.6.10 -> 8.6.15
Date: Sun, 29 Sep 2024 20:15:23 +0800
Message-Id: <20240929121524.3196792-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0024.jpnprd01.prod.outlook.com (2603:1096:404::36)
 To DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|MW5PR11MB5859:EE_
X-MS-Office365-Filtering-Correlation-Id: abf32cce-755c-4163-28b7-08dce0806f69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?PaTW5t4/Y1Mqc6LYHIS/C1VZ9SjxOx4dqNO/EY5tOHo1X71N93VkZcNGEIMY?=
 =?us-ascii?Q?/h95BGlWzAHlb53DZYk2Ur7eyUw/Nr7DVk+E8ryE3WVfrMbm92F2CwzNv9yU?=
 =?us-ascii?Q?cvNMzRjmF8mXK5LYVOC5jP0pSu1QpZk/Af/MQHGF5qzW7DDWVGQWpTfUs148?=
 =?us-ascii?Q?Rg4irld5excFZE5698Q0RpQVe5cRNLT1TjVChzON0BWhluMRe+nR7W8VJFBg?=
 =?us-ascii?Q?7n5jTXIJbyL4yxJ/QAkwyh2x5ByposvPEkcVBFFBPYL3BkZU04YhcV1zVRhL?=
 =?us-ascii?Q?FNSmXHKvAz+x1v2JHubgK6lnERWajwbuc1/DsY3hbKPnGJbMhL3SaKIReblJ?=
 =?us-ascii?Q?k9o/uvJL+a3AdcYUDPlxfJvl/B8LmifBYDLRx3kgNInQp+ykZVbMH6MsPkNJ?=
 =?us-ascii?Q?uq8IYlSjibNxKSksQZUajUIVofoFh8M7hMJYlA6VVXhjCIUPziwny6NdQe41?=
 =?us-ascii?Q?Yy6GWmFY5WZwHSimVm+b8dSEx4y+JJtlI1NgS1DRusIEtFXVeaKR1prWJtLX?=
 =?us-ascii?Q?uwJ6PBPp/MfJ85JoJRmFj1R0MRUbNdoMtTu61IQ+hczwHcoULxAyNCMW/OzK?=
 =?us-ascii?Q?i6F2B0T+IJPrlO4RbxiimbF5QOPBFTm4NpMnfM/DOxjnNXJN/t3UbmjpUC51?=
 =?us-ascii?Q?bZtDNWVeyrzLHuWTkXYzTB2/y/ruQ4v8fa/D4fIJd33/M3AaQvyNv0dkzbQv?=
 =?us-ascii?Q?82EG3vE+MD3IfwH8+3hoziRAcysblV5yZWX5pgdOtJHWUG6l7ROBgbdtm5Ag?=
 =?us-ascii?Q?ldwA5VwK3Dw6w73w0tJkjDh2kPQIDKkR+oSUDyGd7bjjilx680EAnlbCfL8U?=
 =?us-ascii?Q?3RVKeCFI8WsNEorYnR0N4OqhOAIoSlc6yuEnFmYkb5TP2RN3SrcnH0dxpKpK?=
 =?us-ascii?Q?AI2JguEn4+dZv1eD612og7P/YFielcDYlCKwMhahX/HYfWW6AXND1bsBmHhG?=
 =?us-ascii?Q?iFzWVDh8Msduv3w9cJyqr3Uxgmee14nQh9MV4bqIO0nfLkwqAB3+EpixivE3?=
 =?us-ascii?Q?ANfb27B9QtHVCa1LB3kYkqr6DX5EW/8BKt1SfGt6mD/0kPNXuFPGhW/k2wJ3?=
 =?us-ascii?Q?5WSZqEJorTzMp9pDOfKII+wrem0Az3G/y72EANE6Q1S6sqgcfjSxOe0gk+wh?=
 =?us-ascii?Q?EKXjS7YV9RXCM8wKsJ8oSfs2L9yrsV6oXRKUeRA9NGXMU0E9A/LOO3hU3aFe?=
 =?us-ascii?Q?PNv1RKRM7qPurPsJbhChZALt986j6Qt9Bssl8cgoY/YB0WseioCQyxFF4vkQ?=
 =?us-ascii?Q?ZWl7pZaiy1rtvqpWS/uMHh7zp2ojhp2ZVvPAQYDJAR0jDveU8Pn4gypp+G5V?=
 =?us-ascii?Q?wYc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?b1PyvpUxpCSoKnnloetEAzdU5ojzuPrseNIS9XpmK22oZr4HwNi7gtuCi9UH?=
 =?us-ascii?Q?4M7zGyzWvLDA/TpOPTDBUL6JxLayZKk6lMn1eVS75878qa88zY49Clv48vk0?=
 =?us-ascii?Q?aYgzNMmXYMa3DuMfF5Sa1/Tjn/+Q1XfMdRvpbNGlefr77wLjNF3VhMJ6L89R?=
 =?us-ascii?Q?oc7YO55znYP/rKu4jcmBERnlINFrMP4DDtUexn0QYZ7bxeUWIWEDS2DJ0vkn?=
 =?us-ascii?Q?ddSJi8N7xboPzjahHJ2wwIo5syBhEE3jD5RMrWBFsJ0yJ/QvJSZxBrAw+F1d?=
 =?us-ascii?Q?7kd/e5SECwPEIdSqsKIls5+Aa4byf9og4Q6gphYGjX4NNIHga7WNDyW1iU8E?=
 =?us-ascii?Q?LC4637aVmsTInBhlsOdUEOpNSP7DWIMiJXv5+fNSfTOPAbmDeihypIhmHBrC?=
 =?us-ascii?Q?ItflPxC01t1cBhwrj57AHWNIFUC1ywaBgAtx7SrncctjO1UHqM/iANQ4a1KZ?=
 =?us-ascii?Q?c2AC1gx7B2eA4wXiKMaSunmJqm5afcd+QhiDQSq7RPzw+TmBrVIPrLmafPoZ?=
 =?us-ascii?Q?rAA0RlIgewVINNWivqwTovDUd8axB0S8l7g60Pa68zyPUQ5a3NVw+bAc6H3D?=
 =?us-ascii?Q?bLsPJ7U+YDwkMpwjLmaDD2xPHESssRcUtDW2ynmU3N9Zk3G9TUxppSWFVvku?=
 =?us-ascii?Q?BUI3P8x/L/tadV8j1i+NSy5r+pumuDubN/4A13gct4Dv8a714Vv8oLLlkJ6k?=
 =?us-ascii?Q?epKzZYdJpiz2h6pSiMovNlXQPvsNdeKOH4XF2cSHXXFnCScgxldVCE42xTud?=
 =?us-ascii?Q?pWoz3rHtDa7kSw8f9l9/fFa4dsC1SFguj4zsCiEr4BQt8IdWrkmVGLN62p0L?=
 =?us-ascii?Q?riof4LcZNnnAl9Owv71o9o2/gSsZz1Lj9e/tA/F+pErlcAuEmSNF5P1wG2WW?=
 =?us-ascii?Q?QAB5EqLRkdv7IsTgtQ0cYdDyrg7R8xx6VkTuCm9rcRWEVwiJj0/zPeBLVi+7?=
 =?us-ascii?Q?VA0zXNsjbyHoJTGvDrhf5Fuux3IP3TD5cGpYfQdSbtQcLHKGMvYEU7Rc+Bc0?=
 =?us-ascii?Q?gIwQy0hdrDxKM8kd0ccsqADAIMe6xXOLLxWisaqHfGJDwBQgJWtoelLqSZ/G?=
 =?us-ascii?Q?xHcUljhvsiceCTa7oUn6bC7Gkc1ulVI55PIfiX82jMEfbCVAFc1tuF+GvNW6?=
 =?us-ascii?Q?SKNNXe10JJCUCuI7TdYX/mzhP//b43RK5UQqbtLv8Md2W8JlHCCWKr5QoKLP?=
 =?us-ascii?Q?ZcuFl3GlTgJNqStplFL14OJ2UuC6XYzN2AE+bppnLr4eMy10HBKTQJ0+e4zE?=
 =?us-ascii?Q?zNEEDPuDPKLefyNZYZIDN9kypxRfhBSUxMzmiMRs1KQpYO03S/rXxrv7lSLt?=
 =?us-ascii?Q?YWEKcrO51Jpnqy6f6xmEqYthfmEhVN6ttpZxHQ75oa225X3btFv2S8CYB6vT?=
 =?us-ascii?Q?W09PqbkpOmEVFxos8fYo/++mxmt8SI2EOUe9WJ8Ipwkt5msfIa70YyTf+qtj?=
 =?us-ascii?Q?9oWzDPUAm0JJe8Epj+wTkm5jtQguJu5mhg/ibMIP5VwcpNkhlDpqPQAD2za/?=
 =?us-ascii?Q?qqaOLHRpOvCTu184ktNqwKhlCjyHED9kelftoTwb2IsfoD1qSxarX1Qa2yPp?=
 =?us-ascii?Q?rs+S6KYiGb/V25qVCWJCRi+x7T8/CtpTG4HytXJC?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abf32cce-755c-4163-28b7-08dce0806f69
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2024 12:15:41.0945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZLaSQW9528OkuLWXk2+5usoKJrGuZmPmW28nHLDVRzljHsIz7GGwQ1V99M/XdSGePNQGgFmIO/B5ikLuDCkgYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5859
X-Proofpoint-GUID: QUMleA4OXPIEDml40OOJKUeWRKUj_DGa
X-Proofpoint-ORIG-GUID: QUMleA4OXPIEDml40OOJKUeWRKUj_DGa
X-Authority-Analysis: v=2.4 cv=efNvfKEH c=1 sm=1 tr=0 ts=66f944ef cx=c_pps a=gHjWyi4SN+6fNgZLRl0D7Q==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=FP58Ms26AAAA:8 a=t7CeM3EgAAAA:8 a=JFEIO55fyuBNnSmWTboA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-29_09,2024-09-27_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=999 adultscore=0 clxscore=1015 mlxscore=0 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2408220000 definitions=main-2409290094
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 Sep 2024 12:15:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112551

Release Notes:
https://sourceforge.net/p/tcl/mailman/message/58817026/

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-devtools/tcltk/tk/confsearch.diff             | 3 +--
 meta-oe/recipes-devtools/tcltk/tk/tkprivate.diff              | 4 ++--
 meta-oe/recipes-devtools/tcltk/{tk_8.6.10.bb => tk_8.6.15.bb} | 4 ++--
 3 files changed, 5 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-devtools/tcltk/{tk_8.6.10.bb => tk_8.6.15.bb} (95%)

diff --git a/meta-oe/recipes-devtools/tcltk/tk/confsearch.diff b/meta-oe/recipes-devtools/tcltk/tk/confsearch.diff
index e13bf69b2..81d473575 100644
--- a/meta-oe/recipes-devtools/tcltk/tk/confsearch.diff
+++ b/meta-oe/recipes-devtools/tcltk/tk/confsearch.diff
@@ -7,9 +7,8 @@ Patch by Sergei Golovan allows to find tclConfig.sh in /usr/share/tcltk/tcl8.5
 and tkConfig.sh in /usr/share/tcltk/tk8.5 where they are located in Debian
 installation.
 
----
 Upstream-Status: Pending
-
+---
  unix/configure | 1 +
  unix/tcl.m4    | 2 ++
  2 files changed, 3 insertions(+)
diff --git a/meta-oe/recipes-devtools/tcltk/tk/tkprivate.diff b/meta-oe/recipes-devtools/tcltk/tk/tkprivate.diff
index 62467af1d..8cdcf2020 100644
--- a/meta-oe/recipes-devtools/tcltk/tk/tkprivate.diff
+++ b/meta-oe/recipes-devtools/tcltk/tk/tkprivate.diff
@@ -1,9 +1,9 @@
-Upstream-Status: Pending
-
 Patch by Chris Waters sets path which are normally point to a directory
 with Tk sources to a subdirectory of /usr/include/tcl8.4 (debian/rules
 puts private Tk headers there).
 
+Upstream-Status: Pending
+
 --- tk8.5-8.5.8.orig/unix/tkConfig.sh.in
 +++ tk8.5-8.5.8/unix/tkConfig.sh.in
 @@ -55,7 +55,7 @@
diff --git a/meta-oe/recipes-devtools/tcltk/tk_8.6.10.bb b/meta-oe/recipes-devtools/tcltk/tk_8.6.15.bb
similarity index 95%
rename from meta-oe/recipes-devtools/tcltk/tk_8.6.10.bb
rename to meta-oe/recipes-devtools/tcltk/tk_8.6.15.bb
index 7159e74c2..8d055c9d1 100644
--- a/meta-oe/recipes-devtools/tcltk/tk_8.6.10.bb
+++ b/meta-oe/recipes-devtools/tcltk/tk_8.6.15.bb
@@ -23,8 +23,8 @@ SRC_URI = "\
     file://tkprivate.diff;striplevel=2 \
     file://fix-xft.diff \
 "
-SRC_URI[md5sum] = "602a47ad9ecac7bf655ada729d140a94"
-SRC_URI[sha256sum] = "63df418a859d0a463347f95ded5cd88a3dd3aaa1ceecaeee362194bc30f3e386"
+
+SRC_URI[sha256sum] = "550969f35379f952b3020f3ab7b9dd5bfd11c1ef7c9b7c6a75f5c49aca793fec"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/tcl/files/Tcl/"
 UPSTREAM_CHECK_REGEX = "Tcl/(?P<pver>\d+(\.\d+)+)/"
-- 
2.25.1


