Return-Path: <jasper@fancydomain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14D50EB64DA
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 10:59:06 +0000 (UTC)
Received: from mx.walter.deinstapel.de (mx.walter.deinstapel.de [62.176.232.101])
 by mx.groups.io with SMTP id smtpd.web10.11088.1689764342192174978
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Jul 2023 03:59:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fancydomain.eu header.s=mail header.b=hP5ckchH;
 spf=pass (domain: fancydomain.eu, ip: 62.176.232.101, mailfrom: jasper@fancydomain.eu)
From: Jasper Orschulko <jasper@fancydomain.eu>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fancydomain.eu;
	s=mail; t=1689764340;
	bh=AnH6r7zao3DwkrPjM1yO4kTujMuNKMtoJs6UF+kbYrs=;
	h=From:To:Cc:Subject;
	b=hP5ckchHR1GcULbVI3P3Bo1phm6nRZ3rNDvTrL3NNzOQoHzs2AdpZi0hFo8WJdbaX
	 tv3EKKuudLI49cQfBSY9PXWNeQy0Q+Y8X9ixlTCwaEqHrGkSLG5bTj7Nf+9zzvYu3e
	 RkRz+3mrzNBjTKLG4nareRJW/kA0ezQoP8sjzrHzTbT9y1l7Zbv+5jzoX4Zn7iY2gE
	 eqv9d8lEPXkoX9YNJ8dQ9WM3pJ47lvGIXZZvkr95n5ANPBFb/OJUzEvd3Tr32m7bFf
	 XRk1mPoG8xl41iyCoAgigATpHAGDIYeVVN7KPjV1wjAkqSxJSwE8WJ29lFyrkFQFE9
	 64RKKUAksOVpw==
To: openembedded-devel@lists.openembedded.org
Cc: Jasper Orschulko <jasper@fancydomain.eu>
Subject: [meta-python][kirkstone][PATCH v2] python3-gcovr: Fix parsing of gcc-11 gcov metadata
Date: Wed, 19 Jul 2023 12:57:26 +0200
Message-ID: <20230719105726.20220-1-jasper@fancydomain.eu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Jul 2023 10:59:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103965

gcc-11 has metadata line "-: 0:Source is newer than graph" which throws a=
n
error.

Backported from gcovr 5.2, as kirkstone release uses gcc-11.

Signed-off-by: Jasper Orschulko <jasper@fancydomain.eu>
---
 ...001-Fix-parsing-of-gcov-metadata-601.patch | 84 +++++++++++++++++++
 .../python/python3-gcovr_5.1.bb               |  1 +
 2 files changed, 85 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-gcovr/000=
1-Fix-parsing-of-gcov-metadata-601.patch

