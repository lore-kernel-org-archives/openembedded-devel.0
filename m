Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7DD6C38142
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 09:43:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.8350.1675158185545733945
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Jan 2023 01:43:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ZN5g2RVD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1395aa4004=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30V8RpWt003721
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 01:43:05 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=++3qckxg53SrH4sJSXOzIrxLujzKwyyZDdopsWv+HB8=;
 b=ZN5g2RVDvEiMxf6kaXLdS2BuCwkYY1ngvK6Ozfy2kITtsXb2PuEGJ/E5KFVlwGcKA61n
 YuDI6zQFjT5BXCHff4B7V/0b8ddcHgA589Asyh17lfLcs1rni43Q996D2eNlwTyYV9oW
 FDQKqqEaK0bNQOCMHbxAkYI1SyfJXIZ8c9Co0oDYHNKiYT+rxow+vKiYP0BulJnmaoVU
 H3OI8k3oBlY/gWbtORX6IemptJ19We6/CCTasW3m0ycL/74F9LGib5SXEZKlrwc75KV3
 yqsK7YAccTZ+gQlz+i+OxEHMdk4XGL/Y4WyO3CJNvycPz692lmZcOHVQ513q3mWYJtMm vQ== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ncyv8avt2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 01:43:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IavUIIeo7eeKllKTmlmwo6oOa3S1ztYokIZa5NAS0XZ2m1HxC/NzH3CiQxQZHps34qUEgTwu9VDGSQ0fr3Wy0bnna+Q+b21GyjtVgDAU9Sh3/FhmyR+DcYh7j4nUskgKMOVyrAoWt4F+rr4sDCIlFtQLeiWKYVF3Qf/4EcaFFsvI1gR543sEq1124tiztmRPpivwzitw9ZYZTwS2Ax74T8duEBqe+pePFzUKLkFntAJACflgNvkVZNWen4WV5ipr+NwcJLAG4mW82KUyePL7hinkm/fVQJFXbe0dva3IYhuLMpdJPMHyMcdmgxRDd6lzttZbOsR97/e0ehp80A+whg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=++3qckxg53SrH4sJSXOzIrxLujzKwyyZDdopsWv+HB8=;
 b=FDgrKRLpMFfY5NjH6E5SDG5A1SKhJfXKQPr5T7QskZWtoz+hHLg870TB6uvpheTjaQUHyGsLZDYttlzLB08XUr72A5cozx9RKLqBmRMrdf5H4xWlKgsigMng5oMD2t66rlWRuwOXTgJJB9FQWBpDNB/5JVC7jawmK4lmWLKvYRdrDJJOdXWUsJjrUWjELC2npQNcCg+5rZOt+t3hzeljbbOuowd59CLBXm2iAIrYZnf9h+hQwEhbGCDG5cvxOgWrjaeDBNTYnUadgQ8ThWWkjaEoq/i/KPNjMWOS75AoutE/SD7MwxEzadQq2CVqpe6j6WYO8V0yp64ByqdPtGCjfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH0PR11MB5806.namprd11.prod.outlook.com (2603:10b6:510:14b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.30; Tue, 31 Jan
 2023 09:42:59 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::3b28:4c3d:1225:fff7]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::3b28:4c3d:1225:fff7%3]) with mapi id 15.20.6043.023; Tue, 31 Jan 2023
 09:42:58 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH V2] syslog-ng: workaround segfault for ppc64le
