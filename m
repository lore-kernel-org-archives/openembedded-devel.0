Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 956A4E77180
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 12:34:49 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.55577.1734352484565359034
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Dec 2024 04:34:45 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout04.t-online.de (Postfix) with SMTP id A4831A0A
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Dec 2024 13:34:42 +0100 (CET)
Received: from [192.168.178.67] ([84.154.162.147]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tNAJ6-3OSjnk0; Mon, 16 Dec 2024 13:34:40 +0100
Date: Mon, 16 Dec 2024 13:34:43 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCHv2] libpeas: update 1.36.0 -> 2.0.5
To: openembedded-devel@lists.openembedded.org
Message-Id: <VX6LOS.3HWFQSO1SJD41@t-online.de>
In-Reply-To: <1811A85A00D6A22F.23577@lists.openembedded.org>
References: <1811A85A00D6A22F.23577@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-njdJu5JHB+RSYVzpR3Cs"
X-TOI-EXPURGATEID: 150726::1734352480-E17F9A80-1A8981CC/0/0 CLEAN NORMAL
X-TOI-MSGID: ee866e8c-75cf-492d-82d1-5e6605b0a148
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Dec 2024 12:34:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114336

--=-njdJu5JHB+RSYVzpR3Cs
Content-Type: text/plain; charset=us-ascii; format=flowed

v2: simplify disable-lgi-check.patch

