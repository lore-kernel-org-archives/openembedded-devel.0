Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0886BC636CD
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 09:41:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8544.1675158080680662482
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Jan 2023 01:41:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=hYyRBy/F;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1395aa4004=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30V9OBPP005198
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 01:41:20 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=2ZcMzhwwtaE2XaNDYXQXp+HFw+t+ddZe2uH9rvsn9hU=;
 b=hYyRBy/FiPCLTzjHFRNGQB/h5b/swACh1nGYud/UXppwximHWsJPonJDWREQr0TNA7Va
 qDSCqGgMMI3MnYjrnTjXxU5YqsNfNadl4FaT0WYoC8AMyMus4JdIZvJ9yKkLABn4XvD9
 9UTNIKxdHo47kLAMSRfCk5q18X/awF/4haUGyKsKrVwnNt+O+xvd7YAJSYgp7mC/ua3G
 yq3jpr1pLQbBbUvi6rVngeEGCSAh2NIfm0PjiYjh1ZpXGmLq+eDeyhzoCgkSZvEElNZU
 7YUVDSXJsIQd4PM3C3RkE81IKBuxexdNtwiecqNsfsi072UUeEkEE63OMG0fEgQn3QJk Ow== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ncyv8avr1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 01:41:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=COKNbt0ALtmKkoPflx20fmRkR/G6GBNGpAjutNsSXg8p8r8+tKydKhzU3jy18wrZRLC1x4PCKUp1Xf0+L0rvshczXariE0zguZqEskFV7pKGafvQImE4FqGAzvfrv3L5cVyXVU877nK7i/pHiB+Z02bu7XyXow5jp0dPUpnvyIdXU/EeGQRIfMjSPAe+RgJCX9k3lJUlTVCst9MsZAZUjePwT4P/SZAdhiIBuVuvzWM+zRA0+D3cwOpdQW1QW4XNKtjnjNrNYI/T7VBveF5FiM5yyScXw2RXhMmSXTO5K0UUjYfcOWFZPIg2jAG3t9aR5+RFrUUURtQaooYUEvV3Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ZcMzhwwtaE2XaNDYXQXp+HFw+t+ddZe2uH9rvsn9hU=;
 b=Qq46vuQQM+LpnlWZaAmEG+TeVcIoe9U2L9aZhnVEzKcm22XM57dpST5Duwr3ZQ/RnoQSC1Bh07qvQ79ubVn0fEXM0tPBy1v7eC0f9ZhM/a4wMj/xGoUhuKsKAMIeT/kDACiCo4wDQlDp14qXiDCWgkXRfmy7Ez3gWUTPpinCJD4FGxtrrrO5MxfR4fhh9R/+Axy/uvdRJter/mqxiHia993hs2gZBQ+K24Rg1mYR5Y2RdkP0C8q5IyA7D2lFyS/4pkjSqh8cBRM3Elq3zjtt3g5y3/tM0GKKj6afT5KhyZA66PbFnFvx8RmMU+GkuaWaTTBKmwvL88u/wLUtuvECVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS0PR11MB8071.namprd11.prod.outlook.com (2603:10b6:8:12e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Tue, 31 Jan
 2023 09:41:17 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::3b28:4c3d:1225:fff7]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::3b28:4c3d:1225:fff7%3]) with mapi id 15.20.6043.023; Tue, 31 Jan 2023
 09:41:17 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] syslog-ng: workaround segfault for ppc64le
