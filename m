Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3342CD1292
	for <webhook@archiver.kernel.org>; Mon,  8 Apr 2024 08:47:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.101608.1712566024642642841
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Apr 2024 01:47:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=48286b2233=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4385U8vO002875
	for <openembedded-devel@lists.openembedded.org>; Mon, 8 Apr 2024 01:47:03 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xb1p09ch0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 08 Apr 2024 01:47:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cWwC5gpIVkPqJlKweSiwwlXArWYoCUZR2xuzNnEWOMKv46BLUe0PO3paV1oH+jksOp8wVggEV1md8tdTNsJ2va47vqHYprs4G9iae6j1LtuGoEBC0dWpXLrC75mmXTgwkP20Cssuoe9Beyk+7t+hslafq+EkYc2wssqAUDTlXu7jDSkI7hIlWHNwy6HCy9OWVmauD2GJ7SzDW2D6EangR4v63Hrma31jF0BBx+ZWRGPbu/3giJouX0vc+tiwpiRO3qLsNyzn6uR6zdcID3IyhZ9XI7LsJ/nc23fB3FYUv3ou4huzMc2KPBTA/MSNOuX+iDDUbMN/VmhFWnNSbEIpyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1I1Xc7HP4Ib7cKjes8p9u1m2DhBa4ooVx3UG0USU0O0=;
 b=FnEysGjCB8Imrfrzx/NW57OmCfge0kD0YtaDAxKonaqGeciSX991TA0K+GApMsGfy6kvEEeZzi5AQtgcaRpSCYre68owETxTiZaCKxhVt4fsVV4H/ZTQRElBswaCFgx+4s04j7p2C3SqW6awHtp5F+4smI4P8fMMF1wz3nc359meH7KKvCmio3sAbK5Lc4fYG/QBlyBuvEwI9Ng0XFqVb/JQbWQLlutWwVaKGm08S5Yo2P0E6s7vod4hbKB/Ovj7kpOnrr1k6BL6FDx/gySOgW4T1cr7RDURhqVrXU7Ki6uDVvXfSyAq6FMCfl7rpjt8kmR9aVMwQdb7hGv5kuEQQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by CH3PR11MB7914.namprd11.prod.outlook.com (2603:10b6:610:12c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.40; Mon, 8 Apr
 2024 08:46:59 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::5dcc:ddee:208a:33b5]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::5dcc:ddee:208a:33b5%4]) with mapi id 15.20.7452.019; Mon, 8 Apr 2024
 08:46:59 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] libgpiod: fix QA error in ptest RDEPENDS
