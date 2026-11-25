Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37953.1795594121411292590
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:08:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=GfCjZBka;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-385d8a00598so8058019eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594121; x=1796198921; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hAIimAGftk9wlNoWa4vy06SOGUE+/j2DtitNmzZwE5k=;
        b=GfCjZBkaDYVe+YwtNHVY5KElowKQSPg0tPcRtktsXt55M8HXDdBU/XGFjlarsuB/kK
         bGGpHvDkAQemYyxFo1INh815dMrKuvQKMJnUiCWdgSJ2ckSqfTJX5O7aMrfFkIzqAz+4
         ymLWCm6fNGmfVMet0s+74Z0iYq5NjPFMSsHE5JvQ+Nk85d9eTzp2wBkuUdAmH2cmHsSZ
         u43pehdxp7HYrjkE7KhOU5CI0RDcs0BGnSrhifJ/6AZxsmrbhZaiRiWaMPX4WOb8mAfk
         oG/Lqxl0ckcv5Vt89WxHxsbXWUq4kaMl9gdeiNE+/KUAtoKa0xQGBUK4IlNJOfYkljqZ
         HG3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594121; x=1796198921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hAIimAGftk9wlNoWa4vy06SOGUE+/j2DtitNmzZwE5k=;
        b=CZMprwL2JdDRJHA9VRb6jHzmEdpXRQ+6pyDkfgn6pn5shkeN91HEiAav7dwhHLZxaG
         KmVAIAO3uxJK/YKNM99UUzBWHxL5lrKBQCl3g6kC4PWXKQ82uCT/sU6JbXjaultZ/EOq
         5fu9GPOTLhyC5r07Q2URQuFx3shQfoC+yubKP4vAPGTRFII83ixcjX9QaQUEStFhCJoz
         1K1DXwvStE6gCkQ46O9BmLfIRcDH1yu1ji+8Zk4FFTkurYUG9JQHMHSOgkbElRBYWoN3
         ukRticO3CBCl4VzHXga2DPbI34E4TTWZ10P3u0/BzY6mki75dvJpkyWzIAQCqHvDYOub
         8ydw==
X-Gm-Message-State: APuU4Z9z1/sA+H5yV2djcvChpkkCFHnVmMLHtDd93cYngDycRGVqs9rw
	vpHX5k+qMmq08ezEN5Qz2Uwqm2A6+IzejTSkExoXzcS6BI8IVFlP7uUdqw3K3tGT
X-Gm-Gg: AZFdTZfNU7ha+FxtMDk6UD8z8eeXOCYJWTiEJUjYiI52KyO5vdcC7tssJiF3/FEoe/h
	EW/3rBruwtDHaLpquowW3r+dom5I1rTzpJZN15JkQapBmxs3zdCi0Mg187l3GBnIJuJvcsJ5Ay4
	XEcthLdr+2hkm4foVU86PEwvglbT/x5dbpYJdOBfgcxVNizXuRS8JQdGTQGA6OiMr2Lq9c8KVFk
	KWQA7Imk9lSenVgJlt2uWfHghIl/eJsTiPPAzImct9359CYekSQoDIfU2n4kx/wcEym4SAVm15g
	A1lRtvL/nSw5TSUy3IO19ltlvAxpWEQXxGmCIGHlbNtxiJy25/PgbQPb85sr96pdJjblnZB+iU7
	qbcTW331YJCUesVtA3GPIduNFOjEutb2l4rO6h8f5561txjBrdg+DdazFdPyVbuYZDZROf+OGdA
	SomdoD5fzS+vFTn+6cZlqhIYSXv7oUn7yupc5Q2iNwMKNVauq4hjzuyk+ztzmtV8z5kGa/KAyoq
	HS5RXzKKt9tQRdJ2TMIprP2u5vYNeSdaZyd8RoBQMmxaPOUtKX7RrS613eChRH5kYomTU5qBiNA
	9nRYsW3VcQ115tIpxK0VVvtupgtGMbhw6ZnEHm2czogWerze0g9BJA0XzRtHif0M1BW1ODxBK9a
	moy385JuUD1qmc/WGTRDsbNijiyCA66IkQUWqC3KeSD7S12OsQunZcj738yEm83/h7IMH3RgPqm
	GK7+MKm3bt4p42JTQQpbOOjOfzpdG2qgCfukPxazVA/AnKQak9hwFT0ruKOwPPC8Lk6b1miBftB
	QJxaMheFR4oZzDgAL1oM72PPIDLpPHoFBgecJi8PsLlK1ahelYHDWwNXm6RvhiuuLxA6xHh+cnC
	IzEO
X-Received: by 2002:a05:693c:65cb:b0:386:b12f:c693 with SMTP id 5a478bee46e88-386b12fcaabmr8325480eec.39.1795594120548;
        Wed, 25 Nov 2026 00:08:40 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:08:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 47/55] webkitgtk3: Sync with oe-core webkitgtk 2.54.3
