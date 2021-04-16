Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web09.998.1618617010133444716
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Apr 2021 16:50:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HocbvGK+;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id h11so1702097pfn.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Apr 2021 16:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=S3isWSmWDwU3hmgotLGK6NfPtxKJXUHKYhX7LfmpSGs=;
        b=HocbvGK++mvvjCDLqMRxlxvQrAiZ7UNNCpvDPl6OfzC7q4v/9Av+pk3Z8xIyPdSyvi
         5mQNd1mHoByhaCUXRpix/xTuR09X5QciWfmTAxf8PUZDvbMKX6hPm/D8HX1Nnnf66Sn0
         B2gqKzWMOFycy3R/y1UbiLYFbIOGB6F1zXD9zDhxjVH75kL/E5Zlmht7W/wORaOv8vxk
         6qNeshz83UyH2e08VMVbB0qUFMvGFkqmFEabW4EKFvVM4P/zwjXP4w7dZ36akpbTEyBk
         Jbocc7IcI01BpAurxbthXnUK17rAJiXwS/jJXOK0HWvhhFGL3+3DcegnU2XQ2JeOqZtt
         9VSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=S3isWSmWDwU3hmgotLGK6NfPtxKJXUHKYhX7LfmpSGs=;
        b=fG/Sdet/cHyr7OPDrVS+BiFCB++P6sYLhaucgJpd43U/UbwFgdCAwLZ/um7Bex6dS4
         KE8U8OWGwOB2oIAKFeoOZHarRvVqzX8QxWbq1crMTUsfAmZKiD8crGSWzTYOPbGMCrCu
         KfOCmQ/xhBubkVqkp4QGIoCBfP5qj087jzaBwla/0FzhaT+S9ydelxJa1IEJzWVAGlzz
         eYoEHSokS3yH1jdtQXpliqdiddWc4HU+CpcSSQOqiyH9QPy2azOog52c9Y3eSp5QyGRw
         z0yqBqfzmo3KAuVH4M+ZpDK42ula3BTCJ8/U0jzuXL4LRUg/+1BFlA91prOg9rGMk2gM
         2oiA==
X-Gm-Message-State: AOAM5330RDtwe9bQMsw5aZebu1QtG9vxB9nz8f0ZOOCphht3jXBx5jbF
	wQcVFpNq1CWnNnTuRfbrIRCOl8NB43Q+TQ==
X-Google-Smtp-Source: ABdhPJxZ71Dk2GMHS7GZLJWKaHcRInwoOKpo9JM4kFg2jOjriXRQN7/hk3Igp9LxVAw4oHUgK77riw==
X-Received: by 2002:aa7:8187:0:b029:213:d43b:4782 with SMTP id g7-20020aa781870000b0290213d43b4782mr10030462pfi.26.1618617009206;
        Fri, 16 Apr 2021 16:50:09 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:8c8:34ea:7b53:33eb? ([2601:202:4180:a5c0:8c8:34ea:7b53:33eb])
        by smtp.gmail.com with ESMTPSA id j189sm5508568pfd.21.2021.04.16.16.50.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Apr 2021 16:50:08 -0700 (PDT)
Subject: Re: [oe] [PATCH] [oe-devel] [meta-python] python3-django: fix CVE-2021-28658
To: Stefan Ghinea <stefan.ghinea@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20210416152417.26659-1-stefan.ghinea@windriver.com>
From: "Armin Kuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <aab4ed03-1301-99c0-c3fc-3cb051f1fad6@gmail.com>
Date: Fri, 16 Apr 2021 16:50:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210416152417.26659-1-stefan.ghinea@windriver.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hello Stehan,

On 4/16/21 8:24 AM, Stefan Ghinea wrote:
> In Django 2.2 before 2.2.20, 3.0 before 3.0.14, and 3.1 before 3.1.8,
> MultiPartParser allowed directory traversal via uploaded files with
> suitably crafted file names. Built-in upload handlers were not affected
> by this vulnerability.
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2021-28658

Thank you for sending a security fix for this recipe. Do you happen to
know if the 2.2.x  is an LTS or bugfix only branch?

