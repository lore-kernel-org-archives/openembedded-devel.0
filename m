Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web10.13098.1597333907077396471
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 08:51:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sXUWdoOQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f195.google.com with SMTP id y10so1237455plr.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2020 08:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uiIjohc2MliW6JbjtRBrSj3GvSjp3BX2COje7qzFhrQ=;
        b=sXUWdoOQ9JEn5g50IQYPefQyHfk5rb7ycBH3PLC0fEJpf0VLXC8eT+SMqSv/81wzgE
         ZsTIK096Mh7dzBR80V+s+1MBIq1Zojhc9Lf4r+tgGtkIowsStnqg+KDffFtYUY+wc4v5
         JViM0xkGT3fazL37TnsoD9xtCoNoRtQYRimZNRr5nwdgwbvuSEB0yutL2tSDKQNBcZda
         KOEl65W1t9YTZvIoC1oToTeFfjAn/17p73OPNkmdZspPyrwe0O8rj00sCRgmk1xnbesd
         bg9+dg2gcbIyWXAEPBsiX4Aq40nJGIrPSh0g7qtsHdsMPKh/XYZ7E34HJ5GJh8x+1JZs
         HB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uiIjohc2MliW6JbjtRBrSj3GvSjp3BX2COje7qzFhrQ=;
        b=OXrpzvriVJAu2vnEVyXr+hiQIQN1QXB+9Qg8YnmuEAPZLmcpzUV7n9/RfhYiXnUldH
         SJlak3C3EuT1MqcWDrAoqaoe31ssgcDo3A4DfJkmYynF0rlKaah5Yrdabnyr1q+p4TH/
         l8OotPyJmOQw5Ko/xaHXZZ7tY5Hpdea9AhQmUud5ACu66eQ7xudMi8+FNn5SDQUpfIdW
         S5tjiKPN6uowKCqBZhwDkVNzmvbaNDJ+GOVRYiW6cLSxrdxIOASPjgTGV8Bsg8H7Q1Ea
         6nIZmAo3UiLaAsmEhNnZ/uSC/eg7N/ehn3TL9ibjuQwH3bkSftTD+KLnbC2QVHoaOjSE
         mP8w==
X-Gm-Message-State: AOAM5333/ZR3k/JzARdJdQd9f508yQumvfaAMyKNXmVNPbYtPiK/rU9D
	jhQ3gRhZ/a0p2WnbU7DfnqzKePpbeNs=
X-Google-Smtp-Source: ABdhPJx/B3mjfG/vo5nJVJsMUysfU8CrYc/Ber15tdV4+zMU3qFi+oWtIVTQo8FGmo71zsebvIbd3w==
X-Received: by 2002:a17:90a:e990:: with SMTP id v16mr5990718pjy.194.1597333905811;
        Thu, 13 Aug 2020 08:51:45 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net (c-73-63-224-124.hsd1.ca.comcast.net. [73.63.224.124])
        by smtp.gmail.com with ESMTPSA id a4sm5664407pju.49.2020.08.13.08.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 08:51:45 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH V2] netplan: Update to latest to fix build with -fno-common
Date: Thu, 13 Aug 2020 08:51:41 -0700
Message-Id: <20200813155141.774110-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200813155141.774110-1-raj.khem@gmail.com>
References: <20200813155141.774110-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add patches to fix build with clang-11

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Add a patch to fix gcc10 warnings

 .../0001-dbus-Remove-unused-variabes.patch    | 33 +++++++++++++++++
 ...1-src-parse.c-Initialize-key-to-NULL.patch | 32 +++++++++++++++++
 ...rst-prerquisite-only-for-target-rule.patch | 35 +++++++++++++++++++
 .../netplan/netplan_0.99.bb                   |  5 ++-
 4 files changed, 104 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-connectivity/netplan/netplan/0001-dbus-Remove-unused-variabes.patch
 create mode 100644 meta-networking/recipes-connectivity/netplan/netplan/0001-src-parse.c-Initialize-key-to-NULL.patch
 create mode 100644 meta-networking/recipes-connectivity/netplan/netplan/0002-Makefile-Use-first-prerquisite-only-for-target-rule.patch

