Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FC40E7E624
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 11:25:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.16378.1695727501067598316
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Sep 2023 04:25:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lMn+3/u/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7633797b0d=narpat.mali@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38Q9eHbR008475;
	Tue, 26 Sep 2023 04:24:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=16kva
	41Muuj1dOl3qt0jsFEnf1GBqqM3PzskB/cOUPQ=; b=lMn+3/u/0PoRh5NsC4XiE
	EVOYIQ/WgN4O28tnSlHsom5qzw+/acR8/Oh0VyT1VXIOk60gKsDDEGwPKWtziqCd
	mDjcW8sTMNXxTcPzVYbd6QMWQh375VQCep1lhZv2836OsgkzVuCo+pxhF+mpG+22
	Hxyr5zDI3fn8fiQuJuvoTUp5HiYA/dYjmyCjJs6Mta8u6Dhp7Ih3ZUlFyoI0DkQ7
	midaUPNlHyM50S9dUmfmc/FPlb0WGBnulksZV/iMzkaJzM5KFn8648nBdQLFsMv9
	eL5lL9rUjsRBBNYrynsmLmkSD602TRUVjrGRMlecHZx3US1OT1Gr7dY/Fw3mhbb8
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t9ua0jgks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 26 Sep 2023 04:24:56 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 04:24:54 -0700
From: nmali <narpat.mali@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <akuster808@gmail.com>
Subject: [meta-python][kirkstone][PATCH 1/1] python3-django: fix CVE-2023-41164
Date: Tue, 26 Sep 2023 11:24:28 +0000
Message-ID: <20230926112428.2797804-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: jSmCbzUj857LQgPxLUomvSzCK70BOiQg
X-Proofpoint-ORIG-GUID: jSmCbzUj857LQgPxLUomvSzCK70BOiQg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-26_07,2023-09-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 adultscore=0 mlxscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2309260098
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Sep 2023 11:25:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105141

From: Narpat Mali <narpat.mali@windriver.com>

In Django 3.2 before 3.2.21, 4 before 4.1.11, and 4.2 before 4.2.5,
``django.utils.encoding.uri_to_iri()`` was subject to potential denial
of service attack via certain inputs with a very large number of Unicode
characters.

Since, there is no ptest available for python3-django so have not
tested the patch changes at runtime.

References:
https://security-tracker.debian.org/tracker/CVE-2023-41164
https://www.djangoproject.com/weblog/2023/sep/04/security-releases/

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 .../python3-django/CVE-2023-41164.patch       | 105 ++++++++++++++++++
 .../python/python3-django_2.2.28.bb           |   1 +
 2 files changed, 106 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django/CVE-2023-41164.patch

