Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id CE02971353
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Sep 2014 16:53:08 +0000 (UTC)
Received: by mail-pd0-f176.google.com with SMTP id w10so2093165pde.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Sep 2014 09:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=5KjZBPP0cJC16tcq87A3jaht9duJh3ESFEFIdyI4jdw=;
	b=cJH3hqbDIBqLgC/Ov/lQCcSlJkfJkGqc9/r76Aobi58W7LIpAZXgcXSCRY7RrX14Bt
	ETjUIAGVKG4GX00upySEY46VZ64ecdGjR2CSrvf3OAujx0b5TsjUWwUrUFcGUwDD+EdB
	91Q3V2OkxTVtD1lBnbkDr/sHJh792gJy+ZH1U2kpsOBU53N6yhBYEVJv3A3GoPHoRNc4
	kEHli6avQmaYG98/tZWAEtHWltO9zlxNFpTAfWvaKszu3V6zXOLiM/Gdt0JyIGqTc87k
	NJfI2XtRD7YP0WA1EAs8R+C4Vdh9R8qEy69yHXvzTrvxVCIAxDZQwaR84lA+bijrrmyT
	Kh7Q==
X-Received: by 10.70.91.35 with SMTP id cb3mr20807329pdb.127.1409763183621;
	Wed, 03 Sep 2014 09:53:03 -0700 (PDT)
Received: from haswell.localdomain (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218])
	by mx.google.com with ESMTPSA id b9sm7287738pbu.91.2014.09.03.09.53.02
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Sep 2014 09:53:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Sep 2014 09:56:48 -0700
Message-Id: <1409763408-2398-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.0
Subject: [meta-oe][PATCH] collectd: Upgrade to 5.4.1 and fix with glibc 2.20
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Sep 2014 16:53:15 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../collectd/glibc-2.20-compatiblity.patch         | 102 +++++++++++++++++++++
 .../collectd/collectd/no-gcrypt-badpath.patch      |  10 +-
 .../{collectd_5.2.2.bb => collectd_5.4.1.bb}       |   8 +-
 3 files changed, 111 insertions(+), 9 deletions(-)
 create mode 100644 meta-oe/recipes-extended/collectd/collectd/glibc-2.20-compatiblity.patch
 rename meta-oe/recipes-extended/collectd/{collectd_5.2.2.bb => collectd_5.4.1.bb} (93%)

