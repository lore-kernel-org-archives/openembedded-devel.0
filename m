Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2EB5CD3436
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 09:23:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9862.1778232224412241396
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 May 2026 02:23:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JSYTCgyO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=958850bb7c=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6485Zq5S2147234
	for <openembedded-devel@lists.openembedded.org>; Fri, 8 May 2026 02:23:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=J261iYnlOwBndW96XMID
	hdINXrwx5Ohmpzfv7+7Wt1A=; b=JSYTCgyOMCZr8EZTulzzLIVSkXuJX1AdX9D5
	s/lFtiw1rseAnxbO5PExEk/xhfx+EiIurSBsIbsKGREIuAHMnZVaI3a4ZOM4UxhS
	r+2j5aT3KQxX1IFjskWOJGksSkSvq5Jj+tKg+L05vh0R0JtmdnR1v62joGYzK9Mt
	G45Q9ZM9LNRRDlACAYQGSh/fWor2PqPk1Q7RLdGyCQN8HZne/g0fgZzqBgO6Up+6
	ju5sK/kkzbsKod6oJD5GlbjfTR3nElRy1MTdeuA3a6hz0qzth0YKp0nSZFhIJKoC
	BY5rNuq3+V5Qe/W9XMbizLQp/IX7FZ56HNMCrLbCeU4grdL8tA==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010004.outbound.protection.outlook.com [52.101.85.4])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dwgsdfprm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 08 May 2026 02:23:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nd3nJbHIJDX/yTRADlAuU3F7BsfZAVuglzlSdxZy7yoHVVL58Z3W/VDw5LI9bvuFwmQN34+LP2JiFm5it95YMmUSTqGwdgIr2/gqG6hJ24l6AFGqV4BdNPUpXQQ1GCvI2KxLfD3MzwaqfxoOph9j0r9QdIx6oj4GJy1vPNIS6zVE/fvGxPE/BRaPtplIzbYRnncbqZ5L5rik2vMMeDCFvA/6QYZyOZhCSTUl82EJ8J/KZO/vL8nrNp2MnSRyRUlx/KiTDw3r/JdfFxUd5ss82HetzfnzFwghFzM/rOpUsOmUfUkNPYriXybtvDOM58npXi4NTMuP0xA1c54eWqpgNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J261iYnlOwBndW96XMIDhdINXrwx5Ohmpzfv7+7Wt1A=;
 b=PnlOxTGim/B/CD4CZYfnkfpdk1QY1/7Rv9WYQZor5bT70RUsQCJpPp0juPcIZLowBemxHF/Ixlb+achS2OdT3aIfodKgJAqwc9ZaIVuaz0ETKzxEJUC7EoF9lIxEsH72hrV9NelkbA6okY/FCYj5ge4FXt2YJoxy8OTuKApLh71bHSKM6PfeHpBx/y0+tv/DxBk/JPawWa3/BhxgLDLXN1b4il7PFuZdCeuWNkmLLQEA4q8oO65vhkZI2Qzd2uUSIz81x4/ixVFd2UJ+pD0buBpJlvok9bX5MaIVaVl3SmXi+EV11zfTuHePVpTdFE1kNtizRma4zHWoyYg/FTIaQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by PH7PR11MB7720.namprd11.prod.outlook.com (2603:10b6:510:2b3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Fri, 8 May
 2026 09:23:41 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 09:23:41 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] postfix: make it can compile with linux 7.x
