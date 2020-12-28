Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web12.42521.1609134875945015598
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Dec 2020 21:54:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,454,1599494400"; 
   d="scan'208";a="102979335"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Dec 2020 13:54:31 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 92FE94CE600B
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Dec 2020 13:54:29 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 28 Dec 2020 13:54:29 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] netplan: upgrade 0.100 -> 0.101
Date: Mon, 28 Dec 2020 13:54:24 +0800
Message-ID: <1609134864-89900-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 92FE94CE600B.A9780
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Refresh the following patch:
0001-dbus-Remove-unused-variabes.patch
0002-Makefile-Exclude-.h-files-from-target-rule.patch

Add 0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch to solve the
compilation errors on musl.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../0001-dbus-Remove-unused-variabes.patch    | 22 +++++++++-----
 ...-t-fail-if-GLOB_BRACE-is-not-defined.patch | 30 +++++++++++++++++++
 ...le-Exclude-.h-files-from-target-rule.patch | 16 +++++-----
 .../{netplan_0.100.bb => netplan_0.101.bb}    |  5 ++--
 4 files changed, 56 insertions(+), 17 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch
 rename meta-networking/recipes-connectivity/netplan/{netplan_0.100.bb => netplan_0.101.bb} (94%)

diff --git a/meta-networking/recipes-connectivity/netplan/netplan/0001-dbus-Remove-unused-variabes.patch b/meta-networking/recipes-connectivity/netplan/netplan/0001-dbus-Remove-unused-variabes.patch
index af28ba71e..407e24ca0 100644
--- a/meta-networking/recipes-connectivity/netplan/netplan/0001-dbus-Remove-unused-variabes.patch
+++ b/meta-networking/recipes-connectivity/netplan/netplan/0001-dbus-Remove-unused-variabes.patch
@@ -1,6 +1,3 @@
-From e5bd4c3853fb394edc8cbea17fad82ce23bd0fae Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 27 Nov 2020 12:21:32 -0800
 Subject: [PATCH 1/2] dbus: Remove unused variabes
 
 This issue is seen when using clang to compile it
@@ -19,11 +16,13 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/parse.c    | 1 -
  3 files changed, 5 deletions(-)
 
+diff --git a/src/dbus.c b/src/dbus.c
+index 9606fea..8e1ed9d 100644
 --- a/src/dbus.c
 +++ b/src/dbus.c