On Mon, Dec 16 2024 at 01:33:49 PM +01:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> - Drop 0001-Remove-builddir-and-srcdir-paths-from-test-binaries.patch
>   peas-demo is not built anymore
> - Add patch to disable the broken check for lgi
>   lgi does not support pkgconfig but it hasn't changed version since 
> 2017
> - Remove gtk+3 from depends and dont inherit gtk-icon-cache to not 
> pull it
>   in again indirectly
> - g-i is not required anymore and will be built depending on 
> DISTRO_FEATURES
> - Dont package the loaders into separate packages to reduce required 
> RDEPENDS.
>   If a loader is not wanted on target it will be better to remove the 
> according
>   PACKAGECONFIG option to also remove the dependencies?
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  ...-and-srcdir-paths-from-test-binaries.patch | 82 
> -------------------
>  .../libpeas/libpeas/disable-lgi-check.patch   | 37 +++++++++
>  .../recipes-gnome/libpeas/libpeas_1.36.0.bb   | 28 -------
>  .../recipes-gnome/libpeas/libpeas_2.0.5.bb    | 20 +++++
>  4 files changed, 57 insertions(+), 110 deletions(-)
>  delete mode 100644 
> meta-oe/recipes-gnome/libpeas/libpeas/0001-Remove-builddir-and-srcdir-paths-from-test-binaries.patch
>  create mode 100644 
> meta-oe/recipes-gnome/libpeas/libpeas/disable-lgi-check.patch
>  delete mode 100644 meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb
>  create mode 100644 meta-oe/recipes-gnome/libpeas/libpeas_2.0.5.bb
> 
> diff --git 
> a/meta-oe/recipes-gnome/libpeas/libpeas/0001-Remove-builddir-and-srcdir-paths-from-test-binaries.patch 
> b/meta-oe/recipes-gnome/libpeas/libpeas/0001-Remove-builddir-and-srcdir-paths-from-test-binaries.patch
> deleted file mode 100644
> index 6bb48777ec..0000000000
> --- 
> a/meta-oe/recipes-gnome/libpeas/libpeas/0001-Remove-builddir-and-srcdir-paths-from-test-binaries.patch
> +++ /dev/null
> @@ -1,82 +0,0 @@
> -From d798af685e9e1166400acbdab082c17b02dad85b Mon Sep 17 00:00:00 
> 2001
> -From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
> -Date: Thu, 18 May 2023 23:28:10 -0700
> -Subject: [PATCH] Remove builddir and srcdir paths from test binaries
> -
> -Encoding buildtime paths is not needed since if these tests are to be
> -run they will be run on target where builddir structure most 
> certainly
> -wont be available.
> -
> -Fixes
> -WARNING: libpeas-1.36.0-r0 do_package_qa: QA Issue: File 
> /usr/bin/peas-demo in package libpeas-demo contains reference to 
> TMPDIR [buildpaths]
> -
> -Upstream-Status: Inappropriate [Cross-compile specific]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>>
> ----
> - peas-demo/meson.build                 | 2 +-
> - tests/libpeas-gtk/testing/meson.build | 4 ++--
> - tests/libpeas/testing/meson.build     | 4 ++--
> - tests/testing-util/meson.build        | 4 ++--
> - 4 files changed, 7 insertions(+), 7 deletions(-)
> -
> -diff --git a/peas-demo/meson.build b/peas-demo/meson.build
> -index a3ec53b..855ebf2 100644
> ---- a/peas-demo/meson.build
> -+++ b/peas-demo/meson.build
> -@@ -9,7 +9,7 @@ peas_demo_c = [
> -
> - peas_demo_c_args = [
> -   '-DHAVE_CONFIG_H',
> --  '-DPEAS_BUILDDIR="@0@"'.format(builddir),
> -+  '-DPEAS_BUILDDIR="/usr/src/debug/libpeas"',
> -   '-DPEAS_PREFIX="@0@"'.format(prefix),
> -   '-DPEAS_LIBDIR="@0@"'.format(libdir),
> - ]
> -diff --git a/tests/libpeas-gtk/testing/meson.build 
> b/tests/libpeas-gtk/testing/meson.build
> -index 646f42d..fd9a692 100644
> ---- a/tests/libpeas-gtk/testing/meson.build
> -+++ b/tests/libpeas-gtk/testing/meson.build
> -@@ -19,8 +19,8 @@ libpeas_gtk_testing_deps = [
> -
> - libpeas_gtk_testing_c_args = [
> -   '-DHAVE_CONFIG_H',
> --  '-DBUILDDIR="@0@"'.format(builddir),
> --  '-DSRCDIR="@0@"'.format(srcdir),
> -+  '-DBUILDDIR="/usr/src/debug/libpeas"',
> -+  '-DSRCDIR="/usr/src/debug/libpeas"',
> - ]
> -
> - libpeas_gtk_testing_lib = library(
> -diff --git a/tests/libpeas/testing/meson.build 
> b/tests/libpeas/testing/meson.build
> -index 74ba7b1..084daa9 100644
> ---- a/tests/libpeas/testing/meson.build
> -+++ b/tests/libpeas/testing/meson.build
> -@@ -21,8 +21,8 @@ libpeas_testing_deps = [
> -
> - libpeas_testing_c_args = [
> -   '-DHAVE_CONFIG_H',
> --  '-DBUILDDIR="@0@"'.format(builddir),
> --  '-DSRCDIR="@0@"'.format(srcdir),
> -+  '-DBUILDDIR="/usr/src/debug/libpeas"',
> -+  '-DSRCDIR="/usr/src/debug/libpeas"',
> - ]
> -
> - libpeas_testing_lib = library(
> -diff --git a/tests/testing-util/meson.build 
> b/tests/testing-util/meson.build
> -index 1c40740..83ad059 100644
> ---- a/tests/testing-util/meson.build
> -+++ b/tests/testing-util/meson.build
> -@@ -17,8 +17,8 @@ libtesting_util_deps = [
> -
> - libtesting_util_c_args = [
> -   '-DHAVE_CONFIG_H',
> --  '-DBUILDDIR="@0@"'.format(builddir),
> --  '-DSRCDIR="@0@"'.format(srcdir),
> -+  '-DBUILDDIR="/usr/src/debug/libpeas"',
> -+  '-DSRCDIR="/usr/src/debug/libpeas"',
> -   '-UG_DISABLE_ASSERT',
> -   '-UG_DISABLE_CAST_CHECKS',
> - ]
> ---
> -2.40.1
> -
> diff --git 
> a/meta-oe/recipes-gnome/libpeas/libpeas/disable-lgi-check.patch 
> b/meta-oe/recipes-gnome/libpeas/libpeas/disable-lgi-check.patch
> new file mode 100644
> index 0000000000..9ed7adb8ce
> --- /dev/null
> +++ b/meta-oe/recipes-gnome/libpeas/libpeas/disable-lgi-check.patch
> @@ -0,0 +1,37 @@
> +From c9bb8f5c730745b48eb86404d0297ebc15bf9fa7 Mon Sep 17 00:00:00 
> 2001
> +From: Markus Volk <f_l_k@t-online.de <mailto:f_l_k@t-online.de>>
> +Date: Mon, 16 Dec 2024 12:22:49 +0100
> +Subject: [PATCH] meson
> +
> +Upstream-Status: Inappropriate [oe-specific]
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> +---
> + meson.build | 11 +++++----------
> + 1 file changed, 3 insertions(+), 8 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index a8100af..0fb15d2 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -209,14 +209,9 @@ if lua_found
> +     else
> +         lua_prg = lua51_prg
> +     endif
> +-    lua_lgi_check = run_command(lua_prg, ['-e', 
> 'print(require("lgi")._VERSION)'])
> +-    if lua_lgi_check.returncode() == 0
> +-        lua_lgi_ver = lua_lgi_check.stdout().strip()
> +-        if lua_lgi_ver.version_compare(lua_lgi_req)
> +-            lua51_lgi_dep = declare_dependency(version: lua_lgi_ver)
> +-            lua_lgi_found = true
> +-        endif
> +-    endif
> ++    lua_lgi_ver = '0.9.0'
> ++    lua_lgi_found = true
> ++    lua51_lgi_dep = declare_dependency(version: lua_lgi_ver)
> +     message('lua-lgi version: ' + lua_lgi_ver)
> + endif
> +
> +--
> +2.47.0
> +
> diff --git a/meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb 
> b/meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb
> deleted file mode 100644
> index 016981f04d..0000000000
> --- a/meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -SUMMARY = "libpeas is a gobject-based plugins engine"
> -HOMEPAGE = "<https://wiki.gnome.org/Projects/Libpeas>"
> -LICENSE = "LGPL-2.1-or-later"
> -LIC_FILES_CHKSUM = 
> "file://COPYING;md5=4b54a1fd55a448865a0b32d41598759d" 
> <file://copying;md5=4b54a1fd55a448865a0b32d41598759d/>
> -
> -DEPENDS = "gtk+3"
> -
> -GTKDOC_MESON_OPTION = "gtk_doc"
> -
> -inherit gnomebase gobject-introspection gi-docgen gtk-icon-cache 
> features_check
> -
> -ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
> -# FIXME: When upgrading to libpeas 2, g-i is no longer needed.
> -REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
> -
> -SRC_URI += 
> "file://0001-Remove-builddir-and-srcdir-paths-from-test-binaries.patch" 
> <file://0001-remove-builddir-and-srcdir-paths-from-test-binaries.patch/>
> -SRC_URI[archive.sha256sum] = 
> "297cb9c2cccd8e8617623d1a3e8415b4530b8e5a893e3527bbfd1edd13237b4c"
> -
> -PACKAGECONFIG[python3] = 
> "-Dpython3=true,-Dpython3=false,python3-pygobject"
> -
> -PACKAGES =+ "${PN}-demo ${PN}-python3"
> -FILES:${PN}-demo = " \
> -    ${bindir}/peas-demo \
> -    ${libdir}/peas-demo \
> -"
> -
> -RDEPENDS:${PN}-python3 = "python3-pygobject"
> -FILES:${PN}-python3 = 
> "${libdir}/libpeas-1.0/loaders/libpython3loader.so"
> diff --git a/meta-oe/recipes-gnome/libpeas/libpeas_2.0.5.bb 
> b/meta-oe/recipes-gnome/libpeas/libpeas_2.0.5.bb
> new file mode 100644
> index 0000000000..8c7d364765
> --- /dev/null
> +++ b/meta-oe/recipes-gnome/libpeas/libpeas_2.0.5.bb
> @@ -0,0 +1,20 @@
> +SUMMARY = "libpeas is a gobject-based plugins engine"
> +HOMEPAGE = "<https://wiki.gnome.org/Projects/Libpeas>"
> +LICENSE = "LGPL-2.1-or-later"
> +LIC_FILES_CHKSUM = 
> "file://COPYING;md5=4b54a1fd55a448865a0b32d41598759d" 
> <file://copying;md5=4b54a1fd55a448865a0b32d41598759d/>
> +
> +DEPENDS = "glib-2.0"
> +
> +inherit gnomebase gobject-introspection vala gi-docgen
> +
> +SRC_URI += "file://disable-lgi-check.patch" 
> <file://disable-lgi-check.patch/>
> +SRC_URI[archive.sha256sum] = 
> "376f2f73d731b54e13ddbab1d91b6382cf6a980524def44df62add15489de6dd"
> +
> +PACKAGECONFIG ?= "python3 gjs lua51 ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 
> 'gobject-introspection', 'vala', '', d)}"
> +PACKAGECONFIG[python3] = 
> "-Dpython3=true,-Dpython3=false,python3-pygobject,python3-pygobject"
> +PACKAGECONFIG[gjs] = "-Dgjs=true,-Dgjs=false,gjs mozjs-128"
> +PACKAGECONFIG[lua51] = "-Dlua51=true,-Dlua51=false,luajit 
> luajit-native,lua-lgi"
> +PACKAGECONFIG[vala] = "-Dvapi=true,-Dvapi=false"
> +
> +FILES:${PN} += "${libdir}/libpeas-2"
> +
> --
> 2.47.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114335): 
> <https://lists.openembedded.org/g/openembedded-devel/message/114335>
> Mute This Topic: <https://lists.openembedded.org/mt/110143344/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-njdJu5JHB+RSYVzpR3Cs
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v2: simplify&nbsp;disable-lgi-check.patch</div></div><div id="geary-quote" dir="auto"><br>On Mon, Dec 16 2024 at 01:33:49 PM +01:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">- Drop 0001-Remove-builddir-and-srcdir-paths-from-test-binaries.patch
  peas-demo is not built anymore
- Add patch to disable the broken check for lgi
  lgi does not support pkgconfig but it hasn't changed version since 2017
- Remove gtk+3 from depends and dont inherit gtk-icon-cache to not pull it
  in again indirectly
- g-i is not required anymore and will be built depending on DISTRO_FEATURES
- Dont package the loaders into separate packages to reduce required RDEPENDS.
  If a loader is not wanted on target it will be better to remove the according
  PACKAGECONFIG option to also remove the dependencies?

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 ...-and-srcdir-paths-from-test-binaries.patch | 82 -------------------
 .../libpeas/libpeas/disable-lgi-check.patch   | 37 +++++++++
 .../recipes-gnome/libpeas/libpeas_1.36.0.bb   | 28 -------
 .../recipes-gnome/libpeas/libpeas_2.0.5.bb    | 20 +++++
 4 files changed, 57 insertions(+), 110 deletions(-)
 delete mode 100644 meta-oe/recipes-gnome/libpeas/libpeas/0001-Remove-builddir-and-srcdir-paths-from-test-binaries.patch
 create mode 100644 meta-oe/recipes-gnome/libpeas/libpeas/disable-lgi-check.patch
 delete mode 100644 meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb
 create mode 100644 meta-oe/recipes-gnome/libpeas/libpeas_2.0.5.bb

diff --git a/meta-oe/recipes-gnome/libpeas/libpeas/0001-Remove-builddir-and-srcdir-paths-from-test-binaries.patch b/meta-oe/recipes-gnome/libpeas/libpeas/0001-Remove-builddir-and-srcdir-paths-from-test-binaries.patch
deleted file mode 100644
index 6bb48777ec..0000000000
--- a/meta-oe/recipes-gnome/libpeas/libpeas/0001-Remove-builddir-and-srcdir-paths-from-test-binaries.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From d798af685e9e1166400acbdab082c17b02dad85b Mon Sep 17 00:00:00 2001
-From: Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;
-Date: Thu, 18 May 2023 23:28:10 -0700
-Subject: [PATCH] Remove builddir and srcdir paths from test binaries
-
-Encoding buildtime paths is not needed since if these tests are to be
-run they will be run on target where builddir structure most certainly
-wont be available.
-
-Fixes
-WARNING: libpeas-1.36.0-r0 do_package_qa: QA Issue: File /usr/bin/peas-demo in package libpeas-demo contains reference to TMPDIR [buildpaths]
-
-Upstream-Status: Inappropriate [Cross-compile specific]
-Signed-off-by: Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;
----
- peas-demo/meson.build                 | 2 +-
- tests/libpeas-gtk/testing/meson.build | 4 ++--
- tests/libpeas/testing/meson.build     | 4 ++--
- tests/testing-util/meson.build        | 4 ++--
- 4 files changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/peas-demo/meson.build b/peas-demo/meson.build
-index a3ec53b..855ebf2 100644
---- a/peas-demo/meson.build
-+++ b/peas-demo/meson.build
-@@ -9,7 +9,7 @@ peas_demo_c = [
- 
- peas_demo_c_args = [
-   '-DHAVE_CONFIG_H',
--  '-DPEAS_BUILDDIR="@0@"'.format(builddir),
-+  '-DPEAS_BUILDDIR="/usr/src/debug/libpeas"',
-   '-DPEAS_PREFIX="@0@"'.format(prefix),
-   '-DPEAS_LIBDIR="@0@"'.format(libdir),
- ]
-diff --git a/tests/libpeas-gtk/testing/meson.build b/tests/libpeas-gtk/testing/meson.build
-index 646f42d..fd9a692 100644
---- a/tests/libpeas-gtk/testing/meson.build
-+++ b/tests/libpeas-gtk/testing/meson.build
-@@ -19,8 +19,8 @@ libpeas_gtk_testing_deps = [
- 
- libpeas_gtk_testing_c_args = [
-   '-DHAVE_CONFIG_H',
--  '-DBUILDDIR="@0@"'.format(builddir),
--  '-DSRCDIR="@0@"'.format(srcdir),
-+  '-DBUILDDIR="/usr/src/debug/libpeas"',
-+  '-DSRCDIR="/usr/src/debug/libpeas"',
- ]
- 
- libpeas_gtk_testing_lib = library(
-diff --git a/tests/libpeas/testing/meson.build b/tests/libpeas/testing/meson.build
-index 74ba7b1..084daa9 100644
---- a/tests/libpeas/testing/meson.build
-+++ b/tests/libpeas/testing/meson.build
-@@ -21,8 +21,8 @@ libpeas_testing_deps = [
- 
- libpeas_testing_c_args = [
-   '-DHAVE_CONFIG_H',
--  '-DBUILDDIR="@0@"'.format(builddir),
--  '-DSRCDIR="@0@"'.format(srcdir),
-+  '-DBUILDDIR="/usr/src/debug/libpeas"',
-+  '-DSRCDIR="/usr/src/debug/libpeas"',
- ]
- 
- libpeas_testing_lib = library(
-diff --git a/tests/testing-util/meson.build b/tests/testing-util/meson.build
-index 1c40740..83ad059 100644
---- a/tests/testing-util/meson.build
-+++ b/tests/testing-util/meson.build
-@@ -17,8 +17,8 @@ libtesting_util_deps = [
- 
- libtesting_util_c_args = [
-   '-DHAVE_CONFIG_H',
--  '-DBUILDDIR="@0@"'.format(builddir),
--  '-DSRCDIR="@0@"'.format(srcdir),
-+  '-DBUILDDIR="/usr/src/debug/libpeas"',
-+  '-DSRCDIR="/usr/src/debug/libpeas"',
-   '-UG_DISABLE_ASSERT',
-   '-UG_DISABLE_CAST_CHECKS',
- ]
--- 
-2.40.1
-
diff --git a/meta-oe/recipes-gnome/libpeas/libpeas/disable-lgi-check.patch b/meta-oe/recipes-gnome/libpeas/libpeas/disable-lgi-check.patch
new file mode 100644
index 0000000000..9ed7adb8ce
--- /dev/null
+++ b/meta-oe/recipes-gnome/libpeas/libpeas/disable-lgi-check.patch
@@ -0,0 +1,37 @@
+From c9bb8f5c730745b48eb86404d0297ebc15bf9fa7 Mon Sep 17 00:00:00 2001
+From: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
+Date: Mon, 16 Dec 2024 12:22:49 +0100
+Subject: [PATCH] meson
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
+---
+ meson.build | 11 +++++----------
+ 1 file changed, 3 insertions(+), 8 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index a8100af..0fb15d2 100644
+--- a/meson.build
++++ b/meson.build
+@@ -209,14 +209,9 @@ if lua_found
+     else
+         lua_prg = lua51_prg
+     endif
+-    lua_lgi_check = run_command(lua_prg, ['-e', 'print(require("lgi")._VERSION)'])
+-    if lua_lgi_check.returncode() == 0
+-        lua_lgi_ver = lua_lgi_check.stdout().strip()
+-        if lua_lgi_ver.version_compare(lua_lgi_req)
+-            lua51_lgi_dep = declare_dependency(version: lua_lgi_ver)
+-            lua_lgi_found = true
+-        endif
+-    endif
++    lua_lgi_ver = '0.9.0'
++    lua_lgi_found = true
++    lua51_lgi_dep = declare_dependency(version: lua_lgi_ver)
+     message('lua-lgi version: ' + lua_lgi_ver)
+ endif
+ 
+-- 
+2.47.0
+
diff --git a/meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb b/meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb
deleted file mode 100644
index 016981f04d..0000000000
--- a/meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-SUMMARY = "libpeas is a gobject-based plugins engine"
-HOMEPAGE = "<a href="https://wiki.gnome.org/Projects/Libpeas">https://wiki.gnome.org/Projects/Libpeas</a>"
-LICENSE = "LGPL-2.1-or-later"
-LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=4b54a1fd55a448865a0b32d41598759d" "="">file://COPYING;md5=4b54a1fd55a448865a0b32d41598759d"</a>
-
-DEPENDS = "gtk+3"
-
-GTKDOC_MESON_OPTION = "gtk_doc"
-
-inherit gnomebase gobject-introspection gi-docgen gtk-icon-cache features_check
-
-ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
-# FIXME: When upgrading to libpeas 2, g-i is no longer needed.
-REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
-
-SRC_URI += "<a href="file://0001-Remove-builddir-and-srcdir-paths-from-test-binaries.patch" "="">file://0001-Remove-builddir-and-srcdir-paths-from-test-binaries.patch"</a>
-SRC_URI[archive.sha256sum] = "297cb9c2cccd8e8617623d1a3e8415b4530b8e5a893e3527bbfd1edd13237b4c"
-
-PACKAGECONFIG[python3] = "-Dpython3=true,-Dpython3=false,python3-pygobject"
-
-PACKAGES =+ "${PN}-demo ${PN}-python3"
-FILES:${PN}-demo = " \
-    ${bindir}/peas-demo \
-    ${libdir}/peas-demo \
-"
-
-RDEPENDS:${PN}-python3 = "python3-pygobject"
-FILES:${PN}-python3 = "${libdir}/libpeas-1.0/loaders/libpython3loader.so"
diff --git a/meta-oe/recipes-gnome/libpeas/libpeas_2.0.5.bb b/meta-oe/recipes-gnome/libpeas/libpeas_2.0.5.bb
new file mode 100644
index 0000000000..8c7d364765
--- /dev/null
+++ b/meta-oe/recipes-gnome/libpeas/libpeas_2.0.5.bb
@@ -0,0 +1,20 @@
+SUMMARY = "libpeas is a gobject-based plugins engine"
+HOMEPAGE = "<a href="https://wiki.gnome.org/Projects/Libpeas">https://wiki.gnome.org/Projects/Libpeas</a>"
+LICENSE = "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=4b54a1fd55a448865a0b32d41598759d" "="">file://COPYING;md5=4b54a1fd55a448865a0b32d41598759d"</a>
+
+DEPENDS = "glib-2.0"
+
+inherit gnomebase gobject-introspection vala gi-docgen
+
+SRC_URI += "<a href="file://disable-lgi-check.patch" "="">file://disable-lgi-check.patch"</a>
+SRC_URI[archive.sha256sum] = "376f2f73d731b54e13ddbab1d91b6382cf6a980524def44df62add15489de6dd"
+
+PACKAGECONFIG ?= "python3 gjs lua51 <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'gobject-introspection', 'vala', '', d)}"
+PACKAGECONFIG[python3] = "-Dpython3=true,-Dpython3=false,python3-pygobject,python3-pygobject"
+PACKAGECONFIG[gjs] = "-Dgjs=true,-Dgjs=false,gjs mozjs-128"
+PACKAGECONFIG[lua51] = "-Dlua51=true,-Dlua51=false,luajit luajit-native,lua-lgi"
+PACKAGECONFIG[vala] = "-Dvapi=true,-Dvapi=false"
+
+FILES:${PN} += "${libdir}/libpeas-2"
+
<div>-- 
</div>2.47.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#114335): <a href="https://lists.openembedded.org/g/openembedded-devel/message/114335">https://lists.openembedded.org/g/openembedded-devel/message/114335</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/110143344/3618223">https://lists.openembedded.org/mt/110143344/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-njdJu5JHB+RSYVzpR3Cs--


