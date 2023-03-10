Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B8C8C74A44
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 06:16:07 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.13476.1678428954048998512
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Mar 2023 22:15:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com header.s=170520fj header.b=fX2ag1pT;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678428957; i=@fujitsu.com;
	bh=+yMdKE5P+TrhphBgKVn9Iz7pTMsyqVRZwM9kHcrgq+Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=fX2ag1pT0M+FIdwzaS25ifAM5ITmyBZhxjWqJBVqnoBsCxvUmzRItNixJizrfLRRx
	 VcRPPeL53Whep10uHKikuOAnhlnnVI4INAhOqPIUj12BODwDndWI3Omc6BCNdx8q4M
	 1pmlyaR9j0o+IMBnELHpwfveH4pt+HXgUs6LGRp6FjfQHDIpaI7wGfIExGdlDX8hMK
	 b7c2uho569g+Q4mxlACYC/aMpoG6fX6xQ7poz5Rhlb0XdXaNsojyCyyT8Vtq09hYKp
	 6+uhPmOW4qCUIF4uE0/CcPomxfhLNkYOEEPwMK9N0W1URZcdxZ6Nakkrug3KoeNSFc
	 Y5aFeAY2FMWuA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrGIsWRWlGSWpSXmKPExsViZ8OxWVfmNFe
  Kwau7KhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b8IzvZClqMK/rfSjcwHtTtYuTiEBJ4wCix
  vn0KO4RzmUliYet+ZghnD6PE6lf7GLsYOTnYBKQkbtz/zwZiiwjoSyydvYcZxGYWUJF48buHH
  cQWFnCX2Pn7G1icRUBVonvmNVYQm1fAUeJd63WwGgkBBYkpD9+D1XAKOEncfdvHAmILAdX8fr
  KYHaJeUOLkzCcsEPM1JVq3/2aHsOUlmrfOZoaYoygx+3IzC4RdIdE4/RAThK0mcfXcJuYJjEK
  zkIyahWTULCSjFjAyr2I0K04tKkst0jXVSyrKTM8oyU3MzNFLrNJN1Est1c3LLyrJ0DXUSywv
  1kstLtYrrsxNzknRy0st2cQIDPaU4mSGHYydfX/1DjFKcjApifIqp3KlCPEl5adUZiQWZ8QXl
  eakFh9ilOHgUJLg3XsCKCdYlJqeWpGWmQOMPJi0BAePkggv6w6gNG9xQWJucWY6ROoUoyXH/m
  tX9jJzbNrXdYCZ4/Sf6QeYhVjy8vNSpcR5WY8DNQiANGSU5sGNgyWHS4yyUsK8jAwMDEI8Bal
  FuZklqPKvGMU5GJWEeSVAruLJzCuB2/oK6CAmoIN2beEAOagkESEl1cAk5vDM9/O7WPOPUTfc
  Reu/lnuf0KqpvW1Z6xWh3/Ut5Xfrtf27Uk4F/0838yqqZYoI+BYzJfSO3iuLbda1flVWh8/p3
  ozofsP56P2i/CkGToqivBYCn6MPtMRZNV955OjdNqXt0Umu04FvOl+7L6w3NY/Q+cOt3Kp8SX
  DlBIHJy/h+LX7q8oi598oqOZbPs+4cmrTWZ1XC4aOT2XsUyhNqCtdeTpLKiLDb5SYhuljZp8f
  3UcnlhY/7Jl+/9sd40pE0Ia4lp6a771/qvHZzh+Lc1ZZsYcomagVMW1SfFj/J2PK0+VeDRqhY
  uQhz4yFevbaKu+9f8JVNiZinNfPx039PfoR+KWDUFO364xc6v1mJpTgj0VCLuag4EQAdI9UXi
  QMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-732.messagelabs.com!1678428956!1123123!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21275 invoked from network); 10 Mar 2023 06:15:56 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-19.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Mar 2023 06:15:56 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id ED1BD7C
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 06:15:55 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id E05077B
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 06:15:55 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 10 Mar 2023 06:15:54 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/11] raptor2: upgrade 2.0.15 -> 2.0.16
Date: Fri, 10 Mar 2023 14:15:35 +0800
Message-ID: <1678428937-7700-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678428937-7700-1-git-send-email-wangmy@fujitsu.com>
References: <1678428937-7700-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 06:16:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101480

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Match-reutrn-type-from-RAPTOR_ASSERT_OBJECT_POINTER_.patch
0001-configure.ac-do-additional-checks-on-libxml2-also-wh.patch
removed since they're included in 2.0.16

