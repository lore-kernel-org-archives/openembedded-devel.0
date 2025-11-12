Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 122C8CD484A
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 21:02:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8264.1762981371425087081
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 13:02:51 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5365115A1
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 13:02:43 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9E1B13F66E
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 13:02:50 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/2] gnome-flashback: fix build with new ibus
Date: Wed, 12 Nov 2025 21:02:45 +0000
Message-ID: <20251112210245.1851637-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251112210245.1851637-1-ross.burton@arm.com>
References: <20251112210245.1851637-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 21:02:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121584

Backport a patch to fix the build:

  libinput-sources/gf-candidate-popup.c:124:11: error:
  too many arguments to function 'ibus_attribute_get_type';
  expected 0, have 1

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../gnome-flashback/files/ibus.patch          | 27 +++++++++++++++++++
 .../gnome-flashback/gnome-flashback_3.46.0.bb |  2 ++
 2 files changed, 29 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-flashback/files/ibus.p=
atch

diff --git a/meta-gnome/recipes-gnome/gnome-flashback/files/ibus.patch b/=
meta-gnome/recipes-gnome/gnome-flashback/files/ibus.patch
new file mode 100644
index 0000000000..cd7f052ea5
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-flashback/files/ibus.patch
@@ -0,0 +1,27 @@
+From 1bb758374500e247ffab150205d05b72bf21b561 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Alberts=3D20Muktup=3DC4=3D81vels?=3D <alberts.muktupav=
els@gmail.com>
+Date: Thu, 23 Jan 2025 14:22:33 +0200
+Subject: [PATCH] input-sources: use correct function to get attribute ty=
pe
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ gnome-flashback/libinput-sources/gf-candidate-popup.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gnome-flashback/libinput-sources/gf-candidate-popup.c b/gno=
me-flashback/libinput-sources/gf-candidate-popup.c
+index a8bf5825..2c31e71a 100644
+--- a/gnome-flashback/libinput-sources/gf-candidate-popup.c
++++ b/gnome-flashback/libinput-sources/gf-candidate-popup.c
+@@ -121,7 +121,7 @@ update_preedit_text_cb (IBusPanelService *service,
+       guint start;
+       guint end;
+=20
+-      if (ibus_attribute_get_type (attribute) !=3D IBUS_ATTR_TYPE_BACKG=
ROUND)
++      if (ibus_attribute_get_attr_type (attribute) !=3D IBUS_ATTR_TYPE_=
BACKGROUND)
+         continue;
+=20
+       start =3D ibus_attribute_get_start_index (attribute);
+--=20
+GitLab
+
diff --git a/meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.4=
6.0.bb b/meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.46.0.=
bb
index cf1122714f..f297394d00 100644
--- a/meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.46.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.46.0.bb
@@ -19,6 +19,8 @@ DEPENDS +=3D " \
     gnome-panel \
 "
=20
+SRC_URI +=3D "file://ibus.patch"
+
 SRC_URI[archive.sha256sum] =3D "7a8d5c03310e4dfadd18a65e00a37741032afeea=
5418dd6804a975c4b0980045"
=20
 do_install:append() {
--=20
2.43.0


