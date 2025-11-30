Return-Path: <saravanan.kadambathursubramaniyam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CD0ED111A8
	for <webhook@archiver.kernel.org>; Sun, 30 Nov 2025 11:52:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2887.1764503573300176699
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Nov 2025 03:52:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ldJVKIxa;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4429d7dc3a=saravanan.kadambathursubramaniyam@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AUBWkoB1590859
	for <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 11:52:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=IEcOlji8OcxQHqCFdKMA
	4872GUZ+iEDbiMD9kswuACg=; b=ldJVKIxalAovjWBqqRYjI1Vx/RyGFZDWFbW+
	TE6txl2KHZzvzvD8kLNDu0lKAD91Rz+Tz1wfLBZWxdymkWT1ETiKnyFSxQLlhUVx
	Alyk/aNFiY+HkfJl6+UiY/AjVZsOFEn/ulnL3x9cRLaO25GWU06maSzNWM19mBGd
	HFb12ieP3lvRPqPmU8aMlqXLfOJsswi9D58D3+j9xYuj9rQU/+X0FCXOcTYwS+rq
	gLQQriDNPAPfHLosEh/ifCDCMWMhLG04H9SeV1gZUaTs1l4d6mZMcL8mvmzyfgx9
	IEMuvErpODDYg4hh7ZUhrfkbphvD9ckJtDfhcsqGUpZ6qAvUsg==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqp21rwgg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 11:52:52 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 30 Nov 2025 03:52:51 -0800
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 30 Nov 2025 03:52:49 -0800
From: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] python3-django: fix CVE-2024-39329
Date: Sun, 30 Nov 2025 17:22:48 +0530
Message-ID: <20251130115248.3043692-1-saravanan.kadambathursubramaniyam@windriver.com>
X-Mailer: git-send-email 2.35.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 0hJ9UQp1lG_7VEtmLtQyE6aouHAENMKM
X-Authority-Analysis: v=2.4 cv=OLAqHCaB c=1 sm=1 tr=0 ts=692c3014 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=W8_ZnyXlAAAA:8 a=Tg3y5bO43fjKMMuT0IcA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=eqgIXyRJRr-I_B2loWo7:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTMwMDEwMSBTYWx0ZWRfXyESeCci+azTE
 PA2eAOWPTkfaQjipvG53gr6UVK6zxlfadEi4gwJHXQQur7Hzi/uU4gg7lkCic0a47O+HLKubSn+
 15Ap1UJjp7ZBueQLJPpc+MSnG2NpfGWPTeFF9OKlw7FkIxlLfR4A2XbZTJycuYtPcn75MRQAlJR
 IyoyWL1SOrMDeZ/20lOwD4lN8dbpss8pfISCOuaL8ST6lVGoycVhMMnr+IS6eYcWHe5Je+TYAr5
 bmhaG/vvrYRqvdp5/LhyvlkiH7fXqlGYUOpa853o0qHlGK9Lust8BP5tUXo+3ejWXkyap8WEAsA
 CcXXUtA8yBKzM8u0bE7svHR/CKn/AMdE9OA2vYSrDT52pKwms7NmjAZmDUJh2Z24yNtotdXvSqs
 7u/pJjYQBOP4+yqxGUnssku1AKJ6Mg==
X-Proofpoint-ORIG-GUID: 0hJ9UQp1lG_7VEtmLtQyE6aouHAENMKM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511300101
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 11:52:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122168

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-39329

Upstream-patch:
https://github.com/django/django/commit/156d3186c96e3ec2ca73b8b25dc2ef366e38df14

Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
---
 .../CVE-2024-39329.patch                      | 114 ++++++++++++++++++
 .../python3-django/CVE-2024-39329.patch       | 111 +++++++++++++++++
 .../python/python3-django_2.2.28.bb           |   1 +
 .../python/python3-django_3.2.25.bb           |   1 +
 4 files changed, 227 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django-3.2.25/CVE-2024-39329.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django/CVE-2024-39329.patch

