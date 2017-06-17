Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id A393778371
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Jun 2017 17:21:52 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id 83so35758312pfr.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Jun 2017 10:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=EQ3/uM9FWtWXvfJJCTZSoPBffCcQOjSV5G+16wuqi64=;
	b=UwXLqDlfIA0ivLlj6Ym92+S1ZY0PZwRl5l39g02pHcgLxTnm0XK0df5DWgCl6/UCBK
	e0bGfegLskF7UeapBI/JmYukAIJ3GpHe7pYIuJiIPFZXR3POjsFKzE54iWgUN/jmKPRF
	1xZawpr0W7pgk2kQK/cLMwWGGD8/dce8OIWX4ucgDeaVf9fr3/GAT3BCdRFssO5xSUEZ
	DYZBrkOD3OHXdlpGaBvN45QPH2j3cGpUm4yLd0sJf24eINfOPpqhfFr2VvAbW/TIJMfM
	W7AIQ3BdgI3XYS564p0MTXOoqtzO2JG1ZSV3vQ7hl/KFo2hanlue2+c4nGiz0sWS92T6
	Teow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=EQ3/uM9FWtWXvfJJCTZSoPBffCcQOjSV5G+16wuqi64=;
	b=WCE7SQX0xg+YQDyhzyM4iCiBgHIJfhRtkUDUWZAEvbBpe62fhV6w17M2oRnrsJAiVE
	Y+dN3u1rGzOEFS9aVLtPMOwviPNYZRB2V3dzncwz8dmg+A5w1Rx1qleC1K6nLM2rNTAB
	6xwmWaFM8IhNyMXb293xF2oe+2jpjwetc3PHkSrQ3Y40N8c5veTnuWvf2EP+SXvQejVU
	zjIEtCvbLSF+awC9ktsEne9JhGc8ANGyM/qiNlKNdZTpUY2QX62kuFVmG8hw3g8aYqeY
	2HyRG9rQbEAC1KfE95LhZ2mBAo++31sS/M6iMDyWHkGBfQhukOiCKR28Ui7ZMJAwFGvJ
	EsnA==
X-Gm-Message-State: AKS2vOy0i4zAa2QI/4Drod+21KunvdNAltPrO5Zt03XIdlyTFN18tyDt
	rXZJ6BeJHoImru8D
X-Received: by 10.98.89.79 with SMTP id n76mr17345452pfb.28.1497720113466;
	Sat, 17 Jun 2017 10:21:53 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::36d3])
	by smtp.gmail.com with ESMTPSA id
	o12sm12201226pfi.9.2017.06.17.10.21.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 17 Jun 2017 10:21:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 17 Jun 2017 10:21:35 -0700
Message-Id: <20170617172142.1311-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <20170617172142.1311-1-raj.khem@gmail.com>
References: <20170617172142.1311-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/9] freeradius: Upgrade to 3.0.14
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
X-List-Received-Date: Sat, 17 Jun 2017 17:21:52 -0000

Fix a cross compile issue where it was looking for samba headers
in build host.

in src/modules/rlm_mschap/config.log

Fix

cc1: warning: include location "/usr/include/samba-4.0/" is unsafe for cross-compilation [-Wpoison-system-directories]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Use-includedir-instead-of-hardcoding-usr-.patch | 28 ++++++++++++++++++++++
 .../{freeradius_3.0.13.bb => freeradius_3.0.14.bb} | 10 ++++----
 2 files changed, 33 insertions(+), 5 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/0001-rlm_mschap-Use-includedir-instead-of-hardcoding-usr-.patch
 rename meta-networking/recipes-connectivity/freeradius/{freeradius_3.0.13.bb => freeradius_3.0.14.bb} (96%)

diff --git a/meta-networking/recipes-connectivity/freeradius/files/0001-rlm_mschap-Use-includedir-instead-of-hardcoding-usr-.patch b/meta-networking/recipes-connectivity/freeradius/files/0001-rlm_mschap-Use-includedir-instead-of-hardcoding-usr-.patch
new file mode 100644
index 000000000..db8caab12
--- /dev/null
+++ b/meta-networking/recipes-connectivity/freeradius/files/0001-rlm_mschap-Use-includedir-instead-of-hardcoding-usr-.patch
@@ -0,0 +1,28 @@
+From 66e8bcdcca8971b5c43c31755d56d7f675d8b5ff Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 16 Jun 2017 20:10:49 -0700
+Subject: [PATCH] rlm_mschap: Use includedir instead of hardcoding /usr/include
+
+OE QA flags it correctly as a voilation of cross compilation
+namespace
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/modules/rlm_mschap/configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: freeradius-server-3.0.14/src/modules/rlm_mschap/configure.ac
+===================================================================
+--- freeradius-server-3.0.14.orig/src/modules/rlm_mschap/configure.ac
++++ freeradius-server-3.0.14/src/modules/rlm_mschap/configure.ac
+@@ -72,7 +72,7 @@ if test x$with_[]modname != xno; then
+         mod_ldflags="-framework DirectoryService"
+     fi
+ 
+-    smart_try_dir="$winbind_include_dir /usr/include/samba-4.0"
++    smart_try_dir="$winbind_include_dir =/usr/include/samba-4.0"
+     FR_SMART_CHECK_INCLUDE(wbclient.h, [#include <stdint.h>
+ 					#include <stdbool.h>])
+     if test "x$ac_cv_header_wbclient_h" != "xyes"; then
diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.13.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.14.bb
similarity index 96%
rename from meta-networking/recipes-connectivity/freeradius/freeradius_3.0.13.bb
rename to meta-networking/recipes-connectivity/freeradius/freeradius_3.0.14.bb
index 0d39c15f5..6971b0379 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.13.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.14.bb
@@ -10,7 +10,8 @@ SUMMARY = "High-performance and highly configurable RADIUS server"
 HOMEPAGE = "http://www.freeradius.org/"
 SECTION = "System/Servers"
 LICENSE = "GPLv2 & LGPLv2+"
-DEPENDS = "openssl-native openssl libtool libpcap libtalloc"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=eb723b61539feef013de476e68b5c50a"
+DEPENDS = "openssl-native openssl libidn libtool libpcap libtalloc"
 
 SRC_URI = "ftp://ftp.freeradius.org/pub/freeradius/freeradius-server-${PV}.tar.bz2 \
     file://freeradius \
@@ -25,13 +26,12 @@ SRC_URI = "ftp://ftp.freeradius.org/pub/freeradius/freeradius-server-${PV}.tar.b
     file://freeradius-libtool-do-not-use-jlibtool.patch \
     file://freeradius-fix-quoting-for-BUILT_WITH.patch \
     file://freeradius-fix-error-for-expansion-of-macro.patch \
+    file://0001-rlm_mschap-Use-includedir-instead-of-hardcoding-usr-.patch \
     file://radiusd.service \
     file://radiusd-volatiles.conf \
 "
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=eb723b61539feef013de476e68b5c50a"
-SRC_URI[md5sum] = "7f99df26a6ac71b1f7cce5c213e52790"
-SRC_URI[sha256sum] = "b3be0d8849878c31af0a5375d20b7b20c9d1c1572e89dc3f22992824cefffb84"
+SRC_URI[md5sum] = "7d98dfafffac81f19cadccea5af89cea"
+SRC_URI[sha256sum] = "2771f6ecd6c816ac4d52b66bb8ae6781ca20e1e4984c5804fc4e67de3a807c59"
 
 PARALLEL_MAKE = ""
 
-- 
2.13.1


