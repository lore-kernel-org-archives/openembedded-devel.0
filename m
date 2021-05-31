Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web09.41101.1622443650169004279
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 May 2021 23:47:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com header.s=170520fj header.b=NzFt97OG;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1622443647; i=@fujitsu.com;
	bh=toQYVbIRSCDEcpZD42B8yShFNb72nUT5vSmywzDEu3c=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=NzFt97OG9ILXyPli1aAdjirSrRoEr/d5bnzmhu/XCFyGMsHXneXf0t+fZH2YNTNFY
	 4lSLQWxvIffiTQjMAPRwajMiAXbaQovIZr02A9ojgkKYx6K/ChsdPST4nXoyO834am
	 UFhPHk529yLh4jaRPjDtF9bIT2Xu0FzAHKC/kNi/Sm+6eJgt4o9og0nlt5Tgrop7UO
	 tcVLBymjthTo9xrorc/ulkOcTpduDG9wlENONUNlb2TQcErAyQ0Vnt/hB4k9uOlzYe
	 xC9rWl4SsBsCtLV+fFgiePK2fbknloAZXFExYqsqMtwus8v9kueJiQAojremoGRs0C
	 z7OzKeZrVpnuQ==
Received: from [100.113.0.194] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.symcld.net id 7E/F6-37841-E7684B06; Mon, 31 May 2021 06:47:26 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrIIsWRWlGSWpSXmKPExsViZ8MRqlvXtiX
  BYMMzBYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWP5wg62gocaFctev2FtYDyk0sXIxSEkMJtJ
  omfnSXYI5wSjRMPBqSxdjJwcbAI6Eh0vusFsEQF9iaWz9zCD2MICHhLtzW8YQWwWAVWJRdvXs
  oHYvALuEod2rAGrlxBQkJjy8D0zRFxQ4uTMJ2BxZgFNidbtv9khbHmJ5q2zmSHqFSW27zwD1V
  shMWPGNrYJjLyzkLTPQtI+C0n7AkbmVYyWSUWZ6RkluYmZObqGBga6hobGuoa6RgbmeolVuol
  6qaW6yal5JUWJQFm9xPJiveLK3OScFL281JJNjMDQSylkPL+DceqbD3qHGCU5mJREecUVNycI
  8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuCd0LIlQUiwKDU9tSItMwcYBzBpCQ4eJRHegFagNG9xQ
  WJucWY6ROoUYyzHm7VLFjFzvAWT8zeCyLZ7d4FkO5icueDgamaOWWDyfvshIPkARAqx5OXnpU
  qJ80aB7BQAGZpRmge3EhbzlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ8/qCnMaTmVcCd9k
  roKOZgI7+HLoJ5OiSRISUVAPTWWm7CYqbT15vL1gnstXoD/PXyjU2VyoiKxusjuu1Va+I3pjA
  zvPGKu+8tfh/54VzFBcXeZzdKbqMe9euDGe3ykK2T0subGXN8JlR+vdhsVbBxpPK2wqn6+wqM
  FwRskLhSdr6WBmv2CnO8dcr73tb7Z3tJHp92vX3s4Ra23deWXwlyry2nH8xf+f/HcEftp8wu/
  vljITDk+Yn7jPVpHqjXu0QL1G3ZixlLv2yi2XZi0hGgWkHfM8v3OA5bXFOxELLbq6CQ6rsDJw
  va+elnmGTaHgcZbJkxXNG3ufy3jY/5SaEH2dtXRmU+a7yoapj1HvOl1pq+RF/S+uKk7cqPGef
  dlreLvXiVPmbHulSdzSVWIozEg21mIuKEwHTFAs/dAMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-12.tower-226.messagelabs.com!1622443645!228928!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3745 invoked from network); 31 May 2021 06:47:26 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-12.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 31 May 2021 06:47:26 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14V6lIQU010736
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 May 2021 07:47:25 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Mon, 31 May 2021 07:47:17 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-gnome] [PATCH v2] libstemmer: upgrade 2.0.0 -> 2.1.0
Date: Mon, 31 May 2021 14:47:08 +0800
Message-ID: <1622443628-14718-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

0002-snowball-stemwords-do-link-with-LDFLAGS-set-by-build.patch
Removed since this is included in 2.1.0

Refresh the following patch:
0001-Build-so-lib.patch

-License-Update: Add the following Copyright
Copyright (c) 2013, Yoshiki Shibukawa
Copyright (c) 2006,2007,2009,2010,2011,2014-2019, Olly Betts

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../libstemmer/0001-Build-so-lib.patch        |  6 +--
 ...ds-do-link-with-LDFLAGS-set-by-build.patch | 46 -------------------
 .../libstemmer/libstemmer_git.bb              |  7 ++-
 3 files changed, 6 insertions(+), 53 deletions(-)
 delete mode 100644 meta-gnome/recipes-support/libstemmer/libstemmer/0002-snowball-stemwords-do-link-with-LDFLAGS-set-by-build.patch

diff --git a/meta-gnome/recipes-support/libstemmer/libstemmer/0001-Build-so-lib.patch b/meta-gnome/recipes-support/libstemmer/libstemmer/0001-Build-so-lib.patch
index 73ebeb4847..37c5c3dc02 100644
--- a/meta-gnome/recipes-support/libstemmer/libstemmer/0001-Build-so-lib.patch
+++ b/meta-gnome/recipes-support/libstemmer/libstemmer/0001-Build-so-lib.patch
@@ -23,7 +23,7 @@ diff --git a/GNUmakefile b/GNUmakefile
 index cbd6ff7..a85230b 100644
 --- a/GNUmakefile
 +++ b/GNUmakefile
-@@ -142,10 +142,10 @@ C_OTHER_OBJECTS =3D $(C_OTHER_SOURCES:.c=3D.o)
+@@ -162,10 +162,10 @@ C_OTHER_OBJECTS =3D $(C_OTHER_SOURCES:.c=3D.o)
  JAVA_CLASSES =3D $(JAVA_SOURCES:.java=3D.class)
  JAVA_RUNTIME_CLASSES=3D$(JAVARUNTIME_SOURCES:.java=3D.class)
  
@@ -36,7 +36,7 @@ index cbd6ff7..a85230b 100644
  
  clean:
  	rm -f $(COMPILER_OBJECTS) $(RUNTIME_OBJECTS) \
-@@ -192,6 +192,9 @@ libstemmer/libstemmer.o: libstemmer/modules.h $(C_LIB_HEADERS)
+@@ -212,6 +212,9 @@ libstemmer/libstemmer.o: libstemmer/modules.h $(C_LIB_HEADERS)
  libstemmer.o: libstemmer/libstemmer.o $(RUNTIME_OBJECTS) $(C_LIB_OBJECTS)
  	$(AR) -cru $@ $^
  
@@ -44,7 +44,7 @@ index cbd6ff7..a85230b 100644
 +	$(CC) $(CFLAGS) -shared $(LDFLAGS) -Wl,-soname,libstemmer.so.0,-version-script,libstemmer/symbol.map -o $@.0.0.0 $^
 +
  stemwords: $(STEMWORDS_OBJECTS) libstemmer.o
- 	$(CC) $(CFLAGS) -o $@ $^
+ 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^
  
 diff --git a/libstemmer/symbol.map b/libstemmer/symbol.map
 new file mode 100644
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

