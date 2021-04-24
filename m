Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web09.4839.1619259114401375862
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Apr 2021 03:11:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SgtM5Fjd;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id s22so15762665pgk.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Apr 2021 03:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version:in-reply-to:references
         :content-transfer-encoding;
        bh=/EGyxUqaHYHPaWXgGHb3yZiWu/FBxJckNSPN1QwxUOA=;
        b=SgtM5FjdbWXtUMVi2fUAH8Ax4jETdvdTRfLH+uboSS/Yf1kbx3l+QBDKjyTBtEVcE4
         Cn5ILfHNxV+mKkztQhSuZkVYnh+Em9IeeKA8PQTUQV7MJ8bDM/TnACBjPNonVcW1uZPc
         zhfblV565wYGSwVl5umc71y97h+rhQWlhH6dnPzQxkIBT6ovtLpKGp7EKuu2Dlyogqx/
         SyZx0Ppq0nKFQ17dDXsfAExY0R1Tj0DRYDxjAmdW0bq0hC+L4rE3G9pvZKxA5Ejx2eCT
         jy/Owb3gICh3qu8RGqoO2apsdTXoEI40j1KLohBiNnJd6D0lw0OVUI743MpK1p6MAF8K
         sWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :in-reply-to:references:content-transfer-encoding;
        bh=/EGyxUqaHYHPaWXgGHb3yZiWu/FBxJckNSPN1QwxUOA=;
        b=aHKyRQdqtXbD6jwqi32zM+KugAmGfKzlEFoqAscNjjhZa/nME4v6QYSZg2M6U5INTm
         bcju+zG5uN4iEnVM84T4syPwV5vjT+ZqUSYH66c6dTLUw/JhB51kYifSoqqzmAuN/zMl
         g8r5JfWzQu1X8jqZMwjMPW3QM9LNVGCPuB7C7hkRYyYZGinaYhDA+O5d++R+s3YoL3AW
         Cckqi+Wg+YICACONiIWpw/7V5RIgBj7ibg2oScDxr0RblFJ82Hj+Dr7H+JEIMzHTbR2+
         eDib5gY4BQ5qnMjF7o7xvU7q3jq3rqWoFVJslksrEFojMgixvb8oPsEpzGpB7TNSbLY5
         fp/g==
X-Gm-Message-State: AOAM53170YubdMrrFMaPJedtfPPIyqQswEn0llhZ57rM2J6XlvmEi3QB
	clTCukb47Gy5egaseZHCTHSfn9smoQ2Teg==
X-Google-Smtp-Source: ABdhPJwBdyvJV08bI2bF/KG6W0tYo2mI0ASc/uRI0N/um/W2NRKOzxABiqVR5NfSUVwZTBYiKk/27w==
X-Received: by 2002:aa7:908c:0:b029:209:aacd:d8b with SMTP id i12-20020aa7908c0000b0290209aacd0d8bmr8215603pfa.74.1619259113317;
        Sat, 24 Apr 2021 03:11:53 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:9c11:697b:fdac:256e])
        by smtp.gmail.com with ESMTPSA id h17sm1033173pfr.97.2021.04.24.03.11.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 03:11:53 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 4/6] python3-django: upgrade to 2.2.20
Date: Sat, 24 Apr 2021 03:11:45 -0700
Message-Id: <e705d4932a57d0dc3a961fed73ae5ad2e0313429.1619258978.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
In-Reply-To: <cover.1619258978.git.akuster808@gmail.com>
References: <cover.1619258978.git.akuster808@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Chen Qi <Qi.Chen@windriver.com>

2.2.x is LTS, so upgrade to latest release 2.2.20.
This upgrade fixes several CVEs such as CVE-2021-3281.

Also, CVE-2021-28658.patch is dropped as it's already in 2.2.20.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../CVE-2021-28658.patch                      | 289 ------------------
 .../python/python3-django_2.2.16.bb           |  11 -
 .../python/python3-django_2.2.20.bb           |   9 +
 3 files changed, 9 insertions(+), 300 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-django-2.2.16/CVE-2021-28658.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-django_2.2.16.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-django_2.2.20.bb

