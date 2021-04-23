Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.42])
 by mx.groups.io with SMTP id smtpd.web10.5059.1619150059281476514
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Apr 2021 20:54:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Wmt+IiUK;
 spf=pass (domain: windriver.com, ip: 40.107.220.42, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bvoYdGB8TSfTLC8KSh01L+mdveY2nzJU4ASZ40BUjWeNIxLZUPo1BNODX2kcY7w/aXmXVo+izMMYCBlvCBJG+Br7spc3Ssa8Ckii2c2wv+sTfLYCPbOy9nxrYeVXcHqaRNw25dbH5EnLXSc6kY69szgj/bOtXySaxQd5oxjuCmVSG9QCgoEsGDp82spIKerdgYLqYAIJzenQa9IZC8M/KF0gaNMOR1Gg58UquQg8OwiUKSBVhoM8Pm4f5NcZM4GYUVpOa2+MLpNDdCfN12xzklnt/gQB2LVjY30gr+HxwZ4/N5NewJ8C3gZXEpQe2ZykFjrQXI+l9DbFVcxWhcXdCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/SWSP9R/wg+XgAR8lZchdvfD/vQMJ/qXA95hr443SM=;
 b=nwuEksXDaX8dIAXg5NMexadfbTGRjnQmdrWrzhVmQdo1csIwCKtuxUxt8PizUgjMRXstciLCS+cRlAvi2fMJjBwf+jyoswyMZJCX8gjk0B0EU0/OfPY+81HgEOZ2N/+9t8NVM95xBq7Rtml3rIh77xZUwpD+oUl7MYXbjPKwDTgUqn8rxCxuEeaMSXxZawIzPXKsqkiOo2sr80rNjq+CIRAoO9qwWxzJ9yCSACwn9TJCSuZPMcGlAQWMsnUgSfV1h+aNn1LakEUn4xytJPSkMMKIY7FDzEFxQcFTB11irb6mM8QUvg7HTntmGE+FrGM/vflrkBa3WrxyxxpG2vTbQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/SWSP9R/wg+XgAR8lZchdvfD/vQMJ/qXA95hr443SM=;
 b=Wmt+IiUKRjVHCZsz8R63fmcmcyB1JBJD/nCKzrgmwEEvdTd17wGgN7CSkwAnY7iU6zGN+slyS/Joecffow0SAGgWFCd5goKbnH+raoAfuqizDv6+9Kn/Zn2HDPZVLuOax+OkZWrwY2GGUlyxcakFDxE/7ZlW2oDr/Epeoj7dKGw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Fri, 23 Apr
 2021 03:54:18 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b%7]) with mapi id 15.20.4065.021; Fri, 23 Apr 2021
 03:54:18 +0000