Date: Fri,  8 May 2026 17:23:26 +0800
Message-Id: <20260508092326.2710793-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0038.apcprd02.prod.outlook.com
 (2603:1096:4:196::22) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|PH7PR11MB7720:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c91187e-519a-4540-56fd-08deace37e2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	zE2JL3n2mvf1aIrXSDyywde44hT1/FLjiv3PxjkB30oUO/weD1sabs1NWKWdquQ5eJFCkbml2CsSdvId6jAKafmekCpX6PNq9UyG14MOZ4JG+a4WQcyO79b6RAnNH09xDhAgI4DSds1P2tfWJA6CK/8510lIciZD7fGRqkESPJm5NWb0KhwG3+QSSbH5r11MN7XTzc/JQYf3Cpbx4npMOCwWbQ15GUqbz8OAgDytUa2JQQz9v4gz9UYUYPdYIGWl5XVH7v5SHlAm6sOIA2Ii2hPS03JMVzE+lHAoe+tvVAz744oa9NSEjxq5yyxyexm/zOEFeVJK5o6KvuNTi0e3PZw2XC6QpWBjTOnHQ7Fel2ZrGbFh8LIZLelC1NPk0Px2Gcsm9qxgSb48jXDzrLctrVydbUwAINIByZ8OO6XlDJIazQj/RVjrpMBDeSHXWLMUxpO+xd6d8CL08GT+6mg+43OGQdl1+2KnakyUYPLGt0Imq1W6iFXlAqfJj9ZHqCYV7cDVdSwcG/GANQcXEWL2f6h9oudjW/F/6pu8EuTJ+fdFUO0DMHa5/byWHJcC5irIrnKvuM/W9Jl3NG/lKt4EnyqCzsmucsPK5k2F+AxnEmz92q25qmOzDIUv8wWDnHw6zQSnjr34rKgXyy4S9nscQnc2Dt9zGMF3WPM/jowEtpR94AK6nxUwHa3Ywin4VuHDfxNUZhoI2YByg42BHL7bF/DzKFAUpl5nSh4l5/W+JqIRE9VHsN9ngdosGRVtNI60
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+ceAENgHhbvBIshbc6h8sAB+ogTDsf473BUdnoamQ0/rZkxg5fTWVumhmsS1?=
 =?us-ascii?Q?XADxDKYcCxk+pfCb6O4/Qc/UoC+fi2bVUGwiBOKkX8po8QJre5TVZtR4raiU?=
 =?us-ascii?Q?wNTLXpoJVEvnf3kEKe4mxM0NnckvTGDaaLmWtvYENUjTSOVZemf66HSPifyC?=
 =?us-ascii?Q?e7emtIiEN6mO6iA69wlIlpXIWe6dr8+jAWgZkVppU3NG6yAYIByg92fzMiKy?=
 =?us-ascii?Q?dSkbFsJtqBBmZL2s5zxqO9/fD3qlOYxhEz9vCAZClyqc1wX1+F8MsLAQwG1p?=
 =?us-ascii?Q?xf5r0wy6pfDaj6xF9tVmuRjt1YJ6QHdFR4gL+63VdbKCmmzt+ZUwTi75d4ie?=
 =?us-ascii?Q?57odYjakJ+ZYByZjWnAFbCrqWxN6u8xqiMj8X2v703hqyUNNzsUv8VmNPNPe?=
 =?us-ascii?Q?y1SdqtGhneODjdWufXjjXxPwEpXPFlgRX+zH6fgohjQnEi/tvRs1kt9Rnstt?=
 =?us-ascii?Q?cENh9xJ0worl6c9/uAxXhabkOCNDA7dgV9zLYDIHElWVfXXG3YtbVpejMWT4?=
 =?us-ascii?Q?fO9eEqG6DZV2B34/iKuGZelfwNDBhA4LUFRmFFBT3N15EbSKQOSRWY23DZPN?=
 =?us-ascii?Q?IoHxAoaoj9Gc21Qkdb5OWJPKFY7CpeR27CzxpzIymesOl8EdBE78D7+K72f2?=
 =?us-ascii?Q?slv+3k5Wbzb9onA6sH4CHNWxb/T8bIc5tB6WspaFRkdQ6Gwrq2panT3xvx9c?=
 =?us-ascii?Q?ZPa1pz7VPOsCozgtGt+5VJOqWqGJlEgpynb8hQ5V/k3+I0Nf0VRizZo8aeIb?=
 =?us-ascii?Q?qu1Tk/agR+TBeiWCmAgUiTxQfhr5CyS9F6XnscfNmDhK+q4lAJjt3IMMUdqO?=
 =?us-ascii?Q?METGF/BQg/8ZEqsY6UKpKb+KIZTPd3xur8HZUFGUMKxfuNjonMnRG2QwEZ+M?=
 =?us-ascii?Q?fX1XvUbfW0vAKIhcvZeXHnnPmyoFNSvSyvPGLVRJvGRWyBxPoMAkGBSGQsGM?=
 =?us-ascii?Q?JFJGnvw+JSgnjcUqu7gWehNaeDRrcsQnq7jDAS8RmPyw77xANbyxZ7Ep1iUd?=
 =?us-ascii?Q?LC8O1aAkoiamYw5TWPr+hK1bnkPfzx9o55RPyzIUVej2b3IrpIgi9xvVzb0V?=
 =?us-ascii?Q?4BEcDdldXp8S+IbYSN6XQkKrtBcVTwqIin8UXbfz+MedroaPUAI28502YG0X?=
 =?us-ascii?Q?2eMV90XJKgc4L3DtRBHKmEGs9rFHiUnta9joZnW05Hg+BaQePZaT3tWrUvhB?=
 =?us-ascii?Q?RaUwnWJlhZin7sADumDDkrrANIFmgqvy5Cuug96QrGsCgk04epn7pquyyTUG?=
 =?us-ascii?Q?jzu4VlibM3mPHQTBNPFJwDL8U/3XIzE3XiKiPkE0Fd9zRWoLdj3xgloqxwpL?=
 =?us-ascii?Q?m5fzibMX6qDDkVms3m/sIVpe4ppT9MGyLsBOxoltZ14LHcBbAWnlaJizkGMi?=
 =?us-ascii?Q?kSP7JShymxYA/6SWyQ7VO4YGkLaKEXAZiU2DkfDmlP9gBsv4B2Y5lYabwqoK?=
 =?us-ascii?Q?Akq5DDFL8K28kZK9CBYR8FoyaCKP4vwZz6AyN9Cvpvofl2t6Em7QWE5txkUP?=
 =?us-ascii?Q?ZT6rwtqLLTY8CN8bT6RDq+LcTnuFhQBfOqgKcsmBkvkzPy3dfDgIuWkUG+wK?=
 =?us-ascii?Q?vVSksL/E3cZ63d/XGB6TnYuAM37Olpmbhy1KSlmLTpEmBZvE5uYTpnv00SH0?=
 =?us-ascii?Q?kIv0MFD5SNR+TQUd7JxXlBBSRvFptS+ZB5Qn+1bqip363NqCTjXcMIZUC5tp?=
 =?us-ascii?Q?KSvSujVJ0pP6og90EzRUuTA3CkqO5FKFLq/Ud+jhGEg4/TufTZuoXqY3Mj9m?=
 =?us-ascii?Q?aOi5PW3Rsola7pSAPLK3H+RmZe3Fvlc=3D?=
