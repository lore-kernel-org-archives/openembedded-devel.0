Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id 94A0779BA6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2018 10:49:19 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id y140-v6so3925468wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2018 03:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=+n8cMrrUVeJnIQAJp1Ry82Ala9B2TSEZk/SjQRySdeo=;
	b=VJROzBv6iFoRSy4aEzae1M15SFVYHIP7z5+ukKBJWa2UbrIZRgVe3Xy8lcs4dske1r
	3+nVwcbz2oWjC6NS21LPAyRrQBZ5Mrc6S5RSGwAGDih4WTAtg+h1yM80rm6P0ZmpQJlg
	sCFv4dpZC1SKBZ4MSEmzqGEAgvsCot33ghdqJkPUkmigH9UNlnSPt4jq/3Y14vlHDkqx
	6hFHmHqx84Glngw/E0LqUIztpAKLyAvjthJqmm00RbAuUC51FGK0X55aXqta9wbsMRjQ
	rdfbEuqDYjE2wl9fJY8MmSUzBhdCiqFYe4CkoYraXsKdol4wBm4k0ysgPpxZW33MfQNs
	Chxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+n8cMrrUVeJnIQAJp1Ry82Ala9B2TSEZk/SjQRySdeo=;
	b=bhjUb0PcuK81s/MpRilcGA5r+oFA6rut0pbGW7mSDnm/q2hrfjcC8SfzGfU7xMPZ8n
	mKZkZgHb6sJ/+rpbGSSTrGsMBHRPl7DxWdIbp85RA2UtY2oXtTg44pLYJ/Mz6pzJhQwF
	0jBkA3Leima8EYJ9aaZ4le5QpeYOzgsvFBHzYlwQKW9aYXlNommkIdMGRdq+l1ZpqQcI
	jy5r9vUn/c0kXW07aslkETZgwTFRA1d3ZMi3O7xiJNwZg1wrQDJGJ+WjgC5ggpX3ULRu
	yqCXjuTQUVSJuRdTiWXD+OHCYq6EIeLVPGhU75PYhnJdtFcQWB3tMN+GOqaefaqprFYq
	HQ9g==
X-Gm-Message-State: AGRZ1gJxUzIr0G8enUPlo0vTiHp5z6ZfQ7eimpanRj2ybt+7/zJdJ8J8
	Y4VAokGkBj+py3rQHquhImFkDm/3
X-Google-Smtp-Source: AJdET5cOqttpNTWgS12k1Fp5AZVDi70FMwyFWYBDDyZGAf3sPYltxcgNC7cTjj1Ex8npqMoWPOARKw==
X-Received: by 2002:a7b:c00a:: with SMTP id
	c10-v6mr4954462wmb.73.1540550959075; 
	Fri, 26 Oct 2018 03:49:19 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	x8-v6sm23905660wrd.54.2018.10.26.03.49.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 26 Oct 2018 03:49:18 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Oct 2018 12:48:56 +0200
Message-Id: <20181026104857.32142-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.5
In-Reply-To: <20181026104857.32142-1-schnitzeltony@gmail.com>
References: <20181026104857.32142-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 7/8] networkmanager: upgrade 1.10.10 -> 1.14.4
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
X-List-Received-Date: Fri, 26 Oct 2018 10:49:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* License checksum: copyright year changed
* packageconfig glib: with this version (udev-)glib support hase to be enabled
  explicitly. Split this out to meta-gnome where network-manager-applet lives.
* packageconfig netconfig: This was nonsense: netconfig is a SUSE tool [1]
  which is not found in layer index. The error was detected now because
  configuration checks for presence of netconfig.
* --disable-ifnet and --disable-ifcfg-suse are gone
* muse patches were aligned but have no resources to test them

