Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.378.1616693138825705670
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Mar 2021 10:25:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=U6aSTEoD;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id b7so4252458ejv.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Mar 2021 10:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FtwtdQ6nRKo80qRWWjUtuCeQMb7iZkd1LmQR4kFfCY4=;
        b=U6aSTEoDF2s10CDUR179RMJ52rczW5JMFKZYkwYa/xslxAoTbuTLVw3K5AWRmU898L
         K9AbWgXkDV9qgPMs85Ti+rPqPZOdOgKrgxhZJsSUg/I4jYDFSzuKDTIYbHAhcTqeWuFS
         uGp+4X4phojuvEcEXaTafrZjvI8ZxCFKUmR6it/FoweHzbVu0FF8eGMx88hMIVRdQDsb
         Hoi5fa/mRtvwxUH5+/ys82FcPuW+PNoSiCwsCpJ29tQN40TPy0JEZiv/4lP4uHqNIHDJ
         it1gWanmMaG5StaPJyV7K9b1F9XVUSuDMcKjkXG02p+uHVdSc/Wzz6XwSYw1W2wsAtjC
         Qyqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FtwtdQ6nRKo80qRWWjUtuCeQMb7iZkd1LmQR4kFfCY4=;
        b=kbFS/kXUar7NeximapKGMzl+qVDJeuCK/IvQTEYeG3Cht6U1sKqmScdlq7UQ89RLzN
         agBtdEWwTwhwlZye5nkjqoq7fgmsUZhTUxKUxhFlK/zaxco35EUEVKYgDy8KFkl2sGcA
         oeyqpWi2ZwwKMlgTA/uDsKYuojoLhmlL5MKAAEhtVDUnSoKqNygCJ9KDaxH2RGT4qb3Z
         Q/SjgC9ZKkSL67n+O57bGGQDqSvuA0HuFnRyzr2w2oBj3ZZlIM0CMiaT+kXtndKvCm1g
         ou151yIhZRS2I5/M/RtB3Fu9YPBqJ+jcHIxXLrstNClS5YkEJSKgvro+uUErCpxXliht
         XbPw==
X-Gm-Message-State: AOAM5307tYrH1A8nRyffev6hdflbK/0s4gFpJzSjEfYI5+2TrrqC9GZh
	6UoaGeyH14D+XGlzerRqkPjiKwSrfP4=
X-Google-Smtp-Source: ABdhPJygHlyrC4ALKX1GP6G9piI4knbnisoZgCGZA1ubuy321nOFf/Dftj2UJ9YdEKYNRs1aaEdLXQ==
X-Received: by 2002:a17:906:7194:: with SMTP id h20mr10655419ejk.154.1616693137184;
        Thu, 25 Mar 2021 10:25:37 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id h8sm2925260ede.25.2021.03.25.10.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 10:25:36 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] open-vm-tools: move to meta-networking
Date: Thu, 25 Mar 2021 18:25:30 +0100
Message-Id: <20210325172532.1099941-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210325172532.1099941-1-Martin.Jansa@gmail.com>
References: <20210325172532.1099941-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* and make it skipped only when meta-filesystem is missing as well

* depends on libdnet from meta-networking and nothing in meta-oe depends on open-vm-tools

