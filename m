Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id CE4AE6067C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Apr 2018 16:17:02 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id v60so33250009wrc.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Apr 2018 09:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=F3TClF6RV2/0+qlmfw9kBZ6QTK+vOaFkrI/TjtUTrCc=;
	b=kGdhz8GYKVZ6z/AM/2+FsPwV84WVb3nWIc30oSXyI5hABfpGx3Wb10d68xJ3pBMH9K
	491wFM4TnInjanqr1AjuZb9Pk/EP1hUUKrO9hoxZoW3RSHOU5obtnruBZwB8Y61oVYSC
	FkqwwM4g5yf8GBZFSvoBWKSzI908bv7cVmQW5ixdK6sxykoLfUeSkryS1I9+YLeY5quo
	ppZFx3gw7C06xxnc4J5HbOMpPZLaoNvY3zHex43mNx31hscnoeg30Z9lBGXb1onDGtnK
	fq2V+yXHgPWW2mWvBHTSDiLWtDUIMAnkjbiKcvA8CgoY3xhxsQWEyDHtK+F25RyM1Sp8
	3x8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=F3TClF6RV2/0+qlmfw9kBZ6QTK+vOaFkrI/TjtUTrCc=;
	b=YDHklv2nYY/t9Ygm0n+BiCq9CMQvvNLfLZxYrnJ8xWw8J8eUdeqWAsc7jq1A9XTtlM
	1avzzSdT955/JW2rsV75h865qyprFzUU4lGAv9fx1/P58twLtABmkJ8/v8w2Oq7sdcsB
	yxKp94ZsrG2JeK0BWfU1Nl+zBaR6AZYy9K9w49p5S61qcr0Y7SnpC6ukQeOF6CiMcrgm
	6OeAl31lAmtgI5JXLY8o/VTA7XuMexoogt0suheUQnSxPF9JwN179q6zZDAWw4VOGiT9
	YXg7y57XcfRgBRIODem/snWpVZPJnpnZXD61k2FcuF28ORFd49JE6Tno4N4g8uMSd6GT
	ztQw==
X-Gm-Message-State: ALQs6tB1GueYa6hyIUuj3/ra3pYCHa3Ei4PY3upJL7t2m4JQDsuyL1Xb
	sG/FkYwcpq7nZy3IVscOaRzt7w==
X-Google-Smtp-Source: AIpwx4+dXGRjBw+DUtftAi55pzHFzVapLB/oIVIi/RoTKwRxSep4/9PIgfye6+mJqCgToCgbkljtyA==
X-Received: by 10.28.39.195 with SMTP id n186mr27538wmn.1.1523981821853;
	Tue, 17 Apr 2018 09:17:01 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BD150941E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bd1:5094:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	m62sm2280034wmc.41.2018.04.17.09.17.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 17 Apr 2018 09:17:01 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Apr 2018 18:16:47 +0200
Message-Id: <20180417161648.14722-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
Subject: [PATCH 1/2 V3] networkmanager: fix gobject-introspection/musl and cleanup
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Apr 2018 16:17:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This adresses the comments for recent patch which updated nm to 1.10.6 and is a
follow-up for [1].

* Make gobject-introspection work by skipping creation of gobject-introspection
  specific documentation. This fixes networkmanager-applet regression.
* Cleanup patches: Remove current musl patches completely and re-use those
  found in void-linux because they do look much cleaner and don't touch glibc
  build. Since void-linux does not use systemd there have to be two patches
  added.

