Return-Path: <Zhiquan.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A08AC76862
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2015 10:07:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9NA7nER020862
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2015 03:07:49 -0700 (PDT)
Received: from pek-lpd-ccm1.wrs.com (128.224.179.178) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Fri, 23 Oct 2015 03:07:49 -0700
From: Zhiquan Li <zhiquan.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Oct 2015 18:07:35 +0800
Message-ID: <1445594855-39110-2-git-send-email-zhiquan.li@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1445594855-39110-1-git-send-email-zhiquan.li@windriver.com>
References: <1445594855-39110-1-git-send-email-zhiquan.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] snort: fix m4 causes out of memory during configure [ LIN8-299 ]
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
X-List-Received-Date: Fri, 23 Oct 2015 10:07:50 -0000
Content-Type: text/plain

Issue: LIN8-299

There is an incorrect m4_define() in configure.in which will result in an
infinite recursion, and it doesn't make sense, since snort 2.9.7 it has been
commented out. We follow this solution to fix it.

Upstream-Status: Backport

(LOCAL REV: NOT UPSTREAM) -- Sent to oe-devel on 20151023

Signed-off-by: Zhiquan Li <zhiquan.li@windriver.com>
---
 .../snort/snort/m4-oom-during-configure.patch       | 21 +++++++++++++++++++++
 .../recipes-connectivity/snort/snort_2.9.6.0.bb     | 16 +++-------------
 2 files changed, 24 insertions(+), 13 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/snort/snort/m4-oom-during-configure.patch

diff --git a/meta-networking/recipes-connectivity/snort/snort/m4-oom-during-configure.patch b/meta-networking/recipes-connectivity/snort/snort/m4-oom-during-configure.patch
new file mode 100644
index 0000000..2250611
--- /dev/null
+++ b/meta-networking/recipes-connectivity/snort/snort/m4-oom-during-configure.patch
@@ -0,0 +1,21 @@
+Upstream-Status: Backport
+
+There is an incorrect m4_define() in configure.in which will result in an
+infinite recursion, and it doesn't make sense, since snort 2.9.7 it has been
+commented out. We follow this solution to fix it.
+
+Signed-off-by: Zhiquan Li <zhiquan.li@windriver.com>
+
+--- a/configure.in	2015-10-22 13:58:50.743367251 +0800
++++ b/configure.in	2015-10-22 13:59:13.855366117 +0800
+@@ -1100,8 +1100,8 @@
+ # Define PKG_CHECK_MODULES if it doesnt already exist. 
+ #file_ This prevents './configure' from erroring on machines that dont have
+ # 'pkgconfig' installed.
+-m4_ifdef([PKG_CHECK_MODULES],[], [m4_define([PKG_CHECK_MODULES], 
+-     [echo "PKG_CHECK_MODULES not defined"])])
++#m4_ifdef([PKG_CHECK_MODULES],[], [m4_define([PKG_CHECK_MODULES],
++#     [echo "PKG_CHECK_MODULES not defined"])])
+
+ if test "x$enable_rzb_saac" = "xyes"; then
+     AC_CHECK_PROG(PKG_CONFIG,pkg-config,yes)
diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb
index 66653c6..65dc524 100644
--- a/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb
+++ b/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb
@@ -6,19 +6,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=78fa8ef966b48fbf9095e13cc92377c5"
 
 DEPENDS = "libpcap libpcre daq libdnet util-linux"
 
-# Blacklist:
-#
-# http://errors.yoctoproject.org/Errors/Details/8936/
-#
-# snort failure is again very nasty, because it's m4 which eats all
-# available memory and swap before it's killed by OOM killer.
-# 
-# Luckily it always picked m4
-# 
-# [Wed Feb 18 19:00:51 2015] Out of memory: Kill process 28522 (m4) score 961 or sacrifice child
-# [Wed Feb 18 19:10:51 2015] Out of memory: Kill process 45228 (m4) score 958 or sacrifice child
-# ...
-PNBLACKLIST[snort] ?= "BROKEN: autotools processing causes OOM condition on configure"
 
 SRC_URI = " ${GENTOO_MIRROR}/${BP}.tar.gz;name=tarball \
             file://snort.init \
@@ -26,6 +13,7 @@ SRC_URI = " ${GENTOO_MIRROR}/${BP}.tar.gz;name=tarball \
             file://disable-dap-address-space-id.patch \
             file://0001-libpcap-search-sysroot-for-headers.patch \
             file://not-hardcoded-libdir.patch \
+            file://m4-oom-during-configure.patch \
 "
 
 SRC_URI[tarball.md5sum] = "18111f6de3989ca89add36077a7c2659"
@@ -45,6 +33,8 @@ EXTRA_OECONF = " \
 	--disable-static-daq \
 	--with-dnet-includes=${STAGING_INCDIR} \
 	--with-dnet-libraries=${STAGING_LIBDIR} \
+	--with-libpcre-includes=${STAGING_INCDIR} \
+	--with-libpcre-libraries=${STAGING_INCDIR} \
 	"
 
 # if you want to disable it, you need to patch configure.in first
-- 
1.9.1