X-Exchange-RoutingPolicyChecked: 
	jRn/sMozgjP0rPObm6z1YRzbJqFZidzXc8D9p1A1+b+YCDDPBbLkb406bI339kBfCaeYzRnkm5FjDuv9wHW87yZkDWdsQds/Cwe+i9xy6pUbA/UkMhvwj0WVihY/2vs6aowWtuvt5tz4bJyLPfRGjGXosZInmJfQOw8PHV43EnudVfTxtSzBgnC8nQFDvgb7lJBcVc8r4shva0uMtkZkfPfCbSsTscGcWZUBuJOXL9nGrTYyrOJNythV6gMlhU+qJQngJaAaNsaTk6WVqu86eAPYEnqBQ1wWxBkpL93vR3TSQu3iv4qzUCcChTAkz19F0LEpJbPbVuzGCvrgXPQgfw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c91187e-519a-4540-56fd-08deace37e2f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 09:23:41.0104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jgyRtcGygfP5oARbfYlZ9R1wPgGUq5BSfv+FDJMJ0zEnxhdI8TN7gWiu4dbudlt5DIDItaAfkBpx61HFjieez5gQCj+ds7i3aeZOkPWu+j8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7720
X-Proofpoint-GUID: EOel9KDHXlewlCsHTV4wiMmSzSr2-qtx
X-Authority-Analysis: v=2.4 cv=JeGMa0KV c=1 sm=1 tr=0 ts=69fdab9f cx=c_pps
 a=GX94MXth5n4ySrE0IhOemQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=VJYubktbAAAA:8
 a=e1GkridNAAAA:8 a=t7CeM3EgAAAA:8 a=Lz4N70M2UvTVOGxqTxgA:9
 a=OqWDEjY5HwswFcA5adJo:22 a=6ft9yNkZjdd813gQxDxM:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: EOel9KDHXlewlCsHTV4wiMmSzSr2-qtx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA5NiBTYWx0ZWRfXyvkuvIYkZ88I
 0TFDnpzr/8U17LKAw0WuJ7R1lsr0Veo1qGX6bfVpRu41coyF88TYgn3WJbXyjuDyCc39u67MVw0
 GTUZBG/I1EVNdXh9/dGTWssIMkhD04yFOoZDM1ScHqGT2rrKVhDCbwN1idrjQEUSbW5zqbV8rzJ
 JL7k2G0yJMqknY4FB2XFaqfC0u++hd1uWVV6Zfh9eVkWZro/Ig2lMUtfLDp6YYfbNOoU4gJxJYY
 4yQnT4xFKGLhM0sFXMvX9Yzx4pctUqHnrQFTTUWMkR/Pz0aNdEqeKkinJLDPyKpmHfsHT4+WY8X
 JbMw4qTsfKd00qoPswhUhpc8YNUEldGyyahMNMM2d+VD8nJmc1tVmJp7LakSQ6TOdeWNdSKmW7i
 clhXsZslfXZoZz1+O/VAcMXm1x5JAWvvNWDZf7RPzTvucF2ndWIyDyzScm5yNvTbEj8TVwDQpnN
 3xupG3IlrweGkU3ltSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080096
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 May 2026 09:23:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126826

