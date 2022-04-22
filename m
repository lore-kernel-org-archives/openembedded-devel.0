Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C70BDC4707F
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:51:59 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web11.3770.1650593219359022001
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Apr 2022 19:07:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: changqing.li@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 23M26vNQ002280
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Apr 2022 19:06:57 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 21 Apr 2022 19:06:57 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 21 Apr 2022 19:06:56 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] drbd-utils: fix for usrmerge
Date: Fri, 22 Apr 2022 10:06:55 +0800
Message-ID: <20220422020655.2131714-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Apr 2022 16:51:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96729

From: Changqing Li <changqing.li@windriver.com>

* fix following error:
systemd-analyze --man=false verify /lib/systemd/system/drbd.service
drbd.service: Command /lib/drbd/scripts/drbd is not executable: No such file or directory

* enhancement for usrmerge

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../0001-drbd-utils-support-usrmerge.patch    | 119 +++++++++++++++---
 .../recipes-support/drbd/drbd-utils_9.20.2.bb |  12 +-
 2 files changed, 114 insertions(+), 17 deletions(-)

diff --git a/meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-utils-support-usrmerge.patch b/meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-utils-support-usrmerge.patch
index d976680e3..84e3ad096 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-utils-support-usrmerge.patch
+++ b/meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-utils-support-usrmerge.patch
@@ -1,18 +1,24 @@
-From 83764f5d57b3370e0b04a70f814ca49237a66eea Mon Sep 17 00:00:00 2001
+From 69011c7227ad1aaf08d5ab28e46f85dac951c597 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
-Date: Thu, 5 Sep 2019 18:57:39 +0800
-Subject: [PATCH] drbd-utils: support usrmerge
+Date: Thu, 21 Apr 2022 17:22:35 +0800
+Subject: [PATCH] drbd-utils: support usermerge
 
 Upstream-Status: Inappropriate[oe-specific]
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
 ---
- configure.ac         |  2 +-
- scripts/Makefile.in  | 10 +++++-----
- user/v83/Makefile.in | 14 +++++++-------
- user/v84/Makefile.in | 14 +++++++-------
- 4 files changed, 20 insertions(+), 20 deletions(-)
+ configure.ac                             |  2 +-
+ scripts/Makefile.in                      | 10 +++++-----
+ scripts/drbd-demote-or-escalate@.service |  2 +-
+ scripts/drbd-promote@.service            |  4 ++--
+ scripts/drbd-wait-promotable@.service    |  2 +-
+ scripts/drbd.service                     |  6 +++---
+ scripts/drbd@.service                    |  6 +++---
+ scripts/ocf.ra@.service                  |  4 ++--
+ user/v83/Makefile.in                     | 14 +++++++-------
+ user/v84/Makefile.in                     | 14 +++++++-------
+ 10 files changed, 32 insertions(+), 32 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
 index ae575586..3d7deeae 100644
@@ -28,7 +34,7 @@ index ae575586..3d7deeae 100644
     test x"$with_udev" = xyes ; then
  	if test x"$PKG_CONFIG" != x; then
 diff --git a/scripts/Makefile.in b/scripts/Makefile.in
-index fcd298e9..2521fb08 100644
+index fcd298e9..bab441a5 100644
 --- a/scripts/Makefile.in
 +++ b/scripts/Makefile.in
 @@ -88,11 +88,11 @@ ifeq ($(subst both,systemd,$(initscripttype)),systemd)
@@ -40,14 +46,97 @@ index fcd298e9..2521fb08 100644
 -	install -m 755 drbd-service-shim.sh $(DESTDIR)/lib/drbd/scripts
 -	install -m 755 drbd-wait-promotable.sh $(DESTDIR)/lib/drbd/scripts
 -	install -m 755 ocf.ra.wrapper.sh $(DESTDIR)/lib/drbd/scripts