diff --git a/meta-oe/recipes-extended/collectd/collectd/glibc-2.20-compatiblity.patch b/meta-oe/recipes-extended/collectd/collectd/glibc-2.20-compatiblity.patch
new file mode 100644
index 0000000..2596bed
--- /dev/null
+++ b/meta-oe/recipes-extended/collectd/collectd/glibc-2.20-compatiblity.patch
@@ -0,0 +1,102 @@
+This makes it forward compatible with glibc 2.20+ where _BSD_SOURCE
+macro has been deprecated.
+
+Fixes warnings like
+
+usr/include/features.h:148:3: error: #warning "_BSD_SOURCE and _SVID_SOURCE are deprecated, use _DEFAULT_SOURCE" [-Werror=cpp]
+|  # warning "_BSD_SOURCE and _SVID_SOURCE are deprecated, use _DEFAULT_SOURCE"
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+Index: collectd-5.4.1/configure.ac
+===================================================================
+--- collectd-5.4.1.orig/configure.ac	2014-09-03 01:21:10.666084244 -0700
++++ collectd-5.4.1/configure.ac	2014-09-03 01:31:27.794084244 -0700
+@@ -1288,6 +1288,7 @@
+ 
+ AC_CHECK_MEMBERS([struct udphdr.uh_dport, struct udphdr.uh_sport], [], [],
+ [#define _BSD_SOURCE
++#define _DEFAULT_SOURCE 1
+ #if HAVE_STDINT_H
+ # include <stdint.h>
+ #endif
+@@ -1309,6 +1310,7 @@
+ ])
+ AC_CHECK_MEMBERS([struct udphdr.dest, struct udphdr.source], [], [],
+ [#define _BSD_SOURCE
++#define _DEFAULT_SOURCE 1
+ #if HAVE_STDINT_H
+ # include <stdint.h>
+ #endif
+Index: collectd-5.4.1/src/dns.c
+===================================================================
+--- collectd-5.4.1.orig/src/dns.c	2014-01-26 00:09:14.856391886 -0800
++++ collectd-5.4.1/src/dns.c	2014-09-03 01:32:37.666084244 -0700
+@@ -22,6 +22,7 @@
+  **/
+ 
+ #define _BSD_SOURCE
++#define _DEFAULT_SOURCE 1
+ 
+ #include "collectd.h"
+ #include "common.h"
+Index: collectd-5.4.1/src/exec.c
+===================================================================
+--- collectd-5.4.1.orig/src/exec.c	2014-01-26 00:09:14.860391963 -0800
++++ collectd-5.4.1/src/exec.c	2014-09-03 01:32:28.874084244 -0700
+@@ -24,6 +24,7 @@
+  **/
+ 
+ #define _BSD_SOURCE /* For setgroups */
++#define _DEFAULT_SOURCE 1
+ 
+ #include "collectd.h"
+ #include "common.h"
+Index: collectd-5.4.1/src/load.c
+===================================================================
+--- collectd-5.4.1.orig/src/load.c	2014-01-26 00:09:23.532559941 -0800
++++ collectd-5.4.1/src/load.c	2014-09-03 01:32:51.462084244 -0700
+@@ -22,6 +22,7 @@
+  **/
+ 
+ #define _BSD_SOURCE
++#define _DEFAULT_SOURCE 1
+ 
+ #include "collectd.h"
+ #include "common.h"
+Index: collectd-5.4.1/src/network.c
+===================================================================
+--- collectd-5.4.1.orig/src/network.c	2014-01-26 00:09:23.532559941 -0800
++++ collectd-5.4.1/src/network.c	2014-09-03 01:32:44.522084244 -0700
+@@ -23,6 +23,7 @@
+  **/
+ 
+ #define _BSD_SOURCE /* For struct ip_mreq */
++#define _DEFAULT_SOURCE 1
+ 
+ #include "collectd.h"
+ #include "plugin.h"
+Index: collectd-5.4.1/src/ntpd.c
+===================================================================
+--- collectd-5.4.1.orig/src/ntpd.c	2014-01-26 00:09:14.880392351 -0800
++++ collectd-5.4.1/src/ntpd.c	2014-09-03 01:32:20.350084244 -0700
+@@ -20,6 +20,7 @@
+  **/
+ 
+ #define _BSD_SOURCE /* For NI_MAXHOST */
++#define _DEFAULT_SOURCE 1
+ 
+ #include "collectd.h"
+ #include "common.h"
+Index: collectd-5.4.1/src/utils_dns.c
+===================================================================
+--- collectd-5.4.1.orig/src/utils_dns.c	2014-01-26 00:09:14.908392893 -0800
++++ collectd-5.4.1/src/utils_dns.c	2014-09-03 01:31:47.062084244 -0700
+@@ -34,6 +34,7 @@
+  */
+ 
+ #define _BSD_SOURCE
++#define _DEFAULT_SOURCE 1
+ 
+ #include "collectd.h"
+ #include "plugin.h"
diff --git a/meta-oe/recipes-extended/collectd/collectd/no-gcrypt-badpath.patch b/meta-oe/recipes-extended/collectd/collectd/no-gcrypt-badpath.patch
index 02b1601..0e876ae 100644
--- a/meta-oe/recipes-extended/collectd/collectd/no-gcrypt-badpath.patch
+++ b/meta-oe/recipes-extended/collectd/collectd/no-gcrypt-badpath.patch
@@ -7,11 +7,11 @@ Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 
-diff --git a/configure.in b/configure.in
-index 98395ed..81c3a2c 100644
---- a/configure.in
-+++ b/configure.in
-@@ -1777,11 +1777,11 @@ then
+Index: collectd-5.4.1/configure.ac
+===================================================================
+--- collectd-5.4.1.orig/configure.ac	2014-09-03 01:20:22.062084244 -0700
++++ collectd-5.4.1/configure.ac	2014-09-03 01:20:22.058084244 -0700
+@@ -1867,11 +1867,11 @@
  		GCRYPT_CPPFLAGS=`"$with_libgcrypt_config" --cflags 2>/dev/null`
  	fi
  
diff --git a/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb b/meta-oe/recipes-extended/collectd/collectd_5.4.1.bb
similarity index 93%
rename from meta-oe/recipes-extended/collectd/collectd_5.2.2.bb
rename to meta-oe/recipes-extended/collectd/collectd_5.4.1.bb
index 69a5a7e..dc5f88f 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.4.1.bb
@@ -3,15 +3,15 @@ DESCRIPTION = "collectd is a daemon which collects system performance statistics
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-DEPENDS = "rrdtool curl mysql5 libpcap libxml2 yajl libgcrypt libtool"
+DEPENDS = "rrdtool curl mysql5 libpcap libxml2 yajl libgcrypt libtool lvm2 libmnl"
 
 SRC_URI = "http://collectd.org/files/collectd-${PV}.tar.bz2 \
            file://no-gcrypt-badpath.patch \
            file://collectd-version.patch \
+           file://glibc-2.20-compatiblity.patch \
            file://collectd.init"
-
-SRC_URI[md5sum] = "29e61411e51845d5ae71ab676078867e"
-SRC_URI[sha256sum] = "7b8906d1c8866155b31820ef108be92abcee7fcd278d386bf0d449e704ba4696"
+SRC_URI[md5sum] = "6f56c71c96573a7f4f7fb3bfab185974"
+SRC_URI[sha256sum] = "75452129f271cb0aad28e57f12a49070618bbb7b6a9d64cf869e8766fa2f66e0"
 
 inherit autotools pythonnative update-rc.d pkgconfig
 
-- 
2.1.0


