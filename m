Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.2035.1617652181505805201
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Apr 2021 12:49:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VPfMAJ9X;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id b17so5123674pgh.7
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Apr 2021 12:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gaAqygLKktIIAk9GB4zZ4Sy/pppiEkTfhmMtn6EM5KQ=;
        b=VPfMAJ9XOe8+W+OGz2b3sek9X5ORHjCn/Y7n+wOzzKJ0uR/kRn8wCIwsvh4zC8jTC/
         vTtlTTljx9Gnkfn/y194lmnencv7SIPblRtVxQW748v75o9YwmNyryUjvQspi2nbM0Lu
         EsZ3KqfSetrIlS/dcsRwNXau6eu+3NpeHSrYZH1GGnnWpYbjejZRaDBlpfNAhgQ2CVk2
         FzaJZf6X4h2kv3F1CNh98CiW2nRXNtrw8gCUgxWEPxyeIt8/P5V/yXhbDGlclbDvnGWF
         IFDVD5IvKOYdDzfVwgackhzMZ5jbAe7j8XFL0B4VXsQ8eJ1GyRptchdCUmTJWCpZkxip
         +w0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gaAqygLKktIIAk9GB4zZ4Sy/pppiEkTfhmMtn6EM5KQ=;
        b=OKpM/L9HkamvxFYRjaI2RCKUjDNEvIWtsSZOVG1w9pcobVRof7mBT0jnqfOyOGn2Y4
         MoXm7/0rRfL3JiOTtSvfyI5+JeL+5xCSjjtjPvMSkbf+xlHYHG1MpP/0d9kNPN+wMbhL
         ZUInZDDmaf4esLe51JGXwxrDkYthIAWtyWB40bfWMMocMPCvh4kaa7Odn8cimFs4rU2D
         9XdSV9EJOyxYE1zaWRn+/nXSHhUklrpbZI2gxAlCo3US5SSuyLHOKvhaBhYaeWyUu7lp
         H0F6tTqM0WMjlTqjiYUySu26J5pGkNVsereKfkxmKFTjCj+Mrnv0Y7hbDgIbyvl6ouLP
         dl1A==
X-Gm-Message-State: AOAM531s26y7Hb4lfTnJOPW/7UG20nk1kjIk8h2Q5SgL3eDY+Nj4IavX
	ck5jeweuT+k/a3NE0hrJrrSyOurppvpXRg==
X-Google-Smtp-Source: ABdhPJxjPgQedkGlbVDWra1g8Xi5NPmSjDOyBICoLpDK8TjtQ+Cf3LAcuddCbkIIQcF2c1C7Pwjc3A==
X-Received: by 2002:a63:1c48:: with SMTP id c8mr23471187pgm.234.1617652180550;
        Mon, 05 Apr 2021 12:49:40 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bc1b])
        by smtp.gmail.com with ESMTPSA id w84sm16800826pfc.142.2021.04.05.12.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 12:49:40 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-gnome][PATCH] gjs: Fix build with gcc11
Date: Mon,  5 Apr 2021 12:49:38 -0700
Message-Id: <20210405194938.3175009-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Partially backport an upstream fix to 1.58

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 ...id-g_once_init_enter-error-in-GCC-11.patch | 77 +++++++++++++++++++
 meta-gnome/recipes-gnome/gjs/gjs_1.58.8.bb    |  4 +-
 2 files changed, 80 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/gjs/gjs/0001-maint-Avoid-g_once_init_enter-error-in-GCC-11.patch

