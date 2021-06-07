Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.104.1623079721553469297
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jun 2021 08:28:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=gGD0zX9r;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=17922b44bd=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 157F8nBB003061
	for <openembedded-devel@lists.openembedded.org>; Mon, 7 Jun 2021 15:28:40 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by mx0a-0064b401.pphosted.com with ESMTP id 391em1r9q2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 07 Jun 2021 15:28:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IizIrDw8j02Lj8773G+6+5RV97Dnq/GKV9T0UzzJqZfTW763xxyQadw4mzoUyDRxFhydNeaKVP/YK++UgWkM0EWjOvgMprOhFCxgbB/mz84oJjWN/T2gKJ81AzHn3o0Ay0LbjjQLFYY062K/6GId+YYAHpjMd7VtaygH89ae/tyvN3xxiUnaobpitOERKmvvWdWlnJfacoH1zb9JdYbFiYmJJ/ogzEcLpuVka3/h8Q8R1rDV5RGZ+tKAJC+wpk/It3xCr58U7UQIh0GTQefQvOR+GGyHmg0L+X+eKvDNv+iYqgaicy2LsgdbAWnw5YJDxS6UGIq6i4wSrHuqiLkFMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0whh8WsCHIADZXh4bOWaJUQaWPJL511PBbgnk7maNdo=;
 b=TMplB1LBpnob0kWt82mp3tdI6VDHANma/OMLE8rwngbXMCwRyjkKSOJ06QPJRumUQhZuOHbkpzT3FM1/wkn+uX7B0sepb3qIXnMKr/aQKvN92SqiwBtSk4LRPy1izekpPk3hZubUEiYd7rBkPq0agT//DvEKWQSSY7dH6mva3M4gV3sk5MVvsz+llNjr4J5NudLiLVlzlb7eTqg3A/ITmRZBvnKzvL8wSH+dk3BawngJHTG/sO6QPLGPspTXmMeSEExyycYlA8HdE30r6i56Wo108Np0F5k6VoMRgwYMyPxBpjfR1JmvOBXCFl5x6mOaonh/po6VCVeUEYp8wYk1jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0whh8WsCHIADZXh4bOWaJUQaWPJL511PBbgnk7maNdo=;
 b=gGD0zX9rZXOW3nPKrf+H/6C7HDCzRFig3yVssBX8QjXyN0c7nuQGOx/Ci4+FMqr6raUYdOnajFCIjer6lOcQDPJrL+Q5MTe8PdqnKs3XjwOrg/ffD7oESEhbdmObsUdlfkWg0/KYZPTnHc1aGa/GFr9NouEHbEEzGPmqlsfWW9M=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4942.namprd11.prod.outlook.com (2603:10b6:a03:2ac::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Mon, 7 Jun
 2021 15:28:37 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::b5ac:be57:85a9:f240]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::b5ac:be57:85a9:f240%3]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 15:28:37 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH v2] python3-yappi: fix ptests
