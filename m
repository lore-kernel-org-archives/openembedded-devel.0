Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A348FD4117D
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 12:24:43 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34461.1768479879508424496
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jan 2026 04:24:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hU4E+hxL;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-430f2ee2f00so456244f8f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 04:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768479878; x=1769084678; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0CjQgYMlSqSnJY4cewbee8PO6/Jsi2KEJFWIKZ0KMNg=;
        b=hU4E+hxLCKT2Ep3wFNJyl2zh1HWDdLP6hkNv+GSnYhvfagzz/SQHgAcSZhoTvYZwAq
         e87PKAKJ8y5eLg9tyXW1WBgNymEN6No3c56M8e9vNvgdCwOKa271FJFquN9kqygPkH+h
         UAuKeZS5+isvZAVQwR+8TTbogRCoGawVMyU7/SrlCvd1pPIygXQXTuyqhrLb9YhyPUQq
         VTz0jL/Id79vKqpGQQud6HoYHd2nFBREpvZrKWqJ/w/7mIdYYbt0eQiao8b72cMGn+ly
         aPsHOiGQ7S6BJcTNLjbznEbVj8ngsPQiDE16Lx7VC1w8md4+xzG3AL4nI/3hA1bSd2+n
         uTaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768479878; x=1769084678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0CjQgYMlSqSnJY4cewbee8PO6/Jsi2KEJFWIKZ0KMNg=;
        b=bZT607r4q7Bxy1bEdWKdJ3rmg3yMYfYADS8Hx/sGATJtm8KqhNBGQIR5L1sXeAbbHN
         Cm31/AqBQdn3KAOmXj0WFG+eBWYGvQ9b/7m4lu1VM8P+r3UBNilDznDHn9N9DsWbAVdQ
         IqnlIhk+ydr3lXWH5Rl8JQqWJV9mH43M0RlVsNS0bT1/eqBLGJQlzaQgwiv3qL467tlf
         6N/uxOOoD4nQvs1GZzFI9aYYeoMcjVBSBjkJIiOEaNCMzhuIKpBLr3Q1dtMBdT5ucTzX
         ofEzP/613osufmpKYMSC/VFLxxv8W/Jhm5thLcrXtfgbbQcAvN3mWY/giV0O09XWCMjv
         Ymgg==
X-Gm-Message-State: AOJu0YxjQKmcrWYURDyVSXSs/Wq85QV+53kPcl8wejkJwc5dvDiq5yGQ
	T/fVnR6ca7kdFRMLjPNxeAXqZqKPIBUJ8lN6TZKU/KlgbDN09c2QaElsSJ6iDg==
X-Gm-Gg: AY/fxX60fwi03SM2eNFR3q5omO+Fe71Ta7f3a3bLSgjMYmJdiJK69JpclciVAJp25ai
	To6VLLrfTMrJEENzrX6w7P7oc4bXR0BrUQRTyEI9J6il92IPt98Kt0mrPtv4lgkfwmIUMgHlAH4
	Lq8IyPzPAlm7tvSWYivDhVgJdVSP/+rTRsPpeYuq/QhgVO/bfB6qukvGRiMgrhHWCz8agJeEMR2
	RyhCh6Ow6yyTyJdb2fyRes2cXlWZXzFawJ9spFrgpUzXgNq0CDzPXjUGMXYoOP94XRhlF+4u0M2
	XoaYuYIQjXmvJ/o55jazZ7CG1cgCmGp55aDCPnHa4OfkPuEtvB0df7nRGlFB4ijrzKoCYjMvLXN
	nXz1IjBvq4pxBFfnWIUTF3HLv1q+GD4/rWl+wAZMWDTnkEkESPiM71U6uAAcBSOjxobwhYnxGb1
	ZnnL6CVe6Y
X-Received: by 2002:a05:6000:2dc2:b0:430:ff41:5c92 with SMTP id ffacd0b85a97d-4342c548757mr8120007f8f.53.1768479877661;
        Thu, 15 Jan 2026 04:24:37 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af6b2988sm5436126f8f.28.2026.01.15.04.24.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 04:24:37 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 2/2] python3-django: fix tests
Date: Thu, 15 Jan 2026 13:24:35 +0100
Message-ID: <20260115122435.2583676-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115122435.2583676-1-skandigraun@gmail.com>
References: <20260115122435.2583676-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 12:24:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123505

These patches are for python3-django_3.2.25

These patches only touch the tests folder, which is normally not installed.

Most of these changes are backported patches, that adapt tests to modern(er)
Python environment than they were written for, and some other just fix a bug
in the tests that were always present.

0001-Fix-tag_strip-tests.patch: The html parser's behavior in Python has changed,
making this testcase fail. This is a partial backport of the patch, which handles
only the Python version that is shipped with oe-core (The original patch handles
both old and new versions)

0001-Fixed-test_utils.tests.HTMLEqualTests.test_parsing_e.patch: this backported
patch makes a test-verification conform to html5 standard. Previously the test failed.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../0001-Fix-tag_strip-tests.patch            | 37 +++++++++++++++++++
 ....tests.HTMLEqualTests.test_parsing_e.patch | 32 ++++++++++++++++
 .../python/python3-django_3.2.25.bb           |  2 +
 3 files changed, 71 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django-3.2.25/0001-Fix-tag_strip-tests.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django-3.2.25/0001-Fixed-test_utils.tests.HTMLEqualTests.test_parsing_e.patch

