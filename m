Return-Path: <saravanan.kadambathursubramaniyam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55E6BD111A8
	for <webhook@archiver.kernel.org>; Sun, 30 Nov 2025 12:20:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3297.1764505222260581212
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Nov 2025 04:20:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KXnyIvH4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4429d7dc3a=saravanan.kadambathursubramaniyam@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AUCKL7S3129642;
	Sun, 30 Nov 2025 04:20:21 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=Wax9JSRlu2hkH29Vaqkd
	fcOeOxd10TFa/hev130dyi4=; b=KXnyIvH4MfbID/b2r3HcLDxrHbgmeRbnS5fv
	zwe8Yn9vF+akkqE7OmsjKX/xc2vA017+JweyNhOPGvZtTrr0QLBXN5C1uAPGUaQ2
	u4Qyr0q2pt39eVWYhZlxf+MRoclpQHf5M4eUhRJiXlZFpWVh64Blx6jA50bGSiId
	Ak/4fcDDgziqLj/h0Zl86TXgusoOGOBd3G4FbbMovRrOmklaVICWsZy/NrpcmdbK
	+g42JHZUnN8A/dVewZRLO2cveMZvwpwBnSyX9PuhPg4U/Km+ASnO85F4p/zWjvVK
	pEtNdE7Z8ALX5AeJYQnQCicgbPmxwmWR/lY6gjCffwrrxcb1XQ==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ar17mrk8b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 04:20:21 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 30 Nov 2025 04:20:20 -0800
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 30 Nov 2025 04:20:19 -0800
From: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] python3-django: fix CVE-2024-39330
Date: Sun, 30 Nov 2025 17:50:17 +0530
Message-ID: <20251130122017.3078236-1-saravanan.kadambathursubramaniyam@windriver.com>
X-Mailer: git-send-email 2.35.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: RDI3ojISezdeU3OZ8tdyS56Zkko9HLIO
X-Authority-Analysis: v=2.4 cv=Ws4m8Nfv c=1 sm=1 tr=0 ts=692c3685 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=AoAGiEJO2RIqMTtk4XMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: RDI3ojISezdeU3OZ8tdyS56Zkko9HLIO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTMwMDEwNiBTYWx0ZWRfX47EVDvtNZZ+g
 MBHst7zGlu8HtZQQTiHo7FoI3vkB8SVqPSh42tHcS+DXIz1Kaw422Kuxo6QHK8zCRdrc9Zsid3M
 z4lyoYKi/z6mAa+E4KNYOJwcL7G8QJV6dMcvyKjjM4GOOMWb4M92St5pMpdB1m2VcJweYi8aFAq
 wWBJfjA4zEVvvgEjX52OpPnos5n290fR35In/x9U+6wKX8pYVa7cYQBxgpBfyvyp87YbvZMzojw
 DVB9+xKCNRn4ux4hwNFSLjoNoSqFw6cCYLE50DCEzopENgHqtvObxsYmw2qhf9T5QsL9LoHORGz
 dHBm3wZnfBpoY2BfJmgdJTCZQ8k0QkIvTwXL7Fr9+gHPA+4JjIsXrUACDPzvGiBrAx02SiQTvKt
 xERI6U1pDyHUns1hAffdcdkLRJEl4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511300106
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 12:20:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122169

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-39330

Upstream-patch:
https://github.com/django/django/commit/2b00edc0151a660d1eb86da4059904a0fc4e095e

Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
---
 .../CVE-2024-39330.patch                      | 184 ++++++++++++++++++
 .../python3-django/CVE-2024-39330.patch       | 181 +++++++++++++++++
 .../python/python3-django_2.2.28.bb           |   1 +
 .../python/python3-django_3.2.25.bb           |   1 +
 4 files changed, 367 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django-3.2.25/CVE-2024-39330.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django/CVE-2024-39330.patch