Date: Wed, 25 Nov 2026 00:07:03 -0800
Message-ID: <20261125080732.2419614-53-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133050
Content-Type: text/plain; charset="utf-8"

webkitgtk3 is the GTK 3 (API 4.1) build of the oe-core webkitgtk
recipe, which gets updated more often. Bring the recipe in line with
oe-core's webkitgtk_2.54.3.bb, keeping only the GTK 3 differences
(gtk+3, -DUSE_GTK4=OFF, the webkitgtk tarball name and S, the
webkit2gtk-4.1 injected bundle path and the WebKitWebDriver3 rename):

- Add 0001-libpas-Do-not-include-stdatomic.h-from-C-translation.patch:
  libpas includes <stdatomic.h> unconditionally since 310886@main,
  which breaks C++ translation units in GCC cross builds.
- Add t6-not-declared.patch and
  0001-Source-cmake-FindGLib.cmake-do-not-set-include-dirs-.patch; the
  latter replaces our own 0001-FindGI-drop-bare-system-include-dirs
  patch, fixing the bare -I/usr/include at its source.
- Take oe-core's refreshed versions of the shared patches.
- Drop cairo from DEPENDS (oe-core d71d5f9c4d82): 2.54 removed the
  option to render with cairo. Also drop libnotify (unused) and
  libepoxy (comes with gtk+3).
- Add the assertions PACKAGECONFIG, -DENABLE_RELEASE_LOG=ON, and use
  oe.utils.vartrue for the introspection and documentation options.
- Disable the JIT on riscv64, mark 32-bit x86 incompatible (broken
  since 2.52.4) and disable ccache, as oe-core does.
- Drop TOOLCHAIN:arm = "gcc": it worked around a clang 21 bug that is
  fixed in clang 22 and later.

Keep gstreamer1.0-plugins-bad in DEPENDS: the video support needs its
gstreamer-mpegts library. oe-core gets it through the gstreamer media
backend of gtk4, which gtk+3 does not have.

Keep no-musttail-arm.patch, which oe-core does not carry because it
builds with gcc by default.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...able-to-control-macro-__PAS_ALWAYS_I.patch | 18 +++--
 ...-system-include-dirs-from-g-ir-scann.patch | 72 ------------------
 ...spection.cmake-prefix-variables-obta.patch |  4 +-
 ...dGLib.cmake-do-not-set-include-dirs-.patch | 30 ++++++++
 ...clude-stdatomic.h-from-C-translation.patch | 57 ++++++++++++++
 .../webkitgtk3/fix-ftbfs-riscv64.patch        | 27 +++++--
 .../webkitgtk3/reproducibility.patch          |  8 +-
 .../webkitgtk/webkitgtk3/sys_futex.patch      | 11 ++-
 .../webkitgtk3/t6-not-declared.patch          | 35 +++++++++
 .../webkitgtk/webkitgtk3_2.54.3.bb            | 75 ++++++++++---------
 10 files changed, 209 insertions(+), 128 deletions(-)
 delete mode 100644 meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-FindGI-drop-bare-system-include-dirs-from-g-ir-scann.patch
 create mode 100644 meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Source-cmake-FindGLib.cmake-do-not-set-include-dirs-.patch
 create mode 100644 meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-libpas-Do-not-include-stdatomic.h-from-C-translation.patch
 create mode 100644 meta-oe/recipes-support/webkitgtk/webkitgtk3/t6-not-declared.patch

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
index 87f6608592..5e1fb8b265 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
@@ -1,4 +1,4 @@
-From bbf661310448d430350eb2ad8c5869ace648dcf8 Mon Sep 17 00:00:00 2001
+From 73f7316ee08a5369555e3e631d48ba6a5a01cf9e Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Fri, 11 Aug 2023 14:20:48 +0800
 Subject: [PATCH] Add a variable to control macro
@@ -35,18 +35,21 @@ gcc option `-Og` is used.
 * Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h:
 * Source/cmake/WebKitCompilerFlags.cmake:
 
+Rebased on 2.54.2.
+
 Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/16601]
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
-Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
 ---
  Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h | 2 +-
- Source/cmake/WebKitCompilerFlags.cmake              | 7 +++++++
- 2 files changed, 8 insertions(+), 1 deletion(-)
+ Source/cmake/WebKitCompilerFlags.cmake              | 8 ++++++++
+ 2 files changed, 9 insertions(+), 1 deletion(-)
 
+diff --git a/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h b/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h
+index c42ee5f1..353c58f3 100644
 --- a/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h
 +++ b/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h
-@@ -45,7 +45,7 @@
+@@ -45,7 +45,7 @@ __PAS_BEGIN_EXTERN_C;
  #define __SUSPICIOUS__
  #define __BROKEN__
  
@@ -55,13 +58,16 @@ Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
  #define __PAS_ALWAYS_INLINE_BUT_NOT_INLINE __attribute__((__always_inline__))
  #else
  #define __PAS_ALWAYS_INLINE_BUT_NOT_INLINE