-@@ -45,9 +45,6 @@ static int method_apply(sd_bus_message *
- 
- static int method_info(sd_bus_message *m, void *userdata, sd_bus_error *ret_error) {
+@@ -242,9 +242,6 @@ static int
+ method_info(sd_bus_message *m, void *userdata, sd_bus_error *ret_error)
+ {
      sd_bus_message *reply = NULL;
 -    g_autoptr(GError) err = NULL;
 -    g_autofree gchar *stdout = NULL;
@@ -31,9 +30,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
      gint exit_status = 0;
  
      exit_status = sd_bus_message_new_method_return(m, &reply);
+diff --git a/src/networkd.c b/src/networkd.c
+index 7c86cd6..7200740 100644
 --- a/src/networkd.c
 +++ b/src/networkd.c
-@@ -896,7 +896,6 @@ append_wpa_auth_conf(GString* s, const N
+@@ -897,7 +897,6 @@ append_wpa_auth_conf(GString* s, const NetplanAuthenticationSettings* auth, cons
  static void
  write_wpa_unit(const NetplanNetDefinition* def, const char* rootdir)
  {
@@ -41,9 +42,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
      g_autofree gchar *stdouth = NULL;
  
      stdouth = systemd_escape(def->id);
+diff --git a/src/parse.c b/src/parse.c
+index 033c657..faca27f 100644
 --- a/src/parse.c
 +++ b/src/parse.c
-@@ -1898,7 +1898,6 @@ handle_wireguard_peers(yaml_document_t*
+@@ -1899,7 +1899,6 @@ handle_wireguard_peers(yaml_document_t* doc, yaml_node_t* node, const void* _, G
      }
  
      for (yaml_node_item_t *i = node->data.sequence.items.start; i < node->data.sequence.items.top; i++) {
@@ -51,3 +54,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
          yaml_node_t *entry = yaml_document_get_node(doc, *i);
          assert_type(entry, YAML_MAPPING_NODE);
  
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch b/meta-networking/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch
new file mode 100644
index 000000000..dab8693c7
--- /dev/null
+++ b/meta-networking/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch
@@ -0,0 +1,30 @@
+From ceb4111af317ecc54d97bb21878dcccbfdb2983e Mon Sep 17 00:00:00 2001
+From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
+Date: Fri, 25 Dec 2020 11:41:43 +0900
+Subject: [PATCH] don't fail if GLOB_BRACE is not defined
+
+Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
+---
+ src/util.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/util.c b/src/util.c
+index 7e59985..eb8e573 100644
+--- a/src/util.c
++++ b/src/util.c
+@@ -23,6 +23,12 @@
+ 
+ #include "util.h"
+ 
++/* Don't fail if the standard library
++ * doesn't provide brace expansion */
++#ifndef GLOB_BRACE
++#define GLOB_BRACE 0
++#endif
++
+ GHashTable* wifi_frequency_24;
+ GHashTable* wifi_frequency_5;
+ 
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-connectivity/netplan/netplan/0002-Makefile-Exclude-.h-files-from-target-rule.patch b/meta-networking/recipes-connectivity/netplan/netplan/0002-Makefile-Exclude-.h-files-from-target-rule.patch
index cd75d1cb1..68aabd6a4 100644
--- a/meta-networking/recipes-connectivity/netplan/netplan/0002-Makefile-Exclude-.h-files-from-target-rule.patch
+++ b/meta-networking/recipes-connectivity/netplan/netplan/0002-Makefile-Exclude-.h-files-from-target-rule.patch
@@ -1,6 +1,3 @@
-From 5abb6b8343b5d2633844144979b40f398450b544 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 27 Nov 2020 12:22:32 -0800
 Subject: [PATCH 2/2] Makefile: Exclude .h files from target rule
 
 This ensures that src/_features.h is not added to compiler cmdline which
@@ -17,14 +14,19 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
+diff --git a/Makefile b/Makefile
+index 4fa6bd8..567d326 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -47,7 +47,7 @@ generate: libnetplan.so.$(NETPLAN_SOVER)
+@@ -46,7 +46,7 @@ generate: libnetplan.so.$(NETPLAN_SOVER) nm.o networkd.o openvswitch.o generate.
  	$(CC) $(BUILDFLAGS) $(CFLAGS) $(LDFLAGS) -o $@ $^ -L. -lnetplan `pkg-config --cflags --libs glib-2.0 gio-2.0 yaml-0.1 uuid`
  
- netplan-dbus: src/dbus.c src/_features.h
--	$(CC) $(BUILDFLAGS) $(CFLAGS) $(LDFLAGS) -o $@ $^ `pkg-config --cflags --libs libsystemd glib-2.0`
-+	$(CC) $(BUILDFLAGS) $(CFLAGS) $(LDFLAGS) -o $@ $(patsubst %.h,,$^) `pkg-config --cflags --libs libsystemd glib-2.0`
+ netplan-dbus: src/dbus.c src/_features.h util.o
+-	$(CC) $(BUILDFLAGS) $(CFLAGS) $(LDFLAGS) -o $@ $^ `pkg-config --cflags --libs libsystemd glib-2.0 gio-2.0`
++	$(CC) $(BUILDFLAGS) $(CFLAGS) $(LDFLAGS) -o $@ $(patsubst %.h,,$^) `pkg-config --cflags --libs libsystemd glib-2.0 gio-2.0`
  
  src/_features.h: src/[^_]*.[hc]
  	printf "#include <stddef.h>\nstatic const char *feature_flags[] __attribute__((__unused__)) = {\n" > $@
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-connectivity/netplan/netplan_0.100.bb b/meta-networking/recipes-connectivity/netplan/netplan_0.101.bb
similarity index 94%
rename from meta-networking/recipes-connectivity/netplan/netplan_0.100.bb
rename to meta-networking/recipes-connectivity/netplan/netplan_0.101.bb
index 2f74a22c0..a3afcd2d5 100644
--- a/meta-networking/recipes-connectivity/netplan/netplan_0.100.bb
+++ b/meta-networking/recipes-connectivity/netplan/netplan_0.101.bb
@@ -11,14 +11,15 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 S = "${WORKDIR}/git"
-SRCREV = "b7d32aebc880f3161b8f97ee56b729c0c54dd0e4"
-PV = "0.100+git${SRCPV}"
+SRCREV = "e445b87b9dff439ec564c245d030b03d61eb0f24"
+PV = "0.101+git${SRCPV}"
 
 SRC_URI = " \
         git://github.com/CanonicalLtd/netplan.git \
         file://0001-dbus-Remove-unused-variabes.patch \
         file://0002-Makefile-Exclude-.h-files-from-target-rule.patch \
 "
+SRC_URI_append_libc-musl = " file://0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch"
 
 DEPENDS = "glib-2.0 libyaml ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 
-- 
2.25.1



