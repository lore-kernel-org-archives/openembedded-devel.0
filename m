Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89E73EB64D9
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 05:58:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6781.1687845484113660040
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jun 2023 22:58:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=TcosSVY/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=55421881fb=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35R5oupj016654
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jun 2023 22:58:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=gkyPZKzFbd69GZGGd7pjhZWIZ14kDK44zg8RxIymGok=; b=
	TcosSVY/HksizaPSFAndSTq+bOQ69Czui1JVTxNlpA4ru5OzdLESjsJ1ggQBBU9Q
	apEP8SdMrK7EhteBOjAFcpDVpazGrK/m2UrOaN4Qyg/sVuihGDxZqfAQYHAxQGiL
	4G15LFtMEGrOQMnD1njMSqffKPcuvRcUnIdqJ37D94M+L012aDpfVjUsP0iMjAIM
	UzpUWmvHA3b05Dl+why0R9kGC6DIhNy1o/Pxf4v+XJF7DcCTBk3R1UJxhpNC7/la
	0gMpPgJGFrW1HjEDW2Drb9J12BjGVyLTooDEfvHXFyVOmuKumu27ZXqUzP7ZEjjK
	zyy+RPMQ+YJnT260x00euQ==
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2049.outbound.protection.outlook.com [104.47.51.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rdurxtbcb-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jun 2023 22:58:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CR3/VQfxdfd2qbHwL94DCb/GybmESyUOCE5x6cuEj/YrQeMHLKXBG5eO1Tty26PJ7C40AKaBlP9gq7xtqBL5HrZR/9isnVeOX/Q2ygZmBzdmI0CL0agOHB8arP0WFVdtsg5jVVu7QIfTRHMr71sy6Mf+xqsAahvGrUU43JF9lOOLFIdC08lYZt0CkMZZhS/v27qzwUiLHs4pcwcL60D1RhSzJpGfavZcP5hpcbbMFalBpMpJHprZ4HC1wnvT+y1tpdm6O1zVoKIMUmbaWaPdJHbJ5bBncLIRRYZpAQ8aZ5+qc3YSrhliwYSyu0STmLeYIAPb1EPz2rmzYf3IURZxhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gkyPZKzFbd69GZGGd7pjhZWIZ14kDK44zg8RxIymGok=;
 b=Sn18einR8NbFC+W4bSwSo/Z6zV5PYhiplnWcjWzsONWOePyQjGeMZ0RWpY8QnEt31WosDZqb4u/dJdCJw+b65ww5/SzmLQEc1MonzXMPYdiPz71y5aJt73YfaeA48dJ2/i2YXtZIM1htkhvMuY+RX4gdHBW2uvyOG+gRv0WrkjG04GVCfbRktR27BcdpwSKxKmrkcXgX2be36PsDU/4ThV2XNUFzqyIQf0RgvKR0qm6O3i+jpnbg2SCn4lCu1+iX5JpN4ytsnQHswtJHn3WiP9BKlXTo86GE2h27Gz/xA/qONI8eFkA1nc+ytH8YNSwRIKdS4zD0USMA6B8Q27kSLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by DM4PR11MB5328.namprd11.prod.outlook.com (2603:10b6:5:393::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Tue, 27 Jun
 2023 05:58:01 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::60cd:a296:6dfd:e0c9]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::60cd:a296:6dfd:e0c9%7]) with mapi id 15.20.6521.024; Tue, 27 Jun 2023
 05:58:01 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/2] conntrack-tools: add required kernel modules to RRECOMMENDS
Date: Tue, 27 Jun 2023 13:57:48 +0800
Message-Id: <20230627055748.1327207-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230627055748.1327207-1-yi.zhao@windriver.com>
References: <20230627055748.1327207-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR04CA0003.apcprd04.prod.outlook.com
 (2603:1096:404:f6::15) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|DM4PR11MB5328:EE_
