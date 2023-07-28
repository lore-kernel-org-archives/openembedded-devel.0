Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDD52C001DE
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 08:13:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.27988.1690532022105338461
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jul 2023 01:13:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LqHkx3sF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6573ee0bc5=narpat.mali@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36S7wkLa029185;
	Fri, 28 Jul 2023 08:13:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=w7u5T
	KZeqdTIrqDqdudZKn1lekTHs6iqaTgXv/8zhdo=; b=LqHkx3sFwAKOqbh88carU
	8cCTkiDwE5BfXp2oJU46MD9nE2Cf04XXmTGqAtjIuPpgz2qACoi93SpjV8+33XU2
	qicl71skva1OnR6srfNASfUUqRD/a83ih/LAGATNaX4ydHvbPDCQptldqaxSIaZ0
	4ZxtnOTCOqLUTHoC0CQRTHNx7VejLRSNTTdN/XULVurIW69jCNVHIT5iYqtv7PCF
	PDSOzwEcOWK/jJn1WSFEC9vr+oKOqlHKCqC52Xck1jA8fWJ3wm5jE18Um9JJb8zg
	1Yih3mMrSv65/g/pNK3twBVnkyqL+YhyjM/7feoZcY9rXU+oYx1I7UbELWcljKuh
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s1a78vcq2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 28 Jul 2023 08:13:40 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 28 Jul 2023 01:13:37 -0700
From: nmali <narpat.mali@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <akuster808@gmail.com>
CC: <hari.gpillai@windriver.com>
Subject: [meta-python][kirkstone][PATCH v2 1/1] python3-django: fix CVE-2023-36053
Date: Fri, 28 Jul 2023 08:13:18 +0000
Message-ID: <20230728081318.1010141-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: oq-tYIKcsSGtL1JDC1_J2zwwWbWmKesN
X-Proofpoint-GUID: oq-tYIKcsSGtL1JDC1_J2zwwWbWmKesN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2306200000
 definitions=main-2307280072
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jul 2023 08:13:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104065

From: Narpat Mali <narpat.mali@windriver.com>

In Django 3.2 before 3.2.20, 4 before 4.1.10, and 4.2 before 4.2.3,
EmailValidator and URLValidator are subject to a potential ReDoS
(regular expression denial of service) attack via a very large
number of domain name labels of emails and URLs.

Since, there is no ptest available for python3-django so have not
tested the patch changes at runtime.

References:
https://github.com/advisories/GHSA-jh3w-4vvf-mjgr
https://github.com/django/django/commit/454f2fb93437f98917283336201b4048293f7582

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 .../python3-django/CVE-2023-36053.patch       | 263 ++++++++++++++++++
 .../python/python3-django_2.2.28.bb           |   4 +-
 2 files changed, 266 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-django/CVE-2023-36053.patch

