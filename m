Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8987C77B61
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 03:05:56 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.26491.1679886354467807938
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Mar 2023 20:05:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=XiIm4MUa;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679886352; i=@fujitsu.com;
	bh=h2RG9ehB7HWoCOg/C/ChTn7isu1PmRKxWNcUbpITebA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=XiIm4MUaMnUIPVv2f2opLve1UJBxLsSb4XS5Fex6eKO9RSu09tOWm97hFrl65MbV8
	 hw0kGkiM2IfRRk2+JTEIDTb6rMiE7dcfo51yYpwuc8LPhKGH3d15shQDgYNlZQjvRP
	 2Mk5nW64iy+4QxwstKFswPv7cy3DRAd/9HV/chBqIp8P+YFPFtuDSO2DvkdLg21WVG
	 hggSQrZOy/QhJGBhPzn/XHdZFuxBOXmaTLa7luTWxKRZiB5O5IevIvc3xgtFBEXIoC
	 C/OaDee248XJsDAxpBw4wyks7pcTr3dxOeozoKjA+ZHU/FbWSrbG8o9kulpMhXiXpo
	 BIzYq8XH2e1qg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8MxSZePQzH
  F4NhVeYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP6/tCCzXIVtxcvY2lgvCndxcjFISTwhFFi
  f/cNNgjnOpPE18MNjBDOHkaJZ/e+sncxcnKwCUhJ3Lj/nw3EFhHQl1g6ew8ziM0soCLx4ncPW
  I2wQJDE/7e3wGpYBFQl1i+9xApi8wo4Scx7dosRxJYQUJCY8vA9WC+ngLPE5w9PwWwhoJprO1
  ewQ9QLSpyc+YQFYr6ExMEXL5ghehUlZl9uZoGwKyQapx9igrDVJK6e28Q8gVFwFpL2WUjaFzA
  yrWI0K04tKkst0jXTSyrKTM8oyU3MzNFLrNJN1Est1c3LLyrJ0DXUSywv1kstLtYrrsxNzknR
  y0st2cQIDN6U4oTHOxjn9f3VO8QoycGkJMob7SafIsSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mC1
  4VNMUVIsCg1PbUiLTMHGEkwaQkOHiUR3jW/FFKEeIsLEnOLM9MhUqcYdTk27es6wCzEkpefly
  olzvsJZIYASFFGaR7cCFhUX2KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzNsKMoUnM68EbtM
  roCOYgI74VgB2REkiQkqqgSmwdHog04tXVwr4l5wNYLP73LOOvc1eeKNo9PUIT4GY9pz/D7MM
  fhQubzdy2Z9/vk3xsEDPq62T65/u3diZ2DepJXlpsO67i4cXX+tgO5F8SOdIWK1P+98v5qERj
  yqZ05Y1Vh1UmxpgZRFTLP+6TzTs+JFlQRXWgevWd61h7XX4KqM+gS1hyrqnXw93ZSXWNn/8qr
  ov/FxCp8nbjvrDKeWS2xiblv0189hUovb5rt7SX1/euPjPNV60eXnLxPLcJ1+U6hawml1Xq5x
  Uu676pdnf4/NKIgsv75t+87TjJBlVxizTzcKOnxd6pxn7Gq7mKVYLUF66X2enbARLxZTXb+4n
  rZG+3F542XLB5JkREUosxRmJhlrMRcWJAL7TOUFlAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-732.messagelabs.com!1679886350!447215!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2975 invoked from network); 27 Mar 2023 03:05:50 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-9.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Mar 2023 03:05:50 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id E38F21000D5
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 04:05:49 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id D6CA11000EE
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 04:05:49 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 27 Mar 2023 04:05:48 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gnome-online-accounts: upgrade 3.46.0 -> 3.48.0
Date: Mon, 27 Mar 2023 11:05:22 +0800
Message-ID: <1679886322-20954-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1679886322-20954-1-git-send-email-wangmy@fujitsu.com>
References: <1679886322-20954-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 03:05:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101763

From: Wang Mingyu <wangmy@fujitsu.com>

0001-build-Use-the-appropriate-dependency-object.patch
removed since it's included in 3.48.0.

Changelog:
==========
* Build fixes [#226]
* Expired Kerberos tickets not re-acquired on resume from suspend [#160]
* Update CalDAV/CardDAV OwnCloud endpoints [#67]
* Attempt to cope with multiple credential caches per identity [#79]
* Error in solving Nextcloud account address [#243]
* Translation updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...se-the-appropriate-dependency-object.patch | 35 -------------------
 ...6.0.bb => gnome-online-accounts_3.48.0.bb} |  3 +-
 2 files changed, 1 insertion(+), 37 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts/0001-build-Use-the-appropriate-dependency-object.patch
 rename meta-gnome/recipes-gnome/gnome-online-accounts/{gnome-online-accounts_3.46.0.bb => gnome-online-accounts_3.48.0.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts/0001-build-Use-the-appropriate-dependency-object.patch b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts/0001-build-Use-the-appropriate-dependency-object.patch
deleted file mode 100644
index 838ca1a7d..000000000
--- a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts/0001-build-Use-the-appropriate-dependency-object.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 06240574626eb21af37cf7dde5bf81e892dff467 Mon Sep 17 00:00:00 2001
-From: Emmanuele Bassi <ebassi@gnome.org>
-Date: Wed, 5 Oct 2022 22:15:37 +0100
-Subject: [PATCH] build: Use the appropriate dependency object
-
-Just using `link_with` will not ensure that the GOA web extension shared
-module is properly built against libgoa-backend and libgoa; the
-generated headers must be transitively available by the time we build
-the shared module.
-
-Fixes: #226
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gnome-online-accounts/-/commit/fe86bfb0271735c8130367c46536b08dad5c20d8]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/goabackend/meson.build | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/src/goabackend/meson.build b/src/goabackend/meson.build
-index f5382b3..865b2d2 100644
---- a/src/goabackend/meson.build
-+++ b/src/goabackend/meson.build
-@@ -157,9 +157,8 @@ libgoa_web_extension = shared_module(
-   'goawebextension',
-   libgoawebextension_sources,
-   include_directories: common_incs + [goa_inc],
--  dependencies: deps,
-+  dependencies: [deps, libgoa_backend_dep],
-   c_args: cflags,
--  link_with: libgoa_backend,
-   install: true,
-   install_dir: join_paths(goa_pkglibdir, 'web-extensions')
- )
--- 
-2.39.0
-
diff --git a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.46.0.bb b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.48.0.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.46.0.bb
rename to meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.48.0.bb
index ce02a507d..e059500ab 100644
--- a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.46.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.48.0.bb
@@ -8,8 +8,7 @@ inherit gnomebase gsettings gobject-introspection gtk-icon-cache vala features_c
 
 DEPENDS = "gtk+3 gtk+3-native gdk-pixbuf dbus json-glib libxml2 webkitgtk glib-2.0 rest libsecret"
 
-SRC_URI += "file://0001-build-Use-the-appropriate-dependency-object.patch"
-SRC_URI[archive.sha256sum] = "5e7859ce4858a6b99d3995ed70527d66e297bb90bbf75ec8780fe9da22c1fcaa"
+SRC_URI[archive.sha256sum] = "418bb9fcffdbd72a98205ad365137617fc1e3551a54de74f6a98d45d266175bf"
 
 PACKAGECONFIG_SOUP ?= "soup3"
 PACKAGECONFIG ?= "kerberos owncloud lastfm google windows_live ${PACKAGECONFIG_SOUP}"
-- 
2.34.1


