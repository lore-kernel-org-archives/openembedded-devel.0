Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.4431.1623220733528542879
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jun 2021 23:38:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=buvqtEnf;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id my49so19971735ejc.7
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jun 2021 23:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=WXcsqq3zwgYv1L64SpVGpk+dQf6ZI+05r7OzxkNe49M=;
        b=buvqtEnfUx1rboCVPOWuYTTHTGjUDwmPejp9Y2Sjgp59nPSAWzPy/QrJU88BbaWigg
         +rApHDpFidIbqjqBXvoiFyfcdzAFxIDJGmaXOZCdGw8fZcaxdI0dhiedWVeBUz1Dq2g0
         6aLYXDFdo3Hff+KhNVv/bcU0D9mW5rJd3cdxFPbMNt0XmuPZqBvlkW3K45SLTD1C+rhX
         82WqlSRLfbT0RxadICDPMwyxyvuTGSDFM2gTw3m1ucteY6PVjKD/UHDL8pguZR8WMiZD
         naeIUEaJy3ELyyrlNLB7OpPj37jkDO2xS7W1SwrvByGjVELfgxcojcStzwfJP2iq+W96
         kCqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WXcsqq3zwgYv1L64SpVGpk+dQf6ZI+05r7OzxkNe49M=;
        b=lhIaVAensUO4KLVS8hvybm89eBdmDDNcbTA+3zYv938llc8sRuz8dxd3czhslq1qRZ
         /31iqci5AT82Dgf1st7SOzG9EpObGqS80/imOsG2SuWe0deHK7x6kFN1rEduVjwCe7Br
         xgyLukfXFAvqaQNFkGJfWpBm/VWt6lZOI6MKzD3pShXFUvl1nVe8NKtmiKCohJd96/WF
         o8Lgop504COHd4Enhx1LhNOLe8GvrVE5XXKVZZ/5F6+V4tD9yduR2YMLtNLLMdaBl+c1
         ds4QXD01zKt+64jeXiUdQe5zg8TmrqtBNqLVUoU5L59UrEr0lijYOK+DbjlwYItQjcLq
         9WRQ==
X-Gm-Message-State: AOAM530DO/PsDPXGCUL8izvRWojbLhqTs9EBGeLBiUThMo3KddKo94Ej
	613pFtuHBibbVihIVwo1ZbIss14xfuRZ+w==
X-Google-Smtp-Source: ABdhPJyIs2eV0iuesvdMGC7xd0FdkWS9pdQi1+nQpZZKmcKRWNoFT2SJs31Mc0LXANV+Yd8SEb4Azg==
X-Received: by 2002:a17:906:b754:: with SMTP id fx20mr25638301ejb.201.1623220732058;
        Tue, 08 Jun 2021 23:38:52 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f297e89b85a8a6897bdbe62.dip0.t-ipconnect.de. [2003:f0:7f29:7e89:b85a:8a68:97bd:be62])
        by smtp.gmail.com with ESMTPSA id o4sm690810edc.94.2021.06.08.23.38.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 23:38:51 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 13/28] gtkmm3: upgrade 3.24.3 -> 3.24.5
Date: Wed,  9 Jun 2021 08:38:16 +0200
Message-Id: <20210609063831.3400611-13-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609063831.3400611-1-schnitzeltony@gmail.com>
References: <20210609063831.3400611-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Submitted patch was applied

3.24.5 (stable):

Gtk:
* TreeValueProxy: Mark the copy assignment operator as deleted
  (Daniel Boles) Issue #94, merge request !63

Build:
* Meson build: Use relative paths to untracked/
  (Mingli Yu) Merge request !61
* [gdk|gtk]mmconfig.h.*: Don't dllimport on MinGW
  (Chun-wei Fan) Issue #90 (Lukas K.)
* Meson build: Make it possible to use gtkmm as a subproject
  (Kjell Ahlstedt) Merge request !62 (BogDan Vatra)
* Meson build: No implicit_include_directories
  (Kjell Ahlstedt)
* MSVC build: Gtk::TreeModelColumnRecord: Export class selectively
  (Chun-wei Fan)

3.24.4 (stable):

The tarball for 3.24.4 has been created with 'meson dist'.
If you build with Autotools from the tarball, please read the relevant
part of the README file.