[1] https://patchwork.openembedded.org/patch/149244/

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
V1->V2: Fix parsing error introduced in V1
V2->V3: Fix musl build - now build tested

 ...adjust-net-headers-for-musl-compatibility.patch | 86 --------------------
 ...move-net-ethernet.h-seems-to-be-over-spe.patch} |  0
 ...igure.ac-Fix-pkgconfig-sysroot-locations.patch} |  0
 ...et-util.h-Include-linux-sockios.h-on-musl.patch | 30 -------
 .../networkmanager/0003-Define-ETH_ALEN.patch      | 39 ---------
 ...te-settings-settings-property-documentati.patch | 77 ++++++++++++++++++
 ...Define-missing-features-to-cater-for-musl.patch | 92 ----------------------
 .../0006-check-for-strndupa-before-using-it.patch  | 67 ----------------
 .../networkmanager/musl/0001-musl-basic.patch      | 53 +++++++++++++
 .../musl/0002-musl-dlopen-configure-ac.patch       | 35 ++++++++
 .../musl/0003-musl-network-support.patch           | 72 +++++++++++++++++
 .../musl/0004-musl-process-util.patch              | 62 +++++++++++++++
 ...further-conflicts-by-including-net-ethern.patch | 77 ++++++++++++++++++
 .../0006-Add-a-strndupa-replacement-for-musl.patch | 47 +++++++++++
 .../networkmanager/networkmanager_1.10.6.bb        | 39 +++++----
 15 files changed, 448 insertions(+), 328 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-adjust-net-headers-for-musl-compatibility.patch
 rename meta-networking/recipes-connectivity/networkmanager/networkmanager/{0005-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch => 0001-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch} (100%)
 rename meta-networking/recipes-connectivity/networkmanager/networkmanager/{0007-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch => 0002-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch} (100%)
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-socket-util.h-Include-linux-sockios.h-on-musl.patch
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-Define-ETH_ALEN.patch
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-Do-not-create-settings-settings-property-documentati.patch
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0004-Define-missing-features-to-cater-for-musl.patch
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0006-check-for-strndupa-before-using-it.patch
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-musl-basic.patch
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-musl-dlopen-configure-ac.patch
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0003-musl-network-support.patch
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0004-musl-process-util.patch
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0005-musl-avoid-further-conflicts-by-including-net-ethern.patch
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0006-Add-a-strndupa-replacement-for-musl.patch

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-adjust-net-headers-for-musl-compatibility.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-adjust-net-headers-for-musl-compatibility.patch
deleted file mode 100644
index 194e03722..000000000
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-adjust-net-headers-for-musl-compatibility.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From f81abf62c0ae93628df36c27357358523be25fb8 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 31 Mar 2017 15:57:05 -0700
-Subject: [PATCH 1/7] adjust net/ headers for musl compatibility
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libnm-core/nm-utils.c          | 13 ++++++++-----
- libnm-core/nm-utils.h          |  5 ++---
- src/platform/wifi/wifi-utils.h |  2 +-
- 3 files changed, 11 insertions(+), 9 deletions(-)
-
-diff --git a/libnm-core/nm-utils.c b/libnm-core/nm-utils.c
-index ebbbfd3..77273df 100644
---- a/libnm-core/nm-utils.c
-+++ b/libnm-core/nm-utils.c
-@@ -19,14 +19,9 @@
-  * Copyright 2005 - 2017 Red Hat, Inc.
-  */
- 
--#include "nm-default.h"
--
--#include "nm-utils.h"
--
- #include <string.h>
- #include <errno.h>
- #include <stdlib.h>
--#include <netinet/ether.h>
- #include <arpa/inet.h>
- #include <uuid/uuid.h>
- #include <libintl.h>
-@@ -34,12 +29,20 @@
- #include <sys/stat.h>
- #include <net/if.h>
- #include <linux/pkt_sched.h>
-+//#include <net/if_arp.h>
-+//#include <net/ethernet.h>
-+#include <netinet/ether.h>
-+
-+#include "nm-default.h"
-+
-+#include "nm-utils.h"
- 
- #if WITH_JANSSON
- #include "nm-json.h"
- #include <jansson.h>
- #endif
- 
-+
- #include "nm-utils/nm-enum-utils.h"
- #include "nm-utils/nm-hash-utils.h"
- #include "nm-common-macros.h"
-diff --git a/libnm-core/nm-utils.h b/libnm-core/nm-utils.h
-index df9284b..02e24ea 100644
---- a/libnm-core/nm-utils.h
-+++ b/libnm-core/nm-utils.h
-@@ -27,11 +27,10 @@
- 
- #include <glib.h>
- 
--#include <netinet/in.h>
--
- /* For ETH_ALEN and INFINIBAND_ALEN */
--#include <linux/if_ether.h>
-+//#include <linux/if_ether.h>
- #include <linux/if_infiniband.h>
-+#include <netinet/in.h>
- 
- #include "nm-core-enum-types.h"
- #include "nm-setting-wireless-security.h"
-diff --git a/src/platform/wifi/wifi-utils.h b/src/platform/wifi/wifi-utils.h
-index 705717b..939080f 100644
---- a/src/platform/wifi/wifi-utils.h
-+++ b/src/platform/wifi/wifi-utils.h
-@@ -22,7 +22,7 @@
- #ifndef __WIFI_UTILS_H__
- #define __WIFI_UTILS_H__
- 
--#include <net/ethernet.h>
-+//#include <net/ethernet.h>
- 
- #include "nm-dbus-interface.h"
- 
--- 
-2.14.1
-
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0005-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager/0005-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0007-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager/0007-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-socket-util.h-Include-linux-sockios.h-on-musl.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-socket-util.h-Include-linux-sockios.h-on-musl.patch
deleted file mode 100644
index cdcd397d7..000000000
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-socket-util.h-Include-linux-sockios.h-on-musl.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 7f0e0613abe8aa1861946e2cc25397690da7128b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 31 Mar 2017 16:05:05 -0700
-Subject: [PATCH 2/7] socket-util.h: Include linux/sockios.h on musl
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/systemd/src/basic/socket-util.h | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/src/systemd/src/basic/socket-util.h b/src/systemd/src/basic/socket-util.h
-index d7e2d85..2e7f7b6 100644
---- a/src/systemd/src/basic/socket-util.h
-+++ b/src/systemd/src/basic/socket-util.h
-@@ -30,6 +30,12 @@
- #include <linux/if_infiniband.h>
- #include <linux/if_packet.h>
- 
-+#if !defined(__GLIBC__)
-+/* SIOCGSTAMPNS from linux/asm-generic.h
-+ * for src/systemd/src/libsystemd-network/sd-lldp.c */
-+#include <linux/sockios.h>
-+#endif
-+
- #include "macro.h"
- #include "missing.h"
- #include "util.h"
--- 
-2.14.1
-
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-Define-ETH_ALEN.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-Define-ETH_ALEN.patch
deleted file mode 100644
index 549e46e0e..000000000
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-Define-ETH_ALEN.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From d0951fe7da63d8296a305781d7322ce4d3249415 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 31 Mar 2017 16:08:45 -0700
-Subject: [PATCH 3/7] Define ETH_ALEN
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libnm-core/nm-utils.h          | 1 +
- src/platform/wifi/wifi-utils.h | 2 ++
- 2 files changed, 3 insertions(+)
-
-diff --git a/libnm-core/nm-utils.h b/libnm-core/nm-utils.h
-index 02e24ea..5ff279c 100644
---- a/libnm-core/nm-utils.h
-+++ b/libnm-core/nm-utils.h
-@@ -29,6 +29,7 @@
- 
- /* For ETH_ALEN and INFINIBAND_ALEN */
- //#include <linux/if_ether.h>
-+#define ETH_ALEN	6		/* Octets in one ethernet addr	 */
- #include <linux/if_infiniband.h>
- #include <netinet/in.h>
- 
-diff --git a/src/platform/wifi/wifi-utils.h b/src/platform/wifi/wifi-utils.h
-index 939080f..2274408 100644
---- a/src/platform/wifi/wifi-utils.h
-+++ b/src/platform/wifi/wifi-utils.h
-@@ -24,6 +24,8 @@
- 
- //#include <net/ethernet.h>
- 
-+#define ETH_ALEN	6		/* Octets in one ethernet addr	 */
-+
- #include "nm-dbus-interface.h"
- 
- typedef struct WifiData WifiData;
--- 
-2.14.1
-
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-Do-not-create-settings-settings-property-documentati.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-Do-not-create-settings-settings-property-documentati.patch
new file mode 100644
index 000000000..92485f044
--- /dev/null
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-Do-not-create-settings-settings-property-documentati.patch
@@ -0,0 +1,77 @@
+From 4f000a4a19975d6aba71427e693cd1ed080abda9 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Thu, 22 Mar 2018 11:08:30 +0100
+Subject: [PATCH] Do not create settings settings/property documentation
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+It was tried to get this work but gi / GirRepository could not be found by
+python. Anyway it is not necessary for us to have the settings/property docs.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ Makefile.am  | 18 ++----------------
+ configure.ac |  4 ----
+ 2 files changed, 2 insertions(+), 20 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 639921d..314a61d 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -961,9 +961,7 @@ endif
+ if HAVE_INTROSPECTION
+ 
+ libnm_noinst_data = \
+-	libnm/nm-property-docs.xml \
+ 	libnm/nm-settings-docs-overrides.xml \
+-	libnm/nm-settings-docs.xml \
+ 	libnm/nm-settings-keyfile-docs.xml \
+ 	libnm/nm-settings-ifcfg-rh-docs.xml
+ 
+@@ -3317,23 +3315,11 @@ $(clients_common_libnmc_base_la_OBJECTS): $(libnm_core_lib_h_pub_mkenums)
+ $(clients_common_libnmc_base_la_OBJECTS): clients/common/.dirstamp
+ 
+ clients_common_settings_doc_c = clients/common/settings-docs.c
+-if HAVE_INTROSPECTION
+-$(clients_common_settings_doc_c): clients/common/settings-docs.xsl libnm/nm-property-docs.xml clients/common/.dirstamp
+-	$(AM_V_GEN) $(XSLTPROC) --output $@ $< $(word 2,$^)
+-DISTCLEANFILES += $(clients_common_settings_doc_c)
+-check-local-settings-docs: $(clients_common_settings_doc_c)
+-	@if test -z "$$NMTST_NO_CHECK_SETTINGS_DOCS" ; then  \
+-		if ! cmp -s "$(srcdir)/$(clients_common_settings_doc_c).in" "$(builddir)/$(clients_common_settings_doc_c)" ; then \
+-			echo "The generated file \"$(builddir)/$(clients_common_settings_doc_c)\" differs from the source file \"$(srcdir)/$(clients_common_settings_doc_c).in\". You probably should copy the generated file over to the source file. You can skip this test by setting \$$NMTST_NO_CHECK_SETTINGS_DOCS=yes"; \
+-			false; \
+-		fi;\
+-	fi
+-check_local += check-local-settings-docs
+-else
++
+ $(clients_common_settings_doc_c): $(clients_common_settings_doc_c).in clients/common/.dirstamp
+ 	$(AM_V_GEN) cp "$(srcdir)/$(clients_common_settings_doc_c).in" "$(builddir)/$(clients_common_settings_doc_c)"
+ check-local-settings-docs:
+-endif
++
+ EXTRA_DIST += \
+ 	$(clients_common_settings_doc_c) \
+ 	$(clients_common_settings_doc_c).in
+diff --git a/configure.ac b/configure.ac
+index c9d3e56..407222e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1286,10 +1286,6 @@ GTK_DOC_CHECK(1.0)
+ # check if we can build setting property documentation
+ build_docs=no
+ if test -n "$INTROSPECTION_MAKEFILE"; then
+-	# If g-i is installed we know we have python, but we might not have pygobject
+-	if ! "$PYTHON" -c 'from gi.repository import GObject' >& /dev/null; then
+-		AC_MSG_ERROR(["--enable-introspection aims to build the settings documentation. This requires GObject introspection for python (pygobject)])
+-	fi
+ 
+ 	AC_PATH_PROG(PERL, perl)
+ 	if test -z "$PERL"; then
+-- 
+2.14.3
+
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0004-Define-missing-features-to-cater-for-musl.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0004-Define-missing-features-to-cater-for-musl.patch
deleted file mode 100644
index b56f6a37d..000000000
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0004-Define-missing-features-to-cater-for-musl.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From c9e0f112a90b6b1ade87a698608dca8d6fbe89cc Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 31 Mar 2017 16:09:41 -0700
-Subject: [PATCH 4/7] Define missing features to cater for musl
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/systemd/sd-adapt/nm-sd-adapt.h | 2 +-
- src/systemd/src/basic/parse-util.c | 4 ++++
- src/systemd/src/basic/stdio-util.h | 2 ++
- src/systemd/src/basic/util.h       | 5 +++++
- src/systemd/src/systemd/sd-event.h | 4 ----
- 5 files changed, 12 insertions(+), 5 deletions(-)
-
-diff --git a/src/systemd/sd-adapt/nm-sd-adapt.h b/src/systemd/sd-adapt/nm-sd-adapt.h
-index 0d291e2..d88dd9b 100644
---- a/src/systemd/sd-adapt/nm-sd-adapt.h
-+++ b/src/systemd/sd-adapt/nm-sd-adapt.h
-@@ -134,7 +134,7 @@ G_STMT_START { \
- #  ifdef HAVE___SECURE_GETENV
- #    define secure_getenv __secure_getenv
- #  else
--#    error neither secure_getenv nor __secure_getenv is available
-+#    define secure_getenv getenv
- #  endif
- #endif
- 
-diff --git a/src/systemd/src/basic/parse-util.c b/src/systemd/src/basic/parse-util.c
-index 6d978e9..e74e84b 100644
---- a/src/systemd/src/basic/parse-util.c
-+++ b/src/systemd/src/basic/parse-util.c
-@@ -21,7 +21,11 @@
- 
- #include <errno.h>
- #include <inttypes.h>
-+#ifdef __GLIBC__
-+#include <xlocale.h>
-+#else
- #include <locale.h>
-+#endif
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
-diff --git a/src/systemd/src/basic/stdio-util.h b/src/systemd/src/basic/stdio-util.h
-index bd1144b..c92e935 100644
---- a/src/systemd/src/basic/stdio-util.h
-+++ b/src/systemd/src/basic/stdio-util.h
-@@ -19,7 +19,9 @@
-   along with systemd; If not, see <http://www.gnu.org/licenses/>.
- ***/
- 
-+#ifdef __GLIBC__
- #include <printf.h>
-+#endif
- #include <stdarg.h>
- #include <stdio.h>
- #include <sys/types.h>
-diff --git a/src/systemd/src/basic/util.h b/src/systemd/src/basic/util.h
-index b31dfd1..9b7032c 100644
---- a/src/systemd/src/basic/util.h
-+++ b/src/systemd/src/basic/util.h
-@@ -46,6 +46,11 @@
- #include "missing.h"
- #include "time-util.h"
- 
-+#if !defined(__GLIBC__)
-+typedef int (*__compar_fn_t) (const void*, const void*);
-+typedef __compar_fn_t comparison_fn_t;
-+#endif
-+
- size_t page_size(void) _pure_;
- #define PAGE_ALIGN(l) ALIGN_TO((l), page_size())
- 
-diff --git a/src/systemd/src/systemd/sd-event.h b/src/systemd/src/systemd/sd-event.h
-index f8cb895..c7e0004 100644
---- a/src/systemd/src/systemd/sd-event.h
-+++ b/src/systemd/src/systemd/sd-event.h
-@@ -69,11 +69,7 @@ typedef int (*sd_event_handler_t)(sd_event_source *s, void *userdata);
- typedef int (*sd_event_io_handler_t)(sd_event_source *s, int fd, uint32_t revents, void *userdata);
- typedef int (*sd_event_time_handler_t)(sd_event_source *s, uint64_t usec, void *userdata);
- typedef int (*sd_event_signal_handler_t)(sd_event_source *s, const struct signalfd_siginfo *si, void *userdata);
--#if defined _GNU_SOURCE || _POSIX_C_SOURCE >= 199309L
- typedef int (*sd_event_child_handler_t)(sd_event_source *s, const siginfo_t *si, void *userdata);
--#else
--typedef void* sd_event_child_handler_t;
--#endif
- 
- int sd_event_default(sd_event **e);
- 
--- 
-2.14.1
-
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0006-check-for-strndupa-before-using-it.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0006-check-for-strndupa-before-using-it.patch
deleted file mode 100644
index 6adb84baa..000000000
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0006-check-for-strndupa-before-using-it.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From f24d958fc85f9a43ac13abc85f74c4ae233dc8a4 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 31 Mar 2017 18:37:19 -0700
-Subject: [PATCH 6/7] check for strndupa before using it
-
-musl does not have strndupa
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- config.h.in                        |  4 ++++
- configure.ac                       |  1 +
- src/systemd/src/basic/alloc-util.h | 12 ++++++++++++
- 3 files changed, 17 insertions(+)
-
-diff --git a/config.h.in b/config.h.in
-index edec211..0799030 100644
---- a/config.h.in
-+++ b/config.h.in
-@@ -34,6 +34,10 @@
-    */
- #undef HAVE_DCGETTEXT
- 
-+/* Define to 1 if you have the declaration of `strndupa', and to 0 if you
-+   don't. */
-+#undef HAVE_DECL_STRNDUPA
-+
- /* Define to 1 if you have the declaration of `explicit_bzero', and to 0 if
-    you don't. */
- #undef HAVE_DECL_EXPLICIT_BZERO
-diff --git a/configure.ac b/configure.ac
-index 8a066ad..51e5eb6 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -56,6 +56,7 @@ AC_SUBST(NM_VERSION)
- 
- GIT_SHA_RECORD(NM_GIT_SHA)
- 
-+AC_CHECK_DECLS([strndupa], [], [], [[#include <string.h>]])
- dnl
- dnl Checks for typedefs, structures, and compiler characteristics.
- dnl
-diff --git a/src/systemd/src/basic/alloc-util.h b/src/systemd/src/basic/alloc-util.h
-index 0a89691..1e95260 100644
---- a/src/systemd/src/basic/alloc-util.h
-+++ b/src/systemd/src/basic/alloc-util.h
-@@ -25,6 +25,18 @@
- #include <string.h>
- 
- #include "macro.h"
-+#include "config.h"
-+
-+#if !HAVE_DECL_STRNDUPA
-+#define strndupa(s, n) \
-+  ({ \
-+    const char *__old = (s); \
-+    size_t __len = strnlen(__old, (n)); \
-+    char *__new = (char *)alloca(__len + 1); \
-+    __new[__len] = '\0'; \
-+    (char *)memcpy(__new, __old, __len); \
-+  })
-+#endif
- 
- #define new(t, n) ((t*) malloc_multiply(sizeof(t), (n)))
- 
--- 
-2.14.1
-
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-musl-basic.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-musl-basic.patch
new file mode 100644
index 000000000..9d208e1fd
--- /dev/null
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-musl-basic.patch
@@ -0,0 +1,53 @@
+From e92de7409a3e107f90d108a9c5d49bd0418296dd Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Thu, 22 Mar 2018 17:54:10 +0100
+Subject: [PATCH 1/4] Usual fix for musl libc
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Pending
+
+Stolen from [1] and prettyfied slightly
+
+[1] https://github.com/voidlinux/void-packages/tree/master/srcpkgs/NetworkManager/patches
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ src/systemd/src/basic/stdio-util.h | 2 ++
+ src/systemd/src/basic/util.h       | 5 +++++
+ 2 files changed, 7 insertions(+)
+
+diff --git a/src/systemd/src/basic/stdio-util.h b/src/systemd/src/basic/stdio-util.h
+index bd1144b..9eafacb 100644
+--- a/src/systemd/src/basic/stdio-util.h
++++ b/src/systemd/src/basic/stdio-util.h
+@@ -19,7 +19,9 @@
+   along with systemd; If not, see <http://www.gnu.org/licenses/>.
+ ***/
+ 
++#if defined(__GLIBC__)
+ #include <printf.h>
++#endif
+ #include <stdarg.h>
+ #include <stdio.h>
+ #include <sys/types.h>
+diff --git a/src/systemd/src/basic/util.h b/src/systemd/src/basic/util.h
+index b31dfd1..9b7032c 100644
+--- a/src/systemd/src/basic/util.h
++++ b/src/systemd/src/basic/util.h
+@@ -46,6 +46,11 @@
+ #include "missing.h"
+ #include "time-util.h"
+ 
++#if !defined(__GLIBC__)
++typedef int (*__compar_fn_t) (const void*, const void*);
++typedef __compar_fn_t comparison_fn_t;
++#endif
++
+ size_t page_size(void) _pure_;
+ #define PAGE_ALIGN(l) ALIGN_TO((l), page_size())
+ 
+-- 
+2.14.3
+
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-musl-dlopen-configure-ac.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-musl-dlopen-configure-ac.patch
new file mode 100644
index 000000000..548cccb32
--- /dev/null
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-musl-dlopen-configure-ac.patch
@@ -0,0 +1,35 @@
+From 57239fda56b68a8f3e413f7b6af5290ba0d86636 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Thu, 22 Mar 2018 18:18:06 +0100
+Subject: [PATCH 2/4] musl: dlopen is included so LD_LIBS="" instead of
+ LD_LIBS="none required"
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Pending
+
+Stolen from [1] and prettyfied slightly
+
+[1] https://github.com/voidlinux/void-packages/tree/master/srcpkgs/NetworkManager/patches
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ configure.ac | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configure.ac b/configure.ac
+index 487a266..96ae4f7 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -305,6 +305,7 @@ dnl
+ dnl Checks for libdl - on certain platforms its part of libc
+ dnl
+ AC_SEARCH_LIBS([dlopen], [dl dld], [], [ac_cv_search_dlopen=])
++AS_IF([test "$ac_cv_search_dlopen" = "none required"],[ac_cv_search_dlopen=""])
+ AC_SUBST([DL_LIBS], "$ac_cv_search_dlopen")
+ 
+ PKG_CHECK_MODULES(GLIB, [gio-unix-2.0 >= 2.37.6 gmodule-2.0],
+-- 
+2.14.3
+
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0003-musl-network-support.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0003-musl-network-support.patch
new file mode 100644
index 000000000..5dd17b63b
--- /dev/null
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0003-musl-network-support.patch
@@ -0,0 +1,72 @@
+From 714b4731a238653e9c7d885c0dee10677b0a4df3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Thu, 22 Mar 2018 18:24:07 +0100
+Subject: [PATCH 3/4] musl: network support
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Pending
+
+Stolen from [1] and prettyfied slightly
+
+[1] https://github.com/voidlinux/void-packages/tree/master/srcpkgs/NetworkManager/patches
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ libnm-core/nm-utils.h               | 4 ++++
+ src/platform/wifi/wifi-utils.h      | 4 ++++
+ src/systemd/src/basic/socket-util.h | 5 +++++
+ 3 files changed, 13 insertions(+)
+
+diff --git a/libnm-core/nm-utils.h b/libnm-core/nm-utils.h
+index df9284b..2bcf4b8 100644
+--- a/libnm-core/nm-utils.h
++++ b/libnm-core/nm-utils.h
+@@ -30,7 +30,11 @@
+ #include <netinet/in.h>
+ 
+ /* For ETH_ALEN and INFINIBAND_ALEN */
++#if defined(__GLIBC__)
+ #include <linux/if_ether.h>
++#else
++#define ETH_ALEN	6		/* Octets in one ethernet addr	 */
++#endif
+ #include <linux/if_infiniband.h>
+ 
+ #include "nm-core-enum-types.h"
+diff --git a/src/platform/wifi/wifi-utils.h b/src/platform/wifi/wifi-utils.h
+index 705717b..da3edc4 100644
+--- a/src/platform/wifi/wifi-utils.h
++++ b/src/platform/wifi/wifi-utils.h
+@@ -22,7 +22,11 @@
+ #ifndef __WIFI_UTILS_H__
+ #define __WIFI_UTILS_H__
+ 
++#if defined(__GLIBC__)
+ #include <net/ethernet.h>
++#else /* musl libc */
++#define ETH_ALEN	6		/* Octets in one ethernet addr	 */
++#endif
+ 
+ #include "nm-dbus-interface.h"
+ 
+diff --git a/src/systemd/src/basic/socket-util.h b/src/systemd/src/basic/socket-util.h
+index d7e2d85..d109c84 100644
+--- a/src/systemd/src/basic/socket-util.h
++++ b/src/systemd/src/basic/socket-util.h
+@@ -29,6 +29,11 @@
+ #include <linux/netlink.h>
+ #include <linux/if_infiniband.h>
+ #include <linux/if_packet.h>
++#if !defined(__GLIBC__)
++/* SIOCGSTAMPNS from linux/asm-generic.h
++ * for src/systemd/src/libsystemd-network/sd-lldp.c */
++#include <linux/sockios.h>
++#endif
+ 
+ #include "macro.h"
+ #include "missing.h"
+-- 
+2.14.3
+
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0004-musl-process-util.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0004-musl-process-util.patch
new file mode 100644
index 000000000..fc55ce85f
--- /dev/null
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0004-musl-process-util.patch
@@ -0,0 +1,62 @@
+From d513c8bfc982dbd976617178b040c512c95710b6 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Thu, 22 Mar 2018 18:29:00 +0100
+Subject: [PATCH 4/4] musl: process-util
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Pending
+
+Stolen from [1] and prettyfied slightly
+
+[1] https://github.com/voidlinux/void-packages/tree/master/srcpkgs/NetworkManager/patches
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ src/systemd/src/basic/process-util.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/src/systemd/src/basic/process-util.c b/src/systemd/src/basic/process-util.c
+index 272030d..485f1db 100644
+--- a/src/systemd/src/basic/process-util.c
++++ b/src/systemd/src/basic/process-util.c
+@@ -36,6 +36,9 @@
+ #include <sys/wait.h>
+ #include <syslog.h>
+ #include <unistd.h>
++#ifndef __GLIBC__
++#include <pthread.h>
++#endif
+ #if 0 /* NM_IGNORED */
+ #if HAVE_VALGRIND_VALGRIND_H
+ #include <valgrind/valgrind.h>
+@@ -1015,11 +1018,13 @@ static void reset_cached_pid(void) {
+         cached_pid = CACHED_PID_UNSET;
+ }
+ 
++#ifdef __GLIBC__
+ /* We use glibc __register_atfork() + __dso_handle directly here, as they are not included in the glibc
+  * headers. __register_atfork() is mostly equivalent to pthread_atfork(), but doesn't require us to link against
+  * libpthread, as it is part of glibc anyway. */
+ extern int __register_atfork(void (*prepare) (void), void (*parent) (void), void (*child) (void), void * __dso_handle);
+ extern void* __dso_handle __attribute__ ((__weak__));
++#endif
+ 
+ pid_t getpid_cached(void) {
+         pid_t current_value;
+@@ -1042,7 +1047,11 @@ pid_t getpid_cached(void) {
+ 
+                 new_pid = getpid();
+ 
++#ifdef __GLIBC__
+                 if (__register_atfork(NULL, NULL, reset_cached_pid, __dso_handle) != 0) {
++#else
++                if (pthread_atfork(NULL, NULL, reset_cached_pid) != 0) {
++#endif
+                         /* OOM? Let's try again later */
+                         cached_pid = CACHED_PID_UNSET;
+                         return new_pid;
+-- 
+2.14.3
+
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0005-musl-avoid-further-conflicts-by-including-net-ethern.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0005-musl-avoid-further-conflicts-by-including-net-ethern.patch
new file mode 100644
index 000000000..752fe4f58
--- /dev/null
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0005-musl-avoid-further-conflicts-by-including-net-ethern.patch
@@ -0,0 +1,77 @@
+From b3b4fe35018c98ad176719b2d9ffb867974fc7c3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Mon, 16 Apr 2018 14:45:44 +0200
+Subject: [PATCH] musl: avoid further conflicts by including net/ethernet.h
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ src/systemd/src/systemd/sd-dhcp-client.h  | 2 ++
+ src/systemd/src/systemd/sd-dhcp-lease.h   | 2 ++
+ src/systemd/src/systemd/sd-dhcp6-client.h | 2 ++
+ src/systemd/src/systemd/sd-ipv4ll.h       | 2 ++
+ 4 files changed, 8 insertions(+)
+
+diff --git a/src/systemd/src/systemd/sd-dhcp-client.h b/src/systemd/src/systemd/sd-dhcp-client.h
+index 5e46d8d..18a613f 100644
+--- a/src/systemd/src/systemd/sd-dhcp-client.h
++++ b/src/systemd/src/systemd/sd-dhcp-client.h
+@@ -21,7 +21,9 @@
+ ***/
+ 
+ #include <inttypes.h>
++#if defined(__GLIBC__)
+ #include <net/ethernet.h>
++#endif
+ #include <netinet/in.h>
+ #include <sys/types.h>
+ 
+diff --git a/src/systemd/src/systemd/sd-dhcp-lease.h b/src/systemd/src/systemd/sd-dhcp-lease.h
+index 7ab99cc..85acdf2 100644
+--- a/src/systemd/src/systemd/sd-dhcp-lease.h
++++ b/src/systemd/src/systemd/sd-dhcp-lease.h
+@@ -22,7 +22,9 @@
+ ***/
+ 
+ #include <inttypes.h>
++#if defined(__GLIBC__)
+ #include <net/ethernet.h>
++#endif
+ #include <netinet/in.h>
+ #include <sys/types.h>
+ 
+diff --git a/src/systemd/src/systemd/sd-dhcp6-client.h b/src/systemd/src/systemd/sd-dhcp6-client.h
+index 7819f0d..35f30ee 100644
+--- a/src/systemd/src/systemd/sd-dhcp6-client.h
++++ b/src/systemd/src/systemd/sd-dhcp6-client.h
+@@ -21,7 +21,9 @@
+ ***/
+ 
+ #include <inttypes.h>
++#if defined(__GLIBC__)
+ #include <net/ethernet.h>
++#endif
+ #include <sys/types.h>
+ 
+ #include "sd-dhcp6-lease.h"
+diff --git a/src/systemd/src/systemd/sd-ipv4ll.h b/src/systemd/src/systemd/sd-ipv4ll.h
+index 5ba9208..c90eca6 100644
+--- a/src/systemd/src/systemd/sd-ipv4ll.h
++++ b/src/systemd/src/systemd/sd-ipv4ll.h
+@@ -20,7 +20,9 @@
+   along with systemd; If not, see <http://www.gnu.org/licenses/>.
+ ***/
+ 
++#if defined(__GLIBC__)
+ #include <net/ethernet.h>
++#endif
+ #include <netinet/in.h>
+ 
+ #include "sd-event.h"
+-- 
+2.14.3
+
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0006-Add-a-strndupa-replacement-for-musl.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0006-Add-a-strndupa-replacement-for-musl.patch
new file mode 100644
index 000000000..8ed7ee64f
--- /dev/null
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0006-Add-a-strndupa-replacement-for-musl.patch
@@ -0,0 +1,47 @@
+From 6db6596e450062601d18b2ae812a4a58d2e03a53 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Mon, 16 Apr 2018 15:07:20 +0200
+Subject: [PATCH] Add a strndupa replacement for musl
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ src/systemd/src/basic/in-addr-util.c | 1 +
+ src/systemd/src/basic/string-util.h  | 5 +++++
+ 2 files changed, 6 insertions(+)
+
+diff --git a/src/systemd/src/basic/in-addr-util.c b/src/systemd/src/basic/in-addr-util.c
+index 2a02d90..a57c360 100644
+--- a/src/systemd/src/basic/in-addr-util.c
++++ b/src/systemd/src/basic/in-addr-util.c
+@@ -30,6 +30,7 @@
+ #include "in-addr-util.h"
+ #include "macro.h"
+ #include "parse-util.h"
++#include "string-util.h"
+ #include "util.h"
+ 
+ bool in4_addr_is_null(const struct in_addr *a) {
+diff --git a/src/systemd/src/basic/string-util.h b/src/systemd/src/basic/string-util.h
+index 4c94b18..a6dc446 100644
+--- a/src/systemd/src/basic/string-util.h
++++ b/src/systemd/src/basic/string-util.h
+@@ -44,6 +44,11 @@
+ #define strcaseeq(a,b) (strcasecmp((a),(b)) == 0)
+ #define strncaseeq(a, b, n) (strncasecmp((a), (b), (n)) == 0)
+ 
++/* musl does not know strndupa */
++#if !defined(__GLIBC__)
++#define strndupa(x,s) strncpy(alloca(strlen(x)+1),x,s)
++#endif
++
+ int strcmp_ptr(const char *a, const char *b) _pure_;
+ 
+ static inline bool streq_ptr(const char *a, const char *b) {
+-- 
+2.14.3
+
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb
index 6538e7b82..ccbd8e28c 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b \
 
 DEPENDS = " \
     intltool-native \
+    libxslt-native \
     libnl \
     dbus \
     dbus-glib \
@@ -23,18 +24,20 @@ DEPENDS = " \
     curl \
 "
 
-inherit gnomebase gettext systemd bluetooth bash-completion vala gobject-introspection
-
-GI_DATA_ENABLED_libc-musl = "False"
-
-SRC_URI = "${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.xz \
-           file://0001-adjust-net-headers-for-musl-compatibility.patch \
-           file://0002-socket-util.h-Include-linux-sockios.h-on-musl.patch \
-           file://0003-Define-ETH_ALEN.patch \
-           file://0005-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch \
-           file://0006-check-for-strndupa-before-using-it.patch \
-           file://0007-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch \
-           "
+inherit gnomebase gettext systemd bluetooth bash-completion vala gobject-introspection gtk-doc
+
+SRC_URI = " \
+    ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.xz \
+    file://0001-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch \
+    file://0002-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch \
+    file://0003-Do-not-create-settings-settings-property-documentati.patch \
+    file://musl/0001-musl-basic.patch \
+    file://musl/0002-musl-dlopen-configure-ac.patch \
+    file://musl/0003-musl-network-support.patch \
+    file://musl/0004-musl-process-util.patch \
+    file://musl/0005-musl-avoid-further-conflicts-by-including-net-ethern.patch \
+    file://musl/0006-Add-a-strndupa-replacement-for-musl.patch \
+"
 SRC_URI[md5sum] = "de3c7147a693da6f80eb22f126086a14"
 SRC_URI[sha256sum] = "6af0b1e856a3725f88791f55c4fbb04105dc0b20dbf182aaec8aad16481fac76"
 
@@ -44,15 +47,23 @@ EXTRA_OECONF = " \
     --disable-ifcfg-rh \
     --disable-ifnet \
     --disable-ifcfg-suse \
-    --disable-introspection \
     --disable-more-warnings \
     --with-iptables=${sbindir}/iptables \
     --with-tests \
     --with-nmtui=yes \
 "
 
+# gobject-introspection related
+GI_DATA_ENABLED_libc-musl = "False"
+
+# stolen from https://github.com/voidlinux/void-packages/blob/master/srcpkgs/NetworkManager/template
+CFLAGS_libc-musl_append = " \
+    -DHAVE_SECURE_GETENV -Dsecure_getenv=getenv \
+    -D__USE_POSIX199309 -DRTLD_DEEPBIND=0 \
+"
+
 do_compile_prepend() {
-        export GIR_EXTRA_LIBS_PATH="${B}/libnm-util/.libs"
+    export GIR_EXTRA_LIBS_PATH="${B}/libnm/.libs:${B}/libnm-glib/.libs:${B}/libnm-util/.libs"
 }
 
 PACKAGECONFIG ??= "nss ifupdown netconfig dhclient dnsmasq \
-- 
2.14.3


