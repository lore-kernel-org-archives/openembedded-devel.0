Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02368C77B75
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 12:51:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.21285.1684846298016250639
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 May 2023 05:51:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=45076e778b=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34N5KFpY012620
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 05:51:37 -0700
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2041.outbound.protection.outlook.com [104.47.51.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qpwqhahf1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 05:51:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oBrgDtcZ0n99lnNsMGOZOM2NNuCjvLsqeyfLcdloaLbdg4xY56EqCFs7TYEZxDSbHbvUcIhbvQ4d2VSmZteCTHI7gNykYl2XILukjcRv9dEXSHTaj4PXO47+FqOtuESr9tkZoX8QDw+FBApmAIkzujkFDMHQ1TWH1JjDKUIq79UV70SmaFExFj3ACJqaZLrUJur6jrKDSsTuPrqwWqQnYpJbEBs2+1vSdjUEJs5WTKqqgPKNNkXuvdD1VObKH+TEzoVMfBmWAVKpV5pVM9z/Qiho2vClnvfPbT6yBhqa77ROkzcOpCSKLlR+y9mB5LCEEtOnblUpf7EiJT+2nrgoxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l2Lp1dzj3q34NxbPy+2VBE40buydFcreDsK6uuF4Cx0=;
 b=dAQMu6/Vw4F11JudMhQnI/gOWqRRsSGyB/asB21x51jzsXJNfk6lxzxbZjOQm0P+In8drhZNrz2+5IGDmK6j6aoZrnyNZ3/GJyzFI1AmS6tLZu0RiZU71vrLfgjlfX5o7EYuivrJbZTQGAq4CseomAKfzpbAEXxTBZUnBrciQ4+9sJPJ3LYIU+YSYglgWaRioVuhydGNL9JQHi1hG59roA6zorko8LQjs793GvtdLLZSlBt0m2FMBsSSFE+c9vJu/DgvcBF/L2O7vDokSM7npR2WHy3eu+vurrPRxrjYYxPoeJwusxmcfebq3AczOUTlWDIBE/FP6ov9FRXHklAcmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from PH7PR11MB5820.namprd11.prod.outlook.com (2603:10b6:510:133::17)
 by IA1PR11MB7387.namprd11.prod.outlook.com (2603:10b6:208:421::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 12:51:33 +0000
Received: from PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::84b2:b711:8939:b703]) by PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::84b2:b711:8939:b703%7]) with mapi id 15.20.6411.027; Tue, 23 May 2023
 12:51:33 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][kirkstone][PATCH 2/2] libbpf: installing uapi headers for native package