diff --git a/meta-python/recipes-devtools/python/python3-django/CVE-2023-36053.patch b/meta-python/recipes-devtools/python/python3-django/CVE-2023-36053.patch
new file mode 100644
index 0000000000..2ad38d8e95
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django/CVE-2023-36053.patch
@@ -0,0 +1,263 @@
+From a0b2eeeb7350d0c3a9b9be191783ff15daeffec5 Mon Sep 17 00:00:00 2001
+From: Mariusz Felisiak <felisiak.mariusz@gmail.com>
+Date: Thu, 27 Jul 2023 14:51:48 +0000
+Subject: [PATCH] Fixed CVE-2023-36053
+
+-- Prevented potential ReDoS in EmailValidator and URLValidator.
+
+Thanks Seokchan Yoon for reports.
+
+CVE: CVE-2023-36053
+
+Upstream-Status: Backport [https://github.com/django/django/commit/454f2fb93437f98917283336201b4048293f7582]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ django/core/validators.py                     |  9 +++++++--
+ django/forms/fields.py                        |  3 +++
+ docs/ref/forms/fields.txt                     |  4 ++++
+ docs/ref/validators.txt                       | 19 ++++++++++++++++++-
+ docs/releases/2.2.28.txt                      |  9 +++++++++
+ .../field_tests/test_emailfield.py            |  5 ++++-
+ tests/forms_tests/tests/test_forms.py         | 19 +++++++++++++------
+ tests/validators/tests.py                     | 11 +++++++++++
+ 8 files changed, 69 insertions(+), 10 deletions(-)
+
+diff --git a/django/core/validators.py b/django/core/validators.py
+index 2da0688..2dbd3bf 100644
+--- a/django/core/validators.py
++++ b/django/core/validators.py
+@@ -102,6 +102,7 @@ class URLValidator(RegexValidator):
+     message = _('Enter a valid URL.')
+     schemes = ['http', 'https', 'ftp', 'ftps']
+     unsafe_chars = frozenset('\t\r\n')
++    max_length = 2048
+
+     def __init__(self, schemes=None, **kwargs):
+         super().__init__(**kwargs)
+@@ -109,7 +110,9 @@ class URLValidator(RegexValidator):
+             self.schemes = schemes
+
+     def __call__(self, value):
+-        if isinstance(value, str) and self.unsafe_chars.intersection(value):
++        if not isinstance(value, str) or len(value) > self.max_length:
++            raise ValidationError(self.message, code=self.code)
++        if self.unsafe_chars.intersection(value):
+             raise ValidationError(self.message, code=self.code)
+         # Check if the scheme is valid.
+         scheme = value.split('://')[0].lower()
+@@ -190,7 +193,9 @@ class EmailValidator:
+             self.domain_whitelist = whitelist
+
+     def __call__(self, value):
+-        if not value or '@' not in value:
++        # The maximum length of an email is 320 characters per RFC 3696
++        # section 3.
++        if not value or '@' not in value or len(value) > 320:
+             raise ValidationError(self.message, code=self.code)
+
+         user_part, domain_part = value.rsplit('@', 1)
+diff --git a/django/forms/fields.py b/django/forms/fields.py
+index a977256..f939338 100644
+--- a/django/forms/fields.py
++++ b/django/forms/fields.py
+@@ -542,6 +542,9 @@ class FileField(Field):
+     def __init__(self, *, max_length=None, allow_empty_file=False, **kwargs):
+         self.max_length = max_length
+         self.allow_empty_file = allow_empty_file
++        # The default maximum length of an email is 320 characters per RFC 3696
++        # section 3.
++        kwargs.setdefault("max_length", 320)
+         super().__init__(**kwargs)
+
+     def to_python(self, data):
+diff --git a/docs/ref/forms/fields.txt b/docs/ref/forms/fields.txt
+index 6f76d0d..3a888ef 100644
+--- a/docs/ref/forms/fields.txt
++++ b/docs/ref/forms/fields.txt
+@@ -592,6 +592,10 @@ For each field, we describe the default widget used if you don't specify
+     Has two optional arguments for validation, ``max_length`` and ``min_length``.
+     If provided, these arguments ensure that the string is at most or at least the
+     given length.
++    ``empty_value`` which work just as they do for :class:`CharField`. The
++    ``max_length`` argument defaults to 320 (see :rfc:`3696#section-3`).
++
++    The default value for ``max_length`` was changed to 320 characters.
+
+ ``FileField``
+ -------------
+diff --git a/docs/ref/validators.txt b/docs/ref/validators.txt
+index 75d1394..4178a1f 100644
+--- a/docs/ref/validators.txt
++++ b/docs/ref/validators.txt
+@@ -125,6 +125,11 @@ to, or in lieu of custom ``field.clean()`` methods.
+     :param code: If not ``None``, overrides :attr:`code`.
+     :param whitelist: If not ``None``, overrides :attr:`whitelist`.
+
++    An :class:`EmailValidator` ensures that a value looks like an email, and
++    raises a :exc:`~django.core.exceptions.ValidationError` with
++    :attr:`message` and :attr:`code` if it doesn't. Values longer than 320
++    characters are always considered invalid.
++
+     .. attribute:: message
+
+         The error message used by
+@@ -145,13 +150,17 @@ to, or in lieu of custom ``field.clean()`` methods.
+         ``['localhost']``. Other domains that don't contain a dot won't pass
+         validation, so you'd need to whitelist them as necessary.
+
++        In older versions, values longer than 320 characters could be
++        considered valid.
++
+ ``URLValidator``
+ ----------------
+
+ .. class:: URLValidator(schemes=None, regex=None, message=None, code=None)
+
+     A :class:`RegexValidator` that ensures a value looks like a URL, and raises
+-    an error code of ``'invalid'`` if it doesn't.
++    an error code of ``'invalid'`` if it doesn't. Values longer than
++    :attr:`max_length` characters are always considered invalid.
+
+     Loopback addresses and reserved IP spaces are considered valid. Literal
+     IPv6 addresses (:rfc:`3986#section-3.2.2`) and unicode domains are both
+@@ -168,6 +177,14 @@ to, or in lieu of custom ``field.clean()`` methods.
+
+         .. _valid URI schemes: https://www.iana.org/assignments/uri-schemes/uri-schemes.xhtml
+
++     .. attribute:: max_length
++
++        The maximum length of values that could be considered valid. Defaults
++        to 2048 characters.
++
++        In older versions, values longer than 2048 characters could be
++        considered valid.
++
+ ``validate_email``
+ ------------------
+
+diff --git a/docs/releases/2.2.28.txt b/docs/releases/2.2.28.txt
+index 854c6b0..ab4884b 100644
+--- a/docs/releases/2.2.28.txt
++++ b/docs/releases/2.2.28.txt
+@@ -38,3 +38,12 @@ keep the old behavior, set ``allow_multiple_selected`` to ``True``.
+
+ For more details on using the new attribute and handling of multiple files
+ through a single field, see :ref:`uploading_multiple_files`.
++
++Backporting the CVE-2023-36053 fix on Django 2.2.28.
++
++CVE-2023-36053: Potential regular expression denial of service vulnerability in ``EmailValidator``/``URLValidator``
++===================================================================================================================
++
++``EmailValidator`` and ``URLValidator`` were subject to potential regular
++expression denial of service attack via a very large number of domain name
++labels of emails and URLs.
+diff --git a/tests/forms_tests/field_tests/test_emailfield.py b/tests/forms_tests/field_tests/test_emailfield.py
+index 826524a..fe5b644 100644
+--- a/tests/forms_tests/field_tests/test_emailfield.py
++++ b/tests/forms_tests/field_tests/test_emailfield.py
+@@ -8,7 +8,10 @@ class EmailFieldTest(FormFieldAssertionsMixin, SimpleTestCase):
+
+     def test_emailfield_1(self):
+         f = EmailField()
+-        self.assertWidgetRendersTo(f, '<input type="email" name="f" id="id_f" required>')
++        self.assertEqual(f.max_length, 320)
++        self.assertWidgetRendersTo(
++            f, '<input type="email" name="f" id="id_f" maxlength="320" required>'
++        )
+         with self.assertRaisesMessage(ValidationError, "'This field is required.'"):
+             f.clean('')
+         with self.assertRaisesMessage(ValidationError, "'This field is required.'"):
+diff --git a/tests/forms_tests/tests/test_forms.py b/tests/forms_tests/tests/test_forms.py
+index d4e421d..8893f89 100644
+--- a/tests/forms_tests/tests/test_forms.py
++++ b/tests/forms_tests/tests/test_forms.py
+@@ -422,11 +422,18 @@ class FormsTestCase(SimpleTestCase):
+             get_spam = BooleanField()
+
+         f = SignupForm(auto_id=False)
+-        self.assertHTMLEqual(str(f['email']), '<input type="email" name="email" required>')
++        self.assertHTMLEqual(
++            str(f["email"]),
++            '<input type="email" name="email" maxlength="320" required>',
++        )
+         self.assertHTMLEqual(str(f['get_spam']), '<input type="checkbox" name="get_spam" required>')
+
+         f = SignupForm({'email': 'test@example.com', 'get_spam': True}, auto_id=False)
+-        self.assertHTMLEqual(str(f['email']), '<input type="email" name="email" value="test@example.com" required>')
++        self.assertHTMLEqual(
++            str(f["email"]),
++            '<input type="email" name="email" maxlength="320" value="test@example.com" '
++            "required>",
++        )
+         self.assertHTMLEqual(
+             str(f['get_spam']),
+             '<input checked type="checkbox" name="get_spam" required>',
+@@ -2780,7 +2787,7 @@ Good luck picking a username that doesn&#39;t already exist.</p>
+ <option value="true">Yes</option>
+ <option value="false">No</option>
+ </select></li>
+-<li><label for="id_email">Email:</label> <input type="email" name="email" id="id_email"></li>
++<li><label for="id_email">Email:</label> <input type="email" name="email" id="id_email" maxlength="320"></li>
+ <li class="required error"><ul class="errorlist"><li>This field is required.</li></ul>
+ <label class="required" for="id_age">Age:</label> <input type="number" name="age" id="id_age" required></li>"""
+         )
+@@ -2796,7 +2803,7 @@ Good luck picking a username that doesn&#39;t already exist.</p>
+ <option value="true">Yes</option>
+ <option value="false">No</option>
+ </select></p>
+-<p><label for="id_email">Email:</label> <input type="email" name="email" id="id_email"></p>
++<p><label for="id_email">Email:</label> <input type="email" name="email" id="id_email" maxlength="320"></p>
+ <ul class="errorlist"><li>This field is required.</li></ul>
+ <p class="required error"><label class="required" for="id_age">Age:</label>
+ <input type="number" name="age" id="id_age" required></p>"""
+@@ -2815,7 +2822,7 @@ Good luck picking a username that doesn&#39;t already exist.</p>
+ <option value="false">No</option>
+ </select></td></tr>
+ <tr><th><label for="id_email">Email:</label></th><td>
+-<input type="email" name="email" id="id_email"></td></tr>
++<input type="email" name="email" id="id_email" maxlength="320"></td></tr>
+ <tr class="required error"><th><label class="required" for="id_age">Age:</label></th>
+ <td><ul class="errorlist"><li>This field is required.</li></ul>
+ <input type="number" name="age" id="id_age" required></td></tr>"""
+@@ -3428,7 +3435,7 @@ Good luck picking a username that doesn&#39;t already exist.</p>
+         f = CommentForm(data, auto_id=False, error_class=DivErrorList)
+         self.assertHTMLEqual(f.as_p(), """<p>Name: <input type="text" name="name" maxlength="50"></p>
+ <div class="errorlist"><div class="error">Enter a valid email address.</div></div>
+-<p>Email: <input type="email" name="email" value="invalid" required></p>
++<p>Email: <input type="email" name="email" value="invalid" maxlength="320" required></p>
+ <div class="errorlist"><div class="error">This field is required.</div></div>
+ <p>Comment: <input type="text" name="comment" required></p>""")
+
+diff --git a/tests/validators/tests.py b/tests/validators/tests.py
+index 1f09fb5..8204f00 100644
+--- a/tests/validators/tests.py
++++ b/tests/validators/tests.py
+@@ -58,6 +58,7 @@ TEST_DATA = [
+
+     (validate_email, 'example@atm.%s' % ('a' * 64), ValidationError),
+     (validate_email, 'example@%s.atm.%s' % ('b' * 64, 'a' * 63), ValidationError),
++    (validate_email, "example@%scom" % (("a" * 63 + ".") * 100), ValidationError),
+     (validate_email, None, ValidationError),
+     (validate_email, '', ValidationError),
+     (validate_email, 'abc', ValidationError),
+@@ -242,6 +243,16 @@ TEST_DATA = [
+     (URLValidator(EXTENDED_SCHEMES), 'git+ssh://git@github.com/example/hg-git.git', None),
+
+     (URLValidator(EXTENDED_SCHEMES), 'git://-invalid.com', ValidationError),
++    (
++        URLValidator(),
++        "http://example." + ("a" * 63 + ".") * 1000 + "com",
++        ValidationError,
++    ),
++    (
++        URLValidator(),
++        "http://userid:password" + "d" * 2000 + "@example.aaaaaaaaaaaaa.com",
++        None,
++    ),
+     # Newlines and tabs are not accepted.
+     (URLValidator(), 'http://www.djangoproject.com/\n', ValidationError),
+     (URLValidator(), 'http://[::ffff:192.9.5.5]\n', ValidationError),
+--
+2.40.0
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
index 77a1a2a740..ec65a985da 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
@@ -5,7 +5,9 @@ UPSTREAM_CHECK_REGEX = "/${PYPI_PACKAGE}/(?P<pver>(2\.2\.\d*)+)/"
 
 inherit setuptools3
 
-SRC_URI += "file://CVE-2023-31047.patch"
+SRC_URI += "file://CVE-2023-31047.patch \
+            file://CVE-2023-36053.patch \
+           "
 
 SRC_URI[sha256sum] = "0200b657afbf1bc08003845ddda053c7641b9b24951e52acd51f6abda33a7413"
 
-- 
2.40.0


