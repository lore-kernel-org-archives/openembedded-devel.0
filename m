Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.8672.1622814717129143127
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Jun 2021 06:51:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Pu+Fo1Lr;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1789c60e16=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 154DiwBU022975
	for <openembedded-devel@lists.openembedded.org>; Fri, 4 Jun 2021 06:51:56 -0700
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam07lp2041.outbound.protection.outlook.com [104.47.51.41])
	by mx0a-0064b401.pphosted.com with ESMTP id 38ya82gf55-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 04 Jun 2021 06:51:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oNiHGTVnwNqqJiAZ7sX4f232H8WJUxd16v6vUpgL/yxnARI48SlNOYlL6WH22lj0Ty0PTS7OUvspgpkFTlLlobclRne1vSzxWyG+Zjb/PT3x/dLHqS2GtV9VqW9tvi/nAZkDZ11ZjiAPXZxAIHGSw59W3yZKFneLAk6Hwp1cB1cuntDNUqHvLkXnMHxjcmsR/FQpuOoMA2YrT5OhGw/mgSjBujLYh/vPyAZM1qRHChETudjT9sCioRKbMQVKUhhqzgBwLJa2G8scq6/M5nuPiYl/jsB62c76+u5KEY0ho3NMsHHK94/UwIAmdpQtTAqDgH4qvKc31smi3Yx2ZNDhgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1v3onwPcOd6KrV0p7zeww0G7DY3yzxXmWdA/RuEDZSY=;
 b=l0J4W65v5totGISWO16AXCdyorylfy9RNYis09VIDwJB7gOt7vytpLIxCZRhSROVtg5oEVduCe9LMlKkrq8dGIjl+xHm5Au3rm1761OhT3XXHM3qhlAQL/LpeBRlcQ2fx4koPxFY/6kKPoiWkAg0z+FPzSvMwnrMamNy3XP99AD2T1Vnb08f5K4l/gr5eKmgKyet/y6WcKO9BzWj2DTujIfGW+TzQsNMQJQkBD7nbAVqbRVtj4TYZoI52SobO0nTvUZRlorszCjjDBETmDXNOpMFyN2Jl7vZ3dWEWadePW0fegTcwdeaNaGtb/Z6krbNrEC/fGuHI+JurIAjXPnnHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1v3onwPcOd6KrV0p7zeww0G7DY3yzxXmWdA/RuEDZSY=;
 b=Pu+Fo1Lr9Szq2iSqw8KNcBvqT7w07putI6Ol5gJeBjA2z8epGh4n95M6SdFR/FuegzDFJHnCI7q+hdKygBYhkcTI64DazAKnq3zZ6UK+JyoD+5ARn99BIqeOy5GAczdf9+7zN2B5/RGdNgiCiYJLQZZRGAovkghsaQkEognUh20=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Fri, 4 Jun
 2021 13:51:53 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::b5ac:be57:85a9:f240]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::b5ac:be57:85a9:f240%3]) with mapi id 15.20.4195.024; Fri, 4 Jun 2021
 13:51:52 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-yappi: fix ptests
