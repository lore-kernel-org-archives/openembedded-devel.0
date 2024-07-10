Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE98AC38150
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 06:53:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8179.1720594414461101612
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jul 2024 23:53:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=792143356b=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46A5iFEV007274
	for <openembedded-devel@lists.openembedded.org>; Tue, 9 Jul 2024 23:53:34 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 407170kbmg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jul 2024 23:53:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nv+CpXzh6gttmjRKh0X1B/dpRavbOck9gbrZlrr3jTXDq10mqL5sKx9n97Wze0xgHvIrlM9FlRa9kAKAZPnfn4fMVb66UmW0BEfD9Mopn1tgwFftRrjyVkDYmSuneYogauK8vcK9+YF5B2NpDgDsXMHhKMjPnDsSq0sLNZ3JLa5gkngbzzB/cuYQshdWuIrzVGbmQv9kZRIVfcp9kNegFNhaTZuiwbMF6bZXeYD6frc2IRVYrRDmJqfucOBhvzpAq/Kj+uiGCfwOBUZ1WHwkfB6B+twWT3Zc3hyX+dOHBiEHS6aW7f21KMZe8CiJCIMhcGNW1X5OcX+lRZsmg4lfGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMNCAy8cvk4laZmzFCkdP46uCdHj39/LVbQBvBTh5Oc=;
 b=hDIw4v5T8ysKpK0qsbroROPhjlGeRPdwqyKMHxVsItUmWt/mcb1kMlqSo/B9+8fDbie+aYOFE4eocMNw+lcevGuoqvcwweMms3Wmk6FJOnPB7VcLhN1OzNVVrff89lYEkjYKBQ1N05cIJLwEQwhsLzD8ChQW5STm8lYw531KSAxBafrrHLI8nmbZZrfETpaYsOVppy3oruaHfNavfT4NYQ8APWzV/wRV97RjqpUHGVq7Ug7lhFp2ALv5akVdFLU9xu1hLLyPeL+nUYEdRWnTLMsT7zadXE95IclHnyPLBSEGBm1bhcy98XRF8Az53JqIl1WrUA40vWbLd+yL73XaHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by SA3PR11MB7433.namprd11.prod.outlook.com (2603:10b6:806:31e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.34; Wed, 10 Jul
 2024 06:53:31 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%6]) with mapi id 15.20.7741.033; Wed, 10 Jul 2024
 06:53:31 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][kirkstone][PATCH] xfce4-panel-profiles:fix tar error
