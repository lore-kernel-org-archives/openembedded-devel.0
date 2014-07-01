Return-Path: <philip.balister@gmail.com>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 79A2865DAC
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Jul 2014 14:27:36 +0000 (UTC)
Received: by mail-qc0-f182.google.com with SMTP id m20so8497747qcx.27
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Jul 2014 07:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=qpfgpAj64eB4o6NNAW4w6xQPtFULZdPs/F4zH3mLafs=;
	b=rSqrOfT4fE54uZcdLvWoYehFMuVQkqUsPpsHXDfJnSGWrOYBD+b/V7UTi1WzRmIBnh
	jk+2/L4NVxEDiOfJPaYRyO72wzMRVRMifHzX84ZjWGEh5w93rqa/WBBQG3LZAVJubBKb
	mOhLNH0h1NYBEAucoFeAkuFXr2NlgqEcOdkDj9vnityr2MWRGssG/tq7nQ0HrKjPWlwd
	1eawXzSCCUMit0kp4AF/c+c8cDcCgqA9ctLkZ5sYxIkkzkcexSlvhj5E3EFgrQVOAuXK
	f449+27sJeOdKJ1419KlmzpPI9kTSAXMptGvStg+dH86ogSl9J2lFM/LCf8p1wYmSMVJ
	ZtSA==
X-Received: by 10.224.87.130 with SMTP id w2mr72842018qal.5.1404224858037;
	Tue, 01 Jul 2014 07:27:38 -0700 (PDT)
Received: from localhost.localdomain
	(pool-108-44-80-46.ronkva.east.verizon.net. [108.44.80.46])
	by mx.google.com with ESMTPSA id j81sm7264966qge.41.2014.07.01.07.27.37
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Jul 2014 07:27:37 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Jul 2014 10:27:33 -0400
Message-Id: <1404224853-22809-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.8.3.1
Subject: [meta-oe][PATCH] postgresql : Fix build using pkg-config for libxml-2.0.
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
X-List-Received-Date: Tue, 01 Jul 2014 14:27:38 -0000

Use package-config instead of binconfig for libxml-2.0.

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


