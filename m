Received: from outbound-ip23a.ess.barracuda.com (outbound-ip23a.ess.barracuda.com [209.222.82.205])
 by mx.groups.io with SMTP id smtpd.web09.6228.1616720548953498964
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Mar 2021 18:02:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@digi.com header.s=selector1 header.b=GRktuWdM;
 spf=pass (domain: digi.com, ip: 209.222.82.205, mailfrom: ben.gampe@digi.com)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176]) by mx-outbound41-174.us-east-2c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Fri, 26 Mar 2021 01:02:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cduDQPTX0YeB6212F5cdCelw2junE2zytyh+jmj3f5zp2V6uuwg4Nc1v+FsFyYcsIzXDk3esbuSGjK2cwODCZ390nhyQKCZNxpWGC5/EQTNjmyn+2vi/NYYhvRg55Os3sKXuA5SfiVB+BkbloO6zizxKrxAbPmYK1JzHghQC3I7Tzj9beA9Qj3yDWZA1+4ue8qv94BoAIdujZPefAsUlYHxUXm8XphGn24fzOu+qXfKnp8lrPCkdPfuKtrXbuBYsV85HSBa612z9VXKkZemzXGyAounop3nnQwQaDZmy7HvZAmFlwCiHlf4vAbt2602JpLrMpgXW4IZ+lkuL+9RI5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPnTAzYSum6+TcLP4OBre7BUwOQoJzxAy7CW2BMJ+Oc=;
 b=c7iB8Bn4Kj4IXoU5cGNrgpdfSMcPdrOGjJPKPAlFxtNgrL5hE1gU717atvG2EtJllX0HDruHWvvVuryFlzHdyFHKbHhqjcjn58xFIRW+uqlhKkknkwcxjVjX/Cc/XeAPa2+MFUlHZutf8R3cSCu/lygmFUw/bBQ1gL3oflypW0b8YOh8nUL3XplCPzJbWxt2WhNc9CeD5UpGNGOVgPD9NfmGrWmsGQXQWxSRmTCeAZr59DO/Uja49s7citN3ar1sn8ZUnfDjGmjxatiMxV/iHBsVc1Vcytu3xKCNDwx+uHF4XfyWQ7Vcjf/er7bSoBznfEkL3Jq8ALskHOHrLf2uzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPnTAzYSum6+TcLP4OBre7BUwOQoJzxAy7CW2BMJ+Oc=;
 b=GRktuWdMUkF21KwGe6xfmieuKLEvlaEKIKsO/KUlv+fUj8Mbz56+mmf6DKVnQQIjBDNUGqRJYIdA1czJfjLJfKt60elWIAb3nyrMYq2EOlYnlz5wyZ5jPST03GQ3vyaFfeKd6WeO85QmyiWge5UUitQFdwZnFSAHTLU99t/1xWA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=digi.com;
