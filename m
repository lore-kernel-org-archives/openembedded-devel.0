Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6EBBC43458
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:37 +0000 (UTC)
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14753.1782634357164344372
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iUyS/PME;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-30bf8b2bd20so4929181eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634356; x=1783239156; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ThjPQSF/Q9ZF6s8GScR5Hb/rGwFRyO8b8PPFCvvY8rU=;
        b=iUyS/PMEhbsNkWY0QbNnpqTQr0Jvf7a84rMK+Z7HynW9qh0gDzmX8b9vb/zjoPlPNq
         4ijtBnRCrnTrZcZEOON+MvbGgTIZ2pS/KBeGOUNQLG9B5DoCYnG2zObmb0a07Z4u15F3
         2oOJggfWxut9ma/H/dt0EymNWTDM7WhY1+h6r8SMWaa0RWcBX/c6zqvcWwgAn3LT7GTw
         AFGgr8lE7/CmLzFJzzb5XwMCkUpvR7s8hIAq9o5gRAxTRVtIkqlbnxBv5WDy530tVDeh
         oQEeOn1N/4YRMuUg5bBRLHPNtsisEsLMFtVm+d0+dlaFqwVqAqlJsoEFM7gIiPmyTXmn
         zWwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634356; x=1783239156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ThjPQSF/Q9ZF6s8GScR5Hb/rGwFRyO8b8PPFCvvY8rU=;
        b=nI5T9KyzEkNQEmRC4ZypGgSyAf1iDW6BAgxGOsavOPwjPSi91zqAIaJNpcPlxJJh1i
         cJ9TlW2b5rpRNrR5iU/QTpetVxGer5zcQzZF4emndu6k/NH1msl1xnE7cQZ4hpq9gZtr
         xx85O2GZ6IlLyJvHiKm3NQkgpOu5+72ywJUbvrIlTpxJE8jw9JG2uaoTUrqzyBGI64U8
         klY0b5xpNB4j7YIf+vaXyZ96agEGpMxtvefJtk8UVeyAn/uOoD6YCwJ5qXf8QLYkstG7
         4h0ER4EqtHclbPontzljjmt17XlT+fNd2tV0uxDsafvDPkJ1sgK88VU6RnaIVVVFQqRz
         7e6g==
X-Gm-Message-State: AOJu0YyCWaIRTBQgcTX26nfZ1sVPnym/m7eGUZBxjoaddK+EcbLRZWx8
	aG+mFogDyBgFZbzTeLi6YEUB5wLLXQ3gpG4JIt7z1kGentbUl5W5WZcTfAHI/yiAI4pg4g==
X-Gm-Gg: AfdE7cmeC388Tc3wzqwmET4BA1ayvh76Y0RGGrP9keLZ1QIJxYGEGAlmBRbZAiW4gy7
	No6Agx62BGkkFrMgDxvv/ybI7LWdrXBVuys32n75spxRfkiF3yKF74bwTLa3whk19oZ1jB0QyCw
	Fn4czcwCmuyaEGvMceGAe4/Am3JkDgTSt1z9K8mwEQEH7SM+x1eUkFionTymf9LpKDrpxyZ/mT9
	r0lZfqfZFrqP3s0FLB5jKtejLx3g5rrGWOrG0+q4lM3Pj0In9QQyovQNp4fnXNbUzqL1zZec8Ic
	gUXsi11tyFdQtMn/27eIavMQhyadIH9FWtAkAtC6Zp13LgUli4q4cWXQRzH4clXwULoX2RVEAyr
	9DCumote7GWIRdrjtO/FTU7r4vweEBnq1dD+Cmm5Tvc1GfUB7ql2GUc4yl5H/9cLvYx90oFyR/t
	c8a37OpMK3MAeUgvuYMqC4p3mUmjZ2E06pjekVkghdUcOJvzlTuc4hqM4uqqBRduWn2ItvzOCdz
	nqTV4m+mLbEKsRpm9OpG4O7hoajD5UyErzRxAissd5035EOzGPwlmB4OfNLQ58NJebATOjLg6t9
	aZ2GtqvmxJ1o7mcwsfdNwZq6eTpSTw==
