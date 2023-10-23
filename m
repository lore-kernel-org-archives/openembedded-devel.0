Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FB71C25B6B
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 23:28:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6417.1698103732230596136
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 16:28:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=C6Ne4pL6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8660f253af=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39NNMXmp015421
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 16:28:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=UnZskbrGtj3tAzQXvUSwmdV6TASySiz3y4prMqIFGmw=; b=
	C6Ne4pL6Sjlufi50+xMV3LL+yR3sBKBK1f/ufukCoEzWMY4SzKBAA8/aQ4ndbVrf
	W1/nnT1x8h0BF2DSangk/eYHivD85zLV5UjGBT9R0fl9b2jYX+sae4QX78zx9s5Q
	OJVDlEOGi910MAMuenxPnogdyn6uw8VbRlXgmXWIltQRGexiXe/RCFuUWuFPh87K
	nc2PKfa3sMPWwtsIR19zQMxXd8KcUSXKxvFAIG17TqsiSfnRN174zHnChhgGPe4X
	0aQX43ZX0cqXk6OTWI9g0D1YDmG4HJyOQURes/n3ynpVOguIx4Ko1279QmSZ5WSM
	6FrmuTi59UCNEZTgZwBthQ==
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2041.outbound.protection.outlook.com [104.47.73.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tve5fa8kc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 16:28:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hbAkts7EgcCdt0cCJW0Souhp/CY4c1qZVATx4zdoq5JKpDYMH4FZNS5TgCFJCnDnK5384J7SC+DP7nWQgqPvWiG0XWEKnRu18KlZbLftlqjCbkcD0l222nzO7JeRBUBr2apXAdKOgKDZN43o7OGLsZ5I7f2iG8pq7mPNYdau+OlCgYsYEt8LwSZnwfvn59bfdEU6hGrAasCSB60w7OACbMwWAjV6YYQ+AO9IgPIRm12ElgoojTxuRPzrFkxO4Lvw4NViNSG0g63k/Pfw8wDfGF1Nes/FSjG3EUbUZcY/MLfy9PjGAwj/12L+bYTeq1OonTOaZhe5TG6K6Zzslx7tQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UnZskbrGtj3tAzQXvUSwmdV6TASySiz3y4prMqIFGmw=;
 b=XDjQk4TfabfDe/rOQ5mRO61QHaabVKMglwC2MvI3StJTa8ZjvVLnebyOjH+62Op1v0mEavCYATMRCvufaete2UHdlAxwGaBYOOr3CIduyXOblIxqGRpE+GfWvnokgkYCAYuOwkw0K3PnK+7V7wp30eaTOHFqFNQHy4IfooYa49I+3HS7u8HOsltci47NMoBSQQuHARA3FsUDGBDhpwEVtMbxQs6hlyJFp6VOe9gnwcM/b4Zj9V+bagvm4zsVLCelsJcGP+lxqAZxgKCf5DoJLjw4u5svgO+7S6YD4EfjGYfLQFefYFyKHRicXtoQPpByoLCflVbWJcVmbGMqqAQuZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by DS0PR11MB7927.namprd11.prod.outlook.com (2603:10b6:8:fd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Mon, 23 Oct
 2023 23:28:49 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::c0d4:7b72:20c6:3a07]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::c0d4:7b72:20c6:3a07%3]) with mapi id 15.20.6907.032; Mon, 23 Oct 2023
 23:28:49 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/2] nftables: upgrade 1.0.8 -> 1.0.9
Date: Tue, 24 Oct 2023 07:28:38 +0800
Message-Id: <20231023232838.1141607-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231023232838.1141607-1-yi.zhao@windriver.com>
References: <20231023232838.1141607-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0152.apcprd04.prod.outlook.com (2603:1096:4::14)
 To CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|DS0PR11MB7927:EE_