X-MS-Office365-Filtering-Correlation-Id: d5b80e1c-893e-463a-9c39-08db76d376e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NbX9uRZ1sa9Yun18T984A4b3tjIhM8u7c9t0Ab+dfdCOq2PTPGcpt8ZCu7wBCRO2biXARB2gZi8kt3QZCBdLifIbWH4Powpp06pegOSELkz+aXMbNbdHuT1cxLYxRkkacwwLCZ90D8bJgSPx0ttszH/nmpz0vLQgvkX4LheEsen/nkpe1v19NDkkTObVMOxfY5yNPyc6WIc2fY6eoDe3ejLQ470u+oEuCDZI+UB+Omqi6A6EqzrkYsz2Qy7jBlVCgiNbEzUlYk8KRjK6y42NQd8YUZiPliFKyrus+cv/F4uQ/M6xAkzEjfTG+mVkjth+3jRXn0CVa1sbF5H0tdjHNPxBdInt7eeh2TRXgHUSZCzybiGH2rV+iR8yu/TmlVZL0r4uVdJe1s9iz/eO4lzWkzXz9Cam/VxvaUqlOrZs278uo2VFA38S53FwUMrwuoNqYtTIAH1tyP9Vr2+tjT5yBlFVQvcz7YeRSDPwWeWqY2OsVJXcFEsiSS2oib8K4ma0PCisUVsxKNKmOWNCO1qN7NJ02Sorba9ag8zSEuz31R7ltrfI6mLYkx5YgNkBt0g8ZS+1DFepq1EKMt3KyfiOIl2EiB7PiCrke5HVm0Qy5uk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39850400004)(396003)(376002)(366004)(136003)(451199021)(36756003)(6506007)(66476007)(5660300002)(44832011)(316002)(86362001)(6916009)(41300700001)(8936002)(8676002)(66556008)(38350700002)(66946007)(38100700002)(6486002)(966005)(1076003)(26005)(6512007)(2906002)(4744005)(186003)(52116002)(478600001)(83380400001)(2616005)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?f3jl0Cd1ov4lvGQmYjH+eo5i/ke0w1h2adgeG4fKHfoapdB4zFkkGFgw3xFe?=
 =?us-ascii?Q?l8O/T3uafSfkW+trIdYnhPTGCsrpV0X2RMQ0RMzmDbuwvp/8s7bGihohq9qW?=
 =?us-ascii?Q?bKJx6dFlwwdib2G8XpUE0sOPT42Gpbfns4GZKjps+UTkkXMN1FYBgH+DRgvE?=
 =?us-ascii?Q?FFf8MffbtHvLX80NV62QcjRXparzkWQlBMx1o5gFT3fIbeLpw7cT2PtD/HRZ?=
 =?us-ascii?Q?5OEAgODbW5dDqCSh54D9kNezqlG1fSq4iTzicQcsLddlf0+4PJqlAJJuKd88?=
 =?us-ascii?Q?UTfSn97UQvz4wEwSxOdXqZruMQY7WQxuOhIRZZ0rMvn+iXDvARash/AR3305?=
 =?us-ascii?Q?oIV/jOpuKfyUHv0nER5xeAWIap02DtpFpMg7YvveqCVvEj6bcvdcvmZyFVkA?=
 =?us-ascii?Q?83IRBBg9/Sny8+9flRyXj3JDIi1kyI32qS1KtNeN4BYtNsJkm3MUs4WOXvU4?=
 =?us-ascii?Q?co5+yHsutfRAbKb0qzu4sS3MzcCyU1cWSxiJiqNLGwN2UP9QDgTHPV7VN0Of?=
 =?us-ascii?Q?6b8eNTRWw0UUYtPmQk2EAWqLy3b5xECAauT64n38rcPi0V7qHoehlBmOw4yf?=
 =?us-ascii?Q?wW79WBiJGCIOeQPU48bO+3zNOxF7s6midzvaEbLbXxAeTpnXbTu2y7qCvcvE?=
 =?us-ascii?Q?SuX7mNbhweYXkceidWm25/rKPzihaWFOOyBns+urgOsUkHE+Oa6krBQ0HWiI?=
 =?us-ascii?Q?uyZVp5z8SiIw53H3h8zZCCuRGQCnBbLkf5fTuVJLrHnrB5lgncz3nHtqgj+b?=
 =?us-ascii?Q?hImvOfQuQjloAy2BmA7hcAeznC5IapzJU0pMzfkjTtfGQyWs6uc35p6enwfz?=
 =?us-ascii?Q?LNy3hRp3wNKAUSu9A0naDCxmrjVzXRqbHLVbkumoMUuRTqn5zfPV1fr8hbZH?=
 =?us-ascii?Q?1XqqEFqyg8q/KyGaPZsPldiV0biDNTkGWbW2isskFtGKkQRcLl4QnU3prPK0?=
 =?us-ascii?Q?Dc5o7/UzFIqflTzdMq/bCWXw//1V8zsSUdZmpg62Gyx45nJJvebeqS4emm/R?=
 =?us-ascii?Q?IMAZ4IdUHlj46c0trFoInK/MZ96XzLz7c9Pt+axYcNhx6ljzhSFjqeMrBL5V?=
 =?us-ascii?Q?b5Yk7Tya4vObOlf16QruX4tkD7DOK6xrqxxGJyrdz1e+FpkbuKmmqaJuG7Bf?=
 =?us-ascii?Q?C4rLET1mLSovb/kPV6PMrPySl0Hnhu0h3+Z4U846O88XQo1YdbUfZgeKjpOD?=
 =?us-ascii?Q?pUuwuXenWhbIbOTWdTA9GCHkcfQNoc9GW0kCUdtvVQaJgC9hbZoYQfMelgaj?=
 =?us-ascii?Q?XIuZ/nJcdgZMnTfQvwUn7X4AkioAR+e1otwD19aw9XnYgNxDxzf2u7QQirEE?=
 =?us-ascii?Q?dO+H8Ki4HPqKQQp5qXSYTlKwYMljEGyEoSw2cmCMqI3mFBtbzHk9vU3U/VMy?=
 =?us-ascii?Q?f3HYzbJwH2I/OJa0gkVukn2ntMVa4WjGBKEts/lAns5aE87MBbP0vAbW6uwE?=
 =?us-ascii?Q?Wo9mpXYpM+OHLITi88O5WjDKNrgRGAi5zelIDm8bq0ncTN4gJP889CtfdPu3?=
 =?us-ascii?Q?K2Stm4BJqYFL6XftwiEyGeMHGAaU4mjmAjIT4RKigHuFzNybp9W1/hUdtniX?=
 =?us-ascii?Q?buo5FH1epVXtN898S92eRyZhyUeWLTF3GLu3nGve?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5b80e1c-893e-463a-9c39-08db76d376e7
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2023 05:58:01.0203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LzOZTeErkIZExlAn63FasDLobUrfpFYWzg4Y+X6BYD+npH6mPL3hsN0/J9L37DAfTEB9PFL+lH30EDw+bm7ezA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5328
X-Proofpoint-ORIG-GUID: 0PdwvR1NWO0c_cVqj6jbd11NJbJdZFzv
X-Proofpoint-GUID: 0PdwvR1NWO0c_cVqj6jbd11NJbJdZFzv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-27_02,2023-06-26_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 mlxlogscore=740 lowpriorityscore=0
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306270056
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 05:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103592

Refer to https://git.netfilter.org/conntrack-tools/tree/INSTALL, add
required kernel modules to RRECOMMENDS.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-filter/conntrack-tools/conntrack-tools_1.4.7.bb   | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.7.bb b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.7.bb
index 0d1100ddd..0c6fd90d3 100644
--- a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.7.bb
+++ b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.7.bb
@@ -54,3 +54,7 @@ pkg_postinst:${PN} () {
 	setcap cap_net_admin+ep "$D/${sbindir}/conntrack"
 }
 PACKAGE_WRITE_DEPS += "libcap-native"
+
+RRECOMMENDS:${PN} = "kernel-module-nf-conntrack kernel-module-nfnetlink \
+                     kernel-module-nf-conntrack-netlink \
+                    "
-- 
2.25.1