Date: Tue, 31 Jan 2023 17:42:45 +0800
Message-Id: <20230131094245.17207-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0167.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::22) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH0PR11MB5806:EE_
X-MS-Office365-Filtering-Correlation-Id: fbdab2d8-e7d3-4262-efd1-08db036f8957
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0YMX2+l50jFQomIRA2ycWqF7sgUQRrhlg7c6l+NwdGI4WNYNGWliC+Si/TbRClwIHebIKBE218FBDW85Ry5NjEfRW9Ljb5xVm//Mavee63CkR2M4CkmURTZ4EseW0rMHqaEQHL94RFZkWclG7KEuZOicwFrRIbvVYSAInquB9kUfnOm7vtdATji0YMjFVdgX9Ae5amg5fY9duK5vrCstZJ0jIhHZABmOAwTGtCz7SBCOS1GHMINUMAi7G/Ou80BWYJWN1a3qHw3QrZ9GzTzZZdrZinej0/Gr9+7bg501BnwyMhq6oRwY7QeWPaYcugIihhQY3TdEURfeDXdSDVgtUlqbsd4Mbsvui6HopjjDxDdVQSejVuGgyLRJMZXVn8QlGPjLE1aknxZolyqM4kDHq27dUBzF/PUek+HO6FBVJqVgio6TCfYASKD7V/aonDmCQ+INJTcKWH8+pDuLzfSF9aQIC8gJYVRuXYWpGnO72r1pQ3wQX0rokvT2lFKnlKF+vuCUpDSWjUAyKNrLcvkOmk3LEnxIqcPN595T9UX06FRGzXd9eayUzjPFETqlAVd/zE3vHqiA28kV2VNY/aYNyxuGx0XjzxNLLVJFv+AlZjcFQiSt0COPDWI5mRz/HqB/qGF+XLt6I76JZ/4HyVxPp8+UVixrsY0qFuhrnA5DrPpfVCXGW9plzZSG7gk7q3BG/bejorRY7uNP5UIpKbbxtmc+iFPzKLhP4TX8jxBvr4Bc3MSJmWFZuM92i22NAuuLKhLhX+2k73zSnuIrngVMnA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(396003)(366004)(346002)(39840400004)(451199018)(2906002)(36756003)(5660300002)(38100700002)(38350700002)(52116002)(2616005)(6486002)(966005)(478600001)(6506007)(26005)(1076003)(186003)(83380400001)(86362001)(6512007)(316002)(66946007)(66476007)(6666004)(6916009)(8676002)(66556008)(41300700001)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?e+5S6fFaNP6QofUE0fq0jHJ/QpHFAeNBgLg2weDkL0FxaZmkVjLo4/mdLOct?=
 =?us-ascii?Q?xoHSwkrvj2axlaJsZg3UZaD1nMnfyTcCV8y6OtdgERYUmu6NdAZoRNae0Zfr?=
 =?us-ascii?Q?clyEQnpQfeMfn6XWCwizajBqXmTJC0+AyyBbrcGJVlWQ9QEYKCyiJDvfGkbp?=
 =?us-ascii?Q?jcY2IuS0tivjAyjWFIXskiTOxfm5yyoi/JlxWk0ZnYXDD8HSpNbOVT5zrp3J?=
 =?us-ascii?Q?rNKJb12gXRhwDJpIdsytiv67koWZcLx77W4Sdk61fOQT07EN3CGpWlEs87V9?=
 =?us-ascii?Q?IDZ+r7gLOdi9eh+3c079LgCwawyqp/q46i+YM7/QUnoPmbvOjtdQsXFjKTY2?=
 =?us-ascii?Q?nV/JMTolbH8lGYgxRjCQJWBrAqsim4pkUBamZFrxrdX0euKWAEeDca1zdG+W?=
 =?us-ascii?Q?BuCdGrB3KZQU1QnoBlxDgGU06zyxm0G5GOM/8Vp6ek3iXjViN3sugImK96NW?=
 =?us-ascii?Q?j/5H+TL0F/XaQyJ2+d4X0LoUKIWYKb5P88zB7eheMbR1MVDNpQYcxkmB1xAA?=
 =?us-ascii?Q?q3MPaSekRy4ax0JxVyW8+N6NDnalwgMlBBmd0z8qUEW74w4hxzmUf4TkbGrl?=
 =?us-ascii?Q?uE3UHZHeUF47/tgkeBPbobiQoQXqSqiS6LQ5zJr3H5P0iBYJaYrLdkKhQjxL?=
 =?us-ascii?Q?VHcCbH8X0hK4apO7g2l9gmUkDUDJuCl3WGMN8BblzIDb4vsFz7ynZLSKbXMD?=
 =?us-ascii?Q?jj+qQRI0gFxusfAqVhOva/zUB/NtrdRlDuHZcbEwcYkJIhHkthWwxO0AYhfW?=
 =?us-ascii?Q?q5yBN+JyOnNipFb2noIvhUQeIsxPPe3izOG9qu37gWzLky5SJpVrRq+C6Lra?=
 =?us-ascii?Q?Qvn/Ox0Db6lCa2fRc2DYdfZgkrInDXwphGK7mH7nqlVyMrb/BUQx9SCUObjX?=
 =?us-ascii?Q?cvVEPph/cP6EfqeWeuI1s8qO660xGYp78YnTP8ckczvPZRIffyuCMgNXyCGr?=
 =?us-ascii?Q?PHzOnllzfc+0kfOXEQ6bXvBJenNF6pVIfco70LttBwIfGnjze+DY+WbIHqdq?=
 =?us-ascii?Q?DPvX5XLB0Phr8ewwCwpxZdqQAnRk62DiICcHcJFxwl1QwKn31b0DZ6zXMWyy?=
 =?us-ascii?Q?UeYWYbmx5mRjvoAxEgtDvWVEUT9lHlTxj1IVjK+iI29Xed4XlIvJ877oNtzA?=
 =?us-ascii?Q?JKqqz2jw89M/1p1EK1H2kSlSDqNpw2Jni7Clc+nRmcf30yWC2wv4fgyOZccS?=
 =?us-ascii?Q?vL0quH+ZbBefvpxBsQ1bDScakgs8sICCqpOUPLyWqQNw1iBG7Hkyt63Hifex?=
 =?us-ascii?Q?8/1mNPIeR9H1BrlSCR0fgCp4wZoN+4tULXGdvMEpT34vZptWU0GOQMJnZpUt?=
 =?us-ascii?Q?H1bIlmoweUxkd8U9boJYQCsL9Wq4+yZemV48+fNK8URv7ejQaVYRYNP7N8HR?=
 =?us-ascii?Q?0eyXnGjvUg612ouRnv4GUw8RwNNinmgP+Ump1poIVn6zU0lK9fQfeHG4GacX?=
 =?us-ascii?Q?hNqAywgneD3dxZvcLgZp2ArTpcOnMzcT8VV2cCVgJANnOlLalq8JBAGJZ07h?=
 =?us-ascii?Q?paeYfsobxuxhMzoyTbGEi7GZJRwN9lVYdNS5itr+IPT01sQ4MNdnzgdDgd2F?=
 =?us-ascii?Q?NE1aKykCAIPCwmOfCY4LYbv//gHdthpKDDcJUPeO?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbdab2d8-e7d3-4262-efd1-08db036f8957
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 09:42:58.6519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fVqoqR7zCTWI4/zewUYQDay0pOzTpVUbZizNysX73UzvE4nofdDy69eef6bch5lc4C5dlLN9CAzPvAZaRyKLNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5806
X-Proofpoint-GUID: WGwlt9d5IHiHOTbjjLXjFXOS5SNjGCe3
X-Proofpoint-ORIG-GUID: WGwlt9d5IHiHOTbjjLXjFXOS5SNjGCe3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_04,2023-01-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 mlxscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301310085
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 09:43:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100874

