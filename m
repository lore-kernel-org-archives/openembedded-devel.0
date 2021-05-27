Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.115])
 by mx.groups.io with SMTP id smtpd.web10.3529.1622097935534285795
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 23:45:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com header.s=170520fj header.b=iKuH6/bI;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.115, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1622097933; i=@fujitsu.com;
	bh=PGABPs5m6N/CVHpj3PEOTXAizQ+jfuOC4H6Hk78N2uA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=iKuH6/bIcaQgxOOPccC+LrqA0ZCTI6O/tQWWkZoS1g9yxIWklFOG6d9WMcFz0nVKX
	 Ky5XaSsynWQbkXQtmEke0mQ5wWE8hNQ4Hj7xXp3gQGy0xFClkOoOn6+5p77qlNt2Ro
	 uvYoxkwe0FERF+Ep6iad3WgxLzE/XFgnb6hnP/wBEeO6nz+1CXBMKd9N7Zc9Z40f80
	 o763PGnz9lHsnpt28x7LKfnrSvBfrXzjhG+c502iQ7lhE3+XUwVtlYf/vEbusku/hz
	 awaKMxBqGQvUFYkpjCXG2pdRqaL/vR9/6EQRF6DJfVRSHOuI5H8f0Cq94L+ojYbEcF
	 yQ4++kcz08H+w==
Received: from [100.113.5.216] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-central-1.aws.symcld.net id 16/ED-27273-C004FA06; Thu, 27 May 2021 06:45:32 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrIIsWRWlGSWpSXmKPExsViZ8MRosvjsD7
  B4MN/RYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPxww2MBTtkKj5efczUwHhSsouRi0NIYDaT
  xOK1F9kgnBOMEkeeLwByODnYBHQkOl50s4DYIgL6Ektn72EGsYUFfCUWHG0Ds1kEVCWenzsGV
  s8r4C5xu/0LE4gtIaAgMeXhe2aIuKDEyZlPwOYwA9V3H3nKBGHLSzRvnc0MUa8osX3nGRYIu0
  JixoxtbBMYeWchaZ+FpH0WkvYFjMyrGC2TijLTM0pyEzNzdA0NDHQNDY11zXWNjA31Eqt0k/R
  SS3WTU/NKihKBsnqJ5cV6xZW5yTkpenmpJZsYgaGXUsj+fAfjqjcf9A4xSnIwKYnyTtBZnyDE
  l5SfUpmRWJwRX1Sak1p8iFGGg0NJgnehHVBOsCg1PbUiLTMHGAcwaQkOHiUR3onWQGne4oLE3
  OLMdIjUKcZYjjdrlyxi5ngLJudvBJFt9+4CyXYwOXPBwdXMHLPA5P32Q0DyAYgUYsnLz0uVEu
  e9YQs0VABkaEZpHtxKWMxfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMmw1yOU9mXgncZa+
  AjmYCOloocR3I0SWJCCmpBia90Knip5jm33j7dOP8imWa/9iDis2/t8x661Xo9DXmzKSnCyIK
  f7xXlK0sbCryygwzVL2483WvxqEtxbFXRC7+nO193k6Bd5bNRjfn80t1grd/WjjVsn/271Srj
  u3tFkuYI40u7NkT5Xq5ds2+abInHzC4JLUWzGAIXM/9LW+rR5TohPYTd11ipbSKs1wmFCt18T
  KIG8a0X5XxYi0IFJU3Xds9y9i8xs1D8tt+r7LzyU9qpb9vuOUg9eq57LZWlxDvvJDu9Aft/Q5
  PBM24OU6Ui0hemvso6PLlxqzitWLFTw0ndF3VZvbQ+L9DJcCrSGwm/9aXLzRMpTwqs3Yse3q3
  Z2mAXXzz/VmbAhp9lFiKMxINtZiLihMBXBmOk3QDAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-245.messagelabs.com!1622097931!119211!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1406 invoked from network); 27 May 2021 06:45:32 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-3.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 May 2021 06:45:32 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14R6jVKj003004
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 27 May 2021 07:45:31 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 27 May 2021 07:45:30 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] [oe] [meta-gnome] [PATCH] libstemmer: upgrade 2.0.0 -> 2.1.0
Date: Thu, 27 May 2021 14:45:24 +0800
Message-ID: <1622097924-10659-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: quoted-printable

0002-snowball-stemwords-do-link-with-LDFLAGS-set-by-build.patch
Removed since this is included in 2.1.0