From: "Chen Qi" <Qi.Chen@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][hardknott][PATCH V2 3/3] python3-django: upgrade to 2.2.20
Date: Fri, 23 Apr 2021 11:53:57 +0800
Message-ID: <20210423035357.28906-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210423035357.28906-1-Qi.Chen@windriver.com>
References: <20210423035357.28906-1-Qi.Chen@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0173.apcprd02.prod.outlook.com
 (2603:1096:201:1f::33) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK2PR02CA0173.apcprd02.prod.outlook.com (2603:1096:201:1f::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22 via Frontend Transport; Fri, 23 Apr 2021 03:54:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f76e2645-c191-466c-8281-08d9060b77ca
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4896:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB489660B9A27152B0F89FF179ED459@SJ0PR11MB4896.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zW5hC8/n68Bhy8mbsLaKRTEJSxuuCYBTkdvKSJAbSeCQm9fMM2yHzNQPxZLAbT0zWO+dOBgmIPxP/WMDTpitZgcmZ7RWfUHOsLp7rcE1nPKe3wh7S53mBJL6SIvFjtZLNB4TCTurhhaYaXUA6HK9CRFkWxN7LxANelywhB+uSxQRh2rd//1JQ6Y4S0kxoWbqZPEwgwfzyWIUzcxxVNznfsiKqkeiSI/reS1JMPTgNtWMwaPfS0Qbvytx8zAYyc+AdaY80RTTuPHnTAIhoD2iFzZA72whP5NSCXhPKIzKKm9Zlrhl0tMBHCAojYci5/K+v22ErDb6Vfcre8Nzh5Vnn9TntM3wtW2QqVbYXl8ilnYc1jhLz2hqhig7f5bkNLk6pCqeRs5IkGC08p106wv+MZxYyHmbW5HjfxwUs7Ek8AfqJ+W+L5u5gYgSkHHUcNE8LkHKZ1Y/BxcrlekSauyDVajP3mjT+6PEq/MEhXvwCxLd+ULgALVY+DhcdbHsR5XzxZ2Sdo3oD91FB/6WAnqycULeRUuBFZ7sgQpfPypqd0DdCI45CD5FYJLnQ09arBiHgQVNGzsC/YzoyIQ+ylaezDE4MaU6wDtF/BYxCO3YJ6dksvHNHs/T6BAu3k4UnawpVa9/aeIS9ai7286H9YUuerxrqFYAqVByJNd1bU5l1AkZ+bfJ1oPCZeFBgwX+mfXrZU6YkPtkAyDA6Uj+KA8PMZN5JLtTyQm7d11ok3V2x84831AkdmE+oKT3dejQ2oyi+YMepegCvg4LVqwDeMu3Tw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(366004)(136003)(376002)(346002)(38100700002)(38350700002)(6666004)(36756003)(86362001)(52116002)(6486002)(6916009)(2906002)(6506007)(6512007)(478600001)(66946007)(30864003)(8936002)(8676002)(66476007)(956004)(66556008)(26005)(186003)(66574015)(16526019)(316002)(2616005)(5660300002)(1076003)(83380400001)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?+KIX4T5dK3MOwooffyl12Xtv/BUkDKnqmQ5aEIv81koXi5pC0TP33/TsNHi9?=
 =?us-ascii?Q?5C/CY6GEcPuojsrBznhTKZnK/6XSz2t/ZKth4RN7OSsfpcPXJCXn5TzPUvck?=
 =?us-ascii?Q?o/XOUiRAn0Y4uRLxMl9dth/wevGdxDnRFwHIedfpn0qPZ+/lOAgpij72Vnrm?=
 =?us-ascii?Q?4ZIObkSKJpjjxaZrS3bWFPuD6rE9+b7Gg0fUL9aORu0beCrnhNpGNkSMMjYW?=
 =?us-ascii?Q?MRiwRj2gP75h3bgofu8dnwohgmFeNPcAl3vQIpNSWZUUelteQz6EeJ8BBXJa?=
 =?us-ascii?Q?MKJX7gRX/yeuPFj6oqKg1eiFG85Q4n4YOnaxP6c7corokgSjxrNdtjkbwxQt?=
 =?us-ascii?Q?4Bvm3r1c1+Z20QRdgro7L+uzpfNsyUIbj9V1qQPcEMy+uSVKoVHMts7tGLwu?=
 =?us-ascii?Q?TVFGud4ETH6NpxBwoTKJR0bFDckPHVPCJO1+WdhQ+U4wRbOb5i3S1dg4vIm4?=
 =?us-ascii?Q?nMoOUgOPy5F+7FA7fjHXX4GfwTYdenhLtophJEoQNz5wTO/HIKWnfNEiJRto?=
 =?us-ascii?Q?MsUnVtekgKwuy+jrfau8VJa3WOJNsfyj+1fQ5DiEcIxtkYE9a5v4zxD9G+Hn?=
 =?us-ascii?Q?v4K9TnmrbBxCx75uCEW2B3m+X3VmyzfZqQRzE5idLrQRT5+5+8eKqcbPL/iF?=
 =?us-ascii?Q?T3Gp2zPnjXrhlkv/GbkOoOImpyAeJSfgNXHj7DsXPTezWZdGLGoy1U6v0298?=
 =?us-ascii?Q?RVjtkVn5w1nv94C3mEocbCfWWB3fk6k38IEv7xHfrlmSouZ3kpNjSh6z+2uS?=
 =?us-ascii?Q?cCkdAH5L+mE76GOys5IbzdaHF3cLWoHyFDliF57j16PisuEHf2e086jv5Dbj?=
 =?us-ascii?Q?GeksJ2owPj446WHjsbbxeMOLoalMqPdP2o+B4wLoifWa43EzvUm9NNIhQJmv?=
 =?us-ascii?Q?/vd0/x6VRhv5Noy4Hs2GVaGDNCeoMDVtbBl9G8WZwYxZ6A2rYyg8DRoqvoXp?=
 =?us-ascii?Q?udxa7MO8PYxrpj+f1AgB3VIg4G65nEqJqwSAY5gYwYp7SfR3U06PXGYYcInA?=
 =?us-ascii?Q?dqirN9cdNKd8PalrcaYM67Po09SFLBhqB8S1AM4RvgGlkhzuKJYIDFILIceX?=
 =?us-ascii?Q?19r0blAf8Gpju+9SMzRQGxwCl4NDJLmDPTMbhcmORsuKT0DYAd3SNCdK/O0h?=
 =?us-ascii?Q?3JaTL7yjZdhMhNlUyJYG+ykW4qQDy7fJwmgRQe+tJLh6Fep5PUFc3DKJmY03?=
 =?us-ascii?Q?+mCW3yTxoXr+GLR5xHOwJ9XCSCDSGwoSBKO9GA3gbtVpR45uzaIee63th1me?=
 =?us-ascii?Q?ONEMnHy2WRIKYPYGnm2sDYpWKlJEdcOwrwAUgslzidyRdgbfwzBHumcrSKmB?=
 =?us-ascii?Q?KWsjNoAOTtz76HeqKs3u3H7A?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f76e2645-c191-466c-8281-08d9060b77ca
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 03:54:18.2258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U2wMhJWRLH/B/TLUJPBat23555W3xyAw/uvHN5IkBar8gV/6qDkybUlAqMBcFhphFAF14KQOPBPCurBOADDRkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4896
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2.2.x is LTS, so upgrade to latest release 2.2.20.
This upgrade fixes several CVEs such as CVE-2021-3281.

Also, CVE-2021-28658.patch is dropped as it's already in 2.2.20.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
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