For now syslog-ng segfaults on ppc64le. The problem could be reproduced
by simply adding syslog-ng to IMAGE_INSTALL and then building and starting
an image for qemuppc64.

The underlying root cause is unknown yet. This workaround, on the other hand,
helps improve the situation a little bit in the sense that users can at least
use syslog-ng on ppc64le targets.

Note that this workaround should be dropped once the upstream issues[1][2]
are fixed. This has also stated very clearly in the patch.

[1] https://sourceware.org/bugzilla/show_bug.cgi?id=30062
[2] https://github.com/syslog-ng/syslog-ng/issues/4285

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...rkaround-powerpc64le-segfaults-error.patch | 46 +++++++++++++++++++
 .../syslog-ng/syslog-ng_3.38.1.bb             |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/0001-plugin.c-workaround-powerpc64le-segfaults-error.patch

diff --git a/meta-oe/recipes-support/syslog-ng/files/0001-plugin.c-workaround-powerpc64le-segfaults-error.patch b/meta-oe/recipes-support/syslog-ng/files/0001-plugin.c-workaround-powerpc64le-segfaults-error.patch
new file mode 100644
index 000000000..343e6fdad
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/0001-plugin.c-workaround-powerpc64le-segfaults-error.patch
@@ -0,0 +1,46 @@
+From 616446afab61ab98b28c81605e2efd4a689f37d1 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Fri, 20 Jan 2023 14:59:14 +0800
+Subject: [PATCH] plugin.c: workaround powerpc64le segfaults error
+
+syslog-ng segfaults on powerpc64le, workaround this error.
+See https://github.com/syslog-ng/syslog-ng/issues/4285 and
+https://sourceware.org/bugzilla/show_bug.cgi?id=30062 for more details.
+This patch should be dropped once the above issues are fixed.
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