diff --git a/meta-python/recipes-devtools/python/python3-django/CVE-2023-41164.patch b/meta-python/recipes-devtools/python/python3-django/CVE-2023-41164.patch
new file mode 100644
index 000000000..9bc38b0cc
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django/CVE-2023-41164.patch
@@ -0,0 +1,105 @@
+From 9c95e8fec62153f8dfcc45a70b8a68d74333a66f Mon Sep 17 00:00:00 2001
+From: Mariusz Felisiak <felisiak.mariusz@gmail.com>
+Date: Tue, 26 Sep 2023 10:23:30 +0000
+Subject: [PATCH] Fixed CVE-2023-41164 -- Fixed potential DoS in
+ django.utils.encoding.uri_to_iri().
+
+Thanks MProgrammer (https://hackerone.com/mprogrammer) for the report.
+
+Co-authored-by: nessita <124304+nessita@users.noreply.github.com>
+
+CVE: CVE-2023-41164
+
+Upstream-Status: Backport [https://github.com/django/django/commit/3f41d6d62929dfe53eda8109b3b836f26645bdce]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ django/utils/encoding.py           |  6 ++++--
+ docs/releases/2.2.28.txt           |  9 +++++++++
+ tests/utils_tests/test_encoding.py | 21 ++++++++++++++++++++-
+ 3 files changed, 33 insertions(+), 3 deletions(-)
+
+diff --git a/django/utils/encoding.py b/django/utils/encoding.py
+index 98da647..3769702 100644
+--- a/django/utils/encoding.py
++++ b/django/utils/encoding.py
+@@ -225,6 +225,7 @@ def repercent_broken_unicode(path):
+     repercent-encode any octet produced that is not part of a strictly legal
+     UTF-8 octet sequence.
+     """
++    changed_parts = []
+     while True:
+         try:
+             path.decode()
+@@ -232,9 +233,10 @@ def repercent_broken_unicode(path):
+             # CVE-2019-14235: A recursion shouldn't be used since the exception
+             # handling uses massive amounts of memory
+             repercent = quote(path[e.start:e.end], safe=b"/#%[]=:;$&()+,!?*@'~")
+-            path = path[:e.start] + force_bytes(repercent) + path[e.end:]
++            changed_parts.append(path[: e.start] + repercent.encode())
++            path = path[e.end :]
+         else:
+-            return path
++            return b"".join(changed_parts) + path
+
+
+ def filepath_to_uri(path):
+diff --git a/docs/releases/2.2.28.txt b/docs/releases/2.2.28.txt
+index ab4884b..40eb230 100644
+--- a/docs/releases/2.2.28.txt
++++ b/docs/releases/2.2.28.txt
+@@ -47,3 +47,12 @@ CVE-2023-36053: Potential regular expression denial of service vulnerability in
+ ``EmailValidator`` and ``URLValidator`` were subject to potential regular
+ expression denial of service attack via a very large number of domain name
+ labels of emails and URLs.
++
++Backporting the CVE-2023-41164 fix on Django 2.2.28.
++
++CVE-2023-41164: Potential denial of service vulnerability in ``django.utils.encoding.uri_to_iri()``
++===================================================================================================
++
++``django.utils.encoding.uri_to_iri()`` was subject to potential denial of
++service attack via certain inputs with a very large number of Unicode
++characters.
+diff --git a/tests/utils_tests/test_encoding.py b/tests/utils_tests/test_encoding.py
+index ea7ba5f..93a3162 100644
+--- a/tests/utils_tests/test_encoding.py
++++ b/tests/utils_tests/test_encoding.py
+@@ -1,8 +1,9 @@
+ import datetime
++import inspect
+ import sys
+ import unittest
+ from unittest import mock
+-from urllib.parse import quote_plus
++from urllib.parse import quote, quote_plus
+
+ from django.test import SimpleTestCase
+ from django.utils.encoding import (
+@@ -100,6 +101,24 @@ class TestEncodingUtils(SimpleTestCase):
+         except RecursionError:
+             self.fail('Unexpected RecursionError raised.')
+
++    def test_repercent_broken_unicode_small_fragments(self):
++        data = b"test\xfctest\xfctest\xfc"
++        decoded_paths = []
++
++        def mock_quote(*args, **kwargs):
++            # The second frame is the call to repercent_broken_unicode().
++            decoded_paths.append(inspect.currentframe().f_back.f_locals["path"])
++            return quote(*args, **kwargs)
++
++        with mock.patch("django.utils.encoding.quote", mock_quote):
++            self.assertEqual(repercent_broken_unicode(data), b"test%FCtest%FCtest%FC")
++
++        # decode() is called on smaller fragment of the path each time.
++        self.assertEqual(
++            decoded_paths,
++            [b"test\xfctest\xfctest\xfc", b"test\xfctest\xfc", b"test\xfc"],
++        )
++
+
+ class TestRFC3987IEncodingUtils(unittest.TestCase):
+
+--
+2.40.0
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
index ec65a985d..c35323f45 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
@@ -7,6 +7,7 @@ inherit setuptools3
 
 SRC_URI += "file://CVE-2023-31047.patch \
             file://CVE-2023-36053.patch \
+            file://CVE-2023-41164.patch \
            "
 
 SRC_URI[sha256sum] = "0200b657afbf1bc08003845ddda053c7641b9b24951e52acd51f6abda33a7413"
-- 
2.40.0