-+	install -d $(DESTDIR)/${nonarch_libdir}/drbdscripts
-+	install -m 755 drbd $(DESTDIR)/${nonarch_libdir}/drbdscripts
-+	install -m 755 drbd-service-shim.sh $(DESTDIR)/${nonarch_libdir}/drbdscripts
-+	install -m 755 drbd-wait-promotable.sh $(DESTDIR)/${nonarch_libdir}/drbdscripts
-+	install -m 755 ocf.ra.wrapper.sh $(DESTDIR)/${nonarch_libdir}/drbdscripts
++	install -d $(DESTDIR)/${nonarch_libdir}/drbd/scripts
++	install -m 755 drbd $(DESTDIR)/${nonarch_libdir}/drbd/scripts
++	install -m 755 drbd-service-shim.sh $(DESTDIR)/${nonarch_libdir}/drbd/scripts
++	install -m 755 drbd-wait-promotable.sh $(DESTDIR)/${nonarch_libdir}/drbd/scripts
++	install -m 755 ocf.ra.wrapper.sh $(DESTDIR)/${nonarch_libdir}/drbd/scripts
  	install -d $(DESTDIR)$(tmpfilesdir)/
  	install -m 444 drbd.tmpfiles.conf $(DESTDIR)$(tmpfilesdir)/drbd.conf
  endif
+diff --git a/scripts/drbd-demote-or-escalate@.service b/scripts/drbd-demote-or-escalate@.service
+index 20932238..8b5ce4a2 100644
+--- a/scripts/drbd-demote-or-escalate@.service
++++ b/scripts/drbd-demote-or-escalate@.service
+@@ -28,5 +28,5 @@ TimeoutSec=60
+ # "Type=forking" would be an option to have it retry a number of times,
+ # and then only escalate to FailureAction if that did not help.
+ Type=oneshot
+-ExecStart=/lib/drbd/scripts/drbd-service-shim.sh secondary-or-escalate %I
++ExecStart=@nonarch_libdir@/drbd/scripts/drbd-service-shim.sh secondary-or-escalate %I
+ ExecStopPost=-/bin/journalctl --sync
+diff --git a/scripts/drbd-promote@.service b/scripts/drbd-promote@.service
+index 71345d9b..678e0703 100644
+--- a/scripts/drbd-promote@.service
++++ b/scripts/drbd-promote@.service
+@@ -24,5 +24,5 @@ RemainAfterExit=yes
+ # (ab)using systemd features
+ # if we cannot configure and promote, that's a condition, not a failure
+ # See the comment above wrt. FailureAction vs OnFailure
+-ExecCondition=/lib/drbd/scripts/drbd-service-shim.sh primary %I
+-ExecStop=/lib/drbd/scripts/drbd-service-shim.sh secondary %I
++ExecCondition=@nonarch_libdir@/drbd/scripts/drbd-service-shim.sh primary %I
++ExecStop=@nonarch_libdir@/drbd/scripts/drbd-service-shim.sh secondary %I
+diff --git a/scripts/drbd-wait-promotable@.service b/scripts/drbd-wait-promotable@.service
+index 81c3789f..3416abc6 100644
+--- a/scripts/drbd-wait-promotable@.service
++++ b/scripts/drbd-wait-promotable@.service
+@@ -10,7 +10,7 @@ Type=oneshot
+ 
+ # on first start, wait for access to "good data"
+ # let systemd handle timeouts
+-ExecStart=/lib/drbd/scripts/drbd-wait-promotable.sh %I
++ExecStart=@nonarch_libdir@/drbd/scripts/drbd-wait-promotable.sh %I
+ RemainAfterExit=yes
+ 
+ [Install]
+diff --git a/scripts/drbd.service b/scripts/drbd.service
+index 96c599e7..c81e95a6 100644
+--- a/scripts/drbd.service
++++ b/scripts/drbd.service
+@@ -12,11 +12,11 @@ RemainAfterExit=yes
+ # A check for INIT_VERSION already exists, just set it to something.
+ Environment=INIT_VERSION=systemd
+ 
+-ExecStart=/lib/drbd/scripts/drbd start
+-ExecStop=/lib/drbd/scripts/drbd stop
++ExecStart=@nonarch_libdir@/drbd/scripts/drbd start
++ExecStop=@nonarch_libdir@/drbd/scripts/drbd stop
+ 
+ # Re-adjust everything on reload
+-ExecReload=/lib/drbd/scripts/drbd reload
++ExecReload=@nonarch_libdir@/drbd/scripts/drbd reload
+ 
+ [Install]
+ WantedBy=multi-user.target
+diff --git a/scripts/drbd@.service b/scripts/drbd@.service
+index 76514c5b..e2e500ba 100644
+--- a/scripts/drbd@.service
++++ b/scripts/drbd@.service
+@@ -35,8 +35,8 @@ RemainAfterExit=yes
+ 
+ # depends... do we want this as ExecCondition or as ExecStart
+ # failed start is "failed", failed condition is just "not startable yet"
+-ExecStart=/lib/drbd/scripts/drbd-service-shim.sh adjust %I
+-ExecReload=/lib/drbd/scripts/drbd-service-shim.sh adjust %I
++ExecStart=@nonarch_libdir@/drbd/scripts/drbd-service-shim.sh adjust %I
++ExecReload=@nonarch_libdir@/drbd/scripts/drbd-service-shim.sh adjust %I
+ 
+ # can only succeed, if you first stop all depending services
+-ExecStopPost=/lib/drbd/scripts/drbd-service-shim.sh down %I
++ExecStopPost=@nonarch_libdir@/drbd/scripts/drbd-service-shim.sh down %I
+diff --git a/scripts/ocf.ra@.service b/scripts/ocf.ra@.service
+index 9c2268a6..1666c482 100644
+--- a/scripts/ocf.ra@.service
++++ b/scripts/ocf.ra@.service
+@@ -22,5 +22,5 @@ Environment=monitor_inverval=30
+ # Only the first argument is used by the wrapper,
+ # the %n is just to identify which is which in the process list.
+ # All parameterization is done via Environment= in per instance override.conf
+-ExecStart=/lib/drbd/scripts/ocf.ra.wrapper.sh start-and-monitor %n
+-ExecStopPost=/lib/drbd/scripts/ocf.ra.wrapper.sh stop %n
++ExecStart=@nonarch_libdir@/drbd/scripts/ocf.ra.wrapper.sh start-and-monitor %n
++ExecStopPost=@nonarch_libdir@/drbd/scripts/ocf.ra.wrapper.sh stop %n
 diff --git a/user/v83/Makefile.in b/user/v83/Makefile.in
 index 08cfe574..4c4971b6 100644
 --- a/user/v83/Makefile.in
