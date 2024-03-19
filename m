Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 511BAC54E74
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:46:16 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.8145.1710827170142613344
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:46:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kuHiiqw1;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710827170; x=1742363170;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0jks2oE5hq1ATXTVwxahgaMJKxah0AQOhO38ejC5LEs=;
  b=kuHiiqw1Wzgs9DM0k7BaNXeFgd+rW929SKOKMLO7CwLeAP51Z9zi8R+d
   6XtX6c/eWXmyBfMI02OGNkSjmlu8kGAmqYd4hoc/FNPVmpnfgK/nOJmYo
   Lyzec4x4NeYDAV+ToosFE3yp+Ote5386RssMbtNw5p7q56wEVoZmxNpxW
   fMECAk9paDS1DpCfbaoCEUyetZhnxvxojyWbkDJcJjIQxoG1hS4KEtA+v
   /MkqH9V4Ke1ay+2FNrPy1MnVUP0WLg+4lWs1XS4+BmvZRfxwGJ+8r2qrq
   hduhJ+RyuTPMF44a8gqKNhnkAeGlRpKjhQ4GtF1Qr3xPkoKzxAV8UPMdg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="131999283"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="131999283"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:46:08 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8E64C279DD
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:06 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id CB508D5E8A
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:05 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5C9822009325C
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:05 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 064061A006B;
	Tue, 19 Mar 2024 13:46:04 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 05/50] gjs: upgrade 1.78.4 -> 1.80.0
Date: Tue, 19 Mar 2024 13:44:54 +0800
Message-Id: <1710827139-30056-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
References: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10--2.275200-10.000000
X-TMASE-MatchedRID: bwTBD8UNLVWjz0nOeth/yQk3qL3jdFBN1QQ6Jx/fflbozDhGeQC9EkaF
	+/5G+w6ghDLYiwcLbP2HVpOsix0i3H2UXQ3TmI34xqtsVI8KrJqBytkIbXCbB6iGWcxufZX0jcR
	qQigdY12i4nDty5Kb2gCdex/nLXPyi/Coz1RLTUHioIHZlPrIDIOeZuUUsCzCbyqQBkQY3G/Z3y
	a1EhGxQyTDw/BUeX+fBdRHP6FCEZVaQiLka9EcSk7nLUqYrlslFIuBIWrdOeO1eX0jEQ9c6t/O0
	TkwpBlDf7IU8yrQZGZ8kvfy7VW07rWfqrMzDJSXSHCU59h5KrFTUwT7INTrLgMFD5cGHhgluJEU
	mdYPGSWipw58JSX3jPJ4iQGssMvwYTDdbnsa3DyxlpnlQFCyh64sbbURvhPzgW6bY8SOq3WjxYy
	RBa/qJUl4W8WVUOR/joczmuoPCq2DyPl7BX+VIdEjU2Ru+tgGt7uuccacNfs+plFimzqXIe/xH6
	Yi086isRlY8R2yHRjuy5Tzj9k3ufWsjE3M+B4oWPEMg7i8AyT1QSVXlIwIKsu3Xpha3HN4X02ll
	t10e/veIZBhQ9mZ7s7nW+rXGFOy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:46:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109422

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Support-cross-builds-a-bit-better.patch
0002-meson.build-Do-not-add-dir-installed-tests-when-inst.patch
refreshed for 1.80.0

Changelog:
=============
- In GNOME 46 and later, platform-specific GLib and Gio APIs have moved
  to the separate libraries GLibUnix, GioUnix, GLibWin32, and GioWin32.
- Closed bugs and merge requests:
  * meson: fix automagic dependency lookup for cairo
  * Deprecate accessing GLibUnix/GLibWin32 APIs through GLib
  * CI: Build newer GLib in debug Docker image
  * Workspace switching performance degradation due to leaked WeakRefs
    in JS
  * GTop.glibtop_get_mountlist invocation causes GNOME Shell Crash
  * Progress towards some performance improvements in accessing GObject
    properties
  * Various maintenance

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gjs/0001-Support-cross-builds-a-bit-better.patch | 11 +++++------
 ...ld-Do-not-add-dir-installed-tests-when-inst.patch | 12 +++++-------
 .../gjs/{gjs_1.78.4.bb => gjs_1.80.0.bb}             |  2 +-
 3 files changed, 11 insertions(+), 14 deletions(-)
 rename meta-gnome/recipes-gnome/gjs/{gjs_1.78.4.bb => gjs_1.80.0.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/gjs/gjs/0001-Support-cross-builds-a-bit-better.patch b/meta-gnome/recipes-gnome/gjs/gjs/0001-Support-cross-builds-a-bit-better.patch
index 8ebc8bad8..12b4b08c7 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs/0001-Support-cross-builds-a-bit-better.patch
+++ b/meta-gnome/recipes-gnome/gjs/gjs/0001-Support-cross-builds-a-bit-better.patch
@@ -1,4 +1,4 @@
-From 95cacf345eaec898a47486fc0d33382f303275aa Mon Sep 17 00:00:00 2001
+From 8a78a7996b01aba21377ceb7547da673fd30a391 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
 Date: Wed, 27 Oct 2021 20:18:47 +0200
 Subject: [PATCH] Support cross builds a bit better
@@ -12,16 +12,15 @@ Content-Transfer-Encoding: 8bit
 Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gjs/-/merge_requests/690]
 
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
-
 ---
  meson.build | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 961660f..86239a4 100644
