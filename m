Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web08.33020.1623053556465495731
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jun 2021 01:12:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=bf7iRrV3;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623053554; i=@fujitsu.com;
	bh=6mgTAr7LZFkP+u6TTymXFpWfO8GzUY8iz3cGIkUcFts=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=bf7iRrV3yHIOOwdZcstsGxqSgYpzEX3P33uhpZ4qGrRYn7oc8K5dSza7NSjuPeFSN
	 ueQAhLSEityaX/KA4u7sdaDejVhCxzFAiXLQKl5eOnBjMaY3ZsWfvAu4FsTaa6yn6c
	 U8G2ZZbpmEK5v3xd32gehGgjNL52zYrs+InAGg9p0buwP25NyeBIzYVRlnB3GmKfnL
	 8UHz4Ku0AjjltkI3yA/d4or1ZuXACidedhFNnFZ9qU9GanFC3MFwzxpT0E/h6Hh9h8
	 g067zsvIi/6gBchl5xRQ4gdINotVYRh3AQbYQFjMNR5d+LdoGGa/HgPnGDzedRbtgW
	 gh+PMfJEk5J2A==
Received: from [100.112.198.228] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-west-1.aws.symcld.net id 56/81-00056-2F4DDB06; Mon, 07 Jun 2021 08:12:34 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRWlGSWpSXmKPExsViZ8MRqvvxyt4
  Eg+6lNhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bHd9mCbXoVq94dYm5g/K/RxcjFISQwi0ni
  w4EJbBDOcUaJrtNngRxODjYBHYmOF90sILaIgL7E0tl7mEFsYQF3iTXXZjGC2CwCKhKdT26wd
  zFycPACxR/254CEJQQUJKY8fA9WzisgKHFy5hOwMcwCEhIHX7xghqhRlNi+8wwLhF0hMWPGNr
  YJjDyzkLTMQtKygJFpFaNFUlFmekZJbmJmjq6hgYGuoaGRrqGlha6hhZleYpVukl5qqW55anG
  JrqFeYnmxXnFlbnJOil5easkmRmAQpRQc27WD8e3rD3qHGCU5mJREedmO704Q4kvKT6nMSCzO
  iC8qzUktPsQow8GhJMHLdHlvgpBgUWp6akVaZg4woGHSEhw8SiK830DSvMUFibnFmekQqVOMu
  hzvfi5exCzEkpeflyolznsbpEgApCijNA9uBCy6LjHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYF
  QS5mUDxqoQT2ZeCdymV0BHMAEdUW2/C+SIkkSElFQDkxSnYI/Mgx/1bYxRkR+qDx6f+qqs4BL
  X582dqu7M/orPFANbDBkNpyze8GsCY7p72n31h/t4fB09D3c/b5v3ZcGu0gmn8te8yvob9cC7
  V0hYcGnokq47rZU6B3aKOZxLq5Lg9/HeItn55s+7IMWj0a8PfToZ1Lqpj2+27Ge1381BPKJpV
  y6JVx8VCLoQ98Z8Icd/rycvomr/ui7+bezyRYp9v+g0xpIvO+fdmHIhd3rq2reh0rrBJ95/Cl
  nNOd3o7o65G6Q5GV965DDdsMg/s7GSwWTXAbUzp78IqBucuzH5QdiKjPqDWQ+3Ciu3z34w947
  lvXtOKx8suva9eJur2i2RwrM1s22rZvy4c39h+ColluKMREMt5qLiRABxIKdSKQMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-7.tower-285.messagelabs.com!1623053553!189!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31966 invoked from network); 7 Jun 2021 08:12:33 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-7.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Jun 2021 08:12:33 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1578CXDQ025998
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 7 Jun 2021 09:12:33 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Mon, 7 Jun 2021 09:12:32 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] netplan: upgrade 0.101 -> 0.102
Date: Mon, 7 Jun 2021 16:12:26 +0800
Message-ID: <1623053546-20819-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

0001-dbus-Remove-unused-variabes.patch
0002-Makefile-Exclude-.h-files-from-target-rule.patch
Removed since these are included in 0.102.

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../0001-dbus-Remove-unused-variabes.patch    | 59 -------------------
 ...le-Exclude-.h-files-from-target-rule.patch | 32 ----------
 .../{netplan_0.101.bb => netplan_0.102.bb}    |  6 +-
 3 files changed, 2 insertions(+), 95 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/netplan/netplan/0001-dbus-Remove-unused-variabes.patch
 delete mode 100644 meta-networking/recipes-connectivity/netplan/netplan/0002-Makefile-Exclude-.h-files-from-target-rule.patch
 rename meta-networking/recipes-connectivity/netplan/{netplan_0.101.bb => netplan_0.102.bb} (93%)