Date: Wed, 10 Jul 2024 14:53:13 +0800
Message-Id: <20240710065313.3176904-1-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.35.5
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::15) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|SA3PR11MB7433:EE_
X-MS-Office365-Filtering-Correlation-Id: 72ad1568-7e55-410f-741c-08dca0ad02bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rNFITWqHn/XjRiTyDV1VtIG3IFoBTNbwbdeWTlR4689jjhgR7HohOzU2nQE0?=
 =?us-ascii?Q?3esF+JoWV57o9TI1Omg+fLpW0uaLNqwAyCZGDLPYrbwruUyhRF6RvOYqPbNb?=
 =?us-ascii?Q?iHtlDC63174mD00d0YEocoCxJSSZ4DJ35Ym3gMUnKSU6+GSGyHyyX+w2Iest?=
 =?us-ascii?Q?4zFZI8GfLRHzPaeeFYeLkwqkRH/DIgVXpZ6Y0jKVQCpU74YgCYBLi1rih1Bx?=
 =?us-ascii?Q?OST4JCfRO8/Hs9dUt8yR2P+xPAIx1Aow5WgWT+X6y/Iath7cLeOEU6QzJ1+w?=
 =?us-ascii?Q?+lDpUjURH1QsPapQSi3wjjrM3qjMPiiBWIal2ZbPBCuJhtTPapfB8SpCCkZA?=
 =?us-ascii?Q?Q0SBn1soyFM/IFggr5hmyniMIBA8EvcRGpVw1dByQWc4GdETzraY6dTdQuGa?=
 =?us-ascii?Q?iGPnDv0ep7LvNTRZHzVRl360dFnQZjMvU0cmmoKYzZFmxPAXWuMIR+EL/VRd?=
 =?us-ascii?Q?QzyaxgSr5iyX253Ix4cLu0TafLr2RXA6ReRnE12L1ObwN5LpjzOOO1q9Uu8/?=
 =?us-ascii?Q?/pNUFhaOBYlNzmjG8O0e8X/yBCBhmVFL9wahZn2A4HlsT1j/eKSZuL78ZBcx?=
 =?us-ascii?Q?oG76Khq1ZcV/jBi6HPSSCBfmXBIHBjtZrFr3f2uXfgFTPWIQEX4ba9db//NJ?=
 =?us-ascii?Q?Ub3OZ0C63PbOnu7A8jluk3g+JAbf39Y8wBHBZe1TrY29sODDzcSFyRMeSxp6?=
 =?us-ascii?Q?7ZcLPKKyRyrcmlu0/qM5lYG/pc1VeBwcb+Po5Xhhq6sqsXQ5kLBNHrcJvKkj?=
 =?us-ascii?Q?2GQksuRAF/iuzJt0y3sC//PH3e09soQkLt/lWGmfyFG4NYz4y5iYeRWKvWjc?=
 =?us-ascii?Q?8W0t78lT+ydsYVIHMdlahhTU4ZHIBIkjkaH/h4OjBYX1ELcv5MIAfTXpvapY?=
 =?us-ascii?Q?gVsM2KhtHkxev5PSvRpOTNK8Ezm5UywkixhZ/k2KIaqBCqRzTPBaFwu3oqRp?=
 =?us-ascii?Q?OjeqF55oHGGxRfbwfz6XKIEui9GuB1UeprNVq6zNWCP3Eo+r4d9u3mQ2mAwT?=
 =?us-ascii?Q?2S+wR+DQR9rqZMBrt7VvmWNmJK1i5GREsoa/Y5QBYYUkiorXsysHeKoUaUDg?=
 =?us-ascii?Q?r8lxWyQQpCYWnxHPOUIT741XDlRQFK3bx8x6VKAuiHwC63GGWbwL1UgRcrKZ?=
 =?us-ascii?Q?8Xjzef/CO+FqcHnuomQL6eaUXnnr22aiw97/+vpBluzlAxbcBCso+94LQzZG?=
 =?us-ascii?Q?znTIBaT0SgEk2LbruBImqKZ5iUPI7W9D1yu2H4gnTm9jQKw7mAD5dADDg3zg?=
 =?us-ascii?Q?RkpoeOz6BqOOjRU+I2vUvTtQa0SNfmW3WVWCbhTkOZQ8UNjGhiLX8uDGAT0k?=
 =?us-ascii?Q?jkCz238trzQis6xyycYZy5WeHszFcl92/WEr+5yQr8A8XU1wIldwCtU946LC?=
 =?us-ascii?Q?ps69GkU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?H2HdSSE6HNdZ79iaZ74w4ly3ZBZyWS64kCbcP15A15M4aUkCJq06qoNCoRdu?=
 =?us-ascii?Q?xQTRjzIGLgzqJqtF8QX6LWK9Tj6DqtIgUOONzEd3icmmFWclhLbgYpvYza3w?=
 =?us-ascii?Q?uwLIA7syiLoNxXM23XQkTk9e1RtnL6remDtnfzuClENDLoV1nJ/N9HlJdhLH?=
 =?us-ascii?Q?B9qRMe43JCCNCDiWAT32f9hT+0fnLVszGnPDpPPonyH1lFRhCOltsWEfWgY6?=
 =?us-ascii?Q?a2hPoEIPIOGIgR9hOc9mhrqCeYaIytMJdUfOs0hxGmLRZ4+J6RDsGLEXC3Mi?=
 =?us-ascii?Q?wyG7GCDx7vAwQ5nogrP7aTaq5KzizBcnXvM69wRGiwTp88dSiBQpzZ+RvGax?=
 =?us-ascii?Q?9eymV+K2uQF5peEihRgaRjYnwb91NhnO/Ph3spnYeOMLC+wQZ+elCaroHdoX?=
 =?us-ascii?Q?O8CrBJF7EhHoCQ2icfg/xU/cghALMGiBlM2vW3+aUY+EZOYmxSb4FxUWk+kT?=
 =?us-ascii?Q?mQPTgqq+Wg6bM6z8ZYsJZFZ5XMjzoFqJ/CVvrCSnbInkLliJSk4cPk6d2VH3?=
 =?us-ascii?Q?Ys+KABEkFh94hS42XnL8gh1wfs5ckTQU9tqjt269T3shsjqmenSCVN/iRizy?=
 =?us-ascii?Q?TU3AXz//lnO/wVE2dhXgOpCZ3nNnN6+foF8nUZGqNeR2bF2URhKmHQk3//4T?=
 =?us-ascii?Q?Yslz+Blwj3QJFaICTG5efkiBU1jwCnyOAOfSfEWSnFrMdbLEcvQDQ68vyo8P?=
 =?us-ascii?Q?RWZ/IPbzusITzU9ka7bsah9EzySeT74wjUT0dS3zC9nV/H2Dlayd96McFuMx?=
 =?us-ascii?Q?CG+ckib8O1f6Y1fDulVndaKbuM2bXhv/u+qi8WZakxe7psRNeE3fom1OqGdJ?=
 =?us-ascii?Q?j6Rf3QS2tE7blbeS39fUX8y8RgfzSM5g9fCSDpDWKvJehOjazOlRYzM3yZSd?=
 =?us-ascii?Q?oHMNNx4eHho4mKD5RRVJH+3GmTiRrbKtC3W873omcSrwsUux9N+CvQ1Si1dU?=
 =?us-ascii?Q?9q2sb3bRhg4RSbRjoEahPkGGIObi+e0GFzJuXo7ZDIeRSWbHV4rqjREp7z8U?=
 =?us-ascii?Q?6Q6h+EqivrpaEZD2YJr/UsvFaIzbMzfCttluUmEvp9gRmJItl8reMTn3GwlJ?=
 =?us-ascii?Q?/nxRqglMmP6HDm+zkO5w9gZBMUR6FgMC/86fenj3SOA4KYO+yzKEbSbjCr4q?=
 =?us-ascii?Q?YwGXBGO8qq4fR96rH1frUVfonjnG1NL2SvQ1tFmtNNzOCNNlKyXXatrmmlNa?=
 =?us-ascii?Q?7b4NbK9N6fIVISBoGNJPgkyUDajbIfy+Xn0Ll8n4jOzAXpIeVC2xBrC/4Zrj?=
 =?us-ascii?Q?/quzSW5gXikoiwAkIjmGG8cg+AanmUdQ6V+CtAOsJY444KjiKSCK7Q7eJ9PC?=
 =?us-ascii?Q?TvpvApnQ8CQgnHDUtTbBLCcFzDteNxQPwdd5xbJh6ec4FfKchrQ7mJZ4DYCZ?=
 =?us-ascii?Q?pZLv+ZNU2NQLuYlnnuBgncT+BW+9dyBxDO5YgkQeGiUsj9wX6YNRbNhXEdnR?=
 =?us-ascii?Q?TrpFpYfUQ3IikzVJ69xEC5loR/A7y6C+lW86Gpt4W8KYNyxckPqBT5iFXr2u?=
 =?us-ascii?Q?DxdUrFvKRqXP2LYfmx6suYseGUyEMJuOMlJEQShChxgm7Z3k6ZwqLisbUxU1?=
 =?us-ascii?Q?nVc/2rnCzYS2sFD7niCX+Ntb4qnJOkY1IEyS9ZG57ATgbtiNyK/Gbu3a+vJj?=
 =?us-ascii?Q?SA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72ad1568-7e55-410f-741c-08dca0ad02bb
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 06:53:31.6455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qen2udqDXxOXFZvINKbr675TGwdFRCWWmgJfpkmm7DCpDpZc1RCEDs0yqcIWf8YFyuCjejDczStAPFFxsIaK7VXeDIUSFxsfbh8nqtuPkMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7433
X-Proofpoint-GUID: fG2NtB50m26OzNS1bLadRpo8mw5vHmW9
X-Proofpoint-ORIG-GUID: fG2NtB50m26OzNS1bLadRpo8mw5vHmW9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-10_03,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407100050
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Jul 2024 06:53:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111289

