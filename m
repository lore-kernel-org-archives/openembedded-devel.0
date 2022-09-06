Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AB6AC6FA83
	for <webhook@archiver.kernel.org>; Tue,  6 Sep 2022 05:32:43 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web11.603.1662442356354110051
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Sep 2022 22:32:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=U2vgLBGM;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1662442356; i=@fujitsu.com;
	bh=LsaE0xYFlF86XCodC7GkNEgTV6G7bHlCG4TZ5TJJ7XI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=U2vgLBGM4FvFs/Ep9+MscNPNJwFGNdfg5twFnB0USsw6iWRC3hTSjXDx8MRqw7VjV
	 hw8qOs1LFDG00XTB4p6W163yxcoQ9PM0/0ovFHdrbFFTX7ZzzlnZtRfjGkLf2U7DX9
	 ZwW/cLluW84Mv1TK7KLXnDHXH+xrG63amN+yBReZ3YJLBboDaf/EzR5/ph9QJt6EUZ
	 8tX2pT5EDcCKr117XtEK1ov0iB1ulaLHLcx6pZ8q7X7WjWvX4wiBMq/ckAbAKxulg1
	 21iokRRAoJ+SKytda3gHuDVUwRVfHIuEFyAJdAnbnVVvXtokxh5xnjviXo6dqFUGcJ
	 Up2mIvEwoTO/w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBIsWRWlGSWpSXmKPExsViZ8OxWbf4tli
  ywZ/F5hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b72xIFfw0qOrd/ZGtgfKLdxcjFISTwkFHi
  6KHtTBDOFSaJiZ+eMEI4uxkl9kx5z9bFyMnBJqAmMf3WDVYQW0RAX2Lp7D3MIDazgIrEi9897
  CC2sICvxPV3a1lAbBag+LO7PUwgNq+Ao8Sz2+vA6iUEFCSmPHwPZnMKOEmcerMDbKYQUE3vmk
  mMEPWCEidnPmGBmC8hcfDFC6heRYnZl5tZIOwKicbph5ggbDWJq+c2MU9gFJyFpH0WkvYFjEy
  rGK2SijLTM0pyEzNzdA0NDHQNDU11DXSNDE31Eqt0E/VSS3XLU4tLdA31EsuL9VKLi/WKK3OT
  c1L08lJLNjECgzilmOH6DsaJfT/1DjFKcjApifL+2yiWLMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ
  0mCd+11oJxgUWp6akVaZg4womDSEhw8SiK8TueB0rzFBYm5xZnpEKlTjPYcHw5d2cvMMXX2v/
  3MHMvB5MyvbQeYhVjy8vNSpcR5L98EahMAacsozYMbCksAlxhlpYR5GRkYGIR4ClKLcjNLUOV
  fMYpzMCoJ894DmcKTmVcCt/sV0FlMQGfZ9QmDnFWSiJCSamCaW//gb3iLW6qrslU1+8Rd/Jyl
  y/LL1xqELr/F1JRztWPTG4GtdpPaI3zP76+o9Px84ymH1uHd+k1iX3/un/CZb4JV+RSPP6Y+s
  kZpSV/vvAi+/6dbQFuFa2cCx9eKV2uPf745b+V0oc3iO7avX7P0jUir5eR7cuv2OIbMZGvKmi
  D0waZC61Wq01u2husZct1NssG7Y+bM6GxZ4yqgbyo6+4Di4SsaHxQYL9XNdZ2luP+xDP+BbH+
  tzLRH2YkNM4VaDmya9DehWN44+RyzzdyLP5IlgjS1w3/OqjDLvZkSve3Yj2k+Uf/5eyPm/3lU
  KCvzse/LyQXiLLqfN0Sc/6W286P9W/FZKvuFnp6vcmRXYinOSDTUYi4qTgQAiBD1MnsDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-591.messagelabs.com!1662442355!202483!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12019 invoked from network); 6 Sep 2022 05:32:35 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-19.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Sep 2022 05:32:35 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 83F8C151
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  6 Sep 2022 06:32:35 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 76F98150
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  6 Sep 2022 06:32:35 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 6 Sep 2022 06:32:33 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] lvm2/libdevmapper: upgrade 2.03.11 -> 2.03.16
Date: Tue, 6 Sep 2022 13:32:15 +0800
Message-ID: <1662442335-7255-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1662442335-7255-1-git-send-email-wangmy@fujitsu.com>
References: <1662442335-7255-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Sep 2022 05:32:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98676