+diff --git a/Source/cmake/WebKitCompilerFlags.cmake b/Source/cmake/WebKitCompilerFlags.cmake
+index 0793c789..9a139f2f 100644
 --- a/Source/cmake/WebKitCompilerFlags.cmake
 +++ b/Source/cmake/WebKitCompilerFlags.cmake
-@@ -635,3 +635,10 @@
+@@ -635,3 +635,11 @@ if (CMAKE_CXX_COMPILER_ID MATCHES "GNU" AND WTF_CPU_MIPS)
      # (see comment #28 in the link above).
      WEBKIT_PREPEND_GLOBAL_COMPILER_FLAGS(-mno-lxc1-sxc1)
  endif ()
 +
++# rebased on 2.54.2
 +# It fails to compile with `gcc -Og`
 +set(WEBKIT_NO_INLINE_HINTS OFF CACHE BOOL "Disable funtion attribute always_inline for WebKit")
 +
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-FindGI-drop-bare-system-include-dirs-from-g-ir-scann.patch b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-FindGI-drop-bare-system-include-dirs-from-g-ir-scann.patch
deleted file mode 100644
index 65a3371852..0000000000
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-FindGI-drop-bare-system-include-dirs-from-g-ir-scann.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 25 Jun 2026 00:00:00 +0000
-Subject: [PATCH] FindGI: drop bare system include dirs from g-ir-scanner flags
-
-When cross-compiling, CMake's pkg_check_modules records the bare pkg-config
-INCLUDEDIR variable (e.g. /usr/include) on the imported targets'
-INTERFACE_INCLUDE_DIRECTORIES. FindGI forwards every interface include dir
-to g-ir-scanner as -I, so the introspection compile is invoked with a bare
--I/usr/include. With a GCC configured with
---enable-poison-system-directories=error (as in OpenEmbedded) this is a hard
-error:
-
-  cc1: error: include location "/usr/include" is unsafe for cross-compilation
-  [-Werror=poison-system-directories]
-
-g-ir-scanner does not forward the recipe's -Wno-error=poison-system-directories
-(it only extracts -D/-I/-U from CFLAGS), so the warning cannot be relaxed from
-the recipe. Filter the bare host system include directories out instead; the
-proper sysroot include path is added by the compiler driver automatically, so
-dropping them is safe.
-
-The include dirs reach the scanner through two paths, both of which must be
-filtered:
-
-  * the dependency loop that appends to scanner_flags, and
-  * the per-target INTERFACE_INCLUDE_DIRECTORIES generator expression that is
-    joined into -I flags on the g-ir-scanner command line.
-
-Filtering only the first path is not enough: JavaScriptCore-4.1.gir happens to
-have no bare /usr/include on its target, but WebKit2/WebKitGTK does, so the
-WebKitGTK introspection still failed via the generator-expression path. Filter
-both.
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Source/cmake/FindGI.cmake | 16 ++++++++++++++++
- 1 file changed, 16 insertions(+)
-
---- a/Source/cmake/FindGI.cmake
-+++ b/Source/cmake/FindGI.cmake
-@@ -297,6 +297,15 @@
-         if (NOT IS_ABSOLUTE "${incdir}")
-             get_filename_component(incdir "${incdir}" REALPATH BASE_DIR "${target_srcdir}")
-         endif ()
-+        # Skip bare host system include directories. When cross-compiling
-+        # these leak in via the bare pkg-config INCLUDEDIR variable and
-+        # g-ir-scanner passes them to the compiler, which rejects them with
-+        # -Werror=poison-system-directories ("include location \"/usr/include\"
-+        # is unsafe for cross-compilation"). The sysroot include path is added
-+        # automatically, so dropping these is safe.
-+        if (incdir STREQUAL "/usr/include" OR incdir STREQUAL "/usr/local/include")
-+            continue ()
-+        endif ()
-         list(APPEND scanner_flags "-I${incdir}")
-     endforeach ()
- 
-@@ -337,6 +346,13 @@
-     # Generate .gir
-     set(target_def "$<TARGET_PROPERTY:${opt_TARGET},COMPILE_DEFINITIONS>")
-     set(target_inc "$<TARGET_PROPERTY:${opt_TARGET},INTERFACE_INCLUDE_DIRECTORIES>")
-+    # The target's INTERFACE_INCLUDE_DIRECTORIES are joined into -I flags on
-+    # the g-ir-scanner command line below. Drop the bare host system include
-+    # dirs (/usr/include, /usr/local/include) here too, otherwise -I/usr/include
-+    # trips -Werror=poison-system-directories under the OpenEmbedded cross
-+    # compiler. The sysroot include path is added automatically, so dropping
-+    # them is safe.
-+    set(target_inc "$<FILTER:${target_inc},EXCLUDE,^/usr/(local/)?include$>")
-     set(scanner_env "CC=${CMAKE_C_COMPILER}" "CFLAGS=${CMAKE_C_FLAGS}")
-     if (ENABLED_COMPILER_SANITIZERS)
-         string(JOIN " " sanitizer_flags ${ENABLED_COMPILER_SANITIZERS})
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
index 06030c047c..5a9be94836 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
@@ -1,4 +1,4 @@
-From e68e87c14243b1c8707c56883a53e841310974a1 Mon Sep 17 00:00:00 2001
+From 773c76b7f22c213fd8b67dc6952c3c715973ee4d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 27 Oct 2015 16:02:19 +0200
 Subject: [PATCH] FindGObjectIntrospection.cmake: prefix variables obtained
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 3 insertions(+)
 
 diff --git a/Source/cmake/FindGI.cmake b/Source/cmake/FindGI.cmake
