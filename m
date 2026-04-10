Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A919FB518A
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 07:05:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.150882.1775804713198968534
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Apr 2026 00:05:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WgCgFjOb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8560f54642=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A3mnF21774203
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 07:05:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=gHnXYOvRyGgHFmT2ezap0Bm919NJUxJTEpMcoGGOxFU=; b=WgCgFjObILcW
	8sb3t1tkplurFFZt8eiilLc/xlTqWbSxFR1uuYHcV52h82NllFf4ak3ta0Qc26aL
	ZJroLfYk0IbkiKNKPiNFHfhpGgD5pdL6OUbYWupCkDfUsMb3jt9bSPU2GhkK7x2B
	aH9w67D4xGSx+VcNYuTY01sEh0rC0/vHVK3pyU4t/IqRLfSJNptil82LWsZ0Glb+
	U+P1CK5R3yEOj2GrD4Gh2ap/k25tlkIGY2r0miBFLwFQ4zTMqPltKs+qISTTH7m1
	kuxB2k/KV+gUQlMOB1bqvBKh+Y32HcTGlZaO70bHhNuJuCOXPzK/3iCVZc0YyLmG
	FuB2gs3yOQ==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmrqn77y-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 07:05:12 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 10 Apr 2026 00:05:11 -0700
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 10 Apr 2026 00:05:10 -0700
From: <jinfeng.wang.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][scarthgap][PATCH v2 02/11] python3-django: fix CVE-2025-64459
Date: Fri, 10 Apr 2026 15:04:59 +0800
Message-ID: <20260410070508.1104455-3-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260410070508.1104455-1-jinfeng.wang.cn@windriver.com>
References: <20260410070508.1104455-1-jinfeng.wang.cn@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=RPCD2Yi+ c=1 sm=1 tr=0 ts=69d8a128 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=PYnjg3YJAAAA:8 a=is1M7v0WAAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=avUYmXgeZf36Ky6ssdIA:9
 a=43mYI5ShwYkO3IWxqTDg:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: QL91rr-2tEUrXNYzPg3REuSGpmn5Eq97
X-Proofpoint-GUID: QL91rr-2tEUrXNYzPg3REuSGpmn5Eq97
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA2MyBTYWx0ZWRfX4SBXm2WKKjG+
 Vp13QZEr/cF7hl2sKKTP88F1diFSU6AGV4IcB/X85Rrhq8K8oPadh/dm0Auirh3rxPjjsug8tUN
 5++VUpBfvYC3B5nl2Yu3xzr9wJE9hMXL8WA+E8/6Y2OUhvFWdLAfztUJ5Jt3rXWLN4nbbznvmiS
 e2Bpn+JtOWK78NWbl7IPGVe7sJRnc3dBvmhF5sisaAMnYG0NoV/rdr+DubWONNNaYqWr/2axVef
 PPnB3F/0rRqdSSN5F+CtstT0iJyS+/LFG6wUGtPdX6/dfB5KWtjmagx0IinC5uCjec8o1bKdkEu
 B6iSfHBWdkWEgdteoN9jN9SElflsU2B1ln5AfWEur0EoyTA/F+pWF6HvwEqe8SivvnNtQvOUIAU
 LahlTQMLn0YMnAKtx78EyRH9nvZFg6mJ6aBXx6nYqo+GeOsgI50uswt4jeVQ1uL6QTw/uaF1BU5
 24U0m2yxiR5/qpKTIOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100063
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 07:05:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126224

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

The methods QuerySet.filter(), QuerySet.exclude(), and QuerySet.get(), and the
class Q() were subject to SQL injection when using a suitably crafted
dictionary, with dictionary expansion, as the _connector argument.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-64459
https://shivasurya.me/security/django/2025/11/07/django-sql-injection-CVE-2025-64459.html

