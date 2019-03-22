Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id ECA997D011
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2019 10:21:50 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id w10so1724430wrm.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2019 03:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=eJBXW+7wWW7SYO2fcSKCQTGWPCa4n6xbmq0UMobPfdU=;
	b=Lmr1aX0KcKNinxVZU6ccabIet/+MPw+SGQmCdTqafM47uo0wuyVMsD9bXo1yDGFTmb
	SFKhhG6BOYwsfmH5mFHCmT9yv5pYyO8/LL1SMUTZ5USA/R4USyoJ+M7McPmeQ5+L/+vJ
	uiovCuv+opiIkBmtmskXS/m6oXmVaWl5WhIzKZ+FLjYwfO6tm5h64wyhXdTph9GsR8pu
	kNV47Yg26n3rjGf4sc2uI4S6d0Bb+TpSdj27V679+mJOY/+Fn4oVDxlZ2nBZ5UZ3Fv/Q
	sbvchli+VLvDsp7c5hn/6NW1AcwQyWbU2oAYQOPcKqVqGBJAZXvhV95RronqvGNLIlJo
	3cpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=eJBXW+7wWW7SYO2fcSKCQTGWPCa4n6xbmq0UMobPfdU=;
	b=oYtLQIBvJ9wVGUOEo8WP5wIVS4wOH0wgfuPPxgNSs8k6mgZIXLjltDP8FEyD6hUG0V
	wUsbRBZody/dh8L+6qHLRNJXv6nXQbtCMNv3e6slzBR20FkbRjmH3soQZhPXD6xElV/k
	aX3b+m8X3YY28Jst9e/AtG42GATNJqDsY7nLRvuaUUhFwVB889/RhWlM7RcVGZo26cyK
	Gg7DGB5d5trRoXeQC5zweLO6S3A/6LN72A1ojJvWKFxwO3sdl4Ez7MUcQMU4t258kBJE
	wZCaHDMbBGgNV5Lfe6kd9g7QNqJTA8ULfffcv5VH/ysUAzGbA/R0GBalm0PNFzv+U2hp
	soXQ==
X-Gm-Message-State: APjAAAU2XgxS1vNWFDyn7pEotc5VSYZBeoEK/em3uLBzlAzl7ruc5tLE
	OgnZe/+RPRMZChVO8RuRYkB4rwiI
X-Google-Smtp-Source: APXvYqy+tCIqNNEIVLQKQevmymR8+HB/0fF7xGpwG4yCbb/Irx1woBRRGgpWA5Wsi5ZvwQC3Gv+3Kg==
X-Received: by 2002:adf:fe83:: with SMTP id l3mr5579906wrr.229.1553250110885; 
	Fri, 22 Mar 2019 03:21:50 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	t69sm12255677wmt.16.2019.03.22.03.21.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 22 Mar 2019 03:21:50 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Mar 2019 11:21:27 +0100
Message-Id: <20190322102129.5067-9-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190322102129.5067-1-schnitzeltony@gmail.com>
References: <20190322102129.5067-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 09/11] networkmanager: upgrade 1.14.4 -> 1.16.0
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
X-List-Received-Date: Fri, 22 Mar 2019 10:21:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* license.html was checked: it is still GPLv2. Could not find what changed the
  checksum. Maybe it was generated with a different version of gtk-doc.
