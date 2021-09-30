Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38451C433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Sep 2021 05:54:53 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.4])
 by mx.groups.io with SMTP id smtpd.web10.8688.1632981291680340816
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Sep 2021 22:54:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=bgdLQcG9;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.4,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1632981289; i=@fujitsu.com;
	bh=z+SZbOtrd5avhB5VtcoUmuozCRhThQjenQeT3ZWCYBg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=bgdLQcG9JvTeonEki9tc2RjKYlwiygdm5OUKNbT/a7eu/UeH59SXUbu24PGzsoClk
	 Sf0Yayk0h2kOgCJIFt8pT8IwyHmhev3d8FtQ77z/5Wh2QzUyI7yldIP4PMt0nB19ke
	 8KcaAvpsajnCINw6O8CSVWKghwAn5vVekX+KgvYUkqPeIpFezfa0+EZz2JyL6TexRr
	 v/RaFwOBmAbeO7rgiKhYOPImkMipmv6ev9FERoOABzLkPCB0d86G13qrP0E9eXB1jH
	 Bs5oE8HpQiQYnSRfFwpiYqtWYiDXY7xCXXKCopWnuRnNeasXPAocgcRfJWGl7lhlpZ
	 in+Vlq6RhXq7A==
Received: from [100.112.195.47] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.symcld.net id 06/76-02380-82155516;
 Thu, 30 Sep 2021 05:54:48 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8MxVVcjMDT
  RYP1cAYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWP3xWbGgv2yFV+/HmVuYHwj2cXIxSEkMJtJ
  ontVMxOEs4dRom3VXZYuRk4ONgFdiXOP17KD2CIC+hJLZ+9hBrGFBWwkbs/cwAhiswioShz5P
  AeshlfAQ6KpsxesV0JAQWLKw/fMEHFBiZMzn4DFmQUkJA6+eAEU5wCqUZSYPV0eorxC4vXhS8
  wTGHlmIemYhaRjASPTKkaLpKLM9IyS3MTMHF1DAwNdQ0MjXUNLU10jQ1O9xCrdRL3UUt3y1OI
  SXUO9xPJiveLK3OScFL281JJNjMAwSik4fH0H463XH/QOMUpyMCmJ8ir6hCYK8SXlp1RmJBZn
  xBeV5qQWH2KU4eBQkuAV9wfKCRalpqdWpGXmAEMaJi3BwaMkwrvdDyjNW1yQmFucmQ6ROsUYy
  /Hu5+JFzBxv1i4Bkm/BZNu9u0CyHUzOXHBwNTPHLDB5v/0QkHwAIoVY8vLzUqXEeSW8gYYKgA
  zNKM2DWwmL30uMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHntAoCm8GTmlcBd9groaCago7P
  aQ0COLklESEk1MLkH7I75/vvwC1Xtqa2t2q5TExZx/j3OyrImaLt75sXSwwefP9q7ccr9C2v8
  o+40HWHeut872329rZj+27jrCtM8nqueF/d8GXjpNNOCydqNjxjnXPC7cqT2UWtjjZxO7bkdq
  2z2qrQ8TpSq8KnZUPKyUL/2pHmO49YJXpyvXqwV85Waq/6f10mp5MlSg09tnHf4/AOeTmuaHN
  P/3vPXV5HDkxadVdHX2/ryge9GPmsl5pLqS30lAteX3q9ec8im5+yp7PdnN1+r97jpf0RLRD+
  klG93idLdzqmZXLVyM2OlJl1Nmi3yz/ToiswHEwSC+rZsnD57wpE18+41Os2641Lg8U1BbaGb
  eIubnPT1G1uVWIozEg21mIuKEwEYeik9WgMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-20.tower-271.messagelabs.com!1632981287!190332!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21268 invoked from network); 30 Sep 2021 05:54:48 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-20.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 Sep 2021 05:54:48 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18U5slFP014701
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Sep 2021 06:54:47 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Thu, 30 Sep 2021 06:54:45 +0100
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] gpsd: upgrade 3.23 -> 3.23.1
Date: Thu, 30 Sep 2021 22:54:39 +0800
Message-ID: <1633013679-14535-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Sep 2021 05:54:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93178

