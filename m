Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94ABAC77B7D
	for <webhook@archiver.kernel.org>; Wed, 10 May 2023 13:49:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.17872.1683726555429266343
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 May 2023 06:49:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=YMYSGxkn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4494d4d3e4=narpat.mali@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34ABw2cs020100
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 May 2023 06:49:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=bEHH9aq8VnHG3r4bgzrWIRfCpsLLoKYpJRMXoqbzf8I=;
 b=YMYSGxknw6kWrL70IuIdf9UdPbNgZQgCd3DN21VHqz304UeXoIWh9KC1T9AJqStGFRZ4
 prvttBvGuZf5+ZExtX9OAQkkAZrS/mjuLwKgGuF/2g2V8vtAbdN9ElipjwHNHzvHVIHS
 4ZicRuNQejkwtDZIYM/N2kA1JssdDLmRC8am+vsdxFgH7VPWpMeR05ZuRrvZ3S8C8ATa
 s+02IQrX0NuwunJLNQFccVlbio8QK+vssp2NV5GFI+1oJ+xnVQZU7YxppUx8dRmyh+j4
 vBCEkqyBL7cUkK4h6+Y6ouJXKGKwrb+BHvUa9gkMNMnNWrs6zDWaMEZEO2oq73XGQXWZ aw== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qf7ucsq48-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 May 2023 06:49:14 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 10 May 2023 06:49:12 -0700
From: nmali <narpat.mali@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <hari.gpillai@windriver.com>
Subject: [meta-oe][kirkstone][PATCH 1/1] python3-werkzeug: fix for CVE-2023-23934
Date: Wed, 10 May 2023 13:48:49 +0000
Message-ID: <20230510134849.562209-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: axYJER3HKQJmCmR0VP_egWPe-U56okcF
X-Proofpoint-ORIG-GUID: axYJER3HKQJmCmR0VP_egWPe-U56okcF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-10_04,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305100110
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 May 2023 13:49:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102533

From: Narpat Mali <narpat.mali@windriver.com>

