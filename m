Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65ECCC3F6B0
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 08:36:40 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web10.29696.1661243796205409161
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 01:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=gmdCf8PT;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661243794; i=@fujitsu.com;
	bh=T2HwQ+ad24A78SpDU+BMn4617c9gdJFDEy1b7eXO0RM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=gmdCf8PTYEPj/ipZ4eJIIbJSTCn6ijj5I84qleISvvTF79aYdRREccYyu41opeD7I
	 AD/kL2wSbI/2s8ZIMckpwOVzF/1s5eCa+90E+aGG11lNf2hT32ycntms0Y/gP15HY1
	 RJM43ZLis7eRanpIobO29v6rjXoWbrpBCGRUwTa8hZgsagLbsYhl+Z5g93l14TdQn7
	 A3TYpvC0SJfmLDVryLb641OkggP9IGp1kStD/TxcCTAPRZZuiUSL2JfmKz8YXTLsGq
	 1so6zcNa/+x+rufbui926YDypH2QhJqdRRypZxE+PUs8GmMcEV/nmrl9zcym5BAf+K
	 ulxNSuicUndAg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBIsWRWlGSWpSXmKPExsViZ8ORqDthIku
  ywYIv5hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aPjmssBVPtKhon72RpYPxo2sXIxSEk8IRR
  onnLDlYI5waTxLYpqxkhnL2MEmcuT2PvYuTkYBNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  rAaYQFHiTPvd4DVsAioSlyYdoupi5GDgxcofnFPEkhYQkBBYsrD92CtnAJOEj0XJ7KB2EJAJc
  8f/AWL8woISpyc+YQFYryExMEXL5ghehUlZl9uZoGwKyX2zOpngrDVJK6e28Q8gVFwFpL2WUj
  aFzAyrWK0SirKTM8oyU3MzNE1NDDQNTQ01QWSpiZ6iVW6iXqppbrlqcUluoZ6ieXFeqnFxXrF
  lbnJOSl6eaklmxiBQZxSzDBrB+Osvp96hxglOZiURHkd6lmShfiS8lMqMxKLM+KLSnNSiw8xy
  nBwKEnwevQD5QSLUtNTK9Iyc4ARBZOW4OBREuHVnwCU5i0uSMwtzkyHSJ1itOeYOvvffmaO5W
  By5te2A8wcm/Z1HWAWYsnLz0uVEufVA2kTAGnLKM2DGwpLAJcYZaWEeRkZGBiEeApSi3IzS1D
  lXzGKczAqCfMeBLmNJzOvBG73K6CzmIDOCtrNDHJWSSJCSqqBabLbtd8T4xLn2ElsreB6rsy/
  MacpTf2I3BZ515lT3GyN1I23BV7be4TDt7zOMIhVXHfdhvS68JY0q1XfuL/PuerheqlPYaNO8
  u6Q/dvXvxDf1RSjbLwuvNVhp/vjzK9nDd4o6n6bk9TWqHORx6jQI+jizbD4az9jq0orAi6s3l
  5jeWV7ipbr9Pd3lwXmZHo8z/E6smXKtS5j27ptE74WMx4VurIraOIeiSdXGcJnhy9V01AIS9q
  yU+hSa0wRr+e5e5eyHTWcom7OjNVYenvl5k36H7Re8Gw69FHoZe7tsPtM4hK3Yr/XclssrDn5
  N69R6eSeto95Duq8P5f558pNSBWSOrpja7eHyc//CmmmSizFGYmGWsxFxYkA617R0XsDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-585.messagelabs.com!1661243792!41331!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17804 invoked from network); 23 Aug 2022 08:36:32 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-15.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Aug 2022 08:36:32 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 80B1C100190
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 09:36:32 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 7338D10018D
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 09:36:32 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 23 Aug 2022 09:36:30 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] babl: upgrade 0.1.92 -> 0.1.94
Date: Tue, 23 Aug 2022 16:36:06 +0800
Message-ID: <1661243768-4595-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1661243768-4595-1-git-send-email-wangmy@fujitsu.com>
References: <1661243768-4595-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Aug 2022 08:36:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98378

0001-meson-fix-misspelled-kwarg-name.patch
0002-meson-Various-fixes.patch
removed since they're included in 0.1.94