From: Kai Kang <kai.kang@windriver.com>

Backport patch to fix tar errors:

  tar: value 1762430260 out of uid_t range 0..2097151

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 ...Makefile.in.in-Pass-arguments-to-tar.patch | 30 +++++++++++++++++++
 .../xfce4-panel-profiles_1.0.13.bb            |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles/0001-Makefile.in.in-Pass-arguments-to-tar.patch

diff --git a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles/0001-Makefile.in.in-Pass-arguments-to-tar.patch b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles/0001-Makefile.in.in-Pass-arguments-to-tar.patch
new file mode 100644
index 000000000..6e1718737
--- /dev/null
+++ b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles/0001-Makefile.in.in-Pass-arguments-to-tar.patch
@@ -0,0 +1,30 @@
+Upstream-Status: Backport [https://gitlab.xfce.org/apps/xfce4-panel-profiles/-/commit/1b853cf]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From 1b853cf45b63c67ef52fc1288afb19b18542bb21 Mon Sep 17 00:00:00 2001
+From: Akbarkhon Variskhanov <akbarkhon.variskhanov@gmail.com>
+Date: Thu, 3 Nov 2022 10:29:52 +0500
+Subject: [PATCH] Makefile.in.in: Pass arguments to tar to make build
+ reproducible regardless of user or umask
+
+---
+ Makefile.in.in | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/Makefile.in.in b/Makefile.in.in
+index 84b12cb..cdb05c6 100644
+--- a/Makefile.in.in
++++ b/Makefile.in.in
+@@ -31,6 +31,8 @@ pot:
+ 
+ ifeq ($(shell tar --help|grep -o sort=),sort=)
+   TAROPTS := --sort=name --format ustar
++  TAROPTS += --owner=0 --group=0 --numeric-owner
++  TAROPTS += --mode=u=wrX,og=
+ endif
+ layouts:
+ 	cd data/layouts/cupertino; tar $(TAROPTS) -cvjf "../Cupertino.tar.bz2" *
+-- 
+GitLab
+
diff --git a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.13.bb b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.13.bb
index ab1b82726..f4681f460 100644
--- a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.13.bb
+++ b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.13.bb
@@ -11,6 +11,7 @@ DEPENDS += "intltool-native"
 
 SRC_URI = "http://archive.xfce.org/src/apps/${BPN}/1.0/${BP}.tar.bz2 \
            file://not-create-link-to-locale.patch \
+           file://0001-Makefile.in.in-Pass-arguments-to-tar.patch \
            "
 SRC_URI[sha256sum] = "bc387c13f94109422dc72b0fcb919b0dc11619ba589d03e492252b0d2513b170"
 
-- 
2.35.5


