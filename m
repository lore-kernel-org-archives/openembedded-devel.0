Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 573C16E268
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Aug 2015 09:32:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7E9WGpN029995
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Aug 2015 02:32:16 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Fri, 14 Aug 2015 02:32:16 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 14 Aug 2015 17:28:47 +0800
Message-ID: <1439544527-6806-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-oe] collectd: upgrade to 5.5.0
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
X-List-Received-Date: Fri, 14 Aug 2015 09:32:18 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

1. remove two patch glibc-2.20-compatiblity.patch and
0001-netlink-ensure-size_t-portability-in-DEBUG-statement.patch, which
have been merged into 
2. update collectd-version.patch
3. redefine the collectd dependence
4. update the checksum

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...ure-size_t-portability-in-DEBUG-statement.patch |  30 ------
 .../collectd/0001-redefine-the-dependence.patch    |  28 ++++++
 .../collectd/collectd/collectd-version.patch       |  16 ++--
 .../collectd/glibc-2.20-compatiblity.patch         | 102 ---------------------
 .../{collectd_5.4.1.bb => collectd_5.5.0.bb}       |   9 +-
 5 files changed, 39 insertions(+), 146 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/collectd/collectd/0001-netlink-ensure-size_t-portability-in-DEBUG-statement.patch
 create mode 100644 meta-oe/recipes-extended/collectd/collectd/0001-redefine-the-dependence.patch
 delete mode 100644 meta-oe/recipes-extended/collectd/collectd/glibc-2.20-compatiblity.patch
 rename meta-oe/recipes-extended/collectd/{collectd_5.4.1.bb => collectd_5.5.0.bb} (91%)