-License-Update: Add the following Copyright
Copyright (c) 2013, Yoshiki Shibukawa
Copyright (c) 2006,2007,2009,2010,2011,2014-2019, Olly Betts

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...ds-do-link-with-LDFLAGS-set-by-build.patch | 46 -------------------
 .../libstemmer/libstemmer_git.bb              |  7 ++-
 2 files changed, 3 insertions(+), 50 deletions(-)
 delete mode 100644 meta-gnome/recipes-support/libstemmer/libstemmer/0002-snowball-stemwords-do-link-with-LDFLAGS-set-by-build.patch

diff --git a/meta-gnome/recipes-support/libstemmer/libstemmer/0002-snowball-stemwords-do-link-with-LDFLAGS-set-by-build.patch b/meta-gnome/recipes-support/libstemmer/libstemmer/0002-snowball-stemwords-do-link-with-LDFLAGS-set-by-build.patch
deleted file mode 100644
index 69c1d670e7..0000000000
--- a/meta-gnome/recipes-support/libstemmer/libstemmer/0002-snowball-stemwords-do-link-with-LDFLAGS-set-by-build.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 23eacfbcc10c777ce47283a5285455ec83c8aa41 Mon Sep 17 00:00:00 2001
-From: =3D=3FUTF-8=3Fq=3FAndreas=3D20M=3DC3=3DBCller=3F=3D <schnitzeltony@gmail.com>
-Date: Sun, 6 Oct 2019 13:05:08 +0200
-Subject: [PATCH] snowball/stemwords: do link with LDFLAGS set by build
- environment
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Some (cross-)build systems as OpeneEmbedded are picky (for certain reasons) if
-their LDFLAGS are ignored.
-
-Upstream-Status: Submitted [1]
-
-[1] https://github.com/snowballstem/snowball/pull/120
-
-Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
----
- GNUmakefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/GNUmakefile b/GNUmakefile
-index 76f6ae9..47c6077 100644
---- a/GNUmakefile
-+++ b/GNUmakefile
-@@ -179,7 +179,7 @@ clean:
- 	-rmdir $(js_output_dir)
- 
- snowball: $(COMPILER_OBJECTS)
--	$(CC) $(CFLAGS) -o $@ $^
-+	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^
- 
- $(COMPILER_OBJECTS): $(COMPILER_HEADERS)
- 
-@@ -204,7 +204,7 @@ libstemmer.so: libstemmer/libstemmer.o $(RUNTIME_OBJECTS) $(C_LIB_OBJECTS)
- 	$(CC) $(CFLAGS) -shared $(LDFLAGS) -Wl,-soname,libstemmer.so.0,-version-script,libstemmer/symbol.map -o $@.0.0.0 $^
- 
- stemwords: $(STEMWORDS_OBJECTS) libstemmer.o
--	$(CC) $(CFLAGS) -o $@ $^
-+	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^
- 
- csharp_stemwords: $(CSHARP_STEMWORDS_SOURCES) $(CSHARP_RUNTIME_SOURCES) $(CSHARP_SOURCES)
- 	$(MCS) -unsafe -target:exe -out:$@ $(CSHARP_STEMWORDS_SOURCES) $(CSHARP_RUNTIME_SOURCES) $(CSHARP_SOURCES)
--- 
-2.21.0
-
diff --git a/meta-gnome/recipes-support/libstemmer/libstemmer_git.bb b/meta-gnome/recipes-support/libstemmer/libstemmer_git.bb
index 96dd880b6a..c1a06c0d0d 100644
--- a/meta-gnome/recipes-support/libstemmer/libstemmer_git.bb
+++ b/meta-gnome/recipes-support/libstemmer/libstemmer_git.bb
@@ -1,18 +1,17 @@
 SUMMARY =3D "Snowball compiler and stemming algorithms"
 HOMEPAGE =3D "https://snowballstem.org/"
 LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2750797da77c1d784e7626b3f7d7ff3e"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D19139aaf3c8c8fa1ca6edd59c072fb9f"
 
 DEPENDS_class-target =3D "${BPN}-native"
 
 SRC_URI =3D "\
     git://github.com/snowballstem/snowball.git \
     file://0001-Build-so-lib.patch \
-    file://0002-snowball-stemwords-do-link-with-LDFLAGS-set-by-build.patch \
 "
-SRCREV =3D "c70ed64f9d41c1032fba4e962b054f8e9d489a74"
+SRCREV =3D "4764395431c8f2a0b4fe18b816ab1fc966a45837"
 S =3D "${WORKDIR}/git"
-PV =3D "2.0.0"
+PV =3D "2.1.0"
 LIBVER =3D "0.0.0"
 
 inherit lib_package
-- 
2.25.1