Werkzeug is a comprehensive WSGI web application library. Browsers may allow
"nameless" cookies that look like `=value` instead of `key=value`. A vulnerable
browser may allow a compromised application on an adjacent subdomain to exploit
this to set a cookie like `=__Host-test=bad` for another subdomain. Werkzeug
prior to 2.2.3 will parse the cookie `=__Host-test=bad` as __Host-test=bad`.
If a Werkzeug application is running next to a vulnerable or malicious subdomain
which sets such a cookie using a vulnerable browser, the Werkzeug application
will see the bad cookie value but the valid cookie key. The issue is fixed in
Werkzeug 2.2.3.

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 .../python3-werkzeug/CVE-2023-23934.patch     | 116 ++++++++++++++++++
 .../python/python3-werkzeug_2.1.1.bb          |   2 +
 2 files changed, 118 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023-23934.patch

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023-23934.patch b/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023-23934.patch
new file mode 100644
index 0000000000..0be97d2888
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023-23934.patch
@@ -0,0 +1,116 @@
+From b070a40ebbd89d88f4d8144a6ece017d33604d00 Mon Sep 17 00:00:00 2001
+From: David Lord <davidism@gmail.com>
+Date: Wed, 10 May 2023 11:33:18 +0000
+Subject: [PATCH] Merge pull request from GHSA-px8h-6qxv-m22q
+
+don't strip leading `=` when parsing cookie
+
+"src/werkzeug/sansio/http.py" file is not available in the current recipe
+version 2.1.1 and this has been introduced from 2.2.0 version. Before 2.2.0
+version, this http.py file was only available in the "src/werkzeug/http.py"
+and we could see the same functions available there which are getting modified
+in the CVE fix commit. Hence, modifying the same at "src/werkzeug/http.py" file.
+
+CVE: CVE-2023-23934
+
+Upstream-Status: Backport [https://github.com/pallets/werkzeug/commit/cf275f42acad1b5950c50ffe8ef58fe62cdce028]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ CHANGES.rst               |  4 ++++
+ src/werkzeug/_internal.py | 13 +++++++++----
+ src/werkzeug/http.py      |  4 ----
+ tests/test_http.py        |  4 +++-
+ 4 files changed, 16 insertions(+), 9 deletions(-)
+
+diff --git a/CHANGES.rst b/CHANGES.rst
+index a351d7c..23505d3 100644
+--- a/CHANGES.rst
++++ b/CHANGES.rst
+@@ -1,5 +1,9 @@
+ .. currentmodule:: werkzeug
+
++-   A cookie header that starts with ``=`` is treated as an empty key and discarded,
++    rather than stripping the leading ``==``.
++
++
+ Version 2.1.1
+ -------------
+
+diff --git a/src/werkzeug/_internal.py b/src/werkzeug/_internal.py
+index a8b3523..d6290ba 100644
+--- a/src/werkzeug/_internal.py
++++ b/src/werkzeug/_internal.py
+@@ -34,7 +34,7 @@ _quote_re = re.compile(rb"[\\].")
+ _legal_cookie_chars_re = rb"[\w\d!#%&\'~_`><@,:/\$\*\+\-\.\^\|\)\(\?\}\{\=]"
+ _cookie_re = re.compile(
+     rb"""
+-    (?P<key>[^=;]+)
++    (?P<key>[^=;]*)
+     (?:\s*=\s*
+         (?P<val>
+             "(?:[^\\"]|\\.)*" |
+@@ -382,16 +382,21 @@ def _cookie_parse_impl(b: bytes) -> t.Iterator[t.Tuple[bytes, bytes]]:
+     """Lowlevel cookie parsing facility that operates on bytes."""
+     i = 0
+     n = len(b)
++    b += b";"
+
+     while i < n:
+-        match = _cookie_re.search(b + b";", i)
++        match = _cookie_re.match(b, i)
++
+         if not match:
+             break
+
+-        key = match.group("key").strip()
+-        value = match.group("val") or b""
+         i = match.end(0)
++        key = match.group("key").strip()
++
++        if not key:
++            continue
+
++        value = match.group("val") or b""
+         yield key, _cookie_unquote(value)
+
+
+diff --git a/src/werkzeug/http.py b/src/werkzeug/http.py
+index 9369900..ae133e3 100644
+--- a/src/werkzeug/http.py
++++ b/src/werkzeug/http.py
+@@ -1205,10 +1205,6 @@ def parse_cookie(
+     def _parse_pairs() -> t.Iterator[t.Tuple[str, str]]:
+         for key, val in _cookie_parse_impl(header):  # type: ignore
+             key_str = _to_str(key, charset, errors, allow_none_charset=True)
+-
+-            if not key_str:
+-                continue
+-
+             val_str = _to_str(val, charset, errors, allow_none_charset=True)
+             yield key_str, val_str
+
+diff --git a/tests/test_http.py b/tests/test_http.py
+index 5936bfa..59cc179 100644
+--- a/tests/test_http.py
++++ b/tests/test_http.py
+@@ -427,7 +427,8 @@ class TestHTTPUtility:
+     def test_parse_cookie(self):
+         cookies = http.parse_cookie(
+             "dismiss-top=6; CP=null*; PHPSESSID=0a539d42abc001cdc762809248d4beed;"
+-            'a=42; b="\\";"; ; fo234{=bar;blub=Blah; "__Secure-c"=d'
++            'a=42; b="\\";"; ; fo234{=bar;blub=Blah; "__Secure-c"=d;'
++            "==__Host-eq=bad;__Host-eq=good;"
+         )
+         assert cookies.to_dict() == {
+             "CP": "null*",
+@@ -438,6 +439,7 @@ class TestHTTPUtility:
+             "fo234{": "bar",
+             "blub": "Blah",
+             '"__Secure-c"': "d",
++            "__Host-eq": "good",
+         }
+
+     def test_dump_cookie(self):
+--
+2.40.0
diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb b/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb
index 476a3a5964..ca8705146e 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb
@@ -12,6 +12,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
 
 PYPI_PACKAGE = "Werkzeug"
 
+SRC_URI += "file://CVE-2023-23934.patch"
+
 SRC_URI[sha256sum] = "f8e89a20aeabbe8a893c24a461d3ee5dad2123b05cc6abd73ceed01d39c3ae74"
 
 inherit pypi setuptools3
-- 
2.40.0


