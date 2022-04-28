Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DE22C433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 14:42:18 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web08.11397.1651156933803516585
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 07:42:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TPIggDTI;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id iq10so4548006pjb.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 07:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PHftLtRd4gshY6Nd+Wg3bs+UmAIdS2SSrYNAsVGG+us=;
        b=TPIggDTIETqmbxOlB52c97qfQTjoopObYt7+Lk+IvZ3Ca74JbCXZp/DVAqNO8MkTL7
         xrScbQcyfXBln7zM/Smsrdtu7N6qz1egIFKdqPxiTIsac9LXir1Y6uGTjP8cBtNPhxJs
         taVaw1c/Z50NI/aj+eSq7fnFqWtxT8bfZZIEFqdlewfj3tBN1YzRW7/NP7wrHz/3nxtD
         A66zaM7rChZbuk50Um7yY4VL/6WBjqbcrICG8uOaIWDfPfpyEMtmVaA2SDoz4LoIS4Id
         yMecvHHqEPK/muGPpFCvGG/pfEg0c30mo+JLAcHPr2lCsucKBwS9zgrKDJSAtvLikQC1
         8saA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PHftLtRd4gshY6Nd+Wg3bs+UmAIdS2SSrYNAsVGG+us=;
        b=SUPvrITXLlsOPZVos6AaL7M/OZglAw5kHiMO2Gscu9u2Kcg4ObcCoxnrBr+xgk91Fa
         FoDKgXrO/Jb2RgaNN03C5pvPLEDeoSB6G7ik40fopJSUD/G0plq71LjArpjRx3+5tsYB
         Oi9cf8w+3JE5VicxIGPhU3ucQ6/llbIWOm5pBaEeXx/UGkoglCsRDn1w0y8fW3d+MAYd
         RpuFri/+5qR6r6NfSL2iNxVMm0aboZOOgiiqk/mHc/z3dO0i2QLBUnLIa2SCVXZ09q+m
         idguOECEoGINeXpQumOAceOfHZReZAm5U9sal/J/7M5ZQ/JkWvlaL6iu3U0UVY4dV6BR
         Y6mA==
X-Gm-Message-State: AOAM533HQRh/dhkO4rTlU4OlzFYsR7IqLn7UkOxFuBOIO7uWgqLMZe8b
	l6bogH7QOTpAbkkGiFYUCou2coZzURfpww==
X-Google-Smtp-Source: 
 ABdhPJzA+5JEMBPIjRY9Ujr46OfFOuJLcouXBF6jaIrHPaIiAxrBGzANDyFLJIPdzPxmb/BRmR9YIA==
X-Received: by 2002:a17:903:28c:b0:15d:1fc6:8fcd with SMTP id
 j12-20020a170903028c00b0015d1fc68fcdmr18890431plr.20.1651156932781;
        Thu, 28 Apr 2022 07:42:12 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 k17-20020a628e11000000b0050d8d373331sm82292pfe.214.2022.04.28.07.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 07:42:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH] babl: Fix build with meson 0.62+
Date: Thu, 28 Apr 2022 07:42:06 -0700
Message-Id: <20220428144206.1934684-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Apr 2022 14:42:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96842

backport needed patches to get it going with newer meson

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...t-run-git-rev-parse-during-configure.patch |  35 +++++
 ...0001-meson-fix-misspelled-kwarg-name.patch |  36 +++++
 .../babl/babl/0002-meson-Various-fixes.patch  | 132 ++++++++++++++++++
 meta-gnome/recipes-gimp/babl/babl_0.1.92.bb   |   6 +-
 4 files changed, 208 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gimp/babl/babl/0001-meson-Do-not-run-git-rev-parse-during-configure.patch
 create mode 100644 meta-gnome/recipes-gimp/babl/babl/0001-meson-fix-misspelled-kwarg-name.patch
 create mode 100644 meta-gnome/recipes-gimp/babl/babl/0002-meson-Various-fixes.patch

