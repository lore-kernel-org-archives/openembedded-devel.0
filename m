Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web09.25701.1606515774094007699
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Nov 2020 14:22:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=j63MfHzV;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id e8so5667416pfh.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2020 14:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F9Cl29/yssK3qu+d7WXK291+ZRTvebyEXs+cYrmvll0=;
        b=j63MfHzVmW7uNqeDJuX0ltgORbFVQq7hsTKwCuYafZ71vwFrrfyIrOOiJaL6XSRb1d
         KbEikHkJsnYEzWFySJtNtABbMXWXhJGF9eHwc6gPM3sF+IizfBXTGQsy9t2qXf9kcKq8
         Si+l5ceUg3wcqZzjbLpFh5xESxu+huzr+3Nhc/bKqfVIciVxJXcfzXc1MbxO+LUmkpVu
         D/ISumP4PsAlkgSfi9kUppEEhLHsg8hQr8A9vYcGEU0Qwqikep0wskCeX5aNAf3iOpYb
         BDlIIz8z+iM13whrU7XlraQTHUtNQGUCNOcJQ48hNXw7ed8wXa8FCTFp9i8yEpfeWoXU
         XH0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F9Cl29/yssK3qu+d7WXK291+ZRTvebyEXs+cYrmvll0=;
        b=Q7CluOVr3vO34pxVNMeBJTz7QXqEsyyfBW3xz+1GWvtdicys982njShkB1S2ifUjTo
         ocHGPqVvtmnSFIRYYQzIOko1UPcey0K+bxyTR/6o1DRPbYcFUaRJJ/LjuL0rFvhxwc2v
         mqo5R9AeAkw21ksPzpH6orTQfoTxtjZRMq/UOO/aQp53p8Mk36LWwAEB0SRQS5D+GWEN
         J1waS0yoL4Wc4+gF6ObOLOlb90WGAzoOPDbJ8pra6KPFMU0B0aXVq/tFrAEqFp4j6iAN
         sF+fBzL5q3e7kRho5GX7w3tyS8WgujmpqsViNjH5AkDrQVMWKqwqGKScBYEgHU77/Kya
         IqTQ==
X-Gm-Message-State: AOAM53365utudrjEQNSb8p2dgHVxXg7uTJHCwiKgQNsB/n21Sb/i7NI5
	4MhQxzibHj9a+BprPhIVItav2ePgcG1mzA==
X-Google-Smtp-Source: ABdhPJziDjga14L4DZaY9ZbXEe42LaE1g1I2rLI4FneOmpjimWtVzFAzKcdVvLGwakExrr8+DDsoaA==
X-Received: by 2002:a65:5b04:: with SMTP id y4mr8342075pgq.448.1606515773093;
        Fri, 27 Nov 2020 14:22:53 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::49d7])
        by smtp.gmail.com with ESMTPSA id dw5sm11379601pjb.24.2020.11.27.14.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 14:22:52 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: zangrc <zangrc.fnst@cn.fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH v2] netplan: upgrade 0.99 -> 0.100
Date: Fri, 27 Nov 2020 14:22:50 -0800
Message-Id: <20201127222250.1718055-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: zangrc <zangrc.fnst@cn.fujitsu.com>

0001-src-parse.c-Initialize-key-to-NULL.patch
Removed since this is included in 0.100.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix build with clang

 .../0001-dbus-Remove-unused-variabes.patch    | 44 ++++++++++++++-----
 ...1-src-parse.c-Initialize-key-to-NULL.patch | 32 --------------
 ...e-Exclude-.h-files-from-target-rule.patch} | 21 ++++-----
 .../{netplan_0.99.bb => netplan_0.100.bb}     |  7 ++-
 4 files changed, 43 insertions(+), 61 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/netplan/netplan/0001-src-parse.c-Initialize-key-to-NULL.patch
 rename meta-networking/recipes-connectivity/netplan/netplan/{0002-Makefile-Use-first-prerquisite-only-for-target-rule.patch => 0002-Makefile-Exclude-.h-files-from-target-rule.patch} (60%)
 rename meta-networking/recipes-connectivity/netplan/{netplan_0.99.bb => netplan_0.100.bb} (92%)