[1] https://github.com/openSUSE/sysconfig

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../networkmanager/networkmanager_%.bbappend       |  3 ++
 ...emove-net-ethernet.h-seems-to-be-over-spe.patch |  7 ++-
 ...figure.ac-Fix-pkgconfig-sysroot-locations.patch |  4 +-
 ...te-settings-settings-property-documentati.patch | 51 ++++++++++++----------
 .../networkmanager/musl/0001-musl-basic.patch      | 13 +++---
 .../musl/0002-musl-dlopen-configure-ac.patch       |  4 +-
 .../musl/0003-musl-network-support.patch           | 14 +++---
 .../musl/0004-musl-process-util.patch              | 32 +++++++-------
 ...further-conflicts-by-including-net-ethern.patch | 20 ++++-----
 .../0006-Add-a-strndupa-replacement-for-musl.patch |  4 +-
 ...manager_1.10.10.bb => networkmanager_1.14.4.bb} | 18 +++-----
 11 files changed, 85 insertions(+), 85 deletions(-)
 create mode 100644 meta-gnome/recipes-connectivity/networkmanager/networkmanager_%.bbappend
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.10.10.bb => networkmanager_1.14.4.bb} (89%)

diff --git a/meta-gnome/recipes-connectivity/networkmanager/networkmanager_%.bbappend b/meta-gnome/recipes-connectivity/networkmanager/networkmanager_%.bbappend
new file mode 100644
index 000000000..291a61605
--- /dev/null
+++ b/meta-gnome/recipes-connectivity/networkmanager/networkmanager_%.bbappend
@@ -0,0 +1,3 @@
+# networkmanager-applet requires glib support
+PACKAGECONFIG_append = "glib"
+
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch
index 719442319..49a07353d 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch
@@ -1,8 +1,7 @@
 From 18f71c1b48730b8602826517f2b5b088283ae948 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 31 Mar 2017 16:48:00 -0700
-Subject: [PATCH 5/7] sd-lldp.h: Remove net/ethernet.h seems to be over
- specified
+Subject: [PATCH] sd-lldp.h: Remove net/ethernet.h seems to be over specified
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
@@ -14,7 +13,7 @@ diff --git a/src/systemd/src/libsystemd-network/sd-lldp.c b/src/systemd/src/libs
 index 31e2448..7721cc2 100644
 --- a/src/systemd/src/libsystemd-network/sd-lldp.c
 +++ b/src/systemd/src/libsystemd-network/sd-lldp.c
-@@ -21,6 +21,7 @@
+@@ -3,6 +3,7 @@
  #include "nm-sd-adapt.h"
  
  #include <arpa/inet.h>
@@ -26,7 +25,7 @@ diff --git a/src/systemd/src/systemd/sd-lldp.h b/src/systemd/src/systemd/sd-lldp
 index 3f35eeb..61b0e45 100644
 --- a/src/systemd/src/systemd/sd-lldp.h
 +++ b/src/systemd/src/systemd/sd-lldp.h
-@@ -22,7 +22,7 @@
+@@ -18,7 +18,7 @@
  ***/
  
  #include <inttypes.h>
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch
index 28848d354..351f264cb 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch
@@ -1,7 +1,7 @@
 From 583f0448fb7e9aba2b410c06eec6f420b41a6a0c Mon Sep 17 00:00:00 2001
 From: Pablo Saavedra <psaavedra@igalia.com>
 Date: Tue, 13 Mar 2018 17:36:20 +0100
-Subject: [PATCH 7/7] Fixed configure.ac: Fix pkgconfig sysroot locations
+Subject: [PATCH] Fixed configure.ac: Fix pkgconfig sysroot locations
 
 ---
  configure.ac | 2 +-
@@ -11,7 +11,7 @@ diff --git a/configure.ac b/configure.ac
 index 51e5eb6..c9d3e56 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -669,7 +669,7 @@ else