* update packagegroup-meta-oe to match this, without either of these layers packagegroup-meta-oe is currently failing with:

  ERROR: Nothing RPROVIDES 'open-vm-tools' (but meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb RDEPENDS on or otherwise requires it)
  open-vm-tools was skipped: Requires meta-networking and meta-filesystems to be present.
  NOTE: Runtime target 'open-vm-tools' is unbuildable, removing...
  Missing or unbuildable dependency chain was: ['open-vm-tools']
  ERROR: Required build target 'packagegroup-meta-oe' has no buildable providers.
  Missing or unbuildable dependency chain was: ['packagegroup-meta-oe', 'open-vm-tools']

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...itHub-Issue-367.-Remove-references-to-deprecated-G_.patch | 0
 ...ake-HgfsConvertFromNtTimeNsec-aware-of-64-bit-time_.patch | 0
 .../0001-configure.ac-don-t-use-dnet-config.patch            | 0
 .../0001-hgfsmounter-Makefile.am-support-usrmerge.patch      | 0
 .../open-vm-tools/0001-pollGtk-Drop-volatile-qualifier.patch | 0
 .../0001-utilBacktrace-Ignore-Warray-bounds.patch            | 0
 .../open-vm-tools/0002-add-include-sys-sysmacros.h.patch     | 0
 ...2-hgfsServerLinux-Consider-64bit-time_t-possibility.patch | 0
 .../0003-Use-configure-test-for-struct-timespec.patch        | 0
 .../0004-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch    | 0
 ...se-configure-to-test-for-feature-instead-of-platfor.patch | 0
 .../0006-Use-configure-test-for-sys-stat.h-include.patch     | 0
 .../0007-Fix-subdir-objects-configure-error.patch            | 0
 .../0008-include-poll.h-instead-of-sys-poll.h.patch          | 0
 .../open-vm-tools/0009-Rename-poll.h-to-vm_poll.h.patch      | 0
 ...0010-use-posix-strerror_r-unless-on-gnu-libc-system.patch | 0
 .../0011-Use-uintmax_t-for-handling-rlim_t.patch             | 0
 .../0012-Use-off64_t-instead-of-__off64_t.patch              | 0
 .../0013-misc-Do-not-print-NULL-string-into-logs.patch       | 0
 .../recipes-support/open-vm-tools/open-vm-tools/tools.conf   | 0
 .../open-vm-tools/open-vm-tools/vmtoolsd.init                | 0
 .../open-vm-tools/open-vm-tools/vmtoolsd.service             | 0
 .../recipes-support/open-vm-tools/open-vm-tools_11.0.1.bb    | 5 ++---
 .../recipes-core/packagegroups/packagegroup-meta-oe.bbappend | 3 +++
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb   | 4 ++--
 25 files changed, 7 insertions(+), 5 deletions(-)
 rename {meta-oe => meta-networking}/recipes-support/open-vm-tools/open-vm-tools/0001-GitHub-Issue-367.-Remove-references-to-deprecated-G_.patch (100%)
 rename {meta-oe => meta-networking}/recipes-support/open-vm-tools/open-vm-tools/0001-Make-HgfsConvertFromNtTimeNsec-aware-of-64-bit-time_.patch (100%)
 rename {meta-oe => meta-networking}/recipes-support/open-vm-tools/open-vm-tools/0001-configure.ac-don-t-use-dnet-config.patch (100%)
 rename {meta-oe => meta-networking}/recipes-support/open-vm-tools/open-vm-tools/0001-hgfsmounter-Makefile.am-support-usrmerge.patch (100%)
 rename {meta-oe => meta-networking}/recipes-support/open-vm-tools/open-vm-tools/0001-pollGtk-Drop-volatile-qualifier.patch (100%)
 rename {meta-oe => meta-networking}/recipes-support/open-vm-tools/open-vm-tools/0001-utilBacktrace-Ignore-Warray-bounds.patch (100%)
 rename {meta-oe => meta-networking}/recipes-support/open-vm-tools/open-vm-tools/0002-add-include-sys-sysmacros.h.patch (100%)
 rename {meta-oe => meta-networking}/recipes-support/open-vm-tools/open-vm-tools/0002-hgfsServerLinux-Consider-64bit-time_t-possibility.patch (100%)
 rename {meta-oe => meta-networking}/recipes-support/open-vm-tools/open-vm-tools/0003-Use-configure-test-for-struct-timespec.patch (100%)
 rename {meta-oe => meta-networking}/recipes-support/open-vm-tools/open-vm-tools/0004-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch (100%)
 rename {meta-oe => meta-networking}/recipes-support/open-vm-tools/open-vm-tools/0005-Use-configure-to-test-for-feature-instead-of-platfor.patch (100%)
 rename {meta-oe => meta-networking}/recipes-support/open-vm-tools/open-vm-tools/0006-Use-configure-test-for-sys-stat.h-include.patch (100%)
 rename {meta-oe => meta-networking}/recipes-support/open-vm-tools/open-vm-tools/0007-Fix-subdir-objects-configure-error.patch (100%)
 rename {meta-oe => meta-networking}/recipes-support/open-vm-tools/open-vm-tools/0008-include-poll.h-instead-of-sys-poll.h.patch (100%)
 rename {meta-oe => meta-networking}/recipes-support/open-vm-tools/open-vm-tools/0009-Rename-poll.h-to-vm_poll.h.patch (100%)
 rename {meta-oe => meta-networking}/recipes-support/open-vm-tools/open-vm-tools/0010-use-posix-strerror_r-unless-on-gnu-libc-system.patch (100%)
 rename {meta-oe => meta-networking}/recipes-support/open-vm-tools/open-vm-tools/0011-Use-uintmax_t-for-handling-rlim_t.patch (100%)
 rename {meta-oe => meta-networking}/recipes-support/open-vm-tools/open-vm-tools/0012-Use-off64_t-instead-of-__off64_t.patch (100%)
 rename {meta-oe => meta-networking}/recipes-support/open-vm-tools/open-vm-tools/0013-misc-Do-not-print-NULL-string-into-logs.patch (100%)
 rename {meta-oe => meta-networking}/recipes-support/open-vm-tools/open-vm-tools/tools.conf (100%)
 rename {meta-oe => meta-networking}/recipes-support/open-vm-tools/open-vm-tools/vmtoolsd.init (100%)
 rename {meta-oe => meta-networking}/recipes-support/open-vm-tools/open-vm-tools/vmtoolsd.service (100%)
 rename {meta-oe => meta-networking}/recipes-support/open-vm-tools/open-vm-tools_11.0.1.bb (95%)

diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-GitHub-Issue-367.-Remove-references-to-deprecated-G_.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-GitHub-Issue-367.-Remove-references-to-deprecated-G_.patch
similarity index 100%
rename from meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-GitHub-Issue-367.-Remove-references-to-deprecated-G_.patch
rename to meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-GitHub-Issue-367.-Remove-references-to-deprecated-G_.patch
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Make-HgfsConvertFromNtTimeNsec-aware-of-64-bit-time_.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-Make-HgfsConvertFromNtTimeNsec-aware-of-64-bit-time_.patch
similarity index 100%
rename from meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Make-HgfsConvertFromNtTimeNsec-aware-of-64-bit-time_.patch
rename to meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-Make-HgfsConvertFromNtTimeNsec-aware-of-64-bit-time_.patch
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-configure.ac-don-t-use-dnet-config.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-configure.ac-don-t-use-dnet-config.patch
similarity index 100%
rename from meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-configure.ac-don-t-use-dnet-config.patch
rename to meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-configure.ac-don-t-use-dnet-config.patch
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-hgfsmounter-Makefile.am-support-usrmerge.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-hgfsmounter-Makefile.am-support-usrmerge.patch
similarity index 100%
rename from meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-hgfsmounter-Makefile.am-support-usrmerge.patch
rename to meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-hgfsmounter-Makefile.am-support-usrmerge.patch
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-pollGtk-Drop-volatile-qualifier.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-pollGtk-Drop-volatile-qualifier.patch
similarity index 100%
rename from meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-pollGtk-Drop-volatile-qualifier.patch
rename to meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-pollGtk-Drop-volatile-qualifier.patch
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-utilBacktrace-Ignore-Warray-bounds.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-utilBacktrace-Ignore-Warray-bounds.patch
similarity index 100%
rename from meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-utilBacktrace-Ignore-Warray-bounds.patch
rename to meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-utilBacktrace-Ignore-Warray-bounds.patch
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0002-add-include-sys-sysmacros.h.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0002-add-include-sys-sysmacros.h.patch
similarity index 100%
rename from meta-oe/recipes-support/open-vm-tools/open-vm-tools/0002-add-include-sys-sysmacros.h.patch
rename to meta-networking/recipes-support/open-vm-tools/open-vm-tools/0002-add-include-sys-sysmacros.h.patch
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0002-hgfsServerLinux-Consider-64bit-time_t-possibility.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0002-hgfsServerLinux-Consider-64bit-time_t-possibility.patch
similarity index 100%
rename from meta-oe/recipes-support/open-vm-tools/open-vm-tools/0002-hgfsServerLinux-Consider-64bit-time_t-possibility.patch
rename to meta-networking/recipes-support/open-vm-tools/open-vm-tools/0002-hgfsServerLinux-Consider-64bit-time_t-possibility.patch
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0003-Use-configure-test-for-struct-timespec.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0003-Use-configure-test-for-struct-timespec.patch
similarity index 100%
rename from meta-oe/recipes-support/open-vm-tools/open-vm-tools/0003-Use-configure-test-for-struct-timespec.patch
rename to meta-networking/recipes-support/open-vm-tools/open-vm-tools/0003-Use-configure-test-for-struct-timespec.patch
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0004-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0004-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch
similarity index 100%
rename from meta-oe/recipes-support/open-vm-tools/open-vm-tools/0004-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch
rename to meta-networking/recipes-support/open-vm-tools/open-vm-tools/0004-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0005-Use-configure-to-test-for-feature-instead-of-platfor.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0005-Use-configure-to-test-for-feature-instead-of-platfor.patch
similarity index 100%
rename from meta-oe/recipes-support/open-vm-tools/open-vm-tools/0005-Use-configure-to-test-for-feature-instead-of-platfor.patch
rename to meta-networking/recipes-support/open-vm-tools/open-vm-tools/0005-Use-configure-to-test-for-feature-instead-of-platfor.patch
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0006-Use-configure-test-for-sys-stat.h-include.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0006-Use-configure-test-for-sys-stat.h-include.patch
similarity index 100%
rename from meta-oe/recipes-support/open-vm-tools/open-vm-tools/0006-Use-configure-test-for-sys-stat.h-include.patch
rename to meta-networking/recipes-support/open-vm-tools/open-vm-tools/0006-Use-configure-test-for-sys-stat.h-include.patch
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0007-Fix-subdir-objects-configure-error.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0007-Fix-subdir-objects-configure-error.patch
similarity index 100%
rename from meta-oe/recipes-support/open-vm-tools/open-vm-tools/0007-Fix-subdir-objects-configure-error.patch
rename to meta-networking/recipes-support/open-vm-tools/open-vm-tools/0007-Fix-subdir-objects-configure-error.patch
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0008-include-poll.h-instead-of-sys-poll.h.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0008-include-poll.h-instead-of-sys-poll.h.patch
similarity index 100%
rename from meta-oe/recipes-support/open-vm-tools/open-vm-tools/0008-include-poll.h-instead-of-sys-poll.h.patch
rename to meta-networking/recipes-support/open-vm-tools/open-vm-tools/0008-include-poll.h-instead-of-sys-poll.h.patch
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0009-Rename-poll.h-to-vm_poll.h.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0009-Rename-poll.h-to-vm_poll.h.patch
similarity index 100%
rename from meta-oe/recipes-support/open-vm-tools/open-vm-tools/0009-Rename-poll.h-to-vm_poll.h.patch
rename to meta-networking/recipes-support/open-vm-tools/open-vm-tools/0009-Rename-poll.h-to-vm_poll.h.patch
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0010-use-posix-strerror_r-unless-on-gnu-libc-system.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0010-use-posix-strerror_r-unless-on-gnu-libc-system.patch
similarity index 100%
rename from meta-oe/recipes-support/open-vm-tools/open-vm-tools/0010-use-posix-strerror_r-unless-on-gnu-libc-system.patch
rename to meta-networking/recipes-support/open-vm-tools/open-vm-tools/0010-use-posix-strerror_r-unless-on-gnu-libc-system.patch
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0011-Use-uintmax_t-for-handling-rlim_t.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0011-Use-uintmax_t-for-handling-rlim_t.patch
similarity index 100%
rename from meta-oe/recipes-support/open-vm-tools/open-vm-tools/0011-Use-uintmax_t-for-handling-rlim_t.patch
rename to meta-networking/recipes-support/open-vm-tools/open-vm-tools/0011-Use-uintmax_t-for-handling-rlim_t.patch
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0012-Use-off64_t-instead-of-__off64_t.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0012-Use-off64_t-instead-of-__off64_t.patch
similarity index 100%
rename from meta-oe/recipes-support/open-vm-tools/open-vm-tools/0012-Use-off64_t-instead-of-__off64_t.patch
rename to meta-networking/recipes-support/open-vm-tools/open-vm-tools/0012-Use-off64_t-instead-of-__off64_t.patch
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0013-misc-Do-not-print-NULL-string-into-logs.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0013-misc-Do-not-print-NULL-string-into-logs.patch
similarity index 100%
rename from meta-oe/recipes-support/open-vm-tools/open-vm-tools/0013-misc-Do-not-print-NULL-string-into-logs.patch
rename to meta-networking/recipes-support/open-vm-tools/open-vm-tools/0013-misc-Do-not-print-NULL-string-into-logs.patch
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/tools.conf b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/tools.conf
similarity index 100%
rename from meta-oe/recipes-support/open-vm-tools/open-vm-tools/tools.conf
rename to meta-networking/recipes-support/open-vm-tools/open-vm-tools/tools.conf
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/vmtoolsd.init b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/vmtoolsd.init
similarity index 100%
rename from meta-oe/recipes-support/open-vm-tools/open-vm-tools/vmtoolsd.init
rename to meta-networking/recipes-support/open-vm-tools/open-vm-tools/vmtoolsd.init
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/vmtoolsd.service b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/vmtoolsd.service
similarity index 100%
rename from meta-oe/recipes-support/open-vm-tools/open-vm-tools/vmtoolsd.service
rename to meta-networking/recipes-support/open-vm-tools/open-vm-tools/vmtoolsd.service
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_11.0.1.bb b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.0.1.bb
similarity index 95%
rename from meta-oe/recipes-support/open-vm-tools/open-vm-tools_11.0.1.bb
rename to meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.0.1.bb
index 69ef6056d7..832fab1eac 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_11.0.1.bb
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.0.1.bb
@@ -111,7 +111,6 @@ INITSCRIPT_NAME_${PN} = "vmtoolsd"
 INITSCRIPT_PARAMS_${PN} = "start 90 2 3 4 5 . stop 60 0 1 6 ."
 
 python() {
-    if 'networking-layer' not in d.getVar('BBFILE_COLLECTIONS').split() or \
-        'filesystems-layer' not in d.getVar('BBFILE_COLLECTIONS').split():
-        raise bb.parse.SkipRecipe('Requires meta-networking and meta-filesystems to be present.')
+    if 'filesystems-layer' not in d.getVar('BBFILE_COLLECTIONS').split():
+        raise bb.parse.SkipRecipe('Requires meta-filesystems to be present to provide fuse.')
 }