Upstream-patch:
https://github.com/django/django/commit/72d2c87431f2ae0431d65d0ec792047f078c8241
https://github.com/django/django/commit/4624ed769c0f7caea0d48ac824a75fa6b6f17671

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
---
 .../CVE-2025-64459-1.patch                    | 57 +++++++++++++++++
 .../CVE-2025-64459-2.patch                    | 63 +++++++++++++++++++
 .../python/python3-django_5.0.14.bb           |  5 +-
 3 files changed, 124 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-django-5.0.14/CVE-2025-64459-1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django-5.0.14/CVE-2025-64459-2.patch

diff --git a/meta-python/recipes-devtools/python/python3-django-5.0.14/CVE-2025-64459-1.patch b/meta-python/recipes-devtools/python/python3-django-5.0.14/CVE-2025-64459-1.patch
new file mode 100644
index 0000000000..6c42adfa42
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-5.0.14/CVE-2025-64459-1.patch
@@ -0,0 +1,57 @@
+From 45f5d17986f70f0aaf4a666b2d71ae6750beeb88 Mon Sep 17 00:00:00 2001
+From: Jacob Walls <jacobtylerwalls@gmail.com>
+Date: Wed, 24 Sep 2025 15:54:51 -0400
+Subject: [PATCH] [5.1.x] Fixed CVE-2025-64459 -- Prevented SQL injections
+ in Q/QuerySet via the _connector kwarg.
+
+Thanks cyberstan for the report, Sarah Boyce, Adam Johnson, Simon
+Charette, and Jake Howard for the reviews.
+
+Backport of c880530ddd4fabd5939bab0e148bebe36699432a from main.
+
+CVE: CVE-2025-64459
+
+Upstream-Status: Backport [https://github.com/django/django/commit/72d2c87431f2ae0431d65d0ec792047f078c8241]
+
+Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
+---
+ django/db/models/query_utils.py | 4 ++++
+ tests/queries/test_q.py         | 5 +++++
+ 2 files changed, 9 insertions(+)
+
+diff --git a/django/db/models/query_utils.py b/django/db/models/query_utils.py
+index a04bbad5e7f8..d8610bc54d46 100644
+--- a/django/db/models/query_utils.py
++++ b/django/db/models/query_utils.py
+@@ -47,8 +47,12 @@ class Q(tree.Node):
+     XOR = "XOR"
+     default = AND
+     conditional = True
++    connectors = (None, AND, OR, XOR)
+ 
+     def __init__(self, *args, _connector=None, _negated=False, **kwargs):
++        if _connector not in self.connectors:
++            connector_reprs = ", ".join(f"{conn!r}" for conn in self.connectors[1:])
++            raise ValueError(f"_connector must be one of {connector_reprs}, or None.")
+         super().__init__(
+             children=[*args, *sorted(kwargs.items())],
+             connector=_connector,
+diff --git a/tests/queries/test_q.py b/tests/queries/test_q.py
+index f7192a430a12..b21ec929a2ec 100644
+--- a/tests/queries/test_q.py
++++ b/tests/queries/test_q.py
+@@ -264,6 +264,11 @@ class QTests(SimpleTestCase):
+                     Q(*items, _connector=connector),
+                 )
+ 
++    def test_connector_validation(self):
++        msg = f"_connector must be one of {Q.AND!r}, {Q.OR!r}, {Q.XOR!r}, or None."
++        with self.assertRaisesMessage(ValueError, msg):
++            Q(_connector="evil")
++
+     def test_referenced_base_fields(self):
+         # Make sure Q.referenced_base_fields retrieves all base fields from
+         # both filters and F expressions.
+-- 
+2.34.1
+
diff --git a/meta-python/recipes-devtools/python/python3-django-5.0.14/CVE-2025-64459-2.patch b/meta-python/recipes-devtools/python/python3-django-5.0.14/CVE-2025-64459-2.patch
new file mode 100644
index 0000000000..5a207f8f11
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-5.0.14/CVE-2025-64459-2.patch
@@ -0,0 +1,63 @@
+From 415912be531179e90e69f0be2e8bca301de53765 Mon Sep 17 00:00:00 2001
+From: Jacob Walls <jacobtylerwalls@gmail.com>
+Date: Wed, 24 Sep 2025 15:56:03 -0400
+Subject: [PATCH] [5.1.x] Refs CVE-2025-64459 -- Avoided propagating
+ invalid arguments to Q on dictionary expansion.
+
+Backport of 3c3f46357718166069948625354b8315a8505262 from main.
+
+CVE: CVE-2025-64459
+
+Upstream-Status: Backport [https://github.com/django/django/commit/4624ed769c0f7caea0d48ac824a75fa6b6f17671]
+
+Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
+---
+ django/db/models/query.py | 5 +++++
+ tests/queries/tests.py    | 8 ++++++++
+ 2 files changed, 13 insertions(+)
+
+diff --git a/django/db/models/query.py b/django/db/models/query.py
+index 153fb1193ebf..3308cd48db00 100644
+--- a/django/db/models/query.py
++++ b/django/db/models/query.py
+@@ -42,6 +42,8 @@ MAX_GET_RESULTS = 21
+ # The maximum number of items to display in a QuerySet.__repr__
+ REPR_OUTPUT_SIZE = 20
+ 
++PROHIBITED_FILTER_KWARGS = frozenset(["_connector", "_negated"])
++
+ 
+ class BaseIterable:
+     def __init__(
+@@ -1495,6 +1497,9 @@ class QuerySet(AltersData):
+         return clone
+ 
+     def _filter_or_exclude_inplace(self, negate, args, kwargs):
++        if invalid_kwargs := PROHIBITED_FILTER_KWARGS.intersection(kwargs):
++            invalid_kwargs_str = ", ".join(f"'{k}'" for k in sorted(invalid_kwargs))
++            raise TypeError(f"The following kwargs are invalid: {invalid_kwargs_str}")
+         if negate:
+             self._query.add_q(~Q(*args, **kwargs))
+         else:
+diff --git a/tests/queries/tests.py b/tests/queries/tests.py
+index 20665ab2cda3..5df231949194 100644
+--- a/tests/queries/tests.py
++++ b/tests/queries/tests.py
+@@ -4481,6 +4481,14 @@ class TestInvalidValuesRelation(SimpleTestCase):
+             Annotation.objects.filter(tag__in=[123, "abc"])
+ 
+ 
++class TestInvalidFilterArguments(TestCase):
++    def test_filter_rejects_invalid_arguments(self):
++        school = School.objects.create()
++        msg = "The following kwargs are invalid: '_connector', '_negated'"
++        with self.assertRaisesMessage(TypeError, msg):
++            School.objects.filter(pk=school.pk, _negated=True, _connector="evil")
++
++
+ class TestTicket24605(TestCase):
+     def test_ticket_24605(self):
+         """
+-- 
+2.34.1
+
diff --git a/meta-python/recipes-devtools/python/python3-django_5.0.14.bb b/meta-python/recipes-devtools/python/python3-django_5.0.14.bb
index c2c44b4cc7..84dd9dd5f4 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.0.14.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.0.14.bb
@@ -4,7 +4,10 @@ inherit setuptools3
 # Windows-specific DoS via NFKC normalization, not applicable to Linux
 CVE_STATUS[CVE-2025-27556] = "not-applicable-platform: Issue only applies on Windows"
 
-SRC_URI += "file://CVE-2025-64460.patch"
+SRC_URI += "file://CVE-2025-64460.patch \
+            file://CVE-2025-64459-1.patch \
+            file://CVE-2025-64459-2.patch \
+           "
 SRC_URI[sha256sum] = "29019a5763dbd48da1720d687c3522ef40d1c61be6fb2fad27ed79e9f655bc11"
 
 RDEPENDS:${PN} += "\
-- 
2.34.1