diff --git a/meta-oe/recipes-extended/collectd/collectd/0001-netlink-ensure-size_t-portability-in-DEBUG-statement.patch b/meta-oe/recipes-extended/collectd/collectd/0001-netlink-ensure-size_t-portability-in-DEBUG-statement.patch
deleted file mode 100644
index 52b9a86..0000000
--- a/meta-oe/recipes-extended/collectd/collectd/0001-netlink-ensure-size_t-portability-in-DEBUG-statement.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From f6c89c17955223bf8c99a901ca6f901b83fa521f Mon Sep 17 00:00:00 2001
-From: Marc Fournier <marc.fournier@camptocamp.com>
-Date: Wed, 3 Dec 2014 16:15:28 +0100
-Subject: [PATCH] netlink: ensure size_t portability in DEBUG() statement
-
-This prevents the following error when building on 32bit systems with
-gcc 4.7.2:
-
-netlink.c: In function 'ir_read':
-netlink.c:783:7: error: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'size_t' [-Werror=format]
----
- src/netlink.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/netlink.c b/src/netlink.c
-index 422dc8c..3c4642c 100644
---- a/src/netlink.c
-+++ b/src/netlink.c
-@@ -683,7 +683,7 @@ static int ir_read (void)
-         continue;
-       }
- 
--      DEBUG ("netlink plugin: ir_read: querying %s from %s (%lu).",
-+      DEBUG ("netlink plugin: ir_read: querying %s from %s (%zu).",
-           type_name[type_index], iflist[ifindex], ifindex);
- 
-       nlh = mnl_nlmsg_put_header (buf);
--- 
-2.1.4
-
diff --git a/meta-oe/recipes-extended/collectd/collectd/0001-redefine-the-dependence.patch b/meta-oe/recipes-extended/collectd/collectd/0001-redefine-the-dependence.patch
new file mode 100644
index 0000000..c17020a
--- /dev/null
+++ b/meta-oe/recipes-extended/collectd/collectd/0001-redefine-the-dependence.patch
@@ -0,0 +1,28 @@
+[PATCH] define the collectd dependence
+
+Upstream-Status: Pending
+
+libavltree.la libcommon.la libheap.la are created dynamically, and in LDADD,
+but not in DEPENDENCIES 
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ src/daemon/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/daemon/Makefile.am b/src/daemon/Makefile.am
+index 10860ec..7f826e3 100644
+--- a/src/daemon/Makefile.am
++++ b/src/daemon/Makefile.am
+@@ -49,7 +49,7 @@ collectd_CPPFLAGS =  $(AM_CPPFLAGS) $(LTDLINCL)
+ collectd_CFLAGS = $(AM_CFLAGS)
+ collectd_LDFLAGS = -export-dynamic
+ collectd_LDADD = libavltree.la libcommon.la libheap.la -lm
+-collectd_DEPENDENCIES =
++collectd_DEPENDENCIES = libavltree.la libcommon.la libheap.la
+ 
+ # Link to these libraries..
+ if BUILD_WITH_LIBRT
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-extended/collectd/collectd/collectd-version.patch b/meta-oe/recipes-extended/collectd/collectd/collectd-version.patch
index 1e2b7c1..86c3f65 100644
--- a/meta-oe/recipes-extended/collectd/collectd/collectd-version.patch
+++ b/meta-oe/recipes-extended/collectd/collectd/collectd-version.patch
@@ -11,21 +11,19 @@ Upstream-Status: Pending
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 
 diff --git a/version-gen.sh b/version-gen.sh
-index e344541..d1c0929 100755
+index b09be8e..2671066 100755
 --- a/version-gen.sh
 +++ b/version-gen.sh
-@@ -2,7 +2,10 @@
+@@ -2,8 +2,10 @@
  
- DEFAULT_VERSION="5.2.2.git"
+ DEFAULT_VERSION="5.5.0.git"
  
--VERSION="`git describe 2> /dev/null | sed -e 's/^collectd-//'`"
+-VERSION="`git describe 2> /dev/null | grep collectd | sed -e 's/^collectd-//'`"
+-
 +VERSION=""
 +if test -d .git ; then
-+	VERSION="`git describe 2> /dev/null | sed -e 's/^collectd-//'`"
++	VERSION="`git describe 2> /dev/null | grep collectd | sed -e 's/^collectd-//'`"
 +fi
- 
  if test -z "$VERSION"; then
  	VERSION="$DEFAULT_VERSION"
--- 
-1.7.10.4
-
+ fi
diff --git a/meta-oe/recipes-extended/collectd/collectd/glibc-2.20-compatiblity.patch b/meta-oe/recipes-extended/collectd/collectd/glibc-2.20-compatiblity.patch
deleted file mode 100644
index 2596bed..0000000
--- a/meta-oe/recipes-extended/collectd/collectd/glibc-2.20-compatiblity.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-This makes it forward compatible with glibc 2.20+ where _BSD_SOURCE
-macro has been deprecated.
-
-Fixes warnings like
-
-usr/include/features.h:148:3: error: #warning "_BSD_SOURCE and _SVID_SOURCE are deprecated, use _DEFAULT_SOURCE" [-Werror=cpp]
-|  # warning "_BSD_SOURCE and _SVID_SOURCE are deprecated, use _DEFAULT_SOURCE"
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-Index: collectd-5.4.1/configure.ac
-===================================================================
---- collectd-5.4.1.orig/configure.ac	2014-09-03 01:21:10.666084244 -0700
-+++ collectd-5.4.1/configure.ac	2014-09-03 01:31:27.794084244 -0700
-@@ -1288,6 +1288,7 @@
- 
- AC_CHECK_MEMBERS([struct udphdr.uh_dport, struct udphdr.uh_sport], [], [],
- [#define _BSD_SOURCE
-+#define _DEFAULT_SOURCE 1
- #if HAVE_STDINT_H
- # include <stdint.h>
- #endif
-@@ -1309,6 +1310,7 @@
- ])
- AC_CHECK_MEMBERS([struct udphdr.dest, struct udphdr.source], [], [],
- [#define _BSD_SOURCE
-+#define _DEFAULT_SOURCE 1
- #if HAVE_STDINT_H
- # include <stdint.h>
- #endif
-Index: collectd-5.4.1/src/dns.c
-===================================================================
---- collectd-5.4.1.orig/src/dns.c	2014-01-26 00:09:14.856391886 -0800
-+++ collectd-5.4.1/src/dns.c	2014-09-03 01:32:37.666084244 -0700
-@@ -22,6 +22,7 @@
-  **/
- 
- #define _BSD_SOURCE
-+#define _DEFAULT_SOURCE 1
- 
- #include "collectd.h"
- #include "common.h"
-Index: collectd-5.4.1/src/exec.c
-===================================================================
---- collectd-5.4.1.orig/src/exec.c	2014-01-26 00:09:14.860391963 -0800
-+++ collectd-5.4.1/src/exec.c	2014-09-03 01:32:28.874084244 -0700
-@@ -24,6 +24,7 @@
-  **/
- 
- #define _BSD_SOURCE /* For setgroups */
-+#define _DEFAULT_SOURCE 1
- 
- #include "collectd.h"
- #include "common.h"
-Index: collectd-5.4.1/src/load.c
-===================================================================
---- collectd-5.4.1.orig/src/load.c	2014-01-26 00:09:23.532559941 -0800
-+++ collectd-5.4.1/src/load.c	2014-09-03 01:32:51.462084244 -0700
-@@ -22,6 +22,7 @@
-  **/
- 
- #define _BSD_SOURCE
-+#define _DEFAULT_SOURCE 1
- 
- #include "collectd.h"
- #include "common.h"
-Index: collectd-5.4.1/src/network.c
-===================================================================
---- collectd-5.4.1.orig/src/network.c	2014-01-26 00:09:23.532559941 -0800
-+++ collectd-5.4.1/src/network.c	2014-09-03 01:32:44.522084244 -0700
-@@ -23,6 +23,7 @@
-  **/
- 
- #define _BSD_SOURCE /* For struct ip_mreq */
-+#define _DEFAULT_SOURCE 1
- 
- #include "collectd.h"
- #include "plugin.h"
-Index: collectd-5.4.1/src/ntpd.c
-===================================================================
---- collectd-5.4.1.orig/src/ntpd.c	2014-01-26 00:09:14.880392351 -0800
-+++ collectd-5.4.1/src/ntpd.c	2014-09-03 01:32:20.350084244 -0700
-@@ -20,6 +20,7 @@
-  **/
- 
- #define _BSD_SOURCE /* For NI_MAXHOST */
-+#define _DEFAULT_SOURCE 1
- 
- #include "collectd.h"
- #include "common.h"
-Index: collectd-5.4.1/src/utils_dns.c
-===================================================================
---- collectd-5.4.1.orig/src/utils_dns.c	2014-01-26 00:09:14.908392893 -0800
-+++ collectd-5.4.1/src/utils_dns.c	2014-09-03 01:31:47.062084244 -0700
-@@ -34,6 +34,7 @@
-  */
- 
- #define _BSD_SOURCE
-+#define _DEFAULT_SOURCE 1
- 
- #include "collectd.h"
- #include "plugin.h"
diff --git a/meta-oe/recipes-extended/collectd/collectd_5.4.1.bb b/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb
similarity index 91%
rename from meta-oe/recipes-extended/collectd/collectd_5.4.1.bb
rename to meta-oe/recipes-extended/collectd/collectd_5.5.0.bb
index 3a566db..1646722 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.4.1.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb
@@ -1,19 +1,18 @@
 SUMMARY = "Collects and summarises system performance statistics"
 DESCRIPTION = "collectd is a daemon which collects system performance statistics periodically and provides mechanisms to store the values in a variety of ways, for example in RRD files."
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1bd21f19f7f0c61a7be8ecacb0e28854"
 
 DEPENDS = "rrdtool curl libpcap libxml2 yajl libgcrypt libtool lvm2"
 
 SRC_URI = "http://collectd.org/files/collectd-${PV}.tar.bz2 \
            file://no-gcrypt-badpath.patch \
            file://collectd-version.patch \
-           file://glibc-2.20-compatiblity.patch \
-           file://0001-netlink-ensure-size_t-portability-in-DEBUG-statement.patch \
+           file://0001-redefine-the-dependence.patch  \
            file://collectd.init \
            file://collectd.service"
-SRC_URI[md5sum] = "6f56c71c96573a7f4f7fb3bfab185974"
-SRC_URI[sha256sum] = "75452129f271cb0aad28e57f12a49070618bbb7b6a9d64cf869e8766fa2f66e0"
+SRC_URI[md5sum] = "c39305ef5514b44238b0d31f77e29e6a"
+SRC_URI[sha256sum] = "847684cf5c10de1dc34145078af3fcf6e0d168ba98c14f1343b1062a4b569e88"
 
 inherit autotools pythonnative update-rc.d pkgconfig systemd
 
-- 
1.9.1


