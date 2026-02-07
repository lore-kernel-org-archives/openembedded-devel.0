Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FDB2EE0AEC
	for <webhook@archiver.kernel.org>; Sat,  7 Feb 2026 12:23:42 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3911.1770467016892919288
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Feb 2026 04:23:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O2q2clDp;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47ee0291921so14260605e9.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 04:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770467015; x=1771071815; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dWo+qgo8AJJyBD/gb3rtRvSYxrqtxNV0OIDq6/v3Ua8=;
        b=O2q2clDpGpGGCFSMx01PRVW4DI6zXzcw5aPnrhznmbB7PruU66WuCw4obAJWXqhmlx
         qzqylvd7KZuRWF68LyTevt17SuNDtX1I0TmPg44VlRzROegO995vJsw/hKMIL/t1G6rB
         hjl4sM/0GfXMcVxHFybY/AW6RVPX7Ed5vpaXI6DNMlb4yQke/QYyuTa82LWXqEWCqh1h
         BphwpYLaAe3dtH/8w8N/N3B74flNZboXk0gS9tnIsW3pz85Zcy2uaNArmudGjR3DjkhX
         4WKr+2rrsWCCISVKG51jfW6DBBbQB+72QUcOAjlPvzEYCqCN6k+QSh6wEGh5OVilPL+j
         Y4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770467015; x=1771071815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dWo+qgo8AJJyBD/gb3rtRvSYxrqtxNV0OIDq6/v3Ua8=;
        b=XwsS2Xr7Vin9KJDx9vXGr6KAICGNBUntIIPg6CoSOA7CWDf7VnrfqJ1MjAqaTK5b30
         kMy/qJOVR9Eq9ym5Roqs+lvCBjqDOtNZcW4yj/CGokXGLcgpv1CTafralU3R36r2Zw4z
         kKbibx09xyHhdMOpugELftk3SCMBD+E4VmlJP7QSem20tuANO+cXtJAWlqTojuoYA+aS
         OMZyVyMDqT7OXNe5vgTUSs35l4TZ9Sm1c8+A65ghkkZlHjdjutmS66VsGe1rplpaNYWH
         ej0hZuG7uP/oftd4y4u28al5/6PRGR5mtPUtpRBlzIYcJmuyHRywkhEFptoqcXpLIXNd
         jsoA==
X-Gm-Message-State: AOJu0YzBp89khlO+hamTc5sEcpmZ9bcD4AOGSbdf61SKzLbwnQ7wBRLI
	xbG8P6vgvzyoUltIGk8MRdAbP7Z2fxex/cic7zRaH67xkjYtpdAZpIZCRZQG+Q==
X-Gm-Gg: AZuq6aIf8bMEPhVsuzDip53/Ss0xAip7OAXidwfKc6LSj4e9IRluwisRifGAZ6kBC4c
	dC2z3EhJzWF9PCW6yfneyz4YzhxE6GLX10ghEc9/M55nGbvRFE9ybgDwpwyeaTXSVKoqc2LYnLG
	Cf9Qd58Vw8d/VXRGom1uIOxtgH9m0oX0E3HD5f/WeqEy+om/LYlzC6TBApL6z4DGyltqmqkYXpb
	R4LcZGWP9CuDzWDntHS5MwncHwphzQaD3eDEqKJ5hO621nJZ+eXSPGohLWExxgBXT2jWN1KxSLx
	pC3Tai1NE7WmLNltYvBBc66lICB5JJ+Jgz+wST/+KUc65vjoQxiDyMz8TC5WeQSOHJvR+bP+uH2
	fmgMKwydh3rUuFmBt3Sbk4wTCL7BN+o1/DHuTSjAX/x3aduWrKGi9KESKvTfP68PywqLwI4Uemp
	DMvl6xVF3A
X-Received: by 2002:a05:600c:19c7:b0:45d:dc85:c009 with SMTP id 5b1f17b1804b1-483201e160dmr77091125e9.10.1770467015159;
        Sat, 07 Feb 2026 04:23:35 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48320719bf4sm112653835e9.10.2026.02.07.04.23.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 04:23:34 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][scarthgap][PATCH 09/12] tracker-miners: upgrade 3.7.1 -> 3.7.2
Date: Sat,  7 Feb 2026 13:23:24 +0100
Message-ID: <20260207122327.664604-9-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260207122327.664604-1-skandigraun@gmail.com>
References: <20260207122327.664604-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 12:23:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124265

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Set-header-file-to-a-fixed-path-instead-of-a-host-pa.patch
0001-fix-reproducibility.patch
refreshed for 3.7.2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 59c62576b40da737703a0b7a42c63c927d95a7c5)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...to-a-fixed-path-instead-of-a-host-pa.patch |  15 +--
 .../0001-fix-reproducibility.patch            | 104 +++++++++---------
 ...iners_3.7.1.bb => tracker-miners_3.7.2.bb} |   2 +-
 3 files changed, 62 insertions(+), 59 deletions(-)
 rename meta-gnome/recipes-gnome/tracker/{tracker-miners_3.7.1.bb => tracker-miners_3.7.2.bb} (97%)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-Set-header-file-to-a-fixed-path-instead-of-a-host-pa.patch b/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-Set-header-file-to-a-fixed-path-instead-of-a-host-pa.patch
