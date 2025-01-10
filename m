Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 890CDE7719D
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 13:18:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.18357.1736515092665308558
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 05:18:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=310530b8e5=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50A7K36s014087
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 05:18:12 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 441fkpb0wk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 05:18:11 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 10 Jan 2025 05:18:11 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 10 Jan 2025 05:18:09 -0800
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-python][kirkstone][PATCH 2/9] python3-django: Fix CVE-2023-23969
Date: Fri, 10 Jan 2025 13:17:55 +0000
Message-ID: <20250110131802.2774557-3-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250110131802.2774557-1-soumya.sambu@windriver.com>
References: <20250110131802.2774557-1-soumya.sambu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=XZxzzJ55 c=1 sm=1 tr=0 ts=67811e14 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=wjU5IotzqukA:10 a=VdSt8ZQiCzkA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=lWX2f3XPAAAA:8
 a=l22nMv162k5Le1sPrxUA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=JNcmbD5CRP_GvhbQn_Yr:22
X-Proofpoint-ORIG-GUID: qnToYppGzJfYZP6F0tQe2yWWqIw2gQ0d
X-Proofpoint-GUID: qnToYppGzJfYZP6F0tQe2yWWqIw2gQ0d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-10_06,2025-01-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 adultscore=0 mlxlogscore=851 spamscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501100104
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 13:18:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114769

From: Soumya Sambu <soumya.sambu@windriver.com>

In Django 3.2 before 3.2.17, 4.0 before 4.0.9, and 4.1 before 4.1.6, the parsed values
of Accept-Language headers are cached in order to avoid repetitive parsing. This leads
to a potential denial-of-service vector via excessive memory usage if the raw value of
Accept-Language headers is very large.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-23969

Upstream-patch:
https://github.com/django/django/commit/c7e0151fdf33e1b11d488b6f67b94fdf3a30614a

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../python3-django/CVE-2023-23969.patch       | 108 ++++++++++++++++++
 .../python/python3-django_2.2.28.bb           |   1 +
 2 files changed, 109 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django/CVE-2023-23969.patch