diff --git a/meta-networking/recipes-connectivity/netplan/netplan/0001-dbus-Remove-unused-variabes.patch b/meta-networking/recipes-connectivity/netplan/netplan/0001-dbus-Remove-unused-variabes.patch
deleted file mode 100644
index 407e24ca0..000000000
--- a/meta-networking/recipes-connectivity/netplan/netplan/0001-dbus-Remove-unused-variabes.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-Subject: [PATCH 1/2] dbus: Remove unused variabes
-
-This issue is seen when using clang to compile it
-
-Same fix is needed for parse.c and networkd.c,
-
-Fixes
-src/dbus.c:49:23: error: unused variable 'stdout' [-Werror,-Wunused-variable]
-g_autofree gchar *stdout = NULL;
-^
-Upstream-Status: Submitted [https://github.com/CanonicalLtd/netplan/pull/175]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/dbus.c     | 3 ---
- src/networkd.c | 1 -
- src/parse.c    | 1 -
- 3 files changed, 5 deletions(-)
-
-diff --git a/src/dbus.c b/src/dbus.c
-index 9606fea..8e1ed9d 100644
---- a/src/dbus.c
-+++ b/src/dbus.c
-@@ -242,9 +242,6 @@ static int
- method_info(sd_bus_message *m, void *userdata, sd_bus_error *ret_error)
- {
-     sd_bus_message *reply = NULL;
--    g_autoptr(GError) err = NULL;
--    g_autofree gchar *stdout = NULL;
--    g_autofree gchar *stderr = NULL;
-     gint exit_status = 0;
- 
-     exit_status = sd_bus_message_new_method_return(m, &reply);
-diff --git a/src/networkd.c b/src/networkd.c
-index 7c86cd6..7200740 100644
---- a/src/networkd.c
-+++ b/src/networkd.c
-@@ -897,7 +897,6 @@ append_wpa_auth_conf(GString* s, const NetplanAuthenticationSettings* auth, cons
- static void
- write_wpa_unit(const NetplanNetDefinition* def, const char* rootdir)
- {
--    g_autoptr(GError) err = NULL;
-     g_autofree gchar *stdouth = NULL;
- 
-     stdouth = systemd_escape(def->id);
-diff --git a/src/parse.c b/src/parse.c
-index 033c657..faca27f 100644
---- a/src/parse.c
-+++ b/src/parse.c
-@@ -1899,7 +1899,6 @@ handle_wireguard_peers(yaml_document_t* doc, yaml_node_t* node, const void* _, G
-     }
- 
-     for (yaml_node_item_t *i = node->data.sequence.items.start; i < node->data.sequence.items.top; i++) {
--        g_autofree char* addr = NULL;
-         yaml_node_t *entry = yaml_document_get_node(doc, *i);
-         assert_type(entry, YAML_MAPPING_NODE);
- 
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-connectivity/netplan/netplan/0002-Makefile-Exclude-.h-files-from-target-rule.patch b/meta-networking/recipes-connectivity/netplan/netplan/0002-Makefile-Exclude-.h-files-from-target-rule.patch
deleted file mode 100644
index 68aabd6a4..000000000
--- a/meta-networking/recipes-connectivity/netplan/netplan/0002-Makefile-Exclude-.h-files-from-target-rule.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Subject: [PATCH 2/2] Makefile: Exclude .h files from target rule
-
-This ensures that src/_features.h is not added to compiler cmdline which
-can confuse the compilers e.g. clang as it may not like .h as valid input
-and complain
-
-| clang-11: error: cannot specify -o when generating multiple output files
-| make: *** [Makefile:50: netplan-dbus] Error 1
-| make: *** Waiting for unfinished jobs....
-
-Upstream-Status: Submitted [https://github.com/CanonicalLtd/netplan/pull/175]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 4fa6bd8..567d326 100644
---- a/Makefile
-+++ b/Makefile
-@@ -46,7 +46,7 @@ generate: libnetplan.so.$(NETPLAN_SOVER) nm.o networkd.o openvswitch.o generate.
- 	$(CC) $(BUILDFLAGS) $(CFLAGS) $(LDFLAGS) -o $@ $^ -L. -lnetplan `pkg-config --cflags --libs glib-2.0 gio-2.0 yaml-0.1 uuid`
- 
- netplan-dbus: src/dbus.c src/_features.h util.o
--	$(CC) $(BUILDFLAGS) $(CFLAGS) $(LDFLAGS) -o $@ $^ `pkg-config --cflags --libs libsystemd glib-2.0 gio-2.0`
-+	$(CC) $(BUILDFLAGS) $(CFLAGS) $(LDFLAGS) -o $@ $(patsubst %.h,,$^) `pkg-config --cflags --libs libsystemd glib-2.0 gio-2.0`
- 
- src/_features.h: src/[^_]*.[hc]
- 	printf "#include <stddef.h>\nstatic const char *feature_flags[] __attribute__((__unused__)) = {\n" > $@
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-connectivity/netplan/netplan_0.101.bb b/meta-networking/recipes-connectivity/netplan/netplan_0.102.bb
similarity index 93%
rename from meta-networking/recipes-connectivity/netplan/netplan_0.101.bb
rename to meta-networking/recipes-connectivity/netplan/netplan_0.102.bb
index a3afcd2d5..81b58ab90 100644
--- a/meta-networking/recipes-connectivity/netplan/netplan_0.101.bb
+++ b/meta-networking/recipes-connectivity/netplan/netplan_0.102.bb
@@ -11,13 +11,11 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 S = "${WORKDIR}/git"
-SRCREV = "e445b87b9dff439ec564c245d030b03d61eb0f24"
-PV = "0.101+git${SRCPV}"
+SRCREV = "62701436991e42606c4e9e8dbdcdc5067d64f69b"
+PV = "0.102+git${SRCPV}"
 
 SRC_URI = " \
         git://github.com/CanonicalLtd/netplan.git \
-        file://0001-dbus-Remove-unused-variabes.patch \
-        file://0002-Makefile-Exclude-.h-files-from-target-rule.patch \
 "
 SRC_URI_append_libc-musl = " file://0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch"
 
-- 
2.25.1