diff --git a/meta-python/recipes-devtools/python/python3-gcovr/0001-Fix-p=
arsing-of-gcov-metadata-601.patch b/meta-python/recipes-devtools/python/p=
ython3-gcovr/0001-Fix-parsing-of-gcov-metadata-601.patch
new file mode 100644
index 000000000..5530a3985
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-gcovr/0001-Fix-parsing-=
of-gcov-metadata-601.patch
@@ -0,0 +1,84 @@
+From c4f53f28c4c537b75b5912a44083c41262807504 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Michael=3D20F=3DC3=3DB6rderer?=3D <michael.foerderer@g=
mx.de>
+Date: Sun, 3 Apr 2022 22:58:33 +0200
+Subject: [PATCH] Fix parsing of gcov metadata (#601)
+
+gcc-11 has metadata line "-: 0:Source is newer than graph" which throws =
an error.
+
+Upstream-Status: Backport [https://github.com/gcovr/gcovr/commit/7b6947b=
d4b6fd28a477606313fff3c13fcea8d3d]
+
+Signed-off-by: Jasper Orschulko <jasper@fancydomain.eu>
+---
+ gcovr/gcov.py        |  5 ++++-
+ gcovr/gcov_parser.py | 24 ++++++++++++++++++++----
+ 2 files changed, 24 insertions(+), 5 deletions(-)
+
+diff --git a/gcovr/gcov.py b/gcovr/gcov.py
+index cc7a9af4..ff4cdb0b 100644
+--- a/gcovr/gcov.py
++++ b/gcovr/gcov.py
+@@ -98,8 +98,11 @@ def process_gcov_data(data_fname, covdata, source_fna=
me, options, currdir=3DNone):
+     # Find the source file
+     # TODO: instead of heuristics, use "working directory" if available
+     metadata =3D parse_metadata(lines)
++    source =3D metadata.get("Source")
++    if source is None:
++        raise RuntimeError("Unexpected value 'None' for metadata 'Sourc=
e'.")
+     fname =3D guess_source_file_name(
+-        metadata["Source"].strip(),
++        source,
+         data_fname,
+         source_fname,
+         root_dir=3Doptions.root_dir,
+diff --git a/gcovr/gcov_parser.py b/gcovr/gcov_parser.py
+index 391ecd78..523ea406 100644
+--- a/gcovr/gcov_parser.py
++++ b/gcovr/gcov_parser.py
+@@ -121,7 +121,7 @@ class _MetadataLine(NamedTuple):
+     """A gcov line with metadata: ``-: 0:KEY:VALUE``"""
+
+     key: str
+-    value: str
++    value: Optional[str]
+
+
+ class _BlockLine(NamedTuple):
+@@ -214,7 +214,19 @@ def parse_metadata(lines: List[str]) -> Dict[str, s=
tr]:
+     ...   -: 0:Foo:bar
+     ...   -: 0:Key:123
+     ... '''.splitlines())
+-    {'Foo': 'bar', 'Key': '123'}
++    Traceback (most recent call last):
++       ...
++    RuntimeError: Missing key 'Source' in metadata. GCOV data was >>
++      -: 0:Foo:bar
++      -: 0:Key:123<< End of GCOV data
++    >>> parse_metadata('-: 0:Source: file \n -: 0:Foo: bar \n -: 0:Key:=
 123 '.splitlines())
++    {'Source': 'file', 'Foo': 'bar', 'Key': '123'}
++    >>> parse_metadata('''
++    ...   -: 0:Source:file
++    ...   -: 0:Foo:bar
++    ...   -: 0:Key
++    ... '''.splitlines())
++    {'Source': 'file', 'Foo': 'bar', 'Key': None}
+     """
+     collected =3D {}
+     for line in lines:
+@@ -721,8 +733,12 @@ def _parse_line(line: str) -> _Line:
+
+         # METADATA (key, value)
+         if count_str =3D=3D "-" and lineno =3D=3D "0":
+-            key, value =3D source_code.split(":", 1)
+-            return _MetadataLine(key, value)
++            if ":" in source_code:
++                key, value =3D source_code.split(":", 1)
++                return _MetadataLine(key, value.strip())
++            else:
++                # Add a syntethic metadata with no value
++                return _MetadataLine(source_code, None)
+
+         if count_str =3D=3D "-":
+             count =3D 0
+--
+2.41.0
+
diff --git a/meta-python/recipes-devtools/python/python3-gcovr_5.1.bb b/m=
eta-python/recipes-devtools/python/python3-gcovr_5.1.bb
index 1c4279fd1..9ab8aa9a8 100644
--- a/meta-python/recipes-devtools/python/python3-gcovr_5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-gcovr_5.1.bb
@@ -5,6 +5,7 @@ LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D08208c66520e8d69d53674831=
86d94ed"
=20
 SRC_URI =3D "git://github.com/gcovr/gcovr.git;branch=3Dmaster;protocol=3D=
https"
+SRC_URI +=3D "file://0001-Fix-parsing-of-gcov-metadata-601.patch"
 SRCREV =3D "e71e883521b78122c49016eb4e510e6da06c6916"
=20
 S =3D "${WORKDIR}/git"
--=20
2.41.0


