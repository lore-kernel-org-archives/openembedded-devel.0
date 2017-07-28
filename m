Return-Path: <patrick.ohly@intel.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 882AC784A8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jul 2017 14:03:09 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id d67so28462063pfc.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jul 2017 07:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=Ue7/7L4VXKEIYFBYgDbzvBINN6B2foLN/0jy+W+pMT8=;
	b=M/fa8qQOGE5OcBloHrqAFkvbidFxCoGBXEjrb8h0fJ0qrXDI6vYhpRtyIHbSAGcnLd
	KoPQbNqT2dso7yL3baXt8pShzv/EG7wYLghqmdo9FivpdwBgt/pkOHVFiHqVDB369mMN
	WE7ZXL3fx83XDBKHVB51vExEMWt+UbV0XtXIN7y9g33pdX2KELaG77RAmmY8ZJshhOIT
	1KpTO5vb8tG5Yt+QjTFGcPb5RcUZmCsr4/UudV1dPqoNEcJQDUH/jvH7irac1qDZJ6Ns
	V10Shly0yDpxK0FRX1U+lAKA+5STlRJJ2DhbzZ+5H8GeMiv8SeDR9OUGxLIAdeB6EJdu
	051A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Ue7/7L4VXKEIYFBYgDbzvBINN6B2foLN/0jy+W+pMT8=;
	b=eMzSgtiLXHhma1F3MIqvVDt4q5lpsBAHffgj+0BSt0VmMgxzlRustO2U9ZS1kifRJw
	kp3xkazVbBwJ9X8b7c2vkxKU/mMUco9rOwSjZ/IPiWy38ssHrbka98Su5BWuyIxZYlcj
	rD7wzDLZNzgp1mA4N40jN5D4LUkdx1NUc89Gtn92RUr7vC2k/9vPfIyewOmBmHcHs39/
	SEun6tjZEhmmQpULnpklGLgMkkaSDz/yH4f0RL+6W0Q861ToS/rdfGOhK88EhSx45Yog
	0SLJIOARO+gLpugOwbhd2uMCcrFreFLgIzG0SsMlzB48qUd5ydafvXee9rPGuTyC6d0l
	739Q==
X-Gm-Message-State: AIVw110kKJTv0p2RipfCKdAP8DRR8Tm1WU8kEG7atQWN25q4bUv2DSWt
	V1UNp09J/FMz5UkaLh4=
X-Received: by 10.84.241.207 with SMTP id t15mr7965488plm.338.1501250590210;
	Fri, 28 Jul 2017 07:03:10 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p57A5633D.dip0.t-ipconnect.de.
	[87.165.99.61]) by smtp.gmail.com with ESMTPSA id
	y6sm37856688pgq.41.2017.07.28.07.03.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Jul 2017 07:03:08 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Jul 2017 16:02:59 +0200
Message-Id: <06d32bb1edf41f0fb90f4dc3c30798780dcb45e5.1501250128.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH] autoconf-archive: move from meta-oe to OE-core
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
X-List-Received-Date: Fri, 28 Jul 2017 14:03:09 -0000

This complements the corresponding patch in OE-core.

gnome-common is affected and must be modified together with the move
because of the conflict over who provides ax_code_coverage.m4 and
ax_check_enable_debug.m4. They now come from autoconf-archive in
OE-core.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc                        | 15 ---------------
 meta-oe/recipes-devtools/autoconf-archive/autoconf-archive/delete-some-m4-files.patch | 23 -----------------------
 meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb              | 17 -----------------
 meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb                             | 11 +++++++++++
 4 files changed, 11 insertions(+), 55 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
 delete mode 100644 meta-oe/recipes-devtools/autoconf-archive/autoconf-archive/delete-some-m4-files.patch
 delete mode 100644 meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb

diff --git a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
deleted file mode 100644
index 9684d1f..0000000
--- a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-LICENSE = "GPLv3"
-HOMEPAGE = "http://www.gnu.org/software/autoconf-archive/"
-SECTION = "devel"
-
-DEPENDS += "m4-native"
-DEPENDS_class-native = "m4-native gnu-config-native"
-DEPENDS_class-nativesdk = "m4-nativesdk gnu-config-nativesdk"
-
-RDEPENDS_${PN} = "m4 gnu-config gnome-common"
-RDEPENDS_${PN}_class-native = "m4-native gnu-config-native"
-RDEPENDS_${PN}_class-nativesdk = "m4-nativesdk gnu-config-nativesdk"
-
-SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
-
-inherit autotools
diff --git a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive/delete-some-m4-files.patch b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive/delete-some-m4-files.patch
deleted file mode 100644
index 2aa788b..0000000
--- a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive/delete-some-m4-files.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Delete two m4files ax_code_coverage.m4 and ax_check_enable_debug.m4
-to avoid installing conflicts. These two files can be installed by
-gnome-common from oe-core, even if the files in gnmoe-common is
-copied from autoconf-archive(the reason is that the old version
-autoconf-archive don't provide the two files).
-After upgrading to the new version, we need to drop them in meta-oe
-and then set rdepends to gnome-common(oe-core)
-
-Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
-
-Index: a/configure.ac
-===================================================================
---- a/configure.ac     2016-09-16 06:00:00.000000000 +0800
-+++ b/configure.ac     2017-04-18 17:43:05.946290554 +0800
-@@ -19,7 +19,7 @@
- 
- AC_PROG_SED
- 
--M4FILES="m4_esyscmd([echo -n m4/*.m4])"
-+M4FILES="m4_esyscmd([echo -n m4/*.m4 | sed -e 's:m4/ax_code_coverage.m4 ::g'|sed -e 's:m4/ax_check_enable_debug.m4 ::g'])"
- AC_SUBST([M4FILES])
- 
- TEXIFILES="m4_esyscmd([cd m4 && echo -n *.m4 | sed -e 's/\.m4/.texi/g'])"
diff --git a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
deleted file mode 100644
index 561b57b..0000000
--- a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-require autoconf-archive.inc
-
-
-PARALLEL_MAKE = ""
-
-LICENSE = "GPLv2 & GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-
-SRC_URI[md5sum] = "bf19d4cddce260b3c3e1d51d42509071"
-SRC_URI[sha256sum] = "e8f2efd235f842bad2f6938bf4a72240a5e5fcd248e8444335e63beb60fabd82"
-
-SRC_URI += "\
-        file://delete-some-m4-files.patch \
-"
-
-EXTRA_OECONF += "ac_cv_path_M4=m4"
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb b/meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb
index 06f3bb3..b8b9ef1 100644
--- a/meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb
+++ b/meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb
@@ -17,4 +17,15 @@ DEPENDS = ""
 FILES_${PN} += "${datadir}/aclocal"
 FILES_${PN}-dev = ""
 
+# ax_code_coverage.m4 and ax_check_enable_debug.m4 are in gnome-common only
+# because older versions of autoconf-archive didn't have them yet. Now they
+# are in autoconf-archive from OE-core. We depend on that below to ensure
+# that recipes which only depend on gnome-common still get them.
+do_install_append () {
+    rm -f ${D}${datadir}/aclocal/ax_code_coverage.m4
+    rm -f ${D}${datadir}/aclocal/ax_check_enable_debug.m4
+}
+RDEPENDS_${PN} += "autoconf-archive"
+DEPENDS_append_class-native = " autoconf-archive-native"
+
 BBCLASSEXTEND = "native"

base-commit: 1cbd1bc195017312ba8cf670b340f61a2ac6207b
-- 
git-series 0.9.1