index 7a40ae338c..36dd4a5881 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-Set-header-file-to-a-fixed-path-instead-of-a-host-pa.patch
+++ b/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-Set-header-file-to-a-fixed-path-instead-of-a-host-pa.patch
@@ -7,21 +7,22 @@ Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
 ---
- src/libtracker-miners-common/tracker-miner-enum-types.c.template        | 1 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
+ .../tracker-miners-enum-types.c.template                        | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/libtracker-miners-common/tracker-miners-enum-types.c.template b/src/libtracker-miners-common/tracker-miners-enum-types.c.template
-index c712dda..cb449e2 100644
+index 4db7ef1..7c44c13 100644
 --- a/src/libtracker-miners-common/tracker-miners-enum-types.c.template
 +++ b/src/libtracker-miners-common/tracker-miners-enum-types.c.template
 @@ -7,7 +7,7 @@
-
+ 
  /*** BEGIN file-production ***/
  /* enumerations from "@basename@" */
 -#include "@filename@"
 +#include "tracker-enums.h"
  /*** END file-production ***/
+ 
+ 
+-- 
+2.34.1
 
-
---
-2.25.1
diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-fix-reproducibility.patch b/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-fix-reproducibility.patch
index 98618e5d3e..ea239c41f9 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-fix-reproducibility.patch
+++ b/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-fix-reproducibility.patch
@@ -12,16 +12,18 @@ Upstream-Status: Inappropriate [oe-specific]
 
 Signed-off-by: Markus Volk <f_l_k@t-online.de>
 ---
- meson.build                        | 20 ++++++++++----------
- src/tracker-extract/meson.build    |  2 +-
- tests/tracker-miner-fs/meson.build |  2 +-
- 3 files changed, 12 insertions(+), 12 deletions(-)
+ meson.build                                     | 8 ++++----
+ src/libtracker-miners-common/tracker-landlock.c | 4 ++--
+ src/miners/fs/meson.build                       | 4 ++--
+ src/tracker-extract/meson.build                 | 2 +-
+ tests/tracker-miner-fs/meson.build              | 2 +-
+ 5 files changed, 10 insertions(+), 10 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 935584185..aa6126081 100644
+index a838344..6945f63 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -380,7 +380,7 @@ conf.set('PACKAGE_VERSION', '"@0@"'.format(meson.project_version()))
+@@ -393,7 +393,7 @@ conf.set('PACKAGE_VERSION', '"@0@"'.format(meson.project_version()))
  conf.set('TRACKER_VERSION', '"@0@"'.format(meson.project_version()))
  
  # Config that goes in some other generated files (.desktop, .pc, etc)
@@ -30,7 +32,7 @@ index 935584185..aa6126081 100644
  conf.set('exec_prefix', get_option('prefix'))
  conf.set('bindir', join_paths(get_option('prefix'), get_option('bindir')))
  conf.set('datadir', datadir)