Changelog:
==========
Fix of crash on non-aligned data for SIMD, add commandline tool, improve vala
compatibility of introspection info.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...0001-meson-fix-misspelled-kwarg-name.patch |  36 -----
 .../babl/babl/0002-meson-Various-fixes.patch  | 132 ------------------
 .../babl/{babl_0.1.92.bb => babl_0.1.94.bb}   |   6 +-
 3 files changed, 2 insertions(+), 172 deletions(-)
 delete mode 100644 meta-gnome/recipes-gimp/babl/babl/0001-meson-fix-misspelled-kwarg-name.patch
 delete mode 100644 meta-gnome/recipes-gimp/babl/babl/0002-meson-Various-fixes.patch
 rename meta-gnome/recipes-gimp/babl/{babl_0.1.92.bb => babl_0.1.94.bb} (77%)

diff --git a/meta-gnome/recipes-gimp/babl/babl/0001-meson-fix-misspelled-kwarg-name.patch b/meta-gnome/recipes-gimp/babl/babl/0001-meson-fix-misspelled-kwarg-name.patch
deleted file mode 100644
index 111dac6484..0000000000
--- a/meta-gnome/recipes-gimp/babl/babl/0001-meson-fix-misspelled-kwarg-name.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From ebcf4795f1132c5124d73a5ae2ca5c01319e584d Mon Sep 17 00:00:00 2001
-From: Eli Schwartz <eschwartz@archlinux.org>
-Date: Sun, 13 Mar 2022 20:26:05 -0400
-Subject: [PATCH 1/2] meson: fix misspelled kwarg name
-
-set10 doesn't have a `Description` kwarg, it does have a `description`
-kwarg though.
-
-This caused the conf variable to not have a description when it should
-have one, and newer versions of Meson with better argument validation
-error out with:
-
-meson.build:58:5: ERROR: configuration_data.set10 got unknown keyword arguments "Description"
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/babl/-/commit/b05b2826365a7dbc6ca1bf0977b848055cd0cbb6]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 487e470..2623e93 100644
---- a/meson.build
-+++ b/meson.build
-@@ -55,7 +55,7 @@ lib_name    = meson.project_name() + '-' + api_version
- stability_version_number = (major_version != 0 ? minor_version : micro_version)
- stable = (stability_version_number % 2 == 0)
- 
--conf.set10('BABL_UNSTABLE', not stable, Description:
-+conf.set10('BABL_UNSTABLE', not stable, description:
-   'Define to 1 if this is an unstable version of BABL.')
- 
- conf.set       ('BABL_MAJOR_VERSION',    '@0@'.format(major_version))
--- 
-2.36.0
-
diff --git a/meta-gnome/recipes-gimp/babl/babl/0002-meson-Various-fixes.patch b/meta-gnome/recipes-gimp/babl/babl/0002-meson-Various-fixes.patch
deleted file mode 100644
index 919653bf22..0000000000
--- a/meta-gnome/recipes-gimp/babl/babl/0002-meson-Various-fixes.patch
+++ /dev/null
@@ -1,132 +0,0 @@
-From 06e16da32dfaad02434fd9937d298ea1ece256ce Mon Sep 17 00:00:00 2001
-From: Xavier Claessens <xavier.claessens@collabora.com>
-Date: Sat, 23 Apr 2022 10:33:17 -0400
-Subject: [PATCH 2/2] meson: Various fixes
-
-- Add missing lcms dependencies. That's needed when lcms is a subproject
-  otherwise those targets does not find its headers.
-- Add lcms2 wrap so meson can build it as subproject in case the
-  dependency is not found on system.
-- Fix couple meson warnings
-- Use meson.override_dependency() so babl can be used as subproject
-  without hardcoding "babl_dep" variable name in main project.
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/babl/-/commit/2dc7fc403fe427a889913ef0cfb71de85b4326ec]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- babl/meson.build       |  4 +++-
- extensions/meson.build |  1 +
- meson.build            |  4 +++-
- subprojects/lcms2.wrap | 12 ++++++++++++
- tests/meson.build      |  2 +-
- tools/meson.build      |  2 +-
- 6 files changed, 21 insertions(+), 4 deletions(-)
- create mode 100644 subprojects/lcms2.wrap
-
-diff --git a/babl/meson.build b/babl/meson.build
-index d432dca..70fb131 100644
---- a/babl/meson.build
-+++ b/babl/meson.build
-@@ -138,7 +138,7 @@ babl = library(
-   link_args: babl_link_args,
-   link_with: simd_extra,
-   dependencies: babl_deps,
--  link_depends: version_script,
-+  link_depends: version_script[0],
-   version: so_version,
-   install: true,
- )
-@@ -165,4 +165,6 @@ if build_gir
-       install: true,
-     )
-   endif
-+else
-+  babl_gir = []
- endif
-diff --git a/extensions/meson.build b/extensions/meson.build
-index 23672bb..9935f29 100644
---- a/extensions/meson.build
-+++ b/extensions/meson.build
-@@ -6,6 +6,7 @@ no_cflags = []
- babl_ext_dep = [
-   math,
-   thread,
-+  lcms,
- ]
- 
- # Include directories
-diff --git a/meson.build b/meson.build
-index 2623e93..7e7a935 100644
---- a/meson.build
-+++ b/meson.build
-@@ -451,6 +451,7 @@ if git_bin.found() and run_command(
-     git_bin,
-     'rev-parse',
-     '--is-inside-work-tree',
-+    check: true,
- ).returncode() == 0
-   git_version_h = vcs_tag(
-     input : 'git-version.h.in',
-@@ -531,13 +532,14 @@ babl_dep = declare_dependency(
-   link_with : babl,
-   sources: [
-     babl_version_h,
--    is_variable('babl_gir') ? babl_gir : []
-+    build_gir ? babl_gir : []
-   ],
-   variables: {
-     'babl_path'   : babl_extensions_build_dir,
-     'babl_libdir' : babl_library_build_dir,
-   },
- )
-+meson.override_dependency('babl', babl_dep)
- 
- ################################################################################
- # Build summary
-diff --git a/subprojects/lcms2.wrap b/subprojects/lcms2.wrap
-new file mode 100644
-index 0000000..2cc69df
---- /dev/null
-+++ b/subprojects/lcms2.wrap
-@@ -0,0 +1,12 @@
-+[wrap-file]
-+directory = Little-CMS-2.12
-+source_url = https://github.com/mm2/Little-CMS/archive/refs/tags/2.12.tar.gz
-+source_filename = lcms2-2.12.tar.gz
-+source_hash = e501f1482fc424550ef3abbf86bf1c66090e1661249e89552d39ed5bf935df66
-+patch_filename = lcms2_2.12-2_patch.zip
-+patch_url = https://wrapdb.mesonbuild.com/v2/lcms2_2.12-2/get_patch
-+patch_hash = 3ac6944ac4b8d8507b85961d98cb287532945183d0e8f094c77810e793b6bebe
-+
-+[provide]
-+lcms2 = liblcms2_dep
-+
-diff --git a/tests/meson.build b/tests/meson.build
-index eee8895..7c67e70 100644
---- a/tests/meson.build
-+++ b/tests/meson.build
-@@ -42,7 +42,7 @@ foreach test_name : test_names
-     test_name + '.c',
-     include_directories: [rootInclude, bablInclude],
-     link_with: babl,
--    dependencies: thread,
-+    dependencies: [thread, lcms],
-     export_dynamic: true,
-     install: false,
-   )
-diff --git a/tools/meson.build b/tools/meson.build
-index 2719335..89ccf40 100644
---- a/tools/meson.build
-+++ b/tools/meson.build
-@@ -18,7 +18,7 @@ foreach tool_name : tool_names
-     tool_name + '.c',
-     include_directories: [rootInclude, bablInclude],
-     link_with: babl,
--    dependencies: [math, thread],
-+    dependencies: [math, thread, lcms],
-     install: false,
-   )
- 
--- 
-2.36.0
-
diff --git a/meta-gnome/recipes-gimp/babl/babl_0.1.92.bb b/meta-gnome/recipes-gimp/babl/babl_0.1.94.bb
similarity index 77%
rename from meta-gnome/recipes-gimp/babl/babl_0.1.92.bb
rename to meta-gnome/recipes-gimp/babl/babl_0.1.94.bb
index f2e11c1117..7161356c11 100644
--- a/meta-gnome/recipes-gimp/babl/babl_0.1.92.bb
+++ b/meta-gnome/recipes-gimp/babl/babl_0.1.94.bb
@@ -15,10 +15,8 @@ CFLAGS:append:toolchain-clang:mipsarch = " -ffp-exception-behavior=ignore "
 CFLAGS:append:toolchain-clang:riscv64 = " -ffp-exception-behavior=ignore "
 
 SRC_URI = "https://download.gimp.org/pub/${BPN}/0.1/${BP}.tar.xz \
-           file://0001-meson-fix-misspelled-kwarg-name.patch \
-           file://0002-meson-Various-fixes.patch \
            file://0001-meson-Do-not-run-git-rev-parse-during-configure.patch \
-"
-SRC_URI[sha256sum] = "f667735028944b6375ad18f160a64ceb93f5c7dccaa9d8751de359777488a2c1"
+           "
+SRC_URI[sha256sum] = "b6a8b28f55e0c17f5031fb7959e72ffe0fbf8196d1968ad6efc98d1b492c3bbe"
 
 BBCLASSEXTEND = "native"
-- 
2.25.1


