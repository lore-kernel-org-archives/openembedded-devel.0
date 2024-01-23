Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94B8EC46CD2
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 00:58:14 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.371.1705971488164605279
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 16:58:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="148601689"
X-IronPort-AV: E=Sophos;i="6.05,212,1701097200"; 
   d="scan'208";a="148601689"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 09:58:05 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id E23D0D4F5A
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 09:58:02 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 27962F966
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 09:58:02 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9743F20079DF4
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 09:58:01 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 489E51A006A;
	Tue, 23 Jan 2024 08:58:01 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] gcr3: upgrade 3.41.1 -> 3.41.2
Date: Tue, 23 Jan 2024 08:57:50 +0800
Message-Id: <1705971470-24422-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28136.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28136.003
X-TMASE-Result: 10--2.921300-10.000000
X-TMASE-MatchedRID: sujxEcxUy52jz0nOeth/yWY+xOrx57jW9luJE23VaKgyKRnX9xPs4K4r
	mQIDoB6SJ2o10m2bLBJWHRJce9SPC63foTno8oX3Zy/08A2dD0hMkOX0UoduuWAN6i+va16u0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q2VUcz8XpiS9Fn4Ir4HFD2TRZrOmBLNtw8h+T
	SONOzxwToZeeM60efyH6FmqkQO4soK011Ivs0zFINraaMEw/VaSqC7d6NxTmN9avChsELqKAOiV
	FpF7nSJW1oKOkluHRw8uK+GDY7ZGQm5tOOdRlSN3QqJN4m15UF9LQinZ4QefPcjNeVeWlqY+gtH
	j7OwNO2i5u/VvsFaHSF+bY57l0TWlQKgDq+klE4MO0dFTgmZFkYZBTIwH8grjk0wBdrjah4gpJe
	h62JyBFmvNJheYLlqWBnrw0FdsCsMqC7E0K5icvIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uAB
	Di47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 00:58:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108381

From: Wang Mingyu <wangmy@fujitsu.com>

0001-meson.build-correctly-handle-disabled-ssh_agent-opti.patch
refreshed for 3.41.2

Changelog:
============
- ui: Add gcr.gresource.xml back into the build
- misc: Several memory leaks were fixed
- ci: Several CI fixes
- Updated translations

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...orrectly-handle-disabled-ssh_agent-opti.patch | 16 +++++++---------
 .../gcr/{gcr3_3.41.1.bb => gcr3_3.41.2.bb}       |  2 +-
 2 files changed, 8 insertions(+), 10 deletions(-)
 rename meta-oe/recipes-gnome/gcr/{gcr3_3.41.1.bb => gcr3_3.41.2.bb} (95%)

diff --git a/meta-oe/recipes-gnome/gcr/gcr3/0001-meson.build-correctly-handle-disabled-ssh_agent-opti.patch b/meta-oe/recipes-gnome/gcr/gcr3/0001-meson.build-correctly-handle-disabled-ssh_agent-opti.patch
index d3c26d97a..2b2baf772 100644
--- a/meta-oe/recipes-gnome/gcr/gcr3/0001-meson.build-correctly-handle-disabled-ssh_agent-opti.patch
+++ b/meta-oe/recipes-gnome/gcr/gcr3/0001-meson.build-correctly-handle-disabled-ssh_agent-opti.patch
@@ -1,7 +1,7 @@
-From 9b67bb18d8409e0e693cc6000507acbd73a30eab Mon Sep 17 00:00:00 2001
+From 2618ab101f5faaa887c9feeeee84a7d8bc97cbda Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 16 Nov 2022 11:27:24 +0100
-Subject: [PATCH 1/2] meson.build: correctly handle disabled ssh_agent option
+Subject: [PATCH] meson.build: correctly handle disabled ssh_agent option
 
 Existing code produces these errors:
 | gcr/meson.build:61:0: ERROR: Unable to get the path of a not-found external program
@@ -10,15 +10,16 @@ Existing code produces these errors:
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
 
 Upstream-Status: Backport [ https://gitlab.gnome.org/GNOME/gcr/-/commit/9b67bb18d8409e0e693cc6000507acbd73a30eab ]
+
 ---
- meson.build | 12 ++++++++----
- 1 file changed, 8 insertions(+), 4 deletions(-)
+ meson.build | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 3f35173..11d7fa7 100644
+index dd890a9..1b17b18 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -96,8 +98,10 @@ conf.set('HAVE_TIMEGM', cc.has_function('timegm'))
+@@ -82,8 +82,10 @@ conf.set('HAVE_TIMEGM', cc.has_function('timegm'))
  conf.set('HAVE_MLOCK', cc.has_function('mlock'))
  conf.set_quoted('GPG_EXECUTABLE', gpg_path)
  conf.set_quoted('LIBGCRYPT_VERSION', libgcrypt_dep.version())
@@ -31,6 +32,3 @@ index 3f35173..11d7fa7 100644
  conf.set10('WITH_SYSTEMD', with_systemd)
  config_file = configure_file(
    output: 'config.h',
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-gnome/gcr/gcr3_3.41.1.bb b/meta-oe/recipes-gnome/gcr/gcr3_3.41.2.bb
similarity index 95%
rename from meta-oe/recipes-gnome/gcr/gcr3_3.41.1.bb
rename to meta-oe/recipes-gnome/gcr/gcr3_3.41.2.bb
index b3438b4e6..0fd30f742 100644
--- a/meta-oe/recipes-gnome/gcr/gcr3_3.41.1.bb
+++ b/meta-oe/recipes-gnome/gcr/gcr3_3.41.2.bb
@@ -23,7 +23,7 @@ UPSTREAM_CHECK_REGEX = "[^\d\.](?P<pver>3.(?!9\d+)\d+(\.\d+)+)\.tar"
 
 SRC_URI = "https://download.gnome.org/sources/gcr/3.41/gcr-${PV}.tar.xz;name=archive"
 SRC_URI += "file://0001-meson.build-correctly-handle-disabled-ssh_agent-opti.patch"
-SRC_URI[archive.sha256sum] = "bb7128a3c2febbfee9c03b90d77d498d0ceb237b0789802d60185c71c4bea24f"
+SRC_URI[archive.sha256sum] = "bad10f3c553a0e1854649ab59c5b2434da22ca1a54ae6138f1f53961567e1ab7"
 
 S = "${WORKDIR}/gcr-${PV}"
 
-- 
2.34.1