diff --git a/meta-oe/dynamic-layers/networking-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend b/meta-oe/dynamic-layers/networking-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
index b39a4d68ff..09c478eb10 100644
--- a/meta-oe/dynamic-layers/networking-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
+++ b/meta-oe/dynamic-layers/networking-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
@@ -1,3 +1,6 @@
 RDEPENDS_packagegroup-meta-oe-devtools += "\
     valijson \
 "
+
+RDEPENDS_packagegroup-meta-oe-support_append_x86 = "${@bb.utils.contains('BBFILE_COLLECTIONS', 'filesystems-layer', ' open-vm-tools', '', d)}"
+RDEPENDS_packagegroup-meta-oe-support_append_x86-64 = "${@bb.utils.contains('BBFILE_COLLECTIONS', 'filesystems-layer', ' open-vm-tools', '', d)}"
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 4bf1402ac4..2b79b3d8b5 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -912,8 +912,8 @@ RDEPENDS_packagegroup-meta-oe-support ="\
 RDEPENDS_packagegroup-meta-oe-support_append_armv7a = " ne10"
 RDEPENDS_packagegroup-meta-oe-support_append_armv7ve = " ne10"
 RDEPENDS_packagegroup-meta-oe-support_append_aarch64 = " ne10"
-RDEPENDS_packagegroup-meta-oe-support_append_x86 = " mcelog mce-inject mce-test open-vm-tools vboxguestdrivers"
-RDEPENDS_packagegroup-meta-oe-support_append_x86-64 = " mcelog mce-inject mce-test open-vm-tools vboxguestdrivers"
+RDEPENDS_packagegroup-meta-oe-support_append_x86 = " mcelog mce-inject mce-test vboxguestdrivers"
+RDEPENDS_packagegroup-meta-oe-support_append_x86-64 = " mcelog mce-inject mce-test vboxguestdrivers"
 
 RDEPENDS_packagegroup-meta-oe-support-python2 ="\
     ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', 'lio-utils', '', d), "", d)} \