diff --git a/meta-gnome/recipes-gimp/babl/babl/0001-meson-Do-not-run-git-rev-parse-during-configure.patch b/meta-gnome/recipes-gimp/babl/babl/0001-meson-Do-not-run-git-rev-parse-during-configure.patch
new file mode 100644
index 0000000000..bb129a4178
--- /dev/null
+++ b/meta-gnome/recipes-gimp/babl/babl/0001-meson-Do-not-run-git-rev-parse-during-configure.patch
@@ -0,0 +1,35 @@
+From 0e41b11b23c91293d1b39a8ec4cb80c68fb26ad7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 28 Apr 2022 07:35:31 -0700
+Subject: [PATCH] meson: Do not run git rev-parse during configure
+
+This option will try to deduce if babl is being built from git tree or
+release tarball, there should be a better way like checking for .git
+directory etc. instead of doing git operations needing network
+
+see
+https://gitlab.gnome.org/GNOME/babl/-/commit/2dc7fc403fe427a889913ef0cfb71de85b4326ec#note_1439732
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 7e7a935..649b456 100644
+--- a/meson.build
++++ b/meson.build
+@@ -451,7 +451,7 @@ if git_bin.found() and run_command(
+     git_bin,
+     'rev-parse',
+     '--is-inside-work-tree',
+-    check: true,
++    check: false,
+ ).returncode() == 0
+   git_version_h = vcs_tag(
+     input : 'git-version.h.in',
+-- 
+2.36.0
+
diff --git a/meta-gnome/recipes-gimp/babl/babl/0001-meson-fix-misspelled-kwarg-name.patch b/meta-gnome/recipes-gimp/babl/babl/0001-meson-fix-misspelled-kwarg-name.patch
new file mode 100644
index 0000000000..111dac6484
--- /dev/null
+++ b/meta-gnome/recipes-gimp/babl/babl/0001-meson-fix-misspelled-kwarg-name.patch
@@ -0,0 +1,36 @@
+From ebcf4795f1132c5124d73a5ae2ca5c01319e584d Mon Sep 17 00:00:00 2001
+From: Eli Schwartz <eschwartz@archlinux.org>
+Date: Sun, 13 Mar 2022 20:26:05 -0400
+Subject: [PATCH 1/2] meson: fix misspelled kwarg name
+
+set10 doesn't have a `Description` kwarg, it does have a `description`
+kwarg though.
+
+This caused the conf variable to not have a description when it should
+have one, and newer versions of Meson with better argument validation
+error out with:
+
+meson.build:58:5: ERROR: configuration_data.set10 got unknown keyword arguments "Description"
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/babl/-/commit/b05b2826365a7dbc6ca1bf0977b848055cd0cbb6]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 487e470..2623e93 100644
+--- a/meson.build
++++ b/meson.build
+@@ -55,7 +55,7 @@ lib_name    = meson.project_name() + '-' + api_version
+ stability_version_number = (major_version != 0 ? minor_version : micro_version)
+ stable = (stability_version_number % 2 == 0)
+ 
+-conf.set10('BABL_UNSTABLE', not stable, Description:
++conf.set10('BABL_UNSTABLE', not stable, description:
+   'Define to 1 if this is an unstable version of BABL.')
+ 
+ conf.set       ('BABL_MAJOR_VERSION',    '@0@'.format(major_version))
+-- 
+2.36.0
+
diff --git a/meta-gnome/recipes-gimp/babl/babl/0002-meson-Various-fixes.patch b/meta-gnome/recipes-gimp/babl/babl/0002-meson-Various-fixes.patch
new file mode 100644
index 0000000000..919653bf22
--- /dev/null
+++ b/meta-gnome/recipes-gimp/babl/babl/0002-meson-Various-fixes.patch
@@ -0,0 +1,132 @@
+From 06e16da32dfaad02434fd9937d298ea1ece256ce Mon Sep 17 00:00:00 2001
+From: Xavier Claessens <xavier.claessens@collabora.com>
+Date: Sat, 23 Apr 2022 10:33:17 -0400
+Subject: [PATCH 2/2] meson: Various fixes
+
+- Add missing lcms dependencies. That's needed when lcms is a subproject
+  otherwise those targets does not find its headers.
+- Add lcms2 wrap so meson can build it as subproject in case the
+  dependency is not found on system.
+- Fix couple meson warnings
+- Use meson.override_dependency() so babl can be used as subproject
+  without hardcoding "babl_dep" variable name in main project.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/babl/-/commit/2dc7fc403fe427a889913ef0cfb71de85b4326ec]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ babl/meson.build       |  4 +++-
+ extensions/meson.build |  1 +
+ meson.build            |  4 +++-
+ subprojects/lcms2.wrap | 12 ++++++++++++
+ tests/meson.build      |  2 +-
+ tools/meson.build      |  2 +-
+ 6 files changed, 21 insertions(+), 4 deletions(-)
+ create mode 100644 subprojects/lcms2.wrap
+
+diff --git a/babl/meson.build b/babl/meson.build
+index d432dca..70fb131 100644
+--- a/babl/meson.build
++++ b/babl/meson.build
+@@ -138,7 +138,7 @@ babl = library(
+   link_args: babl_link_args,
+   link_with: simd_extra,
+   dependencies: babl_deps,
+-  link_depends: version_script,
++  link_depends: version_script[0],
+   version: so_version,
+   install: true,
+ )
+@@ -165,4 +165,6 @@ if build_gir
+       install: true,
+     )
+   endif
++else
++  babl_gir = []
+ endif
+diff --git a/extensions/meson.build b/extensions/meson.build
+index 23672bb..9935f29 100644
+--- a/extensions/meson.build
++++ b/extensions/meson.build
+@@ -6,6 +6,7 @@ no_cflags = []
+ babl_ext_dep = [
+   math,
+   thread,
++  lcms,
+ ]
+ 
+ # Include directories
+diff --git a/meson.build b/meson.build
+index 2623e93..7e7a935 100644
+--- a/meson.build
++++ b/meson.build
+@@ -451,6 +451,7 @@ if git_bin.found() and run_command(
+     git_bin,
+     'rev-parse',
+     '--is-inside-work-tree',
++    check: true,
+ ).returncode() == 0
+   git_version_h = vcs_tag(
+     input : 'git-version.h.in',
+@@ -531,13 +532,14 @@ babl_dep = declare_dependency(
+   link_with : babl,
+   sources: [
+     babl_version_h,
+-    is_variable('babl_gir') ? babl_gir : []
++    build_gir ? babl_gir : []
+   ],
+   variables: {
+     'babl_path'   : babl_extensions_build_dir,
+     'babl_libdir' : babl_library_build_dir,
+   },
+ )
++meson.override_dependency('babl', babl_dep)
+ 
+ ################################################################################
+ # Build summary
+diff --git a/subprojects/lcms2.wrap b/subprojects/lcms2.wrap
+new file mode 100644
+index 0000000..2cc69df
+--- /dev/null
++++ b/subprojects/lcms2.wrap
+@@ -0,0 +1,12 @@
++[wrap-file]
++directory = Little-CMS-2.12
++source_url = https://github.com/mm2/Little-CMS/archive/refs/tags/2.12.tar.gz
++source_filename = lcms2-2.12.tar.gz
++source_hash = e501f1482fc424550ef3abbf86bf1c66090e1661249e89552d39ed5bf935df66
++patch_filename = lcms2_2.12-2_patch.zip
++patch_url = https://wrapdb.mesonbuild.com/v2/lcms2_2.12-2/get_patch
++patch_hash = 3ac6944ac4b8d8507b85961d98cb287532945183d0e8f094c77810e793b6bebe
++
++[provide]
++lcms2 = liblcms2_dep
++
+diff --git a/tests/meson.build b/tests/meson.build
+index eee8895..7c67e70 100644
+--- a/tests/meson.build
++++ b/tests/meson.build
+@@ -42,7 +42,7 @@ foreach test_name : test_names
+     test_name + '.c',
+     include_directories: [rootInclude, bablInclude],
+     link_with: babl,
+-    dependencies: thread,
++    dependencies: [thread, lcms],
+     export_dynamic: true,
+     install: false,
+   )
+diff --git a/tools/meson.build b/tools/meson.build
+index 2719335..89ccf40 100644
+--- a/tools/meson.build
++++ b/tools/meson.build
+@@ -18,7 +18,7 @@ foreach tool_name : tool_names
+     tool_name + '.c',
+     include_directories: [rootInclude, bablInclude],
+     link_with: babl,
+-    dependencies: [math, thread],
++    dependencies: [math, thread, lcms],
+     install: false,
+   )
+ 
+-- 
+2.36.0
+
diff --git a/meta-gnome/recipes-gimp/babl/babl_0.1.92.bb b/meta-gnome/recipes-gimp/babl/babl_0.1.92.bb
index 156c91bcbd..f2e11c1117 100644
--- a/meta-gnome/recipes-gimp/babl/babl_0.1.92.bb
+++ b/meta-gnome/recipes-gimp/babl/babl_0.1.92.bb
@@ -14,7 +14,11 @@ DEPENDS += "lcms"
 CFLAGS:append:toolchain-clang:mipsarch = " -ffp-exception-behavior=ignore "
 CFLAGS:append:toolchain-clang:riscv64 = " -ffp-exception-behavior=ignore "
 
-SRC_URI = "https://download.gimp.org/pub/${BPN}/0.1/${BP}.tar.xz"
+SRC_URI = "https://download.gimp.org/pub/${BPN}/0.1/${BP}.tar.xz \
+           file://0001-meson-fix-misspelled-kwarg-name.patch \
+           file://0002-meson-Various-fixes.patch \
+           file://0001-meson-Do-not-run-git-rev-parse-during-configure.patch \
+"
 SRC_URI[sha256sum] = "f667735028944b6375ad18f160a64ceb93f5c7dccaa9d8751de359777488a2c1"
 
 BBCLASSEXTEND = "native"
-- 
2.36.0


