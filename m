Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.74])
 by mx.groups.io with SMTP id smtpd.web12.8584.1619071284338069193
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Apr 2021 23:01:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=o8+Vq2gs;
 spf=pass (domain: windriver.com, ip: 40.107.77.74, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BOJzhMQCZ5soOD6pHfcJQjxSx3zzbcINp7bzlcab3WXeV7Kk8uxJ/Dwy2KcrLNDLAnZPdM9NvZbbcGz8ljz+KpsldIWc+76+q4JX1mXyNiCKFkROFBKdgjT1tvuS3xMrJtFV5fYfJ50nMCZRDFpwDLmZRgSO2Qch6HAVYduE7BdjpvamEVGlUEO1Fs/cNPRff9udW9tmHEzIfNqZfOSc1ih5uDpnYAAc7eSyh/fAnpuWXXwRLpHbUBFDREPxb4NHCLx17klV4VF9i5wxphPRR0koKhkou3GhffzB6KdsIEcnbNbPTqe+YPKsAA6sJ3jj3CP1cSTpsjjUPQydH6hv4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rr6Q0Oz5zQabnaAp0/+NQvQuq69+xSIMDqXCfIGqF+k=;
 b=ii0x+iNY37aTs9M2USQqR7lRVON/HBEQKIl9tPYIxdD6sMIop1hHGFd8vU5rZ7Sf2LEREs1DXMYMECOXwNF2cLGmUxpsi+CKQMtf4EdxwD1OqqGQiPdAnLbENO31m2AuVDxnNWebi+AhHDSaVWPvLco0z01h1bCOqR91j/hKhkT9vSaFOaeTm27J7bSZSe6RedkkSI1Wkxjzjj7SMSDvmNdH3xrWKa2S63WVg0CK4eEeNMiviRSIUYWSznJSk3UveOXZli7nXbbWscCUoorqjMHuAmvoC9qKoN8G0dmbFaYllsrmDZD+1e9qWAJuY6ojnk9MCoJQ5w1bjYhTHHNbiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rr6Q0Oz5zQabnaAp0/+NQvQuq69+xSIMDqXCfIGqF+k=;
 b=o8+Vq2gse40iFs3Y1C5jia/X7jELvur5lUq7JtYxb76lTbxW/en+M8cWJCJ8E8pxxQQzNtgcUVYOl2Q1+4O9amOeg5ZNxmODQjf+AF/zsHfGUeBS9Tfn6Tb9n7EQXMYPDrq73fWeExMN+GVNUNstzsd+OeXebpThNNyTYFKvJn8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Thu, 22 Apr
 2021 06:01:21 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b%7]) with mapi id 15.20.4065.021; Thu, 22 Apr 2021
 06:01:21 +0000
