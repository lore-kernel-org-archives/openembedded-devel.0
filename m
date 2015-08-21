Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E1F6176AE4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2015 08:41:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t7L8fOwf013012
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2015 01:41:24 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Fri, 21 Aug 2015 01:41:23 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 21 Aug 2015 16:37:15 +0800
Message-ID: <1440146235-9630-5-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1440146235-9630-1-git-send-email-kai.kang@windriver.com>
References: <1440146235-9630-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 4/4] libvpx: 1.3.0 -> 1.4.0
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
X-List-Received-Date: Fri, 21 Aug 2015 08:41:24 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

* update SRC_URI
* remove re-definition of S
* drop backport patch 0001-configure.sh-quote-local-variables.patch
* update context of libvpx-configure-support-blank-prefix.patch

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../0001-configure.sh-quote-local-variables.patch  | 40 ---------------------
 .../libvpx-configure-support-blank-prefix.patch    | 42 +++++++++++-----------
 .../webm/{libvpx_1.3.0.bb => libvpx_1.4.0.bb}      | 10 +++---
 3 files changed, 25 insertions(+), 67 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/webm/libvpx/0001-configure.sh-quote-local-variables.patch
 rename meta-oe/recipes-multimedia/webm/{libvpx_1.3.0.bb => libvpx_1.4.0.bb} (79%)

diff --git a/meta-oe/recipes-multimedia/webm/libvpx/0001-configure.sh-quote-local-variables.patch b/meta-oe/recipes-multimedia/webm/libvpx/0001-configure.sh-quote-local-variables.patch
deleted file mode 100644
index bf94b2d..0000000
--- a/meta-oe/recipes-multimedia/webm/libvpx/0001-configure.sh-quote-local-variables.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From f45fe1668401d72c2937a52385b492216715c0f9 Mon Sep 17 00:00:00 2001
-From: James Zern <jzern@google.com>
-Date: Thu, 6 Mar 2014 15:58:37 -0800
-Subject: [PATCH] configure.sh: quote local variables
-
-fixes issue #711
-
-specifying a multiword CC, e.g., CC='gcc -m32', would cause the failure
-under dash
-
-reported in
-https://bugs.gentoo.org/show_bug.cgi?id=498136
-
-patch by floppymaster at gmail dot com
-
-Upstream-Status: Backport [f45fe1668401d72c2937a52385b492216715c0f9]
-
-Change-Id: I2ba246f765646161538622739961ec0f6c2d8c2d
----
- build/make/configure.sh | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/build/make/configure.sh b/build/make/configure.sh
-index 449d1b9..43f8e77 100755
---- a/build/make/configure.sh
-+++ b/build/make/configure.sh
-@@ -405,8 +405,8 @@ true
- }
- 
- write_common_target_config_mk() {
--    local CC=${CC}
--    local CXX=${CXX}
-+    local CC="${CC}"
-+    local CXX="${CXX}"
-     enabled ccache && CC="ccache ${CC}"
-     enabled ccache && CXX="ccache ${CXX}"
-     print_webm_license $1 "##" ""
--- 
-1.8.3.2
-
diff --git a/meta-oe/recipes-multimedia/webm/libvpx/libvpx-configure-support-blank-prefix.patch b/meta-oe/recipes-multimedia/webm/libvpx/libvpx-configure-support-blank-prefix.patch
index 1bf863d..c7a6e51 100644
--- a/meta-oe/recipes-multimedia/webm/libvpx/libvpx-configure-support-blank-prefix.patch
+++ b/meta-oe/recipes-multimedia/webm/libvpx/libvpx-configure-support-blank-prefix.patch
@@ -13,31 +13,31 @@ Fix configure to accept "--prefix=" (a blank prefix).
          ;;
          --libdir=*)
          libdir="${optval}"
-@@ -471,13 +473,23 @@
- 
+@@ -587,13 +587,23 @@ process_cmdline() {
+ }
  
  post_process_common_cmdline() {
--    prefix="${prefix:-/usr/local}"
-+    if [ "$prefixset" != "1" ]
-+    then
-+        prefix=/usr/local
-+    fi
+-  prefix="${prefix:-/usr/local}"
++  if [ "$prefixset" != "1" ]
++  then
++      prefix=/usr/local
++  fi
 +
-+    # Strip trailing slash
-     prefix="${prefix%/}"
++  # Strip trailing slash
+   prefix="${prefix%/}"
 +
-     libdir="${libdir:-${prefix}/lib}"
-     libdir="${libdir%/}"
--    if [ "${libdir#${prefix}}" = "${libdir}" ]; then
--        die "Libdir ${libdir} must be a subdirectory of ${prefix}"
--    fi
+   libdir="${libdir:-${prefix}/lib}"
+   libdir="${libdir%/}"
+-  if [ "${libdir#${prefix}}" = "${libdir}" ]; then
+-    die "Libdir ${libdir} must be a subdirectory of ${prefix}"
+-  fi
 +
-+    case "$libdir" in
-+        "${prefix}/"*) ;;
-+        *)
-+            die "Libdir ${libdir} must be a subdirectory of ${prefix}"
-+            ;;
-+    esac
++  case "$libdir" in
++      "${prefix}/"*) ;;
++      *)
++          die "Libdir ${libdir} must be a subdirectory of ${prefix}"
++          ;;
++  esac
  }
  
- 
+ post_process_cmdline() {
diff --git a/meta-oe/recipes-multimedia/webm/libvpx_1.3.0.bb b/meta-oe/recipes-multimedia/webm/libvpx_1.4.0.bb
similarity index 79%
rename from meta-oe/recipes-multimedia/webm/libvpx_1.3.0.bb
rename to meta-oe/recipes-multimedia/webm/libvpx_1.4.0.bb
index eb19a57..4d9d2fd 100644
--- a/meta-oe/recipes-multimedia/webm/libvpx_1.3.0.bb
+++ b/meta-oe/recipes-multimedia/webm/libvpx_1.4.0.bb
@@ -7,13 +7,11 @@ LICENSE = "BSD"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d5b04755015be901744a78cc30d390d4"
 
-SRC_URI += "http://webm.googlecode.com/files/libvpx-v${PV}.tar.bz2 \
+SRC_URI += "http://storage.googleapis.com/downloads.webmproject.org/releases/webm/${BP}.tar.bz2 \
             file://libvpx-configure-support-blank-prefix.patch \
-            file://0001-configure.sh-quote-local-variables.patch"
-SRC_URI[md5sum] = "14783a148872f2d08629ff7c694eb31f"
-SRC_URI[sha256sum] = "d3dcc8d84af51c6c382b214397c62402e37a799e8ebcda6f4217aef0010451a9"
-
-S = "${WORKDIR}/libvpx-v${PV}"
+           "
+SRC_URI[md5sum] = "63b1d7f59636a42eeeee9225cc14e7de"
+SRC_URI[sha256sum] = "f582d9b2d60a592a4a3d8c32965ca2d2167e9ade38c6c30bac8801ff66a118e4"
 
 # ffmpeg links with this and fails 
 # sysroots/armv4t-oe-linux-gnueabi/usr/lib/libvpx.a(vpx_encoder.c.o)(.text+0xc4): unresolvable R_ARM_THM_CALL relocation against symbol `memcpy@@GLIBC_2.4'
-- 
1.9.1


