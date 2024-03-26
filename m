Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC86ECD11DD
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 01:50:54 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.9270.1711417854198782913
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Mar 2024 18:50:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j+aW9mrF;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5cedfc32250so3127139a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 18:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711417853; x=1712022653; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o4xsyS2ZqZ+Lt5N95KT8KErncNbxKza9djtKEdT6WPU=;
        b=j+aW9mrF9cTaPxzTI1Xg8W5NXKggubA5a9was/mucb4YgL0zS6HNyHxB+yfVFz72tE
         lrHwp0L+nZE1NIbYipO1M9Lk0gAfoY4TmcO0DtR8YcsDVXxVW6ocj+hJmBKGfzPbCZ+H
         UlsHvnxP7SMmj4vP3ZViuaSOyjA/0dvyuoGokkAx+pHuS/Q/V1ARhy9ZbuvSjhjR8m2L
         AX1bB8eeofdCpaVBKyjO0yttC4CLji4+eggqSP9rBTjY3K7frN4LdLYcmWTpZd0Ecg59
         AmiJP964fjpcdxZoX3T2UnKh+vKG4MlecQb//+DktbEGde7UzS8UU2HLUSBcUr4ef8MS
         ke6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711417853; x=1712022653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o4xsyS2ZqZ+Lt5N95KT8KErncNbxKza9djtKEdT6WPU=;
        b=kMSlFn+b+oD3mik39QSU61+WdH14gkQdaWZk+KZdV4tPAgZpFQir4bwKNeECQjl9bN
         GFsKW/pQgDsEnm+5bmoSexoHGDvY1wuejzgw8ebB6HKJL7mPyt/CBEQ5gEp6R14h5qWX
         Tbb/PCFokb3JeWLFqVqaAMpXs1zkdk0f3lhmApuTgpaBIkXEndmQhTuXG5oJrZexzA5d
         UgmEHvfWvPVMlsv7B2PEdOy0ZSXMmpTVvvl7ZF9tnn5T3XP3FraMWTBpY+93fWWgGLVu
         IzwjrgJJbNOv3h8ASGolzRavDC1dKsQPWBs4RJKINfAyLy24cGubSaatNkqEMfpWWZrR
         HRTA==
X-Gm-Message-State: AOJu0Yyv7rlFHMz0ENPlxxGqKqWEhSBCs3V3JUiMhUkYyRe++g+SXqcC
	G/2CU9AV3YBiImkWpySb/YedWL5OO4bwj2EhQuHG+poRk+ZAQU3hx+B4NzZ0
X-Google-Smtp-Source: AGHT+IH7Vq7PLsUEhEbKqoFyPhmZuCSPmM2QirbvAEzv0WxnjvrQvN7iz1USHRXiZQeeM5VSwqEWow==
X-Received: by 2002:a05:6a20:4a9a:b0:1a3:4a1d:1092 with SMTP id fn26-20020a056a204a9a00b001a34a1d1092mr6998371pzb.35.1711417851895;
        Mon, 25 Mar 2024 18:50:51 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::5eba])
        by smtp.gmail.com with ESMTPSA id n1-20020a170902e54100b001dcfc68e7desm5425070plf.75.2024.03.25.18.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 18:50:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 03/10] sdbus-c++-libsystemd: Upgrade to 255.4 release of systemd
Date: Mon, 25 Mar 2024 18:50:38 -0700
Message-ID: <20240326015047.543274-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240326015047.543274-1-raj.khem@gmail.com>
References: <20240326015047.543274-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Mar 2024 01:50:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109613

Synchronise musl patches with oe-core

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-missing_type.h-add-comparison_fn_t.patch} |  10 +-
 ...-parse_printf_format-implementation.patch} |  27 +-
 ...tall-dependency-links-at-install-tim.patch |  79 ++++++
 ...issing.h-check-for-missing-strndupa.patch} | 157 ++++++-----
 ...B_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch} |  19 +-
 ...05-add-missing-FTW_-macros-for-musl.patch} |  10 +-
 ...6-Use-uintmax_t-for-handling-rlim_t.patch} |  23 +-
 ..._SYMLINK_NOFOLLOW-flag-to-faccessat.patch} |  10 +-
 ...patible-basename-for-non-glibc-syste.patch |  34 +++
 ...implment-systemd-sysv-install-for-OE.patch |  43 +++
 ...ffering-when-writing-to-oom_score_a.patch} |  10 +-
 ...ompliant-strerror_r-from-GNU-specif.patch} |  12 +-
 ...efinition-of-prctl_mm_map-structure.patch} |   8 +-
 ...not-disable-buffer-in-writing-files.patch} | 255 ++++++++++++++----
 ...tch => 0013-Handle-__cpu_mask-usage.patch} |  11 +-
 ...atch => 0014-Handle-missing-gshadow.patch} |  10 +-
 ....h-Define-MIPS-ABI-defines-for-musl.patch} |  10 +-
 ...ss-correct-parameters-to-getdents64.patch} |   6 +-
 ...tch => 0017-Adjust-for-musl-headers.patch} |  92 ++++---
 ...patible-basename-for-non-glibc-syste.patch |  34 ---
 ...rerror-is-assumed-to-be-GNU-specifi.patch} |  10 +-
 ...til-Make-STRERROR-portable-for-musl.patch} |  17 +-
 ...ke-malloc_trim-conditional-on-glibc.patch} |  18 +-
 ...ared-Do-not-use-malloc_info-on-musl.patch} |  15 +-
 ...22-avoid-missing-LOCK_EX-declaration.patch |  43 +++
 .../sdbus-c++/sdbus-c++-libsystemd_254.4.bb   |  74 -----
 .../sdbus-c++/sdbus-c++-libsystemd_255.4.bb   |  77 ++++++
 27 files changed, 760 insertions(+), 354 deletions(-)
 rename meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/{0009-missing_type.h-add-comparison_fn_t.patch => 0001-missing_type.h-add-comparison_fn_t.patch} (89%)
 rename meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/{0010-add-fallback-parse_printf_format-implementation.patch => 0002-add-fallback-parse_printf_format-implementation.patch} (93%)
 create mode 100644 meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
 rename meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/{0011-src-basic-missing.h-check-for-missing-strndupa.patch => 0003-src-basic-missing.h-check-for-missing-strndupa.patch} (86%)
 rename meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/{0012-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch => 0004-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch} (90%)
 rename meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/{0013-add-missing-FTW_-macros-for-musl.patch => 0005-add-missing-FTW_-macros-for-musl.patch} (84%)
 rename meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/{0014-Use-uintmax_t-for-handling-rlim_t.patch => 0006-Use-uintmax_t-for-handling-rlim_t.patch} (83%)
 rename meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/{0016-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch => 0007-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch} (95%)
 create mode 100644 meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0008-Define-glibc-compatible-basename-for-non-glibc-syste.patch
 create mode 100644 meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0008-implment-systemd-sysv-install-for-OE.patch
 rename meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/{0018-Do-not-disable-buffering-when-writing-to-oom_score_a.patch => 0009-Do-not-disable-buffering-when-writing-to-oom_score_a.patch} (82%)
 rename meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/{0019-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch => 0010-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch} (89%)
 rename meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/{0020-avoid-redefinition-of-prctl_mm_map-structure.patch => 0011-avoid-redefinition-of-prctl_mm_map-structure.patch} (79%)
 rename meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/{0021-do-not-disable-buffer-in-writing-files.patch => 0012-do-not-disable-buffer-in-writing-files.patch} (55%)
 rename meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/{0022-Handle-__cpu_mask-usage.patch => 0013-Handle-__cpu_mask-usage.patch} (83%)
 rename meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/{0023-Handle-missing-gshadow.patch => 0014-Handle-missing-gshadow.patch} (96%)
 rename meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/{0024-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch => 0015-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch} (84%)
 rename meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/{0005-pass-correct-parameters-to-getdents64.patch => 0016-pass-correct-parameters-to-getdents64.patch} (92%)
 rename meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/{0001-Adjust-for-musl-headers.patch => 0017-Adjust-for-musl-headers.patch} (89%)
 delete mode 100644 meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0017-Define-glibc-compatible-basename-for-non-glibc-syste.patch
 rename meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/{0006-test-bus-error-strerror-is-assumed-to-be-GNU-specifi.patch => 0018-test-bus-error-strerror-is-assumed-to-be-GNU-specifi.patch} (89%)
 rename meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/{0003-errno-util-Make-STRERROR-portable-for-musl.patch => 0019-errno-util-Make-STRERROR-portable-for-musl.patch} (81%)
 rename meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/{0028-sd-event-Make-malloc_trim-conditional-on-glibc.patch => 0020-sd-event-Make-malloc_trim-conditional-on-glibc.patch} (85%)
 rename meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/{0029-shared-Do-not-use-malloc_info-on-musl.patch => 0021-shared-Do-not-use-malloc_info-on-musl.patch} (68%)
 create mode 100644 meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0022-avoid-missing-LOCK_EX-declaration.patch
 delete mode 100644 meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_254.4.bb
 create mode 100644 meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_255.4.bb

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0009-missing_type.h-add-comparison_fn_t.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0001-missing_type.h-add-comparison_fn_t.patch
similarity index 89%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0009-missing_type.h-add-comparison_fn_t.patch
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0001-missing_type.h-add-comparison_fn_t.patch
index e50b47a5a0..2aa5dee6b5 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0009-missing_type.h-add-comparison_fn_t.patch
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0001-missing_type.h-add-comparison_fn_t.patch
@@ -1,7 +1,7 @@
-From 542f999a846dfd49d9373d30fffb2a44168d7b5e Mon Sep 17 00:00:00 2001
+From 01195eb9f7d59139fb45df506ac6b3968c14a57f Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 13:55:12 +0800
-Subject: [PATCH] missing_type.h: add comparison_fn_t
+Subject: [PATCH 01/22] missing_type.h: add comparison_fn_t
 
 Make it work with musl where comparison_fn_t and is not provided.
 
@@ -33,7 +33,7 @@ index f6233090a9..6c0456349d 100644
 +typedef int (*comparison_fn_t)(const void *, const void *);
 +#endif
 diff --git a/src/basic/sort-util.h b/src/basic/sort-util.h
-index f0bf246aa3..33669c7a75 100644
+index 9c818bd747..ef10c8be2c 100644
 --- a/src/basic/sort-util.h
 +++ b/src/basic/sort-util.h
 @@ -4,6 +4,7 @@
@@ -45,7 +45,7 @@ index f0bf246aa3..33669c7a75 100644
  /* This is the same as glibc's internal __compar_d_fn_t type. glibc exports a public comparison_fn_t, for the
   * external type __compar_fn_t, but doesn't do anything similar for __compar_d_fn_t. Let's hence do that
 diff --git a/src/libsystemd/sd-journal/catalog.c b/src/libsystemd/sd-journal/catalog.c
-index 7527abf636..f33383e57f 100644
+index ae91534198..7f67eea38b 100644
 --- a/src/libsystemd/sd-journal/catalog.c
 +++ b/src/libsystemd/sd-journal/catalog.c
 @@ -28,6 +28,7 @@
@@ -57,5 +57,5 @@ index 7527abf636..f33383e57f 100644
  const char * const catalog_file_dirs[] = {
          "/usr/local/lib/systemd/catalog/",
 -- 
-2.39.2
+2.34.1
 
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0010-add-fallback-parse_printf_format-implementation.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0002-add-fallback-parse_printf_format-implementation.patch
similarity index 93%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0010-add-fallback-parse_printf_format-implementation.patch
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0002-add-fallback-parse_printf_format-implementation.patch
index 4143ab4d70..900a931632 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0010-add-fallback-parse_printf_format-implementation.patch
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0002-add-fallback-parse_printf_format-implementation.patch
@@ -1,7 +1,7 @@
-From 383e85e15f16a46aac925aa439b8b60f58b40aa6 Mon Sep 17 00:00:00 2001
+From 872b72739e62123867ce6c4f82aa37de24cc3f75 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Sat, 22 May 2021 20:26:24 +0200
-Subject: [PATCH] add fallback parse_printf_format implementation
+Subject: [PATCH 02/22] add fallback parse_printf_format implementation
 
 Upstream-Status: Inappropriate [musl specific]
 
@@ -21,9 +21,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  create mode 100644 src/basic/parse-printf-format.c
  create mode 100644 src/basic/parse-printf-format.h
 
+diff --git a/meson.build b/meson.build
+index 7419e2b0b0..01fd3ffc19 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -781,6 +781,7 @@ endif
+@@ -725,6 +725,7 @@ endif
  foreach header : ['crypt.h',
                    'linux/memfd.h',
                    'linux/vm_sockets.h',
@@ -31,9 +33,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
                    'sys/auxv.h',
                    'threads.h',
                    'valgrind/memcheck.h',
+diff --git a/src/basic/meson.build b/src/basic/meson.build
+index d7450d8b44..c3e3daf4bd 100644
 --- a/src/basic/meson.build
 +++ b/src/basic/meson.build
-@@ -179,6 +179,11 @@ endforeach
+@@ -183,6 +183,11 @@ endforeach
  
  basic_sources += generated_gperf_headers
  
@@ -45,6 +49,9 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  ############################################################
  
  arch_list = [
+diff --git a/src/basic/parse-printf-format.c b/src/basic/parse-printf-format.c
+new file mode 100644
+index 0000000000..49437e5445
 --- /dev/null
 +++ b/src/basic/parse-printf-format.c
 @@ -0,0 +1,273 @@
@@ -321,6 +328,9 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
 +
 +        return last;
 +}
+diff --git a/src/basic/parse-printf-format.h b/src/basic/parse-printf-format.h
+new file mode 100644
+index 0000000000..47be7522d7
 --- /dev/null
 +++ b/src/basic/parse-printf-format.h
 @@ -0,0 +1,57 @@
@@ -381,6 +391,8 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
 +size_t parse_printf_format(const char *fmt, size_t n, int *types);
 +
 +#endif /* HAVE_PRINTF_H */
+diff --git a/src/basic/stdio-util.h b/src/basic/stdio-util.h
+index 4e93ac90c9..f9deb6f662 100644
 --- a/src/basic/stdio-util.h
 +++ b/src/basic/stdio-util.h
 @@ -1,12 +1,12 @@