+@@ -572,7 +572,7 @@ if test "$have_jansson" = "yes"; then
  	AC_DEFINE(WITH_JANSSON, 1, [Define if JANSSON is enabled])
  
  	AC_CHECK_TOOLS(READELF, [eu-readelf readelf])
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-Do-not-create-settings-settings-property-documentati.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-Do-not-create-settings-settings-property-documentati.patch
index 92485f044..c50293c09 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-Do-not-create-settings-settings-property-documentati.patch
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-Do-not-create-settings-settings-property-documentati.patch
@@ -13,15 +13,15 @@ Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
 ---
- Makefile.am  | 18 ++----------------
- configure.ac |  4 ----
- 2 files changed, 2 insertions(+), 20 deletions(-)
+ Makefile.am  | 20 --------------------
+ configure.ac |  5 -----
+ 2 files changed, 25 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 639921d..314a61d 100644
+index 1e100f6..d31e3c1 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -961,9 +961,7 @@ endif
+@@ -1115,9 +1115,7 @@ EXTRA_DIST += \
  if HAVE_INTROSPECTION
  
  libnm_noinst_data = \
@@ -31,37 +31,39 @@ index 639921d..314a61d 100644
  	libnm/nm-settings-keyfile-docs.xml \
  	libnm/nm-settings-ifcfg-rh-docs.xml
  
-@@ -3317,23 +3315,11 @@ $(clients_common_libnmc_base_la_OBJECTS): $(libnm_core_lib_h_pub_mkenums)
+@@ -3692,27 +3690,9 @@ $(clients_common_libnmc_base_la_OBJECTS): $(libnm_lib_h_pub_mkenums)
  $(clients_common_libnmc_base_la_OBJECTS): clients/common/.dirstamp
  
- clients_common_settings_doc_c = clients/common/settings-docs.c
+ clients_common_settings_doc_h = clients/common/settings-docs.h
 -if HAVE_INTROSPECTION
--$(clients_common_settings_doc_c): clients/common/settings-docs.xsl libnm/nm-property-docs.xml clients/common/.dirstamp
+-$(clients_common_settings_doc_h): clients/common/settings-docs.xsl libnm/nm-property-docs.xml clients/common/.dirstamp
 -	$(AM_V_GEN) $(XSLTPROC) --output $@ $< $(word 2,$^)
--DISTCLEANFILES += $(clients_common_settings_doc_c)
--check-local-settings-docs: $(clients_common_settings_doc_c)
--	@if test -z "$$NMTST_NO_CHECK_SETTINGS_DOCS" ; then  \
--		if ! cmp -s "$(srcdir)/$(clients_common_settings_doc_c).in" "$(builddir)/$(clients_common_settings_doc_c)" ; then \
--			echo "The generated file \"$(builddir)/$(clients_common_settings_doc_c)\" differs from the source file \"$(srcdir)/$(clients_common_settings_doc_c).in\". You probably should copy the generated file over to the source file. You can skip this test by setting \$$NMTST_NO_CHECK_SETTINGS_DOCS=yes"; \
--			false; \
+-DISTCLEANFILES += $(clients_common_settings_doc_h)
+-check-local-settings-docs: $(clients_common_settings_doc_h)
+-	@if test -z "$$NMTST_NO_CHECK_SETTINGS_DOCS" ; then \
+-		if ! cmp -s "$(srcdir)/$(clients_common_settings_doc_h).in" "$(builddir)/$(clients_common_settings_doc_h)" ; then \
+-			if test "$$NM_TEST_REGENERATE" == 1 ; then \
+-				cp -f "$(builddir)/$(clients_common_settings_doc_h)" "$(srcdir)/$(clients_common_settings_doc_h).in"; \
+-			else \
+-				echo "The generated file \"$(builddir)/$(clients_common_settings_doc_h)\" differs from the source file \"$(srcdir)/$(clients_common_settings_doc_h).in\". You probably should copy the generated file over to the source file. You can skip this test by setting \$$NMTST_NO_CHECK_SETTINGS_DOCS=yes". You can also automatically copy the file by rerunning the test with \$$NM_TEST_REGENERATE=1 ; \
+-				false; \
+-			fi; \
 -		fi;\
 -	fi
 -check_local += check-local-settings-docs
 -else