-index fdc56b21..d42eca52 100644
+index a8a56fdd..572ca99c 100644
 --- a/Source/cmake/FindGI.cmake
 +++ b/Source/cmake/FindGI.cmake
 @@ -72,6 +72,9 @@ if (PKG_CONFIG_FOUND)
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Source-cmake-FindGLib.cmake-do-not-set-include-dirs-.patch b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Source-cmake-FindGLib.cmake-do-not-set-include-dirs-.patch
new file mode 100644
index 0000000000..cabdd3dab1
--- /dev/null
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Source-cmake-FindGLib.cmake-do-not-set-include-dirs-.patch
@@ -0,0 +1,30 @@
+From f4361f879eefd480197ba0210d102c2100a4c24b Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Sun, 21 Jun 2026 22:57:24 +0200
+Subject: [PATCH] Source/cmake/FindGLib.cmake: do not set include dirs from
+ INCLUDEDIR
+
+The correct include directory set is provided by INCLUDE_DIRS (e.g. the following line).
+INCLUDEDIR is a prefix to them (e.g. it's set to /usr/include in most cases), and adding
+it is causing problems in cross-compile scenarios where the build is performed against
+a system root and include locations are substituted to that using pkg-config override
+mechanisms.
+
+Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/67960]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ Source/cmake/FindGLib.cmake | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Source/cmake/FindGLib.cmake b/Source/cmake/FindGLib.cmake
+index b6ff9283..e9697ba8 100644
+--- a/Source/cmake/FindGLib.cmake
++++ b/Source/cmake/FindGLib.cmake
+@@ -195,7 +195,6 @@ function(GLib_HandleComponent name)
+     list(TRANSFORM dependencies PREPEND GLib::)
+     add_library(GLib::${name} UNKNOWN IMPORTED GLOBAL)
+     set_target_properties(GLib::${name} PROPERTIES IMPORTED_LOCATION "${GLib_${name}_LIBRARY}")
+-    target_include_directories(GLib::${name} INTERFACE ${PC_GLib_${name}_INCLUDEDIR})
+     target_include_directories(GLib::${name} INTERFACE ${PC_GLib_${name}_INCLUDE_DIRS})
+     target_compile_options(GLib::${name} INTERFACE ${PC_GLib_${name}_CFLAGS})
+     target_compile_options(GLib::${name} INTERFACE ${PC_GLib_${name}_CFLAGS_OTHER})
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-libpas-Do-not-include-stdatomic.h-from-C-translation.patch b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-libpas-Do-not-include-stdatomic.h-from-C-translation.patch
new file mode 100644
index 0000000000..ef962bd742
--- /dev/null
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-libpas-Do-not-include-stdatomic.h-from-C-translation.patch
@@ -0,0 +1,57 @@
+From ed10e504c0a627769973d3078548bbd54ed750f9 Mon Sep 17 00:00:00 2001
+From: Pablo Saavedra <psaavedra@igalia.com>
+Date: Thu, 17 Sep 2026 12:05:38 +0200
+Subject: [PATCH] Do not include <stdatomic.h> from C++ translation units
+ https://bugs.webkit.org/show_bug.cgi?id=324345
+
+Reviewed by NOBODY (OOPS!).
+
+310886@main added an unconditional <stdatomic.h> include to pas_utils.h.
+GCC 13 cross builds in Yocto fail to compile C++ translation units that
+pull in pas_utils.h because of it. 312138@main fixed the equivalent
+breakage for xcodebuild by moving libpas to gnu++23, but a CMake build
+using an older C++ standard is not covered by that.
+
+The include cannot simply be dropped for C++. clang requires
+<stdatomic.h> to be included wherever the _Atomic qualifier is used
+(-Wqualifier-requires-header), and PAS_ATOMIC_TYPE() expands to _Atomic
+under PAS_COMPILER(CLANG). pas_utils.h suppresses that diagnostic around
+its own body, but PAS_DEFINE_COMPACT_ATOMIC_PTR() expands in other
+headers -- pas_segregated_heap.h and friends -- which are outside that
+region. Satisfying those expansions is what 310886@main needed the
+include for.
+
+No other compiler sees _Atomic here: PAS_ATOMIC_TYPE() expands to a plain
+type and the atomic operations go through the __atomic builtins, and the
+__c11_atomic_* uses in this file are all inside PAS_COMPILER(CLANG)
+blocks. So keep the include for clang, where it is load-bearing and where
+this is a no-op, and skip it only for the C++ compilers that never need
+it.
+
+No new tests. Build fix. Verified by preprocessing pas_utils.h from C++
+with both compilers: g++ no longer reaches <stdatomic.h> while clang++
+still does, and Source/bmalloc/bmalloc/bmalloc.cpp still compiles with
+both.
+
+* Source/bmalloc/libpas/src/libpas/pas_utils.h:
+
+Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/74158]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ Source/bmalloc/libpas/src/libpas/pas_utils.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/Source/bmalloc/libpas/src/libpas/pas_utils.h b/Source/bmalloc/libpas/src/libpas/pas_utils.h
+index 433b26f0..49117c2f 100644
+--- a/Source/bmalloc/libpas/src/libpas/pas_utils.h
++++ b/Source/bmalloc/libpas/src/libpas/pas_utils.h
+@@ -42,7 +42,9 @@
+ #endif
+ 
+ #include <limits.h>
++#if !defined(__cplusplus) || defined(__clang__)
+ #include <stdatomic.h>
++#endif
+ #include <stdbool.h>
+ #include <stdint.h>
+ #include <string.h>
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/fix-ftbfs-riscv64.patch b/meta-oe/recipes-support/webkitgtk/webkitgtk3/fix-ftbfs-riscv64.patch
index 00347ef3e1..5d1687f039 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3/fix-ftbfs-riscv64.patch
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3/fix-ftbfs-riscv64.patch
@@ -1,14 +1,23 @@
+From c9ef6dd13cbdc16b1ba50757451d631f572c723d Mon Sep 17 00:00:00 2001
 From: Alberto Garcia <berto@igalia.com>