@@ -111,5 +200,5 @@ index 0fcefc5f..81f7d5ec 100644
  spell:
  	for f in drbdadm_adjust.c drbdadm_main.c drbdadm_parser.c drbdadm_usage_cnt.c drbdsetup.c drbdtool_common.c; do \
 -- 
-2.33.0
+2.25.1
 
diff --git a/meta-networking/recipes-support/drbd/drbd-utils_9.20.2.bb b/meta-networking/recipes-support/drbd/drbd-utils_9.20.2.bb
index 640e4e785..deaab641e 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils_9.20.2.bb
+++ b/meta-networking/recipes-support/drbd/drbd-utils_9.20.2.bb
@@ -10,9 +10,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
 
 SRC_URI = "git://github.com/LINBIT/drbd-utils;name=drbd-utils;branch=${PV};protocol=https \
            git://github.com/LINBIT/drbd-headers;name=drbd-headers;destsuffix=git/drbd-headers;branch=master;protocol=https \
-           ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','file://0001-drbd-utils-support-usrmerge.patch','',d)} \
            file://0001-drbdmon-add-LDFLAGS-when-linking.patch \
-          "
+           ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','file://0001-drbd-utils-support-usrmerge.patch','',d)} \
+           "
+
 SRCREV_drbd-utils = "087ee6b4961ca154d76e4211223b03149373bed8"
 SRCREV_drbd-headers = "f1529aa84e9d2f66c96ad283a1bbb708aabf03f7"
 
@@ -47,6 +48,13 @@ do_install:append() {
     # don't install empty /var/lock and /var/run to avoid conflict with base-files
     rm -rf ${D}${localstatedir}/lock
     rm -rf ${D}${localstatedir}/run
+
+    sed -i -e 's#@nonarch_libdir@#${nonarch_libdir}#g' ${D}${systemd_unitdir}/system/drbd-demote-or-escalate@.service
+    sed -i -e 's#@nonarch_libdir@#${nonarch_libdir}#g' ${D}${systemd_unitdir}/system/drbd-promote@.service
+    sed -i -e 's#@nonarch_libdir@#${nonarch_libdir}#g' ${D}${systemd_unitdir}/system/drbd-wait-promotable@.service
+    sed -i -e 's#@nonarch_libdir@#${nonarch_libdir}#g' ${D}${systemd_unitdir}/system/drbd.service
+    sed -i -e 's#@nonarch_libdir@#${nonarch_libdir}#g' ${D}${systemd_unitdir}/system/drbd@.service
+    sed -i -e 's#@nonarch_libdir@#${nonarch_libdir}#g' ${D}${systemd_unitdir}/system/ocf.ra@.service
 }
 
 RDEPENDS:${PN} += "bash perl-module-getopt-long perl-module-exporter perl-module-constant perl-module-overloading perl-module-exporter-heavy"
-- 
2.25.1