-+
- $(clients_common_settings_doc_c): $(clients_common_settings_doc_c).in clients/common/.dirstamp
- 	$(AM_V_GEN) cp "$(srcdir)/$(clients_common_settings_doc_c).in" "$(builddir)/$(clients_common_settings_doc_c)"
+ $(clients_common_settings_doc_h): $(clients_common_settings_doc_h).in clients/common/.dirstamp
+ 	$(AM_V_GEN) cp "$(srcdir)/$(clients_common_settings_doc_h).in" "$(builddir)/$(clients_common_settings_doc_h)"
  check-local-settings-docs:
 -endif
-+
  EXTRA_DIST += \
- 	$(clients_common_settings_doc_c) \
- 	$(clients_common_settings_doc_c).in
+ 	$(clients_common_settings_doc_h) \
+ 	$(clients_common_settings_doc_h).in
 diff --git a/configure.ac b/configure.ac
-index c9d3e56..407222e 100644
+index 79dc3b9..23d14a6 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1286,10 +1286,6 @@ GTK_DOC_CHECK(1.0)
+@@ -1195,11 +1195,6 @@ GTK_DOC_CHECK(1.0)
  # check if we can build setting property documentation
  build_docs=no
  if test -n "$INTROSPECTION_MAKEFILE"; then