diff --git a/meta-gnome/recipes-gnome/gjs/gjs/0001-maint-Avoid-g_once_init_enter-error-in-GCC-11.patch b/meta-gnome/recipes-gnome/gjs/gjs/0001-maint-Avoid-g_once_init_enter-error-in-GCC-11.patch
new file mode 100644
index 0000000000..6343a24a2d
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gjs/gjs/0001-maint-Avoid-g_once_init_enter-error-in-GCC-11.patch
@@ -0,0 +1,77 @@
+From dae0055be61937fe70252f3f4ee09b355aba2b8f Mon Sep 17 00:00:00 2001
+From: Philip Chimento <philip.chimento@gmail.com>
+Date: Sun, 14 Feb 2021 12:20:09 -0800
+Subject: [PATCH] maint: Avoid g_once_init_enter error in GCC 11
+
+On platforms where g_once_init_enter() is defined to use C11 atomic
+builtins, passing a pointer to a volatile value is an error in GCC 11 and
+later, in C++.
+
+More info about the GCC change:
+https://gcc.gnu.org/bugzilla/show_bug.cgi?id=95378
+https://gcc.gnu.org/pipermail/gcc-patches/2020-June/548283.html
+
+However, it's my understanding that in modern C++ there is no longer a
+need to guard the initialization of these variables. Since C++11, static
+local variables in a function are guaranteed to be initialized only once,
+the first time control passes through that function. So we can just remove
+the g_once_init_enter guard.
+
+More info:
+https://en.cppreference.com/w/cpp/language/storage_duration#Static_local_variables
+
+Stack Overflow answers with quotations from the C++ standard:
+https://stackoverflow.com/a/58804/172999
+https://stackoverflow.com/a/8102145/172999
+
+Closes: #376
+---
+ gjs/error-types.cpp | 32 +++++++++++++-------------------
+ 1 file changed, 13 insertions(+), 19 deletions(-)
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gjs/-/commit/f02eaf3a9d3465915eb849428c2d9615e2184a4c]
+diff --git a/gjs/error-types.cpp b/gjs/error-types.cpp
+index 86cb878..5eba61b 100644
+--- a/gjs/error-types.cpp
++++ b/gjs/error-types.cpp
+@@ -31,24 +31,18 @@ G_DEFINE_QUARK(gjs-js-error-quark, gjs_js_error)
+ // clang-format on
+ 
+ GType gjs_js_error_get_type(void) {
+-    static volatile GType g_type_id;
+-
+-    if (g_once_init_enter(&g_type_id)) {
+-        static GEnumValue errors[] = {
+-            { GJS_JS_ERROR_ERROR, "Error", "error" },
+-            { GJS_JS_ERROR_EVAL_ERROR, "EvalError", "eval-error" },
+-            { GJS_JS_ERROR_INTERNAL_ERROR, "InternalError", "internal-error" },
+-            { GJS_JS_ERROR_RANGE_ERROR, "RangeError", "range-error" },
+-            { GJS_JS_ERROR_REFERENCE_ERROR, "ReferenceError", "reference-error" },
+-            { GJS_JS_ERROR_STOP_ITERATION, "StopIteration", "stop-iteration" },
+-            { GJS_JS_ERROR_SYNTAX_ERROR, "SyntaxError", "syntax-error" },
+-            { GJS_JS_ERROR_TYPE_ERROR, "TypeError", "type-error" },
+-            { GJS_JS_ERROR_URI_ERROR, "URIError", "uri-error" },
+-            { 0, nullptr, nullptr }
+-        };
+-
+-        g_type_id = g_enum_register_static("GjsJSError", errors);
+-    }
+-
++    static const GEnumValue errors[] = {
++        {GJS_JS_ERROR_ERROR, "Error", "error"},
++        {GJS_JS_ERROR_EVAL_ERROR, "EvalError", "eval-error"},
++        {GJS_JS_ERROR_INTERNAL_ERROR, "InternalError", "internal-error"},
++        {GJS_JS_ERROR_RANGE_ERROR, "RangeError", "range-error"},
++        {GJS_JS_ERROR_REFERENCE_ERROR, "ReferenceError", "reference-error"},
++        {GJS_JS_ERROR_STOP_ITERATION, "StopIteration", "stop-iteration"},
++        {GJS_JS_ERROR_SYNTAX_ERROR, "SyntaxError", "syntax-error"},
++        {GJS_JS_ERROR_TYPE_ERROR, "TypeError", "type-error"},
++        {GJS_JS_ERROR_URI_ERROR, "URIError", "uri-error"},
++        {0, nullptr, nullptr}};
++    // Initialization of static local variable guaranteed only once in C++11
++    static GType g_type_id = g_enum_register_static("GjsJSError", errors);
+     return g_type_id;
+ }
+-- 
+2.31.1
+
diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.58.8.bb b/meta-gnome/recipes-gnome/gjs/gjs_1.58.8.bb
index dbb04ef8e3..678ba9c4c8 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs_1.58.8.bb
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.58.8.bb
@@ -12,7 +12,9 @@ DEPENDS = "mozjs gtk+3"
 inherit gnomebase gsettings gobject-introspection vala gettext features_check upstream-version-is-even
 
 SRC_URI[archive.sha256sum] = "7fb3eb746c17363d9ee47f4a5d0bb048f0075611763eb0da11d85e0e57aff381"
-SRC_URI += "file://0001-Disable-tests-on-host.patch"
+SRC_URI += "file://0001-Disable-tests-on-host.patch \
+            file://0001-maint-Avoid-g_once_init_enter-error-in-GCC-11.patch \
+"
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
-- 
2.31.1

