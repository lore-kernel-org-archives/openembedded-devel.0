Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1364C78D63
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Aug 2018 07:11:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w717Bn2o001834
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 1 Aug 2018 00:11:50 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Wed, 1 Aug 2018 00:11:49 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Wed, 1 Aug 2018 15:21:34 +0800
Message-ID: <be4a18c02156ba5c82d7cdc763d36d9d55abd0cd.1533107855.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1533107855.git.hongxu.jia@windriver.com>
References: <cover.1533107855.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 10/16] volume-key: 0.3.10 -> 0.3.11
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Aug 2018 07:11:49 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...-explicitly-support-python3-by-pkg-config.patch | 54 ----------------------
 .../{volume-key_0.3.10.bb => volume-key_0.3.11.bb} |  5 +-
 2 files changed, 2 insertions(+), 57 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/volume_key/files/0001-explicitly-support-python3-by-pkg-config.patch
 rename meta-oe/recipes-extended/volume_key/{volume-key_0.3.10.bb => volume-key_0.3.11.bb} (78%)

diff --git a/meta-oe/recipes-extended/volume_key/files/0001-explicitly-support-python3-by-pkg-config.patch b/meta-oe/recipes-extended/volume_key/files/0001-explicitly-support-python3-by-pkg-config.patch
deleted file mode 100644
index 7fc76ab..0000000
--- a/meta-oe/recipes-extended/volume_key/files/0001-explicitly-support-python3-by-pkg-config.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 968c7506bea3b8d66e18a562d8b8491172631b37 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Fri, 28 Apr 2017 04:50:30 -0400
-Subject: [PATCH] explicitly support python3 by pkg-config
-
-The PYTHON_CPPFLAGS and -lpython$(PYTHON_VERSION) is hardcoded,
-use pkg-config to replace
-
-Upstream-Status: Inappropriate [wr-installer specific]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
----
- Makefile.am  | 5 ++---
- configure.ac | 2 ++
- 2 files changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 68560b1..ee2b4dc 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -20,7 +20,6 @@ ACLOCAL_AMFLAGS = -I m4
- AM_CPPFLAGS = $(blkid_CFLAGS) $(glib_CFLAGS) $(GPGME_CFLAGS) \
- 	$(libcryptsetup_CFLAGS) $(nss_CFLAGS)
- LOCALEDIR_CPPFLAGS = -DLOCALEDIR='"$(localedir)"'
--PYTHON_CPPFLAGS = -I/usr/include/python$(PYTHON_VERSION)
- 
- ## Targets
- SUBDIRS = po
-@@ -63,9 +62,9 @@ lib_libvolume_key_la_LIBADD = $(blkid_LIBS) $(glib_LIBS) $(GPGME_LIBS) \
- 	$(LTLIBINTL) $(libcryptsetup_LIBS) $(nss_LIBS)
- 
- python__volume_key_la_SOURCES = python/volume_key_wrap.c
--python__volume_key_la_CPPFLAGS = $(AM_CPPFLAGS) $(PYTHON_CPPFLAGS)
-+python__volume_key_la_CPPFLAGS = $(AM_CPPFLAGS) $(python3_CFLAGS)
- python__volume_key_la_LDFLAGS = -module -avoid-version $(glib_LIBS)
--python__volume_key_la_LIBADD = lib/libvolume_key.la -lpython$(PYTHON_VERSION) \
-+python__volume_key_la_LIBADD = lib/libvolume_key.la $(python3_LIBS) \
- 	$(glib_LIBS) $(nss_LIBS)
- 
- src_volume_key_SOURCES = src/volume_key.c
-diff --git a/configure.ac b/configure.ac
-index 40c3906..16c067d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -31,6 +31,8 @@ LT_INIT([disable-static])
- AC_PATH_PROGS(PYTHON, python2.7 python2.6 python2 python, [Python is required])
- AM_PATH_PYTHON([2.6], [], AC_MSG_ERROR([Python 2.6 or 2.7 is required]))
- 
-+PKG_CHECK_MODULES(python3, [python3])
-+
- AC_PATH_PROG([GPG], [gpg2])
- AC_ARG_VAR([GPG])
- AC_DEFINE_UNQUOTED([GPG_PATH], "$GPG", [Path to the gpg2 executable])
diff --git a/meta-oe/recipes-extended/volume_key/volume-key_0.3.10.bb b/meta-oe/recipes-extended/volume_key/volume-key_0.3.11.bb
similarity index 78%
rename from meta-oe/recipes-extended/volume_key/volume-key_0.3.10.bb
rename to meta-oe/recipes-extended/volume_key/volume-key_0.3.11.bb
index e8d2055..c41b20c 100644
--- a/meta-oe/recipes-extended/volume_key/volume-key_0.3.10.bb
+++ b/meta-oe/recipes-extended/volume_key/volume-key_0.3.11.bb
@@ -9,10 +9,9 @@ HOMEPAGE = "https://pagure.io/volume_key"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "https://releases.pagure.org/volume_key/volume_key-${PV}.tar.xz \
-           file://0001-explicitly-support-python3-by-pkg-config.patch \
 "
-SRC_URI[md5sum] = "605fd99a6e42916728020562a6edee78"
-SRC_URI[sha256sum] = "c5729de7e33e39c8674e9aae2337d2719f9298d6499f1656d0d25a065a7e98a7"
+SRC_URI[md5sum] = "30df56c7743eb7c965293b3d61194232"
+SRC_URI[sha256sum] = "e6b279c25ae477b555f938db2e41818f90c8cde942b0eec92f70b6c772095f6d"
 
 SRCNAME = "volume_key"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
-- 
2.7.4