@@ -397,6 +409,8 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  
  _printf_(3, 4)
  static inline char *snprintf_ok(char *buf, size_t len, const char *format, ...) {
+diff --git a/src/libsystemd/sd-journal/journal-send.c b/src/libsystemd/sd-journal/journal-send.c
+index be23b2fe75..69a2eb6404 100644
 --- a/src/libsystemd/sd-journal/journal-send.c
 +++ b/src/libsystemd/sd-journal/journal-send.c
 @@ -2,7 +2,6 @@
@@ -407,7 +421,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  #include <stddef.h>
  #include <sys/un.h>
  #include <unistd.h>
-@@ -27,6 +26,7 @@
+@@ -28,6 +27,7 @@
  #include "stdio-util.h"
  #include "string-util.h"
  #include "tmpfile-util.h"
@@ -415,3 +429,6 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  
  #define SNDBUF_SIZE (8*1024*1024)
  
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
new file mode 100644
index 0000000000..be231cf6b2
--- /dev/null
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
@@ -0,0 +1,79 @@
+From 29a58009a172e369ad7166e16dab2f4945c6b0d2 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Thu, 21 Feb 2019 16:23:24 +0800
+Subject: [PATCH 1/2] binfmt: Don't install dependency links at install time
+ for the binfmt services
+
+use [Install] blocks so that they get created when the service is enabled
+like a traditional service.
+
+The [Install] blocks were rejected upstream as they don't have a way to
+"enable" it on install without static symlinks which can't be disabled,
+only masked. We however can do that in a postinst.
+
+Upstream-Status: Denied
+
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+[rebased for systemd 243]
+Signed-off-by: Scott Murray <scott.murray@konsulko.com>
+---
+ units/meson.build                       | 2 --
+ units/proc-sys-fs-binfmt_misc.automount | 3 +++
+ units/systemd-binfmt.service.in         | 4 ++++
+ 3 files changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/units/meson.build b/units/meson.build
+index e7bfb7f838..1d5ec4b178 100644
+--- a/units/meson.build
++++ b/units/meson.build
+@@ -154,7 +154,6 @@ units = [
+         {
+           'file' : 'proc-sys-fs-binfmt_misc.automount',
+           'conditions' : ['ENABLE_BINFMT'],
+-          'symlinks' : ['sysinit.target.wants/'],
+         },
+         {
+           'file' : 'proc-sys-fs-binfmt_misc.mount',
+@@ -251,7 +250,6 @@ units = [
+         {
+           'file' : 'systemd-binfmt.service.in',
+           'conditions' : ['ENABLE_BINFMT'],
+-          'symlinks' : ['sysinit.target.wants/'],
+         },
+         {
+           'file' : 'systemd-bless-boot.service.in',
+diff --git a/units/proc-sys-fs-binfmt_misc.automount b/units/proc-sys-fs-binfmt_misc.automount
+index 5d212015a5..6c2900ca77 100644
+--- a/units/proc-sys-fs-binfmt_misc.automount
++++ b/units/proc-sys-fs-binfmt_misc.automount
+@@ -22,3 +22,6 @@ Before=shutdown.target
+ 
+ [Automount]
+ Where=/proc/sys/fs/binfmt_misc
++
++[Install]
++WantedBy=sysinit.target
+diff --git a/units/systemd-binfmt.service.in b/units/systemd-binfmt.service.in
+index 6861c76674..531e9fbd90 100644
+--- a/units/systemd-binfmt.service.in
++++ b/units/systemd-binfmt.service.in
+@@ -14,6 +14,7 @@ Documentation=https://docs.kernel.org/admin-guide/binfmt-misc.html
+ Documentation=https://www.freedesktop.org/wiki/Software/systemd/APIFileSystems
+ DefaultDependencies=no
+ Conflicts=shutdown.target
++Wants=proc-sys-fs-binfmt_misc.automount
+ After=proc-sys-fs-binfmt_misc.automount
+ After=proc-sys-fs-binfmt_misc.mount
+ After=local-fs.target
+@@ -31,3 +32,6 @@ RemainAfterExit=yes
+ ExecStart={{LIBEXECDIR}}/systemd-binfmt
+ ExecStop={{LIBEXECDIR}}/systemd-binfmt --unregister
+ TimeoutSec=90s
++
++[Install]
++WantedBy=sysinit.target
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0011-src-basic-missing.h-check-for-missing-strndupa.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0003-src-basic-missing.h-check-for-missing-strndupa.patch
similarity index 86%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0011-src-basic-missing.h-check-for-missing-strndupa.patch
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0003-src-basic-missing.h-check-for-missing-strndupa.patch
index ec451cddb7..5595b5bc23 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0011-src-basic-missing.h-check-for-missing-strndupa.patch
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0003-src-basic-missing.h-check-for-missing-strndupa.patch
@@ -1,7 +1,7 @@
-From ee5c8b494a3269edd154a0b799a03b39dba2ceb0 Mon Sep 17 00:00:00 2001
+From 87f1d38f40c5fe9cadf2b2de442473e4e5605788 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 14:18:21 +0800
-Subject: [PATCH] src/basic/missing.h: check for missing strndupa
+Subject: [PATCH 03/22] src/basic/missing.h: check for missing strndupa
 
 include missing.h  for definition of strndupa
 
@@ -18,6 +18,8 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
 [Rebased for v247]
 Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
 [Rebased for v254]
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+[Rebased for v255.1]
 ---
  meson.build                                |  1 +
  src/backlight/backlight.c                  |  1 +
@@ -66,16 +68,17 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  src/shared/pager.c                         |  1 +
  src/socket-proxy/socket-proxyd.c           |  1 +
  src/test/test-hexdecoct.c                  |  1 +
+ src/udev/udev-builtin-net_id.c             |  1 +
  src/udev/udev-builtin-path_id.c            |  1 +
  src/udev/udev-event.c                      |  1 +
  src/udev/udev-rules.c                      |  1 +
- 50 files changed, 61 insertions(+)
+ 51 files changed, 62 insertions(+)
 
 diff --git a/meson.build b/meson.build
-index fb96143c37..739b2f7f72 100644
+index 01fd3ffc19..61a872b753 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -595,6 +595,7 @@ foreach ident : ['secure_getenv', '__secure_getenv']
+@@ -567,6 +567,7 @@ foreach ident : ['secure_getenv', '__secure_getenv']
  endforeach
  
  foreach ident : [
@@ -84,10 +87,10 @@ index fb96143c37..739b2f7f72 100644
          ['gettid',            '''#include <sys/types.h>
                                   #include <unistd.h>'''],
 diff --git a/src/backlight/backlight.c b/src/backlight/backlight.c
-index e66477f328..2613d1e3f9 100644
+index 5ac9f904a9..99d5122dd7 100644
 --- a/src/backlight/backlight.c
 +++ b/src/backlight/backlight.c
-@@ -19,6 +19,7 @@
+@@ -20,6 +20,7 @@
  #include "string-util.h"
  #include "strv.h"
  #include "terminal-util.h"
@@ -96,7 +99,7 @@ index e66477f328..2613d1e3f9 100644
  #define PCI_CLASS_GRAPHICS_CARD 0x30000
  
 diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
-index feda596939..11b4375ed5 100644
+index 18b16ecc0e..d2be79622f 100644
 --- a/src/basic/cgroup-util.c
 +++ b/src/basic/cgroup-util.c
 @@ -38,6 +38,7 @@
@@ -105,10 +108,10 @@ index feda596939..11b4375ed5 100644
  #include "xattr-util.h"
 +#include "missing_stdlib.h"
  
- static int cg_enumerate_items(const char *controller, const char *path, FILE **_f, const char *item) {
+ static int cg_enumerate_items(const char *controller, const char *path, FILE **ret, const char *item) {
          _cleanup_free_ char *fs = NULL;
 diff --git a/src/basic/env-util.c b/src/basic/env-util.c
-index 55ac11a512..7ccb1d7887 100644
+index d3bf73385f..16b17358ca 100644
 --- a/src/basic/env-util.c
 +++ b/src/basic/env-util.c
 @@ -19,6 +19,7 @@
@@ -120,7 +123,7 @@ index 55ac11a512..7ccb1d7887 100644
  /* We follow bash for the character set. Different shells have different rules. */
  #define VALID_BASH_ENV_NAME_CHARS               \
 diff --git a/src/basic/log.c b/src/basic/log.c
-index fc5793139e..515218fca8 100644
+index 1470611a75..9924ec2b9a 100644
 --- a/src/basic/log.c
 +++ b/src/basic/log.c
 @@ -40,6 +40,7 @@
@@ -152,10 +155,10 @@ index 8c76f93eb2..9068bfb4f0 100644
 +  })
 +#endif
 diff --git a/src/basic/mkdir.c b/src/basic/mkdir.c
-index 7ad19ee33b..cc1d5e1e5b 100644
+index c770e5ed32..1fd8816cd0 100644
 --- a/src/basic/mkdir.c
 +++ b/src/basic/mkdir.c
-@@ -15,6 +15,7 @@
+@@ -16,6 +16,7 @@
  #include "stat-util.h"
  #include "stdio-util.h"
  #include "user-util.h"
@@ -164,7 +167,7 @@ index 7ad19ee33b..cc1d5e1e5b 100644
  int mkdirat_safe_internal(
                  int dir_fd,
 diff --git a/src/basic/mountpoint-util.c b/src/basic/mountpoint-util.c
-index bc74fbef8f..cdb609bb84 100644
+index bf67f7e01a..409f8d8a73 100644
 --- a/src/basic/mountpoint-util.c
 +++ b/src/basic/mountpoint-util.c
 @@ -18,6 +18,7 @@
@@ -176,7 +179,7 @@ index bc74fbef8f..cdb609bb84 100644
  #include "nulstr-util.h"
  #include "parse-util.h"
 diff --git a/src/basic/parse-util.c b/src/basic/parse-util.c
-index 3445d31307..d82b4415d9 100644
+index 0430e33e40..f3728de026 100644
 --- a/src/basic/parse-util.c
 +++ b/src/basic/parse-util.c
 @@ -18,6 +18,7 @@
@@ -188,7 +191,7 @@ index 3445d31307..d82b4415d9 100644
  int parse_boolean(const char *v) {
          if (!v)
 diff --git a/src/basic/path-lookup.c b/src/basic/path-lookup.c
-index c99e9d8786..71a917a0b0 100644
+index 4e3d59fc56..726e240df0 100644
 --- a/src/basic/path-lookup.c
 +++ b/src/basic/path-lookup.c
 @@ -16,6 +16,7 @@
@@ -212,7 +215,7 @@ index cab9d0eaea..5f6ca258e9 100644
  static int parse_parts_value_whole(const char *p, const char *symbol) {
          const char *pc, *n;
 diff --git a/src/basic/proc-cmdline.c b/src/basic/proc-cmdline.c
-index eea70d8606..ae3abd8402 100644
+index 522d8de1f4..7c129dc0fc 100644
 --- a/src/basic/proc-cmdline.c
 +++ b/src/basic/proc-cmdline.c
 @@ -16,6 +16,7 @@
@@ -224,7 +227,7 @@ index eea70d8606..ae3abd8402 100644
  int proc_cmdline_filter_pid1_args(char **argv, char ***ret) {
          enum {
 diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
-index bcba5a5208..64a95dd866 100644
+index d7cfcd9105..6cb0ddf575 100644
 --- a/src/basic/procfs-util.c
 +++ b/src/basic/procfs-util.c
 @@ -12,6 +12,7 @@
@@ -236,7 +239,7 @@ index bcba5a5208..64a95dd866 100644
  int procfs_get_pid_max(uint64_t *ret) {
          _cleanup_free_ char *value = NULL;
 diff --git a/src/basic/time-util.c b/src/basic/time-util.c
-index b700f364ef..48a26bcec9 100644
+index f9014dc560..1d7840a5b5 100644
 --- a/src/basic/time-util.c
 +++ b/src/basic/time-util.c
 @@ -27,6 +27,7 @@
@@ -248,7 +251,7 @@ index b700f364ef..48a26bcec9 100644
  static clockid_t map_clock_id(clockid_t c) {
  
 diff --git a/src/boot/bless-boot.c b/src/boot/bless-boot.c
-index 59f02b761a..7496646350 100644
+index 0c0b4f23c7..68fe5ca509 100644
 --- a/src/boot/bless-boot.c
 +++ b/src/boot/bless-boot.c
 @@ -22,6 +22,7 @@
@@ -260,22 +263,22 @@ index 59f02b761a..7496646350 100644
  static char **arg_path = NULL;
  
 diff --git a/src/core/dbus-cgroup.c b/src/core/dbus-cgroup.c
-index b5484eda78..54ed62c790 100644
+index 4237e694c0..05f9d9d9a9 100644
 --- a/src/core/dbus-cgroup.c
 +++ b/src/core/dbus-cgroup.c
-@@ -23,6 +23,7 @@
+@@ -25,6 +25,7 @@
  #include "parse-util.h"
  #include "path-util.h"
  #include "percent-util.h"
 +#include "missing_stdlib.h"
  #include "socket-util.h"
  
- BUS_DEFINE_PROPERTY_GET(bus_property_get_tasks_max, "t", TasksMax, tasks_max_resolve);
+ BUS_DEFINE_PROPERTY_GET(bus_property_get_tasks_max, "t", CGroupTasksMax, cgroup_tasks_max_resolve);
 diff --git a/src/core/dbus-execute.c b/src/core/dbus-execute.c
-index f514b8fd12..4febd0d496 100644
+index 4daa1cefd3..2c77901471 100644
 --- a/src/core/dbus-execute.c
 +++ b/src/core/dbus-execute.c
-@@ -48,6 +48,7 @@
+@@ -42,6 +42,7 @@
  #include "unit-printf.h"
  #include "user-util.h"
  #include "utf8.h"
@@ -284,7 +287,7 @@ index f514b8fd12..4febd0d496 100644
  BUS_DEFINE_PROPERTY_GET_ENUM(bus_property_get_exec_output, exec_output, ExecOutput);
  static BUS_DEFINE_PROPERTY_GET_ENUM(property_get_exec_input, exec_input, ExecInput);
 diff --git a/src/core/dbus-util.c b/src/core/dbus-util.c
-index edfa0eb69a..6fd2ec9062 100644
+index d680a64268..e59f48103e 100644
 --- a/src/core/dbus-util.c
 +++ b/src/core/dbus-util.c
 @@ -9,6 +9,7 @@
@@ -296,19 +299,19 @@ index edfa0eb69a..6fd2ec9062 100644
  int bus_property_get_triggered_unit(
                  sd_bus *bus,
 diff --git a/src/core/execute.c b/src/core/execute.c
-index 853e87450f..8ef76de9ab 100644
+index ef0bf88687..bd3da0c401 100644
 --- a/src/core/execute.c
 +++ b/src/core/execute.c
-@@ -113,6 +113,7 @@
+@@ -72,6 +72,7 @@
  #include "unit-serialize.h"
  #include "user-util.h"
  #include "utmp-wtmp.h"
 +#include "missing_stdlib.h"
  
- #define IDLE_TIMEOUT_USEC (5*USEC_PER_SEC)
- #define IDLE_TIMEOUT2_USEC (1*USEC_PER_SEC)
+ static bool is_terminal_input(ExecInput i) {
+         return IN_SET(i,
 diff --git a/src/core/kmod-setup.c b/src/core/kmod-setup.c
-index e843743777..e149807492 100644
+index b8e3f7aadd..8ce8ca68d8 100644
 --- a/src/core/kmod-setup.c
 +++ b/src/core/kmod-setup.c
 @@ -13,6 +13,7 @@
@@ -320,7 +323,7 @@ index e843743777..e149807492 100644
  #if HAVE_KMOD
  #include "module-util.h"
 diff --git a/src/core/service.c b/src/core/service.c
-index 9ad3c3d995..b112d64919 100644
+index b9eb40c555..268fe7573b 100644
 --- a/src/core/service.c
 +++ b/src/core/service.c
 @@ -45,6 +45,7 @@
@@ -332,7 +335,7 @@ index 9ad3c3d995..b112d64919 100644
  #define service_spawn(...) service_spawn_internal(__func__, __VA_ARGS__)
  
 diff --git a/src/coredump/coredump-vacuum.c b/src/coredump/coredump-vacuum.c
-index c6e201ecf2..ab034475e2 100644
+index 7e0c98cb7d..978a7f5874 100644
 --- a/src/coredump/coredump-vacuum.c
 +++ b/src/coredump/coredump-vacuum.c
 @@ -17,6 +17,7 @@
@@ -344,7 +347,7 @@ index c6e201ecf2..ab034475e2 100644
  #define DEFAULT_MAX_USE_LOWER (uint64_t) (1ULL*1024ULL*1024ULL)           /* 1 MiB */
  #define DEFAULT_MAX_USE_UPPER (uint64_t) (4ULL*1024ULL*1024ULL*1024ULL)   /* 4 GiB */
 diff --git a/src/fstab-generator/fstab-generator.c b/src/fstab-generator/fstab-generator.c
-index efc553b698..acea922311 100644
+index 016f3baa7f..b1def81313 100644
 --- a/src/fstab-generator/fstab-generator.c
 +++ b/src/fstab-generator/fstab-generator.c
 @@ -37,6 +37,7 @@
@@ -356,10 +359,10 @@ index efc553b698..acea922311 100644
  typedef enum MountPointFlags {
          MOUNT_NOAUTO    = 1 << 0,
 diff --git a/src/journal-remote/journal-remote-main.c b/src/journal-remote/journal-remote-main.c
-index 7df264fb53..9463a0e9fb 100644
+index da0f20d3ce..f22ce41908 100644
 --- a/src/journal-remote/journal-remote-main.c
 +++ b/src/journal-remote/journal-remote-main.c
-@@ -26,6 +26,7 @@
+@@ -27,6 +27,7 @@
  #include "stat-util.h"
  #include "string-table.h"
  #include "strv.h"
@@ -368,7 +371,7 @@ index 7df264fb53..9463a0e9fb 100644
  #define PRIV_KEY_FILE CERTIFICATE_ROOT "/private/journal-remote.pem"
  #define CERT_FILE     CERTIFICATE_ROOT "/certs/journal-remote.pem"
 diff --git a/src/journal/journalctl.c b/src/journal/journalctl.c
-index da0fac548e..c1c043e0e0 100644
+index 7f3dcd56a4..41b7cbaaf1 100644
 --- a/src/journal/journalctl.c
 +++ b/src/journal/journalctl.c
 @@ -77,6 +77,7 @@
@@ -380,7 +383,7 @@ index da0fac548e..c1c043e0e0 100644
  #define DEFAULT_FSS_INTERVAL_USEC (15*USEC_PER_MINUTE)
  #define PROCESS_INOTIFY_INTERVAL 1024   /* Every 1,024 messages processed */
 diff --git a/src/libsystemd/sd-bus/bus-message.c b/src/libsystemd/sd-bus/bus-message.c
-index 9719f97c02..75decd9834 100644
+index ff0228081f..9066fcb133 100644
 --- a/src/libsystemd/sd-bus/bus-message.c
 +++ b/src/libsystemd/sd-bus/bus-message.c
 @@ -19,6 +19,7 @@
@@ -392,7 +395,7 @@ index 9719f97c02..75decd9834 100644
  static int message_append_basic(sd_bus_message *m, char type, const void *p, const void **stored);
  static int message_parse_fields(sd_bus_message *m);
 diff --git a/src/libsystemd/sd-bus/bus-objects.c b/src/libsystemd/sd-bus/bus-objects.c
-index 2ad7a9993d..bba72f99f4 100644
+index c25c40ff37..57a5da704f 100644
 --- a/src/libsystemd/sd-bus/bus-objects.c
 +++ b/src/libsystemd/sd-bus/bus-objects.c
 @@ -11,6 +11,7 @@
@@ -404,10 +407,10 @@ index 2ad7a9993d..bba72f99f4 100644
  static int node_vtable_get_userdata(
                  sd_bus *bus,
 diff --git a/src/libsystemd/sd-bus/bus-socket.c b/src/libsystemd/sd-bus/bus-socket.c
-index 64037e4fe0..9b9ce0aaa9 100644
+index 3c59d0d615..746922d46f 100644
 --- a/src/libsystemd/sd-bus/bus-socket.c
 +++ b/src/libsystemd/sd-bus/bus-socket.c
-@@ -28,6 +28,7 @@
+@@ -29,6 +29,7 @@
  #include "string-util.h"
  #include "user-util.h"
  #include "utf8.h"
@@ -416,7 +419,7 @@ index 64037e4fe0..9b9ce0aaa9 100644
  #define SNDBUF_SIZE (8*1024*1024)
  
 diff --git a/src/libsystemd/sd-bus/sd-bus.c b/src/libsystemd/sd-bus/sd-bus.c
-index f6a5e4aa06..b36faa79a3 100644
+index 4a0259f8bb..aaa90d2223 100644
 --- a/src/libsystemd/sd-bus/sd-bus.c
 +++ b/src/libsystemd/sd-bus/sd-bus.c
 @@ -46,6 +46,7 @@
@@ -428,19 +431,19 @@ index f6a5e4aa06..b36faa79a3 100644
  #define log_debug_bus_message(m)                                         \
          do {                                                             \
 diff --git a/src/libsystemd/sd-bus/test-bus-benchmark.c b/src/libsystemd/sd-bus/test-bus-benchmark.c
-index 1eb6edd329..d434a3c178 100644
+index d988588de0..458df8df9a 100644
 --- a/src/libsystemd/sd-bus/test-bus-benchmark.c
 +++ b/src/libsystemd/sd-bus/test-bus-benchmark.c
-@@ -13,6 +13,7 @@
- #include "missing_resource.h"
+@@ -14,6 +14,7 @@
  #include "string-util.h"
+ #include "tests.h"
  #include "time-util.h"
 +#include "missing_stdlib.h"
  
  #define MAX_SIZE (2*1024*1024)
  
 diff --git a/src/libsystemd/sd-journal/sd-journal.c b/src/libsystemd/sd-journal/sd-journal.c
-index 9947947ef2..8dc6f93159 100644
+index 6b9ff0a4ed..4a5027ad0f 100644
 --- a/src/libsystemd/sd-journal/sd-journal.c
 +++ b/src/libsystemd/sd-journal/sd-journal.c
 @@ -44,6 +44,7 @@
@@ -452,19 +455,19 @@ index 9947947ef2..8dc6f93159 100644
  #define JOURNAL_FILES_RECHECK_USEC (2 * USEC_PER_SEC)
  
 diff --git a/src/login/pam_systemd.c b/src/login/pam_systemd.c
-index ba2fca32c6..e1f9caa13b 100644
+index b8da266e27..4bb8dd9496 100644
 --- a/src/login/pam_systemd.c
 +++ b/src/login/pam_systemd.c
-@@ -34,6 +34,7 @@
- #include "locale-util.h"
+@@ -35,6 +35,7 @@
  #include "login-util.h"
  #include "macro.h"
+ #include "missing_syscall.h"
 +#include "missing_stdlib.h"
  #include "pam-util.h"
  #include "parse-util.h"
  #include "path-util.h"
 diff --git a/src/network/generator/network-generator.c b/src/network/generator/network-generator.c
-index 1090934bfc..69a77f66e2 100644
+index 48527a2c73..9777fe0561 100644
 --- a/src/network/generator/network-generator.c
 +++ b/src/network/generator/network-generator.c
 @@ -14,6 +14,7 @@
@@ -476,7 +479,7 @@ index 1090934bfc..69a77f66e2 100644
  /*
    # .network
 diff --git a/src/nspawn/nspawn-settings.c b/src/nspawn/nspawn-settings.c
-index 05bde1c756..aa29587868 100644
+index 161b1c1c70..ba1c459f78 100644
 --- a/src/nspawn/nspawn-settings.c
 +++ b/src/nspawn/nspawn-settings.c
 @@ -16,6 +16,7 @@
@@ -500,7 +503,7 @@ index c64e79bdff..eda26b0b9a 100644
  static void setup_logging_once(void) {
          static pthread_once_t once = PTHREAD_ONCE_INIT;
 diff --git a/src/portable/portable.c b/src/portable/portable.c
-index 7811833fac..c6414da91c 100644
+index d4b448a627..bb26623565 100644
 --- a/src/portable/portable.c
 +++ b/src/portable/portable.c
 @@ -40,6 +40,7 @@
@@ -512,7 +515,7 @@ index 7811833fac..c6414da91c 100644
  /* Markers used in the first line of our 20-portable.conf unit file drop-in to determine, that a) the unit file was
   * dropped there by the portable service logic and b) for which image it was dropped there. */
 diff --git a/src/resolve/resolvectl.c b/src/resolve/resolvectl.c
-index 2638e985fb..82c903fd66 100644
+index afa537f160..32ccee4ae5 100644
 --- a/src/resolve/resolvectl.c
 +++ b/src/resolve/resolvectl.c
 @@ -48,6 +48,7 @@
@@ -524,7 +527,7 @@ index 2638e985fb..82c903fd66 100644
  static int arg_family = AF_UNSPEC;
  static int arg_ifindex = 0;
 diff --git a/src/shared/bus-get-properties.c b/src/shared/bus-get-properties.c
-index 8b4f66b22e..5926e4c61b 100644
+index 53e5d6b99f..851ecd5644 100644
 --- a/src/shared/bus-get-properties.c
 +++ b/src/shared/bus-get-properties.c
 @@ -4,6 +4,7 @@
@@ -548,10 +551,10 @@ index 8b462b5627..183ce1c18e 100644
  struct CGroupInfo {
          char *cgroup_path;
 diff --git a/src/shared/bus-unit-util.c b/src/shared/bus-unit-util.c
-index 1e95e36678..640ee031d5 100644
+index 4ee9706847..30c8084847 100644
 --- a/src/shared/bus-unit-util.c
 +++ b/src/shared/bus-unit-util.c
-@@ -51,6 +51,7 @@
+@@ -50,6 +50,7 @@
  #include "unit-def.h"
  #include "user-util.h"
  #include "utf8.h"
@@ -560,7 +563,7 @@ index 1e95e36678..640ee031d5 100644
  int bus_parse_unit_info(sd_bus_message *message, UnitInfo *u) {
          assert(message);
 diff --git a/src/shared/bus-util.c b/src/shared/bus-util.c
-index d09ec5148d..f38a8f7cc1 100644
+index 4123152d93..74f148c8b4 100644
 --- a/src/shared/bus-util.c
 +++ b/src/shared/bus-util.c
 @@ -24,6 +24,7 @@
@@ -572,7 +575,7 @@ index d09ec5148d..f38a8f7cc1 100644
  static int name_owner_change_callback(sd_bus_message *m, void *userdata, sd_bus_error *ret_error) {
          sd_event *e = ASSERT_PTR(userdata);
 diff --git a/src/shared/dns-domain.c b/src/shared/dns-domain.c
-index 620b156563..5ee5b09186 100644
+index b41c9b06ca..e69050a507 100644
 --- a/src/shared/dns-domain.c
 +++ b/src/shared/dns-domain.c
 @@ -18,6 +18,7 @@
@@ -584,7 +587,7 @@ index 620b156563..5ee5b09186 100644
  int dns_label_unescape(const char **name, char *dest, size_t sz, DNSLabelFlags flags) {
          const char *n;
 diff --git a/src/shared/journal-importer.c b/src/shared/journal-importer.c
-index d9eabec886..534c6cf7e3 100644
+index 83e9834bbf..74eaae6f5e 100644
 --- a/src/shared/journal-importer.c
 +++ b/src/shared/journal-importer.c
 @@ -16,6 +16,7 @@
@@ -596,7 +599,7 @@ index d9eabec886..534c6cf7e3 100644
  enum {
          IMPORTER_STATE_LINE = 0,    /* waiting to read, or reading line */
 diff --git a/src/shared/logs-show.c b/src/shared/logs-show.c
-index b72e516c8d..6e832b74c3 100644
+index a5d04003bd..10392c132d 100644
 --- a/src/shared/logs-show.c
 +++ b/src/shared/logs-show.c
 @@ -41,6 +41,7 @@
@@ -608,7 +611,7 @@ index b72e516c8d..6e832b74c3 100644
  /* up to three lines (each up to 100 characters) or 300 characters, whichever is less */
  #define PRINT_LINE_THRESHOLD 3
 diff --git a/src/shared/pager.c b/src/shared/pager.c
-index 6ed35a3ca9..99d9d36140 100644
+index 19deefab56..6b6d0af1a0 100644
 --- a/src/shared/pager.c
 +++ b/src/shared/pager.c
 @@ -25,6 +25,7 @@
@@ -620,7 +623,7 @@ index 6ed35a3ca9..99d9d36140 100644
  static pid_t pager_pid = 0;
  
 diff --git a/src/socket-proxy/socket-proxyd.c b/src/socket-proxy/socket-proxyd.c
-index 821049e667..08a5bdae3d 100644
+index 287fd6c181..8f8d5493da 100644
 --- a/src/socket-proxy/socket-proxyd.c
 +++ b/src/socket-proxy/socket-proxyd.c
 @@ -27,6 +27,7 @@
@@ -632,7 +635,7 @@ index 821049e667..08a5bdae3d 100644
  #define BUFFER_SIZE (256 * 1024)
  
 diff --git a/src/test/test-hexdecoct.c b/src/test/test-hexdecoct.c
-index 9d71db6ae1..a9938c1e6e 100644
+index f884008660..987e180697 100644
 --- a/src/test/test-hexdecoct.c
 +++ b/src/test/test-hexdecoct.c
 @@ -7,6 +7,7 @@
@@ -643,8 +646,20 @@ index 9d71db6ae1..a9938c1e6e 100644
  #include "tests.h"
  
  TEST(hexchar) {
+diff --git a/src/udev/udev-builtin-net_id.c b/src/udev/udev-builtin-net_id.c
+index 91b40088f4..f528a46b8e 100644
+--- a/src/udev/udev-builtin-net_id.c
++++ b/src/udev/udev-builtin-net_id.c
+@@ -39,6 +39,7 @@
+ #include "strv.h"
+ #include "strxcpyx.h"
+ #include "udev-builtin.h"
++#include "missing_stdlib.h"
+ 
+ #define ONBOARD_14BIT_INDEX_MAX ((1U << 14) - 1)
+ #define ONBOARD_16BIT_INDEX_MAX ((1U << 16) - 1)
 diff --git a/src/udev/udev-builtin-path_id.c b/src/udev/udev-builtin-path_id.c
-index 8e4d57ee72..6b4555b4d5 100644
+index 467c9a6ad3..f74dae60af 100644
 --- a/src/udev/udev-builtin-path_id.c
 +++ b/src/udev/udev-builtin-path_id.c
 @@ -24,6 +24,7 @@
@@ -656,22 +671,22 @@ index 8e4d57ee72..6b4555b4d5 100644
  _printf_(2,3)
  static void path_prepend(char **path, const char *fmt, ...) {
 diff --git a/src/udev/udev-event.c b/src/udev/udev-event.c
-index ec4ad30824..bc40303a46 100644
+index ed22c8b679..19ebe20237 100644
 --- a/src/udev/udev-event.c
 +++ b/src/udev/udev-event.c
-@@ -34,6 +34,7 @@
+@@ -16,6 +16,7 @@
  #include "udev-util.h"
  #include "udev-watch.h"
  #include "user-util.h"
 +#include "missing_stdlib.h"
  
- typedef struct Spawn {
-         sd_device *device;
+ UdevEvent *udev_event_new(sd_device *dev, usec_t exec_delay_usec, sd_netlink *rtnl, int log_level) {
+         UdevEvent *event;
 diff --git a/src/udev/udev-rules.c b/src/udev/udev-rules.c
-index 5bd09a64d1..0ce79f815c 100644
+index 5f12002394..febe345b4c 100644
 --- a/src/udev/udev-rules.c
 +++ b/src/udev/udev-rules.c
-@@ -35,6 +35,7 @@
+@@ -41,6 +41,7 @@
  #include "udev-util.h"
  #include "user-util.h"
  #include "virt.h"
@@ -680,5 +695,5 @@ index 5bd09a64d1..0ce79f815c 100644
  #define RULES_DIRS ((const char* const*) CONF_PATHS_STRV("udev/rules.d"))
  
 -- 
-2.39.2
+2.34.1
 
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0012-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0004-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
similarity index 90%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0012-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0004-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
index 0d69e8e9cd..15877bea88 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0012-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0004-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
@@ -1,7 +1,8 @@
-From 747ff78ecda6afe01c7eab4d7c27aea6af810c86 Mon Sep 17 00:00:00 2001
+From 5325ab5813617f35f03806ec420829dde7104387 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 14:56:21 +0800
-Subject: [PATCH] don't fail if GLOB_BRACE and GLOB_ALTDIRFUNC is not defined
+Subject: [PATCH 04/22] don't fail if GLOB_BRACE and GLOB_ALTDIRFUNC is not
+ defined
 
 If the standard library doesn't provide brace
 expansion users just won't get it.
@@ -23,7 +24,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  3 files changed, 38 insertions(+)
 
 diff --git a/src/basic/glob-util.c b/src/basic/glob-util.c
-index fd60a6eda2..c73edc41ea 100644
+index 802ca8c655..23818a67c6 100644
 --- a/src/basic/glob-util.c
 +++ b/src/basic/glob-util.c
 @@ -12,6 +12,12 @@
@@ -114,7 +115,7 @@ index 9b3e73cce0..3790ba3be5 100644
  
          (void) rm_rf(template, REMOVE_ROOT|REMOVE_PHYSICAL);
 diff --git a/src/tmpfiles/tmpfiles.c b/src/tmpfiles/tmpfiles.c
-index 458aed7054..2cf24b38c0 100644
+index 230ec09b97..2cc5f391d7 100644
 --- a/src/tmpfiles/tmpfiles.c
 +++ b/src/tmpfiles/tmpfiles.c
 @@ -73,6 +73,12 @@
@@ -130,9 +131,9 @@ index 458aed7054..2cf24b38c0 100644
  /* This reads all files listed in /etc/tmpfiles.d/?*.conf and creates
   * them in the file system. This is intended to be used to create
   * properly owned directories beneath /tmp, /var/tmp, /run, which are
-@@ -2355,7 +2361,9 @@ finish:
+@@ -2434,7 +2440,9 @@ finish:
  
- static int glob_item(Item *i, action_t action) {
+ static int glob_item(Context *c, Item *i, action_t action) {
          _cleanup_globfree_ glob_t g = {
 +#ifdef GLOB_ALTDIRFUNC
                  .gl_opendir = (void *(*)(const char *)) opendir_nomod,
@@ -140,9 +141,9 @@ index 458aed7054..2cf24b38c0 100644
          };
          int r = 0, k;
  
-@@ -2375,7 +2383,9 @@ static int glob_item(Item *i, action_t action) {
+@@ -2461,7 +2469,9 @@ static int glob_item_recursively(
+                 fdaction_t action) {
  
- static int glob_item_recursively(Item *i, fdaction_t action) {
          _cleanup_globfree_ glob_t g = {
 +#ifdef GLOB_ALTDIRFUNC
                  .gl_opendir = (void *(*)(const char *)) opendir_nomod,
@@ -151,5 +152,5 @@ index 458aed7054..2cf24b38c0 100644
          int r = 0, k;
  
 -- 
-2.39.2
+2.34.1
 
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0013-add-missing-FTW_-macros-for-musl.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0005-add-missing-FTW_-macros-for-musl.patch
similarity index 84%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0013-add-missing-FTW_-macros-for-musl.patch
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0005-add-missing-FTW_-macros-for-musl.patch
index d6aaadc006..a1dfca22cd 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0013-add-missing-FTW_-macros-for-musl.patch
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0005-add-missing-FTW_-macros-for-musl.patch
@@ -1,7 +1,7 @@
-From efd7b41cf270c7b07ee3b9aec0fedd8e52dd422f Mon Sep 17 00:00:00 2001
+From dad7f897c0de654fa5592fda3e90f874639849f9 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:00:06 +0800
-Subject: [PATCH] add missing FTW_ macros for musl
+Subject: [PATCH 05/22] add missing FTW_ macros for musl
 
 This is to avoid build failures like below for musl.
 
@@ -28,10 +28,10 @@ index 6c0456349d..73a5b90e3c 100644
 +#define FTW_CONTINUE 0
 +#endif
 diff --git a/src/test/test-recurse-dir.c b/src/test/test-recurse-dir.c
-index 2c2120b136..bc60a178a2 100644
+index 8684d064ec..70fc2b5376 100644
 --- a/src/test/test-recurse-dir.c
 +++ b/src/test/test-recurse-dir.c
-@@ -6,6 +6,7 @@
+@@ -8,6 +8,7 @@
  #include "recurse-dir.h"
  #include "strv.h"
  #include "tests.h"
@@ -40,5 +40,5 @@ index 2c2120b136..bc60a178a2 100644
  static char **list_nftw = NULL;
  
 -- 
-2.39.2
+2.34.1
 
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0014-Use-uintmax_t-for-handling-rlim_t.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0006-Use-uintmax_t-for-handling-rlim_t.patch
similarity index 83%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0014-Use-uintmax_t-for-handling-rlim_t.patch
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0006-Use-uintmax_t-for-handling-rlim_t.patch
index 2071f4fb20..4be14b72ec 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0014-Use-uintmax_t-for-handling-rlim_t.patch
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0006-Use-uintmax_t-for-handling-rlim_t.patch
@@ -1,7 +1,7 @@
-From 60f7d2c62bc3718023df93c01688d3ee1625d64d Mon Sep 17 00:00:00 2001
+From 96e975a2412a20e5f80bd3ab144057d275eb8597 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:12:41 +0800
-Subject: [PATCH] Use uintmax_t for handling rlim_t
+Subject: [PATCH 06/22] Use uintmax_t for handling rlim_t
 
 PRIu{32,64} is not right format to represent rlim_t type
 therefore use %ju and typecast the rlim_t variables to
@@ -26,9 +26,11 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  src/core/execute.c      |  4 ++--
  3 files changed, 9 insertions(+), 15 deletions(-)
 
+diff --git a/src/basic/format-util.h b/src/basic/format-util.h
+index 8719df3e29..9becc96066 100644
 --- a/src/basic/format-util.h
 +++ b/src/basic/format-util.h
-@@ -34,13 +34,7 @@ assert_cc(sizeof(gid_t) == sizeof(uint32
+@@ -34,13 +34,7 @@ assert_cc(sizeof(gid_t) == sizeof(uint32_t));
  #  error Unknown timex member size
  #endif
  
@@ -43,9 +45,11 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  
  #if SIZEOF_DEV_T == 8
  #  define DEV_FMT "%" PRIu64
+diff --git a/src/basic/rlimit-util.c b/src/basic/rlimit-util.c
+index c1f0b2b974..61c5412582 100644
 --- a/src/basic/rlimit-util.c
 +++ b/src/basic/rlimit-util.c
-@@ -44,7 +44,7 @@ int setrlimit_closest(int resource, cons
+@@ -44,7 +44,7 @@ int setrlimit_closest(int resource, const struct rlimit *rlim) {
              fixed.rlim_max == highest.rlim_max)
                  return 0;
  
@@ -54,7 +58,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  
          return RET_NERRNO(setrlimit(resource, &fixed));
  }
-@@ -307,13 +307,13 @@ int rlimit_format(const struct rlimit *r
+@@ -307,13 +307,13 @@ int rlimit_format(const struct rlimit *rl, char **ret) {
          if (rl->rlim_cur >= RLIM_INFINITY && rl->rlim_max >= RLIM_INFINITY)
                  r = free_and_strdup(&s, "infinity");
          else if (rl->rlim_cur >= RLIM_INFINITY)
@@ -72,7 +76,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
          if (r < 0)
                  return -ENOMEM;
  
-@@ -407,7 +407,7 @@ int rlimit_nofile_safe(void) {
+@@ -422,7 +422,7 @@ int rlimit_nofile_safe(void) {
          rl.rlim_max = MIN(rl.rlim_max, (rlim_t) read_nr_open());
          rl.rlim_cur = MIN((rlim_t) FD_SETSIZE, rl.rlim_max);
          if (setrlimit(RLIMIT_NOFILE, &rl) < 0)
@@ -81,9 +85,11 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  
          return 1;
  }
+diff --git a/src/core/execute.c b/src/core/execute.c
+index bd3da0c401..df1870fd2f 100644
 --- a/src/core/execute.c
 +++ b/src/core/execute.c
-@@ -6707,9 +6707,9 @@ void exec_context_dump(const ExecContext
+@@ -1045,9 +1045,9 @@ void exec_context_dump(const ExecContext *c, FILE* f, const char *prefix) {
          for (unsigned i = 0; i < RLIM_NLIMITS; i++)
                  if (c->rlimit[i]) {
                          fprintf(f, "%sLimit%s: " RLIM_FMT "\n",
@@ -95,3 +101,6 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
                  }
  
          if (c->ioprio_set) {
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0016-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0007-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
similarity index 95%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0016-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0007-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
index 543fba7cdb..8d6084239e 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0016-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0007-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
@@ -1,7 +1,7 @@
-From 26b02348e39fe72b73dd61bba8a0cefb0352717d Mon Sep 17 00:00:00 2001
+From 4842cff4f1329f0b5034b529d56f8ad1f234ac4c Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 10 Oct 2017 14:33:30 -0700
-Subject: [PATCH] don't pass AT_SYMLINK_NOFOLLOW flag to faccessat()
+Subject: [PATCH 07/22] don't pass AT_SYMLINK_NOFOLLOW flag to faccessat()
 
 Avoid using AT_SYMLINK_NOFOLLOW flag. It doesn't seem like the right
 thing to do and it's not portable (not supported by musl). See:
@@ -31,7 +31,7 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
  2 files changed, 23 insertions(+), 4 deletions(-)
 
 diff --git a/src/basic/fs-util.h b/src/basic/fs-util.h
-index 932d003f19..33215dbf5f 100644
+index 1023ab73ca..c78ff6f27f 100644
 --- a/src/basic/fs-util.h
 +++ b/src/basic/fs-util.h
 @@ -49,8 +49,27 @@ int futimens_opath(int fd, const struct timespec ts[2]);
@@ -64,7 +64,7 @@ index 932d003f19..33215dbf5f 100644
  int touch_file(const char *path, bool parents, usec_t stamp, uid_t uid, gid_t gid, mode_t mode);
  
 diff --git a/src/shared/base-filesystem.c b/src/shared/base-filesystem.c
-index be6dd1654a..2726dc946a 100644
+index 569ef466c3..7ae921a113 100644
 --- a/src/shared/base-filesystem.c
 +++ b/src/shared/base-filesystem.c
 @@ -145,7 +145,7 @@ int base_filesystem_create_fd(int fd, const char *root, uid_t uid, gid_t gid) {
@@ -95,5 +95,5 @@ index be6dd1654a..2726dc946a 100644
                                  }
  
 -- 
-2.39.2
+2.34.1
 
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0008-Define-glibc-compatible-basename-for-non-glibc-syste.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0008-Define-glibc-compatible-basename-for-non-glibc-syste.patch
new file mode 100644
index 0000000000..c1a8bb19fe
--- /dev/null
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0008-Define-glibc-compatible-basename-for-non-glibc-syste.patch
@@ -0,0 +1,34 @@
+From bab07e779ff23d5593bb118efaaa31b60a6dce87 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 27 May 2018 08:36:44 -0700
+Subject: [PATCH 08/22] Define glibc compatible basename() for non-glibc
+ systems
+
+Fixes builds with musl, even though systemd is adamant about
+using non-posix basename implementation, we have a way out
+
+Upstream-Status: Inappropriate [musl specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/basic/string-util.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/basic/string-util.h b/src/basic/string-util.h
+index b6d8be3083..0a29036c4c 100644
+--- a/src/basic/string-util.h
++++ b/src/basic/string-util.h
+@@ -26,6 +26,10 @@
+ #define URI_UNRESERVED      ALPHANUMERICAL "-._~"       /* [RFC3986] */
+ #define URI_VALID           URI_RESERVED URI_UNRESERVED /* [RFC3986] */
+ 
++#if !defined(__GLIBC__)
++#define basename(src) (strrchr(src,'/') ? strrchr(src,'/')+1 : src)
++#endif
++
+ static inline char* strstr_ptr(const char *haystack, const char *needle) {
+         if (!haystack || !needle)
+                 return NULL;
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0008-implment-systemd-sysv-install-for-OE.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0008-implment-systemd-sysv-install-for-OE.patch
new file mode 100644
index 0000000000..acff18dc43
--- /dev/null
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0008-implment-systemd-sysv-install-for-OE.patch
@@ -0,0 +1,43 @@
+From 5712d56f1cd654d2e5d2e9117ff77fe4c299f76b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 5 Sep 2015 06:31:47 +0000
+Subject: [PATCH] implment systemd-sysv-install for OE
+
+Use update-rc.d for enabling/disabling and status command
+to check the status of the sysv service
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/systemctl/systemd-sysv-install.SKELETON | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/systemctl/systemd-sysv-install.SKELETON b/src/systemctl/systemd-sysv-install.SKELETON
+index cb58d8243b..000bdf6165 100755
+--- a/src/systemctl/systemd-sysv-install.SKELETON
++++ b/src/systemctl/systemd-sysv-install.SKELETON
+@@ -34,17 +34,17 @@ case "$1" in
+     enable)
+         # call the command to enable SysV init script $NAME here
+         # (consider optional $ROOT)
+-        echo "IMPLEMENT ME: enabling SysV init.d script $NAME"
++        update-rc.d -f $NAME defaults
+         ;;
+     disable)
+         # call the command to disable SysV init script $NAME here
+         # (consider optional $ROOT)
+-        echo "IMPLEMENT ME: disabling SysV init.d script $NAME"
++        update-rc.d -f $NAME remove
+         ;;
+     is-enabled)
+         # exit with 0 if $NAME is enabled, non-zero if it is disabled
+         # (consider optional $ROOT)
+-        echo "IMPLEMENT ME: checking SysV init.d script $NAME"
++        /etc/init.d/$NAME status
+         ;;
+     *)
+         usage ;;
+-- 
+2.39.2
+
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0018-Do-not-disable-buffering-when-writing-to-oom_score_a.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0009-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
similarity index 82%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0018-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0009-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
index 8162bc2c57..3ff0177ae3 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0018-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0009-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
@@ -1,7 +1,7 @@
-From 32fd0dc67b6df531f0769dbb099dbe8f30c28514 Mon Sep 17 00:00:00 2001
+From 25093c5017725b8577c444dfea0f42ad85b43522 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 4 Jul 2018 15:00:44 +0800
-Subject: [PATCH] Do not disable buffering when writing to oom_score_adj
+Subject: [PATCH 09/22] Do not disable buffering when writing to oom_score_adj
 
 On musl, disabling buffering when writing to oom_score_adj will
 cause the following error.
@@ -24,10 +24,10 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/basic/process-util.c b/src/basic/process-util.c
-index 0747c14c1c..8d0c5aae92 100644
+index 201c5596ae..ea51595b6c 100644
 --- a/src/basic/process-util.c
 +++ b/src/basic/process-util.c
-@@ -1516,7 +1516,7 @@ int set_oom_score_adjust(int value) {
+@@ -1716,7 +1716,7 @@ int set_oom_score_adjust(int value) {
          xsprintf(t, "%i", value);
  
          return write_string_file("/proc/self/oom_score_adj", t,
@@ -37,5 +37,5 @@ index 0747c14c1c..8d0c5aae92 100644
  
  int get_oom_score_adjust(int *ret) {
 -- 
-2.39.2
+2.34.1
 
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0019-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0010-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
similarity index 89%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0019-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0010-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
index f6d908f947..cf59ac7d06 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0019-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0010-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
@@ -1,7 +1,7 @@
-From ed46afcbc6bc1f6277a0a54c3db8cf1b056bca1e Mon Sep 17 00:00:00 2001
+From 2adbe9773cd65c48eec9df96868d4a738927c8d9 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Tue, 10 Jul 2018 15:40:17 +0800
-Subject: [PATCH] distinguish XSI-compliant strerror_r from GNU-specifi
+Subject: [PATCH 10/22] distinguish XSI-compliant strerror_r from GNU-specifi
  strerror_r
 
 XSI-compliant strerror_r and GNU-specifi strerror_r are different.
@@ -24,7 +24,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  2 files changed, 15 insertions(+), 1 deletion(-)
 
 diff --git a/src/libsystemd/sd-bus/bus-error.c b/src/libsystemd/sd-bus/bus-error.c
-index 413e2dd43f..805e5da0c0 100644
+index 77b2e1a0fd..fdba0e0142 100644
 --- a/src/libsystemd/sd-bus/bus-error.c
 +++ b/src/libsystemd/sd-bus/bus-error.c
 @@ -408,7 +408,12 @@ static void bus_error_strerror(sd_bus_error *e, int error) {
@@ -55,10 +55,10 @@ index 413e2dd43f..805e5da0c0 100644
  
  static bool map_ok(const sd_bus_error_map *map) {
 diff --git a/src/libsystemd/sd-journal/journal-send.c b/src/libsystemd/sd-journal/journal-send.c
-index 136ebcb153..8a75ba4ecd 100644
+index 69a2eb6404..1561859650 100644
 --- a/src/libsystemd/sd-journal/journal-send.c
 +++ b/src/libsystemd/sd-journal/journal-send.c
-@@ -360,7 +360,12 @@ static int fill_iovec_perror_and_send(const char *message, int skip, struct iove
+@@ -361,7 +361,12 @@ static int fill_iovec_perror_and_send(const char *message, int skip, struct iove
                  char* j;
  
                  errno = 0;
@@ -72,5 +72,5 @@ index 136ebcb153..8a75ba4ecd 100644
                          char error[STRLEN("ERRNO=") + DECIMAL_STR_MAX(int) + 1];
  
 -- 
-2.39.2
+2.34.1
 
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0020-avoid-redefinition-of-prctl_mm_map-structure.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0011-avoid-redefinition-of-prctl_mm_map-structure.patch
similarity index 79%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0020-avoid-redefinition-of-prctl_mm_map-structure.patch
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0011-avoid-redefinition-of-prctl_mm_map-structure.patch
index e5f017347c..e481b2e2e4 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0020-avoid-redefinition-of-prctl_mm_map-structure.patch
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0011-avoid-redefinition-of-prctl_mm_map-structure.patch
@@ -1,7 +1,7 @@
-From 277b680d07a178b8278862b60417052d05c1376f Mon Sep 17 00:00:00 2001
+From 49c446cfb78cf74a909bed8c3798b77a5469866a Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:44:54 +0800
-Subject: [PATCH] avoid redefinition of prctl_mm_map structure
+Subject: [PATCH 11/22] avoid redefinition of prctl_mm_map structure
 
 Fix the following compile failure:
 error: redefinition of 'struct prctl_mm_map'
@@ -14,7 +14,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/src/basic/missing_prctl.h b/src/basic/missing_prctl.h
-index ab851306ba..5547cad875 100644
+index 7d9e395c92..88c2d7dfac 100644
 --- a/src/basic/missing_prctl.h
 +++ b/src/basic/missing_prctl.h
 @@ -1,7 +1,9 @@
@@ -28,5 +28,5 @@ index ab851306ba..5547cad875 100644
  /* 58319057b7847667f0c9585b9de0e8932b0fdb08 (4.3) */
  #ifndef PR_CAP_AMBIENT
 -- 
-2.39.2
+2.34.1
 
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0021-do-not-disable-buffer-in-writing-files.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0012-do-not-disable-buffer-in-writing-files.patch
similarity index 55%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0021-do-not-disable-buffer-in-writing-files.patch
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0012-do-not-disable-buffer-in-writing-files.patch
index c85087219c..66be79077e 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0021-do-not-disable-buffer-in-writing-files.patch
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0012-do-not-disable-buffer-in-writing-files.patch
@@ -1,7 +1,7 @@
-From aa6e5588e6d01c12e2f101d140cc710ab199df16 Mon Sep 17 00:00:00 2001
+From e4885a8e60f883d9217e26e1db3754c2906aca31 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Fri, 1 Mar 2019 15:22:15 +0800
-Subject: [PATCH] do not disable buffer in writing files
+Subject: [PATCH 12/22] do not disable buffer in writing files
 
 Do not disable buffer in writing files, otherwise we get
 failure at boot for musl like below.
@@ -19,6 +19,8 @@ Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
 [rebased for systemd 243]
 Signed-off-by: Scott Murray <scott.murray@konsulko.com>
 [rebased for systemd 254]
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+[rebased for systemd 255.1]
 ---
  src/basic/cgroup-util.c              | 12 ++++++------
  src/basic/namespace-util.c           |  4 ++--
@@ -34,17 +36,21 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  src/nspawn/nspawn.c                  |  6 +++---
  src/shared/binfmt-util.c             |  2 +-
  src/shared/cgroup-setup.c            |  4 ++--
- src/shared/coredump-util.c           |  2 +-
- src/shared/sleep-util.c              |  4 ++--
+ src/shared/coredump-util.c           |  4 ++--
+ src/shared/hibernate-util.c          |  4 ++--
  src/shared/smack-util.c              |  2 +-
+ src/shared/watchdog.c                |  2 +-
  src/sleep/sleep.c                    |  4 ++--
+ src/storagetm/storagetm.c            | 24 ++++++++++++------------
  src/udev/udev-rules.c                |  1 -
  src/vconsole/vconsole-setup.c        |  2 +-
- 20 files changed, 36 insertions(+), 37 deletions(-)
+ 22 files changed, 50 insertions(+), 51 deletions(-)
 
+diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
+index d2be79622f..e65fecb68d 100644
 --- a/src/basic/cgroup-util.c
 +++ b/src/basic/cgroup-util.c
-@@ -400,7 +400,7 @@ int cg_kill_kernel_sigkill(const char *c
+@@ -417,7 +417,7 @@ int cg_kill_kernel_sigkill(const char *path) {
          if (r < 0)
                  return r;
  
@@ -53,7 +59,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0)
                  return r;
  
-@@ -806,7 +806,7 @@ int cg_install_release_agent(const char
+@@ -843,7 +843,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
  
          sc = strstrip(contents);
          if (isempty(sc)) {
@@ -62,7 +68,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
                  if (r < 0)
                          return r;
          } else if (!path_equal(sc, agent))
-@@ -824,7 +824,7 @@ int cg_install_release_agent(const char
+@@ -861,7 +861,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
  
          sc = strstrip(contents);
          if (streq(sc, "0")) {
@@ -71,7 +77,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
                  if (r < 0)
                          return r;
  
-@@ -851,7 +851,7 @@ int cg_uninstall_release_agent(const cha
+@@ -888,7 +888,7 @@ int cg_uninstall_release_agent(const char *controller) {
          if (r < 0)
                  return r;
  
@@ -80,7 +86,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0)
                  return r;
  
-@@ -861,7 +861,7 @@ int cg_uninstall_release_agent(const cha
+@@ -898,7 +898,7 @@ int cg_uninstall_release_agent(const char *controller) {
          if (r < 0)
                  return r;
  
@@ -89,7 +95,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0)
                  return r;
  
-@@ -1764,7 +1764,7 @@ int cg_set_attribute(const char *control
+@@ -1814,7 +1814,7 @@ int cg_set_attribute(const char *controller, const char *path, const char *attri
          if (r < 0)
                  return r;
  
@@ -98,9 +104,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  }
  
  int cg_get_attribute(const char *controller, const char *path, const char *attribute, char **ret) {
+diff --git a/src/basic/namespace-util.c b/src/basic/namespace-util.c
+index 2101f617ad..63817bae17 100644
 --- a/src/basic/namespace-util.c
 +++ b/src/basic/namespace-util.c
-@@ -227,12 +227,12 @@ int userns_acquire(const char *uid_map,
+@@ -227,12 +227,12 @@ int userns_acquire(const char *uid_map, const char *gid_map) {
                  freeze();
  
          xsprintf(path, "/proc/" PID_FMT "/uid_map", pid);
@@ -115,9 +123,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0)
                  return log_error_errno(r, "Failed to write GID map: %m");
  
+diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
+index 6cb0ddf575..247cf9e1d1 100644
 --- a/src/basic/procfs-util.c
 +++ b/src/basic/procfs-util.c
-@@ -64,13 +64,13 @@ int procfs_tasks_set_limit(uint64_t limi
+@@ -64,13 +64,13 @@ int procfs_tasks_set_limit(uint64_t limit) {
           * decrease it, as threads-max is the much more relevant sysctl. */
          if (limit > pid_max-1) {
                  sprintf(buffer, "%" PRIu64, limit+1); /* Add one, since PID 0 is not a valid PID */
@@ -133,9 +143,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0) {
                  uint64_t threads_max;
  
+diff --git a/src/basic/sysctl-util.c b/src/basic/sysctl-util.c
+index b66a6622ae..8d1c93008a 100644
 --- a/src/basic/sysctl-util.c
 +++ b/src/basic/sysctl-util.c
-@@ -58,7 +58,7 @@ int sysctl_write(const char *property, c
+@@ -58,7 +58,7 @@ int sysctl_write(const char *property, const char *value) {
  
          log_debug("Setting '%s' to '%s'", p, value);
  
@@ -144,6 +156,8 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  }
  
  int sysctl_writef(const char *property, const char *format, ...) {
+diff --git a/src/binfmt/binfmt.c b/src/binfmt/binfmt.c
+index d21f3f79ff..258607cc7e 100644
 --- a/src/binfmt/binfmt.c
 +++ b/src/binfmt/binfmt.c
 @@ -30,7 +30,7 @@ static bool arg_unregister = false;
@@ -155,7 +169,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  }
  
  static int apply_rule(const char *filename, unsigned line, const char *rule) {
-@@ -58,7 +58,7 @@ static int apply_rule(const char *filena
+@@ -58,7 +58,7 @@ static int apply_rule(const char *filename, unsigned line, const char *rule) {
          if (r >= 0)
                  log_debug("%s:%u: Rule '%s' deleted.", filename, line, rulename);
  
@@ -164,7 +178,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0)
                  return log_error_errno(r, "%s:%u: Failed to add binary format '%s': %m",
                                         filename, line, rulename);
-@@ -244,7 +244,7 @@ static int run(int argc, char *argv[]) {
+@@ -248,7 +248,7 @@ static int run(int argc, char *argv[]) {
                          return r;
  
                  /* Flush out all rules */
@@ -173,9 +187,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
                  if (r < 0)
                          log_warning_errno(r, "Failed to flush binfmt_misc rules, ignoring: %m");
                  else
+diff --git a/src/core/cgroup.c b/src/core/cgroup.c
+index 61ac4df1a6..ea18970196 100644
 --- a/src/core/cgroup.c
 +++ b/src/core/cgroup.c
-@@ -4349,7 +4349,7 @@ int unit_cgroup_freezer_action(Unit *u,
+@@ -4578,7 +4578,7 @@ int unit_cgroup_freezer_action(Unit *u, FreezerAction action) {
                          u->freezer_state = FREEZER_THAWING;
          }
  
@@ -184,9 +200,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0)
                  return r;
  
+diff --git a/src/core/main.c b/src/core/main.c
+index 3f71cc0947..0e5aec3e9e 100644
 --- a/src/core/main.c
 +++ b/src/core/main.c
-@@ -1737,7 +1737,7 @@ static void initialize_core_pattern(bool
+@@ -1678,7 +1678,7 @@ static void initialize_core_pattern(bool skip_setup) {
          if (getpid_cached() != 1)
                  return;
  
@@ -195,9 +213,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0)
                  log_warning_errno(r, "Failed to write '%s' to /proc/sys/kernel/core_pattern, ignoring: %m",
                                    arg_early_core_pattern);
+diff --git a/src/core/smack-setup.c b/src/core/smack-setup.c
+index 7ea902b6f9..1aef2988d0 100644
 --- a/src/core/smack-setup.c
 +++ b/src/core/smack-setup.c
-@@ -319,17 +319,17 @@ int mac_smack_setup(bool *loaded_policy)
+@@ -321,17 +321,17 @@ int mac_smack_setup(bool *loaded_policy) {
          }
  
  #if HAVE_SMACK_RUN_LABEL
@@ -219,6 +239,8 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0)
                  log_warning_errno(r, "Failed to set SMACK netlabel rule \"127.0.0.1 -CIPSO\": %m");
  #endif
+diff --git a/src/home/homework.c b/src/home/homework.c
+index 066483e342..5f92dd7064 100644
 --- a/src/home/homework.c
 +++ b/src/home/homework.c
 @@ -278,7 +278,7 @@ static void drop_caches_now(void) {
@@ -230,9 +252,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0)
                  log_warning_errno(r, "Failed to drop caches, ignoring: %m");
          else
+diff --git a/src/libsystemd/sd-device/sd-device.c b/src/libsystemd/sd-device/sd-device.c
+index 2fbc619a34..09d9591e37 100644
 --- a/src/libsystemd/sd-device/sd-device.c
 +++ b/src/libsystemd/sd-device/sd-device.c
-@@ -2515,7 +2515,7 @@ _public_ int sd_device_set_sysattr_value
+@@ -2516,7 +2516,7 @@ _public_ int sd_device_set_sysattr_value(sd_device *device, const char *sysattr,
          if (!value)
                  return -ENOMEM;
  
@@ -241,9 +265,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0) {
                  /* On failure, clear cache entry, as we do not know how it fails. */
                  device_remove_cached_sysattr_value(device, sysattr);
+diff --git a/src/nspawn/nspawn-cgroup.c b/src/nspawn/nspawn-cgroup.c
+index a5002437c6..b12e6cd9c9 100644
 --- a/src/nspawn/nspawn-cgroup.c
 +++ b/src/nspawn/nspawn-cgroup.c
-@@ -122,7 +122,7 @@ int sync_cgroup(pid_t pid, CGroupUnified
+@@ -124,7 +124,7 @@ int sync_cgroup(pid_t pid, CGroupUnified unified_requested, uid_t uid_shift) {
          fn = strjoina(tree, cgroup, "/cgroup.procs");
  
          sprintf(pid_string, PID_FMT, pid);
@@ -252,9 +278,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0) {
                  log_error_errno(r, "Failed to move process: %m");
                  goto finish;
+diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
+index 6ab604d3dc..bbec6b686c 100644
 --- a/src/nspawn/nspawn.c
 +++ b/src/nspawn/nspawn.c
-@@ -2774,7 +2774,7 @@ static int reset_audit_loginuid(void) {
+@@ -2688,7 +2688,7 @@ static int reset_audit_loginuid(void) {
          if (streq(p, "4294967295"))
                  return 0;
  
@@ -263,7 +291,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0) {
                  log_error_errno(r,
                                  "Failed to reset audit login UID. This probably means that your kernel is too\n"
-@@ -4214,7 +4214,7 @@ static int setup_uid_map(
+@@ -4141,7 +4141,7 @@ static int setup_uid_map(
                  return log_oom();
  
          xsprintf(uid_map, "/proc/" PID_FMT "/uid_map", pid);
@@ -272,7 +300,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0)
                  return log_error_errno(r, "Failed to write UID map: %m");
  
-@@ -4224,7 +4224,7 @@ static int setup_uid_map(
+@@ -4151,7 +4151,7 @@ static int setup_uid_map(
                  return log_oom();
  
          xsprintf(uid_map, "/proc/" PID_FMT "/gid_map", pid);
@@ -281,6 +309,8 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0)
                  return log_error_errno(r, "Failed to write GID map: %m");
  
+diff --git a/src/shared/binfmt-util.c b/src/shared/binfmt-util.c
+index a26175474b..1413a9c72c 100644
 --- a/src/shared/binfmt-util.c
 +++ b/src/shared/binfmt-util.c
 @@ -46,7 +46,7 @@ int disable_binfmt(void) {
@@ -292,18 +322,20 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0)
                  return log_warning_errno(r, "Failed to unregister binfmt_misc entries: %m");
  
+diff --git a/src/shared/cgroup-setup.c b/src/shared/cgroup-setup.c
+index 934a16eaf3..c921ced861 100644
 --- a/src/shared/cgroup-setup.c
 +++ b/src/shared/cgroup-setup.c
-@@ -351,7 +351,7 @@ int cg_attach(const char *controller, co
+@@ -351,7 +351,7 @@ int cg_attach(const char *controller, const char *path, pid_t pid) {
  
          xsprintf(c, PID_FMT "\n", pid);
  
 -        r = write_string_file(fs, c, WRITE_STRING_FILE_DISABLE_BUFFER);
 +        r = write_string_file(fs, c, 0);
-         if (r == -EOPNOTSUPP && cg_is_threaded(controller, path) > 0)
+         if (r == -EOPNOTSUPP && cg_is_threaded(path) > 0)
                  /* When the threaded mode is used, we cannot read/write the file. Let's return recognizable error. */
                  return -EUCLEAN;
-@@ -964,7 +964,7 @@ int cg_enable_everywhere(
+@@ -966,7 +966,7 @@ int cg_enable_everywhere(
                                          return log_debug_errno(errno, "Failed to open cgroup.subtree_control file of %s: %m", p);
                          }
  
@@ -312,9 +344,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
                          if (r < 0) {
                                  log_debug_errno(r, "Failed to %s controller %s for %s (%s): %m",
                                                  FLAGS_SET(mask, bit) ? "enable" : "disable", n, p, fs);
+diff --git a/src/shared/coredump-util.c b/src/shared/coredump-util.c
+index 805503f366..01a7ccb291 100644
 --- a/src/shared/coredump-util.c
 +++ b/src/shared/coredump-util.c
-@@ -163,7 +163,7 @@ int set_coredump_filter(uint64_t value)
+@@ -163,7 +163,7 @@ int set_coredump_filter(uint64_t value) {
          xsprintf(t, "0x%"PRIx64, value);
  
          return write_string_file("/proc/self/coredump_filter", t,
@@ -323,9 +357,20 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  }
  
  /* Turn off core dumps but only if we're running outside of a container. */
---- a/src/shared/sleep-util.c
-+++ b/src/shared/sleep-util.c
-@@ -1044,7 +1044,7 @@ int write_resume_config(dev_t devno, uin
+@@ -173,7 +173,7 @@ void disable_coredumps(void) {
+         if (detect_container() > 0)
+                 return;
+ 
+-        r = write_string_file("/proc/sys/kernel/core_pattern", "|/bin/false", WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file("/proc/sys/kernel/core_pattern", "|/bin/false", 0);
+         if (r < 0)
+                 log_debug_errno(r, "Failed to turn off coredumps, ignoring: %m");
+ }
+diff --git a/src/shared/hibernate-util.c b/src/shared/hibernate-util.c
+index 3eb13d48f6..d09b901be1 100644
+--- a/src/shared/hibernate-util.c
++++ b/src/shared/hibernate-util.c
+@@ -481,7 +481,7 @@ int write_resume_config(dev_t devno, uint64_t offset, const char *device) {
  
          /* We write the offset first since it's safer. Note that this file is only available in 4.17+, so
           * fail gracefully if it doesn't exist and we're only overwriting it with 0. */
@@ -334,7 +379,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r == -ENOENT) {
                  if (offset != 0)
                          return log_error_errno(SYNTHETIC_ERRNO(EOPNOTSUPP),
-@@ -1060,7 +1060,7 @@ int write_resume_config(dev_t devno, uin
+@@ -497,7 +497,7 @@ int write_resume_config(dev_t devno, uint64_t offset, const char *device) {
                  log_debug("Wrote resume_offset=%s for device '%s' to /sys/power/resume_offset.",
                            offset_str, device);
  
@@ -343,9 +388,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0)
                  return log_error_errno(r,
                                         "Failed to write device '%s' (%s) to /sys/power/resume: %m",
+diff --git a/src/shared/smack-util.c b/src/shared/smack-util.c
+index 1f88e724d0..feb18b320a 100644
 --- a/src/shared/smack-util.c
 +++ b/src/shared/smack-util.c
-@@ -113,7 +113,7 @@ int mac_smack_apply_pid(pid_t pid, const
+@@ -113,7 +113,7 @@ int mac_smack_apply_pid(pid_t pid, const char *label) {
                  return 0;
  
          p = procfs_file_alloca(pid, "attr/current");
@@ -354,29 +401,142 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0)
                  return r;
  
+diff --git a/src/shared/watchdog.c b/src/shared/watchdog.c
+index 4c1a968718..6faf6806a5 100644
+--- a/src/shared/watchdog.c
++++ b/src/shared/watchdog.c
+@@ -93,7 +93,7 @@ static int set_pretimeout_governor(const char *governor) {
+ 
+         r = write_string_file(sys_fn,
+                               governor,
+-                              WRITE_STRING_FILE_DISABLE_BUFFER | WRITE_STRING_FILE_VERIFY_ON_FAILURE | WRITE_STRING_FILE_VERIFY_IGNORE_NEWLINE);
++                              WRITE_STRING_FILE_VERIFY_ON_FAILURE | WRITE_STRING_FILE_VERIFY_IGNORE_NEWLINE);
+         if (r < 0)
+                 return log_error_errno(r, "Failed to set pretimeout_governor to '%s': %m", governor);
+ 
+diff --git a/src/sleep/sleep.c b/src/sleep/sleep.c
+index 21af3e9e52..6d4b84b5d5 100644
 --- a/src/sleep/sleep.c
 +++ b/src/sleep/sleep.c
-@@ -139,7 +139,7 @@ static int write_mode(char **modes) {
+@@ -137,7 +137,7 @@ static int write_state(int fd, char * const *states) {
+                 if (k < 0)
+                         return RET_GATHER(r, k);
+ 
+-                k = write_string_stream(f, *state, WRITE_STRING_FILE_DISABLE_BUFFER);
++                k = write_string_stream(f, *state, 0);
+                 if (k >= 0) {
+                         log_debug("Using sleep state '%s'.", *state);
+                         return 0;
+@@ -155,7 +155,7 @@ static int write_mode(char * const *modes) {
          STRV_FOREACH(mode, modes) {
                  int k;
  
 -                k = write_string_file("/sys/power/disk", *mode, WRITE_STRING_FILE_DISABLE_BUFFER);
 +                k = write_string_file("/sys/power/disk", *mode, 0);
-                 if (k >= 0)
+                 if (k >= 0) {
+                         log_debug("Using sleep disk mode '%s'.", *mode);
                          return 0;
+diff --git a/src/storagetm/storagetm.c b/src/storagetm/storagetm.c
+index ae63baaf79..82eeca479a 100644
+--- a/src/storagetm/storagetm.c
++++ b/src/storagetm/storagetm.c
+@@ -186,7 +186,7 @@ static int nvme_subsystem_unlink(NvmeSubsystem *s) {
+                                         if (!enable_fn)
+                                                 return log_oom();
+ 
+-                                        r = write_string_file_at(namespaces_fd, enable_fn, "0", WRITE_STRING_FILE_DISABLE_BUFFER);
++                                        r = write_string_file_at(namespaces_fd, enable_fn, "0", 0);
+                                         if (r < 0)
+                                                 log_warning_errno(r, "Failed to disable namespace '%s' of NVME subsystem '%s', ignoring: %m", e->d_name, s->name);
+ 
+@@ -254,7 +254,7 @@ static int nvme_subsystem_write_metadata(int subsystem_fd, sd_device *device) {
+                 _cleanup_free_ char *truncated = strndup(w, 40); /* kernel refuses more than 40 chars (as per nvme spec) */
+ 
+                 /* The default string stored in 'attr_model' is "Linux" btw. */
+-                r = write_string_file_at(subsystem_fd, "attr_model", truncated, WRITE_STRING_FILE_DISABLE_BUFFER);
++                r = write_string_file_at(subsystem_fd, "attr_model", truncated, 0);
+                 if (r < 0)
+                         log_warning_errno(r, "Failed to set model of subsystem to '%s', ignoring: %m", w);
+         }
+@@ -268,7 +268,7 @@ static int nvme_subsystem_write_metadata(int subsystem_fd, sd_device *device) {
+                         return log_oom();
  
-@@ -160,7 +160,7 @@ static int write_state(FILE **f, char **
-         STRV_FOREACH(state, states) {
-                 int k;
+                  /* The default string stored in 'attr_firmware' is `uname -r` btw, but truncated to 8 chars. */
+-                r = write_string_file_at(subsystem_fd, "attr_firmware", truncated, WRITE_STRING_FILE_DISABLE_BUFFER);
++                r = write_string_file_at(subsystem_fd, "attr_firmware", truncated, 0);
+                 if (r < 0)
+                         log_warning_errno(r, "Failed to set model of subsystem to '%s', ignoring: %m", truncated);
+         }
+@@ -295,7 +295,7 @@ static int nvme_subsystem_write_metadata(int subsystem_fd, sd_device *device) {
+                 if (!truncated)
+                         return log_oom();
  
--                k = write_string_stream(*f, *state, WRITE_STRING_FILE_DISABLE_BUFFER);
-+                k = write_string_stream(*f, *state, 0);
-                 if (k >= 0)
-                         return 0;
-                 log_debug_errno(k, "Failed to write '%s' to /sys/power/state: %m", *state);
+-                r = write_string_file_at(subsystem_fd, "attr_serial", truncated, WRITE_STRING_FILE_DISABLE_BUFFER);
++                r = write_string_file_at(subsystem_fd, "attr_serial", truncated, 0);
+                 if (r < 0)
+                         log_warning_errno(r, "Failed to set serial of subsystem to '%s', ignoring: %m", truncated);
+         }
+@@ -345,7 +345,7 @@ static int nvme_namespace_write_metadata(int namespace_fd, sd_device *device, co
+                 id = id128_digest(j, l);
+         }
+ 
+-        r = write_string_file_at(namespace_fd, "device_uuid", SD_ID128_TO_UUID_STRING(id), WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file_at(namespace_fd, "device_uuid", SD_ID128_TO_UUID_STRING(id), 0);
+         if (r < 0)
+                 log_warning_errno(r, "Failed to set uuid of namespace to '%s', ignoring: %m", SD_ID128_TO_UUID_STRING(id));
+ 
+@@ -408,7 +408,7 @@ static int nvme_subsystem_add(const char *node, int consumed_fd, sd_device *devi
+         if (subsystem_fd < 0)
+                 return log_error_errno(subsystem_fd, "Failed to create NVME subsystem '%s': %m", j);
+ 
+-        r = write_string_file_at(subsystem_fd, "attr_allow_any_host", "1", WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file_at(subsystem_fd, "attr_allow_any_host", "1", 0);
+         if (r < 0)
+                 return log_error_errno(r, "Failed to set 'attr_allow_any_host' flag: %m");
+ 
+@@ -423,11 +423,11 @@ static int nvme_subsystem_add(const char *node, int consumed_fd, sd_device *devi
+ 
+         /* We use /proc/$PID/fd/$FD rather than /proc/self/fd/$FD, because this string is visible to others
+          * via configfs, and by including the PID it's clear to who the stuff belongs. */
+-        r = write_string_file_at(namespace_fd, "device_path", FORMAT_PROC_PID_FD_PATH(0, fd), WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file_at(namespace_fd, "device_path", FORMAT_PROC_PID_FD_PATH(0, fd), 0);
+         if (r < 0)
+                 return log_error_errno(r, "Failed to write 'device_path' attribute: %m");
+ 
+-        r = write_string_file_at(namespace_fd, "enable", "1", WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file_at(namespace_fd, "enable", "1", 0);
+         if (r < 0)
+                 return log_error_errno(r, "Failed to write 'enable' attribute: %m");
+ 
+@@ -557,19 +557,19 @@ static int nvme_port_add_portnr(
+                 return 0;
+         }
+ 
+-        r = write_string_file_at(port_fd, "addr_adrfam", af_to_ipv4_ipv6(ip_family), WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file_at(port_fd, "addr_adrfam", af_to_ipv4_ipv6(ip_family), 0);
+         if (r < 0)
+                 return log_error_errno(r, "Failed to set address family on NVME port %" PRIu16 ": %m", portnr);
+ 
+-        r = write_string_file_at(port_fd, "addr_trtype", "tcp", WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file_at(port_fd, "addr_trtype", "tcp", 0);
+         if (r < 0)
+                 return log_error_errno(r, "Failed to set transport type on NVME port %" PRIu16 ": %m", portnr);
+ 
+-        r = write_string_file_at(port_fd, "addr_trsvcid", fname, WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file_at(port_fd, "addr_trsvcid", fname, 0);
+         if (r < 0)
+                 return log_error_errno(r, "Failed to set IP port on NVME port %" PRIu16 ": %m", portnr);
+ 
+-        r = write_string_file_at(port_fd, "addr_traddr", ip_family == AF_INET6 ? "::" : "0.0.0.0", WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file_at(port_fd, "addr_traddr", ip_family == AF_INET6 ? "::" : "0.0.0.0", 0);
+         if (r < 0)
+                 return log_error_errno(r, "Failed to set IP address on NVME port %" PRIu16 ": %m", portnr);
+ 
+diff --git a/src/udev/udev-rules.c b/src/udev/udev-rules.c
+index febe345b4c..a90b610ba1 100644
 --- a/src/udev/udev-rules.c
 +++ b/src/udev/udev-rules.c
-@@ -2634,7 +2634,6 @@ static int udev_rule_apply_token_to_even
+@@ -2711,7 +2711,6 @@ static int udev_rule_apply_token_to_event(
                  log_event_debug(dev, token, "ATTR '%s' writing '%s'", buf, value);
                  r = write_string_file(buf, value,
                                        WRITE_STRING_FILE_VERIFY_ON_FAILURE |
@@ -384,9 +544,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
                                        WRITE_STRING_FILE_AVOID_NEWLINE |
                                        WRITE_STRING_FILE_VERIFY_IGNORE_NEWLINE);
                  if (r < 0)
+diff --git a/src/vconsole/vconsole-setup.c b/src/vconsole/vconsole-setup.c
+index 4d82c65f0a..3a3d861b83 100644
 --- a/src/vconsole/vconsole-setup.c
 +++ b/src/vconsole/vconsole-setup.c
-@@ -260,7 +260,7 @@ static int toggle_utf8_vc(const char *na
+@@ -261,7 +261,7 @@ static int toggle_utf8_vc(const char *name, int fd, bool utf8) {
  static int toggle_utf8_sysfs(bool utf8) {
          int r;
  
@@ -395,3 +557,6 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0)
                  return log_warning_errno(r, "Failed to %s sysfs UTF-8 flag: %m", enable_disable(utf8));
  
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0022-Handle-__cpu_mask-usage.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0013-Handle-__cpu_mask-usage.patch
similarity index 83%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0022-Handle-__cpu_mask-usage.patch
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0013-Handle-__cpu_mask-usage.patch
index 580aff327d..43f75373a6 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0022-Handle-__cpu_mask-usage.patch
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0013-Handle-__cpu_mask-usage.patch
@@ -1,7 +1,7 @@
-From a50ec65dbe660421052656dda7499c925005f486 Mon Sep 17 00:00:00 2001
+From 2f90f8463423cfbb7e83fcef42f1071018c3b56e Mon Sep 17 00:00:00 2001
 From: Scott Murray <scott.murray@konsulko.com>
 Date: Fri, 13 Sep 2019 19:26:27 -0400
-Subject: [PATCH] Handle __cpu_mask usage
+Subject: [PATCH 13/22] Handle __cpu_mask usage
 
 Fixes errors:
 
@@ -23,6 +23,8 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  src/test/test-sizeof.c    | 2 +-
  2 files changed, 3 insertions(+), 1 deletion(-)
 
+diff --git a/src/shared/cpu-set-util.h b/src/shared/cpu-set-util.h
+index 3c63a58826..4c2d4347fc 100644
 --- a/src/shared/cpu-set-util.h
 +++ b/src/shared/cpu-set-util.h
 @@ -6,6 +6,8 @@
@@ -34,6 +36,8 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  /* This wraps the libc interface with a variable to keep the allocated size. */
  typedef struct CPUSet {
          cpu_set_t *set;
+diff --git a/src/test/test-sizeof.c b/src/test/test-sizeof.c
+index ea0c58770e..b65c0bd370 100644
 --- a/src/test/test-sizeof.c
 +++ b/src/test/test-sizeof.c
 @@ -1,6 +1,5 @@
@@ -51,3 +55,6 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  
  /* Print information about various types. Useful when diagnosing
   * gcc diagnostics on an unfamiliar architecture. */
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0023-Handle-missing-gshadow.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0014-Handle-missing-gshadow.patch
similarity index 96%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0023-Handle-missing-gshadow.patch
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0014-Handle-missing-gshadow.patch
index 19ee3ff311..a751e1ba6f 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0023-Handle-missing-gshadow.patch
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0014-Handle-missing-gshadow.patch
@@ -1,7 +1,7 @@
-From ebf0f69d8614b8d86a971b97ff0d847d1e5d47c9 Mon Sep 17 00:00:00 2001
+From b7c827bb44edbb6251c9fcdb80aa03982c0e7bf3 Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Tue, 10 Mar 2020 11:05:20 +0000
-Subject: [PATCH] Handle missing gshadow
+Subject: [PATCH 14/22] Handle missing gshadow
 
 gshadow usage is now present in the userdb code. Mask all uses of it to
 allow compilation on musl
@@ -17,7 +17,7 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  3 files changed, 30 insertions(+), 1 deletion(-)
 
 diff --git a/src/shared/user-record-nss.c b/src/shared/user-record-nss.c
-index 88b8fc2f8f..a819d41bac 100644
+index 414a49331b..1a4e1b628c 100644
 --- a/src/shared/user-record-nss.c
 +++ b/src/shared/user-record-nss.c
 @@ -329,8 +329,10 @@ int nss_group_to_group_record(
@@ -138,7 +138,7 @@ index 22ab04d6ee..4e52e7a911 100644
  #include <shadow.h>
  
 diff --git a/src/shared/userdb.c b/src/shared/userdb.c
-index a77eff4407..955e361d3a 100644
+index f60d48ace4..e878199a28 100644
 --- a/src/shared/userdb.c
 +++ b/src/shared/userdb.c
 @@ -1038,13 +1038,15 @@ int groupdb_iterator_get(UserDBIterator *iterator, GroupRecord **ret) {
@@ -169,5 +169,5 @@ index a77eff4407..955e361d3a 100644
                                  return r;
  
 -- 
-2.39.2
+2.34.1
 
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0024-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0015-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
similarity index 84%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0024-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0015-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
index d64cec1585..e112766a9b 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0024-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0015-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
@@ -1,7 +1,7 @@
-From a2f56a2a6cdd5137bb1e680aa9f6c40540107166 Mon Sep 17 00:00:00 2001
+From 3dc9d9d410bcce54fddfd94f43f7f77f3aa8e281 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 12 Apr 2021 23:44:53 -0700
-Subject: [PATCH] missing_syscall.h: Define MIPS ABI defines for musl
+Subject: [PATCH 15/22] missing_syscall.h: Define MIPS ABI defines for musl
 
 musl does not define _MIPS_SIM_ABI32, _MIPS_SIM_NABI32, _MIPS_SIM_ABI64
 unlike glibc where these are provided by libc headers, therefore define
@@ -16,7 +16,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 7 insertions(+)
 
 diff --git a/src/basic/missing_syscall.h b/src/basic/missing_syscall.h
-index 98cd037962..ea6a76c2e2 100644
+index d795efd8f2..d6729d3c1d 100644
 --- a/src/basic/missing_syscall.h
 +++ b/src/basic/missing_syscall.h
 @@ -20,6 +20,12 @@
@@ -33,7 +33,7 @@ index 98cd037962..ea6a76c2e2 100644
  #include "missing_keyctl.h"
  #include "missing_stat.h"
 diff --git a/src/shared/base-filesystem.c b/src/shared/base-filesystem.c
-index 2726dc946a..484f63e0b4 100644
+index 7ae921a113..0ef9d1fd39 100644
 --- a/src/shared/base-filesystem.c
 +++ b/src/shared/base-filesystem.c
 @@ -20,6 +20,7 @@
@@ -45,5 +45,5 @@ index 2726dc946a..484f63e0b4 100644
  typedef struct BaseFilesystem {
          const char *dir;      /* directory or symlink to create */
 -- 
-2.39.2
+2.34.1
 
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0005-pass-correct-parameters-to-getdents64.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0016-pass-correct-parameters-to-getdents64.patch
similarity index 92%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0005-pass-correct-parameters-to-getdents64.patch
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0016-pass-correct-parameters-to-getdents64.patch
index c634d8ec3d..0be817e62d 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0005-pass-correct-parameters-to-getdents64.patch
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0016-pass-correct-parameters-to-getdents64.patch
@@ -1,7 +1,7 @@
-From 17766c64ecc7dedf09ed2d361690fc4eda77bf42 Mon Sep 17 00:00:00 2001
+From 0994b59dba9f248ad31cb7087046dc00b72cb4ea Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 21 Jan 2022 15:15:11 -0800
-Subject: [PATCH] pass correct parameters to getdents64
+Subject: [PATCH 16/22] pass correct parameters to getdents64
 
 Fixes
 ../git/src/basic/recurse-dir.c:57:40: error: incompatible pointer types passing 'uint8_t *' (aka 'unsigned char *') to parameter of type 'struct dirent *' [-Werror,-Wincompatible-pointer-types]
@@ -33,5 +33,5 @@ index 5e98b7a5d8..aef065047b 100644
                          return -errno;
                  if (n == 0)
 -- 
-2.39.2
+2.34.1
 
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0001-Adjust-for-musl-headers.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0017-Adjust-for-musl-headers.patch
similarity index 89%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0001-Adjust-for-musl-headers.patch
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0017-Adjust-for-musl-headers.patch
index 5e9646c569..4176522a1c 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0001-Adjust-for-musl-headers.patch
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0017-Adjust-for-musl-headers.patch
@@ -1,11 +1,14 @@
-From e5f067cb3dc845dd865e450f4e64077b28feb4c0 Mon Sep 17 00:00:00 2001
+From 3c094d443ca30f19114392fd8ef274af6eabc12d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 21 Jan 2022 22:19:37 -0800
-Subject: [PATCH] Adjust for musl headers
+Subject: [PATCH 17/22] Adjust for musl headers
 
 Upstream-Status: Inappropriate [musl specific]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+[Rebased for v255.1]
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 ---
  src/libsystemd-network/sd-dhcp6-client.c      | 2 +-
  src/network/netdev/bareudp.c                  | 2 +-
@@ -33,7 +36,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/network/netdev/xfrm.c                     | 2 +-
  src/network/networkd-bridge-mdb.c             | 4 ++--
  src/network/networkd-dhcp-common.c            | 3 ++-
- src/network/networkd-dhcp-prefix-delegation.c | 4 ++--
+ src/network/networkd-dhcp-prefix-delegation.c | 3 ++-
  src/network/networkd-dhcp-server.c            | 2 +-
  src/network/networkd-dhcp4.c                  | 2 +-
  src/network/networkd-ipv6ll.c                 | 2 +-
@@ -41,13 +44,14 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/network/networkd-ndisc.c                  | 2 +-
  src/network/networkd-route.c                  | 8 ++++----
  src/network/networkd-setlink.c                | 2 +-
+ src/network/networkd-sysctl.c                 | 2 +-
  src/shared/linux/ethtool.h                    | 3 ++-
  src/shared/netif-util.c                       | 2 +-
  src/udev/udev-builtin-net_id.c                | 2 +-
- 37 files changed, 44 insertions(+), 42 deletions(-)
+ 38 files changed, 45 insertions(+), 42 deletions(-)
 
 diff --git a/src/libsystemd-network/sd-dhcp6-client.c b/src/libsystemd-network/sd-dhcp6-client.c
-index 57dd91f81f..2b7f4fa3a7 100644
+index c20367dfc9..b8d4cd8c2a 100644
 --- a/src/libsystemd-network/sd-dhcp6-client.c
 +++ b/src/libsystemd-network/sd-dhcp6-client.c
 @@ -5,7 +5,7 @@
@@ -60,7 +64,7 @@ index 57dd91f81f..2b7f4fa3a7 100644
  
  #include "sd-dhcp6-client.h"
 diff --git a/src/network/netdev/bareudp.c b/src/network/netdev/bareudp.c
-index 24d3afb877..f6241b41ee 100644
+index 1df886573b..c8b6714726 100644
 --- a/src/network/netdev/bareudp.c
 +++ b/src/network/netdev/bareudp.c
 @@ -2,7 +2,7 @@
@@ -73,7 +77,7 @@ index 24d3afb877..f6241b41ee 100644
  #include "bareudp.h"
  #include "netlink-util.h"
 diff --git a/src/network/netdev/batadv.c b/src/network/netdev/batadv.c
-index 7e97619657..50fcffcfdf 100644
+index 26da0231d4..2e8002af8c 100644
 --- a/src/network/netdev/batadv.c
 +++ b/src/network/netdev/batadv.c
 @@ -3,7 +3,7 @@
@@ -86,7 +90,7 @@ index 7e97619657..50fcffcfdf 100644
  #include "batadv.h"
  #include "fileio.h"
 diff --git a/src/network/netdev/bond.c b/src/network/netdev/bond.c
-index 601bff0a9c..dfed8d9e54 100644
+index 4d75a0d6bf..985b3197e0 100644
 --- a/src/network/netdev/bond.c
 +++ b/src/network/netdev/bond.c
 @@ -1,7 +1,7 @@
@@ -99,7 +103,7 @@ index 601bff0a9c..dfed8d9e54 100644
  #include "alloc-util.h"
  #include "bond.h"
 diff --git a/src/network/netdev/bridge.c b/src/network/netdev/bridge.c
-index b65c3b49fc..6875b4fbdb 100644
+index 3e394edadf..f12f667687 100644
 --- a/src/network/netdev/bridge.c
 +++ b/src/network/netdev/bridge.c
 @@ -2,7 +2,7 @@
@@ -124,7 +128,7 @@ index 00df1d2787..77b506b422 100644
  #include "dummy.h"
  
 diff --git a/src/network/netdev/geneve.c b/src/network/netdev/geneve.c
-index 777a32d75c..73bfa2b5c1 100644
+index bc655ec7ff..a77e8e17e4 100644
 --- a/src/network/netdev/geneve.c
 +++ b/src/network/netdev/geneve.c
 @@ -2,7 +2,7 @@
@@ -150,7 +154,7 @@ index d7ff44cb9e..e037629ae4 100644
  #include "ifb.h"
  
 diff --git a/src/network/netdev/ipoib.c b/src/network/netdev/ipoib.c
-index 5dd9286d57..4036d66dad 100644
+index d5fe299b7b..c9c8002eac 100644
 --- a/src/network/netdev/ipoib.c
 +++ b/src/network/netdev/ipoib.c
 @@ -1,6 +1,6 @@
@@ -162,7 +166,7 @@ index 5dd9286d57..4036d66dad 100644
  
  #include "ipoib.h"
 diff --git a/src/network/netdev/ipvlan.c b/src/network/netdev/ipvlan.c
-index 058eadebd7..c470ebb6d7 100644
+index 05d5d010f6..d440f49537 100644
 --- a/src/network/netdev/ipvlan.c
 +++ b/src/network/netdev/ipvlan.c
 @@ -2,7 +2,7 @@
@@ -175,7 +179,7 @@ index 058eadebd7..c470ebb6d7 100644
  #include "conf-parser.h"
  #include "ipvlan.h"
 diff --git a/src/network/netdev/macsec.c b/src/network/netdev/macsec.c
-index 0da3dd4bd2..eb20f04469 100644
+index 17d6acefb6..679d0984f9 100644
 --- a/src/network/netdev/macsec.c
 +++ b/src/network/netdev/macsec.c
 @@ -1,7 +1,7 @@
@@ -188,7 +192,7 @@ index 0da3dd4bd2..eb20f04469 100644
  #include <linux/if_macsec.h>
  #include <linux/genetlink.h>
 diff --git a/src/network/netdev/macvlan.c b/src/network/netdev/macvlan.c
-index 1114bb0cb1..6c79a219a4 100644
+index 203807e3a5..8ab09a387e 100644
 --- a/src/network/netdev/macvlan.c
 +++ b/src/network/netdev/macvlan.c
 @@ -2,7 +2,7 @@
@@ -201,7 +205,7 @@ index 1114bb0cb1..6c79a219a4 100644
  #include "conf-parser.h"
  #include "macvlan.h"
 diff --git a/src/network/netdev/netdev.c b/src/network/netdev/netdev.c
-index 038a27c118..67155f0db7 100644
+index 57127a861a..7f787d0b9f 100644
 --- a/src/network/netdev/netdev.c
 +++ b/src/network/netdev/netdev.c
 @@ -2,7 +2,7 @@
@@ -238,7 +242,7 @@ index ff372092e6..eef66811f4 100644
  #include "nlmon.h"
  
 diff --git a/src/network/netdev/tunnel.c b/src/network/netdev/tunnel.c
-index 2addfeecaa..954987f26d 100644
+index db84e7cf6e..93d5642962 100644
 --- a/src/network/netdev/tunnel.c
 +++ b/src/network/netdev/tunnel.c
 @@ -2,7 +2,7 @@
@@ -263,7 +267,7 @@ index 380547ee1e..137c1adf8a 100644
  #include "vcan.h"
  
 diff --git a/src/network/netdev/veth.c b/src/network/netdev/veth.c
-index fb00e6667f..f52d9ee89a 100644
+index e0f5b4ebb1..8a424ed03d 100644
 --- a/src/network/netdev/veth.c
 +++ b/src/network/netdev/veth.c
 @@ -3,7 +3,7 @@
@@ -276,7 +280,7 @@ index fb00e6667f..f52d9ee89a 100644
  
  #include "netlink-util.h"
 diff --git a/src/network/netdev/vlan.c b/src/network/netdev/vlan.c
-index a3d961dac3..386b567a42 100644
+index 2390206993..efec630e30 100644
 --- a/src/network/netdev/vlan.c
 +++ b/src/network/netdev/vlan.c
 @@ -2,7 +2,7 @@
@@ -289,7 +293,7 @@ index a3d961dac3..386b567a42 100644
  
  #include "parse-util.h"
 diff --git a/src/network/netdev/vrf.c b/src/network/netdev/vrf.c
-index 05ef3ff13d..825fc4a398 100644
+index b75ec2bcc6..6aeeea640b 100644
 --- a/src/network/netdev/vrf.c
 +++ b/src/network/netdev/vrf.c
 @@ -2,7 +2,7 @@
@@ -302,7 +306,7 @@ index 05ef3ff13d..825fc4a398 100644
  #include "vrf.h"
  
 diff --git a/src/network/netdev/vxcan.c b/src/network/netdev/vxcan.c
-index 83269b0707..39c6dbe29c 100644
+index c0343f45b6..f9e718f40b 100644
 --- a/src/network/netdev/vxcan.c
 +++ b/src/network/netdev/vxcan.c
 @@ -1,7 +1,7 @@
@@ -315,7 +319,7 @@ index 83269b0707..39c6dbe29c 100644
  #include "vxcan.h"
  
 diff --git a/src/network/netdev/vxlan.c b/src/network/netdev/vxlan.c
-index 589161938a..0ec9625b7a 100644
+index b11fdbbd0d..a971a917f0 100644
 --- a/src/network/netdev/vxlan.c
 +++ b/src/network/netdev/vxlan.c
 @@ -2,7 +2,7 @@
@@ -328,7 +332,7 @@ index 589161938a..0ec9625b7a 100644
  #include "conf-parser.h"
  #include "alloc-util.h"
 diff --git a/src/network/netdev/wireguard.c b/src/network/netdev/wireguard.c
-index 51e7e02990..fc36c0623a 100644
+index 4c7d837c41..6df6dfb816 100644
 --- a/src/network/netdev/wireguard.c
 +++ b/src/network/netdev/wireguard.c
 @@ -6,7 +6,7 @@
@@ -341,7 +345,7 @@ index 51e7e02990..fc36c0623a 100644
  
  #include "sd-resolve.h"
 diff --git a/src/network/netdev/xfrm.c b/src/network/netdev/xfrm.c
-index a961d8fef2..6c1815b257 100644
+index 905bfc0bdf..39e34dbb3b 100644
 --- a/src/network/netdev/xfrm.c
 +++ b/src/network/netdev/xfrm.c
 @@ -1,6 +1,6 @@
@@ -374,7 +378,7 @@ index bd1a9745dc..949d3da029 100644
  #define STATIC_BRIDGE_MDB_ENTRIES_PER_NETWORK_MAX 1024U
  
 diff --git a/src/network/networkd-dhcp-common.c b/src/network/networkd-dhcp-common.c
-index ca9a825e7b..8735e261ad 100644
+index 080b15387c..efe8283957 100644
 --- a/src/network/networkd-dhcp-common.c
 +++ b/src/network/networkd-dhcp-common.c
 @@ -1,7 +1,8 @@
@@ -388,18 +392,17 @@ index ca9a825e7b..8735e261ad 100644
  #include "bus-error.h"
  #include "bus-locator.h"
 diff --git a/src/network/networkd-dhcp-prefix-delegation.c b/src/network/networkd-dhcp-prefix-delegation.c
-index 66c5e979d9..581b6b8c29 100644
+index af2fe9efcd..511565700f 100644
 --- a/src/network/networkd-dhcp-prefix-delegation.c
 +++ b/src/network/networkd-dhcp-prefix-delegation.c
-@@ -1,7 +1,5 @@
+@@ -1,6 +1,5 @@
  /* SPDX-License-Identifier: LGPL-2.1-or-later */
  
 -#include <linux/ipv6_route.h>
--
- #include "sd-dhcp6-client.h"
  
+ #include "dhcp6-lease-internal.h"
  #include "hashmap.h"
-@@ -21,6 +19,8 @@
+@@ -20,6 +19,8 @@
  #include "strv.h"
  #include "tunnel.h"
  
@@ -409,7 +412,7 @@ index 66c5e979d9..581b6b8c29 100644
          assert(link);
  
 diff --git a/src/network/networkd-dhcp-server.c b/src/network/networkd-dhcp-server.c
-index 620fbbddc7..c8af20fb34 100644
+index 607fe0053c..9ce4005874 100644
 --- a/src/network/networkd-dhcp-server.c
 +++ b/src/network/networkd-dhcp-server.c
 @@ -1,7 +1,7 @@
@@ -422,7 +425,7 @@ index 620fbbddc7..c8af20fb34 100644
  
  #include "sd-dhcp-server.h"
 diff --git a/src/network/networkd-dhcp4.c b/src/network/networkd-dhcp4.c
-index d4b4942173..3d78da5609 100644
+index efbae6d868..1ea2151d50 100644
 --- a/src/network/networkd-dhcp4.c
 +++ b/src/network/networkd-dhcp4.c
 @@ -3,7 +3,7 @@
@@ -448,7 +451,7 @@ index 32229a3fc7..662a345d6e 100644
  #include "in-addr-util.h"
  #include "networkd-address.h"
 diff --git a/src/network/networkd-link.c b/src/network/networkd-link.c
-index 019bef0590..657fc41ae6 100644
+index ee5f0f2c0a..ea5269a2de 100644
 --- a/src/network/networkd-link.c
 +++ b/src/network/networkd-link.c
 @@ -3,7 +3,7 @@
@@ -461,7 +464,7 @@ index 019bef0590..657fc41ae6 100644
  #include <linux/netdevice.h>
  #include <sys/socket.h>
 diff --git a/src/network/networkd-ndisc.c b/src/network/networkd-ndisc.c
-index 99a07e16fc..e51cd81d96 100644
+index ab9eeb13a5..dd96fe7483 100644
 --- a/src/network/networkd-ndisc.c
 +++ b/src/network/networkd-ndisc.c
 @@ -6,7 +6,7 @@
@@ -474,7 +477,7 @@ index 99a07e16fc..e51cd81d96 100644
  #include "sd-ndisc.h"
  
 diff --git a/src/network/networkd-route.c b/src/network/networkd-route.c
-index 5214a8ad2c..9dd758daae 100644
+index 7218d799fc..30d5574eae 100644
 --- a/src/network/networkd-route.c
 +++ b/src/network/networkd-route.c
 @@ -1,9 +1,5 @@
@@ -499,7 +502,7 @@ index 5214a8ad2c..9dd758daae 100644
          _cleanup_(route_freep) Route *route = NULL;
  
 diff --git a/src/network/networkd-setlink.c b/src/network/networkd-setlink.c
-index 541c4b8a72..06ebda8f0f 100644
+index 2298f9ea3a..7d5f87de53 100644
 --- a/src/network/networkd-setlink.c
 +++ b/src/network/networkd-setlink.c
 @@ -2,7 +2,7 @@
@@ -511,8 +514,21 @@ index 541c4b8a72..06ebda8f0f 100644
  #include <linux/if_bridge.h>
  
  #include "missing_network.h"
+diff --git a/src/network/networkd-sysctl.c b/src/network/networkd-sysctl.c
+index 2b226b2e2a..f12a474e2f 100644
+--- a/src/network/networkd-sysctl.c
++++ b/src/network/networkd-sysctl.c
+@@ -2,7 +2,7 @@
+ 
+ #include <netinet/in.h>
+ #include <linux/if.h>
+-#include <linux/if_arp.h>
++//#include <linux/if_arp.h>
+ 
+ #include "missing_network.h"
+ #include "networkd-link.h"
 diff --git a/src/shared/linux/ethtool.h b/src/shared/linux/ethtool.h
-index 1458de3627..d5c2d2e0ac 100644
+index 3d1da515c0..3fca9a4faf 100644
 --- a/src/shared/linux/ethtool.h
 +++ b/src/shared/linux/ethtool.h
 @@ -16,7 +16,8 @@
@@ -539,7 +555,7 @@ index f56c5646c1..5af28ff119 100644
  #include "arphrd-util.h"
  #include "device-util.h"
 diff --git a/src/udev/udev-builtin-net_id.c b/src/udev/udev-builtin-net_id.c
-index a48d5dedf8..31a8bc1b3c 100644
+index f528a46b8e..830318cda5 100644
 --- a/src/udev/udev-builtin-net_id.c
 +++ b/src/udev/udev-builtin-net_id.c
 @@ -18,7 +18,7 @@
@@ -552,5 +568,5 @@ index a48d5dedf8..31a8bc1b3c 100644
  #include <linux/pci_regs.h>
  
 -- 
-2.39.2
+2.34.1
 
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0017-Define-glibc-compatible-basename-for-non-glibc-syste.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0017-Define-glibc-compatible-basename-for-non-glibc-syste.patch
deleted file mode 100644
index 7d74cfcc24..0000000000
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0017-Define-glibc-compatible-basename-for-non-glibc-syste.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From fdc7fb940bb41020271b9db41d5608004efdbde5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 27 May 2018 08:36:44 -0700
-Subject: [PATCH] Define glibc compatible basename() for non-glibc systems
-
-Fixes builds with musl, even though systemd is adamant about
-using non-posix basename implementation, we have a way out
-
-Upstream-Status: Inappropriate [musl specific]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/machine/machine-dbus.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/src/machine/machine-dbus.c b/src/machine/machine-dbus.c
-index 45bc056326..aee51d5da5 100644
---- a/src/machine/machine-dbus.c
-+++ b/src/machine/machine-dbus.c
-@@ -4,6 +4,11 @@
- #include <sys/mount.h>
- #include <sys/wait.h>
- 
-+#if !defined(__GLIBC__)
-+#include <string.h>
-+#define basename(src) (strrchr(src,'/') ? strrchr(src,'/')+1 : src)
-+#endif
-+
- #include "alloc-util.h"
- #include "bus-common-errors.h"
- #include "bus-get-properties.h"
--- 
-2.39.2
-
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0006-test-bus-error-strerror-is-assumed-to-be-GNU-specifi.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0018-test-bus-error-strerror-is-assumed-to-be-GNU-specifi.patch
similarity index 89%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0006-test-bus-error-strerror-is-assumed-to-be-GNU-specifi.patch
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0018-test-bus-error-strerror-is-assumed-to-be-GNU-specifi.patch
index 96322e5a56..75f6b9094a 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0006-test-bus-error-strerror-is-assumed-to-be-GNU-specifi.patch
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0018-test-bus-error-strerror-is-assumed-to-be-GNU-specifi.patch
@@ -1,8 +1,8 @@
-From fa598869cca684c001f3dc23ce2198f5a6169e2a Mon Sep 17 00:00:00 2001
+From be02bd0876a061728661535a709d313e39fe1ac3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 8 Nov 2022 13:31:34 -0800
-Subject: [PATCH] test-bus-error: strerror() is assumed to be GNU specific
- version mark it so
+Subject: [PATCH 18/22] test-bus-error: strerror() is assumed to be GNU
+ specific version mark it so
 
 Upstream-Status: Inappropriate [Upstream systemd only supports glibc]
 
@@ -27,7 +27,7 @@ index a55f3f9856..4123bf3da0 100644
          assert_se(sd_bus_error_get_errno(&error) == EBUSY);
          assert_se(sd_bus_error_is_set(&error));
 diff --git a/src/test/test-errno-util.c b/src/test/test-errno-util.c
-index d3d022c33f..74e95c804d 100644
+index 376d532281..967cfd4d67 100644
 --- a/src/test/test-errno-util.c
 +++ b/src/test/test-errno-util.c
 @@ -4,7 +4,7 @@
@@ -48,5 +48,5 @@ index d3d022c33f..74e95c804d 100644
  TEST(PROTECT_ERRNO) {
          errno = 12;
 -- 
-2.39.2
+2.34.1
 
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0003-errno-util-Make-STRERROR-portable-for-musl.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0019-errno-util-Make-STRERROR-portable-for-musl.patch
similarity index 81%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0003-errno-util-Make-STRERROR-portable-for-musl.patch
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0019-errno-util-Make-STRERROR-portable-for-musl.patch
index fcc56a2e65..e038b73678 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0003-errno-util-Make-STRERROR-portable-for-musl.patch
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0019-errno-util-Make-STRERROR-portable-for-musl.patch
@@ -1,7 +1,7 @@
-From f629a76e0fba300a9d511614160fee38dd4a5e57 Mon Sep 17 00:00:00 2001
+From 46d80840bfe37e67d4f18c37a77751ea1fe63a07 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 23 Jan 2023 23:39:46 -0800
-Subject: [PATCH] errno-util: Make STRERROR portable for musl
+Subject: [PATCH 19/22] errno-util: Make STRERROR portable for musl
 
 Sadly, systemd has decided to use yet another GNU extention in a macro
 lets make this such that we can use XSI compliant strerror_r() for
@@ -11,20 +11,21 @@ Upstream-Status: Inappropriate [musl specific]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- src/basic/errno-util.h | 10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
+ src/basic/errno-util.h | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
 
 diff --git a/src/basic/errno-util.h b/src/basic/errno-util.h
-index 091f99c590..eb5c1f9961 100644
+index 27804e6382..274c1c6ef1 100644
 --- a/src/basic/errno-util.h
 +++ b/src/basic/errno-util.h
-@@ -14,8 +14,16 @@
+@@ -15,8 +15,16 @@
   * https://stackoverflow.com/questions/34880638/compound-literal-lifetime-and-if-blocks
   *
   * Note that we use the GNU variant of strerror_r() here. */
 -#define STRERROR(errnum) strerror_r(abs(errnum), (char[ERRNO_BUF_LEN]){}, ERRNO_BUF_LEN)
+-
 +static inline const char * STRERROR(int errnum);
- 
++
 +static inline const char * STRERROR(int errnum) {
 +#ifdef __GLIBC__
 +        return strerror_r(abs(errnum), (char[ERRNO_BUF_LEN]){}, ERRNO_BUF_LEN);
@@ -37,5 +38,5 @@ index 091f99c590..eb5c1f9961 100644
   * Note that we can't use ({ … }) to define a temporary variable, so errnum is
   * evaluated twice. */
 -- 
-2.39.2
+2.34.1
 
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0028-sd-event-Make-malloc_trim-conditional-on-glibc.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0020-sd-event-Make-malloc_trim-conditional-on-glibc.patch
similarity index 85%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0028-sd-event-Make-malloc_trim-conditional-on-glibc.patch
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0020-sd-event-Make-malloc_trim-conditional-on-glibc.patch
index c9ec00012e..b83fffe793 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0028-sd-event-Make-malloc_trim-conditional-on-glibc.patch
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0020-sd-event-Make-malloc_trim-conditional-on-glibc.patch
@@ -1,7 +1,7 @@
-From 148645ba8b62f04c7c5ff5907378663f97880f22 Mon Sep 17 00:00:00 2001
+From 9eb4867b4e2dbdb2484ae854022aff97e2f0feb3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 2 Aug 2023 12:06:27 -0700
-Subject: [PATCH 1/4] sd-event: Make malloc_trim() conditional on glibc
+Subject: [PATCH 20/22] sd-event: Make malloc_trim() conditional on glibc
 
 musl does not have this API
 
@@ -12,28 +12,28 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/src/libsystemd/sd-event/sd-event.c b/src/libsystemd/sd-event/sd-event.c
-index aba458185b..48c94a7672 100644
+index 288798a0dc..6419a7f216 100644
 --- a/src/libsystemd/sd-event/sd-event.c
 +++ b/src/libsystemd/sd-event/sd-event.c
 @@ -1874,7 +1874,7 @@ _public_ int sd_event_add_exit(
  }
-
+ 
  _public_ int sd_event_trim_memory(void) {
 -        int r;
 +        int r = 0;
-
+ 
          /* A default implementation of a memory pressure callback. Simply releases our own allocation caches
           * and glibc's. This is automatically used when people call sd_event_add_memory_pressure() with a
 @@ -1888,7 +1888,9 @@ _public_ int sd_event_trim_memory(void) {
-
+ 
          usec_t before_timestamp = now(CLOCK_MONOTONIC);
          hashmap_trim_pools();
 +#ifdef __GLIBC__
          r = malloc_trim(0);
 +#endif
          usec_t after_timestamp = now(CLOCK_MONOTONIC);
-
+ 
          if (r > 0)
---
-2.41.0
+-- 
+2.34.1
 
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0029-shared-Do-not-use-malloc_info-on-musl.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0021-shared-Do-not-use-malloc_info-on-musl.patch
similarity index 68%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0029-shared-Do-not-use-malloc_info-on-musl.patch
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0021-shared-Do-not-use-malloc_info-on-musl.patch
index 8e386551a1..7eff069bb7 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0029-shared-Do-not-use-malloc_info-on-musl.patch
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0021-shared-Do-not-use-malloc_info-on-musl.patch
@@ -1,7 +1,7 @@
-From 9430646e72ea5d260ade300038a6d976fecf7da5 Mon Sep 17 00:00:00 2001
+From 502597b9ddd6b145541b23fadca0b1d3ca9f6367 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 2 Aug 2023 12:20:40 -0700
-Subject: [PATCH 4/4] shared: Do not use malloc_info on musl
+Subject: [PATCH 21/22] shared: Do not use malloc_info on musl
 
 Upstream-Status: Inappropriate [musl-specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
@@ -10,9 +10,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/shared/common-signal.c | 4 ++--
  2 files changed, 5 insertions(+), 4 deletions(-)
 
+diff --git a/src/shared/bus-util.c b/src/shared/bus-util.c
+index 74f148c8b4..2d862a123d 100644
 --- a/src/shared/bus-util.c
 +++ b/src/shared/bus-util.c
-@@ -617,15 +617,16 @@ static int method_dump_memory_state_by_f
+@@ -611,15 +611,16 @@ static int method_dump_memory_state_by_fd(sd_bus_message *message, void *userdat
          _cleanup_close_ int fd = -EBADF;
          size_t dump_size;
          FILE *f;
@@ -31,9 +33,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
          if (r < 0)
                  return r;
  
+diff --git a/src/shared/common-signal.c b/src/shared/common-signal.c
+index 8e70e365dd..9e782caec9 100644
 --- a/src/shared/common-signal.c
 +++ b/src/shared/common-signal.c
-@@ -65,12 +65,12 @@ int sigrtmin18_handler(sd_event_source *
+@@ -65,12 +65,12 @@ int sigrtmin18_handler(sd_event_source *s, const struct signalfd_siginfo *si, vo
                          log_oom();
                          break;
                  }
@@ -48,3 +52,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
                  (void) memstream_dump(LOG_INFO, &m);
                  break;
          }
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0022-avoid-missing-LOCK_EX-declaration.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0022-avoid-missing-LOCK_EX-declaration.patch
new file mode 100644
index 0000000000..24f3bf74a0
--- /dev/null
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0022-avoid-missing-LOCK_EX-declaration.patch
@@ -0,0 +1,43 @@
+From fd52f1764647e03a35e8f0ed0ef952049073ccbd Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Tue, 2 Jan 2024 11:03:27 +0800
+Subject: [PATCH 22/22] avoid missing LOCK_EX declaration
+
+This only happens on MUSL. Include sys/file.h to avoid compilation
+error about missing LOCK_EX declaration.
+
+Upstream-Status: Inappropriate [musl specific]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/core/exec-invoke.c | 1 +
+ src/shared/dev-setup.h | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/src/core/exec-invoke.c b/src/core/exec-invoke.c
+index 70d963e269..7084811439 100644
+--- a/src/core/exec-invoke.c
++++ b/src/core/exec-invoke.c
+@@ -4,6 +4,7 @@
+ #include <sys/ioctl.h>
+ #include <sys/mount.h>
+ #include <sys/prctl.h>
++#include <sys/file.h>
+ 
+ #if HAVE_PAM
+ #include <security/pam_appl.h>
+diff --git a/src/shared/dev-setup.h b/src/shared/dev-setup.h
+index 5339bc4e5e..0697495f23 100644
+--- a/src/shared/dev-setup.h
++++ b/src/shared/dev-setup.h
+@@ -2,6 +2,7 @@
+ #pragma once
+ 
+ #include <sys/types.h>
++#include <sys/file.h>
+ 
+ int lock_dev_console(void);
+ 
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_254.4.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_254.4.bb
deleted file mode 100644
index 0b211948cf..0000000000
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_254.4.bb
+++ /dev/null
@@ -1,74 +0,0 @@
-SUMMARY = "libsystemd static library"
-DESCRIPTION = "libsystemd static library built specifically as an integral component of sdbus-c++"
-
-SECTION = "libs"
-
-LICENSE = "LGPL-2.1-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
-
-inherit meson pkgconfig
-
-DEPENDS += "gperf-native gettext-native util-linux libcap util-linux python3-jinja2-native"
-
-SRCREV = "2e7504449a51fb38db9cd2da391c6434f82def51"
-SRCBRANCH = "v254-stable"
-SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH} \
-           file://static-libsystemd-pkgconfig.patch \
-           "
-
-# patches needed by musl
-SRC_URI:append:libc-musl = " ${SRC_URI_MUSL}"
-
-SRC_URI_MUSL = "\
-               file://0009-missing_type.h-add-comparison_fn_t.patch \
-               file://0010-add-fallback-parse_printf_format-implementation.patch \
-               file://0011-src-basic-missing.h-check-for-missing-strndupa.patch \
-               file://0012-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch \
-               file://0013-add-missing-FTW_-macros-for-musl.patch \
-               file://0014-Use-uintmax_t-for-handling-rlim_t.patch \
-               file://0016-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch \
-               file://0017-Define-glibc-compatible-basename-for-non-glibc-syste.patch \
-               file://0018-Do-not-disable-buffering-when-writing-to-oom_score_a.patch \
-               file://0019-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch \
-               file://0020-avoid-redefinition-of-prctl_mm_map-structure.patch \
-               file://0021-do-not-disable-buffer-in-writing-files.patch \
-               file://0022-Handle-__cpu_mask-usage.patch \
-               file://0023-Handle-missing-gshadow.patch \
-               file://0024-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch \
-               file://0005-pass-correct-parameters-to-getdents64.patch \
-               file://0001-Adjust-for-musl-headers.patch \
-               file://0006-test-bus-error-strerror-is-assumed-to-be-GNU-specifi.patch \
-               file://0003-errno-util-Make-STRERROR-portable-for-musl.patch \
-               file://0028-sd-event-Make-malloc_trim-conditional-on-glibc.patch \
-               file://0029-shared-Do-not-use-malloc_info-on-musl.patch \
-               "
-
-PACKAGECONFIG ??= "gshadow idn"
-PACKAGECONFIG:remove:libc-musl = " gshadow idn"
-PACKAGECONFIG[gshadow] = "-Dgshadow=true,-Dgshadow=false"
-PACKAGECONFIG[idn] = "-Didn=true,-Didn=false"
-
-CFLAGS:append:libc-musl = " -D__UAPI_DEF_ETHHDR=0 "
-
-EXTRA_OEMESON += "-Dstatic-libsystemd=pic"
-
-S = "${WORKDIR}/git"
-
-RDEPENDS:${PN}-dev = ""
-
-do_compile() {
-    ninja -v ${PARALLEL_MAKE} version.h
-    ninja -v ${PARALLEL_MAKE} libsystemd.a
-    ninja -v ${PARALLEL_MAKE} src/libsystemd/libsystemd.pc
-}
-
-do_install () {
-    install -d ${D}${libdir}
-    install ${B}/libsystemd.a ${D}${libdir}
-
-    install -d ${D}${includedir}/systemd
-    install ${S}/src/systemd/*.h ${D}${includedir}/systemd
-
-    install -d ${D}${libdir}/pkgconfig
-    install ${B}/src/libsystemd/libsystemd.pc ${D}${libdir}/pkgconfig
-}
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_255.4.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_255.4.bb
new file mode 100644
index 0000000000..3b44e02376
--- /dev/null
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_255.4.bb
@@ -0,0 +1,77 @@
+SUMMARY = "libsystemd static library"
+DESCRIPTION = "libsystemd static library built specifically as an integral component of sdbus-c++"
+
+SECTION = "libs"
+
+LICENSE = "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
+
+inherit meson pkgconfig
+
+DEPENDS += "gperf-native gettext-native util-linux libcap util-linux python3-jinja2-native"
+
+SRCREV = "387a14a7b67b8b76adaed4175e14bb7e39b2f738"
+SRCBRANCH = "v255-stable"
+SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH} \
+           file://static-libsystemd-pkgconfig.patch \
+           "
+
+# patches needed by musl
+SRC_URI:append:libc-musl = " ${SRC_URI_MUSL}"
+
+SRC_URI_MUSL = "\
+    file://0001-missing_type.h-add-comparison_fn_t.patch \
+    file://0002-add-fallback-parse_printf_format-implementation.patch \
+    file://0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
+    file://0003-src-basic-missing.h-check-for-missing-strndupa.patch \
+    file://0004-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch \
+    file://0005-add-missing-FTW_-macros-for-musl.patch \
+    file://0006-Use-uintmax_t-for-handling-rlim_t.patch \
+    file://0007-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch \
+    file://0008-Define-glibc-compatible-basename-for-non-glibc-syste.patch \
+    file://0008-implment-systemd-sysv-install-for-OE.patch \
+    file://0009-Do-not-disable-buffering-when-writing-to-oom_score_a.patch \
+    file://0010-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch \
+    file://0011-avoid-redefinition-of-prctl_mm_map-structure.patch \
+    file://0012-do-not-disable-buffer-in-writing-files.patch \
+    file://0013-Handle-__cpu_mask-usage.patch \
+    file://0014-Handle-missing-gshadow.patch \
+    file://0015-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch \
+    file://0016-pass-correct-parameters-to-getdents64.patch \
+    file://0017-Adjust-for-musl-headers.patch \
+    file://0018-test-bus-error-strerror-is-assumed-to-be-GNU-specifi.patch \
+    file://0019-errno-util-Make-STRERROR-portable-for-musl.patch \
+    file://0020-sd-event-Make-malloc_trim-conditional-on-glibc.patch \
+    file://0021-shared-Do-not-use-malloc_info-on-musl.patch \
+    file://0022-avoid-missing-LOCK_EX-declaration.patch \
+"
+
+PACKAGECONFIG ??= "gshadow idn"
+PACKAGECONFIG:remove:libc-musl = " gshadow idn"
+PACKAGECONFIG[gshadow] = "-Dgshadow=true,-Dgshadow=false"
+PACKAGECONFIG[idn] = "-Didn=true,-Didn=false"
+
+CFLAGS:append:libc-musl = " -D__UAPI_DEF_ETHHDR=0 "
+
+EXTRA_OEMESON += "-Dstatic-libsystemd=pic"
+
+S = "${WORKDIR}/git"
+
+RDEPENDS:${PN}-dev = ""
+
+do_compile() {
+    ninja -v ${PARALLEL_MAKE} version.h
+    ninja -v ${PARALLEL_MAKE} libsystemd.a
+    ninja -v ${PARALLEL_MAKE} src/libsystemd/libsystemd.pc
+}
+
+do_install () {
+    install -d ${D}${libdir}
+    install ${B}/libsystemd.a ${D}${libdir}
+
+    install -d ${D}${includedir}/systemd
+    install ${S}/src/systemd/*.h ${D}${includedir}/systemd
+
+    install -d ${D}${libdir}/pkgconfig
+    install ${B}/src/libsystemd/libsystemd.pc ${D}${libdir}/pkgconfig
+}
-- 
2.44.0


