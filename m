Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.73])
 by mx.groups.io with SMTP id smtpd.web09.10575.1618586675168326444
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Apr 2021 08:24:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=POnuxyv3;
 spf=pass (domain: windriver.com, ip: 40.107.243.73, mailfrom: stefan.ghinea@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OGdZ0y9LG4s04p35bTXwrBHCK+gYYXu2ATohbGh3Y9LijcNabr9Ao47kp33H6RlW2jNyB0pCl1ltX+fNRfthd3TISEbbIwIOVUGmUGAT2ws2srBFAsfC2YYLVe3CD6AKw7Bs3nltVFM8VD1d6JiiMbw3RM6WkwvSwh02npHBj/oBYdrXtyAuZYRXHzZMyziFJJrogdFQyXF5q8OFdwyjPk3P1KglQXTc9zL84izg2OatN/gPJbs4bF0o5ZG626HmZb/uPztpwpwhqntw4GIpisSmI5QXRDr3BndfAZFXkOO2LxhDA6JsvGcQKJRpuZ83w7pRI5Mv3uQCv6I7hGAPug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GDeCzTkKePmzJ9eTZ+Nmq5a8okxassMaeZpMWDAZXOg=;
 b=Ka0iuMCUtc6fN1rs1e9Pu/AmLCGiqWsqxjqBzrYULtBAGDoz+JF3M9SxSOPqtmKwxmWi88dLkEhUiPAkazG8pi7EeXpj+3m0DGreAOFfA9W7a2t4hPI+N/oBmScyXinzU2uyT9ust9EGK8gIOvCTTt1Tcyt2q8dRWaDmr6U1dTyrV8d0Y3ffswQeo695NJAT/OjHSkXQQxfiy35yWrqP3QBcXncKJ89i2c3mM668/xzeO1wHUPc8lQlhFM/06SDU1KDEeB9pJ5aOh/ip7STq2PhhaPgInbkCUDkSy77BXpDJutbTbH+F2bd9szR21aKCCoZZPeOBle/wLfn8UswqBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GDeCzTkKePmzJ9eTZ+Nmq5a8okxassMaeZpMWDAZXOg=;
 b=POnuxyv3f8VL0bvMRmrGYSVq7EmDLdko7ItKx2QpsgImKEnTJ+m7DZo6LrqDfS/lTgAOmBYgNen+Ghk5W3enuSgsxXuGd17NH0fWKqLTEzY+1d3Yp5hOZ+q8E3LckZeSAdlsPjERVv61s4m6KLv7QHegk8d5NSaaLZ9oI0Lfsug=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SJ0PR11MB4989.namprd11.prod.outlook.com (2603:10b6:a03:2d9::22)
 by BYAPR11MB3574.namprd11.prod.outlook.com (2603:10b6:a03:b1::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Fri, 16 Apr
 2021 15:24:32 +0000
Received: from SJ0PR11MB4989.namprd11.prod.outlook.com
 ([fe80::7037:7346:6da2:e8cb]) by SJ0PR11MB4989.namprd11.prod.outlook.com
 ([fe80::7037:7346:6da2:e8cb%7]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 15:24:31 +0000
From: "Stefan Ghinea" <stefan.ghinea@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] [oe-devel] [meta-python] python3-django: fix CVE-2021-28658
Date: Fri, 16 Apr 2021 18:24:17 +0300
Message-ID: <20210416152417.26659-1-stefan.ghinea@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [89.137.231.29]
X-ClientProxiedBy: VI1P194CA0024.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:800:be::34) To SJ0PR11MB4989.namprd11.prod.outlook.com
 (2603:10b6:a03:2d9::22)
Return-Path: stefan.ghinea@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (89.137.231.29) by VI1P194CA0024.EURP194.PROD.OUTLOOK.COM (2603:10a6:800:be::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 15:24:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 179093f6-2c0d-4217-e149-08d900ebbbaf
X-MS-TrafficTypeDiagnostic: BYAPR11MB3574:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB357482A8C6D6A7403341593CF24C9@BYAPR11MB3574.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ld9styHcirQ6wMiheylHsmtbshzocNVKK/XXB4Irnem55PuQPWSgPhPiAsNUS56p2TsPcmHmj34Mjyj02S0VWPxr232Hg46fwthgbgfpWYpCBx4J/zf29eo3NjAAGGqbKWnDw73HfO4K3VBan2v0dZXFGAyWzRmlk1kD3BSsGv3et20mwWL8WdbCO4LLr90tvl/AyFmIfY3/Aef/bgwXZKj78eZSy7gSC/c/Z4iStAky+VPEMFDVzlmOJ+C1h2MqBTNIqN1WJ1dFXbw61sm4ixxXlgyKyg/LzC60QWLQ4kNNEXSVGoHMSk7XtJ+gum8s+uDWHhv7BdglLMgbesHkMVqCXv8ZiH2sgjcuMhtKZoMBcZwN4KWani7kkhSPZ6zbzSpcCHVbykekmveOa2BDlwucJ5v/lILDyjtKOJhiaCFBVS7o4Xuc5j6AcDSrFxl4JOikWB+aeMhvM3nZXjbDA/OuOWzgPHMNKzaT1uXVVoblzKbC5hiWAt9p6j1GmX+SUjs4oqmUEFWC6o6AmeTxJW0L1de4AgRFoDHWhlTDzJm3cS5n9sQOgM2xnMkxU+0RNA1Wq1IvKe7nZHQP3a+qa2wL76eErh7HLkxJVsqkPsV6XQYZCl+tAskpSJ9zC9o8ev34O5ukJCNhphmb7aNgRcC4pOpxRa1hfC88FlMn9at7F7xwBw9slUvgRk/qU6XOQW7XMDpxTwTDi/vE/OLUTvOeaHoOF1eK/8cgLXu0ygRCKhfP3rrClbw8wd+MtK7J
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4989.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(396003)(346002)(136003)(376002)(52116002)(5660300002)(316002)(6512007)(186003)(66574015)(86362001)(6916009)(2906002)(8936002)(478600001)(83380400001)(16526019)(966005)(2616005)(66556008)(1076003)(66946007)(44832011)(38100700002)(6486002)(6666004)(8676002)(956004)(36756003)(6506007)(66476007)(38350700002)(30864003)(26005)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?QioZnRTeJtao+vbcFW+N9B+g8lJClxpEKqCMPz8/WOppuHwch8GChKeGz73+?=
 =?us-ascii?Q?8LTt0PyW6sFJSnhiVE1lWI6mm0Jr3uA5745w+c23SPITe10vQjdTH3/5/hyV?=
 =?us-ascii?Q?Znjac936zgF0YokSXNSnvRpGIdz+UuO4lBSkMyfs7DgVnbIE9E3wYNM4Nanu?=
 =?us-ascii?Q?jN9sIZ9L8oDU3HJvH+Whrs0IDFg4tvjw3sDekDg03NXyhUX+3hv+xt4zyLB9?=
 =?us-ascii?Q?J69Th6oZg+xnCKthR8EWXRcCpVvlqGwiEOxRhIPKMcsOrOPHCm4h+fLaRWnI?=
 =?us-ascii?Q?JJSOdZx81psh7dzxbx7ToNZpUowhnZIun6Pg16PcCL5ZBLO1l/Vxoi8DaPI8?=
 =?us-ascii?Q?vGVO86eFv0nA3sNVDb8IawclSEsFAv8D7TYKTGVWDJXxfc8P1IB9VF8RRPLI?=
 =?us-ascii?Q?O1Y68TiwjHLcnzNqRVLB9JJPJAcN8GlCOsKVPV+r2QDU9mcuXeJewzLb1oFQ?=
 =?us-ascii?Q?RjnwVnjvPP3+Oqq0P47RS7fQTrWT7CCUiHTpcdFs01vA7ZPodYmwDTl/E9eG?=
 =?us-ascii?Q?cgsC3XkgjRm/NXV+lyjc0EZvSqBj8bm5qdLxaFZNxZbQHHNjx4w3CCbFvOZO?=
 =?us-ascii?Q?R5N2ggQ7msjEjbZrh02bp4xg4ZsIV5r0Qc2EFr0yCFVhQdFPCGaDtpTEwX8t?=
 =?us-ascii?Q?62GmuQVS83+L9dexnTreD9jHjW0jlUXu/GqlNn7R6KSbQ69RJsLqg+3OZd4z?=
 =?us-ascii?Q?Ud3jK3cx44CIdAdC1us+lopCmH3zN2cehQ4Zbn8FvgzUoPXt2rVnlAyQ1GU8?=
 =?us-ascii?Q?nWgOPQEmYTFH+SOyPlcTgLywU/KlMuLJWVSZLkt+keimVOUIfV8FAJ2h35Y9?=
 =?us-ascii?Q?SSCJfxavji/0e/VH+HLzkB7Ho20Wg41qvZIlmwhNElfuGqhVg30OLC7ZhLBZ?=
 =?us-ascii?Q?mMtpCT+XS+qsHpHKZuZDHrS0+kGRtMpKeDNinRp7XTrzu/9hxm4YDHsdbphP?=
 =?us-ascii?Q?DJ8drZYTBrZAmhhWAVnoFUdMZr0LigYD9ityBSk4xhjdwFP7ohRWQzQcKQnz?=
 =?us-ascii?Q?8At1cshFrrCeEfS2tDf37MV/GK9u978k/t8nDQpwXFomV/Q6m1l+a/E5ZIGC?=
 =?us-ascii?Q?3xlWE915MxRyByEpVQChxt3DDO6c0yhrd7eV5v22byj77YE/jDG6a1LSKRuC?=
 =?us-ascii?Q?vKvA4vw2IJhx9RuK7aIkcI0mhzOQWBzEkvdQwZ1gSv45/lp3DLVPHSYVnDPe?=
 =?us-ascii?Q?KzbxZbOOdxEUNK+EiwavSi0pTiywfdOynBfQzAgbHN2sjjUgqi7VnMxLMC0j?=
 =?us-ascii?Q?NNp+EqdSB8O7Cnpd8SpitPwRjUcoK56UG/ATcrXM6mSiccLqSeXooJ/gaPbQ?=
 =?us-ascii?Q?DKNjKNKxPXBz2p9ptZB3QZeb?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 179093f6-2c0d-4217-e149-08d900ebbbaf
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4989.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 15:24:31.8136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: shT+q+rt8OAofafZP2LgTkwjfqbySmwEmxZk7I/DB7626m3cBpVCzSAQLGMteKnk+vqb54rom6YjbWQ7y33oDZd7TxrsCmGlopfJxJvcmHY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3574
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

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
2.17.1