X-Received: by 2002:a05:7300:8c06:b0:304:18be:55a5 with SMTP id 5a478bee46e88-30cab22ba02mr6129901eec.22.1782634356443;
        Sun, 28 Jun 2026 01:12:36 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 078/128] webkitgtk3: upgrade 2.50.6 -> 2.52.4
Date: Sun, 28 Jun 2026 01:10:29 -0700
Message-ID: <20260628081122.178348-78-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127888

fix -Werror=poison-system-directories in g-ir-scanner

CMake's pkg_check_modules stores the bare INCLUDEDIR variable (/usr/include)
on imported targets' INTERFACE_INCLUDE_DIRECTORIES. WebKit's FindGI.cmake
forwards every interface include dir to g-ir-scanner as -I, so the
introspection compile is invoked with -I/usr/include. With a GCC configured
with --enable-poison-system-directories=error (as in OpenEmbedded cross gcc):

  cc1: error: include location "/usr/include" is unsafe for cross-compilation
  [-Werror=poison-system-directories]

g-ir-scanner only extracts -D/-I/-U from CFLAGS (not -Wno-error flags), so the
warning cannot be relaxed via the recipe CFLAGS. Filter the bare host system
include directories (/usr/include, /usr/local/include) out of the scanner flags
in FindGI.cmake instead; the sysroot include path is added automatically.

filter bare system include dirs from gir generator expr

The FindGI g-ir-scanner fix only filtered /usr/include from the dependency
loop that builds scanner_flags. The include dirs also reach the scanner via
the per-target INTERFACE_INCLUDE_DIRECTORIES generator expression that is
joined into -I flags on the g-ir-scanner command line, which was left
unfiltered.

JavaScriptCore-4.1.gir happens to carry no bare /usr/include on its target
so it succeeded, but WebKit2/WebKitGTK does, so the WebKitGTK introspection
still failed under the OpenEmbedded cross compiler:

  cc1: error: include location "/usr/include" is unsafe for cross-compilation
  [-Werror=poison-system-directories]