diff --git a/meta-python/recipes-devtools/python/python3-django-2.2.16/CVE-2021-28658.patch b/meta-python/recipes-devtools/python/python3-django-2.2.16/CVE-2021-28658.patch
deleted file mode 100644
index 325aa00420..0000000000
--- a/meta-python/recipes-devtools/python/python3-django-2.2.16/CVE-2021-28658.patch
+++ /dev/null
@@ -1,289 +0,0 @@
-From 4036d62bda0e9e9f6172943794b744a454ca49c2 Mon Sep 17 00:00:00 2001
-From: Mariusz Felisiak <felisiak.mariusz@gmail.com>
-Date: Tue, 16 Mar 2021 10:19:00 +0100
-Subject: [PATCH] Fixed CVE-2021-28658 -- Fixed potential directory-traversal
- via uploaded files.
-
-Thanks Claude Paroz for the initial patch.
-Thanks Dennis Brinkrolf for the report.
-
-Backport of d4d800ca1addc4141e03c5440a849bb64d1582cd from main.
-
-Upstream-Status: Backport
-CVE: CVE-2021-28658
-
-Reference to upstream patch:
-[https://github.com/django/django/commit/4036d62bda0e9e9f6172943794b744a454ca49c2]
-
-[SG: Adapted stable/2.2.x patch for 2.2.16]
-Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
----
- django/http/multipartparser.py      | 13 ++++--
- docs/releases/2.2.16.txt            | 12 +++++
- tests/file_uploads/tests.py         | 72 ++++++++++++++++++++++-------
- tests/file_uploads/uploadhandler.py | 31 +++++++++++++
- tests/file_uploads/urls.py          |  1 +
- tests/file_uploads/views.py         | 12 ++++-
- 6 files changed, 120 insertions(+), 21 deletions(-)
-
-diff --git a/django/http/multipartparser.py b/django/http/multipartparser.py
-index f6f12ca..5a9cca8 100644
---- a/django/http/multipartparser.py
-+++ b/django/http/multipartparser.py
-@@ -7,6 +7,7 @@ file upload handlers for processing.
- import base64
- import binascii
- import cgi
-+import os
- from urllib.parse import unquote
- 
- from django.conf import settings
-@@ -205,7 +206,7 @@ class MultiPartParser:
-                     file_name = disposition.get('filename')
-                     if file_name:
-                         file_name = force_text(file_name, encoding, errors='replace')
--                        file_name = self.IE_sanitize(unescape_entities(file_name))
-+                        file_name = self.sanitize_file_name(file_name)
-                     if not file_name:
-                         continue
- 
-@@ -293,9 +294,13 @@ class MultiPartParser:
-                 self._files.appendlist(force_text(old_field_name, self._encoding, errors='replace'), file_obj)
-                 break
- 
--    def IE_sanitize(self, filename):
--        """Cleanup filename from Internet Explorer full paths."""
--        return filename and filename[filename.rfind("\\") + 1:].strip()
-+    def sanitize_file_name(self, file_name):
-+        file_name = unescape_entities(file_name)
-+        # Cleanup Windows-style path separators.
-+        file_name = file_name[file_name.rfind('\\') + 1:].strip()
-+        return os.path.basename(file_name)
-+
-+    IE_sanitize = sanitize_file_name
- 
-     def _close_files(self):
-         # Free up all file handles.
-diff --git a/docs/releases/2.2.16.txt b/docs/releases/2.2.16.txt
-index 31231fb..4b7021b 100644
---- a/docs/releases/2.2.16.txt
-+++ b/docs/releases/2.2.16.txt
-@@ -2,6 +2,18 @@
- Django 2.2.16 release notes
- ===========================
- 
-+*April 6, 2021*
-+
-+Backported from Django 2.2.20 a fix for a security issue.
-+
-+CVE-2021-28658: Potential directory-traversal via uploaded files
-+================================================================
-+
-+``MultiPartParser`` allowed directory-traversal via uploaded files with
-+suitably crafted file names.
-+
-+Built-in upload handlers were not affected by this vulnerability.
-+
- *September 1, 2020*
- 
- Django 2.2.16 fixes two security issues and two data loss bugs in 2.2.15.
-diff --git a/tests/file_uploads/tests.py b/tests/file_uploads/tests.py
-index ea4976d..2a08d1b 100644
---- a/tests/file_uploads/tests.py
-+++ b/tests/file_uploads/tests.py
-@@ -22,6 +22,21 @@ UNICODE_FILENAME = 'test-0123456789_中文_Orléans.jpg'
- MEDIA_ROOT = sys_tempfile.mkdtemp()
- UPLOAD_TO = os.path.join(MEDIA_ROOT, 'test_upload')
- 
-+CANDIDATE_TRAVERSAL_FILE_NAMES = [
-+    '/tmp/hax0rd.txt',          # Absolute path, *nix-style.
-+    'C:\\Windows\\hax0rd.txt',  # Absolute path, win-style.
-+    'C:/Windows/hax0rd.txt',    # Absolute path, broken-style.
-+    '\\tmp\\hax0rd.txt',        # Absolute path, broken in a different way.
-+    '/tmp\\hax0rd.txt',         # Absolute path, broken by mixing.
-+    'subdir/hax0rd.txt',        # Descendant path, *nix-style.
-+    'subdir\\hax0rd.txt',       # Descendant path, win-style.
-+    'sub/dir\\hax0rd.txt',      # Descendant path, mixed.
-+    '../../hax0rd.txt',         # Relative path, *nix-style.
-+    '..\\..\\hax0rd.txt',       # Relative path, win-style.
-+    '../..\\hax0rd.txt',        # Relative path, mixed.
-+    '..&#x2F;hax0rd.txt',       # HTML entities.
-+]
-+
- 
- @override_settings(MEDIA_ROOT=MEDIA_ROOT, ROOT_URLCONF='file_uploads.urls', MIDDLEWARE=[])
- class FileUploadTests(TestCase):
-@@ -205,22 +220,8 @@ class FileUploadTests(TestCase):
-         # a malicious payload with an invalid file name (containing os.sep or
-         # os.pardir). This similar to what an attacker would need to do when
-         # trying such an attack.
--        scary_file_names = [
--            "/tmp/hax0rd.txt",          # Absolute path, *nix-style.
--            "C:\\Windows\\hax0rd.txt",  # Absolute path, win-style.
--            "C:/Windows/hax0rd.txt",    # Absolute path, broken-style.
--            "\\tmp\\hax0rd.txt",        # Absolute path, broken in a different way.
--            "/tmp\\hax0rd.txt",         # Absolute path, broken by mixing.
--            "subdir/hax0rd.txt",        # Descendant path, *nix-style.
--            "subdir\\hax0rd.txt",       # Descendant path, win-style.
--            "sub/dir\\hax0rd.txt",      # Descendant path, mixed.
--            "../../hax0rd.txt",         # Relative path, *nix-style.
--            "..\\..\\hax0rd.txt",       # Relative path, win-style.
--            "../..\\hax0rd.txt"         # Relative path, mixed.
--        ]
--
-         payload = client.FakePayload()
--        for i, name in enumerate(scary_file_names):
-+        for i, name in enumerate(CANDIDATE_TRAVERSAL_FILE_NAMES):
-             payload.write('\r\n'.join([
-                 '--' + client.BOUNDARY,
-                 'Content-Disposition: form-data; name="file%s"; filename="%s"' % (i, name),
-@@ -240,7 +241,7 @@ class FileUploadTests(TestCase):
-         response = self.client.request(**r)
-         # The filenames should have been sanitized by the time it got to the view.
-         received = response.json()
--        for i, name in enumerate(scary_file_names):
-+        for i, name in enumerate(CANDIDATE_TRAVERSAL_FILE_NAMES):
-             got = received["file%s" % i]
-             self.assertEqual(got, "hax0rd.txt")
- 
-@@ -518,6 +519,36 @@ class FileUploadTests(TestCase):
-         # shouldn't differ.
-         self.assertEqual(os.path.basename(obj.testfile.path), 'MiXeD_cAsE.txt')
- 
-+    def test_filename_traversal_upload(self):
-+        os.makedirs(UPLOAD_TO, exist_ok=True)
-+        self.addCleanup(shutil.rmtree, MEDIA_ROOT)
-+        file_name = '..&#x2F;test.txt',
-+        payload = client.FakePayload()
-+        payload.write(
-+            '\r\n'.join([
-+                '--' + client.BOUNDARY,
-+                'Content-Disposition: form-data; name="my_file"; '
-+                'filename="%s";' % file_name,
-+                'Content-Type: text/plain',
-+                '',
-+                'file contents.\r\n',
-+                '\r\n--' + client.BOUNDARY + '--\r\n',
-+            ]),
-+        )
-+        r = {
-+            'CONTENT_LENGTH': len(payload),
-+            'CONTENT_TYPE': client.MULTIPART_CONTENT,
-+            'PATH_INFO': '/upload_traversal/',
-+            'REQUEST_METHOD': 'POST',
-+            'wsgi.input': payload,
-+        }
-+        response = self.client.request(**r)
-+        result = response.json()
-+        self.assertEqual(response.status_code, 200)
-+        self.assertEqual(result['file_name'], 'test.txt')
-+        self.assertIs(os.path.exists(os.path.join(MEDIA_ROOT, 'test.txt')), False)
-+        self.assertIs(os.path.exists(os.path.join(UPLOAD_TO, 'test.txt')), True)
-+
- 
- @override_settings(MEDIA_ROOT=MEDIA_ROOT)
- class DirectoryCreationTests(SimpleTestCase):
-@@ -591,6 +622,15 @@ class MultiParserTests(SimpleTestCase):
-         }, StringIO('x'), [], 'utf-8')
-         self.assertEqual(multipart_parser._content_length, 0)
- 
-+    def test_sanitize_file_name(self):
-+        parser = MultiPartParser({
-+            'CONTENT_TYPE': 'multipart/form-data; boundary=_foo',
-+            'CONTENT_LENGTH': '1'
-+        }, StringIO('x'), [], 'utf-8')
-+        for file_name in CANDIDATE_TRAVERSAL_FILE_NAMES:
-+            with self.subTest(file_name=file_name):
-+                self.assertEqual(parser.sanitize_file_name(file_name), 'hax0rd.txt')
-+
-     def test_rfc2231_parsing(self):
-         test_data = (
-             (b"Content-Type: application/x-stuff; title*=us-ascii'en-us'This%20is%20%2A%2A%2Afun%2A%2A%2A",
-diff --git a/tests/file_uploads/uploadhandler.py b/tests/file_uploads/uploadhandler.py
-index 7c6199f..65d70c6 100644
---- a/tests/file_uploads/uploadhandler.py
-+++ b/tests/file_uploads/uploadhandler.py
-@@ -1,6 +1,8 @@
- """
- Upload handlers to test the upload API.
- """
-+import os
-+from tempfile import NamedTemporaryFile
- 
- from django.core.files.uploadhandler import FileUploadHandler, StopUpload
- 
-@@ -35,3 +37,32 @@ class ErroringUploadHandler(FileUploadHandler):
-     """A handler that raises an exception."""
-     def receive_data_chunk(self, raw_data, start):
-         raise CustomUploadError("Oops!")
-+
-+
-+class TraversalUploadHandler(FileUploadHandler):
-+    """A handler with potential directory-traversal vulnerability."""
-+    def __init__(self, request=None):
-+        from .views import UPLOAD_TO
-+
-+        super().__init__(request)
-+        self.upload_dir = UPLOAD_TO
-+
-+    def file_complete(self, file_size):
-+        self.file.seek(0)
-+        self.file.size = file_size
-+        with open(os.path.join(self.upload_dir, self.file_name), 'wb') as fp:
-+            fp.write(self.file.read())
-+        return self.file
-+
-+    def new_file(
-+        self, field_name, file_name, content_type, content_length, charset=None,
-+        content_type_extra=None,
-+    ):
-+        super().new_file(
-+            file_name, file_name, content_length, content_length, charset,
-+            content_type_extra,
-+        )
-+        self.file = NamedTemporaryFile(suffix='.upload', dir=self.upload_dir)
-+
-+    def receive_data_chunk(self, raw_data, start):
-+        self.file.write(raw_data)
-diff --git a/tests/file_uploads/urls.py b/tests/file_uploads/urls.py
-index 3e7985d..eaac1da 100644
---- a/tests/file_uploads/urls.py
-+++ b/tests/file_uploads/urls.py
-@@ -4,6 +4,7 @@ from . import views
- 
- urlpatterns = [
-     path('upload/', views.file_upload_view),
-+    path('upload_traversal/', views.file_upload_traversal_view),
-     path('verify/', views.file_upload_view_verify),
-     path('unicode_name/', views.file_upload_unicode_name),
-     path('echo/', views.file_upload_echo),
-diff --git a/tests/file_uploads/views.py b/tests/file_uploads/views.py
-index d4947e4..137c6f3 100644
---- a/tests/file_uploads/views.py
-+++ b/tests/file_uploads/views.py
-@@ -6,7 +6,9 @@ from django.http import HttpResponse, HttpResponseServerError, JsonResponse
- 
- from .models import FileModel
- from .tests import UNICODE_FILENAME, UPLOAD_TO
--from .uploadhandler import ErroringUploadHandler, QuotaUploadHandler
-+from .uploadhandler import (
-+    ErroringUploadHandler, QuotaUploadHandler, TraversalUploadHandler,
-+)
- 
- 
- def file_upload_view(request):
-@@ -158,3 +160,11 @@ def file_upload_fd_closing(request, access):
-     if access == 't':
-         request.FILES  # Trigger file parsing.
-     return HttpResponse('')
-+
-+
-+def file_upload_traversal_view(request):
-+    request.upload_handlers.insert(0, TraversalUploadHandler())
-+    request.FILES  # Trigger file parsing.
-+    return JsonResponse(
-+        {'file_name': request.upload_handlers[0].file_name},
-+    )
--- 
-2.17.1
-
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.16.bb b/meta-python/recipes-devtools/python/python3-django_2.2.16.bb
deleted file mode 100644
index eb626e8d3f..0000000000
--- a/meta-python/recipes-devtools/python/python3-django_2.2.16.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require python-django.inc
-inherit setuptools3
-
-SRC_URI[md5sum] = "93faf5bbd54a19ea49f4932a813b9758"
-SRC_URI[sha256sum] = "62cf45e5ee425c52e411c0742e641a6588b7e8af0d2c274a27940931b2786594"
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-sqlparse \
-"
-SRC_URI += "file://CVE-2021-28658.patch \
-"
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.20.bb b/meta-python/recipes-devtools/python/python3-django_2.2.20.bb
new file mode 100644
index 0000000000..905d022a4f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.20.bb
@@ -0,0 +1,9 @@
+require python-django.inc
+inherit setuptools3
+
+SRC_URI[md5sum] = "947060d96ccc0a05e8049d839e541b25"
+SRC_URI[sha256sum] = "2569f9dc5f8e458a5e988b03d6b7a02bda59b006d6782f4ea0fd590ed7336a64"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-sqlparse \
+"
-- 
2.17.1

