Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 339EE782D9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jul 2017 07:34:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6L7YrAN000982
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 21 Jul 2017 00:34:53 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 21 Jul 2017 00:34:52 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 21 Jul 2017 03:34:39 -0400
Message-ID: <f926846f5abcd19df71409818392bccd1b39f0b9.1500621886.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1500621886.git.hongxu.jia@windriver.com>
References: <cover.1500621886.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 02/10] volume-key: add recipe 0.3.9
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
X-List-Received-Date: Fri, 21 Jul 2017 07:34:53 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...-explicitly-support-python3-by-pkg-config.patch | 56 ++++++++++++++++++++++
 .../volume_key/volume-key_0.3.9.bb                 | 34 +++++++++++++
 2 files changed, 90 insertions(+)
 create mode 100644 meta-oe/recipes-extended/volume_key/files/0001-explicitly-support-python3-by-pkg-config.patch
 create mode 100644 meta-oe/recipes-extended/volume_key/volume-key_0.3.9.bb

diff --git a/meta-oe/recipes-extended/volume_key/files/0001-explicitly-support-python3-by-pkg-config.patch b/meta-oe/recipes-extended/volume_key/files/0001-explicitly-support-python3-by-pkg-config.patch
new file mode 100644
index 0000000..03edb13
--- /dev/null
+++ b/meta-oe/recipes-extended/volume_key/files/0001-explicitly-support-python3-by-pkg-config.patch
@@ -0,0 +1,56 @@
+From 18415c0b4c6e50ed9b99dfdae8d210590d0ab72e Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 28 Apr 2017 04:50:30 -0400
+Subject: [PATCH] explicitly support python3 by pkg-config
+
+The PYTHON_CPPFLAGS and -lpython$(PYTHON_VERSION) is hardcoded,
+use pkg-config to replace
+
+Upstream-Status: Inappropriate [wr-installer specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Makefile.am  | 5 ++---
+ configure.ac | 2 ++
+ 2 files changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 4569bbf..7a8daf4 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -20,7 +20,6 @@ ACLOCAL_AMFLAGS = -I m4
+ AM_CPPFLAGS = $(blkid_CFLAGS) $(glib_CFLAGS) $(GPGME_CFLAGS) \
+ 	$(libcryptsetup_CFLAGS) $(nss_CFLAGS)
+ LOCALEDIR_CPPFLAGS = -DLOCALEDIR='"$(localedir)"'
+-PYTHON_CPPFLAGS = -I/usr/include/python$(PYTHON_VERSION)
+ 
+ ## Targets
+ SUBDIRS = po
+@@ -63,9 +62,9 @@ lib_libvolume_key_la_LIBADD = $(blkid_LIBS) $(glib_LIBS) $(GPGME_LIBS) \
+ 	$(LTLIBINTL) $(libcryptsetup_LIBS) $(nss_LIBS)
+ 
+ python__volume_key_la_SOURCES = python/volume_key_wrap.c
+-python__volume_key_la_CPPFLAGS = $(AM_CPPFLAGS) $(PYTHON_CPPFLAGS)
++python__volume_key_la_CPPFLAGS = $(AM_CPPFLAGS) $(python3_CFLAGS)
+ python__volume_key_la_LDFLAGS = -module -avoid-version $(glib_LIBS)
+-python__volume_key_la_LIBADD = lib/libvolume_key.la -lpython$(PYTHON_VERSION) \
++python__volume_key_la_LIBADD = lib/libvolume_key.la $(python3_LIBS) \
+ 	$(glib_LIBS) $(nss_LIBS)
+ 
+ src_volume_key_SOURCES = src/volume_key.c
+diff --git a/configure.ac b/configure.ac
+index ff35dd0..0928a6c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -27,6 +27,8 @@ AM_INIT_AUTOMAKE([no-dist-gzip dist-xz no-define subdir-objects -Wall])
+ AC_PROG_CC
+ AM_PROG_CC_C_O
+ LT_INIT([disable-static])
++
++PKG_CHECK_MODULES(python3, [python3])
+ AM_PATH_PYTHON
+ 
+ dnl Not gpg2, it cannot receive passphrases from gpgme
+-- 
+2.8.1
+
diff --git a/meta-oe/recipes-extended/volume_key/volume-key_0.3.9.bb b/meta-oe/recipes-extended/volume_key/volume-key_0.3.9.bb
new file mode 100644
index 0000000..febf3f2
--- /dev/null
+++ b/meta-oe/recipes-extended/volume_key/volume-key_0.3.9.bb
@@ -0,0 +1,34 @@
+DESCRIPTION = "The volume_key project provides a libvolume_key, a library for manipulating \
+storage volume encryption keys and storing them separately from volumes, and an \
+associated command-line tool, named volume_key."
+LICENSE = "GPLv2"
+SECTION = "devel/lib"
+
+HOMEPAGE = "https://pagure.io/volume_key"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "https://releases.pagure.org/volume_key/volume_key-${PV}.tar.xz \
+           file://0001-explicitly-support-python3-by-pkg-config.patch \
+"
+SRC_URI[md5sum] = "a2d14931177c660e1f3ebbcf5f47d8e2"
+SRC_URI[sha256sum] = "450a54fe9bf56acec6850c1e71371d3e4913c9ca1ef0cdc3a517b4b6910412a6"
+
+SRCNAME = "volume_key"
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit autotools python3native gettext
+
+DEPENDS += " \
+    util-linux \
+    glib-2.0 \
+    cryptsetup \
+    nss \
+    gpgme \
+"
+
+RDEPENDS_python3-${PN} += "${PN}"
+
+PACKAGES += "python3-${PN}"
+FILES_python3-${PN} = "${PYTHON_SITEPACKAGES_DIR}/*"
+
-- 
2.8.1


