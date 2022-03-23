Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86859C433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 22:15:01 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web09.3520.1648073700220358218
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Mar 2022 15:15:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: sakib.sajal@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 22NMEwfQ011935
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Mar 2022 15:14:58 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 23 Mar 2022 15:14:58 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 23 Mar 2022 15:14:57 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 23 Mar 2022 15:14:57 -0700
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] drbd-utils: update 9.13.1 -> 9.20.2
Date: Wed, 23 Mar 2022 18:14:55 -0400
Message-ID: <20220323221455.37922-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Mar 2022 22:15:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96167

Dropped patch which is merged upstream:
	0001-v84-Make-setup_options-definitions-as-extern.patch

Refreshed patch:
	0001-drbd-utils-support-usrmerge.patch

The compiled binaries are not linked to LDFLAGS options provided
by the build system cause QA issue:
	do_package_qa: QA Issue: File /usr/sbin/drbdmon in package
	drbd-utils doesn't have GNU_HASH (didn't pass LDFLAGS?)

Add 'TARGET_CC_ARCH += "${LDFLAGS}"' to resolve the issue.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 .../0001-drbd-utils-support-usrmerge.patch    | 39 +++++++++++--------
 ...-setup_options-definitions-as-extern.patch | 32 ---------------
 ...d-utils_9.13.1.bb => drbd-utils_9.20.2.bb} | 11 ++++--
 3 files changed, 30 insertions(+), 52 deletions(-)
 delete mode 100644 meta-networking/recipes-support/drbd/drbd-utils/0001-v84-Make-setup_options-definitions-as-extern.patch
 rename meta-networking/recipes-support/drbd/{drbd-utils_9.13.1.bb => drbd-utils_9.20.2.bb} (89%)

diff --git a/meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-utils-support-usrmerge.patch b/meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-utils-support-usrmerge.patch
index 5e128727d..d976680e3 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-utils-support-usrmerge.patch
+++ b/meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-utils-support-usrmerge.patch
@@ -1,4 +1,4 @@
-From 642b5823abeee27a0fdc2d12d0e1235461ace9ed Mon Sep 17 00:00:00 2001
+From 83764f5d57b3370e0b04a70f814ca49237a66eea Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 5 Sep 2019 18:57:39 +0800
 Subject: [PATCH] drbd-utils: support usrmerge
@@ -6,18 +6,19 @@ Subject: [PATCH] drbd-utils: support usrmerge
 Upstream-Status: Inappropriate[oe-specific]
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
 ---
  configure.ac         |  2 +-
- scripts/Makefile.in  |  4 ++--
+ scripts/Makefile.in  | 10 +++++-----
  user/v83/Makefile.in | 14 +++++++-------
  user/v84/Makefile.in | 14 +++++++-------