diff --git a/meta-python/recipes-devtools/python/python3-django-3.2.25/0001-Fix-tag_strip-tests.patch b/meta-python/recipes-devtools/python/python3-django-3.2.25/0001-Fix-tag_strip-tests.patch
new file mode 100644
index 0000000000..c99242e348
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-3.2.25/0001-Fix-tag_strip-tests.patch
@@ -0,0 +1,37 @@
+From bd3ffbbacceef7fabd3135ca90eba1397e2b5901 Mon Sep 17 00:00:00 2001
+From: Your Name <you@example.com>
+Date: Tue, 13 Jan 2026 20:07:35 +0000
+Subject: [PATCH] Fix tag_strip tests
+
+Python's htmlparser behavior changed between python versions, and
+the tests expect incorrect result due to this.
+
+This patch is a partial backport, to use only the results that are
+valid for the OE Python version.
+
+Upstream-Status: Backport [https://github.com/django/django/commit/2980627502c84a9fd09272e1349dc574a2ff1fb1]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ tests/utils_tests/test_html.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tests/utils_tests/test_html.py b/tests/utils_tests/test_html.py
+index 86f5562..71757ad 100644
+--- a/tests/utils_tests/test_html.py
++++ b/tests/utils_tests/test_html.py
+@@ -91,10 +91,10 @@ class TestUtilsHtml(SimpleTestCase):
+             ('&gotcha&#;<>', '&gotcha&#;<>'),
+             ('<sc<!-- -->ript>test<<!-- -->/script>', 'ript>test'),
+             ('<script>alert()</script>&h', 'alert()h'),
+-            ('><!' + ('&' * 16000) + 'D', '><!' + ('&' * 16000) + 'D'),
++            ('><!' + ('&' * 16000) + 'D', '>'),
+             ('X<<<<br>br>br>br>X', 'XX'),
+             ("<" * 50 + "a>" * 50, ""),
+-            (">" + "<a" * 500 + "a", ">" + "<a" * 500 + "a"),
++            (">" + "<a" * 500 + "a", ">"),
+             ("<a" * 49 + "a" * 951, "<a" * 49 + "a" * 951),
+             ("<" + "a" * 1_002, "<" + "a" * 1_002),
+         )
+-- 
+2.39.5
+
diff --git a/meta-python/recipes-devtools/python/python3-django-3.2.25/0001-Fixed-test_utils.tests.HTMLEqualTests.test_parsing_e.patch b/meta-python/recipes-devtools/python/python3-django-3.2.25/0001-Fixed-test_utils.tests.HTMLEqualTests.test_parsing_e.patch
new file mode 100644
index 0000000000..83975c8f75
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-3.2.25/0001-Fixed-test_utils.tests.HTMLEqualTests.test_parsing_e.patch
@@ -0,0 +1,32 @@
+From 744927154e6748db08f5232de78ee0d4a8be61a5 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Mon, 21 Jul 2025 15:23:32 -0300
+Subject: [PATCH] Fixed test_utils.tests.HTMLEqualTests.test_parsing_errors
+ following Python's HTMLParser fixed parsing.
+
+From: Natalia <124304+nessita@users.noreply.github.com>
+
+Further details about Python changes can be found in:
+https://github.com/python/cpython/commit/0243f97cbadec8d985e63b1daec5d1cbc850cae3.
+
+Thank you Clifford Gama for the thorough review!
+
+Upstream-Status: Backport [https://github.com/django/django/commit/e4515dad7a6d953c0bd2414127ba36e1446ff41a]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ tests/test_utils/tests.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/test_utils/tests.py b/tests/test_utils/tests.py
+index a1a113a..d1a1e35 100644
+--- a/tests/test_utils/tests.py
++++ b/tests/test_utils/tests.py
+@@ -848,7 +848,7 @@ class HTMLEqualTests(SimpleTestCase):
+             "('Unexpected end tag `div` (Line 1, Column 6)', (1, 6))"
+         )
+         with self.assertRaisesMessage(AssertionError, error_msg):
+-            self.assertHTMLEqual('< div></ div>', '<div></div>')
++            self.assertHTMLEqual('< div></div>', '<div></div>')
+         with self.assertRaises(HTMLParseError):
+             parse_html('</p>')
+ 
diff --git a/meta-python/recipes-devtools/python/python3-django_3.2.25.bb b/meta-python/recipes-devtools/python/python3-django_3.2.25.bb
index 15ee178115..8d2be3702f 100644
--- a/meta-python/recipes-devtools/python/python3-django_3.2.25.bb
+++ b/meta-python/recipes-devtools/python/python3-django_3.2.25.bb
@@ -16,6 +16,8 @@ SRC_URI += "\
        file://CVE-2024-53907.patch \
        file://CVE-2025-32873.patch \
        file://0001-Fixed-33367-Fixed-URLValidator-crash-in-some-edge-ca.patch \
+       file://0001-Fix-tag_strip-tests.patch \
+       file://0001-Fixed-test_utils.tests.HTMLEqualTests.test_parsing_e.patch \
 "
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by