0005-do-not-build-manual.patch
0006-start-lvm2-monitor.service-after-tmp.mount.patch
refreshed for new version.

Add bash to RDEPENDS.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../lvm2/files/0005-do-not-build-manual.patch | 23 ++++++++++---------
 ...lvm2-monitor.service-after-tmp.mount.patch | 11 +++++----
 ...per_2.03.11.bb => libdevmapper_2.03.16.bb} |  0
 meta-oe/recipes-support/lvm2/lvm2.inc         |  2 +-
 .../lvm2/{lvm2_2.03.11.bb => lvm2_2.03.16.bb} |  1 +
 5 files changed, 21 insertions(+), 16 deletions(-)
 rename meta-oe/recipes-support/lvm2/{libdevmapper_2.03.11.bb => libdevmapper_2.03.16.bb} (100%)
 rename meta-oe/recipes-support/lvm2/{lvm2_2.03.11.bb => lvm2_2.03.16.bb} (99%)

diff --git a/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch b/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch
index 7117d99a39..7979efbefb 100644
--- a/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch
+++ b/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch
@@ -15,25 +15,26 @@ Upstream-Status: Pending
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 
-
 Update context for lvm2 2.03.02.
-
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+Update context for lvm2 2.03.16.
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
 ---
  Makefile.in  | 6 +++---
  configure.ac | 1 -
  2 files changed, 3 insertions(+), 4 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 6a1a990..80cba91 100644
+index 3b7e0ec..37f14eb 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -18,7 +18,7 @@ top_builddir = @top_builddir@
  abs_top_builddir = @abs_top_builddir@
  abs_top_srcdir = @abs_top_srcdir@
  
--SUBDIRS = conf daemons include lib libdaemon libdm man scripts tools
-+SUBDIRS = conf daemons include lib libdaemon libdm scripts tools
+-SUBDIRS = libdm conf daemons include lib libdaemon man scripts tools
++SUBDIRS = libdm conf daemons include lib libdaemon scripts tools
  
  ifeq ("@UDEV_RULES@", "yes")
    SUBDIRS += udev
@@ -46,20 +47,20 @@ index 6a1a990..80cba91 100644
      libdaemon lib tools daemons libdm \
      udev po
  tools.distclean: test.distclean
-@@ -65,7 +65,7 @@ libdm.device-mapper: include.device-mapper
+@@ -59,7 +59,7 @@ unit-test  run-unit-test: test
+ 
  daemons.device-mapper: libdm.device-mapper
  tools.device-mapper: libdm.device-mapper
- scripts.device-mapper: include.device-mapper
 -device-mapper: tools.device-mapper daemons.device-mapper man.device-mapper
 +device-mapper: tools.device-mapper daemons.device-mapper
+ device_mapper: device-mapper
  
  ifeq ("@INTL@", "yes")
- lib.pofile: include.pofile
 diff --git a/configure.ac b/configure.ac
-index 7fd0561..4154dc0 100644
+index 6def519..18a5c97 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1812,7 +1812,6 @@ libdaemon/server/Makefile
+@@ -2018,7 +2018,6 @@ libdaemon/server/Makefile
  libdm/Makefile
  libdm/dm-tools/Makefile
  libdm/libdevmapper.pc