Build on Windows:
* Gtk::TreePath: Export comparison operators
  (Chun-wei Fan) Issue #88 (Patrick Storz)
  (Chun-wei Fan) Merge request !58

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../0001-meson.build-use-relative-path.patch  | 52 -------------------
 .../{gtkmm3_3.24.3.bb => gtkmm3_3.24.5.bb}    |  5 +-
 2 files changed, 1 insertion(+), 56 deletions(-)
 delete mode 100644 meta-oe/recipes-gnome/gtk+/gtkmm/0001-meson.build-use-relative-path.patch
 rename meta-oe/recipes-gnome/gtk+/{gtkmm3_3.24.3.bb => gtkmm3_3.24.5.bb} (77%)

diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm/0001-meson.build-use-relative-path.patch b/meta-oe/recipes-gnome/gtk+/gtkmm/0001-meson.build-use-relative-path.patch
deleted file mode 100644
index 46a691643..000000000
--- a/meta-oe/recipes-gnome/gtk+/gtkmm/0001-meson.build-use-relative-path.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 152d295a28567ac87b0e6db2e62c0d914b1d7ef9 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Tue, 23 Feb 2021 08:47:54 +0000
-Subject: [PATCH] meson.build: use relative path
-
-Fixes:
-Fatal error: can't create
-gdk/gdkmm/libgdkmm-3.0.so.1.1.0.p/_buildarea1_master-wr_build_Userspace_auto-usrmerge_standalone_usrmerge_next_210222_lxbuilds_Har12345_platform_up_intel-x86-64-standard-glibc-std_wrlinux_build_tmp-glibc_work_corei7-64-wrs-linux_gtkmm3_3.24.3-r0_gtkmm-3.24.3_untracked_gdk_gdkmm_timecoord.cc.o: File name too long
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gtkmm/-/merge_requests/61]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- gdk/gdkmm/meson.build | 4 ++--
- gtk/gtkmm/meson.build | 4 ++--
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/gdk/gdkmm/meson.build b/gdk/gdkmm/meson.build
-index afccaea..240ce4d 100644
---- a/gdk/gdkmm/meson.build
-+++ b/gdk/gdkmm/meson.build
-@@ -200,9 +200,9 @@ else # not maintainer_mode
-     gdkmm_hg_ccg_basenames,
-   )
- 
--  built_cc_files = [ src_untracked_gdkmm / 'wrap_init.cc' ]
-+  built_cc_files = [ '../..' / untracked_gdkmm / 'wrap_init.cc' ]
-   foreach file : gdkmm_used_hg_ccg_basenames
--    built_cc_files += src_untracked_gdkmm / file + '.cc'
-+    built_cc_files += '../..' / untracked_gdkmm / file + '.cc'
-   endforeach
- 
-   gdk_gen_sources = built_cc_files
-diff --git a/gtk/gtkmm/meson.build b/gtk/gtkmm/meson.build
-index ab96a22..cc0c050 100644
---- a/gtk/gtkmm/meson.build
-+++ b/gtk/gtkmm/meson.build
-@@ -464,9 +464,9 @@ else # not maintainer_mode
-     gtkmm_hg_ccg_basenames,
-   )
- 
--  built_cc_files = [ src_untracked_gtkmm / 'wrap_init.cc' ]
-+  built_cc_files = [ '../..' / untracked_gtkmm / 'wrap_init.cc' ]
-   foreach file : gtkmm_used_hg_ccg_basenames
--    built_cc_files += src_untracked_gtkmm / file + '.cc'
-+    built_cc_files += '../..' / untracked_gtkmm / file + '.cc'
-   endforeach
- 
-   gtk_gen_sources = built_cc_files
--- 
-2.29.2
-
diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.3.bb b/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.5.bb
similarity index 77%
rename from meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.3.bb
rename to meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.5.bb
index 1648e37fa..2c5012cb2 100644
--- a/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.3.bb
+++ b/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.5.bb
@@ -16,10 +16,7 @@ inherit gnomebase features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI += "file://0001-meson.build-use-relative-path.patch \
-"
-
-SRC_URI[archive.sha256sum] = "60497c4f7f354c3bd2557485f0254f8b7b4cf4bebc9fee0be26a77744eacd435"
+SRC_URI[archive.sha256sum] = "856333de86689f6a81c123f2db15d85db9addc438bc3574c36f15736aeae22e6"
 
 EXTRA_OEMESON = "-Dbuild-demos=false"
 
-- 
2.31.1

