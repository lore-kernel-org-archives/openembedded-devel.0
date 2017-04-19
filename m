Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B250D71A3E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Apr 2017 06:29:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v3J6TANw007958
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 23:29:10 -0700 (PDT)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 18 Apr 2017 23:29:09 -0700
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 19 Apr 2017 14:28:35 +0800
Message-ID: <1492583315-67555-1-git-send-email-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] autoconf-archive: drop m4files confliction with gnome-common
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
X-List-Received-Date: Wed, 19 Apr 2017 06:29:13 -0000
Content-Type: text/plain

Delete the conflicting m4files with gnome-common to avoid the confliction,
and the two m4 files will be installed by gnome-common that comes from
oe-core, then set rdepends to gnome-common.

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 .../autoconf-archive/autoconf-archive.inc          |  2 +-
 .../autoconf-archive/delete-some-m4-files.patch    | 23 ++++++++++++++++++++++
 .../autoconf-archive_2016.09.16.bb                 |  4 ++++
 3 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/autoconf-archive/autoconf-archive/delete-some-m4-files.patch

diff --git a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
index 779115a..9684d1f 100644
--- a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
+++ b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
@@ -6,7 +6,7 @@ DEPENDS += "m4-native"
 DEPENDS_class-native = "m4-native gnu-config-native"
 DEPENDS_class-nativesdk = "m4-nativesdk gnu-config-nativesdk"
 
-RDEPENDS_${PN} = "m4 gnu-config"
+RDEPENDS_${PN} = "m4 gnu-config gnome-common"
 RDEPENDS_${PN}_class-native = "m4-native gnu-config-native"
 RDEPENDS_${PN}_class-nativesdk = "m4-nativesdk gnu-config-nativesdk"
 
diff --git a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive/delete-some-m4-files.patch b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive/delete-some-m4-files.patch
new file mode 100644
index 0000000..2aa788b
--- /dev/null
+++ b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive/delete-some-m4-files.patch
@@ -0,0 +1,23 @@
+Delete two m4files ax_code_coverage.m4 and ax_check_enable_debug.m4
+to avoid installing conflicts. These two files can be installed by
+gnome-common from oe-core, even if the files in gnmoe-common is
+copied from autoconf-archive(the reason is that the old version
+autoconf-archive don't provide the two files).
+After upgrading to the new version, we need to drop them in meta-oe
+and then set rdepends to gnome-common(oe-core)
+
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+
+Index: a/configure.ac
+===================================================================
+--- a/configure.ac     2016-09-16 06:00:00.000000000 +0800
++++ b/configure.ac     2017-04-18 17:43:05.946290554 +0800
+@@ -19,7 +19,7 @@
+ 
+ AC_PROG_SED
+ 
+-M4FILES="m4_esyscmd([echo -n m4/*.m4])"
++M4FILES="m4_esyscmd([echo -n m4/*.m4 | sed -e 's:m4/ax_code_coverage.m4 ::g'|sed -e 's:m4/ax_check_enable_debug.m4 ::g'])"
+ AC_SUBST([M4FILES])
+ 
+ TEXIFILES="m4_esyscmd([cd m4 && echo -n *.m4 | sed -e 's/\.m4/.texi/g'])"
diff --git a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
index 0a1a771..561b57b 100644
--- a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
+++ b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
@@ -9,5 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SRC_URI[md5sum] = "bf19d4cddce260b3c3e1d51d42509071"
 SRC_URI[sha256sum] = "e8f2efd235f842bad2f6938bf4a72240a5e5fcd248e8444335e63beb60fabd82"
 
+SRC_URI += "\
+        file://delete-some-m4-files.patch \
+"
+
 EXTRA_OECONF += "ac_cv_path_M4=m4"
 BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1