- Armin
>
> Upstream patches:
> https://github.com/django/django/commit/4036d62bda0e9e9f6172943794b744a454ca49c2
>
> Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
> ---
>  .../CVE-2021-28658.patch                      | 289 ++++++++++++++++++
>  .../python/python3-django_2.2.16.bb           |   2 +
>  2 files changed, 291 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-django-2.2.16/CVE-2021-28658.patch
>
> diff --git a/meta-python/recipes-devtools/python/python3-django-2.2.16/CVE-2021-28658.patch b/meta-python/recipes-devtools/python/python3-django-2.2.16/CVE-2021-28658.patch
> new file mode 100644
> index 000000000..325aa0042
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-django-2.2.16/CVE-2021-28658.patch
> @@ -0,0 +1,289 @@
> +From 4036d62bda0e9e9f6172943794b744a454ca49c2 Mon Sep 17 00:00:00 2001
> +From: Mariusz Felisiak <felisiak.mariusz@gmail.com>
> +Date: Tue, 16 Mar 2021 10:19:00 +0100
> +Subject: [PATCH] Fixed CVE-2021-28658 -- Fixed potential directory-traversal
> + via uploaded files.
> +
> +Thanks Claude Paroz for the initial patch.
> +Thanks Dennis Brinkrolf for the report.
> +
> +Backport of d4d800ca1addc4141e03c5440a849bb64d1582cd from main.
> +
> +Upstream-Status: Backport
> +CVE: CVE-2021-28658
> +
> +Reference to upstream patch:
> +[https://github.com/django/django/commit/4036d62bda0e9e9f6172943794b744a454ca49c2]
> +
> +[SG: Adapted stable/2.2.x patch for 2.2.16]
> +Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
> +---
> + django/http/multipartparser.py      | 13 ++++--
> + docs/releases/2.2.16.txt            | 12 +++++
> + tests/file_uploads/tests.py         | 72 ++++++++++++++++++++++-------
> + tests/file_uploads/uploadhandler.py | 31 +++++++++++++
> + tests/file_uploads/urls.py          |  1 +
> + tests/file_uploads/views.py         | 12 ++++-
> + 6 files changed, 120 insertions(+), 21 deletions(-)
> +
> +diff --git a/django/http/multipartparser.py b/django/http/multipartparser.py
> +index f6f12ca..5a9cca8 100644
> +--- a/django/http/multipartparser.py
> ++++ b/django/http/multipartparser.py
> +@@ -7,6 +7,7 @@ file upload handlers for processing.
> + import base64
> + import binascii
> + import cgi
> ++import os
> + from urllib.parse import unquote
> + 
> + from django.conf import settings
> +@@ -205,7 +206,7 @@ class MultiPartParser:
> +                     file_name = disposition.get('filename')
> +                     if file_name:
> +                         file_name = force_text(file_name, encoding, errors='replace')
> +-                        file_name = self.IE_sanitize(unescape_entities(file_name))
> ++                        file_name = self.sanitize_file_name(file_name)
> +                     if not file_name:
> +                         continue
> + 
> +@@ -293,9 +294,13 @@ class MultiPartParser:
> +                 self._files.appendlist(force_text(old_field_name, self._encoding, errors='replace'), file_obj)
> +                 break
> + 
> +-    def IE_sanitize(self, filename):
> +-        """Cleanup filename from Internet Explorer full paths."""
> +-        return filename and filename[filename.rfind("\\") + 1:].strip()
> ++    def sanitize_file_name(self, file_name):
> ++        file_name = unescape_entities(file_name)
> ++        # Cleanup Windows-style path separators.
> ++        file_name = file_name[file_name.rfind('\\') + 1:].strip()
> ++        return os.path.basename(file_name)
> ++
> ++    IE_sanitize = sanitize_file_name
> + 
> +     def _close_files(self):
> +         # Free up all file handles.
> +diff --git a/docs/releases/2.2.16.txt b/docs/releases/2.2.16.txt
> +index 31231fb..4b7021b 100644
> +--- a/docs/releases/2.2.16.txt
> ++++ b/docs/releases/2.2.16.txt
> +@@ -2,6 +2,18 @@
> + Django 2.2.16 release notes
> + ===========================
> + 
> ++*April 6, 2021*
> ++
> ++Backported from Django 2.2.20 a fix for a security issue.
> ++
> ++CVE-2021-28658: Potential directory-traversal via uploaded files
> ++================================================================
> ++
> ++``MultiPartParser`` allowed directory-traversal via uploaded files with
> ++suitably crafted file names.
> ++
> ++Built-in upload handlers were not affected by this vulnerability.
> ++
> + *September 1, 2020*
> + 
> + Django 2.2.16 fixes two security issues and two data loss bugs in 2.2.15.
> +diff --git a/tests/file_uploads/tests.py b/tests/file_uploads/tests.py
> +index ea4976d..2a08d1b 100644
> +--- a/tests/file_uploads/tests.py
> ++++ b/tests/file_uploads/tests.py
> +@@ -22,6 +22,21 @@ UNICODE_FILENAME = 'test-0123456789_中文_Orléans.jpg'
> + MEDIA_ROOT = sys_tempfile.mkdtemp()
> + UPLOAD_TO = os.path.join(MEDIA_ROOT, 'test_upload')
> + 
> ++CANDIDATE_TRAVERSAL_FILE_NAMES = [
> ++    '/tmp/hax0rd.txt',          # Absolute path, *nix-style.
> ++    'C:\\Windows\\hax0rd.txt',  # Absolute path, win-style.
> ++    'C:/Windows/hax0rd.txt',    # Absolute path, broken-style.
> ++    '\\tmp\\hax0rd.txt',        # Absolute path, broken in a different way.
> ++    '/tmp\\hax0rd.txt',         # Absolute path, broken by mixing.
> ++    'subdir/hax0rd.txt',        # Descendant path, *nix-style.
> ++    'subdir\\hax0rd.txt',       # Descendant path, win-style.
> ++    'sub/dir\\hax0rd.txt',      # Descendant path, mixed.
> ++    '../../hax0rd.txt',         # Relative path, *nix-style.
> ++    '..\\..\\hax0rd.txt',       # Relative path, win-style.
> ++    '../..\\hax0rd.txt',        # Relative path, mixed.
> ++    '..&#x2F;hax0rd.txt',       # HTML entities.
> ++]
> ++
> + 
> + @override_settings(MEDIA_ROOT=MEDIA_ROOT, ROOT_URLCONF='file_uploads.urls', MIDDLEWARE=[])
> + class FileUploadTests(TestCase):
> +@@ -205,22 +220,8 @@ class FileUploadTests(TestCase):
> +         # a malicious payload with an invalid file name (containing os.sep or
> +         # os.pardir). This similar to what an attacker would need to do when
> +         # trying such an attack.
> +-        scary_file_names = [
> +-            "/tmp/hax0rd.txt",          # Absolute path, *nix-style.
> +-            "C:\\Windows\\hax0rd.txt",  # Absolute path, win-style.
> +-            "C:/Windows/hax0rd.txt",    # Absolute path, broken-style.
> +-            "\\tmp\\hax0rd.txt",        # Absolute path, broken in a different way.
> +-            "/tmp\\hax0rd.txt",         # Absolute path, broken by mixing.
> +-            "subdir/hax0rd.txt",        # Descendant path, *nix-style.
> +-            "subdir\\hax0rd.txt",       # Descendant path, win-style.
> +-            "sub/dir\\hax0rd.txt",      # Descendant path, mixed.
> +-            "../../hax0rd.txt",         # Relative path, *nix-style.
> +-            "..\\..\\hax0rd.txt",       # Relative path, win-style.
> +-            "../..\\hax0rd.txt"         # Relative path, mixed.
> +-        ]
> +-
> +         payload = client.FakePayload()
> +-        for i, name in enumerate(scary_file_names):
> ++        for i, name in enumerate(CANDIDATE_TRAVERSAL_FILE_NAMES):
> +             payload.write('\r\n'.join([
> +                 '--' + client.BOUNDARY,
> +                 'Content-Disposition: form-data; name="file%s"; filename="%s"' % (i, name),
> +@@ -240,7 +241,7 @@ class FileUploadTests(TestCase):
> +         response = self.client.request(**r)
> +         # The filenames should have been sanitized by the time it got to the view.
> +         received = response.json()
> +-        for i, name in enumerate(scary_file_names):
> ++        for i, name in enumerate(CANDIDATE_TRAVERSAL_FILE_NAMES):
> +             got = received["file%s" % i]
> +             self.assertEqual(got, "hax0rd.txt")
> + 
> +@@ -518,6 +519,36 @@ class FileUploadTests(TestCase):
> +         # shouldn't differ.
> +         self.assertEqual(os.path.basename(obj.testfile.path), 'MiXeD_cAsE.txt')
> + 
> ++    def test_filename_traversal_upload(self):
> ++        os.makedirs(UPLOAD_TO, exist_ok=True)
> ++        self.addCleanup(shutil.rmtree, MEDIA_ROOT)
> ++        file_name = '..&#x2F;test.txt',
> ++        payload = client.FakePayload()
> ++        payload.write(
> ++            '\r\n'.join([
> ++                '--' + client.BOUNDARY,
> ++                'Content-Disposition: form-data; name="my_file"; '
> ++                'filename="%s";' % file_name,
> ++                'Content-Type: text/plain',
> ++                '',
> ++                'file contents.\r\n',
> ++                '\r\n--' + client.BOUNDARY + '--\r\n',
> ++            ]),
> ++        )
> ++        r = {
> ++            'CONTENT_LENGTH': len(payload),
> ++            'CONTENT_TYPE': client.MULTIPART_CONTENT,
> ++            'PATH_INFO': '/upload_traversal/',
> ++            'REQUEST_METHOD': 'POST',
> ++            'wsgi.input': payload,
> ++        }
> ++        response = self.client.request(**r)
> ++        result = response.json()
> ++        self.assertEqual(response.status_code, 200)
> ++        self.assertEqual(result['file_name'], 'test.txt')
> ++        self.assertIs(os.path.exists(os.path.join(MEDIA_ROOT, 'test.txt')), False)
> ++        self.assertIs(os.path.exists(os.path.join(UPLOAD_TO, 'test.txt')), True)
> ++
> + 
> + @override_settings(MEDIA_ROOT=MEDIA_ROOT)
> + class DirectoryCreationTests(SimpleTestCase):
> +@@ -591,6 +622,15 @@ class MultiParserTests(SimpleTestCase):
> +         }, StringIO('x'), [], 'utf-8')
> +         self.assertEqual(multipart_parser._content_length, 0)
> + 
> ++    def test_sanitize_file_name(self):
> ++        parser = MultiPartParser({
> ++            'CONTENT_TYPE': 'multipart/form-data; boundary=_foo',
> ++            'CONTENT_LENGTH': '1'
> ++        }, StringIO('x'), [], 'utf-8')
> ++        for file_name in CANDIDATE_TRAVERSAL_FILE_NAMES:
> ++            with self.subTest(file_name=file_name):
> ++                self.assertEqual(parser.sanitize_file_name(file_name), 'hax0rd.txt')
> ++
> +     def test_rfc2231_parsing(self):
> +         test_data = (
> +             (b"Content-Type: application/x-stuff; title*=us-ascii'en-us'This%20is%20%2A%2A%2Afun%2A%2A%2A",
> +diff --git a/tests/file_uploads/uploadhandler.py b/tests/file_uploads/uploadhandler.py
> +index 7c6199f..65d70c6 100644
> +--- a/tests/file_uploads/uploadhandler.py
> ++++ b/tests/file_uploads/uploadhandler.py
> +@@ -1,6 +1,8 @@
> + """
> + Upload handlers to test the upload API.
> + """
> ++import os
> ++from tempfile import NamedTemporaryFile
> + 
> + from django.core.files.uploadhandler import FileUploadHandler, StopUpload
> + 
> +@@ -35,3 +37,32 @@ class ErroringUploadHandler(FileUploadHandler):
> +     """A handler that raises an exception."""
> +     def receive_data_chunk(self, raw_data, start):
> +         raise CustomUploadError("Oops!")
> ++
> ++
> ++class TraversalUploadHandler(FileUploadHandler):
> ++    """A handler with potential directory-traversal vulnerability."""
> ++    def __init__(self, request=None):
> ++        from .views import UPLOAD_TO
> ++
> ++        super().__init__(request)
> ++        self.upload_dir = UPLOAD_TO
> ++
> ++    def file_complete(self, file_size):
> ++        self.file.seek(0)
> ++        self.file.size = file_size
> ++        with open(os.path.join(self.upload_dir, self.file_name), 'wb') as fp:
> ++            fp.write(self.file.read())
> ++        return self.file
> ++
> ++    def new_file(
> ++        self, field_name, file_name, content_type, content_length, charset=None,
> ++        content_type_extra=None,
> ++    ):
> ++        super().new_file(
> ++            file_name, file_name, content_length, content_length, charset,
> ++            content_type_extra,
> ++        )
> ++        self.file = NamedTemporaryFile(suffix='.upload', dir=self.upload_dir)
> ++
> ++    def receive_data_chunk(self, raw_data, start):
> ++        self.file.write(raw_data)
> +diff --git a/tests/file_uploads/urls.py b/tests/file_uploads/urls.py
> +index 3e7985d..eaac1da 100644
> +--- a/tests/file_uploads/urls.py
> ++++ b/tests/file_uploads/urls.py
> +@@ -4,6 +4,7 @@ from . import views
> + 
> + urlpatterns = [
> +     path('upload/', views.file_upload_view),
> ++    path('upload_traversal/', views.file_upload_traversal_view),
> +     path('verify/', views.file_upload_view_verify),
> +     path('unicode_name/', views.file_upload_unicode_name),
> +     path('echo/', views.file_upload_echo),
> +diff --git a/tests/file_uploads/views.py b/tests/file_uploads/views.py
> +index d4947e4..137c6f3 100644
> +--- a/tests/file_uploads/views.py
> ++++ b/tests/file_uploads/views.py
> +@@ -6,7 +6,9 @@ from django.http import HttpResponse, HttpResponseServerError, JsonResponse
> + 
> + from .models import FileModel
> + from .tests import UNICODE_FILENAME, UPLOAD_TO
> +-from .uploadhandler import ErroringUploadHandler, QuotaUploadHandler
> ++from .uploadhandler import (
> ++    ErroringUploadHandler, QuotaUploadHandler, TraversalUploadHandler,
> ++)
> + 
> + 
> + def file_upload_view(request):
> +@@ -158,3 +160,11 @@ def file_upload_fd_closing(request, access):
> +     if access == 't':
> +         request.FILES  # Trigger file parsing.
> +     return HttpResponse('')
> ++
> ++
> ++def file_upload_traversal_view(request):
> ++    request.upload_handlers.insert(0, TraversalUploadHandler())
> ++    request.FILES  # Trigger file parsing.
> ++    return JsonResponse(
> ++        {'file_name': request.upload_handlers[0].file_name},
> ++    )
> +-- 
> +2.17.1
> +
> diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.16.bb b/meta-python/recipes-devtools/python/python3-django_2.2.16.bb
> index 0715abbd4..eb626e8d3 100644
> --- a/meta-python/recipes-devtools/python/python3-django_2.2.16.bb
> +++ b/meta-python/recipes-devtools/python/python3-django_2.2.16.bb
> @@ -7,3 +7,5 @@ SRC_URI[sha256sum] = "62cf45e5ee425c52e411c0742e641a6588b7e8af0d2c274a27940931b2
>  RDEPENDS_${PN} += "\
>      ${PYTHON_PN}-sqlparse \
>  "
> +SRC_URI += "file://CVE-2021-28658.patch \
> +"
>
> 
>