Date: Tue, 31 Jan 2023 17:41:02 +0800
Message-Id: <20230131094102.19912-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0020.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::33) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS0PR11MB8071:EE_
X-MS-Office365-Filtering-Correlation-Id: 63eb80ec-6465-49e4-f1fb-08db036f4d0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+2KFvV0q82NBwzTx3Sd21PUkTGNxNnFfyhxoYeImwq2QPJVUEHHiM7iKidUYl5sDtbCQZ4RQc9NYl6OIYeFG/csn6DUNgx+aFEc3oxaJp9VnrMt5uOlOZ8XUQMphRiVlQ4qLVRiOSIqP28zMjlS4BfCi7lELuXARKMExV27GW8cKTeGbD0Av1HdDMlsHxwQfMu03fUmpz0/K1CzWEgges5ZxwsgA4MRIul+qyj7tOkkKJS3nHoVFHzLby3jdbO7PrBIK+SEM4apoWi5gXS5DuRBaemrzicMXiM+1ce2HaK9/J78rjLaEc5zntIMCA2V71RK8RmeGzJ/f1E4HXDNmZ9JS+ukq04ooKKIbLOI0wOjj7eT1R0t2xGo/kYGllxVIYGATlZLcK1v54ihlFEcNwq8pw26gcy9NlYyt+dM4tiuAUtPYvSkEAFCxBpN4G2os8SfIpbO39cGHZ5Uzc8jtSRc52TlTroDajO/a3lsU+QkyGdFYfZ+Gtw77cftGmWeHPLBMk5rwt/ZXZNVRKvwlXImCTsXpiBsA4h6/89QbVmfTB95rRnBICKqGPvTTR2SGic/WrPIo8fQ1mWwsSKzyyUkWQjYJoxyVYTK7hDGb3PiF0R64edNBFzaCgnN1kt7Kyk3jTb8w7L9oubvEu+qKlsgs/zuz/780Kkx35v2AKUXkCmxnFfKLaHF2YzQEHCu7rcxC7rd5oSSGypeatYhNq7M3Hl5P6JvHrWZc2H0L5+uMh74frME9Hzb8SWFCoLGJACpggShG/Y2s6PUUsdJQFA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(396003)(39850400004)(346002)(376002)(136003)(451199018)(86362001)(66556008)(38100700002)(38350700002)(36756003)(5660300002)(316002)(8676002)(66476007)(8936002)(66946007)(6916009)(2906002)(41300700001)(83380400001)(2616005)(6486002)(478600001)(52116002)(6506007)(26005)(6666004)(186003)(6512007)(1076003)(966005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6rXUbncTesP5n088Uu1qVzi9pKs82lOC8yUOjaCF0HwV45dU3RVlt35QVkrk?=
 =?us-ascii?Q?1c4QAc1i3vtb+QC0muxmi9u6wCOpheoDR6WHwU5mqa6iZOMGjDIqWznNXCbK?=
 =?us-ascii?Q?8DJG3ovyxiWeYegviV80rACQCv5Tzf9IN8JcBvkUtyDt5koWHsREUyq10PtD?=
 =?us-ascii?Q?3kFJmP9K/dJ9iQ01DVFOiCcnqS+C/SAk0OLJQQ23VZznmyeSGVirH6CmuByM?=
 =?us-ascii?Q?MYTGqE2kl9jMVFkZUDW38db+jUpVe2e43C456h1VOoeBiqfdVrTo2SfwcA2r?=
 =?us-ascii?Q?gNedXeoaY9NVSuGOIPpkrZ2roR4aKg9kvLQqsCKuveyYbEOEg3ZSPpq6E1Bl?=
 =?us-ascii?Q?ptbP5LCIX/Q5RmsHWAd2rhVMXnBax618IWwLW3n00wr81x6v3nukE4DWTeG7?=
 =?us-ascii?Q?MKReyu7Td5rYbi/Td8FzYE0UtxXBieAiSpS4Xp7RnkYuxh2Zmi2+JdUpqb//?=
 =?us-ascii?Q?HikCBG/WsptaqVWFh9ctc4f0b+7SkuwgnomCyYk03Nvy3Dk9j629NL1MO2DK?=
 =?us-ascii?Q?RTefCn/Art+IL4FwLFViRQ8AbxkN4qlEJrb6uRIR0dhZmY0W+COONZnqlc5o?=
 =?us-ascii?Q?el1j5f1qB+bB8DAORqxFv6X9RvGAIHCzkYLnq08gyqV8L3BDoJOmOX0yxOo7?=
 =?us-ascii?Q?RunTtwS245iCiQVMAuLX3lDBtflT15Pyo9tw3yutxQRxO71OlAnxY1/G1FgI?=
 =?us-ascii?Q?+AV6Sj9+aoZ91PQS0IN+yV6CNLSxWyHhKtKkKobqvffuRQUrzTEbmaRwK9Cv?=
 =?us-ascii?Q?CDFSVxACDCn6IfPuuCmL/+13Le8BbUSlUe5DM39MtU2bpSUBKzbpcj+16i/P?=
 =?us-ascii?Q?PIPXOV9kRNIyYjhVl9tR5M4oOMfCgLD+BFFgMwqISEEYTsaD+bKH94uEj9qo?=
 =?us-ascii?Q?JikVnpxGAiJ8djUkTc0/60S5HAOeoDHsQ52Mya3jE+p2Huz5RzaN7uLMV4sj?=
 =?us-ascii?Q?rbDb3OVlbaPATAl09ggiMcRTBrj29OqIV1rJIA68YdpDMz3yUexNevchfuwI?=
 =?us-ascii?Q?RMS08EA0kO2w1G/1r5hGVwR9MlQSUBRQImh5GAc0oLKRbx8GVhdUs90O3uEG?=
 =?us-ascii?Q?8c/SqYX6gaC1eQSRbbjYOmI9mFjI40x8MN8PwK2m6ZUOR4OdeVomKTg9Z2tA?=
 =?us-ascii?Q?KX9+94rhy/1rXfIiigLM7SeMt4/TI2PahntI4D4prehRkxciF9WeTyTTpTj6?=
 =?us-ascii?Q?xPI//9dDm9HAdyqzFifkLFENAPgUy7EiHnPIyNCIrIF5jFuZ+mUJAVmHnFig?=
 =?us-ascii?Q?S3Z/8tHIKKoxu9CTbCU7l0e1RXf8/q71OVWz2l0Qp5r9Feq+eXjoVP/Dll9y?=
 =?us-ascii?Q?hehHOu7FlEioUw7fr7QfbnZqPdDJATwR7b6Gu/LNgLaT1PW3ZBaU6NyxrTkj?=
 =?us-ascii?Q?PtltAvE8ACsWfJpNX2hnFPHJhnePyPXExoFKNeEseiMbH4V8TBnKOIiOOoaT?=
 =?us-ascii?Q?46rEyVIL0Hlx8QXnw9Tw6gsPM0hEARJL3oFgpN4ykXFqdXUD5MYbOqOLeXS/?=
 =?us-ascii?Q?VfVk3ysYJ1NwoctkLBx7ZZlxWPtgCWQA0ZBTnvBo+YM6jllvh3d1wFffhbnH?=
 =?us-ascii?Q?uDF2McP2Wy4C6wdSEhxMa8l5skNqMDkZlZZm0NnV?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63eb80ec-6465-49e4-f1fb-08db036f4d0a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 09:41:17.6092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cgQGmN8Vla06XERhx9TQ4zh1bT99lGy51MJ7rE9WhiV5HSHbJ3crCHYzZI/H1+i8BMY/qQou5DZ/zscQnxp8nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8071
X-Proofpoint-GUID: iDLHVdLbW9Dro5jshVXyeJ15T7h0104D
X-Proofpoint-ORIG-GUID: iDLHVdLbW9Dro5jshVXyeJ15T7h0104D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_04,2023-01-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1011 mlxscore=0 malwarescore=0 phishscore=0
 mlxlogscore=983 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301310085
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 09:41:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100872

For now syslog-ng segfaults on ppc64le. The problem could be reproduced
by simply adding syslog-ng to IMAGE_INSTALL and then building and starting
an image for qemuppc64.

The underlying root cause is hard to find. This workaround helps improve
the situation a little bit so that users can at least use syslog-ng on
ppc64le targets.

Note that this workaround should be dropped once the upstream issue gets
a real fix: https://github.com/syslog-ng/syslog-ng/issues/4285

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...rkaround-powerpc64le-segfaults-error.patch | 45 +++++++++++++++++++
 .../syslog-ng/syslog-ng_3.38.1.bb             |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/0001-plugin.c-workaround-powerpc64le-segfaults-error.patch

diff --git a/meta-oe/recipes-support/syslog-ng/files/0001-plugin.c-workaround-powerpc64le-segfaults-error.patch b/meta-oe/recipes-support/syslog-ng/files/0001-plugin.c-workaround-powerpc64le-segfaults-error.patch
new file mode 100644
index 000000000..ca73f69b9
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/0001-plugin.c-workaround-powerpc64le-segfaults-error.patch
@@ -0,0 +1,45 @@
+From 616446afab61ab98b28c81605e2efd4a689f37d1 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Fri, 20 Jan 2023 14:59:14 +0800
+Subject: [PATCH] plugin.c: workaround powerpc64le segfaults error
+
+syslog-ng segfaults on powerpc64le, workaround this error.
+See https://github.com/syslog-ng/syslog-ng/issues/4285 for more details.
+This patch should be dropped once the above issue gets a real fix.
+
+Upstream-Status: Inappropriate [OE Specific]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ lib/plugin.c | 8 ++------
+ 1 file changed, 2 insertions(+), 6 deletions(-)
+
+diff --git a/lib/plugin.c b/lib/plugin.c
+index fbbfb92..3a03617 100644
+--- a/lib/plugin.c
++++ b/lib/plugin.c
+@@ -528,10 +528,7 @@ plugin_discover_candidate_modules(PluginContext *context)
+                     }
+                 }
+               g_free(module_name);
+-              if (mod)
+-                g_module_close(mod);
+-              else
+-                mod = NULL;
++              mod = NULL;
+             }
+         }
+       g_dir_close(dir);
+@@ -663,8 +660,7 @@ plugin_list_modules(FILE *out, gboolean verbose)
+                   first = FALSE;
+                 }
+               g_free(module_name);
+-              if (mod)
+-                g_module_close(mod);
++              mod = NULL;
+             }
+         }
+       g_dir_close(dir);
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.38.1.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.38.1.bb
index 76945095a..182a253d3 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.38.1.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.38.1.bb
@@ -23,6 +23,7 @@ SRC_URI = "https://github.com/balabit/syslog-ng/releases/download/${BP}/${BP}.ta
            file://syslog-ng-tmp.conf \
            file://syslog-ng.service-the-syslog-ng-service.patch \
 "
+SRC_URI:append:powerpc64le = " file://0001-plugin.c-workaround-powerpc64le-segfaults-error.patch"
 
 SRC_URI[sha256sum] = "5491f686d0b829b69b2e0fc0d66a62f51991aafaee005475bfa38fab399441f7"
 
-- 
2.17.1