-Description: Use WTF_CPU_UNKNOWN when building for riscv64
- WebKitGTK doesn't build on riscv64 even with the JIT disabled.
- Treating the CPU as unknown is perhaps a bit severe, but it allows us
- to get the build done until someone steps up to maintain this
- properly.
+Date: Fri, 19 Dec 2025 10:10:41 +0000
+Subject: [PATCH] Use WTF_CPU_UNKNOWN when building for riscv64
+
+WebKitGTK doesn't build on riscv64 even with the JIT disabled.
+Treating the CPU as unknown is perhaps a bit severe, but it allows us
+to get the build done until someone steps up to maintain this
+properly.
 Bug: https://bugs.webkit.org/show_bug.cgi?id=271371
-Forwarded: no
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://bugs.webkit.org/show_bug.cgi?id=271371#c1]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Source/WTF/wtf/PlatformCPU.h    | 8 --------
+ Source/cmake/WebKitCommon.cmake | 2 --
+ 2 files changed, 10 deletions(-)
+
+diff --git a/Source/WTF/wtf/PlatformCPU.h b/Source/WTF/wtf/PlatformCPU.h
+index fabd6cba..c8639827 100644
 --- a/Source/WTF/wtf/PlatformCPU.h
 +++ b/Source/WTF/wtf/PlatformCPU.h
 @@ -286,14 +286,6 @@
@@ -26,9 +35,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #if !CPU(KNOWN)
  #define WTF_CPU_UNKNOWN 1
  #endif
+diff --git a/Source/cmake/WebKitCommon.cmake b/Source/cmake/WebKitCommon.cmake
+index d96e1850..3daa0eaf 100644
 --- a/Source/cmake/WebKitCommon.cmake
 +++ b/Source/cmake/WebKitCommon.cmake
-@@ -125,8 +125,6 @@ if (NOT HAS_RUN_WEBKIT_COMMON)
+@@ -186,8 +186,6 @@ if (NOT HAS_RUN_WEBKIT_COMMON)
          set(WTF_CPU_PPC64 1)
      elseif (LOWERCASE_CMAKE_SYSTEM_PROCESSOR MATCHES "ppc64le")
          set(WTF_CPU_PPC64LE 1)
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/reproducibility.patch b/meta-oe/recipes-support/webkitgtk/webkitgtk3/reproducibility.patch
index 0a5720c99e..9ca40a0ad3 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3/reproducibility.patch
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3/reproducibility.patch
@@ -1,7 +1,7 @@
-From 7336dfd02c20ec9b2a984e1e42d17201af55c8f5 Mon Sep 17 00:00:00 2001
+From f0c2db534b2807465a36f6e23011dad9cf711da3 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Thu, 27 Jul 2023 22:09:06 +0200
-Subject: [PATCH] webkitgtk3: add recipe
+Date: Mon, 3 Jan 2022 14:18:34 +0000
+Subject: [PATCH] webkitgtk: Add reproducibility fix
 
 Injection a year based on the current date isn't reproducible. Hack this
 to a specific year for now for reproducibilty and to avoid autobuilder failures.