Fix compile failure on host with linux 7.x

| DEBUG: Executing shell function do_compile
| NOTE: make -j 64 OPT= DEBUG= OPTS= makefiles
| make -f Makefile.in MAKELEVEL= Makefiles
| (echo "# Do not edit -- this file documents how Postfix was built for your machine."; /bin/sh makedefs) >makedefs.tmp
| ATTENTION:
| ATTENTION: Unknown system type: Linux 7.0.0-14-generic
| ATTENTION:
| make: *** [Makefile.in:33: Makefiles] Error 1
| make: *** [Makefile:22: makefiles] Error 2
| ERROR: oe_runmake failed

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...kedefs-Account-for-linux-7.x-version.patch | 47 +++++++++++++++++++
 .../recipes-daemons/postfix/postfix_3.10.8.bb |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/postfix/files/0001-makedefs-Account-for-linux-7.x-version.patch

diff --git a/meta-networking/recipes-daemons/postfix/files/0001-makedefs-Account-for-linux-7.x-version.patch b/meta-networking/recipes-daemons/postfix/files/0001-makedefs-Account-for-linux-7.x-version.patch
new file mode 100644
index 0000000000..4bc59ace7d
--- /dev/null
+++ b/meta-networking/recipes-daemons/postfix/files/0001-makedefs-Account-for-linux-7.x-version.patch
@@ -0,0 +1,47 @@
+From 5466d510dfbc2b7a81dcf766f83d2c89066c0446 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 11 May 2026 18:16:07 +0000
+Subject: [PATCH] makedefs: Account for linux 7.x version
+
+Major version has bumped to 7, update the scripts
+
+Upstream-Status: Backport [The latest stable version 3.11 already fixed]
+
+Refer:
+https://www.ftp.saix.net/MTA/postfix/index.html
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ makedefs            | 2 +-
+ src/util/sys_defs.h | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/makedefs b/makedefs
+index 74b103d..fe8c618 100644
+--- a/makedefs
++++ b/makedefs
+@@ -625,7 +625,7 @@ EOF
+ 		: ${SHLIB_ENV="LD_LIBRARY_PATH=`pwd`/lib"}
+ 		: ${PLUGIN_LD="${CC-gcc} -shared"}
+ 		;;
+-    Linux.[3456].*)
++    Linux.[34567].*)
+ 		SYSTYPE=LINUX$RELEASE_MAJOR
+ 		case "$CCARGS" in
+ 		 *-DNO_DB*) ;;
+diff --git a/src/util/sys_defs.h b/src/util/sys_defs.h
+index 70aab23..c5472eb 100644
+--- a/src/util/sys_defs.h
++++ b/src/util/sys_defs.h
+@@ -763,7 +763,7 @@ extern int initgroups(const char *, int);
+   * LINUX.
+   */
+ #if defined(LINUX2) || defined(LINUX3) || defined(LINUX4) || defined(LINUX5) \
+-	|| defined(LINUX6)
++	|| defined(LINUX6) || defined(LINUX7)
+ #define SUPPORTED
+ #define UINT32_TYPE	unsigned int
+ #define UINT16_TYPE	unsigned short
+-- 
+2.53.0
+
diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.10.8.bb b/meta-networking/recipes-daemons/postfix/postfix_3.10.8.bb
index a66ecc0b5d..6b82c04fbe 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.10.8.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.10.8.bb
@@ -26,6 +26,7 @@ SRC_URI = "http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
            file://0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch \
            file://0004-Fix-icu-config.patch \
            file://0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
+           file://0001-makedefs-Account-for-linux-7.x-version.patch \
            "
 
 SRC_URI[sha256sum] = "31d4b3eb8093d823b5a151f571719ff7c0462571bc95e6440d87ca525bfb096c"
-- 
2.34.1