+index c9b26d6..3058e8c 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -255,6 +255,7 @@ release builds of SpiderMonkey. Try configuring SpiderMonkey with
+@@ -262,6 +262,7 @@ release builds of SpiderMonkey. Try configuring SpiderMonkey with
  --disable-debug.''')
  endif
  
@@ -29,7 +28,7 @@ index 961660f..86239a4 100644
  # Check if a minimal SpiderMonkey program compiles, links, and runs. If not,
  # it's most likely the case that SpiderMonkey was configured incorrectly, for
  # example by building mozglue as a shared library.
-@@ -285,6 +286,7 @@ elif minimal_program.returncode() != 0
+@@ -292,6 +293,7 @@ elif minimal_program.returncode() != 0
  failed to execute. Most likely you should build it with a different
  configuration.''' + recommended_configuration)
  endif
@@ -37,7 +36,7 @@ index 961660f..86239a4 100644
  
  have_printf_alternative_int = cc.compiles('''
  #include <stdio.h>
-@@ -683,7 +685,7 @@ subdir('installed-tests')
+@@ -690,7 +692,7 @@ subdir('installed-tests')
  
  # Note: The test program in test/ needs to be ported
  #       to Windows before we can build it on Windows.
diff --git a/meta-gnome/recipes-gnome/gjs/gjs/0002-meson.build-Do-not-add-dir-installed-tests-when-inst.patch b/meta-gnome/recipes-gnome/gjs/gjs/0002-meson.build-Do-not-add-dir-installed-tests-when-inst.patch
index f05e52c38..e932f06d2 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs/0002-meson.build-Do-not-add-dir-installed-tests-when-inst.patch
+++ b/meta-gnome/recipes-gnome/gjs/gjs/0002-meson.build-Do-not-add-dir-installed-tests-when-inst.patch
@@ -1,13 +1,12 @@
-From e6889d60891383ce6aa66aa3db30255af58bcf3c Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+From 29221ae42e424c6100b8c313d2b61801430c872d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller=20installed=5Ftests=20is=20false?=
+ <schnitzeltony@gmail.com>
 Date: Wed, 27 Oct 2021 20:04:02 +0200
 Subject: [PATCH] meson.build: Do not add dir installed-tests when
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
 
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
- installed_tests is false
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -15,16 +14,15 @@ Content-Transfer-Encoding: 8bit
 Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gjs/-/merge_requests/690]
 
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
-
 ---
  meson.build | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 86239a4..11c04e2 100644
+index 3058e8c..06cf8da 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -681,7 +681,9 @@ endif
+@@ -688,7 +688,9 @@ endif
  
  ### Tests and test setups ######################################################
  
diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.78.4.bb b/meta-gnome/recipes-gnome/gjs/gjs_1.80.0.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/gjs/gjs_1.78.4.bb
rename to meta-gnome/recipes-gnome/gjs/gjs_1.80.0.bb
index c1d1948d6..602149fad 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs_1.78.4.bb
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.80.0.bb
@@ -7,7 +7,7 @@ DEPENDS = "mozjs-115 cairo"
 
 inherit gnomebase gsettings gobject-introspection gettext features_check upstream-version-is-even pkgconfig
 
-SRC_URI[archive.sha256sum] = "9aec7ab872c2050404907ae94f0ae7abec8a54bd9c894ddb5c2d0f51e932b9a1"
+SRC_URI[archive.sha256sum] = "0f78cd3f0e8eb446517d665e4fde1d66302b0c283bbe87b78e9cbfd4d86ed576"
 SRC_URI += " \
     file://0001-Support-cross-builds-a-bit-better.patch \
     file://0002-meson.build-Do-not-add-dir-installed-tests-when-inst.patch \
-- 
2.34.1