Date: Fri,  4 Jun 2021 09:51:43 -0400
Message-Id: <20210604135143.1215766-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.31.1
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: SJ0PR03CA0051.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::26) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-tgamblin-fedora2.wrs.com (128.224.252.2) by SJ0PR03CA0051.namprd03.prod.outlook.com (2603:10b6:a03:33e::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23 via Frontend Transport; Fri, 4 Jun 2021 13:51:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b181ab92-1de4-46fd-ccef-08d9275fe86a
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4896:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4896A9F0E1276F052FC970CD9F3B9@SJ0PR11MB4896.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	G8tT05S2g6l2kuzyYlLwWrs5T/f7Pd7PG7rTV2iQBQUNHmNEPpyn7JBhVmRApzxPoCYyh+NPXsbk61T7m3HtB1wxVIb1Xe7UZWh/n0dvKLqK454GPmhxxE6GPk43wFHL+ITeeXHX8CghP6RAW+5E/Qv/GgN15bPhaM/fkcc2BWTtLZe9ghxleLQrB2OfK4/FADku/OwDDUr87eY0z1MydrEzr3OCn4kqTJXKWAoRBmID59C724mzpthpzQ41WYqNDNFnDrUu4jNZD/NGchcvPd0H9/Cc4hVow5GowVnPTa+NgS1zXvUhfeyKmGE2eBItDdehUQSIbc0hU6sS7kNgg03wZIv1rg8tzJR1eJl3kGcsFDBo9g9AefS2UvSDbhHZ7HFwoNQAqXsQmn/8QRFadYyqYkWUbeK4w55UJC0xLMAgqdVTtwH0JbjKE6wdxw3WmXTopkNQ7t0MD//M5ZfWWewLOSe1bnkEuOPCuZvqaEaCaqEtcqAS6xro6MROXCKouOt3ztYsQocmlQte9u+QAwCFWp0ZXRAIbE+2CPp5JHJgFxlnCt8bSt5DujpCFJa9+E3aMJHdyvD728D71ZH1+6JEQigp3ArYnMmIwFAedwTI22Iso+qp5I7dqk3G7BqCt/kbnr06eIbfLeIiEwzN/b8lwEXFnUjn5Jiw6WmCLW0UmpUBYz43ZZndBqXKqzRwCEziDvfTNB3QH5ougLUelywJZIYCRyIdbWZkWZEpf5gHX91FxeeZoD9Fj08dlqB9fry91Fn8ywG/ivU4ms5OCuFm3co0j5mpWEbWvRjM9OohlOs3vznLndZuIBmvm3um
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(346002)(39840400004)(366004)(66946007)(66476007)(66556008)(6916009)(6486002)(2616005)(6666004)(86362001)(8676002)(6506007)(52116002)(5660300002)(1076003)(956004)(36756003)(6512007)(966005)(38100700002)(186003)(44832011)(478600001)(16526019)(316002)(2906002)(83380400001)(38350700002)(26005)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?q12sdW9Qu0vBU9clSMLBH+agriYjaSk8iNwe9fPTtLYeL1BHG8A5UiiXicgS?=
 =?us-ascii?Q?gScrSW4sa7Z7zyu+G+wCywsB225SavkpcElw0de+vpMwiD3okZWoX1IonyZ3?=
 =?us-ascii?Q?1MJ7Lg9aDpN2J0dG6MCADXgdikoBS8UI+9vv/OPd/z8ZgE9V7Z5Of+uR2FDf?=
 =?us-ascii?Q?oluxPKAvjDn6qw1j4ZlnelgUfj9fZCM8svUI0SGLvVx7Y6Od5bQ21C866XVb?=
 =?us-ascii?Q?hb/jQ6w7eNozvlIKjClW2qAvBxr4suMAMnBMn9BA3u09mVVDdL7OS+3dNBz2?=
 =?us-ascii?Q?1MxcznNabknvT3FyfLb16lr6jD8ETkXnIq7mZP/Hlf3oDUOIVcunM/BHMr2e?=
 =?us-ascii?Q?S/JhnjTeZlayUuqqqwnCdLWE1UM3ASOBvUO6k8vVz54Bdvm0VoAOXEi8ZIwv?=
 =?us-ascii?Q?J0FZDVa4wwNx61KxhzA3gjCCazoVtDNIjPg0RiTjE0KViGNeEgtTE6bdMikn?=
 =?us-ascii?Q?cWJxJcUpM1T5lSRUNd6WqqAsNGs6/G+of/EhYg9rOQCknILPKeQgY8Y5q54w?=
 =?us-ascii?Q?EGMpchukp0A3TlrvAE7FRlyu3HxwYsatXwXocUUXHgSFRlwIDLSEtIynoFW/?=
 =?us-ascii?Q?X/uVWSIKgRk5s0wJsg+gfD9lVvKFvkJxZ1zUx+51zvuDRXd6iZbDoKQGctmg?=
 =?us-ascii?Q?s+yVBfZ5uXHgM+yo+6SUOBsuAwIEihMdfzYB0/5cTz+mMJa2ahdXMMs3rNqI?=
 =?us-ascii?Q?I0xS5FJw43YfFbTwP0s6LxoUbcuwdPVtAo8kKbVeTwTJzcXKXLBUGyYYEjJd?=
 =?us-ascii?Q?tsceuPBS2tBFsgtbFL6zR0k17sBCIQKT7S1QxgmHc9i7ewv3psMdsSmYCBoD?=
 =?us-ascii?Q?ZA4lBDcr9JMwT5L/j1XBqWM2tZuN0Cm4zJZYH9RVXxfICkAaWppIPF74VefU?=
 =?us-ascii?Q?1ANcV2QbrHJFhK52llnnSn0Ofe74Z8ewXBinzvyqIKHW1n2pbwQBtJWAwZSc?=
 =?us-ascii?Q?eSJcuOxNvHXV8ukCJKcl+UanGlR3lYTuMBSo0JXuo5BHYP+kFBHaalHp7LU3?=
 =?us-ascii?Q?bCHQyzNo2+Xv7zH3EuFtLjduMd7F3qx7pLxkaR62rO1cDLJyrzqGEDyvWXh1?=
 =?us-ascii?Q?dIQWteqcr7WqHzPPdDGTFMy/KzNSVT0HCdnU1WtHtMwCPD6Er1yW+LdJjrL6?=
 =?us-ascii?Q?jIcY2qn5RYqUqqWYLqwf7KcuLWz1fBw84oTSa6k5gJCF9NmSsxL7dF/BmEui?=
 =?us-ascii?Q?UX6EE41BLLa9KkcqoR10pr6N23Fh9/nghwAy1L7yTV7VAuzB3oSufA0o1UW8?=
 =?us-ascii?Q?jsSHz2Zm689rk4aNABqm+m2M3TRHnkTluaqvXDWeK0Yu3oTV+04j5zOT27yV?=
 =?us-ascii?Q?Vbeax3U84gje7DwKoNV4ACU8?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b181ab92-1de4-46fd-ccef-08d9275fe86a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 13:51:52.7933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YicAbsSPV5C5qLAq9V2K94+0OH4ligK8CNJzmFwaTGt3jHWXggArUZsKr0HnF9hCc4SPQpMwv+qero98yp4Vm/EC0K80UbAS9lPKtBzDi2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4896
X-Proofpoint-ORIG-GUID: VLfWs37gfD3-LiGh-OIR_3YGFf4wnD8C
X-Proofpoint-GUID: VLfWs37gfD3-LiGh-OIR_3YGFf4wnD8C
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-04_08:2021-06-04,2021-06-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 mlxlogscore=999
 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106040106
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

- Add a patch to fix imports in unit tests
- Add python3-gevent and python3-zopeinterface to ptest RDEPENDS
- Sort ptest RDEPENDS alphabetically

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../0001-Fix-imports-for-ptests.patch         | 102 ++++++++++++++++++
 .../python/python3-yappi_1.3.2.bb             |   5 +-
 2 files changed, 106 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-yappi/0001-Fix-imports-for-ptests.patch

diff --git a/meta-python/recipes-devtools/python/python3-yappi/0001-Fix-imports-for-ptests.patch b/meta-python/recipes-devtools/python/python3-yappi/0001-Fix-imports-for-ptests.patch
new file mode 100644
index 000000000..e00b7a818
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-yappi/0001-Fix-imports-for-ptests.patch
@@ -0,0 +1,102 @@
+From f27b40e9824615ce5b61b37f58a279703ee04712 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <trevor.gamblin@windriver.com>
+Date: Fri, 4 Jun 2021 09:17:38 -0400
+Subject: [PATCH] Fix imports for ptests
+
+yappi's ptests are failing because the import statements for the "utils"
+module are not properly given as relative imports and/or aliased. Fix
+this here for 1.3.2 while trying to get it submitted upstream.
+
+Upstream-Status: Submitted (https://github.com/sumerc/yappi/pull/84)
+
+Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
+---
+ tests/test_asyncio.py              | 2 +-
+ tests/test_asyncio_context_vars.py | 2 +-
+ tests/test_functionality.py        | 2 +-
+ tests/test_gevent.py               | 2 +-
+ tests/test_hooks.py                | 2 +-
+ tests/test_tags.py                 | 2 +-
+ 6 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/tests/test_asyncio.py b/tests/test_asyncio.py
+index 4ac4c5f..4de94cf 100644
+--- a/tests/test_asyncio.py
++++ b/tests/test_asyncio.py
+@@ -2,7 +2,7 @@ import unittest
+ import yappi
+ import asyncio
+ import threading
+-from utils import YappiUnitTestCase, find_stat_by_name, burn_cpu, burn_io
++from .utils import YappiUnitTestCase, find_stat_by_name, burn_cpu, burn_io
+ 
+ 
+ @asyncio.coroutine
+diff --git a/tests/test_asyncio_context_vars.py b/tests/test_asyncio_context_vars.py
+index 5bd750c..9a253c0 100644
+--- a/tests/test_asyncio_context_vars.py
++++ b/tests/test_asyncio_context_vars.py
+@@ -5,7 +5,7 @@ import contextvars
+ import functools
+ import time
+ import os
+-import utils
++import tests.utils as utils
+ import yappi
+ 
+ async_context_id = contextvars.ContextVar('async_context_id')
+diff --git a/tests/test_functionality.py b/tests/test_functionality.py
+index a73cb63..2ab273f 100644
+--- a/tests/test_functionality.py
++++ b/tests/test_functionality.py
+@@ -5,7 +5,7 @@ import threading
+ import unittest
+ import yappi
+ import _yappi
+-import utils
++import tests.utils as utils
+ import multiprocessing  # added to fix http://bugs.python.org/issue15881 for > Py2.6
+ import subprocess
+ 
+diff --git a/tests/test_gevent.py b/tests/test_gevent.py
+index 8569712..fe15b29 100644
+--- a/tests/test_gevent.py
++++ b/tests/test_gevent.py
+@@ -4,7 +4,7 @@ import yappi
+ import gevent
+ from gevent.event import Event
+ import threading
+-from utils import (
++from .utils import (
+     YappiUnitTestCase, find_stat_by_name, burn_cpu, burn_io,
+     burn_io_gevent
+ )
+diff --git a/tests/test_hooks.py b/tests/test_hooks.py
+index a96a4f1..e4177ba 100644
+--- a/tests/test_hooks.py
++++ b/tests/test_hooks.py
+@@ -5,7 +5,7 @@ import unittest
+ import time
+ 
+ import yappi
+-import utils
++import tests.utils as utils
+ 
+ 
+ def a():
+diff --git a/tests/test_tags.py b/tests/test_tags.py
+index b0b531d..1928888 100644
+--- a/tests/test_tags.py
++++ b/tests/test_tags.py
+@@ -2,7 +2,7 @@ import unittest
+ import yappi
+ import threading
+ import time
+-from utils import YappiUnitTestCase, find_stat_by_name, burn_cpu, burn_io
++from .utils import YappiUnitTestCase, find_stat_by_name, burn_cpu, burn_io
+ 
+ 
+ class MultiThreadTests(YappiUnitTestCase):
+-- 
+2.31.1
+
diff --git a/meta-python/recipes-devtools/python/python3-yappi_1.3.2.bb b/meta-python/recipes-devtools/python/python3-yappi_1.3.2.bb
index 7c3f0fd4b..8a1aca21f 100644
--- a/meta-python/recipes-devtools/python/python3-yappi_1.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-yappi_1.3.2.bb
@@ -8,6 +8,7 @@ SRC_URI[sha256sum] = "a51d3e6e5563cc74b5bb82ed6e7bd44a9c1a7eae3d97e4d52e9465edb3
 
 SRC_URI += " \
     file://run-ptest \
+    file://0001-Fix-imports-for-ptests.patch \
 "
 
 inherit pypi setuptools3 ptest
@@ -19,9 +20,11 @@ RDEPENDS_${PN} += "\
 "
 
 RDEPENDS_${PN}-ptest += " \
-    ${PYTHON_PN}-pytest \
+    ${PYTHON_PN}-gevent \
     ${PYTHON_PN}-multiprocessing \
+    ${PYTHON_PN}-pytest \
     ${PYTHON_PN}-profile \
+    ${PYTHON_PN}-zopeinterface \
 "
 
 do_install_ptest() {
-- 
2.31.1

