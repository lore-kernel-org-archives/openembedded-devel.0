Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5664C41513
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 05:49:42 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.6639.1714628968804437873
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 May 2024 22:49:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=r1iZOm5d;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1714628978; x=1746164978;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KP+Jgjeezxui8/0SkM+tW9uGyx2HG5SCXodD7YfGdH8=;
  b=r1iZOm5dyKq6qv8UFYi4Op0MSFjiac4HxR/PRnZ+AGsJq+Vjc1ZtJCJP
   SVfonpDYRpc9glOgFokPnTq2b/legkKKxP9NOA4nWfTvayHdN9AN7CMqu
   0p9V1fpoqkl/kV3FdIBYmjZHCec/Ltfdz6HYCqq6mJJcZVVIHKKtHDhEv
   mWDm1Dxqd0sATfaFow+L9lkTG6vBgF4maiaCaDyeXS7Gld6Y50zMAy5S2
   DQOTf/vUZZnJGkQHdDQYf4k2raQmtS6M67/JUWs3tr7GTjPxrAq70QfwN
   /wH9uHr+a5+sy6CS7qnN4CRt5Aj5JcKUcr+UPeqUQZcAbUbRNofjG1V4u
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="136526448"
X-IronPort-AV: E=Sophos;i="6.07,247,1708354800"; 
   d="scan'208";a="136526448"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 14:49:36 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6F6D6C6905
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:34 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A3669D8CF5
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 32B052008BCDC
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:33 +0900 (JST)
Received: from wangmy-QiTianM610-N000.g08.fujitsu.local (unknown [10.167.225.86])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D4EEE1A0002;
	Thu,  2 May 2024 13:49:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 28/30] tracker-miners: upgrade 3.7.1 -> 3.7.2
Date: Thu,  2 May 2024 10:48:27 -0400
Message-Id: <20240502144829.241208-28-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502144829.241208-1-wangmy@fujitsu.com>
References: <20240502144829.241208-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28356.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28356.005
X-TMASE-Result: 10--10.772600-10.000000
X-TMASE-MatchedRID: EGTy8EHGssijz0nOeth/yX1JIA4rhsZ/rOCEGIPhtwhXGTbsQqHbks8L
	GTNFqWKaKqrQ7lLcMnyK8WnR386CVm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG2K8L
	fiwWKYyPMRe2PL6TWM3wiQAfu/ujSHsYi+P4ETTXG+nS24MzHeeTAXNPNyDOEyIKHzIGoT620Ma
	3ISuNTTj68I5XSJZyXiiuUpkw8ClotNVV5XI3AlGgws6g0ewz2gxy24U0so1nn3ZLCt3rRSXMIa
	paDo9OKjDVMw6TJvuHJI5NrSJkuqjopxE7q0FgI34e73Z9qT+ta2oII5HcF8NZVatUD7z4JLev3
	GXbxLXANUccATRyd1KCvzQKJ5mpKGVb/LG9fKnlZNYSHk3Zr0VXgGeVUh3WdmyiLZetSf8mfop0
	ytGwvXiq2rl3dzGQ1cgtnoyKqmR/jI6j/aqXFqPq/Cp/z2d0qpa1gzBxJPpuxSU75tkX5Ww==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 May 2024 05:49:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110231

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Set-header-file-to-a-fixed-path-instead-of-a-host-pa.patch
0001-fix-reproducibility.patch
refreshed for 3.7.2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...to-a-fixed-path-instead-of-a-host-pa.patch |  15 +--
 .../0001-fix-reproducibility.patch            | 104 +++++++++---------
 ...iners_3.7.1.bb => tracker-miners_3.7.2.bb} |   2 +-
 3 files changed, 62 insertions(+), 59 deletions(-)
 rename meta-gnome/recipes-gnome/tracker/{tracker-miners_3.7.1.bb => tracker-miners_3.7.2.bb} (97%)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-Set-header-file-to-a-fixed-path-instead-of-a-host-pa.patch b/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-Set-header-file-to-a-fixed-path-instead-of-a-host-pa.patch
index 7a40ae338..36dd4a588 100644
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
index 98618e5d3..ea239c41f 100644
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
index 7bbee2a88..a1fefe6a0 100644
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
-- 
2.34.1