From: "Chen Qi" <Qi.Chen@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH V2] python3-django: upgrade to 2.2.20
Date: Thu, 22 Apr 2021 14:01:01 +0800
Message-ID: <20210422060101.29148-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0031.apcprd03.prod.outlook.com
 (2603:1096:203:c9::18) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HKAPR03CA0031.apcprd03.prod.outlook.com (2603:1096:203:c9::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.16 via Frontend Transport; Thu, 22 Apr 2021 06:01:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: edfc253a-db14-498c-441a-08d905540d83
X-MS-TrafficTypeDiagnostic: BYAPR11MB3480:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3480CBA8CB680EE507BC1A26ED469@BYAPR11MB3480.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wV9UctSDsnd0KsF41MBv9K51TYgkokWyagJPYpQtPjSqetZTf6gNjearsHdMQKElW+9rNQF6asrHyTWGetPoIwD9C/G1fn/QVrT5dJm0w8c3EX4f0fyoPxPy3mkHBLcOs2epk9mA/9g+WSmnuxbufwwoktMSh2SEe/Z9jrc28B0xsYnLcmqNRapaeRkiYJ7XxIkhe3UvCtt3s4CChW+E1ZTTUhrajueYVl46MAmzcr/AeNg/61ovjtD5dlzDbsFs9tlESBcYBFVRcOSj8PMkp8zuagnk8UZgqHsdSK4DZ3mw3PugqEINuRCmOSeQ1ubndE5o5phKmk7pd72rGDwo4HbESnp0FfUhprw0/0gidRsyQ7eKTpiL1vzJHtp44cAIAfW7xH4YYCgG000Woqak4c2AFTJf76OFqCFOo/s6TCY3U/wALbMPoDSln7so5oySWnerG5OK7nrSg7MRxjE+B3KSriH4dm4ktRmSXycEipXl6YqJXwRpEyxxz8Z9UEWcdIopWDEzmIGpEYitbkTL+u2ogA12gcbLyfHlEQ6N3hdf0gSY4GG2OVcJ3mP+9+f3TlIQHFNWbeeFaw/3QCYmMVRf9y9n2iK/FXajm0AhLJ3dRT44ozmm+hxy8daW2hyF3k8pkoOKI87Dy/55fWT57YYCqJ/GsDG+043buCxBMApgWJ/1BgJJsMADpAnnnQqxIa6okhsmCtfEU3CkzA6maqh7vkBdEL07X+AfaXM7LOfFFkIUQoCuH7lS//KRZA1h
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(396003)(136003)(39850400004)(956004)(2616005)(186003)(66574015)(16526019)(26005)(38100700002)(83380400001)(316002)(6506007)(52116002)(36756003)(8936002)(8676002)(1076003)(6486002)(6916009)(2906002)(6666004)(86362001)(6512007)(5660300002)(38350700002)(66556008)(478600001)(66946007)(30864003)(66476007)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?JCVhiMY+Pur9+EEs7Gho23ILKot8DdJIFmTDhsaWY79C6rKM5h87MiJN54bL?=
 =?us-ascii?Q?M3NuCUBC4wdrfrcci5WoXrzhNNtBr+q7io2pL6vljcHo6dNqFj53TmyoiMrB?=
 =?us-ascii?Q?aDGKy0VESf9c9yE393OzkWf3YZ17HJpUwHt1/tPp6xJ53X4xSDMYEReoz1Mf?=
 =?us-ascii?Q?Z+/0V8Ao3Osd3bawOeSMZUNglrBp5kcTRxbQge8hsZppHIv+H2FZKxCMnxWd?=
 =?us-ascii?Q?jwwnS1H6Efh46zKm5/gBWiotwtQLUugARn/4RAU9W0V2D7HZGznjpjZfahIb?=
 =?us-ascii?Q?7KcElZmskiQFXgytQG/XAFZGfxetNyvNnle+TyqjYYi4aOPMNYWZaSawso7x?=
 =?us-ascii?Q?x5A2mp03Ezoi+PdEXbrS2pucOvJjDWbCQa2d0nYaRTIi9h+24k2w0c3ODWSs?=
 =?us-ascii?Q?y/RdvspbwwSyN/Lc7CTZJ4ae5kpz12WEDxl8/hB0zoxE4sQ4qLH1qWOPQpMO?=
 =?us-ascii?Q?0BssDyu5bfML6krlVuN90+u2AN+5NIXbxQljDBQODRRx6MH0Z8UfqIEi1JA0?=
 =?us-ascii?Q?ZLs2oa2je7xK/LVFZAjSbkr9Cc5SVfEAPqLDGcHP4QsB1vavSrbK9/OxEQEf?=
 =?us-ascii?Q?qy8aI/Hkq32FYjOFPQiIlRKecMcLQH8EORXcs8JfW7S1jwj5dnw+q2JP38ZU?=
 =?us-ascii?Q?vddUjJCG6ZriE8n7ULEPVgKk+AGJucxUSr+hX09Gg9hDtRRFgwXCsdpBzAE3?=
 =?us-ascii?Q?MnOHx6bvfZ6OZu2SajZT5XpLz/jC6xY55q0txM9HxPd8t/hI3oBKunUZvIgT?=
 =?us-ascii?Q?aAzA3mtdzsntSu0wKKNIMCcPC3xOgDLOBiy50lY9gbel51eUP/2WefCD+JEb?=
 =?us-ascii?Q?TXRyNOymYTeZJ+mAvi27ogY7Uxargq16RECKNMlWDiWynWaEB5RfQPZ60KyG?=
 =?us-ascii?Q?F4CzxdfepYJ3ucDQ/PAtILZSwwpErD/cNpundGW4NIH13ttfy1gxH/nCNCNh?=
 =?us-ascii?Q?y0U3/C4lrvmiLJQ6qjyj11ztri29a8tGC9bAoxK09PpqungvKLcEKpmja+3F?=
 =?us-ascii?Q?cbGiuoe8zp3T5XvBT80NxktQP4HGIxcj30VGPp8UGxplu8tSjvjpsDPM3OpE?=
 =?us-ascii?Q?6wG9GEGrVW3ZafgTwFyMTUEEtk8WfzvupvHhdIXsp3sA9896nzU0kXp3e+H+?=
 =?us-ascii?Q?7pLGCW+ANdkZoodssNNixBq9Hfho9cjFqrIspL39lcUXBW21CpmnpP9eM2kx?=
 =?us-ascii?Q?JVBZFQjYf7IRlj63YcmdSwiRjO9SMpsv1VUv1+rZYsarYAeqL61uuCl+WsTu?=
 =?us-ascii?Q?NUE9Vqe5YQYc/P2+FfKbbeZ5qcVR0hV98zvkAdeiNlWHxsEU3jezO3RVeDHA?=
 =?us-ascii?Q?YElU0nQDLdeK4Utf+ttJM6nD?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edfc253a-db14-498c-441a-08d905540d83
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 06:01:21.5112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mmrqX9p25Zekl+n3Klz9ecERO3cFPqdZqjSi7v8MYTcOUZiy+AoXlHLIV5DCq3Dcj0s0ygf9bub/fAG6lWiWoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3480
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2.2.x is LTS, so upgrade to latest release 2.2.20.
This upgrade fixes several CVEs such as CVE-2021-3281.

Also, CVE-2021-28658.patch is dropped as it's already in 2.2.20.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../CVE-2021-28658.patch                      | 289 ------------------
 .../python/python3-django_2.2.16.bb           |  11 -
 .../python/python3-django_2.2.20.bb           |   9 +
 3 files changed, 9 insertions(+), 300 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-django-2.2.=
16/CVE-2021-28658.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-django_2.2.=
16.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-django_2.2.=
20.bb

diff --git a/meta-python/recipes-devtools/python/python3-django-2.2.16/CVE-=
2021-28658.patch b/meta-python/recipes-devtools/python/python3-django-2.2.1=
6/CVE-2021-28658.patch
deleted file mode 100644
index 325aa0042..000000000
--- a/meta-python/recipes-devtools/python/python3-django-2.2.16/CVE-2021-28=
658.patch
+++ /dev/null
@@ -1,289 +0,0 @@
-From 4036d62bda0e9e9f6172943794b744a454ca49c2 Mon Sep 17 00:00:00 2001
-From: Mariusz Felisiak <felisiak.mariusz@gmail.com>
-Date: Tue, 16 Mar 2021 10:19:00 +0100
-Subject: [PATCH] Fixed CVE-2021-28658 -- Fixed potential directory-travers=
al
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
-[https://github.com/django/django/commit/4036d62bda0e9e9f6172943794b744a45=
4ca49c2]
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
-diff --git a/django/http/multipartparser.py b/django/http/multipartparser.=
py
-index f6f12ca..5a9cca8 100644
---- a/django/http/multipartparser.py
-+++ b/django/http/multipartparser.py
-@@ -7,6 +7,7 @@ file upload handlers for processing.
- import base64
- import binascii
- import cgi
-+import os
- from urllib.parse import unquote
-=20
- from django.conf import settings
-@@ -205,7 +206,7 @@ class MultiPartParser:
-                     file_name =3D disposition.get('filename')
-                     if file_name:
-                         file_name =3D force_text(file_name, encoding, err=
ors=3D'replace')
--                        file_name =3D self.IE_sanitize(unescape_entities(=
file_name))
-+                        file_name =3D self.sanitize_file_name(file_name)
-                     if not file_name:
-                         continue
-=20
-@@ -293,9 +294,13 @@ class MultiPartParser:
-                 self._files.appendlist(force_text(old_field_name, self._e=
ncoding, errors=3D'replace'), file_obj)
-                 break
-=20
--    def IE_sanitize(self, filename):
--        """Cleanup filename from Internet Explorer full paths."""
--        return filename and filename[filename.rfind("\\") + 1:].strip()
-+    def sanitize_file_name(self, file_name):
-+        file_name =3D unescape_entities(file_name)
-+        # Cleanup Windows-style path separators.
-+        file_name =3D file_name[file_name.rfind('\\') + 1:].strip()
-+        return os.path.basename(file_name)
-+
-+    IE_sanitize =3D sanitize_file_name
-=20
-     def _close_files(self):
-         # Free up all file handles.
-diff --git a/docs/releases/2.2.16.txt b/docs/releases/2.2.16.txt
-index 31231fb..4b7021b 100644
---- a/docs/releases/2.2.16.txt
-+++ b/docs/releases/2.2.16.txt
-@@ -2,6 +2,18 @@
- Django 2.2.16 release notes
- =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
-=20
-+*April 6, 2021*
-+
-+Backported from Django 2.2.20 a fix for a security issue.
-+
-+CVE-2021-28658: Potential directory-traversal via uploaded files
-+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-+
-+``MultiPartParser`` allowed directory-traversal via uploaded files with
-+suitably crafted file names.
-+
-+Built-in upload handlers were not affected by this vulnerability.
-+
- *September 1, 2020*
-=20
- Django 2.2.16 fixes two security issues and two data loss bugs in 2.2.15.
-diff --git a/tests/file_uploads/tests.py b/tests/file_uploads/tests.py
-index ea4976d..2a08d1b 100644
---- a/tests/file_uploads/tests.py
-+++ b/tests/file_uploads/tests.py
-@@ -22,6 +22,21 @@ UNICODE_FILENAME =3D 'test-0123456789_=E4=B8=AD=E6=96=
=87_Orl=C3=A9ans.jpg'
- MEDIA_ROOT =3D sys_tempfile.mkdtemp()
- UPLOAD_TO =3D os.path.join(MEDIA_ROOT, 'test_upload')
-=20
-+CANDIDATE_TRAVERSAL_FILE_NAMES =3D [
-+    '/tmp/hax0rd.txt',          # Absolute path, *nix-style.
-+    'C:\\Windows\\hax0rd.txt',  # Absolute path, win-style.
-+    'C:/Windows/hax0rd.txt',    # Absolute path, broken-style.
-+    '\\tmp\\hax0rd.txt',        # Absolute path, broken in a different wa=
y.
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
-=20
- @override_settings(MEDIA_ROOT=3DMEDIA_ROOT, ROOT_URLCONF=3D'file_uploads.=
urls', MIDDLEWARE=3D[])
- class FileUploadTests(TestCase):
-@@ -205,22 +220,8 @@ class FileUploadTests(TestCase):
-         # a malicious payload with an invalid file name (containing os.se=
p or
-         # os.pardir). This similar to what an attacker would need to do w=
hen
-         # trying such an attack.
--        scary_file_names =3D [
--            "/tmp/hax0rd.txt",          # Absolute path, *nix-style.
--            "C:\\Windows\\hax0rd.txt",  # Absolute path, win-style.
--            "C:/Windows/hax0rd.txt",    # Absolute path, broken-style.
--            "\\tmp\\hax0rd.txt",        # Absolute path, broken in a diff=
erent way.
--            "/tmp\\hax0rd.txt",         # Absolute path, broken by mixing=
.
--            "subdir/hax0rd.txt",        # Descendant path, *nix-style.
--            "subdir\\hax0rd.txt",       # Descendant path, win-style.
--            "sub/dir\\hax0rd.txt",      # Descendant path, mixed.
--            "../../hax0rd.txt",         # Relative path, *nix-style.
--            "..\\..\\hax0rd.txt",       # Relative path, win-style.
--            "../..\\hax0rd.txt"         # Relative path, mixed.
--        ]
--
-         payload =3D client.FakePayload()
--        for i, name in enumerate(scary_file_names):
-+        for i, name in enumerate(CANDIDATE_TRAVERSAL_FILE_NAMES):
-             payload.write('\r\n'.join([
-                 '--' + client.BOUNDARY,
-                 'Content-Disposition: form-data; name=3D"file%s"; filenam=
e=3D"%s"' % (i, name),
-@@ -240,7 +241,7 @@ class FileUploadTests(TestCase):
-         response =3D self.client.request(**r)
-         # The filenames should have been sanitized by the time it got to =
the view.
-         received =3D response.json()
--        for i, name in enumerate(scary_file_names):
-+        for i, name in enumerate(CANDIDATE_TRAVERSAL_FILE_NAMES):
-             got =3D received["file%s" % i]
-             self.assertEqual(got, "hax0rd.txt")
-=20
-@@ -518,6 +519,36 @@ class FileUploadTests(TestCase):
-         # shouldn't differ.
-         self.assertEqual(os.path.basename(obj.testfile.path), 'MiXeD_cAsE=
.txt')
-=20
-+    def test_filename_traversal_upload(self):
-+        os.makedirs(UPLOAD_TO, exist_ok=3DTrue)
-+        self.addCleanup(shutil.rmtree, MEDIA_ROOT)
-+        file_name =3D '..&#x2F;test.txt',
-+        payload =3D client.FakePayload()
-+        payload.write(
-+            '\r\n'.join([
-+                '--' + client.BOUNDARY,
-+                'Content-Disposition: form-data; name=3D"my_file"; '
-+                'filename=3D"%s";' % file_name,
-+                'Content-Type: text/plain',
-+                '',
-+                'file contents.\r\n',
-+                '\r\n--' + client.BOUNDARY + '--\r\n',
-+            ]),
-+        )
-+        r =3D {
-+            'CONTENT_LENGTH': len(payload),
-+            'CONTENT_TYPE': client.MULTIPART_CONTENT,
-+            'PATH_INFO': '/upload_traversal/',
-+            'REQUEST_METHOD': 'POST',
-+            'wsgi.input': payload,
-+        }
-+        response =3D self.client.request(**r)
-+        result =3D response.json()
-+        self.assertEqual(response.status_code, 200)
-+        self.assertEqual(result['file_name'], 'test.txt')
-+        self.assertIs(os.path.exists(os.path.join(MEDIA_ROOT, 'test.txt')=
), False)
-+        self.assertIs(os.path.exists(os.path.join(UPLOAD_TO, 'test.txt'))=
, True)
-+
-=20
- @override_settings(MEDIA_ROOT=3DMEDIA_ROOT)
- class DirectoryCreationTests(SimpleTestCase):
-@@ -591,6 +622,15 @@ class MultiParserTests(SimpleTestCase):
-         }, StringIO('x'), [], 'utf-8')
-         self.assertEqual(multipart_parser._content_length, 0)
-=20
-+    def test_sanitize_file_name(self):
-+        parser =3D MultiPartParser({
-+            'CONTENT_TYPE': 'multipart/form-data; boundary=3D_foo',
-+            'CONTENT_LENGTH': '1'
-+        }, StringIO('x'), [], 'utf-8')
-+        for file_name in CANDIDATE_TRAVERSAL_FILE_NAMES:
-+            with self.subTest(file_name=3Dfile_name):
-+                self.assertEqual(parser.sanitize_file_name(file_name), 'h=
ax0rd.txt')
-+
-     def test_rfc2231_parsing(self):
-         test_data =3D (
-             (b"Content-Type: application/x-stuff; title*=3Dus-ascii'en-us=
'This%20is%20%2A%2A%2Afun%2A%2A%2A",
-diff --git a/tests/file_uploads/uploadhandler.py b/tests/file_uploads/uplo=
adhandler.py
-index 7c6199f..65d70c6 100644
---- a/tests/file_uploads/uploadhandler.py
-+++ b/tests/file_uploads/uploadhandler.py
-@@ -1,6 +1,8 @@
- """
- Upload handlers to test the upload API.
- """
-+import os
-+from tempfile import NamedTemporaryFile
-=20
- from django.core.files.uploadhandler import FileUploadHandler, StopUpload
-=20
-@@ -35,3 +37,32 @@ class ErroringUploadHandler(FileUploadHandler):
-     """A handler that raises an exception."""
-     def receive_data_chunk(self, raw_data, start):
-         raise CustomUploadError("Oops!")
-+
-+
-+class TraversalUploadHandler(FileUploadHandler):
-+    """A handler with potential directory-traversal vulnerability."""
-+    def __init__(self, request=3DNone):
-+        from .views import UPLOAD_TO
-+
-+        super().__init__(request)
-+        self.upload_dir =3D UPLOAD_TO
-+
-+    def file_complete(self, file_size):
-+        self.file.seek(0)
-+        self.file.size =3D file_size
-+        with open(os.path.join(self.upload_dir, self.file_name), 'wb') as=
 fp:
-+            fp.write(self.file.read())
-+        return self.file
-+
-+    def new_file(
-+        self, field_name, file_name, content_type, content_length, charse=
t=3DNone,
-+        content_type_extra=3DNone,
-+    ):
-+        super().new_file(
-+            file_name, file_name, content_length, content_length, charset=
,
-+            content_type_extra,
-+        )
-+        self.file =3D NamedTemporaryFile(suffix=3D'.upload', dir=3Dself.u=
pload_dir)
-+
-+    def receive_data_chunk(self, raw_data, start):
-+        self.file.write(raw_data)
-diff --git a/tests/file_uploads/urls.py b/tests/file_uploads/urls.py
-index 3e7985d..eaac1da 100644
---- a/tests/file_uploads/urls.py
-+++ b/tests/file_uploads/urls.py
-@@ -4,6 +4,7 @@ from . import views
-=20
- urlpatterns =3D [
-     path('upload/', views.file_upload_view),
-+    path('upload_traversal/', views.file_upload_traversal_view),
-     path('verify/', views.file_upload_view_verify),
-     path('unicode_name/', views.file_upload_unicode_name),
-     path('echo/', views.file_upload_echo),
-diff --git a/tests/file_uploads/views.py b/tests/file_uploads/views.py
-index d4947e4..137c6f3 100644
---- a/tests/file_uploads/views.py
-+++ b/tests/file_uploads/views.py
-@@ -6,7 +6,9 @@ from django.http import HttpResponse, HttpResponseServerEr=
ror, JsonResponse
-=20
- from .models import FileModel
- from .tests import UNICODE_FILENAME, UPLOAD_TO
--from .uploadhandler import ErroringUploadHandler, QuotaUploadHandler
-+from .uploadhandler import (
-+    ErroringUploadHandler, QuotaUploadHandler, TraversalUploadHandler,
-+)
-=20
-=20
- def file_upload_view(request):
-@@ -158,3 +160,11 @@ def file_upload_fd_closing(request, access):
-     if access =3D=3D 't':
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
---=20
-2.17.1
-
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.16.bb b=
/meta-python/recipes-devtools/python/python3-django_2.2.16.bb
deleted file mode 100644
index eb626e8d3..000000000
--- a/meta-python/recipes-devtools/python/python3-django_2.2.16.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require python-django.inc
-inherit setuptools3
-
-SRC_URI[md5sum] =3D "93faf5bbd54a19ea49f4932a813b9758"
-SRC_URI[sha256sum] =3D "62cf45e5ee425c52e411c0742e641a6588b7e8af0d2c274a27=
940931b2786594"
-
-RDEPENDS_${PN} +=3D "\
-    ${PYTHON_PN}-sqlparse \
-"
-SRC_URI +=3D "file://CVE-2021-28658.patch \
-"
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.20.bb b=
/meta-python/recipes-devtools/python/python3-django_2.2.20.bb
new file mode 100644
index 000000000..905d022a4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.20.bb
@@ -0,0 +1,9 @@
+require python-django.inc
+inherit setuptools3
+
+SRC_URI[md5sum] =3D "947060d96ccc0a05e8049d839e541b25"
+SRC_URI[sha256sum] =3D "2569f9dc5f8e458a5e988b03d6b7a02bda59b006d6782f4ea0=
fd590ed7336a64"
+
+RDEPENDS_${PN} +=3D "\
+    ${PYTHON_PN}-sqlparse \
+"
--=20
2.17.1

