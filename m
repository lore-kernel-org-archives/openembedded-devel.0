Return-Path: <Joe.MacDonald@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3DC5E6B282
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Jul 2013 15:07:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6VF7lKx013894
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 31 Jul 2013 08:07:47 -0700 (PDT)
Received: from burninator.wrs.com (128.224.146.166) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 31 Jul 2013 08:07:47 -0700
From: Joe MacDonald <joe.macdonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 31 Jul 2013 11:07:40 -0400
Message-ID: <1375283260-22291-3-git-send-email-joe.macdonald@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1375283260-22291-1-git-send-email-joe.macdonald@windriver.com>
References: <1375283260-22291-1-git-send-email-joe.macdonald@windriver.com>
MIME-Version: 1.0
Cc: marcin.juszkiewicz@linaro.org, walters@verbum.org
Subject: [meta-networking][PATCH 2/2] cyrus-sasl: Add patches from Debian to fix linking
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
X-List-Received-Date: Wed, 31 Jul 2013 15:07:49 -0000
Content-Type: text/plain

From: Colin Walters <walters@verbum.org>

This fixes the build on at least Fedora 19 x86_64 as a host; we were
trying to link a non-PIC static object into a shared library.

Signed-off-by: Colin Walters <walters@verbum.org>
Signed-off-by: Joe MacDonald <joe.macdonald@windriver.com>
---
 .../cyrus-sasl/debian_patches_0009_sasldb_al.diff  |   14 ++++++++++
 .../debian_patches_0014_avoid_pic_overwrite.diff   |   27 ++++++++++++++++++++
 .../cyrus-sasl/cyrus-sasl_2.1.26.bb                |    5 +++-
 3 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/debian_patches_0009_sasldb_al.diff
 create mode 100644 meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/debian_patches_0014_avoid_pic_overwrite.diff

diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/debian_patches_0009_sasldb_al.diff b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/debian_patches_0009_sasldb_al.diff
new file mode 100644
index 0000000..8eff5a8
--- /dev/null
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/debian_patches_0009_sasldb_al.diff
@@ -0,0 +1,14 @@
+Author: Fabian Fagerholm <fabbe@debian.org>
+Description: Fix linking with libsasldb.a when saslauthd is built with sasldb
+support.
+--- a/saslauthd/configure.in
++++ b/saslauthd/configure.in
+@@ -77,7 +77,7 @@ if test "$authsasldb" != no; then
+   AC_DEFINE(AUTH_SASLDB,[],[Include SASLdb Support])
+   SASL_DB_PATH_CHECK()
+   SASL_DB_CHECK()
+-  SASL_DB_LIB="$SASL_DB_LIB ../sasldb/.libs/libsasldb.al"
++  SASL_DB_LIB="$SASL_DB_LIB ../sasldb/.libs/libsasldb.a"
+ fi
+ 
+ AC_ARG_ENABLE(httpform, [  --enable-httpform       enable HTTP form authentication [[no]] ],
diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/debian_patches_0014_avoid_pic_overwrite.diff b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/debian_patches_0014_avoid_pic_overwrite.diff
new file mode 100644
index 0000000..2e5b175
--- /dev/null
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/debian_patches_0014_avoid_pic_overwrite.diff
@@ -0,0 +1,27 @@
+Author: Fabian Fagerholm <fabbe@debian.org>
+Description: This patch makes sure the non-PIC version of libsasldb.a, which
+is created out of non-PIC objects, is not going to overwrite the PIC version,
+which is created out of PIC objects. The PIC version is placed in .libs, and
+the non-PIC version in the current directory.  This ensures that both non-PIC
+and PIC versions are available in the correct locations.
+--- a/lib/Makefile.am
++++ b/lib/Makefile.am
+@@ -78,7 +78,7 @@ endif
+ 
+ libsasl2.a: libsasl2.la $(SASL_STATIC_OBJS)
+ 	@echo adding static plugins and dependencies
+-	$(AR) cru .libs/$@ $(SASL_STATIC_OBJS)
++	$(AR) cru $@ $(SASL_STATIC_OBJS)
+ 	@for i in ./libsasl2.la ../sasldb/libsasldb.la ../plugins/lib*.la; do \
+ 	if test ! -f $$i; then continue; fi; . $$i; \
+ 	for j in $$dependency_libs foo; do \
+--- a/sasldb/Makefile.am
++++ b/sasldb/Makefile.am
+@@ -63,6 +63,6 @@ libsasldb_a_SOURCES =
+ EXTRA_libsasldb_a_SOURCES =
+ 
+ libsasldb.a: libsasldb.la $(SASL_DB_BACKEND_STATIC)
+-	$(AR) cru .libs/$@ $(SASL_DB_BACKEND_STATIC)
++	$(AR) cru $@ $(SASL_DB_BACKEND_STATIC)
+ 
+ 
diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
index 7dcef26..f05ab85 100644
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
@@ -6,7 +6,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3f55e0974e3d6db00ca6f57f2d206396"
 
 SRC_URI = "ftp://ftp.cyrusimap.org/cyrus-sasl/cyrus-sasl-${PV}.tar.gz \
 	   file://avoid-to-call-AC_TRY_RUN.patch \
-	   file://Fix-hardcoded-libdir.patch" 
+	   file://Fix-hardcoded-libdir.patch \
+	   file://debian_patches_0009_sasldb_al.diff \
+	   file://debian_patches_0014_avoid_pic_overwrite.diff \
+	   "
 
 inherit autotools pkgconfig useradd
 
-- 
1.7.10.4