diff --git a/meta-networking/recipes-connectivity/netplan/netplan/0001-dbus-Remove-unused-variabes.patch b/meta-networking/recipes-connectivity/netplan/netplan/0001-dbus-Remove-unused-variabes.patch
new file mode 100644
index 0000000000..22ecae3047
--- /dev/null
+++ b/meta-networking/recipes-connectivity/netplan/netplan/0001-dbus-Remove-unused-variabes.patch
@@ -0,0 +1,33 @@
+From 0edb96a5f79dcec4f4467193716c2bf015fe5132 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 12 Aug 2020 10:38:07 -0700
+Subject: [PATCH 1/2] dbus: Remove unused variabes
+
+Fixes
+src/dbus.c:49:23: error: unused variable 'stdout' [-Werror,-Wunused-variable]
+g_autofree gchar *stdout = NULL;
+^
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/dbus.c | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/src/dbus.c b/src/dbus.c
+index cb7ec38..a057236 100644
+--- a/src/dbus.c
++++ b/src/dbus.c
+@@ -45,9 +45,6 @@ static int method_apply(sd_bus_message *m, void *userdata, sd_bus_error *ret_err
+ 
+ static int method_info(sd_bus_message *m, void *userdata, sd_bus_error *ret_error) {
+     sd_bus_message *reply = NULL;
+-    g_autoptr(GError) err = NULL;
+-    g_autofree gchar *stdout = NULL;
+-    g_autofree gchar *stderr = NULL;
+     gint exit_status = 0;
+ 
+     exit_status = sd_bus_message_new_method_return(m, &reply);
+-- 
+2.28.0
+
diff --git a/meta-networking/recipes-connectivity/netplan/netplan/0001-src-parse.c-Initialize-key-to-NULL.patch b/meta-networking/recipes-connectivity/netplan/netplan/0001-src-parse.c-Initialize-key-to-NULL.patch
new file mode 100644
index 0000000000..a710b1e576
--- /dev/null
+++ b/meta-networking/recipes-connectivity/netplan/netplan/0001-src-parse.c-Initialize-key-to-NULL.patch
@@ -0,0 +1,32 @@
+From 63de116c617a35ff3d54c785b3dfb5378bb07f46 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 12 Aug 2020 22:39:17 -0700
+Subject: [PATCH] src/parse.c: Initialize key to NULL
+
+Fixes
+
+src/parse.c:810:22: note: 'key' was declared here
+cc1: all warnings being treated as errors
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/parse.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/parse.c b/src/parse.c
+index 63a0863..c66277f 100644
+--- a/src/parse.c
++++ b/src/parse.c
+@@ -807,7 +807,7 @@ handle_addresses(yaml_document_t* doc, yaml_node_t* node, const void* _, GError*
+         char* prefix_len;
+         guint64 prefix_len_num;
+         yaml_node_t *entry = yaml_document_get_node(doc, *i);
+-        yaml_node_t *key, *value = NULL;
++        yaml_node_t *key = NULL, *value = NULL;
+ 
+         if (entry->type != YAML_SCALAR_NODE && entry->type != YAML_MAPPING_NODE) {
+             return yaml_error(entry, error, "expected either scalar or mapping (check indentation)");
+-- 
+2.28.0
+
diff --git a/meta-networking/recipes-connectivity/netplan/netplan/0002-Makefile-Use-first-prerquisite-only-for-target-rule.patch b/meta-networking/recipes-connectivity/netplan/netplan/0002-Makefile-Use-first-prerquisite-only-for-target-rule.patch
new file mode 100644
index 0000000000..e736529a8a
--- /dev/null
+++ b/meta-networking/recipes-connectivity/netplan/netplan/0002-Makefile-Use-first-prerquisite-only-for-target-rule.patch
@@ -0,0 +1,35 @@
+From 1da4451fd3470e6600b027cb78526b440e296f8b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 12 Aug 2020 10:47:08 -0700
+Subject: [PATCH 2/2] Makefile: Use first prerquisite only for target rule
+
+This ensures that src/_features.h is not added to compiler cmdline which
+can confuse the compiler as it may not understand .h as valid input and
+complain
+
+| clang-11: error: cannot specify -o when generating multiple output files
+| make: *** [Makefile:50: netplan-dbus] Error 1
+| make: *** Waiting for unfinished jobs....
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 4495773..c05dea3 100644
+--- a/Makefile
++++ b/Makefile
+@@ -47,7 +47,7 @@ generate: libnetplan.so.$(NETPLAN_SOVER) nm.o networkd.o generate.o sriov.o
+ 	$(CC) $(BUILDFLAGS) $(CFLAGS) $(LDFLAGS) -o $@ $^ -L. -lnetplan `pkg-config --cflags --libs glib-2.0 gio-2.0 yaml-0.1 uuid`
+ 
+ netplan-dbus: src/dbus.c src/_features.h
+-	$(CC) $(BUILDFLAGS) $(CFLAGS) $(LDFLAGS) -o $@ $^ `pkg-config --cflags --libs libsystemd glib-2.0`
++	$(CC) $(BUILDFLAGS) $(CFLAGS) $(LDFLAGS) -o $@ $< `pkg-config --cflags --libs libsystemd glib-2.0`
+ 
+ src/_features.h: src/[^_]*.[hc]
+ 	printf "#include <stddef.h>\nstatic const char *feature_flags[] __attribute__((__unused__)) = {\n" > $@
+-- 
+2.28.0
+
diff --git a/meta-networking/recipes-connectivity/netplan/netplan_0.99.bb b/meta-networking/recipes-connectivity/netplan/netplan_0.99.bb
index 67ccddf6ab..5546f300b3 100644
--- a/meta-networking/recipes-connectivity/netplan/netplan_0.99.bb
+++ b/meta-networking/recipes-connectivity/netplan/netplan_0.99.bb
@@ -11,11 +11,14 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 S = "${WORKDIR}/git"
-SRCREV = "1ccf7e0e3a7a91edbbe3f9f0669c8bbab8248cd1"
+SRCREV = "85134d13eb1ee5a1a7d139cd74ffa10933d73677"
 PV = "0.99+git${SRCPV}"
 
 SRC_URI = " \
         git://github.com/CanonicalLtd/netplan.git \
+        file://0001-dbus-Remove-unused-variabes.patch \
+        file://0002-Makefile-Use-first-prerquisite-only-for-target-rule.patch \
+        file://0001-src-parse.c-Initialize-key-to-NULL.patch \
 "
 
 DEPENDS = "glib-2.0 libyaml ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
-- 
2.28.0