Date: Mon,  8 Apr 2024 17:26:57 +0800
Message-Id: <20240408092657.436963-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.35.5
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR02CA0070.apcprd02.prod.outlook.com
 (2603:1096:404:e2::34) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|CH3PR11MB7914:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jhH6ChnIid8+Nky7klm2Q7iF5nKr771DR6ED3jQWPxZVYlcJ7I6LEmIuA4YtVgKWopDj/PirWqceKfX1dKOm56N8CRwCyA12iNzVhnRRXLYWudgmSgLMuEz1THnNvk1NTiR3jsHN7JSPANhgD/xIadcEDuyUaSFTDSjcf30JBBATnpVg4ZAKPML4Pmm6J2AYGR1/yhhVWoQg7aeGATKsptCuQjt4ZYQb5fyJ/7xysLDp9WUT48lGoL4Q14W47xF8RuFBuUPeBNXI29enAad5r3IyHPSelwmcoFJ8DQ9rnhqISSR9oSAViS2NVlQ2tYn5xaGwbyYmxKTOPhqCrO0QDZHKE6WAYZUgKD/+TjUvr/BZfToPfkq9f6ASksICYTrpi1xvdl0fEBm91yR4MwWkv8lgbAnS8jDNyas7pgtA+Dhlwk4zKMuQyO6jKv+DayOzvcj4n1HQLb6JhHUhfhENVVF55giOrQB2Vbe70XAP3tDnLO4tmNdBnPg62R2D9eb6c6VUxYRI3ECFoNyiV38mct93qDOWL8IDrLfvPaxeToFIb3ecYKTzB73eh6EM6j6Ve8ExtRjOWQTZ4eXr2z3btpgKEHZKyL6Hg+zV9ckg8aNvMdCuvkbx7IkfjxHqGEhvBHXQ7pB2zfe4kxWrB18qn1jDeMFcLafhbm+ZTsxmBgXKZl03WEJYd+YM05gUHI/9dNSQNQ+84mTpHUa+szuBow==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(52116005)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gVPpJrqJ+KQ1zTMbxtf5OGIPKXqMViQNtZE7yR/FzyGY0MLVo6T1rRwNTzVi?=
 =?us-ascii?Q?EGC8PZuOsxPIUjvSuahY9N3pQubbtWnB3J1VAlnO4Wn+JuS1mEM2T2dk5TY6?=
 =?us-ascii?Q?5XZ+NyAe6ZMDGmyijlrh6lxSCN4sAN6X35Wl0y8dmxZi2ompy/Pc5EBqQMC5?=
 =?us-ascii?Q?ScfvgbNOHnTAULtNeA/QY+JLbunmGXBXZopE1tEdpNJlT8JaJ2FApyNX03rR?=
 =?us-ascii?Q?6Me2ZVBidoEP3pK5Y5SBFy+8b+6Y6LgEcLgA4iqRJpPb0wNMLbRqKx3NIh+v?=
 =?us-ascii?Q?oDn38Di97ZklPsEgtId5o1YyizmRSJv4Aqljw1CaxT/qIE7nqKEFzF1Ju9Lo?=
 =?us-ascii?Q?Q/b2eXYOcjcwK2RRglI1/j9osgqJ49QXo8UEPbgP64Od0yCUOnrEs+F4wUtZ?=
 =?us-ascii?Q?DB2P/ZI2jPJc1aGlknHw1wBwPfQ6mRO9U9EVzPFA9uhYPJuk2N+Wk5aL5FYc?=
 =?us-ascii?Q?UzrXmGhzaDQEHvc0/zjPdOhM13Nb58XeKakztiPd6+N/DG0K7qqlHislqb7g?=
 =?us-ascii?Q?67L6bS4+K+nlFp3c+zcN+gCfkE+a7+AxvHQ//GTQoNNQ6xlT+h+7j24xfbTm?=
 =?us-ascii?Q?1DOnnsC2waz4tFA4Winx6/PTmgFqvn8Zvj7/PQWChkQkrdQ+Sl3an8gQly+D?=
 =?us-ascii?Q?SHpU29Gu+aFqWZexjGTL1XoyFeuQXjWi5Pl5tH3OSMLybRsTS4TeHTQhqdt4?=
 =?us-ascii?Q?DIXTPuRPus0blioA6d/jqMxCXbPUMzFLnutBEByndWVcJJVuZDMolUtYUunQ?=
 =?us-ascii?Q?n6ZTLmSEroqW5tNceVSclXoOviTiPDZ7wNEg3wL2adrFvGZRNy1NDgKXN+aY?=
 =?us-ascii?Q?V6Kemm2VRmmpdu69PLgNByv4MZpRolPjdbsxcg+N8e/Bd+BcS+K3eNvb6sui?=
 =?us-ascii?Q?Qvg7wRgGFdfIZH9r98MZjg4RUFapOckyY0IhxR3hqDyW2t1d3LKIL+98fnBy?=
 =?us-ascii?Q?mGntPh/6q4PMFPg5k6cwzZAFKR0Rwp9twXBh2zSU/aLQhDX0ZnQ4r6unGGtn?=
 =?us-ascii?Q?F0RCxa8qMbSQ0vnBQKvHyyrdsL5LUDYNORX7dFT2h0JqMu+4l8GlS5oYZy9H?=
 =?us-ascii?Q?xQAhhE+UBSGB6ZMnl34pPZGD3ha3IdHgAeeSCXJIH5Uy2JimQl+8ZMc7DjMZ?=
 =?us-ascii?Q?mmQk5QHP6g1Q8MjP6I2ahkXal3l8KdM30tiTVzMstiLK99/zbemM1lebzNnh?=
 =?us-ascii?Q?SThncvqnnl2Fmqxi701rJPkY9riAD3NJlbJ4iNsA/DBmpfaVLxbRAxICi4Nt?=
 =?us-ascii?Q?E7JudHpfuZF6V0ym0BcNBgNzeW65qdbeRMfXVsesterMNCzz8vDlnyp+z0da?=
 =?us-ascii?Q?YWw8eSK+TEOyS7a/Dw/dhzPoN3NCkzQFcBEVXVeGXs5Zp0TKkY0594gftY70?=
 =?us-ascii?Q?RKfVukSrqcsniE+Lu3i2gxcviQ4yRBn+6oJGyJHvrJ4ThNlB3P9sONu+p7WG?=
 =?us-ascii?Q?t7Y1AQClLNaEoCfpcYeSi+8tRLPqE2jny6ITb5TbVsvMV6QJ1b10vvEq0jA6?=
 =?us-ascii?Q?beOi9Wwkok6pQZPy5aXguKBZUDsGAfWI0tQwwGILEU/UeNOX3qCQw5cJoWpn?=
 =?us-ascii?Q?KcjPzethfq4Biwogu5v8JjX4udE13Dqz5aeDluIg1iDK9mG8l67vUa8b33SX?=
 =?us-ascii?Q?4Q=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a9b8a8a-8d3f-46f8-4830-08dc57a873c3
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2024 08:46:59.0455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LaKtvqd3gEhnHvrpyfrjOZnnYaIcL+RH7iu+O/EpDPMdqAgW2e7kYd+qNAeCp6Jp3z3rN51cIUjdViSSXNGo9bxyybbYlsK4uu4lcJwUgM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7914
X-Proofpoint-ORIG-GUID: HQXseC-VUfSJhRtO9xoeThxxvlT4v8PF
X-Proofpoint-GUID: HQXseC-VUfSJhRtO9xoeThxxvlT4v8PF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-08_07,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=755 spamscore=0 priorityscore=1501
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404080067
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Apr 2024 08:47:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109861

From: Xiangyu Chen <xiangyu.chen@windriver.com>

The bash in ptest RDEPENDS would cause following QA error:

   ERROR: QA Issue: lib32-libgpiod package lib32-libgpiod-ptest-dev -
   suspicious values 'bash-dev' in RRECOMMENDS [multilib]

Add a ptest enable dependency to avoid this QA error happens.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 meta-oe/recipes-support/libgpiod/libgpiod_2.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.1.1.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.1.1.bb
index c62c9a3567..4a568b4fbe 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.1.1.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.1.1.bb
@@ -21,7 +21,7 @@ FILES:${PN}-ptest += "${libdir}/libgpiosim.so.*"
 FILES:${PN}-ptest-dev += "${includedir}/gpiosim.h"
 
 RDEPENDS:${PN}-ptest += " \
-    bash \
+    ${@bb.utils.contains('PTEST_ENABLED', '1', 'bash', '', d)} \
     ${@bb.utils.contains('PTEST_ENABLED', '1', 'shunit2', '', d)} \
 "
 RRECOMMENDS:${PN}-ptest += "kernel-module-gpio-sim kernel-module-configfs"
-- 
2.35.5


