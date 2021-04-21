Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.53])
 by mx.groups.io with SMTP id smtpd.web08.12887.1619014714495021067
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Apr 2021 07:18:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=acvpmLo9;
 spf=pass (domain: windriver.com, ip: 40.107.237.53, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dqeCaJKvog4GGIYcAdt1m+YUSq2nBGx3MFO7oNyGzDldqtr9apUmCfwtRnI7U5sGeQpccQkc8OQybQeg7l0Av6G65mFQKvsja8Tscoa338MZguIz+iLr5bkdySo4E+Yq2L7dk3GjjNEAJnWc0EoiwfrtyoaI0cEbiXtobKCwCSEOQ2gcuoL44z3BV91zE4n6hgVdj4gsMkqjUvNWgBXvLz8Z2zebOtsKvrHYow1aCJVjzJAsmPknCrecpGUA3bwxfLW8WCQE66p07qln6F0HiqkoKHZGIBx3U/ReRnCuSdpRKxEaRRzu33lFgf2H1b9Uzuyr1tBqMSoFknEXnTZYOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eFXnp9fdieK63u+lQY6C+KXvoZvNFR+q72f8P/xn068=;
 b=JOjneWK/Kct5RL4lsWugzsWcOb7ViLwKOydbjfXU7l+jfSbcgMBJXbVjf0OX1urku6EhDvvCAZ6zdC7pljkByn5Nca+/UxF3kbuqL2v/9L0crK/R206sJaS9P00NH/mKrqU7g9qgrDuT2D7MzL+kY+0W+BDwSMcXGRh8qCCFy6E5t1ey/moGmg8xlAsqAWgiq6I4Ll7kOHBlHirnr6VPdH4OdOo4CqFh4wW/k0BQ1ocNjh2/SVZ5NmV7FfrVULRnVoJRnZSrl4QwVbafLXiuhGoc88kPQUjAm0HYTqmYLgPHbwSlBcx/tL0bW5st+gvofmsX4fezU7lVv18MowD/xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eFXnp9fdieK63u+lQY6C+KXvoZvNFR+q72f8P/xn068=;
 b=acvpmLo9uwf3hjCovbtfcilz3gckAyGTVN7HXTVYJAbuT9iRao/EX+sMuvWyYszm+orC70tKhYf1OQ0cvDbNe6psaFbmvE1J+1dJ9eKwoFrNULxcdsXer+wx1DfXq3WgwZA//MD9fuEIlsokTl6ahSv1F2HSEVz/bcAe3PCUVH0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB3912.namprd11.prod.outlook.com (2603:10b6:a03:190::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Wed, 21 Apr
 2021 14:18:32 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76%5]) with mapi id 15.20.4042.024; Wed, 21 Apr 2021
 14:18:32 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][hardknott][PATCH] python3-django: fix CVE-2021-28658
