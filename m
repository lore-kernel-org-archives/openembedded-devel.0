Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web11.250.1617899832238989089
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:37:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LG0R7yi+;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id y19-20020a0568301d93b02901b9f88a238eso2863445oti.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=tiWcZEQP/uC8iT3wVsPVYWacrIFNuw0lDpCNb7Sfxf0=;
        b=LG0R7yi+Dup+UV9GBgVT2AWx8oLGVYaUWLI6pGiYVVxbiwL2hFN1LiSSJiZqwB7DnF
         BpWCkvXBQsZtJWxuZI0w7ZtNXXdaP8EfgwMj1sDAbnatiWBVPU2LFG2mcURMBPFv5ZJl
         3qgrrYNEGX9Rh/PXRQJo21jM91yKOxvJ9y5APvOnvW0A26speVql4cUrUvzZM5Mj2jfW
         BFHVziuQTJfwNMmsxFeVhKlOq2i1WtcdJJvip3ydpzmEWZz7PlOXtooO1JIuF+999eQ7
         f7p96d1NRbQmiz28CGTSeZ8PEIJTjg6aSlJkfIB3I4S2LWUJ1pRCmX96FY3xaIFaDPem
         Hd7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tiWcZEQP/uC8iT3wVsPVYWacrIFNuw0lDpCNb7Sfxf0=;
        b=QWi+mNsqJJ7mqEmVNfg0SY1GdLG6uWZVKAxh+EzBtkq6LZ2i1GsSK9J0qypFEUlR/+
         Y4eazbuKt7j9Ygk5lLJjVnNEhq3bmU4A9aaiw+gT6j266x2xvuPR7BRJ3l2JVOMfRCJx
         UkgdFg6c+rnlCiRh+EO+XUq6PcOCcYy6v0z5DRFirg9fVXM5YR63T3TrLQWHW4jfTPxy
         McavHk63tNSFA7JrZDpg21bvfJabCAun65GG/AV2T6pxa8A6aTZFTuURnPKIerHQCfxh
         zjF/yCQ+qO0X+cCV4GS3JuEy9VwbLME6gVDr3mRzIFfDI0dnIlSvzcvIdvXRXrCKQufN
         oOnA==
X-Gm-Message-State: AOAM533qqOqG1vBRcdBEbZYKHeutaozUUy6aw24HfHiHiN201zADIxcS
	f4xSUnoSpDYQMXOjoBi4O+NeEAI20F0=
X-Google-Smtp-Source: ABdhPJwOH6DjlGAo1C9f9ujNedu1KJnai3K1udCoKToHi+7OMUK8EwqiuJMlb7VuxQ+krwqEK9467w==
X-Received: by 2002:a05:6830:148c:: with SMTP id s12mr8663223otq.251.1617899831380;
        Thu, 08 Apr 2021 09:37:11 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.37.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:37:10 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 62/64] gjs: Fix build with gcc11
Date: Thu,  8 Apr 2021 09:36:09 -0700
Message-Id: <a0161fe0755c629dfbea81abab57118fe256cb19.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

Partially backport an upstream fix to 1.58

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
(cherry picked from commit 6f2099cf7806a7d00cdd3b4cda74e9e5574d0479)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...id-g_once_init_enter-error-in-GCC-11.patch | 77 +++++++++++++++++++
 meta-gnome/recipes-gnome/gjs/gjs_1.58.8.bb    |  4 +-
 2 files changed, 80 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/gjs/gjs/0001-maint-Avoid-g_once_init_enter-error-in-GCC-11.patch

diff --git a/meta-gnome/recipes-gnome/gjs/gjs/0001-maint-Avoid-g_once_init_enter-error-in-GCC-11.patch b/meta-gnome/recipes-gnome/gjs/gjs/0001-maint-Avoid-g_once_init_enter-error-in-GCC-11.patch
new file mode 100644
index 00000000000..6343a24a2da
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
index dbb04ef8e38..678ba9c4c83 100644
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
2.17.1

