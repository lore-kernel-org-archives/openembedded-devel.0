Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f48.google.com (mail-yw1-f48.google.com
	[209.85.161.48])
	by mail.openembedded.org (Postfix) with ESMTP id 417D278DD3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 10:09:46 +0000 (UTC)
Received: by mail-yw1-f48.google.com with SMTP id r3-v6so13143976ywc.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 03:09:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=PrHwCulSOPaS1Mh5wnektHgnf0egrE+8UGVLxHpe+RU=;
	b=hxqtW+A16tAVAvedly/y7bXz63AqYdFppg79BDP1yUEhDw/abumPqaUWG7o4yy6rpI
	AuHLl5L7o0GNaIR0LJgyv2ZYnfNzIazvKWtVriyQQHfTIYQdcy/yK2BZt42aHfDahsBZ
	iE/u+dA6qNWEbiD7QJ5MGxzNhXKfZviwyuDGRBxsiIPi8oJSADJebs+fRzvxzlqGqIxW
	fOcyQ9qc5fXXyYPA6NCGtKjzxVoO6bOBiqAw9BEN71/awNYm/Qfcy2rewv1Nx7hbxhDN
	oxvy11rIcB+NtSnl4uo6gU8uPwq5wFUttcwOr8q+SLVBcqRgW/gRQiniZkAyNwNelJM2
	UfuA==
X-Gm-Message-State: AOUpUlGJkWkzC31mWxh20mBoxpKvbOXvN9AoYQQVW2WfVN7DlY1nE7nt
	7NDMi0sVOZrnBhhIowZmSgMjK4zi
X-Google-Smtp-Source: AA+uWPygaP+KUq/xsowXK/xn/jYuqjHE4rr6zmDgv1TEWqKcJ8JcNYNNWXz9G1HGmH/EnECoKaL7FA==
X-Received: by 2002:a0d:c545:: with SMTP id
	h66-v6mr8950243ywd.208.1534154987763; 
	Mon, 13 Aug 2018 03:09:47 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	i62-v6sm6918738ywb.54.2018.08.13.03.09.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Aug 2018 03:09:47 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Aug 2018 11:09:32 +0100
Message-Id: <20180813100936.23663-6-git@andred.net>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180813100936.23663-1-git@andred.net>
References: <20180813100936.23663-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-java][PATCH 5/9] openjdk-8: gcc-8 fix #1: backport patch to fix misuses of strncpy/strncat
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
X-List-Received-Date: Mon, 13 Aug 2018 10:09:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

The original approach doesn't work with all compilers, as
not all compilers support the flag used to suppress the
warnings / errors.

This patch here avoids passing unsupported compiler options
into older compilers, and at the same time fixes the bugs,
rather than just silencing the compiler.

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 .../openjdk/openjdk-8-release-16xbyy.inc      |   1 +
 ...-patch-to-fix-misuses-of-strncpy-str.patch | 181 ++++++++++++++++++
 2 files changed, 182 insertions(+)
 create mode 100644 recipes-core/openjdk/patches-openjdk-8/0011-hotspot-backport-patch-to-fix-misuses-of-strncpy-str.patch

diff --git a/recipes-core/openjdk/openjdk-8-release-16xbyy.inc b/recipes-core/openjdk/openjdk-8-release-16xbyy.inc
index 36ce073..bd440c6 100644
--- a/recipes-core/openjdk/openjdk-8-release-16xbyy.inc
+++ b/recipes-core/openjdk/openjdk-8-release-16xbyy.inc
@@ -17,6 +17,7 @@ PATCHES_URI = "\
     file://0009-jdk-disable-backtrace-musl-build-fix.patch \
     file://0010-build-fix-build-on-as-needed-toolchains-generic.patch \
     file://hotspot_fix_gcc8x_build.patch \
+    file://0011-hotspot-backport-patch-to-fix-misuses-of-strncpy-str.patch \
 "
 # some patches extracted from http://cr.openjdk.java.net/~rkennke/shark-build-hotspot/webrev.01/hotspot.patch
 # reported via http://mail.openjdk.java.net/pipermail/build-dev/2015-January/013972.html