-@@ -409,7 +409,7 @@ tracker_c_args = [
+@@ -422,7 +422,7 @@ tracker_c_args = [
  configinc = include_directories('./')
  srcinc = include_directories('src/')
  
@@ -39,7 +41,7 @@ index 935584185..aa6126081 100644
  
  # We use tracker-miners-3.0 rather than tracker3-miners inside the lib64
  # directory, following the existing convention in that directory.
-@@ -438,8 +438,8 @@ subdir('data')
+@@ -451,8 +451,8 @@ subdir('data')
  subdir('docs')
  
  test_c_args = tracker_c_args + [
@@ -50,11 +52,48 @@ index 935584185..aa6126081 100644
  ]
  
  if get_option('tests_tap_protocol')
+diff --git a/src/libtracker-miners-common/tracker-landlock.c b/src/libtracker-miners-common/tracker-landlock.c
+index 95c652e..608cee4 100644
+--- a/src/libtracker-miners-common/tracker-landlock.c
++++ b/src/libtracker-miners-common/tracker-landlock.c
+@@ -276,7 +276,7 @@ tracker_landlock_init (const gchar * const *indexed_folders)
+ 			          LANDLOCK_ACCESS_FS_READ_DIR);
+ 		}
+ 	}
+-
++#if 0
+ 	current_dir = g_get_current_dir ();
+ 
+ 	/* Detect running in-tree */
+@@ -296,7 +296,7 @@ tracker_landlock_init (const gchar * const *indexed_folders)
+ 			          in_tree_rules[i].flags);
+ 		}
+ 	}
+-
++#endif
+ 	/* Add user cache for readonly databases */
+ #ifdef MINER_FS_CACHE_LOCATION
+ 	add_rule (landlock_fd, MINER_FS_CACHE_LOCATION,
+diff --git a/src/miners/fs/meson.build b/src/miners/fs/meson.build
+index 6e58832..04750f8 100644
+--- a/src/miners/fs/meson.build
++++ b/src/miners/fs/meson.build
+@@ -67,8 +67,8 @@ executable('tracker-miner-fs-@0@'.format(tracker_api_major),
+     dependencies: tracker_miner_fs_deps,
+     c_args: [
+         tracker_c_args,
+-        '-DBUILDROOT="@0@"'.format(meson.global_build_root()),
+-        '-DBUILD_EXTRACTDIR="@0@"'.format(meson.build_root() / 'src' / 'tracker-extract'),
++        '-DBUILDROOT="@0@"'.format(get_option('prefix') / 'src'),
++        '-DBUILD_EXTRACTDIR="@0@"'.format(get_option('prefix') / 'src' / 'tracker-extract'),
+         '-DLIBEXECDIR="@0@"'.format(get_option('prefix') / get_option('libexecdir')),
+     ],
+     install: true,
 diff --git a/src/tracker-extract/meson.build b/src/tracker-extract/meson.build
-index 4aaad5c41..d17cce221 100644
+index 16ce367..bbd494d 100644
 --- a/src/tracker-extract/meson.build
 +++ b/src/tracker-extract/meson.build
-@@ -159,7 +159,7 @@ endif
+@@ -158,7 +158,7 @@ endif
  executable('tracker-extract-@0@'.format(tracker_api_major),
    tracker_extract_sources,
    # Manually add the root dir to work around https://github.com/mesonbuild/meson/issues/1387
@@ -64,10 +103,10 @@ index 4aaad5c41..d17cce221 100644
    dependencies: tracker_extract_dependencies,
    install: true,
 diff --git a/tests/tracker-miner-fs/meson.build b/tests/tracker-miner-fs/meson.build
-index e131b85ad..59e509fa6 100644
+index 8c081fd..9792082 100644
 --- a/tests/tracker-miner-fs/meson.build
 +++ b/tests/tracker-miner-fs/meson.build
-@@ -19,7 +19,7 @@ libtracker_miner_test_c_args = [
+@@ -18,7 +18,7 @@ libtracker_miner_test_c_args = [
  ]
  
  libtracker_miner_test_environment = environment()
@@ -76,43 +115,6 @@ index e131b85ad..59e509fa6 100644
  
  libtracker_miner_test_deps = [tracker_miners_common_dep, tracker_miner_dep, tracker_sparql]
  
- 
-diff --git a/src/miners/fs/meson.build b/src/miners/fs/meson.build
-index 6e5883288..04750f82b 100644
---- a/src/miners/fs/meson.build
-+++ b/src/miners/fs/meson.build
-@@ -67,8 +67,8 @@ executable('tracker-miner-fs-@0@'.format(tracker_api_major),
-     dependencies: tracker_miner_fs_deps,
-     c_args: [
-         tracker_c_args,
--        '-DBUILDROOT="@0@"'.format(meson.global_build_root()),
--        '-DBUILD_EXTRACTDIR="@0@"'.format(meson.build_root() / 'src' / 'tracker-extract'),
-+        '-DBUILDROOT="@0@"'.format(get_option('prefix') / 'src'),
-+        '-DBUILD_EXTRACTDIR="@0@"'.format(get_option('prefix') / 'src' / 'tracker-extract'),
-         '-DLIBEXECDIR="@0@"'.format(get_option('prefix') / get_option('libexecdir')),
-     ],
-     install: true,
-diff --git a/src/libtracker-miners-common/tracker-landlock.c b/src/libtracker-miners-common/tracker-landlock.c
-index 27e7db65b..3021343eb 100644
---- a/src/libtracker-miners-common/tracker-landlock.c
-+++ b/src/libtracker-miners-common/tracker-landlock.c
-@@ -276,7 +276,7 @@
- 			          LANDLOCK_ACCESS_FS_READ_DIR);
- 		}
- 	}
--
-+#if 0
- 	current_dir = g_get_current_dir ();
- 
- 	/* Detect running in-tree */
-@@ -296,7 +296,7 @@
- 			          in_tree_rules[i].flags);
- 		}
- 	}
--
-+#endif
- 	/* Add user cache for readonly databases */
- #ifdef MINER_FS_CACHE_LOCATION
- 	add_rule (landlock_fd, MINER_FS_CACHE_LOCATION,
 -- 
-2.41.0
+2.34.1
+
diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.7.1.bb b/meta-gnome/recipes-gnome/tracker/tracker-miners_3.7.2.bb
similarity index 97%
rename from meta-gnome/recipes-gnome/tracker/tracker-miners_3.7.1.bb
rename to meta-gnome/recipes-gnome/tracker/tracker-miners_3.7.2.bb
index 7bbee2a885..a1fefe6a00 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.7.1.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker-miners_3.7.2.bb
@@ -18,7 +18,7 @@ SRC_URI:append = " \
 	file://0001-fix-reproducibility.patch \
 	file://0001-Set-header-file-to-a-fixed-path-instead-of-a-host-pa.patch \
 "
-SRC_URI[archive.sha256sum] = "50a3abe40cfb0b35ced43ec716dbf1368992e444ef7a0babf202c7ac6ab2f6f4"
+SRC_URI[archive.sha256sum] = "eb4f2b288a0cbe9e614871cb0048274461cfe1cb8467ac817b102d3873dbcba5"
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"