diff --git a/meta-networking/recipes-connectivity/netplan/netplan/0001-dbus-Remove-unused-variabes.patch b/meta-networking/recipes-connectivity/netplan/netplan/0001-dbus-Remove-unused-variabes.patch
index 22ecae3047..af28ba71e7 100644
--- a/meta-networking/recipes-connectivity/netplan/netplan/0001-dbus-Remove-unused-variabes.patch
+++ b/meta-networking/recipes-connectivity/netplan/netplan/0001-dbus-Remove-unused-variabes.patch
@@ -1,24 +1,27 @@
-From 0edb96a5f79dcec4f4467193716c2bf015fe5132 Mon Sep 17 00:00:00 2001
+From e5bd4c3853fb394edc8cbea17fad82ce23bd0fae Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 12 Aug 2020 10:38:07 -0700
+Date: Fri, 27 Nov 2020 12:21:32 -0800
 Subject: [PATCH 1/2] dbus: Remove unused variabes
 
+This issue is seen when using clang to compile it
+
+Same fix is needed for parse.c and networkd.c,
+
 Fixes
 src/dbus.c:49:23: error: unused variable 'stdout' [-Werror,-Wunused-variable]
 g_autofree gchar *stdout = NULL;
 ^
-
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/CanonicalLtd/netplan/pull/175]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- src/dbus.c | 3 ---
- 1 file changed, 3 deletions(-)
+ src/dbus.c     | 3 ---
+ src/networkd.c | 1 -
+ src/parse.c    | 1 -
+ 3 files changed, 5 deletions(-)
 
-diff --git a/src/dbus.c b/src/dbus.c
-index cb7ec38..a057236 100644
 --- a/src/dbus.c
 +++ b/src/dbus.c