@@ -68,5 +69,5 @@ index 7fd0561..4154dc0 100644
  scripts/lvm2-pvscan.service
  scripts/blkdeactivate.sh
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta-oe/recipes-support/lvm2/files/0006-start-lvm2-monitor.service-after-tmp.mount.patch b/meta-oe/recipes-support/lvm2/files/0006-start-lvm2-monitor.service-after-tmp.mount.patch
index 9f9383ef48..5b9b2d5748 100644
--- a/meta-oe/recipes-support/lvm2/files/0006-start-lvm2-monitor.service-after-tmp.mount.patch
+++ b/meta-oe/recipes-support/lvm2/files/0006-start-lvm2-monitor.service-after-tmp.mount.patch
@@ -11,23 +11,26 @@ Upstream-Status: Inappropriate [oe specific]
 
 Rebase to v2_03_05
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+Rebase to v2_03_16
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
 ---
  scripts/lvm2_monitoring_systemd_red_hat.service.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/scripts/lvm2_monitoring_systemd_red_hat.service.in b/scripts/lvm2_monitoring_systemd_red_hat.service.in
-index 4bf744a..46766cb 100644
+index c0c96e3..2a99a37 100644
 --- a/scripts/lvm2_monitoring_systemd_red_hat.service.in
 +++ b/scripts/lvm2_monitoring_systemd_red_hat.service.in
 @@ -2,7 +2,7 @@
  Description=Monitoring of LVM2 mirrors, snapshots etc. using dmeventd or progress polling
  Documentation=man:dmeventd(8) man:lvcreate(8) man:lvchange(8) man:vgchange(8)
  Requires=dm-event.socket
--After=dm-event.socket dm-event.service lvm2-activation.service
-+After=dm-event.socket dm-event.service lvm2-activation.service tmp.mount
+-After=dm-event.socket dm-event.service
++After=dm-event.socket dm-event.service tmp.mount
  Before=local-fs-pre.target shutdown.target
  DefaultDependencies=no
  Conflicts=shutdown.target
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta-oe/recipes-support/lvm2/libdevmapper_2.03.11.bb b/meta-oe/recipes-support/lvm2/libdevmapper_2.03.16.bb
similarity index 100%
rename from meta-oe/recipes-support/lvm2/libdevmapper_2.03.11.bb
rename to meta-oe/recipes-support/lvm2/libdevmapper_2.03.16.bb
diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 0c593b2042..34e57ec7a5 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -18,7 +18,7 @@ SRC_URI = "git://sourceware.org/git/lvm2.git;branch=main \
            file://reproducible-build.patch \
            "
 
-SRCREV = "3e8bd8d1bd70691f09a170785836aeb4f83154e6"
+SRCREV = "6d1e894a867681af7a811ed63bc435f3aa55fec8"
 S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\_\d+)+)"
diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.03.11.bb b/meta-oe/recipes-support/lvm2/lvm2_2.03.16.bb
similarity index 99%
rename from meta-oe/recipes-support/lvm2/lvm2_2.03.11.bb
rename to meta-oe/recipes-support/lvm2/lvm2_2.03.16.bb
index a729324c9b..6a6cdc7cef 100644
--- a/meta-oe/recipes-support/lvm2/lvm2_2.03.11.bb
+++ b/meta-oe/recipes-support/lvm2/lvm2_2.03.16.bb
@@ -68,6 +68,7 @@ FILES:${PN}-scripts = " \
 # Specified explicitly for the udev rules, just in case that it does not get picked
 # up automatically:
 FILES:${PN}-udevrules = "${nonarch_base_libdir}/udev/rules.d"
+RDEPENDS:${PN} = "bash"
 RDEPENDS:${PN}-udevrules = "libdevmapper"
 RDEPENDS:${PN}:append:class-target = " libdevmapper"
 RDEPENDS:${PN}:append:class-nativesdk = " libdevmapper"
-- 
2.25.1


