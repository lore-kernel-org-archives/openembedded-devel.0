Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3E8DC77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 08:26:38 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web11.39424.1681115197237704257
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Apr 2023 01:26:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com header.s=170520fj header.b=kaoxOAoQ;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681115195; i=@fujitsu.com;
	bh=5SobeEczoeJFYPfx8+1Gy00pNKY1LRijjTEt0RnJX/E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=kaoxOAoQBOgaGcarS5aQ/JJUtZPjNasgq75RhZC+aqckeq2sfdkftnGxHkVerIhKA
	 EQQL1Vx0IdHRMUCTz7MkVUyG2lCcw4uU2cKpSFg6S3mRvS+LksSPByyQfqlbePV6K9
	 H7xlt26LOgvK6GQCDSUPSrGrwYwQxIYk9IcbqspN/KDzPj6V5pPrWc+3yUu40lI8Qv
	 jgqqEdPlZD9BvHDZMDD4jh3FYofcpyoV9XR7iTQ010nOCSGQKqa3Y7eE1iBZfpsdBF
	 mCH2xWF0VfNRRnvyiq0BrMEn+KYhStku+Dadi3E/75in8vefMj7G35Won0AM+Los9K
	 KoAJQUW6yZgig==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHIsWRWlGSWpSXmKPExsViZ8MxSdfqhHG
  KwfwONYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPOlBtsBf+lKvr/r2VrYJwi0cXIxSEk8IRR
  4undFewQznUmiWVz26GcPYwSfxu2MnYxcnKwCUhJ3Lj/nw3EFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLOAl8aHvBlANBweLgKpE1yUWkDCvgJPEtC0Q5RICChJTHr4HszkFnCUen1wN1ioEVPNz1g
  VWiHpBiZMzn7BAjNeUaN3+mx3Clpdo3jobao6ixOzLzSwQdoVE4/RDTBC2msTVc5uYJzAKzUI
  yahaSUbOQjFrAyLyK0aw4tagstUjX0FgvqSgzPaMkNzEzRy+xSjdRL7VUtzy1uETXUC+xvFgv
  tbhYr7gyNzknRS8vtWQTIzDYU4pZ43Ywfu/7q3eIUZKDSUmUt4vLOEWILyk/pTIjsTgjvqg0J
  7X4EKMMB4eSBO/CA0A5waLU9NSKtMwcYOTBpCU4eJREeCuOAaV5iwsSc4sz0yFSpxgVpcR5e0
  ESAiCJjNI8uDZYtF9ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMy77TDQFJ7MvBK46a+AFjM
  BLeZyMQBZXJKIkJJqYEqd/KxHa96NCF1x0aeX5+zby61p+aPBdvnze9EVqduLxF+UzFQ4w/os
  XmWp0NyrcxkuCLxN7JhzKipN5O7nDcna+e+4b+3MltK2frahUPP0ca0F+ysyG5K/PPU52tOSc
  n/T9SrutnfyooE2H17Mj8xKLvTLu9cl6GgZ+5qp0LXrc5j1yluZm+qOWDBtu3NBsHTFusnePF
  aiL7uebP4oe/r8TYHZlhOyZuTNaE6ZyuD2XiFRbP6ahGNTb+y6OaWtICm5+2H+0gu80wKuC67
  ofbBB8kLQpPtt+e1TwuNi3Hd637kwqf27pU104UU5ORORvWxCE29Nmn//3PSZeU8W33AqaZmx
  etp9R4/Tr5Mj5ESVWIozEg21mIuKEwE03a8DcQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-591.messagelabs.com!1681115194!376636!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31050 invoked from network); 10 Apr 2023 08:26:34 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-2.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 08:26:34 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 3E17A100323
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 09:26:34 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 31AB51000D7
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 09:26:34 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 09:26:32 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] grilo-plugins: upgrade 0.3.15 -> 0.3.16
Date: Mon, 10 Apr 2023 16:26:03 +0800
Message-ID: <1681115165-24320-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681115165-24320-1-git-send-email-wangmy@fujitsu.com>
References: <1681115165-24320-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 08:26:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102007

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Avoid-running-trackertestutils.patch
updated for 0.3.16

