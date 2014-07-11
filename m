Return-Path: <philip.balister@gmail.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 92B2C702C1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 14:09:25 +0000 (UTC)
Received: by mail-qg0-f46.google.com with SMTP id q107so934252qgd.19
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 07:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=QHYlQikECSexsDK3HjoGO4vCt5X42qRRjghhIycVNKk=;
	b=T5iWLkIKEY4TBJfl6J/Ax/IpVppnkUlP7DClTEB4671/NAOrA5xFvJtjUSoGARUXbJ
	RyqE1fYA950LNPfy5IjpCaLzGvxrodLstW2xuZrtesjiTTyyV54ur9ML7kzbtjQTo6kW
	dGmE5HJ4Mku9zxO/VY4ZoNuvz66UjAnT4rJEHvEK4qAUFY0JsxgZLmtsjDIVFQnp6K3F
	PyhkLWTpe++1u8fgl8ePYeIXrR7NlttgXdGrPyxUKT/kBB2uei59FP3fBMqhioconMtM
	VNb+5vkJ6GyyM06yBFFrIGdqZQd4riPiqotEdBz5BO8dwDR1Ghfznk86hTLt5Yuc/HZr
	bs3A==
X-Received: by 10.224.97.65 with SMTP id k1mr91677133qan.28.1405087766541;
	Fri, 11 Jul 2014 07:09:26 -0700 (PDT)
Received: from localhost.localdomain
	(pool-71-171-36-96.ronkva.east.verizon.net. [71.171.36.96])
	by mx.google.com with ESMTPSA id s11sm4461457qag.12.2014.07.11.07.09.25
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Jul 2014 07:09:25 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Jul 2014 10:09:21 -0400
Message-Id: <1405087761-4791-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.8.3.1
Subject: [meta-oe][PATCHv2] postgresql : Fix build using pkg-config for libxml-2.0.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Jul 2014 14:09:34 -0000

Use package-config instead of binconfig for libxml-2.0.

The pgac_option processing is filtering the output from
the xml-config programming. The pkgconfig output is good
enough to use without such filtering.

Signed-off-by: Philip Balister <philip@balister.org>
---
 ...0001-Use-pkg-config-for-libxml2-detection.patch | 43 ++++++++++++++++++++++
 meta-oe/recipes-support/postgresql/postgresql.inc  |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-support/postgresql/files/0001-Use-pkg-config-for-libxml2-detection.patch

diff --git a/meta-oe/recipes-support/postgresql/files/0001-Use-pkg-config-for-libxml2-detection.patch b/meta-oe/recipes-support/postgresql/files/0001-Use-pkg-config-for-libxml2-detection.patch
new file mode 100644
index 0000000..d08ec6a
--- /dev/null
+++ b/meta-oe/recipes-support/postgresql/files/0001-Use-pkg-config-for-libxml2-detection.patch
@@ -0,0 +1,43 @@
+From d52e330be895bb8c5f0fb3e2884766acbd942a85 Mon Sep 17 00:00:00 2001
+From: Philip Balister <philip@balister.org>
+Date: Tue, 1 Jul 2014 09:40:44 -0400
+Subject: [PATCH] Use pkg-config for libxml2 detection.
+
+Upstream-Status: Inappropriate [configuration]
+
+xml2-config does not work. Use pkgconfig to set CPPFLAGS and LIBS.
+
+Signed-off-by: Philip Balister <philip@balister.org>
+---
+ configure.in | 15 ++-------------
+ 1 file changed, 2 insertions(+), 13 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index f8bf466..1f4fabf 100644
+--- a/configure.in
++++ b/configure.in
+@@ -734,19 +734,8 @@ PGAC_ARG_BOOL(with, libxml, no, [build with XML support],
+               [AC_DEFINE([USE_LIBXML], 1, [Define to 1 to build with XML support. (--with-libxml)])])
+ 
+ if test "$with_libxml" = yes ; then
+-  AC_CHECK_PROGS(XML2_CONFIG, xml2-config)
+-  if test -n "$XML2_CONFIG"; then
+-    for pgac_option in `$XML2_CONFIG --cflags`; do
+-      case $pgac_option in
+-        -I*|-D*) CPPFLAGS="$CPPFLAGS $pgac_option";;
+-      esac
+-    done
+-    for pgac_option in `$XML2_CONFIG --libs`; do
+-      case $pgac_option in
+-        -L*) LDFLAGS="$LDFLAGS $pgac_option";;
+-      esac
+-    done
+-  fi
++  CPPFLAGS="$CPPFLAGS `pkg-config --short-errors --print-errors --cflags "libxml-2.0" 2>&1`"
++  LIBS="`pkg-config --short-errors --print-errors --libs "libxml-2.0" 2>&1` $LIBS"
+ fi
+ 
+ AC_SUBST(with_libxml)
+-- 
+1.8.3.1
+
diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/recipes-support/postgresql/postgresql.inc
index 4e5ec02..79d1281 100644
--- a/meta-oe/recipes-support/postgresql/postgresql.inc
+++ b/meta-oe/recipes-support/postgresql/postgresql.inc
@@ -28,6 +28,7 @@ SRC_URI = "http://ftp.postgresql.org/pub/source/v${PV}/${BP}.tar.bz2 \
            file://postgresql.init \
            file://postgresql-bashprofile \
            file://postgresql.pam \
+           file://0001-Use-pkg-config-for-libxml2-detection.patch \
 "
 
 LEAD_SONAME = "libpq.so"
-- 
1.8.3.1


