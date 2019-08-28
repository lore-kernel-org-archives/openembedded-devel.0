Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D04817ED40
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 03:43:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x7S3hBMN028504
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Aug 2019 20:43:11 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 27 Aug 2019 20:43:10 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 27 Aug 2019 23:43:07 -0400
Message-ID: <20190828034307.182169-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190828034307.182169-1-kai.kang@windriver.com>
References: <20190828034307.182169-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [RFC PATCH 1/1] networkmanager: 1.18.2 -> 1.20.0
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
X-List-Received-Date: Wed, 28 Aug 2019 03:43:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Kai Kang <kai.kang@windriver.com>

Update networkmanager to latest stable release 1.20.0.

* adopt meson to replace autotools
  - it speeds up about 30% from 2m27s to 1m36s
  - remove 2 autotools related patches and add 2 similar ones for meson
* update context of musl patches and add one to fix mrand48_r related
  failure for musl
* it removes libnm-glib, libnm-glib-vpn, and libnm-util by commit
  https://gitlab.freedesktop.org/NetworkManager/NetworkManager/commit/5801f89f4d1464fc15cb1d97755b73f9f68cb2e6
  remove related items license file, packge config 'glib' and sub-packges from recipe
* add new PACKAGECONFIGs audit and selinux, and sort PACKAGECONFIGs except systemd

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...e.ac-Fix-pkgconfig-sysroot-locations.patch |  22 ---
 ...ttings-settings-property-documentati.patch |  71 ---------
 ...on.build-pkgconfig-sysroot-locations.patch |  23 +++
 ...eate-settings-property-documentation.patch | 146 ++++++++++++++++++
 ...Fix-build-with-musl-systemd-specific.patch |  10 +-
 .../musl/0002-Fix-build-with-musl.patch       |  12 +-
 .../musl/0003-Fix-mrand48_r-with-musl.patch   |  47 ++++++
 ...ger_1.18.2.bb => networkmanager_1.20.0.bb} |  72 +++++----
 8 files changed, 262 insertions(+), 141 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-Do-not-create-settings-settings-property-documentati.patch
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/fix-meson.build-pkgconfig-sysroot-locations.patch
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/meson-do-not-create-settings-property-documentation.patch
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0003-Fix-mrand48_r-with-musl.patch
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.18.2.bb => networkmanager_1.20.0.bb} (62%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch
deleted file mode 100644
index 302c0292b..000000000
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-From 3dc3d8e73bc430ea4e93e33f7b2a4b3e0ff175af Mon Sep 17 00:00:00 2001
-From: Pablo Saavedra <psaavedra@igalia.com>
-Date: Tue, 13 Mar 2018 17:36:20 +0100
-Subject: [PATCH] Fixed configure.ac: Fix pkgconfig sysroot locations
-
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 967eac0..b914219 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -592,7 +592,7 @@ if test "$have_jansson" = "yes"; then
- 	AC_DEFINE(WITH_JANSSON, 1, [Define if JANSSON is enabled])
- 
- 	AC_CHECK_TOOLS(READELF, [eu-readelf readelf])
--	JANSSON_LIBDIR=`$PKG_CONFIG --variable=libdir jansson`
-+	JANSSON_LIBDIR=${PKG_CONFIG_SYSROOT_DIR}`$PKG_CONFIG --variable=libdir jansson`
- 	JANSSON_SONAME=`$READELF -d $JANSSON_LIBDIR/libjansson.so |sed -n 's/.*SONAME.*\[[\([^]]*\)]]/\1/p'`
- 
- 	if test "$JANSSON_SONAME" = ""; then
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-Do-not-create-settings-settings-property-documentati.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-Do-not-create-settings-settings-property-documentati.patch
deleted file mode 100644
index 5581dd3aa..000000000
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-Do-not-create-settings-settings-property-documentati.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 4f000a4a19975d6aba71427e693cd1ed080abda9 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
-Date: Thu, 22 Mar 2018 11:08:30 +0100
-Subject: [PATCH] Do not create settings settings/property documentation
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-It was tried to get this work but gi / GirRepository could not be found by
-python. Anyway it is not necessary for us to have the settings/property docs.
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
----
- Makefile.am  | 11 -----------
- configure.ac |  5 -----
- 2 files changed, 16 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index b180466..1ab4658 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -1298,9 +1298,7 @@ EXTRA_DIST += \
- if HAVE_INTROSPECTION
- 
- libnm_noinst_data = \
--	libnm/nm-property-docs.xml \
- 	libnm/nm-settings-docs-overrides.xml \
--	libnm/nm-settings-docs.xml \
- 	libnm/nm-settings-keyfile-docs.xml \
- 	libnm/nm-settings-ifcfg-rh-docs.xml
- 
-@@ -3930,18 +3928,9 @@ $(clients_common_libnmc_base_la_OBJECTS): $(libnm_lib_h_pub_mkenums)
- $(clients_common_libnmc_base_la_OBJECTS): clients/common/.dirstamp
- 
- clients_common_settings_doc_h = clients/common/settings-docs.h
--if HAVE_INTROSPECTION
--$(clients_common_settings_doc_h): clients/common/settings-docs.xsl libnm/nm-property-docs.xml clients/common/.dirstamp
--	$(AM_V_GEN) $(XSLTPROC) --output $@ $< $(word 2,$^)
--DISTCLEANFILES += $(clients_common_settings_doc_h)
--check-local-settings-docs: $(clients_common_settings_doc_h)
--	$(srcdir)/tools/check-settings-docs.sh "$(srcdir)" "$(builddir)" "$(clients_common_settings_doc_h)"
--check_local += check-local-settings-docs
--else
- $(clients_common_settings_doc_h): $(clients_common_settings_doc_h).in clients/common/.dirstamp
- 	$(AM_V_GEN) cp "$(srcdir)/$(clients_common_settings_doc_h).in" "$(builddir)/$(clients_common_settings_doc_h)"
- check-local-settings-docs:
--endif
- EXTRA_DIST += \
- 	$(clients_common_settings_doc_h) \
- 	$(clients_common_settings_doc_h).in
-diff --git a/configure.ac b/configure.ac
-index b914219..872c292 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1215,11 +1215,6 @@ GTK_DOC_CHECK(1.0)
- # check if we can build setting property documentation
- build_docs=no
- if test -n "$INTROSPECTION_MAKEFILE"; then
--	# If g-i is installed we know we have python, but we might not have pygobject
--	if ! "$PYTHON" -c 'from gi.repository import GObject' >& /dev/null; then
--		AC_MSG_ERROR(["--enable-introspection aims to build the settings documentation. This requires GObject introspection for python (pygobject)])
--	fi
--
- 	AC_PATH_PROG(PERL, perl)
- 	if test -z "$PERL"; then
- 		AC_MSG_ERROR([--enable-introspection requires perl])
--- 
-2.20.1
-
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/fix-meson.build-pkgconfig-sysroot-locations.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/fix-meson.build-pkgconfig-sysroot-locations.patch
new file mode 100644
index 000000000..fccdbc3d8
--- /dev/null
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/fix-meson.build-pkgconfig-sysroot-locations.patch
@@ -0,0 +1,23 @@
+It uses pkg-config to get location of libjansson.so. But for cross compile it
+needs to prepend prefix $PKG_CONFIG_SYSROOT_DIR.
+
+Upstream-Status: Inappropriate [cross-compile specific]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+diff --git a/meson.build b/meson.build
+index efad842..820fa8e 100644
+--- a/meson.build
++++ b/meson.build
+@@ -190,8 +190,10 @@ jansson_dep = dependency('jansson', version: '>= 2.5', required: false)
+ config_h.set10('WITH_JANSSON', jansson_dep.found())
+ 
+ if jansson_dep.found()
++  cmd = run_command('sh', '-c', 'echo $PKG_CONFIG_SYSROOT_DIR')
++  pkg_config_sysroot_dir = cmd.stdout().strip()
+   jansson_libdir = jansson_dep.get_pkgconfig_variable('libdir')
+-  res = run_command(find_program('eu-readelf', 'readelf'), '-d', join_paths(jansson_libdir, 'libjansson.so'))
++  res = run_command(find_program('eu-readelf', 'readelf'), '-d', pkg_config_sysroot_dir + jansson_libdir + '/libjansson.so')
+   jansson_soname = ''
+   foreach line: res.stdout().split('\n')
+     if line.strip().contains('SONAME')
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/meson-do-not-create-settings-property-documentation.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/meson-do-not-create-settings-property-documentation.patch
new file mode 100644
index 000000000..113e7eac9
--- /dev/null
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/meson-do-not-create-settings-property-documentation.patch
@@ -0,0 +1,146 @@
+Refer to previous patch for autotools:
+```
+  It was tried to get this work but gi / GirRepository could not be found by
+  python. Anyway it is not necessary for us to have the settings/property docs.
+
+  Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+```
+do the same thing for meson.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+diff --git a/clients/common/meson.build b/clients/common/meson.build
+index fed0f3bf8..ce5710dbc 100644
+--- a/clients/common/meson.build
++++ b/clients/common/meson.build
+@@ -30,18 +30,18 @@ libnmc_base_dep = declare_dependency(
+ settings_docs = 'settings-docs.h'
+ 
+ if enable_introspection
+-  settings_docs_source = custom_target(
+-    settings_docs,
+-    input: nm_property_docs,
+-    output: settings_docs,
+-    command: [xsltproc, '--output', '@OUTPUT@', join_paths(meson.current_source_dir(), 'settings-docs.xsl'), '@INPUT@'],
+-  )
+-
+-  test(
+-    'check-settings-docs',
+-    find_program(join_paths(meson.source_root(), 'tools', 'check-settings-docs.sh')),
+-    args: [meson.source_root(), meson.build_root(), 'clients/common/' + settings_docs]
+-  )
++#  settings_docs_source = custom_target(
++#    settings_docs,
++#    input: nm_property_docs,
++#    output: settings_docs,
++#    command: [xsltproc, '--output', '@OUTPUT@', join_paths(meson.current_source_dir(), 'settings-docs.xsl'), '@INPUT@'],
++#  )
++#
++#  test(
++#    'check-settings-docs',
++#    find_program(join_paths(meson.source_root(), 'tools', 'check-settings-docs.sh')),
++#    args: [meson.source_root(), meson.build_root(), 'clients/common/' + settings_docs]
++#  )
+ else
+   settings_docs_source = configure_file(
+     input: settings_docs + '.in',
+@@ -55,11 +55,10 @@ libnmc = static_library(
+   sources: files(
+     'nm-meta-setting-access.c',
+     'nm-meta-setting-desc.c',
+-  ) + shared_nm_meta_setting_c + [settings_docs_source],
++  ) + shared_nm_meta_setting_c,
+   dependencies: deps,
+   c_args: cflags,
+   link_with: libnmc_base,
+-  link_depends: settings_docs_source,
+ )
+ 
+ libnmc_dep = declare_dependency(
+diff --git a/libnm/meson.build b/libnm/meson.build
+index 2e65d3beb..3abcededf 100644
+--- a/libnm/meson.build
++++ b/libnm/meson.build
+@@ -255,43 +255,43 @@ if enable_introspection
+     )
+   endif
+ 
+-  generate_setting_docs = join_paths(meson.current_source_dir(), 'generate-setting-docs.py')
+-
+-  gi_typelib_path = run_command('printenv', 'GI_TYPELIB_PATH').stdout()
+-  if gi_typelib_path != ''
+-    gi_typelib_path = ':' + gi_typelib_path
+-  endif
+-  gi_typelib_path = meson.current_build_dir() + gi_typelib_path
+-
+-  ld_library_path = run_command('printenv', 'LD_LIBRARY_PATH').stdout()
+-  if ld_library_path != ''
+-    ld_library_path = ':' + ld_library_path
+-  endif
+-  ld_library_path = meson.current_build_dir() + ld_library_path
+-
+-  generate_setting_docs_env = [
+-    'env', '-i',
+-    'GI_TYPELIB_PATH=' + gi_typelib_path,
+-    'LD_LIBRARY_PATH=' + ld_library_path,
+-  ]
+-
+-  name = 'nm-property-docs.xml'
+-  nm_property_docs = custom_target(
+-    name,
+-    input: libnm_gir[0],
+-    output: name,
+-    command: [generate_setting_docs_env, generate_setting_docs, '--lib-path', meson.current_build_dir(), '--gir', '@INPUT@', '--output', '@OUTPUT@'],
+-    depends: libnm_gir,
+-  )
+-
+-  name = 'nm-settings-docs.xml'
+-  nm_settings_docs = custom_target(
+-    name,
+-    input: libnm_gir[0],
+-    output: name,
+-    command: [generate_setting_docs_env, generate_setting_docs, '--lib-path', meson.current_build_dir(), '--gir', '@INPUT@', '--overrides', nm_settings_docs_overrides, '--output', '@OUTPUT@'],
+-    depends: libnm_gir,
+-  )
++#  generate_setting_docs = join_paths(meson.current_source_dir(), 'generate-setting-docs.py')
++#
++#  gi_typelib_path = run_command('printenv', 'GI_TYPELIB_PATH').stdout()
++#  if gi_typelib_path != ''
++#    gi_typelib_path = ':' + gi_typelib_path
++#  endif
++#  gi_typelib_path = meson.current_build_dir() + gi_typelib_path
++#
++#  ld_library_path = run_command('printenv', 'LD_LIBRARY_PATH').stdout()
++#  if ld_library_path != ''
++#    ld_library_path = ':' + ld_library_path
++#  endif
++#  ld_library_path = meson.current_build_dir() + ld_library_path
++#
++#  generate_setting_docs_env = [
++#    'env', '-i',
++#    'GI_TYPELIB_PATH=' + gi_typelib_path,
++#    'LD_LIBRARY_PATH=' + ld_library_path,
++#  ]
++#
++#  name = 'nm-property-docs.xml'
++#  nm_property_docs = custom_target(
++#    name,
++#    input: libnm_gir[0],
++#    output: name,
++#    command: [generate_setting_docs_env, generate_setting_docs, '--lib-path', meson.current_build_dir(), '--gir', '@INPUT@', '--output', '@OUTPUT@'],
++#    depends: libnm_gir,
++#  )
++#
++#  name = 'nm-settings-docs.xml'
++#  nm_settings_docs = custom_target(
++#    name,
++#    input: libnm_gir[0],
++#    output: name,
++#    command: [generate_setting_docs_env, generate_setting_docs, '--lib-path', meson.current_build_dir(), '--gir', '@INPUT@', '--overrides', nm_settings_docs_overrides, '--output', '@OUTPUT@'],
++#    depends: libnm_gir,
++#  )
+ endif
+ 
+ if enable_tests
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-Fix-build-with-musl-systemd-specific.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-Fix-build-with-musl-systemd-specific.patch
index af6f938ce..3a885064c 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-Fix-build-with-musl-systemd-specific.patch
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-Fix-build-with-musl-systemd-specific.patch
@@ -25,7 +25,7 @@ diff --git a/shared/systemd/src/basic/in-addr-util.c b/shared/systemd/src/basic/
 index 5899f62..0adb248 100644
 --- a/shared/systemd/src/basic/in-addr-util.c
 +++ b/shared/systemd/src/basic/in-addr-util.c
-@@ -14,6 +14,7 @@
+@@ -15,6 +15,7 @@
  #include "in-addr-util.h"
  #include "macro.h"
  #include "parse-util.h"
@@ -37,7 +37,7 @@ diff --git a/shared/systemd/src/basic/process-util.c b/shared/systemd/src/basic/
 index 7431be3..189060a 100644
 --- a/shared/systemd/src/basic/process-util.c
 +++ b/shared/systemd/src/basic/process-util.c
-@@ -21,6 +21,9 @@
+@@ -19,6 +19,9 @@
  #include <sys/wait.h>
  #include <syslog.h>
  #include <unistd.h>
@@ -47,7 +47,7 @@ index 7431be3..189060a 100644
  #if 0 /* NM_IGNORED */
  #if HAVE_VALGRIND_VALGRIND_H
  #include <valgrind/valgrind.h>
-@@ -1183,11 +1186,13 @@ void reset_cached_pid(void) {
+@@ -1105,11 +1108,13 @@ void reset_cached_pid(void) {
          cached_pid = CACHED_PID_UNSET;
  }
  
@@ -61,7 +61,7 @@ index 7431be3..189060a 100644
  
  pid_t getpid_cached(void) {
          static bool installed = false;
-@@ -1216,7 +1221,11 @@ pid_t getpid_cached(void) {
+@@ -1138,7 +1143,11 @@ pid_t getpid_cached(void) {
                           * only half-documented (glibc doesn't document it but LSB does — though only superficially)
                           * we'll check for errors only in the most generic fashion possible. */
  
@@ -77,7 +77,7 @@ diff --git a/shared/systemd/src/basic/socket-util.h b/shared/systemd/src/basic/s
 index 15443f1..4807198 100644
 --- a/shared/systemd/src/basic/socket-util.h
 +++ b/shared/systemd/src/basic/socket-util.h
-@@ -13,6 +13,12 @@
+@@ -14,6 +14,12 @@
  #include <sys/types.h>
  #include <sys/un.h>
  
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-Fix-build-with-musl.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-Fix-build-with-musl.patch
index e0973af1e..867f7aefb 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-Fix-build-with-musl.patch
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-Fix-build-with-musl.patch
@@ -44,7 +44,7 @@ diff --git a/clients/tui/nmt-device-entry.c b/clients/tui/nmt-device-entry.c
 index 43fbbc1..3eae286 100644
 --- a/clients/tui/nmt-device-entry.c
 +++ b/clients/tui/nmt-device-entry.c
-@@ -39,7 +39,6 @@
+@@ -38,7 +38,6 @@
  #include "nmt-device-entry.h"
  
  #include <sys/socket.h>
@@ -56,7 +56,7 @@ diff --git a/libnm-core/nm-utils.h b/libnm-core/nm-utils.h
 index 2b5baba..f7abab6 100644
 --- a/libnm-core/nm-utils.h
 +++ b/libnm-core/nm-utils.h
-@@ -25,6 +25,10 @@
+@@ -24,6 +24,10 @@
  #error "Only <NetworkManager.h> can be included directly."
  #endif
  
@@ -71,7 +71,7 @@ diff --git a/shared/nm-default.h b/shared/nm-default.h
 index 54e9916..26e9f4e 100644
 --- a/shared/nm-default.h
 +++ b/shared/nm-default.h
-@@ -211,6 +211,9 @@
+@@ -197,6 +197,9 @@
  #endif
  
  #include <stdlib.h>
@@ -85,7 +85,7 @@ diff --git a/src/devices/nm-device.c b/src/devices/nm-device.c
 index bd4fbcc..f70b309 100644
 --- a/src/devices/nm-device.c
 +++ b/src/devices/nm-device.c
-@@ -24,6 +24,7 @@
+@@ -23,6 +23,7 @@
  #include "nm-device.h"
  
  #include <netinet/in.h>
@@ -93,7 +93,7 @@ index bd4fbcc..f70b309 100644
  #include <unistd.h>
  #include <sys/ioctl.h>
  #include <signal.h>
-@@ -32,7 +33,6 @@
+@@ -31,7 +32,6 @@
  #include <arpa/inet.h>
  #include <fcntl.h>
  #include <linux/if_addr.h>
@@ -105,7 +105,7 @@ diff --git a/src/platform/nm-linux-platform.c b/src/platform/nm-linux-platform.c
 index d4b0115..22a3a90 100644
 --- a/src/platform/nm-linux-platform.c
 +++ b/src/platform/nm-linux-platform.c
-@@ -28,7 +28,6 @@
+@@ -27,7 +27,6 @@
  #include <libudev.h>
  #include <linux/fib_rules.h>
  #include <linux/ip.h>
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0003-Fix-mrand48_r-with-musl.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0003-Fix-mrand48_r-with-musl.patch
new file mode 100644
index 000000000..25f7b9367
--- /dev/null
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0003-Fix-mrand48_r-with-musl.patch
@@ -0,0 +1,47 @@
+seed48_r, mrand48_r and drand48_data are GNU extensions and are not portable. Replace them with POSIX jrand48 function for musl.
+
+Upstream-Status: Pending
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+diff --git a/shared/n-dhcp4/src/n-dhcp4-c-probe.c b/shared/n-dhcp4/src/n-dhcp4-c-probe.c
+index 308cff8..6522dda 100644
+--- a/shared/n-dhcp4/src/n-dhcp4-c-probe.c
++++ b/shared/n-dhcp4/src/n-dhcp4-c-probe.c
+@@ -362,8 +362,9 @@ static void n_dhcp4_client_probe_config_initialize_random_seed(NDhcp4ClientProbe
+         seed16v[1] = (u64 >> 16) ^ (u64 >>  0);
+         seed16v[2] = (u64 >> 32) ^ (u64 >> 16);
+ 
+-        r = seed48_r(seed16v, &config->entropy);
+-        c_assert(!r);
++        config->entropy[0] = seed16v[0];
++        config->entropy[1] = seed16v[1];
++        config->entropy[2] = seed16v[2];
+ }
+ 
+ /**
+@@ -377,10 +378,8 @@ static void n_dhcp4_client_probe_config_initialize_random_seed(NDhcp4ClientProbe
+  */
+ uint32_t n_dhcp4_client_probe_config_get_random(NDhcp4ClientProbeConfig *config) {
+         long int result;
+-        int r;
+ 
+-        r = mrand48_r(&config->entropy, &result);
+-        c_assert(!r);
++        result = jrand48(config->entropy);
+ 
+         return result;
+ };
+diff --git a/shared/n-dhcp4/src/n-dhcp4-private.h b/shared/n-dhcp4/src/n-dhcp4-private.h
+index c38ddbf..a12af7a 100644
+--- a/shared/n-dhcp4/src/n-dhcp4-private.h
++++ b/shared/n-dhcp4/src/n-dhcp4-private.h
+@@ -259,7 +259,7 @@ struct NDhcp4ClientProbeConfig {
+         bool inform_only;
+         bool init_reboot;
+         struct in_addr requested_ip;
+-        struct drand48_data entropy;    /* entropy pool */
++        unsigned short entropy[3];    /* entropy pool */
+         uint64_t ms_start_delay;        /* max ms to wait before starting probe */
+         NDhcp4ClientProbeOption *options[UINT8_MAX + 1];
+         int8_t request_parameters[UINT8_MAX + 1];
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.2.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.20.0.bb
similarity index 62%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.2.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.20.0.bb
index b760a40c3..60395a292 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.2.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.20.0.bb
@@ -3,9 +3,7 @@ HOMEPAGE = "https://wiki.gnome.org/Projects/NetworkManager"
 SECTION = "net/misc"
 
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b \
-                    file://libnm-util/COPYING;md5=1c4fa765d6eb3cd2fbd84344a1b816cd \
-"
+LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b"
 
 DEPENDS = " \
     intltool-native \
@@ -19,32 +17,32 @@ DEPENDS = " \
     curl \
 "
 
+GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gettext systemd bash-completion vala gobject-introspection gtk-doc update-alternatives
 
 SRC_URI = " \
     ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.xz \
-    file://0001-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch \
-    file://0002-Do-not-create-settings-settings-property-documentati.patch \
+    file://fix-meson.build-pkgconfig-sysroot-locations.patch \
+    file://meson-do-not-create-settings-property-documentation.patch \
 "
 SRC_URI_append_libc-musl = " \
     file://musl/0001-Fix-build-with-musl-systemd-specific.patch \
     file://musl/0002-Fix-build-with-musl.patch \
+    file://musl/0003-Fix-mrand48_r-with-musl.patch \
 "
-SRC_URI[md5sum] = "ca1e6175c6ba97ca1adf65a67861ccd9"
-SRC_URI[sha256sum] = "4dd97ca974cd1f97990746527258f551f4257cbf011fecd01d10b7d74a6fa5c3"
+SRC_URI[md5sum] = "109df9b0813755a98735206f5b2d68da"
+SRC_URI[sha256sum] = "b7e605055491ea8ef433bc149d55349111b9c789ad1cd0578f19ece39b1ac7c4"
 
 UPSTREAM_CHECK_URI = "${GNOME_MIRROR}/NetworkManager/1.16/"
 UPSTREAM_CHECK_REGEX = "NetworkManager\-(?P<pver>1\.10(\.\d+)+).tar.xz"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
-EXTRA_OECONF = " \
-    --disable-ifcfg-rh \
-    --disable-more-warnings \
-    --with-iptables=${sbindir}/iptables \
-    --with-tests \
-    --with-nmtui=yes \
-    --with-udev-dir=${nonarch_base_libdir}/udev \
+EXTRA_OEMESON = " \
+    -Difcfg_rh=false \
+    -Diptables=${sbindir}/iptables \
+    -Dtests=yes \
+    -Dnmtui=true -Dudev_dir=${nonarch_base_libdir}/udev \
 "
 
 # stolen from https://github.com/void-linux/void-packages/blob/master/srcpkgs/NetworkManager/template
@@ -55,43 +53,41 @@ CFLAGS_append_libc-musl = " \
 "
 
 do_compile_prepend() {
-    export GIR_EXTRA_LIBS_PATH="${B}/libnm/.libs:${B}/libnm-glib/.libs:${B}/libnm-util/.libs"
+    export GIR_EXTRA_LIBS_PATH="${B}/libnm/.libs"
 }
 
 PACKAGECONFIG ??= "nss ifupdown dhclient dnsmasq \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', bb.utils.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d), d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez5', '', d)} \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'wifi polkit', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'wifi polkit selinux', d)} \
 "
 PACKAGECONFIG[systemd] = " \
-    --with-systemdsystemunitdir=${systemd_unitdir}/system --with-session-tracking=systemd, \
-    --without-systemdsystemunitdir, \
+    -Dsystemdsystemunitdir=${systemd_unitdir}/system -Dsystemd_journal=true -Dsession_tracking=systemd, \
+    -Dsystemdsystemunitdir=no -Dsystemd_journal=false -Dsession_tracking=no, \
 "
-PACKAGECONFIG[polkit] = "--enable-polkit --enable-polkit-agent,--disable-polkit --disable-polkit-agent,polkit"
-PACKAGECONFIG[bluez5] = "--enable-bluez5-dun,--disable-bluez5-dun,bluez5"
+PACKAGECONFIG[audit] = "-Dlibaudit=yes,-Dlibaudit=no,audit"
+PACKAGECONFIG[bluez5] = "-Dbluez5_dun=true,-Dbluez5_dun=false,bluez5"
 # consolekit is not picked by shlibs, so add it to RDEPENDS too
-PACKAGECONFIG[consolekit] = "--with-session-tracking=consolekit,,consolekit,consolekit"
-PACKAGECONFIG[modemmanager] = "--with-modem-manager-1=yes,--with-modem-manager-1=no,modemmanager"
-PACKAGECONFIG[ppp] = "--enable-ppp,--disable-ppp,ppp,ppp"
+PACKAGECONFIG[consolekit] = "-Dsession_tracking_consolekit=true,-Dsession_tracking_consolekit=false,consolekit,consolekit"
 # Use full featured dhcp client instead of internal one
-PACKAGECONFIG[dhclient] = "--with-dhclient=${base_sbindir}/dhclient,,,dhcp-client"
-PACKAGECONFIG[dnsmasq] = "--with-dnsmasq=${bindir}/dnsmasq"
-PACKAGECONFIG[nss] = "--with-crypto=nss,,nss"
-PACKAGECONFIG[glib] = "--with-libnm-glib,,dbus-glib-native dbus-glib"
-PACKAGECONFIG[gnutls] = "--with-crypto=gnutls,,gnutls"
-PACKAGECONFIG[wifi] = "--enable-wifi=yes,--enable-wifi=no,,wpa-supplicant"
-PACKAGECONFIG[ifupdown] = "--enable-ifupdown,--disable-ifupdown"
-PACKAGECONFIG[qt4-x11-free] = "--enable-qt,--disable-qt,qt4-x11-free"
-
-PACKAGES =+ "libnmutil libnmglib libnmglib-vpn \
+PACKAGECONFIG[dhclient] = "-Ddhclient=${base_sbindir}/dhclient,,,dhcp-client"
+PACKAGECONFIG[dnsmasq] = "-Ddnsmasq=${bindir}/dnsmasq"
+PACKAGECONFIG[gnutls] = "-Dcrypto=gnutls,,gnutls"
+PACKAGECONFIG[ifupdown] = "-Difupdown=true,-Difupdown=false,ifupdown"
+PACKAGECONFIG[libpsl] = "-Dlibpsl=true,-Dlibpsl=false,libpsl"
+PACKAGECONFIG[modemmanager] = "-Dmodem_manager=true,-Dmodem_manager=false,modemmanager"
+PACKAGECONFIG[nss] = "-Dcrypto=nss,,nss"
+PACKAGECONFIG[polkit] = "-Dpolkit=true -Dpolkit_agent=true,-Dpolkit=false -Dpolkit_agent=false,polkit"
+PACKAGECONFIG[ppp] = "-Dppp=true,-Dppp=false,ppp,ppp"
+PACKAGECONFIG[qt4-x11-free] = "-Dqt=true,-Dqt=false,qt4-x11-free"
+PACKAGECONFIG[selinux] = "-Dselinux=true,-Dselinux=false,libselinux"
+PACKAGECONFIG[wifi] = "-Dwifi=true,-Dwifi=false,,wpa-supplicant"
+
+PACKAGES =+ " \
   ${PN}-nmtui ${PN}-nmtui-doc \
   ${PN}-adsl \
 "
 
-FILES_libnmutil += "${libdir}/libnm-util.so.*"
-FILES_libnmglib += "${libdir}/libnm-glib.so.*"
-FILES_libnmglib-vpn += "${libdir}/libnm-glib-vpn.so.*"
-
 FILES_${PN}-adsl = "${libdir}/NetworkManager/libnm-device-plugin-adsl.so"
 
 FILES_${PN} += " \
@@ -99,6 +95,8 @@ FILES_${PN} += " \
     ${libdir}/NetworkManager/${PV}/*.so \
     ${nonarch_libdir}/NetworkManager/VPN \
     ${nonarch_libdir}/NetworkManager/conf.d \
+    ${nonarch_libdir}/NetworkManager/dispatcher.d \
+    ${nonarch_libdir}/NetworkManager/system-connections \
     ${datadir}/polkit-1 \
     ${datadir}/dbus-1 \
     ${nonarch_base_libdir}/udev/* \
-- 
2.20.0