diff --git a/meta-python/recipes-devtools/python/python3-django-3.2.25/CVE-2024-39329.patch b/meta-python/recipes-devtools/python/python3-django-3.2.25/CVE-2024-39329.patch
new file mode 100644
index 0000000000..9f2883885f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-3.2.25/CVE-2024-39329.patch
@@ -0,0 +1,114 @@
+From 156d3186c96e3ec2ca73b8b25dc2ef366e38df14 Mon Sep 17 00:00:00 2001
+From: Michael Manfre <mike@manfre.net>
+Date: Fri, 14 Jun 2024 22:12:58 -0400
+Subject: [PATCH] Fixed CVE-2024-39329 -- Standarized timing of
+ verify_password() when checking unusuable passwords.
+
+Refs #20760.
+
+Thanks Michael Manfre for the fix and to Adam Johnson for the review.
+
+CVE: CVE-2024-39329
+
+Upstream-Status: Backport
+https://github.com/django/django/commit/156d3186c96e3ec2ca73b8b25dc2ef366e38df14
+
+Signed-off-by: Michael Manfre <mike@manfre.net>
+Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
+---
+ django/contrib/auth/hashers.py   | 10 ++++++++--
+ docs/releases/3.2.25.txt         |  7 +++++++
+ tests/auth_tests/test_hashers.py | 32 ++++++++++++++++++++++++++++++++
+ 3 files changed, 47 insertions(+), 2 deletions(-)
+
+diff --git a/django/contrib/auth/hashers.py b/django/contrib/auth/hashers.py
+index 86ae7f4..ee81b64 100644
+--- a/django/contrib/auth/hashers.py
++++ b/django/contrib/auth/hashers.py
+@@ -36,14 +36,20 @@ def check_password(password, encoded, setter=None, preferred='default'):
+     If setter is specified, it'll be called when you need to
+     regenerate the password.
+     """
+-    if password is None or not is_password_usable(encoded):
+-        return False
++    fake_runtime = password is None or not is_password_usable(encoded)
+ 
+     preferred = get_hasher(preferred)
+     try:
+         hasher = identify_hasher(encoded)
+     except ValueError:
+         # encoded is gibberish or uses a hasher that's no longer installed.
++        fake_runtime = True
++
++    if fake_runtime:
++        # Run the default password hasher once to reduce the timing difference
++        # between an existing user with an unusable password and a nonexistent
++        # user or missing hasher (similar to #20760).
++        make_password(get_random_string(UNUSABLE_PASSWORD_SUFFIX_LENGTH))
+         return False
+ 
+     hasher_changed = hasher.algorithm != preferred.algorithm
+diff --git a/docs/releases/3.2.25.txt b/docs/releases/3.2.25.txt
+index a2a58b5..a613b08 100644
+--- a/docs/releases/3.2.25.txt
++++ b/docs/releases/3.2.25.txt
+@@ -40,6 +40,13 @@ CVE-2025-57833: Potential SQL injection in ``FilteredRelation`` column aliases
+ using a suitably crafted dictionary, with dictionary expansion, as the
+ ``**kwargs`` passed to :meth:`.QuerySet.annotate` or :meth:`.QuerySet.alias`.
+ 
++CVE-2024-39329: Username enumeration through timing difference for users with unusable passwords
++================================================================================================
++
++The :meth:`~django.contrib.auth.backends.ModelBackend.authenticate()` method
++allowed remote attackers to enumerate users via a timing attack involving login
++requests for users with unusable passwords.
++
+ Bugfixes
+ ========
+ 
+diff --git a/tests/auth_tests/test_hashers.py b/tests/auth_tests/test_hashers.py
+index 8bc61bc..a1ae940 100644
+--- a/tests/auth_tests/test_hashers.py
++++ b/tests/auth_tests/test_hashers.py
+@@ -474,6 +474,38 @@ class TestUtilsHashPass(SimpleTestCase):
+             check_password('wrong_password', encoded)
+             self.assertEqual(hasher.harden_runtime.call_count, 1)
+ 
++    def test_check_password_calls_make_password_to_fake_runtime(self):
++        hasher = get_hasher("default")
++        cases = [
++            (None, None, None),  # no plain text password provided
++            ("foo", make_password(password=None), None),  # unusable encoded
++            ("letmein", make_password(password="letmein"), ValueError),  # valid encoded
++        ]
++        for password, encoded, hasher_side_effect in cases:
++            with (
++                self.subTest(encoded=encoded),
++                mock.patch(
++                    "django.contrib.auth.hashers.identify_hasher",
++                    side_effect=hasher_side_effect,
++                ) as mock_identify_hasher,
++                mock.patch(
++                    "django.contrib.auth.hashers.make_password"
++                ) as mock_make_password,
++                mock.patch(
++                    "django.contrib.auth.hashers.get_random_string",
++                    side_effect=lambda size: "x" * size,
++                ),
++                mock.patch.object(hasher, "verify"),
++            ):
++                # Ensure make_password is called to standardize timing.
++                check_password(password, encoded)
++                self.assertEqual(hasher.verify.call_count, 0)
++                self.assertEqual(mock_identify_hasher.mock_calls, [mock.call(encoded)])
++                self.assertEqual(
++                    mock_make_password.mock_calls,
++                    [mock.call("x" * UNUSABLE_PASSWORD_SUFFIX_LENGTH)],
++                )
++
+ 
+ class BasePasswordHasherTests(SimpleTestCase):
+     not_implemented_msg = 'subclasses of BasePasswordHasher must provide %s() method'
+-- 
+2.40.0
+
diff --git a/meta-python/recipes-devtools/python/python3-django/CVE-2024-39329.patch b/meta-python/recipes-devtools/python/python3-django/CVE-2024-39329.patch
new file mode 100644
index 0000000000..c302c0df18
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django/CVE-2024-39329.patch
@@ -0,0 +1,111 @@
+From 156d3186c96e3ec2ca73b8b25dc2ef366e38df14 Mon Sep 17 00:00:00 2001
+From: Michael Manfre <mike@manfre.net>
+Date: Fri, 14 Jun 2024 22:12:58 -0400
+Subject: [PATCH] Fixed CVE-2024-39329 -- Standarized timing of
+ verify_password() when checking unusuable passwords.
+
+Refs #20760.
+
+Thanks Michael Manfre for the fix and to Adam Johnson for the review.
+
+CVE: CVE-2024-39329
+
+Upstream-Status: Backport
+https://github.com/django/django/commit/156d3186c96e3ec2ca73b8b25dc2ef366e38df14
+
+Signed-off-by: Michael Manfre <mike@manfre.net>
+Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
+---
+ django/contrib/auth/hashers.py   | 10 ++++++++--
+ docs/releases/2.2.28.txt         |  7 +++++++
+ tests/auth_tests/test_hashers.py | 32 ++++++++++++++++++++++++++++++++
+ 3 files changed, 47 insertions(+), 2 deletions(-)
+
+diff --git a/django/contrib/auth/hashers.py b/django/contrib/auth/hashers.py
+index 1e8d754..4acb81d 100644
+--- a/django/contrib/auth/hashers.py
++++ b/django/contrib/auth/hashers.py
+@@ -36,14 +36,20 @@ def check_password(password, encoded, setter=None, preferred='default'):
+     If setter is specified, it'll be called when you need to
+     regenerate the password.
+     """
+-    if password is None or not is_password_usable(encoded):
+-        return False
++    fake_runtime = password is None or not is_password_usable(encoded)
+ 
+     preferred = get_hasher(preferred)
+     try:
+         hasher = identify_hasher(encoded)
+     except ValueError:
+         # encoded is gibberish or uses a hasher that's no longer installed.
++        fake_runtime = True
++
++    if fake_runtime:
++        # Run the default password hasher once to reduce the timing difference
++        # between an existing user with an unusable password and a nonexistent
++        # user or missing hasher (similar to #20760).
++        make_password(get_random_string(UNUSABLE_PASSWORD_SUFFIX_LENGTH))
+         return False
+ 
+     hasher_changed = hasher.algorithm != preferred.algorithm
+diff --git a/docs/releases/2.2.28.txt b/docs/releases/2.2.28.txt
+index f3fb298..22fa80e 100644
+--- a/docs/releases/2.2.28.txt
++++ b/docs/releases/2.2.28.txt
+@@ -124,3 +124,10 @@ CVE-2025-57833: Potential SQL injection in ``FilteredRelation`` column aliases
+ using a suitably crafted dictionary, with dictionary expansion, as the
+ ``**kwargs`` passed to :meth:`.QuerySet.annotate` or :meth:`.QuerySet.alias`.
+ 
++CVE-2024-39329: Username enumeration through timing difference for users with unusable passwords
++================================================================================================
++
++The :meth:`~django.contrib.auth.backends.ModelBackend.authenticate()` method
++allowed remote attackers to enumerate users via a timing attack involving login
++requests for users with unusable passwords.
++
+diff --git a/tests/auth_tests/test_hashers.py b/tests/auth_tests/test_hashers.py
+index ee6441b..391b3cc 100644
+--- a/tests/auth_tests/test_hashers.py
++++ b/tests/auth_tests/test_hashers.py
+@@ -433,6 +433,38 @@ class TestUtilsHashPass(SimpleTestCase):
+             check_password('wrong_password', encoded)
+             self.assertEqual(hasher.harden_runtime.call_count, 1)
+ 
++    def test_check_password_calls_make_password_to_fake_runtime(self):
++        hasher = get_hasher("default")
++        cases = [
++            (None, None, None),  # no plain text password provided
++            ("foo", make_password(password=None), None),  # unusable encoded
++            ("letmein", make_password(password="letmein"), ValueError),  # valid encoded
++        ]
++        for password, encoded, hasher_side_effect in cases:
++            with (
++                self.subTest(encoded=encoded),
++                mock.patch(
++                    "django.contrib.auth.hashers.identify_hasher",
++                    side_effect=hasher_side_effect,
++                ) as mock_identify_hasher,
++                mock.patch(
++                    "django.contrib.auth.hashers.make_password"
++                ) as mock_make_password,
++                mock.patch(
++                    "django.contrib.auth.hashers.get_random_string",
++                    side_effect=lambda size: "x" * size,
++                ),
++                mock.patch.object(hasher, "verify"),
++            ):
++                # Ensure make_password is called to standardize timing.
++                check_password(password, encoded)
++                self.assertEqual(hasher.verify.call_count, 0)
++                self.assertEqual(mock_identify_hasher.mock_calls, [mock.call(encoded)])
++                self.assertEqual(
++                    mock_make_password.mock_calls,
++                    [mock.call("x" * UNUSABLE_PASSWORD_SUFFIX_LENGTH)],
++                )
++
+ 
+ class BasePasswordHasherTests(SimpleTestCase):
+     not_implemented_msg = 'subclasses of BasePasswordHasher must provide %s() method'
+-- 
+2.40.0
+
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
index 82cdcb2328..3000e93f81 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
@@ -28,6 +28,7 @@ SRC_URI += "file://CVE-2023-31047.patch \
             file://CVE-2025-26699.patch \
             file://CVE-2024-56374.patch \
             file://CVE-2025-57833.patch \
+            file://CVE-2024-39329.patch \
            "
 
 SRC_URI[sha256sum] = "0200b657afbf1bc08003845ddda053c7641b9b24951e52acd51f6abda33a7413"
diff --git a/meta-python/recipes-devtools/python/python3-django_3.2.25.bb b/meta-python/recipes-devtools/python/python3-django_3.2.25.bb
index fe438016f9..4301eccaae 100644
--- a/meta-python/recipes-devtools/python/python3-django_3.2.25.bb
+++ b/meta-python/recipes-devtools/python/python3-django_3.2.25.bb
@@ -10,6 +10,7 @@ SRC_URI += "\
        file://CVE-2025-26699.patch \
        file://CVE-2024-56374.patch \
        file://CVE-2025-57833.patch \
+       file://CVE-2024-39329.patch \
 "
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
-- 
2.35.5