Date: Tue, 23 May 2023 20:51:12 +0800
Message-Id: <20230523125112.1570302-2-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230523125112.1570302-1-xiangyu.chen@eng.windriver.com>
References: <20230523125112.1570302-1-xiangyu.chen@eng.windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0199.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::17) To PH7PR11MB5820.namprd11.prod.outlook.com
 (2603:10b6:510:133::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB5820:EE_|IA1PR11MB7387:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d088431-e7f0-49fa-4066-08db5b8c6fc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nmuSt4eXrpyIRGDMSrspbdEd0+a+wTTDTYjrmnWsGpgLBDgshNHZhIiqNR+JDMTzMlVUqN+G8FgzBT3uPg+MHOP9i4uSWf0DA65QX46Si5vDBGPeQYR33rfxLJAGUER8Nif11/SmykWqNIqLTYiOYqCPS3/Tn+zMQTwPbCzzdJm9eZkX4YiZVVfVrb4EYyOX9NdbXMqYZvTNy1PWJGrasnrbQmCwBGBcI03KfD8p195UPnk34ZCMR74gunK/l8E1RcVaBlu6yeou1QAqDgEbryogcb5cnmxT2hoF668/mV8Q3M4GxUQ7s/98D04je0smMHCSAFWhHCJLTkiwV3EC16EamIprMiHfvPzl5+OhMRfnie847O0awfSMEHukpVw/zi9BpcEFTbMKmN3w+bNq+enAxsHjnPpKtP5hwFJL+menJQ/dwOO9tJ4AbWJuJ8OaML88Nsdzh4CnfkyQiHqcMXyNnjiUVpFK1yTBIQeUjnnHMagxFXQ2lrmVMxkA0oyZDSPkFIec8V3kSyOaMQe6CPTqo8F0S4w1GhBHrTmN+eJTuQVH4YP9wd55ZHXGQ3800Gikf7Br522Nr9WDZ0yPUiSruC5zM8uouX15YOlWRVxub90JZxUFbUJRsrXdxj7+
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39840400004)(376002)(346002)(366004)(136003)(396003)(451199021)(6506007)(6512007)(26005)(186003)(1076003)(83170400001)(478600001)(5660300002)(8936002)(8676002)(44832011)(4744005)(2906002)(6916009)(316002)(41300700001)(66946007)(66476007)(66556008)(38100700002)(38350700002)(52116002)(6666004)(6486002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?G7Be3bwuKqGJ9Olwji3QF6LITkUC/5qleKTMn6Si09ZCf6YwGW5vdkeYg4KK?=
 =?us-ascii?Q?PQCa+5BRlrhuOvqXRzKry94GlKq2zwuNE+KKXhZXErDbabjoDzHzYOfYpb3A?=
 =?us-ascii?Q?HJsnKbgifF0JXCbrW826Y/aUlqZo1ycVLYL1BJS80wvWA45KNEL3A60P7qVr?=
 =?us-ascii?Q?FQwZptb4hWABrQvnqoFY9uoxInd+/Vi7D6XZP1DlabQpnAZ0ZRG+44guIstx?=
 =?us-ascii?Q?ne1q9Ooif+e7hQV+hyi/YynsYkydkFuh1PfBoYNd+CkRb4ZZxAbaqOOIWire?=
 =?us-ascii?Q?TwZg4P5wZ/9PEtQtiLcuv9I7EHmxQ6khk4CykfzHQ4qf4ugRt7ah9JOokyvi?=
 =?us-ascii?Q?38IickGyxxpgZS25zvzLOqaBjcZ0Zy2LjD4y7gx5z9bYL7TlwiiUJa0Q7Wv7?=
 =?us-ascii?Q?gId9Aa+ffIT3KMzRSWoo7vJYcRgqJHIPe9LyHNgAY41FFlw8iOzCyhw9yapC?=
 =?us-ascii?Q?e4QEH47kN+J69o2+prR8askhzt10wvK7t7pHytmD8D8LTEK3ckWnqjVquqUS?=
 =?us-ascii?Q?kgRnR2tj4oHIEUERRl/zTeulBy018taZ91GO2roxGa/L+Iob+1sRkhalbUfr?=
 =?us-ascii?Q?5drpzaNd8/8JZgBR/F1cg1qZQAbGD5rQSY3TWQcShQ9GZSHIzgu+/Ax6PfSB?=
 =?us-ascii?Q?b2sGSJT4WQpe7RfDVnxx+GGI3jstVs5KG7Ovkut7r/VCNm4OaXsa6YSnRAbn?=
 =?us-ascii?Q?R3eNoZ/QqlJYINxgDrxVe4fyL5tpsm1pE13h3q37k120VH2sZhiVNMgQo7HZ?=
 =?us-ascii?Q?xuCE2wXcwYuK+GDWI31MKctnZ4sGoiTZXpFQl2fdjzsXGOk9MxamhT+jrip5?=
 =?us-ascii?Q?QtCoE0RQNVP3kmGPwRR0qX5cprGgceRwSNrsev18BsbxBmmNq0znU84OuAFU?=
 =?us-ascii?Q?tIMeG1DFTpUwCGeOMoEaCQfNW+Kg5+yGzK4Dfsr6cuqYQaNqLRfwHDkQCfb3?=
 =?us-ascii?Q?C+GTnMc3wIjnn0iln3ymESVynTqEhKtSvI3aIaSA7bT9onjLekinpcRDc9xl?=
 =?us-ascii?Q?QlEajtuZAf0lrVsFDE5gGK7QLgoemhwm6XhMZqFJXZGwp7CxQxcdjh3o1Yhg?=
 =?us-ascii?Q?xD9F/Wzs3maFFP1Z1/I8p/6L8k/3q+A1bUBVYS5nVVp+df044FMwDO0ahCkD?=
 =?us-ascii?Q?AKEQlaiLYRzbu3QhPwEpwmehioBwZ1L9WnfR5/ySy9faitb/gfPbueu3bBys?=
 =?us-ascii?Q?hB0/BNGIk+mWw0P60yyrvQCpctuf00RzX2calbOdEy213v4hEeWaHlb8xKs2?=
 =?us-ascii?Q?HGwrTGpDSyw/MxZBR6pg9TiKNka1rgBHXR52G9OKwTS/PsA+NQMw9AeS6r9n?=
 =?us-ascii?Q?eqLZW5D612LgJBdoZIRz9iLLUN0JhYlyIPjQfmzVFVOnr0zVs6s0I9LJJ0o1?=
 =?us-ascii?Q?E6AF8R0mezzqmQd/mv7PS+iaRHZ8aGWkfZO/XOEvpfXM3tprf46gXY50cKtg?=
 =?us-ascii?Q?aShwgKoCisid+ZyeYFLzVdzTwgxxEsbzf+jNJdngJA6Kw+VwTbn4nh7wj3Ge?=
 =?us-ascii?Q?2gXa1MmMH2a1J8/eXVOangzvARZCu/VDSRejfqjbCwuRVNQQri2I/apztMB+?=
 =?us-ascii?Q?whBPhhK1v9/CLz8sybWgr8knjMwGhS2Prq6wswI3+zGN3rktRXC8RhDHzSDj?=
 =?us-ascii?Q?Ag=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d088431-e7f0-49fa-4066-08db5b8c6fc3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 12:51:33.4853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1dkd+xi7Gr0xKlfD/dLtj+71gNfpozuFXuBIEj7Y0J/dbeSJOvCU2zami9FPEpgPTbZh8kO6PjRp1OR1SPEEDX17pGROujZT+lwxSt9M9HI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7387
X-Proofpoint-GUID: ofaY4FgGRDEd5iMozOoo2FGvzH84xpwM
X-Proofpoint-ORIG-GUID: ofaY4FgGRDEd5iMozOoo2FGvzH84xpwM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-23_08,2023-05-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 adultscore=0 spamscore=0 impostorscore=0 mlxlogscore=758
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305230101
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 12:51:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102737

From: Xiangyu Chen <xiangyu.chen@windriver.com>

using libbpf-native provided headers for pahole-native or other application.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 meta-oe/recipes-kernel/libbpf/libbpf_0.7.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-kernel/libbpf/libbpf_0.7.0.bb b/meta-oe/recipes-kernel/libbpf/libbpf_0.7.0.bb
index 4df920f7a..5f687b27b 100644
--- a/meta-oe/recipes-kernel/libbpf/libbpf_0.7.0.bb
+++ b/meta-oe/recipes-kernel/libbpf/libbpf_0.7.0.bb
@@ -17,6 +17,7 @@ COMPATIBLE_HOST = "(x86_64|i.86|aarch64|riscv64|powerpc64).*-linux"
 S = "${WORKDIR}/git/src"
 
 EXTRA_OEMAKE += "DESTDIR=${D} LIBDIR=${libdir} INCLUDEDIR=${includedir}"
+EXTRA_OEMAKE:append:class-native = " UAPIDIR=${includedir}"
 
 inherit pkgconfig
 
@@ -28,4 +29,8 @@ do_install() {
 	oe_runmake install
 }
 
+do_install:append:class-native() {
+	oe_runmake install_uapi_headers
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