Date: Wed, 21 Apr 2021 10:18:24 -0400
Message-ID: <20210421141824.2409129-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.30.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: BY5PR13CA0006.namprd13.prod.outlook.com
 (2603:10b6:a03:180::19) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-tgamblin-fedora2.wrs.com (128.224.252.2) by BY5PR13CA0006.namprd13.prod.outlook.com (2603:10b6:a03:180::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.15 via Frontend Transport; Wed, 21 Apr 2021 14:18:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8fe5e7dc-7c2b-46d8-a55c-08d904d05752
X-MS-TrafficTypeDiagnostic: BY5PR11MB3912:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB3912DABDA5F543660B2D15D79F479@BY5PR11MB3912.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tTTdKEwzeZ5rfwTNgLgWsD8QefrWRzrNGl2eGptco5KaaIpYRGGcwYFqhb7PzBEpzy0KVuytYQwyzbg5EkJJLw1xJqNq5LoPCbVPsjDM8JtHkm/954sANZlwP392WC3zx6D2gztXmrMtgZSO9b8DfxJViIxFor1eed/pNxfjQP1iMwjO/4M0CR41bLgZ3vqBGF7A1w5xHm7KnsYS0ySoFc3MHqg0WazF8DNVxhc/ms6oXWTkLPR/zxOyXn4VOhH7PAmeSKsGKfSG3QyuuO9nUeWOSZwoBif59ILY36VDvBXKw/vl8afDlRSGRm/hVtXPmnxPBfgqk9eqfKp+R3GJ7B9JZNCT/qXWvLuYvWfg0jtQgHWqruiAaEB5kCVgjQfHHd/cTjb0bZ8iKoYz1rlecja49r57wkPBjFmKpCMCU+ccEELUP3U644KMrJ1aaVR4V15hIDHIYYVLk8O4AvDWNGFyYF9QamKzh4Z+U1+eJzaLn+1Z2I8TEVlFy32toVR8jf3fS+CRUfy14yEeMpFCxA+0KTJOwdJ5AZof/plI/gWtnnYkORoysz3hJEc43utYPkVKh0KLw/fHmiZKzTmB3rtDqCRJ4rAAd1lARbm6Gq65xq2nhhKyIAyoWr9ZG+EGGh2azIQYlVyQeBX8OrD3Zk8R54ccfN4KQj7BmBNZ1fURM6lyj772o7jVDc93srzC4eQvHPkNRfkV94PIniBTNaFiMCvl0Fnm5HZfssUQTL89RYquZtyugZIm+5Buq0fwK/cCgJkeDvL8pvVb/DXuyQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(376002)(346002)(136003)(396003)(366004)(2906002)(38100700002)(52116002)(6506007)(8936002)(83380400001)(2616005)(6486002)(38350700002)(26005)(1076003)(36756003)(6666004)(66574015)(30864003)(16526019)(8676002)(6512007)(956004)(6916009)(44832011)(66946007)(86362001)(478600001)(66556008)(66476007)(966005)(316002)(5660300002)(186003)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?6RGOtlLfZu1E0z+2JMOy87EalQxRPQbJ6/NUnxs+a2FDc2yJJ87AnDL5PFqU?=
 =?us-ascii?Q?umKTr1Lfgdodb8tRs6uuLaVTRayS7DXHur/nf1OX/3yn75PE/+juDM4sxKg8?=
 =?us-ascii?Q?QxB5P0Ctcc9Z/1fZ8ylaX5cKVQB56RUAcig87h7P5OeMEHDDtyXU7w+YfKm2?=
 =?us-ascii?Q?Nuvr11oZH7+4dsgUrb+eJ4/rJRG12EjJP0PiCW00lTNGvCwb9hWxnbMg1f92?=
 =?us-ascii?Q?20Na5+xkfLP0FEE7oIipX4HOyCbosmT7AxgytYGon7eCPRGS3aG/GqDe+bAS?=
 =?us-ascii?Q?z+4h5llEjjGqK6S3yp6z8gpkiYkN26qTdwuP549FePwRnfjfu4POA4ZupPcb?=
 =?us-ascii?Q?pPz+xLfciOGa8dSwQZpxDwBHyUhRo0SR4C+QUHjSMoGKerRz4ZtMfjeXcei8?=
 =?us-ascii?Q?7yPxKXJsza8q50d3tEynxH9i/tXHkAQmSn5wmlGCfe7zzjjNF+vlT8Mp0ZNk?=
 =?us-ascii?Q?vgKyPA4AP1tZjRdMSk6ZnQ+aTIRCEgDBwMwssJP0J45ZKz7JXVyQ8w/A/5Oq?=
 =?us-ascii?Q?TXOtxNvpnKZVJWZUtk048o85EUrfjOJ0aXUTbp6gmxC5wTx0rK/DDH0udloN?=
 =?us-ascii?Q?T4uYUffYu517CAjls/gGuNv3Q1gkknZYpOetVfVMtRN0DRcDvmkTiXcXciEk?=
 =?us-ascii?Q?XLr8vzPLk+rBvH0thFeE+cL4rby26DWkNcjikpJ4AD0Ou8QYaOOOmxayTQyF?=
 =?us-ascii?Q?VGhEaslqbpczvQm+b3r+zTs63cDIgfKebnTE+2ABIQGeycN4hlSPOj688Xgl?=
 =?us-ascii?Q?8ApwHhmIkDo78SEqekdjl2KaVrgkzjE6rSRNs+nY1KRWfvBDmr5l+3qsAlei?=
 =?us-ascii?Q?UAwCkyxEm/ZvtqJ7ChPOYttwUPA5FHXcLGvEpkgzfenTps8MwfqO7c0gB5Sg?=
 =?us-ascii?Q?i2tr6+YcyE6cSoOO6GDE1IM5ggbeLi+O81NLnzEkGDHhyxuqNIfsm8GtIWgz?=
 =?us-ascii?Q?ZFPceS5mCQOJsudZ4QJBtySFliU16uvXs/Bwx4+E4yhIzcNwqMhNRyCK8M2N?=
 =?us-ascii?Q?P4BmRCs9Z79gG7hWVCAUEDPhPysaxzgPgA4QTmsSrSMW3X+7jI0gAeAuT2mx?=
 =?us-ascii?Q?8KVJsPBVynfciHIhZwaA6BmB3L2AlC6CcUkp1jP0qtj+VCMW+Uhf74LFwqvu?=
 =?us-ascii?Q?k7r6bMUA4VpkbKEeK9WFZDB1Ju8zsLncIChchdfWW0WVHZAlahSe2OC8rVHz?=
 =?us-ascii?Q?5+aTD2hxUJc/G0FFg58IPHz54SN2HtVquhH4eO5d0+3Qs5tO0Eicg/MXT6D/?=
 =?us-ascii?Q?806tDb/CvsKBR4hhm3GKBIpcpKdLU12NEgDVGyt/AeI0kjn2Qvo8sEOMCYXV?=
 =?us-ascii?Q?bEKC7JXj5aLeAqauizN9P0bA?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fe5e7dc-7c2b-46d8-a55c-08d904d05752
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 14:18:32.1974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KkfkxMN8/y8XgGyr6kJLcAfUFlPX/EHr1i+E0YGHgPP+CdAZQ/kCiKJohq3n/iWWGDhZyw01beTieYpWdirAWaqbY/TtZX3WztM6ZqubivY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3912
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Stefan Ghinea <stefan.ghinea@windriver.com>

Backport the fix from meta-python master-next branch.

In Django 2.2 before 2.2.20, 3.0 before 3.0.14, and 3.1 before 3.1.8,
MultiPartParser allowed directory traversal via uploaded files with
suitably crafted file names. Built-in upload handlers were not affected
by this vulnerability.

References:
https://nvd.nist.gov/vuln/detail/CVE-2021-28658

Upstream patches:
https://github.com/django/django/commit/4036d62bda0e9e9f6172943794b744a454c=
a49c2

Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../CVE-2021-28658.patch                      | 289 ++++++++++++++++++
 .../python/python3-django_2.2.16.bb           |   2 +
 2 files changed, 291 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django-2.2.=
16/CVE-2021-28658.patch

diff --git a/meta-python/recipes-devtools/python/python3-django-2.2.16/CVE-=
2021-28658.patch b/meta-python/recipes-devtools/python/python3-django-2.2.1=
6/CVE-2021-28658.patch
new file mode 100644
index 000000000..325aa0042
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-2.2.16/CVE-2021-28=
658.patch
@@ -0,0 +1,289 @@
+From 4036d62bda0e9e9f6172943794b744a454ca49c2 Mon Sep 17 00:00:00 2001
+From: Mariusz Felisiak <felisiak.mariusz@gmail.com>
+Date: Tue, 16 Mar 2021 10:19:00 +0100
+Subject: [PATCH] Fixed CVE-2021-28658 -- Fixed potential directory-travers=
al
+ via uploaded files.
+
+Thanks Claude Paroz for the initial patch.
+Thanks Dennis Brinkrolf for the report.
+
+Backport of d4d800ca1addc4141e03c5440a849bb64d1582cd from main.
+
+Upstream-Status: Backport
+CVE: CVE-2021-28658
+
+Reference to upstream patch:
+[https://github.com/django/django/commit/4036d62bda0e9e9f6172943794b744a45=
4ca49c2]
+
+[SG: Adapted stable/2.2.x patch for 2.2.16]
+Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
+---
+ django/http/multipartparser.py      | 13 ++++--
+ docs/releases/2.2.16.txt            | 12 +++++
+ tests/file_uploads/tests.py         | 72 ++++++++++++++++++++++-------
+ tests/file_uploads/uploadhandler.py | 31 +++++++++++++
+ tests/file_uploads/urls.py          |  1 +
+ tests/file_uploads/views.py         | 12 ++++-
+ 6 files changed, 120 insertions(+), 21 deletions(-)
+
+diff --git a/django/http/multipartparser.py b/django/http/multipartparser.=
py
+index f6f12ca..5a9cca8 100644
+--- a/django/http/multipartparser.py
++++ b/django/http/multipartparser.py
+@@ -7,6 +7,7 @@ file upload handlers for processing.
+ import base64
+ import binascii
+ import cgi
++import os
+ from urllib.parse import unquote
+=20
+ from django.conf import settings
+@@ -205,7 +206,7 @@ class MultiPartParser:
+                     file_name =3D disposition.get('filename')
+                     if file_name:
+                         file_name =3D force_text(file_name, encoding, err=
ors=3D'replace')
+-                        file_name =3D self.IE_sanitize(unescape_entities(=
file_name))
++                        file_name =3D self.sanitize_file_name(file_name)
+                     if not file_name:
+                         continue
+=20
+@@ -293,9 +294,13 @@ class MultiPartParser:
+                 self._files.appendlist(force_text(old_field_name, self._e=
ncoding, errors=3D'replace'), file_obj)
+                 break
+=20
+-    def IE_sanitize(self, filename):
+-        """Cleanup filename from Internet Explorer full paths."""
+-        return filename and filename[filename.rfind("\\") + 1:].strip()
++    def sanitize_file_name(self, file_name):
++        file_name =3D unescape_entities(file_name)
++        # Cleanup Windows-style path separators.
++        file_name =3D file_name[file_name.rfind('\\') + 1:].strip()
++        return os.path.basename(file_name)
++
++    IE_sanitize =3D sanitize_file_name
+=20
+     def _close_files(self):
+         # Free up all file handles.
+diff --git a/docs/releases/2.2.16.txt b/docs/releases/2.2.16.txt
+index 31231fb..4b7021b 100644
+--- a/docs/releases/2.2.16.txt
++++ b/docs/releases/2.2.16.txt
+@@ -2,6 +2,18 @@
+ Django 2.2.16 release notes
+ =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
+=20
++*April 6, 2021*
++
++Backported from Django 2.2.20 a fix for a security issue.
++
++CVE-2021-28658: Potential directory-traversal via uploaded files
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
++
++``MultiPartParser`` allowed directory-traversal via uploaded files with
++suitably crafted file names.
++
++Built-in upload handlers were not affected by this vulnerability.
++
+ *September 1, 2020*
+=20
+ Django 2.2.16 fixes two security issues and two data loss bugs in 2.2.15.
+diff --git a/tests/file_uploads/tests.py b/tests/file_uploads/tests.py
+index ea4976d..2a08d1b 100644
+--- a/tests/file_uploads/tests.py
++++ b/tests/file_uploads/tests.py
+@@ -22,6 +22,21 @@ UNICODE_FILENAME =3D 'test-0123456789_=E4=B8=AD=E6=96=
=87_Orl=C3=A9ans.jpg'
+ MEDIA_ROOT =3D sys_tempfile.mkdtemp()
+ UPLOAD_TO =3D os.path.join(MEDIA_ROOT, 'test_upload')
+=20
++CANDIDATE_TRAVERSAL_FILE_NAMES =3D [
++    '/tmp/hax0rd.txt',          # Absolute path, *nix-style.
++    'C:\\Windows\\hax0rd.txt',  # Absolute path, win-style.
++    'C:/Windows/hax0rd.txt',    # Absolute path, broken-style.
++    '\\tmp\\hax0rd.txt',        # Absolute path, broken in a different wa=
y.
++    '/tmp\\hax0rd.txt',         # Absolute path, broken by mixing.
++    'subdir/hax0rd.txt',        # Descendant path, *nix-style.
++    'subdir\\hax0rd.txt',       # Descendant path, win-style.
++    'sub/dir\\hax0rd.txt',      # Descendant path, mixed.
++    '../../hax0rd.txt',         # Relative path, *nix-style.
++    '..\\..\\hax0rd.txt',       # Relative path, win-style.
++    '../..\\hax0rd.txt',        # Relative path, mixed.
++    '..&#x2F;hax0rd.txt',       # HTML entities.
++]
++
+=20
+ @override_settings(MEDIA_ROOT=3DMEDIA_ROOT, ROOT_URLCONF=3D'file_uploads.=
urls', MIDDLEWARE=3D[])
+ class FileUploadTests(TestCase):
+@@ -205,22 +220,8 @@ class FileUploadTests(TestCase):
+         # a malicious payload with an invalid file name (containing os.se=
p or
+         # os.pardir). This similar to what an attacker would need to do w=
hen
+         # trying such an attack.
+-        scary_file_names =3D [
+-            "/tmp/hax0rd.txt",          # Absolute path, *nix-style.
+-            "C:\\Windows\\hax0rd.txt",  # Absolute path, win-style.
+-            "C:/Windows/hax0rd.txt",    # Absolute path, broken-style.
+-            "\\tmp\\hax0rd.txt",        # Absolute path, broken in a diff=
erent way.
+-            "/tmp\\hax0rd.txt",         # Absolute path, broken by mixing=
.
+-            "subdir/hax0rd.txt",        # Descendant path, *nix-style.
+-            "subdir\\hax0rd.txt",       # Descendant path, win-style.
+-            "sub/dir\\hax0rd.txt",      # Descendant path, mixed.
+-            "../../hax0rd.txt",         # Relative path, *nix-style.
+-            "..\\..\\hax0rd.txt",       # Relative path, win-style.
+-            "../..\\hax0rd.txt"         # Relative path, mixed.
+-        ]
+-
+         payload =3D client.FakePayload()
+-        for i, name in enumerate(scary_file_names):
++        for i, name in enumerate(CANDIDATE_TRAVERSAL_FILE_NAMES):
+             payload.write('\r\n'.join([
+                 '--' + client.BOUNDARY,
+                 'Content-Disposition: form-data; name=3D"file%s"; filenam=
e=3D"%s"' % (i, name),
+@@ -240,7 +241,7 @@ class FileUploadTests(TestCase):
+         response =3D self.client.request(**r)
+         # The filenames should have been sanitized by the time it got to =
the view.
+         received =3D response.json()
+-        for i, name in enumerate(scary_file_names):
++        for i, name in enumerate(CANDIDATE_TRAVERSAL_FILE_NAMES):
+             got =3D received["file%s" % i]
+             self.assertEqual(got, "hax0rd.txt")
+=20
+@@ -518,6 +519,36 @@ class FileUploadTests(TestCase):
+         # shouldn't differ.
+         self.assertEqual(os.path.basename(obj.testfile.path), 'MiXeD_cAsE=
.txt')
+=20
++    def test_filename_traversal_upload(self):
++        os.makedirs(UPLOAD_TO, exist_ok=3DTrue)
++        self.addCleanup(shutil.rmtree, MEDIA_ROOT)
++        file_name =3D '..&#x2F;test.txt',
++        payload =3D client.FakePayload()
++        payload.write(
++            '\r\n'.join([
++                '--' + client.BOUNDARY,
++                'Content-Disposition: form-data; name=3D"my_file"; '
++                'filename=3D"%s";' % file_name,
++                'Content-Type: text/plain',
++                '',
++                'file contents.\r\n',
++                '\r\n--' + client.BOUNDARY + '--\r\n',
++            ]),
++        )
++        r =3D {
++            'CONTENT_LENGTH': len(payload),
++            'CONTENT_TYPE': client.MULTIPART_CONTENT,
++            'PATH_INFO': '/upload_traversal/',
++            'REQUEST_METHOD': 'POST',
++            'wsgi.input': payload,
++        }
++        response =3D self.client.request(**r)
++        result =3D response.json()
++        self.assertEqual(response.status_code, 200)
++        self.assertEqual(result['file_name'], 'test.txt')
++        self.assertIs(os.path.exists(os.path.join(MEDIA_ROOT, 'test.txt')=
), False)
++        self.assertIs(os.path.exists(os.path.join(UPLOAD_TO, 'test.txt'))=
, True)
++
+=20
+ @override_settings(MEDIA_ROOT=3DMEDIA_ROOT)
+ class DirectoryCreationTests(SimpleTestCase):
+@@ -591,6 +622,15 @@ class MultiParserTests(SimpleTestCase):
+         }, StringIO('x'), [], 'utf-8')
+         self.assertEqual(multipart_parser._content_length, 0)
+=20
++    def test_sanitize_file_name(self):
++        parser =3D MultiPartParser({
++            'CONTENT_TYPE': 'multipart/form-data; boundary=3D_foo',
++            'CONTENT_LENGTH': '1'
++        }, StringIO('x'), [], 'utf-8')
++        for file_name in CANDIDATE_TRAVERSAL_FILE_NAMES:
++            with self.subTest(file_name=3Dfile_name):
++                self.assertEqual(parser.sanitize_file_name(file_name), 'h=
ax0rd.txt')
++
+     def test_rfc2231_parsing(self):
+         test_data =3D (
+             (b"Content-Type: application/x-stuff; title*=3Dus-ascii'en-us=
'This%20is%20%2A%2A%2Afun%2A%2A%2A",
+diff --git a/tests/file_uploads/uploadhandler.py b/tests/file_uploads/uplo=
adhandler.py
+index 7c6199f..65d70c6 100644
+--- a/tests/file_uploads/uploadhandler.py
++++ b/tests/file_uploads/uploadhandler.py
+@@ -1,6 +1,8 @@
+ """
+ Upload handlers to test the upload API.
+ """
++import os
++from tempfile import NamedTemporaryFile
+=20
+ from django.core.files.uploadhandler import FileUploadHandler, StopUpload
+=20
+@@ -35,3 +37,32 @@ class ErroringUploadHandler(FileUploadHandler):
+     """A handler that raises an exception."""
+     def receive_data_chunk(self, raw_data, start):
+         raise CustomUploadError("Oops!")
++
++
++class TraversalUploadHandler(FileUploadHandler):
++    """A handler with potential directory-traversal vulnerability."""
++    def __init__(self, request=3DNone):
++        from .views import UPLOAD_TO
++
++        super().__init__(request)
++        self.upload_dir =3D UPLOAD_TO
++
++    def file_complete(self, file_size):
++        self.file.seek(0)
++        self.file.size =3D file_size
++        with open(os.path.join(self.upload_dir, self.file_name), 'wb') as=
 fp:
++            fp.write(self.file.read())
++        return self.file
++
++    def new_file(
++        self, field_name, file_name, content_type, content_length, charse=
t=3DNone,
++        content_type_extra=3DNone,
++    ):
++        super().new_file(
++            file_name, file_name, content_length, content_length, charset=
,
++            content_type_extra,
++        )
++        self.file =3D NamedTemporaryFile(suffix=3D'.upload', dir=3Dself.u=
pload_dir)
++
++    def receive_data_chunk(self, raw_data, start):
++        self.file.write(raw_data)
+diff --git a/tests/file_uploads/urls.py b/tests/file_uploads/urls.py
+index 3e7985d..eaac1da 100644
+--- a/tests/file_uploads/urls.py
++++ b/tests/file_uploads/urls.py
+@@ -4,6 +4,7 @@ from . import views
+=20
+ urlpatterns =3D [
+     path('upload/', views.file_upload_view),
++    path('upload_traversal/', views.file_upload_traversal_view),
+     path('verify/', views.file_upload_view_verify),
+     path('unicode_name/', views.file_upload_unicode_name),
+     path('echo/', views.file_upload_echo),
+diff --git a/tests/file_uploads/views.py b/tests/file_uploads/views.py
+index d4947e4..137c6f3 100644
+--- a/tests/file_uploads/views.py
++++ b/tests/file_uploads/views.py
+@@ -6,7 +6,9 @@ from django.http import HttpResponse, HttpResponseServerEr=
ror, JsonResponse
+=20
+ from .models import FileModel
+ from .tests import UNICODE_FILENAME, UPLOAD_TO
+-from .uploadhandler import ErroringUploadHandler, QuotaUploadHandler
++from .uploadhandler import (
++    ErroringUploadHandler, QuotaUploadHandler, TraversalUploadHandler,
++)
+=20
+=20
+ def file_upload_view(request):
+@@ -158,3 +160,11 @@ def file_upload_fd_closing(request, access):
+     if access =3D=3D 't':
+         request.FILES  # Trigger file parsing.
+     return HttpResponse('')
++
++
++def file_upload_traversal_view(request):
++    request.upload_handlers.insert(0, TraversalUploadHandler())
++    request.FILES  # Trigger file parsing.
++    return JsonResponse(
++        {'file_name': request.upload_handlers[0].file_name},
++    )
+--=20
+2.17.1
+
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.16.bb b=
/meta-python/recipes-devtools/python/python3-django_2.2.16.bb
index 0715abbd4..eb626e8d3 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.16.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.16.bb
@@ -7,3 +7,5 @@ SRC_URI[sha256sum] =3D "62cf45e5ee425c52e411c0742e641a6588b=
7e8af0d2c274a27940931b2
 RDEPENDS_${PN} +=3D "\
     ${PYTHON_PN}-sqlparse \
 "
+SRC_URI +=3D "file://CVE-2021-28658.patch \
+"
--=20
2.30.2