* Build tested with just gnutls in PACKAGECONFIG to test nss alternative (and
  setting no crypto won't work)
* Build tested with all entries except gnutls/qt4-x11-free (yes they still
  support it!) in PACKAGECONFIG
* By far the most time was spent on musl patch adjustment. They apply cleanly
  but musl build was not tested due to limited resources.
* Fix build for non systemd by making SYSTEMD_SERVICE conditional

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ....ac-Fix-pkgconfig-sysroot-locations.patch} |  9 ++--
 ...tings-settings-property-documentati.patch} | 27 ++++------
 ...-net-ethernet.h-and-linux-if_ether.h.patch | 19 +++----
 ...net-ethernet.h-seems-to-be-over-spe.patch} | 14 +++--
 ...musl-basic.patch => 0003-musl-basic.patch} | 34 +++++++------
 ...ch => 0004-musl-dlopen-configure-ac.patch} | 10 ++--
 ....patch => 0005-musl-network-support.patch} | 51 +++++++++----------
 ...til.patch => 0006-musl-process-util.patch} | 22 ++++----
 ...r-conflicts-by-including-net-ethern.patch} | 16 +++---
 ...Add-a-strndupa-replacement-for-musl.patch} | 28 +++++-----
 ...ger_1.14.4.bb => networkmanager_1.16.0.bb} | 28 +++++-----
 11 files changed, 119 insertions(+), 139 deletions(-)
 rename meta-networking/recipes-connectivity/networkmanager/networkmanager/{0002-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch => 0001-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch} (81%)
 rename meta-networking/recipes-connectivity/networkmanager/networkmanager/{0003-Do-not-create-settings-settings-property-documentati.patch => 0002-Do-not-create-settings-settings-property-documentati.patch} (69%)
 rename meta-networking/recipes-connectivity/networkmanager/networkmanager/{ => musl}/0001-Do-not-include-net-ethernet.h-and-linux-if_ether.h.patch (83%)
 rename meta-networking/recipes-connectivity/networkmanager/networkmanager/{0001-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch => musl/0002-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch} (84%)
 rename meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/{0001-musl-basic.patch => 0003-musl-basic.patch} (55%)
 rename meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/{0002-musl-dlopen-configure-ac.patch => 0004-musl-dlopen-configure-ac.patch} (88%)
 rename meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/{0003-musl-network-support.patch => 0005-musl-network-support.patch} (69%)
 rename meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/{0004-musl-process-util.patch => 0006-musl-process-util.patch} (79%)
 rename meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/{0005-musl-avoid-further-conflicts-by-including-net-ethern.patch => 0007-musl-avoid-further-conflicts-by-including-net-ethern.patch} (91%)
 rename meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/{0006-Add-a-strndupa-replacement-for-musl.patch => 0008-Add-a-strndupa-replacement-for-musl.patch} (60%)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.14.4.bb => networkmanager_1.16.0.bb} (81%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch
similarity index 81%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch
index 351f264cb..302c0292b 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch
@@ -1,4 +1,4 @@
-From 583f0448fb7e9aba2b410c06eec6f420b41a6a0c Mon Sep 17 00:00:00 2001
+From 3dc3d8e73bc430ea4e93e33f7b2a4b3e0ff175af Mon Sep 17 00:00:00 2001
 From: Pablo Saavedra <psaavedra@igalia.com>
 Date: Tue, 13 Mar 2018 17:36:20 +0100
 Subject: [PATCH] Fixed configure.ac: Fix pkgconfig sysroot locations
@@ -8,10 +8,10 @@ Subject: [PATCH] Fixed configure.ac: Fix pkgconfig sysroot locations
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 51e5eb6..c9d3e56 100644
+index 967eac0..b914219 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -572,7 +572,7 @@ if test "$have_jansson" = "yes"; then
+@@ -592,7 +592,7 @@ if test "$have_jansson" = "yes"; then
  	AC_DEFINE(WITH_JANSSON, 1, [Define if JANSSON is enabled])
  
  	AC_CHECK_TOOLS(READELF, [eu-readelf readelf])
@@ -20,6 +20,3 @@ index 51e5eb6..c9d3e56 100644
  	JANSSON_SONAME=`$READELF -d $JANSSON_LIBDIR/libjansson.so |sed -n 's/.*SONAME.*\[[\([^]]*\)]]/\1/p'`
  
  	if test "$JANSSON_SONAME" = ""; then
--- 
-2.14.1
-
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-Do-not-create-settings-settings-property-documentati.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-Do-not-create-settings-settings-property-documentati.patch
similarity index 69%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-Do-not-create-settings-settings-property-documentati.patch
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-Do-not-create-settings-settings-property-documentati.patch
index c50293c09..5581dd3aa 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-Do-not-create-settings-settings-property-documentati.patch
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-Do-not-create-settings-settings-property-documentati.patch
@@ -13,15 +13,15 @@ Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
 ---
- Makefile.am  | 20 --------------------
+ Makefile.am  | 11 -----------
  configure.ac |  5 -----
- 2 files changed, 25 deletions(-)
+ 2 files changed, 16 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 1e100f6..d31e3c1 100644
+index b180466..1ab4658 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -1115,9 +1115,7 @@ EXTRA_DIST += \
+@@ -1298,9 +1298,7 @@ EXTRA_DIST += \
  if HAVE_INTROSPECTION
  
  libnm_noinst_data = \
@@ -31,7 +31,7 @@ index 1e100f6..d31e3c1 100644
  	libnm/nm-settings-keyfile-docs.xml \
  	libnm/nm-settings-ifcfg-rh-docs.xml
  
-@@ -3692,27 +3690,9 @@ $(clients_common_libnmc_base_la_OBJECTS): $(libnm_lib_h_pub_mkenums)
+@@ -3930,18 +3928,9 @@ $(clients_common_libnmc_base_la_OBJECTS): $(libnm_lib_h_pub_mkenums)
  $(clients_common_libnmc_base_la_OBJECTS): clients/common/.dirstamp
  
  clients_common_settings_doc_h = clients/common/settings-docs.h
@@ -40,16 +40,7 @@ index 1e100f6..d31e3c1 100644
 -	$(AM_V_GEN) $(XSLTPROC) --output $@ $< $(word 2,$^)
 -DISTCLEANFILES += $(clients_common_settings_doc_h)
 -check-local-settings-docs: $(clients_common_settings_doc_h)
--	@if test -z "$$NMTST_NO_CHECK_SETTINGS_DOCS" ; then \
--		if ! cmp -s "$(srcdir)/$(clients_common_settings_doc_h).in" "$(builddir)/$(clients_common_settings_doc_h)" ; then \
--			if test "$$NM_TEST_REGENERATE" == 1 ; then \
--				cp -f "$(builddir)/$(clients_common_settings_doc_h)" "$(srcdir)/$(clients_common_settings_doc_h).in"; \
--			else \
--				echo "The generated file \"$(builddir)/$(clients_common_settings_doc_h)\" differs from the source file \"$(srcdir)/$(clients_common_settings_doc_h).in\". You probably should copy the generated file over to the source file. You can skip this test by setting \$$NMTST_NO_CHECK_SETTINGS_DOCS=yes". You can also automatically copy the file by rerunning the test with \$$NM_TEST_REGENERATE=1 ; \
--				false; \
--			fi; \
--		fi;\
--	fi
+-	$(srcdir)/tools/check-settings-docs.sh "$(srcdir)" "$(builddir)" "$(clients_common_settings_doc_h)"
 -check_local += check-local-settings-docs
 -else
  $(clients_common_settings_doc_h): $(clients_common_settings_doc_h).in clients/common/.dirstamp
@@ -60,10 +51,10 @@ index 1e100f6..d31e3c1 100644
  	$(clients_common_settings_doc_h) \
  	$(clients_common_settings_doc_h).in
 diff --git a/configure.ac b/configure.ac
-index 79dc3b9..23d14a6 100644
+index b914219..872c292 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1195,11 +1195,6 @@ GTK_DOC_CHECK(1.0)
+@@ -1215,11 +1215,6 @@ GTK_DOC_CHECK(1.0)
  # check if we can build setting property documentation
  build_docs=no
  if test -n "$INTROSPECTION_MAKEFILE"; then
@@ -76,5 +67,5 @@ index 79dc3b9..23d14a6 100644
  	if test -z "$PERL"; then
  		AC_MSG_ERROR([--enable-introspection requires perl])
 -- 
-2.14.5
+2.20.1
 
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-Do-not-include-net-ethernet.h-and-linux-if_ether.h.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-Do-not-include-net-ethernet.h-and-linux-if_ether.h.patch
similarity index 83%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-Do-not-include-net-ethernet.h-and-linux-if_ether.h.patch
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-Do-not-include-net-ethernet.h-and-linux-if_ether.h.patch
index 0c415bce7..555e5ffcb 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-Do-not-include-net-ethernet.h-and-linux-if_ether.h.patch
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-Do-not-include-net-ethernet.h-and-linux-if_ether.h.patch
@@ -1,4 +1,4 @@
-From 3f4b6319701834182304c4079119780f4ae5b49b Mon Sep 17 00:00:00 2001
+From b2cdab746ef64bc25ba0b9cff596ebdddd6e8dc6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 7 Nov 2018 11:30:44 -0800
 Subject: [PATCH] Do not include net/ethernet.h and linux/if_ether.h
@@ -7,6 +7,7 @@ They conflict when used together especially with musl
 removing them still keeps it working so it seems they are redundant
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  shared/n-acd/src/n-acd.c              | 1 -
  src/platform/wpan/nm-wpan-utils.h     | 2 --
@@ -14,19 +15,19 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  3 files changed, 5 deletions(-)
 
 diff --git a/shared/n-acd/src/n-acd.c b/shared/n-acd/src/n-acd.c
-index 9164f95..9538e50 100644
+index def56a2..dd4eb78 100644
 --- a/shared/n-acd/src/n-acd.c
 +++ b/shared/n-acd/src/n-acd.c
-@@ -23,7 +23,6 @@
- #include <errno.h>
+@@ -11,7 +11,6 @@
+ #include <inttypes.h>
  #include <limits.h>
- #include <linux/filter.h>
--#include <linux/if_ether.h>
  #include <linux/if_packet.h>
- #include <net/ethernet.h>
- #include <netinet/if_ether.h>
+-#include <netinet/if_ether.h>
+ #include <netinet/in.h>
+ #include <stdlib.h>
+ #include <string.h>
 diff --git a/src/platform/wpan/nm-wpan-utils.h b/src/platform/wpan/nm-wpan-utils.h
-index f7d0c03..e1c81f5 100644
+index 1b54ec4..ed39938 100644
 --- a/src/platform/wpan/nm-wpan-utils.h
 +++ b/src/platform/wpan/nm-wpan-utils.h
 @@ -20,8 +20,6 @@
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch
similarity index 84%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch
index 49a07353d..5c59208b4 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch
@@ -1,28 +1,29 @@
-From 18f71c1b48730b8602826517f2b5b088283ae948 Mon Sep 17 00:00:00 2001
+From 32dc6cab58912add5bc6495558538953d9344c36 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 31 Mar 2017 16:48:00 -0700
 Subject: [PATCH] sd-lldp.h: Remove net/ethernet.h seems to be over specified
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  src/systemd/src/libsystemd-network/sd-lldp.c | 1 +
  src/systemd/src/systemd/sd-lldp.h            | 2 +-
  2 files changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/src/systemd/src/libsystemd-network/sd-lldp.c b/src/systemd/src/libsystemd-network/sd-lldp.c
-index 31e2448..7721cc2 100644
+index 741128e..62914ae 100644
 --- a/src/systemd/src/libsystemd-network/sd-lldp.c
 +++ b/src/systemd/src/libsystemd-network/sd-lldp.c
 @@ -3,6 +3,7 @@
- #include "nm-sd-adapt.h"
+ #include "nm-sd-adapt-core.h"
  
  #include <arpa/inet.h>
 +#include <net/ethernet.h>
  #include <linux/sockios.h>
+ #include <sys/ioctl.h>
  
- #include "sd-lldp.h"
 diff --git a/src/systemd/src/systemd/sd-lldp.h b/src/systemd/src/systemd/sd-lldp.h
-index 3f35eeb..61b0e45 100644
+index bf3afad..4cace87 100644
 --- a/src/systemd/src/systemd/sd-lldp.h
 +++ b/src/systemd/src/systemd/sd-lldp.h
 @@ -18,7 +18,7 @@
@@ -34,6 +35,3 @@ index 3f35eeb..61b0e45 100644
  #include <sys/types.h>
  
  #include "sd-event.h"
--- 
-2.14.1
-
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-musl-basic.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0003-musl-basic.patch
similarity index 55%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-musl-basic.patch
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0003-musl-basic.patch
index 00dda5b18..8d905489f 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-musl-basic.patch
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0003-musl-basic.patch
@@ -1,4 +1,4 @@
-From e92de7409a3e107f90d108a9c5d49bd0418296dd Mon Sep 17 00:00:00 2001
+From ff1a5b849755db67b1778940fff92d6eb8b8b050 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
 Date: Thu, 22 Mar 2018 17:54:10 +0100
 Subject: [PATCH] Usual fix for musl libc
@@ -6,6 +6,11 @@ MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
 
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
 Upstream-Status: Pending
 
 Stolen from [1] and prettyfied slightly
@@ -15,14 +20,14 @@ Stolen from [1] and prettyfied slightly
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
 
 ---
- src/systemd/src/basic/stdio-util.h | 2 ++
- src/systemd/src/basic/util.h       | 5 +++++
+ shared/systemd/src/basic/stdio-util.h | 2 ++
+ shared/systemd/src/basic/util.h       | 5 +++++
  2 files changed, 7 insertions(+)
 
-diff --git a/src/systemd/src/basic/stdio-util.h b/src/systemd/src/basic/stdio-util.h
-index 73c0327..e1ce64f 100644
---- a/src/systemd/src/basic/stdio-util.h
-+++ b/src/systemd/src/basic/stdio-util.h
+diff --git a/shared/systemd/src/basic/stdio-util.h b/shared/systemd/src/basic/stdio-util.h
+index dc67b6e..6336243 100644
+--- a/shared/systemd/src/basic/stdio-util.h
++++ b/shared/systemd/src/basic/stdio-util.h
 @@ -1,7 +1,9 @@
  /* SPDX-License-Identifier: LGPL-2.1+ */
  #pragma once
@@ -33,12 +38,12 @@ index 73c0327..e1ce64f 100644
  #include <stdarg.h>
  #include <stdio.h>
  #include <sys/types.h>
-diff --git a/src/systemd/src/basic/util.h b/src/systemd/src/basic/util.h
-index b31dfd1..9b7032c 100644
---- a/src/systemd/src/basic/util.h
-+++ b/src/systemd/src/basic/util.h
-@@ -28,6 +28,11 @@
- #include "missing.h"
+diff --git a/shared/systemd/src/basic/util.h b/shared/systemd/src/basic/util.h
+index dc33d66..8ee2d64 100644
+--- a/shared/systemd/src/basic/util.h
++++ b/shared/systemd/src/basic/util.h
+@@ -27,6 +27,11 @@
+ #include "macro.h"
  #include "time-util.h"
  
 +#if !defined(__GLIBC__)
@@ -49,6 +54,3 @@ index b31dfd1..9b7032c 100644
  size_t page_size(void) _pure_;
  #define PAGE_ALIGN(l) ALIGN_TO((l), page_size())
  
--- 
-2.14.3
-
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-musl-dlopen-configure-ac.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0004-musl-dlopen-configure-ac.patch
similarity index 88%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-musl-dlopen-configure-ac.patch
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0004-musl-dlopen-configure-ac.patch
index c162c1dfb..419e1be24 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-musl-dlopen-configure-ac.patch
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0004-musl-dlopen-configure-ac.patch
@@ -1,4 +1,4 @@
-From 57239fda56b68a8f3e413f7b6af5290ba0d86636 Mon Sep 17 00:00:00 2001
+From 7743ea63fbe572b1f82db7d399fe9c5c99521432 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
 Date: Thu, 22 Mar 2018 18:18:06 +0100
 Subject: [PATCH] musl: dlopen is included so LD_LIBS="" instead of
@@ -14,15 +14,16 @@ Stolen from [1] and prettyfied slightly
 [1] https://github.com/voidlinux/void-packages/tree/master/srcpkgs/NetworkManager/patches
 
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+
 ---
  configure.ac | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/configure.ac b/configure.ac
-index 487a266..96ae4f7 100644
+index b914219..1b2b0ff 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -235,6 +235,7 @@ dnl
+@@ -241,6 +241,7 @@ dnl
  dnl Checks for libdl - on certain platforms its part of libc
  dnl
  AC_SEARCH_LIBS([dlopen], [dl dld], [], [ac_cv_search_dlopen=])
@@ -30,6 +31,3 @@ index 487a266..96ae4f7 100644
  AC_SUBST([DL_LIBS], "$ac_cv_search_dlopen")
  
  PKG_CHECK_MODULES(GLIB, [gio-unix-2.0 >= 2.37.6 gmodule-2.0],
--- 
-2.14.3
-
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0003-musl-network-support.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0005-musl-network-support.patch
similarity index 69%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0003-musl-network-support.patch
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0005-musl-network-support.patch
index 9a58c0e34..45f607f2c 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0003-musl-network-support.patch
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0005-musl-network-support.patch
@@ -1,4 +1,4 @@
-From 714b4731a238653e9c7d885c0dee10677b0a4df3 Mon Sep 17 00:00:00 2001
+From 70ecbc01874bf2f8603ccbdfda634cac0bb83d93 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
 Date: Thu, 22 Mar 2018 18:24:07 +0100
 Subject: [PATCH] musl: network support
@@ -13,14 +13,15 @@ Stolen from [1] and prettyfied slightly
 [1] https://github.com/voidlinux/void-packages/tree/master/srcpkgs/NetworkManager/patches
 
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+
 ---
- libnm-core/nm-utils.h               | 4 ++++
- src/platform/wifi/nm-wifi-utils.h   | 4 ++++
- src/systemd/src/basic/socket-util.h | 5 +++++
- 3 files changed, 13 insertions(+)
+ libnm-core/nm-utils.h                  | 4 ++++
+ shared/systemd/src/basic/socket-util.h | 6 ++++++
+ src/platform/wifi/nm-wifi-utils.h      | 4 ++++
+ 3 files changed, 14 insertions(+)
 
 diff --git a/libnm-core/nm-utils.h b/libnm-core/nm-utils.h
-index df9284b..2bcf4b8 100644
+index 2b5baba..976850c 100644
 --- a/libnm-core/nm-utils.h
 +++ b/libnm-core/nm-utils.h
 @@ -30,7 +30,11 @@
@@ -35,8 +36,25 @@ index df9284b..2bcf4b8 100644
  #include <linux/if_infiniband.h>
  
  #include "nm-core-enum-types.h"
+diff --git a/shared/systemd/src/basic/socket-util.h b/shared/systemd/src/basic/socket-util.h
+index d2246a8..76f257f 100644
+--- a/shared/systemd/src/basic/socket-util.h
++++ b/shared/systemd/src/basic/socket-util.h
+@@ -13,6 +13,12 @@
+ #include <sys/types.h>
+ #include <sys/un.h>
+ 
++#if !defined(__GLIBC__)
++/* SIOCGSTAMPNS from linux/asm-generic.h
++ * for src/systemd/src/libsystemd-network/sd-lldp.c */
++#include <linux/sockios.h>
++#endif
++
+ #include "macro.h"
+ #include "missing_socket.h"
+ #include "sparse-endian.h"
 diff --git a/src/platform/wifi/nm-wifi-utils.h b/src/platform/wifi/nm-wifi-utils.h
-index 705717b..da3edc4 100644
+index 36148b5..d282eb2 100644
 --- a/src/platform/wifi/nm-wifi-utils.h
 +++ b/src/platform/wifi/nm-wifi-utils.h
 @@ -22,7 +22,11 @@
@@ -51,22 +69,3 @@ index 705717b..da3edc4 100644
  
  #include "nm-dbus-interface.h"
  #include "nm-setting-wireless.h"
-diff --git a/src/systemd/src/basic/socket-util.h b/src/systemd/src/basic/socket-util.h
-index d7e2d85..d109c84 100644
---- a/src/systemd/src/basic/socket-util.h
-+++ b/src/systemd/src/basic/socket-util.h
-@@ -11,6 +11,11 @@
- #include <linux/netlink.h>
- #include <linux/if_infiniband.h>
- #include <linux/if_packet.h>
-+#if !defined(__GLIBC__)
-+/* SIOCGSTAMPNS from linux/asm-generic.h
-+ * for src/systemd/src/libsystemd-network/sd-lldp.c */
-+#include <linux/sockios.h>
-+#endif
- 
- #include "macro.h"
- #include "missing.h"
--- 
-2.14.3
-
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0004-musl-process-util.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0006-musl-process-util.patch
similarity index 79%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0004-musl-process-util.patch
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0006-musl-process-util.patch
index 9e5c94336..525e35932 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0004-musl-process-util.patch
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0006-musl-process-util.patch
@@ -1,4 +1,4 @@
-From d513c8bfc982dbd976617178b040c512c95710b6 Mon Sep 17 00:00:00 2001
+From 4f2fb1e1f785bad22df8f3d96cb4792acf21f315 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
 Date: Thu, 25 Oct 2018 09:57:07 +0200
 Subject: [PATCH] musl: process-util
@@ -13,14 +13,15 @@ Stolen from [1] and prettyfied slightly
 [1] https://github.com/voidlinux/void-packages/tree/master/srcpkgs/NetworkManager/patches
 
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+
 ---
- src/systemd/src/basic/process-util.c | 9 +++++++++
+ shared/systemd/src/basic/process-util.c | 9 +++++++++
  1 file changed, 9 insertions(+)
 
-diff --git a/src/systemd/src/basic/process-util.c b/src/systemd/src/basic/process-util.c
-index 1412f03..45f5049 100644
---- a/src/systemd/src/basic/process-util.c
-+++ b/src/systemd/src/basic/process-util.c
+diff --git a/shared/systemd/src/basic/process-util.c b/shared/systemd/src/basic/process-util.c
+index b0afb5c..7adc8bd 100644
+--- a/shared/systemd/src/basic/process-util.c
++++ b/shared/systemd/src/basic/process-util.c
 @@ -21,6 +21,9 @@
  #include <sys/wait.h>
  #include <syslog.h>
@@ -31,7 +32,7 @@ index 1412f03..45f5049 100644
  #if 0 /* NM_IGNORED */
  #if HAVE_VALGRIND_VALGRIND_H
  #include <valgrind/valgrind.h>
-@@ -1153,11 +1156,13 @@ void reset_cached_pid(void) {
+@@ -1168,11 +1171,13 @@ void reset_cached_pid(void) {
          cached_pid = CACHED_PID_UNSET;
  }
  
@@ -40,12 +41,12 @@ index 1412f03..45f5049 100644
   * headers. __register_atfork() is mostly equivalent to pthread_atfork(), but doesn't require us to link against
   * libpthread, as it is part of glibc anyway. */
  extern int __register_atfork(void (*prepare) (void), void (*parent) (void), void (*child) (void), void *dso_handle);
- extern void* __dso_handle __attribute__ ((__weak__));
+ extern void* __dso_handle _weak_;
 +#endif
  
  pid_t getpid_cached(void) {
          static bool installed = false;
-@@ -1186,7 +1191,11 @@ pid_t getpid_cached(void) {
+@@ -1201,7 +1206,11 @@ pid_t getpid_cached(void) {
                           * only half-documented (glibc doesn't document it but LSB does — though only superficially)
                           * we'll check for errors only in the most generic fashion possible. */
  
@@ -57,6 +58,3 @@ index 1412f03..45f5049 100644
                                  /* OOM? Let's try again later */
                                  cached_pid = CACHED_PID_UNSET;
                                  return new_pid;
--- 
-2.14.5
-
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0005-musl-avoid-further-conflicts-by-including-net-ethern.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0007-musl-avoid-further-conflicts-by-including-net-ethern.patch
similarity index 91%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0005-musl-avoid-further-conflicts-by-including-net-ethern.patch
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0007-musl-avoid-further-conflicts-by-including-net-ethern.patch
index 6bca95e18..211a2da94 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0005-musl-avoid-further-conflicts-by-including-net-ethern.patch
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0007-musl-avoid-further-conflicts-by-including-net-ethern.patch
@@ -1,4 +1,4 @@
-From b3b4fe35018c98ad176719b2d9ffb867974fc7c3 Mon Sep 17 00:00:00 2001
+From 4232a34064e33b52f07cca51b902b93699800f72 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
 Date: Mon, 16 Apr 2018 14:45:44 +0200
 Subject: [PATCH] musl: avoid further conflicts by including net/ethernet.h
@@ -9,6 +9,7 @@ Content-Transfer-Encoding: 8bit
 Upstream-Status: Pending
 
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+
 ---
  src/systemd/src/systemd/sd-dhcp-client.h  | 2 ++
  src/systemd/src/systemd/sd-dhcp-lease.h   | 2 ++
@@ -17,7 +18,7 @@ Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
  4 files changed, 8 insertions(+)
 
 diff --git a/src/systemd/src/systemd/sd-dhcp-client.h b/src/systemd/src/systemd/sd-dhcp-client.h
-index e388552..9c4dde8 100644
+index bd0d429..c935fe1 100644
 --- a/src/systemd/src/systemd/sd-dhcp-client.h
 +++ b/src/systemd/src/systemd/sd-dhcp-client.h
 @@ -20,7 +20,9 @@
@@ -29,9 +30,9 @@ index e388552..9c4dde8 100644
 +#endif
  #include <netinet/in.h>
  #include <sys/types.h>
- 
+ #include <stdbool.h>
 diff --git a/src/systemd/src/systemd/sd-dhcp-lease.h b/src/systemd/src/systemd/sd-dhcp-lease.h
-index 2a60145..19d1814 100644
+index d299c79..991e67e 100644
 --- a/src/systemd/src/systemd/sd-dhcp-lease.h
 +++ b/src/systemd/src/systemd/sd-dhcp-lease.h
 @@ -19,7 +19,9 @@
@@ -45,7 +46,7 @@ index 2a60145..19d1814 100644
  #include <sys/types.h>
  
 diff --git a/src/systemd/src/systemd/sd-dhcp6-client.h b/src/systemd/src/systemd/sd-dhcp6-client.h
-index fa36dca..2d25010 100644
+index 43d38f5..57ab487 100644
 --- a/src/systemd/src/systemd/sd-dhcp6-client.h
 +++ b/src/systemd/src/systemd/sd-dhcp6-client.h
 @@ -20,7 +20,9 @@
@@ -55,9 +56,9 @@ index fa36dca..2d25010 100644
 +#if defined(__GLIBC__)
  #include <net/ethernet.h>
 +#endif
- #include <stdbool.h>
  #include <sys/types.h>
  
+ #include "sd-dhcp6-lease.h"
 diff --git a/src/systemd/src/systemd/sd-ipv4ll.h b/src/systemd/src/systemd/sd-ipv4ll.h
 index 71bd4cf..1c667ba 100644
 --- a/src/systemd/src/systemd/sd-ipv4ll.h
@@ -72,6 +73,3 @@ index 71bd4cf..1c667ba 100644
  #include <netinet/in.h>
  
  #include "sd-event.h"
--- 
-2.14.5
-
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0006-Add-a-strndupa-replacement-for-musl.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0008-Add-a-strndupa-replacement-for-musl.patch
similarity index 60%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0006-Add-a-strndupa-replacement-for-musl.patch
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0008-Add-a-strndupa-replacement-for-musl.patch
index 023a4d9ad..885810185 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0006-Add-a-strndupa-replacement-for-musl.patch
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0008-Add-a-strndupa-replacement-for-musl.patch
@@ -1,4 +1,4 @@
-From 6db6596e450062601d18b2ae812a4a58d2e03a53 Mon Sep 17 00:00:00 2001
+From cdd69321ec97ed19e66a747a968a1637a251b9e6 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
 Date: Mon, 16 Apr 2018 15:07:20 +0200
 Subject: [PATCH] Add a strndupa replacement for musl
@@ -9,15 +9,16 @@ Content-Transfer-Encoding: 8bit
 Upstream-Status: Pending
 
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+
 ---
- src/systemd/src/basic/in-addr-util.c | 1 +
- src/systemd/src/basic/string-util.h  | 5 +++++
+ shared/systemd/src/basic/in-addr-util.c | 1 +
+ shared/systemd/src/basic/string-util.h  | 5 +++++
  2 files changed, 6 insertions(+)
 
-diff --git a/src/systemd/src/basic/in-addr-util.c b/src/systemd/src/basic/in-addr-util.c
-index 2a02d90..a57c360 100644
---- a/src/systemd/src/basic/in-addr-util.c
-+++ b/src/systemd/src/basic/in-addr-util.c
+diff --git a/shared/systemd/src/basic/in-addr-util.c b/shared/systemd/src/basic/in-addr-util.c
+index 5ced350..c6b52b8 100644
+--- a/shared/systemd/src/basic/in-addr-util.c
++++ b/shared/systemd/src/basic/in-addr-util.c
 @@ -13,6 +13,7 @@
  #include "in-addr-util.h"
  #include "macro.h"
@@ -26,11 +27,11 @@ index 2a02d90..a57c360 100644
  #include "util.h"
  
  bool in4_addr_is_null(const struct in_addr *a) {
-diff --git a/src/systemd/src/basic/string-util.h b/src/systemd/src/basic/string-util.h
-index 4c94b18..a6dc446 100644
---- a/src/systemd/src/basic/string-util.h
-+++ b/src/systemd/src/basic/string-util.h
-@@ -26,6 +26,11 @@
+diff --git a/shared/systemd/src/basic/string-util.h b/shared/systemd/src/basic/string-util.h
+index 38070ab..6b918e0 100644
+--- a/shared/systemd/src/basic/string-util.h
++++ b/shared/systemd/src/basic/string-util.h
+@@ -27,6 +27,11 @@
  #define strcaseeq(a,b) (strcasecmp((a),(b)) == 0)
  #define strncaseeq(a, b, n) (strncasecmp((a), (b), (n)) == 0)
  
@@ -42,6 +43,3 @@ index 4c94b18..a6dc446 100644
  int strcmp_ptr(const char *a, const char *b) _pure_;
  
  static inline bool streq_ptr(const char *a, const char *b) {
--- 
-2.14.3
-
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.14.4.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.16.0.bb
similarity index 81%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.14.4.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.16.0.bb
index 26c40a5fe..bdf60ee7c 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.14.4.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.16.0.bb
@@ -5,7 +5,7 @@ SECTION = "net/misc"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b \
                     file://libnm-util/COPYING;md5=1c4fa765d6eb3cd2fbd84344a1b816cd \
-                    file://docs/api/html/license.html;md5=2d56a1b0c42e388aa86aef59b154e8c3 \
+                    file://docs/api/html/license.html;md5=233931303ef80eded167add1f60a50c1 \
 "
 
 DEPENDS = " \
@@ -24,19 +24,19 @@ inherit gnomebase gettext systemd bluetooth bash-completion vala gobject-introsp
 
 SRC_URI = " \
     ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.xz \
-    file://0001-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch \
-    file://0002-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch \
-    file://0003-Do-not-create-settings-settings-property-documentati.patch \
-    file://0001-Do-not-include-net-ethernet.h-and-linux-if_ether.h.patch \
-    file://musl/0001-musl-basic.patch \
-    file://musl/0002-musl-dlopen-configure-ac.patch \
-    file://musl/0003-musl-network-support.patch \
-    file://musl/0004-musl-process-util.patch \
-    file://musl/0005-musl-avoid-further-conflicts-by-including-net-ethern.patch \
-    file://musl/0006-Add-a-strndupa-replacement-for-musl.patch \
+    file://0001-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch \
+    file://0002-Do-not-create-settings-settings-property-documentati.patch \
+    file://musl/0001-Do-not-include-net-ethernet.h-and-linux-if_ether.h.patch \
+    file://musl/0002-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch \
+    file://musl/0003-musl-basic.patch \
+    file://musl/0004-musl-dlopen-configure-ac.patch \
+    file://musl/0005-musl-network-support.patch \
+    file://musl/0006-musl-process-util.patch \
+    file://musl/0007-musl-avoid-further-conflicts-by-including-net-ethern.patch \
+    file://musl/0008-Add-a-strndupa-replacement-for-musl.patch \
 "
-SRC_URI[md5sum] = "54ce62f0aa18ef6c5e754eaac47494ac"
-SRC_URI[sha256sum] = "35a3ede4c7d12d6212033c9e44cb82b7692f38063b53a067567f02f5937c8c18"
+SRC_URI[md5sum] = "10abacaafb162a67d2942adf03e7e9e4"
+SRC_URI[sha256sum] = "8e962833b6ca03edda1bc57ed6614a7b8c2339531b44acef098d05f2324c5d2c"
 
 UPSTREAM_CHECK_URI = "${GNOME_MIRROR}/NetworkManager/1.10/"
 UPSTREAM_CHECK_REGEX = "NetworkManager\-(?P<pver>1\.10(\.\d+)+).tar.xz"
@@ -136,7 +136,7 @@ FILES_${PN}-nmtui-doc = " \
     ${mandir}/man1/nmtui* \
 "
 
-SYSTEMD_SERVICE_${PN} = "NetworkManager.service NetworkManager-dispatcher.service"
+SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'NetworkManager.service NetworkManager-dispatcher.service', '', d)}"
 
 do_install_append() {
     rm -rf ${D}/run ${D}${localstatedir}/run
-- 
2.20.1