License-Update:
 Copyright year updatd to 2023.
 "David Beckett" changed to "Dave Beckett"
 URL from http changed to https

Changelog:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-  Fixes CVE-2017-18926 and CVE-2020-25713
-  Multiple Appveyor Windows and CMake build fixes by 0u812. (Note: the
   resulting binaries and libraries were not tested on Windows)
-  Turtle parser now reads input in chunks so can handle huge files. Patch
-  Added a serializer for the mKR language. 
-  Rapper utility now counts triples using longs
-  Several smaller portability fixes for OpenBSD and cross building

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...e-from-RAPTOR_ASSERT_OBJECT_POINTER_.patch | 47 -------------------
 ...additional-checks-on-libxml2-also-wh.patch | 32 -------------
 .../{raptor2_2.0.15.bb =3D> raptor2_2.0.16.bb}  |  7 +--
 3 files changed, 2 insertions(+), 84 deletions(-)
 delete mode 100644 meta-oe/recipes-support/raptor2/files/0001-Match-reutrn-type-from-RAPTOR_ASSERT_OBJECT_POINTER_.patch
 delete mode 100644 meta-oe/recipes-support/raptor2/files/0001-configure.ac-do-additional-checks-on-libxml2-also-wh.patch
 rename meta-oe/recipes-support/raptor2/{raptor2_2.0.15.bb =3D> raptor2_2.0.16.bb} (61%)