Filter /usr/include and /usr/local/include out of the target_inc generator
expression with $<FILTER:...,EXCLUDE,...> too.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...-system-include-dirs-from-g-ir-scann.patch | 72 +++++++++++++++++++
 ...kitgtk3_2.50.6.bb => webkitgtk3_2.52.4.bb} |  3 +-
 2 files changed, 74 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-FindGI-drop-bare-system-include-dirs-from-g-ir-scann.patch
 rename meta-oe/recipes-support/webkitgtk/{webkitgtk3_2.50.6.bb => webkitgtk3_2.52.4.bb} (98%)

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-FindGI-drop-bare-system-include-dirs-from-g-ir-scann.patch b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-FindGI-drop-bare-system-include-dirs-from-g-ir-scann.patch
new file mode 100644
index 0000000000..e9e58c26d0
--- /dev/null
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-FindGI-drop-bare-system-include-dirs-from-g-ir-scann.patch
@@ -0,0 +1,72 @@
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 25 Jun 2026 00:00:00 +0000
+Subject: [PATCH] FindGI: drop bare system include dirs from g-ir-scanner flags
+
+When cross-compiling, CMake's pkg_check_modules records the bare pkg-config
+INCLUDEDIR variable (e.g. /usr/include) on the imported targets'
+INTERFACE_INCLUDE_DIRECTORIES. FindGI forwards every interface include dir
+to g-ir-scanner as -I, so the introspection compile is invoked with a bare
+-I/usr/include. With a GCC configured with
+--enable-poison-system-directories=error (as in OpenEmbedded) this is a hard
+error:
+
+  cc1: error: include location "/usr/include" is unsafe for cross-compilation
+  [-Werror=poison-system-directories]
+
+g-ir-scanner does not forward the recipe's -Wno-error=poison-system-directories
+(it only extracts -D/-I/-U from CFLAGS), so the warning cannot be relaxed from
+the recipe. Filter the bare host system include directories out instead; the
+proper sysroot include path is added by the compiler driver automatically, so
+dropping them is safe.
+
+The include dirs reach the scanner through two paths, both of which must be
+filtered:
+
+  * the dependency loop that appends to scanner_flags, and
+  * the per-target INTERFACE_INCLUDE_DIRECTORIES generator expression that is
+    joined into -I flags on the g-ir-scanner command line.
+
+Filtering only the first path is not enough: JavaScriptCore-4.1.gir happens to
+have no bare /usr/include on its target, but WebKit2/WebKitGTK does, so the
+WebKitGTK introspection still failed via the generator-expression path. Filter
+both.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Source/cmake/FindGI.cmake | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+--- a/Source/cmake/FindGI.cmake
++++ b/Source/cmake/FindGI.cmake
+@@ -297,6 +297,15 @@ function(GI_INTROSPECT namespace nsversion header)
+         if (NOT IS_ABSOLUTE "${incdir}")
+             get_filename_component(incdir "${incdir}" REALPATH BASE_DIR "${target_srcdir}")
+         endif ()
++        # Skip bare host system include directories. When cross-compiling
++        # these leak in via the bare pkg-config INCLUDEDIR variable and
++        # g-ir-scanner passes them to the compiler, which rejects them with
++        # -Werror=poison-system-directories ("include location \"/usr/include\"
++        # is unsafe for cross-compilation"). The sysroot include path is added
++        # automatically, so dropping these is safe.
++        if (incdir STREQUAL "/usr/include" OR incdir STREQUAL "/usr/local/include")
++            continue ()
++        endif ()
+         list(APPEND scanner_flags "-I${incdir}")
+     endforeach ()
+ 
+@@ -337,6 +346,13 @@ function(GI_INTROSPECT namespace nsversion header)
+     # Generate .gir
+     set(target_def "$<TARGET_PROPERTY:${opt_TARGET},COMPILE_DEFINITIONS>")
+     set(target_inc "$<TARGET_PROPERTY:${opt_TARGET},INTERFACE_INCLUDE_DIRECTORIES>")
++    # The target's INTERFACE_INCLUDE_DIRECTORIES are joined into -I flags on
++    # the g-ir-scanner command line below. Drop the bare host system include
++    # dirs (/usr/include, /usr/local/include) here too, otherwise -I/usr/include
++    # trips -Werror=poison-system-directories under the OpenEmbedded cross
++    # compiler. The sysroot include path is added automatically, so dropping
++    # them is safe.
++    set(target_inc "$<FILTER:${target_inc},EXCLUDE,^/usr/(local/)?include$>")
+     add_custom_command(
+         OUTPUT "${gir_path}"
+         COMMENT "Generating ${gir_name}.gir"
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.50.6.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.52.4.bb
similarity index 98%
rename from meta-oe/recipes-support/webkitgtk/webkitgtk3_2.50.6.bb
rename to meta-oe/recipes-support/webkitgtk/webkitgtk3_2.52.4.bb
index 1e2c7d906a..ce78bee5a4 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.50.6.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.52.4.bb
@@ -15,13 +15,14 @@ LIC_FILES_CHKSUM = "file://Source/JavaScriptCore/COPYING.LIB;md5=d0c6d6397a5d842
 
 SRC_URI = "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
            file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch \
+           file://0001-FindGI-drop-bare-system-include-dirs-from-g-ir-scann.patch \
            file://reproducibility.patch \
            file://no-musttail-arm.patch \
            file://sys_futex.patch \
            file://fix-ftbfs-riscv64.patch \
            file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch \
            "
-SRC_URI[sha256sum] = "2b281abf8894ffc6172152e5660b75eeeedbe1cc43d6783d09dc79f7c865bb42"
+SRC_URI[sha256sum] = "cf4076a1ca2a64788edca8c452d8ebb68d5e2965e588fe46a388a016513edce4"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 