@@ -16,7 +16,7 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Source/JavaScriptCore/generator/GeneratedFile.rb b/Source/JavaScriptCore/generator/GeneratedFile.rb
-index 6ed2b6e4..86a28286 100644
+index 9a951947..d499ae30 100644
 --- a/Source/JavaScriptCore/generator/GeneratedFile.rb
 +++ b/Source/JavaScriptCore/generator/GeneratedFile.rb
 @@ -25,7 +25,7 @@ require 'date'
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/sys_futex.patch b/meta-oe/recipes-support/webkitgtk/webkitgtk3/sys_futex.patch
index 19d18dea88..decd5d0d5c 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3/sys_futex.patch
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3/sys_futex.patch
@@ -1,7 +1,16 @@
-Fix build on newer 32bit architectures with only 64bit time_t
+From d537da81bbec0c05e10525c0a29e0af9128c0ce4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 18 Dec 2024 20:24:22 -0800
+Subject: [PATCH] Fix build on newer 32bit architectures with only 64bit time_t
 
 Upstream-Status: Submitted [https://chromium-review.googlesource.com/c/angle/angle/+/6108397]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Source/ThirdParty/ANGLE/src/common/SimpleMutex.cpp | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/Source/ThirdParty/ANGLE/src/common/SimpleMutex.cpp b/Source/ThirdParty/ANGLE/src/common/SimpleMutex.cpp
+index 4ed0af51..11feda6c 100644
 --- a/Source/ThirdParty/ANGLE/src/common/SimpleMutex.cpp
 +++ b/Source/ThirdParty/ANGLE/src/common/SimpleMutex.cpp
 @@ -17,6 +17,9 @@
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/t6-not-declared.patch b/meta-oe/recipes-support/webkitgtk/webkitgtk3/t6-not-declared.patch
new file mode 100644
index 0000000000..2a59f3b2d9
--- /dev/null
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3/t6-not-declared.patch
@@ -0,0 +1,35 @@
+From 668ee03b07f9d64b1e7eaefba6c74ed1975f7b7c Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Mon, 5 Feb 2024 11:00:49 -0600
+Subject: [PATCH] =?UTF-8?q?LowLevelInterpreter.cpp:339:21:=20error:=20?=
+ =?UTF-8?q?=E2=80=98t6=E2=80=99=20was=20not=20declared=20in=20this=20scope?=
+ =?UTF-8?q?=20https://bugs.webkit.org/show=5Fbug.cgi=3Fid=3D268739?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Unreviewed build fix. Seems a backport went badly, and we didn't notice
+because the code is architecture-specific.
+
+* Source/JavaScriptCore/llint/LowLevelInterpreter.cpp:
+(JSC::CLoop::execute):
+
+Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/3d5373575695b293b8559155431d0079a6153aff]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ Source/JavaScriptCore/llint/LowLevelInterpreter.cpp | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp b/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
+index dd0b44de..c0a68a22 100644
+--- a/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
++++ b/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
+@@ -345,8 +345,6 @@ JSValue CLoop::execute(OpcodeID entryOpcodeID, void* executableAddress, VM* vm,
+     UNUSED_VARIABLE(t2);
+     UNUSED_VARIABLE(t3);
+     UNUSED_VARIABLE(t5);
+-    UNUSED_VARIABLE(t6);
+-    UNUSED_VARIABLE(t7);
+ 
+     struct StackPointerScope {
+         StackPointerScope(CLoopStack& stack)
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.54.3.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.54.3.bb
index 96bfd7754d..2919fe53da 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.54.3.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.54.3.bb
@@ -15,12 +15,14 @@ LIC_FILES_CHKSUM = "file://Source/JavaScriptCore/COPYING.LIB;md5=d0c6d6397a5d842
 
 SRC_URI = "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
            file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch \
-           file://0001-FindGI-drop-bare-system-include-dirs-from-g-ir-scann.patch \
            file://reproducibility.patch \
            file://no-musttail-arm.patch \
+           file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch \
+           file://t6-not-declared.patch \
            file://sys_futex.patch \
            file://fix-ftbfs-riscv64.patch \
-           file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch \
+           file://0001-Source-cmake-FindGLib.cmake-do-not-set-include-dirs-.patch \
+           file://0001-libpas-Do-not-include-stdatomic.h-from-C-translation.patch \
            "
 SRC_URI[sha256sum] = "2779c1b46f88762e8400650271ba14452dc4e30b37059981552d8b562b7d0862"
 
@@ -37,7 +39,6 @@ DEPENDS += " \
           ruby-native \
           gperf-native \
           unifdef-native \
-          cairo \
           harfbuzz \
           jpeg \
           atk \
@@ -45,32 +46,29 @@ DEPENDS += " \
           gtk+3 \
           libxslt \
           libtasn1 \
-          libnotify \
           gstreamer1.0 \
           gstreamer1.0-plugins-base \
           gstreamer1.0-plugins-bad \
           glib-2.0-native \
           gettext-native \
           libsoup \
-          libepoxy \
           "
 
-PACKAGECONFIG ??= " \
-	   ${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayland x11', d)} \
-	   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'webgl opengl', '', d)} \
-	   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', 'webgl gles2', d)} \
-	   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl-or-es', '', d)} \
-	   enchant \
-	   libsecret \
-	   "
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayland x11', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'webgl opengl', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', 'webgl gles2', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl-or-es', '', d)} \
+                   enchant \
+                   libsecret \
+                  "
 
+PACKAGECONFIG[assertions] = "-DUSE_CXX_STDLIB_ASSERTIONS=ON,-DUSE_CXX_STDLIB_ASSERTIONS=OFF,"
 PACKAGECONFIG[wayland] = "-DENABLE_WAYLAND_TARGET=ON,-DENABLE_WAYLAND_TARGET=OFF,wayland libwpe wpebackend-fdo wayland-native"
 PACKAGECONFIG[angle] = "-DUSE_ANGLE_WEBGL=ON,-DUSE_ANGLE_WEBGL=OFF"
 PACKAGECONFIG[x11] = "-DENABLE_X11_TARGET=ON,-DENABLE_X11_TARGET=OFF,virtual/libx11 libxcomposite libxdamage libxrender libxt"
 PACKAGECONFIG[geoclue] = "-DENABLE_GEOLOCATION=ON,-DENABLE_GEOLOCATION=OFF,geoclue"
 PACKAGECONFIG[enchant] = "-DENABLE_SPELLCHECK=ON,-DENABLE_SPELLCHECK=OFF,enchant2"
 PACKAGECONFIG[gles2] = "-DENABLE_GLES2=ON,-DENABLE_GLES2=OFF,virtual/libgles2"
-PACKAGECONFIG[jpegxl] = " -DUSE_JPEGXL=ON,-DUSE_JPEGXL=OFF,libjxl"
 PACKAGECONFIG[webgl] = "-DENABLE_WEBGL=ON,-DENABLE_WEBGL=OFF,virtual/egl"
 PACKAGECONFIG[opengl] = "-DENABLE_GRAPHICS_CONTEXT_GL=ON,-DENABLE_GRAPHICS_CONTEXT_GL=OFF,virtual/egl"
 PACKAGECONFIG[opengl-or-es] = "-DUSE_OPENGL_OR_ES=ON,-DUSE_OPENGL_OR_ES=OFF"
@@ -84,26 +82,26 @@ PACKAGECONFIG[lcms] = "-DUSE_LCMS=ON,-DUSE_LCMS=OFF,lcms"
 PACKAGECONFIG[journald] = "-DENABLE_JOURNALD_LOG=ON,-DENABLE_JOURNALD_LOG=OFF,systemd"
 PACKAGECONFIG[avif] = "-DUSE_AVIF_LOG=ON,-DUSE_AVIF=OFF,libavif"
 PACKAGECONFIG[media-recorder] = "-DENABLE_MEDIA_RECORDER=ON,-DENABLE_MEDIA_RECORDER=OFF,gstreamer1.0-plugins-bad"
-PACKAGECONFIG[gamepad] = "-DENABLE_GAMEPAD=ON,-DENABLE_GAMEPAD=OFF,libmanette"
-PACKAGECONFIG[webrtc] = "-DENABLE_WEB_RTC=ON,-DENABLE_WEB_RTC=OFF"
-PACKAGECONFIG[bubblewrap] = "-DENABLE_BUBBLEWRAP_SANDBOX=ON -DBWRAP_EXECUTABLE=${bindir}/bwrap -DDBUS_PROXY_EXECUTABLE=${bindir}/xdg-dbus-proxy,-DENABLE_BUBBLEWRAP_SANDBOX=OFF,,bubblewrap xdg-dbus-proxy"
+PACKAGECONFIG[jpegxl] = "-DUSE_JPEGXL=ON,-DUSE_JPEGXL=OFF,libjxl"
 PACKAGECONFIG[backtrace] = "-DUSE_LIBBACKTRACE=ON,-DUSE_LIBBACKTRACE=OFF,libbacktrace"
+PACKAGECONFIG[gamepad] = "-DENABLE_GAMEPAD=ON,-DENABLE_GAMEPAD=OFF,libmanette"
 PACKAGECONFIG[sysprof-capture] = "-DUSE_SYSTEM_SYSPROF_CAPTURE=YES,-DUSE_SYSTEM_SYSPROF_CAPTURE=NO,sysprof"
 PACKAGECONFIG[speech] = "-DENABLE_SPEECH_SYNTHESIS=ON,-DENABLE_SPEECH_SYNTHESIS=OFF,flite"
-PACKAGECONFIG[librice] = "-DUSE_LIBRICE=YES,-DUSE_LIBRICE=NO,librice"
+PACKAGECONFIG[librice] = "-DUSE_LIBRICE=ON,-DUSE_LIBRICE=OFF,librice"
+PACKAGECONFIG[webrtc] = "-DENABLE_WEB_RTC=ON,-DENABLE_WEB_RTC=OFF"
+PACKAGECONFIG[bubblewrap] = "-DENABLE_BUBBLEWRAP_SANDBOX=ON -DBWRAP_EXECUTABLE=${bindir}/bwrap -DDBUS_PROXY_EXECUTABLE=${bindir}/xdg-dbus-proxy,-DENABLE_BUBBLEWRAP_SANDBOX=OFF,,bubblewrap xdg-dbus-proxy"
 
 EXTRA_OECMAKE = " \
-	-DPORT=GTK \
-	-DUSE_GTK4=OFF \
-	${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_INTROSPECTION=ON', '-DENABLE_INTROSPECTION=OFF', d)} \
-	${@bb.utils.contains('GIDOCGEN_ENABLED', 'True', '-DENABLE_DOCUMENTATION=ON', '-DENABLE_DOCUMENTATION=OFF', d)} \
-        ${@oe.utils.vartrue('DEBUG_BUILD', '-DWEBKIT_NO_INLINE_HINTS=ON', '-DWEBKIT_NO_INLINE_HINTS=OFF', d)} \
-	-DENABLE_MINIBROWSER=ON \
-	-DCMAKE_EXPORT_COMPILE_COMMANDS=OFF \
-        -DUSE_SOUP2=OFF \
-		"
-# pass -g1 to massively reduce the size of the debug symbols (4.3GB to 700M at time of writing)
-DEBUG_LEVELFLAG = "-g1"
+                 -DPORT=GTK \
+                 ${@oe.utils.vartrue('GI_DATA_ENABLED', '-DENABLE_INTROSPECTION=ON', '-DENABLE_INTROSPECTION=OFF', d)} \
+                 ${@oe.utils.vartrue('GIDOCGEN_ENABLED', '-DENABLE_DOCUMENTATION=ON', '-DENABLE_DOCUMENTATION=OFF', d)} \
+                 ${@oe.utils.vartrue('DEBUG_BUILD', '-DWEBKIT_NO_INLINE_HINTS=ON', '-DWEBKIT_NO_INLINE_HINTS=OFF', d)} \
+                 -DENABLE_MINIBROWSER=ON \
+                 -DUSE_GTK4=OFF \
+                 -DCMAKE_EXPORT_COMPILE_COMMANDS=OFF \
+                 -DENABLE_RELEASE_LOG=ON \
+                 -DUSE_SOUP2=OFF \
+                 "
 
 # Javascript JIT is not supported on ARC
 EXTRA_OECMAKE:append:arc = " -DENABLE_JIT=OFF "
@@ -130,6 +128,7 @@ EXTRA_OECMAKE:append:armv6 = " -DENABLE_JIT=OFF "
 
 # JIT does not work on RISCV
 EXTRA_OECMAKE:append:riscv32 = " -DENABLE_JIT=OFF"
+EXTRA_OECMAKE:append:riscv64 = " -DENABLE_JIT=OFF"
 
 # JIT not supported on MIPS either
 EXTRA_OECMAKE:append:mipsarch = " -DENABLE_JIT=OFF -DENABLE_C_LOOP=ON "
@@ -160,14 +159,18 @@ ARM_INSTRUCTION_SET:armv7a = "thumb"
 ARM_INSTRUCTION_SET:armv7r = "thumb"
 ARM_INSTRUCTION_SET:armv7ve = "thumb"
 
-# ANGLE requires SSE support as of webkit 2.40.x on 32 bit x86
-COMPATIBLE_HOST:x86 = "${@bb.utils.contains_any('TUNE_FEATURES', 'core2 corei7', '.*', 'null', d)}"
+# As of 2.52.4, 32 bit x86 builds are broken:
+# https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/4013/steps/12/logs/stdio
+COMPATIBLE_HOST:x86 = "null"
 
 # introspection inside qemu-arm hangs forever on musl/arm builds
 # therefore disable GI_DATA
 GI_DATA_ENABLED:libc-musl:armv7a = "False"
 GI_DATA_ENABLED:libc-musl:armv7ve = "False"
 
+# Can't be built with ccache
+CCACHE_DISABLE = "1"
+
 do_install:append() {
 	mv ${D}${bindir}/WebKitWebDriver ${D}${bindir}/WebKitWebDriver3
 }
@@ -183,7 +186,9 @@ src_package_preprocess () {
             ${B}/WebKitGTK/DerivedSources/webkit/*.cpp
 }
 
-
-# complation fails with Clang-21 issue - https://github.com/llvm/llvm-project/issues/132322
-# Can be removed when clang is updated to v22
-TOOLCHAIN:arm = "gcc"
+# Pass -g1 to massively reduce the size of the
+# debug symbols (4.3GB to 700M at time of writing)
+# workaround error:
+# qemux86-64: "relocation truncated to fit: R_X86_64_32 against `.debug_info'"
+# qemuarm64: "relocation truncated to fit: R_AARCH64_ABS32 against `.debug_info'"
+DEBUG_LEVELFLAG = "-g1"
