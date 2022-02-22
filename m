Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F03F8C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 02:50:52 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.8208.1645498252259203211
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 18:50:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2F48D40C52
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 02:50:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SDyGpMT5KdPx
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Feb 2022 02:50:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1A6D540951
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 02:50:51 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id C747A174765;
	Mon, 21 Feb 2022 21:50:50 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH 1/4] layer.conf: update compatibility from honister to
 kirkstone
Date: Tue, 22 Feb 2022 02:50:45 +0000
Message-Id: <20220222025048.2826709-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Feb 2022 02:50:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95434

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 meta-filesystems/conf/layer.conf | 2 +-
 meta-gnome/conf/layer.conf       | 2 +-
 meta-networking/conf/layer.conf  | 2 +-
 meta-oe/conf/layer.conf          | 2 +-
 meta-python/conf/layer.conf      | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-filesystems/conf/layer.conf b/meta-filesystems/conf/lay=
er.conf
index 6a9357d2a..b5f59d9ba 100644
--- a/meta-filesystems/conf/layer.conf
+++ b/meta-filesystems/conf/layer.conf
@@ -15,4 +15,4 @@ LAYERVERSION_filesystems-layer =3D "1"
=20
 LAYERDEPENDS_filesystems-layer =3D "core openembedded-layer"
=20
-LAYERSERIES_COMPAT_filesystems-layer =3D "honister"
+LAYERSERIES_COMPAT_filesystems-layer =3D "kirkstone"
diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
index d2ee3e069..3f6b4f7b7 100644
--- a/meta-gnome/conf/layer.conf
+++ b/meta-gnome/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERVERSION_gnome-layer =3D "1"
=20
 LAYERDEPENDS_gnome-layer =3D "core openembedded-layer networking-layer"
=20
-LAYERSERIES_COMPAT_gnome-layer =3D "honister"
+LAYERSERIES_COMPAT_gnome-layer =3D "kirkstone"
=20
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS +=3D "\
   faenza-icon-theme->gdk-pixbuf \
diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer=
.conf
index 67fcda3d9..3f9699ad1 100644
--- a/meta-networking/conf/layer.conf
+++ b/meta-networking/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERDEPENDS_networking-layer =3D "core"
 LAYERDEPENDS_networking-layer +=3D "openembedded-layer"
 LAYERDEPENDS_networking-layer +=3D "meta-python"
=20
-LAYERSERIES_COMPAT_networking-layer =3D "honister"
+LAYERSERIES_COMPAT_networking-layer =3D "kirkstone"
=20
 LICENSE_PATH +=3D "${LAYERDIR}/licenses"
=20
diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index d25db911c..93f3dc580 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -42,7 +42,7 @@ LAYERVERSION_openembedded-layer =3D "1"
=20
 LAYERDEPENDS_openembedded-layer =3D "core"
=20
-LAYERSERIES_COMPAT_openembedded-layer =3D "honister"
+LAYERSERIES_COMPAT_openembedded-layer =3D "kirkstone"
=20
 LICENSE_PATH +=3D "${LAYERDIR}/licenses"
=20
diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
index ffad953f9..98f734152 100644
--- a/meta-python/conf/layer.conf
+++ b/meta-python/conf/layer.conf
@@ -14,6 +14,6 @@ LAYERVERSION_meta-python =3D "1"
=20
 LAYERDEPENDS_meta-python =3D "core (>=3D 12) openembedded-layer"
=20
-LAYERSERIES_COMPAT_meta-python =3D "honister"
+LAYERSERIES_COMPAT_meta-python =3D "kirkstone"
=20
 LICENSE_PATH +=3D "${LAYERDIR}/licenses"
--=20
2.25.1


