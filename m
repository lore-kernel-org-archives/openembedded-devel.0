Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 4B2DA6FCE0
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Sep 2014 08:37:04 +0000 (UTC)
Received: from localhost.localdomain (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 2E0EE281A2
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Sep 2014 10:37:04 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Sep 2014 10:37:01 +0200
Message-Id: <1409647021-15057-1-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-browser][PATCH] Disable fatal linker warnings related to SQLite
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Sep 2014 08:37:06 -0000

With the gold linker, problems with hidden sqlite3 symbols occur. Example:

  warning: hidden symbol 'sqlite3_temp_directory' in obj/third_party/sqlite/libsqlite3.a
  (obj/third_party/sqlite/amalgamation/sqlite.sqlite3.o) is referenced by DSO
  /mnt/ramdisk/yocto/qemu-test-build/tmp//sysroots/qemux86/usr/lib/../lib/libsoftokn3.so

The problem is known, and a solution would be to set the build scripts
to not build sqlite3 and use the system's sqlite3 library instead.
However, currently, this is not possible:

  https://code.google.com/p/chromium/issues/detail?id=22208

The Crosswalk project fixed this by setting the warnings to non-fatal:

  https://github.com/crosswalk-project/crosswalk/commit/83d22586852a3d64300fd024e24ade9a4ac325be

The disable_fatal_linker_warnings GYP flag used in that commit is already
part of Chromium 37. It just needs to be enabled. This commit does
precisely that.

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 recipes-browser/chromium/chromium_37.0.2062.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-browser/chromium/chromium_37.0.2062.0.bb b/recipes-browser/chromium/chromium_37.0.2062.0.bb
index 2cf6d2a..c0e3b36 100644
--- a/recipes-browser/chromium/chromium_37.0.2062.0.bb
+++ b/recipes-browser/chromium/chromium_37.0.2062.0.bb
@@ -81,6 +81,7 @@ PACKAGECONFIG ??= "use-egl"
 PACKAGECONFIG[use-egl] = ",,virtual/egl virtual/libgles2"
 
 EXTRA_OEGYP =	" \
+	-Ddisable_fatal_linker_warnings=1 \
 	${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '', '-Dlinux_use_gold_binary=0', d)} \
 	${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '', '-Dlinux_use_gold_flags=0', d)} \
 	-I ${WORKDIR}/oe-defaults.gypi \
-- 
1.8.3.2


