Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F198BC433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 00:09:33 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web08.3627.1647907772629219147
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Mar 2022 17:09:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Q80re43Q;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647907770; i=@fujitsu.com;
	bh=C2/dZTOCfa9/uxX3dbW9voPjeQfsauKLZsklogo+o94=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Q80re43Q7dxJvDrft1vJ4WquCuJ1WrMlom/wcYxuJtwkeD1kBe6kteezCEmwMFXPj
	 Ytrq9TcUXEOhWrbjJOqsgsJtd2hjDWyI6b3NCFjuNZjGxVPNwuLYRqnQBJpTgsRtIh
	 pqX220PZtSX1CLNSGnGtKGCfD7mjJwUIQX8S509YdrWsFqYer2Ty/Hi8VJo/AIpMUn
	 yc1k2PHnHI8WTpxrtNc+A2gf9KJLP4SvET/F3NpnRKCm7bUBWxt++K+vMU4gm6mdXv
	 0WGms4j4rleLWty2iwN1Dq71ksVkgs7MOJ+TMIqvbrHTGs4wywV2Sgt7r2iOJyq88l
	 Yt37ObBwPdS1g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8MxRXeXsGW
  SwdVmVouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeNWdw9zQYdExd6/C5gbGO+IdjFycQgJzGSS
  mPNyKyuEs4dR4sm/RsYuRk4ONgE1iem3brCC2CIC+hJLZ+9hBrGZBVQkXvzuYe9i5OAQFnCU+
  LrPESTMIqAqsbxvETuIzQsUnvT0GxuILSGgIDHl4XuwVk4BJ4nrC9qYQFqFgGpmvK+BKBeUOD
  nzCQvEdAmJgy9eMEO0KkrMvtzMAmFXSMya1cY0gZF/FpKWWUhaFjAyrWK0TirKTM8oyU3MzNE
  1NDDQNTQ01TU21jU0t9RLrNJN1Est1S1PLS7RNdJLLC/WSy0u1iuuzE3OSdHLSy3ZxAgMyZRi
  xc07GCeu/Kl3iFGSg0lJlPfFQ4skIb6k/JTKjMTijPii0pzU4kOMMhwcShK8ooKWSUKCRanpq
  RVpmTnA+IBJS3DwKInw8n8AauUtLkjMLc5Mh0idYrTkuHrlyl5mjhtg8u+nv3uZhVjy8vNSpc
  R544WA5gmANGSU5sGNg8XwJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvItBruLJzCuB2/o
  K6CAmoIP0Wc1ADipJREhJNTA1Tn1cva3t1mKDl69qX39LLj229EPHUeYDKpbSL7LbtGPP8j65
  3aw/a9fWJNnoE5fbFrUWuixMyHx6rf2OpZnUTjeGfJ4fuldc9n24KejDMNX13qdfJkuP/Z/Wt
  St052+mZ2LiNr9qt3Xkdx6OmeRgsfqTyKktocce3AlM5/CssZmmYiZ350oMm9ALMUsrafOIsy
  tuGaoaPrU8umB53LPFtgyXfvRO/NXIonXwRI7ZY3NHjqunRY78cfxW5Do/8Yvaq1Lvff8/3N/
  peH7t7RUrNn242OX9b47GnJxJilp7Ozys9a5eEt7H2fLC/S7b7xlWy8MThRcFSoQ7dJ8rnKaX
  vPC64BfevWuDL58UUFt8RImlOCPRUIu5qDgRAAX6tUlcAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-565.messagelabs.com!1647907769!218384!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25985 invoked from network); 22 Mar 2022 00:09:30 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-6.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Mar 2022 00:09:30 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 22M09OE3005185
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 00:09:29 GMT
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 22 Mar 2022 00:09:25 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gvfs: upgrade 1.49.1 -> 1.50.0
Date: Tue, 22 Mar 2022 08:09:11 +0800
Message-ID: <1647907753-1930-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1647907753-1930-1-git-send-email-wangmy@fujitsu.com>
References: <1647907753-1930-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Mar 2022 00:09:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96115

Remove-incorrect-i18n.merge_file-argument.patch
removed since it's include in new version

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...e-incorrect-i18n.merge_file-argument.patch | 34 -------------------
 .../gvfs/{gvfs_1.49.1.bb => gvfs_1.50.0.bb}   |  7 ++--
 2 files changed, 2 insertions(+), 39 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gvfs/gvfs/Remove-incorrect-i18n.merge_file-argument.patch
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.49.1.bb => gvfs_1.50.0.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs/Remove-incorrect-i18n.merge_file-argument.patch b/meta-gnome/recipes-gnome/gvfs/gvfs/Remove-incorrect-i18n.merge_file-argument.patch
deleted file mode 100644
index a6e3523743..0000000000
--- a/meta-gnome/recipes-gnome/gvfs/gvfs/Remove-incorrect-i18n.merge_file-argument.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-Upstream-Status: Backport
-
-Fixes "../gvfs-1.49.1/daemon/meson.build:362:7: ERROR: Function does not take positional arguments.
-
-Signed-off-by: Markus Volk f_l_k@t-online.de
-
-From 17a067b9b823a0d54e061eae45ff8e2c7e4a88d0 Mon Sep 17 00:00:00 2001
-From: Ondrej Holy <oholy@redhat.com>
-Date: Fri, 21 Jan 2022 08:32:31 +0100
-Subject: [PATCH] build: Remove incorrect i18n.merge_file argument
-
-The positional argument was being silently ignored until meson 0.60.0 where
-it fails with "ERROR: Function does not take positional arguments".
-
-Related: https://github.com/mesonbuild/meson/issues/9441
-Fixes: https://gitlab.gnome.org/GNOME/gvfs/-/issues/599
----
- daemon/meson.build | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/daemon/meson.build b/daemon/meson.build
-index 5f9559aa..e20ada29 100644
---- a/daemon/meson.build
-+++ b/daemon/meson.build
-@@ -360,7 +360,6 @@ if enable_admin
-   policy = gvfs_namespace + '.file-operations.policy'
- 
-   i18n.merge_file(
--    policy,
-     input: configure_file(
-       input: policy + '.in.in',
-       output: '@BASENAME@',
--- 
-
diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.49.1.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.0.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/gvfs/gvfs_1.49.1.bb
rename to meta-gnome/recipes-gnome/gvfs/gvfs_1.50.0.bb
index 9df054d3b5..93f7f57617 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.49.1.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.0.bb
@@ -10,12 +10,9 @@ DEPENDS += "libsecret glib-2.0 glib-2.0-native libgudev shadow-native \
 
 RDEPENDS:${PN} += "gsettings-desktop-schemas"
 
-SRC_URI = " \
-    https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive \
-    file://Remove-incorrect-i18n.merge_file-argument.patch \
-"
+SRC_URI = "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive"
 
-SRC_URI[archive.sha256sum] = "b0d1dda4e475066207305b0776b0daefeae790f6c0107ffd2687994c8e71915a"
+SRC_URI[archive.sha256sum] = "cbc2f564d2e9f00c760673f42d6803bce3e081ab7ffb4456deffffba9339b4dd"
 
 # depends on gsettings-desktop-schemas->gcr->gtk+3-> x11
 REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.25.1


