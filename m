Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5457C7EE24
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 06:05:36 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.87639.1682921129479748223
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Apr 2023 23:05:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=T2s+qxEL;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-63b733fd00bso1556619b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Apr 2023 23:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682921129; x=1685513129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qlCDvyTDB0n2Zj3uN5TrPudv4Mlqn7vTpocxYsg4+is=;
        b=T2s+qxEL3lTvLHqUA8unRYeTa2jwUt/m6BXh1FcVyG+PboMpt1sX+zzGosJeoBrf7x
         fllQGwy5LnT4fFLRU5btI0ni3QqjHWTm+Kz7U+YBC+n11DiEecHiM5iUaJ+n35Z3DV6d
         vWVqjOmEBBrnOETB8SkgZ8DWfoxrh14wMhyUEPc90HJBl4BL+TqR86Q0vJkW0gku+nf4
         lrKdPqXmu09GIgQePc6z06VcypwSrUufB/ppcnNV+lp6RtWsfHRSw2gJn/qLYzntNVgJ
         5HfaYdbY+kKyKBZHZScM5n/6x6bomF8A7nu6UTKJ95v3foC8rZstkUoySLCPQENtYIMM
         Jwww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682921129; x=1685513129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qlCDvyTDB0n2Zj3uN5TrPudv4Mlqn7vTpocxYsg4+is=;
        b=bt20K2IuHL9U0a/8mH9d/Ax+B+Rjdy4CJMb0xkjpJjhhdP+QXCOzuroQm987CBAxK9
         kJE+cNMJ0LOLV6UcsBjT0gTG+we03usnbW7ke93PsQzGZc/ggEGXI2SiURRKk+9VEgHl
         bLNbEK25V9u8IGMVfE4xVjEZV27d+U70T2XfLXnPSr2qtZO6ikcrkLHGvgFQcRvE25sY
         ei4f5fA67BgAGfbba1iTGde8ZM8uRrRMDtr8vFrkH8EcLcvxBrzO8OHMACQfg5JD7sSP
         vJFlTYqoB9/87UK6hT0uzC2IQ+IGE6M+cUNfuNpRDttIPrOJAhs18smYAsO+Up3lVb+h
         U1DA==
X-Gm-Message-State: AC+VfDxjQ7CNe5zDiWw3DpzygbKnIBqFAI/dAHt3IM/P6Q2oekw8BFgA
	hvaT5rw+iMzRjlruEUwNh25gDpwi73HvGA==
X-Google-Smtp-Source: ACHHUZ7bgfVJSlQeHKZNTvaeUZQgovP02yYR53+zoaYT4Ha/TPivlFI6XR7r7I8065hk6evnAhJOjQ==
X-Received: by 2002:a05:6a20:734b:b0:ee:f064:9b00 with SMTP id v11-20020a056a20734b00b000eef0649b00mr16626522pzc.45.1682921128522;
        Sun, 30 Apr 2023 23:05:28 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::f98d])
        by smtp.gmail.com with ESMTPSA id q8-20020a656848000000b005134fc049d7sm16767730pgt.31.2023.04.30.23.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 23:05:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 12/13] geary: Use sysroot prefix with pkg-config in meson
Date: Sun, 30 Apr 2023 23:05:17 -0700
Message-Id: <20230501060518.3505068-12-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230501060518.3505068-1-raj.khem@gmail.com>
References: <20230501060518.3505068-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 May 2023 06:05:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102241

Fixes
../git/meson.build:223:0: ERROR: File /usr/share/xml/iso-codes/iso_639.xml does not exist.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...NFIG_SYSROOT_DIR-when-using-pkg-conf.patch | 51 +++++++++++++++++++
 .../recipes-connectivity/geary/geary_43.0.bb  |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-gnome/recipes-connectivity/geary/geary/0001-meson-Use-PKG_CONFIG_SYSROOT_DIR-when-using-pkg-conf.patch

diff --git a/meta-gnome/recipes-connectivity/geary/geary/0001-meson-Use-PKG_CONFIG_SYSROOT_DIR-when-using-pkg-conf.patch b/meta-gnome/recipes-connectivity/geary/geary/0001-meson-Use-PKG_CONFIG_SYSROOT_DIR-when-using-pkg-conf.patch
new file mode 100644
index 0000000000..1e0640a666
--- /dev/null
+++ b/meta-gnome/recipes-connectivity/geary/geary/0001-meson-Use-PKG_CONFIG_SYSROOT_DIR-when-using-pkg-conf.patch
@@ -0,0 +1,51 @@
+From a300be5877f35379bb569313eec901bda9c8d762 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 30 Apr 2023 22:08:39 -0700
+Subject: [PATCH] meson: Use PKG_CONFIG_SYSROOT_DIR when using pkg-config
+
+OE cross-builds and absolute paths found by pkg-config points to
+non-sysroot'ed locations which are not correct as they point into native
+sysroot from build machine which is incorrect.
+
+Upstream-Status: Inappropriate [OE-specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ meson.build | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index d563dd08..9b72aeb4 100644
+--- a/meson.build
++++ b/meson.build
+@@ -38,6 +38,9 @@ metadata_dir = meson.project_source_root() / 'bindings'/ 'metadata'
+ po_dir = meson.project_source_root() / 'po'
+ vapi_dir = meson.project_source_root() / 'bindings' / 'vapi'
+ 
++# pkg-config sysroot location
++pkgconf_sysroot = run_command('python3', '-c', 'import os; print(os.environ.get("PKG_CONFIG_SYSROOT_DIR"))').stdout().strip()
++
+ # Compiler configuration
+ add_project_arguments([
+     # Make sure Meson can find custom VAPIs
+@@ -120,7 +123,7 @@ icu_uc = declare_dependency(
+ if libunwind_dep.found()
+   # We need to add native lib to the search path for these so Flatpak
+   # builds can find it.
+-  unwind_lib = libunwind_dep.get_variable(pkgconfig: 'libdir')
++  unwind_lib = pkgconf_sysroot + libunwind_dep.get_variable(pkgconfig: 'libdir')
+   libunwind = declare_dependency(
+      dependencies: [
+        valac.find_library('libunwind', dirs: [vapi_dir, unwind_lib]),
+@@ -207,8 +210,7 @@ vala_unit_proj = subproject(
+ vala_unit_dep = vala_unit_proj.get_variable('vala_unit_dep')
+ 
+ # Language detection
+-
+-iso_codes_dir = iso_codes.get_variable(pkgconfig: 'prefix')/'share'/'xml'/'iso-codes'
++iso_codes_dir = pkgconf_sysroot + iso_codes.get_variable(pkgconfig: 'prefix')/'share'/'xml'/'iso-codes'
+ 
+ iso_639_xml = get_option('iso_639_xml')
+ if iso_639_xml == ''
+-- 
+2.40.1
+
diff --git a/meta-gnome/recipes-connectivity/geary/geary_43.0.bb b/meta-gnome/recipes-connectivity/geary/geary_43.0.bb
index 08899fd4a1..ff7a9ee694 100644
--- a/meta-gnome/recipes-connectivity/geary/geary_43.0.bb
+++ b/meta-gnome/recipes-connectivity/geary/geary_43.0.bb
@@ -35,6 +35,7 @@ inherit meson pkgconfig mime-xdg gtk-icon-cache gobject-introspection vala featu
 
 SRC_URI = " \
 	git://github.com/GNOME/geary.git;nobranch=1;protocol=https \
+	file://0001-meson-Use-PKG_CONFIG_SYSROOT_DIR-when-using-pkg-conf.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.40.1