-@@ -45,9 +45,6 @@ static int method_apply(sd_bus_message *m, void *userdata, sd_bus_error *ret_err
+@@ -45,9 +45,6 @@ static int method_apply(sd_bus_message *
  
  static int method_info(sd_bus_message *m, void *userdata, sd_bus_error *ret_error) {
      sd_bus_message *reply = NULL;
@@ -28,6 +31,23 @@ index cb7ec38..a057236 100644
      gint exit_status = 0;
  
      exit_status = sd_bus_message_new_method_return(m, &reply);
--- 
-2.28.0
-
+--- a/src/networkd.c
++++ b/src/networkd.c
+@@ -896,7 +896,6 @@ append_wpa_auth_conf(GString* s, const N
+ static void
+ write_wpa_unit(const NetplanNetDefinition* def, const char* rootdir)
+ {
+-    g_autoptr(GError) err = NULL;
+     g_autofree gchar *stdouth = NULL;
+ 
+     stdouth = systemd_escape(def->id);
+--- a/src/parse.c
++++ b/src/parse.c
+@@ -1898,7 +1898,6 @@ handle_wireguard_peers(yaml_document_t*
+     }
+ 
+     for (yaml_node_item_t *i = node->data.sequence.items.start; i < node->data.sequence.items.top; i++) {
+-        g_autofree char* addr = NULL;
+         yaml_node_t *entry = yaml_document_get_node(doc, *i);
+         assert_type(entry, YAML_MAPPING_NODE);
+ 
diff --git a/meta-networking/recipes-connectivity/netplan/netplan/0001-src-parse.c-Initialize-key-to-NULL.patch b/meta-networking/recipes-connectivity/netplan/netplan/0001-src-parse.c-Initialize-key-to-NULL.patch
deleted file mode 100644
index a710b1e576..0000000000
--- a/meta-networking/recipes-connectivity/netplan/netplan/0001-src-parse.c-Initialize-key-to-NULL.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 63de116c617a35ff3d54c785b3dfb5378bb07f46 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 12 Aug 2020 22:39:17 -0700
-Subject: [PATCH] src/parse.c: Initialize key to NULL
-
-Fixes
-
-src/parse.c:810:22: note: 'key' was declared here
-cc1: all warnings being treated as errors
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/parse.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/parse.c b/src/parse.c
-index 63a0863..c66277f 100644
---- a/src/parse.c
-+++ b/src/parse.c
-@@ -807,7 +807,7 @@ handle_addresses(yaml_document_t* doc, yaml_node_t* node, const void* _, GError*
-         char* prefix_len;
-         guint64 prefix_len_num;
-         yaml_node_t *entry = yaml_document_get_node(doc, *i);
--        yaml_node_t *key, *value = NULL;
-+        yaml_node_t *key = NULL, *value = NULL;
- 
-         if (entry->type != YAML_SCALAR_NODE && entry->type != YAML_MAPPING_NODE) {
-             return yaml_error(entry, error, "expected either scalar or mapping (check indentation)");
--- 
-2.28.0
-
diff --git a/meta-networking/recipes-connectivity/netplan/netplan/0002-Makefile-Use-first-prerquisite-only-for-target-rule.patch b/meta-networking/recipes-connectivity/netplan/netplan/0002-Makefile-Exclude-.h-files-from-target-rule.patch
similarity index 60%
rename from meta-networking/recipes-connectivity/netplan/netplan/0002-Makefile-Use-first-prerquisite-only-for-target-rule.patch
rename to meta-networking/recipes-connectivity/netplan/netplan/0002-Makefile-Exclude-.h-files-from-target-rule.patch
index e736529a8a..cd75d1cb1c 100644
--- a/meta-networking/recipes-connectivity/netplan/netplan/0002-Makefile-Use-first-prerquisite-only-for-target-rule.patch
+++ b/meta-networking/recipes-connectivity/netplan/netplan/0002-Makefile-Exclude-.h-files-from-target-rule.patch
@@ -1,35 +1,30 @@
-From 1da4451fd3470e6600b027cb78526b440e296f8b Mon Sep 17 00:00:00 2001
+From 5abb6b8343b5d2633844144979b40f398450b544 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 12 Aug 2020 10:47:08 -0700
-Subject: [PATCH 2/2] Makefile: Use first prerquisite only for target rule
+Date: Fri, 27 Nov 2020 12:22:32 -0800
+Subject: [PATCH 2/2] Makefile: Exclude .h files from target rule
 
 This ensures that src/_features.h is not added to compiler cmdline which
-can confuse the compiler as it may not understand .h as valid input and
-complain
+can confuse the compilers e.g. clang as it may not like .h as valid input
+and complain
 
 | clang-11: error: cannot specify -o when generating multiple output files
 | make: *** [Makefile:50: netplan-dbus] Error 1
 | make: *** Waiting for unfinished jobs....
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/CanonicalLtd/netplan/pull/175]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/Makefile b/Makefile
-index 4495773..c05dea3 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -47,7 +47,7 @@ generate: libnetplan.so.$(NETPLAN_SOVER) nm.o networkd.o generate.o sriov.o
+@@ -47,7 +47,7 @@ generate: libnetplan.so.$(NETPLAN_SOVER)
  	$(CC) $(BUILDFLAGS) $(CFLAGS) $(LDFLAGS) -o $@ $^ -L. -lnetplan `pkg-config --cflags --libs glib-2.0 gio-2.0 yaml-0.1 uuid`
  
  netplan-dbus: src/dbus.c src/_features.h
 -	$(CC) $(BUILDFLAGS) $(CFLAGS) $(LDFLAGS) -o $@ $^ `pkg-config --cflags --libs libsystemd glib-2.0`
-+	$(CC) $(BUILDFLAGS) $(CFLAGS) $(LDFLAGS) -o $@ $< `pkg-config --cflags --libs libsystemd glib-2.0`
++	$(CC) $(BUILDFLAGS) $(CFLAGS) $(LDFLAGS) -o $@ $(patsubst %.h,,$^) `pkg-config --cflags --libs libsystemd glib-2.0`
  
  src/_features.h: src/[^_]*.[hc]
  	printf "#include <stddef.h>\nstatic const char *feature_flags[] __attribute__((__unused__)) = {\n" > $@
--- 
-2.28.0
-
diff --git a/meta-networking/recipes-connectivity/netplan/netplan_0.99.bb b/meta-networking/recipes-connectivity/netplan/netplan_0.100.bb
similarity index 92%
rename from meta-networking/recipes-connectivity/netplan/netplan_0.99.bb
rename to meta-networking/recipes-connectivity/netplan/netplan_0.100.bb
index 5546f300b3..2f74a22c05 100644
--- a/meta-networking/recipes-connectivity/netplan/netplan_0.99.bb
+++ b/meta-networking/recipes-connectivity/netplan/netplan_0.100.bb
@@ -11,14 +11,13 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 S = "${WORKDIR}/git"
-SRCREV = "85134d13eb1ee5a1a7d139cd74ffa10933d73677"
-PV = "0.99+git${SRCPV}"
+SRCREV = "b7d32aebc880f3161b8f97ee56b729c0c54dd0e4"
+PV = "0.100+git${SRCPV}"
 
 SRC_URI = " \
         git://github.com/CanonicalLtd/netplan.git \
         file://0001-dbus-Remove-unused-variabes.patch \
-        file://0002-Makefile-Use-first-prerquisite-only-for-target-rule.patch \
-        file://0001-src-parse.c-Initialize-key-to-NULL.patch \
+        file://0002-Makefile-Exclude-.h-files-from-target-rule.patch \
 "
 
 DEPENDS = "glib-2.0 libyaml ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
-- 
2.29.2