X-MS-Office365-Filtering-Correlation-Id: 11bfd62b-3bf2-4f35-bd30-08dbd41fcfb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Mwpz9uBMntkiahAp9LUyso288wE66zxxikc+lmdzShKSQWbkbQ4NG4VJ1/2v/2pO9D1Y9u7DXvDwGP7VImUPwOtRTzdS486pIzD2e3exUVKc4VdU729IF3juohbu+pPeRVObcdpDM5vvcRFiWFxDl2TLNbki/Wmqt050zYy1ZUAeDB7ee1Lkww6fdYTa/Ic3VI10BSDQjgfU5VLDknXl10VDd000qAxpLKTJvOOFdil1vsPFNN3fAfYLqkLF5Jf1DN5/a97czLcabR5yF0qPraKKqPyq+lqQZriwCBK7j3REGHxyUueED3dSWnddeQAhWXmCzDMrGHEvd1KiaUYcMaD5ytF4qJFz8VmeEV5Xj0ajus37Ndczi9tLZOH+wsPOUKPcpVR5+i4GyUyNM9KNhw0OSeTda1b+e1HtDAi7MQnX8i+RLT9EUFsGi0MvB7Coc0yxwPu6THnka3svh9RZUXXGL+oBJqQr5RnNbvdt+DlnFgYv5HpqzBCCbcfsPRx8FHstRqLo/IUheq/QB8CRb344ZkMjdymRNYFOYsdkYUHHtoqgV0NAldnIiEzEexNmHvZJF1vryWtQH3VpSLUm4JONg3T18M4OwjEgbcEJsRc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(39850400004)(136003)(366004)(376002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(2906002)(44832011)(38100700002)(41300700001)(66476007)(66556008)(6916009)(316002)(2616005)(66946007)(1076003)(6666004)(478600001)(6506007)(52116002)(6512007)(6486002)(966005)(83380400001)(38350700005)(86362001)(5660300002)(36756003)(8676002)(8936002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?voLyrfWrjluhr9kk4we9TNIb/mzQXPrJbIrYaDQMlUB3isMqs688eWXMNHDN?=
 =?us-ascii?Q?eJugbYaJe3rnUq6uqkcS2ItfShIAWWM6wHyfYG3TY2wcrZ534c3KLWU/v/bk?=
 =?us-ascii?Q?iLOBVbzRLh6vhqsTRJPWNNVfsO1zqFzjjUfThomL1WcjI8uoYnrIquAwByiY?=
 =?us-ascii?Q?AUz7oBtPa8UVeaXs9Ra5DOrhD7EZiJmzwCiFb1lVLNxFZC/FbJvQlWvTECpt?=
 =?us-ascii?Q?6f5nWQbXn3f6reznlixhvcBo8d+/NNYge/vsTKnVakNXsl0ZMIt8Ch1SYB2a?=
 =?us-ascii?Q?1zrjDt66QXuzU4F5zs/wJxRuX4g9cfk4gEJVSBfG1f97+wEWkZsFUydI8J9M?=
 =?us-ascii?Q?5TVRMOuIC3EyNydyhhSeueHFp11j3toHgI/o/1d1/0PeJ73GJPobYxUCNQ2s?=
 =?us-ascii?Q?oKAxF1VtCwGyxeiFofhHeyjYfZvVw+IKAStSoGOE5nDQc6k3FQxhpMYRZSRG?=
 =?us-ascii?Q?66JM3/Y9TkudEeDk3Y8Nv2M14xQYBDrVARamg+38ES6zV8k3Z5WjYsPRVnrh?=
 =?us-ascii?Q?r47m/WjFZqrcHMurGzrby8I8S2NSzikPB0tZZB11VXZXDMu71qL5c3qT8wk4?=
 =?us-ascii?Q?/yQ2U3PTH1MprHd+1y+CxER6NIJhQgtgX8Be3v1BWX8/MlLIwvKoKcap/mbQ?=
 =?us-ascii?Q?Y4+ZrVWGAZBLyozD0fujGq+gcyQpTZ28/ECticsLtxEoM99J0b37fPmHmcVi?=
 =?us-ascii?Q?ZdnD7ycLchT8D6fyFa+C+rsMz3Q3a7KDcZhNOc75GwM8mdAwMlmRFKb6kZiK?=
 =?us-ascii?Q?XXP2d8DWg6Q18eNt9gdn5W3enQ7Xk0b4CnIwQBapKXTn+NSxSk7E4TKdIzYa?=
 =?us-ascii?Q?SNT4o5EzqF7kqlQ6AQ/wxhp4jVgxKSXlS4K6HeCoCTJ5m4SiaFX7achQ0op+?=
 =?us-ascii?Q?fWLPl+yiF4zlkyvETe/UhWg43fNPYnpGKvj3pIJHPTEo20t/E31vDcNXfOPX?=
 =?us-ascii?Q?CfsQ15qQP2u+C0VKXzCM9H8ji/iCfYqwCAvNdWyM0To/75YZTMigN1AAjNYM?=
 =?us-ascii?Q?mqrif99i8Gzfzjl/3mWcilI+LxgzefNtpWL6PtLI75MPiqbiKt6CumGmLjk7?=
 =?us-ascii?Q?juyRYppnTW6AqlOYZMU3Hjul6thttrMZ2MvS/p+PtZMXZKzBcq+b2BsNgzei?=
 =?us-ascii?Q?rqlfA4AAp1OW9m367DZkeHHbvMdXlDUdIFBsOmnAkSa2GkMDxSRVl+ZC/rgx?=
 =?us-ascii?Q?0gTEShCUDz/aBQu8NkBEzGDU1u1ggWR4tU5lZ4Pu+e2u7/VxNkgafPkfafoQ?=
 =?us-ascii?Q?mtQc9GUVwmtyusCMzhzSJb39cjjWkYBQtMgBeO1Adwlw0Xvp7Ho9i6Ovm4us?=
 =?us-ascii?Q?omRh5tJmJ2WxC5w3QL9GqvPB4/3lp1yjROlZxYUm4R9ZrA3YQsQbeP/Sh4wk?=
 =?us-ascii?Q?QULkMIGLPsNTdS4ubq5PvK+JyLBspp4uLpF5bHMdCTAX1TZopr+FKcOcDvOn?=
 =?us-ascii?Q?t+od7fszsWINv1HSILqL7nLflX0TY5F/IOfJ7T/7FKBmeuSR+u89Xrftxg+V?=
 =?us-ascii?Q?1rv9zDtF6C/brifzvWF9b7tAstAbM7YboxH6Nj3qPOFUybra5SzFTeZTHhHW?=
 =?us-ascii?Q?cyWG7OdKJlpnlBtK9C5K6k0pluE5I8OCB4B802Pl?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11bfd62b-3bf2-4f35-bd30-08dbd41fcfb9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 23:28:49.8605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3IU2c0rfXzcNDh+kakj0mn+HbIPzJo8czfzh6O1y4tqod6SzTy6QWvUsrDgCOErpsAUQUHPyGigJFX5kDt7QAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7927
X-Proofpoint-ORIG-GUID: 8MJIBvpRxbDdhs2J0jnzQrttZn8MmRh9
X-Proofpoint-GUID: 8MJIBvpRxbDdhs2J0jnzQrttZn8MmRh9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-23_21,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=865 clxscore=1015 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 adultscore=0
 malwarescore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2310170000 definitions=main-2310230206
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 23:28:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105689

Changelog:
https://www.netfilter.org/projects/nftables/files/changes-nftables-1.0.9.txt

Drop configure option --disable-python as it has been removed upstream.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../nftables/{nftables_1.0.8.bb => nftables_1.0.9.bb}        | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-filter/nftables/{nftables_1.0.8.bb => nftables_1.0.9.bb} (93%)

diff --git a/meta-networking/recipes-filter/nftables/nftables_1.0.8.bb b/meta-networking/recipes-filter/nftables/nftables_1.0.9.bb
similarity index 93%
rename from meta-networking/recipes-filter/nftables/nftables_1.0.8.bb
rename to meta-networking/recipes-filter/nftables/nftables_1.0.9.bb
index 00fe483bb..43d606f5d 100644
--- a/meta-networking/recipes-filter/nftables/nftables_1.0.8.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_1.0.9.bb
@@ -9,7 +9,7 @@ DEPENDS = "libmnl libnftnl bison-native \
 SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.xz \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "9373740de41a82dbc98818e0a46a073faeb8a8d0689fa4fa1a74399c32bf3d50"
+SRC_URI[sha256sum] = "a3c304cd9ba061239ee0474f9afb938a9bb99d89b960246f66f0c3a0a85e14cd"
 
 inherit autotools manpages pkgconfig ptest
 
@@ -23,8 +23,7 @@ PACKAGECONFIG[python] = ",, python3-setuptools-native"
 PACKAGECONFIG[readline] = "--with-cli=readline, , readline, , , editline linenoise"
 PACKAGECONFIG[xtables] = "--with-xtables, --without-xtables, iptables"
 
-# Disable the python via autoconf so we can build it separately via setuptools3
-EXTRA_OECONF = "--disable-python \
+EXTRA_OECONF = " \
     ${@bb.utils.contains_any('PACKAGECONFIG', 'editline linenoise readline', '', '--without-cli', d)}"
 
 SETUPTOOLS_SETUP_PATH = "${S}/py"
-- 
2.25.1


