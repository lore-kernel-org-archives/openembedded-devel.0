Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 837A4C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 00:41:47 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web12.3933.1647909705774897875
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Mar 2022 17:41:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=CHUaKqSV;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647909703; i=@fujitsu.com;
	bh=eHw9pNQJ5HdyWIaECumMVBLIwoaA7PfGTf2m07tkS8A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=CHUaKqSVkKNeMMZJ3NpciNzjkbUfcnrJ5X6BNsLnETDISZuDh0EELY1qAkRXmZQCo
	 dNpEmj3qIvKPFl00l1rNgrUm3tVHzJw2OFTFyOoE811nVyLJ1/dx/pO5ximg/OWzta
	 5OzZYYTegULZjOdGf1GYjlyGM4k8nN4kUAD15cSj7EcTl18YUk3BWzoW5d8XH4ubty
	 lvsVvtdXdlcCQ+gMbV6R1broh5hEjo2+R30+M03eDOE+roU3m2yaq9xxOZE6LkVQ5z
	 OaXCFU4FpAhAz63YJjhjzau+SyExiYdBGbARfLVWTdOku6sucGPZAAG6fSdttHrN3f
	 /vAHFpX6pJ+XA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MRousqbZl
  ksHaXssXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmtHxJavgpXjFko8VDYwnRLsYuTiEBGYySWzd
  dpMRwtnDKHHhSQtzFyMnB5uAmsT0WzdYQWwRAX2JpbP3gMWZBVQkXvzuYe9i5OAQFvCWmLJUF
  iTMIqAq8XnxHkYQm1fAUWLrrj42EFtCQEFiysP3zBBxQYmTM5+wQIyRkDj44gUzRI2ixOzLzS
  wQdoXErFltTBMYeWchaZmFpGUBI9MqRqukosz0jJLcxMwcXUMDA11DQ1NdY0tdUyO9xCrdRL3
  UUt3y1OISXSC3vFgvtbhYr7gyNzknRS8vtWQTIzC8UorVTXYwdq/8qXeIUZKDSUmU98VDiyQh
  vqT8lMqMxOKM+KLSnNTiQ4wyHBxKErxvxC2ThASLUtNTK9Iyc4ChDpOW4OBREuHl/wDUyltck
  JhbnJkOkTrFqCglzntaCqhPACSRUZoH1waLr0uMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhH
  lvSQJN4cnMK4Gb/gpoMRPQYn1WM5DFJYkIKakGJmE257mJtR9Kbs/fJmyXlb/+aPXvTPNrt58
  3iv3e63K8e15nrgXbTyvDn3vyhBWu+TBKdtcnpd3R/rjF46LyWTungIyzRTqvsuoNlQxmsH/c
  d/jD57dBi/8tPZ158db1BPZvc/5MM5oZLLug37FSg1fk3vEPjGln0lQuzPx4L5+X7RzTi6sig
  jFe0wsEbl5XEpia/rYs6RX3959uMw+Gb1n35o6ExU+l3DArgaDwUwaMh5233DCs2/dBhMtR+K
  OWo51imdOXG3OCCyR/uqpc03t42tbRQpbxiljLWp9PfgFNdowH7Q53VV8yCDSYMkFSSdl+k07
  i4dPGNW2m19b+e9ltV3UrfN/SylvL8yZuVGIpzkg01GIuKk4EAPG5IEIqAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-571.messagelabs.com!1647909701!267432!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4563 invoked from network); 22 Mar 2022 00:41:41 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-14.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Mar 2022 00:41:41 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 22M0fbin027104
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 00:41:41 GMT
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 22 Mar 2022 00:41:36 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gnome-disk-utility: upgrade 41.0 -> 42.0
Date: Tue, 22 Mar 2022 08:41:24 +0800
Message-ID: <1647909686-2107-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Mar 2022 00:41:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96119

0001-build-fix-arguments-of-i18n.merge_file.patch
removed since it's include din 42.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ild-fix-arguments-of-i18n.merge_file.patch | 34 -------------------
 ...ity_41.0.bb => gnome-disk-utility_42.0.bb} |  3 +-
 2 files changed, 1 insertion(+), 36 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0001-build-fix-arguments-of-i18n.merge_file.patch
 rename meta-gnome/recipes-gnome/gnome-disk-utility/{gnome-disk-utility_41.0.bb => gnome-disk-utility_42.0.bb} (82%)

diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0001-build-fix-arguments-of-i18n.merge_file.patch b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0001-build-fix-arguments-of-i18n.merge_file.patch
deleted file mode 100644
index 2758af5079..0000000000
--- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0001-build-fix-arguments-of-i18n.merge_file.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 629ca0e61bb59303d43d7eac44a47ae866cc78f0 Mon Sep 17 00:00:00 2001
-From: rvalue <i@rvalue.moe>
-Date: Fri, 17 Dec 2021 12:29:30 +0000
-Subject: [PATCH] build: fix arguments of i18n.merge_file
-
-`i18n.merge_file` has been ignoring positional arguments for a time
-and explicitly rejects with error since meson 0.60.0
-
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- data/meson.build | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/data/meson.build b/data/meson.build
-index e38a1d8..38fb520 100644
---- a/data/meson.build
-+++ b/data/meson.build
-@@ -11,7 +11,6 @@ desktops = [
- 
- foreach desktop: desktops
-   i18n.merge_file (
--    desktop,
-     type: 'desktop',
-     input: desktop + '.in',
-     output: desktop,
-@@ -38,7 +37,6 @@ install_data(
- info = 'org.gnome.DiskUtility.appdata.xml'
- 
- i18n.merge_file(
--  info,
-   input: info + '.in',
-   output: info,
-   po_dir: po_dir,
diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_41.0.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_42.0.bb
similarity index 82%
rename from meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_41.0.bb
rename to meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_42.0.bb
index 6bb69853a7..e9724748ca 100644
--- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_41.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_42.0.bb
@@ -26,8 +26,7 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 # As soon as elogind is of interest this needs rework: meson option is combo
 PACKAGECONFIG[systemd] = "-Dlogind=libsystemd,-Dlogind=none,systemd"
 
-SRC_URI += " file://0001-build-fix-arguments-of-i18n.merge_file.patch"
-SRC_URI[archive.sha256sum] = "8743c98fd656062ef862933efe30c5be4c6b322ec02eee154ec70d08ed0895df"
+SRC_URI[archive.sha256sum] = "1b6564454d67426322cb3bfc5a5558653bfc7dfeea2ae0825b1d08629f01090b"
 
 EXTRA_OEMESON = "-Dman=false"
 
-- 
2.25.1


