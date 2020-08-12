Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.292.1597264897990401526
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 13:41:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KGJRIi/+;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id v15so1634186pgh.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Aug 2020 13:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sumpd7AvAQfTgh0Nuoqixy2l53FVSs9EISmvST9aZWU=;
        b=KGJRIi/+bfei4XvKELuc2YftdPsN5sJN0YLGKaLPZqk9taCOI60Sb31YDO8KnYjo75
         RvNuxx4bcYlIzyG/+jG/e5pwkRF6f1Oh/5epo+jBsUab3ETak1NeQcdGSoQTSCnp3p+v
         uGHUXAe+WtA4CcXAwub836W3i0Ze3Fbv66yHUfIe4V4l4nvdF6MCHhDL3Z5rcqQCE7yw
         7aqCAT3OUmL7NoSb2jQRPi5Y4pPFhV2u/t1sdnvSih4a1Md5Dt0exNHihiYhviQid/mt
         6+Sed/YTxxwTfjjqTw4Z8MhZ7JYXc6b1oUo6FWtvQz0cx8F9tJFzy0MeVpxW7PyKGsgF
         Tjag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sumpd7AvAQfTgh0Nuoqixy2l53FVSs9EISmvST9aZWU=;
        b=Bj+Hx42678r34tRdVgRb4V1Z6LRUYhZdXnyM+/KDrjNToCHGXH159y4AxMPljMONjo
         flxHUdXYLSNo5ev4fUFb09lciOf1JxRr7bKCnuHDk4KnjFcvikW2OpeeXI+Dwfq274BH
         +VngwAtxoQxn5Avz7Qu/Gh3UiTO5L9BzKKfwgV0WAqa5LsTquIyfOwjRixE6dB6wljj/
         9dvRMX09Wb3lyrZNMeByk60y8a+FCBdhckIxQxRRd44foXKdRW1N55HlHqBpj9LvwZaY
         Bn6LsRih8q61fvKdBnKR1ThRx71Q5ikdmlloB64Zt2WzQkpDDVIFYlEBc1ntVSCrU6+5
         vL/A==
X-Gm-Message-State: AOAM530HvQNNm0DjzuIBqGt4qFIGgJnnaNYtMg86bcwnsK1dtj+LN3m6
	6YQ5sZYmSo1Xkg17AtVysaNRtm/JvEw=
X-Google-Smtp-Source: ABdhPJwFpiz7axN+jcr8K3ljBEK9FxwvAQXPguozaQQ8PAJi2PPLRi6Hs9wCvRIUG5k1Sp2OUh5/mg==
X-Received: by 2002:a63:6744:: with SMTP id b65mr890656pgc.42.1597264897005;
        Wed, 12 Aug 2020 13:41:37 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id l22sm2984287pjy.31.2020.08.12.13.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 13:41:36 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][ 06/18] netplan: Update to latest to fix build with -fno-common
Date: Wed, 12 Aug 2020 13:41:18 -0700
Message-Id: <20200812204130.1012160-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200812204130.1012160-1-raj.khem@gmail.com>
References: <20200812204130.1012160-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add patches to fix build with clang-11

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-dbus-Remove-unused-variabes.patch    | 33 +++++++++++++++++
 ...rst-prerquisite-only-for-target-rule.patch | 35 +++++++++++++++++++
 .../netplan/netplan_0.99.bb                   |  4 ++-
 3 files changed, 71 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-connectivity/netplan/netplan/0001-dbus-Remove-unused-variabes.patch
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
index 67ccddf6ab..702fcca75d 100644
--- a/meta-networking/recipes-connectivity/netplan/netplan_0.99.bb
+++ b/meta-networking/recipes-connectivity/netplan/netplan_0.99.bb
@@ -11,11 +11,13 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 S = "${WORKDIR}/git"
-SRCREV = "1ccf7e0e3a7a91edbbe3f9f0669c8bbab8248cd1"
+SRCREV = "85134d13eb1ee5a1a7d139cd74ffa10933d73677"
 PV = "0.99+git${SRCPV}"
 
 SRC_URI = " \
         git://github.com/CanonicalLtd/netplan.git \
+        file://0001-dbus-Remove-unused-variabes.patch \
+        file://0002-Makefile-Use-first-prerquisite-only-for-target-rule.patch \
 "
 
 DEPENDS = "glib-2.0 libyaml ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
-- 
2.28.0