Received: from BYAPR10MB3320.namprd10.prod.outlook.com (2603:10b6:a03:15b::21)
 by SJ0PR10MB4799.namprd10.prod.outlook.com (2603:10b6:a03:2ac::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Fri, 26 Mar
 2021 01:02:26 +0000
Received: from BYAPR10MB3320.namprd10.prod.outlook.com
 ([fe80::3cd7:c100:494e:cecc]) by BYAPR10MB3320.namprd10.prod.outlook.com
 ([fe80::3cd7:c100:494e:cecc%7]) with mapi id 15.20.3977.025; Fri, 26 Mar 2021
 01:02:25 +0000
From: bgampe@digi.com
To: openembedded-devel@lists.openembedded.org
Cc: Ben Gampe <bgampe@digi.com>
Subject: [meta-python][PATCH] python3-h11: add recipe
Date: Fri, 26 Mar 2021 11:00:50 +1000
Message-Id: <20210326010050.2531320-1-bgampe@digi.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [60.241.24.90]
X-ClientProxiedBy: SYBPR01CA0117.ausprd01.prod.outlook.com
 (2603:10c6:10:1::33) To BYAPR10MB3320.namprd10.prod.outlook.com
 (2603:10b6:a03:15b::21)
Return-Path: bgampe@digi.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from beng-dev-laptop.beng.bne.opengear.com (60.241.24.90) by SYBPR01CA0117.ausprd01.prod.outlook.com (2603:10c6:10:1::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26 via Frontend Transport; Fri, 26 Mar 2021 01:02:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df42702e-8ce8-4849-fc66-08d8eff2d1cf
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4799:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SJ0PR10MB4799FACE85CFBB180225338A8F619@SJ0PR10MB4799.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:229;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+hu0/LzY9vJFxuDt4osQ5K6sSb9BkBcvVkrOYtDfozW1NktR3BIiVAmzNXzMapEE9C6+5wEFw5LJqFIPpDqeJROeDp/HzjxejU5m+/zSWAl6QJCk+RLa3FuK/d1XDKgx0FiQ1phHt0XxwRCVCJMyLHqS2XnHlQQjF8qK1HsHfhRbtL+8x1Pn4+xoAat3DuIS+r0XdTJrHyz5wZLrcmJvGtmR9feJVQRxYW0h6jp3GfkcLA9I451IbC4xpjZdyqUHVi5Ot2S0lFfWcyDK+jWisVubMnnNDC6cJDnTXEz6DI3tV3AyxSyYZ1R4dP0jkLkJwnc4w+3SdnVbqG8rzwlMjOAXid1oVDykKD/PoBSJ88QbsNGidI5ZY0XQ+FSBH+gYObaoodOlNqNYSNJrm0lE7ADzvJSPhKBWEeUuXwisHRRc9EDKwW1RJ9D2gt+KntQCOlziWKdjjPdVO1zX9v8T1849x636QsiZi1mSGXEQJd+r1Ybk0euk0vf+cs0VImNgNTlRJSr2bEDSFcrhIbLaDEoEmpBdMWMVokGWq1kJdf8uz11V9RNW2zmufx7JG6S+YIGU8Jtg84T/5W/8gi+TbP5QVb1E7wBDWTvPmg2dmOzjs+9sLMDVyAGjmjQD570Fx/Avn0Xva98JNh5L/ZPLgijnf2JYX9VwasmPHXecLnVY0HoNuZdfCnylypEDorIrFeAeiSLbFu3pKPYIYyPtWb85y+ynPdqVFE5lchHRh6M=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3320.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(346002)(366004)(136003)(376002)(6512007)(66476007)(66556008)(2906002)(66946007)(8676002)(316002)(4744005)(36756003)(16526019)(38100700001)(186003)(2616005)(6916009)(478600001)(26005)(52116002)(956004)(8936002)(6666004)(6486002)(107886003)(4326008)(6506007)(5660300002)(1076003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?VF3m4rnWYlXz+4LEayaMGf7LMaaFEWU9AsM32KmHVeJwKRpwL+dr5xYdrPvD?=
 =?us-ascii?Q?3VDAm8bVCpG/lF55yS6Po9G0DtvLcw0+VUxlO9B/e+VxrKZ/3hkOmcpScHm7?=
 =?us-ascii?Q?NfCpst/ejpxCbjWZJFfpmdA2X0E5ppj6zvX30YLadJpc6ggMGsU3tcc9kvdt?=
 =?us-ascii?Q?ao1WA7J+Srrhs1zfRcSXexfOjFYDh0NNWvI2UgIs8Fy/Yjo2PC/cczCjz5vZ?=
 =?us-ascii?Q?Nm35cYPC3Ms77CX4kKOGJcQ0HfwoA/ri1qUhI3IiW9tB3Xyw/eg/UIhA2Puy?=
 =?us-ascii?Q?Tn0iC77r5ZLjrIj0Z1lAFulf6BGgq87doLqradQ46UeZCrgbyPyw/HVvdHW5?=
 =?us-ascii?Q?Z4Py/rog4wlELhFLkAyhadJFrfQJ8LiZ4N8jqywfEw/WN1TvzdLhnwx2AuCG?=
 =?us-ascii?Q?R0S3Bc4XR/ZNUZ/D3atD+zl/3CmGdbeArVgn86UoF6+irwz4Htk+NU8kw7Lb?=
 =?us-ascii?Q?MtRJzW1HluD5YTt3IiDtzMFGrWgy4EDog9wUiRKL8mPy+eA+ZycDRvlJf/N0?=
 =?us-ascii?Q?AJPS+ncuew41HzthaqN27sFiZfHN/OaLPIR4Uxs6IoGTg/Wua4LLdl9DTK4h?=
 =?us-ascii?Q?iqJeZnhOgR7VF7IljDJnBYYxcQs5LVSJ5kzCaelqFDpp8ayVV/5W0JFYl7Dy?=
 =?us-ascii?Q?ZeSjJj/f8omld5JHUvPzRHThG8Z1U4uIo51qepFnczw6KtHQIfbeqWpWJwuj?=
 =?us-ascii?Q?svKKwnwbt3FiiDHyLo5E00xrp6HgBLD1Yq6Pl3XDVfl/XNaTVIx6fIr5LBud?=
 =?us-ascii?Q?NDTEl13Hpzt0wngEBz7rhEPkAuouEzKEVkDqslKBNUlLXMSgaj3xLtDOqruv?=
 =?us-ascii?Q?CIIXs2pW6qmEIW4EnD7VTHGu9GztN7WCqFi1BWRrDjdFfci2Lpx4wLi5Zlze?=
 =?us-ascii?Q?WM0H9QgnVpWFLWMaum4gufNrs7ZliN6v8QVurUSi9mOPA0m16nAh1pldFuiW?=
 =?us-ascii?Q?8j3xtBPkBrXP+PrTI9Gp9+Tj8hNZExkOFoQ+PYlJA56+RA3CQByBcArgNCPh?=
 =?us-ascii?Q?TFd7bjphtM2+8zFFHFzA6UYzr2EPqXIt7KVr9U3FrMTEVWt/MnZlPoxGoWnl?=
 =?us-ascii?Q?FJa+1jI74dFTi1DCHjBSD0n782mFisVxmy4YUMwLHeEemTwlaNLw5hHj4Ltm?=
 =?us-ascii?Q?G7+EWaoEmyoYg2svK0xtiogMAuVdS8fz3+BfVIraipD4wRD+LPIL93JChW7g?=
 =?us-ascii?Q?M3vKp5sRtyZT/2B0ZtCOv6FWx7+B0vChosXXfX+qPaEIHSONifP22Zi191B0?=
 =?us-ascii?Q?YS6l1qt/qJwUWoppIa9E8annyHV177uw6dMCKZwfUr6iFvTh9c2JWQqMNxrr?=
 =?us-ascii?Q?Y0pdEYQoXqWINPRjU9mbaGW5?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df42702e-8ce8-4849-fc66-08d8eff2d1cf
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3320.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 01:02:25.8655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lru9r6zzQJKnkx2ruoFE6aanqz7Ig8wYM6bJOVqfzqmx/aJUHt65L3qjFXU6Ra2X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4799
X-BESS-ID: 1616720547-110670-22955-28907-1
X-BESS-VER: 2019.1_20210325.2126
X-BESS-Apparent-Source-IP: 104.47.58.176
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.231092 [from 
	cloudscan12-204.us-east-2a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 MSGID_FROM_MTA_HEADER  META: Message-Id was added by a relay 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=MSGID_FROM_MTA_HEADER, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Ben Gampe <bgampe@digi.com>
---
 meta-python/recipes-devtools/python/python3-h11_0.12.0.bb | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-h11_0.12.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-h11_0.12.0.bb b/meta-python/recipes-devtools/python/python3-h11_0.12.0.bb
new file mode 100644
index 000000000..f9b516925
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-h11_0.12.0.bb
@@ -0,0 +1,8 @@
+SUMMARY = "A pure-Python, bring-your-own-I/O implementation of HTTP/1.1"
+HOMEPAGE = "https://github.com/python-hyper/h11"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f5501d19c3116f4aaeef89369f458693"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "47222cb6067e4a307d535814917cd98fd0a57b6788ce715755fa2b6c28b56042"
\ No newline at end of file
-- 
2.25.1