diff --git a/meta-python/recipes-devtools/python/python3-django-3.2.25/CVE-2024-39330.patch b/meta-python/recipes-devtools/python/python3-django-3.2.25/CVE-2024-39330.patch
new file mode 100644
index 0000000000..81e9a38ed1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-3.2.25/CVE-2024-39330.patch
@@ -0,0 +1,184 @@
+From 2b00edc0151a660d1eb86da4059904a0fc4e095e Mon Sep 17 00:00:00 2001
+From: Natalia <124304+nessita@users.noreply.github.com>
+Date: Wed, 20 Mar 2024 13:55:21 -0300
+Subject: [PATCH] Fixed CVE-2024-39330 -- Added extra file name validation in
+ Storage's save method.
+
+Thanks to Josh Schneier for the report, and to Carlton Gibson and Sarah
+Boyce for the reviews.
+
+CVE: CVE-2024-39330
+
+Upstream-Status: Backport
+https://github.com/django/django/commit/2b00edc0151a660d1eb86da4059904a0fc4e095e
+
+Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
+---
+ django/core/files/storage.py    | 11 ++++++
+ django/core/files/utils.py      |  7 ++--
+ docs/releases/3.2.25.txt        | 12 ++++++
+ tests/file_storage/test_base.py | 70 +++++++++++++++++++++++++++++++++
+ tests/file_storage/tests.py     |  6 ---
+ 5 files changed, 96 insertions(+), 10 deletions(-)
+ create mode 100644 tests/file_storage/test_base.py
+
+diff --git a/django/core/files/storage.py b/django/core/files/storage.py
+index 22984f9..680f5ec 100644
+--- a/django/core/files/storage.py
++++ b/django/core/files/storage.py
+@@ -50,7 +50,18 @@ class Storage:
+         if not hasattr(content, 'chunks'):
+             content = File(content, name)
+ 
++        # Ensure that the name is valid, before and after having the storage
++        # system potentially modifying the name. This duplicates the check made
++        # inside `get_available_name` but it's necessary for those cases where
++        # `get_available_name` is overriden and validation is lost.
++        validate_file_name(name, allow_relative_path=True)
++
++        # Potentially find a different name depending on storage constraints.
+         name = self.get_available_name(name, max_length=max_length)
++        # Validate the (potentially) new name.
++        validate_file_name(name, allow_relative_path=True)
++
++        # The save operation should return the actual name of the file saved.
+         name = self._save(name, content)
+         # Ensure that the name returned from the storage system is still valid.
+         validate_file_name(name, allow_relative_path=True)
+diff --git a/django/core/files/utils.py b/django/core/files/utils.py
+index f28cea1..a1fea44 100644
+--- a/django/core/files/utils.py
++++ b/django/core/files/utils.py
+@@ -10,10 +10,9 @@ def validate_file_name(name, allow_relative_path=False):
+         raise SuspiciousFileOperation("Could not derive file name from '%s'" % name)
+ 
+     if allow_relative_path:
+-        # Use PurePosixPath() because this branch is checked only in
+-        # FileField.generate_filename() where all file paths are expected to be
+-        # Unix style (with forward slashes).
+-        path = pathlib.PurePosixPath(name)
++        # Ensure that name can be treated as a pure posix path, i.e. Unix
++        # style (with forward slashes).
++        path = pathlib.PurePosixPath(str(name).replace("\\", "/"))
+         if path.is_absolute() or '..' in path.parts:
+             raise SuspiciousFileOperation(
+                 "Detected path traversal attempt in '%s'" % name
+diff --git a/docs/releases/3.2.25.txt b/docs/releases/3.2.25.txt
+index a613b08..60236d5 100644
+--- a/docs/releases/3.2.25.txt
++++ b/docs/releases/3.2.25.txt
+@@ -47,6 +47,18 @@ The :meth:`~django.contrib.auth.backends.ModelBackend.authenticate()` method
+ allowed remote attackers to enumerate users via a timing attack involving login
+ requests for users with unusable passwords.
+ 
++CVE-2024-39330: Potential directory-traversal via ``Storage.save()``
++====================================================================
++
++Derived classes of the :class:`~django.core.files.storage.Storage` base class
++which override :meth:`generate_filename()
++<django.core.files.storage.Storage.generate_filename()>` without replicating
++the file path validations existing in the parent class, allowed for potential
++directory-traversal via certain inputs when calling :meth:`save()
++<django.core.files.storage.Storage.save()>`.
++
++Built-in ``Storage`` sub-classes were not affected by this vulnerability.
++
+ Bugfixes
+ ========
+ 
+diff --git a/tests/file_storage/test_base.py b/tests/file_storage/test_base.py
+new file mode 100644
+index 0000000..c5338b8
+--- /dev/null
++++ b/tests/file_storage/test_base.py
+@@ -0,0 +1,70 @@
++import os
++from unittest import mock
++
++from django.core.exceptions import SuspiciousFileOperation
++from django.core.files.storage import Storage
++from django.test import SimpleTestCase
++
++
++class CustomStorage(Storage):
++    """Simple Storage subclass implementing the bare minimum for testing."""
++
++    def exists(self, name):
++        return False
++
++    def _save(self, name):
++        return name
++
++
++class StorageValidateFileNameTests(SimpleTestCase):
++    invalid_file_names = [
++        os.path.join("path", "to", os.pardir, "test.file"),
++        os.path.join(os.path.sep, "path", "to", "test.file"),
++    ]
++    error_msg = "Detected path traversal attempt in '%s'"
++
++    def test_validate_before_get_available_name(self):
++        s = CustomStorage()
++        # The initial name passed to `save` is not valid nor safe, fail early.
++        for name in self.invalid_file_names:
++            with (
++                self.subTest(name=name),
++                mock.patch.object(s, "get_available_name") as mock_get_available_name,
++                mock.patch.object(s, "_save") as mock_internal_save,
++            ):
++                with self.assertRaisesMessage(
++                    SuspiciousFileOperation, self.error_msg % name
++                ):
++                    s.save(name, content="irrelevant")
++                self.assertEqual(mock_get_available_name.mock_calls, [])
++                self.assertEqual(mock_internal_save.mock_calls, [])
++
++    def test_validate_after_get_available_name(self):
++        s = CustomStorage()
++        # The initial name passed to `save` is valid and safe, but the returned
++        # name from `get_available_name` is not.
++        for name in self.invalid_file_names:
++            with (
++                self.subTest(name=name),
++                mock.patch.object(s, "get_available_name", return_value=name),
++                mock.patch.object(s, "_save") as mock_internal_save,
++            ):
++                with self.assertRaisesMessage(
++                    SuspiciousFileOperation, self.error_msg % name
++                ):
++                    s.save("valid-file-name.txt", content="irrelevant")
++                self.assertEqual(mock_internal_save.mock_calls, [])
++
++    def test_validate_after_internal_save(self):
++        s = CustomStorage()
++        # The initial name passed to `save` is valid and safe, but the result
++        # from `_save` is not (this is achieved by monkeypatching _save).
++        for name in self.invalid_file_names:
++            with (
++                self.subTest(name=name),
++                mock.patch.object(s, "_save", return_value=name),
++            ):
++                with self.assertRaisesMessage(
++                    SuspiciousFileOperation, self.error_msg % name
++                ):
++                    s.save("valid-file-name.txt", content="irrelevant")
+diff --git a/tests/file_storage/tests.py b/tests/file_storage/tests.py
+index 7238093..6d17a71 100644
+--- a/tests/file_storage/tests.py
++++ b/tests/file_storage/tests.py
+@@ -297,12 +297,6 @@ class FileStorageTests(SimpleTestCase):
+ 
+         self.storage.delete('path/to/test.file')
+ 
+-    def test_file_save_abs_path(self):
+-        test_name = 'path/to/test.file'
+-        f = ContentFile('file saved with path')
+-        f_name = self.storage.save(os.path.join(self.temp_dir, test_name), f)
+-        self.assertEqual(f_name, test_name)
+-
+     def test_save_doesnt_close(self):
+         with TemporaryUploadedFile('test', 'text/plain', 1, 'utf8') as file:
+             file.write(b'1')
+-- 
+2.48.1
+
diff --git a/meta-python/recipes-devtools/python/python3-django/CVE-2024-39330.patch b/meta-python/recipes-devtools/python/python3-django/CVE-2024-39330.patch
new file mode 100644
index 0000000000..759716617a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django/CVE-2024-39330.patch
@@ -0,0 +1,181 @@
+From 2b00edc0151a660d1eb86da4059904a0fc4e095e Mon Sep 17 00:00:00 2001
+From: Natalia <124304+nessita@users.noreply.github.com>
+Date: Wed, 20 Mar 2024 13:55:21 -0300
+Subject: [PATCH] Fixed CVE-2024-39330 -- Added extra file name validation in
+ Storage's save method.
+
+Thanks to Josh Schneier for the report, and to Carlton Gibson and Sarah
+Boyce for the reviews.
+
+CVE: CVE-2024-39330
+
+Upstream-Status: Backport
+https://github.com/django/django/commit/2b00edc0151a660d1eb86da4059904a0fc4e095e
+
+Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
+---
+ django/core/files/storage.py    | 11 ++++++
+ django/core/files/utils.py      |  7 ++--
+ docs/releases/2.2.28.txt        | 12 ++++++
+ tests/file_storage/test_base.py | 70 +++++++++++++++++++++++++++++++++
+ tests/file_storage/tests.py     |  6 ---
+ 5 files changed, 96 insertions(+), 10 deletions(-)
+ create mode 100644 tests/file_storage/test_base.py
+
+diff --git a/django/core/files/storage.py b/django/core/files/storage.py
+index ea5bbc8..8c633ec 100644
+--- a/django/core/files/storage.py
++++ b/django/core/files/storage.py
+@@ -50,7 +50,18 @@ class Storage:
+         if not hasattr(content, 'chunks'):
+             content = File(content, name)
+ 
++        # Ensure that the name is valid, before and after having the storage
++        # system potentially modifying the name. This duplicates the check made
++        # inside `get_available_name` but it's necessary for those cases where
++        # `get_available_name` is overriden and validation is lost.
++        validate_file_name(name, allow_relative_path=True)
++
++        # Potentially find a different name depending on storage constraints.
+         name = self.get_available_name(name, max_length=max_length)
++        # Validate the (potentially) new name.
++        validate_file_name(name, allow_relative_path=True)
++
++        # The save operation should return the actual name of the file saved.
+         name = self._save(name, content)
+         # Ensure that the name returned from the storage system is still valid.
+         validate_file_name(name, allow_relative_path=True)
+diff --git a/django/core/files/utils.py b/django/core/files/utils.py
+index f28cea1..a1fea44 100644
+--- a/django/core/files/utils.py
++++ b/django/core/files/utils.py
+@@ -10,10 +10,9 @@ def validate_file_name(name, allow_relative_path=False):
+         raise SuspiciousFileOperation("Could not derive file name from '%s'" % name)
+ 
+     if allow_relative_path:
+-        # Use PurePosixPath() because this branch is checked only in
+-        # FileField.generate_filename() where all file paths are expected to be
+-        # Unix style (with forward slashes).
+-        path = pathlib.PurePosixPath(name)
++        # Ensure that name can be treated as a pure posix path, i.e. Unix
++        # style (with forward slashes).
++        path = pathlib.PurePosixPath(str(name).replace("\\", "/"))
+         if path.is_absolute() or '..' in path.parts:
+             raise SuspiciousFileOperation(
+                 "Detected path traversal attempt in '%s'" % name
+diff --git a/docs/releases/2.2.28.txt b/docs/releases/2.2.28.txt
+index 22fa80e..3503f38 100644
+--- a/docs/releases/2.2.28.txt
++++ b/docs/releases/2.2.28.txt
+@@ -131,3 +131,15 @@ The :meth:`~django.contrib.auth.backends.ModelBackend.authenticate()` method
+ allowed remote attackers to enumerate users via a timing attack involving login
+ requests for users with unusable passwords.
+ 
++CVE-2024-39330: Potential directory-traversal via ``Storage.save()``
++====================================================================
++
++Derived classes of the :class:`~django.core.files.storage.Storage` base class
++which override :meth:`generate_filename()
++<django.core.files.storage.Storage.generate_filename()>` without replicating
++the file path validations existing in the parent class, allowed for potential
++directory-traversal via certain inputs when calling :meth:`save()
++<django.core.files.storage.Storage.save()>`.
++
++Built-in ``Storage`` sub-classes were not affected by this vulnerability.
++
+diff --git a/tests/file_storage/test_base.py b/tests/file_storage/test_base.py
+new file mode 100644
+index 0000000..c5338b8
+--- /dev/null
++++ b/tests/file_storage/test_base.py
+@@ -0,0 +1,70 @@
++import os
++from unittest import mock
++
++from django.core.exceptions import SuspiciousFileOperation
++from django.core.files.storage import Storage
++from django.test import SimpleTestCase
++
++
++class CustomStorage(Storage):
++    """Simple Storage subclass implementing the bare minimum for testing."""
++
++    def exists(self, name):
++        return False
++
++    def _save(self, name):
++        return name
++
++
++class StorageValidateFileNameTests(SimpleTestCase):
++    invalid_file_names = [
++        os.path.join("path", "to", os.pardir, "test.file"),
++        os.path.join(os.path.sep, "path", "to", "test.file"),
++    ]
++    error_msg = "Detected path traversal attempt in '%s'"
++
++    def test_validate_before_get_available_name(self):
++        s = CustomStorage()
++        # The initial name passed to `save` is not valid nor safe, fail early.
++        for name in self.invalid_file_names:
++            with (
++                self.subTest(name=name),
++                mock.patch.object(s, "get_available_name") as mock_get_available_name,
++                mock.patch.object(s, "_save") as mock_internal_save,
++            ):
++                with self.assertRaisesMessage(
++                    SuspiciousFileOperation, self.error_msg % name
++                ):
++                    s.save(name, content="irrelevant")
++                self.assertEqual(mock_get_available_name.mock_calls, [])
++                self.assertEqual(mock_internal_save.mock_calls, [])
++
++    def test_validate_after_get_available_name(self):
++        s = CustomStorage()
++        # The initial name passed to `save` is valid and safe, but the returned
++        # name from `get_available_name` is not.
++        for name in self.invalid_file_names:
++            with (
++                self.subTest(name=name),
++                mock.patch.object(s, "get_available_name", return_value=name),
++                mock.patch.object(s, "_save") as mock_internal_save,
++            ):
++                with self.assertRaisesMessage(
++                    SuspiciousFileOperation, self.error_msg % name
++                ):
++                    s.save("valid-file-name.txt", content="irrelevant")
++                self.assertEqual(mock_internal_save.mock_calls, [])
++
++    def test_validate_after_internal_save(self):
++        s = CustomStorage()
++        # The initial name passed to `save` is valid and safe, but the result
++        # from `_save` is not (this is achieved by monkeypatching _save).
++        for name in self.invalid_file_names:
++            with (
++                self.subTest(name=name),
++                mock.patch.object(s, "_save", return_value=name),
++            ):
++                with self.assertRaisesMessage(
++                    SuspiciousFileOperation, self.error_msg % name
++                ):
++                    s.save("valid-file-name.txt", content="irrelevant")
+diff --git a/tests/file_storage/tests.py b/tests/file_storage/tests.py
+index 4c6f692..0e69264 100644
+--- a/tests/file_storage/tests.py
++++ b/tests/file_storage/tests.py
+@@ -291,12 +291,6 @@ class FileStorageTests(SimpleTestCase):
+ 
+         self.storage.delete('path/to/test.file')
+ 
+-    def test_file_save_abs_path(self):
+-        test_name = 'path/to/test.file'
+-        f = ContentFile('file saved with path')
+-        f_name = self.storage.save(os.path.join(self.temp_dir, test_name), f)
+-        self.assertEqual(f_name, test_name)
+-
+     def test_save_doesnt_close(self):
+         with TemporaryUploadedFile('test', 'text/plain', 1, 'utf8') as file:
+             file.write(b'1')
+-- 
+2.48.1
+
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
index 3000e93f81..b5b2570ddb 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
@@ -29,6 +29,7 @@ SRC_URI += "file://CVE-2023-31047.patch \
             file://CVE-2024-56374.patch \
             file://CVE-2025-57833.patch \
             file://CVE-2024-39329.patch \
+            file://CVE-2024-39330.patch \
            "
 
 SRC_URI[sha256sum] = "0200b657afbf1bc08003845ddda053c7641b9b24951e52acd51f6abda33a7413"
diff --git a/meta-python/recipes-devtools/python/python3-django_3.2.25.bb b/meta-python/recipes-devtools/python/python3-django_3.2.25.bb
index 4301eccaae..2d94b2109c 100644
--- a/meta-python/recipes-devtools/python/python3-django_3.2.25.bb
+++ b/meta-python/recipes-devtools/python/python3-django_3.2.25.bb
@@ -11,6 +11,7 @@ SRC_URI += "\
        file://CVE-2024-56374.patch \
        file://CVE-2025-57833.patch \
        file://CVE-2024-39329.patch \
+       file://CVE-2024-39330.patch \
 "
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
-- 
2.35.5