diff --git a/recipes-core/openjdk/patches-openjdk-8/0011-hotspot-backport-patch-to-fix-misuses-of-strncpy-str.patch b/recipes-core/openjdk/patches-openjdk-8/0011-hotspot-backport-patch-to-fix-misuses-of-strncpy-str.patch
new file mode 100644
index 0000000..4ab0d7a
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-8/0011-hotspot-backport-patch-to-fix-misuses-of-strncpy-str.patch
@@ -0,0 +1,181 @@
+From cc8fb308b36d323ee8a1e3a60e4c2ac006f710ab Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
+Date: Fri, 10 Aug 2018 14:54:45 +0100
+Subject: [PATCH] hotspot: backport patch to fix misuses of strncpy/strncat
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Various small fixes around strncpy and strncat
+
+Compilation using gcc >= 8 fails because of errors regarding
+misuse of string functions.
+Fix them using a backport from openjdk-10
+
+Modelled after http://hg.openjdk.java.net/jdk-updates/jdk10u/rev/b1608535e50f
+
+Signed-off-by: André Draszik <andre.draszik@jci.com>
+
+---
+Upstream-Status: Backport [http://hg.openjdk.java.net/jdk-updates/jdk10u/rev/b1608535e50f]
+ hotspot/agent/src/os/linux/libproc_impl.c       |  7 ++++++-
+ hotspot/src/share/tools/hsdis/hsdis.c           |  1 +
+ hotspot/src/share/vm/compiler/compileBroker.hpp |  3 ++-
+ hotspot/src/share/vm/compiler/disassembler.cpp  |  1 +
+ hotspot/src/share/vm/runtime/arguments.cpp      | 13 ++++++-------
+ hotspot/src/share/vm/utilities/ostream.cpp      | 14 +++++++++-----
+ hotspot/src/share/vm/utilities/vmError.cpp      |  9 +--------
+ 7 files changed, 26 insertions(+), 22 deletions(-)
+
+diff --git a/hotspot/agent/src/os/linux/libproc_impl.c b/hotspot/agent/src/os/linux/libproc_impl.c
+index 2ea0d0f8..ab23fb16 100644
+--- a/hotspot/agent/src/os/linux/libproc_impl.c
++++ b/hotspot/agent/src/os/linux/libproc_impl.c
+@@ -162,7 +162,12 @@ lib_info* add_lib_info_fd(struct ps_prochandle* ph, const char* libname, int fd,
+       return NULL;
+    }
+ 
+-   strncpy(newlib->name, libname, sizeof(newlib->name));
++   if (strlen(libname) >= sizeof(newlib->name)) {
++     print_debug("libname %s too long\n", libname);
++     return NULL;
++   }
++   strcpy(newlib->name, libname);
++
+    newlib->base = base;
+ 
+    if (fd == -1) {
+diff --git a/hotspot/src/share/tools/hsdis/hsdis.c b/hotspot/src/share/tools/hsdis/hsdis.c
+index b56330e4..4e6fd9af 100644
+--- a/hotspot/src/share/tools/hsdis/hsdis.c
++++ b/hotspot/src/share/tools/hsdis/hsdis.c
+@@ -410,6 +410,7 @@ static void parse_caller_options(struct hsdis_app_data* app_data, const char* ca
+     }
+     p = q;
+   }
++  *iop = '\0';
+ }
+ 
+ static void print_help(struct hsdis_app_data* app_data,
+diff --git a/hotspot/src/share/vm/compiler/compileBroker.hpp b/hotspot/src/share/vm/compiler/compileBroker.hpp
+index 7a381cd3..2aea6dd1 100644
+--- a/hotspot/src/share/vm/compiler/compileBroker.hpp
++++ b/hotspot/src/share/vm/compiler/compileBroker.hpp
+@@ -173,7 +173,8 @@ class CompilerCounters : public CHeapObj<mtCompiler> {
+     // these methods should be called in a thread safe context
+ 
+     void set_current_method(const char* method) {
+-      strncpy(_current_method, method, (size_t)cmname_buffer_length);
++      strncpy(_current_method, method, (size_t)cmname_buffer_length-1);
++      _current_method[cmname_buffer_length-1] = '\0';
+       if (UsePerfData) _perf_current_method->set_value(method);
+     }
+ 
+diff --git a/hotspot/src/share/vm/compiler/disassembler.cpp b/hotspot/src/share/vm/compiler/disassembler.cpp
+index 69974763..111214a9 100644
+--- a/hotspot/src/share/vm/compiler/disassembler.cpp
++++ b/hotspot/src/share/vm/compiler/disassembler.cpp
+@@ -298,6 +298,7 @@ address decode_env::handle_event(const char* event, address arg) {
+         strlen((const char*)arg) > sizeof(buffer) - 1) {
+       // Only print this when the mach changes
+       strncpy(buffer, (const char*)arg, sizeof(buffer) - 1);
++      buffer[sizeof(buffer) - 1] = '\0';
+       output()->print_cr("[Disassembling for mach='%s']", arg);
+     }
+   } else if (match(event, "format bytes-per-line")) {
+diff --git a/hotspot/src/share/vm/runtime/arguments.cpp b/hotspot/src/share/vm/runtime/arguments.cpp
+index cccff7a8..7589b443 100644
+--- a/hotspot/src/share/vm/runtime/arguments.cpp
++++ b/hotspot/src/share/vm/runtime/arguments.cpp
+@@ -3430,7 +3430,7 @@ void Arguments::fix_appclasspath() {
+     }
+ 
+     char* copy = AllocateHeap(strlen(src) + 1, mtInternal);
+-    strncpy(copy, src, strlen(src) + 1);
++    strcpy(copy, src);
+ 
+     // trim all trailing empty paths
+     for (char* tail = copy + strlen(copy) - 1; tail >= copy && *tail == separator; tail--) {
+@@ -3804,17 +3804,16 @@ static char* get_shared_archive_path() {
+     if (end != NULL) *end = '\0';
+     size_t jvm_path_len = strlen(jvm_path);
+     size_t file_sep_len = strlen(os::file_separator());
+-    shared_archive_path = NEW_C_HEAP_ARRAY(char, jvm_path_len +
+-        file_sep_len + 20, mtInternal);
++    const size_t len = jvm_path_len + file_sep_len + 20;
++    shared_archive_path = NEW_C_HEAP_ARRAY(char, len, mtInternal);
+     if (shared_archive_path != NULL) {
+-      strncpy(shared_archive_path, jvm_path, jvm_path_len + 1);
+-      strncat(shared_archive_path, os::file_separator(), file_sep_len);
+-      strncat(shared_archive_path, "classes.jsa", 11);
++      jio_snprintf(shared_archive_path, len, "%s%sclasses.jsa",
++        jvm_path, os::file_separator());
+     }
+   } else {
+     shared_archive_path = NEW_C_HEAP_ARRAY(char, strlen(SharedArchiveFile) + 1, mtInternal);
+     if (shared_archive_path != NULL) {
+-      strncpy(shared_archive_path, SharedArchiveFile, strlen(SharedArchiveFile) + 1);
++      strcpy(shared_archive_path, SharedArchiveFile);
+     }
+   }
+   return shared_archive_path;
+diff --git a/hotspot/src/share/vm/utilities/ostream.cpp b/hotspot/src/share/vm/utilities/ostream.cpp
+index 44ce683d..bc3773fe 100644
+--- a/hotspot/src/share/vm/utilities/ostream.cpp
++++ b/hotspot/src/share/vm/utilities/ostream.cpp
+@@ -112,7 +112,7 @@ const char* outputStream::do_vsnprintf(char* buffer, size_t buflen,
+   }
+   if (add_cr) {
+     if (result != buffer) {
+-      strncpy(buffer, result, buflen);
++      memcpy(buffer, result, result_len);
+       result = buffer;
+     }
+     buffer[result_len++] = '\n';
+@@ -337,15 +337,19 @@ void stringStream::write(const char* s, size_t len) {
+       assert(rm == NULL || Thread::current()->current_resource_mark() == rm,
+              "stringStream is re-allocated with a different ResourceMark");
+       buffer = NEW_RESOURCE_ARRAY(char, end);
+-      strncpy(buffer, oldbuf, buffer_pos);
++      if (buffer_pos > 0) {
++        memcpy(buffer, oldbuf, buffer_pos);
++      }
+       buffer_length = end;
+     }
+   }
+   // invariant: buffer is always null-terminated
+   guarantee(buffer_pos + write_len + 1 <= buffer_length, "stringStream oob");
+-  buffer[buffer_pos + write_len] = 0;
+-  strncpy(buffer + buffer_pos, s, write_len);
+-  buffer_pos += write_len;
++  if (write_len > 0) {
++    buffer[buffer_pos + write_len] = 0;
++    memcpy(buffer + buffer_pos, s, write_len);
++    buffer_pos += write_len;
++  }
+ 
+   // Note that the following does not depend on write_len.
+   // This means that position and count get updated
+diff --git a/hotspot/src/share/vm/utilities/vmError.cpp b/hotspot/src/share/vm/utilities/vmError.cpp
+index 15f6bf48..4ab85f5d 100644
+--- a/hotspot/src/share/vm/utilities/vmError.cpp
++++ b/hotspot/src/share/vm/utilities/vmError.cpp
+@@ -421,14 +421,7 @@ void VMError::report(outputStream* st) {
+ #else
+          const char *file = _filename;
+ #endif
+-         size_t len = strlen(file);
+-         size_t buflen = sizeof(buf);
+-
+-         strncpy(buf, file, buflen);
+-         if (len + 10 < buflen) {
+-           sprintf(buf + len, ":%d", _lineno);
+-         }
+-         st->print(" (%s)", buf);
++         st->print(" (%s:%d)", file, _lineno);
+        } else {
+          st->print(" (0x%x)", _id);
+        }
+-- 
+2.18.0
+
-- 
2.18.0