diff --git a/meta-oe/recipes-support/raptor2/files/0001-Match-reutrn-type-from-RAPTOR_ASSERT_OBJECT_POINTER_.patch b/meta-oe/recipes-support/raptor2/files/0001-Match-reutrn-type-from-RAPTOR_ASSERT_OBJECT_POINTER_.patch
deleted file mode 100644
index 4c1afb46e..000000000
--- a/meta-oe/recipes-support/raptor2/files/0001-Match-reutrn-type-from-RAPTOR_ASSERT_OBJECT_POINTER_.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 97b5dcaa6b221eb403cc92e953225d38aee18f70 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 1 Sep 2022 14:48:39 -0700
-Subject: [PATCH] Match reutrn type from
- RAPTOR_ASSERT_OBJECT_POINTER_RETURN_VALUE
-
-This ensures that integer type 0 is returned and not NULL
-Fixes
-raptor_serialize.c:243:66: error: incompatible pointer to integer conversion returning 'void *' from a function with result type 'int' [-Wint-conversion]
-  RAPTOR_ASSERT_OBJECT_POINTER_RETURN_VALUE(world, raptor_world, NULL);
-                                                                 ^~~~
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/raptor_parse.c     | 2 +-
- src/raptor_serialize.c | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/raptor_parse.c b/src/raptor_parse.c
-index 26911f4..0091e1e 100644
---- a/src/raptor_parse.c
-+++ b/src/raptor_parse.c
-@@ -257,7 +257,7 @@ raptor_world_get_parser_factory(raptor_world *world, const char *name)
- int
- raptor_world_get_parsers_count(raptor_world* world)
- {
--  RAPTOR_ASSERT_OBJECT_POINTER_RETURN_VALUE(world, raptor_world, NULL);
-+  RAPTOR_ASSERT_OBJECT_POINTER_RETURN_VALUE(world, raptor_world, 0);
- 
-   raptor_world_open(world);
- 
-diff --git a/src/raptor_serialize.c b/src/raptor_serialize.c
-index a1f29d7..2bf4ab2 100644
---- a/src/raptor_serialize.c
-+++ b/src/raptor_serialize.c
-@@ -240,7 +240,7 @@ raptor_get_serializer_factory(raptor_world* world, const char *name)
- int
- raptor_world_get_serializers_count(raptor_world* world)
- {
--  RAPTOR_ASSERT_OBJECT_POINTER_RETURN_VALUE(world, raptor_world, NULL);
-+  RAPTOR_ASSERT_OBJECT_POINTER_RETURN_VALUE(world, raptor_world, 0);
- 
-   raptor_world_open(world);
- 
--- 
-2.37.3
-
diff --git a/meta-oe/recipes-support/raptor2/files/0001-configure.ac-do-additional-checks-on-libxml2-also-wh.patch b/meta-oe/recipes-support/raptor2/files/0001-configure.ac-do-additional-checks-on-libxml2-also-wh.patch
deleted file mode 100644
index 490b61f1f..000000000
--- a/meta-oe/recipes-support/raptor2/files/0001-configure.ac-do-additional-checks-on-libxml2-also-wh.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 3f97aac5a1f43ef57b02fb9ccdcadd41a6b69fa9 Mon Sep 17 00:00:00 2001
-From: =3D=3FUTF-8=3Fq=3FAndreas=3D20M=3DC3=3DBCller=3F=3D <schnitzeltony@googlemail.com>
-Date: Tue, 27 Oct 2015 10:21:24 +0100
-Subject: [PATCH] configure.ac: do additional checks on libxml2 also when
- detected by pkg-config
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Backport [https://github.com/dajobe/raptor/commit/e75b1dbb7f2a6514b8d391b200c45a2bec6268bf]
-
-Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 10ff870..35fa08e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -601,7 +601,7 @@ have_libxml=3D0
- need_libxml=3D0
- 
- oCPPFLAGS=3D"$CPPFLAGS"
--if test "X$XML_CONFIG" !=3D X; then
-+if test "X$libxml_source" !=3D X; then
-   CPPFLAGS=3D"$LIBXML_CFLAGS $CPPFLAGS"
-   LIBS=3D"$LIBS $LIBXML_LIBS"
-   AC_CHECK_FUNC(xmlCreatePushParserCtxt, have_xmlCreatePushParserCtxt=3Dyes, have_xmlCreatePushParserCtxt=3Dno)
--- 
-2.1.0
-
diff --git a/meta-oe/recipes-support/raptor2/raptor2_2.0.15.bb b/meta-oe/recipes-support/raptor2/raptor2_2.0.16.bb
similarity index 61%
rename from meta-oe/recipes-support/raptor2/raptor2_2.0.15.bb
rename to meta-oe/recipes-support/raptor2/raptor2_2.0.16.bb
index 22306a5c1..169911276 100644
--- a/meta-oe/recipes-support/raptor2/raptor2_2.0.15.bb
+++ b/meta-oe/recipes-support/raptor2/raptor2_2.0.16.bb
@@ -1,7 +1,7 @@
 SUMMARY =3D "Library for parsing and serializing RDF syntaxes"
 LICENSE =3D "GPL-2.0-only | LGPL-2.1-only | Apache-2.0"
 LIC_FILES_CHKSUM =3D " \
-    file://LICENSE.txt;md5=3Db840e5ae3aeb897f45b473341348cd9c \
+    file://LICENSE.txt;md5=3Df7fed8b6ab9289b77f5c14f3f79572cc \
     file://COPYING;md5=3D751419260aa954499f7abaabaa882bbe \
     file://COPYING.LIB;md5=3D2d5025d4aa3495befef8f17206a5b0a1 \
     file://LICENSE-2.0.txt;md5=3D3b83ef96387f14655fc854ddc3c6bd57 \
@@ -11,11 +11,8 @@ DEPENDS =3D "libxml2 libxslt curl yajl"
 
 SRC_URI =3D " \
     http://download.librdf.org/source/${BPN}-${PV}.tar.gz \
-    file://0001-configure.ac-do-additional-checks-on-libxml2-also-wh.patch \
-    file://0001-Match-reutrn-type-from-RAPTOR_ASSERT_OBJECT_POINTER_.patch \
 "
-SRC_URI[md5sum] =3D "a39f6c07ddb20d7dd2ff1f95fa21e2cd"
-SRC_URI[sha256sum] =3D "ada7f0ba54787b33485d090d3d2680533520cd4426d2f7fb4782dd4a6a1480ed"
+SRC_URI[sha256sum] =3D "089db78d7ac982354bdbf39d973baf09581e6904ac4c92a98c5caadb3de44680"
 
 inherit autotools pkgconfig
 
-- 
2.34.1