diff --git a/meta-python/recipes-devtools/python/python3-django/CVE-2023-23969.patch b/meta-python/recipes-devtools/python/python3-django/CVE-2023-23969.patch
new file mode 100644
index 000000000..42e25ad3b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django/CVE-2023-23969.patch
@@ -0,0 +1,108 @@
+From c7e0151fdf33e1b11d488b6f67b94fdf3a30614a Mon Sep 17 00:00:00 2001
+From: Nick Pope <nick@nickpope.me.uk>
+Date: Wed, 25 Jan 2023 12:21:48 +0100
+Subject: [PATCH] [3.2.x] Fixed CVE-2023-23969 -- Prevented DoS with
+ pathological values for Accept-Language.
+
+The parsed values of Accept-Language headers are cached in order to
+avoid repetitive parsing. This leads to a potential denial-of-service
+vector via excessive memory usage if the raw value of Accept-Language
+headers is very large.
+
+Accept-Language headers are now limited to a maximum length in order
+to avoid this issue.
+
+CVE: CVE-2023-23969
+
+Upstream-Status: Backport [https://github.com/django/django/commit/c7e0151fdf33e1b11d488b6f67b94fdf3a30614a]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ django/utils/translation/trans_real.py | 30 +++++++++++++++++++++++++-
+ tests/i18n/tests.py                    | 12 +++++++++++
+ 2 files changed, 41 insertions(+), 1 deletion(-)
+
+diff --git a/django/utils/translation/trans_real.py b/django/utils/translation/trans_real.py
+index 486b2b2..7f658cf 100644
+--- a/django/utils/translation/trans_real.py
++++ b/django/utils/translation/trans_real.py
+@@ -29,6 +29,10 @@ _default = None
+ # magic gettext number to separate context from message
+ CONTEXT_SEPARATOR = "\x04"
+
++# Maximum number of characters that will be parsed from the Accept-Language
++# header to prevent possible denial of service or memory exhaustion attacks.
++ACCEPT_LANGUAGE_HEADER_MAX_LENGTH = 500
++
+ # Format of Accept-Language header values. From RFC 2616, section 14.4 and 3.9
+ # and RFC 3066, section 2.1
+ accept_language_re = re.compile(r'''
+@@ -560,7 +564,7 @@ def get_language_from_request(request, check_path=False):
+
+
+ @functools.lru_cache(maxsize=1000)
+-def parse_accept_lang_header(lang_string):
++def _parse_accept_lang_header(lang_string):
+     """
+     Parse the lang_string, which is the body of an HTTP Accept-Language
+     header, and return a tuple of (lang, q-value), ordered by 'q' values.
+@@ -582,3 +586,27 @@ def parse_accept_lang_header(lang_string):
+         result.append((lang, priority))
+     result.sort(key=lambda k: k[1], reverse=True)
+     return tuple(result)
++
++
++def parse_accept_lang_header(lang_string):
++    """
++    Parse the value of the Accept-Language header up to a maximum length.
++
++    The value of the header is truncated to a maximum length to avoid potential
++    denial of service and memory exhaustion attacks. Excessive memory could be
++    used if the raw value is very large as it would be cached due to the use of
++    `functools.lru_cache()` to avoid repetitive parsing of common header values.
++    """
++    # If the header value doesn't exceed the maximum allowed length, parse it.
++    if len(lang_string) <= ACCEPT_LANGUAGE_HEADER_MAX_LENGTH:
++        return _parse_accept_lang_header(lang_string)
++
++    # If there is at least one comma in the value, parse up to the last comma,
++    # skipping any truncated parts at the end of the header value.
++    index = lang_string.rfind(",", 0, ACCEPT_LANGUAGE_HEADER_MAX_LENGTH)
++    if index > 0:
++        return _parse_accept_lang_header(lang_string[:index])
++
++    # Don't attempt to parse if there is only one language-range value which is
++    # longer than the maximum allowed length and so truncated.
++    return ()
+diff --git a/tests/i18n/tests.py b/tests/i18n/tests.py
+index 7381cb9..6efc3a5 100644
+--- a/tests/i18n/tests.py
++++ b/tests/i18n/tests.py
+@@ -1282,6 +1282,14 @@ class MiscTests(SimpleTestCase):
+             ('de;q=0.', [('de', 0.0)]),
+             ('en; q=1,', [('en', 1.0)]),
+             ('en; q=1.0, * ; q=0.5', [('en', 1.0), ('*', 0.5)]),
++            (
++                'en' + '-x' * 20,
++                [('en-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x', 1.0)],
++            ),
++            (
++                ', '.join(['en; q=1.0'] * 20),
++                [('en', 1.0)] * 20,
++            ),
+             # Bad headers
+             ('en-gb;q=1.0000', []),
+             ('en;q=0.1234', []),
+@@ -1297,6 +1305,10 @@ class MiscTests(SimpleTestCase):
+             ('12-345', []),
+             ('', []),
+             ('en;q=1e0', []),
++            # Invalid as language-range value too long.
++            ('xxxxxxxx' + '-xxxxxxxx' * 500, []),
++            # Header value too long, only parse up to limit.
++            (', '.join(['en; q=1.0'] * 500), [('en', 1.0)] * 45),
+         ]
+         for value, expected in tests:
+             with self.subTest(value=value):
+--
+2.40.0
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
index f082de9d7..d8fc147f1 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
@@ -13,6 +13,7 @@ SRC_URI += "file://CVE-2023-31047.patch \
             file://CVE-2024-24680.patch \
             file://CVE-2024-42005.patch \
             file://CVE-2024-38875.patch \
+            file://CVE-2023-23969.patch \
            "
 
 SRC_URI[sha256sum] = "0200b657afbf1bc08003845ddda053c7641b9b24951e52acd51f6abda33a7413"
-- 
2.40.0