Changelog:
=3D=3D=3D=3D=3D=3D=3D=3D=3D
  * 132 tracker3: update fts query
  * 133 dmap: enable with libsoup3 supported libdmapsharing-4.0
  * 131 lua-factory: add support to 5.4
  * 128 129 135 build: libsoup3 related fixes
  * 127 flickr: remove GOA support
  * 126 tmdb: without config, fix single request

  * Updated translations
    * Turkish

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-Avoid-running-trackertestutils.patch      | 14 ++++++--------
 ...o-plugins_0.3.15.bb =3D> grilo-plugins_0.3.16.bb} |  2 +-
 2 files changed, 7 insertions(+), 9 deletions(-)
 rename meta-gnome/recipes-gnome/grilo/{grilo-plugins_0.3.15.bb =3D> grilo-plugins_0.3.16.bb} (83%)

diff --git a/meta-gnome/recipes-gnome/grilo/grilo-plugins/0001-Avoid-running-trackertestutils.patch b/meta-gnome/recipes-gnome/grilo/grilo-plugins/0001-Avoid-running-trackertestutils.patch
index a07cd49fd..6e565e60d 100644
--- a/meta-gnome/recipes-gnome/grilo/grilo-plugins/0001-Avoid-running-trackertestutils.patch
+++ b/meta-gnome/recipes-gnome/grilo/grilo-plugins/0001-Avoid-running-trackertestutils.patch
@@ -1,4 +1,4 @@
-From 9deaed70221a12e26f968be26233b75fa5669476 Mon Sep 17 00:00:00 2001
+From a76c5c40f95b2961bed8f6427080f0fcf6ec00d6 Mon Sep 17 00:00:00 2001
 From: =3D=3FUTF-8=3Fq=3FAndreas=3D20M=3DC3=3DBCller=3F=3D <schnitzeltony@gmail.com>
 Date: Sat, 15 May 2021 23:25:09 +0200
 Subject: [PATCH] Avoid running trackertestutils
@@ -12,23 +12,21 @@ It breaks configuration:
 Upstream-Status: Inappropriate [OE-Specific]
 
 Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
+
 ---
  meson.build | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 6a03778..17ef1e1 100644
+index fca5f98..3c1aa06 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -78,7 +78,7 @@ totem_plparser_dep =3D dependency('totem-plparser', version: '>=3D 3.4.1', required:
+@@ -98,7 +98,7 @@ totem_plparser_dep =3D dependency('totem-plparser', version: '>=3D 3.4.1', required:
  totem_plparser_mini_dep =3D dependency('totem-plparser-mini', version: '>=3D 3.4.1', required: false)
  tracker_sparql_dep =3D dependency('tracker-sparql-2.0', version: '>=3D 2.3.0', required: false)
  tracker3_dep =3D dependency('tracker-sparql-3.0', required: false)
 -tracker3_testutils_dep =3D dependency('tracker-testutils-3.0', required: false)
 +tracker3_testutils_dep =3D dependency('tracker-testutils-3.0-avoid-find', required: false)
  
- lua_dep =3D dependency('lua', version: '>=3D 5.3.0', required: false)
- if not lua_dep.found()
--- 
-2.31.1
-
+ lua_pkg =3D [
+   'lua',
diff --git a/meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.15.bb b/meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.16.bb
similarity index 83%
rename from meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.15.bb
rename to meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.16.bb
index b96194dec..00474ce44 100644
--- a/meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.15.bb
+++ b/meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.16.bb
@@ -17,6 +17,6 @@ GNOMEBASEBUILDCLASS =3D "meson"
 inherit gnomebase gnome-help vala
 
 SRC_URI +=3D "file://0001-Avoid-running-trackertestutils.patch"
-SRC_URI[archive.sha256sum] =3D "8518c3d954f93095d955624a044ce16a7345532f811d299dbfa1e114cfebab33"
+SRC_URI[archive.sha256sum] =3D "fe6f4dbe586c6b8ba2406394e202f22d009d642a96eb3a54f32f6a21d084cdcb"
 
 FILES:${PN} +=3D "${libdir}/grilo-0.3"
-- 
2.34.1