- 4 files changed, 17 insertions(+), 17 deletions(-)
+ 4 files changed, 20 insertions(+), 20 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 4df1b4d..c4ef1bc 100644
+index ae575586..3d7deeae 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -176,7 +176,7 @@ AC_ARG_WITH(tmpfilesdir,
+@@ -180,7 +180,7 @@ AC_ARG_WITH(tmpfilesdir,
  AC_SUBST(tmpfilesdir)
  
  # set default early
@@ -27,22 +28,28 @@ index 4df1b4d..c4ef1bc 100644
     test x"$with_udev" = xyes ; then
  	if test x"$PKG_CONFIG" != x; then
 diff --git a/scripts/Makefile.in b/scripts/Makefile.in
-index fbb0beb..da701a1 100644
+index fcd298e9..2521fb08 100644
 --- a/scripts/Makefile.in
 +++ b/scripts/Makefile.in
-@@ -75,8 +75,8 @@ endif
- ifeq ($(subst both,systemd,$(initscripttype)),systemd)
+@@ -88,11 +88,11 @@ ifeq ($(subst both,systemd,$(initscripttype)),systemd)
  	install -d $(DESTDIR)$(systemdunitdir)
  	install -m 644 drbd.service $(DESTDIR)$(systemdunitdir)/
--	install -d $(DESTDIR)/lib/drbd/
--	install -m 755 drbd $(DESTDIR)/lib/drbd/
-+	install -d $(DESTDIR)/${nonarch_libdir}/drbd
-+	install -m 755 drbd $(DESTDIR)/${nonarch_libdir}/drbd
+ 	install -m 644 $(SYSTEMD_TEMPLATES) $(DESTDIR)$(systemdunitdir)/
+-	install -d $(DESTDIR)/lib/drbd/scripts
+-	install -m 755 drbd $(DESTDIR)/lib/drbd/scripts
+-	install -m 755 drbd-service-shim.sh $(DESTDIR)/lib/drbd/scripts
+-	install -m 755 drbd-wait-promotable.sh $(DESTDIR)/lib/drbd/scripts
+-	install -m 755 ocf.ra.wrapper.sh $(DESTDIR)/lib/drbd/scripts
++	install -d $(DESTDIR)/${nonarch_libdir}/drbdscripts
++	install -m 755 drbd $(DESTDIR)/${nonarch_libdir}/drbdscripts
++	install -m 755 drbd-service-shim.sh $(DESTDIR)/${nonarch_libdir}/drbdscripts
++	install -m 755 drbd-wait-promotable.sh $(DESTDIR)/${nonarch_libdir}/drbdscripts
++	install -m 755 ocf.ra.wrapper.sh $(DESTDIR)/${nonarch_libdir}/drbdscripts
  	install -d $(DESTDIR)$(tmpfilesdir)/
  	install -m 444 drbd.tmpfiles.conf $(DESTDIR)$(tmpfilesdir)/drbd.conf
  endif
 diff --git a/user/v83/Makefile.in b/user/v83/Makefile.in
-index 27516de..b301376 100644
+index 08cfe574..4c4971b6 100644
 --- a/user/v83/Makefile.in
 +++ b/user/v83/Makefile.in
 @@ -96,19 +96,19 @@ install:
@@ -73,10 +80,10 @@ index 27516de..b301376 100644
  .PHONY: install uninstall clean distclean
  ../../configure:
 diff --git a/user/v84/Makefile.in b/user/v84/Makefile.in
-index 38977c6..05ef060 100644
+index 0fcefc5f..81f7d5ec 100644
 --- a/user/v84/Makefile.in
 +++ b/user/v84/Makefile.in
-@@ -109,19 +109,19 @@ ifeq ($(WITH_84_SUPPORT),yes)
+@@ -110,19 +110,19 @@ ifeq ($(WITH_84_SUPPORT),yes)
  	install -d $(DESTDIR)$(localstatedir)/lib/drbd
  	install -d $(DESTDIR)$(localstatedir)/run/drbd
  	install -d $(DESTDIR)$(localstatedir)/lock
@@ -104,5 +111,5 @@ index 38977c6..05ef060 100644
  spell:
  	for f in drbdadm_adjust.c drbdadm_main.c drbdadm_parser.c drbdadm_usage_cnt.c drbdsetup.c drbdtool_common.c; do \
 -- 
-2.7.4
+2.33.0
 
diff --git a/meta-networking/recipes-support/drbd/drbd-utils/0001-v84-Make-setup_options-definitions-as-extern.patch b/meta-networking/recipes-support/drbd/drbd-utils/0001-v84-Make-setup_options-definitions-as-extern.patch
deleted file mode 100644
index 6702f3bde..000000000
--- a/meta-networking/recipes-support/drbd/drbd-utils/0001-v84-Make-setup_options-definitions-as-extern.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From d095caf6f8f77fe056fb90ccd5d89c207a7f346d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 12 Aug 2020 12:59:38 -0700
-Subject: [PATCH] v84: Make setup_options definitions as extern
-
-This is already defined in drbdadm_main.c, therefore make this
-declaration to be extern for other modules
-
-Fixes compatibility with gcc-10 which uses -fno-common by default
-
-Upstream-Status: Submitted [https://github.com/LINBIT/drbd-utils/pull/7]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- user/v84/drbdadm.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/user/v84/drbdadm.h b/user/v84/drbdadm.h
-index ed63d78c..8469f1c4 100644
---- a/user/v84/drbdadm.h
-+++ b/user/v84/drbdadm.h
-@@ -251,7 +251,7 @@ struct setup_option {
- 	bool explicit;
- 	char *option;
- };
--struct setup_option *setup_options;
-+extern struct setup_option *setup_options;
- 
- extern void add_setup_option(bool explicit, char *option);
- 
--- 
-2.28.0
-
diff --git a/meta-networking/recipes-support/drbd/drbd-utils_9.13.1.bb b/meta-networking/recipes-support/drbd/drbd-utils_9.20.2.bb
similarity index 89%
rename from meta-networking/recipes-support/drbd/drbd-utils_9.13.1.bb
rename to meta-networking/recipes-support/drbd/drbd-utils_9.20.2.bb
index a246464b2..4a1776908 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils_9.13.1.bb
+++ b/meta-networking/recipes-support/drbd/drbd-utils_9.20.2.bb
@@ -10,11 +10,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
 
 SRC_URI = "git://github.com/LINBIT/drbd-utils;name=drbd-utils;branch=${PV};protocol=https \
            git://github.com/LINBIT/drbd-headers;name=drbd-headers;destsuffix=git/drbd-headers;branch=master;protocol=https \
-           file://0001-v84-Make-setup_options-definitions-as-extern.patch \
            ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','file://0001-drbd-utils-support-usrmerge.patch','',d)} \
           "
-SRCREV_drbd-utils = "b24b0f7e42d500d3538d7eeffa017ec78d08f918"
-SRCREV_drbd-headers = "c757cf357edef67751b8f45a6ea894d287180087"
+SRCREV_drbd-utils = "087ee6b4961ca154d76e4211223b03149373bed8"
+SRCREV_drbd-headers = "f1529aa84e9d2f66c96ad283a1bbb708aabf03f7"
 
 SRCREV_FORMAT = "drbd-utils_drbd-headers"
 
@@ -40,6 +39,8 @@ EXTRA_OECONF = " \
                 --without-manual \
                "
 
+TARGET_CC_ARCH += "${LDFLAGS}"
+
 # If we have inherited reproducible_build, we want to use it.
 export WANT_DRBD_REPRODUCIBLE_BUILD = "yes"
 
@@ -56,7 +57,9 @@ RDEPENDS:${PN} += "bash perl-module-getopt-long perl-module-exporter perl-module
 FILES:${PN} += "/run"
 FILES:${PN} += "${nonarch_base_libdir}/drbd \
                 ${nonarch_libdir}/drbd \
-                ${nonarch_libdir}/tmpfiles.d"
+                ${nonarch_libdir}/tmpfiles.d \
+                ${nonarch_libdir}/drbdscripts/* \
+"
 FILES:${PN}-dbg += "${nonarch_base_libdir}/drbd/.debug"
 
 CLEANBROKEN = "1"
-- 
2.33.0


