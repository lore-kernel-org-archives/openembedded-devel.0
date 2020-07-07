Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.8746.1594089869975868867
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2020 19:44:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: hongxu.jia@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0672hpXm003321
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Mon, 6 Jul 2020 19:44:01 -0700
Received: from ala-lpggp7.wrs.com (147.11.105.171) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Mon, 6 Jul 2020
 19:43:22 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] networkmanager: fix Files/directories were installed but not shipped
Date: Mon, 6 Jul 2020 19:43:22 -0700
Message-ID: <20200707024322.93541-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Since networkmanager: upgrade 1.22.10 -> 1.22.14, it added a new
build option 'firewalld-zone', while enabling multilib, there is
a QA issue
...
ERROR: QA Issue: networkmanager: Files/directories were installed but not shipped in any package:
  /usr/lib/firewalld
  /usr/lib/firewalld/zones
  /usr/lib/firewalld/zones/nm-shared.xml
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...d-to-var-libdir-rather-than-hardcod-.patch | 30 +++++++++++++++++++
 .../networkmanager/networkmanager_1.22.14.bb  |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-install-firewalld-to-var-libdir-rather-than-hardcod-.patch

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-install-firewalld-to-var-libdir-rather-than-hardcod-.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-install-firewalld-to-var-libdir-rather-than-hardcod-.patch
new file mode 100644
index 000000000..11741897f
--- /dev/null
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-install-firewalld-to-var-libdir-rather-than-hardcod-.patch
@@ -0,0 +1,30 @@
+From 6388b16b93ba805f8877a94f47509f701250812f Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 6 Jul 2020 19:33:54 -0700
+Subject: [PATCH] install firewalld to var-libdir rather than hardcod lib
+
+The oe install firewalld (split packages) to ${libdir}/firewalld/zones
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 358b01a..5745339 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -4778,7 +4778,7 @@ data/server.conf: $(srcdir)/data/server.conf.in
+ 	$(AM_V_GEN) $(data_edit) $< >$@
+ 
+ if WITH_FIREWALLD_ZONE
+-firewalldzonedir = $(prefix)/lib/firewalld/zones
++firewalldzonedir = $(libdir)/firewalld/zones
+ firewalldzone_DATA = data/nm-shared.xml
+ endif
+ 
+-- 
+2.21.0
+
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.14.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.14.bb
index cc2463845..049bf6eb0 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.14.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.14.bb
@@ -26,6 +26,7 @@ SRC_URI = " \
     file://${BPN}.initd \
     file://0001-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch \
     file://0002-Do-not-create-settings-settings-property-documentati.patch \
+    file://0001-install-firewalld-to-var-libdir-rather-than-hardcod-.patch \
 "
 SRC_URI_append_libc-musl = " \
     file://musl/0001-Fix-build-with-musl-systemd-specific.patch \
-- 
2.21.0