@@ -69,9 +71,10 @@ index c9d3e56..407222e 100644
 -	if ! "$PYTHON" -c 'from gi.repository import GObject' >& /dev/null; then
 -		AC_MSG_ERROR(["--enable-introspection aims to build the settings documentation. This requires GObject introspection for python (pygobject)])
 -	fi
- 
+-
  	AC_PATH_PROG(PERL, perl)
  	if test -z "$PERL"; then
+ 		AC_MSG_ERROR([--enable-introspection requires perl])
 -- 
-2.14.3
+2.14.5
 
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-musl-basic.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-musl-basic.patch
index 9d208e1fd..00dda5b18 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-musl-basic.patch
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-musl-basic.patch
@@ -1,7 +1,7 @@
 From e92de7409a3e107f90d108a9c5d49bd0418296dd Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
 Date: Thu, 22 Mar 2018 17:54:10 +0100
-Subject: [PATCH 1/4] Usual fix for musl libc
+Subject: [PATCH] Usual fix for musl libc
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -13,18 +13,19 @@ Stolen from [1] and prettyfied slightly
 [1] https://github.com/voidlinux/void-packages/tree/master/srcpkgs/NetworkManager/patches
 
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+
 ---
  src/systemd/src/basic/stdio-util.h | 2 ++
  src/systemd/src/basic/util.h       | 5 +++++
  2 files changed, 7 insertions(+)
 
 diff --git a/src/systemd/src/basic/stdio-util.h b/src/systemd/src/basic/stdio-util.h
-index bd1144b..9eafacb 100644
+index 73c0327..e1ce64f 100644
 --- a/src/systemd/src/basic/stdio-util.h
 +++ b/src/systemd/src/basic/stdio-util.h
-@@ -19,7 +19,9 @@
-   along with systemd; If not, see <http://www.gnu.org/licenses/>.
- ***/
+@@ -1,7 +1,9 @@
+ /* SPDX-License-Identifier: LGPL-2.1+ */
+ #pragma once
  
 +#if defined(__GLIBC__)
  #include <printf.h>
@@ -36,7 +37,7 @@ diff --git a/src/systemd/src/basic/util.h b/src/systemd/src/basic/util.h
 index b31dfd1..9b7032c 100644
 --- a/src/systemd/src/basic/util.h
 +++ b/src/systemd/src/basic/util.h
-@@ -46,6 +46,11 @@
+@@ -28,6 +28,11 @@
  #include "missing.h"
  #include "time-util.h"
  
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-musl-dlopen-configure-ac.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-musl-dlopen-configure-ac.patch
index 548cccb32..c162c1dfb 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-musl-dlopen-configure-ac.patch
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-musl-dlopen-configure-ac.patch
@@ -1,7 +1,7 @@
 From 57239fda56b68a8f3e413f7b6af5290ba0d86636 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
 Date: Thu, 22 Mar 2018 18:18:06 +0100
-Subject: [PATCH 2/4] musl: dlopen is included so LD_LIBS="" instead of
+Subject: [PATCH] musl: dlopen is included so LD_LIBS="" instead of
  LD_LIBS="none required"
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
@@ -22,7 +22,7 @@ diff --git a/configure.ac b/configure.ac
 index 487a266..96ae4f7 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -305,6 +305,7 @@ dnl
+@@ -235,6 +235,7 @@ dnl
  dnl Checks for libdl - on certain platforms its part of libc
  dnl
  AC_SEARCH_LIBS([dlopen], [dl dld], [], [ac_cv_search_dlopen=])
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0003-musl-network-support.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0003-musl-network-support.patch
index 5dd17b63b..9a58c0e34 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0003-musl-network-support.patch
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0003-musl-network-support.patch
@@ -1,7 +1,7 @@
 From 714b4731a238653e9c7d885c0dee10677b0a4df3 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
 Date: Thu, 22 Mar 2018 18:24:07 +0100
-Subject: [PATCH 3/4] musl: network support
+Subject: [PATCH] musl: network support
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -15,7 +15,7 @@ Stolen from [1] and prettyfied slightly
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
 ---
  libnm-core/nm-utils.h               | 4 ++++
- src/platform/wifi/wifi-utils.h      | 4 ++++
+ src/platform/wifi/nm-wifi-utils.h   | 4 ++++
  src/systemd/src/basic/socket-util.h | 5 +++++
  3 files changed, 13 insertions(+)
 
@@ -35,10 +35,10 @@ index df9284b..2bcf4b8 100644
  #include <linux/if_infiniband.h>
  
  #include "nm-core-enum-types.h"
-diff --git a/src/platform/wifi/wifi-utils.h b/src/platform/wifi/wifi-utils.h
+diff --git a/src/platform/wifi/nm-wifi-utils.h b/src/platform/wifi/nm-wifi-utils.h
 index 705717b..da3edc4 100644
---- a/src/platform/wifi/wifi-utils.h
-+++ b/src/platform/wifi/wifi-utils.h
+--- a/src/platform/wifi/nm-wifi-utils.h
++++ b/src/platform/wifi/nm-wifi-utils.h
 @@ -22,7 +22,11 @@
  #ifndef __WIFI_UTILS_H__
  #define __WIFI_UTILS_H__
@@ -50,12 +50,12 @@ index 705717b..da3edc4 100644
 +#endif
  
  #include "nm-dbus-interface.h"
- 
+ #include "nm-setting-wireless.h"
 diff --git a/src/systemd/src/basic/socket-util.h b/src/systemd/src/basic/socket-util.h
 index d7e2d85..d109c84 100644
 --- a/src/systemd/src/basic/socket-util.h
 +++ b/src/systemd/src/basic/socket-util.h
-@@ -29,6 +29,11 @@
+@@ -11,6 +11,11 @@
  #include <linux/netlink.h>
  #include <linux/if_infiniband.h>
  #include <linux/if_packet.h>
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0004-musl-process-util.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0004-musl-process-util.patch
index fc55ce85f..9e5c94336 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0004-musl-process-util.patch
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0004-musl-process-util.patch
@@ -1,7 +1,7 @@
 From d513c8bfc982dbd976617178b040c512c95710b6 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
-Date: Thu, 22 Mar 2018 18:29:00 +0100
-Subject: [PATCH 4/4] musl: process-util
+Date: Thu, 25 Oct 2018 09:57:07 +0200
+Subject: [PATCH] musl: process-util
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -18,10 +18,10 @@ Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
  1 file changed, 9 insertions(+)
 
 diff --git a/src/systemd/src/basic/process-util.c b/src/systemd/src/basic/process-util.c
-index 272030d..485f1db 100644
+index 1412f03..45f5049 100644
 --- a/src/systemd/src/basic/process-util.c
 +++ b/src/systemd/src/basic/process-util.c
-@@ -36,6 +36,9 @@
+@@ -21,6 +21,9 @@
  #include <sys/wait.h>
  #include <syslog.h>
  #include <unistd.h>
@@ -31,7 +31,7 @@ index 272030d..485f1db 100644
  #if 0 /* NM_IGNORED */
  #if HAVE_VALGRIND_VALGRIND_H
  #include <valgrind/valgrind.h>
-@@ -1015,11 +1018,13 @@ static void reset_cached_pid(void) {
+@@ -1153,11 +1156,13 @@ void reset_cached_pid(void) {
          cached_pid = CACHED_PID_UNSET;
  }
  
@@ -39,24 +39,24 @@ index 272030d..485f1db 100644
  /* We use glibc __register_atfork() + __dso_handle directly here, as they are not included in the glibc
   * headers. __register_atfork() is mostly equivalent to pthread_atfork(), but doesn't require us to link against
   * libpthread, as it is part of glibc anyway. */
- extern int __register_atfork(void (*prepare) (void), void (*parent) (void), void (*child) (void), void * __dso_handle);
+ extern int __register_atfork(void (*prepare) (void), void (*parent) (void), void (*child) (void), void *dso_handle);
  extern void* __dso_handle __attribute__ ((__weak__));
 +#endif
  
  pid_t getpid_cached(void) {
-         pid_t current_value;
-@@ -1042,7 +1047,11 @@ pid_t getpid_cached(void) {
- 
-                 new_pid = getpid();
+         static bool installed = false;
+@@ -1186,7 +1191,11 @@ pid_t getpid_cached(void) {
+                          * only half-documented (glibc doesn't document it but LSB does — though only superficially)
+                          * we'll check for errors only in the most generic fashion possible. */
  
 +#ifdef __GLIBC__
-                 if (__register_atfork(NULL, NULL, reset_cached_pid, __dso_handle) != 0) {
+                         if (__register_atfork(NULL, NULL, reset_cached_pid, __dso_handle) != 0) {
 +#else
-+                if (pthread_atfork(NULL, NULL, reset_cached_pid) != 0) {
++                        if (pthread_atfork(NULL, NULL, reset_cached_pid) != 0) {
 +#endif
-                         /* OOM? Let's try again later */
-                         cached_pid = CACHED_PID_UNSET;
-                         return new_pid;
+                                 /* OOM? Let's try again later */
+                                 cached_pid = CACHED_PID_UNSET;
+                                 return new_pid;
 -- 
-2.14.3
+2.14.5
 
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0005-musl-avoid-further-conflicts-by-including-net-ethern.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0005-musl-avoid-further-conflicts-by-including-net-ethern.patch
index 752fe4f58..6bca95e18 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0005-musl-avoid-further-conflicts-by-including-net-ethern.patch
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0005-musl-avoid-further-conflicts-by-including-net-ethern.patch
@@ -17,10 +17,10 @@ Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
  4 files changed, 8 insertions(+)
 
 diff --git a/src/systemd/src/systemd/sd-dhcp-client.h b/src/systemd/src/systemd/sd-dhcp-client.h
-index 5e46d8d..18a613f 100644
+index e388552..9c4dde8 100644
 --- a/src/systemd/src/systemd/sd-dhcp-client.h
 +++ b/src/systemd/src/systemd/sd-dhcp-client.h
-@@ -21,7 +21,9 @@
+@@ -20,7 +20,9 @@
  ***/
  
  #include <inttypes.h>
@@ -31,10 +31,10 @@ index 5e46d8d..18a613f 100644
  #include <sys/types.h>
  
 diff --git a/src/systemd/src/systemd/sd-dhcp-lease.h b/src/systemd/src/systemd/sd-dhcp-lease.h
-index 7ab99cc..85acdf2 100644
+index 2a60145..19d1814 100644
 --- a/src/systemd/src/systemd/sd-dhcp-lease.h
 +++ b/src/systemd/src/systemd/sd-dhcp-lease.h
-@@ -22,7 +22,9 @@
+@@ -19,7 +19,9 @@
  ***/
  
  #include <inttypes.h>
@@ -45,24 +45,24 @@ index 7ab99cc..85acdf2 100644
  #include <sys/types.h>
  
 diff --git a/src/systemd/src/systemd/sd-dhcp6-client.h b/src/systemd/src/systemd/sd-dhcp6-client.h
-index 7819f0d..35f30ee 100644
+index fa36dca..2d25010 100644
 --- a/src/systemd/src/systemd/sd-dhcp6-client.h
 +++ b/src/systemd/src/systemd/sd-dhcp6-client.h
-@@ -21,7 +21,9 @@
+@@ -20,7 +20,9 @@
  ***/
  
  #include <inttypes.h>
 +#if defined(__GLIBC__)
  #include <net/ethernet.h>
 +#endif
+ #include <stdbool.h>
  #include <sys/types.h>
  
- #include "sd-dhcp6-lease.h"
 diff --git a/src/systemd/src/systemd/sd-ipv4ll.h b/src/systemd/src/systemd/sd-ipv4ll.h
-index 5ba9208..c90eca6 100644
+index 71bd4cf..1c667ba 100644
 --- a/src/systemd/src/systemd/sd-ipv4ll.h
 +++ b/src/systemd/src/systemd/sd-ipv4ll.h
-@@ -20,7 +20,9 @@
+@@ -19,7 +19,9 @@
    along with systemd; If not, see <http://www.gnu.org/licenses/>.
  ***/
  
@@ -73,5 +73,5 @@ index 5ba9208..c90eca6 100644
  
  #include "sd-event.h"
 -- 
-2.14.3
+2.14.5
 
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0006-Add-a-strndupa-replacement-for-musl.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0006-Add-a-strndupa-replacement-for-musl.patch
index 8ed7ee64f..023a4d9ad 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0006-Add-a-strndupa-replacement-for-musl.patch
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0006-Add-a-strndupa-replacement-for-musl.patch
@@ -18,7 +18,7 @@ diff --git a/src/systemd/src/basic/in-addr-util.c b/src/systemd/src/basic/in-add
 index 2a02d90..a57c360 100644
 --- a/src/systemd/src/basic/in-addr-util.c
 +++ b/src/systemd/src/basic/in-addr-util.c
-@@ -30,6 +30,7 @@
+@@ -13,6 +13,7 @@
  #include "in-addr-util.h"
  #include "macro.h"
  #include "parse-util.h"
@@ -30,7 +30,7 @@ diff --git a/src/systemd/src/basic/string-util.h b/src/systemd/src/basic/string-
 index 4c94b18..a6dc446 100644
 --- a/src/systemd/src/basic/string-util.h
 +++ b/src/systemd/src/basic/string-util.h
-@@ -44,6 +44,11 @@
+@@ -26,6 +26,11 @@
  #define strcaseeq(a,b) (strcasecmp((a),(b)) == 0)
  #define strncaseeq(a, b, n) (strncasecmp((a), (b), (n)) == 0)
  
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.10.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.14.4.bb
similarity index 89%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.10.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.14.4.bb
index 682c89623..3ce2a2f89 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.10.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.14.4.bb
@@ -5,16 +5,13 @@ SECTION = "net/misc"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b \
                     file://libnm-util/COPYING;md5=1c4fa765d6eb3cd2fbd84344a1b816cd \
-                    file://docs/api/html/license.html;md5=ac20f1edc24f72480a1106871e9fbe9a \
+                    file://docs/api/html/license.html;md5=2d56a1b0c42e388aa86aef59b154e8c3 \
 "
 
 DEPENDS = " \
     intltool-native \
     libxslt-native \
     libnl \
-    dbus \
-    dbus-glib \
-    dbus-glib-native \
     libgudev \
     util-linux \
     libndp \
@@ -38,8 +35,8 @@ SRC_URI = " \
     file://musl/0005-musl-avoid-further-conflicts-by-including-net-ethern.patch \
     file://musl/0006-Add-a-strndupa-replacement-for-musl.patch \
 "
-SRC_URI[md5sum] = "8c67fc286150ed357b6c833b9e015330"
-SRC_URI[sha256sum] = "244e29c0d1a57492df9aaf2d8c31e4a1b76bdfa8e862ae106239862e1c78c3ca"
+SRC_URI[md5sum] = "54ce62f0aa18ef6c5e754eaac47494ac"
+SRC_URI[sha256sum] = "35a3ede4c7d12d6212033c9e44cb82b7692f38063b53a067567f02f5937c8c18"
 
 UPSTREAM_CHECK_URI = "${GNOME_MIRROR}/NetworkManager/1.10/"
 UPSTREAM_CHECK_REGEX = "NetworkManager\-(?P<pver>1\.10(\.\d+)+).tar.xz"
@@ -48,8 +45,6 @@ S = "${WORKDIR}/NetworkManager-${PV}"
 
 EXTRA_OECONF = " \
     --disable-ifcfg-rh \
-    --disable-ifnet \
-    --disable-ifcfg-suse \
     --disable-more-warnings \
     --with-iptables=${sbindir}/iptables \
     --with-tests \
@@ -69,7 +64,7 @@ do_compile_prepend() {
     export GIR_EXTRA_LIBS_PATH="${B}/libnm/.libs:${B}/libnm-glib/.libs:${B}/libnm-util/.libs"
 }
 
-PACKAGECONFIG ??= "nss ifupdown netconfig dhclient dnsmasq \
+PACKAGECONFIG ??= "nss ifupdown dhclient dnsmasq \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', bb.utils.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d), d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'wifi', d)} \
@@ -88,10 +83,10 @@ PACKAGECONFIG[ppp] = "--enable-ppp,--disable-ppp,ppp,ppp"
 PACKAGECONFIG[dhclient] = "--with-dhclient=${base_sbindir}/dhclient,,,dhcp-client"
 PACKAGECONFIG[dnsmasq] = "--with-dnsmasq=${bindir}/dnsmasq"
 PACKAGECONFIG[nss] = "--with-crypto=nss,,nss"
+PACKAGECONFIG[glib] = "--with-libnm-glib,,dbus-glib-native dbus-glib"
 PACKAGECONFIG[gnutls] = "--with-crypto=gnutls,,gnutls"
 PACKAGECONFIG[wifi] = "--enable-wifi=yes,--enable-wifi=no,,wpa-supplicant"
 PACKAGECONFIG[ifupdown] = "--enable-ifupdown,--disable-ifupdown"
-PACKAGECONFIG[netconfig] = "--with-netconfig=yes,--with-netconfig=no"
 PACKAGECONFIG[qt4-x11-free] = "--enable-qt,--disable-qt,qt4-x11-free"
 
 PACKAGES =+ "libnmutil libnmglib libnmglib-vpn \
@@ -107,8 +102,7 @@ FILES_${PN}-adsl = "${libdir}/NetworkManager/libnm-device-plugin-adsl.so"
 
 FILES_${PN} += " \
     ${libexecdir} \
-    ${libdir}/pppd/*/nm-pppd-plugin.so \
-    ${libdir}/NetworkManager/*.so \
+    ${libdir}/NetworkManager/${PV}/*.so \
     ${nonarch_libdir}/NetworkManager/VPN \
     ${nonarch_libdir}/NetworkManager/conf.d \
     ${datadir}/polkit-1 \
-- 
2.14.5