Date: Mon,  7 Jun 2021 11:28:30 -0400
Message-Id: <20210607152830.545011-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.31.1
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: MN2PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:208:23a::21) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-tgamblin-fedora2.wrs.com (128.224.252.2) by MN2PR03CA0016.namprd03.prod.outlook.com (2603:10b6:208:23a::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20 via Frontend Transport; Mon, 7 Jun 2021 15:28:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4a6da91-ab34-4bce-9c5c-08d929c8eb8f
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4942:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4942BFA64ADBC23BE57057CC9F389@SJ0PR11MB4942.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:225;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jxwSSeKsK13I67mu7C/ft7w+LVlFzIXoYA7soP/N2aeeyBBlcc4SUEKAlcTIxIAW26rjVrHb546Dl2BYfLv1ZfQA5SrxyOLnb34YWl5SY5tVJoIYlB1CyoKGhHhyXtgDJ48H3vYHEx4D8qDVDlT7msLQTegIVBVBBvTwInaZDugRt6NWmSXb3rxzCcD8GDo2o+9CfTBKME1f8zHSBnDKH3+XTHJ7WN6dkxOCp5jOIlVyfrgfFG4AwWtVuFwJDouXeW+yPcw7REbqD2Ij5VC7t/0uXec9SE4qPJcz7d8ZaSPQu+ZxF1fveWl7/489ueCBWWLXeuo4ABHv9QXPPM4Y+mm4h+HJvVqnUPVvRhpIdOsmCDidqpZNKrUcOEwplYus8vkIkZJi7bEQFaRa7wTi76OzVEDvBpv4HAftlMQHauZv+Hb3+ayfROi7iFgZvdR2zAXnAGzDhNCRFWO5Vd/M5/fllIvcBUMJVq1kX057NzQJl48CFmeEnLAAeFVi/JVZXiQEQ6hJUvMQ7H895k4HvL9f6YSs4HI112gtbZ/4g3BY2dftruo5L8WxVvr6qKZ8LVf/KOWwtaDC/pkPIPxHW2P2wOtSrOc0It1Db4YGh7u1szpomCW4OjtRUo2cZN4k0n4cevIZlSpco75a7jUQvY6uyp61AW7SiZW5vcPstvvFoZMnuRDNjWMNi4+Fo3A7TMRxG7e9qlPzxT5jywJlPc/GWRjvOWL1dyutNDSx5eTDYGU41R46klqsRDoiNX1MAyX4OL+56Qdk6t32gjuzWQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(39850400004)(396003)(136003)(83380400001)(966005)(52116002)(66946007)(6506007)(66556008)(1076003)(44832011)(5660300002)(26005)(16526019)(186003)(956004)(2616005)(8676002)(38350700002)(6486002)(36756003)(6512007)(38100700002)(6916009)(8936002)(2906002)(316002)(66476007)(478600001)(6666004)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?lbGhPHkG/VQucGRYvRQe9+aOXQ2YcImjcX07IZ09x3ZyyLR47jC3AAiLQgmy?=
 =?us-ascii?Q?uQZpHhCrZyJcTF69Kk8lQKFPerdbpPMyVY2hafR6V4d5eypR9rW1PJAZ/mUm?=
 =?us-ascii?Q?cEYEqmNbCmO9vZw9//Hu9WwIqSai9NfmMLRjNz6YI8y8mGNZ0Y4En9jt+m5T?=
 =?us-ascii?Q?XU/yjERbozsaH2XBRFmtfOHODM9jMu8hoH2G7xWyhSD6TRLWRF14GPuNlq1r?=
 =?us-ascii?Q?7as0BUdh58GrslaHaw0K2P/PFOCTXCsBJ7Jao+Sgb133n3ERqR6sgQ/UrU3W?=
 =?us-ascii?Q?mU5T2Dtpw7K/4g/OgepYTTXOEAbiaGAlPHHU9VfR4yefYo7KkfNbu3iyZ6kV?=
 =?us-ascii?Q?LDseOQQLgmfJuAkqP209GigYwTdGoA+eweBr+WPk22effcilsetSILham7ks?=
 =?us-ascii?Q?0pwuemcFxx9ht5kxyk4qUMYpupZYV4F5GTx7kNARx5buGYEoD6VzELLn4CkM?=
 =?us-ascii?Q?UDGSX5M61b4v6aZi1oaTL5qvGZ9ZJyp+5eFwZwXRVXwGkr4XEU4B8wU8mRUX?=
 =?us-ascii?Q?KS9GnT8vwvkcxPu8m3Uk87eiw6Y+SWC06DHxvh5d7BymKmF4c8kkoGim38lp?=
 =?us-ascii?Q?oSsp6ZvebU4CrHmlWRAQIeej6ht+ioHk1qjqCDN6NPxiDPpS3SQJLCGHGkJe?=
 =?us-ascii?Q?Urwpqvo5w0f0zLwwGY8DyZgQOx+belM0gHyav59xvWNrpPfIUQkJS5aOvAY7?=
 =?us-ascii?Q?fpfKydhV7jYoJPlVyxWmFtdLkYL5rA8gVod2jAhsT9iA1AucuZQki935MyLL?=
 =?us-ascii?Q?V6waVPowoiH9g4I1O30slYqRk0XfaYVr1Oc5UhGPNaj0Q78jkdrhkwXRljpN?=
 =?us-ascii?Q?H/EuwxDh2o6qKbZhg3JDLxdDwrormknQ3qlyyKK25R49M7DOw4IrlW8jolxl?=
 =?us-ascii?Q?gdJ1l1TG0xT6uu5UmIpyA/4oeSBgAgqks249UCvo6q87Ll6xG9p9anR/YdtQ?=
 =?us-ascii?Q?t4OokP7vHVbd5779u2D1KzsLNGgZ/VBYRMDPDBLT9KSy+5iKQrG7NoBVvx1u?=
 =?us-ascii?Q?FBBk/8E0MJdzFN17BDIzP8bJUMjf4ncdBjLqOs/awbyM22vl3ScAxOAmQPyo?=
 =?us-ascii?Q?ztIeVxi1tiTMJFdRy/cZkiDrgDu7B9eMlwsQU1JiCp3qSfgz/dJSG2uxYuOv?=
 =?us-ascii?Q?XRwxdpiMju7F7noSVb3tYLSF1TVPYoL+8CzoS6jMGn2SgqCOHnFqPCCIOv0u?=
 =?us-ascii?Q?hIjlijMJkvWxwpBJocnjQMTFlBtFXOGxmB35Ic3mZxl/DEdjFwM8MuLtz6ch?=
 =?us-ascii?Q?vOEBFa3jgJ577TKUhvlLQDQbA+eY32/KTqQhxCnwuq4bpscfi9HDKOr+MrI+?=
 =?us-ascii?Q?7d5xaqv7vk+458h59EEzPL8J?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4a6da91-ab34-4bce-9c5c-08d929c8eb8f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 15:28:37.3100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +u/M+F0BwMaAklKHkX7EyJIRnl0bak14//gCi/UI434QJNbhChkb2ySAiTzI281Q2IXwY2Ryy8Nu5fqtHaEvdTF9vvC2DK+dZLyeYFOMhks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4942
X-Proofpoint-ORIG-GUID: KiQKjlxkaeu6U-MpeTkn8b88XuZ6f_0r
X-Proofpoint-GUID: KiQKjlxkaeu6U-MpeTkn8b88XuZ6f_0r
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-07_11:2021-06-04,2021-06-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 malwarescore=0 mlxscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106070110
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

- Add a patch to fix imports in unit tests
- Add python3-gevent and python3-zopeinterface to ptest RDEPENDS
- Sort ptest RDEPENDS alphabetically

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../0001-Fix-imports-for-ptests.patch         | 96 +++++++++++++++++++
 .../python/python3-yappi_1.3.2.bb             |  5 +-
 2 files changed, 100 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-yappi/0001-=
Fix-imports-for-ptests.patch

diff --git a/meta-python/recipes-devtools/python/python3-yappi/0001-Fix-imp=
orts-for-ptests.patch b/meta-python/recipes-devtools/python/python3-yappi/0=
001-Fix-imports-for-ptests.patch
new file mode 100644
index 000000000..f32d2b2c2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-yappi/0001-Fix-imports-fo=
r-ptests.patch
@@ -0,0 +1,96 @@
+From 0dedc1c573ddc4e87475eb03c64555cd54a72e92 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <trevor.gamblin@windriver.com>
+Date: Mon, 7 Jun 2021 09:40:20 -0400
+Subject: [PATCH] Fix imports for tests
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
+=20
+=20
+ @asyncio.coroutine
+diff --git a/tests/test_asyncio_context_vars.py b/tests/test_asyncio_conte=
xt_vars.py
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
+=20
+ async_context_id =3D contextvars.ContextVar('async_context_id')
+diff --git a/tests/test_functionality.py b/tests/test_functionality.py
+index a73cb63..2ab273f 100644
+--- a/tests/test_functionality.py
++++ b/tests/test_functionality.py
+@@ -5,7 +5,7 @@ import threading
+ import unittest=0D
+ import yappi=0D
+ import _yappi=0D
+-import utils=0D
++import tests.utils as utils=0D
+ import multiprocessing  # added to fix http://bugs.python.org/issue15881 =
for > Py2.6=0D
+ import subprocess=0D
+ =0D
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
+=20
+ import yappi
+-import utils
++import tests.utils as utils
+=20
+=20
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
+=20
+=20
+ class MultiThreadTests(YappiUnitTestCase):
+--=20
+2.31.1
+
diff --git a/meta-python/recipes-devtools/python/python3-yappi_1.3.2.bb b/m=
eta-python/recipes-devtools/python/python3-yappi_1.3.2.bb
index 7c3f0fd4b..8a1aca21f 100644
--- a/meta-python/recipes-devtools/python/python3-yappi_1.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-yappi_1.3.2.bb
@@ -8,6 +8,7 @@ SRC_URI[sha256sum] =3D "a51d3e6e5563cc74b5bb82ed6e7bd44a9c1=
a7eae3d97e4d52e9465edb3
=20
 SRC_URI +=3D " \
     file://run-ptest \
+    file://0001-Fix-imports-for-ptests.patch \
 "
=20
 inherit pypi setuptools3 ptest
@@ -19,9 +20,11 @@ RDEPENDS_${PN} +=3D "\
 "
=20
 RDEPENDS_${PN}-ptest +=3D " \
-    ${PYTHON_PN}-pytest \
+    ${PYTHON_PN}-gevent \
     ${PYTHON_PN}-multiprocessing \
+    ${PYTHON_PN}-pytest \
     ${PYTHON_PN}-profile \
+    ${PYTHON_PN}-zopeinterface \
 "
=20
 do_install_ptest() {
--=20
2.31.1