3.23.1: 2021-09-21
  Improve ubx cycle detection.
  Add quirks for Jackson Labs nonstandard NMEA
  Change STATUS_NO_FIX to STATUS_UNK to avoid confusion with fix mode.
  Change STATUS_FIX to STATUS_GPS to avoid confusion with fix mode.
  Change STATUS_DGPS_FIX to STATUS_DGPS to avoid confusion with fix mode.
  Split SOURCE_ACM from SOURCE_USB.  ACM has no speeds.
  Add speeds 1 mbps, 1.152 mbps, 1.5 mbps, and higher.  When libc supports them.
  Improve autobaud.
  Add new u-blox M10 messages.
  Fix u-blox M6, M7 initialization issues.
  Various ubxtool and gpxlogger updates.
  Add mtk3301_speed_switcher()
  No API, ABI changes.
  Fallback to "python3" if "python" not found.

0001-SConscript-Correct-the-installation-of-gpsd.hotplug.patch
removed since it is included in 3.23.1

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...ect-the-installation-of-gpsd.hotplug.patch | 29 -------------------
 .../gpsd/{gpsd_3.23.bb => gpsd_3.23.1.bb}     |  8 ++---
 2 files changed, 3 insertions(+), 34 deletions(-)
 delete mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/0001-SConscript-Correct-the-installation-of-gpsd.hotplug.patch
 rename meta-oe/recipes-navigation/gpsd/{gpsd_3.23.bb => gpsd_3.23.1.bb} (94%)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd/0001-SConscript-Correct-the-installation-of-gpsd.hotplug.patch b/meta-oe/recipes-navigation/gpsd/gpsd/0001-SConscript-Correct-the-installation-of-gpsd.hotplug.patch
deleted file mode 100644
index 172f47825f..0000000000
--- a/meta-oe/recipes-navigation/gpsd/gpsd/0001-SConscript-Correct-the-installation-of-gpsd.hotplug.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From c7183b2cc4a42f6ca7c2dc687ee7881efe9aeb73 Mon Sep 17 00:00:00 2001
-From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
-Date: Sat, 28 Aug 2021 14:22:02 +0200
-Subject: [PATCH] SConscript: Correct the installation of gpsd.hotplug
-
-Without this, `scons systemd=false && scons udev-install` fails with:
-
-  cp .../gpsd/gpsd-3.23.1~dev/gpsd.hotplug /home/pkj/gpsd/foobar/lib/udev
-  cp: cannot stat '.../gpsd/gpsd-3.23.1~dev/gpsd.hotplug': No such file or directory
-
-Upstream-Status: Submitted [https://gitlab.com/gpsd/gpsd/-/merge_requests/277]
-Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
----
- SConscript | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/SConscript b/SConscript
-index 1cd3354e1..e578012f5 100644
---- a/SConscript
-+++ b/SConscript
-@@ -3060,7 +3060,7 @@ if env['systemd']:
-     hotplug_wrapper_install = []
- else:
-     hotplug_wrapper_install = [
--        'cp $SRCDIR/gpsd.hotplug ' + DESTDIR + env['udevdir'],
-+        'cp $SRCDIR/../gpsd.hotplug ' + DESTDIR + env['udevdir'],
-         'chmod a+x ' + DESTDIR + env['udevdir'] + '/gpsd.hotplug'
-     ]
- 
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.23.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb
similarity index 94%
rename from meta-oe/recipes-navigation/gpsd/gpsd_3.23.bb
rename to meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb
index aaf7429291..eb3dc30e4f 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.23.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb
@@ -6,11 +6,9 @@ DEPENDS = "dbus ncurses python3 pps-tools"
 PROVIDES = "virtual/gpsd"
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
-    file://0001-SConscript-Correct-the-installation-of-gpsd.hotplug.patch \
-    file://gpsd.init \
-"
-SRC_URI[md5sum] = "b4f96cb01cbc06542b1cb66b3296078d"
-SRC_URI[sha256sum] = "522c2362a7eb2d7ac37eaa1504f12aded1c373479a87ba06cc6795974b567bbc"
+           file://gpsd.init \
+           "
+SRC_URI[sha256sum] = "0b991ce9a46538c4ea450f7a8ee428ff44fb4f8d665fddf2ffe40fe0ae9a6c09"
 
 inherit scons update-rc.d python3-dir python3native systemd update-alternatives
 
-- 
2.25.1


